Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 455F013939D
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 15:24:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir0aF-0002Bg-A5; Mon, 13 Jan 2020 14:20:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aHII=3C=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ir0aE-0002Bb-1a
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 14:20:46 +0000
X-Inumbo-ID: e2d1fe98-360f-11ea-8276-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2d1fe98-360f-11ea-8276-12813bfff9fa;
 Mon, 13 Jan 2020 14:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578925246;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=1aIKjCnNrRWreciZ4ihFd33cKIpF++jFwFsceNvOJPs=;
 b=SejTzKBXptpudVi/BmBiTYpZzBHDvP3yINK8tZTqUs0Rw06ryurSvd9j
 xI8sIJsKYsoY1Qwdmq+EiKGVAk23DSFozi0e2zPRH5vmV4/OXpZLGlUtL
 kY0GIghxXBnZuJcdKbytYncWUQxEPjyz6ljiGu4WRCzs9RjVvqNRUWvFz A=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: d3Hys91fCZ7FR6zatQaU2L+SGoK6zCbryFg96f/JwhW5+KTu7c3HkK0MyOmYacGkkSrxU9ntCX
 K+wBUs8SpC/e/FikG6/THog1b44qXEZCfnYJjenKDZqAhW2r0dyaB48THkcl6+Llt87W5J5teK
 nqzfgXGUlmy9ZFuK6+6kKsO4rD1qQV2fHeVCLhJ+7oR0yWTb00Nmp4R2/zlWTH9SYVlCcZoYoo
 l3ebK65ePOptFHkmUrXjXAk3eLmA2DNo/0n5A8CFbtvNoeoppC5ephVywGstfl81JBuaUUtZkc
 QYs=
X-SBRS: 2.7
X-MesageID: 10998265
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,429,1571716800"; d="scan'208";a="10998265"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24092.31929.622768.621943@mariner.uk.xensource.com>
Date: Mon, 13 Jan 2020 14:20:41 +0000
To: George Dunlap <george.dunlap@citrix.com>
In-Reply-To: <53f13d57-de57-cb29-512a-67d8312fa29a@citrix.com>
References: <20200109121227.949665-1-george.dunlap@citrix.com>
 <20200109121227.949665-2-george.dunlap@citrix.com>
 <53f13d57-de57-cb29-512a-67d8312fa29a@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2 2/2] libxl: Add new "notify-only"
 childproc mode
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Nick Rosbrook <rosbrookn@ainfosec.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJSZTogW1BBVENIIHYyIDIvMl0gbGlieGw6IEFkZCBuZXcg
Im5vdGlmeS1vbmx5IiBjaGlsZHByb2MgbW9kZSIpOgo+IEZBT0QsIHdpdGggdGhlIGZpeGVzIGlu
IHlvdXIgb3RoZXIgc2VyaWVzLCBJIGNvbnNpZGVyIHRoaXMgcGF0Y2ggdG8gbm93Cj4gYmUgbW9v
dC4KClJpZ2h0LiAgRlRPQUQsIEkgZG9uJ3QgdGhpbmsgdGhlcmUgd2FzIGEgcHJvYmxlbSB3aXRo
IHRoaXMgcGF0Y2gKcHJpbmNpcGxlOyBpdCdzIGp1c3Qgbm90IG5lZWRlZCBub3cuICBJZiBzb21l
b25lIGNvbWVzIHVwIHdpdGggYSB1c2UKZm9yIGl0IGluIHRoZSBmdXR1cmUgdGhlbiBpdCBjYW4g
YmUgcmVzdXJyZWN0ZWQgYW5kIHdlIHNob3VsZCBkbyBhCmRldGFpbGVkIGNvZGUgcmV2aWV3IG9m
IGl0IHRoZW4uCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
