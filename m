Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AFFFE55A
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 20:02:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVgol-0004Gn-66; Fri, 15 Nov 2019 18:59:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/leW=ZH=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iVgoi-0004Gh-PM
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 18:59:37 +0000
X-Inumbo-ID: 10800b6e-07da-11ea-b678-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10800b6e-07da-11ea-b678-bc764e2007e4;
 Fri, 15 Nov 2019 18:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573844375;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=hREYSKwA+ircjoKXkytb7GkRnOOLW2vS7p1+vChYNrk=;
 b=VChKuprU3ecjRmT3Xtekl4AuiK0+QO90J+cMW+4RQlO6YaQ642sxsxfL
 1iNUudsAtRGqFSoJSECPPxIqwivRBebicdkXdefcFhRIjhr2x0B7y4jS/
 DhGfPw+/bdBBkG8w0GFYBlGNFQHNfCxSkFtuWXLwGgLIvQUMFKliAF4qx Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0pGolBTciiw/lLIurEhPAOxUhVL62GIslzL3uS2J9tC/MK5F6Fmm8uLpooH8z61NzL5mhZfwcQ
 6GgnFk4bbBCThW3sgEYhbSbtY9coaK3n1ttPc0myXSsmcYUwRBAgkKQhc1dw2AtBhAcm5fQt4n
 v06136JdPdeF0nD1BwIuFJ9Kr5nFWIeedYG3gJiZi7K0aYBCPSf+aV3pNc26S/meK0FWEoAJFA
 UlA8YjTraTX0hmxwZdpWEysNKWudMmdobPaYwUZMcDtIbgC6ntnZluI1JzjBecQ6V6oBLiSK/f
 Aog=
X-SBRS: 2.7
X-MesageID: 8812890
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,309,1569297600"; 
   d="scan'208";a="8812890"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 15 Nov 2019 18:59:30 +0000
Message-ID: <1573844370-29159-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13 v3] passthrough: simplify locking and
 logging
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
Cc: jgross@suse.com, Igor Druzhinin <igor.druzhinin@citrix.com>,
 pdurrant@amazon.com, Paul
 Durrant <paul.durrant@citrix.com>, jbeulich@suse.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgoKRHJvcHBpbmcgdGhlIHBj
