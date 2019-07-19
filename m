Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 059BD6E6EC
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 15:55:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoTKb-0005Jv-By; Fri, 19 Jul 2019 13:53:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yD5D=VQ=xenbits.xen.org=andrewcoop@srs-us1.protection.inumbo.net>)
 id 1hoTKY-0005J9-V2
 for xen-devel@lists.xen.org; Fri, 19 Jul 2019 13:53:50 +0000
X-Inumbo-ID: 9e31fec4-aa2c-11e9-93d4-8be24e24b3d7
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e31fec4-aa2c-11e9-93d4-8be24e24b3d7;
 Fri, 19 Jul 2019 13:53:42 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1hoTKI-0002Jo-Qs; Fri, 19 Jul 2019 13:53:34 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.89)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1hoTKI-0000dF-Ng; Fri, 19 Jul 2019 13:53:34 +0000
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.508 (Entity 5.508)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
Message-Id: <E1hoTKI-0000dF-Ng@xenbits.xenproject.org>
Date: Fri, 19 Jul 2019 13:53:34 +0000
Subject: [Xen-devel] Xen Security Advisory 300 v2 - Linux: No grant table
 and foreign mapping limits
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Xen.org security team" <security-team-members@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

                    Xen Security Advisory XSA-300
                              version 2

             Linux: No grant table and foreign mapping limits

UPDATES IN VERSION 2
====================

Drop inapplicable "Deployment during embargo" section.

Rewrite for clarity, and to remove most references to dom0.  The issue
is equally applicable to domU's providing backend services.

Add information about the arbitrary limit for userspace backends.

ISSUE DESCRIPTION
=================

Virtual device backends and device models running in domain 0, or
other backend driver domains, need to be able to map guest memory
(either via grant mappings, or via the foreign mapping interface).

Inside Xen, mapped grants are tracked by the maptrack structure.  The
size of this structure is chosen during domain creation, and has a
fixed upper bound for the lifetime of the domain.

For Linux to keep track of these mappings, it needs to have a page
structure for each one.  In practice the number of page structures is
usually limited.  In PV guests, a range of pfns are typically set
aside at boot ("pre-ballooned") for this purpose.  For HVM/PVH and Arm
guests, no memory is set aside to begin with.  In either case, when
more of this "foreign / grant map pfn space" is needed, Linux will
balloon out extra pages to use for this purpose.

Unfortunately, in Linux, there are no limits, either on the total
amount of memory which the domain will attempt to balloon out, nor on
the amount of "foreign / grant map" memory which any individual guest
can consume.

For Linux userspace backends (e.g. QEMU) which use /dev/xen/gnttab or
/proc/xen/gnttab, there is an arbitrary mapping limit which, if hit,
will prevent further mappings from being established.

As a result, a malicious guest may be able to, with crafted requests,
cause a backend Linux domain to either:

 1) Fill the maptrack table in Xen and/or hit the userspace limit.
    This will starve I/O from other guests served by the same backend.

 2) Balloon out sufficient RAM to cause it to swap excessively, or run
    completely out of memory.  This may starve all operations from the
    domain, including I/O from other guests, or may cause a crash of
    the domain.

IMPACT
======

Guest may be able to crash backend Linux domains, or starve operations
inside the domain, including the processing of guest I/O requests
(Guest Denial-of-Service).

If the backend is domain 0, which is the most common configuration,
then host-wide operations may be starved, or the host may crash (Host
Denial-of-Service).

VULNERABLE SYSTEMS
==================

All versions of Linux are vulnerable.  Only Linux guests acting as
backend domains for other guests may be exploited.

All Arm domains are vulnerable, as are x86 PVH/HVM guests.  The
vulnerability of x86 PV guests depends on how they were configured at
boot.

MITIGATION
==========

PV guests can be constructed with "pre-ballooned" memory, by building
it with maxmem > memory.  See `man 5 xl.cfg` for full details of these
two parameters.

For PV dom0, these are controlled by Xen's "dom0_mem=$X,max:$Y"
command line parameter.

The larger the difference between memory and maxmem, the more space
Linux has to fill with grant/foreign mappings before it will start
ballooning out real memory to satisfy further mapping requests.  This
makes the attack more difficult to accomplish.

CREDITS
=======

This issue was discovered by Julien Grall of ARM.

