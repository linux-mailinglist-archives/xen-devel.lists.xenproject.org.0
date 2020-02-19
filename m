Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07062164B37
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 17:56:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4ScN-000531-O6; Wed, 19 Feb 2020 16:54:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O8+/=4H=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j4ScM-00052w-Bu
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 16:54:34 +0000
X-Inumbo-ID: 80a41d1e-5338-11ea-ade5-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80a41d1e-5338-11ea-ade5-bc764e2007e4;
 Wed, 19 Feb 2020 16:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582131274;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=kwvahnDjS2A4vWPhAzdt05NfRlWCagHaC6tUf2hqnl0=;
 b=f01SS/GeKEABB2hF7mvZo4tVhmZmuPaxglA4/pccEUWwxJz1sqxeMf5N
 JiK+34t7mlX2fpEaEnUCyaOJ1Pp62yybrJdmRHdjCBRKSPq0IYOqkLrou
 9ElWuP1kTPczC5iLqPePObANGakCkMa8nYph7d5gFc0NgcIP9PXxb0C8a k=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: pcrrGIUpBxqZVMkUjQDAIjIE9eKHNKb2GQWaUCx0PrzlAGUhO9NEfiHNATtdjTCpQeKDxYTkD5
 wYc2D4dPzZWg1xD3V2Tpn5VMQIXpe2kxBuR1g35Lf2TvSDU0mWnLIBAio26RWtqzL/809ENiQ+
 MlwtOlVs5Dl+/wBXnII5sT3gNTjb2nkpc/56HRCEIuqm1HK+KFHPEb4e524Z8suQbLNeE7PDue
 qLYFE/xNSBDuJKPLpOVioHh4rKD0A6vxN0a/oUOe730sZH81KLURuC5VlpcXDsDUGdF4Ve1YWF
 xnM=
X-SBRS: 2.7
X-MesageID: 12686258
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,461,1574139600"; d="scan'208";a="12686258"
To: Jan Beulich <jbeulich@suse.com>
References: <20200213113237.58795-1-roger.pau@citrix.com>
 <20200213113237.58795-3-roger.pau@citrix.com>
 <1b278189-c96a-796a-1733-a3584809227f@suse.com>
 <20200219132217.GB4679@Air-de-Roger>
 <960b4da8-4522-082a-42b9-ab870698a5ec@suse.com>
 <20200219144549.GD4679@Air-de-Roger>
 <3ae51529-1cfe-9872-68a4-ab57d634a1cd@suse.com>
 <63d07524-3e72-06e4-cc16-a0a1561a5c68@citrix.com>
 <1f4fefd9-b5a9-ca40-1877-19e66b6ef625@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <e500bff0-b338-1b68-a978-d453c3b32c91@citrix.com>
