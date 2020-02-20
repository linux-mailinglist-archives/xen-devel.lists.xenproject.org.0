Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 774E9165900
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 09:19:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4h0r-00039O-FB; Thu, 20 Feb 2020 08:16:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iWzT=4I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4h0p-00039E-LN
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 08:16:47 +0000
X-Inumbo-ID: 55f22490-53b9-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55f22490-53b9-11ea-ade5-bc764e2007e4;
 Thu, 20 Feb 2020 08:16:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 257A6AEA8;
 Thu, 20 Feb 2020 08:16:46 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200213113237.58795-1-roger.pau@citrix.com>
 <20200213113237.58795-3-roger.pau@citrix.com>
 <1b278189-c96a-796a-1733-a3584809227f@suse.com>
 <20200219132217.GB4679@Air-de-Roger>
 <960b4da8-4522-082a-42b9-ab870698a5ec@suse.com>
 <20200219144549.GD4679@Air-de-Roger>
 <3ae51529-1cfe-9872-68a4-ab57d634a1cd@suse.com>
 <63d07524-3e72-06e4-cc16-a0a1561a5c68@citrix.com>
 <20200219160825.GF4679@Air-de-Roger>
 <be0a78d2-f175-96fb-dccc-58088362ddd4@suse.com>
Message-ID: <55e22641-7719-ea56-2961-4f38439c10b8@suse.com>
Date: Thu, 20 Feb 2020 09:16:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <be0a78d2-f175-96fb-dccc-58088362ddd4@suse.com>
Content-Language: en-US
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

