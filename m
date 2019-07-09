Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D05DC638AD
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2019 17:31:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hks37-0003g1-PB; Tue, 09 Jul 2019 15:28:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BVIN=VG=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hks36-0003fw-DQ
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2019 15:28:56 +0000
X-Inumbo-ID: 4163b1f4-a25e-11e9-bcc5-2f39246d5fa5
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4163b1f4-a25e-11e9-bcc5-2f39246d5fa5;
 Tue, 09 Jul 2019 15:28:52 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: X9PVLOT/nknk00784RoO81mAL54xyeGww4xKJVQ5ldU1NMTWoRpSQE5FrTcFYgt8t25ybsgiTC
 lAVUymh9OydxWLHAo0LccrvJYNKFo3i+Ueb1YEpcq3OqSqHf4WD55vApLXS2pMgrwvzs8eKYl1
 miouuI1l60CXF68fgXhrAp0E19J4ywNU5vMNE0jH8XsqgmtufhVBhgTCIIJAostynqLXiVdsMu
 fpTBB/jnzfFPh14hNAAQ4HgSOGYcC3tymytISkSciyw8MwghXHUXJ0t1X1ejgP0RaMUwH+MNfH
 4A8=
X-SBRS: 2.7
X-MesageID: 2812807
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,470,1557201600"; 
   d="scan'208";a="2812807"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 9 Jul 2019 16:28:45 +0100
Message-ID: <20190709152845.18217-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190709152845.18217-1-andrew.cooper3@citrix.com>
References: <20190709152845.18217-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/2] tools/xenstored: Drop mapping of the ring
 via foreign map
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyBhIHZlc3RpZ2lhbCByZW1uZW50IG9mIHRoZSBwcmUgeGVuc3RvcmVkIHN0dWIgZG9t
YWluIGRheXMuCgpGb3JlaWduIG1hcHBpbmcgdmlhIE1GTiBpcyBhIHByaXZpbGVnZWQgb3BlcmF0
aW9uIHdoaWNoIGlzIG5vdApuZWNlc3NhcnksIGJlY2F1c2UgZ3JhbnQgZGV0YWlscyBhcmUgdW5j
b25kaXRpb25hbGx5IHNldCB1cCBkdXJpbmcKZG9tYWluIGNvbnN0cnVjdGlvbi4gIEluIHByYWN0
aWNlLCB0aGlzIG1lYW5zIHhlbnN0b3JlZCBuZXZlciB1c2VzIGl0cwphYmlsaXR5IHRvIGZvcmVp
Z24gbWFwIHRoZSByaW5nLgoKRHJvcCB0aGUgYWJpbGl0eSBjb21wbGV0ZWx5LCB3aGljaCByZW1v
dmVzIHRoZSBwZW51bHRpbWF0ZSB1c2Ugb2YgdGhlCnVuc3RhYmxlIGxpYnhjIGludGVyZmFjZS4K
ClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
Ci0tLQpDQzogSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+CkNDOiBXZWkgTGl1
IDx3ZWkubGl1MkBjaXRyaXguY29tPgpDQzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PgotLS0KIHRvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9kb21haW4uYyB8IDIyICsrKysrKystLS0t
LS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9kb21haW4uYyBiL3Rv
b2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9kb21haW4uYwppbmRleCA0NjNlYmJhNjQzLi5jNzkzNTQz
YmI0IDEwMDY0NAotLS0gYS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfZG9tYWluLmMKKysrIGIv
dG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2RvbWFpbi5jCkBAIC0xNzEsMjQgKzE3MSwxNiBAQCBz
dGF0aWMgaW50IHJlYWRjaG4oc3RydWN0IGNvbm5lY3Rpb24gKmNvbm4sIHZvaWQgKmRhdGEsIHVu
c2lnbmVkIGludCBsZW4pCiAJcmV0dXJuIGxlbjsKIH0KIAotc3RhdGljIHZvaWQgKm1hcF9pbnRl
cmZhY2UoZG9taWRfdCBkb21pZCwgdW5zaWduZWQgbG9uZyBtZm4pCi17Ci0JaWYgKCp4Z3RfaGFu
ZGxlICE9IE5VTEwpIHsKLQkJLyogdGhpcyBpcyB0aGUgcHJlZmVycmVkIG1ldGhvZCAqLwotCQly
ZXR1cm4geGVuZ250dGFiX21hcF9ncmFudF9yZWYoKnhndF9oYW5kbGUsIGRvbWlkLAotCQkJR05U
VEFCX1JFU0VSVkVEX1hFTlNUT1JFLCBQUk9UX1JFQUR8UFJPVF9XUklURSk7Ci0JfSBlbHNlIHsK
LQkJcmV0dXJuIHhjX21hcF9mb3JlaWduX3JhbmdlKCp4Y19oYW5kbGUsIGRvbWlkLAotCQkJWENf
UEFHRV9TSVpFLCBQUk9UX1JFQUR8UFJPVF9XUklURSwgbWZuKTsKLQl9CitzdGF0aWMgdm9pZCAq
bWFwX2ludGVyZmFjZShkb21pZF90IGRvbWlkKQoreworCXJldHVybiB4ZW5nbnR0YWJfbWFwX2dy
YW50X3JlZigqeGd0X2hhbmRsZSwgZG9taWQsCisJCQkJICAgICAgIEdOVFRBQl9SRVNFUlZFRF9Y
RU5TVE9SRSwKKwkJCQkgICAgICAgUFJPVF9SRUFEfFBST1RfV1JJVEUpOwogfQogCiBzdGF0aWMg
dm9pZCB1bm1hcF9pbnRlcmZhY2Uodm9pZCAqaW50ZXJmYWNlKQogewotCWlmICgqeGd0X2hhbmRs
ZSAhPSBOVUxMKQotCQl4ZW5nbnR0YWJfdW5tYXAoKnhndF9oYW5kbGUsIGludGVyZmFjZSwgMSk7
Ci0JZWxzZQotCQltdW5tYXAoaW50ZXJmYWNlLCBYQ19QQUdFX1NJWkUpOworCXhlbmdudHRhYl91
bm1hcCgqeGd0X2hhbmRsZSwgaW50ZXJmYWNlLCAxKTsKIH0KIAogc3RhdGljIGludCBkZXN0cm95
X2RvbWFpbih2b2lkICpfZG9tYWluKQpAQCAtMzk2LDcgKzM4OCw3IEBAIGludCBkb19pbnRyb2R1
Y2Uoc3RydWN0IGNvbm5lY3Rpb24gKmNvbm4sIHN0cnVjdCBidWZmZXJlZF9kYXRhICppbikKIAlk
b21haW4gPSBmaW5kX2RvbWFpbl9ieV9kb21pZChkb21pZCk7CiAKIAlpZiAoZG9tYWluID09IE5V
TEwpIHsKLQkJaW50ZXJmYWNlID0gbWFwX2ludGVyZmFjZShkb21pZCwgbWZuKTsKKwkJaW50ZXJm
YWNlID0gbWFwX2ludGVyZmFjZShkb21pZCk7CiAJCWlmICghaW50ZXJmYWNlKQogCQkJcmV0dXJu
IGVycm5vOwogCQkvKiBIYW5nIGRvbWFpbiBvZmYgImluIiB1bnRpbCB3ZSdyZSBmaW5pc2hlZC4g
Ki8KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
