Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D338164A50
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 17:28:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4SBN-0001Zn-N0; Wed, 19 Feb 2020 16:26:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jH6y=4H=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j4SBL-0001Zc-Mu
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 16:26:39 +0000
X-Inumbo-ID: 9a4a30b8-5334-11ea-b0fd-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a4a30b8-5334-11ea-b0fd-bc764e2007e4;
 Wed, 19 Feb 2020 16:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582129598;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VP89HQF0TkuDd2ZZZE0YOkWq/w727HetiyEOeWL3VaA=;
 b=f9QzvVu91q5g9nI1WGUWsygQce70mycIXIu6WUhdtICekZhSe+kZYWqc
 VVc+IUVcQ25+aUJoLZXen5LiUtjbHoObtF+Ne8aNJL2i60/AHaMsq47tl
 ka2HNpIzIlJrWk/ZlEmu5OkOyquUVe1m1CqHTaiMC7As6mLsugAZtHl9z Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5g9sfc/UQ/JEkqoQiNb/ZrIBuAaVILPGrMh3/3Y1kSpKhmds5o8AkrSKaRUzmnjKUWKPp/MKPx
 dIJ6OZE6niacBB5KbVXz/4fBSNPf2RSlpR1IpPkz4QN9pC0fuqDCagulkHaCWNvOzfDp20qkDU
 TzoMQe4B7HTIXtr9QO9hvQFWcC+n8nuGx3Ev7LR0fZzc8T3Ei1wTogiFQpzxVn3xtER1nzWkY+
 gV2ADCE0PPSBjXht7dTOH+O11KGs5iSb7mlwb6NnF05DMqOfqnkcUHkYlLUtz1VasDo4cZ1YMW
 KKQ=
