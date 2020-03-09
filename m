Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1995E17DBE5
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 09:58:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBEBQ-0005w0-0T; Mon, 09 Mar 2020 08:54:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=k1Ob=42=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBEBO-0005vv-FV
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 08:54:42 +0000
X-Inumbo-ID: 9d339310-61e3-11ea-abea-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d339310-61e3-11ea-abea-12813bfff9fa;
 Mon, 09 Mar 2020 08:54:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 624F4B233;
 Mon,  9 Mar 2020 08:54:40 +0000 (UTC)
To: Paul Durrant <xadimgnik@gmail.com>
References: <20200225095357.3923-1-pdurrant@amazon.com>
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
 <3a10c28b-0a2e-d037-db82-2505eac31d02@suse.com>
 <001d01d5f3d4$196e6820$4c4b3860$@xen.org>
 <f6c7afd3-b6e0-fa4b-f588-fea00e68f0d1@suse.com>
 <000001d5f5ef$83780f10$8a682d30$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f8f6f6db-f5ea-12eb-605a-0b53de992771@suse.com>
Date: Mon, 9 Mar 2020 09:54:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <000001d5f5ef$83780f10$8a682d30$@xen.org>
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

T24gMDkuMDMuMjAyMCAwOTo0OCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+
IFNlbnQ6IDA2IE1hcmNoIDIwMjAgMTc6MTcKPj4gVG86IFBhdWwgRHVycmFudCA8eGFkaW1nbmlr
QGdtYWlsLmNvbT4KPj4gQ2M6IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGp1bGllbkB4ZW4ub3Jn
OyBWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbTsgd2xAeGVuLm9yZzsKPj4ga29ucmFkLndpbGtA
b3JhY2xlLmNvbTsgYW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbTsgaWFuLmphY2tzb25AZXUuY2l0
cml4LmNvbTsKPj4gZ2VvcmdlLmR1bmxhcEBjaXRyaXguY29tOyB4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmc7ICdEYXZpZCBXb29kaG91c2UnIDxkd213MkBpbmZyYWRlYWQub3JnPgo+PiBT
dWJqZWN0OiBSZTogW1BBVENIIDIvMl0gZG9tYWluOiB1c2UgUEdDX2V4dHJhIGRvbWhlYXAgcGFn
ZSBmb3Igc2hhcmVkX2luZm8KPj4KPj4gT24gMDYuMDMuMjAyMCAxNzoyNywgUGF1bCBEdXJyYW50
IHdyb3RlOgo+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+Pj4gRnJvbTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4+IFNlbnQ6IDA2IE1hcmNoIDIwMjAgMTM6NDYK
Pj4+PiBUbzogUGF1bCBEdXJyYW50IDx4YWRpbWduaWtAZ21haWwuY29tPgo+Pj4+IENjOiBzc3Rh
YmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZzsgVm9sb2R5bXlyX0JhYmNodWtAZXBh
bS5jb207IHdsQHhlbi5vcmc7Cj4+Pj4ga29ucmFkLndpbGtAb3JhY2xlLmNvbTsgYW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbTsgaWFuLmphY2tzb25AZXUuY2l0cml4LmNvbTsKPj4+PiBnZW9yZ2Uu
ZHVubGFwQGNpdHJpeC5jb207IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgJ0Rhdmlk
IFdvb2Rob3VzZScgPGR3bXcyQGluZnJhZGVhZC5vcmc+Cj4+Pj4gU3ViamVjdDogUmU6IFtQQVRD
SCAyLzJdIGRvbWFpbjogdXNlIFBHQ19leHRyYSBkb21oZWFwIHBhZ2UgZm9yIHNoYXJlZF9pbmZv
Cj4+Pj4KPj4+PiBPbiAwNi4wMy4yMDIwIDE0OjQxLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+Pj4+
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+Pj4+Pj4gRnJvbTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgo+Pj4+Pj4gU2VudDogMDYgTWFyY2ggMjAyMCAxMzozNgo+Pj4+Pj4g
VG86IFBhdWwgRHVycmFudCA8eGFkaW1nbmlrQGdtYWlsLmNvbT4KPj4+Pj4+IENjOiBzc3RhYmVs
bGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZzsgVm9sb2R5bXlyX0JhYmNodWtAZXBhbS5j
b207IHdsQHhlbi5vcmc7Cj4+Pj4+PiBrb25yYWQud2lsa0BvcmFjbGUuY29tOyBhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tOyBpYW4uamFja3NvbkBldS5jaXRyaXguY29tOwo+Pj4+Pj4gZ2Vvcmdl
LmR1bmxhcEBjaXRyaXguY29tOyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7ICdEYXZp
ZCBXb29kaG91c2UnIDxkd213MkBpbmZyYWRlYWQub3JnPgo+Pj4+Pj4gU3ViamVjdDogUmU6IFtQ
QVRDSCAyLzJdIGRvbWFpbjogdXNlIFBHQ19leHRyYSBkb21oZWFwIHBhZ2UgZm9yIHNoYXJlZF9p
bmZvCj4+Pj4+Pgo+Pj4+Pj4gT24gMDYuMDMuMjAyMCAxNDoyNiwgUGF1bCBEdXJyYW50IHdyb3Rl
Ogo+Pj4+Pj4+PiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnBy
b2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSmFuIEJldWxpY2gKPj4+Pj4+Pj4gU2VudDogMDYgTWFy
Y2ggMjAyMCAxMzoyNAo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBPbiAwNi4wMy4yMDIwIDE0OjEzLCBQYXVs
IER1cnJhbnQgd3JvdGU6Cj4+Pj4+Pj4+PiBNeSBhaW0gaXMgdG8gbWFrZSB0aGUgc2VwYXJhdGlv
biBhYnVuZGFudGx5IG9idmlvdXMgYnkgZ2V0dGluZyByaWQKPj4+Pj4+Pj4+IG9mIHNoYXJlZCB4
ZW5oZWFwIHBhZ2VzIChmb3Igbm9uLXN5c3RlbSBkb21haW5zIGF0IGxlYXN0KSBidXQgSQo+Pj4+
Pj4+Pj4gY2FuJ3QgZG8gdGhhdCBiZWZvcmUgY29udmVydGluZyBzaGFyZWRfaW5mbyBhbmQgZ3Jh
bnQgc2hhcmVkL3N0YXR1cwo+Pj4+Pj4+Pj4gZnJhbWVzIHRvIGRvbWhlYXAuCj4+Pj4+Pj4+Cj4+
Pj4+Pj4+IEZvbGxvd2luZyBEYXZpZCdzIHZhcmlvdXMgcmVwbGllcyAtIGluc3RlYWQgb2YgZ29p
bmcgdGhpcyByb3V0ZSBvZgo+Pj4+Pj4+PiByZXBsYWNpbmcgdGhlIHNoYXJpbmcgb2YgeGVuaGVh
cCBwYWdlcyBieSBkaWZmZXJlbnQgbG9naWMsIHRoZQo+Pj4+Pj4+PiBzYW1lIG91Z2h0IHRvIGJl
IGFjaGlldmFibGUgYnkgbWFraW5nIHRoZSBiYWNraW5nIGFsbG9jYXRpb25zIGNvbWUKPj4+Pj4+
Pj4gZnJvbSB0aGUgY29ycmVjdCBwb29sPwo+Pj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pj4gSSBzdGls
bCBwcmVmZXIgdGhlIHNpbXBsaWZpY2F0aW9uIG9mIG5vdCBoYXZpbmcgdG8gY2xlYW4gdXAgdGhl
Cj4+Pj4+Pj4gc2hhcmVkIHhlbmhlYXAgcGFnZSBsaXN0IGluIGRvbWFpbl9raWxsKCkgc28gSU1P
IGl0IGlzIHN0aWxsIHdvcnRoCj4+Pj4+Pj4gaXQgZm9yIHRoYXQgYWxvbmUuCj4+Pj4+Pgo+Pj4+
Pj4gSSBkb24ndCBzZWUgYW55dGhpbmcgdmVyeSBzcGVjaWFsIHdpdGggdGhlIGNsZWFuaW5nIHVw
IGluCj4+Pj4+PiBkb21haW5fa2lsbCgpIC8gZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2VzKCku
IFdoYXQgSSdkIHZpZXcgYXMKPj4+Pj4+IG1vcmUgZGVzaXJhYmxlIGluIHRoaXMgcmVnYXJkIGlz
IHRoZSBnZW5lcmFsIGZhY3Qgb2YgbmVlZGluZwo+Pj4+Pj4gdHdvIGxpc3RzLiBCdXQgeW91IHJl
YWxpemUgdGhlcmUncyBhIGRvd25zaWRlIHRvIHRoaXMgYXMgd2VsbD8KPj4+Pj4+IGR1bXBfcGFn
ZWZyYW1lX2luZm8oKSB3aWxsIHJlbGlhYmx5IHNob3cgX2FsbF8gWGVuIGhlYXAgcGFnZXMKPj4+
Pj4+IGFzc29jaWF0ZWQgd2l0aCBhIGRvbWFpbiwgYnV0IGl0IHdpbGwgb25seSBldmVyIHNob3cg
dXAgdG8gMTAKPj4+Pj4+IHBhZ2VzIG9uIC0+cGFnZV9saXN0IGZvciBhIGRvbWFpbiB0aGF0J3Mg
bm90IGFscmVhZHkgYmVpbmcKPj4+Pj4+IGNsZWFuZWQgdXAuCj4+Pj4+Cj4+Pj4+IFRoYXQncyBu
b3QgbXVjaCBvZiBhIGRvd25zaWRlIHRob3VnaCBJIGRvbid0IHRoaW5rLiBUaGUgeGVuaGVhcAo+
Pj4+PiAob3IgUEdDX2V4dHJhIGRvbWhlYXAgcGFnZXMpIGFyZSAnc3BlY2lhbCcgYW5kIHNvIGlu
Zm8gYWJvdXQKPj4+Pj4gdGhlbSBvdWdodCB0byBiZSBhdmFpbGFibGUgdmlhIGFuIGFsdGVybmF0
ZSBkdW1wIGZ1bmN0aW9uIGFueXdheQo+Pj4+PiAoYW5kIGlmIG5vdCBhbHJlYWR5LCBpdCBjYW4g
YmUgYWRkZWQpLgo+Pj4+Cj4+Pj4gV2hhdGV2ZXIgeW91J2QgYWRkLCB0aGUgbG9naWMgd291bGQg
bmVlZCB0byBlaXRoZXIgdHJhdmVyc2UgdGhlCj4+Pj4gZW50aXJlIC0+cGFnZV9saXN0IChjYW4g
dGFrZSB2ZXJ5IGxvbmcpIG9yIGhhdmUvdXNlIG91dCBvZiBiYW5kCj4+Pj4gaW5mb3JtYXRpb24g
d2hlcmUgc3VjaCBwYWdlcyBtYXkgaGF2ZSBhIHJlY29yZCAoZnJhZ2lsZSkuCj4+Pj4KPj4+Cj4+
PiBCdXQgdGhlIHNoYXJlZCB4ZW5oZWFwIHBhZ2VzIGluIHF1ZXN0aW9uIGFyZSBvbmx5IHNoYXJl
ZCBpbmZvLCBvcgo+Pj4gZ3JhbnQgdGFibGUsIHNvIHRoZWlyIGluZm9ybWF0aW9uIGNhbiBiZSBk
dW1wZWQgc2VwYXJhdGVseS4KPj4+IEkgZ3Vlc3MgaXQgbWFrZXMgbW9yZSBzZW5zZSB0byBhZGQg
YW5vdGhlciBwYXRjaCBpbnRvIHRoZSBzZXJpZXMKPj4+IHRvIGRvIGV4cGxpY2l0IGR1bXAgb2Yg
c2hhcmVkX2luZm8gYW5kIHRoZW4gZXhjbHVkZSAnc3BlY2lhbCcKPj4+IHBhZ2VzIGZyb20gZHVt
cF9wYWdlZnJhbWVfaW5mbygpLgo+Pgo+PiBCdSB0aGF0J3Mgd2h5IEkgc2FpZCAiZnJhZ2lsZSIg
LSBuZXcgdXNlcyBvZiBzdWNoIHBhZ2VzIHdvdWxkbid0Cj4+IGF1dG9tYXRpY2FsbHkgYmUgcGlj
a2VkIHVwLCB3aGVyZWFzIHRoZW0gYWxsIGxhbmRpbmcgb24geGVucGFnZV9saXN0Cj4+IG1hZGUg
dGhlaXIgZHVtcGluZyBhIHJlbGlhYmxlIHRoaW5nLgo+Pgo+IAo+IEJ1dCBob3cgdXNlZnVsIGlz
IGR1bXBpbmcgeGVuaGVhcCBwYWdlcyB0aGlzIHdheT8gVGhlcmUncyBub3RoaW5nCj4gdGhhdCBh
Y3R1YWxseSBzYXlzIHdoYXQgdGhleSBhcmUgZm9yIHNvIEkgY2FuJ3Qgc2VlIHdoeSBpdCBpcwo+
IHBhcnRpY3VsYXJseSB1c2VmdWwuCgpUaGF0J3Mgbm8gZGlmZmVyZW50IGZyb20gdGhlIGRvbWhl
YXAgcGFnZSBsaXN0IGR1bXBpbmcuIFRoZSBtYWluCnBvaW50IG9mIGl0IC0gYWl1aSAtIGlzIHRv
IGhhdmUgYSBob29rIG9uIGZpbmRpbmcgd2hlcmUgcG9zc2libGUKbGVha3Mgc2l0LiBGb3IgeGVu
aGVhcCBwYWdlcywgYWN0dWFsbHksIG9uZSBjYW4gKGN1cnJlbnRseSkgaW5mZXIKd2hhdCB0aGV5
IGFyZSB1c2VkIGZvciBmcm9tIHRoZWlyIHBvc2l0aW9uIG9uIHRoZSBsaXN0LCBJIHRoaW5rLgoK
PiBIYXZpbmcgc29tZXRoaW5nIHRoYXQgc2F5cyAnVGhpcyBpcyB0aGUgc2hhcmVkX2luZm8gcGFn
ZScgYW5kCj4gJ1RoZXNlIGFyZSB0aGUgZ3JhbnQgc2hhcmVkIGZyYW1lcycgc2VlbXMgbXVjaCBt
b3JlIGRlc2lyYWJsZS4uLgo+IGFuZCBhbnkgbmV3IG9uZXMgYWRkZWQgd291bGQgYWxtb3N0IGNl
cnRhaW5seSBtZXJpdCBzaW1pbGFyIGR1bXAKPiBmdW5jdGlvbnMuCgpQb3NzaWJseSwgeWV0IHRo
YXQncyBkaWZmZXJlbnQgKHBhcnRseSBleHRlbmRlZCwgcGFydGx5Cm9ydGhvZ29uYWwpIGZ1bmN0
aW9uYWxpdHkuIERvaW5nIHN1Y2ggbWF5IGluZGVlZCBiZSB1c2VmdWwuCgpKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
