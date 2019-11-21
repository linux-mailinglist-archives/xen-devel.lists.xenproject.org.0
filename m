Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A80C10543D
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 15:18:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXnFr-0006Og-HQ; Thu, 21 Nov 2019 14:16:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ACOY=ZN=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iXnFp-0006OZ-Vx
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 14:16:18 +0000
X-Inumbo-ID: 7b219882-0c69-11ea-9631-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b219882-0c69-11ea-9631-bc764e2007e4;
 Thu, 21 Nov 2019 14:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574345777;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=smOKpezglSA7w+wHqofK2mFAA5fqJwRGwiSpgA5F6xs=;
 b=gshqe8/8PTmmZe4fJKBH0zA1ogblqbBMl7zetKiV3gR7Ad6B4Rc0wM2m
 mY0m2siJNKbiiI1oZdH3+137G5ayLr6Y5ShpAeDLAop7OBseljenJhDpE
 B6qqD/QhavjjR2QVB/jDH4lkrzH6kRJDpTmjORuOaXt42RaOmBpwvBqWr g=;
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
IronPort-SDR: 06N0uHvjaJfADwRy9bMaFTJ947zAzOcYG35k3mfy7s03qbQOAVTWx42DIt/9uc0PlcH13W+UMM
 sobkT2rWw/6fCv46x4DDHLJXXZmwvSsBRB/wCI1gbYl4uNLPmFcI8CQK8XU/DZUus7Oj6fCy5Z
 j2lX9ofpqw56JwFcevVNwLlH4DsmFWvm/yZgI3+wDHxmxn3t2MnXIFv1f5QmOyYUtFSIe1oId/
 aeWFGOO1gfb0DamfezKnGb6tmtVglNrfir8/Lru2BAULwIcUO+UswAHjaP8VC3UtA7bJTdTzul
 Ekc=
X-SBRS: 2.7
X-MesageID: 9013913
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,226,1571716800"; 
   d="scan'208";a="9013913"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24022.39981.259598.394664@mariner.uk.xensource.com>
Date: Thu, 21 Nov 2019 14:16:13 +0000
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Oleksandr Grytsov
 <al1img@gmail.com>
In-Reply-To: <CAK9nU=rP3nUCqS3o-3hMLrLPE1s8+W40W=4HWSkd06Fi+cqzeg@mail.gmail.com>
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
 <CAK9nU=rP3nUCqS3o-3hMLrLPE1s8+W40W=4HWSkd06Fi+cqzeg@mail.gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] Status of 4.13
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2VpIExpdSB3cml0ZXMgKCJSZTogU3RhdHVzIG9mIDQuMTMiKToKPiBGV0lXIEkndmUgcHVzaGVk
IGFsbCB0aGUgdG9vbHN0YWNrIHBhdGNoZXMgdGhhdCBJJ20gYXdhcmUgb2YuCgpUaGUgb25seSB0
aGluZyBvdXRzdGFuZGluZyB0aGF0IEkgYW0gYXdhcmUgb2YgaXMKIFtQQVRDSCBmb3ItNC4xMyB2
MSAxLzJdIGxpYnhsOiBpbnRyb2R1Y2UgbmV3IGJhY2tlbmQgdHlwZSBWSU5QVVQKb2Ygd2hpY2gg
SSBhbSBhd2FpdGluZyBhIHJlc3BpbiBmcm9tIE9sZWtzYW5kciBHcnl0c292IChpbiB0aGUgVG8p
LgoKVGhlcmUgaXMgYSBuZXcgZGVmZWN0IGluIHRoZSA0LjEzIEFQSSwgd2hlcmUgYSBwYXJ0aWN1
bGFyIGVudW0gaGFzIHRoZQp2YWx1ZSBgbGludXgnIGZvciBhIG5vbi1MaW51eC1zcGVjaWZpYyBw
cm90b2NvbC4gIEknbSB3YW50aW5nIHRvCmNoYW5nZSBpdCBhbmQgSSB0aGluayB3ZSBoYXZlIGFn
cmVlZCBhIG5hbWUgY2hhbmdlIHRvIGBwdicuICBPbGVrc2FuZHIKd2FzIGdvaW5nIHRvIHRha2Ug
Y2FyZSBvZiB0aGF0IGluIGhpcyByZXNwaW4gb2YgdGhhdCBzbWFsbCAyLXBhdGNoCnNlcmllcy4K
Ck9sZWtzYW5kciwgd2hlbiBkbyB5b3UgdGhpbmsgeW91IHdpbGwgYmUgYWJsZSB0byBkbyB5b3Vy
IHJlc3BpbiA/CkkgYW0gbm90IHN1cmUgSSBrbm93IGV4YWN0bHkgd2hhdCB5b3Ugd2VyZSBwbGFu
bmluZyB0byBkbyBidXQgaWYgeW91CmFyZSBub3QgYXZhaWxhYmxlIEkgY291bGQgaGF2ZSBhIGdv
IGF0IGl0LiAgUGxlYXNlIGxldCBtZSBrbm93IEFTQVAuCgpJYW4uCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
