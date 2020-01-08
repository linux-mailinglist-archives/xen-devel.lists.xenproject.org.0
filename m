Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC8A134A58
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 19:18:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipFrF-0000T9-2t; Wed, 08 Jan 2020 18:15:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=W/T5=25=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ipFrD-0000T4-MO
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 18:15:03 +0000
X-Inumbo-ID: c9b55b1a-3242-11ea-b878-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c9b55b1a-3242-11ea-b878-12813bfff9fa;
 Wed, 08 Jan 2020 18:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578507303;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ROE4ZRX/eqTAZdaOJafGEHeLcC471X5CWC0d19SaEjE=;
 b=I90CDaQ3kZgWmRRs3g4BrItpgJsT2VUz+n0iuAkDeXTcDFy1MEClRoq2
 ivNQy3xx3MuQNDNZAGAfBsE2bQI3xLO6CEQfMt79tHWuEHry97x+Ky6sF
 HLXLc7h4Ghzg1hbl0vXeRTYUve52v/TPb/6Ss0S+fEvv1lJIrbamlIaSu A=;
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
IronPort-SDR: u781XIjEiZ9HO8EDQ/vCdHWKza+DGegylW/Pb2UfOuWaUwtaQ39LBPtxb182yJpUSRL66/+S1k
 Ktja8SptcI6fPt5dTSy2cUJVWiBe7b4Mzsi51v1VyHA2ICnV0vOxxVnchOwxNBTk7hJhF+wLPQ
 oX+OdpPHk6JNlSKJTtJdvMSJefg8Nfgw044HLvGe47yM0irTyWvBSX8t3Y3xiPwCvtZnoVUfZl
 9n4CtrKFJODOBKqm7FxIOWPTcpC1+3GPjAyvRWm7y/Btyw4pgGWuF+QjymFURHI7ssqFqEF6gH
 4V0=