RESOLUTION
==========

Applying the appropriate attached patch resolves the backend memory
exhaustion issue.

NOTE: This does NOT fix the guest starvation issue.  Fixing fixing
this issue is more complex, and it was determined that it was better
to work on a robust fix for the issue in public.  This advisory will
be updated when fixes are available.

xsa300-linux-5.2.patch     Linux 4.4 ... 5.2

$ sha256sum xsa300*
9c8a9aec52b147f8e8ef41444e1dd11803bacf3bd4d0f6efa863b16f7a9621ac  xsa300-linux-5.2.patch
$

NOTE ON LACK OF EMBARGO
=======================

The lack of predisclosure is due to a short schedule set by the
discoverer, and efforts to resolve the advisory wording.
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAl0xyy0MHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZyzUH/3hhOLPLuiTnKQd3idx0iIrpRkQfcdl9pxWWARWx
xiVKyyMIajokrq5besT01Ztizz6B80DN+m4W14yi+j8nDyR3W4v/JriZQY48Tj1i
nd+jvBGfvQcjNc5WaVjBtU/x9j0HDCUrBP+uJMGdt9jl6fppvMwnBcv/OeEvl/eE
TjwEMs/RQ69LcjpwGGPSAh8AR2i1+oL3LiHtwO31hdkw0Ritqa32Uw4c+ENuo/OE
PApIX8O8TMgRX0/LriGy6dtlb/L4SljTPa592EHH1cPfDelHmzpWEeIx77nbq8v/
/Ex6Gjd/19ArWvofxQkQk1+aNfvBPnPCaboc7JrlCuFEDP4=
=OcOD
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa300-linux-5.2.patch"
Content-Disposition: attachment; filename="xsa300-linux-5.2.patch"
Content-Transfer-Encoding: base64

