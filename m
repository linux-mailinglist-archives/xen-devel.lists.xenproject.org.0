Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CED015D630
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2020 12:03:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2YiI-0007fF-Vy; Fri, 14 Feb 2020 11:00:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SROB=4C=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j2YiH-0007fA-DP
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 11:00:49 +0000
X-Inumbo-ID: 41218b7c-4f19-11ea-bc8e-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 41218b7c-4f19-11ea-bc8e-bc764e2007e4;
 Fri, 14 Feb 2020 11:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581678049;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=zrOB88Zvsnp0KsTQa3PG8RsXVgFUUgrB6an4jHHnxlw=;
 b=iEUiM/9AG6CMfOxxY7azO7Klb2YzYYj1jPtM2FL7uy7oHdM0ns9xOSDc
 7zWYxJu0fd6thc/kkbXgk+6huvFBLjQ9gcvKQt2ankJEoD8zOlPuQ/uz9
 y4C96DymGo124A5VNKA1mhk39XAV3YqZliMsL0zUU8HEJXcsXVodjryyo Q=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: iMXPVooOip1vShpFE9b9fKBIpJUvdNXuQPTBOQrZD8H27QpsxLiHsChG4xkQNnqTdyQlcQ1gRe
 o8JZUIl2MpxZMkUNmNloRGpbubZt+dm2FQ0wvGJAfjw6sSNC4ZDe5Us/6fP6uwvif5ZOIxq1NA
 eSWnZzXEKHODLmJyWm76g4O/GJRs2PyUtTULoNecSUQUGIl7WwTiCBLqgiytJeoXAjfK4UHBiJ
 zDDFyc0Xiov1Ly2nnlqI7rG7Pz3WvW8knVsXWB4EIRCD/xJlo9oMcTeK0nsI45mgVlnX2YPu9g
 txs=
X-SBRS: 2.7
X-MesageID: 12464523
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,440,1574139600"; d="scan'208";a="12464523"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24134.32220.165853.192855@mariner.uk.xensource.com>
Date: Fri, 14 Feb 2020 11:00:44 +0000
To: Wei Liu <wl@xen.org>
In-Reply-To: <20200214103911.7995-1-wl@xen.org>
References: <20200214103911.7995-1-wl@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] libxl: mark parameters in stub functions as
 unused
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
 Xen Development List <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2VpIExpdSB3cml0ZXMgKCJbUEFUQ0hdIGxpYnhsOiBtYXJrIHBhcmFtZXRlcnMgaW4gc3R1YiBm
dW5jdGlvbnMgYXMgdW51c2VkIik6Cj4gSG9wZWZ1bGx5IHRoaXMgY2FuIGZpeCBpc3N1ZXMgbGlr
ZToKPiAKPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi4vLi4vc3JjL2xpYnhsL3hlbl94bC5jOjI0
OjA6Cj4gL2hvbWUvb3NzdGVzdC9idWlsZC4xNDcwMzUuYnVpbGQtYW1kNjQtbGlidmlydC94ZW5k
aXN0L3Vzci9sb2NhbC9pbmNsdWRlL2xpYnhsLmg6IEluIGZ1bmN0aW9uICdsaWJ4bF9jcHVpZF9h
cHBseV9wb2xpY3knOgo+IC9ob21lL29zc3Rlc3QvYnVpbGQuMTQ3MDM1LmJ1aWxkLWFtZDY0LWxp
YnZpcnQveGVuZGlzdC91c3IvbG9jYWwvaW5jbHVkZS9saWJ4bC5oOjIzNDU6NTY6IGVycm9yOiB1
bnVzZWQgcGFyYW1ldGVyICdjdHgnIFstV2Vycm9yPXVudXNlZC1wYXJhbWV0ZXJdCj4gIHN0YXRp
YyBpbmxpbmUgdm9pZCBsaWJ4bF9jcHVpZF9hcHBseV9wb2xpY3kobGlieGxfY3R4ICpjdHgsIHVp
bnQzMl90IGRvbWlkKSB7fQo+IAo+IEZpeGVzOiBkYWNiODBmOSAoInRvb2xzL2xpYnhsOiBSZW1v
dmUgbGlieGxfY3B1aWRfe3NldCxhcHBseV9wb2xpY3l9KCkgZnJvbSB0aGUgQVBJIikKPiBTaWdu
ZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+IC0tLQo+IE5vdCBhYmxlIHRvIHRlc3Qg
dGhpcyBsb2NhbGx5LCBwbGVhc2UgcmV2aWV3IGNhcmVmdWxseS4uLgoKVGhlIHN5bnRheCBsb29r
cyBnb29kIHRvIG1lLiAgSSBoYXZlbid0IGNvbXBpbGVkIGl0LgoKQWNrZWQtYnk6IElhbiBKYWNr
c29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKSWFuLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
