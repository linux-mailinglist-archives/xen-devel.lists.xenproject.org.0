Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 328C1134956
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 18:28:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipF65-0003iY-HE; Wed, 08 Jan 2020 17:26:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cnPU=25=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ipF63-0003iI-Mz
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 17:26:19 +0000
X-Inumbo-ID: fa2f0dd8-323b-11ea-b861-12813bfff9fa
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fa2f0dd8-323b-11ea-b861-12813bfff9fa;
 Wed, 08 Jan 2020 17:26:17 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1578504379; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=x2nmXpc5yHvxkP9jKf6BkZqclNLGauVOMqchp2za1Pg=;
 b=uU5+R2Cxqa31SECo7bIa7mV/pof9kXfXjBFiR6m6635tEgpZgj2LS0jx/n0owXxDRQ5Bnf+e
 P22Gaxqq+ISIJp9bELLWUvpY6Z9BipyMEU+GJMsOgbeUewoRVFg1Gx5y8x9wzXc3Z6gewHih
 MaKRcOlRELxgwttb3AEcZXJRz/A=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mxa.mailgun.org with ESMTP id 5e1610b4.7f9251da3a70-smtp-out-n02;
 Wed, 08 Jan 2020 17:26:12 -0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id c9so4241297wrw.8
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2020 09:26:11 -0800 (PST)
X-Gm-Message-State: APjAAAUUn8mOU/KDWULKX66K7YgGleBU04K1QuYeDzmDWXeOYT8nFjb6
 5leZsGQiNt5LVNXOiJwtglfGmjYMIZlMqq50kEs=
X-Google-Smtp-Source: APXvYqxyQhNGP9ddDtyXy8XPCte3LzfLKtzUaIWojSa9NOAGp1YX3UTK74rLWY2IuxjxvX/mt2dHF5+WQVj2HxoVNxw=
X-Received: by 2002:adf:f586:: with SMTP id f6mr5634564wro.46.1578504370971;
 Wed, 08 Jan 2020 09:26:10 -0800 (PST)
MIME-Version: 1.0
References: <20191219094814.GB11756@Air-de-Roger>
 <CABfawhnVZmYOZb=wuc2TVDewH9nNtJBTBvJYUk-RDHLCGRVzPw@mail.gmail.com>
 <20191230175900.GF11756@Air-de-Roger>
 <CABfawhkiB=6zvTo6TBCE6y_-to65DFGDVRcqk7ANpSGdwwveFQ@mail.gmail.com>
 <3ff918fc-02a3-1413-4135-a378d65a19ab@xen.org>
 <CABfawh=Wvn16sWp8_MPy0kGAp-OhkCmug4nY272igyg+u4PKBw@mail.gmail.com>
 <CAF3u54B2+3q90jFftH+ZcuhdH6i8cOEpjiOjrVdNJCiBSzBtng@mail.gmail.com>
 <CABfawh=F8dsn4LLtdfYR4nb0djaswofEioDtqi2TKVJ0zCBK0Q@mail.gmail.com>
 <20191231104022.GG11756@Air-de-Roger>
 <CABfawh=tDFzsp61MmFxpmcBbNT2GXa4C=-eXD=044L1gdxPEpw@mail.gmail.com>
 <20191231151107.GJ11756@Air-de-Roger>
 <e05a394d-b5da-85aa-7196-c89664a0a358@citrix.com>
 <CABfawhmBVhjOcwQ3s3rs--aJD8k9Rg+yNjigLHR4y=jua=vRfw@mail.gmail.com>
 <ddeed541-17ca-792b-5c06-b36c88061938@citrix.com>
In-Reply-To: <ddeed541-17ca-792b-5c06-b36c88061938@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 8 Jan 2020 10:25:34 -0700
X-Gmail-Original-Message-ID: <CABfawh=rwpKKxuWgWkf1bSHWrQwLzc38rQa92fM3wPo=e3kfgw@mail.gmail.com>
Message-ID: <CABfawh=rwpKKxuWgWkf1bSHWrQwLzc38rQa92fM3wPo=e3kfgw@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2 00/20] VM forking
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@gmail.com>,
 Alexandru Isaila <aisaila@bitdefender.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiA+PiBJIGFjdHVhbGx5IGRpc2FncmVlIHRoYXQgd2Ugd2FudCBhIHNpbmdsZSBjb21tYW5kIHRv
