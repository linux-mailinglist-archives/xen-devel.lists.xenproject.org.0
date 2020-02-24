Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E5916A57B
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 12:48:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6CAQ-0002Qn-Ek; Mon, 24 Feb 2020 11:44:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H8nZ=4M=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j6CAO-0002Qh-JW
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 11:44:52 +0000
X-Inumbo-ID: 111648fc-56fb-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 111648fc-56fb-11ea-ade5-bc764e2007e4;
 Mon, 24 Feb 2020 11:44:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4136AAC91;
 Mon, 24 Feb 2020 11:44:50 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200218122114.17596-1-jgross@suse.com>
 <20200218122114.17596-4-jgross@suse.com> <20200224112539.GL4679@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <b01bd510-58c2-4a05-4e0a-dbf3ab6abd57@suse.com>
Date: Mon, 24 Feb 2020 12:44:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200224112539.GL4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 3/4] xen: add
 process_pending_softirqs_norcu() for keyhandlers
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDIuMjAgMTI6MjUsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gVHVlLCBGZWIg
MTgsIDIwMjAgYXQgMDE6MjE6MTNQTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gU29t
ZSBrZXloYW5kbGVycyBhcmUgY2FsbGluZyBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMoKSB3aGls
ZSBob2xkaW5nCj4+IGEgcmN1X3JlYWRfbG9jaygpLiBUaGlzIGlzIHdyb25nLCBhcyBwcm9jZXNz
X3BlbmRpbmdfc29mdGlycXMoKSBtaWdodAo+PiBhY3RpdmF0ZSByY3UgY2FsbHMgd2hpY2ggc2hv
dWxkIG5vdCBoYXBwZW4gaW5zaWRlIGEgcmN1X3JlYWRfbG9jaygpLgo+IAo+IEl0IG1pZ2h0IGJl
IGhlbHBmdWwgdG8gdHVybiB0aGUgQVNTRVJUIGluIHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxcwo+
IGludG8gQVNTRVJUX05PVF9JTl9BVE9NSUMgYWxzbywgYXMgaXQgd291bGQgY2F0Y2ggc3VjaCBt
aXNzdXNlcwo+IEFGQUlDVC4KCk5vLCB0aGlzIHdvdWxkIGJlIHRyaWdnZXJpbmcgaW4gX19jcHVf
dXAoKSBhdCBzeXN0ZW0gYm9vdC4KCj4gCj4+Cj4+IEZvciB0aGF0IHB1cnBvc2UgYWRkIHByb2Nl
c3NfcGVuZGluZ19zb2Z0aXJxc19ub3JjdSgpIHdoaWNoIHdpbGwgbm90Cj4+IGRvIGFueSByY3Ug
YWN0aXZpdHkgYW5kIHVzZSB0aGlzIGZvciBrZXloYW5kbGVycy4KPiAKPiBJIHdvbmRlciBpZiBm
b3Iga2V5aGFuZGxlcnMgaXQgbWlnaHQgYmUgZWFzaWVyIHRvIGp1c3QgZGlzYWJsZSB0aGUKPiB3
YXRjaGRvZyBpbiBoYW5kbGVfa2V5cHJlc3MgYW5kIHJlbW92ZSB0aGUgc29mdGlycSBwcm9jZXNz
aW5nIGZyb20gdGhlCj4gaGFuZGxlcnMuCj4gCj4gQXQgdGhlIGVuZCBvZiBkYXkgd2Ugd2FudCB0
aGUga2V5aGFuZGVycyB0byBydW4gYXMgZmFzdCBhcyBwb3NzaWJsZSBpbgo+IG9yZGVyIHRvIGdl
dCB0aGUgZGF0YSBvdXQsIGFuZCB3ZSBvbmx5IGNhcmUgYWJvdXQgdGhlIHdhdGNoZG9nIG5vdAo+
IHRyaWdnZXJpbmc/IChtYXliZSBJJ20gbWlzc2luZyBzb21ldGhpbmcgaGVyZSkKCkl0IGlzIG5v
dCB0aGF0IHNpbXBsZSwgSSBiZWxpZXZlLgoKWW91J2QgbmVlZCB0byBiZSB2ZXJ5IGNhcmVmdWwg
dGhhdCBvdGhlciBmdW5jdGlvbmFsaXR5IHdvdWxkbid0IHN1ZmZlci4KSSdtIGUuZy4gbm90IHN1
cmUgdGltZV9jYWxpYnJhdGlvbiB3b24ndCBsZWFkIHRvIGEgaGFuZ2luZyBzeXN0ZW0gdGhlbi4K
Cj4gCj4+ICt2b2lkIHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxc19ub3JjdSh2b2lkKQo+PiArewo+
PiArICAgIEFTU0VSVCghaW5faXJxKCkgJiYgbG9jYWxfaXJxX2lzX2VuYWJsZWQoKSk7Cj4+ICsg
ICAgLyogRG8gbm90IGVudGVyIHNjaGVkdWxlciBhcyBpdCBjYW4gcHJlZW1wdCB0aGUgY2FsbGlu
ZyBjb250ZXh0LiAqLwo+PiArICAgIF9fZG9fc29mdGlycSgoMXVsIDw8IFNDSEVEVUxFX1NPRlRJ
UlEpIHwgKDF1bCA8PCBTQ0hFRF9TTEFWRV9TT0ZUSVJRKSwKPiAKPiBEb24ndCB5b3UgYWxzbyBu
ZWVkIHRvIHBhc3MgUkNVX1NPRlRJUlEgdG8gdGhlIGlnbm9yZSBtYXNrIGluIG9yZGVyIHRvCj4g
YXZvaWQgYW55IFJDVSB3b3JrIGhhcHBlbmluZz8KClllcywgdGhhdCdzIHByb2JhYmx5IGEgZ29v
ZCBpZGVhLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
