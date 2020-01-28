Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 680E414BEC3
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 18:41:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwUop-0006P2-G0; Tue, 28 Jan 2020 17:38:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=g73u=3R=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iwUoo-0006Ox-2Y
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 17:38:30 +0000
X-Inumbo-ID: fe947c82-41f4-11ea-874a-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fe947c82-41f4-11ea-874a-12813bfff9fa;
 Tue, 28 Jan 2020 17:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580233108;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=GSAAp4NQX76fn6XUFQTHA+W+VJwWXMJGNTfsgDPLgog=;
 b=KziOcA+zxCu80uvVFFwVh4rgKU7SEuZWcg1SjqpQc2S18jQdUImF5tMq
 6fAjyGYA+P1gnfUYWeXySJS8Wd3gkwcrW4qIOQjlve8LuZqYMooUOrrf6
 ftt7omD1TaHNlZYDcGth3vYNtxhczxfOEE0UCDC4BoSSFUenkP1VS1+KE Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4rEF+yYwIJYd9fwPoPAGL0pF6gIg9Pdm5PRYsSFSAhXpbXiHCsGHBX/Stkdd7HSqrin+Iab7ue
 iXbIdU4/D22CxaVzXZMlW9U5ngb7lciL5B9a5DrdZfC58qQaGJcuP8KzTrI0llgTApKnBTl4/W
 vBYlwrtub8rr9q5Dbu8xrWPHUITHKZzIGxLta8Vtwinv5pFr80UmuFAfp7j0lgD6pFcK494M+l
 J5gw/21vEOoHMpbSh79VlDjfpiM3dMwMHHtoOZYYyQa1LM7F1lDAxvZOFanHjtkS8J0lT9UK4k
 vnE=
X-SBRS: 2.7
X-MesageID: 12005696
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,374,1574139600"; d="scan'208";a="12005696"
Date: Tue, 28 Jan 2020 18:38:21 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200128173821.GT57924@desktop-tdan49n.eng.citrite.net>
References: <20200127181115.82709-1-roger.pau@citrix.com>
 <20200127181115.82709-8-roger.pau@citrix.com>
 <20200128141736.223qryuo3p2ss4ma@debian>
 <20200128145704.GQ57924@desktop-tdan49n.eng.citrite.net>
 <20200128162424.2typsfo76l7655sc@debian>
 <20200128171651.GR57924@desktop-tdan49n.eng.citrite.net>
 <65953c34-b65e-44c9-5013-fe7172412e39@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <65953c34-b65e-44c9-5013-fe7172412e39@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v3 7/7] x86/tlb: use Xen L0 assisted TLB
 flush when available
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjgsIDIwMjAgYXQgMDU6MjA6MjVQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyOC8wMS8yMDIwIDE3OjE2LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4+
Pj4gT09JIHdoeSBpc24ndCB0bGJfY2xrX2VuYWJsZWQgc2V0IHRvIGZhbHNlIHdoZW4gWGVuIGRl
dGVybWluZXMgdG8gdXNlIEwwCj4gPj4+PiBhc3Npc3RlZCBmbHVzaD8KPiA+Pj4gTDAgYXNzaXN0
ZWQgZmx1c2ggY2FuIGZhaWwgKGllOiByZXR1cm4gYW4gZXJyb3IpLCBhbmQgaW4gdGhhdCBjYXNl
IFhlbgo+ID4+PiB3b3VsZCBiZSBiZXR0ZXIgdG8gY29udGludWUgdXNpbmcgdGhlIHRpbWVzdGFt
cGVkIHRsYiwgYXMgaXQgY291bGQKPiA+Pj4gYXZvaWQgc29tZSBmbHVzaGVzLgo+ID4+IERvIHlv
dSBuZWVkIHRvIHNldCB0bGJfY2xrX2VuYWJsZWQgaW4gdGhhdCBjYXNlPwo+ID4gQUZBSUNUIGl0
J3Mgc2FmZSB0byBlbmFibGUgdGhlIFRMQiB0aW1lc3RhbXBzIGFmdGVyIGJlaW5nIGRpc2FibGVk
LAo+ID4gYnV0IGh5cGVydmlzb3JfZmx1c2hfdGxiIGNvdWxkIGZhaWwgaW50ZXJtaXR0ZW50bHkg
d2l0aCBFQlVTWSBpbiB0aGUKPiA+IFhlbiBpbXBsZW1lbnRhdGlvbiwgYW5kIEkgZG9uJ3QgcmVh
bGx5IHdhbnQgdGhhdCB0byBjYXVzZSBzcHVyaW91cwo+ID4gZW5hYmxpbmcgb2YgdGhlIHRpbWVz
dGFtcHMgcGVyaW9kaWNhbGx5Lgo+IAo+IFdoYXQgY2F1c2VzIC1FQlVTWT8KCk15IGJhZCwgaXQn
cyBub3QgRUJVU1ksIGl0J3MgRVJFU1RBUlQgYnV0IHRoYXQgd29uJ3QgYmUgcmV0dXJuZWQgdG8K
dGhlIGNhbGxlci4KCj4gSSBkb24ndCB0aGluayBpdCBpcyByZWFzb25hYmxlIGZvciB0aGUgaHlw
ZXJjYWxsIHRvIGZhaWwgbGlrZSB0aGF0LsKgCj4gVGhlcmUgaXMgbm8gY2lyY3Vtc3RhbmNlIGV2
ZXIgd2hlcmUgYSBUTEIgZmx1c2ggaXMgd2FudGVkLCBhbmQgaXQgaXMKPiBhYmxlIHRvIGJlIGRl
ZmVycmVkLgoKQWZ0ZXIgdGhpcyBzZXJpZXMgRVJFU1RBUlQgaXMgb25seSB1c2VkIGJ5IHRoZSBz
aGFkb3cgZmx1c2gKaW1wbGVtZW50YXRpb24sIGFuZCBJJ20gbm90IHN1cmUgSSdtIGNvbmZpZGVu
dCBlbm91Z2ggdG8gdHJ5IHRvIGNoYW5nZQp0aGUgc2hhZG93IGNvZGUgaW4gb3JkZXIgdG8gbm90
IGRvIHRoYXQsIGFsc28gYmVjYXVzZSBJIHRoaW5rIHRoZQppbnRlcmVzdCBpcyBsaWtlbHkgbXVj
aCBsb3dlciB0aGFuIGZvciB0aGUgSEFQIGNhc2UuCgo+IEZvcmNpbmcgYWxsIGNhbGxlcnMgdG8g
bG9vcCB3aGlsZSBidXN5IGlzIGEgdGVycmlibGUgaW50ZXJmYWNlLgoKV2VsbCwgdGhlIHdob2xl
IGltcGxlbWVudGF0aW9uIG9mIGh2bV9mbHVzaF92Y3B1X3RsYiBpcyBxdWl0ZSBjbHVtc3kKYmVj
YXVzZSBpdCBhdHRlbXB0cyB0byBwYXVzZSBlYWNoIHZDUFUgdG8gYmUgZmx1c2hlZCwgd2hpY2gg
Zm9yIGd1ZXN0cwp3aXRoIGEgaGlnaCBudW1iZXIgb2YgdkNQVXMgbWFrZXMgaXQgbGlrZWx5IHNs
b3dlciB0aGFuIGp1c3QgdXNpbmcgYQpzaG9ydGhhbmQgSVBJIGluc2lkZSB0aGUgZ3Vlc3QuCgpU
aGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
