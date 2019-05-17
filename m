Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A31E21E1C
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 21:20:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRiMB-0001DC-RR; Fri, 17 May 2019 19:17:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gdXm=TR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hRiM9-0001D7-Oc
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 19:17:25 +0000
X-Inumbo-ID: 64ea7b80-78d8-11e9-b330-9bf8a6f72940
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 64ea7b80-78d8-11e9-b330-9bf8a6f72940;
 Fri, 17 May 2019 19:17:21 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=SoftFail smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: pecJQ6HQrDz2H5t19OpI+qWHpkB4vHMV/120t1EepMEukaapNZdfPaI2SmjQFTzA6NZr+P3d7m
 Yy6hNJZFFjITqh78YFX/gw6YlNaVUEZ3BGFiAoqujav705bCqkAFdW2Egbfaina4Z6KbOaoeH1
 2X4R1EmSENJuyT8IdSMTf7XamGfa/nX872CHnlbIFvqv4hr1A0JyeWQywURJxeefT63ukokPLu
 eJkVJRhDtxqwgU+H70SaGNt1A0d4vv2IkztWOYgo3QHr4Ozk2zaMUpwniE/8j6WjIw3IpHey4E
 fs0=
X-SBRS: 2.7
X-MesageID: 588085
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,481,1549947600"; 
   d="scan'208";a="588085"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 17 May 2019 20:17:18 +0100
