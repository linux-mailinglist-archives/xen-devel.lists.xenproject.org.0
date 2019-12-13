Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E2C11E4E5
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 14:50:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iflHj-0008N3-0F; Fri, 13 Dec 2019 13:47:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nbPo=2D=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iflHh-0008My-20
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 13:47:09 +0000
X-Inumbo-ID: 08d4de22-1daf-11ea-b6f1-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08d4de22-1daf-11ea-b6f1-bc764e2007e4;
 Fri, 13 Dec 2019 13:46:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C5130AC54;
 Fri, 13 Dec 2019 13:46:58 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <be16ddaa-ae99-f696-53c0-6a680ffa8504@suse.com>
 <083b525e-c6db-a94b-1c50-604e8798488b@suse.com>
 <7eff12d8-ae10-331e-53b8-7239e8456c3a@suse.com>
 <dd23ae64-24df-e3bb-351f-fe577e61c6df@suse.com>
 <bcacb731-a3cb-3552-a1a0-338c619ee64d@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <f1f63340-d894-30d7-c0d2-caa0f826173b@suse.com>
Date: Fri, 13 Dec 2019 14:46:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <bcacb731-a3cb-3552-a1a0-338c619ee64d@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] IOMMU: make DMA containment of
 quarantined devices optional
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
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTIuMTkgMTQ6MzgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDEzLjEyLjIwMTkgMTQ6
MzEsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDEzLjEyLjE5IDE0OjIxLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDEzLjEyLjIwMTkgMTQ6MTEsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+
Pj4gT24gMTMuMTIuMTkgMTM6NTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBDb250YWluaW5n
IHN0aWxsIGluIGZsaWdodCBETUEgd2FzIGludHJvZHVjZWQgdG8gd29yayBhcm91bmQgY2VydGFp
bgo+Pj4+PiBkZXZpY2VzIC8gc3lzdGVtcyBoYW5naW5nIGhhcmQgdXBvbiBoaXR0aW5nIGFuIElP
TU1VIGZhdWx0LiBQYXNzaW5nCj4+Pj4+IHRocm91Z2ggKHN1Y2gpIGRldmljZXMgKG9uIHN1Y2gg
c3lzdGVtcykgaXMgaW5oZXJlbnRseSBpbnNlY3VyZSAoYXMKPj4+Pj4gZ3Vlc3RzIGNvdWxkIGVh
c2lseSBhcnJhbmdlIGZvciBJT01NVSBmYXVsdHMgdG8gb2NjdXIpLiBEZWZhdWx0aW5nIHRvCj4+
Pj4+IGEgbW9kZSB3aGVyZSBhZG1pbnMgbWF5IG5vdCBldmVuIGJlY29tZSBhd2FyZSBvZiBpc3N1
ZXMgd2l0aCBkZXZpY2VzIGNhbgo+Pj4+PiBiZSBjb25zaWRlcmVkIHVuZGVzaXJhYmxlLiBUaGVy
ZWZvcmUgY29udmVydCB0aGlzIG1vZGUgb2Ygb3BlcmF0aW9uIHRvCj4+Pj4+IGFuIG9wdGlvbmFs
IG9uZSwgbm90IG9uZSBlbmFibGVkIGJ5IGRlZmF1bHQuCj4+Pj4+Cj4+Pj4+IFRoaXMgaW52b2x2
ZXMgcmVzdXJyZWN0aW5nIGNvZGUgY29tbWl0IGVhMzg4Njc4MzFkYSAoIng4NiAvIGlvbW11OiBz
ZXQKPj4+Pj4gdXAgYSBzY3JhdGNoIHBhZ2UgaW4gdGhlIHF1YXJhbnRpbmUgZG9tYWluIikgZGlk
IHJlbW92ZSwgaW4gYSBzbGlnaHRseQo+Pj4+PiBleHRlbmRlZCBhbmQgYWJzdHJhY3RlZCBmYXNo
aW9uLiBIZXJlLCBpbnN0ZWFkIG9mIHJlaW50cm9kdWNpbmcgYSBwcmV0dHkKPj4+Pj4gcG9pbnRs
ZXNzIHVzZSBvZiAiZ290byIgaW4gZG9tYWluX2NvbnRleHRfdW5tYXAoKSwgYW5kIGluc3RlYWQg
b2YgbWFraW5nCj4+Pj4+IHRoZSBmdW5jdGlvbiAoYXQgbGVhc3QgdGVtcG9yYXJpbHkpIGluY29u
c2lzdGVudCwgdGFrZSB0aGUgb3Bwb3J0dW5pdHkKPj4+Pj4gYW5kIHJlcGxhY2UgdGhlIG90aGVy
IHNpbWlsYXJseSBwb2ludGxlc3MgImdvdG8iIGFzIHdlbGwuCj4+Pj4+Cj4+Pj4+IEluIG9yZGVy
IHRvIGtleSB0aGUgcmUtaW5zdGF0ZWQgYnlwYXNzZXMgb2ZmIG9mIHRoZXJlIChub3QpIGJlaW5n
IGEgcm9vdAo+Pj4+PiBwYWdlIHRhYmxlIHRoaXMgZnVydGhlciByZXF1aXJlcyBtb3ZpbmcgdGhl
IGFsbG9jYXRlX2RvbWFpbl9yZXNvdXJjZXMoKQo+Pj4+PiBpbnZvY2F0aW9uIGZyb20gcmVhc3Np
Z25fZGV2aWNlKCkgdG8gYW1kX2lvbW11X3NldHVwX2RvbWFpbl9kZXZpY2UoKSAob3IKPj4+Pj4g
ZWxzZSByZWFzc2lnbl9kZXZpY2UoKSB3b3VsZCBhbGxvY2F0ZSBhIHJvb3QgcGFnZSB0YWJsZSBh
bnl3YXkpOyB0aGlzIGlzCj4+Pj4+IGJlbmlnbiB0byB0aGUgc2Vjb25kIGNhbGxlciBvZiB0aGUg
bGF0dGVyIGZ1bmN0aW9uLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiBBcyBmYXIgYXMgNC4xMyBpcyBjb25j
ZXJuZWQsIEkgZ3Vlc3MgaWYgd2UgY2FuJ3QgY29tZSB0byBhbiBhZ3JlZW1lbnQKPj4+Pj4gaGVy
ZSwgdGhlIG9ubHkgb3RoZXIgb3B0aW9uIGlzIHRvIHJldmVydCBlYTM4ODY3ODMxZGEgZnJvbSB0
aGUgYnJhbmNoLAo+Pj4+PiBmb3IgaGF2aW5nIGJlZW4gY29tbWl0dGVkIHByZW1hdHVyZWx5IChJ
J20gbm90IHNvIG11Y2ggd29ycmllZCBhYm91dCB0aGUKPj4+Pj4gbWFzdGVyIGJyYW5jaCwgd2hl
cmUgd2UgaGF2ZSBhbXBsZSB0aW1lIHVudGlsIDQuMTQpLiBXaGF0IEkgc3VyZWx5IHdhbnQKPj4+
Pj4gdG8gc2VlIHVzIGF2b2lkIGlzIGEgYmFjayBhbmQgZm9ydGggaW4gYmVoYXZpb3Igb2YgcmVs
ZWFzZWQgdmVyc2lvbnMuCj4+Pj4+IChOb3RlIHRoYXQgNC4xMi4yIGlzIHNpbWlsYXJseSBibG9j
a2VkIG9uIGEgZGVjaXNpb24gZWl0aGVyIHdheSBoZXJlLikKPj4+Pgo+Pj4+IEknbSBub3QgcmVh
bGx5IHN1cmUgd2UgcmVhbGx5IG5lZWQgdG8gcmV2ZXJ0IGVhMzg4Njc4MzFkYSBiZWZvcmUgdGhl
Cj4+Pj4gNC4xMyByZWxlYXNlLiBJdCBtaWdodCBub3QgYmUgb3B0aW1hbCwgYnV0IEknbSBxdWl0
ZSBzdXJlIHRoZSBudW1iZXIgb2YKPj4+PiBjYXNlcyB3aGVyZSB0aGlzIGNvdWxkIGJlIGFuIGlz
c3VlIGlzIHJhdGhlciBzbWFsbCBhbHJlYWR5LCBhbmQgSSB0ZW5kCj4+Pj4gdG8gYWdyZWUgd2l0
aCBQYXVsIHRoYXQgYWRtaW5zIHdobyByZWFsbHkgY2FyZSB3aWxsIG1vcmUgbGlrZWx5IHdhbnQg
dG8KPj4+PiBzZWxlY3QgdGhlIG9wdGlvbiB3aGVyZSB0aGUgc3lzdGVtIHdpbGwgImp1c3Qgd29y
ayIuIElNTyB0aGUgIm5vdGljZWFibGUKPj4+PiBmYWlsdXJlIiBpcyBzb21ldGhpbmcgd2hpY2gg
d2lsbCBiZSBzZWxlY3RlZCBtb3N0bHkgYnkgZGV2ZWxvcGVycy4gQnV0Cj4+Pj4gSSdtIG5vdCBh
biBleHBlcnQgaW4gdGhhdCBhcmVhLCBzbyBJIGRvbid0IHdhbnQgdG8gaW5mbHVlbmNlIHRoZQo+
Pj4+IGRlY2lzaW9uIHJlZ2FyZGluZyB0aGUgdG8gYmUgc2VsZWN0ZWQgZGVmYXVsdCB0b28gbXVj
aC4KPj4+Cj4+PiBBbiBhZG1pbiBub3Qgd2FudGluZyB0byBrbm93IGlzLCB0byBtZSwgdGhlIHNh
bWUgYXMgdGhlbSBub3Qgd2FudGluZwo+Pj4gdG8ga25vdyBhYm91dCBzZWN1cml0eSBpc3N1ZXMs
IGFuZCBoZW5jZSBub3Qgc3Vic2NyaWJpbmcgdG8gb3VyCj4+PiBhbm5vdW5jZW1lbnRzIGxpc3Rz
LiBJIGNhbiBhY2NlcHQgdGhpcyBiZWluZyBhIHJlYXNvbmFibGUgdGhpbmcgdG8KPj4+IGRvIHdo
ZW4gaXQgaXMgYW4gX2luZm9ybWVkXyBkZWNpc2lvbi4gQnV0IHdpdGggdGhlIGN1cnJlbnQKPj4+
IGFycmFuZ2VtZW50cyB0aGVyZSdzIG5vIHdheSB3aGF0c29ldmVyIGZvciBhbiBhZG1pbiB0byBr
bm93Lgo+Pgo+PiBNYXliZSBJIGhhdmUgbWlzdW5kZXJzdG9vZCB0aGUgY3VycmVudCBzdGF0ZSwg
YnV0IEkgdGhvdWdodCB0aGF0IGl0Cj4+IHdvdWxkIGp1c3Qgc2lsZW50bHkgaGlkZSBxdWlya3kg
ZGV2aWNlcyB3aXRob3V0IGltcG9zaW5nIGEgc2VjdXJpdHkKPj4gcmlzay4gV2Ugd291bGQgbm90
IGxlYXJuIHdoaWNoIGRldmljZXMgYXJlIHF1aXJreSwgYnV0IE9UT0ggSSBkb3VidAo+PiB3ZSdk
IGdldCBtYW55IHJlcG9ydHMgYWJvdXQgdGhvc2UgaW4gY2FzZSB5b3VyIHBhdGNoIGdvZXMgaW4u
Cj4gCj4gV2UgZG9uJ3Qgd2FudCBvciBuZWVkIHN1Y2ggcmVwb3J0cywgdGhhdCdzIG5vdCB0aGUg
cG9pbnQuIFRoZQo+IHNlY3VyaXR5IHJpc2sgY29tZXMgZnJvbSB0aGUgcXVpcmtpbmVzcyBvZiB0
aGUgZGV2aWNlcyAtIGFkbWlucwo+IG1heSB3cm9uZ2x5IHRoaW5rIGFsbCBpcyB3ZWxsIGFuZCBl
eHBvc2UgcXVpcmt5IGRldmljZXMgdG8gbm90Cj4gc3VmZmljaWVudGx5IHRydXN0ZWQgZ3Vlc3Rz
LiAoSSBzYXkgdGhpcyBmdWxseSByZWFsaXppbmcgdGhhdAo+IGV4cG9zaW5nIGRldmljZXMgdG8g
dW50cnVzdGVkIGd1ZXN0cyBpcyBhbG1vc3QgYWx3YXlzIGEgY2VydGFpbgo+IGxldmVsIG9mIHJp
c2suKQoKRG8gd2UgX2tub3dfIHRob3NlIGRldmljZXMgYXJlIHByb2JsZW1hdGljIGZyb20gc2Vj
dXJpdHkgc3RhbmRwb2ludD8KTm9ybWFsbHkgdGhlIElPTU1VIHNob3VsZCBkbyB0aGUgaXNvbGF0
aW9uIGp1c3QgZmluZS4gSWYgaXQgZG9lc24ndAp0aGVuIGl0cyBub3QgdGhlIHF1aXJreSBkZXZp
Y2Ugd2hpY2ggaXMgcHJvYmxlbWF0aWMsIGJ1dCB0aGUgSU9NTVUuCgpJIHRob3VnaHQgdGhlIHBy
b2JsZW0gd2FzIHRoYXQgdGhlIHF1aXJreSBkZXZpY2VzIHdvdWxkIG5vdCBzdG9wIGFsbAoocmVh
ZCkgRE1BIGV2ZW4gd2hlbiBiZWluZyB1bmFzc2lnbmVkIGZyb20gdGhlIGd1ZXN0IHJlc3VsdGlu
ZyBpbgpmYXRhbCBJT01NVSBmYXVsdHMuIFRoZSBkdW1teSBwYWdlIHNob3VsZCBzdG9wIHRob3Nl
IGZhdWx0cyB0byBoYXBwZW4KcmVzdWx0aW5nIGluIGEgbW9yZSBzdGFibGUgc3lzdGVtLgoKU28g
d2hhdCBhcmUgdGhlIHNlY3VyaXR5IHByb2JsZW1zIHdoaWNoIGFyZSBhZGRlZCBieSB0aGlzIGJl
aGF2aW9yPwoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
