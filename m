Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D639483534
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 17:27:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hv1KC-00073P-Or; Tue, 06 Aug 2019 15:24:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jalH=WC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hv1KB-00073K-81
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 15:24:31 +0000
X-Inumbo-ID: 47c36682-b85e-11e9-a686-cfe88d3d3684
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 47c36682-b85e-11e9-a686-cfe88d3d3684;
 Tue, 06 Aug 2019 15:24:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E99B9AF5D;
 Tue,  6 Aug 2019 15:24:27 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <5a4d4a61-a543-c657-8458-cbc6b5a8a633@suse.com>
 <33824f67-d50d-f7ac-f3a6-305eb8fe3bc1@suse.com>
 <20190806142528.5vwc7yjnu52gjrdk@Air-de-Roger>
 <1a28a168-04b1-ea22-327d-f0626b89aea4@suse.com>
 <20190806151638.wgb4uee2wkft3ovv@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cd7b6563-7379-803a-72dc-946b74f24efe@suse.com>
Date: Tue, 6 Aug 2019 17:24:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806151638.wgb4uee2wkft3ovv@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 08/10] x86/PCI: read MSI-X table entry
 count early
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
Cc: AndrewCooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDguMjAxOSAxNzoxNiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gVHVlLCBB
dWcgMDYsIDIwMTkgYXQgMDQ6NDc6MjhQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9u
IDA2LjA4LjIwMTkgMTY6MjUsIFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOgo+Pj4gT24gVHVlLCBB
dWcgMDYsIDIwMTkgYXQgMDM6MTA6NDBQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4g
QEAgLTM1MCw2ICszNTMsMTAgQEAgc3RhdGljIHN0cnVjdCBwY2lfZGV2ICrCumFsbG9jX3BkZXYo
c3RydWN0Cj4+Pj4gICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4+Pj4gICAgICAgICAgICB9
Cj4+Pj4gICAgICAgICAgICBzcGluX2xvY2tfaW5pdCgmbXNpeC0+dGFibGVfbG9jayk7Cj4+Pj4g
Kwo+Pj4+ICsgICAgICAgIGN0cmwgPSBwY2lfY29uZl9yZWFkMTYocGRldi0+c2JkZiwgbXNpeF9j
b250cm9sX3JlZyhwb3MpKTsKPj4+PiArICAgICAgICBtc2l4LT5ucl9lbnRyaWVzID0gbXNpeF90
YWJsZV9zaXplKGN0cmwpOwo+Pj4KPj4+IFNpbmNlIHlvdSBzdG9yZSB0aGUgbnVtYmVyIG9mIGVu
dHJpZXMgaGVyZSwgd2h5IG5vdCBhbHNvIHN0b3JlIHRoZQo+Pj4gcG9zaXRpb24gb2YgdGhlIE1T
SS1YIGNhcGFiaWxpdHkgc2luY2UgaXQncyBhbHNvIGltbXV0YWJsZT8KPj4+Cj4+PiBUaGF0IHdv
dWxkIHByZXZlbnQgaGF2aW5nIHRvIGZldGNoIGl0IGFnYWluIGluIG1zaXhfY2FwYWJpbGl0eV9p
bml0Lgo+Pgo+PiBJIGRvIGNvbnNpZGVyIHRoaXMgYXMgc29tZXRoaW5nIHdvcnRod2hpbGUgdG8g
ZG8gaW4gdGhlIGZ1dHVyZSwgYnV0Cj4+IG5vdCBoZXJlOiBUaGUgZmllbGQgdG8gc3RvcmUgdGhp
cyBkb2Vzbid0IGV4aXN0IGluIHN0cnVjdCBhcmNoX21zaXgKPj4gKHlldCksIGFuZCBoZW5jZSB3
b3VsZCBsaWtlbHkgd2FudCBtb3ZpbmcgZnJvbSBzdHJ1Y3QgbXNpX2F0dHJpYi4KPj4gVGhpcyBp
cyBiZXlvbmQgdGhlIHNjb3BlIG9mIHRoaXMgcGF0Y2guCj4gCj4gT2ggSSBzZWUuIFNvIHRoZSBw
b3NpdGlvbiBpdCdzIGFjdHVhbGx5IHN0b3JlZCBpbiBtc2lfYXR0cmliLCBhbmQgaXMKPiB1c2Vk
IGJ5IGJvdGggTVNJIGFuZCBNU0ktWCwgaW4gd2hpY2ggY2FzZSB3aGF0IEknbSBwcm9wb3Npbmcg
d291bGQgYmUKPiB3b3JzZSwgc2luY2UgdGhlIGZpZWxkIHdvdWxkIG9ubHkgYmUgdXNlZCBieSBN
U0ktWC4KClJpZ2h0LCBpZiB3ZSB3YW50ZWQgdG8gc3RvcmUgaXQsIHdlJ2Qgd2FudCB0byBjb3Zl
ciBib3RoIE1TSSBhbmQKTVNJLVggKGFuZCBoZW5jZSBpdCB3b3VsZCBuZWVkIHRvIGJlIGEgZmll
bGQgb3V0c2lkZSBvZiBzdHJ1Y3QKYXJjaF9tc2l4KS4KCj4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKVGhhbmtzLgoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