aWRldnMgbG9jayBiZXR3ZWVuIGNhbGxpbmcgZGV2aWNlX2Fzc2lnbmVkKCkgYW5kCmFzc2lnbl9k
ZXZpY2UoKSBtZWFucyB0aGF0IHRoZSBsYXR0ZXIgaGFzIHRvIGRvIHRoZSBzYW1lIGNoZWNrIGFz
IHRoZQpmb3JtZXIgZm9yIG5vIG9idmlvdXMgZ2Fpbi4gQWxzbywgc2luY2UgbG9uZyBydW5uaW5n
IG9wZXJhdGlvbnMgdW5kZXIKcGNpZGV2cyBsb2NrIGFscmVhZHkgZHJvcCB0aGUgbG9jayBhbmQg
cmV0dXJuIC1FUkVTVEFSVCBwZXJpb2RpY2FsbHkgdGhlcmUKaXMgbGl0dGxlIHBvaW50IGluIGlt
bWVkaWF0ZWx5IGZhaWxpbmcgYW4gYXNzaWdubWVudCBvcGVyYXRpb24gd2l0aAotRVJFU1RBUlQg
anVzdCBiZWNhdXNlIHRoZSBwY2lkZXZzIGxvY2sgY291bGQgbm90IGJlIGFjcXVpcmVkIChmb3Ig
dGhlCnNlY29uZCB0aW1lLCBoYXZpbmcgYWxyZWFkeSBibG9ja2VkIG9uIGFjcXVpcmluZyB0aGUg
bG9jayBpbgpkZXZpY2VfYXNzaWduZWQoKSkuCgpUaGlzIHBhdGNoIGluc3RlYWQgYWNxdWlyZXMg
dGhlIGxvY2sgb25jZSBmb3IgYXNzaWdubWVudCAob3IgdGVzdCBhc3NpZ24pCm9wZXJhdGlvbnMg
ZGlyZWN0bHkgaW4gaW9tbXVfZG9fcGNpX2RvbWN0bCgpIGFuZCB0aHVzIGNhbiByZW1vdmUgdGhl
CmR1cGxpY2F0ZSBkb21haW4gb3duZXJzaGlwIGNoZWNrIGluIGFzc2lnbl9kZXZpY2UoKS4gV2hp
bHN0IGluIHRoZQpuZWlnaGJvdXJob29kLCB0aGUgcGF0Y2ggYWxzbyByZW1vdmVzIHNvbWUgZGVi
dWcgbG9nZ2luZyBmcm9tCmFzc2lnbl9kZXZpY2UoKSBhbmQgZGVhc3NpZ25fZGV2aWNlKCkgYW5k
IHJlcGxhY2VzIGl0IHdpdGggcHJvcGVyIGVycm9yCmxvZ2dpbmcsIHdoaWNoIGFsbG93cyBlcnJv
ciBsb2dnaW5nIGluIGlvbW11X2RvX3BjaV9kb21jdGwoKSB0byBiZQpyZW1vdmVkLgoKU2lnbmVk
LW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KU2lnbmVkLW9m
Zi1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Ci0tLQpTaW5j
ZSBQYXVsIGRvZXNuJ3QgbWluZCBhbmQga2luZGx5IGFncmVlZCAtIEknbSB0YWtpbmcgb3duZXJz
aGlwIG9mIHRoaXMgcGF0Y2gKcmV2aWV3IHByb2Nlc3MgZnJvbSBub3cgb24uCgpDaGFuZ2VzIGlu
IHYzOgotIERyb3BwZWQgY29udHJvdmVyc2lhbCBodW5rIHdpdGggZXJyb3IgY29kZSBwcm9jZXNz
aW5nIG9mIGRldmljZV9hc3NpZ25lZCgpLgogIFJlYWRhYmlsaXR5IGlzIHdvcnNlIHdpdGggaXQg
YW5kIEkgZG9uJ3QgdGhpbmsgd2UgY2FuIHNhZmVseSBzdG9wIGNvbnZlcnRpbmcKICB0aGUgZXJy
b3IgY29kZSB0byBhdm9pZCB1c2Vyc3BhY2UgYnJlYWthZ2UuCi0gQWRkcmVzc2VkIG90aGVyIG1p
bm9yIGNvbW1lbnRzLgotIEZpeGVkIFBhdWwncyBlbWFpbCBhZ2FpbiB0byByZWZsZWN0IHRoYXQg
dGhlIGNvZGUgd2FzIG1hZGUgaW4gQ2l0cml4LgotLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L3BjaS5jIHwgNzggKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDU2IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jIGIveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvcGNpLmMKaW5kZXggMThhN2RjNy4uOGEyNWQ0ZiAxMDA2NDQKLS0tIGEveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvcGNpLmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMK
QEAgLTkzMiwzMCArOTMyLDI2IEBAIHN0YXRpYyBpbnQgZGVhc3NpZ25fZGV2aWNlKHN0cnVjdCBk
b21haW4gKmQsIHVpbnQxNl90IHNlZywgdWludDhfdCBidXMsCiAgICAgICAgICAgICBicmVhazsK
ICAgICAgICAgcmV0ID0gaGQtPnBsYXRmb3JtX29wcy0+cmVhc3NpZ25fZGV2aWNlKGQsIHRhcmdl
dCwgZGV2Zm4sCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwY2lfdG9fZGV2KHBkZXYpKTsKLSAgICAgICAgaWYgKCAhcmV0ICkKLSAgICAgICAgICAgIGNv
bnRpbnVlOwotCi0gICAgICAgIHByaW50ayhYRU5MT0dfR19FUlIgIiVwZDogZGVhc3NpZ24gJTA0
eDolMDJ4OiUwMnguJXUgZmFpbGVkICglZClcbiIsCi0gICAgICAgICAgICAgICBkLCBzZWcsIGJ1
cywgUENJX1NMT1QoZGV2Zm4pLCBQQ0lfRlVOQyhkZXZmbiksIHJldCk7Ci0gICAgICAgIHJldHVy
biByZXQ7CisgICAgICAgIGlmICggcmV0ICkKKyAgICAgICAgICAgIGdvdG8gb3V0OwogICAgIH0K
IAogICAgIGRldmZuID0gcGRldi0+ZGV2Zm47CiAgICAgcmV0ID0gaGQtPnBsYXRmb3JtX29wcy0+
cmVhc3NpZ25fZGV2aWNlKGQsIHRhcmdldCwgZGV2Zm4sCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBjaV90b19kZXYocGRldikpOwogICAgIGlmICggcmV0ICkK
LSAgICB7Ci0gICAgICAgIGRwcmludGsoWEVOTE9HX0dfRVJSLAotICAgICAgICAgICAgICAgICIl
cGQ6IGRlYXNzaWduIGRldmljZSAoJTA0eDolMDJ4OiUwMnguJXUpIGZhaWxlZFxuIiwKLSAgICAg
ICAgICAgICAgICBkLCBzZWcsIGJ1cywgUENJX1NMT1QoZGV2Zm4pLCBQQ0lfRlVOQyhkZXZmbikp
OwotICAgICAgICByZXR1cm4gcmV0OwotICAgIH0KKyAgICAgICAgZ290byBvdXQ7CiAKICAgICBp
ZiAoIHBkZXYtPmRvbWFpbiA9PSBoYXJkd2FyZV9kb21haW4gICkKICAgICAgICAgcGRldi0+cXVh
cmFudGluZSA9IGZhbHNlOwogCiAgICAgcGRldi0+ZmF1bHQuY291bnQgPSAwOwogCitvdXQ6Cisg
ICAgaWYgKCByZXQgKQorICAgICAgICBwcmludGsoWEVOTE9HX0dfRVJSICIlcGQ6IGRlYXNzaWdu
ICglMDR4OiUwMng6JTAyeC4ldSkgZmFpbGVkICglZClcbiIsCisgICAgICAgICAgICAgICBkLCBz
ZWcsIGJ1cywgUENJX1NMT1QoZGV2Zm4pLCBQQ0lfRlVOQyhkZXZmbiksIHJldCk7CisKICAgICBy
ZXR1cm4gcmV0OwogfQogCkBAIC05NzYsMTAgKzk3Miw3IEBAIGludCBwY2lfcmVsZWFzZV9kZXZp
Y2VzKHN0cnVjdCBkb21haW4gKmQpCiAgICAgewogICAgICAgICBidXMgPSBwZGV2LT5idXM7CiAg
ICAgICAgIGRldmZuID0gcGRldi0+ZGV2Zm47Ci0gICAgICAgIGlmICggZGVhc3NpZ25fZGV2aWNl
KGQsIHBkZXYtPnNlZywgYnVzLCBkZXZmbikgKQotICAgICAgICAgICAgcHJpbnRrKCJkb21haW4g
JWQ6IGRlYXNzaWduIGRldmljZSAoJTA0eDolMDJ4OiUwMnguJXUpIGZhaWxlZCFcbiIsCi0gICAg
ICAgICAgICAgICAgICAgZC0+ZG9tYWluX2lkLCBwZGV2LT5zZWcsIGJ1cywKLSAgICAgICAgICAg
ICAgICAgICBQQ0lfU0xPVChkZXZmbiksIFBDSV9GVU5DKGRldmZuKSk7CisgICAgICAgIGRlYXNz
aWduX2RldmljZShkLCBwZGV2LT5zZWcsIGJ1cywgZGV2Zm4pOwogICAgIH0KICAgICBwY2lkZXZz
X3VubG9jaygpOwogCkBAIC0xNDc1LDggKzE0NjgsNyBAQCBzdGF0aWMgaW50IGRldmljZV9hc3Np
Z25lZCh1MTYgc2VnLCB1OCBidXMsIHU4IGRldmZuKQogICAgIHN0cnVjdCBwY2lfZGV2ICpwZGV2
OwogICAgIGludCByYyA9IDA7CiAKLSAgICBwY2lkZXZzX2xvY2soKTsKLQorICAgIEFTU0VSVChw
Y2lkZXZzX2xvY2tlZCgpKTsKICAgICBwZGV2ID0gcGNpX2dldF9wZGV2KHNlZywgYnVzLCBkZXZm
bik7CiAKICAgICBpZiAoICFwZGV2ICkKQEAgLTE0OTAsMTEgKzE0ODIsMTAgQEAgc3RhdGljIGlu
dCBkZXZpY2VfYXNzaWduZWQodTE2IHNlZywgdTggYnVzLCB1OCBkZXZmbikKICAgICAgICAgICAg
ICAgcGRldi0+ZG9tYWluICE9IGRvbV9pbyApCiAgICAgICAgIHJjID0gLUVCVVNZOwogCi0gICAg
cGNpZGV2c191bmxvY2soKTsKLQogICAgIHJldHVybiByYzsKIH0KIAorLyogQ2FsbGVyIHNob3Vs
ZCBob2xkIHRoZSBwY2lkZXZzX2xvY2sgKi8KIHN0YXRpYyBpbnQgYXNzaWduX2RldmljZShzdHJ1
Y3QgZG9tYWluICpkLCB1MTYgc2VnLCB1OCBidXMsIHU4IGRldmZuLCB1MzIgZmxhZykKIHsKICAg
ICBjb25zdCBzdHJ1Y3QgZG9tYWluX2lvbW11ICpoZCA9IGRvbV9pb21tdShkKTsKQEAgLTE1MTMs
MjMgKzE1MDQsMTEgQEAgc3RhdGljIGludCBhc3NpZ25fZGV2aWNlKHN0cnVjdCBkb21haW4gKmQs
IHUxNiBzZWcsIHU4IGJ1cywgdTggZGV2Zm4sIHUzMiBmbGFnKQogICAgICAgICAgICAgICAgICAg
cDJtX2dldF9ob3N0cDJtKGQpLT5nbG9iYWxfbG9nZGlydHkpICkKICAgICAgICAgcmV0dXJuIC1F
WERFVjsKIAotICAgIGlmICggIXBjaWRldnNfdHJ5bG9jaygpICkKLSAgICAgICAgcmV0dXJuIC1F
UkVTVEFSVDsKLQorICAgIC8qIGRldmljZV9hc3NpZ25lZCgpIHNob3VsZCBhbHJlYWR5IGhhdmUg
Y2xlYXJlZCB0aGUgZGV2aWNlIGZvciBhc3NpZ25tZW50ICovCisgICAgQVNTRVJUKHBjaWRldnNf
bG9ja2VkKCkpOwogICAgIHBkZXYgPSBwY2lfZ2V0X3BkZXYoc2VnLCBidXMsIGRldmZuKTsKLQot
ICAgIHJjID0gLUVOT0RFVjsKLSAgICBpZiAoICFwZGV2ICkKLSAgICAgICAgZ290byBkb25lOwot
Ci0gICAgcmMgPSAwOwotICAgIGlmICggZCA9PSBwZGV2LT5kb21haW4gKQotICAgICAgICBnb3Rv
IGRvbmU7Ci0KLSAgICByYyA9IC1FQlVTWTsKLSAgICBpZiAoIHBkZXYtPmRvbWFpbiAhPSBoYXJk
d2FyZV9kb21haW4gJiYKLSAgICAgICAgIHBkZXYtPmRvbWFpbiAhPSBkb21faW8gKQotICAgICAg
ICBnb3RvIGRvbmU7CisgICAgQVNTRVJUKHBkZXYgJiYgKHBkZXYtPmRvbWFpbiA9PSBoYXJkd2Fy
ZV9kb21haW4gfHwKKyAgICAgICAgICAgICAgICAgICAgcGRldi0+ZG9tYWluID09IGRvbV9pbykp
OwogCiAgICAgaWYgKCBwZGV2LT5tc2l4ICkKICAgICB7CkBAIC0xNTUwLDE5ICsxNTI5LDE2IEBA
IHN0YXRpYyBpbnQgYXNzaWduX2RldmljZShzdHJ1Y3QgZG9tYWluICpkLCB1MTYgc2VnLCB1OCBi
dXMsIHU4IGRldmZuLCB1MzIgZmxhZykKICAgICAgICAgaWYgKCBQQ0lfU0xPVChkZXZmbikgIT0g
UENJX1NMT1QocGRldi0+ZGV2Zm4pICkKICAgICAgICAgICAgIGJyZWFrOwogICAgICAgICByYyA9
IGhkLT5wbGF0Zm9ybV9vcHMtPmFzc2lnbl9kZXZpY2UoZCwgZGV2Zm4sIHBjaV90b19kZXYocGRl
diksIGZsYWcpOwotICAgICAgICBpZiAoIHJjICkKLSAgICAgICAgICAgIHByaW50ayhYRU5MT0df
R19XQVJOSU5HICJkJWQ6IGFzc2lnbiAlMDR4OiUwMng6JTAyeC4ldSBmYWlsZWQgKCVkKVxuIiwK
LSAgICAgICAgICAgICAgICAgICBkLT5kb21haW5faWQsIHNlZywgYnVzLCBQQ0lfU0xPVChkZXZm
biksIFBDSV9GVU5DKGRldmZuKSwKLSAgICAgICAgICAgICAgICAgICByYyk7CiAgICAgfQogCiAg
ZG9uZToKKyAgICBpZiAoIHJjICkKKyAgICAgICAgcHJpbnRrKFhFTkxPR19HX1dBUk5JTkcgIiVw
ZDogYXNzaWduICglMDR4OiUwMng6JTAyeC4ldSkgZmFpbGVkICglZClcbiIsCisgICAgICAgICAg
ICAgICBkLCBzZWcsIGJ1cywgUENJX1NMT1QoZGV2Zm4pLCBQQ0lfRlVOQyhkZXZmbiksIHJjKTsK
ICAgICAvKiBUaGUgZGV2aWNlIGlzIGFzc2lnbmVkIHRvIGRvbV9pbyBzbyBtYXJrIGl0IGFzIHF1
YXJhbnRpbmVkICovCi0gICAgaWYgKCAhcmMgJiYgZCA9PSBkb21faW8gKQorICAgIGVsc2UgaWYg
KCBkID09IGRvbV9pbyApCiAgICAgICAgIHBkZXYtPnF1YXJhbnRpbmUgPSB0cnVlOwogCi0gICAg
cGNpZGV2c191bmxvY2soKTsKLQogICAgIHJldHVybiByYzsKIH0KIApAQCAtMTcxOCw2ICsxNjk0
LDcgQEAgaW50IGlvbW11X2RvX3BjaV9kb21jdGwoCiAgICAgICAgIGJ1cyA9IFBDSV9CVVMobWFj
aGluZV9zYmRmKTsKICAgICAgICAgZGV2Zm4gPSBQQ0lfREVWRk4yKG1hY2hpbmVfc2JkZik7CiAK
KyAgICAgICAgcGNpZGV2c19sb2NrKCk7CiAgICAgICAgIHJldCA9IGRldmljZV9hc3NpZ25lZChz
ZWcsIGJ1cywgZGV2Zm4pOwogICAgICAgICBpZiAoIGRvbWN0bC0+Y21kID09IFhFTl9ET01DVExf
dGVzdF9hc3NpZ25fZGV2aWNlICkKICAgICAgICAgewpAQCAtMTczMCwxNyArMTcwNywxMiBAQCBp
bnQgaW9tbXVfZG9fcGNpX2RvbWN0bCgKICAgICAgICAgICAgIH0KICAgICAgICAgICAgIGJyZWFr
OwogICAgICAgICB9Ci0gICAgICAgIGlmICggIXJldCApCisgICAgICAgIGVsc2UgaWYgKCAhcmV0
ICkKICAgICAgICAgICAgIHJldCA9IGFzc2lnbl9kZXZpY2UoZCwgc2VnLCBidXMsIGRldmZuLCBm
bGFncyk7CisgICAgICAgIHBjaWRldnNfdW5sb2NrKCk7CiAgICAgICAgIGlmICggcmV0ID09IC1F
UkVTVEFSVCApCiAgICAgICAgICAgICByZXQgPSBoeXBlcmNhbGxfY3JlYXRlX2NvbnRpbnVhdGlv
bihfX0hZUEVSVklTT1JfZG9tY3RsLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgImgiLCB1X2RvbWN0bCk7Ci0gICAgICAgIGVsc2UgaWYgKCByZXQgKQot
ICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19HX0VSUgotICAgICAgICAgICAgICAgICAgICJhc3Np
Z24gJTA0eDolMDJ4OiUwMnguJXUgdG8gZG9tJWQgZmFpbGVkICglZClcbiIsCi0gICAgICAgICAg
ICAgICAgICAgc2VnLCBidXMsIFBDSV9TTE9UKGRldmZuKSwgUENJX0ZVTkMoZGV2Zm4pLAotICAg
ICAgICAgICAgICAgICAgIGQtPmRvbWFpbl9pZCwgcmV0KTsKLQogICAgICAgICBicmVhazsKIAog
ICAgIGNhc2UgWEVOX0RPTUNUTF9kZWFzc2lnbl9kZXZpY2U6CkBAIC0xNzcyLDEyICsxNzQ0LDYg
QEAgaW50IGlvbW11X2RvX3BjaV9kb21jdGwoCiAgICAgICAgIHBjaWRldnNfbG9jaygpOwogICAg
ICAgICByZXQgPSBkZWFzc2lnbl9kZXZpY2UoZCwgc2VnLCBidXMsIGRldmZuKTsKICAgICAgICAg
cGNpZGV2c191bmxvY2soKTsKLSAgICAgICAgaWYgKCByZXQgKQotICAgICAgICAgICAgcHJpbnRr
KFhFTkxPR19HX0VSUgotICAgICAgICAgICAgICAgICAgICJkZWFzc2lnbiAlMDR4OiUwMng6JTAy
eC4ldSBmcm9tIGRvbSVkIGZhaWxlZCAoJWQpXG4iLAotICAgICAgICAgICAgICAgICAgIHNlZywg
YnVzLCBQQ0lfU0xPVChkZXZmbiksIFBDSV9GVU5DKGRldmZuKSwKLSAgICAgICAgICAgICAgICAg
ICBkLT5kb21haW5faWQsIHJldCk7Ci0KICAgICAgICAgYnJlYWs7CiAKICAgICBkZWZhdWx0Ogot
LSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
