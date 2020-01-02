Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 132B012E95B
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2020 18:25:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1in4BB-0006jF-89; Thu, 02 Jan 2020 17:22:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h/dY=2X=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1in4B9-0006j9-VW
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2020 17:22:36 +0000
X-Inumbo-ID: 728efb42-2d84-11ea-a1e1-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 728efb42-2d84-11ea-a1e1-bc764e2007e4;
 Thu, 02 Jan 2020 17:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577985747;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=Haj7t3ln7pX8kNj+62WkxwJ3aMhpWvYYFw4zHx3H5fk=;
 b=a64A40aVBwSu//h53C++Q/QxJ9HvcsPRXGn5miqUtm7d3r3jQjtfpnCD
 +3g5kwDwedKyVtjGeOnaWVP1WrNbCX64Wfwl+4U9UgFz6tTYTSRLnc+fz
 yrCdmz/1ThZgHCZnPnq7dJSG86zrkQUwmDwTYkDzt3OF7jm2mOnPomA5n s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jy5KLPEp/w1DqIu0iF9yZolOmJF4EEHhsMHd0+m6Vf+lTtqD7BgnYwikr95wIIqbOm4UM7tGyr
 j25hQR66EJXBTbubKY/yoVswN5YKGrTZZ1pHZ1vQexfKHUmX4WFjEeMFtgf+zYUje27YPlpQqf
 qbOIfFaJL2K+phmPc66riFuPcR/+Hs59B1ZT/gqo6B7cY3kHkpDsPTCnIiMHOYfJpcY7kIuWO8
 ZWLGaC6FdvUXrCWEGbYKCjO2uF8NTo7o2191GCwfdWw8VD/9LUj8yLkEtd9nPO0bbrFlUl3JZi
 HrQ=
X-SBRS: 2.7
X-MesageID: 10814814
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,387,1571716800"; d="scan'208";a="10814814"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24078.9936.243343.753242@mariner.uk.xensource.com>
Date: Thu, 2 Jan 2020 17:22:24 +0000
To: Paul Durrant <pdurrant@amazon.com>
In-Reply-To: <20191224130416.3570-3-pdurrant@amazon.com>
References: <20191224130416.3570-1-pdurrant@amazon.com>
 <20191224130416.3570-3-pdurrant@amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 2/6] libxl_create: make 'soft reset' explicit
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
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSCAyLzZdIGxpYnhsX2NyZWF0ZTogbWFrZSAnc29m
dCByZXNldCcgZXhwbGljaXQiKToKPiBUaGUgJ3NvZnQgcmVzZXQnIGNvZGUgcGF0aCBpbiBsaWJ4
bF9fZG9tYWluX21ha2UoKSBpcyBjdXJyZW50bHkgdGFrZW4gaWYgYQo+IHZhbGlkIGRvbWlkIGlz
IHBhc3NlZCBpbnRvIHRoZSBmdW5jdGlvbi4gQSBzdWJzZXF1ZW50IHBhdGNoIHdpbGwgZW5hYmxl
Cj4gaGlnaGVyIGxldmVscyBvZiB0aGUgdG9vbHN0YWNrIHRvIGRldGVybWluZSB0aGUgZG9taWQg
b2YgbmV3bHkgY3JlYXRlZCBvcgo+IHJlc3RvcmVkIGRvbWFpbnMgYW5kIHRoZXJlZm9yZSB0aGlz
IGNyaXRlcmlhIGZvciBjaG9vc2luZyAnc29mdCByZXNldCcKPiB3aWxsIG5vIGxvbmdlciBiZSB1
c2FibGUuCj4gCj4gVGhpcyBwYXRjaCBhZGRzIGFuIGV4dHJhIGJvb2xlYW4gb3B0aW9uIHRvIGxp
YnhsX19kb21haW5fbWFrZSgpIHRvIHNwZWNpZnkKPiB3aGV0aGVyIGl0IGlzIGJlaW5nIGludm9r
ZWQgaW4gc29mdCByZXNldCBjb250ZXh0IGFuZCBhcHByb3ByaWF0ZWx5Cj4gbW9kaWZpZXMgY2Fs
bGVycyB0byBjaG9vc2UgdGhlIHJpZ2h0IHZhbHVlLiBUbyBmYWNpbGl0YXRlIHRoaXMsIGEgbmV3
Cj4gJ3NvZnRfcmVzZXQnIGJvb2xlYW4gZmllbGQgaXMgYWRkZWQgdG8gc3RydWN0IGxpYnhsX19k
b21haW5fY3JlYXRlX3N0YXRlCj4gYW5kIHRoZSAnZG9taWRfc29mdF9yZXNldCcgZmllbGQgaXMg
cmVuYW1lZCB0byAnZG9taWQnIGluIGFudGljaXBhdGlvbiBvZgo+IGl0cyB3aWRlciByZW1pdC4g
Rm9yIHRoZSBtb21lbnQgZG9fZG9tYWluX2NyZWF0ZSgpIHdpbGwgYWx3YXlzIHNldAo+IGRvbWlk
IHRvIElOVkFMSURfRE9NSUQgYW5kIGhlbmNlIHdlIGNhbiBhZGQgYW4gYXNzZXJ0aW9uIGludG8K
PiBsaWJ4bF9fZG9tYWluX2NyZWF0ZSgpIHRoYXQsIGlmIGl0IGlzIG5vdCBjYWxsZWQgaW4gc29m
dCByZXNldCBjb250ZXh0LAo+IHRoZSBwYXNzZWQgaW4gZG9taWQgaXMgZXhhY3RseSB0aGF0IHZh
bHVlLgo+IAo+IFdoaWxzdCBpbiB0aGUgbmVpZ2hib3VyaG9vZCwgc29tZSBjaGVja3Mgb2YgJ3Jl
c3RvcmVfZmQgPiAtMScgaGF2ZSBiZWVuCj4gcmVwbGFjZWQgYnkgJ3Jlc3RvcmVfZmQgPj0gMCcg
dG8gYmUgbW9yZSBjb252ZW50aW9uYWwgYW5kIGNvbnNpc3RlbnQgd2l0aAo+IGNoZWNrcyBvZiAn
cmVzdG9yZV9mZCA8IDAnLgoKVGhhbmtzLCBuaWNlIHdvcmsuICAoSW4gZ2VuZXJhbCBteSBwcmVm
ZXJlbmNlIHdvdWxkIGJlIHRvIHNwbGl0IHN0dWZmCmxpa2UgdGhhdCBsYXN0IGJpdCBvdXQgaW50
byBhIHByZS1wYXRjaCBidXQgdGhpcyBpcyBhIHRyaXZpYWwKb2JzZXJ2YXRpb24uKQoKQWNrZWQt
Ynk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
