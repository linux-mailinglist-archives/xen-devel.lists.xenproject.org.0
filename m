Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A83C310AD32
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 11:07:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZuBg-00035W-UQ; Wed, 27 Nov 2019 10:04:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vK6a=ZT=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1iZuBg-00035R-5D
 for xen-devel@lists.xen.org; Wed, 27 Nov 2019 10:04:44 +0000
X-Inumbo-ID: 552175ba-10fd-11ea-a55d-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 552175ba-10fd-11ea-a55d-bc764e2007e4;
 Wed, 27 Nov 2019 10:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574849083;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uSrzHUWCoWXcqtCfA18dvQxmWOKDnC44dG31TcoPTRA=;
 b=QcmKGBKnbGheggEmpAguBFx71aR73VoiCjiC362FXBRgxvJOmye6rVmb
 8UQPrbqnK450Lv7DdzSXKo6oT83ygE6LzXjOgXVulYB1OvhWFVAAbCQP/
 KTN72iRhvi6wQdkCOO6fXkFIzlobqaBfV83/dbOTEMnInyFP8Nbbx9OKJ 0=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: b+h+C5C4vdN10WKrLLULcdhN3YX8vDrzhoks+kSUaHAYAK7FLOLnBGzB8EaHalAoHNCPlBw87E
 6kqQTlMo/Iz8RvtzUaLBUSof22WkOjko65ru1SHWO9tNSFdlZhipFHvRKbwDMY+NzbsRPJzrTM
 dpqYsgx2dfc8RddotP+LSKOBdSU8wQSjPZIpFCQ457M+PmUDUxXGkaLh4pGfHx6Jqc3W5iZQNt
 H7aVYHnPk9bSyUGihvopqQQPR5QjkEzeJsRVkt+bfNVIWYTcf205XhBEN4sd2du2MqRDqNWn+u
 s8Y=
X-SBRS: 2.7
X-MesageID: 9444048
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,249,1571716800"; 
   d="scan'208";a="9444048"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xen.org>
