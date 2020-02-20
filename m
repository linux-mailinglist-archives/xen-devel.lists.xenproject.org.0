Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C28611660D7
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 16:23:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4ncf-0000kn-RU; Thu, 20 Feb 2020 15:20:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rOW3=4I=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j4nce-0000kh-ER
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 15:20:16 +0000
X-Inumbo-ID: 7e389229-53f4-11ea-8551-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e389229-53f4-11ea-8551-12813bfff9fa;
 Thu, 20 Feb 2020 15:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582212015;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=BhG2gLbdQ6JyqaAP6Ray8UUE26VYFFC5xNUpWSAtrA4=;
 b=Qo0B8ltGTygr3J012ZW5z5D83F2lTBUHfqQ0cRcYkpvSz/pfAcmC29sC
 ViucmIXlqCM3/yOiHGDB4iz3duckQWlyH7uLAWF8wq2w4LQU9inxOBSJv
 gG+Vn3pv3om+OwnKcTjzF1lXFfi0HNX/HCmgT3yuVXpORMoQXrKHmvw+R Q=;
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
IronPort-SDR: MvY522fKBtYMQ+IpnSMyaHMAW/MmAv9dycrXtR8bOQ+A2LoRtn1xGtO56SyX5BCer77i+rcN5f
 TIlEi+Aeud0eO9EW3b8ikFLk97uOUaFr14HOTHdM3YHKFvyZ+PtktFS2pv8J9L102mJ8QLuq/R
 GMqKGd8ZP2zYwUvQjXn3G0qJsQR85ja/3g59kR7+zbgkZEeW5vO+rwTXtewWiV733tyriYXyxZ
 Vb2R+x+Usp2bAHc39zzLc9SxA6O0VHJzHAlROrbDAcunmQaxF+1DOJTD1dWKi9THuXmO/izvPw
 Cz8=
