Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0677516AD7A
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 18:31:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6HWX-0001rL-62; Mon, 24 Feb 2020 17:28:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gH7p=4M=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j6HWW-0001rG-HJ
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 17:28:04 +0000
X-Inumbo-ID: 03257da0-572b-11ea-8cb6-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03257da0-572b-11ea-8cb6-bc764e2007e4;
 Mon, 24 Feb 2020 17:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582565283;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=tGSDbjz4XY8snxGYizWZsXeZB/Ge/RJoR/mRE/+buDU=;
 b=IXIpEMMX18QRIxeO2Q08R9u65Lo1d2ePUXbiCVFndbF49OGE7r2ud2F9
 PXZ4FHlHN2DwLjpHa8668TkMw/kkbo0fo4GDE4K5M4g8b7BBuB7zm9Q0Z
 n/tHmkHmfM4Z1mkSuDVfGmk5wcZr4RWXOMGeYifIVSlhjCJo+LkQiwoAB U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: TK24x+zKgmv38TGKT7xpw1plp3+cx8QReBB8YkFMRS8wn9AtZ22+zTIvT6DMa8JJH/xGeYXfKS
 8bv8Pnlrk56g4YZ9Klc8iIysrHMggRs3GnWDeiyguxk9UlNNHbmZe+cpbQQf+muHllVNHV7OI2
 aSZJ7Q2T54YQsAUT8mXBONi2mJR/RFXbLh0iNBa8v3PWK8tSRsAABTTzYIPgAAo4dkDlxPqZge
 wNn5zBmIo1uVoJa6OAL1xRwW/gvgZCJVOGwJesTAqx9ga+oOyc9TArk2GldBxiMQEj1XyYrV9F
 ahs=
X-SBRS: 2.7
X-MesageID: 13277794
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,480,1574139600"; d="scan'208";a="13277794"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24148.1952.693232.729195@mariner.uk.xensource.com>
Date: Mon, 24 Feb 2020 17:28:00 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20200127143444.25538-6-andrew.cooper3@citrix.com>
References: <20200127143444.25538-1-andrew.cooper3@citrix.com>
 <20200127143444.25538-6-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2 05/17] python/migration: Update
 validation logic to understand a v3 stream
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0ggdjIgMDUvMTddIHB5dGhvbi9taWdyYXRpb246
IFVwZGF0ZSB2YWxpZGF0aW9uIGxvZ2ljIHRvIHVuZGVyc3RhbmQgYSB2MyBzdHJlYW0iKToKPiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoK
QWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKSSdtIG5v
dCBzdXJlIGlmIEkgY29tbWVudCBhYm91dCBtYW5pZmVzdCBjb25zdGFudHMgZm9yIGAyJyBhcHBs
eSBoZXJlLgpUaGlzIGlzIGEgdmFsaWRhdGlvbiBwcm9ncmFtLCBub3QgYSBwcm9kdWN0aW9uIHRv
b2wsIEFJVUksIHNvIGl0J3MKbGVzcyBjcml0aWNhbCB0byBiZSBhYmxlIHRvIGdldCBpdCByaWdo
dC4gIFdoYXQgZG8geW91IHRoaW5rID8KClRoYW5rcywKSWFuLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
