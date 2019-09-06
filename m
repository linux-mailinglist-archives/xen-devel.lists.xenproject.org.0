Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C1BAB823
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 14:29:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6DJX-0004lB-T2; Fri, 06 Sep 2019 12:26:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YHqG=XB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i6DJW-0004l6-Tz
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 12:26:06 +0000
X-Inumbo-ID: 7f4916fa-d0a1-11e9-978d-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f4916fa-d0a1-11e9-978d-bc764e2007e4;
 Fri, 06 Sep 2019 12:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567772766;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=khrbk4HdKazIC9vrhun6xeHfsSLoQHlwb6QlnWD1TE0=;
 b=XwCRZg1ViWQ5By+U/OPUSjD/Rbclv55ETxNyQqqfrzRUPPpSeYTu1Sjz
 5nFxH7vHFHyT9lvJ3lWy01NqjHARQDpIIfSRz0+B7duk+/VDW1AeJLFF/
 WJZmCyxNndfBKovGiQoH1CRNOT/aa1klXbcIMUnk81mTT1DZkG8BdF/sv I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 42rpxqNc65POJ5TWlsPTNQK+0dnzwMwNYPbRkG9vPRVNQGFSG7UXz8bisIx7FWBkpXcJd+BxxT
 AFtZ8L2Ho7CXlV1GlJT9qIrfmoB22KZlcJDONTULW471KPyrIQ+31pMcvsQDFG/j/0clJmt5Qu
 Flx6yf964eoCgFS0TcTCITCXDtu5fPiHNj61ON8VtBQfU1T2daIgIm8mcOVpRj6obdBghU6mPQ
 GGlO2rKv/Ai7dbRaTYC1du57woc78GNeG+cyECUKb2oQloPtsa3O4N2euIVODHfPWLkS53sbnL
 6I0=
X-SBRS: 2.7
X-MesageID: 5283438
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,473,1559534400"; 
   d="scan'208";a="5283438"
To: George Dunlap <george.dunlap@citrix.com>, xen-devel
 <xen-devel@lists.xenproject.org>
References: <97e1bfe4-3383-ff1d-bf61-48b8aa63bb2c@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <0c9a4556-d7f7-ef43-f854-1176e02ff122@citrix.com>
Date: Fri, 6 Sep 2019 13:26:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <97e1bfe4-3383-ff1d-bf61-48b8aa63bb2c@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] RFC: Criteria for checking in core scheduling series
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
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>,
 Dario Faggioli <dario.faggioli@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYvMDkvMjAxOSAxMjowOSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBUaGVyZSB3YXMgYSBk
