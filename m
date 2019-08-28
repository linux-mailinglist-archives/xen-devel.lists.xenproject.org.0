Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E42BA075E
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2019 18:29:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i30lf-0001JL-WF; Wed, 28 Aug 2019 16:25:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=835Q=WY=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1i30le-0001JG-96
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2019 16:25:54 +0000
X-Inumbo-ID: 809ad43c-c9b0-11e9-8980-bc764e2007e4
Received: from mail-wm1-x336.google.com (unknown [2a00:1450:4864:20::336])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 809ad43c-c9b0-11e9-8980-bc764e2007e4;
 Wed, 28 Aug 2019 16:25:52 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id y135so52429wmc.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2019 09:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=axmY/g2QvevTdg7HmFVgnIZPWhF8VZfaEHG8iPoMxKk=;
 b=OpI3Gu6wbp6FzVKRbKpBzVs4AhuRy75qin1koDblL9USikFKI74xIYsHbfW27NKpQh
 8qhUcKAjRYUlP6H7Kud5EfEkqh3Zja9cmpGCdXvER+YKk14ernPuk/O0OOb0MO/2dJ0H
 4NPh1z1IUtwKfWjFS8Ggya2aSMNva5KjA7n4BrKygQ8SCEF68uHLu3M0xrtjo+3AGzcY
 NlzC7UPpAVC7yTEpagtSjpUZOJyrElaX1erFUUnygrKwJrHAWy981rIikYSXJ1URyytb
 5Nu7cpgB33+skIHKLeed1jgsKkgyuintI9nknR7PfDgvWl4FBuiR0DDzza1T+XQPdXN3
 F2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=axmY/g2QvevTdg7HmFVgnIZPWhF8VZfaEHG8iPoMxKk=;
 b=ZyPfEzJVj+ik9xQwvhnysc7F6PXV1/KzvswYUP+Vijj2JZY602gbyHfLcxpjoLiNzr
 FrMz3QYb6XSf94TML+ZxobYGwqOej5U8xJW7CxbwAN02Ztk8WFwgVEhcIXxTW5ji+6Id
 zQ9c06dJjBDiMPb5sLv/QeSCL/k0IG4fTPZv4p+eoM0o1GTFUFFvFSK7bDSkg/tDmb3K
 IigWK6twH4qEPo8B6h+JUrZyZidibPhv3P/IfH6xpmPYMQ84taUexTV5SAiZ00MONgXi
 /XxFPkyU47tIDpZibi2kAEX5gFVmWzWKO6G7BVM00LeLCUZidEKoGfO9a/0fWNcVyN9v
 FENg==
X-Gm-Message-State: APjAAAXAMenf6KY0X4STyheLj7W3040LxaO8jnTBMKejkvBEk4lnu6la
 2rassMhgs49VYvAg/lsDS59q4ePKcbD3r07khks=
X-Google-Smtp-Source: APXvYqxv6PVoPRcxdyLKP35cwHGWC6Mz23E1ZjBPdIKAMXQy7IQNHgxgo3kQae2Vaa+b2TyNtoX6+wL+3+O4FuK6nrs=
X-Received: by 2002:a1c:4d05:: with SMTP id o5mr5741613wmh.129.1567009551659; 
 Wed, 28 Aug 2019 09:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <CABfawhm+eu2ebwdou3btLJxcxBbq+uCHNxf82zahxp8dcsoDEQ@mail.gmail.com>
 <8c7ba37a-7fd0-4901-fd5b-4d04e02d63fc@suse.com>
 <CABfawhkHm89cqMu5m-6SiLU-r8m4kFXcTMAH_3cFfvRQCUDBug@mail.gmail.com>
 <43f75b07-0e2d-1c71-1a98-d3e875e09b82@suse.com>