Message-ID: <1558120638-3610-1-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen/boot: Print the build-id along with the
 changeset information
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHVyaW5nIGluaXRjYWxscyBpcyBvaywgYnV0IGlzIGEgcmF0aGVyIHJhbmRvbSBwbGFjZSB0byBm
aW5kIHRoZSBidWlsZC1pZDoKCiAgKFhFTikgUGFya2VkIDIgQ1BVcwogIChYRU4pIGJ1aWxkLWlk
OiA3ZmYwNWY3OGViYzgxNDEwMDBiOWZlZWU0MzcwYTQwOGJkOTM1ZGVjCiAgKFhFTikgUnVubmlu
ZyBzdHViIHJlY292ZXJ5IHNlbGZ0ZXN0cy4uLgoKTG9naWNhbGx5LCBpdCBpcyB2ZXJzaW9uIGlu
Zm9ybWF0aW9uLCBzbyBwcmludCB3aXRoIHRoZSBjaGFuZ2VzZXQgaW5mb3JtYXRpb24KaW4gY29u
c29sZV9pbml0X3ByZWlycSgpOgoKICAoWEVOKSBYZW4gdmVyc2lvbiA0LjEzLXVuc3RhYmxlIChh
bmRyZXdjb29wQGFuZHJlY29vcCkgKGdjYyAoRGViaWFuIDQuOS4yLTEwK2RlYjh1MikgNC45LjIp
IGRlYnVnPXkgIEZyaSBBcHIgMTIgMTg6MjQ6NTIgQlNUIDIwMTkKICAoWEVOKSBMYXRlc3QgQ2hh
bmdlU2V0OiBGcmkgQXByIDUgMTQ6Mzk6NDIgMjAxOSBnaXQ6ZmM2YzdhZS1kaXJ0eQogIChYRU4p
IGJ1aWxkLWlkOiA3ZmYwNWY3OGViYzgxNDEwMDBiOWZlZWU0MzcwYTQwOGJkOTM1ZGVjCiAgKFhF
TikgUFZIIHN0YXJ0IGluZm86IChwYSAwMDAwZmZjMCkKCk5vdGhpbmcgaGFzIGV2ZXIgY2FyZWQg
YWJvdXQgeGVuX2J1aWxkX2luaXQoKSdzIHJldHVybiB2YWx1ZSwgc28gY29udmVydCBpdCB0bwp2
b2lkIHJhdGhlciB0aGFuIGluY2x1ZGUgZXJybm8uaCBpbnRvIHRoZSAhQlVJTERfSUQgY2FzZSBv
ZiB2ZXJzaW9uLmgKClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzog
V2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgpDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPgpDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCiB4ZW4v
Y29tbW9uL3ZlcnNpb24uYyAgICAgICB8IDkgKysrLS0tLS0tCiB4ZW4vZHJpdmVycy9jaGFyL2Nv
bnNvbGUuYyB8IDMgKysrCiB4ZW4vaW5jbHVkZS94ZW4vdmVyc2lvbi5oICB8IDMgKysrCiAzIGZp
bGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS94ZW4vY29tbW9uL3ZlcnNpb24uYyBiL3hlbi9jb21tb24vdmVyc2lvbi5jCmluZGV4IDIyM2Ni
NTIuLjkzN2ViMTIgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vdmVyc2lvbi5jCisrKyBiL3hlbi9j
b21tb24vdmVyc2lvbi5jCkBAIC0xNDAsNyArMTQwLDcgQEAgc3RydWN0IGN2X2luZm9fcGRiNzAK
ICAgICBjaGFyIHBkYl9maWxlbmFtZVtdOwogfTsKIAotc3RhdGljIGludCBfX2luaXQgeGVuX2J1
aWxkX2luaXQodm9pZCkKK3ZvaWQgX19pbml0IHhlbl9idWlsZF9pbml0KHZvaWQpCiB7CiAgICAg
Y29uc3QgRWxmX05vdGUgKm4gPSBfX25vdGVfZ251X2J1aWxkX2lkX3N0YXJ0OwogICAgIHVuc2ln
bmVkIGludCBzejsKQEAgLTE0OCwxMSArMTQ4LDExIEBAIHN0YXRpYyBpbnQgX19pbml0IHhlbl9i
dWlsZF9pbml0KHZvaWQpCiAKICAgICAvKiAtLWJ1aWxkLWlkIGludm9rZWQgd2l0aCB3cm9uZyBw
YXJhbWV0ZXJzLiAqLwogICAgIGlmICggX19ub3RlX2dudV9idWlsZF9pZF9lbmQgPD0gJm5bMF0g
KQotICAgICAgICByZXR1cm4gLUVOT0RBVEE7CisgICAgICAgIHJldHVybjsKIAogICAgIC8qIENo
ZWNrIGZvciBmdWxsIE5vdGUgaGVhZGVyLiAqLwogICAgIGlmICggJm5bMV0gPj0gX19ub3RlX2du
dV9idWlsZF9pZF9lbmQgKQotICAgICAgICByZXR1cm4gLUVOT0RBVEE7CisgICAgICAgIHJldHVy
bjsKIAogICAgIHN6ID0gKHZvaWQgKilfX25vdGVfZ251X2J1aWxkX2lkX2VuZCAtICh2b2lkICop
bjsKIApAQCAtMTg4LDEwICsxODgsNyBAQCBzdGF0aWMgaW50IF9faW5pdCB4ZW5fYnVpbGRfaW5p
dCh2b2lkKQogI2VuZGlmCiAgICAgaWYgKCAhcmMgKQogICAgICAgICBwcmludGsoWEVOTE9HX0lO
Rk8gImJ1aWxkLWlkOiAlKnBoTlxuIiwgYnVpbGRfaWRfbGVuLCBidWlsZF9pZF9wKTsKLQotICAg
IHJldHVybiByYzsKIH0KLV9faW5pdGNhbGwoeGVuX2J1aWxkX2luaXQpOwogI2VuZGlmCiAvKgog
ICogTG9jYWwgdmFyaWFibGVzOgpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvY2hhci9jb25zb2xl
LmMgYi94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYwppbmRleCA5YmJjYjBmLi4zOGVjZDljIDEw
MDY0NAotLS0gYS94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYworKysgYi94ZW4vZHJpdmVycy9j
aGFyL2NvbnNvbGUuYwpAQCAtOTM0LDYgKzkzNCw5IEBAIHZvaWQgX19pbml0IGNvbnNvbGVfaW5p
dF9wcmVpcnEodm9pZCkKICAgICAgICAgICAgeGVuX2NvbXBpbGVyKCksIGRlYnVnX2J1aWxkKCkg
PyAneScgOiAnbicsIHhlbl9jb21waWxlX2RhdGUoKSk7CiAgICAgcHJpbnRrKCJMYXRlc3QgQ2hh
bmdlU2V0OiAlc1xuIiwgeGVuX2NoYW5nZXNldCgpKTsKIAorICAgIC8qIExvY2F0ZSBhbmQgcHJp
bnQgdGhlIGJ1aWxkaWQsIGlmIGFwcGxpY2FibGUuICovCisgICAgeGVuX2J1aWxkX2luaXQoKTsK
KwogICAgIGlmICggb3B0X3N5bmNfY29uc29sZSApCiAgICAgewogICAgICAgICBzZXJpYWxfc3Rh
cnRfc3luYyhzZXJjb25faGFuZGxlKTsKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi92ZXJz
aW9uLmggYi94ZW4vaW5jbHVkZS94ZW4vdmVyc2lvbi5oCmluZGV4IDk3YzI0N2EuLjlhYzkyNmQg
MTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi92ZXJzaW9uLmgKKysrIGIveGVuL2luY2x1ZGUv
eGVuL3ZlcnNpb24uaApAQCAtMTksOCArMTksMTEgQEAgY29uc3QgY2hhciAqeGVuX2Rlbnkodm9p
ZCk7CiBpbnQgeGVuX2J1aWxkX2lkKGNvbnN0IHZvaWQgKipwLCB1bnNpZ25lZCBpbnQgKmxlbik7
CiAKICNpZmRlZiBCVUlMRF9JRAordm9pZCB4ZW5fYnVpbGRfaW5pdCh2b2lkKTsKIGludCB4ZW5f
YnVpbGRfaWRfY2hlY2soY29uc3QgRWxmX05vdGUgKm4sIHVuc2lnbmVkIGludCBuX3N6LAogICAg
ICAgICAgICAgICAgICAgICAgICBjb25zdCB2b2lkICoqcCwgdW5zaWduZWQgaW50ICpsZW4pOwor
I2Vsc2UKK3N0YXRpYyBpbmxpbmUgdm9pZCB4ZW5fYnVpbGRfaW5pdCh2b2lkKSB7fTsKICNlbmRp
ZgogCiAjZW5kaWYgLyogX19YRU5fVkVSU0lPTl9IX18gKi8KLS0gCjIuMS40CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
