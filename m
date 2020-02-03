Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 736271509DE
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 16:35:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iydiV-0003G8-J7; Mon, 03 Feb 2020 15:32:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BfOp=3X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iydiU-0003G3-51
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 15:32:50 +0000
X-Inumbo-ID: 6f13092a-469a-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f13092a-469a-11ea-b211-bc764e2007e4;
 Mon, 03 Feb 2020 15:32:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 770F9ACB1;
 Mon,  3 Feb 2020 15:32:48 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>
References: <20200131174930.31045-1-liuwe@microsoft.com>
 <20200131174930.31045-6-liuwe@microsoft.com>
 <20200203150154.GZ4679@Air-de-Roger> <20200203150724.bdnhkkyrntsdvxpl@debian>
 <20200203152106.GA4679@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e64af101-1f13-c7e7-6ffe-6afd5db9393b@suse.com>
Date: Mon, 3 Feb 2020 16:32:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200203152106.GA4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 05/11] x86/hyperv: setup hypercall page
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 Paul Durrant <pdurrant@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <liuwe@microsoft.com>, Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDIuMjAyMCAxNjoyMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBNb24sIEZl
YiAwMywgMjAyMCBhdCAwMzowNzoyNFBNICswMDAwLCBXZWkgTGl1IHdyb3RlOgo+PiBPbiBNb24s
IEZlYiAwMywgMjAyMCBhdCAwNDowMTo1NFBNICswMTAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3Rl
Ogo+Pj4gT24gRnJpLCBKYW4gMzEsIDIwMjAgYXQgMDU6NDk6MjRQTSArMDAwMCwgV2VpIExpdSB3
cm90ZToKPj4+PiBIeXBlci1WIHVzZXMgYSB0ZWNobmlxdWUgY2FsbGVkIG92ZXJsYXkgcGFnZSBm
b3IgaXRzIGh5cGVyY2FsbCBwYWdlLiBJdAo+Pj4+IHdpbGwgaW5zZXJ0IGEgYmFja2luZyBwYWdl
IHRvIHRoZSBndWVzdCB3aGVuIHRoZSBoeXBlcmNhbGwgZnVuY3Rpb25hbGl0eQo+Pj4+IGlzIGVu
YWJsZWQuIFRoYXQgbWVhbnMgd2UgY2FuIHVzZSBhIHBhZ2UgdGhhdCBpcyBub3QgYmFja2VkIGJ5
IHJlYWwKPj4+PiBtZW1vcnkgZm9yIGh5cGVyY2FsbCBwYWdlLgo+Pj4+Cj4+Pj4gVXNlIHRoZSB0
b3AtbW9zdCBhZGRyZXNzYWJsZSBwYWdlIGZvciB0aGF0IHB1cnBvc2UuIEFkanVzdCBlODIwIG1h
cAo+Pj4+IGFjY29yZGluZ2x5Lgo+Pj4KPj4+IENhbiB5b3UgYWRkIHRoaXMgaXMgZG9uZSB0byBh
dm9pZCBwYWdlIHNoYXR0ZXJpbmcgYW5kIHRvIG1ha2Ugc3VyZQo+Pj4gWGVuIGlzbid0IG92ZXJ3
cml0aW5nIGFueSBNTUlPIGFyZWEgd2hpY2ggbWlnaHQgYmUgcHJlc2VudCBhdCBsb3dlcgo+Pj4g
YWRkcmVzc2VzPwo+Pgo+PiBOUC4KPj4KPj4+Cj4+Pj4gKwo+Pj4+ICtzdGF0aWMgdm9pZCBfX2lu
aXQgZTgyMF9maXh1cChzdHJ1Y3QgZTgyMG1hcCAqZTgyMCkKPj4+PiArewo+Pj4+ICsgICAgdWlu
dDY0X3QgcyA9IEhWX0hDQUxMX01GTiA8PCBQQUdFX1NISUZUOwo+Pj4+ICsKPj4+PiArICAgIGlm
ICggIWU4MjBfYWRkX3JhbmdlKGU4MjAsIHMsIHMgKyBQQUdFX1NJWkUsIEU4MjBfUkVTRVJWRUQp
ICkKPj4+Cj4+PiBJIHRoaW5rIGVuZCBzaG91bGQgYmUgcyArIFBBR0VfU0laRSAtIDEsIG9yIGVs
c2UgaXQgZXhwYW5kcyBhY3Jvc3MgdHdvCj4+PiBwYWdlcz8KPj4KPj4gTm8sIGl0IHNob3VsZG4n
dC4KPj4KPj4gRTgyMCBlbnRyeSByZWNvcmRzIHRoZSBzaXplIG9mIHRoZSByZWdpb24sIHdoaWNo
IGlzIGNhbGN1bGF0ZWQgYXMKPj4gZW5kLXN0YXJ0LiBUaGUgb25lIHVzYWdlIGluIHB2L3NoaW0u
YyBmb2xsb3dzIHRoZSBzYW1lIHBhdHRlcm4gaGVyZS4KPiAKPiBIbSwgSSBzZWUuIEknbSBub3Qg
c3VyZSB0aGlzIGlzIGNvcnJlY3QsIEkgdGhpbmsgdGhlIGU4MjAgZW50cnkKPiBzaG91bGQgbG9v
ayBsaWtlOgo+IAo+IGFkZHIgPSBzOwo+IHNpemUgPSBQQUdFX1NJWkUgLSAxOwo+IAo+IEFzIHJh
bmdlcyBvbiB0aGUgZTgyMCBhcmUgaW5jbHVzaXZlLCBzbyBpZiBzaXplIGVuZHMgdXAgYmVpbmcK
PiBQQUdFX1NJWkUgdGhlbiB0aGUgZW50cnkgd291bGQgZXhwYW5kIGFjcm9zcyB0d28gcGFnZXMu
CgpSYW5nZXMgY2FuIHNlbnNpYmx5IGJlIGluY2x1c2l2ZSBvbmx5IHdoZW4gc3BlY2lmaWVkIGFz
IFtzdGFydCxlbmRdCnR1cGxlcy4gKHN0YXJ0LHNpemUpIHBhaXJzIG1ha2Ugbm8gc2Vuc2UgZm9y
IHJlcHJlc2VudGluZwpbc3RhcnQsc3RhcnQrc2l6ZV0sIHRoZXkgb25seSBtYWtlIHNlbnNlIGZv
ciBbc3RhcnQsc3RhcnQrc2l6ZSkuCk90aGVyd2lzZSwgYXMgaW4geW91ciBleGFtcGxlIGFib3Zl
LCBzaXplIHRha2VuIG9uIGl0cyBvd24gaXMgb2ZmCmJ5IG9uZSAoaS5lLiBpcyByYXRoZXIgImxh
c3QgYnl0ZSIgdGhhbiAic2l6ZSIpLgoKTW9kZXJuIExpbnV4LCB3aGVuIGxvZ2dpbmcgdGhlIG1l
bW9yeSBtYXAsIGluZGVlZCBzdWJ0cmFjdHMgMSBmcm9tCnRoZSBzdW0gb2YgYWRkciBhbmQgc2l6
ZSwgdG8gc2hvdyBhbiBpbmNsdXNpdmUgcmFuZ2UuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
