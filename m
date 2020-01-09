Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F626135DC7
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 17:09:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipaKn-0000g5-41; Thu, 09 Jan 2020 16:06:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fuxF=26=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ipaKl-0000fz-Rm
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 16:06:55 +0000
X-Inumbo-ID: 0df81d46-32fa-11ea-b9fe-12813bfff9fa
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0df81d46-32fa-11ea-b9fe-12813bfff9fa;
 Thu, 09 Jan 2020 16:06:54 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1578586015; h=Content-Transfer-Encoding: Content-Type: Cc: To:
 Subject: Message-ID: Date: From: In-Reply-To: References: MIME-Version:
 Sender; bh=tiPLzfOafljXQ5+VY6ck2nFdx3vzE5OpZipgCINaPzE=;
 b=nHj8lqmobmRBEZjcASdL98jbzrTHJNu85085DlkrSUHeaw7UEtuLu2aMoxMm5fLS9GFi3/fc
 8YuAi4Cpg4w6e288jnxAJaoNhvb+kUM2jzpU638+wAH5Oj+S9BSsBWVzmMiT+I+h2n7cfKDZ
 DI9XRjHE0J2ReqlpZ5tpRLNmv2s=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mxa.mailgun.org with ESMTP id 5e174f9b.7fc370414730-smtp-out-n02;
 Thu, 09 Jan 2020 16:06:51 -0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id q6so7937143wro.9
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2020 08:06:50 -0800 (PST)
X-Gm-Message-State: APjAAAUdDviE1Zz9uMVcCgwFkPEpVPOsm0T4Sl/xSoc2dzb4NF0naDUH
 WnA3lPISspaprQYEr2lRVdv5UN3KgB6wmy8/zkA=
X-Google-Smtp-Source: APXvYqyMPaRdgurQVpNpMYL/8QMVDVyAdYzSPrNnFiUgeoNIQ4VPV+oJ/s9onDiYR8+BIrV2NA034FbaDnSmue5efxk=
X-Received: by 2002:adf:e5cf:: with SMTP id a15mr11577739wrn.140.1578586009431; 
 Thu, 09 Jan 2020 08:06:49 -0800 (PST)
MIME-Version: 1.0
References: <cover.1578503483.git.tamas.lengyel@intel.com>
 <b816ff21d1156eeb5d68b35932ad23f4e5891bdb.1578503483.git.tamas.lengyel@intel.com>
 <5084334f-7ed6-6095-e31a-d530454357a4@xen.org>
 <CABfawhnwdYX6W_arEL_SP4eqvrOYQZUB1jqeuMA+WUXo_TaZiQ@mail.gmail.com>
 <20200109151010.GC11756@Air-de-Roger>
 <259d98b3-5d27-a856-a457-4e7c37004982@suse.com>
 <CABfawhmTi9T+TJC0=J1vRwsz859oeFXfKTmqCz4yvcmSdS0umQ@mail.gmail.com>
 <40a6ce4a-2512-acc6-1fd1-bc9d1bb131be@suse.com>
