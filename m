Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B363BA5BB2
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 19:08:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4plZ-0002hc-74; Mon, 02 Sep 2019 17:05:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1c4v=W5=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i4plX-0002hX-FT
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 17:05:19 +0000
X-Inumbo-ID: d67828f4-cda3-11e9-aea4-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d67828f4-cda3-11e9-aea4-12813bfff9fa;
 Mon, 02 Sep 2019 17:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567443918;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=a/y9qt8XzJDEr+8uPVfE7V0ezB2JpnrHuri3bYTNPyg=;
 b=E30VDOc/lCpcm8Oq3rrp5uVjfSoJ2hePdM5IvnKIuOfzJPALCBqupaAT
 Zz3dtBXiX7bgnG4jr63S1CwJbV6yn16Jl72sIyaDzXjBF7VYDARpqsEXG
 VKAEmBFzmSK5RuoV/FbdiKTLLtiN6iUiTL+1uXdyLbzSvN0L3nw8wwDWR Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 3/HcRGO7S8LYsiLPIvXUyB733jfUUmyp/Enjpd8EL6AMUZqX0WCcfbi7Gm57exUqBlsqy/Mmmm
 LAtUNjlpy55TNyvxFGkGV1/vo68nsTgxu1/xWc3ENOtbDvSs6fZ7Yrry+IhCN7ZoWhjanCBk4/
 X08bM38f0BVZcgLtoXY0ybO0m0swT83psnkIlr6dpgnZXrghOIleNT4AGaiXiAUEA+TmPNZrS7
 vt82DC4eHMWd3HrNXbplHrT2e47j/iaxYH6tPqYabBEQ7NKqpdGNkaGGhdrZZP6KW1kJmMK/PJ
 hw0=
X-SBRS: 2.7
X-MesageID: 5023818
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,459,1559534400"; 
   d="scan'208";a="5023818"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23917.19372.366767.365427@mariner.uk.xensource.com>
Date: Mon, 2 Sep 2019 18:04:44 +0100
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20190902164148.28977-3-andrew.cooper3@citrix.com>
References: <20190902164148.28977-1-andrew.cooper3@citrix.com>
 <20190902164148.28977-3-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 2/2] tools/shim: Apply more duct tape to the
 linkfarm logic
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
Cc: Wei Liu <wl@xen.org>, George
 Dunlap <George.Dunlap@citrix.com>, Sander Eikelenboom <linux@eikelenboom.it>,
 Jan
 Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0ggMi8yXSB0b29scy9zaGltOiBBcHBseSBtb3Jl
IGR1Y3QgdGFwZSB0byB0aGUgbGlua2Zhcm0gbG9naWMiKToKPiBTYW5kZXIgcmVwb3J0ZWQgYSBi
dWlsZCBmYWlsdXJlIHdoaWNoIG1hbmlmZXN0cyBhcyBgbWFrZTsgbWFrZSBpbnN0YWxsYAo+IGZh
aWxpbmcgd2l0aDoKCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4
LmNvbT4KCj4gVXBkYXRlIHRoZSBsaW5rZmFybSBsb2dpYyB0byBub3QgcmVnZW5lcmF0ZSBpdHNl
bGYgd2hlbiBidWlsZCBhcnRlZmFjdHMKPiBhcHBlYXIuICBUaGlzIGlzbid0IGEgY29tcHJlaGVu
c2l2ZSBmaXggYnV0IGlzIHRoZSBiZXN0IHdoaWNoIGNhbiBiZSBkb25lCj4gZWFzaWx5LiAgQW55
IGZ1cnRoZXIgZWZmb3J0IHdvdWxkIGJlIGJldHRlciBzcGVudCBtYWtpbmcgb3V0LW9mLXRyZWUg
YnVpbGRzCj4gd29yayBmb3IgWGVuLgoKRmFpciBlbm91Z2guCgpJYW4uCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
