Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5B3139171
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 13:55:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iqzCJ-0002ji-7i; Mon, 13 Jan 2020 12:51:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rz2b=3C=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iqzCH-0002jZ-Qi
 for xen-devel@lists.xen.org; Mon, 13 Jan 2020 12:51:57 +0000
X-Inumbo-ID: 75d7ed54-3603-11ea-a985-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75d7ed54-3603-11ea-a985-bc764e2007e4;
 Mon, 13 Jan 2020 12:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578919908;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=TD11XQKEHpGeYPRfa2cDqy3AH2Ev60FwAQ3+G+eu7aU=;
 b=O8lqmIinXoYSJdeoNmJdaN7ODybxlXjibvBaXjZzPNfH0PffwND7HqDs
 PlkgSm5ITMMcYUYAhdRBBhG91jjh2HYdDouMgCNYeBV2qzNQzNwjWULpW
 6aA1XZrbt90jNu0UJnqSba7ThNm6dY88fzvW665hANVD2jS1a1FDWkIG0 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7V2ziP2rPsKC1AeZdOTLCONVlfFCmjPAy41I4K2hj6OZtB3eYWsKrYsXmXJSHrLBVRe8DBNnvO
 I8N4qaFIM4Niu8T7hx8Ixou6XOfQvHXbxM2bxLC/URvoHyHjvsviz/R03BvSZTrYfJL6V8ZOA1
 teABgd9S2FWvISWkIT1wyKZ455fd8cCFIXBW+efaCKKa2ZMFrXI4vC2VM/s22f65uvINH3N9UL
 zojvvhcOYPReiA9fffqT2dnYhJ2EKZDKYG+vXy5sn6fgGoDd7dHlmjEiFbBQirjhPjnVGcL0sY
 QBA=
X-SBRS: 2.7
X-MesageID: 11416922
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,429,1571716800"; d="scan'208";a="11416922"
To: Doug Goldstein <cardoe@cardoe.com>
References: <20200110103723.29538-1-sergey.dyasli@citrix.com>
 <c698d473-d8f2-7d53-b5f3-0cfefcc617f1@cardoe.com>
 <865DBCFC-92C9-41D2-A502-914A5999979F@citrix.com>
 <68263b88-40b7-89d3-c962-6991c708dd89@cardoe.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <ca5a6b9b-fbde-5de6-fbf0-822d488cabf9@citrix.com>
Date: Mon, 13 Jan 2020 12:51:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <68263b88-40b7-89d3-c962-6991c708dd89@cardoe.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xsm: hide detailed Xen version from
 unprivileged guests
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>,
 Jan Beulich <jbeulich@suse.com>, Ian
 Jackson <Ian.Jackson@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMS8xMi8yMCA2OjI2IFBNLCBEb3VnIEdvbGRzdGVpbiB3cm90ZToKPiBPbiAxLzExLzIwIDM6
