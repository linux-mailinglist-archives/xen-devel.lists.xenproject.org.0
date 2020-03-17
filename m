Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC5E188730
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 15:17:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jECzy-00044S-R0; Tue, 17 Mar 2020 14:15:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lIpW=5C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jECzx-00044N-Bs
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 14:15:13 +0000
X-Inumbo-ID: b68ba61e-6859-11ea-b94c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b68ba61e-6859-11ea-b94c-12813bfff9fa;
 Tue, 17 Mar 2020 14:15:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BF122B06A;
 Tue, 17 Mar 2020 14:15:09 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Jason Andryuk <jandryuk@gmail.com>
References: <4019c78f-6546-4edc-b5c3-1ea471e129ff@www.fastmail.com>
 <f886576a-a6cc-699a-5acf-1c2399c47133@citrix.com>
 <17bc1026-ebdf-4077-85b2-8b8615b59101@www.fastmail.com>
 <CAKf6xpszDF5ZfvkKGrZ6fOaBEKX3wrDyo8sp-oyhPdUr-H66NQ@mail.gmail.com>
 <f467fbc1-be3b-6e4c-681b-71001beb35f5@citrix.com>
 <CAKf6xptqF2vJLx6MyGbmu5QEhu3qpxKk9oHxBQmx7Caam45aKw@mail.gmail.com>
 <bdba95c2-8325-af8e-83a4-e06364b045df@citrix.com>
 <CAKf6xpt26=s_+cD63VJ1Cp3WZvtq3p673uUiqiuDHAVH=ZJOcQ@mail.gmail.com>
 <ea7cba55-f267-09c5-044e-e8947a6d2900@citrix.com>
 <4354846c-2210-db80-d14e-6f00c5ed2a3f@suse.com>
 <CAKf6xpsh3y_JpD15JLv52mgZOAVSu_Rp3EZOgGOmuS8_P5OsVQ@mail.gmail.com>
 <CAKf6xpu+YC9zcwZr7rWSz37RE20GQ0dpsMBSqQh6+oPDuYQXuQ@mail.gmail.com>
 <ea7f9b4c-10e4-67d1-6e55-6c317166e265@suse.com>
Message-ID: <cfbb5553-b9dc-ee86-145f-3cab92289c4d@suse.com>
Date: Tue, 17 Mar 2020 15:15:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <ea7f9b4c-10e4-67d1-6e55-6c317166e265@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [BUG] panic: "IO-APIC + timer doesn't work" -
 several people have reproduced
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Aaron Janse <aaron@ajanse.me>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDMuMjAyMCAxNTowOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTcuMDMuMjAyMCAx
NDo0OCwgSmFzb24gQW5kcnl1ayB3cm90ZToKPj4gSSBnb3QgaXQgdG8gYm9vdCBwYXN0ICJJTy1B
UElDICsgdGltZXIgZG9lc24ndCB3b3JrIi4gIEkgcHJvZ3JhbW1lZAo+PiB0aGUgSFBFVCB0byBw
cm92aWRlIGEgcGVyaW9kaWMgdGltZXIgaW4gaHBldF9yZXN1bWUoKSBvbiBUMC4gIFdoZW4gSQo+
PiBhY3R1YWxseSBnb3QgaXQgcHJvZ3JhbW1lZCBwcm9wZXJseSwgaXQgd29ya2VkIHRvIGluY3Jl
bWVudAo+PiBwaXQwX3RpY2tzLiAgSSBhbHNvIG1hZGUgdGltZXJfaW50ZXJydXB0KCkgdW5jb25k
aXRpb25hbGx5Cj4+IHBpdDBfdGlja3MrKyB0aG91Z2ggdGhhdCBtYXkgbm90IG1hdHRlci4KPiAK
PiBIbW0sIGF0IHRoZSBmaXJzdCBnbGFuY2UgSSB3b3VsZCBpbXBseSB0aGUgc3lzdGVtIGdldHMg
aGFuZGVkIHRvIFhlbgo+IHdpdGggYSBIUEVUIHN0YXRlIHRoYXQgd2UgZG9uJ3QgKGFuZCBwcm9i
YWJseSBhbHNvIHNob3VsZG4ndCkgZXhwZWN0Lgo+IENvdWxkIHlvdSBwcm92aWRlIEhQRVRfQ0ZH
IGFzIHdlbGwgYXMgYWxsIEhQRVRfVG5fQ0ZHIGFuZAo+IEhQRVRfVG5fUk9VVEUgdmFsdWVzIGFz
IGhwZXRfcmVzdW1lKCkgZmluZHMgdGhlbSBiZWZvcmUgZG9pbmcgYW55Cj4gYWRqdXN0bWVudHMg
dG8gdGhlbT8gV2hhdCBhcmUgdGhlIGNvbXBvbmVudHMgLyBwYXJ0aWVzIGludm9sdmVkIGluCj4g
Z2V0dGluZyBYZW4gbG9hZGVkIGFuZCBzdGFydGVkPwoKT2YgY291cnNlIG11Y2ggZGVwZW5kcyBv
biB3aGF0IGV4YWN0bHkgeW91IG1lYW4geW91J3ZlIGRvbmUgdG8KdGhlIEhQRVQgYnkgc2F5aW5n
ICJJIHByb2dyYW1tZWQgdGhlIEhQRVQgdG8gcHJvdmlkZSAuLi4iLgoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
