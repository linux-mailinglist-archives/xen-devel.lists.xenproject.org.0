Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADF71183E8
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 10:47:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iec4N-0003Pq-Ue; Tue, 10 Dec 2019 09:44:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1mH3=2A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iec4M-0003Pl-In
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 09:44:38 +0000
X-Inumbo-ID: ade072e4-1b31-11ea-890b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ade072e4-1b31-11ea-890b-12813bfff9fa;
 Tue, 10 Dec 2019 09:44:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B0325AC81;
 Tue, 10 Dec 2019 09:44:36 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.com>
References: <20191127171143.27399-1-pdurrant@amazon.com>
 <c1cd5d7c-d08f-cdac-9935-42f4a35ac12d@suse.com>
 <dbd61cfe-797a-3d8e-1fae-1412c7204842@suse.com>
 <4cf200a6-cccb-0bca-f2cb-b9f80956ae33@suse.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D636C7C@SHSMSX104.ccr.corp.intel.com>
 <b6bae4cd-129c-6815-1331-00bca8acb4ae@suse.com>
 <920f4319-ed07-687c-a569-ab20faeda2a8@suse.com>
 <72311af3-e47a-c868-fa47-89a74b043a4c@suse.com>
 <5ac457ca-46cf-5de3-8bfa-92a754f298fd@suse.com>
 <3ec8e7be074d4846bef0104e5dacb653@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a5a2199b-23c0-e9a1-44fb-3cdd1f2a8f0f@suse.com>
