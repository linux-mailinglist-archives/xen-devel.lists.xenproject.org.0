Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7249CD0A61
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 10:57:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iI7kX-0001Iv-Vd; Wed, 09 Oct 2019 08:55:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sdFN=YC=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iI7kW-0001Ic-Bn
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 08:55:12 +0000
X-Inumbo-ID: 7b06e988-ea72-11e9-80e3-bc764e2007e4
Received: from mail-pf1-x441.google.com (unknown [2607:f8b0:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b06e988-ea72-11e9-80e3-bc764e2007e4;
 Wed, 09 Oct 2019 08:55:02 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id h195so1187716pfe.5
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2019 01:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RhTueyRVYbxRovT0LES3zzDh7OWVUh/eaEOigR2alOY=;
 b=HBnaSeqqLsan/aAAiTp/itbDGNR6TM4hII108beWiMMbBG1nCuV+i2GOYu0foYjWgf
 K+jg7L3+HBLvB0CQMXD2MxNE7MmGvCwIS4I2+QGkKgw0py1K/6zm2eCTFUEjAr1oB8Iu
 L/tLoh/0PqxiNeuShJ8me/4UaxUF0vcCRjm22eHd6lI8mibfpI0lmZBxj0xelZxcPo50
 g2rvkvvfAftz9vjEZ8LHn4BTGxEq/F+giSNsnXlvSNl3QO5AuQo2R02S4fMxEiRMN8S6
 lnSeq2tX/qTzzaZflAfHNM0fa+z0bSMeqMv12tjiPxaLTAG0FCtlioAbrGV0XUBK1Z+8
 g18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RhTueyRVYbxRovT0LES3zzDh7OWVUh/eaEOigR2alOY=;
 b=mHZpCZD0NF132/mmkz919Or9yLuntrjSmXQnYg25XfQ18RVcZCcj4dU2lnG7uccHI4
 KrdgOufwIKr462Nd3R6sYAi8Ocacfd0NYTr5aTq6kJQq92mQCqKDz/1ZWiu1dH7YUQ8E
 xlt4E1r9YfF8RzaiX/HBq1arfGz5rOpbP2ko4f1oW61Wj0Y8dH8Vbd7Qkipori4BeKMb
 vVd7VQOPX9e3G8Tgq+KsoSvOnzr+g9UJwsu4Q+F7BCWoJCl2ejoaatPCsJ/1gMcAPrZQ
 sM+sBX0b1Z6heHtG2L+N8GX6d6JG75suu4xuX5/yjvseCBLJP2nWtWcaYib5fcPUCEby
 o7+Q==
X-Gm-Message-State: APjAAAWQkjzm1PuAs/12tfLs6JcgWQ7eMPzUsCj3NRbPZ2JifF9DSMZM
 NvYkrWscL3BLgnOOL9dEPRf9JHQiMCWlV1Odlps=
X-Google-Smtp-Source: APXvYqw4sp+xeiN5EIBEwOLemCePXRFaHkg2Pf150ObErdGm7gS+2Nv5ovqx3hQum8eq+NI/wNuWwnWiN1/3HIyzc+o=
X-Received: by 2002:a17:90a:c684:: with SMTP id
 n4mr2763027pjt.33.1570611301701; 
 Wed, 09 Oct 2019 01:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <d1ca6ac5-0ed4-200f-c4e0-7a657b8d8fa8@suse.com>
 <0945a089-6fdb-89aa-f5a8-b8cc35f83f17@citrix.com>
 <4e73d1d1-468b-15b6-0951-25b266011499@suse.com>
In-Reply-To: <4e73d1d1-468b-15b6-0951-25b266011499@suse.com>
From: Paul Durrant <pdurrant@gmail.com>
Date: Wed, 9 Oct 2019 09:54:50 +0100
Message-ID: <CACCGGhDV4ErWVR-cEDSeyc4bWMpBn7y=13T7+zPPPMQa5P+48w@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v3] x86/mm: don't needlessly veto migration
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
Cc: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCA5IE9jdCAyMDE5IGF0IDA5OjQ5LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+IHdyb3RlOgo+Cj4gT24gMDguMTAuMjAxOSAxODozOCwgQW5kcmV3IENvb3BlciB3cm90ZToK
PiA+IE9uIDA4LzEwLzIwMTkgMTc6MTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+IEZyb206IFBh
dWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4gPj4KPiA+PiBOb3cgdGhhdCB4
bC5jZmcgaGFzIGFuIG9wdGlvbiB0byBleHBsaWNpdGx5IGVuYWJsZSBJT01NVSBtYXBwaW5ncyBm
b3IgYQo+ID4+IGRvbWFpbiwgbWlncmF0aW9uIG1heSBiZSBuZWVkbGVzc2x5IHZldG9lZCBkdWUg
dG8gdGhlIGNoZWNrIG9mCj4gPj4gaXNfaW9tbXVfZW5hYmxlZCgpIGluIHBhZ2luZ19sb2dfZGly
dHlfZW5hYmxlKCkuCj4gPj4gVGhlcmUgaXMgYWN0dWFsbHkgbm8gbmVlZCB0byBwcmV2ZW50IGxv
Z2RpcnR5IGZyb20gYmVpbmcgZW5hYmxlZCB1bmxlc3MKPiA+PiBkZXZpY2VzIGFyZSBhc3NpZ25l
ZCB0byBhIGRvbWFpbi4KPiA+Pgo+ID4+IE5PVEU6IFdoaWxlIGluIHRoZSBuZWlnaGJvdXJob29k
LCB0aGUgYm9vbF90IHBhcmFtZXRlciB0eXBlIGluCj4gPj4gICAgICAgcGFnaW5nX2xvZ19kaXJ0
eV9lbmFibGUoKSBpcyByZXBsYWNlZCB3aXRoIGEgYm9vbCBhbmQgdGhlIGZvcm1hdAo+ID4+ICAg
ICAgIG9mIHRoZSBjb21tZW50IGluIGFzc2lnbl9kZXZpY2UoKSBpcyBmaXhlZC4KPiA+Pgo+ID4+
IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4g
Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+ID4+IFJl
bGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiA+Cj4gPiBT
ZXJpb3VzbHkgRkZTLiAgV2h5IGFtIEkgaGF2aW5nIHRvIHJlcGVhdCBteXNlbGY/ICBXaGF0IGlm
IGFueSB3YXkKPiA+IHVuY2xlYXIgb24gdGhlIHByZXZpb3VzIHRocmVhZHM/Cj4gPgo+ID4gTkFD
SyBOQUNLIE5BQ0suICBYZW4gaXMsIGFuZCBoYXMgYWx3YXlzIGJlZW4sIHRoZSB3cm9uZyBwbGFj
ZSB0byBoYXZlCj4gPiBhbnkgbG9naWMsIGJlY2F1c2UgSVQgRE9FU04nVCBIQVZFIEVOT1VHSCBJ
TkZPUk1BVElPTiBUTyBNQUtFIFRIRQo+ID4gREVDSVNJT04gQ09SUkVDVExZLgo+ID4KPiA+IFRo
ZSB0b29sc3RhY2sgZG9lcy4KPiA+Cj4gPiBUaGVyZWZvcmUsIHRoZSB0b29sc3RhY2sgaXMgdGhl
IG9ubHkgbGV2ZWwgY2FwYWJsZSBkZWNpZGUgd2hldGhlciBpdCBpcwo+ID4gc2FmZSB0byBtaWdy
YXRpb24vc3VzcGVuZC9yZXN1bWUvY2hlY2twb2ludCB0aGUgVk0uCj4gPgo+ID4gSWYgSSBoYXZl
IHRvIHdyaXRlIHRoZSBwYXRjaGVzIG15c2VsZiwgSSB3aWxsLCBidXQgdGhpcyBwYXRjaCBpbiB0
aGlzCj4gPiBmb3JtIGlzIGZyYW5rbHkgdW5hY2NlcHRhYmxlLgo+Cj4gWW91J3JlIGtpZGRpbmcs
IGFyZW4ndCB5b3U/IEJ5IHRha2luZyBvbmx5IHBhcnQgb2YgUGF1bCdzIG9yaWdpbmFsCj4gcGF0
Y2gsIHdlIHNob3VsZCBiZSBhYmxlIHRvIGdldCByaWQgb2YgdHdvIG9mIHRoZSBjdXJyZW50IG9z
c3Rlc3QKPiByZXBvcnRlZCByZWdyZXNzaW9ucy4gQXQgdGhlIHNhbWUgdGltZSB0aGlzIF9kb2Vz
IG5vdF8gZXhjbHVkZSBhbgo+IGluY3JlbWVudGFsIHN1YnNlcXVlbnQgcGF0Y2ggdG8gYWxzbyBh
ZGQgdGhlIG90aGVyIGhhbGYgKHNlZSBteQo+IHJlcGx5IHRvIGhpbSB5ZXN0ZXJkYXkgc3VnZ2Vz
dGluZyB0aGlzIHNwbGl0KS4gVGhlIHR3byBzdGVwcwo+IHNob3VsZG4ndCBoYXZlIGJlZW4gbWVy
Z2VkIGludG8gYSBzaW5nbGUgcGF0Y2ggYW55d2F5IGltbzogVGhlCj4gcGFydCBoZXJlIGZpeGVz
IGEgcmVncmVzc2lvbiwgd2hpbGUgdGhlIG90aGVyIHBhcnQgY2hhbmdlcyBvcmlnaW5hbAo+IGJl
aGF2aW9yLCBhbmQgY29udGludWVzIHRvIGJlIChpcnJlc3BlY3RpdmUgb2YgeW91ciB3b3JkaW5n
LCB3aGljaAo+IG9uY2UgYWdhaW4gc3VnZ2VzdHMgdGhhdCBpbiBjZXJ0YWluIGNhc2VzIHlvdSBh
cmVuJ3Qgd2lsbGluZyB0bwo+IHRvbGVyYXRlIHRoaW5raW5nIHRoYXQncyBkaWZmZXJlbnQgZnJv
bSB5b3VycykgY29udHJvdmVyc2lhbC4KPgo+IElmIGl0IGhlbHBzLCBJIGNhbiBjaGFuZ2UgdGhl
IHRpdGxlIChhbmQgcGVyaGFwcyBkZXNjcmlwdGlvbikgdG8KPiBtYWtlIGl0IGxvb2sgbGVzcyBs
aWtlIHRoZSBvcmlnaW5hbCBwYXRjaCwgYW5kIHRvIHB1dCBmb2N1cyBvbiB0aGUKPiByZWdyZXNz
aW9uLiBJIGp1c3QgZGlkbid0IHdhbnQgdG8gbWFzc2FnZSBpdCBtb3JlIHRoYW4gYWJzb2x1dGVs
eQo+IG5lZWRlZC4KCkFncmVlZC4gR2l2ZW4gd2hlcmUgd2UgYXJlIHcuci50LiByZWdyZXNzaW9u
cyBhbmQgYSByZWxlYXNlIHNjaGVkdWxlLApJIHRoaW5rIHdlIG5lZWQgdG8gYmUgcHJhZ21hdGlj
LiBSZWFsaXN0aWNhbGx5IEknbSBub3QgZ29pbmcgZ2V0IGEgWGVuCmRldi4gZW52aXJvbm1lbnQg
dXAgYW5kIHJ1bm5pbmcgZm9yIG1heWJlIGEgd2VlayBzbyBJIGNhbid0IHdvcmsgb24KdGhpcyBt
eXNlbGYgYXQgdGhlIG1vbWVudC4gSSBhbSBoYXBweSBmb3IgSmFuIHRvIGZpeCB0aGUgcmVncmVz
c2lvbnMKYW5kIHRoZW4gd2UgY2FuIG1vdmUgb24gYWZ0ZXIgNC4xMyBpcyBvdXQgdGhlIGRvb3Iu
CgogIFBhdWwKCj4KPiBKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
