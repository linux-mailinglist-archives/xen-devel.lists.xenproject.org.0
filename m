Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E053A18CBD1
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 11:39:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFF1K-0004GI-T0; Fri, 20 Mar 2020 10:36:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AByC=5F=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jFF1J-0004GD-D4
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 10:36:53 +0000
X-Inumbo-ID: b60f3b12-6a96-11ea-bd20-12813bfff9fa
Received: from mail-ed1-f67.google.com (unknown [209.85.208.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b60f3b12-6a96-11ea-bd20-12813bfff9fa;
 Fri, 20 Mar 2020 10:36:52 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id v6so6533045edw.8
 for <xen-devel@lists.xenproject.org>; Fri, 20 Mar 2020 03:36:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9V+sew15Q1+OocjMaRUOU2zqA/2VVEI0f+Ee3cUyO1c=;
 b=GqEdcbnYvlRiKemS/vGTjCOD1RJx1JKVQ9cQeuqB3JfBaMDF+RmM9KwzSvk9VC/wpJ
 BI/RxebW8jvercgLwlzEJnr5S7pw5STYeVH4NDA7VHVMzUHJcM2LEWMupd7n4qVWHJw5
 e0unxvze8gorIV6E5WTUhe6dg76WFdE4SzxIBcU4Gn+Tb7zDmACbiX8h5GOA5+ZbaOjT
 RuQmjDp7PY3+QMWAFKl/mW17+XtxAN/cdEeU63oTR8FXd1jktVV5yVllc3pRDbdCxIF2
 qbUDULwxwxyQpHMj8mMXPP9DhDf6i/YLpo9WDAeUxnnTt+uRjVWWAEFeGxmVj+0ec77c
 KmRA==
X-Gm-Message-State: ANhLgQ1qRT4Gq2ApB3kyuDHGasUgo26YkEL3FLZwyc6GJztSfZ4mwWrk
 wGig+6BZeKK9uBjHiJq7zyA912WWlZocoA==
X-Google-Smtp-Source: ADFU+vs0a+6H3jSwyqEuJevGgV4Tso0Oov1Tpl+tm46BPXxivoqdQwpahab6s7GUI3bEPMGmzazZ1Q==
X-Received: by 2002:a17:906:1f47:: with SMTP id
 d7mr7757251ejk.37.1584700611314; 
 Fri, 20 Mar 2020 03:36:51 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id s19sm332107ejx.2.2020.03.20.03.36.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Mar 2020 03:36:50 -0700 (PDT)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200319173825.GQ24458@Air-de-Roger.citrite.net>
 <3d242660-7c28-5465-5da8-d126d2d347b4@xen.org>
 <20200319184305.GR24458@Air-de-Roger.citrite.net>
 <910d5530-893d-9401-46f6-4da22a400ce4@xen.org>
 <1fc54578-2b48-a713-f216-0c6fda205c9a@suse.com>
 <20200320090155.GS24458@Air-de-Roger.citrite.net>
 <75d1fe33-2ccd-234d-8bcf-5a167cf4145f@xen.org>
 <20200320094214.GT24458@Air-de-Roger.citrite.net>
 <20200320100033.GU24458@Air-de-Roger.citrite.net>
 <98a586a1-24e4-2839-270c-49dde5ed0cbf@xen.org>
 <20200320102422.GV24458@Air-de-Roger.citrite.net>
From: Julien Grall <julien@xen.org>
Message-ID: <93c0f6c4-ac3b-0748-0f44-23c8d683f0c3@xen.org>
Date: Fri, 20 Mar 2020 10:36:49 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200320102422.GV24458@Air-de-Roger.citrite.net>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v7 1/3] x86/tlb: introduce a flush HVM ASIDs
 flag
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyMC8wMy8yMDIwIDEwOjI0LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IE9uIEZy
aSwgTWFyIDIwLCAyMDIwIGF0IDEwOjA4OjMzQU0gKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90ZToK
Pj4gSGksCj4+Cj4+IE9uIDIwLzAzLzIwMjAgMTA6MDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6
Cj4+PiBPbiBGcmksIE1hciAyMCwgMjAyMCBhdCAxMDo0MjoxNEFNICswMTAwLCBSb2dlciBQYXUg
TW9ubsOpIHdyb3RlOgo+Pj4+IE9uIEZyaSwgTWFyIDIwLCAyMDIwIGF0IDA5OjEyOjE2QU0gKzAw
MDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+Pj4gSGkgUm9nZXIsCj4+Pj4+Cj4+Pj4+IE9uIDIw
LzAzLzIwMjAgMDk6MDEsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+Pj4+PiBPbiBGcmksIE1h
ciAyMCwgMjAyMCBhdCAwODoyMToxOUFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+
PiBPbiAxOS4wMy4yMDIwIDIwOjA3LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4+Pj4+IEhpLAo+
Pj4+Pj4+Pgo+Pj4+Pj4+PiBPbiAxOS8wMy8yMDIwIDE4OjQzLCBSb2dlciBQYXUgTW9ubsOpIHdy
b3RlOgo+Pj4+Pj4+Pj4gT24gVGh1LCBNYXIgMTksIDIwMjAgYXQgMDY6MDc6NDRQTSArMDAwMCwg
SnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBPbiAx
OS8wMy8yMDIwIDE3OjM4LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+Pj4+Pj4+Pj4+PiBPbiBU
aHUsIE1hciAxOSwgMjAyMCBhdCAwNDoyMToyM1BNICswMDAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6
Cj4+Pj4+Pj4+Pj4+ICAgIMKgID4+IFdoeSBjYW4ndCB5b3Uga2VlcCBmbHVzaF90bGJfbWFzaygp
IGhlcmU/Cj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IEJlY2F1c2UgZmlsdGVyZWRfZmx1c2hfdGxi
X21hc2sgaXMgdXNlZCBpbiBwb3B1bGF0ZV9waHlzbWFwLCBhbmQKPj4+Pj4+Pj4+Pj4gY2hhbmdl
cyB0byB0aGUgcGh5bWFwIHJlcXVpcmUgYW4gQVNJRCBmbHVzaCBvbiBBTUQgaGFyZHdhcmUuCj4+
Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBJIGFtIGFmcmFpZCB0aGlzIGRvZXMgbm90IHlldCBleHBsYWlu
IG1lIHdoeSBmbHVzaF90bGJfbWFzaygpIGNvdWxkIG5vdCBiZQo+Pj4+Pj4+Pj4+IHVwZGF0ZWQg
c28gaXQgZmx1c2ggdGhlIEFTSUQgb24gQU1EIGhhcmR3YXJlLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+
IEN1cnJlbnQgYmVoYXZpb3IgcHJldmlvdXMgdG8gdGhpcyBwYXRjaCBpcyB0byBmbHVzaCB0aGUg
QVNJRHMgb24KPj4+Pj4+Pj4+IGV2ZXJ5IFRMQiBmbHVzaC4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBm
bHVzaF90bGJfbWFzayBpcyB0b28gd2lkZWx5IHVzZWQgb24geDg2IGluIHBsYWNlcyB3aGVyZSB0
aGVyZSdzIG5vCj4+Pj4+Pj4+PiBuZWVkIHRvIGZsdXNoIHRoZSBBU0lEcy4gVGhpcyBwcmV2ZW50
cyB1c2luZyBhc3Npc3RlZCBmbHVzaGVzIChieSBMMCkKPj4+Pj4+Pj4+IHdoZW4gcnVubmluZyBu
ZXN0ZWQsIHNpbmNlIHRob3NlIGFzc2lzdGVkIGZsdXNoZXMgcGVyZm9ybWVkIGJ5IEwwCj4+Pj4+
Pj4+PiBkb24ndCBmbHVzaCB0aGUgTDIgZ3Vlc3RzIFRMQnMuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4g
SSBjb3VsZCBrZWVwIGN1cnJlbnQgYmVoYXZpb3IgYW5kIGxlYXZlIGZsdXNoX3RsYl9tYXNrIGFs
c28gZmx1c2hpbmcgdGhlCj4+Pj4+Pj4+PiBBU0lEcywgYnV0IHRoYXQgc2VlbXMgd3JvbmcgYXMg
dGhlIGZ1bmN0aW9uIGRvZXNuJ3QgaGF2ZSBhbnl0aGluZyBpbgo+Pj4+Pj4+Pj4gaXQncyBuYW1l
IHRoYXQgc3VnZ2VzdHMgaXQgYWxzbyBmbHVzaGVzIHRoZSBpbi1ndWVzdCBUTEJzIGZvciBIVk0u
Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEkgYWdyZWUgdGhlIG5hbWUgaXMgY29uZnVzaW5nLCBJIGhhZCB0
byBsb29rIGF0IHRoZSBpbXBsZW1lbnRhdGlvbiB0byB1bmRlcnN0YW5kIHdoYXQgaXQgZG9lcy4K
Pj4+Pj4+Pj4KPj4+Pj4+Pj4gSG93IGFib3V0IHJlbmFtaW5nIChvciBpbnRyb2R1Y2luZykgdGhl
IGZ1bmN0aW9uIHRvIGZsdXNoX3RsYl9hbGxfZ3Vlc3RzX21hc2soKSBvciBmbHVzaF90bGJfYWxs
X2d1ZXN0c19jcHVtYXNrKCkpID8KPj4+Pj4+Pgo+Pj4+Pj4+IEFuZCB0aGlzIHdvdWxkIHRoZW4g
Zmx1c2ggX29ubHlfIGd1ZXN0IFRMQnM/Cj4+Pj4+Pgo+Pj4+Pj4gTm8sIEkgdGhpbmsgZnJvbSBK
dWxpZW4ncyBwcm9wb3NhbCAoaWYgSSB1bmRlcnN0b29kIGl0IGNvcnJlY3RseSkKPj4+Pj4+IGZs
dXNoX3RsYl9hbGxfZ3Vlc3RzX21hc2sgd291bGQgZG8gd2hhdCBmbHVzaF90bGJfbWFzayBjdXJy
ZW50bHkgZG9lcwo+Pj4+Pj4gcHJldmlvdXMgdG8gdGhpcyBwYXRjaCAoZmx1c2ggWGVuJ3MgVExC
cyArIEhWTSBBU0lEcykuCj4+Pj4+Cj4+Pj4+IEl0IGxvb2tzIGxpa2UgdGhlcmUgbWlnaHQgYmUg
Y29uZnVzaW9uIG9uIHdoYXQgImd1ZXN0IFRMQnMiIG1lYW5zLiBJbiBteQo+Pj4+PiB2aWV3IHRo
aXMgbWVhbnMgYW55IFRMQnMgYXNzb2NpYXRlZCBkaXJlY3RseSBvciBpbmRpcmVjdGx5IHdpdGgg
dGhlIGd1ZXN0Lgo+Pj4+PiBPbiBBcm0sIHRoaXMgd291bGQgYmUgbnVrZToKPj4+Pj4gICAgICAt
IGd1ZXN0IHZpcnR1YWwgYWRkcmVzcyAtPiBndWVzdCBwaHlzaWNhbCBhZGRyZXNzIFRMQiBlbnRy
eQo+Pj4+PiAgICAgIC0gZ3Vlc3QgcGh5c2ljYWwgYWRkcmVzcyAtPiBob3N0IHBoeXNpY2FsIGFk
ZHJlc3MgVExCIGVudHJ5Cj4+Pj4+ICAgICAgLSBndWVzdCB2aXJ0dWFsIGFkZHJlc3MgLT4gaG9z
dCBwaHlzaWNhbCBhZGRyZXNzIFRMQiBlbnRyeQo+Pj4+Cj4+Pj4gQUZBSUNUIEFTSUQgZmx1c2gg
b24gQU1EIGhhcmR3YXJlIHdpbGwgZmx1c2ggYW55IG9mIHRoZSBhYm92ZSwgd2hpbGUKPj4+PiBW
UElEIGZsdXNoIG9uIEludGVsIHdpbGwgb25seSBmbHVzaCB0aGUgZmlyc3QgaXRlbSAoZ3Vlc3Qg
bGluZWFyIHRvCj4+Pgo+Pj4gU29ycnksIGRvaW5nIHRvbyBtYW55IHRoaW5ncyBhdCB0aGUgc2Ft
ZSB0aW1lLiBPbiBJbnRlbCBWUElEIGZsdXNoZXMKPj4+IHdpbGwgZ2V0IHJpZCBvZiBndWVzdCB2
aXJ0dWFsIHRvIGd1ZXN0IHBoeXNpY2FsIG9yIGhvc3QgcGh5c2ljYWwsIGJ1dAo+Pj4gbm90IG9m
IGd1ZXN0IHBoeXNpY2FsIHRvIGhvc3QgcGh5c2ljYWwsIHlvdSBuZWVkIGFuIEVQVCBmbHVzaCB0
bwo+Pj4gYWNjb21wbGlzaCB0aGF0Lgo+PiBBcmUgeW91IHN1Z2dlc3RpbmcgdGhhdCBvbiB4ODYs
IGZsdXNoX3RsYl9tYXNrKCkgd291bGQgbm90IG51a2UgdGhlIGd1ZXN0Cj4+IHBoeXNpY2FsIHRv
IGhvc3QgcGh5c2ljYWwgZW50cmllcz8gSWYgc28sIGhvdyBpcyBpdCBtZWFudCB0byBiZSBzYWZl
Pwo+IAo+IFlvdSBpc3N1ZSBFUFQgZmx1c2hlcyBpbiB0aGF0IGNhc2Ugd2hlbiBhbiBFUFQgbW9k
aWZpY2F0aW9uIGlzCj4gcGVyZm9ybWVkLgoKSSBhbSBnZXR0aW5nIG1vcmUgYW5kIG1vcmUgY29u
ZnVzZWQgd2l0aCB0aGUgZ29hbCBvZiBmbHVzaF90bGJfbWFzaygpIGluIApjb21tb24gY29kZS4K
Ckxvb2tpbmcgYXQgdGhlIEFybSBjb2RlLCB0aGUgUDJNIGNvZGUgc2hvdWxkIGFscmVhZHkgZmx1
c2ggYXBwcm9wcmlhdGx5IAp0aGUgZ3Vlc3QgVExCcyBiZWZvcmUgZ2l2aW5nIGJhY2sgYSBwYWdl
IHRvIHRoZSBhbGxvY2F0b3IuCgpTbyB3aGF0IGFyZSB3ZSB0cnlpbmcgdG8gcHJvdGVjdCBhZ2Fp
bnN0IHdpdGggdGhlIGNhbGwgb2YgZmx1c2hfdGxiX21hc2soKT8KCkNoZWVycywKCi0tIApKdWxp
ZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