In-Reply-To: <43f75b07-0e2d-1c71-1a98-d3e875e09b82@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 28 Aug 2019 10:25:15 -0600
Message-ID: <CABfawhnc6-h_KAS62k08P0L98Q1ZCAm4AM7U_pJKdDVGnhH=MQ@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] Question about xenpage_list
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgOTo1NCBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMjguMDguMjAxOSAxNzo1MSwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gT24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgOTozNSBBTSBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gT24gMjguMDguMjAxOSAxNzoyOCwgVGFt
YXMgSyBMZW5neWVsIHdyb3RlOgo+ID4+PiBIaSBhbGwsCj4gPj4+IEknbSB0cnlpbmcgdG8gdHJh
Y2sgZG93biBob3cgYSBjYWxsIGluIGNvbW1vbi9ncmFudF90YWJsZS5jIHRvCj4gPj4+IHNoYXJl
X3hlbl9wYWdlX3dpdGhfZ3Vlc3Qgd2lsbCBhY3R1YWxseSBwb3B1bGF0ZSB0aGF0IHBhZ2UgaW50
byB0aGUKPiA+Pj4gZ3Vlc3QncyBwaHlzbWFwLiBJbW1lZGlhdGVseSBhZnRlciB0aGUgY2FsbCB0
aGUgcGFnZSBkb2Vzbid0IHNlZW0gdG8KPiA+Pj4gYmUgcHJlc2VudCBpbiB0aGUgcGh5c21hcCwg
YXMgc2hhcmVfeGVuX3BhZ2Vfd2l0aF9ndWVzdCB3aWxsIGp1c3QgYWRkCj4gPj4+IHRoZSBwYWdl
IHRvIHRoZSBkb21haW4ncyB4ZW5wYWdlX2xpc3QgbGlua2VkLWxpc3Q6Cj4gPj4+Cj4gPj4+ICAg
ICAgICAgdW5zaWduZWQgbG9uZyBtZm47Cj4gPj4+ICAgICAgICAgdW5zaWduZWQgbG9uZyBnZm47
Cj4gPj4+Cj4gPj4+ICAgICAgICAgc2hhcmVfeGVuX3BhZ2Vfd2l0aF9ndWVzdCh2aXJ0X3RvX3Bh
Z2UoZ3QtPnNoYXJlZF9yYXdbaV0pLCBkLCBTSEFSRV9ydyk7Cj4gPj4+Cj4gPj4+ICAgICAgICAg
bWZuID0gdmlydF90b19tZm4oZ3QtPnNoYXJlZF9yYXdbaV0pOwo+ID4+PiAgICAgICAgIGdmbiA9
IG1mbl90b19nbWZuKGQsIG1mbik7Cj4gPj4+Cj4gPj4+ICAgICAgICAgZ2RwcmludGsoWEVOTE9H
X0lORk8sICJTaGFyaW5nICVseCAtPiAlbHggd2l0aCBkb21haW4gJXVcbiIsCj4gPj4+IGdmbiwg
bWZuLCBkLT5kb21haW5faWQpOwo+ID4+Pgo+ID4+PiBUaGlzIHJlc3VsdHMgaW4gdGhlIGZvbGxv
d2luZzoKPiA+Pj4KPiA+Pj4gKFhFTikgZ3JhbnRfdGFibGUuYzoxODIwOmQwdjAgU2hhcmluZyBm
ZmZmZmZmZmZmZmZmZmZmIC0+IDQyYzcxZSB3aXRoIGRvbWFpbiAxCj4gPj4+Cj4gPj4+IEFGQUlD
VCB0aGUgcGFnZSBvbmx5IGdldHMgcG9wdWxhdGVkIGludG8gdGhlIHBoeXNtYXAgb25jZSB0aGUg
ZG9tYWluCj4gPj4+IGdldHMgdW5wYXVzZWQuIElmIEkgbGV0IHRoZSBkb21haW4gcnVuIGFuZCB0
aGVuIHBhdXNlIGl0IEkgY2FuIHNlZQo+ID4+PiB0aGF0IHRoZSBwYWdlIGlzIGluIHRoZSBndWVz
dCdzIHBoeXNtYXAgKGJ5IGxvb3BpbmcgdGhyb3VnaCBhbGwgdGhlCj4gPj4+IGVudHJpZXMgaW4g
aXRzIEVQVCk6Cj4gPj4+Cj4gPj4+IChYRU4pIG1lbV9zaGFyaW5nLmM6MTYzNjpkMHYwIDB4ZjIw
MDAgLT4gMHg0MmM3MWUgaXMgYSBncmFudCBtYXBwaW5nCj4gPj4+IHNoYXJlZCB3aXRoIHRoZSBn
dWVzdAo+ID4+Cj4gPj4gVGhpcyBzaG91bGQgYmUgdGhlIHJlc3VsdCBvZiB0aGUgZG9tYWluIGhh
dmluZyBtYWRlIGEgcmVzcGVjdGl2ZQo+ID4+IFhFTk1BUFNQQUNFX2dyYW50X3RhYmxlIHJlcXVl
c3QsIHNob3VsZG4ndCBpdD8KPiA+Pgo+ID4KPiA+IERvIHlvdSBtZWFuIHRoZSBndWVzdCBpdHNl
bGYgb3IgdGhlIHRvb2xzdGFjaz8KPgo+IFRoZSBndWVzdCBpdHNlbGYgLSBob3cgd291bGQgdGhl
IHRvb2wgc3RhY2sga25vdyB3aGVyZSB0byBwdXQgdGhlCj4gZnJhbWUocyk/CgpJIGRvbid0IHRo
aW5rIHRoYXQgbWFrZXMgc2Vuc2UuIEhvdyB3b3VsZCBhIGd1ZXN0IGl0c2VsZiBub3cgdGhhdCBp
dApuZWVkcyB0byBtYXAgdGhhdCBmcmFtZT8gV2hlbiB5b3UgcmVzdG9yZSB0aGUgVk0gZnJvbSBh
IHNhdmVmaWxlLCBpdAppcyBhbHJlYWR5IHJ1bm5pbmcgYW5kIG5vIGZpcm13YXJlIGlzIGdvaW5n
IHRvIHJ1biBpbiBpdCB0byBpbml0aWFsaXplCnN1Y2ggR0ZOcy4KCkFzIGZvciB0aGUgdG9vbHN0
YWNrLCBJIHNlZSBjYWxscyB0byB4Y19kb21fZ250dGFiX3NlZWQgZnJvbSB0aGUKdG9vbHN0YWNr
IGR1cmluZyBkb21haW4gY3JlYXRpb24gKGJlIGl0IGEgbmV3IGRvbWFpbiBvciBvbmUgYmVpbmcK
cmVzdG9yZWQgZnJvbSBhIHNhdmUgZmlsZSkgd2hpY2ggZG9lcyBpc3N1ZSBhIFhFTk1FTV9hZGRf
dG9fcGh5c21hcAp3aXRoIHRoZSBzcGFjZSBiZWluZyBzcGVjaWZpZWQgYXMgWEVOTUFQU1BBQ0Vf
Z3JhbnRfdGFibGUuIExvb2tzIGxpa2UKaXQgZ2F0aGVycyB0aGUgR0ZOIHZpYSB4Y19jb3JlX2Fy
Y2hfZ2V0X3NjcmF0Y2hfZ3Bmbi4gU28gaXQgbG9va3MgbGlrZQp0aGF0J3MgaG93IGl0cyBkb25l
LgoKVGhhbmtzLApUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
