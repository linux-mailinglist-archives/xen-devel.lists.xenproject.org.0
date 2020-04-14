Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB0C1A7A36
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 14:01:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOKFS-0007b8-KJ; Tue, 14 Apr 2020 12:01:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/bN9=56=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1jOKFR-0007ar-Hi
 for xen-devel@lists.xen.org; Tue, 14 Apr 2020 12:01:01 +0000
X-Inumbo-ID: 95863b10-7e47-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 95863b10-7e47-11ea-b58d-bc764e2007e4;
 Tue, 14 Apr 2020 12:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aP7zEw2Ja7XpkzWCUNUnIBbF7IgwD7OB+rzvUn2jWBU=; b=qsp/VEYxnTsGFRHxVlj58CHIjK
 831NIp1mUCgk53mugrrrBlPGA3AJywAcUDAfJec6GpgH17FQZFRewInEu17Viahhr9yaRnNRKMII5
 sWdlKg8SrItxIXZELcV7YxOv1nh81rpiM3MOQGHSfAG8XAH101M6x/plArRHzinLf4jg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1jOKFB-0000YM-5B; Tue, 14 Apr 2020 12:00:45 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.89)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1jOKFB-00073X-32; Tue, 14 Apr 2020 12:00:45 +0000
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.508 (Entity 5.508)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
Subject: Xen Security Advisory 314 v3 (CVE-2020-11739) - Missing memory
 barriers in read-write unlock paths
Message-Id: <E1jOKFB-00073X-32@xenbits.xenproject.org>
Date: Tue, 14 Apr 2020 12:00:45 +0000
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

            Xen Security Advisory CVE-2020-11739 / XSA-314
                               version 3

          Missing memory barriers in read-write unlock paths

UPDATES IN VERSION 3
====================

Public release.

ISSUE DESCRIPTION
=================

The read-write unlock paths don't contain a memory barrier.  On Arm, this
means a processor is allowed to re-order the memory access with the
preceding ones.

In other words, the unlock may be seen by another processor before all the
memory accesses within the "critical" section.

As a consequence, it may be possible to have a writer executing a critical
section at the same time as readers or another writer. In other words,
many of the assumptions (e.g a variable cannot be modified after a check)
in the critical sections are not safe anymore.

The read-write locks are used in hypercalls (such as grant-table ones), so
a malicious guest could exploit the race.  For instance, there is a small
window where Xen can leak memory if XENMAPSPACE_grant_table is used
concurrently.

IMPACT
======

A malicous guest may be able to leak memory, or cause a hypervisor crash
resulting in a Denial of Service (DoS). Information leak and privilege
escalation cannot be excluded.

VULNERABLE SYSTEMS
==================

Systems running all versions of Xen are affected.

Whether an individual Arm-based CPU is vulnerable depends on its memory
re-ordering properties.  Consult your CPU vendor.

x86 systems are not vulnerable.

MITIGATION
==========

There is no known mitigation.

CREDITS
=======

This issue was discovered by Julien Grall of Amazon.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa314.patch           xen-unstable
xsa314-4.13.patch      Xen 4.13 - Xen 4.9

$ sha256sum xsa314*
ff6e03780766d0358699ed0c5b0154be9ccbbc80796650f7568c295c5451ba0a  xsa314.meta
7c507e7b46568e94aa9595a549bd3020b16d1eca97b8bfc3bb1f5d96eb338cc1  xsa314.patch
a13e6a9cd531859882d1b0ef38245441d363d1ead1fa2a5ae5da7a0fce27e072  xsa314-4.13.patch
$

DEPLOYMENT DURING EMBARGO
=========================

Deployment of the patches and/or mitigations described above (or
others which are substantially similar) is permitted during the
embargo, even on public-facing systems with untrusted guest users and
administrators.

But: Distribution of updated software is prohibited (except to other
members of the predisclosure list).

Predisclosure list members who wish to deploy significantly different
patches and/or mitigations, please contact the Xen Project Security
Team.