Date: Tue, 10 Dec 2019 10:44:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <3ec8e7be074d4846bef0104e5dacb653@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86 / iommu: set up a scratch page in
 the quarantine domain
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMTIuMjAxOSAxMDoxNiwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSsO8cmdlbiBHcm/DnyA8amdyb3NzQHN1c2UuY29tPgo+
PiBTZW50OiAxMCBEZWNlbWJlciAyMDE5IDA5OjA3Cj4+IFRvOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+Cj4+IENjOiBUaWFuLCBLZXZpbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+OyBE
dXJyYW50LCBQYXVsCj4+IDxwZHVycmFudEBhbWF6b24uY29tPjsgQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IHhlbi0KPj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmc7IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgV2VpCj4+IExpdSA8
d2xAeGVuLm9yZz4KPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0geDg2IC8gaW9tbXU6IHNldCB1
cCBhIHNjcmF0Y2ggcGFnZSBpbiB0aGUKPj4gcXVhcmFudGluZSBkb21haW4KPj4KPj4gT24gMTAu
MTIuMTkgMDk6NTcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gT24gMTAuMTIuMjAxOSAwOToxMiwg
SsO8cmdlbiBHcm/DnyB3cm90ZToKPj4+PiBPbiAxMC4xMi4xOSAwOTowNSwgSmFuIEJldWxpY2gg
d3JvdGU6Cj4+Pj4+IE9uIDEwLjEyLjIwMTkgMDg6MTYsIFRpYW4sIEtldmluIHdyb3RlOgo+Pj4+
Pj4gV2hpbGUgdGhlIHF1YXJhbnRpbmUgaWRlYSBzb3VuZHMgZ29vZCBvdmVyYWxsLCBJJ20gc3Rp
bGwgbm90Cj4+IGNvbnZpbmNlZAo+Pj4+Pj4gdG8gaGF2ZSBpdCB0aGUgb25seSB3YXkgaW4gcGxh
Y2UganVzdCBmb3IgaGFuZGxpbmcgc29tZSBrbm93bi1idWdneQo+Pj4+Pj4gZGV2aWNlLiBJdCBr
aWxscyB0aGUgcG9zc2liaWxpdHkgb2YgaWRlbnRpZnlpbmcgYSBuZXcgYnVnZ3kgZGV2aWNlCj4+
IGFuZCB0aGVuCj4+Pj4+PiBkZWNpZGluZyBub3QgdG8gdXNlIGl0IGluIHRoZSBmaXJzdCBzcGFj
ZS4uLiBJIHRob3VnaHQgYWJvdXQgd2hldGhlcgo+PiBpdAo+Pj4+Pj4gd2lsbCBnZXQgYmV0dGVy
IHdoZW4gZnV0dXJlIElPTU1VIGltcGxlbWVudHMgQS9EIGJpdCAtIGJ5IGNoZWNraW5nCj4+Pj4+
PiBhY2Nlc3MgYml0IGJlaW5nIHNldCB0aGVuIHdlJ2xsIGtub3cgc29tZSBidWdneSBkZXZpY2Ug
ZXhpc3RzLCBidXQsCj4+Pj4+PiB0aGUgc2NyYXRjaCBwYWdlIGlzIHNoYXJlZCBieSBhbGwgZGV2
aWNlcyB0aGVuIHdlIGNhbm5vdCByZWx5IG9uIHRoaXMKPj4+Pj4+IGZlYXR1cmUgdG8gZmluZCBv
dXQgdGhlIGFjdHVhbCBidWdneSBvbmUuCj4+Pj4+Cj4+Pj4+IFRoaW5raW5nIGFib3V0IGl0IC0g
eWVzLCBJIHRoaW5rIEkgYWdyZWUuIFRoaXMgKGFzIHdpdGggc28gbWFueQo+Pj4+PiB3b3JrYXJv
dW5kcykgd291bGQgYmV0dGVyIGJlIGFuIG9mZi1ieS1kZWZhdWx0IG9uZS4gVGhlIG1haW4gaXNz
dWUKPj4+Pj4gSSB1bmRlcnN0YW5kIHRoaXMgd291bGQgaGF2ZSBpcyB0aGF0IGJ1Z2d5IHN5c3Rl
bXMgdGhlbiBtaWdodCBoYW5nCj4+Pj4+IHdpdGhvdXQgZXZlbiBoYXZpbmcgbWFuYWdlZCB0byBn
ZXQgYSBsb2cgbWVzc2FnZSBvdXQgLSBQYXVsPwo+Pj4+Pgo+Pj4+PiBKw7xyZ2VuIC0gd291bGQg
eW91IGJlIGFtZW5hYmxlIHRvIGFuIGFsbW9zdCBsYXN0IG1pbnV0ZSByZWZpbmVtZW50Cj4+Pj4+
IGhlcmUgKHdvdWxkIHRoZW4gYWxzbyBuZWVkIHRvIHN0aWxsIGJlIGJhY2twb3J0ZWQgdG8gNC4x
Mi4yLCBvcgo+Pj4+PiB0aGUgb3JpZ2luYWwgYmFja3BvcnQgcmV2ZXJ0ZWQsIHRvIGF2b2lkIGdp
dmluZyB0aGUgaW1wcmVzc2lvbiBvZgo+Pj4+PiBhIHJlZ3Jlc3Npb24pPwo+Pj4+Cj4+Pj4gU28g
d2hhdCBpcyB5b3VyIHN1Z2dlc3Rpb24gaGVyZT8gVG8gaGF2ZSBhIGJvb3Qgb3B0aW9uIChkZWZh
dWx0aW5nIHRvCj4+Pj4gb2ZmKSBmb3IgZW5hYmxpbmcgdGhlIHNjcmF0Y2ggcGFnZT8KPj4+Cj4+
PiBZZXMgKGFuZCBkZXNwaXRlIGhhdmluZyBzZWVuIFBhdWwncyByZXBseSkuCj4+Cj4+IEknZCBy
ZWxlYXNlIGFjayBzdWNoIGEgcGF0Y2ggaW4gY2FzZSB5b3UgY29tZSB0byBhbiBhZ3JlZW1lbnQg
cmVnYXJkaW5nCj4+IHRoZSBkZWZhdWx0IHNvb24uCj4+Cj4gCj4gT2suIFRoZSBkZWZhdWx0IGlz
IG5vdCB0aGF0IGNydWNpYWwuIFBlcmhhcHMgaXQncyBqdXN0IG1lIHdobyB0aGlua3MKPiBkZWZh
dWx0cyBzaG91bGQgYmUgY2hvc2VuIG9uIHRoZSBiYXNpcyBvZiBiZWluZyBtb3N0IGxpa2VseSB0
byByZXN1bHQKPiBpbiBhIHdvcmtpbmcgc3lzdGVtLgoKSWYgaXQgd2Fzbid0IGZvciBxdWlya3kg
aGFyZHdhcmUgKG9yIGZpcm13YXJlIHRvIGNvdmVyIHRoZSBnZW5lcmFsIGNhc2UsCmluIHBhcnRp
Y3VsYXIgdG8gYXZvaWQgZ2V0dGluZyBxdW90ZWQgb24gdGhpcyB3cnQgbXkgcG9zaXRpb24gb24g
RUZJCndvcmthcm91bmRzKSwgSSdkIGFncmVlLiBCdXQgcGVyc29uYWxseSBJIHRoaW5rIEtldmlu
J3MgcG9pbnQgdGFrZXMKcHJpb3JpdHkgaGVyZTogQWRtaW5zIHNob3VsZCBhdCBsZWFzdCBiZSBh
d2FyZSBvZiBydW5uaW5nIHF1aXJreQpoYXJkd2FyZSwgYW5kIGhlbmNlIEknZCBwcmVmZXIgdGhl
IGRlZmF1bHQgdG8gYmUgbG9nZ2luZyBvZiBmYXVsdHMKcmF0aGVyIHRoYW4gdGhlaXIgc2lsZW5j
aW5nLiBEb2N1bWVudGF0aW9uIG9mIHRoZSBuZXcgKHN1Yi0pb3B0aW9uIG1heQpnaXZlIHN1aXRh
YmxlIGhpbnRzLCBhbmQgd2UgbWF5IGV2ZW4gZ28gYXMgZmFyIGFzIHByb3ZpZGluZyBhIEtjb25m
aWcKb3B0aW9uIGZvciB0aGUgZGVmYXVsdCB0byBiZSBjaG9zZW4gYXQgYnVpbGQgdGltZS4KCk1h
aW4gcXVlc3Rpb24gbm93IGlzIC0gd2hvJ3MgZ29pbmcgdG8gbWFrZSBhIHBhdGNoPyBXaWxsIHlv
dT8gU2hvdWxkIEk/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
