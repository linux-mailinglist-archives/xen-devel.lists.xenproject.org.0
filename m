Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1572C11E4CC
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 14:40:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifl8p-0007OC-Hp; Fri, 13 Dec 2019 13:37:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ifl8n-0007O7-WF
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 13:37:58 +0000
X-Inumbo-ID: c579fa14-1dad-11ea-8f04-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c579fa14-1dad-11ea-8f04-12813bfff9fa;
 Fri, 13 Dec 2019 13:37:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4A7C7AF86;
 Fri, 13 Dec 2019 13:37:56 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <be16ddaa-ae99-f696-53c0-6a680ffa8504@suse.com>
 <083b525e-c6db-a94b-1c50-604e8798488b@suse.com>
 <7eff12d8-ae10-331e-53b8-7239e8456c3a@suse.com>
 <dd23ae64-24df-e3bb-351f-fe577e61c6df@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bcacb731-a3cb-3552-a1a0-338c619ee64d@suse.com>
Date: Fri, 13 Dec 2019 14:38:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <dd23ae64-24df-e3bb-351f-fe577e61c6df@suse.com>
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

T24gMTMuMTIuMjAxOSAxNDozMSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAxMy4xMi4xOSAx
NDoyMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDEzLjEyLjIwMTkgMTQ6MTEsIErDvHJnZW4g
R3Jvw58gd3JvdGU6Cj4+PiBPbiAxMy4xMi4xOSAxMzo1MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4gQ29udGFpbmluZyBzdGlsbCBpbiBmbGlnaHQgRE1BIHdhcyBpbnRyb2R1Y2VkIHRvIHdvcmsg
YXJvdW5kIGNlcnRhaW4KPj4+PiBkZXZpY2VzIC8gc3lzdGVtcyBoYW5naW5nIGhhcmQgdXBvbiBo
aXR0aW5nIGFuIElPTU1VIGZhdWx0LiBQYXNzaW5nCj4+Pj4gdGhyb3VnaCAoc3VjaCkgZGV2aWNl
cyAob24gc3VjaCBzeXN0ZW1zKSBpcyBpbmhlcmVudGx5IGluc2VjdXJlIChhcwo+Pj4+IGd1ZXN0
cyBjb3VsZCBlYXNpbHkgYXJyYW5nZSBmb3IgSU9NTVUgZmF1bHRzIHRvIG9jY3VyKS4gRGVmYXVs
dGluZyB0bwo+Pj4+IGEgbW9kZSB3aGVyZSBhZG1pbnMgbWF5IG5vdCBldmVuIGJlY29tZSBhd2Fy
ZSBvZiBpc3N1ZXMgd2l0aCBkZXZpY2VzIGNhbgo+Pj4+IGJlIGNvbnNpZGVyZWQgdW5kZXNpcmFi
bGUuIFRoZXJlZm9yZSBjb252ZXJ0IHRoaXMgbW9kZSBvZiBvcGVyYXRpb24gdG8KPj4+PiBhbiBv
cHRpb25hbCBvbmUsIG5vdCBvbmUgZW5hYmxlZCBieSBkZWZhdWx0Lgo+Pj4+Cj4+Pj4gVGhpcyBp
bnZvbHZlcyByZXN1cnJlY3RpbmcgY29kZSBjb21taXQgZWEzODg2NzgzMWRhICgieDg2IC8gaW9t
bXU6IHNldAo+Pj4+IHVwIGEgc2NyYXRjaCBwYWdlIGluIHRoZSBxdWFyYW50aW5lIGRvbWFpbiIp
IGRpZCByZW1vdmUsIGluIGEgc2xpZ2h0bHkKPj4+PiBleHRlbmRlZCBhbmQgYWJzdHJhY3RlZCBm
YXNoaW9uLiBIZXJlLCBpbnN0ZWFkIG9mIHJlaW50cm9kdWNpbmcgYSBwcmV0dHkKPj4+PiBwb2lu
dGxlc3MgdXNlIG9mICJnb3RvIiBpbiBkb21haW5fY29udGV4dF91bm1hcCgpLCBhbmQgaW5zdGVh
ZCBvZiBtYWtpbmcKPj4+PiB0aGUgZnVuY3Rpb24gKGF0IGxlYXN0IHRlbXBvcmFyaWx5KSBpbmNv
bnNpc3RlbnQsIHRha2UgdGhlIG9wcG9ydHVuaXR5Cj4+Pj4gYW5kIHJlcGxhY2UgdGhlIG90aGVy
IHNpbWlsYXJseSBwb2ludGxlc3MgImdvdG8iIGFzIHdlbGwuCj4+Pj4KPj4+PiBJbiBvcmRlciB0
byBrZXkgdGhlIHJlLWluc3RhdGVkIGJ5cGFzc2VzIG9mZiBvZiB0aGVyZSAobm90KSBiZWluZyBh
IHJvb3QKPj4+PiBwYWdlIHRhYmxlIHRoaXMgZnVydGhlciByZXF1aXJlcyBtb3ZpbmcgdGhlIGFs
bG9jYXRlX2RvbWFpbl9yZXNvdXJjZXMoKQo+Pj4+IGludm9jYXRpb24gZnJvbSByZWFzc2lnbl9k
ZXZpY2UoKSB0byBhbWRfaW9tbXVfc2V0dXBfZG9tYWluX2RldmljZSgpIChvcgo+Pj4+IGVsc2Ug
cmVhc3NpZ25fZGV2aWNlKCkgd291bGQgYWxsb2NhdGUgYSByb290IHBhZ2UgdGFibGUgYW55d2F5
KTsgdGhpcyBpcwo+Pj4+IGJlbmlnbiB0byB0aGUgc2Vjb25kIGNhbGxlciBvZiB0aGUgbGF0dGVy
IGZ1bmN0aW9uLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgo+Pj4+IC0tLQo+Pj4+IEFzIGZhciBhcyA0LjEzIGlzIGNvbmNlcm5lZCwgSSBn
dWVzcyBpZiB3ZSBjYW4ndCBjb21lIHRvIGFuIGFncmVlbWVudAo+Pj4+IGhlcmUsIHRoZSBvbmx5
IG90aGVyIG9wdGlvbiBpcyB0byByZXZlcnQgZWEzODg2NzgzMWRhIGZyb20gdGhlIGJyYW5jaCwK
Pj4+PiBmb3IgaGF2aW5nIGJlZW4gY29tbWl0dGVkIHByZW1hdHVyZWx5IChJJ20gbm90IHNvIG11
Y2ggd29ycmllZCBhYm91dCB0aGUKPj4+PiBtYXN0ZXIgYnJhbmNoLCB3aGVyZSB3ZSBoYXZlIGFt
cGxlIHRpbWUgdW50aWwgNC4xNCkuIFdoYXQgSSBzdXJlbHkgd2FudAo+Pj4+IHRvIHNlZSB1cyBh
dm9pZCBpcyBhIGJhY2sgYW5kIGZvcnRoIGluIGJlaGF2aW9yIG9mIHJlbGVhc2VkIHZlcnNpb25z
Lgo+Pj4+IChOb3RlIHRoYXQgNC4xMi4yIGlzIHNpbWlsYXJseSBibG9ja2VkIG9uIGEgZGVjaXNp
b24gZWl0aGVyIHdheSBoZXJlLikKPj4+Cj4+PiBJJ20gbm90IHJlYWxseSBzdXJlIHdlIHJlYWxs
eSBuZWVkIHRvIHJldmVydCBlYTM4ODY3ODMxZGEgYmVmb3JlIHRoZQo+Pj4gNC4xMyByZWxlYXNl
LiBJdCBtaWdodCBub3QgYmUgb3B0aW1hbCwgYnV0IEknbSBxdWl0ZSBzdXJlIHRoZSBudW1iZXIg
b2YKPj4+IGNhc2VzIHdoZXJlIHRoaXMgY291bGQgYmUgYW4gaXNzdWUgaXMgcmF0aGVyIHNtYWxs
IGFscmVhZHksIGFuZCBJIHRlbmQKPj4+IHRvIGFncmVlIHdpdGggUGF1bCB0aGF0IGFkbWlucyB3
aG8gcmVhbGx5IGNhcmUgd2lsbCBtb3JlIGxpa2VseSB3YW50IHRvCj4+PiBzZWxlY3QgdGhlIG9w
dGlvbiB3aGVyZSB0aGUgc3lzdGVtIHdpbGwgImp1c3Qgd29yayIuIElNTyB0aGUgIm5vdGljZWFi
bGUKPj4+IGZhaWx1cmUiIGlzIHNvbWV0aGluZyB3aGljaCB3aWxsIGJlIHNlbGVjdGVkIG1vc3Rs
eSBieSBkZXZlbG9wZXJzLiBCdXQKPj4+IEknbSBub3QgYW4gZXhwZXJ0IGluIHRoYXQgYXJlYSwg
c28gSSBkb24ndCB3YW50IHRvIGluZmx1ZW5jZSB0aGUKPj4+IGRlY2lzaW9uIHJlZ2FyZGluZyB0
aGUgdG8gYmUgc2VsZWN0ZWQgZGVmYXVsdCB0b28gbXVjaC4KPj4KPj4gQW4gYWRtaW4gbm90IHdh
bnRpbmcgdG8ga25vdyBpcywgdG8gbWUsIHRoZSBzYW1lIGFzIHRoZW0gbm90IHdhbnRpbmcKPj4g
dG8ga25vdyBhYm91dCBzZWN1cml0eSBpc3N1ZXMsIGFuZCBoZW5jZSBub3Qgc3Vic2NyaWJpbmcg
dG8gb3VyCj4+IGFubm91bmNlbWVudHMgbGlzdHMuIEkgY2FuIGFjY2VwdCB0aGlzIGJlaW5nIGEg
cmVhc29uYWJsZSB0aGluZyB0bwo+PiBkbyB3aGVuIGl0IGlzIGFuIF9pbmZvcm1lZF8gZGVjaXNp
b24uIEJ1dCB3aXRoIHRoZSBjdXJyZW50Cj4+IGFycmFuZ2VtZW50cyB0aGVyZSdzIG5vIHdheSB3
aGF0c29ldmVyIGZvciBhbiBhZG1pbiB0byBrbm93Lgo+IAo+IE1heWJlIEkgaGF2ZSBtaXN1bmRl
cnN0b29kIHRoZSBjdXJyZW50IHN0YXRlLCBidXQgSSB0aG91Z2h0IHRoYXQgaXQKPiB3b3VsZCBq
dXN0IHNpbGVudGx5IGhpZGUgcXVpcmt5IGRldmljZXMgd2l0aG91dCBpbXBvc2luZyBhIHNlY3Vy
aXR5Cj4gcmlzay4gV2Ugd291bGQgbm90IGxlYXJuIHdoaWNoIGRldmljZXMgYXJlIHF1aXJreSwg
YnV0IE9UT0ggSSBkb3VidAo+IHdlJ2QgZ2V0IG1hbnkgcmVwb3J0cyBhYm91dCB0aG9zZSBpbiBj
YXNlIHlvdXIgcGF0Y2ggZ29lcyBpbi4KCldlIGRvbid0IHdhbnQgb3IgbmVlZCBzdWNoIHJlcG9y
dHMsIHRoYXQncyBub3QgdGhlIHBvaW50LiBUaGUKc2VjdXJpdHkgcmlzayBjb21lcyBmcm9tIHRo
ZSBxdWlya2luZXNzIG9mIHRoZSBkZXZpY2VzIC0gYWRtaW5zCm1heSB3cm9uZ2x5IHRoaW5rIGFs
bCBpcyB3ZWxsIGFuZCBleHBvc2UgcXVpcmt5IGRldmljZXMgdG8gbm90CnN1ZmZpY2llbnRseSB0
cnVzdGVkIGd1ZXN0cy4gKEkgc2F5IHRoaXMgZnVsbHkgcmVhbGl6aW5nIHRoYXQKZXhwb3Npbmcg
ZGV2aWNlcyB0byB1bnRydXN0ZWQgZ3Vlc3RzIGlzIGFsbW9zdCBhbHdheXMgYSBjZXJ0YWluCmxl
dmVsIG9mIHJpc2suKQoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