X-SBRS: 2.7
X-MesageID: 13059494
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,461,1574139600"; d="scan'208";a="13059494"
Date: Wed, 19 Feb 2020 17:26:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200219162631.GG4679@Air-de-Roger>
References: <20200213113237.58795-1-roger.pau@citrix.com>
 <20200213113237.58795-3-roger.pau@citrix.com>
 <1b278189-c96a-796a-1733-a3584809227f@suse.com>
 <20200219132217.GB4679@Air-de-Roger>
 <960b4da8-4522-082a-42b9-ab870698a5ec@suse.com>
 <20200219144549.GD4679@Air-de-Roger>
 <3ae51529-1cfe-9872-68a4-ab57d634a1cd@suse.com>
 <63d07524-3e72-06e4-cc16-a0a1561a5c68@citrix.com>
 <1f4fefd9-b5a9-ca40-1877-19e66b6ef625@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1f4fefd9-b5a9-ca40-1877-19e66b6ef625@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 2/2] smp: convert cpu_hotplug_begin into a
 blocking lock acquisition
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMTksIDIwMjAgYXQgMDU6MDY6MjBQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTkuMDIuMjAyMCAxNjowNywgQW5kcmV3IENvb3BlciB3cm90ZToKPiA+IE9uIDE5
LzAyLzIwMjAgMTQ6NTcsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+IE9uIDE5LjAyLjIwMjAgMTU6
NDUsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPj4+IE9uIFdlZCwgRmViIDE5LCAyMDIwIGF0
IDAyOjQ0OjEyUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+Pj4gT24gMTkuMDIuMjAy
MCAxNDoyMiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+Pj4+PiBPbiBXZWQsIEZlYiAxOSwg
MjAyMCBhdCAwMTo1OTo1MVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4+Pj4gT24g
MTMuMDIuMjAyMCAxMjozMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4+Pj4+Pj4gRG9uJ3Qg
YWxsb3cgY3B1X2hvdHBsdWdfYmVnaW4gdG8gZmFpbCBieSBjb252ZXJ0aW5nIHRoZSB0cnlsb2Nr
IGludG8gYQo+ID4+Pj4+Pj4gYmxvY2tpbmcgbG9jayBhY3F1aXNpdGlvbi4gV3JpdGUgdXNlcnMg
b2YgdGhlIGNwdV9hZGRfcmVtb3ZlX2xvY2sgYXJlCj4gPj4+Pj4+PiBsaW1pdGVkIHRvIENQVSBw
bHVnL3VucGx1ZyBvcGVyYXRpb25zLCBhbmQgY2Fubm90IGRlYWRsb2NrIGJldHdlZW4KPiA+Pj4+
Pj4+IHRoZW1zZWx2ZXMgb3Igb3RoZXIgdXNlcnMgdGFraW5nIHRoZSBsb2NrIGluIHJlYWQgbW9k
ZSBhcwo+ID4+Pj4+Pj4gY3B1X2FkZF9yZW1vdmVfbG9jayBpcyBhbHdheXMgbG9ja2VkIHdpdGgg
aW50ZXJydXB0cyBlbmFibGVkLiBUaGVyZQo+ID4+Pj4+Pj4gYXJlIGFsc28gbm8gb3RoZXIgbG9j
a3MgdGFrZW4gZHVyaW5nIHRoZSBwbHVnL3VucGx1ZyBvcGVyYXRpb25zLgo+ID4+Pj4+PiBJIGRv
bid0IHRoaW5rIHRoZSBnb2FsIHdhcyBkZWFkbG9jayBhdm9pZGFuY2UsIGJ1dCByYXRoZXIgbGlt
aXRpbmcKPiA+Pj4+Pj4gb2YgdGhlIHRpbWUgc3BlbnQgc3Bpbm5pbmcgd2hpbGUgdHJ5aW5nIHRv
IGFjcXVpcmUgdGhlIGxvY2ssIGluCj4gPj4+Pj4+IGZhdm9yIG9mIGhhdmluZyB0aGUgY2FsbGVy
IHJldHJ5Lgo+ID4+Pj4+IE5vdyB0aGF0IHRoZSBjb250ZW50aW9uIGJldHdlZW4gcmVhZC1vbmx5
IHVzZXJzIGlzIHJlZHVjZWQgYXMgdGhvc2UKPiA+Pj4+PiBjYW4gdGFrZSB0aGUgbG9jayBpbiBw
YXJhbGxlbCBJIHRoaW5rIGl0J3Mgc2FmZSB0byBzd2l0Y2ggd3JpdGVycyB0bwo+ID4+Pj4+IGJs
b2NraW5nIG1vZGUuCj4gPj4+PiBJJ2QgYWdyZWUgaWYgd3JpdGVycyBjb3VsZG4ndCBiZSBzdGFy
dmVkIGJ5IChtYW55KSByZWFkZXJzLgo+ID4+PiBBRkFJQ1QgZnJvbSB0aGUgcncgbG9jayBpbXBs
ZW1lbnRhdGlvbiByZWFkZXJzIHdvbid0IGJlIGFibGUgdG8gcGljawo+ID4+PiB0aGUgbG9jayBh
cyBzb29uIGFzIHRoZXJlJ3MgYSB3cml0ZXIgd2FpdGluZywgd2hpY2ggc2hvdWxkIGF2b2lkIHRo
aXMKPiA+Pj4gc3RhcnZhdGlvbj8KPiA+Pj4KPiA+Pj4gWW91IHN0aWxsIG5lZWQgdG8gd2FpdCBm
b3IgY3VycmVudCByZWFkZXJzIHRvIGRyb3AgdGhlIGxvY2ssIGJ1dCBubwo+ID4+PiBuZXcgcmVh
ZGVycyB3b3VsZCBiZSBhYmxlIHRvIGxvY2sgaXQsIHdoaWNoIEkgdGhpbmsgc2hvdWxkIGdpdmJl
IHVzCj4gPj4+IGVub3VnaCBmYWlybmVzcy4KPiA+PiBBaCwgcmlnaHQsIGl0IHdhcyByYXRoZXIg
dGhlIG90aGVyIHdheSBhcm91bmQgLSBiYWNrLXRvLWJhY2sKPiA+PiB3cml0ZXJzIGNhbiBzdGFy
dmUgcmVhZGVycyB3aXRoIG91ciBjdXJyZW50IGltcGxlbWVudGF0aW9uLgo+ID4+Cj4gPj4+IE9U
T0ggd2hlbiB1c2luZyBfdHJ5bG9jayBuZXcgcmVhZGVycyBjYW4gc3RpbGwgcGljawo+ID4+PiB0
aGUgbG9jayBpbiByZWFkIG1vZGUsIGFuZCBoZW5jZSBJIHRoaW5rIHVzaW5nIGJsb2NraW5nIG1v
ZGUgZm9yCj4gPj4+IHdyaXRlcnMgaXMgYWN0dWFsbHkgYmV0dGVyLCBhcyB5b3UgY2FuIGFzc3Vy
ZSB0aGF0IHJlYWRlcnMgd29uJ3QgYmUKPiA+Pj4gYWJsZSB0byBzdGFydmUgd3JpdGVycy4KPiA+
PiBUaGlzIGlzIGEgZ29vZCBwb2ludC4gTmV2ZXJ0aGVsZXNzIEkgcmVtYWluIHVuY29udmluY2Vk
IHRoYXQKPiA+PiB0aGUgY2hhbmdlIGlzIHdhcnJhbnRlZCBnaXZlbiB0aGUgb3JpZ2luYWwgaW50
ZW50aW9ucyAoYXMgZmFyCj4gPj4gYXMgd2UncmUgYWJsZSB0byByZWNvbnN0cnVjdCB0aGVtKS4g
SWYgdGhlIGN1cnJlbnQgYmVoYXZpb3IKPiA+PiBnZXRzIGluIHRoZSB3YXkgb2Ygc2Vuc2libGUg
c2hpbSBvcGVyYXRpb24sIHBlcmhhcHMgdGhlCj4gPj4gYmVoYXZpb3Igc2hvdWxkIGJlIG1hZGUg
ZGVwZW5kZW50IHVwb24gcnVubmluZyBpbiBzaGltIG1vZGU/Cj4gPiAKPiA+IEhvdHBsdWcgaXNu
J3QgZ2VuZXJhbGx5IHVzZWQgYXQgYWxsLCBzbyB0aGVyZSBpcyAwIHdyaXRlIHByZXNzdXJlIG9u
IHRoZQo+ID4gbG9jay4KPiA+IAo+ID4gV2hlbiBpdCBpcyB1c2VkLCBpdCBpcyBhbGwgYXQgZXhw
bGljaXQgcmVxdWVzdCBmcm9tIHRoZSBjb250cm9sbGluZwo+ID4gZW50aXR5IGluIHRoZSBzeXN0
ZW0gKGhhcmR3YXJlIGRvbWFpbiwgb3Igc2luZ2xldG9uIHNoaW0gZG9tYWluKS4KPiA+IAo+ID4g
SWYgdGhhdCBlbnRpdHkgaXMgdHJ5aW5nIHRvIERvUyB5b3UsIHlvdSd2ZSBhbHJlYWR5IGxvc3Qu
Cj4gCj4gQnV0IHdyaXRlIHByZXNzdXJlIHdhcyBuZXZlciBpbiBxdWVzdGlvbi4gTXkgY29uY2Vy
biBpcyB3aXRoCj4gaG93IGxvbmcgaXQgbWlnaHQgdGFrZSBmb3IgYWxsIHJlYWRlcnMgdG8gZHJv
cCB0aGVpciBsb2Nrcy4KClRoZSBvbmx5IGxvbmcgcnVubmluZyBvcGVyYXRpb24gdGhhdCB0YWtl
cyB0aGUgQ1BVIG1hcHMgcmVhZCBsb2NrIGlzCm1pY3JvY29kZSB1cGRhdGluZyBvciBsaXZlcGF0
Y2hpbmcsIGFuZCBzaW5jZSB0aG9zZSBhcmUgYWxzbyBzdGFydGVkCmJ5IGEgcHJpdmlsZWdlZCBk
b21haW4gSSB0aGluayBpdCdzIHNhZmUuIEFueSBzYW5lIGFkbWluIHdvdWxkbid0IGRvIGEKQ1BV
IHBsdWcvdW5wbHVnIHdoaWxlIHVwZGF0aW5nIG1pY3JvY29kZSBvciBkb2luZyBhIGxpdmVwYXRj
aGluZy4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