IGRvIGFsbCBvZiB0aGVzZS4KPiA+PiBJZiB3ZSBkaWQgd2FudCBgZXhlYyB4bGAgdG8gYmUgb25l
IG9mIHRoZSBzdXBwb3J0ZWQgaW50ZXJmYWNlcywgSSB0aGluawo+ID4+IGl0IHdvdWxkIGJyZWFr
IGRvd24gc29tZXRoaW5nIGxpa2UgdGhpczoKPiA+Pgo+ID4+IGB4bCBmb3JrLWRvbWFpbmA6IE9u
bHkgZm9ya3MgdGhlIGRvbWFpbi4KPiA+PiBgeGwgZm9yay1sYXVuY2gtZG1gOiAob3IgYXR0YWNo
LWRtPyk6IFN0YXJ0IHVwIGFuZCBhdHRhY2ggdGhlCj4gPj4gZGV2aWNlbW9kZWwgdG8gdGhlIGRv
bWFpbgo+ID4+Cj4gPj4gVGhlbiBgeGwgZm9ya2AgKG9yIG1heWJlIGB4bCBmb3JrLXZtYCkgd291
bGQgYmUgc29tZXRoaW5nIGltcGxlbWVudGVkIGluCj4gPj4gdGhlIGZ1dHVyZSB0aGF0IHdvdWxk
IGZvcmsgdGhlIGVudGlyZSBkb21haW4uCj4gPgo+ID4gSSByZWFsbHkgZG9uJ3QgaGF2ZSBhIHN0
cm9uZyBvcGluaW9uIGFib3V0IHRoaXMgZWl0aGVyIHdheS4gSSBjYW4gc2VlCj4gPiBpdCB3b3Jr
aW5nIGVpdGhlciB3YXkuIEhhdmluZyB0aGVtIGFsbCBidW5kbGVkIHVuZGVyIGEgc2luZ2xlCj4g
PiB0b3AtbGV2ZWwgY29tbWVudCBkb2Vzbid0IHBvbGx1dGUgdGhlIGhlbHAgdGV4dCB3aGVuIHNv
bWVvbmUgaXMganVzdAo+ID4gbG9va2luZyBhdCB3aGF0IHhsIGNhbiBkbyBpbiBnZW5lcmFsLiBN
YWtlcyB0aGF0IGNvbW1hbmQgYSBsb3QgbW9yZQo+ID4gY29tcGxleCBmb3Igc3VyZSBidXQgSSBk
b24ndCB0aGluayBpdCdzIHRvbyBiYWQuCj4KPiBPbmUgdGhpbmcgSSBkb24ndCBsaWtlIGFib3V0
IGhhdmluZyBhIHNpbmdsZSBjb21tYW5kIGlzIHRoYXQgc2luY2UKPiB5b3UncmUgbm90IHBsYW5u
aW5nIG9uIGltcGxlbWVudGluZyB0aGUgZW5kLXRvLWVuZCAidm0gZm9yayIgY29tbWFuZCwKPiB0
aGVuIHdoZW4gcnVubmluZyB0aGUgYmFzZSAiZm9yay12bSIgY29tbWFuZCwgeW91J2xsIGhhdmUg
dG8gcHJpbnQgYW4KPiBlcnJvciBtZXNzYWdlIHRoYXQgc2F5cyAiVGhpcyBjb21tYW5kIGlzIG5v
dCBhdmFpbGFibGUgaW4gaXRzCj4gY29tcGxldGVuZXNzOyB5b3UnbGwgaGF2ZSB0byBpbXBsZW1l
bnQgeW91ciBvd24gdmlhIGZvcmstdm0gLS1kb21haW4sCj4gZm9yay12bSAtLXNhdmUtZG0sIGFu
ZCBmb3JrLXZtIC0tbGF1bmNoLWRtLiIKPgo+IFdoaWNoIHdlIGNvdWxkIGRvLCBidXQgc2VlbSBh
IGJpdCBzdHJhbmdlLiA6LSkKClllYSwgaXQncyBub3QgYSBzaW5nbGUgc3RlcCB0byBnZXQgdG8g
YSBmdWxseSBmdW5jdGlvbmFsIGZvcmsgYnV0IGl0cyBjbG9zZToKMS4gcGF1c2UgcGFyZW50IHZt
CjIuIGdlbmVyYXRlIHFlbXVfc2F2ZV9maWxlCjMuIHhsIGZvcmstdm0gLUMgY29uZmlnIC1RIHFl
bXVfc2F2ZV9maWxlIDxwYXJlbnRfZG9taWQ+CgpGb3IgdGhlIHNlY29uZCBmb3JrIC0gcHJvdmlk
ZWQgaXQgaGFzIGl0cyBvd24gY29uZmlnIGZpbGUgcmVhZHkgdG8gZ28KLSBpdCBpcyBlbm91Z2gg
dG8ganVzdCBydW4gdGhlIDMuIHN0ZXAuIFRlY2huaWNhbGx5IHdlIGNvdWxkIGludGVncmF0ZQph
bGwgdGhlc2UgdGhyZWUgc3RlcHMgaW50byBvbmUgYW5kIHRoZW4gdGhlIHVzZXIgd291bGQgb25s
eSBoYXZlIHRvCmdlbmVyYXRlIHRoZSBuZXcgY29uZmlnIGZpbGUuIEJ1dCBJIGZvdW5kIHRoaXMg
c2V0dXAgdG8gYmUgImdvb2QKZW5vdWdoIiBhbHJlYWR5LgoKVGFtYXMKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
