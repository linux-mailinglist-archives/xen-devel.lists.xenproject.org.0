Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA8217C423
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 18:20:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jAGab-0000oj-1y; Fri, 06 Mar 2020 17:16:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JlMq=4X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jAGaZ-0000oe-64
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 17:16:43 +0000
X-Inumbo-ID: 3ee6e3d2-5fce-11ea-a84b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3ee6e3d2-5fce-11ea-a84b-12813bfff9fa;
 Fri, 06 Mar 2020 17:16:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 93DFAB15D;
 Fri,  6 Mar 2020 17:16:38 +0000 (UTC)
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
 <3a10c28b-0a2e-d037-db82-2505eac31d02@suse.com>
 <001d01d5f3d4$196e6820$4c4b3860$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f6c7afd3-b6e0-fa4b-f588-fea00e68f0d1@suse.com>
Date: Fri, 6 Mar 2020 18:16:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <001d01d5f3d4$196e6820$4c4b3860$@xen.org>
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

T24gMDYuMDMuMjAyMCAxNzoyNywgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+
IFNlbnQ6IDA2IE1hcmNoIDIwMjAgMTM6NDYKPj4gVG86IFBhdWwgRHVycmFudCA8eGFkaW1nbmlr
QGdtYWlsLmNvbT4KPj4gQ2M6IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGp1bGllbkB4ZW4ub3Jn
OyBWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbTsgd2xAeGVuLm9yZzsKPj4ga29ucmFkLndpbGtA
b3JhY2xlLmNvbTsgYW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbTsgaWFuLmphY2tzb25AZXUuY2l0
cml4LmNvbTsKPj4gZ2VvcmdlLmR1bmxhcEBjaXRyaXguY29tOyB4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmc7ICdEYXZpZCBXb29kaG91c2UnIDxkd213MkBpbmZyYWRlYWQub3JnPgo+PiBT
dWJqZWN0OiBSZTogW1BBVENIIDIvMl0gZG9tYWluOiB1c2UgUEdDX2V4dHJhIGRvbWhlYXAgcGFn
ZSBmb3Igc2hhcmVkX2luZm8KPj4KPj4gT24gMDYuMDMuMjAyMCAxNDo0MSwgUGF1bCBEdXJyYW50
IHdyb3RlOgo+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+Pj4gRnJvbTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4+IFNlbnQ6IDA2IE1hcmNoIDIwMjAgMTM6MzYK
Pj4+PiBUbzogUGF1bCBEdXJyYW50IDx4YWRpbWduaWtAZ21haWwuY29tPgo+Pj4+IENjOiBzc3Rh
YmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZzsgVm9sb2R5bXlyX0JhYmNodWtAZXBh
bS5jb207IHdsQHhlbi5vcmc7Cj4+Pj4ga29ucmFkLndpbGtAb3JhY2xlLmNvbTsgYW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbTsgaWFuLmphY2tzb25AZXUuY2l0cml4LmNvbTsKPj4+PiBnZW9yZ2Uu
ZHVubGFwQGNpdHJpeC5jb207IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgJ0Rhdmlk
IFdvb2Rob3VzZScgPGR3bXcyQGluZnJhZGVhZC5vcmc+Cj4+Pj4gU3ViamVjdDogUmU6IFtQQVRD
SCAyLzJdIGRvbWFpbjogdXNlIFBHQ19leHRyYSBkb21oZWFwIHBhZ2UgZm9yIHNoYXJlZF9pbmZv
Cj4+Pj4KPj4+PiBPbiAwNi4wMy4yMDIwIDE0OjI2LCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+Pj4+
PiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3Jn
PiBPbiBCZWhhbGYgT2YgSmFuIEJldWxpY2gKPj4+Pj4+IFNlbnQ6IDA2IE1hcmNoIDIwMjAgMTM6
MjQKPj4+Pj4+Cj4+Pj4+PiBPbiAwNi4wMy4yMDIwIDE0OjEzLCBQYXVsIER1cnJhbnQgd3JvdGU6
Cj4+Pj4+Pj4gTXkgYWltIGlzIHRvIG1ha2UgdGhlIHNlcGFyYXRpb24gYWJ1bmRhbnRseSBvYnZp
b3VzIGJ5IGdldHRpbmcgcmlkCj4+Pj4+Pj4gb2Ygc2hhcmVkIHhlbmhlYXAgcGFnZXMgKGZvciBu
b24tc3lzdGVtIGRvbWFpbnMgYXQgbGVhc3QpIGJ1dCBJCj4+Pj4+Pj4gY2FuJ3QgZG8gdGhhdCBi
ZWZvcmUgY29udmVydGluZyBzaGFyZWRfaW5mbyBhbmQgZ3JhbnQgc2hhcmVkL3N0YXR1cwo+Pj4+
Pj4+IGZyYW1lcyB0byBkb21oZWFwLgo+Pj4+Pj4KPj4+Pj4+IEZvbGxvd2luZyBEYXZpZCdzIHZh
cmlvdXMgcmVwbGllcyAtIGluc3RlYWQgb2YgZ29pbmcgdGhpcyByb3V0ZSBvZgo+Pj4+Pj4gcmVw
bGFjaW5nIHRoZSBzaGFyaW5nIG9mIHhlbmhlYXAgcGFnZXMgYnkgZGlmZmVyZW50IGxvZ2ljLCB0
aGUKPj4+Pj4+IHNhbWUgb3VnaHQgdG8gYmUgYWNoaWV2YWJsZSBieSBtYWtpbmcgdGhlIGJhY2tp
bmcgYWxsb2NhdGlvbnMgY29tZQo+Pj4+Pj4gZnJvbSB0aGUgY29ycmVjdCBwb29sPwo+Pj4+Pj4K
Pj4+Pj4KPj4+Pj4gSSBzdGlsbCBwcmVmZXIgdGhlIHNpbXBsaWZpY2F0aW9uIG9mIG5vdCBoYXZp
bmcgdG8gY2xlYW4gdXAgdGhlCj4+Pj4+IHNoYXJlZCB4ZW5oZWFwIHBhZ2UgbGlzdCBpbiBkb21h
aW5fa2lsbCgpIHNvIElNTyBpdCBpcyBzdGlsbCB3b3J0aAo+Pj4+PiBpdCBmb3IgdGhhdCBhbG9u
ZS4KPj4+Pgo+Pj4+IEkgZG9uJ3Qgc2VlIGFueXRoaW5nIHZlcnkgc3BlY2lhbCB3aXRoIHRoZSBj
bGVhbmluZyB1cCBpbgo+Pj4+IGRvbWFpbl9raWxsKCkgLyBkb21haW5fcmVsaW5xdWlzaF9yZXNv
dXJjZXMoKS4gV2hhdCBJJ2QgdmlldyBhcwo+Pj4+IG1vcmUgZGVzaXJhYmxlIGluIHRoaXMgcmVn
YXJkIGlzIHRoZSBnZW5lcmFsIGZhY3Qgb2YgbmVlZGluZwo+Pj4+IHR3byBsaXN0cy4gQnV0IHlv
dSByZWFsaXplIHRoZXJlJ3MgYSBkb3duc2lkZSB0byB0aGlzIGFzIHdlbGw/Cj4+Pj4gZHVtcF9w
YWdlZnJhbWVfaW5mbygpIHdpbGwgcmVsaWFibHkgc2hvdyBfYWxsXyBYZW4gaGVhcCBwYWdlcwo+
Pj4+IGFzc29jaWF0ZWQgd2l0aCBhIGRvbWFpbiwgYnV0IGl0IHdpbGwgb25seSBldmVyIHNob3cg
dXAgdG8gMTAKPj4+PiBwYWdlcyBvbiAtPnBhZ2VfbGlzdCBmb3IgYSBkb21haW4gdGhhdCdzIG5v
dCBhbHJlYWR5IGJlaW5nCj4+Pj4gY2xlYW5lZCB1cC4KPj4+Cj4+PiBUaGF0J3Mgbm90IG11Y2gg
b2YgYSBkb3duc2lkZSB0aG91Z2ggSSBkb24ndCB0aGluay4gVGhlIHhlbmhlYXAKPj4+IChvciBQ
R0NfZXh0cmEgZG9taGVhcCBwYWdlcykgYXJlICdzcGVjaWFsJyBhbmQgc28gaW5mbyBhYm91dAo+
Pj4gdGhlbSBvdWdodCB0byBiZSBhdmFpbGFibGUgdmlhIGFuIGFsdGVybmF0ZSBkdW1wIGZ1bmN0
aW9uIGFueXdheQo+Pj4gKGFuZCBpZiBub3QgYWxyZWFkeSwgaXQgY2FuIGJlIGFkZGVkKS4KPj4K
Pj4gV2hhdGV2ZXIgeW91J2QgYWRkLCB0aGUgbG9naWMgd291bGQgbmVlZCB0byBlaXRoZXIgdHJh
dmVyc2UgdGhlCj4+IGVudGlyZSAtPnBhZ2VfbGlzdCAoY2FuIHRha2UgdmVyeSBsb25nKSBvciBo
YXZlL3VzZSBvdXQgb2YgYmFuZAo+PiBpbmZvcm1hdGlvbiB3aGVyZSBzdWNoIHBhZ2VzIG1heSBo
YXZlIGEgcmVjb3JkIChmcmFnaWxlKS4KPj4KPiAKPiBCdXQgdGhlIHNoYXJlZCB4ZW5oZWFwIHBh
Z2VzIGluIHF1ZXN0aW9uIGFyZSBvbmx5IHNoYXJlZCBpbmZvLCBvcgo+IGdyYW50IHRhYmxlLCBz
byB0aGVpciBpbmZvcm1hdGlvbiBjYW4gYmUgZHVtcGVkIHNlcGFyYXRlbHkuCj4gSSBndWVzcyBp
dCBtYWtlcyBtb3JlIHNlbnNlIHRvIGFkZCBhbm90aGVyIHBhdGNoIGludG8gdGhlIHNlcmllcwo+
IHRvIGRvIGV4cGxpY2l0IGR1bXAgb2Ygc2hhcmVkX2luZm8gYW5kIHRoZW4gZXhjbHVkZSAnc3Bl
Y2lhbCcKPiBwYWdlcyBmcm9tIGR1bXBfcGFnZWZyYW1lX2luZm8oKS4KCkJ1IHRoYXQncyB3aHkg
SSBzYWlkICJmcmFnaWxlIiAtIG5ldyB1c2VzIG9mIHN1Y2ggcGFnZXMgd291bGRuJ3QKYXV0b21h
dGljYWxseSBiZSBwaWNrZWQgdXAsIHdoZXJlYXMgdGhlbSBhbGwgbGFuZGluZyBvbiB4ZW5wYWdl
X2xpc3QKbWFkZSB0aGVpciBkdW1waW5nIGEgcmVsaWFibGUgdGhpbmcuCgpKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
