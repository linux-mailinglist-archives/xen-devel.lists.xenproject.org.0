Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C50FF4E3EF
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 11:39:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heFyW-0007dr-Ne; Fri, 21 Jun 2019 09:36:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Mzu6=UU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1heFyV-0007d6-5M
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 09:36:51 +0000
X-Inumbo-ID: 179222cf-9408-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 179222cf-9408-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 09:36:48 +0000 (UTC)
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
IronPort-SDR: 3QsXQ6UzxZ/RsFpDjPTRe2PUn5cTdhX1EEzut9HBlL95JtYSfIkKhdGiuXC43NDldRLzDrz3FW
 Gye4FySDBB7WLH+FCc5E4rw78koryUxtV4jmr5i+JMFphnSVCiRK+oq7C4gn39rbfHcHNVVV9+
 g+FWRIgQhDSnCFCXYoFqlGvoTxCrVSwFPz21TLrHOVIFX1UuOAMo4W1dmUUjIsqNGHD155386n
 bl1ayci2B6AyZszy+10iphFG0PGqXnUaWMZnsRAa0FxWnf5jQCEjR2fZeEpYCeUV1oo+aYU2IE
 hZ0=
X-SBRS: 2.7
X-MesageID: 2072494
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,399,1557201600"; 
   d="scan'208";a="2072494"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 21 Jun 2019 10:36:35 +0100
