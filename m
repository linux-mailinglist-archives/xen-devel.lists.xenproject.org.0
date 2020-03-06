Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CCF17BF82
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 14:47:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jADIk-0005t7-Fs; Fri, 06 Mar 2020 13:46:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JlMq=4X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jADIj-0005sx-BY
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 13:46:05 +0000
X-Inumbo-ID: d2b4ae46-5fb0-11ea-8eb5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2b4ae46-5fb0-11ea-8eb5-bc764e2007e4;
 Fri, 06 Mar 2020 13:46:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E5157B11A;
 Fri,  6 Mar 2020 13:46:03 +0000 (UTC)
To: Paul Durrant <xadimgnik@gmail.com>
References: <20200225095357.3923-1-pdurrant@amazon.com>
 <20200225095357.3923-3-pdurrant@amazon.com>
 <2653c2cf-9add-dd0c-03e5-36d951ee621e@suse.com>
 <132bb159fcf049ae87e402537ccc7d2a@EX13D32EUC003.ant.amazon.com>
 <b9bb89e1-1490-c3e6-11b6-f6944750a791@suse.com>
 <f361c33b-1fdd-d296-edb3-3dbe8d0bc18b@xen.org>
 <7170eda8579cc4c9e6a899980a87e0eb0e9c71cd.camel@amazon.co.uk>
 <7de58cb0-d8b5-ea86-f573-151356edbb79@suse.com>
 <d14b125acb6f22db084d889b4b1abcf5e5b1815e.camel@infradead.org>
 <bc28ea41-0d13-4182-db2e-9eeaf4408e3b@suse.com>
 <dc77e892d554d671e609374df8f2d19e88dc357b.camel@infradead.org>
 <54f5cb50-ebe6-7dc9-d46c-6b7a8f388577@suse.com>
 <007f01d5f3b9$110d20b0$33276210$@xen.org>
 <733e2b6c-c0b2-39a7-7def-0d18ca280649@suse.com>
 <00cc01d5f3ba$e3a89300$aaf9b900$@xen.org>
 <91c6ffa0-a53e-86a5-4544-935616bb3eee@suse.com>
 <001001d5f3bc$e100e0b0$a302a210$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3a10c28b-0a2e-d037-db82-2505eac31d02@suse.com>
Date: Fri, 6 Mar 2020 14:46:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <001001d5f3bc$e100e0b0$a302a210$@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] domain: use PGC_extra domheap page for
 shared_info
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
Cc: sstabellini@kernel.org, julien@xen.org, wl@xen.org, konrad.wilk@oracle.com,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com,
 'David Woodhouse' <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDMuMjAyMCAxNDo0MSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+