aXNjdXNzaW9uIG9uIHRoZSBjb21tdW5pdHkgY2FsbCBhYm91dCB0aGUgY29yZSBzY2hlZHVsaW5n
Cj4gc2VyaWVzIGJlaW5nIGRldmVsb3BlZCBieSBKdWVyZ2VuIEdyb3NzIFsxXS4gIFRoZSBjb25j
bHVzaW9uIGNhbiBiZQo+IHN1bW1hcml6ZWQgYXMgZm9sbG93czoKPgo+ICogV2Ugbm9ybWFsbHkg
d2FpdCB0byBjaGVjayBpbiBzZXJpZXMgdW50aWwgdGhleSBhcmUgcXVpdGUgZ29vZCAtLSBhbGwK
PiB0aGUgaSdzIGRvdHRlZCBhbmQgYWxsIHRoZSB0J3MgY3Jvc3NlZAo+Cj4gKiBUaGlzIGlzIGZv
ciBzZXZlcmFsIHJlYXNvbnM7IHByaW1hcmlseSBiZWNhdXNlIG9uY2UgY29kZSBnZXRzIGNoZWNr
ZWQKPiBpbiwgaXQgcmFyZWx5IGdldHMgbG9va2VkIGF0IGFnYWluLiAgSW4gcGFydGljdWxhciwg
dGhlcmUncyBub3RoaW5nCj4gc3RvcHBpbmcgdGhlIHN1Ym1pdHRlciBmcm9tIG5lZ2xlY3Rpbmcg
dG8gZG8gaW1wb3J0YW50IGNsZWFuLXVwcywgaW4KPiBzcGl0ZSBvZiB0aGVpciBiZXN0IGludGVu
dGlvbnM7IGxlYXZpbmcgdGhlIG1haW50YWluZXIgb3IgdGhlIHJlc3Qgb2YKPiB0aGUgY29tbXVu
aXR5IHRvIGRvIGl0Lgo+Cj4gKiBIb3dldmVyLCBmb3IgcGFydGljdWxhcmx5IGxvbmcsIGNvbXBs
aWNhdGVkIHNlcmllcyBsaWtlIHRoZSBjb3JlCj4gc2NoZWR1bGluZyBzZXJpZXMsIHRoaXMgY2Fu
IGhhdmUgc2lnbmlmaWNhbnQgZG93bnNpZGVzLiAgUmViYXNpbmcgYQo+IDYwLXBhdGNoIGJyYW5j
aCByZWd1bGFybHkgaXMgYSBsb3Qgb2YgY2h1cm4gZm9yIGxpdHRsZSB2YWx1ZTsgYW5kIGNvcmUK
PiBwYXJ0cyBvZiB0aGUgc2VyaWVzIHdoaWNoIGFyZSBtb3N0bHkgY29tcGxldGUgYXJlIGN1cnJl
bnRseSBvbmx5IGdldHRpbmcKPiBzcG9yYWRpYyBkZXYgdGVzdGluZyByYXRoZXIgdGhhbiB0aGUg
d2lkZSByYW5nZSBvZiB0ZXN0aW5nIHRoZXkgd291bGQKPiBnZXQgZnJvbSBiZWluZyBpbiBzdGFn
aW5nLgo+Cj4gKiBYZW5TZXJ2ZXIgYW5kIFN1U0UgYXJlIGJvdGggbG9uZy10ZXJtIGNvbW11bml0
eSBtZW1iZXJzIHdpdGggYSBzdHJvbmcKPiBpbmNlbnRpdmUgdG8gbWFpbnRhaW4gYW5kIGltcHJv
dmUgdGhlIGZlYXR1cmU7IHNvIHRoZSByaXNrIG9mIHRoZQo+IGZlYXR1cmUgYmVpbmcgbGVmdCBm
b3IgdGhlIGNvbW11bml0eSB0byBtYWludGlhbiBpcyByZWxhdGl2ZWx5IG5vdy4KPgo+IFdpdGgg
YWxsIHRob3NlIHRoaW5ncyBpbiBtaW5kLCB0aGUgY29uY2x1c2lvbiB3YXMgdG8gbG93ZXIgdGhl
Cj4gImNoZWNrLWluIiB0aHJlc2hvbGQgZnJvbSB3aGF0IGl0IG5vcm1hbGx5IGlzLCBpbiBvcmRl
ciB0byBhbGxvdyB0aGUKPiBzZXJpZXMgdG8gYmUgY2hlY2tlZCBpbiBpbiB0aGUgbmVhciBmdXR1
cmUsIGluIGVub3VnaCB0aW1lIGF0IGxlYXN0IGZvcgo+IHRoZSAiZGVmYXVsdCBvZmYiIHRvIGJl
IHdlbGwtdGVzdGVkIGJ5IHRoZSA0LjEzIHJlbGVhc2UuCj4KPiBUaGUgY3JpdGVyaWEgd2Ugc2tl
dGNoZWQgb3V0IHdlcmU6Cj4KPiAqIEFsbCB0aGUgcGF0Y2hlcyBzdGlsbCBuZWVkIGFwcHJvcHJp
YXRlIEFjayAvIFItYidzCj4KPiAqIFRoZXJlIHNob3VsZCBiZSByZWFzb24gdG8gYmVsaWV2ZSB0
aGF0IHRoZSBzZXJpZXMgd2lsbCBoYXZlIGxpdHRsZSB0bwo+IG5vIGltcGFjdCBvbiAidGhyZWFk
IG1vZGUiICh0aHJlYWRzIGJlaW5nIHRoZSB1bml0IG9mIHNjaGVkdWxpbmc7IGkuZS4sCj4gdGhl
IHN0YXR1cyBxdW8pCj4KPiBXUlQgdGhlIHNlY29uZCBwb2ludCwgYXBwYXJlbnRseSBYZW5TZXJ2
ZXIgaGF2ZSBiZWVuIHRlc3RpbmcgdGhlIHNlcmllcwo+IHJlZ3VsYXJseSBmb3Igc29tZSB0aW1l
LCBhbmQgYXJlIHNhdGlzZmllZCBmcm9tIGEgdGVzdGluZyBwZXJzcGVjdGl2ZQo+IHRoYXQgdGhl
cmUgaXMgbm8gc2lnbmlmaWNhbnQgZGVncmFkYXRpb24gZm9yIHRoZSBzZXJpZXMgd2hlbiBpbiAi
dGhyZWFkCj4gbW9kZSIuCgpUbyBjbGFyaWZ5LCB3ZSd2ZSBiZWVuIHRlc3RpbmcgY29yZSBtb2Rl
LCBhbmQgcHJvdmlkaW5nIGZlZWRiYWNrIG9uIHRoZQp4ZW4tZGV2ZWwgdGhyZWFkcy4KCldlIGFy
ZSBjdXJyZW50bHkgb3JnYW5pc2luZyBhbiBleHRlbmRlZCByZWdyZXNzaW9uIHRlc3QgdG8gcnVu
IGluIHRocmVhZAptb2RlIHRvIGluY3JlYXNlIHRoZSBjb25maWRlbmNlIG9mIHRoZSBwcmV2aW91
cyBidWxsZXQgcG9pbnQuCgo+IFNvIHRoaXMgd291bGQgcmVhbGx5IGJlIGEgcmVjb21tZW5kYXRp
b24gLyBsaWNlbnNlIHRvIHRoZSB2YXJpb3VzCj4gbWFpbnRhaW5lcnMgaW52b2x2ZWQ7IHByaW1h
cmlseSBEYXJpbywgSSB0aGluayAoc2luY2UgSSBwcm9iYWJseSB3b24ndAo+IGhhdmUgdGltZSB0
byByZXZpZXcgdGhlIHNlcmllcykuCj4KPiBObyBkZWNpc2lvbnMgYXJlIG9mZmljaWFsIHVudGls
IGRpc2N1c3NlZCBvbiB4ZW4tZGV2ZWw7IHNvIHRoZSBkZWNpc2lvbgo+IHdpbGwgbm90IGJlIGNv
bnNpZGVyZWQgb2ZmaWNpYWwgdW50aWwgYSBmZXcgZGF5cyBoYXZlIHBhc3NlZCB3aXRob3V0Cj4g
b2JqZWN0aW9uLiAgQW5kIG9mIGNvdXJzZSwgaWYgYW55b25lIGF0IHRoZSBtZWV0aW5nIGhhZCBh
IGRpZmZlcmVudAo+IHVuZGVyc3RhbmRpbmcgb2Ygd2hhdCB3YXMgc2FpZCwgb3IgaGFzIHNvbWV0
aGluZyB0byBhZGQsIHBsZWFzZSBkbyBzby4KCk5vIG9iamVjdGlvbiBmcm9tIG1lIGF0IGFsbC4K
Cn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
