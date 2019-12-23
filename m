Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 283811298DC
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2019 17:46:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijQoA-0006Kn-Rk; Mon, 23 Dec 2019 16:43:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q5yK=2N=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ijQo8-0006KG-V5
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2019 16:43:48 +0000
X-Inumbo-ID: 5c36a6da-25a3-11ea-96fe-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5c36a6da-25a3-11ea-96fe-12813bfff9fa;
 Mon, 23 Dec 2019 16:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577119414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vsbhqvxTPqxq150MwF1GoyaiUXnxXCxdKv0AX0i+w4A=;
 b=KwLHx/uJU2tWJiLH6hKiz+Bk10NTE1NbIwHv0OjtSqwLMlKinKcHckWq
 /Tl0KWaPupeTJygqSvH2nWD8lmGHj3WTko3MpYXsCuToXTzYu7wnIp5jb
 r/PE3QBq3Ek0jAUyPhN7m3gM6y4LFnvpSR6Hhh5ZKQnFkMIthiZII2rDj s=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7yCzjNOIXE9cMcr2KHNYPhVUxnpjVBL9i5LUbLITtj9830IRWyE98T/XwFbO7hF793u7hLd/tS
 q8p+dsEsxrvEFZ/4obU8sk3o29Uhrk3svBGG2iIixBy5nMCAr8jO//ZaXHLtzSa8g2dVFLGq7Q
 R87ogzktdYXJ20D9IIoiBylAWOL37ekWC0TnFAk8yFGULHoyotomVSFNhHeAD29CWZPNtwO0uG
 TU6ES15VDEM4Yys1DFw5vWSgqjQEh0YXtvigmkZ2pOHLdCmphj80Q9y1FYVY1tqUhUgZHF2o/F
 FVg=
