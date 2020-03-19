Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C090518BF96
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 19:46:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jF08h-0005UT-3Q; Thu, 19 Mar 2020 18:43:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=e0hQ=5E=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jF08g-0005Tv-3V
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 18:43:30 +0000
X-Inumbo-ID: 85e8dc20-6a11-11ea-bc57-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 85e8dc20-6a11-11ea-bc57-12813bfff9fa;
 Thu, 19 Mar 2020 18:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584643409;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=yUCUH7Um8LqCO34KY+1fgWNdqolqhkoj2m+ZLPUt6BY=;
 b=VTlHoe559KTKdiHvc6L+WEkOZ/CozI0corR5swA3ar4XNFfjdrwZi75s
 wHbWMJMpTMrcnEC5NtOs0tFMhvTPGne73tQ+fW835LjujvUCcebuLfH8H
 Fzlz37I2cLDjEhNZBzzsORPct0H3+UuD+bHGgM6hHE/VNvIhWLbulAQlW 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: M5gJM77D6NSmZNlTVQRgqv6FvwIV8V+4H6IOfy8rRehBjTB1Yeut5fBLtySLFOTmOdxM+HeQSy
 8vRyhpSFJmXeZ1vsnwf4eue+ZbvgO5Fs8wolAKGvcLJwrHInb48my9sysh2V/xmKXRyIMYulAo
 xpfXqDUClj/Kk/s7wUdeVUiAjYlKSmaaMjz3BHXljJojxCkybzMEKESNmxvkG+TsI7t41h/LXD
 ZgEwyBjKindlvEDpFN3/b6F3cUATvAjf5NmC+x+vFyipjSDtwO58COmPY/7AOY8vqjR/7z1Ti2
 wgg=
X-SBRS: 2.7
X-MesageID: 14303263
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,572,1574139600"; d="scan'208";a="14303263"
Date: Thu, 19 Mar 2020 19:43:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Message-ID: <20200319184305.GR24458@Air-de-Roger.citrite.net>
References: <20200319154716.34556-1-roger.pau@citrix.com>
 <20200319154716.34556-2-roger.pau@citrix.com>
 <83b8dc44-6ecf-9bdf-957b-3c502e4df926@xen.org>
 <20200319173825.GQ24458@Air-de-Roger.citrite.net>
 <3d242660-7c28-5465-5da8-d126d2d347b4@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3d242660-7c28-5465-5da8-d126d2d347b4@xen.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v7 1/3] x86/tlb: introduce a flush HVM ASIDs
 flag
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXIgMTksIDIwMjAgYXQgMDY6MDc6NDRQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IAo+IAo+IE9uIDE5LzAzLzIwMjAgMTc6MzgsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6
Cj4gPiBPbiBUaHUsIE1hciAxOSwgMjAyMCBhdCAwNDoyMToyM1BNICswMDAwLCBKdWxpZW4gR3Jh
bGwgd3JvdGU6Cj4gPiAgPj4gV2h5IGNhbid0IHlvdSBrZWVwIGZsdXNoX3RsYl9tYXNrKCkgaGVy
ZT8KPiA+IAo+ID4gQmVjYXVzZSBmaWx0ZXJlZF9mbHVzaF90bGJfbWFzayBpcyB1c2VkIGluIHBv
cHVsYXRlX3BoeXNtYXAsIGFuZAo+ID4gY2hhbmdlcyB0byB0aGUgcGh5bWFwIHJlcXVpcmUgYW4g
QVNJRCBmbHVzaCBvbiBBTUQgaGFyZHdhcmUuCj4gCj4gSSBhbSBhZnJhaWQgdGhpcyBkb2VzIG5v
dCB5ZXQgZXhwbGFpbiBtZSB3aHkgZmx1c2hfdGxiX21hc2soKSBjb3VsZCBub3QgYmUKPiB1cGRh
dGVkIHNvIGl0IGZsdXNoIHRoZSBBU0lEIG9uIEFNRCBoYXJkd2FyZS4KCkN1cnJlbnQgYmVoYXZp
b3IgcHJldmlvdXMgdG8gdGhpcyBwYXRjaCBpcyB0byBmbHVzaCB0aGUgQVNJRHMgb24KZXZlcnkg
VExCIGZsdXNoLgoKZmx1c2hfdGxiX21hc2sgaXMgdG9vIHdpZGVseSB1c2VkIG9uIHg4NiBpbiBw
bGFjZXMgd2hlcmUgdGhlcmUncyBubwpuZWVkIHRvIGZsdXNoIHRoZSBBU0lEcy4gVGhpcyBwcmV2
ZW50cyB1c2luZyBhc3Npc3RlZCBmbHVzaGVzIChieSBMMCkKd2hlbiBydW5uaW5nIG5lc3RlZCwg
c2luY2UgdGhvc2UgYXNzaXN0ZWQgZmx1c2hlcyBwZXJmb3JtZWQgYnkgTDAKZG9uJ3QgZmx1c2gg
dGhlIEwyIGd1ZXN0cyBUTEJzLgoKSSBjb3VsZCBrZWVwIGN1cnJlbnQgYmVoYXZpb3IgYW5kIGxl
YXZlIGZsdXNoX3RsYl9tYXNrIGFsc28gZmx1c2hpbmcgdGhlCkFTSURzLCBidXQgdGhhdCBzZWVt
cyB3cm9uZyBhcyB0aGUgZnVuY3Rpb24gZG9lc24ndCBoYXZlIGFueXRoaW5nIGluCml0J3MgbmFt
ZSB0aGF0IHN1Z2dlc3RzIGl0IGFsc28gZmx1c2hlcyB0aGUgaW4tZ3Vlc3QgVExCcyBmb3IgSFZN
LgoKSSB3b3VsZCByYXRoZXIgcHJlZmVyIHRoZSBkZWZhdWx0IHRvIGJlIHRvIG5vdCBmbHVzaCB0
aGUKQVNJRHMsIHNvIHRoYXQgdXNlcnMgbmVlZCB0byBzcGVjaWZ5IHNvIGJ5IHBhc3NpbmcgdGhl
IGZsYWcgdG8KZmx1c2tfbWFzay4KCj4gVGhpcyB3b3VsZCBhY3R1YWxseSBtYXRjaCB0aGUgYmVo
YXZpb3Igb2YgZmx1c2hfdGxiX21hc2soKSBvbiBBcm0gd2hlcmUgYWxsCj4gdGhlIGd1ZXN0IFRM
QnMgd291bGQgYmUgcmVtb3ZlZC4KClRoYXQncyBob3cgaXQgdXNlZCB0byBiZSBwcmV2aW91cyB0
byB0aGlzIHBhdGNoLCBhbmQgdGhlIHdob2xlIHBvaW50CmlzIHRvIHNwbGl0IHRoZSBBU0lEIGZs
dXNoZXMgaW50byBhIHNlcGFyYXRlIGZsYWcsIHNvIGl0J3Mgbm90IGRvbmUKZm9yIGV2ZXJ5IFRM
QiBmbHVzaC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
