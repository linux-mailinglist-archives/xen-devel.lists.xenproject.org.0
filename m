Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 162BC11E8D9
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 18:02:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifoIZ-0005aq-4y; Fri, 13 Dec 2019 17:00:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ifoIX-0005ak-PL
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 17:00:13 +0000
X-Inumbo-ID: 066d40e6-1dca-11ea-8f97-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 066d40e6-1dca-11ea-8f97-12813bfff9fa;
 Fri, 13 Dec 2019 17:00:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 53031AE2A;
 Fri, 13 Dec 2019 17:00:11 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <be16ddaa-ae99-f696-53c0-6a680ffa8504@suse.com>
 <083b525e-c6db-a94b-1c50-604e8798488b@suse.com>
 <7eff12d8-ae10-331e-53b8-7239e8456c3a@suse.com>
 <dd23ae64-24df-e3bb-351f-fe577e61c6df@suse.com>
 <bcacb731-a3cb-3552-a1a0-338c619ee64d@suse.com>
 <f1f63340-d894-30d7-c0d2-caa0f826173b@suse.com>
 <52a69b85-4c37-cf43-2f66-27eaf36da81a@suse.com>
 <604fd3ed-b9c0-6d61-efd9-5e0aaf750076@suse.com>
 <a37ad5d9-6961-a087-c111-bf525e00c1e4@suse.com>
 <826310cd-e82c-6d95-35f5-628d3df888cf@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8a384ee6-2524-aa33-a49b-1b32ae95dc41@suse.com>
Date: Fri, 13 Dec 2019 18:00:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <826310cd-e82c-6d95-35f5-628d3df888cf@suse.com>
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

