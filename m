Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C369411E47B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 14:23:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifksI-0005qQ-GQ; Fri, 13 Dec 2019 13:20:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ifksH-0005qL-04
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 13:20:53 +0000
X-Inumbo-ID: 5d93fbcc-1dab-11ea-a914-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d93fbcc-1dab-11ea-a914-bc764e2007e4;
 Fri, 13 Dec 2019 13:20:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0372AAEB8;
 Fri, 13 Dec 2019 13:20:43 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <be16ddaa-ae99-f696-53c0-6a680ffa8504@suse.com>
 <083b525e-c6db-a94b-1c50-604e8798488b@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7eff12d8-ae10-331e-53b8-7239e8456c3a@suse.com>
Date: Fri, 13 Dec 2019 14:21:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <083b525e-c6db-a94b-1c50-604e8798488b@suse.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTIuMjAxOSAxNDoxMSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAxMy4xMi4xOSAx
Mzo1MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IENvbnRhaW5pbmcgc3RpbGwgaW4gZmxpZ2h0IERN
QSB3YXMgaW50cm9kdWNlZCB0byB3b3JrIGFyb3VuZCBjZXJ0YWluCj4+IGRldmljZXMgLyBzeXN0
ZW1zIGhhbmdpbmcgaGFyZCB1cG9uIGhpdHRpbmcgYW4gSU9NTVUgZmF1bHQuIFBhc3NpbmcKPj4g
dGhyb3VnaCAoc3VjaCkgZGV2aWNlcyAob24gc3VjaCBzeXN0ZW1zKSBpcyBpbmhlcmVudGx5IGlu
c2VjdXJlIChhcwo+PiBndWVzdHMgY291bGQgZWFzaWx5IGFycmFuZ2UgZm9yIElPTU1VIGZhdWx0
cyB0byBvY2N1cikuIERlZmF1bHRpbmcgdG8KPj4gYSBtb2RlIHdoZXJlIGFkbWlucyBtYXkgbm90
IGV2ZW4gYmVjb21lIGF3YXJlIG9mIGlzc3VlcyB3aXRoIGRldmljZXMgY2FuCj4+IGJlIGNvbnNp
ZGVyZWQgdW5kZXNpcmFibGUuIFRoZXJlZm9yZSBjb252ZXJ0IHRoaXMgbW9kZSBvZiBvcGVyYXRp
b24gdG8KPj4gYW4gb3B0aW9uYWwgb25lLCBub3Qgb25lIGVuYWJsZWQgYnkgZGVmYXVsdC4KPj4K
Pj4gVGhpcyBpbnZvbHZlcyByZXN1cnJlY3RpbmcgY29kZSBjb21taXQgZWEzODg2NzgzMWRhICgi
eDg2IC8gaW9tbXU6IHNldAo+PiB1cCBhIHNjcmF0Y2ggcGFnZSBpbiB0aGUgcXVhcmFudGluZSBk
b21haW4iKSBkaWQgcmVtb3ZlLCBpbiBhIHNsaWdodGx5Cj4+IGV4dGVuZGVkIGFuZCBhYnN0cmFj
dGVkIGZhc2hpb24uIEhlcmUsIGluc3RlYWQgb2YgcmVpbnRyb2R1Y2luZyBhIHByZXR0eQo+PiBw
b2ludGxlc3MgdXNlIG9mICJnb3RvIiBpbiBkb21haW5fY29udGV4dF91bm1hcCgpLCBhbmQgaW5z
dGVhZCBvZiBtYWtpbmcKPj4gdGhlIGZ1bmN0aW9uIChhdCBsZWFzdCB0ZW1wb3JhcmlseSkgaW5j
b25zaXN0ZW50LCB0YWtlIHRoZSBvcHBvcnR1bml0eQo+PiBhbmQgcmVwbGFjZSB0aGUgb3RoZXIg
c2ltaWxhcmx5IHBvaW50bGVzcyAiZ290byIgYXMgd2VsbC4KPj4KPj4gSW4gb3JkZXIgdG8ga2V5
IHRoZSByZS1pbnN0YXRlZCBieXBhc3NlcyBvZmYgb2YgdGhlcmUgKG5vdCkgYmVpbmcgYSByb290
Cj4+IHBhZ2UgdGFibGUgdGhpcyBmdXJ0aGVyIHJlcXVpcmVzIG1vdmluZyB0aGUgYWxsb2NhdGVf
ZG9tYWluX3Jlc291cmNlcygpCj4+IGludm9jYXRpb24gZnJvbSByZWFzc2lnbl9kZXZpY2UoKSB0
byBhbWRfaW9tbXVfc2V0dXBfZG9tYWluX2RldmljZSgpIChvcgo+PiBlbHNlIHJlYXNzaWduX2Rl
dmljZSgpIHdvdWxkIGFsbG9jYXRlIGEgcm9vdCBwYWdlIHRhYmxlIGFueXdheSk7IHRoaXMgaXMK
Pj4gYmVuaWduIHRvIHRoZSBzZWNvbmQgY2FsbGVyIG9mIHRoZSBsYXR0ZXIgZnVuY3Rpb24uCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gLS0t
Cj4+IEFzIGZhciBhcyA0LjEzIGlzIGNvbmNlcm5lZCwgSSBndWVzcyBpZiB3ZSBjYW4ndCBjb21l
IHRvIGFuIGFncmVlbWVudAo+PiBoZXJlLCB0aGUgb25seSBvdGhlciBvcHRpb24gaXMgdG8gcmV2
ZXJ0IGVhMzg4Njc4MzFkYSBmcm9tIHRoZSBicmFuY2gsCj4+IGZvciBoYXZpbmcgYmVlbiBjb21t
aXR0ZWQgcHJlbWF0dXJlbHkgKEknbSBub3Qgc28gbXVjaCB3b3JyaWVkIGFib3V0IHRoZQo+PiBt
YXN0ZXIgYnJhbmNoLCB3aGVyZSB3ZSBoYXZlIGFtcGxlIHRpbWUgdW50aWwgNC4xNCkuIFdoYXQg
SSBzdXJlbHkgd2FudAo+PiB0byBzZWUgdXMgYXZvaWQgaXMgYSBiYWNrIGFuZCBmb3J0aCBpbiBi
ZWhhdmlvciBvZiByZWxlYXNlZCB2ZXJzaW9ucy4KPj4gKE5vdGUgdGhhdCA0LjEyLjIgaXMgc2lt
aWxhcmx5IGJsb2NrZWQgb24gYSBkZWNpc2lvbiBlaXRoZXIgd2F5IGhlcmUuKQo+IAo+IEknbSBu
b3QgcmVhbGx5IHN1cmUgd2UgcmVhbGx5IG5lZWQgdG8gcmV2ZXJ0IGVhMzg4Njc4MzFkYSBiZWZv
cmUgdGhlCj4gNC4xMyByZWxlYXNlLiBJdCBtaWdodCBub3QgYmUgb3B0aW1hbCwgYnV0IEknbSBx
dWl0ZSBzdXJlIHRoZSBudW1iZXIgb2YKPiBjYXNlcyB3aGVyZSB0aGlzIGNvdWxkIGJlIGFuIGlz
c3VlIGlzIHJhdGhlciBzbWFsbCBhbHJlYWR5LCBhbmQgSSB0ZW5kCj4gdG8gYWdyZWUgd2l0aCBQ
YXVsIHRoYXQgYWRtaW5zIHdobyByZWFsbHkgY2FyZSB3aWxsIG1vcmUgbGlrZWx5IHdhbnQgdG8K
PiBzZWxlY3QgdGhlIG9wdGlvbiB3aGVyZSB0aGUgc3lzdGVtIHdpbGwgImp1c3Qgd29yayIuIElN
TyB0aGUgIm5vdGljZWFibGUKPiBmYWlsdXJlIiBpcyBzb21ldGhpbmcgd2hpY2ggd2lsbCBiZSBz
ZWxlY3RlZCBtb3N0bHkgYnkgZGV2ZWxvcGVycy4gQnV0Cj4gSSdtIG5vdCBhbiBleHBlcnQgaW4g
dGhhdCBhcmVhLCBzbyBJIGRvbid0IHdhbnQgdG8gaW5mbHVlbmNlIHRoZQo+IGRlY2lzaW9uIHJl
Z2FyZGluZyB0aGUgdG8gYmUgc2VsZWN0ZWQgZGVmYXVsdCB0b28gbXVjaC4KCkFuIGFkbWluIG5v
dCB3YW50aW5nIHRvIGtub3cgaXMsIHRvIG1lLCB0aGUgc2FtZSBhcyB0aGVtIG5vdCB3YW50aW5n
CnRvIGtub3cgYWJvdXQgc2VjdXJpdHkgaXNzdWVzLCBhbmQgaGVuY2Ugbm90IHN1YnNjcmliaW5n
IHRvIG91cgphbm5vdW5jZW1lbnRzIGxpc3RzLiBJIGNhbiBhY2NlcHQgdGhpcyBiZWluZyBhIHJl
YXNvbmFibGUgdGhpbmcgdG8KZG8gd2hlbiBpdCBpcyBhbiBfaW5mb3JtZWRfIGRlY2lzaW9uLiBC
dXQgd2l0aCB0aGUgY3VycmVudAphcnJhbmdlbWVudHMgdGhlcmUncyBubyB3YXkgd2hhdHNvZXZl
ciBmb3IgYW4gYWRtaW4gdG8ga25vdy4KCkZ1cnRoZXJtb3JlLCBvbmNlIHdlIHNoaXAgYSByZWxl
YXNlIHdpdGggdGhlIGRlZmF1bHRzIGFzIHRoZXkKY3VycmVudGx5IGFyZSwgY2hhbmdpbmcgdGhl
IGRlZmF1bHRzIGFnYWluIG1heSBiZSBwZXJjZWl2ZWQgYXMgYQpyZWdyZXNzaW9uLCB3aGljaCBJ
IHRoaW5rIHdlIHNob3VsZCAod2FudCB0bykgYXZvaWQuCgo+IEluIGNhc2Ugd2UgaGF2ZSBhIHN1
Y2Nlc3NmdWwgT1NTdGVzdCBydW4gc29vbiBJIHBsYW5uZWQgdG8gZG8gdGhlCj4gcmVsZWFzZSB3
aXRob3V0IHRoaXMgcGF0Y2guCgpJIHZlcnkgbXVjaCBkaXNhZ3JlZSAtIHRoZSBwYXRjaCBzaG91
bGRuJ3QgaGF2ZSBiZWVuIHB1dCBpbiB3aXRob3V0CmhhdmluZyBoZWFyZCBiYWNrIGZyb20gS2V2
aW4uIEJ1dCB5ZXMsIHlvdSdyZSB0aGUgcmVsZWFzZSBtYW5hZ2VyLgoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