RnJvbSBlYTQ5NDUwZGVkNTc1ZmFjYzBlNjRlMGQ2YWRjYjFjYThhYWFkMGJh
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+CkRhdGU6IFdlZCwgMTkgSnVuIDIwMTkgMTE6
MDA6NTYgKzAyMDAKU3ViamVjdDogW1BBVENIXSB4ZW46IGxldCBhbGxvY194
ZW5iYWxsb29uZWRfcGFnZXMoKSBmYWlsIGlmIG5vdCBlbm91Z2ggbWVtb3J5
CiBmcmVlCgpJbnN0ZWFkIG9mIHRyeWluZyB0byBhbGxvY2F0ZSBwYWdlcyB3
aXRoIEdGUF9VU0VSIGluCmFkZF9iYWxsb29uZWRfcGFnZXMoKSBjaGVjayB0
aGUgYXZhaWxhYmxlIGZyZWUgbWVtb3J5IHZpYQpzaV9tZW1fYXZhaWxhYmxl
KCkuIEdGUF9VU0VSIGlzIGZhciBsZXNzIGxpbWl0aW5nIG1lbW9yeSBleGhh
dXN0aW9uCnRoYW4gdGhlIHRlc3QgdmlhIHNpX21lbV9hdmFpbGFibGUoKS4K
ClRoaXMgd2lsbCBhdm9pZCBkb20wIHJ1bm5pbmcgb3V0IG9mIG1lbW9yeSBk
dWUgdG8gZXhjZXNzaXZlIGZvcmVpZ24KcGFnZSBtYXBwaW5ncyBlc3BlY2lh
bGx5IG9uIEFSTSBhbmQgb24geDg2IGluIFBWSCBtb2RlLCBhcyB0aG9zZSBk
b24ndApoYXZlIGEgcHJlLWJhbGxvb25lZCBhcmVhIHdoaWNoIGNhbiBiZSB1
c2VkIGZvciBmb3JlaWduIG1hcHBpbmdzLgoKQXMgdGhlIG5vcm1hbCBiYWxs
b29uaW5nIHN1ZmZlcnMgZnJvbSB0aGUgc2FtZSBwcm9ibGVtIGRvbid0IGJh
bGxvb24KZG93biBtb3JlIHRoYW4gc2lfbWVtX2F2YWlsYWJsZSgpIHBhZ2Vz
IGluIG9uZSBpdGVyYXRpb24uIEF0IHRoZSBzYW1lCnRpbWUgbGltaXQgdGhl
IGRlZmF1bHQgbWF4aW11bSBudW1iZXIgb2YgcmV0cmllcy4KClJlcG9ydGVk
LWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0t
LQogZHJpdmVycy94ZW4vYmFsbG9vbi5jIHwgMTYgKysrKysrKysrKysrKy0t
LQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vYmFsbG9vbi5jIGIv
ZHJpdmVycy94ZW4vYmFsbG9vbi5jCmluZGV4IGQzN2RkNWJiN2E4Zi4uNTU5
NzY4ZGMyNTY3IDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi9iYWxsb29uLmMK
KysrIGIvZHJpdmVycy94ZW4vYmFsbG9vbi5jCkBAIC01MzgsOCArNTM4LDE1
IEBAIHN0YXRpYyB2b2lkIGJhbGxvb25fcHJvY2VzcyhzdHJ1Y3Qgd29ya19z
dHJ1Y3QgKndvcmspCiAJCQkJc3RhdGUgPSByZXNlcnZlX2FkZGl0aW9uYWxf
bWVtb3J5KCk7CiAJCX0KIAotCQlpZiAoY3JlZGl0IDwgMCkKLQkJCXN0YXRl
ID0gZGVjcmVhc2VfcmVzZXJ2YXRpb24oLWNyZWRpdCwgR0ZQX0JBTExPT04p
OworCQlpZiAoY3JlZGl0IDwgMCkgeworCQkJbG9uZyBuX3BhZ2VzOworCisJ
CQluX3BhZ2VzID0gbWluKC1jcmVkaXQsIHNpX21lbV9hdmFpbGFibGUoKSk7
CisJCQlzdGF0ZSA9IGRlY3JlYXNlX3Jlc2VydmF0aW9uKG5fcGFnZXMsIEdG
UF9CQUxMT09OKTsKKwkJCWlmIChzdGF0ZSA9PSBCUF9ET05FICYmIG5fcGFn
ZXMgIT0gLWNyZWRpdCAmJgorCQkJICAgIG5fcGFnZXMgPCB0b3RhbHJlc2Vy
dmVfcGFnZXMpCisJCQkJc3RhdGUgPSBCUF9FQUdBSU47CisJCX0KIAogCQlz
dGF0ZSA9IHVwZGF0ZV9zY2hlZHVsZShzdGF0ZSk7CiAKQEAgLTU3OCw2ICs1
ODUsOSBAQCBzdGF0aWMgaW50IGFkZF9iYWxsb29uZWRfcGFnZXMoaW50IG5y
X3BhZ2VzKQogCQl9CiAJfQogCisJaWYgKHNpX21lbV9hdmFpbGFibGUoKSA8
IG5yX3BhZ2VzKQorCQlyZXR1cm4gLUVOT01FTTsKKwogCXN0ID0gZGVjcmVh
c2VfcmVzZXJ2YXRpb24obnJfcGFnZXMsIEdGUF9VU0VSKTsKIAlpZiAoc3Qg
IT0gQlBfRE9ORSkKIAkJcmV0dXJuIC1FTk9NRU07CkBAIC03MTAsNyArNzIw
LDcgQEAgc3RhdGljIGludCBfX2luaXQgYmFsbG9vbl9pbml0KHZvaWQpCiAJ
YmFsbG9vbl9zdGF0cy5zY2hlZHVsZV9kZWxheSA9IDE7CiAJYmFsbG9vbl9z
dGF0cy5tYXhfc2NoZWR1bGVfZGVsYXkgPSAzMjsKIAliYWxsb29uX3N0YXRz
LnJldHJ5X2NvdW50ID0gMTsKLQliYWxsb29uX3N0YXRzLm1heF9yZXRyeV9j
b3VudCA9IFJFVFJZX1VOTElNSVRFRDsKKwliYWxsb29uX3N0YXRzLm1heF9y
ZXRyeV9jb3VudCA9IDQ7CiAKICNpZmRlZiBDT05GSUdfWEVOX0JBTExPT05f
TUVNT1JZX0hPVFBMVUcKIAlzZXRfb25saW5lX3BhZ2VfY2FsbGJhY2soJnhl
bl9vbmxpbmVfcGFnZSk7Ci0tIAoyLjE2LjQKCg==

--=separator
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--=separator--