T24gMTkuMDIuMjAyMCAxODowMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTkuMDIuMjAyMCAx
NzowOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4gT24gV2VkLCBGZWIgMTksIDIwMjAgYXQg
MDM6MDc6MTRQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+IE9uIDE5LzAyLzIwMjAg
MTQ6NTcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE5LjAyLjIwMjAgMTU6NDUsIFJvZ2Vy
IFBhdSBNb25uw6kgd3JvdGU6Cj4+Pj4+IE9uIFdlZCwgRmViIDE5LCAyMDIwIGF0IDAyOjQ0OjEy
UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMTkuMDIuMjAyMCAxNDoyMiwg
Um9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+Pj4+PiBPbiBXZWQsIEZlYiAxOSwgMjAyMCBhdCAw
MTo1OTo1MVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+Pj4gT24gMTMuMDIuMjAy
MCAxMjozMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4+Pj4+Pj4gRG9uJ3QgYWxsb3cgY3B1
X2hvdHBsdWdfYmVnaW4gdG8gZmFpbCBieSBjb252ZXJ0aW5nIHRoZSB0cnlsb2NrIGludG8gYQo+
Pj4+Pj4+Pj4gYmxvY2tpbmcgbG9jayBhY3F1aXNpdGlvbi4gV3JpdGUgdXNlcnMgb2YgdGhlIGNw
dV9hZGRfcmVtb3ZlX2xvY2sgYXJlCj4+Pj4+Pj4+PiBsaW1pdGVkIHRvIENQVSBwbHVnL3VucGx1
ZyBvcGVyYXRpb25zLCBhbmQgY2Fubm90IGRlYWRsb2NrIGJldHdlZW4KPj4+Pj4+Pj4+IHRoZW1z
ZWx2ZXMgb3Igb3RoZXIgdXNlcnMgdGFraW5nIHRoZSBsb2NrIGluIHJlYWQgbW9kZSBhcwo+Pj4+
Pj4+Pj4gY3B1X2FkZF9yZW1vdmVfbG9jayBpcyBhbHdheXMgbG9ja2VkIHdpdGggaW50ZXJydXB0
cyBlbmFibGVkLiBUaGVyZQo+Pj4+Pj4+Pj4gYXJlIGFsc28gbm8gb3RoZXIgbG9ja3MgdGFrZW4g
ZHVyaW5nIHRoZSBwbHVnL3VucGx1ZyBvcGVyYXRpb25zLgo+Pj4+Pj4+PiBJIGRvbid0IHRoaW5r
IHRoZSBnb2FsIHdhcyBkZWFkbG9jayBhdm9pZGFuY2UsIGJ1dCByYXRoZXIgbGltaXRpbmcKPj4+
Pj4+Pj4gb2YgdGhlIHRpbWUgc3BlbnQgc3Bpbm5pbmcgd2hpbGUgdHJ5aW5nIHRvIGFjcXVpcmUg
dGhlIGxvY2ssIGluCj4+Pj4+Pj4+IGZhdm9yIG9mIGhhdmluZyB0aGUgY2FsbGVyIHJldHJ5Lgo+
Pj4+Pj4+IE5vdyB0aGF0IHRoZSBjb250ZW50aW9uIGJldHdlZW4gcmVhZC1vbmx5IHVzZXJzIGlz
IHJlZHVjZWQgYXMgdGhvc2UKPj4+Pj4+PiBjYW4gdGFrZSB0aGUgbG9jayBpbiBwYXJhbGxlbCBJ
IHRoaW5rIGl0J3Mgc2FmZSB0byBzd2l0Y2ggd3JpdGVycyB0bwo+Pj4+Pj4+IGJsb2NraW5nIG1v
ZGUuCj4+Pj4+PiBJJ2QgYWdyZWUgaWYgd3JpdGVycyBjb3VsZG4ndCBiZSBzdGFydmVkIGJ5ICht
YW55KSByZWFkZXJzLgo+Pj4+PiBBRkFJQ1QgZnJvbSB0aGUgcncgbG9jayBpbXBsZW1lbnRhdGlv
biByZWFkZXJzIHdvbid0IGJlIGFibGUgdG8gcGljawo+Pj4+PiB0aGUgbG9jayBhcyBzb29uIGFz
IHRoZXJlJ3MgYSB3cml0ZXIgd2FpdGluZywgd2hpY2ggc2hvdWxkIGF2b2lkIHRoaXMKPj4+Pj4g
c3RhcnZhdGlvbj8KPj4+Pj4KPj4+Pj4gWW91IHN0aWxsIG5lZWQgdG8gd2FpdCBmb3IgY3VycmVu
dCByZWFkZXJzIHRvIGRyb3AgdGhlIGxvY2ssIGJ1dCBubwo+Pj4+PiBuZXcgcmVhZGVycyB3b3Vs
ZCBiZSBhYmxlIHRvIGxvY2sgaXQsIHdoaWNoIEkgdGhpbmsgc2hvdWxkIGdpdmJlIHVzCj4+Pj4+
IGVub3VnaCBmYWlybmVzcy4KPj4+PiBBaCwgcmlnaHQsIGl0IHdhcyByYXRoZXIgdGhlIG90aGVy
IHdheSBhcm91bmQgLSBiYWNrLXRvLWJhY2sKPj4+PiB3cml0ZXJzIGNhbiBzdGFydmUgcmVhZGVy
cyB3aXRoIG91ciBjdXJyZW50IGltcGxlbWVudGF0aW9uLgo+Pj4+Cj4+Pj4+IE9UT0ggd2hlbiB1
c2luZyBfdHJ5bG9jayBuZXcgcmVhZGVycyBjYW4gc3RpbGwgcGljawo+Pj4+PiB0aGUgbG9jayBp
biByZWFkIG1vZGUsIGFuZCBoZW5jZSBJIHRoaW5rIHVzaW5nIGJsb2NraW5nIG1vZGUgZm9yCj4+
Pj4+IHdyaXRlcnMgaXMgYWN0dWFsbHkgYmV0dGVyLCBhcyB5b3UgY2FuIGFzc3VyZSB0aGF0IHJl
YWRlcnMgd29uJ3QgYmUKPj4+Pj4gYWJsZSB0byBzdGFydmUgd3JpdGVycy4KPj4+PiBUaGlzIGlz
IGEgZ29vZCBwb2ludC4gTmV2ZXJ0aGVsZXNzIEkgcmVtYWluIHVuY29udmluY2VkIHRoYXQKPj4+
PiB0aGUgY2hhbmdlIGlzIHdhcnJhbnRlZCBnaXZlbiB0aGUgb3JpZ2luYWwgaW50ZW50aW9ucyAo
YXMgZmFyCj4+Pj4gYXMgd2UncmUgYWJsZSB0byByZWNvbnN0cnVjdCB0aGVtKS4gSWYgdGhlIGN1
cnJlbnQgYmVoYXZpb3IKPj4+PiBnZXRzIGluIHRoZSB3YXkgb2Ygc2Vuc2libGUgc2hpbSBvcGVy
YXRpb24sIHBlcmhhcHMgdGhlCj4+Pj4gYmVoYXZpb3Igc2hvdWxkIGJlIG1hZGUgZGVwZW5kZW50
IHVwb24gcnVubmluZyBpbiBzaGltIG1vZGU/Cj4+Pgo+Pj4gSG90cGx1ZyBpc24ndCBnZW5lcmFs
bHkgdXNlZCBhdCBhbGwsIHNvIHRoZXJlIGlzIDAgd3JpdGUgcHJlc3N1cmUgb24gdGhlCj4+PiBs
b2NrLgo+Pj4KPj4+IFdoZW4gaXQgaXMgdXNlZCwgaXQgaXMgYWxsIGF0IGV4cGxpY2l0IHJlcXVl
c3QgZnJvbSB0aGUgY29udHJvbGxpbmcKPj4+IGVudGl0eSBpbiB0aGUgc3lzdGVtIChoYXJkd2Fy
ZSBkb21haW4sIG9yIHNpbmdsZXRvbiBzaGltIGRvbWFpbikuCj4+Pgo+Pj4gSWYgdGhhdCBlbnRp
dHkgaXMgdHJ5aW5nIHRvIERvUyB5b3UsIHlvdSd2ZSBhbHJlYWR5IGxvc3QuCj4+Pgo+Pj4gVGhl
cmUgbWlnaHQgYmUgYXR0ZW1wdHMgdG8ganVzdGlmeSB3aHkgdGhlIGxvY2tpbmcgd2FzIGRvbmUg
bGlrZSB0aGF0IGluCj4+PiB0aGUgZmlyc3QgcGxhY2UsIGJ1dCBpdCBkb2Vzbid0IG1lYW4gdGhl
eSB3ZXJlIG5lY2Vzc2FyaWx5IGNvcnJlY3QgdG8KPj4+IGJlaW5nIHdpdGgsIGFuZCB0aGV5IGRv
bid0IG1hdGNoIHVwIHdpdGggdGhlIHJlYWxpc3RpYyB1c2FnZSBvZiB0aGUgbG9jay4KPj4KPj4g
SSdtIGhhcHB5IHRvIHJld3JpdGUgdGhlIGNvbW1pdCBtZXNzYWdlIGluIG9yZGVyIHRvIGluY2x1
ZGUgdGhlCj4+IGRpc2N1c3Npb24gaGVyZS4gV2hhdCBhYm91dCBhZGRpbmc6Cj4+Cj4+IE5vdGUg
dGhhdCB3aGVuIHVzaW5nIHJ3IGxvY2tzIGEgd3JpdGVyIHdhbnRpbmcgdG8gdGFrZSB0aGUgbG9j
ayB3aWxsCj4+IHByZXZlbnQgZnVydGhlciByZWFkcyBmcm9tIGxvY2tpbmcgaXQsIGhlbmNlIHBy
ZXZlbnRpbmcgcmVhZGVycyBmcm9tCj4+IHN0YXJ2aW5nIHdyaXRlcnMuIFdyaXRlcnMgT1RPSCBj
b3VsZCBzdGFydmUgcmVhZGVycywgYnV0IHNpbmNlIHRoZQo+PiBsb2NrIGlzIG9ubHkgcGlja2Vk
IGluIHdyaXRlIG1vZGUgYnkgYWN0aW9ucyByZXF1ZXN0ZWQgYnkgcHJpdmlsZWdlZAo+PiBkb21h
aW5zIHN1Y2ggZW50aXRpZXMgYWxyZWFkeSBoYXZlIHRoZSBhYmlsaXR5IHRvIERvUyB0aGUgaHlw
ZXJ2aXNvcgo+PiBpbiBtYW55IG90aGVyIHdheXMuCj4gCj4gV2hpbGUgdGhpcyBzb3VuZHMgZmlu
ZSwgbXkgcHJpbWFyeSByZXF1ZXN0IHdhcyBtb3JlIHRvd2FyZHMgcmVtb3ZpbmcKPiAob3IgYXQg
bGVhc3QgbWFraW5nIGxlc3Mgc2NhcnkpIHRoZSBwYXJ0IGFib3V0IGRlYWRsb2Nrcy4KCkFjdHVh
bGx5LCBoYXZpbmcgdGhvdWdodCBhYm91dCB0aGlzIHNvbWUgbW9yZSBvdmVyIG5pZ2h0LCBJJ20g
ZmluZQp3aXRoIHRoZSBtZW50aW9uaW5nIG9mIHRoZSBkZWFkbG9jayBzY2VuYXJpbyBhcyB5b3Ug
aGF2ZSBpdCByaWdodCBub3cuCkknbSBub3Qgb3Zlcmx5IGZ1c3NlZCBhcyB0byB0aGUgYWRkaXRp
b24gKG9yIG5vdCkgb2YgdGhlIGFib3ZlIGV4dHJhCnBhcmFncmFwaC4KCkphbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