In-Reply-To: <40a6ce4a-2512-acc6-1fd1-bc9d1bb131be@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 9 Jan 2020 09:06:13 -0700
X-Gmail-Original-Message-ID: <CABfawhmok3FYK-hEHfC1UO4R9BfY6GoLrUTfY6MMR1Mc9oLZVQ@mail.gmail.com>
Message-ID: <CABfawhmok3FYK-hEHfC1UO4R9BfY6GoLrUTfY6MMR1Mc9oLZVQ@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v4 15/18] xen/mem_sharing: VM forking
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gOSwgMjAyMCBhdCA5OjAzIEFNIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4KPiBPbiAwOS4wMS4yMDIwIDE2OjU3LCBUYW1hcyBLIExlbmd5ZWwgd3Jv
dGU6Cj4gPiBPbiBUaHUsIEphbiA5LCAyMDIwIGF0IDg6MzQgQU0gSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToKPiA+Pgo+ID4+IE9uIDA5LjAxLjIwMjAgMTY6MTAsIFJvZ2Vy
IFBhdSBNb25uw6kgd3JvdGU6Cj4gPj4+IE9uIFRodSwgSmFuIDA5LCAyMDIwIGF0IDA2OjQxOjEy
QU0gLTA3MDAsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+Pj4+IE9uIFRodSwgSmFuIDksIDIw
MjAgYXQgMzoyOSBBTSBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToKPiA+Pj4+
Pgo+ID4+Pj4+IEhpIFRhbWFzLAo+ID4+Pj4+Cj4gPj4+Pj4gT24gMDgvMDEvMjAyMCAxNzoxNCwg
VGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+ID4+Pj4+PiArc3RhdGljIGludCBtZW1fc2hhcmluZ19m
b3JrKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBkb21haW4gKmNkKQo+ID4+Pj4+PiArewo+ID4+
Pj4+PiArICAgIGludCByYzsKPiA+Pj4+Pj4gKwo+ID4+Pj4+PiArICAgIGlmICggIWQtPmNvbnRy
b2xsZXJfcGF1c2VfY291bnQgJiYKPiA+Pj4+Pj4gKyAgICAgICAgIChyYyA9IGRvbWFpbl9wYXVz
ZV9ieV9zeXN0ZW1jb250cm9sbGVyKGQpKSApCj4gPj4+Pj4KPiA+Pj4+PiBBRkFJVSwgdGhlIHBh
cmVudCBkb21haW4gd2lsbCBiZSBwYXVzZWQgaWYgaXQgd2Fzbid0IHBhdXNlZCBiZWZvcmUgYW5k
Cj4gPj4+Pj4gdGhpcyB3aWxsIG5vdCBiZSB1bnBhdXNlZCBieSB0aGUgc2FtZSBoeXBlcmNhbGwu
IFJpZ2h0Pwo+ID4+Pj4KPiA+Pj4+IFllcywgaXQgbmVlZHMgdG8gcmVtYWluIHBhdXNlZCBhcyBs
b25nIGFzIHRoZXJlIGFyZSBmb3JrcyBhY3RpdmUgZnJvbQo+ID4+Pj4gaXQuIEFmdGVyd2FyZHMg
aXQgY2FuIGJlIHVucGF1c2VkLgo+ID4+Pgo+ID4+PiBJZiB5b3Ugd2FudCB0aGUgcGFyZW50IGRv
bWFpbiB0byByZW1haW4gcGF1c2VkIGZvciBhcyBsb25nIGFzIHRoZQo+ID4+PiBmb3JrcyBhcmUg
YWN0aXZlLCBzaG91bGRuJ3QgZWFjaCBmb3JrIGluY3JlbWVudCB0aGUgcGF1c2UgY291bnQgb24K
PiA+Pj4gY3JlYXRpb24gYW5kIGRlY3JlbWVudCBpdCB3aGVuIHRoZSBmb3JrIGlzIGRlc3Ryb3ll
ZD8KPiA+Pj4KPiA+Pj4gSG93IGNhbiB5b3UgYXNzdXJlIG5vIG90aGVyIG9wZXJhdGlvbiBvciBl
bnRpdHkgaGFzIGluY3JlbWVudGVkCj4gPj4+IGNvbnRyb2xsZXJfcGF1c2VfY291bnQgdGVtcG9y
YXJ5IGFuZCBpcyBsaWtlbHkgdG8gZGVjcmVtZW50IGl0IGF0IHNvbWUKPiA+Pj4gcG9pbnQgd2hp
bGUgZm9ya3MgYXJlIHN0aWxsIGFjdGl2ZT8KPiA+Pgo+ID4+IFRoZSBfYnlfc3lzdGVtY29udHJv
bGxlciB2YXJpYW50cyBsb29rIHdyb25nIHRvIGJlIHVzZWQgaGVyZSBhbnl3YXkuCj4gPj4gV2h5
IGlzIHRoaXMgbm90IHNpbXBseSBkb21haW5feyx1bn1wYXVzZSgpPwo+ID4+Cj4gPgo+ID4gTXkg
cmVhc29uaW5nIHdhcyB0aGF0IGJ5IGRlZmF1bHQgdGhlIHVzZXIgc2hvdWxkIHBhdXNlIHRoZSBw
YXJlbnQgVk0KPiA+IGJlZm9yZSBmb3JraW5nLiBUaGlzIHNhbml0eSBjaGVja3MganVzdCBtaW1p
Y2tzIHRoYXQgc3RlcCBpbiBjYXNlIHRoZQo+ID4gdXNlciBkaWRuJ3QgZG8gdGhhdCBhbHJlYWR5
LiBCdXQgSSBndWVzcyBlaXRoZXIgd291bGQgd29yaywgSSBkb24ndAo+ID4gcmVhbGx5IHNlZSBt
dWNoIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgdHdvLgo+Cj4gVGhlIG1haW4gZGlmZmVyZW5jZSBp
cyB0aGF0IHRoZSBvbmUgeW91IGN1cnJlbnRseSB1c2UgdXBkYXRlcwo+IGQtPmNvbnRyb2xsZXJf
cGF1c2VfY291bnQsIHdoaWNoIGNhbiBiZSB1cGRhdGVkIGJ5IG90aGVyIGRvbWN0bHMsIGJ1dAo+
IHdoaWNoIHNob3VsZG4ndCBiZSB1cGRhdGVkIGJlaGluZCB0aGUgYmFjayBvZiBhIGNvbXBvbmVu
dCBpbiBYZW4gd2hpY2gKPiBuZWVkcyB0aGUgZW50aXR5IHBhdXNlZC4KPgoKQWxyaWdodCwgSSds
bCBzd2l0Y2ggaXQuCgpUaGFua3MsClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
