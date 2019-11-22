Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 440EA107426
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 15:40:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iYA3x-0003d0-21; Fri, 22 Nov 2019 14:37:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mZ44=ZO=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iYA3v-0003cv-5o
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 14:37:31 +0000
X-Inumbo-ID: 9c765d20-0d35-11ea-9631-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c765d20-0d35-11ea-9631-bc764e2007e4;
 Fri, 22 Nov 2019 14:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574433451;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=DOLzBrxU67FuKqxOkiwiEc7aDwux+1w5kEc8fPxdOLo=;
 b=Al/OZZ8vCUjwjYCuF/cPmesML5L9XK1+bbIjjRIPuM+aXcAUReIjQyF0
 Bn9nu64cc2VyODhWbp3Xusm9DYAuN+sAul4iskXieZetMK0TNh+tEayp6
 wYUbtxlIdkGDw5bDSKlzMxF3Yjt44ijz+Y12cBMl88JPxut2l8RR+483S A=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sF+tOVKF9vWAr7LZOy6zvTNsL07/4eluotlNbUOdb/PcQxl0XRkQsaNrwgiVhKkzQ0ZUNF2ZJj
 04E3/6/i0sfV76bNH9AeGSmu+6zBTi5xeK+FCDpRtF5efeXCYclrCp9zmBrLcW5O3pUvFJc/Gt
 oEiPazPqQ3MhurjYo9fqSCmjY2ew5PbAZHBIDWWtKLf/TXJ3DEtV8kx0uM+QiFeKGBuOjfHI2Z
 lJX2cN9/D4AJTzHtKIIvplslbRM+fd9zYmcUfOBsLUNncheq0vznB/K8TFl9Cg1RjqshkZErX5
 a8s=
X-SBRS: 2.7
X-MesageID: 8707683
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,229,1571716800"; 
   d="scan'208";a="8707683"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24023.62118.637721.494073@mariner.uk.xensource.com>
Date: Fri, 22 Nov 2019 14:37:26 +0000
To: Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
In-Reply-To: <20191122115640.ojms3gn64z3nsufk@debian>
References: <20191121181300.6497-1-al1img@gmail.com>
 <20191121181300.6497-3-al1img@gmail.com>
 <24023.49953.218810.697415@mariner.uk.xensource.com>
 <20191122115640.ojms3gn64z3nsufk@debian>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2 2/3] libxl: rename VKB backend type
 "linux" to "pv"
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
 Oleksandr Grytsov <al1img@gmail.com>,
 Oleksandr Grytsov <oleksandr_grytsov@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2VpIExpdSB3cml0ZXMgKCJSZTogW1BBVENIIHYyIDIvM10gbGlieGw6IHJlbmFtZSBWS0IgYmFj
a2VuZCB0eXBlICJsaW51eCIgdG8gInB2IiIpOgo+IFRoZSBMSU5VWCB0eXBlIHdhcyBpbnRyb2R1
Y2VkIGJhY2sgaW4gMjAxOC4KCk9oLiAgWWVzLiAgSSB1c2VkIGEgd3JvbmcgZ2l0LWRlc2NyaWJl
IHJ1bmUgdG8gdHJ5IHRvIGZpbmQgb3V0IHdoZXJlCml0IGhhZCBiZWVuIGludHJvZHVjZWQuICBU
aGUgYW5zd2VyIGluIGZhY3QgaXMgdGhhdCBpdCB3YXMgaW4KNC4xMi4wLXJjMS4gIFRoYW5rcyBm
b3IgcG9pbnRpbmcgdGhpcyBvdXQuCgpUaGFua3MgYWxzbyBmb3IgdGhlIDJuZCBwYWlyIG9mIGV5
ZXMgb24KIFtQQVRDSCB2MiAzLzNdIGxpYnhsOiBtYWtlIGRlZmF1bHQgcGF0aCB0byBhZGQvcmVt
b3ZlIGFsbCBQViBkZXZpY2VzCgo+IFRoaXMgcGF0Y2ggc2hvdWxkIGhhdmUgcHJvdmlkZWQgYXQg
bGVhc3QgYQo+ICAgI2RlZmluZSAuLi5MSU5VWCAuLi5QVgo+IGluIGxpYnhsLmggZm9yIGJhY2t3
YXJkIGNvbXBhdGliaWxpdHkgcHVycG9zZS4KClVuZGVyIHRoZSBjaXJjdW1zdGFuY2VzLCBnaXZl
biB0aGF0IEkgc3VnZ2VzdGVkIHRoZSByZW5hbWUgZHVyaW5nIHRoZQo0LjEzIGZyZWV6ZSwgYW5k
IHRoZSAoSU1PIHdyb25nKSBuYW1lIHdhcyBzaGlwcGVkIGluIDQuMTIsIGl0IHNlZW1zCnRoYXQg
d2Ugc2hvdWxkIGRyb3AgdGhpcyBwYXRjaCBmb3IgNC4xMy4gIFRoaXMgaXMgc29tZXRoaW5nIHRo
YXQKcGVyaGFwcyB3ZSBzaG91bGQgdGhpbmsgYWJvdXQgZm9yIHRoZSBmdXR1cmUgYnV0IGlmIGl0
J3MgYmVlbiByZWxlYXNlZAphbHJlYWR5IHRoZSBjb3N0IG9mIG1lc3NpbmcgYWJvdXQgd2l0aCB0
aGUgbmFtZSBpcyBzaGFycGx5IGxhcmdlciwgYW5kCml0IG1heSBub3QgYmUgd29ydGggaXQgYXQg
YWxsLiAgU29ycnkgZm9yIG1lc3NpbmcgeW91IGFib3V0IG1vcmUsCk9sZWtzYW5kci4KClRoZSBv
dGhlciB0d28gcGF0Y2hlcyAxLyBhbmQgMy8gYXBwbHkgYW5kIHdvcmsganVzdCBmaW5lIHdpdGhv
dXQgdGhpcwptaWRkbGUgb25lLCBzbyBJIGRvbid0IHRoaW5rIHdlIG5lZWQgYSByZXNlbmQuCgpJ
J20gc3RpbGwgaG9waW5nIGZvciBhIDJuZCBwYWlyIG9mIGV5ZXMgb24KIFtQQVRDSCB2MiAxLzNd
IGxpYnhsOiBpbnRyb2R1Y2UgbmV3IGJhY2tlbmQgdHlwZSBWSU5QVVQKCmFuZCBhIHJlbGVhc2Ug
YWNrIGZvciBib3RoIDEvMyBhbmQgMy8zLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