IFNlbnQ6IDA2IE1hcmNoIDIwMjAgMTM6MzYKPj4gVG86IFBhdWwgRHVycmFudCA8eGFkaW1nbmlr
QGdtYWlsLmNvbT4KPj4gQ2M6IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGp1bGllbkB4ZW4ub3Jn
OyBWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbTsgd2xAeGVuLm9yZzsKPj4ga29ucmFkLndpbGtA
b3JhY2xlLmNvbTsgYW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbTsgaWFuLmphY2tzb25AZXUuY2l0
cml4LmNvbTsKPj4gZ2VvcmdlLmR1bmxhcEBjaXRyaXguY29tOyB4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmc7ICdEYXZpZCBXb29kaG91c2UnIDxkd213MkBpbmZyYWRlYWQub3JnPgo+PiBT
dWJqZWN0OiBSZTogW1BBVENIIDIvMl0gZG9tYWluOiB1c2UgUEdDX2V4dHJhIGRvbWhlYXAgcGFn
ZSBmb3Igc2hhcmVkX2luZm8KPj4KPj4gT24gMDYuMDMuMjAyMCAxNDoyNiwgUGF1bCBEdXJyYW50
IHdyb3RlOgo+Pj4+IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVu
cHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBKYW4gQmV1bGljaAo+Pj4+IFNlbnQ6IDA2IE1hcmNo
IDIwMjAgMTM6MjQKPj4+Pgo+Pj4+IE9uIDA2LjAzLjIwMjAgMTQ6MTMsIFBhdWwgRHVycmFudCB3
cm90ZToKPj4+Pj4gTXkgYWltIGlzIHRvIG1ha2UgdGhlIHNlcGFyYXRpb24gYWJ1bmRhbnRseSBv
YnZpb3VzIGJ5IGdldHRpbmcgcmlkCj4+Pj4+IG9mIHNoYXJlZCB4ZW5oZWFwIHBhZ2VzIChmb3Ig
bm9uLXN5c3RlbSBkb21haW5zIGF0IGxlYXN0KSBidXQgSQo+Pj4+PiBjYW4ndCBkbyB0aGF0IGJl
Zm9yZSBjb252ZXJ0aW5nIHNoYXJlZF9pbmZvIGFuZCBncmFudCBzaGFyZWQvc3RhdHVzCj4+Pj4+
IGZyYW1lcyB0byBkb21oZWFwLgo+Pj4+Cj4+Pj4gRm9sbG93aW5nIERhdmlkJ3MgdmFyaW91cyBy
ZXBsaWVzIC0gaW5zdGVhZCBvZiBnb2luZyB0aGlzIHJvdXRlIG9mCj4+Pj4gcmVwbGFjaW5nIHRo
ZSBzaGFyaW5nIG9mIHhlbmhlYXAgcGFnZXMgYnkgZGlmZmVyZW50IGxvZ2ljLCB0aGUKPj4+PiBz
YW1lIG91Z2h0IHRvIGJlIGFjaGlldmFibGUgYnkgbWFraW5nIHRoZSBiYWNraW5nIGFsbG9jYXRp
b25zIGNvbWUKPj4+PiBmcm9tIHRoZSBjb3JyZWN0IHBvb2w/Cj4+Pj4KPj4+Cj4+PiBJIHN0aWxs
IHByZWZlciB0aGUgc2ltcGxpZmljYXRpb24gb2Ygbm90IGhhdmluZyB0byBjbGVhbiB1cCB0aGUK
Pj4+IHNoYXJlZCB4ZW5oZWFwIHBhZ2UgbGlzdCBpbiBkb21haW5fa2lsbCgpIHNvIElNTyBpdCBp
cyBzdGlsbCB3b3J0aAo+Pj4gaXQgZm9yIHRoYXQgYWxvbmUuCj4+Cj4+IEkgZG9uJ3Qgc2VlIGFu
eXRoaW5nIHZlcnkgc3BlY2lhbCB3aXRoIHRoZSBjbGVhbmluZyB1cCBpbgo+PiBkb21haW5fa2ls
bCgpIC8gZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2VzKCkuIFdoYXQgSSdkIHZpZXcgYXMKPj4g
bW9yZSBkZXNpcmFibGUgaW4gdGhpcyByZWdhcmQgaXMgdGhlIGdlbmVyYWwgZmFjdCBvZiBuZWVk
aW5nCj4+IHR3byBsaXN0cy4gQnV0IHlvdSByZWFsaXplIHRoZXJlJ3MgYSBkb3duc2lkZSB0byB0
aGlzIGFzIHdlbGw/Cj4+IGR1bXBfcGFnZWZyYW1lX2luZm8oKSB3aWxsIHJlbGlhYmx5IHNob3cg
X2FsbF8gWGVuIGhlYXAgcGFnZXMKPj4gYXNzb2NpYXRlZCB3aXRoIGEgZG9tYWluLCBidXQgaXQg
d2lsbCBvbmx5IGV2ZXIgc2hvdyB1cCB0byAxMAo+PiBwYWdlcyBvbiAtPnBhZ2VfbGlzdCBmb3Ig
YSBkb21haW4gdGhhdCdzIG5vdCBhbHJlYWR5IGJlaW5nCj4+IGNsZWFuZWQgdXAuCj4gCj4gVGhh
dCdzIG5vdCBtdWNoIG9mIGEgZG93bnNpZGUgdGhvdWdoIEkgZG9uJ3QgdGhpbmsuIFRoZSB4ZW5o
ZWFwCj4gKG9yIFBHQ19leHRyYSBkb21oZWFwIHBhZ2VzKSBhcmUgJ3NwZWNpYWwnIGFuZCBzbyBp
bmZvIGFib3V0Cj4gdGhlbSBvdWdodCB0byBiZSBhdmFpbGFibGUgdmlhIGFuIGFsdGVybmF0ZSBk
dW1wIGZ1bmN0aW9uIGFueXdheQo+IChhbmQgaWYgbm90IGFscmVhZHksIGl0IGNhbiBiZSBhZGRl
ZCkuCgpXaGF0ZXZlciB5b3UnZCBhZGQsIHRoZSBsb2dpYyB3b3VsZCBuZWVkIHRvIGVpdGhlciB0
cmF2ZXJzZSB0aGUKZW50aXJlIC0+cGFnZV9saXN0IChjYW4gdGFrZSB2ZXJ5IGxvbmcpIG9yIGhh
dmUvdXNlIG91dCBvZiBiYW5kCmluZm9ybWF0aW9uIHdoZXJlIHN1Y2ggcGFnZXMgbWF5IGhhdmUg
YSByZWNvcmQgKGZyYWdpbGUpLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