Date: Wed, 27 Nov 2019 10:04:30 +0000
Message-ID: <20191127100430.9635-1-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 for 4.13] x86/microcode: refuse to load the
 same revision ucode
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
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Chao Gao <chao.gao@intel.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3VycmVudGx5IGlmIGEgdXNlciB0cmllcyB0byBsaXZlLWxvYWQgdGhlIHNhbWUgb3Igb2xkZXIg
dWNvZGUgcmV2aXNpb24KdGhhbiBDUFUgYWxyZWFkeSBoYXMsIGhlIHdpbGwgZ2V0IGEgc2luZ2xl
IG1lc3NhZ2UgaW4gWGVuIGxvZyBsaWtlOgoKICAgIChYRU4pIDEyOCBjb3JlcyBhcmUgdG8gdXBk
YXRlIHRoZWlyIG1pY3JvY29kZQoKTm8gYWN0dWFsIHVjb2RlIGxvYWRpbmcgd2lsbCBoYXBwZW4g
YW5kIHRoaXMgc2l0dWF0aW9uIGNhbiBiZSBxdWl0ZQpjb25mdXNpbmcuIEZpeCB0aGlzIGJ5IHN0
YXJ0aW5nIHVjb2RlIHVwZGF0ZSBvbmx5IHdoZW4gdGhlIHByb3ZpZGVkCnVjb2RlIHJldmlzaW9u
IGlzIGhpZ2hlciB0aGFuIHRoZSBjdXJyZW50bHkgY2FjaGVkIG9uZSAoaWYgYW55KS4KVGhpcyBp
cyBiYXNlZCBvbiB0aGUgcHJvcGVydHkgdGhhdCBpZiBtaWNyb2NvZGVfY2FjaGUgZXhpc3RzLCBh
bGwgQ1BVcwppbiB0aGUgc3lzdGVtIHNob3VsZCBoYXZlIGF0IGxlYXN0IHRoYXQgdWNvZGUgcmV2
aXNpb24uCgpBZGRpdGlvbmFsbHksIHByaW50IGEgdXNlciBmcmllbmRseSBtZXNzYWdlIGlmIG5v
IG1hdGNoaW5nIG9yIG5ld2VyCnVjb2RlIGNhbiBiZSBmb3VuZCBpbiB0aGUgcHJvdmlkZWQgYmxv
Yi4gVGhpcyBhbHNvIHJlcXVpcmVzIGlnbm9yaW5nCi1FTk9EQVRBIGluIEFNRC1zaWRlIGNvZGUs
IG90aGVyd2lzZSB0aGUgbWVzc2FnZSBnaXZlbiB0byB0aGUgdXNlciBpczoKCiAgICAoWEVOKSBQ
YXJzaW5nIG1pY3JvY29kZSBibG9iIGVycm9yIC02MQoKV2hpY2ggYWN0dWFsbHkgbWVhbnMgdGhh
dCBhIHVjb2RlIGJsb2Igd2FzIHBhcnNlZCBmaW5lLCBidXQgbm8gbWF0Y2hpbmcKdWNvZGUgd2Fz
IGZvdW5kLgoKU2lnbmVkLW9mZi1ieTogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRy
aXguY29tPgpSZXZpZXdlZC1ieTogQ2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT4KQWNrZWQt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCnYzIC0tPiB2NDoKLSBhZGRl
ZCBtaXNzaW5nIG1pY3JvY29kZV9mcmVlX3BhdGNoKCkKCnYyIC0tPiB2MzoKLSBtb3ZlIHVjb2Rl
IGNvbXBhcmlzb24gdG8gZ2VuZXJpYyBjb2RlCi0gaWdub3JlIC1FTk9EQVRBIGluIGEgZGlmZmVy
ZW50IGNvZGUgc2VjdGlvbgoKdjEgLS0+IHYyOgotIGNvbXBhcmUgcHJvdmlkZWQgdWNvZGUgd2l0
aCB0aGUgY3VycmVudGx5IGNhY2hlZCBvbmUKCkNDOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+CkNDOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDQzog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkNDOiBDaGFvIEdhbyA8Y2hh
by5nYW9AaW50ZWwuY29tPgpDQzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0K
IHhlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYyAgICAgfCAyMCArKysrKysrKysrKysrKysrKysrKwog
eGVuL2FyY2gveDg2L21pY3JvY29kZV9hbWQuYyB8ICA3ICsrKysrKysKIDIgZmlsZXMgY2hhbmdl
ZCwgMjcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUu
YyBiL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYwppbmRleCA2NWQxZjQxZTdjLi42Y2VkMjkzZDg4
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbWljcm9jb2RlLmMKKysrIGIveGVuL2FyY2gveDg2
L21pY3JvY29kZS5jCkBAIC02NDAsMTAgKzY0MCwzMCBAQCBpbnQgbWljcm9jb2RlX3VwZGF0ZShY
RU5fR1VFU1RfSEFORExFX1BBUkFNKGNvbnN0X3ZvaWQpIGJ1ZiwgdW5zaWduZWQgbG9uZyBsZW4p
CiAKICAgICBpZiAoICFwYXRjaCApCiAgICAgeworICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5J
TkcgIm1pY3JvY29kZTogY291bGRuJ3QgZmluZCBhbnkgbWF0Y2hpbmcgdWNvZGUgaW4gIgorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgInRoZSBwcm92aWRlZCBibG9iIVxuIik7CiAgICAg
ICAgIHJldCA9IC1FTk9FTlQ7CiAgICAgICAgIGdvdG8gcHV0OwogICAgIH0KIAorICAgIC8qCisg
ICAgICogSWYgbWljcm9jb2RlX2NhY2hlIGV4aXN0cywgYWxsIENQVXMgaW4gdGhlIHN5c3RlbSBz
aG91bGQgaGF2ZSBhdCBsZWFzdAorICAgICAqIHRoYXQgdWNvZGUgcmV2aXNpb24uCisgICAgICov
CisgICAgc3Bpbl9sb2NrKCZtaWNyb2NvZGVfbXV0ZXgpOworICAgIGlmICggbWljcm9jb2RlX2Nh
Y2hlICYmCisgICAgICAgICBtaWNyb2NvZGVfb3BzLT5jb21wYXJlX3BhdGNoKHBhdGNoLCBtaWNy
b2NvZGVfY2FjaGUpICE9IE5FV19VQ09ERSApCisgICAgeworICAgICAgICBzcGluX3VubG9jaygm
bWljcm9jb2RlX211dGV4KTsKKyAgICAgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HICJtaWNyb2Nv
ZGU6IGNvdWxkbid0IGZpbmQgYW55IG5ld2VyIHJldmlzaW9uICIKKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICJpbiB0aGUgcHJvdmlkZWQgYmxvYiFcbiIpOworICAgICAgICBtaWNyb2Nv
ZGVfZnJlZV9wYXRjaChwYXRjaCk7CisgICAgICAgIHJldCA9IC1FTk9FTlQ7CisKKyAgICAgICAg
Z290byBwdXQ7CisgICAgfQorICAgIHNwaW5fdW5sb2NrKCZtaWNyb2NvZGVfbXV0ZXgpOworCiAg
ICAgaWYgKCBtaWNyb2NvZGVfb3BzLT5zdGFydF91cGRhdGUgKQogICAgIHsKICAgICAgICAgcmV0
ID0gbWljcm9jb2RlX29wcy0+c3RhcnRfdXBkYXRlKCk7CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvbWljcm9jb2RlX2FtZC5jIGIveGVuL2FyY2gveDg2L21pY3JvY29kZV9hbWQuYwppbmRleCAx
ZTUyZjdmNDlhLi4wMDc1MGY3YmJiIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbWljcm9jb2Rl
X2FtZC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGVfYW1kLmMKQEAgLTUwMiw2ICs1MDIs
MTMgQEAgc3RhdGljIHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKmNwdV9yZXF1ZXN0X21pY3JvY29k
ZShjb25zdCB2b2lkICpidWYsCiAKICAgICBpZiAoIGVycm9yICkKICAgICB7CisgICAgICAgIC8q
CisgICAgICAgICAqIC1FTk9EQVRBIGhlcmUgbWVhbnMgdGhhdCB0aGUgYmxvYiB3YXMgcGFyc2Vk
IGZpbmUgYnV0IG5vIG1hdGNoaW5nCisgICAgICAgICAqIHVjb2RlIHdhcyBmb3VuZC4gRG9uJ3Qg
cmV0dXJuIGl0IHRvIHRoZSBjYWxsZXIuCisgICAgICAgICAqLworICAgICAgICBpZiAoIGVycm9y
ID09IC1FTk9EQVRBICkKKyAgICAgICAgICAgIGVycm9yID0gMDsKKwogICAgICAgICB4ZnJlZSht
Y19hbWQtPmVxdWl2X2NwdV90YWJsZSk7CiAgICAgICAgIHhmcmVlKG1jX2FtZCk7CiAgICAgICAg
IGdvdG8gb3V0OwotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
