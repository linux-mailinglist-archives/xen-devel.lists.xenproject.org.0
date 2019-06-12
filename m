Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9A642580
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 14:22:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hb2F1-0004da-0B; Wed, 12 Jun 2019 12:20:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T8NI=UL=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hb2Ez-0004dT-O5
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 12:20:33 +0000
X-Inumbo-ID: 7876f4bb-8d0c-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7876f4bb-8d0c-11e9-8980-bc764e045a96;
 Wed, 12 Jun 2019 12:20:31 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: eiOzJOa55V435sx9BwId2OKdrN8cIKnMw1YdeXXeHTJdE6Ofx1JzydBWCXo4K6nXi7y1aCOUGZ
 GuxPF7P5v/qXQ7TqBTPgfPHBY5ZVCUWtNo+F092EDI5u7VoED/OOx34g+ISWw1ocSV2OiN4RYA
 LBeEP6klHafX2GS105sI84EVgx7MoOZSIpfXvNhp0pgfsaj+UAGvXvHqoj3vBSpA7cvCihWP9o
 CS7UDSBSd06TBLXF3L1uEywCPxBrCB7RywDg2tO9wRymmVmHlRr1Fly23oKkzCQlEu8Bt10/6z
 qzM=
X-SBRS: 2.7
X-MesageID: 1637857
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,365,1557201600"; 
   d="scan'208";a="1637857"
To: David Woodhouse <dwmw2@infradead.org>, Jan Beulich <JBeulich@suse.com>
References: <1560337513-6958-1-git-send-email-andrew.cooper3@citrix.com>
 <5D00E74D02000078002377AA@prv1-mh.provo.novell.com>
 <27e0dbf5-5879-0807-ad03-a24735c741cd@citrix.com>
 <5D00E95002000078002377C8@prv1-mh.provo.novell.com>
 <3b5427e86779bb32e62d69f76c0bd4f5c6f4de0e.camel@infradead.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <985d92a7-8abb-86f7-bc04-2ba4fa59851c@citrix.com>
Date: Wed, 12 Jun 2019 13:20:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <3b5427e86779bb32e62d69f76c0bd4f5c6f4de0e.camel@infradead.org>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/boot: Drop vestigial support for
 pre-SIPI APICs
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMDYvMjAxOSAxMzoxNCwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IE9uIFdlZCwgMjAx
OS0wNi0xMiBhdCAwNjowMCAtMDYwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IFJlcG9ydGVk
LWJ5OiBEYXZpZCBXb29kaG91c2UgPGR3bXdAYW1hem9uLmNvLnVrPgo+Pj4+IERvZXMgdGhpcyBt
ZWFuIHRoZXJlIHdhcyBhbiBhY3R1YWwgcHJvYmxlbSByZXN1bHRpbmcgZnJvbSB0aGlzIGNvZGUK
Pj4+PiBiZWluZyB0aGVyZSwgb3Igc2ltcGx5IHRoZSBvYnNlcnZhdGlvbiB0aGF0IHRoaXMgY29k
ZSBpcyBhbGwgZGVhZD8KPj4+PiBDbGFyaWZ5aW5nIG9uZSB3YXkgb3IgdGhlIG90aGVyIGJ5IGhh
bGYgYSBzZW50ZW5jZSB3b3VsZCBiZSBuaWNlLgo+Pj4gSXQgd2FzIG1vcmUgYW4gb2JzZXJ2YXRp
b24gdGhhdCB3aGVuIHlvdSBrZXhlYyBYZW4sIGl0IGJsaW5kbHkgd3JpdGVzCj4+PiBpbnRvIHRo
ZSBCREEgZXZlbiB3aGVuIHRoYXQgd2Fzbid0IHNldCB1cCBwcm9wZXJseSBieSB0aGUgdG9vbHMu
Cj4+Pgo+Pj4gQXJndWFibHkgdGhhdCBtYXkgaGF2ZSBiZWVuIGtleGVjIHNldHVwIHByb2JsZW0g
bW9yZSB0aGFuIGEgWGVuIHByb2JsZW0sCj4+PiBidXQgYWZ0ZXIgbG9va2luZyBhdCB0aGlzIGNv
ZGUsIGl0IGlzIG9idmlvdXNseSB0aGF0IHdoYXQgWGVuIHdhcyBkb2luZwo+Pj4gZGVmaW5pdGVs
eSB3YXNuJ3QgcmlnaHQgdG8gZG8gdW5jb25kaXRpb25hbGx5LiAgSXQganVzdCBzbyBoYXBwZW5z
IHRoYXQKPj4+IGl0IHNhZmUgdG8gdW5jb25kaXRpb25hbGx5IGRyb3AgdGhlIGxvZ2ljLCByYXRo
ZXIgdGhhbiB0byBtYWtlIGl0Cj4+PiBkZXBlbmRhbnQgb24gb3RoZXIgc3lzdGVtIHByb3BlcnRp
ZXMuCj4+Pgo+Pj4gSSdtIG5vdCBzdXJlIGhvdyBiZXN0IHRvIHBocmFzZSB0aGlzLgo+PiBNYXli
ZSAiSW4gcHJhY3RpY2UgaXNzdWVzIHdpdGggdGhpcyB3ZXJlIG9ic2VydmVkIG9ubHkgd2l0aCBr
ZXhlYyI/Cj4gTm90IHN1cmUgdGhhdCdzIHRydWUgZWl0aGVyLCBpcyBpdD8gSSBmb3VuZCAqbG90
cyogb2YgaXNzdWVzIHdoZW4gZG9pbmcKPiBrZXhlYywgYW5kIEkgc2hvdWxkIHJlc2VuZCB0aGF0
IHNlcmllcyBvZiBib290IGNvZGUgY2xlYW51cHMg4oCUIGJ1dCB0aGlzCj4gd2Fzbid0IG9uZSBv
ZiB0aGUgb25lcyBJIHJlbWVtYmVyIHNwb3R0aW5nIDopCgpZb3UgZGVmaW5pdGVseSBjb21wbGFp
bmVkIGFib3V0IHRoZSBCREEgb24gSVJDLCB3aGljaCBpcyB3aHkgSSBzdGFydGVkCmxvb2tpbmcs
IGJ1dCBJJ20gaGFwcHkgdG8gbGVhdmUgeW91IG91dCBvZiB0aGUgcGF0Y2ggaWYgeW91J2QgcHJl
ZmVyLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
