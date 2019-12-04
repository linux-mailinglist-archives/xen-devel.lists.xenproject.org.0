Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E7D11283E
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 10:46:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icRCF-0003yZ-FZ; Wed, 04 Dec 2019 09:43:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=d3Le=Z2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1icRCD-0003yP-Ia
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 09:43:45 +0000
X-Inumbo-ID: 8f780300-167a-11ea-81ff-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8f780300-167a-11ea-81ff-12813bfff9fa;
 Wed, 04 Dec 2019 09:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575452625;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=14ltXQg/f7zjvdRa6Kb4UDM4mzmqGSrll3AKGx1VX6A=;
 b=C9AU9WjdqX2ZYIfIu36uim6jXHuBY+uhg3a4JOMF4CCajJlnvntBzUof
 ijNsJlhmBJyi8BRm6dhX6CyjM7ZETDoEQrfzuEfjqAo0lKAh0OhFjNNe6
 N/I1oSkft9UjFPSe4R7UrlGartvKk5NWGBp1hx7qrLkk7+oFo8nubbMn7 E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8so9Gt4kTWvMy9QC9+ztxleTm4G/Vso71LiRPUGVLI7JpydBmPRHcMUOGlzKjZO6UO2ijGiqEA
 Uq2pB09+eLXL+HTNntrpI1nM2c80jQjlL77hWHMEMMI+qq0Kj2elR+Z30DA1FQNwBOWVGaBGUz
 ZKJtIBf8yFN0sAURRk13PKB3PNxzneThL5AVxPTrA4Sl9QmejE9NfERMnQswxkdGP4skuIC7Sa
 zNKDQHUWizzd5XYq6GYrcf9NsMzUaM/uYMkDDq54Jm8zZpv3dhxaWQYMB0NUFdbX3RmP9QHoIO
 ZAo=
X-SBRS: 2.7
X-MesageID: 9165297
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,277,1571716800"; 
   d="scan'208";a="9165297"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 4 Dec 2019 09:43:31 +0000
Message-ID: <20191204094335.24603-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/4] x86/svm: (Post TASK_SWITCH) cleanup
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VmFyaW91cyBiaXRzIG9mIGNsZWFudXAgc3RlbW1pbmcgZnJvbSB0aGUgcmVjZW50IFRBU0tfU1dJ
VENIIGZpeGVzLgoKVGhpcyBzZXJpZXMgZGVwZW5kcyBvbiBib3RoCiAgeDg2L3N2bTogQ29ycmVj
dCB2bV9ldmVudCBBUEkgZm9yIGRlc2NyaXB0b3IgYWNjZXNzZXMKICB4ODYvc3ZtOiBGaXggaGFu
ZGxpbmcgb2YgRUZMQUdTLlJGIG9uIHRhc2sgc3dpdGNoCgpwb3N0ZWQgc2VwYXJhdGVseSBkdWUg
dG8gdGhlaXIgYnVnZml4IG5hdHVyZSwgYnV0IG5laXRoZXIgYXJlIG92ZXJseSBpbXBvcnRhbnQK
Zm9yIHJldmlldyBwdXJwb3Nlcy4KCkFuZHJldyBDb29wZXIgKDQpOgogIHg4Ni9zdm06IENsZWFu
IHVwIGNvbnN0cnVjdF92bWNiKCkKICB4ODYvc3ZtOiBEb24ndCBzaGFkb3cgdmFyaWFibGVzIGlu
IHN2bV92bWV4aXRfaGFuZGxlcigpCiAgeDg2L3N2bTogQ2xlYW4gdXAgaW50aW5mb190IHZhcmlh
YmxlcwogIHg4Ni9zdm06IFVzZSBuYW1lZCAoYml0KWZpZWxkcyBmb3IgdGFzayBzd2l0Y2ggZXhp
dCBpbmZvCgogeGVuL2FyY2gveDg2L2h2bS9zdm0vaW50ci5jICAgICAgICB8ICAzMiArKysrLS0t
LQogeGVuL2FyY2gveDg2L2h2bS9zdm0vbmVzdGVkc3ZtLmMgICB8ICAyOCArKystLS0tCiB4ZW4v
YXJjaC94ODYvaHZtL3N2bS9zdm0uYyAgICAgICAgIHwgMTQ1ICsrKysrKysrKysrKysrKystLS0t
LS0tLS0tLS0tLS0tLS0tLS0KIHhlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bWRlYnVnLmMgICAgfCAg
MTIgKy0tCiB4ZW4vYXJjaC94ODYvaHZtL3N2bS92bWNiLmMgICAgICAgIHwgIDc1ICsrKysrKy0t
LS0tLS0tLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3N2bS92bWNiLmggfCAgNTUgKysr
KysrKysrLS0tLS0KIDYgZmlsZXMgY2hhbmdlZCwgMTUzIGluc2VydGlvbnMoKyksIDE5NCBkZWxl
dGlvbnMoLSkKCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
