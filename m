Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2697CF51
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 23:05:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsvl5-0006B6-LY; Wed, 31 Jul 2019 21:03:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=92Dq=V4=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1hsvl4-0006B1-6c
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 21:03:38 +0000
X-Inumbo-ID: a98925c9-b3d6-11e9-8980-bc764e045a96
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a98925c9-b3d6-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 21:03:36 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id h21so67901606qtn.13
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2019 14:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tXEQn1iNgRNFsZo+8nGHR+SL8ZngA0ORPpI8H62snGw=;
 b=PG7R6NEgo6Vjj46WxkO/5KMWkqSBE1O8Itzb3JHzreDYV9KmmI5EnV1wIFSwmeU8nN
 mEO7WY3Q5422qSKZSTuavpE16PiK+C1diif7mehAQ4M7+IKJhn8fpgKQCAr2Vcx0LKw/
 1n+noIph3F/0ICxZQPmMiKEjpbgtj30+O8ymjRQepnwrgruBqQMdF7q/56KPto/L3CgS
 igtZWEWSJLuYl7/HG9tLt67ZVeT8F+k3UnpA59W+AOaxDu+epEdqnCP7nVE7D7yKGEOr
 o54p6ZHM7pWx/jk5iWcK75AP5ooxFwhZA60hch7mLxHjYOSPmZqVwj35cC5to8hCY5l0
 MBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tXEQn1iNgRNFsZo+8nGHR+SL8ZngA0ORPpI8H62snGw=;
 b=Qj0Um6pYFAMB/lp6HzyNK4wUKIG9uJXnTLCkMuE0FXwRvQYDaAsktTEDP1u/KxYI1X
 YVLxJcwv6EB9475/ji0Fi/Z6TvG0qOyEcc1oIGBfejGzXCEAu1t53fLjXVQiVqCFriKk
 jxwrLQfIQBg6FjpF12WrLWbKE2YIRahqWSgGieO3/nOAC8NTCh9m0XLOWHbYyOjkHkNv
 j0bH5yoRk05n5IBYsuUFKh0CcaNwLmBKH6ZFrcwQ10ezrsaAL3buYo/ES6nBlb8lAJUA
 TsHy9Re3qjQGLck/Xf8LDihrhRZEvGACSsxXp3sU4bHtOQUy5WESNTdEN2Lq5BBg6UIS
 vCTw==
X-Gm-Message-State: APjAAAX3ljHXRnOuAW4U850L6Xm1x0Hh+orvSAH7qc88xG65LZDygfmn
 Eu/kbcwY8s4oTaa74pPKlQJa7EEzKxWOGqplqZGFtQ==
X-Google-Smtp-Source: APXvYqy+b7/68jy45jZf37aHpxmB4TsDMZKL5R1ipORUnxoH+vE/VkvBa3k5bLQQFr6ZUKu5qVmq4th9+QVuyQxLu1k=
X-Received: by 2002:ac8:60a:: with SMTP id d10mr85076700qth.31.1564607015634; 
 Wed, 31 Jul 2019 14:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190722152152.dvhs4riw2w67rvih@Air-de-Roger>
 <CAMmSBy-P9+00XfK6k2OYqFHNONcxeGuu0V=Qk4peFDC=KOUogA@mail.gmail.com>
 <b5ba8315-ce59-85e6-5bfc-1db4c239eb1c@citrix.com>
 <CAMmSBy-S7nMg-V5DUzV2L2RmK0TnFt+9=C8gE=0FuUOQK3kjQQ@mail.gmail.com>
 <20190724141145.hg4aa5wyg5tsgv5p@Air-de-Roger>
 <CAMmSBy_XRLrxdM-U11pu4JinAKP3fi2TO=VCSo8g_BzMG3X0TA@mail.gmail.com>
 <20190726093545.zwmbt27c24skd3iz@Air-de-Roger>
 <20190730092122.dbpfzu7jsznpyksd@Air-de-Roger>
 <CAMmSBy8U3druT0V_9ADojAyQxn7KTWARMsZ08DZ_5EWU43qDAg@mail.gmail.com>
 <20190731083631.63vqxrdr5vyeeswn@Air-de-Roger>
 <20190731084336.lkpk4n35qg2zo67w@Air-de-Roger>
 <CAMmSBy89cvwnRRPhorpUucLdc5LEak__Mtyw8ka5XvqP7W+q6A@mail.gmail.com>
 <d6ba30f8-7959-57bc-3843-e11f48b52766@citrix.com>