X-SBRS: 2.7
X-MesageID: 10657440
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,410,1571716800"; d="scan'208";a="10657440"
Date: Wed, 8 Jan 2020 19:14:45 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200108181445.GV11756@Air-de-Roger>
References: <20191224124453.47183-1-roger.pau@citrix.com>
 <2215c6fe-4492-4494-af26-6754372d4c95@suse.com>
 <20200103123409.GM11756@Air-de-Roger>
 <57fe475e-c102-19a0-c2dd-8382046f1907@suse.com>
 <20200108132819.GO11756@Air-de-Roger>
 <fc2390d0-b475-84c6-d76a-881f73cd288e@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fc2390d0-b475-84c6-d76a-881f73cd288e@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/flush: use APIC ALLBUT destination
 shorthand when possible
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMDgsIDIwMjAgYXQgMDI6NTQ6NTdQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDguMDEuMjAyMCAxNDozMCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBGcmksIEphbiAwMywgMjAyMCBhdCAwMTo1NTo1MVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiBPbiAwMy4wMS4yMDIwIDEzOjM0LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4+
PiBPbiBGcmksIEphbiAwMywgMjAyMCBhdCAwMTowODoyMFBNICswMTAwLCBKYW4gQmV1bGljaCB3
cm90ZToKPiA+Pj4+IE9uIDI0LjEyLjIwMTkgMTM6NDQsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToK
PiA+Pj4+IEZ1cnRoZXIgYSBxdWVzdGlvbiBvbiBsb2NrIG5lc3Rpbmc6IFNpbmNlIHRoZSBjb21t
aXQgbWVzc2FnZQo+ID4+Pj4gZG9lc24ndCBzYXkgYW55dGhpbmcgaW4gdGhpcyByZWdhcmQsIGRp
ZCB5b3UgY2hlY2sgdGhlcmUgYXJlIG5vCj4gPj4+PiBUTEIgZmx1c2ggaW52b2NhdGlvbnMgd2l0
aCB0aGUgZ2V0X2NwdV9tYXBzKCkgbG9jayBoZWxkPwo+ID4+Pgo+ID4+PiBUaGUgQ1BVIG1hcHMg
bG9jayBpcyBhIHJlY3Vyc2l2ZSBvbmUsIHNvIGl0IHNob3VsZCBiZSBmaW5lIHRvIGF0dGVtcHQK
PiA+Pj4gYSBUTEIgZmx1c2ggd2l0aCB0aGUgbG9jayBhbHJlYWR5IGhlbGQuCj4gPj4KPiA+PiBX
aGVuIGFscmVhZHkgaGVsZCBieSB0aGUgc2FtZSBDUFUgLSBzdXJlLiBJdCBiZWluZyBhIHJlY3Vy
c2l2ZQo+ID4+IG9uZSAod2hpY2ggSSBwYWlkIGF0dGVudGlvbiB0byB3aGVuIHdyaXRpbmcgbXkg
ZWFybGllciByZXBseSkKPiA+PiBkb2Vzbid0IG1ha2UgaXQgKHRvZ2V0aGVyIHdpdGggYW55IG90
aGVyIG9uZSkgaW1tdW5lIGFnYWluc3QKPiA+PiBBQkJBIGRlYWRsb2NrcywgdGhvdWdoLgo+ID4g
Cj4gPiBUaGVyZSdzIG5vIHBvc3NpYmlsaXR5IG9mIGEgZGVhZGxvY2sgaGVyZSBiZWNhdXNlIGdl
dF9jcHVfbWFwcyBkb2VzIGEKPiA+IHRyeWxvY2ssIHNvIGlmIGFub3RoZXIgY3B1IGlzIGhvbGRp
bmcgdGhlIGxvY2sgdGhlIGZsdXNoIHdpbGwganVzdAo+ID4gZmFsbGJhY2sgdG8gbm90IHVzaW5n
IHRoZSBzaG9ydGhhbmQuCj4gCj4gV2VsbCwgd2l0aCB0aGUgX2V4YWN0XyBhcnJhbmdlbWVudHMg
KGZsdXNoX2xvY2sgdXNlZCBvbmx5IGluIG9uZQo+IHBsYWNlLCBhbmQgY3B1X2FkZF9yZW1vdmVf
bG9jayBvbmx5IHVzZWQgaW4gd2F5cyBzaW1pbGFyIHRvIGhvdyBpdAo+IGlzIHVzZWQgbm93KSwg
dGhlcmUncyBubyBzdWNoIHJpc2ssIEkgYWdyZWUuIEJ1dCB0aGVyZSdzIG5vdGhpbmcKPiBhdCBh
bGwgbWFraW5nIHN1cmUgdGhpcyBkb2Vzbid0IGNoYW5nZS4gSGVuY2UsIGFzIHNhaWQsIGF0IHRo
ZSB2ZXJ5Cj4gbGVhc3QgdGhpcyBuZWVkcyByZWFzb25pbmcgYWJvdXQgaW4gdGhlIGRlc2NyaXB0
aW9uIChvciBhIGNvZGUKPiBjb21tZW50KS4KCkknbSBhZnJhaWQgeW91IHdpbGwgaGF2ZSB0byBi
ZWFyIHdpdGggbWUsIGJ1dCBJJ20gc3RpbGwgbm90IHN1cmUgaG93CnRoZSBhZGRpdGlvbiBvZiBn
ZXRfY3B1X21hcHMgaW4gZmx1c2hfYXJlYV9tYXNrIGNhbiBsZWFkIHRvIGRlYWRsb2Nrcy4KQXMg
c2FpZCBhYm92ZSBnZXRfY3B1X21hcHMgZG9lcyBhIHRyeWxvY2ssIHdoaWNoIG1lYW5zIHRoYXQg
aXQgd2lsbApuZXZlciBkZWFkbG9jaywgYW5kIHRoYXQncyB0aGUgb25seSB3YXkgdG8gbG9jayBj
cHVfYWRkX3JlbW92ZV9sb2NrLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
