Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AABE2136E16
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 14:31:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipuM2-0002BL-Qd; Fri, 10 Jan 2020 13:29:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0O1r=27=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ipuM0-0002A7-US
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 13:29:32 +0000
X-Inumbo-ID: 2f87359c-33ad-11ea-a2eb-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f87359c-33ad-11ea-a2eb-bc764e2007e4;
 Fri, 10 Jan 2020 13:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578662951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=HAh5Gp+uESpDijBcjwZlp5s66xVVTo2w8VLzP3EQSvI=;
 b=Eb8TosCmhIlqSikYvLDP4YyfMis5BF0dmd05lpq/Bz3bmRww16xeYroo
 XsBXVcPf92uj9V171B7MQwZrOeJWFD0AjRuxdp0DueUm6ajp4o6wDmkWt
 vYPBcrS0hEKrOjtdiyONkzE5Hihg5q2sgcCc9ZhI70G0KOvZ5+e5TuhSW 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1Xz9hfuyzm6jtUOsKxdDbQyUQawiHrB917HX1uS1QSgOrZ6JJIZ96UWcBitMdGi0ZJR/Rw0t7J
 zT/7DNe6VHG6YeFlT/wBvn622fYnoCcWYYDhOfnDjx7dNPjcbxY1QVejIaqSSpMDLUuangrCHD
 8jYCK/HzYxABkKl7iqPgEw/sVOPUY53bR7eXEkOzDESFwva53rSengqRc8sbw9Q5t81HkjPGqF
 +NIOkIBkGW1oNwrSmD4kQM3dyDmY3A7y2gwPp1+NGcEWCXPWJHyPeStcfOz9346jpt+2MsSxFV
 ZlU=
X-SBRS: 2.7
X-MesageID: 11329930
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,417,1571716800"; d="scan'208";a="11329930"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 10 Jan 2020 13:29:02 +0000
Message-ID: <20200110132902.29295-9-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200110132902.29295-1-ian.jackson@eu.citrix.com>
References: <20200110132902.29295-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 8/8] libxl: event: Move poller pipe emptying to
 the end of afterpoll
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
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
bnQuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2V2ZW50LmMKaW5kZXggNDMxNDE5MWMzYi4uZjU5ZmJj
NzE5ZSAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfZXZlbnQuYworKysgYi90b29scy9s
aWJ4bC9saWJ4bF9ldmVudC5jCkBAIC0xMzI2LDEyICsxMzI2LDYgQEAgc3RhdGljIHZvaWQgYWZ0
ZXJwb2xsX2ludGVybmFsKGxpYnhsX19lZ2MgKmVnYywgbGlieGxfX3BvbGxlciAqcG9sbGVyLAog
ICAgICAgICBmZF9vY2N1cnMoZWdjLCBlZmQsIHJldmVudHMpOwogICAgIH0KIAotICAgIGlmIChh
ZnRlcnBvbGxfY2hlY2tfZmQocG9sbGVyLGZkcyxuZmRzLCBwb2xsZXItPndha2V1cF9waXBlWzBd
LFBPTExJTikpIHsKLSAgICAgICAgcG9sbGVyLT5waXBlX25vbmVtcHR5ID0gMDsKLSAgICAgICAg
aW50IGUgPSBsaWJ4bF9fc2VsZl9waXBlX2VhdGFsbChwb2xsZXItPndha2V1cF9waXBlWzBdKTsK
LSAgICAgICAgaWYgKGUpIExJQlhMX19FVkVOVF9ESVNBU1RFUihlZ2MsICJyZWFkIHdha2V1cCIs
IGUsIDApOwotICAgIH0KLQogICAgIGZvciAoOzspIHsKICAgICAgICAgbGlieGxfX2V2X3RpbWUg
KmV0aW1lID0gTElCWExfVEFJTFFfRklSU1QoJkNUWC0+ZXRpbWVzKTsKICAgICAgICAgaWYgKCFl
dGltZSkKQEAgLTEzNDYsNiArMTM0MCwxMiBAQCBzdGF0aWMgdm9pZCBhZnRlcnBvbGxfaW50ZXJu
YWwobGlieGxfX2VnYyAqZWdjLCBsaWJ4bF9fcG9sbGVyICpwb2xsZXIsCiAKICAgICAgICAgdGlt
ZV9vY2N1cnMoZWdjLCBldGltZSwgRVJST1JfVElNRURPVVQpOwogICAgIH0KKworICAgIGlmIChh
ZnRlcnBvbGxfY2hlY2tfZmQocG9sbGVyLGZkcyxuZmRzLCBwb2xsZXItPndha2V1cF9waXBlWzBd
LFBPTExJTikpIHsKKyAgICAgICAgcG9sbGVyLT5waXBlX25vbmVtcHR5ID0gMDsKKyAgICAgICAg
aW50IGUgPSBsaWJ4bF9fc2VsZl9waXBlX2VhdGFsbChwb2xsZXItPndha2V1cF9waXBlWzBdKTsK
KyAgICAgICAgaWYgKGUpIExJQlhMX19FVkVOVF9ESVNBU1RFUihlZ2MsICJyZWFkIHdha2V1cCIs
IGUsIDApOworICAgIH0KIH0KIAogdm9pZCBsaWJ4bF9vc2V2ZW50X2FmdGVycG9sbChsaWJ4bF9j
dHggKmN0eCwgaW50IG5mZHMsIGNvbnN0IHN0cnVjdCBwb2xsZmQgKmZkcywKLS0gCjIuMTEuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