X-SBRS: 2.7
X-MesageID: 13192463
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,464,1574139600"; d="scan'208";a="13192463"
Date: Thu, 20 Feb 2020 16:20:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200220152004.GN4679@Air-de-Roger>
References: <20200220120231.86907-1-roger.pau@citrix.com>
 <ecf1c47c-4cbb-c7c4-7ccf-d3620a1992b3@suse.com>
 <20200220141117.GK4679@Air-de-Roger>
 <ac515c56-e391-3636-244d-4b660c615dee@suse.com>
 <20200220143841.GL4679@Air-de-Roger>
 <a2111136-e91c-4077-5bea-ea310a43979e@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a2111136-e91c-4077-5bea-ea310a43979e@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] rwlock: allow recursive read locking when
 already locked in write mode
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMDQ6MTE6MDhQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjAuMDIuMjAyMCAxNTozOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFRodSwgRmViIDIwLCAyMDIwIGF0IDAzOjIzOjM4UE0gKzAxMDAsIErDvHJnZW4gR3Jvw58gd3Jv
dGU6Cj4gPj4gT24gMjAuMDIuMjAgMTU6MTEsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPj4+
IE9uIFRodSwgRmViIDIwLCAyMDIwIGF0IDAxOjQ4OjU0UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+ID4+Pj4gT24gMjAuMDIuMjAyMCAxMzowMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+
ID4+Pj4+IEBAIC0xNjYsNyArMTgwLDggQEAgc3RhdGljIGlubGluZSB2b2lkIF93cml0ZV91bmxv
Y2socndsb2NrX3QgKmxvY2spCj4gPj4+Pj4gICAgICAgICogSWYgdGhlIHdyaXRlciBmaWVsZCBp
cyBhdG9taWMsIGl0IGNhbiBiZSBjbGVhcmVkIGRpcmVjdGx5Lgo+ID4+Pj4+ICAgICAgICAqIE90
aGVyd2lzZSwgYW4gYXRvbWljIHN1YnRyYWN0aW9uIHdpbGwgYmUgdXNlZCB0byBjbGVhciBpdC4K
PiA+Pj4+PiAgICAgICAgKi8KPiA+Pj4+PiAtICAgIGF0b21pY19zdWIoX1FXX0xPQ0tFRCwgJmxv
Y2stPmNudHMpOwo+ID4+Pj4+ICsgICAgQVNTRVJUKF9pc193cml0ZV9sb2NrZWRfYnlfbWUoYXRv
bWljX3JlYWQoJmxvY2stPmNudHMpKSk7Cj4gPj4+Pj4gKyAgICBhdG9taWNfc3ViKF93cml0ZV9s
b2NrX3ZhbCgpLCAmbG9jay0+Y250cyk7Cj4gPj4+Pgo+ID4+Pj4gSSB0aGluayB0aGlzIHdvdWxk
IGJlIG1vcmUgZWZmaWNpZW50IHdpdGggYXRvbWljX2FuZCgpLCBub3QKPiA+Pj4+IHRoZSBsZWFz
dCBiZWNhdXNlIG9mIHRoZSB0aGVuIGF2b2lkZWQgc21wX3Byb2Nlc3Nvcl9pZCgpLgo+ID4+Pj4g
V2hldGhlciB0byBtYXNrIG9mZiBqdXN0IF9RV19XTUFTSyBvciBhbHNvIHRoZSBDUFUgbnVtYmVy
IG9mCj4gPj4+PiB0aGUgbGFzdCB3cml0ZSBvd25lciB3b3VsZCBuZWVkIHRvIGJlIGRldGVybWlu
ZWQuIEJ1dCB3aXRoCj4gPj4+PiB1c2luZyBzdWJ0cmFjdGlvbiwgaW4gY2FzZSBvZiBwcm9ibGVt
cyBpdCdsbCBsaWtlbHkgYmUKPiA+Pj4+IGhhcmRlciB0byB1bmRlcnN0YW5kIHdoYXQgYWN0dWFs
bHkgd2VudCBvbiwgZnJvbSBsb29raW5nIGF0Cj4gPj4+PiB0aGUgcmVzdWx0aW5nIHN0YXRlIG9m
IHRoZSBsb2NrICh0aGlzIGlzIGluIHBhcnQgYSBwcmUtCj4gPj4+PiBleGlzdGluZyBwcm9ibGVt
LCBidXQgZ2V0cyB3b3JzZSB3aXRoIHN1YnRyYWN0aW9uIG9mIENQVQo+ID4+Pj4gbnVtYmVycyku
Cj4gPj4+Cj4gPj4+IFJpZ2h0LCBhIG1hc2sgd291bGQgYmUgYmV0dGVyLiBSaWdodCBub3cgYm90
aCBuZWVkIHRvIGJlIGNsZWFyZWQgKHRoZQo+ID4+PiBMT0NLRUQgYW5kIHRoZSBDUFUgZmllbGRz
KSBhcyB0aGVyZSdzIGNvZGUgdGhhdCByZWxpZXMgb24gIWxvY2stPmNudHMKPiA+Pj4gYXMgYSB3
YXkgdG8gZGV0ZXJtaW5lIHRoYXQgdGhlIGxvY2sgaXMgbm90IHJlYWQgb3Igd3JpdGUgbG9ja2Vk
LiBJZiB3ZQo+ID4+PiBsZWZ0IHRoZSBDUFUgbHlpbmcgYXJvdW5kIHRob3NlIGNoZWNrcyB3b3Vs
ZCBuZWVkIHRvIGJlIGFkanVzdGVkLgo+ID4+Cj4gPj4gSW4gY2FzZSB5b3UgbWFrZSBfUVJfU0hJ
RlQgMTYgaXQgaXMgcG9zc2libGUgdG8ganVzdCB3cml0ZSBhIDItYnl0ZSB6ZXJvCj4gPj4gdmFs
dWUgZm9yIHdyaXRlX3VubG9jaygpIChsaWtlIGl0cyBwb3NzaWJsZSB0byBkbyBzbyB0b2RheSB1
c2luZyBhCj4gPj4gc2luZ2xlIGJ5dGUgd3JpdGUpLgo+ID4gCj4gPiBUaGF0IHdvdWxkIGxpbWl0
IHRoZSByZWFkZXJzIGNvdW50IHRvIDY1NTM2LCB3aGF0IGRvIHlvdSB0aGluayBKYW4/Cj4gCj4g
SWYgdGhlIHJlY3Vyc2VfY3B1IGFwcHJvYWNoIGlzIGNvbnNpZGVyZWQgYmFkLCBJIHRoaW5rIHRo
aXMgd291bGQKPiBiZSBhY2NlcHRhYmxlLiBCdXQgb2YgY291cnNlIHlvdSdsbCBuZWVkIHRvIGNv
bnN1bHQgd2l0aCB0aGUgQXJtCj4gZ3V5cyByZWdhcmRpbmcgdGhlIGNvcnJlY3RuZXNzIG9mIHN1
Y2ggYSAiaGFsZiIgc3RvcmUgaW4gdGhlaXIKPiBtZW1vcnkgbW9kZWw7IEkgd291bGQgaG9wZSB0
aGlzIHRvIGJlIHVuaXZlcnNhbGx5IG9rYXksIGJ1dCBJJ20KPiBub3QgZW50aXJlbHkgY2VydGFp
bi4KCkkgd291bGQgbGlrZSB0byBnZXQgY29uZmlybWF0aW9uIGZyb20gdGhlIEFybSBmb2xrcywg
YnV0IEkgc2VlIEFybSBoYXMKd3JpdGVfYXRvbWljIGFuZCBzdXBwb3J0cyBzdWNoIG9wZXJhdGlv
biBhZ2FpbnN0IGEgdWludDE2X3QsIHNvIEkKZG9uJ3Qgc2VlIHdoeSBpdCB3b3VsZG4ndCB3b3Jr
LgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