(Note: this during-embargo deployment notice is retained in
post-embargo publicly released Xen Project advisories, even though it
is then no longer applicable.  This is to enable the community to have
oversight of the Xen Project Security Team's decisionmaking.)

For more information about permissible uses of embargoed information,
consult the Xen Project community's agreed Security Policy:
  http://www.xenproject.org/security-policy.html
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAl6VpdcMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZNSoH/2TB+nP1KWB0LUkP5yD1tlSC6Q58k3ReUw7uVfLh
OOBhyOZz5jQOO9r6HDQtqxZBtihbmCDD9Ckl3V4au81TFxz8My24nMR+X1dqDcPi
0MQ2+Tu3z6S/NMw9DwLsN9b0MtHlmalOBrhbhif3/U0QDgLFhN2H8GtvFQ1imWmm
JHoTdBHDUwxCvThIHZCui/T69U/csdfyV6f/HgMVTzpNIOBkiwUuOVuMEO25KqVk
tO0z0CyK19K86VJu7k4q16RzCllUoe5bSU+7UVYOS1PxZ5XCvKTCYcZDz1HZMW/8
FOA8yNMzHV3b+0WvCnMpq9qHmmJXGx+vRSoeBF7YeU0wUkE=
=oA9H
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa314.meta"
Content-Disposition: attachment; filename="xsa314.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAzMTQsCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xMyIsCiAgICAiNC4xMiIsCiAgICAiNC4xMSIs
CiAgICAiNC4xMCIsCiAgICAiNC45IgogIF0sCiAgIlRyZWVzIjogWwogICAg
InhlbiIKICBdLAogICJSZWNpcGVzIjogewogICAgIjQuMTAiOiB7CiAgICAg
ICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAgICAgICAiU3Rh
YmxlUmVmIjogIjQ5YTVkNmU5MjMxN2E3ZDlhY2JmMGJkYmQyNWIyODA5ZGZk
ODQyNjAiLAogICAgICAgICAgIlByZXJlcXMiOiBbXSwKICAgICAgICAgICJQ
YXRjaGVzIjogWwogICAgICAgICAgICAieHNhMzE0LTQuMTMucGF0Y2giCiAg
ICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9LAogICAgIjQuMTEi
OiB7CiAgICAgICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAg
ICAgICAiU3RhYmxlUmVmIjogImRkZmZjNGQ4YTA3MmYxNDYzMjBmNGNhNThj
NzY4YzRiNTYzYWI1NzEiLAogICAgICAgICAgIlByZXJlcXMiOiBbXSwKICAg
ICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAieHNhMzE0LTQuMTMu
cGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9LAog
ICAgIjQuMTIiOiB7CiAgICAgICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4i
OiB7CiAgICAgICAgICAiU3RhYmxlUmVmIjogImE1ZmNhZmJmYmVlNTUyNjE4
NTNmYmEwNzE0OWMxYzc5NWYyYmFmNTgiLAogICAgICAgICAgIlByZXJlcXMi
OiBbXSwKICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAieHNh
MzE0LTQuMTMucGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9
CiAgICB9LAogICAgIjQuMTMiOiB7CiAgICAgICJSZWNpcGVzIjogewogICAg
ICAgICJ4ZW4iOiB7CiAgICAgICAgICAiU3RhYmxlUmVmIjogIjcyMWYyYzMy
M2NhNTVjNzc4NTdjOTNlNzI3NWI0YTkzYTBlMTVlMWYiLAogICAgICAgICAg
IlByZXJlcXMiOiBbXSwKICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAg
ICAgICAieHNhMzE0LTQuMTMucGF0Y2giCiAgICAgICAgICBdCiAgICAgICAg
fQogICAgICB9CiAgICB9LAogICAgIjQuOSI6IHsKICAgICAgIlJlY2lwZXMi
OiB7CiAgICAgICAgInhlbiI6IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAi
Y2YyZTljYzBiYTA0MzJmMDVjZGNhMzZkY2Q0NmJlNWZkZmQ3Y2EwYyIsCiAg
ICAgICAgICAiUHJlcmVxcyI6IFtdLAogICAgICAgICAgIlBhdGNoZXMiOiBb
CiAgICAgICAgICAgICJ4c2EzMTQtNC4xMy5wYXRjaCIKICAgICAgICAgIF0K
ICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAgICAibWFzdGVyIjogewogICAg
ICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0
YWJsZVJlZiI6ICIwZDk5YzkwOWQ3ZTFjYmU2OTMyOWEwMGY3NzcyOTQ2ZjEw
YTc4NjViIiwKICAgICAgICAgICJQcmVyZXFzIjogW10sCiAgICAgICAgICAi
UGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTMxNC5wYXRjaCIKICAgICAg
ICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0KICB9Cn0=

--=separator
Content-Type: application/octet-stream; name="xsa314.patch"
Content-Disposition: attachment; filename="xsa314.patch"
Content-Transfer-Encoding: base64

RnJvbSAyNDI5NTVhYzU2ZjE3NTMyMmFmMDQwZGYyOWFiOGNmYjU0YTNiNGY3
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWxpZW4gR3JhbGwg
PGpncmFsbEBhbWF6b24uY29tPgpEYXRlOiBUaHUsIDIwIEZlYiAyMDIwIDIw
OjU0OjQwICswMDAwClN1YmplY3Q6IFtQQVRDSF0geGVuL3J3bG9jazogQWRk
IG1pc3NpbmcgbWVtb3J5IGJhcnJpZXIgaW4gdGhlIHVubG9jayBwYXRoIG9m
CiByd2xvY2sKClRoZSByd2xvY2sgdW5sb2NrIHBhdGhzIGFyZSB1c2luZyBh
dG9taWNfc3ViKCkgdG8gcmVsZWFzZSB0aGUgbG9jay4KSG93ZXZlciB0aGUg
aW1wbGVtZW50YXRpb24gb2YgYXRvbWljX3N1YigpIHJpZ2h0ZnVsbHkgZG9l
c24ndCBjb250YWluIGEKbWVtb3J5IGJhcnJpZXIuIE9uIEFybSwgdGhpcyBt
ZWFucyBhIHByb2Nlc3NvciBpcyBhbGxvd2VkIHRvIHJlLW9yZGVyCnRoZSBt
ZW1vcnkgYWNjZXNzIHdpdGggdGhlIHByZWNlZWRpbmcgYWNjZXNzLgoKSW4g
b3RoZXIgd29yZHMsIHRoZSB1bmxvY2sgbWF5IGJlIHNlZW4gYnkgYW5vdGhl
ciBwcm9jZXNzb3IgYmVmb3JlIGFsbAp0aGUgbWVtb3J5IGFjY2Vzc2VzIHdp
dGhpbiB0aGUgImNyaXRpY2FsIiBzZWN0aW9uLgoKVGhlIHJ3bG9jayBwYXRo
cyBhbHJlYWR5IGNvbnRhaW5zIGJhcnJpZXIgaW5kaXJlY3RseSwgYnV0IHRo
ZXkgYXJlIG5vdAp2ZXJ5IHVzZWZ1bCB3aXRob3V0IHRoZSBjb3VudGVycGFy
dCBpbiB0aGUgdW5sb2NrIHBhdGhzLgoKVGhlIG1lbW9yeSBiYXJyaWVycyBh
cmUgbm90IG5lY2Vzc2FyeSBvbiB4ODYgYmVjYXVzZSBsb2Fkcy9zdG9yZXMg
YXJlCm5vdCByZS1vcmRlcmVkIHdpdGggbG9jayBpbnN0cnVjdGlvbnMuCgpT
byBhZGQgYXJjaF9sb2NrX3JlbGVhc2VfYmFycmllcigpIGluIHRoZSB1bmxv
Y2sgcGF0aHMgdGhhdCB3aWxsIG9ubHkKYWRkIG1lbW9yeSBiYXJyaWVyIG9u
IEFybS4KClRha2UgdGhlIG9wcG9ydHVuaXR5IHRvIGRvY3VtZW50IGVhY2gg
bG9jayBwYXRocyBleHBsYWluaW5nIHdoeSBhCmJhcnJpZXIgaXMgbm90IG5l
Y2Vzc2FyeS4KClRoaXMgaXMgWFNBLTMxNC4KClNpZ25lZC1vZmYtYnk6IEp1
bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+Ci0tLQogeGVuL2luY2x1
ZGUveGVuL3J3bG9jay5oIHwgMjkgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3J3bG9j
ay5oIGIveGVuL2luY2x1ZGUveGVuL3J3bG9jay5oCmluZGV4IDRkMWI0OGM3
MjIuLjQ5ZWE5YzAxMGEgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9y
d2xvY2suaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vcndsb2NrLmgKQEAgLTYw
LDYgKzYwLDEwIEBAIHN0YXRpYyBpbmxpbmUgaW50IF9yZWFkX3RyeWxvY2so
cndsb2NrX3QgKmxvY2spCiAgICAgaWYgKCBsaWtlbHkoX2Nhbl9yZWFkX2xv
Y2soY250cykpICkKICAgICB7CiAgICAgICAgIGNudHMgPSAodTMyKWF0b21p
Y19hZGRfcmV0dXJuKF9RUl9CSUFTLCAmbG9jay0+Y250cyk7CisgICAgICAg
IC8qCisgICAgICAgICAqIGF0b21pY19hZGRfcmV0dXJuKCkgaXMgYSBmdWxs
IGJhcnJpZXIgc28gbm8gbmVlZCBmb3IgYW4KKyAgICAgICAgICogYXJjaF9s
b2NrX2FjcXVpcmVfYmFycmllcigpLgorICAgICAgICAgKi8KICAgICAgICAg
aWYgKCBsaWtlbHkoX2Nhbl9yZWFkX2xvY2soY250cykpICkKICAgICAgICAg
ICAgIHJldHVybiAxOwogICAgICAgICBhdG9taWNfc3ViKF9RUl9CSUFTLCAm
bG9jay0+Y250cyk7CkBAIC03OCwxMSArODIsMTkgQEAgc3RhdGljIGlubGlu
ZSB2b2lkIF9yZWFkX2xvY2socndsb2NrX3QgKmxvY2spCiAKICAgICBwcmVl
bXB0X2Rpc2FibGUoKTsKICAgICBjbnRzID0gYXRvbWljX2FkZF9yZXR1cm4o
X1FSX0JJQVMsICZsb2NrLT5jbnRzKTsKKyAgICAvKgorICAgICAqIGF0b21p
Y19hZGRfcmV0dXJuKCkgaXMgYSBmdWxsIGJhcnJpZXIgc28gbm8gbmVlZCBm
b3IgYW4KKyAgICAgKiBhcmNoX2xvY2tfYWNxdWlyZV9iYXJyaWVyKCkuCisg
ICAgICovCiAgICAgaWYgKCBsaWtlbHkoX2Nhbl9yZWFkX2xvY2soY250cykp
ICkKICAgICAgICAgcmV0dXJuOwogCiAgICAgLyogVGhlIHNsb3dwYXRoIHdp
bGwgZGVjcmVtZW50IHRoZSByZWFkZXIgY291bnQsIGlmIG5lY2Vzc2FyeS4g
Ki8KICAgICBxdWV1ZV9yZWFkX2xvY2tfc2xvd3BhdGgobG9jayk7CisgICAg
LyoKKyAgICAgKiBxdWV1ZV9yZWFkX2xvY2tfc2xvd3BhdGgoKSBpcyB1c2lu
ZyBzcGlubG9jayBhbmQgdGhlcmVmb3JlIGlzIGEKKyAgICAgKiBmdWxsIGJh
cnJpZXIuIFNvIG5vIG5lZWQgZm9yIGFuIGFyY2hfbG9ja19hY3F1aXJlX2Jh
cnJpZXIoKS4KKyAgICAgKi8KIH0KIAogc3RhdGljIGlubGluZSB2b2lkIF9y
ZWFkX2xvY2tfaXJxKHJ3bG9ja190ICpsb2NrKQpAQCAtMTA2LDYgKzExOCw3
IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBfcmVhZF9sb2NrX2ly
cXNhdmUocndsb2NrX3QgKmxvY2spCiAgKi8KIHN0YXRpYyBpbmxpbmUgdm9p
ZCBfcmVhZF91bmxvY2socndsb2NrX3QgKmxvY2spCiB7CisgICAgYXJjaF9s
b2NrX3JlbGVhc2VfYmFycmllcigpOwogICAgIC8qCiAgICAgICogQXRvbWlj
YWxseSBkZWNyZW1lbnQgdGhlIHJlYWRlciBjb3VudAogICAgICAqLwpAQCAt
MTQxLDEyICsxNTQsMjEgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBpbnQg
X3dyaXRlX2xvY2tfdmFsKHZvaWQpCiAgKi8KIHN0YXRpYyBpbmxpbmUgdm9p
ZCBfd3JpdGVfbG9jayhyd2xvY2tfdCAqbG9jaykKIHsKLSAgICAvKiBPcHRp
bWl6ZSBmb3IgdGhlIHVuZmFpciBsb2NrIGNhc2Ugd2hlcmUgdGhlIGZhaXIg
ZmxhZyBpcyAwLiAqLwogICAgIHByZWVtcHRfZGlzYWJsZSgpOworICAgIC8q
CisgICAgICogT3B0aW1pemUgZm9yIHRoZSB1bmZhaXIgbG9jayBjYXNlIHdo
ZXJlIHRoZSBmYWlyIGZsYWcgaXMgMC4KKyAgICAgKgorICAgICAqIGF0b21p
Y19jbXB4Y2hnKCkgaXMgYSBmdWxsIGJhcnJpZXIgc28gbm8gbmVlZCBmb3Ig
YW4KKyAgICAgKiBhcmNoX2xvY2tfYWNxdWlyZV9iYXJyaWVyKCkuCisgICAg
ICovCiAgICAgaWYgKCBhdG9taWNfY21weGNoZygmbG9jay0+Y250cywgMCwg
X3dyaXRlX2xvY2tfdmFsKCkpID09IDAgKQogICAgICAgICByZXR1cm47CiAK
ICAgICBxdWV1ZV93cml0ZV9sb2NrX3Nsb3dwYXRoKGxvY2spOworICAgIC8q
CisgICAgICogcXVldWVfd3JpdGVfbG9ja19zbG93cGF0aCgpIGlzIHVzaW5n
IHNwaW5sb2NrIGFuZCB0aGVyZWZvcmUgaXMgYQorICAgICAqIGZ1bGwgYmFy
cmllci4gU28gbm8gbmVlZCBmb3IgYW4gYXJjaF9sb2NrX2FjcXVpcmVfYmFy
cmllcigpLgorICAgICAqLwogfQogCiBzdGF0aWMgaW5saW5lIHZvaWQgX3dy
aXRlX2xvY2tfaXJxKHJ3bG9ja190ICpsb2NrKQpAQCAtMTgzLDEyICsyMDUs
MTcgQEAgc3RhdGljIGlubGluZSBpbnQgX3dyaXRlX3RyeWxvY2socndsb2Nr
X3QgKmxvY2spCiAgICAgICAgIHJldHVybiAwOwogICAgIH0KIAorICAgIC8q
CisgICAgICogYXRvbWljX2NtcHhjaGcoKSBpcyBhIGZ1bGwgYmFycmllciBz
byBubyBuZWVkIGZvciBhbgorICAgICAqIGFyY2hfbG9ja19hY3F1aXJlX2Jh
cnJpZXIoKS4KKyAgICAgKi8KICAgICByZXR1cm4gMTsKIH0KIAogc3RhdGlj
IGlubGluZSB2b2lkIF93cml0ZV91bmxvY2socndsb2NrX3QgKmxvY2spCiB7
CiAgICAgQVNTRVJUKF9pc193cml0ZV9sb2NrZWRfYnlfbWUoYXRvbWljX3Jl
YWQoJmxvY2stPmNudHMpKSk7CisgICAgYXJjaF9sb2NrX3JlbGVhc2VfYmFy
cmllcigpOwogICAgIGF0b21pY19hbmQofihfUVdfQ1BVTUFTSyB8IF9RV19X
TUFTSyksICZsb2NrLT5jbnRzKTsKICAgICBwcmVlbXB0X2VuYWJsZSgpOwog
fQotLSAKMi4xNy4xCgo=

--=separator
Content-Type: application/octet-stream; name="xsa314-4.13.patch"
Content-Disposition: attachment; filename="xsa314-4.13.patch"
Content-Transfer-Encoding: base64

RnJvbSBhYjQ5ZjAwNWY3ZDAxZDQwMDRkNzZmMmUyOTVkMzFhY2E3ZDRmOTNh
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWxpZW4gR3JhbGwg
PGpncmFsbEBhbWF6b24uY29tPgpEYXRlOiBUaHUsIDIwIEZlYiAyMDIwIDIw
OjU0OjQwICswMDAwClN1YmplY3Q6IFtQQVRDSF0geGVuL3J3bG9jazogQWRk
IG1pc3NpbmcgbWVtb3J5IGJhcnJpZXIgaW4gdGhlIHVubG9jayBwYXRoIG9m
CiByd2xvY2sKClRoZSByd2xvY2sgdW5sb2NrIHBhdGhzIGFyZSB1c2luZyBh
dG9taWNfc3ViKCkgdG8gcmVsZWFzZSB0aGUgbG9jay4KSG93ZXZlciB0aGUg
aW1wbGVtZW50YXRpb24gb2YgYXRvbWljX3N1YigpIHJpZ2h0ZnVsbHkgZG9l
c24ndCBjb250YWluIGEKbWVtb3J5IGJhcnJpZXIuIE9uIEFybSwgdGhpcyBt
ZWFucyBhIHByb2Nlc3NvciBpcyBhbGxvd2VkIHRvIHJlLW9yZGVyCnRoZSBt
ZW1vcnkgYWNjZXNzIHdpdGggdGhlIHByZWNlZWRpbmcgYWNjZXNzLgoKSW4g
b3RoZXIgd29yZHMsIHRoZSB1bmxvY2sgbWF5IGJlIHNlZW4gYnkgYW5vdGhl
ciBwcm9jZXNzb3IgYmVmb3JlIGFsbAp0aGUgbWVtb3J5IGFjY2Vzc2VzIHdp
dGhpbiB0aGUgImNyaXRpY2FsIiBzZWN0aW9uLgoKVGhlIHJ3bG9jayBwYXRo
cyBhbHJlYWR5IGNvbnRhaW5zIGJhcnJpZXIgaW5kaXJlY3RseSwgYnV0IHRo
ZXkgYXJlIG5vdAp2ZXJ5IHVzZWZ1bCB3aXRob3V0IHRoZSBjb3VudGVycGFy
dCBpbiB0aGUgdW5sb2NrIHBhdGhzLgoKVGhlIG1lbW9yeSBiYXJyaWVycyBh
cmUgbm90IG5lY2Vzc2FyeSBvbiB4ODYgYmVjYXVzZSBsb2Fkcy9zdG9yZXMg
YXJlCm5vdCByZS1vcmRlcmVkIHdpdGggbG9jayBpbnN0cnVjdGlvbnMuCgpT
byBhZGQgYXJjaF9sb2NrX3JlbGVhc2VfYmFycmllcigpIGluIHRoZSB1bmxv
Y2sgcGF0aHMgdGhhdCB3aWxsIG9ubHkKYWRkIG1lbW9yeSBiYXJyaWVyIG9u
IEFybS4KClRha2UgdGhlIG9wcG9ydHVuaXR5IHRvIGRvY3VtZW50IGVhY2gg
bG9jayBwYXRocyBleHBsYWluaW5nIHdoeSBhCmJhcnJpZXIgaXMgbm90IG5l
Y2Vzc2FyeS4KClRoaXMgaXMgWFNBLTMxNC4KClNpZ25lZC1vZmYtYnk6IEp1
bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+ClJldmlld2VkLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+ClJldmlld2VkLWJ5OiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cgot
LS0KIHhlbi9pbmNsdWRlL3hlbi9yd2xvY2suaCB8IDI5ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMjggaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNs
dWRlL3hlbi9yd2xvY2suaCBiL3hlbi9pbmNsdWRlL3hlbi9yd2xvY2suaApp
bmRleCAzZGZlYTFhYzJhLi41MTY0ODYzMDZmIDEwMDY0NAotLS0gYS94ZW4v
aW5jbHVkZS94ZW4vcndsb2NrLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL3J3
bG9jay5oCkBAIC00OCw2ICs0OCwxMCBAQCBzdGF0aWMgaW5saW5lIGludCBf
cmVhZF90cnlsb2NrKHJ3bG9ja190ICpsb2NrKQogICAgIGlmICggbGlrZWx5
KCEoY250cyAmIF9RV19XTUFTSykpICkKICAgICB7CiAgICAgICAgIGNudHMg
PSAodTMyKWF0b21pY19hZGRfcmV0dXJuKF9RUl9CSUFTLCAmbG9jay0+Y250
cyk7CisgICAgICAgIC8qCisgICAgICAgICAqIGF0b21pY19hZGRfcmV0dXJu
KCkgaXMgYSBmdWxsIGJhcnJpZXIgc28gbm8gbmVlZCBmb3IgYW4KKyAgICAg
ICAgICogYXJjaF9sb2NrX2FjcXVpcmVfYmFycmllcigpLgorICAgICAgICAg
Ki8KICAgICAgICAgaWYgKCBsaWtlbHkoIShjbnRzICYgX1FXX1dNQVNLKSkg
KQogICAgICAgICAgICAgcmV0dXJuIDE7CiAgICAgICAgIGF0b21pY19zdWIo
X1FSX0JJQVMsICZsb2NrLT5jbnRzKTsKQEAgLTY0LDExICs2OCwxOSBAQCBz
dGF0aWMgaW5saW5lIHZvaWQgX3JlYWRfbG9jayhyd2xvY2tfdCAqbG9jaykK
ICAgICB1MzIgY250czsKIAogICAgIGNudHMgPSBhdG9taWNfYWRkX3JldHVy
bihfUVJfQklBUywgJmxvY2stPmNudHMpOworICAgIC8qCisgICAgICogYXRv
bWljX2FkZF9yZXR1cm4oKSBpcyBhIGZ1bGwgYmFycmllciBzbyBubyBuZWVk
IGZvciBhbgorICAgICAqIGFyY2hfbG9ja19hY3F1aXJlX2JhcnJpZXIoKS4K
KyAgICAgKi8KICAgICBpZiAoIGxpa2VseSghKGNudHMgJiBfUVdfV01BU0sp
KSApCiAgICAgICAgIHJldHVybjsKIAogICAgIC8qIFRoZSBzbG93cGF0aCB3
aWxsIGRlY3JlbWVudCB0aGUgcmVhZGVyIGNvdW50LCBpZiBuZWNlc3Nhcnku
ICovCiAgICAgcXVldWVfcmVhZF9sb2NrX3Nsb3dwYXRoKGxvY2spOworICAg
IC8qCisgICAgICogcXVldWVfcmVhZF9sb2NrX3Nsb3dwYXRoKCkgaXMgdXNp
bmcgc3BpbmxvY2sgYW5kIHRoZXJlZm9yZSBpcyBhCisgICAgICogZnVsbCBi
YXJyaWVyLiBTbyBubyBuZWVkIGZvciBhbiBhcmNoX2xvY2tfYWNxdWlyZV9i
YXJyaWVyKCkuCisgICAgICovCiB9CiAKIHN0YXRpYyBpbmxpbmUgdm9pZCBf
cmVhZF9sb2NrX2lycShyd2xvY2tfdCAqbG9jaykKQEAgLTkyLDYgKzEwNCw3
IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBfcmVhZF9sb2NrX2ly
cXNhdmUocndsb2NrX3QgKmxvY2spCiAgKi8KIHN0YXRpYyBpbmxpbmUgdm9p
ZCBfcmVhZF91bmxvY2socndsb2NrX3QgKmxvY2spCiB7CisgICAgYXJjaF9s
b2NrX3JlbGVhc2VfYmFycmllcigpOwogICAgIC8qCiAgICAgICogQXRvbWlj
YWxseSBkZWNyZW1lbnQgdGhlIHJlYWRlciBjb3VudAogICAgICAqLwpAQCAt
MTIxLDExICsxMzQsMjAgQEAgc3RhdGljIGlubGluZSBpbnQgX3J3X2lzX2xv
Y2tlZChyd2xvY2tfdCAqbG9jaykKICAqLwogc3RhdGljIGlubGluZSB2b2lk
IF93cml0ZV9sb2NrKHJ3bG9ja190ICpsb2NrKQogewotICAgIC8qIE9wdGlt
aXplIGZvciB0aGUgdW5mYWlyIGxvY2sgY2FzZSB3aGVyZSB0aGUgZmFpciBm
bGFnIGlzIDAuICovCisgICAgLyoKKyAgICAgKiBPcHRpbWl6ZSBmb3IgdGhl
IHVuZmFpciBsb2NrIGNhc2Ugd2hlcmUgdGhlIGZhaXIgZmxhZyBpcyAwLgor
ICAgICAqCisgICAgICogYXRvbWljX2NtcHhjaGcoKSBpcyBhIGZ1bGwgYmFy
cmllciBzbyBubyBuZWVkIGZvciBhbgorICAgICAqIGFyY2hfbG9ja19hY3F1
aXJlX2JhcnJpZXIoKS4KKyAgICAgKi8KICAgICBpZiAoIGF0b21pY19jbXB4
Y2hnKCZsb2NrLT5jbnRzLCAwLCBfUVdfTE9DS0VEKSA9PSAwICkKICAgICAg
ICAgcmV0dXJuOwogCiAgICAgcXVldWVfd3JpdGVfbG9ja19zbG93cGF0aChs
b2NrKTsKKyAgICAvKgorICAgICAqIHF1ZXVlX3dyaXRlX2xvY2tfc2xvd3Bh
dGgoKSBpcyB1c2luZyBzcGlubG9jayBhbmQgdGhlcmVmb3JlIGlzIGEKKyAg
ICAgKiBmdWxsIGJhcnJpZXIuIFNvIG5vIG5lZWQgZm9yIGFuIGFyY2hfbG9j
a19hY3F1aXJlX2JhcnJpZXIoKS4KKyAgICAgKi8KIH0KIAogc3RhdGljIGlu
bGluZSB2b2lkIF93cml0ZV9sb2NrX2lycShyd2xvY2tfdCAqbG9jaykKQEAg
LTE1NywxMSArMTc5LDE2IEBAIHN0YXRpYyBpbmxpbmUgaW50IF93cml0ZV90
cnlsb2NrKHJ3bG9ja190ICpsb2NrKQogICAgIGlmICggdW5saWtlbHkoY250
cykgKQogICAgICAgICByZXR1cm4gMDsKIAorICAgIC8qCisgICAgICogYXRv
bWljX2NtcHhjaGcoKSBpcyBhIGZ1bGwgYmFycmllciBzbyBubyBuZWVkIGZv
ciBhbgorICAgICAqIGFyY2hfbG9ja19hY3F1aXJlX2JhcnJpZXIoKS4KKyAg
ICAgKi8KICAgICByZXR1cm4gbGlrZWx5KGF0b21pY19jbXB4Y2hnKCZsb2Nr
LT5jbnRzLCAwLCBfUVdfTE9DS0VEKSA9PSAwKTsKIH0KIAogc3RhdGljIGlu
bGluZSB2b2lkIF93cml0ZV91bmxvY2socndsb2NrX3QgKmxvY2spCiB7Cisg
ICAgYXJjaF9sb2NrX3JlbGVhc2VfYmFycmllcigpOwogICAgIC8qCiAgICAg
ICogSWYgdGhlIHdyaXRlciBmaWVsZCBpcyBhdG9taWMsIGl0IGNhbiBiZSBj
bGVhcmVkIGRpcmVjdGx5LgogICAgICAqIE90aGVyd2lzZSwgYW4gYXRvbWlj
IHN1YnRyYWN0aW9uIHdpbGwgYmUgdXNlZCB0byBjbGVhciBpdC4KLS0gCjIu
MTcuMQoK

--=separator--

