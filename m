Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5097AF7394
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2019 13:05:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iU8Pn-0005za-9x; Mon, 11 Nov 2019 12:03:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FJf4=ZD=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1iU8Pl-0005zV-Ot
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2019 12:03:25 +0000
X-Inumbo-ID: 42155be6-047b-11ea-a20c-12813bfff9fa
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 42155be6-047b-11ea-a20c-12813bfff9fa;
 Mon, 11 Nov 2019 12:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2NoZwzescR2/snrDTgImgAXz3tXb17C3GSQpJeI4iio=; b=X5EaPV4fwo/reJ+taCJmdqjkpe
 Q2F94qD4oO+DZW3IZ6s2AKvnZwXRKg4jPUsXqD6JVBg5DZpYp24gVllEBSYS0/vjw+45ab86TjjaD
 IeI5MFGICuv/fZXSLAmc3EZBQQyn4v1p7sJexh2ZHgFdmlGD/3WfDJIBSqDMJz1m91O0=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:47825
 helo=[10.97.34.6]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1iU8QY-0008Ck-J2; Mon, 11 Nov 2019 13:04:14 +0100
To: Ian Jackson <ian.jackson@citrix.com>
References: <20191108185001.3319-1-ian.jackson@eu.citrix.com>
 <1095f982-8336-0e85-8245-0d74467e2895@eikelenboom.it>
 <24009.16196.627425.877118@mariner.uk.xensource.com>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <46208d46-a203-2a4a-824f-e4962e9c8b91@eikelenboom.it>