T24gMTMuMTIuMjAxOSAxNjozNSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAxMy4xMi4xOSAx
NTo0NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDEzLjEyLjIwMTkgMTU6MjQsIErDvHJnZW4g
R3Jvw58gd3JvdGU6Cj4+PiBPbiAxMy4xMi4xOSAxNToxMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4gT24gMTMuMTIuMjAxOSAxNDo0NiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4+Pj4gT24gMTMu
MTIuMTkgMTQ6MzgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMTMuMTIuMjAxOSAxNDoz
MSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4+Pj4+PiBNYXliZSBJIGhhdmUgbWlzdW5kZXJzdG9v
ZCB0aGUgY3VycmVudCBzdGF0ZSwgYnV0IEkgdGhvdWdodCB0aGF0IGl0Cj4+Pj4+Pj4gd291bGQg
anVzdCBzaWxlbnRseSBoaWRlIHF1aXJreSBkZXZpY2VzIHdpdGhvdXQgaW1wb3NpbmcgYSBzZWN1
cml0eQo+Pj4+Pj4+IHJpc2suIFdlIHdvdWxkIG5vdCBsZWFybiB3aGljaCBkZXZpY2VzIGFyZSBx
dWlya3ksIGJ1dCBPVE9IIEkgZG91YnQKPj4+Pj4+PiB3ZSdkIGdldCBtYW55IHJlcG9ydHMgYWJv
dXQgdGhvc2UgaW4gY2FzZSB5b3VyIHBhdGNoIGdvZXMgaW4uCj4+Pj4+Pgo+Pj4+Pj4gV2UgZG9u
J3Qgd2FudCBvciBuZWVkIHN1Y2ggcmVwb3J0cywgdGhhdCdzIG5vdCB0aGUgcG9pbnQuIFRoZQo+
Pj4+Pj4gc2VjdXJpdHkgcmlzayBjb21lcyBmcm9tIHRoZSBxdWlya2luZXNzIG9mIHRoZSBkZXZp
Y2VzIC0gYWRtaW5zCj4+Pj4+PiBtYXkgd3JvbmdseSB0aGluayBhbGwgaXMgd2VsbCBhbmQgZXhw
b3NlIHF1aXJreSBkZXZpY2VzIHRvIG5vdAo+Pj4+Pj4gc3VmZmljaWVudGx5IHRydXN0ZWQgZ3Vl
c3RzLiAoSSBzYXkgdGhpcyBmdWxseSByZWFsaXppbmcgdGhhdAo+Pj4+Pj4gZXhwb3NpbmcgZGV2
aWNlcyB0byB1bnRydXN0ZWQgZ3Vlc3RzIGlzIGFsbW9zdCBhbHdheXMgYSBjZXJ0YWluCj4+Pj4+
PiBsZXZlbCBvZiByaXNrLikKPj4+Pj4KPj4+Pj4gRG8gd2UgX2tub3dfIHRob3NlIGRldmljZXMg
YXJlIHByb2JsZW1hdGljIGZyb20gc2VjdXJpdHkgc3RhbmRwb2ludD8KPj4+Pj4gTm9ybWFsbHkg
dGhlIElPTU1VIHNob3VsZCBkbyB0aGUgaXNvbGF0aW9uIGp1c3QgZmluZS4gSWYgaXQgZG9lc24n
dAo+Pj4+PiB0aGVuIGl0cyBub3QgdGhlIHF1aXJreSBkZXZpY2Ugd2hpY2ggaXMgcHJvYmxlbWF0
aWMsIGJ1dCB0aGUgSU9NTVUuCj4+Pj4+Cj4+Pj4+IEkgdGhvdWdodCB0aGUgcHJvYmxlbSB3YXMg
dGhhdCB0aGUgcXVpcmt5IGRldmljZXMgd291bGQgbm90IHN0b3AgYWxsCj4+Pj4+IChyZWFkKSBE
TUEgZXZlbiB3aGVuIGJlaW5nIHVuYXNzaWduZWQgZnJvbSB0aGUgZ3Vlc3QgcmVzdWx0aW5nIGlu
Cj4+Pj4+IGZhdGFsIElPTU1VIGZhdWx0cy4gVGhlIGR1bW15IHBhZ2Ugc2hvdWxkIHN0b3AgdGhv
c2UgZmF1bHRzIHRvIGhhcHBlbgo+Pj4+PiByZXN1bHRpbmcgaW4gYSBtb3JlIHN0YWJsZSBzeXN0
ZW0uCj4+Pj4KPj4+PiBJT01NVSBmYXVsdHMgYnkgdGhlbXNlbHZlcyBhcmUgbm90IGltcGFjdGlu
ZyBzdGFiaWxpdHkgKHRoZXkgd2lsbAo+Pj4+IGFkZCBwcm9jZXNzaW5nIG92ZXJoZWFkLCB5ZXMp
LiBUaGUgcHJvYmxlbSwgYWNjb3JkaW5nIHRvIFBhdWwncwo+Pj4+IGRlc2NyaXB0aW9uLCBpcyB0
aGF0IHRoZSBvY2N1cnJlbmNlIG9mIGF0IGxlYXN0IHNvbWUgZm9ybXMgb2YgSU9NTVUKPj4+PiBm
YXVsdHMgKG5vdCBwcmVzZW50IG9uZXMgYXMgaXQgc2VlbXMsIGFzIG9wcG9zZWQgdG8gcGVybWlz
c2lvbgo+Pj4+IHZpb2xhdGlvbiBvbmVzKSBpcyBmYXRhbCB0byBjZXJ0YWluIHN5c3RlbXMuIEly
cmVzcGVjdGl2ZSBvZiB0aGUKPj4+PiBzaW5rIHBhZ2UgdXNlZCBhZnRlciBkZS1hc3NpZ25tZW50
IGEgZ3Vlc3QgY2FuIGFycmFuZ2UgZm9yIElPTU1VCj4+Pj4gZmF1bHRzIHRvIG9jY3VyIGV2ZW4g
d2hpbGUgaXQgc3RpbGwgaGFzIHRoZSBkZXZpY2UgYXNzaWduZWQuIEhlbmNlCj4+Pj4gaXQgaXMg
aW1wb3J0YW50IGZvciB0aGUgYWRtaW4gdG8ga25vdyB0aGF0IHRoZWlyIHN5c3RlbSAobm90IHRo
ZQo+Pj4+IHRoZSBwYXJ0aWN1bGFyIGRldmljZSkgYmVoYXZlcyBpbiB0aGlzIHVuZGVzaXJhYmxl
IHdheS4KPj4+Cj4+PiBTbyBob3cgZG9lcyB0aGUgYWRtaW4gbGVhcm4gdGhpcz8gSXRzIG5vdCBh
cyBpZiB5b3VyIHBhdGNoIHdvdWxkIHJlc3VsdAo+Pj4gaW4gYSBzeXN0ZW0gY3Jhc2ggb3IgaGFu
ZyBhbGwgdGhlIHRpbWUsIHJpZ2h0PyBUaGlzIHdvdWxkIGJlIHRoZSBjYXNlCj4+PiBvbmx5IGlm
IHRoZXJlIGVpdGhlciBpcyBhIG1hbGljaW91cyAob24gcHVycG9zZSBvciBkdWUgdG8gYSBidWcp
IGd1ZXN0Cj4+PiB3aGljaCBnZXRzIHRoZSBkZXZpY2UgYXNzaWduZWQsIG9yIGlmIHRoZXJlIGhh
cHBlbnMgdG8gYmUgYSBwZW5kaW5nIERNQQo+Pj4gb3BlcmF0aW9uIHdoZW4gdGhlIGRldmljZSBn
ZXRzIHVuYXNzaWduZWQuCj4+Cj4+IEkgZGlkbid0IGNsYWltIHRoZSBjaGFuZ2Ugd291bGQgY292
ZXIgYWxsIGNhc2VzLiBBbGwgSSBhbSBjbGFpbWluZwo+PiBpcyB0aGF0IGl0IGluY3JlYXNlcyB0
aGUgY2hhbmNlcyBvZiBhZG1pbnMgYmVjb21pbmcgYXdhcmUgb2YgcmVhc29ucwo+PiBub3QgdG8g
cGFzcyB0aHJvdWdoIGRldmljZXMgdG8gY2VydGFpbiBndWVzdHMuCj4gCj4gU28gY29tYmluZWQg
d2l0aCB5b3VyIGFuc3dlciB0aGlzIG1lYW5zIHRvIG1lOgo+IAo+IFdpdGggeW91ciBwYXRjaCAo
b3IgdGhlIG9yaWdpbmFsIG9uZSByZXZlcnRlZCkgYSBEb1Mgd2lsbCBvY2N1ciBlaXRoZXIKPiBk
dWUgdG8gYSBtYWxpY2lvdXMgZ3Vlc3Qgb3IgaW4gY2FzZSBhIERNQSBpcyBzdGlsbCBwZW5kaW5n
LiBBcyBhIHJlc3VsdAo+IHRoZSBhZG1pbiB3aWxsIG5vIGxvbmdlciBwYXNzIHRoaXMgZGV2aWNl
IHRvIGFueSB1bnRydXN0ZWQgZ3Vlc3QuCj4gCj4gV2l0aCB0aGUgY3VycmVudCA0LjEzLXN0YWdp
bmcgYSBEb1Mgd2lsbCBvY2N1ciBvbmx5IGR1ZSB0byBhIG1hbGljaW91cwo+IGd1ZXN0LiBUaGUg
YWRtaW4gd2lsbCB0aGVuIG5vIGxvbmdlciBwYXNzIHRoaXMgZGV2aWNlIHRvIGFueSB1bnRydXN0
ZWQKPiBndWVzdC4KPiAKPiBTbyByaWdodCBub3cgd2l0aG91dCBhbnkgdW50cnVzdGVkIGd1ZXN0
IG5vIERvUywgd2hpbGUgcG9zc2libHkgRG9TIHdpdGgKPiB5b3VyIHBhdGNoLiBIb3cgaXMgdGhh
dCBiZXR0ZXI/CgpJJ20gYWZyYWlkIHRoaXMgd2F5IHdlIGNhbiBkZWJhdGUgZW5kbGVzc2x5LCBi
ZWNhdXNlIGl0J3Mgbm90IGxpa2UKdGhlcmUncyBhIGNsZWFyIHdpbm5lciBoZXJlLgoKSmFuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