Date: Wed, 19 Feb 2020 16:54:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1f4fefd9-b5a9-ca40-1877-19e66b6ef625@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 2/2] smp: convert cpu_hotplug_begin into a
 blocking lock acquisition
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkvMDIvMjAyMCAxNjowNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTkuMDIuMjAyMCAx
NjowNywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTkvMDIvMjAyMCAxNDo1NywgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAxOS4wMi4yMDIwIDE1OjQ1LCBSb2dlciBQYXUgTW9ubsOpIHdy
b3RlOgo+Pj4+IE9uIFdlZCwgRmViIDE5LCAyMDIwIGF0IDAyOjQ0OjEyUE0gKzAxMDAsIEphbiBC
ZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxOS4wMi4yMDIwIDE0OjIyLCBSb2dlciBQYXUgTW9ubsOp
IHdyb3RlOgo+Pj4+Pj4gT24gV2VkLCBGZWIgMTksIDIwMjAgYXQgMDE6NTk6NTFQTSArMDEwMCwg
SmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+Pj4gT24gMTMuMDIuMjAyMCAxMjozMiwgUm9nZXIgUGF1
IE1vbm5lIHdyb3RlOgo+Pj4+Pj4+PiBEb24ndCBhbGxvdyBjcHVfaG90cGx1Z19iZWdpbiB0byBm
YWlsIGJ5IGNvbnZlcnRpbmcgdGhlIHRyeWxvY2sgaW50byBhCj4+Pj4+Pj4+IGJsb2NraW5nIGxv
Y2sgYWNxdWlzaXRpb24uIFdyaXRlIHVzZXJzIG9mIHRoZSBjcHVfYWRkX3JlbW92ZV9sb2NrIGFy
ZQo+Pj4+Pj4+PiBsaW1pdGVkIHRvIENQVSBwbHVnL3VucGx1ZyBvcGVyYXRpb25zLCBhbmQgY2Fu
bm90IGRlYWRsb2NrIGJldHdlZW4KPj4+Pj4+Pj4gdGhlbXNlbHZlcyBvciBvdGhlciB1c2VycyB0
YWtpbmcgdGhlIGxvY2sgaW4gcmVhZCBtb2RlIGFzCj4+Pj4+Pj4+IGNwdV9hZGRfcmVtb3ZlX2xv
Y2sgaXMgYWx3YXlzIGxvY2tlZCB3aXRoIGludGVycnVwdHMgZW5hYmxlZC4gVGhlcmUKPj4+Pj4+
Pj4gYXJlIGFsc28gbm8gb3RoZXIgbG9ja3MgdGFrZW4gZHVyaW5nIHRoZSBwbHVnL3VucGx1ZyBv
cGVyYXRpb25zLgo+Pj4+Pj4+IEkgZG9uJ3QgdGhpbmsgdGhlIGdvYWwgd2FzIGRlYWRsb2NrIGF2
b2lkYW5jZSwgYnV0IHJhdGhlciBsaW1pdGluZwo+Pj4+Pj4+IG9mIHRoZSB0aW1lIHNwZW50IHNw
aW5uaW5nIHdoaWxlIHRyeWluZyB0byBhY3F1aXJlIHRoZSBsb2NrLCBpbgo+Pj4+Pj4+IGZhdm9y
IG9mIGhhdmluZyB0aGUgY2FsbGVyIHJldHJ5Lgo+Pj4+Pj4gTm93IHRoYXQgdGhlIGNvbnRlbnRp
b24gYmV0d2VlbiByZWFkLW9ubHkgdXNlcnMgaXMgcmVkdWNlZCBhcyB0aG9zZQo+Pj4+Pj4gY2Fu
IHRha2UgdGhlIGxvY2sgaW4gcGFyYWxsZWwgSSB0aGluayBpdCdzIHNhZmUgdG8gc3dpdGNoIHdy
aXRlcnMgdG8KPj4+Pj4+IGJsb2NraW5nIG1vZGUuCj4+Pj4+IEknZCBhZ3JlZSBpZiB3cml0ZXJz
IGNvdWxkbid0IGJlIHN0YXJ2ZWQgYnkgKG1hbnkpIHJlYWRlcnMuCj4+Pj4gQUZBSUNUIGZyb20g
dGhlIHJ3IGxvY2sgaW1wbGVtZW50YXRpb24gcmVhZGVycyB3b24ndCBiZSBhYmxlIHRvIHBpY2sK
Pj4+PiB0aGUgbG9jayBhcyBzb29uIGFzIHRoZXJlJ3MgYSB3cml0ZXIgd2FpdGluZywgd2hpY2gg
c2hvdWxkIGF2b2lkIHRoaXMKPj4+PiBzdGFydmF0aW9uPwo+Pj4+Cj4+Pj4gWW91IHN0aWxsIG5l
ZWQgdG8gd2FpdCBmb3IgY3VycmVudCByZWFkZXJzIHRvIGRyb3AgdGhlIGxvY2ssIGJ1dCBubwo+
Pj4+IG5ldyByZWFkZXJzIHdvdWxkIGJlIGFibGUgdG8gbG9jayBpdCwgd2hpY2ggSSB0aGluayBz
aG91bGQgZ2l2YmUgdXMKPj4+PiBlbm91Z2ggZmFpcm5lc3MuCj4+PiBBaCwgcmlnaHQsIGl0IHdh
cyByYXRoZXIgdGhlIG90aGVyIHdheSBhcm91bmQgLSBiYWNrLXRvLWJhY2sKPj4+IHdyaXRlcnMg
Y2FuIHN0YXJ2ZSByZWFkZXJzIHdpdGggb3VyIGN1cnJlbnQgaW1wbGVtZW50YXRpb24uCj4+Pgo+
Pj4+IE9UT0ggd2hlbiB1c2luZyBfdHJ5bG9jayBuZXcgcmVhZGVycyBjYW4gc3RpbGwgcGljawo+
Pj4+IHRoZSBsb2NrIGluIHJlYWQgbW9kZSwgYW5kIGhlbmNlIEkgdGhpbmsgdXNpbmcgYmxvY2tp
bmcgbW9kZSBmb3IKPj4+PiB3cml0ZXJzIGlzIGFjdHVhbGx5IGJldHRlciwgYXMgeW91IGNhbiBh
c3N1cmUgdGhhdCByZWFkZXJzIHdvbid0IGJlCj4+Pj4gYWJsZSB0byBzdGFydmUgd3JpdGVycy4K
Pj4+IFRoaXMgaXMgYSBnb29kIHBvaW50LiBOZXZlcnRoZWxlc3MgSSByZW1haW4gdW5jb252aW5j
ZWQgdGhhdAo+Pj4gdGhlIGNoYW5nZSBpcyB3YXJyYW50ZWQgZ2l2ZW4gdGhlIG9yaWdpbmFsIGlu
dGVudGlvbnMgKGFzIGZhcgo+Pj4gYXMgd2UncmUgYWJsZSB0byByZWNvbnN0cnVjdCB0aGVtKS4g
SWYgdGhlIGN1cnJlbnQgYmVoYXZpb3IKPj4+IGdldHMgaW4gdGhlIHdheSBvZiBzZW5zaWJsZSBz
aGltIG9wZXJhdGlvbiwgcGVyaGFwcyB0aGUKPj4+IGJlaGF2aW9yIHNob3VsZCBiZSBtYWRlIGRl
cGVuZGVudCB1cG9uIHJ1bm5pbmcgaW4gc2hpbSBtb2RlPwo+PiBIb3RwbHVnIGlzbid0IGdlbmVy
YWxseSB1c2VkIGF0IGFsbCwgc28gdGhlcmUgaXMgMCB3cml0ZSBwcmVzc3VyZSBvbiB0aGUKPj4g
bG9jay4KPj4KPj4gV2hlbiBpdCBpcyB1c2VkLCBpdCBpcyBhbGwgYXQgZXhwbGljaXQgcmVxdWVz
dCBmcm9tIHRoZSBjb250cm9sbGluZwo+PiBlbnRpdHkgaW4gdGhlIHN5c3RlbSAoaGFyZHdhcmUg
ZG9tYWluLCBvciBzaW5nbGV0b24gc2hpbSBkb21haW4pLgo+Pgo+PiBJZiB0aGF0IGVudGl0eSBp
cyB0cnlpbmcgdG8gRG9TIHlvdSwgeW91J3ZlIGFscmVhZHkgbG9zdC4KPiBCdXQgd3JpdGUgcHJl
c3N1cmUgd2FzIG5ldmVyIGluIHF1ZXN0aW9uLiBNeSBjb25jZXJuIGlzIHdpdGgKPiBob3cgbG9u
ZyBpdCBtaWdodCB0YWtlIGZvciBhbGwgcmVhZGVycyB0byBkcm9wIHRoZWlyIGxvY2tzLgoKV2h5
IGlzIHRoYXQgb2YgY29uY2Vybj8KCkZhaWxpbmcgd2l0aCAtRUJVU1kgaXMgbm90IGEgdXNlZnVs
IHByb3BlcnR5IGZvciBhbnkgY2FsbGVyIC0gaWYgeW91CmluaXRpYXRlIGEgaG90cGx1ZyByZXF1
ZXN0LCB0aGVuIHlvdSdyZSBnb2luZyB0byBsb29wIHVudGlsIGl0CmNvbXBsZXRlcy7CoCAoYWdh
aW4gLSBzY2FyY2l0eSBvZiBob3RwbHVnIHJlcXVlc3RzIGluIHRoZSBmaXJzdCBwbGFjZSBpcwp3
aHkgdGhpcyBpbnRlcmZhY2Ugd29ya3MgaW4gdGhlIGdlbmVyYWwgY2FzZS4pCgpXaXRoIGEgc3Bp
bmxvY2sgKGFuZCBpbmRlZWQsIHRpY2tldGxvY2sgaW4gb3VyIGNhc2UpLCBldmVyeW9uZSBpcwpz
ZXJpYWxpc2VkIGFuZCB5b3UndmUgZ290IHRvIHdhaXQgdW50aWwgeW91ciB0dXJuIHRvIGRvIGFu
eXRoaW5nLsKgCnRyeWxvY2sgYW5kIGJhY2tvZmYgbWFrZXMgdGhlIHNpdHVhdGlvbiBwcm9iYWJp
bGlzdGljIGFzIHRvIHdoZXRoZXIgaXQKc3VjY2VlZHMsIGFuZCBnZXRzIGluY3JlYXNpbmdseSB3
b3JzZSBhcyB0aGUgbG9jayBiZWNvbWVzIG1vcmUgY29udGVuZGVkLgoKV2l0aCBhIHJ3bG9jaywg
dGhlIG1heGltdW0gYW1vdW50IG9mIHRpbWUgYSB3cml0ZXIgbmVlZHMgdG8gd2FpdCBpcyB0aGUK
bG9uZ2VzdCByZW1haW5pbmcgY3JpdGljYWwgcmVnaW9uIG9mIHRoZSByZWFkZXJzLCB3aGljaCBi
eSBkZWZpbml0aW9uIGlzCnNvbWV0aGluZyBzaG9ydCBlbm91Z2ggdG8gbm90IGJlIGFuIGlzc3Vl
IGZvciBzYWlkIHJlYWRlci4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
