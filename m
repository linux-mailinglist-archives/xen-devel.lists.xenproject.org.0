Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF4D126851
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 18:41:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihzlQ-0006JK-Td; Thu, 19 Dec 2019 17:39:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yrdy=2J=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ihzlP-0006J8-If
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 17:39:03 +0000
X-Inumbo-ID: 6d4f0edc-2286-11ea-a914-bc764e2007e4
Received: from mail-ed1-f68.google.com (unknown [209.85.208.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d4f0edc-2286-11ea-a914-bc764e2007e4;
 Thu, 19 Dec 2019 17:38:54 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id c26so5691316eds.8
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2019 09:38:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k21bUrBpm0IV+9MTnWZ5hape6Lzo7Qmmjw2/tsctgLk=;
 b=pZ4beZ+UJek6ZvEF7MswJVkxT63USV0nTFqg8blFySDbMF1ZFlsX6i1Hskx30DVUi1
 5n56IWmhoaxPSWcKDdnwSSljvmp7Q2yIt7cCenGxYikJe7GqBC+pphNTVnGQ15FtSvhW
 e06Cr0NR/bvzaAISNewsxeS/dma86nfopmqfgNypATKZHCpHuzVBEWmv7Cidq932Oka4
 3qJwnghlnyU1r46NMcbIdOqcRgN7OpJ3ZzkYltBM0uez9uLFUfomYMFWDly08oLntjIg
 NFFtgN1UX/08wDrce/Wufgc5ggD7myWqVNfHXBMHkU5ocZ0s/aQ/8TiW/VADJSAYkhBM
 KNVQ==
X-Gm-Message-State: APjAAAW2YEjFx8WEPvRq0zVGVTy+0h6WReevXpRMZJlif3btnR/3Nhla
 i5Q/Yd8F33UA5jLivOhI/7I=
X-Google-Smtp-Source: APXvYqz5sK09T2MousQPrpASHXOiYtn+y2MLlaIE9gKE1pUN0bkjGZhYW4YDNnDLD73eIM3A1NdgDg==
X-Received: by 2002:a05:6402:1777:: with SMTP id
 da23mr10630247edb.292.1576777133736; 
 Thu, 19 Dec 2019 09:38:53 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-238.amazon.com.
 [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id o88sm474888eda.41.2019.12.19.09.38.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Dec 2019 09:38:53 -0800 (PST)
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <22a6cb7bd5593ed38cf6f66c26c4734a04718e1a.1576697796.git.tamas.lengyel@intel.com>
 <c6d975b9-638f-355d-79f8-1c1fae4c6007@xen.org>
 <CABfawhnVbzv4UEQFQoRwYurKOWB4Vw=OtsxXUDtFX1HRxr-sWA@mail.gmail.com>
 <5339f10e-6d93-35ac-5777-acf13ba9835f@xen.org>
 <CABfawhmzjE6c0msjpPEBTciTnCTVQGd46ovSuB_7qqXdY6BvsQ@mail.gmail.com>
 <18414678-5d0a-a2b4-f6ba-61464a0127c0@xen.org>
 <CABfawhnReiUnM9_BG9bBJ4994MdS2zd46NyTztGtJsqQXsR3-w@mail.gmail.com>
 <87d7a24b-ce3a-6dda-bd27-fe98d50f2960@xen.org>
 <CABfawhkuKkos3x4C6UxKVd2A=2f6ESs+kNZtAfcEqtgnogCXYw@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ed2aa649-0c68-5b10-dbe7-6b91c8bb00ca@xen.org>
Date: Thu, 19 Dec 2019 17:38:52 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <CABfawhkuKkos3x4C6UxKVd2A=2f6ESs+kNZtAfcEqtgnogCXYw@mail.gmail.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2 19/20] x86/mem_sharing: reset a fork
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxOS8xMi8yMDE5IDE3OjIzLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gT24gVGh1LCBE
ZWMgMTksIDIwMTkgYXQgOTo1OCBBTSBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90
ZToKPj4KPj4gSGksCj4+Cj4+IE9uIDE5LzEyLzIwMTkgMTY6MTEsIFRhbWFzIEsgTGVuZ3llbCB3
cm90ZToKPj4+Pj4gV2VsbCwgdGhpcyBpcyBvbmx5IGFuIGV4cGVyaW1lbnRhbCBzeXN0ZW0gdGhh
dCdzIGNvbXBsZXRlbHkgZGlzYWJsZWQKPj4+Pj4gYnkgZGVmYXVsdC4gTWFraW5nIHRoZSBhc3N1
bXB0aW9uIHRoYXQgcGVvcGxlIHdobyBtYWtlIHVzZSBvZiBpdCB3aWxsCj4+Pj4+IGtub3cgd2hh
dCB0aGV5IGFyZSBkb2luZyBJIHRoaW5rIGlzIGZhaXIuCj4+Pj4KPj4+PiBJIGFzc3VtZSB0aGF0
IGlmIHlvdSBzdWJtaXQgdG8gdXBzdHJlYW0gdGhpcyBuZXcgaHlwZXJjYWxsIHRoZW4gdGhlcmUg
aXMKPj4+PiBsb25nZXIgcGxhbiB0byBoYXZlIG1vcmUgcGVvcGxlIHRvIHVzZSBpdCBhbmQgcG90
ZW50aWFsbHkgbWFraW5nCj4+Pj4gInN0YWJsZSIuIElmIG5vdCwgdGhlbiBpdCByYWlzZXMgdGhl
IHF1ZXN0aW9uIHdoeSB0aGlzIGlzIHB1c2hlZCB1cHN0cmVhbS4uLgo+Pj4KPj4+IEl0J3MgYmVp
bmcgcHVzaGVkIHVwc3RyZWFtIHNvIG90aGVyIHBlb3BsZSBjYW4gbWFrZSB1c2Ugb2YgaXQsIGV2
ZW4gaWYKPj4+IGl0J3Mgbm90ICJwcm9kdWN0aW9uIHF1YWxpdHkiLiBCZXlvbmQgd2hhdCBpcyBi
ZWluZyBzZW50IGhlcmUgdGhlcmUKPj4+IGFyZSBubyBsb25nZXIgdGVybSBwbGFucyBmcm9tIElu
dGVsIChhdCB0aGlzIHBvaW50KSB0byBzdXBwb3J0IHRoaXMgaW4KPj4+IGFueSB3YXkuCj4+Cj4+
IFNvIGlmIHRoaXMgaXMgbWVyZ2VkLCB3aG8gaXMgZ29pbmcgdG8gbWFpbnRhaW4gaXQ/Cj4gCj4g
SXQgZmFsbHMgdW5kZXIgbWVtX3NoYXJpbmcgZm9yIHdoaWNoIEknbSBsaXN0ZWQgYXMgIk9kZCBG
aXhlcyIKPiBtYWludGFpbmVyLCB3aGljaCBJIGRvIGluIG15IHBlcnNvbmFsIGZyZWUgdGltZS4g
VGhlIHN0YXR1cyB0aGVyZQo+IGlzbid0IGNoYW5naW5nIHdpdGggdGhpcyBuZXcgZmVhdHVyZS4K
PiAKPj4KPj4+IFRoZSBhbHRlcm5hdGl2ZSB3b3VsZCBiZSB0aGF0IHdlIGp1c3QgcmVsZWFzZSBh
IGZvcmsgKG9yIGp1c3QKPj4+IHRoZSBwYXRjaGVzKSBhbmQgd2FsayBhd2F5Lgo+Pj4gICBJZiB0
aGUgWGVuIGNvbW11bml0eSB3YW50cyB0byBtYWtlIHRoZQo+Pj4gYW5ub3VuY2VtZW50IHRoYXQg
b25seSBjb2RlIHRoYXQgd2lsbCBoYXZlIGxvbmcgdGVybSBzdXBwb3J0IGFuZCBpcwo+Pj4gInN0
YWJsZSIgaXMgYWNjZXB0ZWQgdXBzdHJlYW0gdGhhdCdzIElNSE8gZHJhc3RpY2FsbHkgZ29pbmcg
dG8gcmVkdWNlCj4+PiBwZW9wbGUncyBpbnRlcmVzdCB0byBzaGFyZSBhbnl0aGluZy4KPj4KPj4g
U2hhcmluZyBpcyBvbmUgdGhpbmcsIGJ1dCBpZiB0aGlzIGNvZGUgaXMgbm90IGF0IGxlYXN0IGEg
bWluaW11bQo+PiBtYWludGFpbmVkIHRoZW4gaXQgaXMgbGlrZWx5IHRoZSBjb2RlIHdpbGwgbm90
IGJlIGZ1bmN0aW9uYWwgaW4gYSB5ZWFyIHRpbWUuCj4gCj4gU3VycHJpc2luZ2x5IG1lbV9zaGFy
aW5nIGhhZCBvbmx5IG1pbm9yIGJpdHJvdHMgaW4gdGhlIGxhc3QgfjUgeWVhcnMKPiBpbiB3aGlj
aCB0aW1lIGl0IGhhcyBiZWVuIHByZXR0eSBtdWNoIGFiYW5kb25lZC4KVGhpcyBmYWxscyB1bmRl
ciBhICJtaW5pbXVtIG1haW50YWluZWQiLiBUaGlzIHdhc24ndCBjbGVhciBmcm9tIHlvdXIgCnBy
ZXZpb3VzIHN0YXRlbWVudCBzdGF0aW5nIHRoZXJlIHdpbGwgYmUgbm8gc3VwcG9ydC4KClsuLi5d
Cgo+IAo+Pj4+PiBCdXQgaWYgb3RoZXJzIGZlZWwgdGhhdCBzdHJvbmdseSBhcyB3ZWxsIGFib3V0
Cj4+Pj4+IGhhdmluZyB0byBoYXZlIGNvbnRpbnVhdGlvbiBmb3IgdGhpcyBJIGRvbid0IHJlYWxs
eSBtaW5kIGFkZGluZyBpdC4KPj4+Pgo+Pj4+IEkgZG9uJ3QgdGhpbmsgdGhlIGNvbnRpbnVhdGlv
biB3b3JrIGlzIGdvaW5nIHRvIGJlIGRpZmZpY3VsdCwgYnV0IGlmIHlvdQo+Pj4+IHdhbnQgdG8g
ZGVsYXkgaXQsIHRoZW4gdGhlIG1pbmltdW0gaXMgdG8gZG9jdW1lbnQgc3VjaCBhc3N1bXB0aW9u
cyBmb3IKPj4+PiB5b3VyIHVzZXJzLgo+Pj4KPj4+IEkganVzdCBkb24ndCBzZWUgYSB1c2UgZm9y
IGl0IGJlY2F1c2UgaXQgd2lsbCBuZXZlciBhY3R1YWxseSBleGVjdXRlLgo+Pgo+PiBUaGF0J3Mg
YSB2ZXJ5IG5hcnJvdyB2aWV3IG9mIGhvdyB5b3VyIGh5cGVyY2FsbCBjYW4gYmUgdXNlZC4gSSBr
bm93IHRoYXQKPj4geW91IHNhaWQgdGhhdCBzaG91bGQgb25seSBiZSBjYWxsZWQgZWFybHksIGJ1
dCBpbWFnaW5lIGZvciBhIG1vbWVudCB0aGUKPj4gdXNlciBkZWNpZGUgdG8gY2FsbCBpdCBtdWNo
IGxhdGVyIGluIHRoZSBmb3JrIHByb2Nlc3MuCj4+Cj4+PiBTbyB0byBtZSBpdCBqdXN0IGxvb2tz
IGxpa2UgdW5uZWNlc3NhcnkgZGVhZCBnbHVlLgo+Pgo+PiBUcnkgdG8gY2FsbCB0aGUgaHlwZXJj
YWxsIGFmdGVyIGVub3VnaCBkZWR1cGxpY2F0aW9uIGhhcHBlbiAobWF5YmUKPj4gMjBtaW4pLiBB
bHRlcm5hdGl2ZWx5LCBnaXZlIG1lIGFjY2VzcyB0byB5b3VyIG1hY2hpbmUgd2l0aCB0aGUgY29k
ZSBhbmQKPj4gSSBjYW4gc2hvdyBob3cgaXQgY2FuIGJlIG1pc3VzZWQgOykuCj4gCj4gSXQgd2ls
bCBoYW5nIGZvciBhIGJpdCBmb3Igc3VyZSBhbmQgTGludXggaW4gZG9tMCB3aWxsIGNvbXBsYWlu
IHRoYXQgYQo+IENQVSBpcyBzdHVjay4gQnV0IGl0IHdpbGwgZXZlbnR1YWxseSBmaW5pc2guIEl0
J3Mgbm90IGxpa2UgaXQncyBkb2luZwo+IGFsbCB0aGF0IG11Y2guIEFuZCBhbnl3YXksIGlmIHlv
dSBub3RpY2UgdGhhdCBoYXBwZW5pbmcgd2hlbiB5b3UgY2FsbAo+IGl0IGl0IHdpbGwgYmUgYW4g
b2J2aW91cyBjbHVlIHRoYXQgeW91IHNob3VsZG4ndCBiZSB1c2luZyBpdCB1bmRlciB0aGUKPiBz
aXR1YXRpb24geW91IGFyZSB1c2luZyBpdCB1bmRlci4gSGF2aW5nIGNvbnRpbnVhdGlvbiB3b3Vs
ZCBoaWRlIHRoYXQuCgpJIGFtIG5vdCBnb2luZyB0byBhcmd1ZSBtb3JlIGFzIHRoaXMgaXMgYW4g
ZXhwZXJpbWVudGFsIGZlYXR1cmUuIEJ1dCAKdGhpcyB3aWxsIGJlIGEgc2hvd3N0b3BwZXIgaWYg
d2UgZXZlciBjb25zaWRlciBtZW1fc2hhcmluZyB0byBiZSAKc3VwcG9ydGVkIChvciBldmVuIHNl
Y3VyaXR5IHN1cHBvcnRlZCkuCgpNZWFud2hpbGUgcGxlYXNlIGRvY3VtZW50IHRoZSBhc3N1bXB0
aW9uLgoKPiAKPj4KPj4+IEJ1dCBkb2N1bWVudGluZyB0aGUKPj4+IGFzc3VtcHRpb24gdW5kZXIg
d2hpY2ggdGhpcyBoeXBlcmNhbGwgc2hvdWxkIGV4ZWN1dGUgaXMgcGVyZmVjdGx5Cj4+PiBmYWly
Lgo+Pgo+PiBZb3UgbWlnaHQgd2FudCB0byB0aGluayBob3cgdGhlIGludGVyZmFjZSB3b3VsZCBs
b29rIGxpa2Ugd2l0aCB0aGUKPj4gcHJlZW1wdGlvbi4gU28gdGhlIGRheSB5b3UgZGVjaWRlIHRv
IGludHJvZHVjZSBwcmVlbXB0aW9uIHlvdSBkb24ndCBoYXZlCj4+IHRvIGNyZWF0ZSBhIG5ldyBo
eXBlcmNhbGwuCj4gCj4gV2h5IHdvdWxkIHlvdSBuZWVkIHRvIGludHJvZHVjZSBhIG5ldyBoeXBl
cmNhbGwgaWYgcHJlZW1wdGlvbiBiZWNvbWVzCj4gbmVjZXNzYXJ5PyBUaGlzIGlzIG5vdCBhIHN0
YWJsZSBpbnRlcmZhY2VzLiBJdCBjYW4gYmUgcmVtb3ZlZC9jaGFuZ2VkCj4gY29tcGxldGVseSBm
cm9tIG9uZSBYZW4gcmVsZWFzZSB0byB0aGUgbmV4dC4KClNvcnJ5LCBJIGRpZG4ndCByZWFsaXpl
IHRoZSBtZW1fc2hhcmluZyBjb2RlIHdhcyBub3QgYSBzdGFibGUgaW50ZXJmYWNlcy4KCkNoZWVy
cywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