In-Reply-To: <d6ba30f8-7959-57bc-3843-e11f48b52766@citrix.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Wed, 31 Jul 2019 14:03:24 -0700
Message-ID: <CAMmSBy9ZiEU95yAK1ry_41GR0ttWTX9EEJ0bMStZaK=PrzCH7w@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
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
Cc: "jgross@suse.com" <jgross@suse.com>, Paul Durrant <Paul.Durrant@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMTI6NDYgUE0gQW5kcmV3IENvb3Blcgo8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiAzMS8wNy8yMDE5IDIwOjM1LCBSb21hbiBT
aGFwb3NobmlrIHdyb3RlOgo+ID4gT24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMTo0MyBBTSBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPj4gT24gV2VkLCBK
dWwgMzEsIDIwMTkgYXQgMTA6MzY6MzFBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToK
PiA+Pj4gT24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMTA6NTU6MjRBTSAtMDcwMCwgUm9tYW4gU2hh
cG9zaG5payB3cm90ZToKPiA+Pj4+IFNvcnJ5IC0tIGdvdCBhIGJpdCBkaXN0cmFjdGVkIHllc3Rl
cmRheS4gQXR0YWNoZWQgaXMgdGhlIGxvZyB3aXRoIG9ubHkKPiA+Pj4+IHlvdXIgbGF0ZXN0IHBh
dGNoIGF0dGFjaGVkLiBJbnRlcmVzdGluZ2x5IGVub3VnaCB0aGUgYm94IGJvb3RlZCBmaW5lCj4g
Pj4+PiB3aXRob3V0IHNjcmVlbiBhcnRpZmFjdHMuIFNvIEkgZ3Vlc3Mgd2UncmUgZ2V0dGluZyBj
bG9zZXIuLi4KPiA+Pj4+Cj4gPj4+PiBUaGFua3MgZm9yIGFsbCB0aGUgaGVscCEKPiA+Pj4gVGhh
dCdzIHF1aXRlIHdlaXJkLCB0aGVyZSdzIG5vIGZ1bmN0aW9uYWwgY2hhbmdlcyBiZXR3ZWVuIHRo
ZQo+ID4+PiBwcmV2aW91cyBwYXRjaGVzIGFuZCB0aGlzIG9uZSwgdGhlIG9ubHkgZGlmZmVyZW5j
ZSBpcyB0aGF0IHRoaXMgcGF0Y2gKPiA+Pj4gaGFzIG1vcmUgdmVyYm9zZSBvdXRwdXQuCj4gPj4+
Cj4gPj4+IEFyZSB5b3Ugc3VyZSB5b3UgZGlkbid0IGhhdmUgYW55IGxvY2FsIHBhdGNoZXMgb24g
dG9wIG9mIFhlbiB0aGF0Cj4gPj4+IGNvdWxkIGV4cGxhaW4gdGhpcyBkaWZmZXJlbmNlIGluIGJl
aGF2aW91cj8KPiA+PiBGV0lXLCBjYW4geW91IHBsZWFzZSB0cnkgdGhlIHBsYWluIHBhdGNoIGFn
YWluOgo+ID4+Cj4gPj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1s
L3hlbi1kZXZlbC8yMDE5LTA3L21zZzAxNTQ3Lmh0bWwKPiA+Pgo+ID4+IEFuZCByZXBvcnQgYmFj
az8KPiA+Pgo+ID4+IEkgd291bGQgbGlrZSB0byBnZXQgdGhpcyBjb21taXR0ZWQgQVNBUCBpZiBp
dCBkb2VzIGZpeCB5b3VyIGlzc3VlLgo+ID4gSSdkIGxpa2UgdG8gc2F5IHRoYXQgaXQgZGlkIC0t
IGJ1dCBJIHRyaWVkIGl0IGFnYWluIGp1c3Qgbm93IGFuZCBpdAo+ID4gc3RpbGwgZ2FyYmxlZCBz
Y3JlZW4gYW5kIHRvbnMgb2Y6Cj4gPgo+ID4gKFhFTikgcHJpbnRrOiAyNjY2NSBtZXNzYWdlcyBz
dXBwcmVzc2VkLgo+ID4gKFhFTikgW1ZULURdRE1BUjpbRE1BIFJlYWRdIFJlcXVlc3QgZGV2aWNl
IFswMDAwOjAwOjAyLjBdIGZhdWx0IGFkZHIKPiA+IDhlMTRjMDAwLCBpb21tdSByZWcgPSBmZmZm
ODJjMDAwOGRlMDAwCj4gPgo+ID4gSSdtIHZlcnkgbXVjaCBjb25mdXNlZCBieSB3aGF0J3MgZ29p
bmcgb24sIGJ1dCBpdCBzZWVtcyB0aGF0J3MgdGhlCj4gPiBjYXNlIC0tIGFkZGluZyB0aG9zZSBk
ZWJ1ZyBwcmludCBzdGF0ZW1lbnRzIG1ha2UgdGhlIGlzc3VlIGdvIGF3YXkKPiA+Cj4gPiBIZXJl
IGFyZSB0aGUgcGF0Y2hlcyB0aGF0IGFyZSBiZWluZyBhcHBsaWVkOgo+ID4gICAgTk9UIFdPUktJ
Tkc6Cj4gPiBodHRwczovL2dpdGh1Yi5jb20vcnZzL2V2ZS9ibG9iL3hlbi1idWcvcGtnL3hlbi8w
MS1pb21tdS1tYXBwaW5ncy5wYXRjaAo+ID4KPiA+ICAgIFdPUktJTkc6IGh0dHBzOi8vZ2l0aHVi
LmNvbS9ydnMvZXZlL2Jsb2IvYTEyOTFmY2Q0ZTY2OWRmMmE2MzI4NWFmYjVlOGI0ODQxZjQ1YzFj
OC9wa2cveGVuLzAxLWlvbW11LW1hcHBpbmdzLnBhdGNoCj4gPgo+ID4gQXQgdGhpcyBwb2ludCBJ
J20gcmVhbGx5IG5vdCBzdXJlIHdoYXQncyBnb2luZyBvbi4KPgo+IE9rLiAgc2VlaW5nIGFzIHlv
dSd2ZSBkb3VibGUgY2hlY2tlZCB0aGlzLCB0aGUgbXlzdGVyeSBkZWVwZW5zLgo+Cj4gTXkgYmV0
IGlzIG9uIHRoZSBpbnRlbF9pb21tdV9sb29rdXBfcGFnZSgpIGNhbGwgaGF2aW5nIHNpZGUgZWZm
ZWN0c1sxXS4KPiBJZiB5b3UgdGFrZSBvdXQgdGhlIGRlYnVnZ2luZyBpbiB0aGUgbWlkZGxlIG9m
IHRoZSBsb29wIGluCj4gcm1ycl9pZGVudGl0eV9tYXBwaW5nKCksIGRvZXMgdGhlIHByb2JsZW0g
cmVwcm9kdWNlIGFnYWluPwo+Cj4gfkFuZHJldwo+Cj4gWzFdIExvb2tpbmcgYXQgdGhlIGludGVy
bmFscyBvZiBhZGRyX3RvX2RtYV9wYWdlX21hZGRyKCksIGl0IGRvZXMgMTAwJQo+IG1vcmUgbWVt
b3J5IGFsbG9jYXRpb24gYW5kIGhpZ2hlci1sZXZlbCBQVEUgY29uc3RydWN0aW9uIHRoYW4gbG9v
a3Mgd2lzZQo+IGZvciB3aGF0IGlzIHN1cHBvc2VkIHRvIGJlIGEgZ2V0dGVyLgoKWXVwLiBUaGF0
J3Mgd2hhdCBpdCBpcyAtLSBpbnRlbF9pb21tdV9sb29rdXBfcGFnZSgpIHNlZW1zIHRvIGJlIHRo
ZSBjdWxwcml0LgoKSSd2ZSBkaWQgdGhlIGV4cGVyaW1lbnQgaW4gdGhlIG90aGVyIGRpcmVjdGlv
biAtLSBhZGRpbmcgYSBkdW1teSBjYWxsOgogICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9ydnMvZXZl
L2Jsb2IvMzZhZWVhYTdjMGE1MzQ3NGZiMWVjZWYyZmY1ODdhODY2MzdkZjg1OC9wa2cveGVuLzAx
LWlvbW11LW1hcHBpbmdzLnBhdGNoI0wyMwpvbiB0b3Agb2Ygb3JpZ2luYWwgUm9nZXIncyBwYXRj
aCBtYWtlcyBzeXN0ZW0gYm9vdCBOT1JNQUxMWS4KClRoYW5rcywKUm9tYW4uCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