Message-ID: <1561109798-8744-3-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1561109798-8744-1-git-send-email-andrew.cooper3@citrix.com>
References: <1561109798-8744-1-git-send-email-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/5] xen/gnttab: Reduce code volume when using
 union grant_combo
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgaXMgbm8gbmVlZCBmb3IgJ3N0cnVjdCB7IC4uLiB9IHNob3J0cycgdG8gYmUgbmFtZWQu
ICBDb252ZXJ0IGl0IHRvIGJlaW5nCmFuIGFub255bW91cyBzdHJ1Y3QsIGFuZCByZW5hbWUgJ3dv
cmQnIHRvIHRoZSBtb3JlIGNvbW1vbiAncmF3Jy4KCkZvciBfc2V0X3N0YXR1c192MSgpIGFuZCBn
bnR0YWJfcHJlcGFyZV9mb3JfdHJhbnNmZXIoKSB3aGljaCB1c2UgYSBib3VuZGVkCmNtcHhjaGcg
bG9vcCwgcmVuYW1lIHtwcmV2LG5ld31fc2NvbWJvIHRvIHtwcmV2LG5ld30gYW5kIHJlZHVjZSB0
aGVpciBzY29wZSB0bwp3aXRoaW4gdGhlIGxvb3AuCgpGb3IgX3NldF9zdGF0dXNfdjIoKSwgdGhl
IGZsYWdzIGFuZCBpZCB2YXJpYWJsZXMgYXJlIGNvbXBsZXRlbHkgdW5uZWNlc3NhcnkuCkRyb3Ag
dGhlbS4KCk5vIGZ1bmN0aW9uYWwgY2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkNDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+CkNDOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpD
QzogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBldS5jaXRyaXguY29tPgotLS0KIHhlbi9j
b21tb24vZ3JhbnRfdGFibGUuYyB8IDkxICsrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQxIGluc2VydGlvbnMoKyksIDUwIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYyBiL3hlbi9j
b21tb24vZ3JhbnRfdGFibGUuYwppbmRleCBlNWQ1ODVmLi42ZDhmMTdkIDEwMDY0NAotLS0gYS94
ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMKKysrIGIveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCkBA
IC0xNDQsMTEgKzE0NCwxMSBAQCBjdXN0b21fcGFyYW0oImdudHRhYiIsIHBhcnNlX2dudHRhYik7
CiAgKiBUaGUgZm9sbG93aW5nIHVuaW9uIGFsbG93cyB0aGF0IHRvIGhhcHBlbiBpbiBhbiBlbmRp
YW4tbmV1dHJhbCBmYXNoaW9uLgogICovCiB1bmlvbiBncmFudF9jb21ibyB7Ci0gICAgdWludDMy
X3Qgd29yZDsKKyAgICB1aW50MzJfdCByYXc7CiAgICAgc3RydWN0IHsKICAgICAgICAgdWludDE2
X3QgZmxhZ3M7CiAgICAgICAgIGRvbWlkX3QgIGRvbWlkOwotICAgIH0gc2hvcnRzOworICAgIH07
CiB9OwogCiAvKiBVc2VkIHRvIHNoYXJlIGNvZGUgYmV0d2VlbiB1bm1hcF9ncmFudF9yZWYgYW5k
IHVubWFwX2FuZF9yZXBsYWNlLiAqLwpAQCAtNjgwLDcgKzY4MCw3IEBAIHN0YXRpYyBpbnQgX3Nl
dF9zdGF0dXNfdjEoY29uc3QgZ3JhbnRfZW50cnlfaGVhZGVyX3QgKnNoYWgsCiB7CiAgICAgaW50
IHJjID0gR05UU1Rfb2theTsKICAgICB1aW50MzJfdCAqcmF3X3NoYWggPSAodWludDMyX3QgKilz
aGFoOwotICAgIHVuaW9uIGdyYW50X2NvbWJvIHNjb21ibywgcHJldl9zY29tYm8sIG5ld19zY29t
Ym87CisgICAgdW5pb24gZ3JhbnRfY29tYm8gc2NvbWJvOwogICAgIHVpbnQxNl90IG1hc2sgPSBH
VEZfdHlwZV9tYXNrOwogCiAgICAgLyoKQEAgLTY5OCw3ICs2OTgsNyBAQCBzdGF0aWMgaW50IF9z
ZXRfc3RhdHVzX3YxKGNvbnN0IGdyYW50X2VudHJ5X2hlYWRlcl90ICpzaGFoLAogICAgIGlmICgg
bWFwZmxhZyApCiAgICAgICAgIG1hc2sgfD0gR1RGX3N1Yl9wYWdlOwogCi0gICAgc2NvbWJvLndv
cmQgPSBBQ0NFU1NfT05DRSgqcmF3X3NoYWgpOworICAgIHNjb21iby5yYXcgPSBBQ0NFU1NfT05D
RSgqcmF3X3NoYWgpOwogCiAgICAgLyoKICAgICAgKiBUaGlzIGxvb3AgYXR0ZW1wdHMgdG8gc2V0
IHRoZSBhY2Nlc3MgKHJlYWRpbmcvd3JpdGluZykgZmxhZ3MKQEAgLTcwOCwzNyArNzA4LDM1IEBA
IHN0YXRpYyBpbnQgX3NldF9zdGF0dXNfdjEoY29uc3QgZ3JhbnRfZW50cnlfaGVhZGVyX3QgKnNo
YWgsCiAgICAgICovCiAgICAgZm9yICggOyA7ICkKICAgICB7CisgICAgICAgIHVuaW9uIGdyYW50
X2NvbWJvIHByZXYsIG5ldzsKKwogICAgICAgICAvKiBJZiBub3QgYWxyZWFkeSBwaW5uZWQsIGNo
ZWNrIHRoZSBncmFudCBkb21pZCBhbmQgdHlwZS4gKi8KLSAgICAgICAgaWYgKCAhYWN0LT5waW4g
JiYKLSAgICAgICAgICAgICAoKChzY29tYm8uc2hvcnRzLmZsYWdzICYgbWFzaykgIT0KLSAgICAg
ICAgICAgICAgIEdURl9wZXJtaXRfYWNjZXNzKSB8fAotICAgICAgICAgICAgICAoc2NvbWJvLnNo
b3J0cy5kb21pZCAhPSBsZG9taWQpKSApCisgICAgICAgIGlmICggIWFjdC0+cGluICYmICgoKHNj
b21iby5mbGFncyAmIG1hc2spICE9IEdURl9wZXJtaXRfYWNjZXNzKSB8fAorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgKHNjb21iby5kb21pZCAhPSBsZG9taWQpKSApCiAgICAgICAgICAgICBQ
SU5fRkFJTChkb25lLCBHTlRTVF9nZW5lcmFsX2Vycm9yLAogICAgICAgICAgICAgICAgICAgICAg
IkJhZCBmbGFncyAoJXgpIG9yIGRvbSAoJWQpOyBleHBlY3RlZCBkJWRcbiIsCi0gICAgICAgICAg
ICAgICAgICAgICBzY29tYm8uc2hvcnRzLmZsYWdzLCBzY29tYm8uc2hvcnRzLmRvbWlkLAotICAg
ICAgICAgICAgICAgICAgICAgbGRvbWlkKTsKKyAgICAgICAgICAgICAgICAgICAgIHNjb21iby5m
bGFncywgc2NvbWJvLmRvbWlkLCBsZG9taWQpOwogCi0gICAgICAgIG5ld19zY29tYm8gPSBzY29t
Ym87Ci0gICAgICAgIG5ld19zY29tYm8uc2hvcnRzLmZsYWdzIHw9IEdURl9yZWFkaW5nOworICAg
ICAgICBuZXcgPSBzY29tYm87CisgICAgICAgIG5ldy5mbGFncyB8PSBHVEZfcmVhZGluZzsKIAog
ICAgICAgICBpZiAoICFyZWFkb25seSApCiAgICAgICAgIHsKLSAgICAgICAgICAgIG5ld19zY29t
Ym8uc2hvcnRzLmZsYWdzIHw9IEdURl93cml0aW5nOwotICAgICAgICAgICAgaWYgKCB1bmxpa2Vs
eShzY29tYm8uc2hvcnRzLmZsYWdzICYgR1RGX3JlYWRvbmx5KSApCisgICAgICAgICAgICBuZXcu
ZmxhZ3MgfD0gR1RGX3dyaXRpbmc7CisgICAgICAgICAgICBpZiAoIHVubGlrZWx5KHNjb21iby5m
bGFncyAmIEdURl9yZWFkb25seSkgKQogICAgICAgICAgICAgICAgIFBJTl9GQUlMKGRvbmUsIEdO
VFNUX2dlbmVyYWxfZXJyb3IsCiAgICAgICAgICAgICAgICAgICAgICAgICAgIkF0dGVtcHQgdG8g
d3JpdGUtcGluIGEgci9vIGdyYW50IGVudHJ5XG4iKTsKICAgICAgICAgfQogCi0gICAgICAgIHBy
ZXZfc2NvbWJvLndvcmQgPSBndWVzdF9jbXB4Y2hnKHJkLCByYXdfc2hhaCwKLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2NvbWJvLndvcmQsIG5ld19zY29tYm8ud29y
ZCk7Ci0gICAgICAgIGlmICggbGlrZWx5KHByZXZfc2NvbWJvLndvcmQgPT0gc2NvbWJvLndvcmQp
ICkKKyAgICAgICAgcHJldi5yYXcgPSBndWVzdF9jbXB4Y2hnKHJkLCByYXdfc2hhaCwgc2NvbWJv
LnJhdywgbmV3LnJhdyk7CisgICAgICAgIGlmICggbGlrZWx5KHByZXYucmF3ID09IHNjb21iby5y
YXcpICkKICAgICAgICAgICAgIGJyZWFrOwogCiAgICAgICAgIGlmICggcmV0cmllcysrID09IDQg
KQogICAgICAgICAgICAgUElOX0ZBSUwoZG9uZSwgR05UU1RfZ2VuZXJhbF9lcnJvciwKICAgICAg
ICAgICAgICAgICAgICAgICJTaGFyZWQgZ3JhbnQgZW50cnkgaXMgdW5zdGFibGVcbiIpOwogCi0g
ICAgICAgIHNjb21ibyA9IHByZXZfc2NvbWJvOworICAgICAgICBzY29tYm8gPSBwcmV2OwogICAg
IH0KIAogZG9uZToKQEAgLTc1NiwxMyArNzU0LDkgQEAgc3RhdGljIGludCBfc2V0X3N0YXR1c192
Mihjb25zdCBncmFudF9lbnRyeV9oZWFkZXJfdCAqc2hhaCwKICAgICBpbnQgICAgICByYyAgICA9
IEdOVFNUX29rYXk7CiAgICAgdWludDMyX3QgKnJhd19zaGFoID0gKHVpbnQzMl90ICopc2hhaDsK
ICAgICB1bmlvbiBncmFudF9jb21ibyBzY29tYm87Ci0gICAgdWludDE2X3QgZmxhZ3MgPSBzaGFo
LT5mbGFnczsKLSAgICBkb21pZF90ICBpZCAgICA9IHNoYWgtPmRvbWlkOwogICAgIHVpbnQxNl90
IG1hc2sgID0gR1RGX3R5cGVfbWFzazsKIAotICAgIHNjb21iby53b3JkID0gQUNDRVNTX09OQ0Uo
KnJhd19zaGFoKTsKLSAgICBmbGFncyA9IHNjb21iby5zaG9ydHMuZmxhZ3M7Ci0gICAgaWQgPSBz
Y29tYm8uc2hvcnRzLmRvbWlkOworICAgIHNjb21iby5yYXcgPSBBQ0NFU1NfT05DRSgqcmF3X3No
YWgpOwogCiAgICAgLyogaWYgdGhpcyBpcyBhIGdyYW50IG1hcHBpbmcgb3BlcmF0aW9uIHdlIHNo
b3VsZCBlbnN1cmUgR1RGX3N1Yl9wYWdlCiAgICAgICAgaXMgbm90IHNldCAqLwpAQCAtNzcwLDEz
ICs3NjQsMTIgQEAgc3RhdGljIGludCBfc2V0X3N0YXR1c192Mihjb25zdCBncmFudF9lbnRyeV9o
ZWFkZXJfdCAqc2hhaCwKICAgICAgICAgbWFzayB8PSBHVEZfc3ViX3BhZ2U7CiAKICAgICAvKiBJ
ZiBub3QgYWxyZWFkeSBwaW5uZWQsIGNoZWNrIHRoZSBncmFudCBkb21pZCBhbmQgdHlwZS4gKi8K
LSAgICBpZiAoICFhY3QtPnBpbiAmJgotICAgICAgICAgKCAoKChmbGFncyAmIG1hc2spICE9IEdU
Rl9wZXJtaXRfYWNjZXNzKSAmJgotICAgICAgICAgICAgKChmbGFncyAmIG1hc2spICE9IEdURl90
cmFuc2l0aXZlKSkgfHwKLSAgICAgICAgICAoaWQgIT0gbGRvbWlkKSkgKQorICAgIGlmICggIWFj
dC0+cGluICYmICgoKChzY29tYm8uZmxhZ3MgJiBtYXNrKSAhPSBHVEZfcGVybWl0X2FjY2Vzcykg
JiYKKyAgICAgICAgICAgICAgICAgICAgICAgICgoc2NvbWJvLmZsYWdzICYgbWFzaykgIT0gR1RG
X3RyYW5zaXRpdmUpKSB8fAorICAgICAgICAgICAgICAgICAgICAgICAoc2NvbWJvLmRvbWlkICE9
IGxkb21pZCkpICkKICAgICAgICAgUElOX0ZBSUwoZG9uZSwgR05UU1RfZ2VuZXJhbF9lcnJvciwK
ICAgICAgICAgICAgICAgICAgIkJhZCBmbGFncyAoJXgpIG9yIGRvbSAoJWQpOyBleHBlY3RlZCBk
JWQsIGZsYWdzICV4XG4iLAotICAgICAgICAgICAgICAgICBmbGFncywgaWQsIGxkb21pZCwgbWFz
ayk7CisgICAgICAgICAgICAgICAgIHNjb21iby5mbGFncywgc2NvbWJvLmRvbWlkLCBsZG9taWQs
IG1hc2spOwogCiAgICAgaWYgKCByZWFkb25seSApCiAgICAgewpAQCAtNzg0LDcgKzc3Nyw3IEBA
IHN0YXRpYyBpbnQgX3NldF9zdGF0dXNfdjIoY29uc3QgZ3JhbnRfZW50cnlfaGVhZGVyX3QgKnNo
YWgsCiAgICAgfQogICAgIGVsc2UKICAgICB7Ci0gICAgICAgIGlmICggdW5saWtlbHkoZmxhZ3Mg
JiBHVEZfcmVhZG9ubHkpICkKKyAgICAgICAgaWYgKCB1bmxpa2VseShzY29tYm8uZmxhZ3MgJiBH
VEZfcmVhZG9ubHkpICkKICAgICAgICAgICAgIFBJTl9GQUlMKGRvbmUsIEdOVFNUX2dlbmVyYWxf
ZXJyb3IsCiAgICAgICAgICAgICAgICAgICAgICAiQXR0ZW1wdCB0byB3cml0ZS1waW4gYSByL28g
Z3JhbnQgZW50cnlcbiIpOwogICAgICAgICAqc3RhdHVzIHw9IEdURl9yZWFkaW5nIHwgR1RGX3dy
aXRpbmc7CkBAIC03OTQsMjcgKzc4NywyNSBAQCBzdGF0aWMgaW50IF9zZXRfc3RhdHVzX3YyKGNv
bnN0IGdyYW50X2VudHJ5X2hlYWRlcl90ICpzaGFoLAogICAgICAgIHN0aWxsIHZhbGlkICovCiAg
ICAgc21wX21iKCk7CiAKLSAgICBzY29tYm8ud29yZCA9IEFDQ0VTU19PTkNFKCpyYXdfc2hhaCk7
Ci0gICAgZmxhZ3MgPSBzY29tYm8uc2hvcnRzLmZsYWdzOwotICAgIGlkID0gc2NvbWJvLnNob3J0
cy5kb21pZDsKKyAgICBzY29tYm8ucmF3ID0gQUNDRVNTX09OQ0UoKnJhd19zaGFoKTsKIAogICAg
IGlmICggIWFjdC0+cGluICkKICAgICB7Ci0gICAgICAgIGlmICggKCgoZmxhZ3MgJiBtYXNrKSAh
PSBHVEZfcGVybWl0X2FjY2VzcykgJiYKLSAgICAgICAgICAgICAgKChmbGFncyAmIG1hc2spICE9
IEdURl90cmFuc2l0aXZlKSkgfHwKLSAgICAgICAgICAgICAoaWQgIT0gbGRvbWlkKSB8fAotICAg
ICAgICAgICAgICghcmVhZG9ubHkgJiYgKGZsYWdzICYgR1RGX3JlYWRvbmx5KSkgKQorICAgICAg
ICBpZiAoICgoKHNjb21iby5mbGFncyAmIG1hc2spICE9IEdURl9wZXJtaXRfYWNjZXNzKSAmJgor
ICAgICAgICAgICAgICAoKHNjb21iby5mbGFncyAmIG1hc2spICE9IEdURl90cmFuc2l0aXZlKSkg
fHwKKyAgICAgICAgICAgICAoc2NvbWJvLmRvbWlkICE9IGxkb21pZCkgfHwKKyAgICAgICAgICAg
ICAoIXJlYWRvbmx5ICYmIChzY29tYm8uZmxhZ3MgJiBHVEZfcmVhZG9ubHkpKSApCiAgICAgICAg
IHsKICAgICAgICAgICAgIGdudHRhYl9jbGVhcl9mbGFnKHJkLCBfR1RGX3dyaXRpbmcsIHN0YXR1
cyk7CiAgICAgICAgICAgICBnbnR0YWJfY2xlYXJfZmxhZyhyZCwgX0dURl9yZWFkaW5nLCBzdGF0
dXMpOwogICAgICAgICAgICAgUElOX0ZBSUwoZG9uZSwgR05UU1RfZ2VuZXJhbF9lcnJvciwKICAg
ICAgICAgICAgICAgICAgICAgICJVbnN0YWJsZSBmbGFncyAoJXgpIG9yIGRvbSAoJWQpOyBleHBl
Y3RlZCBkJWQgKHIvdzogJWQpXG4iLAotICAgICAgICAgICAgICAgICAgICAgZmxhZ3MsIGlkLCBs
ZG9taWQsICFyZWFkb25seSk7CisgICAgICAgICAgICAgICAgICAgICBzY29tYm8uZmxhZ3MsIHNj
b21iby5kb21pZCwgbGRvbWlkLCAhcmVhZG9ubHkpOwogICAgICAgICB9CiAgICAgfQogICAgIGVs
c2UKICAgICB7Ci0gICAgICAgIGlmICggdW5saWtlbHkoZmxhZ3MgJiBHVEZfcmVhZG9ubHkpICkK
KyAgICAgICAgaWYgKCB1bmxpa2VseShzY29tYm8uZmxhZ3MgJiBHVEZfcmVhZG9ubHkpICkKICAg
ICAgICAgewogICAgICAgICAgICAgZ250dGFiX2NsZWFyX2ZsYWcocmQsIF9HVEZfd3JpdGluZywg
c3RhdHVzKTsKICAgICAgICAgICAgIFBJTl9GQUlMKGRvbmUsIEdOVFNUX2dlbmVyYWxfZXJyb3Is
CkBAIC0yMDM4LDcgKzIwMjksNyBAQCBnbnR0YWJfcHJlcGFyZV9mb3JfdHJhbnNmZXIoCiB7CiAg
ICAgc3RydWN0IGdyYW50X3RhYmxlICpyZ3QgPSByZC0+Z3JhbnRfdGFibGU7CiAgICAgdWludDMy
X3QgKnJhd19zaGFoOwotICAgIHVuaW9uIGdyYW50X2NvbWJvICAgc2NvbWJvLCBwcmV2X3Njb21i
bywgbmV3X3Njb21ibzsKKyAgICB1bmlvbiBncmFudF9jb21ibyBzY29tYm87CiAgICAgaW50ICAg
ICAgICAgICAgICAgICByZXRyaWVzID0gMDsKIAogICAgIGdyYW50X3JlYWRfbG9jayhyZ3QpOwpA
QCAtMjA1MiwyNiArMjA0MywyNiBAQCBnbnR0YWJfcHJlcGFyZV9mb3JfdHJhbnNmZXIoCiAgICAg
fQogCiAgICAgcmF3X3NoYWggPSAodWludDMyX3QgKilzaGFyZWRfZW50cnlfaGVhZGVyKHJndCwg
cmVmKTsKLSAgICBzY29tYm8ud29yZCA9IEFDQ0VTU19PTkNFKCpyYXdfc2hhaCk7CisgICAgc2Nv
bWJvLnJhdyA9IEFDQ0VTU19PTkNFKCpyYXdfc2hhaCk7CiAKICAgICBmb3IgKCA7IDsgKQogICAg
IHsKLSAgICAgICAgaWYgKCB1bmxpa2VseShzY29tYm8uc2hvcnRzLmZsYWdzICE9IEdURl9hY2Nl
cHRfdHJhbnNmZXIpIHx8Ci0gICAgICAgICAgICAgdW5saWtlbHkoc2NvbWJvLnNob3J0cy5kb21p
ZCAhPSBsZC0+ZG9tYWluX2lkKSApCisgICAgICAgIHVuaW9uIGdyYW50X2NvbWJvIHByZXYsIG5l
dzsKKworICAgICAgICBpZiAoIHVubGlrZWx5KHNjb21iby5mbGFncyAhPSBHVEZfYWNjZXB0X3Ry
YW5zZmVyKSB8fAorICAgICAgICAgICAgIHVubGlrZWx5KHNjb21iby5kb21pZCAhPSBsZC0+ZG9t
YWluX2lkKSApCiAgICAgICAgIHsKICAgICAgICAgICAgIGdkcHJpbnRrKFhFTkxPR19JTkZPLAog
ICAgICAgICAgICAgICAgICAgICAgIkJhZCBmbGFncyAoJXgpIG9yIGRvbSAoJWQpOyBleHBlY3Rl
ZCBkJWRcbiIsCi0gICAgICAgICAgICAgICAgICAgICBzY29tYm8uc2hvcnRzLmZsYWdzLCBzY29t
Ym8uc2hvcnRzLmRvbWlkLAotICAgICAgICAgICAgICAgICAgICAgbGQtPmRvbWFpbl9pZCk7Cisg
ICAgICAgICAgICAgICAgICAgICBzY29tYm8uZmxhZ3MsIHNjb21iby5kb21pZCwgbGQtPmRvbWFp
bl9pZCk7CiAgICAgICAgICAgICBnb3RvIGZhaWw7CiAgICAgICAgIH0KIAotICAgICAgICBuZXdf
c2NvbWJvID0gc2NvbWJvOwotICAgICAgICBuZXdfc2NvbWJvLnNob3J0cy5mbGFncyB8PSBHVEZf
dHJhbnNmZXJfY29tbWl0dGVkOworICAgICAgICBuZXcgPSBzY29tYm87CisgICAgICAgIG5ldy5m
bGFncyB8PSBHVEZfdHJhbnNmZXJfY29tbWl0dGVkOwogCi0gICAgICAgIHByZXZfc2NvbWJvLndv
cmQgPSBndWVzdF9jbXB4Y2hnKHJkLCByYXdfc2hhaCwKLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc2NvbWJvLndvcmQsIG5ld19zY29tYm8ud29yZCk7Ci0gICAgICAg
IGlmICggbGlrZWx5KHByZXZfc2NvbWJvLndvcmQgPT0gc2NvbWJvLndvcmQpICkKKyAgICAgICAg
cHJldi5yYXcgPSBndWVzdF9jbXB4Y2hnKHJkLCByYXdfc2hhaCwgc2NvbWJvLnJhdywgbmV3LnJh
dyk7CisgICAgICAgIGlmICggbGlrZWx5KHByZXYucmF3ID09IHNjb21iby5yYXcpICkKICAgICAg
ICAgICAgIGJyZWFrOwogCiAgICAgICAgIGlmICggcmV0cmllcysrID09IDQgKQpAQCAtMjA4MCw3
ICsyMDcxLDcgQEAgZ250dGFiX3ByZXBhcmVfZm9yX3RyYW5zZmVyKAogICAgICAgICAgICAgZ290
byBmYWlsOwogICAgICAgICB9CiAKLSAgICAgICAgc2NvbWJvID0gcHJldl9zY29tYm87CisgICAg
ICAgIHNjb21ibyA9IHByZXY7CiAgICAgfQogCiAgICAgZ3JhbnRfcmVhZF91bmxvY2socmd0KTsK
LS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
