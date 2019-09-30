Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99655C295C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 00:19:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iF3yc-00033z-Nb; Mon, 30 Sep 2019 22:17:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gsfi=XZ=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1iF3ya-00033u-Rx
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 22:17:04 +0000
X-Inumbo-ID: 08161ed8-e3d0-11e9-bf31-bc764e2007e4
Received: from mail-qt1-x844.google.com (unknown [2607:f8b0:4864:20::844])
 by localhost (Halon) with ESMTPS
 id 08161ed8-e3d0-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 22:17:04 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id m15so19148220qtq.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2019 15:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ASAWMh/VVA4+NYfaiGXUYpeyOPxTYXvDdeTdGiXiqJo=;
 b=FOkHY/j3IX8+HY8reQtsSDTc3Kq30RwAPnz4pfGeb7IM5IqHUqfxffdkqvqT8z5fqg
 sE8PZ1cjO5DVk3FlbuxpaKu1bNiM+ZChBO7EX79l+wo5DonzmITOUv/jL8XCk8GJDJYV
 mshiffUCnl89Gxdd82+0GCLtpTQAFaum8/8pgNrXT/dUGhmwQNZ7qVRJ32UlULwz3uhG
 QlQeroLBuluK3cM93YPcp/pTjJfyyhNHoG9l11WimZL67J93MqpMZ0hGEu8zhsNda4I2
 2EsX5Q9eUXI3rVatUBl7LoVzGEuI6vV6zzwNqoMPP1x+Xpc7J5E9alFI1iqtCy2IVHpr
 ODvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ASAWMh/VVA4+NYfaiGXUYpeyOPxTYXvDdeTdGiXiqJo=;
 b=GssTOX4AzIGjW6I0KyYPSSu/+hkWEdNex8hTBVjopDJM+3gR66Bh2dEDNg7OPAjtaC
 k+gYbNaaNkoH4FggZbGNIJXKHCjCCNqULLMMbys5tmQUl5jehzX0irbKkKmhZU0q6Oyz
 NUEohoJWnfwM5mP8Ysrxyqabk+IRVCblWfzCN+81k9WhMMHgdH9VhpsHovI0zRpr0f4Y
 IcPCFTttccICKVumeEypppMs5jhxiTpMf14FwcxN/2isDK+dbbIK83XHzLkAh02x1pf2
 gqFY/oG5p0VFqNw9Tohgojds9ZzU2iu2ptvmINn7sOpBB9uXmqlxdMsL4mVNSIR9X4Po
 s2kA==
X-Gm-Message-State: APjAAAXiFB5D/joMfExxIme7jnmhV/5zlFi3GwpnzUw+pu651TOMpqgt
 ZKLv7YXuauDW6OSnhorb9YHJpr85Wo4+aJQRM3kCrQ==
X-Google-Smtp-Source: APXvYqwkGd3VkqvefPFWhSqX/n3xny//bDl0GLq4Yu6PxBohMDxDJCcNpsqo9OdWpvqKgCZdic5n9xkeeHhqNJyhzZ4=
X-Received: by 2002:a05:6214:1369:: with SMTP id
 c9mr22881940qvw.3.1569881823583; 
 Mon, 30 Sep 2019 15:17:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy-seCk9rW3GM3Aij1O+F2AtmQR1Yrxb180Wndqd3hATcw@mail.gmail.com>
 <0bc03d80-0696-8c5b-2189-24509c7ea3e6@suse.com>
 <CAMmSBy-41DseRA7MjY=Ux1r99VwFG7B2LHe-Udv+5KxURfbr2A@mail.gmail.com>
 <f23f1805-52fa-7d0f-7423-35bf644277dd@suse.com>
 <CAMmSBy8MGk01ZFF20N21ZWNMJaFhaj0VKomU48YQvvr7ah6v_w@mail.gmail.com>
 <1e875ef2-6093-d1f6-38d6-36093206d36d@suse.com>