X-SBRS: 2.7
X-MesageID: 10229662
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,348,1571716800"; d="scan'208";a="10229662"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 23 Dec 2019 16:43:26 +0000
Message-ID: <20191223164329.3113378-2-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191223164329.3113378-1-george.dunlap@citrix.com>
References: <20191223164329.3113378-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/4] xen: Remove trailing whitespace from time.c
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2VzLgoKU2lnbmVkLW9mZi1ieTogR2VvcmdlIER1bmxhcCA8Z2Vv
cmdlLmR1bmxhcEBjaXRyaXguY29tPgotLS0KQ0M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+CkNDOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQog
eGVuL2FyY2gveDg2L3RpbWUuYyB8IDMwICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni90aW1lLmMgYi94ZW4vYXJjaC94ODYvdGltZS5jCmluZGV4IGVh
Njk2YTk1ZTguLjY0ZTQ3MWEzOWIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni90aW1lLmMKKysr
IGIveGVuL2FyY2gveDg2L3RpbWUuYwpAQCAtMSwxMCArMSwxMCBAQAogLyoqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKgogICogYXJjaC94ODYvdGltZS5jCi0gKiAKKyAqCiAgKiBQZXItQ1BVIHRpbWUgY2Fs
aWJyYXRpb24gYW5kIG1hbmFnZW1lbnQuCi0gKiAKKyAqCiAgKiBDb3B5cmlnaHQgKGMpIDIwMDIt
MjAwNSwgSyBBIEZyYXNlcgotICogCisgKgogICogUG9ydGlvbnMgZnJvbSBMaW51eCBhcmU6CiAg
KiBDb3B5cmlnaHQgKGMpIDE5OTEsIDE5OTIsIDE5OTUgIExpbnVzIFRvcnZhbGRzCiAgKi8KQEAg
LTc4LDggKzc4LDggQEAgc3RhdGljIHN0cnVjdCB0aW1lciBjYWxpYnJhdGlvbl90aW1lcjsKICAq
IFdlIHNpbXVsYXRlIGEgMzItYml0IHBsYXRmb3JtIHRpbWVyIGZyb20gdGhlIDE2LWJpdCBQSVQg
Y2gyIGNvdW50ZXIuCiAgKiBPdGhlcndpc2Ugb3ZlcmZsb3cgaGFwcGVucyB0b28gcXVpY2tseSAo
fjUwbXMpIGZvciB1cyB0byBndWFyYW50ZWUgdGhhdAogICogc29mdGlycSBoYW5kbGluZyB3aWxs
IGhhcHBlbiBpbiB0aW1lLgotICogCi0gKiBUaGUgcGl0X2xvY2sgcHJvdGVjdHMgdGhlIDE2LSBh
bmQgMzItYml0IHN0YW1wIGZpZWxkcyBhcyB3ZWxsIGFzIHRoZSAKKyAqCisgKiBUaGUgcGl0X2xv
Y2sgcHJvdGVjdHMgdGhlIDE2LSBhbmQgMzItYml0IHN0YW1wIGZpZWxkcyBhcyB3ZWxsIGFzIHRo
ZQogICovCiBzdGF0aWMgREVGSU5FX1NQSU5MT0NLKHBpdF9sb2NrKTsKIHN0YXRpYyB1MTYgcGl0
X3N0YW1wMTY7CkBAIC0xMDAsNyArMTAwLDcgQEAgc3RhdGljIGlubGluZSB1MzIgZGl2X2ZyYWMo
dTMyIGRpdmlkZW5kLCB1MzIgZGl2aXNvcikKIHsKICAgICB1MzIgcXVvdGllbnQsIHJlbWFpbmRl
cjsKICAgICBBU1NFUlQoZGl2aWRlbmQgPCBkaXZpc29yKTsKLSAgICBhc20gKCAKKyAgICBhc20g
KAogICAgICAgICAiZGl2bCAlNCIKICAgICAgICAgOiAiPWEiIChxdW90aWVudCksICI9ZCIgKHJl
bWFpbmRlcikKICAgICAgICAgOiAiMCIgKDApLCAiMSIgKGRpdmlkZW5kKSwgInIiIChkaXZpc29y
KSApOwpAQCAtMTAxMSw3ICsxMDExLDcgQEAgc3RhdGljIHZvaWQgX19nZXRfY21vc190aW1lKHN0
cnVjdCBydGNfdGltZSAqcnRjKQogICAgIHJ0Yy0+ZGF5ICA9IENNT1NfUkVBRChSVENfREFZX09G
X01PTlRIKTsKICAgICBydGMtPm1vbiAgPSBDTU9TX1JFQUQoUlRDX01PTlRIKTsKICAgICBydGMt
PnllYXIgPSBDTU9TX1JFQUQoUlRDX1lFQVIpOwotICAgIAorCiAgICAgaWYgKCBSVENfQUxXQVlT
X0JDRCB8fCAhKENNT1NfUkVBRChSVENfQ09OVFJPTCkgJiBSVENfRE1fQklOQVJZKSApCiAgICAg
ewogICAgICAgICBCQ0RfVE9fQklOKHJ0Yy0+c2VjKTsKQEAgLTE1MTEsOCArMTUxMSw4IEBAIHN0
YXRpYyB2b2lkIGNoZWNrX3RzY193YXJwKHVuc2lnbmVkIGxvbmcgdHNjX2toeiwgdW5zaWduZWQg
bG9uZyAqbWF4X3dhcnApCiAgICAgICAgIHNwaW5fdW5sb2NrKCZzeW5jX2xvY2spOwogCiAgICAg
ICAgIC8qCi0gICAgICAgICAqIEJlIG5pY2UgZXZlcnkgbm93IGFuZCB0aGVuIChhbmQgYWxzbyBj
aGVjayB3aGV0aGVyIG1lYXN1cmVtZW50IGlzIAotICAgICAgICAgKiBkb25lIFt3ZSBhbHNvIGlu
c2VydCBhIDEwIG1pbGxpb24gbG9vcHMgc2FmZXR5IGV4aXQsIHNvIHdlIGRvbnQgCisgICAgICAg
ICAqIEJlIG5pY2UgZXZlcnkgbm93IGFuZCB0aGVuIChhbmQgYWxzbyBjaGVjayB3aGV0aGVyIG1l
YXN1cmVtZW50IGlzCisgICAgICAgICAqIGRvbmUgW3dlIGFsc28gaW5zZXJ0IGEgMTAgbWlsbGlv
biBsb29wcyBzYWZldHkgZXhpdCwgc28gd2UgZG9udAogICAgICAgICAgKiBsb2NrIHVwIGluIGNh
c2UgdGhlIFRTQyByZWFkb3V0IGlzIHRvdGFsbHkgYnJva2VuXSk6CiAgICAgICAgICAqLwogICAg
ICAgICBpZiAoIHVubGlrZWx5KCEoaSAmIDcpKSApCkBAIC0xNTI0LDcgKzE1MjQsNyBAQCBzdGF0
aWMgdm9pZCBjaGVja190c2Nfd2FycCh1bnNpZ25lZCBsb25nIHRzY19raHosIHVuc2lnbmVkIGxv
bmcgKm1heF93YXJwKQogICAgICAgICB9CiAKICAgICAgICAgLyoKLSAgICAgICAgICogT3V0c2lk
ZSB0aGUgY3JpdGljYWwgc2VjdGlvbiB3ZSBjYW4gbm93IHNlZSB3aGV0aGVyIHdlIHNhdyBhIAor
ICAgICAgICAgKiBPdXRzaWRlIHRoZSBjcml0aWNhbCBzZWN0aW9uIHdlIGNhbiBub3cgc2VlIHdo
ZXRoZXIgd2Ugc2F3IGEKICAgICAgICAgICogdGltZS13YXJwIG9mIHRoZSBUU0MgZ29pbmcgYmFj
a3dhcmRzOgogICAgICAgICAgKi8KICAgICAgICAgaWYgKCB1bmxpa2VseShwcmV2ID4gbm93KSAp
CkBAIC0xODA2LDExICsxODA2LDExIEBAIHZvaWQgaW5pdF9wZXJjcHVfdGltZSh2b2lkKQogfQog
CiAvKgotICogT24gY2VydGFpbiBvbGRlciBJbnRlbCBDUFVzIHdyaXRpbmcgdGhlIFRTQyBNU1Ig
Y2xlYXJzIHRoZSB1cHBlciAzMiBiaXRzLiAKKyAqIE9uIGNlcnRhaW4gb2xkZXIgSW50ZWwgQ1BV
cyB3cml0aW5nIHRoZSBUU0MgTVNSIGNsZWFycyB0aGUgdXBwZXIgMzIgYml0cy4KICAqIE9idmlv
dXNseSB3ZSBtdXN0IG5vdCB1c2Ugd3JpdGVfdHNjKCkgb24gc3VjaCBDUFVzLgogICoKLSAqIEFk
ZGl0aW9uYWxseSwgQU1EIHNwZWNpZmllcyB0aGF0IGJlaW5nIGFibGUgdG8gd3JpdGUgdGhlIFRT
QyBNU1IgaXMgbm90IGFuIAotICogYXJjaGl0ZWN0dXJhbCBmZWF0dXJlIChidXQsIG90aGVyIHRo
YW4gdGhlaXIgbWFudWFsIHNheXMsIGFsc28gY2Fubm90IGJlIAorICogQWRkaXRpb25hbGx5LCBB
TUQgc3BlY2lmaWVzIHRoYXQgYmVpbmcgYWJsZSB0byB3cml0ZSB0aGUgVFNDIE1TUiBpcyBub3Qg
YW4KKyAqIGFyY2hpdGVjdHVyYWwgZmVhdHVyZSAoYnV0LCBvdGhlciB0aGFuIHRoZWlyIG1hbnVh
bCBzYXlzLCBhbHNvIGNhbm5vdCBiZQogICogZGV0ZXJtaW5lZCBmcm9tIENQVUlEIGJpdHMpLgog
ICovCiBzdGF0aWMgdm9pZCBfX2luaXQgdHNjX2NoZWNrX3dyaXRhYmlsaXR5KHZvaWQpCkBAIC0y
MDEwLDcgKzIwMTAsNyBAQCB2b2lkIF9faW5pdCBlYXJseV90aW1lX2luaXQodm9pZCkKIAogICAg
IGRvX2Rpdih0bXAsIDEwMDApOwogICAgIGNwdV9raHogPSAodW5zaWduZWQgbG9uZyl0bXA7Ci0g
ICAgcHJpbnRrKCJEZXRlY3RlZCAlbHUuJTAzbHUgTUh6IHByb2Nlc3Nvci5cbiIsIAorICAgIHBy
aW50aygiRGV0ZWN0ZWQgJWx1LiUwM2x1IE1IeiBwcm9jZXNzb3IuXG4iLAogICAgICAgICAgICBj
cHVfa2h6IC8gMTAwMCwgY3B1X2toeiAlIDEwMDApOwogCiAgICAgc2V0dXBfaXJxKDAsIDAsICZp
cnEwKTsKQEAgLTIwMjUsNyArMjAyNSw3IEBAIHN0YXRpYyBpbnQgX2Rpc2FibGVfcGl0X2lycSh2
b2lkKCpocGV0X2Jyb2FkY2FzdF9zZXR1cCkodm9pZCkpCiAgICAgICAgIHJldHVybiAtMTsKIAog
ICAgIC8qCi0gICAgICogSWYgd2UgZG8gbm90IHJlbHkgb24gUElUIENIMCB0aGVuIHdlIGNhbiB1
c2UgSFBFVCBmb3Igb25lLXNob3QgdGltZXIgCisgICAgICogSWYgd2UgZG8gbm90IHJlbHkgb24g
UElUIENIMCB0aGVuIHdlIGNhbiB1c2UgSFBFVCBmb3Igb25lLXNob3QgdGltZXIKICAgICAgKiBl
bXVsYXRpb24gd2hlbiBlbnRlcmluZyBkZWVwIEMgc3RhdGVzLgogICAgICAqIFhYWCBkb20wIG1h
eSByZWx5IG9uIFJUQyBpbnRlcnJ1cHQgZGVsaXZlcnksIHNvIG9ubHkgZW5hYmxlCiAgICAgICog
aHBldF9icm9hZGNhc3QgaWYgRlNCIG1vZGUgYXZhaWxhYmxlIG9yIGlmIGZvcmNlX2hwZXRfYnJv
YWRjYXN0LgotLSAKMi4yNC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
