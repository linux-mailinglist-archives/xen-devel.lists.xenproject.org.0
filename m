Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6882110AE85
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 12:12:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZvDN-0001SV-ET; Wed, 27 Nov 2019 11:10:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pmZc=ZT=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iZvDL-0001SQ-M9
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 11:10:31 +0000
X-Inumbo-ID: 7a178fae-1106-11ea-a3af-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7a178fae-1106-11ea-a3af-12813bfff9fa;
 Wed, 27 Nov 2019 11:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574853011;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=oaExHg5zZMaata7QGK2NBcYVuPPv5fEZoThacRjhCAE=;
 b=DHJnc4EmrdvxXeTM164AFanpNTNVAQ4g8YpK3QCHtxNQmHSZFkqNNZy4
 kBu6mwJhqBpq00pdQ+kVJOwGCKayoKtItiRpfrM4FiNuJlFsBANEC2TgJ
 GysrIyt/NcScIPK6itb2+j9UcbhAx7DOCvZty4tFXLuFQUNQw5L6oRdSD M=;
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
IronPort-SDR: fEJ+nFWPzPNt7OaDv+acfyIxG5Tt1tzkSEAJ/D3EzmxNkJZkzFqhj65HlYEVAGcBLlDzKDt8PO
 HuQYe6ZEi42YYAy/d8wx+qPxC+ur83mG1uqqCgdB201x9gz85jR2+PlZNfIKpOT8s0dxfV2Tst
 MbfbVJfB/+4VPMCrsFtTsbCvyfrg6lfFULMRRQDHBz7MuUNMXRcfz0NV2Liu3qXKqkp+E0nXMg
 9AeRALVxLKTd8F/XQAG6EUHE58KeRvHYUvGxW4fBab3ZZc3E8xE7gegnDr6zL6r2KLtySXVddg
 7Vc=
X-SBRS: 2.7
X-MesageID: 9024509
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,249,1571716800"; 
   d="scan'208";a="9024509"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24030.22924.67150.575753@mariner.uk.xensource.com>
Date: Wed, 27 Nov 2019 11:10:04 +0000
To: "Durrant, Paul" <pdurrant@amazon.com>
In-Reply-To: <c95b8096d1054d88bce16310aafe978a@EX13D32EUC003.ant.amazon.com>
References: <20191126171747.3185988-1-george.dunlap@citrix.com>
 <20191126171747.3185988-2-george.dunlap@citrix.com>
 <24029.25218.75565.126333@mariner.uk.xensource.com>
 <c95b8096d1054d88bce16310aafe978a@EX13D32EUC003.ant.amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH for-4.13 2/2] Rationalize max_grant_frames
 and max_maptrack_frames handling
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
Cc: Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Hans van Kranenburg <hans@knorrie.org>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHVycmFudCwgUGF1bCB3cml0ZXMgKCJSRTogW1hlbi1kZXZlbF0gW1BBVENIIGZvci00LjEzIDIv
Ml0gUmF0aW9uYWxpemUgbWF4X2dyYW50X2ZyYW1lcyBhbmQgbWF4X21hcHRyYWNrX2ZyYW1lcyBo
YW5kbGluZyIpOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IFhlbi1k
ZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBP
ZiBJYW4KPiA+IEphY2tzb24KPiA+IEkgaGF2ZSBzZWVuIHJlcG9ydHMgb2YgdXNlcnMgd2hvIHJh
biBvdXQgb2YgZ3JhbnQvbWFwdHJhY2sgZnJhbWVzCj4gPiBiZWNhdXNlIG9mIHVwZGF0ZXMgdG8g
dXNlIG11bHRpcmluZyBwcm90b2NvbHMgZXRjLiAgVGhlIGVycm9yIG1lc3NhZ2VzCj4gPiBhcmUg
bm90IHZlcnkgZ29vZCBhbmQgdGhlIHJlY29tbWVuZGVkIHdvcmthcm91bmQgaGFzIGJlZW4gdG8g
aW5jcmVhc2UKPiA+IHRoZSBkZWZhdWx0IGxpbWl0IG9uIHRoZSBoeXBlcnZpc29yIGNvbW1hbmQg
bGluZS4KPiA+IAo+ID4gSXQgaXMgaW1wb3J0YW50IHRoYXQgd2UgZG9uJ3QgYnJlYWsgdGhhdCB3
b3JrYXJvdW5kIQo+IAo+IEFsYXMgaXQgaGFzIGFwcGFyZW50bHkgYmVlbiBicm9rZW4gZm9yIHNl
dmVyYWwgcmVsZWFzZXMgbm93IDotKAoKSSBndWVzcyBhdCBsZWFzdCBpbiBEZWJpYW4gKHdoZXJl
IEkgaGF2ZSBzZWVuIHRoaXMpIHdlIGhhdmVuJ3QKcmVsZWFzZWQgd2l0aCBhbnkgYWZmZWN0ZWQg
dmVyc2lvbnMgeWV0Li4uCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
