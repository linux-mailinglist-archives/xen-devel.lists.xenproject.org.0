Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F05DBFF95
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 09:04:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDkGA-0003kC-7Z; Fri, 27 Sep 2019 07:01:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Rbpq=XW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iDkG9-0003jA-50
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 07:01:45 +0000
X-Inumbo-ID: 912446f2-e0f4-11e9-966c-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 912446f2-e0f4-11e9-966c-12813bfff9fa;
 Fri, 27 Sep 2019 07:01:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DD747B175;
 Fri, 27 Sep 2019 07:00:59 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 27 Sep 2019 09:00:22 +0200
Message-Id: <20190927070050.12405-19-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190927070050.12405-1-jgross@suse.com>
References: <20190927070050.12405-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v4 18/46] xen/sched: make arinc653 scheduler
 vcpu agnostic.
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
Cc: Juergen Gross <jgross@suse.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3dpdGNoIGFyaW5jNjUzIHNjaGVkdWxlciBjb21wbGV0ZWx5IGZyb20gdmNwdSB0byBzY2hlZF91
bml0IHVzYWdlLgoKU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PgpSZXZpZXdlZC1ieTogRGFyaW8gRmFnZ2lvbGkgPGRmYWdnaW9saUBzdXNlLmNvbT4KLS0tCiB4
ZW4vY29tbW9uL3NjaGVkX2FyaW5jNjUzLmMgfCAyMDggKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMDEgaW5zZXJ0aW9ucygrKSwg
MTA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWRfYXJpbmM2NTMu
YyBiL3hlbi9jb21tb24vc2NoZWRfYXJpbmM2NTMuYwppbmRleCA5ZmYxZDdmMjQ1Li5mMDRkOWM5
Y2IxIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3NjaGVkX2FyaW5jNjUzLmMKKysrIGIveGVuL2Nv
bW1vbi9zY2hlZF9hcmluYzY1My5jCkBAIC00NSwxNSArNDUsMTUgQEAKICNkZWZpbmUgREVGQVVM
VF9USU1FU0xJQ0UgTUlMTElTRUNTKDEwKQogCiAvKioKLSAqIFJldHJpZXZlIHRoZSBpZGxlIFZD
UFUgZm9yIGEgZ2l2ZW4gcGh5c2ljYWwgQ1BVCisgKiBSZXRyaWV2ZSB0aGUgaWRsZSBVTklUIGZv
ciBhIGdpdmVuIHBoeXNpY2FsIENQVQogICovCi0jZGVmaW5lIElETEVUQVNLKGNwdSkgIChpZGxl
X3ZjcHVbY3B1XSkKKyNkZWZpbmUgSURMRVRBU0soY3B1KSAgKHNjaGVkX2lkbGVfdW5pdChjcHUp
KQogCiAvKioKICAqIFJldHVybiBhIHBvaW50ZXIgdG8gdGhlIEFSSU5DIDY1My1zcGVjaWZpYyBz
Y2hlZHVsZXIgZGF0YSBpbmZvcm1hdGlvbgotICogYXNzb2NpYXRlZCB3aXRoIHRoZSBnaXZlbiBW
Q1BVICh2YykKKyAqIGFzc29jaWF0ZWQgd2l0aCB0aGUgZ2l2ZW4gVU5JVCAodW5pdCkKICAqLwot
I2RlZmluZSBBVkNQVSh2YykgKChhcmluYzY1M192Y3B1X3QgKikodmMpLT5zY2hlZF91bml0LT5w
cml2KQorI2RlZmluZSBBVU5JVCh1bml0KSAoKGFyaW5jNjUzX3VuaXRfdCAqKSh1bml0KS0+cHJp
dikKIAogLyoqCiAgKiBSZXR1cm4gdGhlIGdsb2JhbCBzY2hlZHVsZXIgcHJpdmF0ZSBkYXRhIGdp
dmVuIHRoZSBzY2hlZHVsZXIgb3BzIHBvaW50ZXIKQEAgLTY1LDIwICs2NSwyMCBAQAogICoqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqLwogCiAvKioKLSAqIFRoZSBhcmluYzY1M192Y3B1X3Qgc3RydWN0dXJlIGhv
bGRzIEFSSU5DIDY1My1zY2hlZHVsZXItc3BlY2lmaWMKLSAqIGluZm9ybWF0aW9uIGZvciBhbGwg
bm9uLWlkbGUgVkNQVXMKKyAqIFRoZSBhcmluYzY1M191bml0X3Qgc3RydWN0dXJlIGhvbGRzIEFS
SU5DIDY1My1zY2hlZHVsZXItc3BlY2lmaWMKKyAqIGluZm9ybWF0aW9uIGZvciBhbGwgbm9uLWlk
bGUgVU5JVHMKICAqLwotdHlwZWRlZiBzdHJ1Y3QgYXJpbmM2NTNfdmNwdV9zCit0eXBlZGVmIHN0
cnVjdCBhcmluYzY1M191bml0X3MKIHsKLSAgICAvKiB2YyBwb2ludHMgdG8gWGVuJ3Mgc3RydWN0
IHZjcHUgc28gd2UgY2FuIGdldCB0byBpdCBmcm9tIGFuCi0gICAgICogYXJpbmM2NTNfdmNwdV90
IHBvaW50ZXIuICovCi0gICAgc3RydWN0IHZjcHUgKiAgICAgICB2YzsKLSAgICAvKiBhd2FrZSBo
b2xkcyB3aGV0aGVyIHRoZSBWQ1BVIGhhcyBiZWVuIHdva2VuIHdpdGggdmNwdV93YWtlKCkgKi8K
KyAgICAvKiB1bml0IHBvaW50cyB0byBYZW4ncyBzdHJ1Y3Qgc2NoZWRfdW5pdCBzbyB3ZSBjYW4g
Z2V0IHRvIGl0IGZyb20gYW4KKyAgICAgKiBhcmluYzY1M191bml0X3QgcG9pbnRlci4gKi8KKyAg
ICBzdHJ1Y3Qgc2NoZWRfdW5pdCAqIHVuaXQ7CisgICAgLyogYXdha2UgaG9sZHMgd2hldGhlciB0
aGUgVU5JVCBoYXMgYmVlbiB3b2tlbiB3aXRoIHZjcHVfd2FrZSgpICovCiAgICAgYm9vbF90ICAg
ICAgICAgICAgICBhd2FrZTsKLSAgICAvKiBsaXN0IGhvbGRzIHRoZSBsaW5rZWQgbGlzdCBpbmZv
cm1hdGlvbiBmb3IgdGhlIGxpc3QgdGhpcyBWQ1BVCisgICAgLyogbGlzdCBob2xkcyB0aGUgbGlu
a2VkIGxpc3QgaW5mb3JtYXRpb24gZm9yIHRoZSBsaXN0IHRoaXMgVU5JVAogICAgICAqIGlzIHN0
b3JlZCBpbiAqLwogICAgIHN0cnVjdCBsaXN0X2hlYWQgICAgbGlzdDsKLX0gYXJpbmM2NTNfdmNw
dV90OworfSBhcmluYzY1M191bml0X3Q7CiAKIC8qKgogICogVGhlIHNjaGVkX2VudHJ5X3Qgc3Ry
dWN0dXJlIGhvbGRzIGEgc2luZ2xlIGVudHJ5IG9mIHRoZQpAQCAtODksMTQgKzg5LDE0IEBAIHR5
cGVkZWYgc3RydWN0IHNjaGVkX2VudHJ5X3MKICAgICAvKiBkb21faGFuZGxlIGhvbGRzIHRoZSBo
YW5kbGUgKCJVVUlEIikgZm9yIHRoZSBkb21haW4gdGhhdCB0aGlzCiAgICAgICogc2NoZWR1bGUg
ZW50cnkgcmVmZXJzIHRvLiAqLwogICAgIHhlbl9kb21haW5faGFuZGxlX3QgZG9tX2hhbmRsZTsK
LSAgICAvKiB2Y3B1X2lkIGhvbGRzIHRoZSBWQ1BVIG51bWJlciBmb3IgdGhlIFZDUFUgdGhhdCB0
aGlzIHNjaGVkdWxlCisgICAgLyogdW5pdF9pZCBob2xkcyB0aGUgVU5JVCBudW1iZXIgZm9yIHRo
ZSBVTklUIHRoYXQgdGhpcyBzY2hlZHVsZQogICAgICAqIGVudHJ5IHJlZmVycyB0by4gKi8KLSAg
ICBpbnQgICAgICAgICAgICAgICAgIHZjcHVfaWQ7Ci0gICAgLyogcnVudGltZSBob2xkcyB0aGUg
bnVtYmVyIG9mIG5hbm9zZWNvbmRzIHRoYXQgdGhlIFZDUFUgZm9yIHRoaXMKKyAgICBpbnQgICAg
ICAgICAgICAgICAgIHVuaXRfaWQ7CisgICAgLyogcnVudGltZSBob2xkcyB0aGUgbnVtYmVyIG9m
IG5hbm9zZWNvbmRzIHRoYXQgdGhlIFVOSVQgZm9yIHRoaXMKICAgICAgKiBzY2hlZHVsZSBlbnRy
eSBzaG91bGQgYmUgYWxsb3dlZCB0byBydW4gcGVyIG1ham9yIGZyYW1lLiAqLwogICAgIHNfdGlt
ZV90ICAgICAgICAgICAgcnVudGltZTsKLSAgICAvKiB2YyBob2xkcyBhIHBvaW50ZXIgdG8gdGhl
IFhlbiBWQ1BVIHN0cnVjdHVyZSAqLwotICAgIHN0cnVjdCB2Y3B1ICogICAgICAgdmM7CisgICAg
LyogdW5pdCBob2xkcyBhIHBvaW50ZXIgdG8gdGhlIFhlbiBzY2hlZF91bml0IHN0cnVjdHVyZSAq
LworICAgIHN0cnVjdCBzY2hlZF91bml0ICogdW5pdDsKIH0gc2NoZWRfZW50cnlfdDsKIAogLyoq
CkBAIC0xMTAsOSArMTEwLDkgQEAgdHlwZWRlZiBzdHJ1Y3QgYTY1M3NjaGVkX3ByaXZfcwogICAg
IC8qKgogICAgICAqIFRoaXMgYXJyYXkgaG9sZHMgdGhlIGFjdGl2ZSBBUklOQyA2NTMgc2NoZWR1
bGUuCiAgICAgICoKLSAgICAgKiBXaGVuIHRoZSBzeXN0ZW0gdHJpZXMgdG8gc3RhcnQgYSBuZXcg
VkNQVSwgdGhpcyBzY2hlZHVsZSBpcyBzY2FubmVkCi0gICAgICogdG8gbG9vayBmb3IgYSBtYXRj
aGluZyAoaGFuZGxlLCBWQ1BVICMpIHBhaXIuIElmIGJvdGggdGhlIGhhbmRsZSAoVVVJRCkKLSAg
ICAgKiBhbmQgVkNQVSBudW1iZXIgbWF0Y2gsIHRoZW4gdGhlIFZDUFUgaXMgYWxsb3dlZCB0byBy
dW4uIEl0cyBydW4gdGltZQorICAgICAqIFdoZW4gdGhlIHN5c3RlbSB0cmllcyB0byBzdGFydCBh
IG5ldyBVTklULCB0aGlzIHNjaGVkdWxlIGlzIHNjYW5uZWQKKyAgICAgKiB0byBsb29rIGZvciBh
IG1hdGNoaW5nIChoYW5kbGUsIFVOSVQgIykgcGFpci4gSWYgYm90aCB0aGUgaGFuZGxlIChVVUlE
KQorICAgICAqIGFuZCBVTklUIG51bWJlciBtYXRjaCwgdGhlbiB0aGUgVU5JVCBpcyBhbGxvd2Vk
IHRvIHJ1bi4gSXRzIHJ1biB0aW1lCiAgICAgICogKHBlciBtYWpvciBmcmFtZSkgaXMgZ2l2ZW4g
aW4gdGhlIHRoaXJkIGVudHJ5IG9mIHRoZSBzY2hlZHVsZS4KICAgICAgKi8KICAgICBzY2hlZF9l
bnRyeV90IHNjaGVkdWxlW0FSSU5DNjUzX01BWF9ET01BSU5TX1BFUl9TQ0hFRFVMRV07CkBAIC0x
MjMsOCArMTIzLDggQEAgdHlwZWRlZiBzdHJ1Y3QgYTY1M3NjaGVkX3ByaXZfcwogICAgICAqCiAg
ICAgICogVGhpcyBpcyBub3QgbmVjZXNzYXJpbHkgdGhlIHNhbWUgYXMgdGhlIG51bWJlciBvZiBk
b21haW5zIGluIHRoZQogICAgICAqIHNjaGVkdWxlLiBBIGRvbWFpbiBjb3VsZCBiZSBsaXN0ZWQg
bXVsdGlwbGUgdGltZXMgd2l0aGluIHRoZSBzY2hlZHVsZSwKLSAgICAgKiBvciBhIGRvbWFpbiB3
aXRoIG11bHRpcGxlIFZDUFVzIGNvdWxkIGhhdmUgYSBkaWZmZXJlbnQKLSAgICAgKiBzY2hlZHVs
ZSBlbnRyeSBmb3IgZWFjaCBWQ1BVLgorICAgICAqIG9yIGEgZG9tYWluIHdpdGggbXVsdGlwbGUg
VU5JVHMgY291bGQgaGF2ZSBhIGRpZmZlcmVudAorICAgICAqIHNjaGVkdWxlIGVudHJ5IGZvciBl
YWNoIFVOSVQuCiAgICAgICovCiAgICAgdW5zaWduZWQgaW50IG51bV9zY2hlZHVsZV9lbnRyaWVz
OwogCkBAIC0xMzksOSArMTM5LDkgQEAgdHlwZWRlZiBzdHJ1Y3QgYTY1M3NjaGVkX3ByaXZfcwog
ICAgIHNfdGltZV90IG5leHRfbWFqb3JfZnJhbWU7CiAKICAgICAvKioKLSAgICAgKiBwb2ludGVy
cyB0byBhbGwgWGVuIFZDUFUgc3RydWN0dXJlcyBmb3IgaXRlcmF0aW5nIHRocm91Z2gKKyAgICAg
KiBwb2ludGVycyB0byBhbGwgWGVuIFVOSVQgc3RydWN0dXJlcyBmb3IgaXRlcmF0aW5nIHRocm91
Z2gKICAgICAgKi8KLSAgICBzdHJ1Y3QgbGlzdF9oZWFkIHZjcHVfbGlzdDsKKyAgICBzdHJ1Y3Qg
bGlzdF9oZWFkIHVuaXRfbGlzdDsKIH0gYTY1M3NjaGVkX3ByaXZfdDsKIAogLyoqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqCkBAIC0xNjcsNTAgKzE2Nyw1MCBAQCBzdGF0aWMgaW50IGRvbV9oYW5kbGVfY21wKGNv
bnN0IHhlbl9kb21haW5faGFuZGxlX3QgaDEsCiB9CiAKIC8qKgotICogVGhpcyBmdW5jdGlvbiBz
ZWFyY2hlcyB0aGUgdmNwdSBsaXN0IHRvIGZpbmQgYSBWQ1BVIHRoYXQgbWF0Y2hlcwotICogdGhl
IGRvbWFpbiBoYW5kbGUgYW5kIFZDUFUgSUQgc3BlY2lmaWVkLgorICogVGhpcyBmdW5jdGlvbiBz
ZWFyY2hlcyB0aGUgdW5pdCBsaXN0IHRvIGZpbmQgYSBVTklUIHRoYXQgbWF0Y2hlcworICogdGhl
IGRvbWFpbiBoYW5kbGUgYW5kIFVOSVQgSUQgc3BlY2lmaWVkLgogICoKICAqIEBwYXJhbSBvcHMg
ICAgICAgUG9pbnRlciB0byB0aGlzIGluc3RhbmNlIG9mIHRoZSBzY2hlZHVsZXIgc3RydWN0dXJl
CiAgKiBAcGFyYW0gaGFuZGxlICAgIFBvaW50ZXIgdG8gaGFuZGxlcgotICogQHBhcmFtIHZjcHVf
aWQgICBWQ1BVIElECisgKiBAcGFyYW0gdW5pdF9pZCAgIFVOSVQgSUQKICAqCiAgKiBAcmV0dXJu
ICAgICAgICAgIDx1bD4KLSAqICAgICAgICAgICAgICAgICAgPGxpPiBQb2ludGVyIHRvIHRoZSBt
YXRjaGluZyBWQ1BVIGlmIG9uZSBpcyBmb3VuZAorICogICAgICAgICAgICAgICAgICA8bGk+IFBv
aW50ZXIgdG8gdGhlIG1hdGNoaW5nIFVOSVQgaWYgb25lIGlzIGZvdW5kCiAgKiAgICAgICAgICAg
ICAgICAgIDxsaT4gTlVMTCBvdGhlcndpc2UKICAqICAgICAgICAgICAgICAgICAgPC91bD4KICAq
Lwotc3RhdGljIHN0cnVjdCB2Y3B1ICpmaW5kX3ZjcHUoCitzdGF0aWMgc3RydWN0IHNjaGVkX3Vu
aXQgKmZpbmRfdW5pdCgKICAgICBjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsCiAgICAgeGVu
X2RvbWFpbl9oYW5kbGVfdCBoYW5kbGUsCi0gICAgaW50IHZjcHVfaWQpCisgICAgaW50IHVuaXRf
aWQpCiB7Ci0gICAgYXJpbmM2NTNfdmNwdV90ICphdmNwdTsKKyAgICBhcmluYzY1M191bml0X3Qg
KmF1bml0OwogCi0gICAgLyogbG9vcCB0aHJvdWdoIHRoZSB2Y3B1X2xpc3QgbG9va2luZyBmb3Ig
dGhlIHNwZWNpZmllZCBWQ1BVICovCi0gICAgbGlzdF9mb3JfZWFjaF9lbnRyeSAoIGF2Y3B1LCAm
U0NIRURfUFJJVihvcHMpLT52Y3B1X2xpc3QsIGxpc3QgKQotICAgICAgICBpZiAoIChkb21faGFu
ZGxlX2NtcChhdmNwdS0+dmMtPmRvbWFpbi0+aGFuZGxlLCBoYW5kbGUpID09IDApCi0gICAgICAg
ICAgICAgJiYgKHZjcHVfaWQgPT0gYXZjcHUtPnZjLT52Y3B1X2lkKSApCi0gICAgICAgICAgICBy
ZXR1cm4gYXZjcHUtPnZjOworICAgIC8qIGxvb3AgdGhyb3VnaCB0aGUgdW5pdF9saXN0IGxvb2tp
bmcgZm9yIHRoZSBzcGVjaWZpZWQgVU5JVCAqLworICAgIGxpc3RfZm9yX2VhY2hfZW50cnkgKCBh
dW5pdCwgJlNDSEVEX1BSSVYob3BzKS0+dW5pdF9saXN0LCBsaXN0ICkKKyAgICAgICAgaWYgKCAo
ZG9tX2hhbmRsZV9jbXAoYXVuaXQtPnVuaXQtPmRvbWFpbi0+aGFuZGxlLCBoYW5kbGUpID09IDAp
CisgICAgICAgICAgICAgJiYgKHVuaXRfaWQgPT0gYXVuaXQtPnVuaXQtPnVuaXRfaWQpICkKKyAg
ICAgICAgICAgIHJldHVybiBhdW5pdC0+dW5pdDsKIAogICAgIHJldHVybiBOVUxMOwogfQogCiAv
KioKLSAqIFRoaXMgZnVuY3Rpb24gdXBkYXRlcyB0aGUgcG9pbnRlciB0byB0aGUgWGVuIFZDUFUg
c3RydWN0dXJlIGZvciBlYWNoIGVudHJ5CisgKiBUaGlzIGZ1bmN0aW9uIHVwZGF0ZXMgdGhlIHBv
aW50ZXIgdG8gdGhlIFhlbiBVTklUIHN0cnVjdHVyZSBmb3IgZWFjaCBlbnRyeQogICogaW4gdGhl
IEFSSU5DIDY1MyBzY2hlZHVsZS4KICAqCiAgKiBAcGFyYW0gb3BzICAgICAgIFBvaW50ZXIgdG8g
dGhpcyBpbnN0YW5jZSBvZiB0aGUgc2NoZWR1bGVyIHN0cnVjdHVyZQogICogQHJldHVybiAgICAg
ICAgICA8Tm9uZT4KICAqLwotc3RhdGljIHZvaWQgdXBkYXRlX3NjaGVkdWxlX3ZjcHVzKGNvbnN0
IHN0cnVjdCBzY2hlZHVsZXIgKm9wcykKK3N0YXRpYyB2b2lkIHVwZGF0ZV9zY2hlZHVsZV91bml0
cyhjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMpCiB7CiAgICAgdW5zaWduZWQgaW50IGksIG5f
ZW50cmllcyA9IFNDSEVEX1BSSVYob3BzKS0+bnVtX3NjaGVkdWxlX2VudHJpZXM7CiAKICAgICBm
b3IgKCBpID0gMDsgaSA8IG5fZW50cmllczsgaSsrICkKLSAgICAgICAgU0NIRURfUFJJVihvcHMp
LT5zY2hlZHVsZVtpXS52YyA9Ci0gICAgICAgICAgICBmaW5kX3ZjcHUob3BzLAorICAgICAgICBT
Q0hFRF9QUklWKG9wcyktPnNjaGVkdWxlW2ldLnVuaXQgPQorICAgICAgICAgICAgZmluZF91bml0
KG9wcywKICAgICAgICAgICAgICAgICAgICAgICBTQ0hFRF9QUklWKG9wcyktPnNjaGVkdWxlW2ld
LmRvbV9oYW5kbGUsCi0gICAgICAgICAgICAgICAgICAgICAgU0NIRURfUFJJVihvcHMpLT5zY2hl
ZHVsZVtpXS52Y3B1X2lkKTsKKyAgICAgICAgICAgICAgICAgICAgICBTQ0hFRF9QUklWKG9wcykt
PnNjaGVkdWxlW2ldLnVuaXRfaWQpOwogfQogCiAvKioKQEAgLTI2OCwxMiArMjY4LDEyIEBAIGFy
aW5jNjUzX3NjaGVkX3NldCgKICAgICAgICAgbWVtY3B5KHNjaGVkX3ByaXYtPnNjaGVkdWxlW2ld
LmRvbV9oYW5kbGUsCiAgICAgICAgICAgICAgICBzY2hlZHVsZS0+c2NoZWRfZW50cmllc1tpXS5k
b21faGFuZGxlLAogICAgICAgICAgICAgICAgc2l6ZW9mKHNjaGVkX3ByaXYtPnNjaGVkdWxlW2ld
LmRvbV9oYW5kbGUpKTsKLSAgICAgICAgc2NoZWRfcHJpdi0+c2NoZWR1bGVbaV0udmNwdV9pZCA9
CisgICAgICAgIHNjaGVkX3ByaXYtPnNjaGVkdWxlW2ldLnVuaXRfaWQgPQogICAgICAgICAgICAg
c2NoZWR1bGUtPnNjaGVkX2VudHJpZXNbaV0udmNwdV9pZDsKICAgICAgICAgc2NoZWRfcHJpdi0+
c2NoZWR1bGVbaV0ucnVudGltZSA9CiAgICAgICAgICAgICBzY2hlZHVsZS0+c2NoZWRfZW50cmll
c1tpXS5ydW50aW1lOwogICAgIH0KLSAgICB1cGRhdGVfc2NoZWR1bGVfdmNwdXMob3BzKTsKKyAg
ICB1cGRhdGVfc2NoZWR1bGVfdW5pdHMob3BzKTsKIAogICAgIC8qCiAgICAgICogVGhlIG5ld2x5
LWluc3RhbGxlZCBzY2hlZHVsZSB0YWtlcyBlZmZlY3QgaW1tZWRpYXRlbHkuIFdlIGRvIG5vdCBl
dmVuCkBAIC0zMTksNyArMzE5LDcgQEAgYXJpbmM2NTNfc2NoZWRfZ2V0KAogICAgICAgICBtZW1j
cHkoc2NoZWR1bGUtPnNjaGVkX2VudHJpZXNbaV0uZG9tX2hhbmRsZSwKICAgICAgICAgICAgICAg
IHNjaGVkX3ByaXYtPnNjaGVkdWxlW2ldLmRvbV9oYW5kbGUsCiAgICAgICAgICAgICAgICBzaXpl
b2Yoc2NoZWRfcHJpdi0+c2NoZWR1bGVbaV0uZG9tX2hhbmRsZSkpOwotICAgICAgICBzY2hlZHVs
ZS0+c2NoZWRfZW50cmllc1tpXS52Y3B1X2lkID0gc2NoZWRfcHJpdi0+c2NoZWR1bGVbaV0udmNw
dV9pZDsKKyAgICAgICAgc2NoZWR1bGUtPnNjaGVkX2VudHJpZXNbaV0udmNwdV9pZCA9IHNjaGVk
X3ByaXYtPnNjaGVkdWxlW2ldLnVuaXRfaWQ7CiAgICAgICAgIHNjaGVkdWxlLT5zY2hlZF9lbnRy
aWVzW2ldLnJ1bnRpbWUgPSBzY2hlZF9wcml2LT5zY2hlZHVsZVtpXS5ydW50aW1lOwogICAgIH0K
IApAQCAtMzU1LDcgKzM1NSw3IEBAIGE2NTNzY2hlZF9pbml0KHN0cnVjdCBzY2hlZHVsZXIgKm9w
cykKIAogICAgIHBydi0+bmV4dF9tYWpvcl9mcmFtZSA9IDA7CiAgICAgc3Bpbl9sb2NrX2luaXQo
JnBydi0+bG9jayk7Ci0gICAgSU5JVF9MSVNUX0hFQUQoJnBydi0+dmNwdV9saXN0KTsKKyAgICBJ
TklUX0xJU1RfSEVBRCgmcHJ2LT51bml0X2xpc3QpOwogCiAgICAgcmV0dXJuIDA7CiB9CkBAIC0z
NzMsNyArMzczLDcgQEAgYTY1M3NjaGVkX2RlaW5pdChzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMpCiB9
CiAKIC8qKgotICogVGhpcyBmdW5jdGlvbiBhbGxvY2F0ZXMgc2NoZWR1bGVyLXNwZWNpZmljIGRh
dGEgZm9yIGEgVkNQVQorICogVGhpcyBmdW5jdGlvbiBhbGxvY2F0ZXMgc2NoZWR1bGVyLXNwZWNp
ZmljIGRhdGEgZm9yIGEgVU5JVAogICoKICAqIEBwYXJhbSBvcHMgICAgICAgUG9pbnRlciB0byB0
aGlzIGluc3RhbmNlIG9mIHRoZSBzY2hlZHVsZXIgc3RydWN0dXJlCiAgKiBAcGFyYW0gdW5pdCAg
ICAgIFBvaW50ZXIgdG8gc3RydWN0IHNjaGVkX3VuaXQKQEAgLTM4NSwzNSArMzg1LDM0IEBAIGE2
NTNzY2hlZF9hbGxvY191ZGF0YShjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHN0cnVjdCBz
Y2hlZF91bml0ICp1bml0LAogICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmRkKQogewogICAg
IGE2NTNzY2hlZF9wcml2X3QgKnNjaGVkX3ByaXYgPSBTQ0hFRF9QUklWKG9wcyk7Ci0gICAgc3Ry
dWN0IHZjcHUgKnZjID0gdW5pdC0+dmNwdV9saXN0OwotICAgIGFyaW5jNjUzX3ZjcHVfdCAqc3Zj
OworICAgIGFyaW5jNjUzX3VuaXRfdCAqc3ZjOwogICAgIHVuc2lnbmVkIGludCBlbnRyeTsKICAg
ICB1bnNpZ25lZCBsb25nIGZsYWdzOwogCiAgICAgLyoKICAgICAgKiBBbGxvY2F0ZSBtZW1vcnkg
Zm9yIHRoZSBBUklOQyA2NTMtc3BlY2lmaWMgc2NoZWR1bGVyIGRhdGEgaW5mb3JtYXRpb24KLSAg
ICAgKiBhc3NvY2lhdGVkIHdpdGggdGhlIGdpdmVuIFZDUFUgKHZjKS4KKyAgICAgKiBhc3NvY2lh
dGVkIHdpdGggdGhlIGdpdmVuIFVOSVQgKHVuaXQpLgogICAgICAqLwotICAgIHN2YyA9IHhtYWxs
b2MoYXJpbmM2NTNfdmNwdV90KTsKKyAgICBzdmMgPSB4bWFsbG9jKGFyaW5jNjUzX3VuaXRfdCk7
CiAgICAgaWYgKCBzdmMgPT0gTlVMTCApCiAgICAgICAgIHJldHVybiBOVUxMOwogCiAgICAgc3Bp
bl9sb2NrX2lycXNhdmUoJnNjaGVkX3ByaXYtPmxvY2ssIGZsYWdzKTsKIAotICAgIC8qIAotICAg
ICAqIEFkZCBldmVyeSBvbmUgb2YgZG9tMCdzIHZjcHVzIHRvIHRoZSBzY2hlZHVsZSwgYXMgbG9u
ZyBhcyB0aGVyZSBhcmUKKyAgICAvKgorICAgICAqIEFkZCBldmVyeSBvbmUgb2YgZG9tMCdzIHVu
aXRzIHRvIHRoZSBzY2hlZHVsZSwgYXMgbG9uZyBhcyB0aGVyZSBhcmUKICAgICAgKiBzbG90cyBh
dmFpbGFibGUuCiAgICAgICovCi0gICAgaWYgKCB2Yy0+ZG9tYWluLT5kb21haW5faWQgPT0gMCAp
CisgICAgaWYgKCB1bml0LT5kb21haW4tPmRvbWFpbl9pZCA9PSAwICkKICAgICB7CiAgICAgICAg
IGVudHJ5ID0gc2NoZWRfcHJpdi0+bnVtX3NjaGVkdWxlX2VudHJpZXM7CiAKICAgICAgICAgaWYg
KCBlbnRyeSA8IEFSSU5DNjUzX01BWF9ET01BSU5TX1BFUl9TQ0hFRFVMRSApCiAgICAgICAgIHsK
ICAgICAgICAgICAgIHNjaGVkX3ByaXYtPnNjaGVkdWxlW2VudHJ5XS5kb21faGFuZGxlWzBdID0g
J1wwJzsKLSAgICAgICAgICAgIHNjaGVkX3ByaXYtPnNjaGVkdWxlW2VudHJ5XS52Y3B1X2lkID0g
dmMtPnZjcHVfaWQ7CisgICAgICAgICAgICBzY2hlZF9wcml2LT5zY2hlZHVsZVtlbnRyeV0udW5p
dF9pZCA9IHVuaXQtPnVuaXRfaWQ7CiAgICAgICAgICAgICBzY2hlZF9wcml2LT5zY2hlZHVsZVtl
bnRyeV0ucnVudGltZSA9IERFRkFVTFRfVElNRVNMSUNFOwotICAgICAgICAgICAgc2NoZWRfcHJp
di0+c2NoZWR1bGVbZW50cnldLnZjID0gdmM7CisgICAgICAgICAgICBzY2hlZF9wcml2LT5zY2hl
ZHVsZVtlbnRyeV0udW5pdCA9IHVuaXQ7CiAKICAgICAgICAgICAgIHNjaGVkX3ByaXYtPm1ham9y
X2ZyYW1lICs9IERFRkFVTFRfVElNRVNMSUNFOwogICAgICAgICAgICAgKytzY2hlZF9wcml2LT5u
dW1fc2NoZWR1bGVfZW50cmllczsKQEAgLTQyMSwxNiArNDIwLDE2IEBAIGE2NTNzY2hlZF9hbGxv
Y191ZGF0YShjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHN0cnVjdCBzY2hlZF91bml0ICp1
bml0LAogICAgIH0KIAogICAgIC8qCi0gICAgICogSW5pdGlhbGl6ZSBvdXIgQVJJTkMgNjUzIHNj
aGVkdWxlci1zcGVjaWZpYyBpbmZvcm1hdGlvbiBmb3IgdGhlIFZDUFUuCi0gICAgICogVGhlIFZD
UFUgc3RhcnRzICJhc2xlZXAuIiBXaGVuIFhlbiBpcyByZWFkeSBmb3IgdGhlIFZDUFUgdG8gcnVu
LCBpdAorICAgICAqIEluaXRpYWxpemUgb3VyIEFSSU5DIDY1MyBzY2hlZHVsZXItc3BlY2lmaWMg
aW5mb3JtYXRpb24gZm9yIHRoZSBVTklULgorICAgICAqIFRoZSBVTklUIHN0YXJ0cyAiYXNsZWVw
LiIgV2hlbiBYZW4gaXMgcmVhZHkgZm9yIHRoZSBVTklUIHRvIHJ1biwgaXQKICAgICAgKiB3aWxs
IGNhbGwgdGhlIHZjcHVfd2FrZSBzY2hlZHVsZXIgY2FsbGJhY2sgZnVuY3Rpb24gYW5kIG91ciBz
Y2hlZHVsZXIKLSAgICAgKiB3aWxsIG1hcmsgdGhlIFZDUFUgYXdha2UuCisgICAgICogd2lsbCBt
YXJrIHRoZSBVTklUIGF3YWtlLgogICAgICAqLwotICAgIHN2Yy0+dmMgPSB2YzsKKyAgICBzdmMt
PnVuaXQgPSB1bml0OwogICAgIHN2Yy0+YXdha2UgPSAwOwotICAgIGlmICggIWlzX2lkbGVfdmNw
dSh2YykgKQotICAgICAgICBsaXN0X2FkZCgmc3ZjLT5saXN0LCAmU0NIRURfUFJJVihvcHMpLT52
Y3B1X2xpc3QpOwotICAgIHVwZGF0ZV9zY2hlZHVsZV92Y3B1cyhvcHMpOworICAgIGlmICggIWlz
X2lkbGVfdW5pdCh1bml0KSApCisgICAgICAgIGxpc3RfYWRkKCZzdmMtPmxpc3QsICZTQ0hFRF9Q
UklWKG9wcyktPnVuaXRfbGlzdCk7CisgICAgdXBkYXRlX3NjaGVkdWxlX3VuaXRzKG9wcyk7CiAK
ICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZzY2hlZF9wcml2LT5sb2NrLCBmbGFncyk7CiAK
QEAgLTQzOCw3ICs0MzcsNyBAQCBhNjUzc2NoZWRfYWxsb2NfdWRhdGEoY29uc3Qgc3RydWN0IHNj
aGVkdWxlciAqb3BzLCBzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCwKIH0KIAogLyoqCi0gKiBUaGlz
IGZ1bmN0aW9uIGZyZWVzIHNjaGVkdWxlci1zcGVjaWZpYyBWQ1BVIGRhdGEKKyAqIFRoaXMgZnVu
Y3Rpb24gZnJlZXMgc2NoZWR1bGVyLXNwZWNpZmljIFVOSVQgZGF0YQogICoKICAqIEBwYXJhbSBv
cHMgICAgICAgUG9pbnRlciB0byB0aGlzIGluc3RhbmNlIG9mIHRoZSBzY2hlZHVsZXIgc3RydWN0
dXJlCiAgKi8KQEAgLTQ0Niw3ICs0NDUsNyBAQCBzdGF0aWMgdm9pZAogYTY1M3NjaGVkX2ZyZWVf
dWRhdGEoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLCB2b2lkICpwcml2KQogewogICAgIGE2
NTNzY2hlZF9wcml2X3QgKnNjaGVkX3ByaXYgPSBTQ0hFRF9QUklWKG9wcyk7Ci0gICAgYXJpbmM2
NTNfdmNwdV90ICphdiA9IHByaXY7CisgICAgYXJpbmM2NTNfdW5pdF90ICphdiA9IHByaXY7CiAg
ICAgdW5zaWduZWQgbG9uZyBmbGFnczsKIAogICAgIGlmIChhdiA9PSBOVUxMKQpAQCAtNDU0LDE3
ICs0NTMsMTcgQEAgYTY1M3NjaGVkX2ZyZWVfdWRhdGEoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAq
b3BzLCB2b2lkICpwcml2KQogCiAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJnNjaGVkX3ByaXYtPmxv
Y2ssIGZsYWdzKTsKIAotICAgIGlmICggIWlzX2lkbGVfdmNwdShhdi0+dmMpICkKKyAgICBpZiAo
ICFpc19pZGxlX3VuaXQoYXYtPnVuaXQpICkKICAgICAgICAgbGlzdF9kZWwoJmF2LT5saXN0KTsK
IAogICAgIHhmcmVlKGF2KTsKLSAgICB1cGRhdGVfc2NoZWR1bGVfdmNwdXMob3BzKTsKKyAgICB1
cGRhdGVfc2NoZWR1bGVfdW5pdHMob3BzKTsKIAogICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUo
JnNjaGVkX3ByaXYtPmxvY2ssIGZsYWdzKTsKIH0KIAogLyoqCi0gKiBYZW4gc2NoZWR1bGVyIGNh
bGxiYWNrIGZ1bmN0aW9uIHRvIHNsZWVwIGEgVkNQVQorICogWGVuIHNjaGVkdWxlciBjYWxsYmFj
ayBmdW5jdGlvbiB0byBzbGVlcCBhIFVOSVQKICAqCiAgKiBAcGFyYW0gb3BzICAgICAgIFBvaW50
ZXIgdG8gdGhpcyBpbnN0YW5jZSBvZiB0aGUgc2NoZWR1bGVyIHN0cnVjdHVyZQogICogQHBhcmFt
IHVuaXQgICAgICBQb2ludGVyIHRvIHN0cnVjdCBzY2hlZF91bml0CkBAIC00NzIsMjEgKzQ3MSwx
OSBAQCBhNjUzc2NoZWRfZnJlZV91ZGF0YShjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHZv
aWQgKnByaXYpCiBzdGF0aWMgdm9pZAogYTY1M3NjaGVkX3VuaXRfc2xlZXAoY29uc3Qgc3RydWN0
IHNjaGVkdWxlciAqb3BzLCBzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCkKIHsKLSAgICBzdHJ1Y3Qg
dmNwdSAqdmMgPSB1bml0LT52Y3B1X2xpc3Q7Ci0KLSAgICBpZiAoIEFWQ1BVKHZjKSAhPSBOVUxM
ICkKLSAgICAgICAgQVZDUFUodmMpLT5hd2FrZSA9IDA7CisgICAgaWYgKCBBVU5JVCh1bml0KSAh
PSBOVUxMICkKKyAgICAgICAgQVVOSVQodW5pdCktPmF3YWtlID0gMDsKIAogICAgIC8qCi0gICAg
ICogSWYgdGhlIFZDUFUgYmVpbmcgcHV0IHRvIHNsZWVwIGlzIHRoZSBzYW1lIG9uZSB0aGF0IGlz
IGN1cnJlbnRseQorICAgICAqIElmIHRoZSBVTklUIGJlaW5nIHB1dCB0byBzbGVlcCBpcyB0aGUg
c2FtZSBvbmUgdGhhdCBpcyBjdXJyZW50bHkKICAgICAgKiBydW5uaW5nLCByYWlzZSBhIHNvZnRp
cnEgdG8gaW52b2tlIHRoZSBzY2hlZHVsZXIgdG8gc3dpdGNoIGRvbWFpbnMuCiAgICAgICovCi0g
ICAgaWYgKCBnZXRfc2NoZWRfcmVzKHZjLT5wcm9jZXNzb3IpLT5jdXJyID09IHVuaXQgKQotICAg
ICAgICBjcHVfcmFpc2Vfc29mdGlycSh2Yy0+cHJvY2Vzc29yLCBTQ0hFRFVMRV9TT0ZUSVJRKTsK
KyAgICBpZiAoIGdldF9zY2hlZF9yZXMoc2NoZWRfdW5pdF9tYXN0ZXIodW5pdCkpLT5jdXJyID09
IHVuaXQgKQorICAgICAgICBjcHVfcmFpc2Vfc29mdGlycShzY2hlZF91bml0X21hc3Rlcih1bml0
KSwgU0NIRURVTEVfU09GVElSUSk7CiB9CiAKIC8qKgotICogWGVuIHNjaGVkdWxlciBjYWxsYmFj
ayBmdW5jdGlvbiB0byB3YWtlIHVwIGEgVkNQVQorICogWGVuIHNjaGVkdWxlciBjYWxsYmFjayBm
dW5jdGlvbiB0byB3YWtlIHVwIGEgVU5JVAogICoKICAqIEBwYXJhbSBvcHMgICAgICAgUG9pbnRl
ciB0byB0aGlzIGluc3RhbmNlIG9mIHRoZSBzY2hlZHVsZXIgc3RydWN0dXJlCiAgKiBAcGFyYW0g
dW5pdCAgICAgIFBvaW50ZXIgdG8gc3RydWN0IHNjaGVkX3VuaXQKQEAgLTQ5NCwyNCArNDkxLDIy
IEBAIGE2NTNzY2hlZF91bml0X3NsZWVwKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgc3Ry
dWN0IHNjaGVkX3VuaXQgKnVuaXQpCiBzdGF0aWMgdm9pZAogYTY1M3NjaGVkX3VuaXRfd2FrZShj
b25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHN0cnVjdCBzY2hlZF91bml0ICp1bml0KQogewot
ICAgIHN0cnVjdCB2Y3B1ICp2YyA9IHVuaXQtPnZjcHVfbGlzdDsKKyAgICBpZiAoIEFVTklUKHVu
aXQpICE9IE5VTEwgKQorICAgICAgICBBVU5JVCh1bml0KS0+YXdha2UgPSAxOwogCi0gICAgaWYg
KCBBVkNQVSh2YykgIT0gTlVMTCApCi0gICAgICAgIEFWQ1BVKHZjKS0+YXdha2UgPSAxOwotCi0g
ICAgY3B1X3JhaXNlX3NvZnRpcnEodmMtPnByb2Nlc3NvciwgU0NIRURVTEVfU09GVElSUSk7Cisg
ICAgY3B1X3JhaXNlX3NvZnRpcnEoc2NoZWRfdW5pdF9tYXN0ZXIodW5pdCksIFNDSEVEVUxFX1NP
RlRJUlEpOwogfQogCiAvKioKLSAqIFhlbiBzY2hlZHVsZXIgY2FsbGJhY2sgZnVuY3Rpb24gdG8g
c2VsZWN0IGEgVkNQVSB0byBydW4uCisgKiBYZW4gc2NoZWR1bGVyIGNhbGxiYWNrIGZ1bmN0aW9u
IHRvIHNlbGVjdCBhIFVOSVQgdG8gcnVuLgogICogVGhpcyBpcyB0aGUgbWFpbiBzY2hlZHVsZXIg
cm91dGluZS4KICAqCiAgKiBAcGFyYW0gb3BzICAgICAgIFBvaW50ZXIgdG8gdGhpcyBpbnN0YW5j
ZSBvZiB0aGUgc2NoZWR1bGVyIHN0cnVjdHVyZQogICogQHBhcmFtIG5vdyAgICAgICBDdXJyZW50
IHRpbWUKICAqCi0gKiBAcmV0dXJuICAgICAgICAgIEFkZHJlc3Mgb2YgdGhlIFZDUFUgc3RydWN0
dXJlIHNjaGVkdWxlZCB0byBiZSBydW4gbmV4dAotICogICAgICAgICAgICAgICAgICBBbW91bnQg
b2YgdGltZSB0byBleGVjdXRlIHRoZSByZXR1cm5lZCBWQ1BVCi0gKiAgICAgICAgICAgICAgICAg
IEZsYWcgZm9yIHdoZXRoZXIgdGhlIFZDUFUgd2FzIG1pZ3JhdGVkCisgKiBAcmV0dXJuICAgICAg
ICAgIEFkZHJlc3Mgb2YgdGhlIFVOSVQgc3RydWN0dXJlIHNjaGVkdWxlZCB0byBiZSBydW4gbmV4
dAorICogICAgICAgICAgICAgICAgICBBbW91bnQgb2YgdGltZSB0byBleGVjdXRlIHRoZSByZXR1
cm5lZCBVTklUCisgKiAgICAgICAgICAgICAgICAgIEZsYWcgZm9yIHdoZXRoZXIgdGhlIFVOSVQg
d2FzIG1pZ3JhdGVkCiAgKi8KIHN0YXRpYyBzdHJ1Y3QgdGFza19zbGljZQogYTY1M3NjaGVkX2Rv
X3NjaGVkdWxlKApAQCAtNTIwLDcgKzUxNSw3IEBAIGE2NTNzY2hlZF9kb19zY2hlZHVsZSgKICAg
ICBib29sX3QgdGFza2xldF93b3JrX3NjaGVkdWxlZCkKIHsKICAgICBzdHJ1Y3QgdGFza19zbGlj
ZSByZXQ7ICAgICAgICAgICAgICAgICAgICAgIC8qIGhvbGQgdGhlIGNob3NlbiBkb21haW4gKi8K
LSAgICBzdHJ1Y3QgdmNwdSAqIG5ld190YXNrID0gTlVMTDsKKyAgICBzdHJ1Y3Qgc2NoZWRfdW5p
dCAqbmV3X3Rhc2sgPSBOVUxMOwogICAgIHN0YXRpYyB1bnNpZ25lZCBpbnQgc2NoZWRfaW5kZXgg
PSAwOwogICAgIHN0YXRpYyBzX3RpbWVfdCBuZXh0X3N3aXRjaF90aW1lOwogICAgIGE2NTNzY2hl
ZF9wcml2X3QgKnNjaGVkX3ByaXYgPSBTQ0hFRF9QUklWKG9wcyk7CkBAIC01NjUsMTQgKzU2MCwx
NCBAQCBhNjUzc2NoZWRfZG9fc2NoZWR1bGUoCiAgICAgICogc2NoZWRfdW5pdCBzdHJ1Y3R1cmUu
CiAgICAgICovCiAgICAgbmV3X3Rhc2sgPSAoc2NoZWRfaW5kZXggPCBzY2hlZF9wcml2LT5udW1f
c2NoZWR1bGVfZW50cmllcykKLSAgICAgICAgPyBzY2hlZF9wcml2LT5zY2hlZHVsZVtzY2hlZF9p
bmRleF0udmMKKyAgICAgICAgPyBzY2hlZF9wcml2LT5zY2hlZHVsZVtzY2hlZF9pbmRleF0udW5p
dAogICAgICAgICA6IElETEVUQVNLKGNwdSk7CiAKICAgICAvKiBDaGVjayB0byBzZWUgaWYgdGhl
IG5ldyB0YXNrIGNhbiBiZSBydW4gKGF3YWtlICYgcnVubmFibGUpLiAqLwogICAgIGlmICggISgo
bmV3X3Rhc2sgIT0gTlVMTCkKLSAgICAgICAgICAgJiYgKEFWQ1BVKG5ld190YXNrKSAhPSBOVUxM
KQotICAgICAgICAgICAmJiBBVkNQVShuZXdfdGFzayktPmF3YWtlCi0gICAgICAgICAgICYmIHZj
cHVfcnVubmFibGUobmV3X3Rhc2spKSApCisgICAgICAgICAgICYmIChBVU5JVChuZXdfdGFzaykg
IT0gTlVMTCkKKyAgICAgICAgICAgJiYgQVVOSVQobmV3X3Rhc2spLT5hd2FrZQorICAgICAgICAg
ICAmJiB1bml0X3J1bm5hYmxlKG5ld190YXNrKSkgKQogICAgICAgICBuZXdfdGFzayA9IElETEVU
QVNLKGNwdSk7CiAgICAgQlVHX09OKG5ld190YXNrID09IE5VTEwpOwogCkBAIC01ODQsMjEgKzU3
OSwyMSBAQCBhNjUzc2NoZWRfZG9fc2NoZWR1bGUoCiAKICAgICBzcGluX3VubG9ja19pcnFyZXN0
b3JlKCZzY2hlZF9wcml2LT5sb2NrLCBmbGFncyk7CiAKLSAgICAvKiBUYXNrbGV0IHdvcmsgKHdo
aWNoIHJ1bnMgaW4gaWRsZSBWQ1BVIGNvbnRleHQpIG92ZXJyaWRlcyBhbGwgZWxzZS4gKi8KKyAg
ICAvKiBUYXNrbGV0IHdvcmsgKHdoaWNoIHJ1bnMgaW4gaWRsZSBVTklUIGNvbnRleHQpIG92ZXJy
aWRlcyBhbGwgZWxzZS4gKi8KICAgICBpZiAoIHRhc2tsZXRfd29ya19zY2hlZHVsZWQgKQogICAg
ICAgICBuZXdfdGFzayA9IElETEVUQVNLKGNwdSk7CiAKICAgICAvKiBSdW5uaW5nIHRoaXMgdGFz
ayB3b3VsZCByZXN1bHQgaW4gYSBtaWdyYXRpb24gKi8KLSAgICBpZiAoICFpc19pZGxlX3ZjcHUo
bmV3X3Rhc2spCi0gICAgICAgICAmJiAobmV3X3Rhc2stPnByb2Nlc3NvciAhPSBjcHUpICkKKyAg
ICBpZiAoICFpc19pZGxlX3VuaXQobmV3X3Rhc2spCisgICAgICAgICAmJiAoc2NoZWRfdW5pdF9t
YXN0ZXIobmV3X3Rhc2spICE9IGNwdSkgKQogICAgICAgICBuZXdfdGFzayA9IElETEVUQVNLKGNw
dSk7CiAKICAgICAvKgogICAgICAqIFJldHVybiB0aGUgYW1vdW50IG9mIHRpbWUgdGhlIG5leHQg
ZG9tYWluIGhhcyB0byBydW4gYW5kIHRoZSBhZGRyZXNzCi0gICAgICogb2YgdGhlIHNlbGVjdGVk
IHRhc2sncyBWQ1BVIHN0cnVjdHVyZS4KKyAgICAgKiBvZiB0aGUgc2VsZWN0ZWQgdGFzaydzIFVO
SVQgc3RydWN0dXJlLgogICAgICAqLwogICAgIHJldC50aW1lID0gbmV4dF9zd2l0Y2hfdGltZSAt
IG5vdzsKLSAgICByZXQudGFzayA9IG5ld190YXNrLT5zY2hlZF91bml0OworICAgIHJldC50YXNr
ID0gbmV3X3Rhc2s7CiAgICAgcmV0Lm1pZ3JhdGVkID0gMDsKIAogICAgIEJVR19PTihyZXQudGlt
ZSA8PSAwKTsKQEAgLTYwNyw3ICs2MDIsNyBAQCBhNjUzc2NoZWRfZG9fc2NoZWR1bGUoCiB9CiAK
IC8qKgotICogWGVuIHNjaGVkdWxlciBjYWxsYmFjayBmdW5jdGlvbiB0byBzZWxlY3QgYSByZXNv
dXJjZSBmb3IgdGhlIFZDUFUgdG8gcnVuIG9uCisgKiBYZW4gc2NoZWR1bGVyIGNhbGxiYWNrIGZ1
bmN0aW9uIHRvIHNlbGVjdCBhIHJlc291cmNlIGZvciB0aGUgVU5JVCB0byBydW4gb24KICAqCiAg
KiBAcGFyYW0gb3BzICAgICAgIFBvaW50ZXIgdG8gdGhpcyBpbnN0YW5jZSBvZiB0aGUgc2NoZWR1
bGVyIHN0cnVjdHVyZQogICogQHBhcmFtIHVuaXQgICAgICBQb2ludGVyIHRvIHN0cnVjdCBzY2hl
ZF91bml0CkBAIC02MTgsMjEgKzYxMywyMCBAQCBzdGF0aWMgc3RydWN0IHNjaGVkX3Jlc291cmNl
ICoKIGE2NTNzY2hlZF9waWNrX3Jlc291cmNlKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywK
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBzY2hlZF91bml0ICp1bml0KQog
ewotICAgIHN0cnVjdCB2Y3B1ICp2YyA9IHVuaXQtPnZjcHVfbGlzdDsKICAgICBjcHVtYXNrX3Qg
Km9ubGluZTsKICAgICB1bnNpZ25lZCBpbnQgY3B1OwogCi0gICAgLyogCi0gICAgICogSWYgcHJl
c2VudCwgcHJlZmVyIHZjJ3MgY3VycmVudCBwcm9jZXNzb3IsIGVsc2UKLSAgICAgKiBqdXN0IGZp
bmQgdGhlIGZpcnN0IHZhbGlkIHZjcHUgLgorICAgIC8qCisgICAgICogSWYgcHJlc2VudCwgcHJl
ZmVyIHVuaXQncyBjdXJyZW50IHByb2Nlc3NvciwgZWxzZQorICAgICAqIGp1c3QgZmluZCB0aGUg
Zmlyc3QgdmFsaWQgdW5pdC4KICAgICAgKi8KLSAgICBvbmxpbmUgPSBjcHVwb29sX2RvbWFpbl9j
cHVtYXNrKHZjLT5kb21haW4pOworICAgIG9ubGluZSA9IGNwdXBvb2xfZG9tYWluX2NwdW1hc2so
dW5pdC0+ZG9tYWluKTsKIAogICAgIGNwdSA9IGNwdW1hc2tfZmlyc3Qob25saW5lKTsKIAotICAg
IGlmICggY3B1bWFza190ZXN0X2NwdSh2Yy0+cHJvY2Vzc29yLCBvbmxpbmUpCisgICAgaWYgKCBj
cHVtYXNrX3Rlc3RfY3B1KHNjaGVkX3VuaXRfbWFzdGVyKHVuaXQpLCBvbmxpbmUpCiAgICAgICAg
ICB8fCAoY3B1ID49IG5yX2NwdV9pZHMpICkKLSAgICAgICAgY3B1ID0gdmMtPnByb2Nlc3NvcjsK
KyAgICAgICAgY3B1ID0gc2NoZWRfdW5pdF9tYXN0ZXIodW5pdCk7CiAKICAgICByZXR1cm4gZ2V0
X3NjaGVkX3JlcyhjcHUpOwogfQpAQCAtNjQzLDE4ICs2MzcsMTggQEAgYTY1M3NjaGVkX3BpY2tf
cmVzb3VyY2UoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLAogICogQHBhcmFtIG5ld19vcHMg
ICBQb2ludGVyIHRvIHRoaXMgaW5zdGFuY2Ugb2YgdGhlIHNjaGVkdWxlciBzdHJ1Y3R1cmUKICAq
IEBwYXJhbSBjcHUgICAgICAgVGhlIGNwdSB0aGF0IGlzIGNoYW5naW5nIHNjaGVkdWxlcgogICog
QHBhcmFtIHBkYXRhICAgICBzY2hlZHVsZXIgc3BlY2lmaWMgUENQVSBkYXRhICh3ZSBkb24ndCBo
YXZlIGFueSkKLSAqIEBwYXJhbSB2ZGF0YSAgICAgc2NoZWR1bGVyIHNwZWNpZmljIFZDUFUgZGF0
YSBvZiB0aGUgaWRsZSB2Y3B1CisgKiBAcGFyYW0gdmRhdGEgICAgIHNjaGVkdWxlciBzcGVjaWZp
YyBVTklUIGRhdGEgb2YgdGhlIGlkbGUgdW5pdAogICovCiBzdGF0aWMgc3BpbmxvY2tfdCAqCiBh
NjUzX3N3aXRjaF9zY2hlZChzdHJ1Y3Qgc2NoZWR1bGVyICpuZXdfb3BzLCB1bnNpZ25lZCBpbnQg
Y3B1LAogICAgICAgICAgICAgICAgICAgdm9pZCAqcGRhdGEsIHZvaWQgKnZkYXRhKQogewogICAg
IHN0cnVjdCBzY2hlZF9yZXNvdXJjZSAqc3IgPSBnZXRfc2NoZWRfcmVzKGNwdSk7Ci0gICAgYXJp
bmM2NTNfdmNwdV90ICpzdmMgPSB2ZGF0YTsKKyAgICBhcmluYzY1M191bml0X3QgKnN2YyA9IHZk
YXRhOwogCi0gICAgQVNTRVJUKCFwZGF0YSAmJiBzdmMgJiYgaXNfaWRsZV92Y3B1KHN2Yy0+dmMp
KTsKKyAgICBBU1NFUlQoIXBkYXRhICYmIHN2YyAmJiBpc19pZGxlX3VuaXQoc3ZjLT51bml0KSk7
CiAKLSAgICBpZGxlX3ZjcHVbY3B1XS0+c2NoZWRfdW5pdC0+cHJpdiA9IHZkYXRhOworICAgIHNj
aGVkX2lkbGVfdW5pdChjcHUpLT5wcml2ID0gdmRhdGE7CiAKICAgICByZXR1cm4gJnNyLT5fbG9j
azsKIH0KLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