MDIgQU0sIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+Cj4+Cj4+PiBPbiBKYW4gMTEsIDIwMjAsIGF0
IDQ6MDIgQU0sIERvdWcgR29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT4gd3JvdGU6Cj4+Pgo+
Pj4KPj4+Cj4+PiBPbiAxLzEwLzIwIDQ6MzcgQU0sIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4+Pj4g
SGlkZSB0aGUgZm9sbG93aW5nIGluZm9ybWF0aW9uIHRoYXQgY2FuIGhlbHAgaWRlbnRpZnkgdGhl
IHJ1bm5pbmcgWGVuCj4+Pj4gYmluYXJ5IHZlcnNpb246IFhFTlZFUl9leHRyYXZlcnNpb24sIFhF
TlZFUl9jb21waWxlX2luZm8sCj4+Pj4gWEVOVkVSX2NoYW5nZXNldC4KPj4+PiBBZGQgZXhwbGlj
aXQgY2FzZXMgZm9yIFhFTlZFUl9jb21tYW5kbGluZSBhbmQgWEVOVkVSX2J1aWxkX2lkIGFzIHdl
bGwuCj4+Pj4gSW50cm9kdWNlIHhzbV9maWx0ZXJfZGVuaWVkKCkgdG8gaHZtbG9hZGVyIHRvIHJl
bW92ZSAiPGRlbmllZD4iIHN0cmluZwo+Pj4+IGZyb20gZ3Vlc3QncyBETUkgdGFibGVzIHRoYXQg
b3RoZXJ3aXNlIHdvdWxkIGJlIHNob3duIGluIHRvb2xzIGxpa2UKPj4+PiBkbWlkZWNvZGUuCj4+
Pj4gU2lnbmVkLW9mZi1ieTogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29t
Pgo+Pj4+IC0tLQo+Pj4+IHYxIC0tPiB2MjoKPj4+PiAtIEFkZGVkIHhzbV9maWx0ZXJfZGVuaWVk
KCkgdG8gaHZtbG9hZGVyIGluc3RlYWQgb2YgbW9kaWZ5aW5nCj4+Pj4geGVuX2RlbnkoKQo+Pj4K
Pj4+IFNvIDEwMCUgdGhpcyB2ZXJzaW9uIG9mIHRoZSBwYXRjaCB3b24ndCBmbHkgd2l0aCB0aGUg
dmFyaW91cwo+Pj4gZG93bnN0cmVhbXMgdGhhdCBydW4gdGhlIHYxIG9mIHRoaXMgcGF0Y2guIFRo
b3NlIHZhcmlvdXMgY29uc3VtZXJzCj4+PiB3aWxsIHN0aWNrIHdpdGggdjEuCj4+Pgo+Pj4gSWYg
dGhlIGdvYWwgb2YgdGhpcyBpcyB0byByZWR1Y2UgdGhlIGJ1cmRlbiBvZiB0aGUgZG93bnN0cmVh
bXMgYW5kCj4+PiB0aGVpciBjdXN0b21lcnMgdG8gY2FycnkgYSBwYXRjaCBhZ2FpbnN0IFhlbiB0
aGVuIEkgd291bGRuJ3QgZXZlbgo+Pj4gYm90aGVyIHdpdGggdGhpcyB2ZXJzaW9uLgo+Pgo+PiBJ
ZiB0aGUgZ29hbCBpcyB0byBjb21lIHVwIHdpdGggYSBzb2x1dGlvbiB0aGF0IHdvcmtzIGZvciBl
dmVyeW9uZSwgaXQKPj4gd291bGQgYmUgaGVscGZ1bCBpZiB5b3Ugc2FpZCAqd2h5KiDigJx2YXJp
b3VzIGNvbnN1bWVyc+KAnSB3b3VsZCBmaW5kIHRoaXMKPj4gcGF0Y2ggdW5hY2NlcHRhYmxlOyBh
bmQgYWxzbyB3aGF0IHRoZXkgbWlnaHQgdGhpbmsgYWJvdXQgdGhlIGFsdGVybmF0ZQo+PiBzb2x1
dGlvbnMgcHJvcG9zZWQgKGFuZCB3aHkpLgo+Pgo+PiDCoCAtR2VvcmdlCj4+Cj4gCgpbc25pcF0K
Cj4gTm93IEkga25vdyBzb21lb25lIGlzIGdvaW5nIHRvIHJlYWQgdGhpcyBhbmQgc2F5ICJMb29r
IGF0IERvdWcgYW5kIGhpbQo+IGFkdm9jYXRpbmcgZm9yIHNlY3VyaXR5IHRocm91Z2ggb2JzY3Vy
aXR5Ii4KCkZXSVcgSSdkIGJlIHRoZSBmaXJzdCBwZXJzb24gdG8gY29udHJhZGljdCB0aGVtLCBh
bmQgc2F5IHlvdSB3ZXJlCnByYWN0aWNpbmcgImRlZmVuc2UgaW4gZGVwdGgiLiA6LSkKCj4gVWx0
aW1hdGVseSBteSBwb2ludCBpcyBpZiB0aGUgZ29hbCBvZiB0aGlzIHBhdGNoIGlzIHRvIHVwc3Ry
ZWFtIGEgcGF0Y2gKPiB0aGF0J3MgY2FycmllZCBieSB2YXJpb3VzIGRvd25zdHJlYW1zLCB3aHkg
bm90IGFjdHVhbGx5IGxpc3RlbiB0byB3aGF0Cj4gY2F1c2VkIHRoZW0gdG8gd3JpdGUgdGhlIHBh
dGNoPwoKUmlnaHQsIHRoYXQncyB3aGF0IEknbSB0cnlpbmcgdG8gZG87IGJ1dCBJIGRvbid0IHNl
ZW0gdG8gYmUgbWFraW5nIG11Y2gKcHJvZ3Jlc3MuCgpIZXJlJ3MgbXkgc3VtbWFyeSBvZiB0aGUg
c2l0dWF0aW9uIGFuZCBhcmd1bWVudHMgc28gZmFyOgoKMS4gVGhlIHhlbl92ZXJzaW9uIGh5cGVy
Y2FsbCBjYW4gcmV0dXJuIHN0cmluZ3MgZm9yIGEgbnVtYmVyIG9mCmRpZmZlcmVudCB2YWx1ZXMs
IGluY2x1ZGluZyBYRU5WRVJfZXh0cmF2ZXJzaW9uLCB3aGljaCBnaXZlcyB0aGUgcG9pbnQKcmVs
ZWFzZSBhbmQgYnVpbGQgaWQuCgoyLiBUaGUgWFNNIGR1bW15IG1vZHVsZSBoYXMgY29kZSB0byBm
aWx0ZXIgd2hpY2ggb2YgdGhlc2UgYXJlIGFsbG93ZWQKZm9yIHVucHJpdmlsZWdlZCBndWVzdHMu
ICBXaGVuIGFjY2VzcyB0byBhIGdpdmVuIHZhbHVlIGlzIGZpbHRlcmVkLCBubwplcnJvciBpcyBy
ZXR1cm5lZDsgcmF0aGVyLCB0aGUgc3RyaW5nICI8ZGVuaWVkPiIgaXMgcmV0dXJuZWQuCgozLiBL
bm93bGVkZ2UgYWJvdXQgdGhlIHNwZWNpZmljIGluc3RhbnRpYXRpb24gb2YgWGVuIG9uIHdoaWNo
IHRoZXkgYXJlCnJ1bm5pbmcgbWFrZXMgaXQgZWFzaWVyIGZvciBhdHRhY2tlcnMgdG8ga25vdyBo
b3cgdG8gYXR0YWNrIHQgaGUgc3lzdGVtOwp0aGUgWEVOVkVSX2V4dHJhdmVyc2lvbiBwcm92aWRl
cyBsaXR0bGUgdmFsdWUgdG8gbGVnaXRpbWF0ZSB1c2VycywgYnV0IGEKbG90IG9mIHZhbHVlIHRv
IGF0dGFja2Vycy4gICBBcyBhIGRlZmVuc2UtaW4tZGVwdGggbWVhc3VyZSwgaXQncwppbXBvcnRh
bnQgdG8gYmUgYWJsZSB0byBoaWRlIHRoaXMgaW5mb3JtYXRpb24uCgo0LiBUaGVyZSdzIGN1cnJl
bnRseSBhIHBhdGNoIGNhcnJpZWQgYnkgbWFueSBkb3duc3RyZWFtcywgd2hpY2ggY2hhbmdlcwp0
aGUgWFNNIGR1bW15IG1vZHVsZSB0byBkZW55IFhFTlZFUl9leHRyYXZlcnNpb24gdG8gdW5wcml2
aWxlZ2VkIGd1ZXN0cy4KCjUuIEhvd2V2ZXIsIHRoaXMgY2F1c2VkICI8ZGVuaWVkPiIgdG8gc2hv
dyB1cCBpbiB2YXJpb3VzIHVzZXItdmlzaWJsZQpwbGFjZXMsIHdoaWNoIGNhdXNlZCBjdXN0b21l
ciBzdXBwb3J0IGhlYWRhY2hlcy4gIFNvIHRoaXMgb3V0LW9mLXRyZWUKcGF0Y2ggYWxzbyByZXBs
YWNlZCB0aGUgc3RyaW5nIHJldHVybmVkIHdoZW4gZGVueWluZyBhY2Nlc3MgdG8gIiIKaW5zdGVh
ZC4gIE5vdGUgdGhhdCB0aGlzIGlzIG5vdCAqb25seSogZm9yIFhFTlZFUl9leHRyYXZlcnNpb247
IHdpdGgKdGhhdCBwYXRjaCwgKmFueSogdGltZSB0aGUgdmFsdWUgcmVxdWVzdGVkIGluIHhlbl92
ZXJzaW9uIGlzIGRlbmllZCBieQpwb2xpY3ksICIiIHdpbGwgYmUgcmV0dXJuZWQuCgo2LiBTaWxl
bnRseSByZXR1cm5pbmcgYW4gZW1wdHkgc3RyaW5nIGlzIGNvbnNpZGVyZWQgYmFkIGludGVyZmFj
ZSBkZXNpZ24KYnkgc2V2ZXJhbCBkZXZlbG9wZXJzLiAgU28gU2VyZ2V5J3Mgc2Vjb25kIHBhdGNo
OgogLSBTdGlsbCBkZW5pZXMgWEVOVkVSX2V4dHJhdmVyc2lvbiBhdCB0aGUgaHlwZXJ2aXNvciBs
ZXZlbAogLSBMZWF2ZXMgdGhlIHZhbHVlIHJldHVybmVkIGJ5IHRoZSBoeXBlcnZpc29yIGFzICI8
ZGVuaWVkPiIKIC0gRmlsdGVycyB0aGUgIjxkZW5pZWQ+IiBzdHJpbmcgYXQgdGhlIGh2bWxvYWRl
ciBsZXZlbCwgdG8gcHJldmVudCBpdApsZWFraW5nIGludG8gYSBHVUkgYW5kIHNjYXJpbmcgY3Vz
dG9tZXJzLgoKTm93IHdlIGdldCB0byBBbmR5J3Mgb2JqZWN0aW9uIG9uIHRoZSAxMHRoOgoKLS0t
ClRoZSByZWFzb24gZm9yIHRoaXMgKHdoaWNoIG91Z2h0IHRvIGJlIG9idmlvdXMsIGJ1dCBJIGd1
ZXNzIG9ubHkgdG8KdGhvc2Ugd2hvIGFjdHVhbGx5IGRvIGN1c3RvbWVyIHN1cHBvcnQpIGlzIGJh
c2ljIGh1bWFuIHBoeXNpb2xvZ3kuCiJkZW5pZWQiIG1lYW5zIHNvbWV0aGluZyBoYXMgZ29uZSB3
cm9uZy4gIEl0IHNjYXJlcyBwZW9wbGUsIGFuZCBjYXVzZXMKdGhlbSB0byBzZWVrIGhlbHAgdG8g
Y2hhbmdlIGZpeCB3aGF0ZXZlciBpcyBicm9rZW4uCgpJdCBpcyBub3QgYXBwcm9wcmlhdGUgZm9y
IGl0IHRvIGZpbmQgaXRzIHdheSBpbnRvIHRoZSBndWVzdCBpbiB0aGUgZmlyc3QKcGxhY2UsIGFu
ZCB0aGF0IGluY2x1ZGVzIHR1cm5pbmcgdXAgaW4gYGRtZXNnYCBhbmQgb3RoZXIgbG9ncywgYW5k
CmV4cGVjdGluZyBndWVzdCBydW50aW1lIHRvIGZpbHRlciBmb3IgaXQgaXMgY29tcGxldGUgbm9u
c2Vuc2UuCi0tLQoKQmFzaWNhbGx5LCBBbmR5IHNheXMgdGhhdCAqYW55d2hlcmUqIGl0IG1pZ2h0
IHNob3cgdXAgaXMgd2F5IHRvbyBzY2FyeSwKZXZlbiBhIGd1ZXN0IGRtZXNnIGxvZy4KCldlbGws
IEkgZGlzYWdyZWU7IEkgbG9vayBpbiAiZG1lc2ciIGFuZCBJIHNlZSBsb2FkcyBvZiAic2Nhcnki
IHRoaW5ncy4KQnV0IGlmICI8ZGVuaWVkPiIgaXMgdG9vIHNjYXJ5LCB0aGVuIHdlIGNhbiB0cnkg
IjxoaWRkZW4+Ii4KClRoZW4gd2UgY29tZSB0byB5b3VyIG1haWwuCgpZb3Ugc3BlbmQgdHdvIHBh
cmFncmFwaHMganVzdGlmeWluZyB3aHkgd2UgbmVlZCB0byBkbyAjNCAoaGlkZSB0aGUgdmFsdWUK
ZnJvbSB1bnByaXZpbGVnZWQgZ3Vlc3RzKSwgYmFzaWNhbGx5IHJlaXRlcmF0aW5nIHBvaW50ICMz
IGFuZCBkZWFsaW5nCndpdGggcG90ZW50aWFsIG9iamVjdGlvbnMuICBCdXQgbm9ib2R5IG9iamVj
dHMgdG8gIzQsIG9yIGRpc2FncmVlcyB3aXRoICMzLgoKWW91IHRoZW4gaGF2ZSBhIHBhcmFncmFw
aCBhcmd1aW5nIHdoeSBpdCdzIGltcG9ydGFudCB0aGF0IGluZm9ybWF0aW9uIGJlCnN0cmlwcGVk
IGF0IHRoZSBoeXBlcnZpc29yIHJhdGhlciB0aGFuIGluIHRoZSB0b29sc3RhY2suCgpCdXQgU2Vy
Z2V5J3MgdjIgcGF0Y2ggKmRvZXMqIHN0cmlwIHRoZSBpbmZvcm1hdGlvbiBhdCB0aGUgaHlwZXJ2
aXNvci4KSGlzIHBhdGNoIG1ha2VzIGl0IHNvIHRoYXQgWEVOVkVSX2V4dHJhdmVyc2lvbiByZXR1
cm5zICI8ZGVuaWVkPiIuICBUaGUKY29kZSB3aGljaCBjb252ZXJ0cyAiPGRlbmllZD4iIHRvICIi
IGluIGh2bWxvYWRlciBpcyBwdXJlbHkgYSBVSSB0aGluZywKc28gdGhhdCBwZW9wbGUgbG9va2lu
ZyBpbiB0aGVpciBXaW5kb3dzIFN5c3RlbSBJbmZvIGRvbid0IGdldCBzY2FyeQptZXNzYWdlcy4K
Cj4gSSdkIGJlIGhhcHB5IGlmIHdlIGhhZCBhIEtjb25maWcgb3B0aW9uIGJlaGluZCB3aGF0IHRo
ZSBzdHJpbmcgaXMuIEdpdmUKPiBtZSBhIGJsYW5rIGFzIGFuIG9wdGlvbiBidXQgZGVmYXVsdCBp
dCB0byB3aGF0ZXZlciBzdHJpbmcgbGlrZQo+ICI8aGlkZGVuPiIgdGhhdCB5b3UnZCBsaWtlLiBF
dmVyeSBzaGlwcGluZyBYZW4gZGlzdHJvIEkndmUgd29ya2VkIG9uIGhhcwo+IGhhZCBpdHMgb3du
IHYxIHZhcmlhbnQgb2YgdGhlIHBhdGNoIGFuZCBub25lIG9mIHRoZW0gYXV0aG9yZWQgYnkgbWUu
CgoKT0ssIHNvIHdpdGggdGhpcyB3ZSBoYXZlIGZvdXIgcHJvcG9zZWQgb3B0aW9uczoKCjEuIEJs
b2NrIFhFTlZFUl9leHRyYXZlcnNpb24gYXQgdGhlIGh5cGVydmlzb3IgbGV2ZWwuICBDaGFuZ2Ug
dGhlCnhlbl9kZW55KCkgc3RyaW5nIHRvICIiLiAgKFRoaXMgaXMgdjEgb2Ygc2VyZ2V5J3MgcGF0
Y2guKQoKMi4gQmxvY2sgWEVOVkVSX2V4dHJhdmVyc2lvbiBhdCB0aGUgaHlwZXJ2aXNvciBsZXZl
bC4gIExlYXZlIHhlbl9kZW55KCkKYXMgcmV0dXJuaW5nICI8ZGVuaWVkPiIsIGJ1dCByZXBsYWNl
ICI8ZGVuaWVkPiIgd2l0aCAiIiBpbiBodm1sb2FkZXIgc28KaXQgZG9lc24ndCBzaG93IHVwIGlu
IHRoZSBTeXN0ZW0gSW5mbyBhbmQgc2NhcmUgdXNlcnMuCgozLiBCbG9jayBYRU5WRVJfZXh0cmF2
ZXJzaW9uIGF0IHRoZSBoeXBlcnZpc29yIGxldmVsLiAgQ2hhbmdlIHhlbl9kZW55KCkKdG8gcmV0
dXJuIGEgbW9yZSBiZW5pZ24gc3RyaW5nIGxpa2UgIjxoaWRkZW4+Ii4gIChQZXJoYXBzIGFsc28g
ZmlsdGVyIGl0CmluIGh2bWxvYWRlciwganVzdCBmb3IgZ29vZCBtZWFzdXJlLikKCjQuIEJsb2Nr
IFhFTlZFUl9leHRyYXZlcnNpb24gYXQgdGhlIGh5cGVydmlzb3IgbGV2ZWwuICBNYWtlIHRoZQp4
ZW5fZGVueSgpIHN0cmluZyBjb25maWd1cmFibGUgaW4gS0NvbmZpZy4KCkZ1bmRhbWVudGFsbHkg
SSBoYXZlIG5vIG9iamVjdGlvbiB0byAjNC4gIEJ1dCBJIHN0aWxsIGRvbid0IGtub3cgd2hhdAp5
b3VyIG9iamVjdGlvbnMgYXJlIHRvICMyIGFuZCAjMy4KCiAtR2VvcmdlCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
