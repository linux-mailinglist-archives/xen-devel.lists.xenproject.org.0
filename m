Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1497F13F357
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 19:43:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isA3s-0007U2-Vf; Thu, 16 Jan 2020 18:40:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M+HB=3F=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1isA3r-0007PY-1F
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 18:40:07 +0000
X-Inumbo-ID: 9897dea6-388f-11ea-b89f-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9897dea6-388f-11ea-b89f-bc764e2007e4;
 Thu, 16 Jan 2020 18:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579199998;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=JPuvrzaOmb6wRlLnrg0Suy+W2ZYcHY4zjkxhNC90d9Y=;
 b=Yr/V1ErHebjN7pLNklb/A/1LtJ6BUIUk4lMle9JiU5qQpb3sfXFjM9x0
 agr6Mwf9IBx2uxhzbFr2PYUQQMaC9o0Xixlc4tZI+1xoTb68CxYUSpr/K
 lK1lDnu1dprGDSsXPmX1I6v1nFYYZm860mi0mPW9rZ6sq0g7bd6f941U2 o=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
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
IronPort-SDR: qTm+gKSywTPoEscg5JWZSp3iZsEQJv6HmcyGvxpUmr0MPfE5QS3ByD28Nq+qNhJcnIG5sqK8HY
 TUqBfmuIBVRVtPMcTm4swIaK3PI4qBPYsMefrBCiFrvLlBzYJ+7t1Iwrw58S/fCpGkOtowFHt5
 YEYuo+R+E0K/Xk2+XtH6PVeKVsvg/cfbXN6BgduASqcS3k311m3u2MPdFzgGE3DvTU7sNR3XrD
 udiLsBrB7KgTJcFbEMwwlksJOL3kElhKTqv6y6ZUkBabRpR2IFsJ7Z2wmFiAbbnWzcLHQWmWLD
 uAY=
X-SBRS: 2.7
X-MesageID: 11627256
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,327,1574139600"; d="scan'208";a="11627256"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24096.44539.298181.766270@mariner.uk.xensource.com>
Date: Thu, 16 Jan 2020 18:39:55 +0000
To: Paul Durrant <pdurrant@amazon.com>
In-Reply-To: <20200116093602.4203-7-pdurrant@amazon.com>
References: <20200116093602.4203-1-pdurrant@amazon.com>
 <20200116093602.4203-7-pdurrant@amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v3 6/6] xl: allow domid to be preserved on
 save/restore or migrate
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSCB2MyA2LzZdIHhsOiBhbGxvdyBkb21pZCB0byBi
ZSBwcmVzZXJ2ZWQgb24gc2F2ZS9yZXN0b3JlIG9yIG1pZ3JhdGUiKToKPiBUaGlzIHBhdGNoIGFk
ZHMgYSAnLUQnIGNvbW1hbmQgbGluZSBvcHRpb24gdG8gc2F2ZSBhbmQgbWlncmF0ZSB0byBhbGxv
dwo+IHRoZSBkb21haW4gaWQgdG8gYmUgaW5jb3Jwb3JhdGVkIGludG8gdGhlIHNhdmVkIGRvbWFp
biBjb25maWd1cmF0aW9uIGFuZAo+IGhlbmNlIGJlIHByZXNlcnZlZC4KCkkgd29uZGVyIGlmIHRo
aXMgc2hvdWxkIGJlIGRvbmUgbW9yZSBpbiBsaWJ4bC4gIFNob3VsZCB0aGlzIGJlIGEKZG9tYWlu
IHByb3BlcnR5ID8gIFdlaSwgQW50aG9ueSA/CgpUaGUgY29kZSBMR1RNIGlmIHdlIGFyZSBnb2lu
ZyB0byBkbyB0aGlzIGluIHhsLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
