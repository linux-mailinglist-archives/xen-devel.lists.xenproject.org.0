Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2743113973A
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 18:12:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir3DF-0008R1-Ja; Mon, 13 Jan 2020 17:09:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aHII=3C=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ir3DD-0008PL-GA
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 17:09:11 +0000
X-Inumbo-ID: 6270cbae-3627-11ea-a985-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6270cbae-3627-11ea-a985-bc764e2007e4;
 Mon, 13 Jan 2020 17:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578935337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=sLDqHTClNnROCHsi6O1BZrcsQlEL0fvL+A+EWmDwQbI=;
 b=KscGE48UDKx9fM/9apGU/Uj9ZEuSVJU2j5pXiibt3uHEA8nRAF20PzVR
 NrjuEfgd+yUHXuhJKUjBouXmoWqYyd8rAym2XneZhxcbCmVtPlx+lhGn5
 G2qHEk/s6nEzMyVhFHRlJZLt772mVTI6zK9fdMUCcsUeYz+cgUFuVszgw E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Rl4YGquM1J4Ujo5fINEUxwlpexIL6DmoQmgYJHUgKas0SiJi4iZMQTw9/ZlxNTQr3TT3VZHVwe
 5axQjJ+VGRvVV42HAdWEh69IGnajboy0ISxkY3U8qz1egOYEDgmH7mdVmexaFrS106FjUp8qpN
 EMrrKRcNQPKq2AKAR6nNHqs7JOD00yZNsP7clayVzaWmCzcgiiAYoWv7h9XMZ+0ZAFprRGrrfe
 6V4/24FsyKa29PJ0p/kk7kZdOR/dQbhjpe3Ldlj0iJsbcBWrhev6Kxbhh56i9SYZwlKTT9U3pB
 oD8=
X-SBRS: 2.7
X-MesageID: 10859017
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,429,1571716800"; d="scan'208";a="10859017"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 13 Jan 2020 17:08:43 +0000
Message-ID: <20200113170843.21332-11-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200113170843.21332-1-ian.jackson@eu.citrix.com>
References: <20200113170843.21332-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 10/10] libxl: event: Move poller pipe
 emptying to the end of afterpoll
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWYgYSB0aW1lciBldmVudCBjYWxsYmFjayBjYXVzZXMgdGhpcyBwb2xsZXIgdG8gYmUgd29rZW4g
KG5vdCB2ZXJ5CnVubGlrZWx5KSB3ZSB3b3VsZCBnbyByb3VuZCB0aGUgcG9sbCBsb29wIHR3aWNl
IHJhdGhlciB0aGFuIG9uY2UuCgpEbyB0aGUgcG9sbGVyIHBpcGUgZW1wdHlpbmcgYXQgdGhlIGVu
ZDsgdGhpcyBpcyBzbGlnaHRseSBtb3JlCmVmZmljaWVudCBiZWNhdXNlIGl0IGNhbid0IGNhdXNl
IGFueSBjYWxsYmFja3MsIHNvIGl0IGhhcHBlbnMgYWZ0ZXIKYWxsIHRoZSBjYWxsYmFja3MgaGF2
ZSBiZWVuIHJ1bi4KCihUaGlzIHBpcGUtZW1wdHlpbmcgaGFzIHRvIGhhcHBlbiBpbiBhZnRlcnBv
bGwgcmF0aGVyIHRoYW4gdGhlCmFwcGFyZW50bHkgbW9yZSBsb2dpY2FsIGJlZm9yZXBvbGwsIGJl
Y2F1c2UgdGhlIGFwcGxpY2F0aW9uIGNhbGxpbmcKYmVmb3JlcG9sbCBkb2Vzbid0IGNvbnN0aXR1
dGUgYSBwcm9taXNlIHRvIGFjdHVhbGx5IGRvIGFueXRoaW5nLikKClNpZ25lZC1vZmYtYnk6IElh
biBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIHRvb2xzL2xpYnhsL2xp
YnhsX2V2ZW50LmMgfCAxMiArKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfZXZl
bnQuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2V2ZW50LmMKaW5kZXggNWY2YTYwN2Q4MC4uN2M1Mzg3
ZTk0ZiAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfZXZlbnQuYworKysgYi90b29scy9s
aWJ4bC9saWJ4bF9ldmVudC5jCkBAIC0xNDUzLDEyICsxNDUzLDYgQEAgc3RhdGljIHZvaWQgYWZ0
ZXJwb2xsX2ludGVybmFsKGxpYnhsX19lZ2MgKmVnYywgbGlieGxfX3BvbGxlciAqcG9sbGVyLAog
ICAgICAgICBmZF9vY2N1cnMoZWdjLCBlZmQsIHJldmVudHMpOwogICAgIH0KIAotICAgIGlmIChh
ZnRlcnBvbGxfY2hlY2tfZmQocG9sbGVyLGZkcyxuZmRzLCBwb2xsZXItPndha2V1cF9waXBlWzBd
LFBPTExJTikpIHsKLSAgICAgICAgcG9sbGVyLT5waXBlX25vbmVtcHR5ID0gMDsKLSAgICAgICAg
aW50IGUgPSBsaWJ4bF9fc2VsZl9waXBlX2VhdGFsbChwb2xsZXItPndha2V1cF9waXBlWzBdKTsK
LSAgICAgICAgaWYgKGUpIExJQlhMX19FVkVOVF9ESVNBU1RFUihnYywgInJlYWQgd2FrZXVwIiwg
ZSwgMCk7Ci0gICAgfQotCiAgICAgZm9yICg7OykgewogICAgICAgICBsaWJ4bF9fZXZfdGltZSAq
ZXRpbWUgPSBMSUJYTF9UQUlMUV9GSVJTVCgmQ1RYLT5ldGltZXMpOwogICAgICAgICBpZiAoIWV0
aW1lKQpAQCAtMTQ3Myw2ICsxNDY3LDEyIEBAIHN0YXRpYyB2b2lkIGFmdGVycG9sbF9pbnRlcm5h
bChsaWJ4bF9fZWdjICplZ2MsIGxpYnhsX19wb2xsZXIgKnBvbGxlciwKIAogICAgICAgICB0aW1l
X29jY3VycyhlZ2MsIGV0aW1lLCBFUlJPUl9USU1FRE9VVCk7CiAgICAgfQorCisgICAgaWYgKGFm
dGVycG9sbF9jaGVja19mZChwb2xsZXIsZmRzLG5mZHMsIHBvbGxlci0+d2FrZXVwX3BpcGVbMF0s
UE9MTElOKSkgeworICAgICAgICBwb2xsZXItPnBpcGVfbm9uZW1wdHkgPSAwOworICAgICAgICBp
bnQgZSA9IGxpYnhsX19zZWxmX3BpcGVfZWF0YWxsKHBvbGxlci0+d2FrZXVwX3BpcGVbMF0pOwor
ICAgICAgICBpZiAoZSkgTElCWExfX0VWRU5UX0RJU0FTVEVSKGdjLCAicmVhZCB3YWtldXAiLCBl
LCAwKTsKKyAgICB9CiB9CiAKIHZvaWQgbGlieGxfb3NldmVudF9hZnRlcnBvbGwobGlieGxfY3R4
ICpjdHgsIGludCBuZmRzLCBjb25zdCBzdHJ1Y3QgcG9sbGZkICpmZHMsCi0tIAoyLjExLjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