In-Reply-To: <1e875ef2-6093-d1f6-38d6-36093206d36d@suse.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Mon, 30 Sep 2019 15:16:52 -0700
Message-ID: <CAMmSBy_+uGe1QefqUgmhU48=D8V3+g9EKMM==hV4rkAtR1Dx1w@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] Latest development (master) Xen fails to boot on HP
 ProLiant DL20 GEN10
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMjo1NiBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMjguMDkuMjAxOSAwNTowNywgUm9tYW4gU2hhcG9zaG5payB3
cm90ZToKPiA+IE9uIFRodSwgU2VwIDI2LCAyMDE5IGF0IDEyOjQ0IEFNIEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiBPbiAyNi4wOS4yMDE5IDAwOjMxLCBS
b21hbiBTaGFwb3NobmlrIHdyb3RlOgo+ID4+PiBKYW4sIFJvZ2VyLCB0aGFuayB5b3Ugc28gbXVj
aCBmb3IgdGhlIGluaXRpYWwgaWRlYXMuIEkgdHJpZWQgYSBmZXcgb2YKPiA+Pj4gdGhvc2UgYW5k
IGhlcmUncyB3aGVyZSBJIGFtLgo+ID4+Pgo+ID4+PiBGaXJzdCBvZiBhbGwsIGl0IGlzIGRlZmlu
aXRlbHkgcmVsYXRlZCB0byBDUFUgYnJpbmcgdXAuIEFkZGluZwo+ID4+PiBjcHVpZGxlPTAgdG8g
eGVuIGNvbW1hbmQgbGluZSBtYWRlIFhlbiBib290Lgo+ID4+Pgo+ID4+PiBUaGVuLCBhIGdvb2Qg
ZnJpZW5kIG9mIG1pbmUgKHdobyB5b3UgbWF5IGtub3cgZnJvbSBhbmNpZW50IFhlbiBkYXlzCj4g
Pj4+IDstKSkgc3VnZ2VzdGVkIHRoYXQgdGhpcyBjb3VsZCBiZSByZWxhdGVkIHRvIHRoaXM6Cj4g
Pj4+ICAgICAgaHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnL3dpa2kvWGVuX3Bvd2VyX21hbmFn
ZW1lbnQKPiA+Pj4gc28gSSB3ZW50IHRvIHRoZSBCSU9TIHNldHRpbmdzIGFuZCBxdWl0ZSB0byBt
eSBzdXJwcmlzZSBhbGwgb2YgdGhlbQo+ID4+PiB3ZXJlIGdyYXllZCBvdXQgKG5vdCB0d2Vha2Fi
bGUpLgo+ID4+Pgo+ID4+PiBUaGUgb25seSBvbmUgdGhhdCB3YXNuJ3Qgd2FzIDJ4QVBJQyBzdXBw
b3J0LiBTbyBqdXN0IGZvciBraWNrcyAtLSBJCj4gPj4+IGRpc2FibGVkIHRoYXQuCj4gPj4+Cj4g
Pj4+IFRoYXQsIGluIHR1cm4sIG1hZGUgWGVuIGJvb3QgZXZlbiB3aXRob3V0IGNwdWlkbGU9MC4g
SSdtIGF0dGFjaGluZyB0aGF0IGxvZy4KPiA+Pgo+ID4+IEludGVyZXN0aW5nLCBidXQgdW5mb3J0
dW5hdGVseSB0aGlzIHBhcnRpY3VsYXIgbG9nIGlzIG9mIG5vIHJlYWwgdXNlCj4gPj4gZm9yIGlu
dmVzdGlnYXRpb24gb2YgdGhlIGlzc3VlIChvdGhlciB0aGFuIGtub3dpbmcgdGhlIENQVSBtb2Rl
bCkuIEkKPiA+PiBhbHNvIG5vdGljZSBpdCdzIGEgNC4xMi4wIGxvZywgd2hlbiB5b3VyIG9yaWdp
bmFsIHJlcG9ydCB3YXMgYWdhaW5zdAo+ID4+IGxhdGVzdCBtYXN0ZXIuCj4gPj4KPiA+Pj4gU28g
SSBndWVzcyBhdCB0aGlzIHBvaW50LCB5b3UgY291bGQgc2F5IHRoYXQgSSBoYXZlIGEgZnVuY3Rp
b25hbAo+ID4+PiBzeXN0ZW0sIGJ1dCBJJ20gY3VyaW91cyB3aGV0aGVyIHlvdSBndXlzIHdvdWxk
IGJlIGludGVyZXN0ZWQgdG8gbG9vawo+ID4+PiBpbnRvIDJ4QVBJQyBzaXR1YXRpb24uCj4gPj4K
PiA+PiBPZiBjb3Vyc2Ugd2UgZG8uIEFzIGEgbmV4dCBzdGVwIEknZCBzdWdnZXN0IHJldmVydGlu
ZyB0aGUgQklPUyBzZXR0aW5ncwo+ID4+IGNoYW5nZSB5b3UgZGlkLCBhbmQgaW5zdGVhZCB1c2lu
ZyB0aGUgIngyYXBpYz0wIiBYZW4gY29tbWFuZCBsaW5lIG9wdGlvbi4KPiA+Cj4gPiBJbnRlcmVz
dGluZ2x5IGVub3VnaCwgdGhpcyBkb2Vzbid0IHJlYWxseSBzb2x2ZSB0aGUgcHJvYmxlbSBjb21w
bGV0ZWx5Lgo+ID4gU3BlY2lmeWluZyB4MmFwaWM9MCBjZXJ0YWlubHkgbWFrZXMgWGVuIGdvIG11
Y2ggZnVydGhlciB0byBhIHBvaW50Cj4gPiB3aGVyZSBpdCB0cmllcyB0byBsb2FkIERvbTAgYW5k
IHRoZW4gdGhlIGNvbnNvbGUgVkdBIHNjcmVlbiBnb2VzCj4gPiBibGFuayAodGhpcyBpcyB3aGVy
ZSB0aGF0IHNlcmlhbCBkZWJ1ZyBvdXRwdXQgd291bGQgYmUgdmVyeSB1c2VmdWwgOi0oKS4KPgo+
IE5vdyB0aGF0J3MgYWdhaW4gdW5leHBlY3RlZC4gSW4gYW55IGV2ZW50IHlvdSBjb3VsZCB0cnkg
InZnYT1rZWVwIi4KPgo+ID4+IEFuZCB0aGVuIHdlIG9mIGNvdXJzZSBuZWVkIGEgY29tcGxldGUg
Ym9vdCBsb2cgKGFzIHJlcXVlc3RlZCBlYXJsaWVyKSBvZgo+ID4+IGEgcHJvYmxlbSBjYXNlLgo+
ID4+Cj4gPj4gRnVydGhlciBJJ2Qgc3VnZ2VzdCBtb3ZpbmcgYXdheSBmcm9tIHRoZSBibGFjay1h
bmQtd2hpdGUgImNwdWlkbGU9Igo+ID4+IG9wdGlvbiwgYW5kIGluc3RlYWQgbGltaXRpbmcgdXNl
IG9mIGRlZXAgQyBzdGF0ZXMgKCJtYXhfY3N0YXRlPSIpLiBJCj4gPj4gd291bGRuJ3QgYmUgc3Vy
cHJpc2VkIGlmIHRoaXMgd2FzIHRoZSBpc3N1ZTsgd2UnZCB0aGVuIGhhdmUgdG8gZmlyc3QKPiA+
PiBvZiBhbGwgZ28gdGhyb3VnaCBlcnJhdGEgZm9yIHRoZSBwYXJ0IHlvdXIgc3lzdGVtIGlzIHVz
aW5nLgo+ID4KPiA+IFl1cC4gbWF4X2NzdGF0ZT0xIG1ha2VzIGl0IGJvb3QgZmluZS4gbWF4X2Nz
dGF0ZT0yIHRob3VnaCBoYW5ncwo+ID4gdGhlIHN5c3RlbSAqZXhhY3RseSogaW4gdGhlIHNhbWUg
d2F5IGFzIHNwZWNpZnlpbmcgeDJhcGljPTAKPiA+ICh3aGljaCBpcyBkaWZmZXJlbnQgZnJvbSB0
aGUgb3JpZ2luYWwgcHJvYmxlbSBhcyBJJ3ZlIGRlc2NyaWJlZCBhYm92ZSkuCj4KPiAibWF4X2Nz
dGF0ZT0yIiBpcyBtdWNoIGxlc3Mgb2YgYSAiZGVlcCIgQyBzdGF0ZSB0aGFuIEkgaGFkIGV4cGVj
dGVkLAo+IGJ1dCB3ZWxsLCBzbyBiZSBpdCB0aGVuLiBBcyB0byB0aGUgaGFuZyAtIGRpZCB5b3Ug
bWVhbndoaWxlIGZpZ3VyZQo+IHdoZXRoZXIgX2FueV8gbnVtYmVyIG9mIENQVXMgYWJvdmUgMSB3
b3VsZCByZXN1bHQgaW4gYSBoYW5nLCBvcgo+IHdoZXRoZXIgaW5zdGVhZCB0aGVyZSdzIGEgY2Vy
dGFpbiBhbW91bnQgb2YgdGhlbSB0aGF0IHdvdWxkIGFsbG93Cj4gYm9vdCB0byBwcm9ncmVzcyBm
aW5lLgoKRG8geW91IG1lYW4gYnkgdHdlYWtpbmcgbWF4Y3B1cyBzZXR0aW5nPwoKQW55dGhpbmcg
YWJvdmUgMSBkb2Vzbid0IHdvcmsKCm1heGNwdXM9MSBib290cyBmaW5lIHRobwoKPiA+IENhbiB5
b3UgcGxlYXNlIGVsYWJvcmF0ZSBvbiAid2UnZCB0aGVuIGhhdmUgdG8gZmlyc3Qgb2YgYWxsIGdv
IHRocm91Z2gKPiA+IGVycmF0YSBmb3IgdGhlIHBhcnQgeW91ciBzeXN0ZW0gaXMgdXNpbmciCj4K
PiBXZWxsLCBpdCB3b3VsZG4ndCBiZSB0aGUgZmlyc3QgdGltZSB0aGF0IGhhcmR3YXJlIGhhZCBp
c3N1ZXMgd2l0aCBDCj4gc3RhdGUgaGFuZGxpbmcuIFRoZXJlZm9yZSB3ZSdkIG5lZWQgdG8gKGEp
IGJlIHN1cmUgeW91IHVzZSB1cC10by1kYXRlCj4gbWljcm9jb2RlIGFuZCAoYikgdGhlcmUgYXJl
IG5vIGVycmF0YSBkb2N1bWVudGVkIGZvciB5b3VyIENQVSBtb2RlbAo+IHdvcmthcm91bmRzIGZv
ciB3aGljaCBiYXNpY2FsbHkgc3VnZ2VzdCB0byBhdm9pZCB1c2Ugb2YgZGVlcCBDIHN0YXRlcy4K
Ckl0IHNlZW1zIHlvdSd2ZSBkb25lIHRoYXQgYWxyZWFkeSAtLSB0aGFuayB5b3UhCgpUaGFua3Ms
ClJvbWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