Date: Mon, 11 Nov 2019 13:03:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <24009.16196.627425.877118@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [OSSTEST PATCH 00/13] Speed up and restore host
 history
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMTEvMjAxOSAxMjowMCwgSWFuIEphY2tzb24gd3JvdGU6Cj4gU2FuZGVyIEVpa2VsZW5i
b29tIHdyaXRlcyAoIlJlOiBbWGVuLWRldmVsXSBbT1NTVEVTVCBQQVRDSCAwMC8xM10gU3BlZWQg
dXAgYW5kIHJlc3RvcmUgaG9zdCBoaXN0b3J5Iik6Cj4+IE5vdCBtZW5kIHRvIGJpa2Ugc2hlZCwg
c28ganVzdCBmb3IgY29uc2lkZXJhdGlvbjoKPiAKPiBTdWdnZXN0aW9ucyBhcmUgdmVyeSB3ZWxj
b21lLiAgQmUgY2FyZWZ1bCwgSSdtIHN0aWxsIGxvb2tpbmcgZm9yIGEKPiBjby1tYWludGFpbmVy
IDotKS4KL21lIGlzIGR1Y2tpbmcgdW5kZXIgdGhlIHRhYmxlIDspClNlZW1zIHRvIGJlIHF1aXRl
IGEgbG90IG9mIGludHJhY2F0ZSBQZXJsLCBJIG5ldmVyIHdhcyBhIHByaW5jZSBvZiBQZXJsCmFu
ZCB0aGF0IGhhc24ndCBnb3QgYW55IGJldHRlciBieSBub3QgdXNpbmcgaXQgYWN0aXZlbHkgdGhl
IHBhc3QgeWVhcnMuCgo+PiAtIEhhdmUgeW91IGNvbnNpZGVyZWQgKGlubGluZSkgY3NzIGZvciB0
aGUgYmFja2dyb3VuZCBjb2xvdXJpbmcsIG9yIGRvZXMKPj4gICBpdCBoYXZlIHRvIGJlIGh0bWwg
b25seSAgPwo+IAo+IFRoZXJlIGlzIG5vIHBhcnRpY3VsYXIgcmVhc29uIHdoeSBpdCBzaG91bGRu
J3QgYmUgQ1NTLiAgSXMgdGhlcmUgYQo+IHJlYXNvbiB3aHkgZG9pbmcgaXQgaW4gaHRtbCBjYXVz
ZXMgcHJvYmxlbXMgZm9yIHlvdSA/CgpOb3QgcmVhbGx5LCBidXQgZXNwZWNpYWxseSBhcHBseWlu
ZyBzdHlsZSB0byBhbHRlcm5hdGluZyByb3dzIGlzIG5vdwpxdWl0ZSBzaW1wbGUgd2l0aCBwc2V1
ZG8gY2xhc3NlczoKCiB0cjpudGgtY2hpbGQoZXZlbil7CiAgIGJhY2tncm91bmQtY29sb3I6IGdy
ZXk7CiB9CgogdHI6bnRoLWNoaWxkKGV2ZW4pewogICBiYWNrZ3JvdW5kLWNvbG9yOiB3aGl0ZTsK
IH0KCllvdSBjb3VsZCBzdHVmZiB0aGlzIGluIGEgPGhlYWQ+PHN0eWxlPiAuLi4gPC9zdHlsZT48
L2hlYWQ+LApzbyB5b3UgZG9uJ3QgaGF2ZSB0byByZXBlYXQgdGhpcyBldmVyeSByb3cgZm9yIHRo
ZSBjb21tb24gY2FzZS4KRm9yIGFueSBzcGVjaWFsIGNhc2VzIHlvdSBjb3VsZCBvdmVycnVsZSBi
YXNlZCBvbiBjbGFzcy4KSSBoYXBwZW4gdG8gZmluZCBpdCBvbmUgb2YgdGhlIG1vc3QgdXNlZnVs
IENTUyBmZWF0dXJlcy4KCmh0dHBzOi8vd3d3LnczLm9yZy93aWtpL0NTUy9TZWxlY3RvcnMvcHNl
dWRvLWNsYXNzZXMvOm50aC1jaGlsZAoKPiBUaGUgYmFja2dyb3VuZCBjb2xvdXJzIGZvciB0aGUg
Y2VsbHMgYXJlIG1hZGUgd2l0aAo+ICAgcmVwb3J0X2FsdGNvbG91cgo+ICAgcmVwb3J0X2FsdGNo
YW5nZWNvbG91cgo+IGluIE9zc3Rlc3QvRXhlY3V0aXZlLnBtLgo+IAo+IHJlcG9ydF9hbHRjb2xv
dXIgcmV0dXJucyBzb21ldGhpbmcgdGhhdCBjYW4gYmUgcHV0IGludG8gYW4gZWxlbWVudAo+IG9w
ZW4gdGFnLCBnaXZlbiBhIGRlZmluaXRlIGluZGljYXRpb24gb2Ygd2hldGhlciB0aGUgY29sb3Vy
IHNob3VsZCBiZQo+IHBhbGVyIG9yIGRhcmtlci4KPiAKPiByZXBvcnRfYWx0Y2hhbmdlY29sb3Vy
IGlzIHVzZWQgdG8gcHJvZHVjZSBiYWNrZ3JvdW5kIGNvbG91cnMgd2hpY2gKPiBjaGFuZ2Ugd2hl
biB0aGUgdmFsdWUgaW4gdGhlIGNlbGwgY2hhbmdlcy4KPiAKPiBJIHRoaW5rIGl0IHdvdWxkIGJl
IGVhc3kgdG8gcmVwbGFjZSBiZ2NvbG91cj0gd2l0aCBzb21lIGFwcHJvcHJpYXRlCj4gc3R5bGU9
IGFuZCBzb21lIENTUy4gIFBhdGNoZXMgLSBldmVuIHZlcnkgcm91Z2ggb25lcyAtIHdlbGNvbWUu
Cj4gCj4+IC0gQW5kIGZvciBjYWNoaW5nIHBlcmhhcHMgYSBtYXRlcmlhbGl6ZWQgdmlldyB3aXRo
IGFnZ3JlZ2F0ZWQgZGF0YSBvbmx5Cj4+ICAgcmVmcmVzaGVkIGF0IGEgbW9yZSBjb252aWVudCB0
aW1lIGNvdWxkIHBlcmhhcHMgaGVscCBhdCB0aGUgZGF0YWJhc2UKPj4gICBsZXZlbCA/Cj4gCj4g
TWF5YmUsIGJ1dCBjdXJyZW50bHkgdGhlIGFyY2hhZW9sb2d5IGFsZ29yaXRobSBpcyBub3QgZXhw
cmVzc2VkCj4gZW50aXJlbHkgaW4gU1FMIHNvIGl0IGNvdWxkbid0IGJlIGEgbWF0ZXJpYWxpc2Vk
IHZpZXcuICBBbmQgY29udmVydGluZwo+IGl0IHRvIFNRTCB3b3VsZCBiZSBhbm5veWluZyBiZWNh
dXNlIFNRTCBpcyBhIHJhdGhlciBwb29yIHByb2dyYW1taW5nCj4gbGFuZ3VhZ2UuCgpJdCBpcyBh
IHBvb3IgcHJvZ3JhbW1pbmcgbGFuZ3VhZ2UsIGJ1dCBpdCBpcyB2ZXJ5IGdvb2QgYXQgcmV0cmll
dmluZyBhbmQKbW9kaWZ5aW5nIGRhdGEuIFNvbWV0aW1lcyBpdCB0YWtlcyBzb21lIGVmZm9ydCB0
byB3cmFwIHlvdXIgaGVhZCBhcm91bmQKdGhlIHdheSB5b3UgaGF2ZSB0byBzcGVjaWZ5IHdoYXQg
ZGF0YSB5b3Ugd2FudCBhbmQgaW4gd2hhdCBmb3IsIHdpdGhvdXQKYmVpbmcgdG8gZXhwbGljaXQg
aW4gaG93IGl0IGlzIHN1cHBvc2VkIHRvIGJlIHJldHJpZXZlZC4KCj4gSXQgbWlnaHQgYmUgcG9z
c2libGUgdG8sIGluc3RlYWQsIGhhdmUgdGFibGUocykgY29udGFpbmluZyBhcmNoYWVvbG9neQo+
IHJlc3VsdHMuICBJIGhhZG4ndCByZWFsbHkgcHJvcGVybHkgY29uc2lkZXJlZCB0aGF0IHBvc3Np
YmlsaXR5LiAgVGhhdAo+IG1pZ2h0IHdlbGwgaGF2ZSBiZWVuIGEgYmV0dGVyIGFwcHJvYWNoLiAg
U28gdGhhbmsgeW91IGZvciB5b3VyIGhlbHBmdWwKPiBwcm9tcHQuICBJIHdpbGwgZGVmaW5pdGVs
eSBiZWFyIHRoaXMgaW4gbWluZCBmb3IgdGhlIGZ1dHVyZS4KCklmIEkgcmVtZW1iZXIgY29ycmVj
dGx5IFBvc3RncmVzIGlzIGJlaW5nIHVzZWQsIHBlcmhhcHMgdGhlcmUgaXMgc3R1bGwKc29tZSBy
ZWxhdGl2ZWx5IGxvdyBoYW5naW5nIGZydWl0IHdoZW4gYW5hbHl6aW5nIHRoZSBwZXJmb3JtYW5j
ZSBvZiB0aGUKcXVlcmllcyB5b3UgcnVuIGF0IHRoZSBhY3R1YWwgZGF0YS4KCj4gSSdtIG5vdCBz
dXJlIEkgZmVlbCBsaWtlIHJlZW5naW5lZXJpbmcgdGhpcyBwYXJ0aWN1bGFyIHNlcmllcyBhdCB0
aGlzCj4gdGltZSwgdGhvdWdoLiAgT25lIHJlYXNvbiAoYXBhcnQgZnJvbSB0aGF0IEkndmUgZG9u
ZSBpdCBsaWtlIHRoaXMgbm93KQo+IGlzIHRoYXQgdGhlIGN1cnJlbnQgYXBwcm9hY2ggaGFzIHRo
ZSBhZHZhbnRhZ2UgdGhhdCBpdCBkb2Vzbid0IG5lZWQgYQo+IERCIHNjaGVtYSBjaGFuZ2UuICBJ
IGhhdmUgYSBzeXN0ZW0gZm9yIGRvaW5nIHNjaGVtYSBjaGFuZ2VzIGJ1dCB0aGV5Cj4gYWRkIHJp
c2sgYW5kIEkgZG9uJ3Qgd2FudCB0byBkbyB0aGF0IGluIHRoZSBYZW4gcmVsZWFzZSBmcmVlemUu
CgpJIHVuZGVyc3RhbmQsIGFuZCBJIGNvbmN1ciB0aGF0IHRoYXQgaXMgcHJvYmFibHkgdGhlIGJl
c3QgYXQgdGhlIG1vbWVudC4KCkkgd2lsbCB0YWtlIGEgbG9vayBhdCB0aGUgY29kZSBzb21ld2hl
cmUgdGhpcyBvciBuZXh0IHdlZWsgYW5kIHNlZSBpZiBJCmNhbiBnZXQgYW55IGZhbWlsaWFyaXR5
IHdpdGggaXQgYW5kIHBlcmhhcHMgZW5kIHVwIHdpdGggc29tZSBjb250cmlidXRpb25zLgoKLS0K
U2FuZGVyCgo+IFJlZ2FyZHMsCj4gSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
