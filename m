Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FB011D93B
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 23:18:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifWiC-0003xf-LD; Thu, 12 Dec 2019 22:13:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0+ak=2C=amazon.com=prvs=242c78905=elnikety@srs-us1.protection.inumbo.net>)
 id 1ifWiB-0003xa-IR
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 22:13:31 +0000
X-Inumbo-ID: 9c3cd1b6-1d2c-11ea-a914-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c3cd1b6-1d2c-11ea-a914-bc764e2007e4;
 Thu, 12 Dec 2019 22:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576188803; x=1607724803;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=a8aFl63GmKjH7cLWDXB5b3obsSGCwDSAfTJ9O+yh2FA=;
 b=cIbtdYRpvbcNhzdvf+zoHj0JeD6b8hjG6doQDZ9OypCr3eDPOu+TfO/d
 lm+I1HwUwqXhn9m+J84dUe4HtEZmfmQWhZ0q4UZD9FV2K3AOneVQcuzDH
 F/mZGUw8WUsngo/MmR2oQ1Wb0RHvhChxNFyywotqv+bUx0Qgec/eIKEU2 g=;
IronPort-SDR: Qt1DoTIwy8yHqunhDD+R3XSds9UjIm6/xlOBj+WrH1VAK/PXp7MP1RjgwwNwUJPz/6BnAXZlAa
 Khjuec/P7KFQ==
X-IronPort-AV: E=Sophos;i="5.69,307,1571702400"; 
   d="scan'208";a="8863520"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-17c49630.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 12 Dec 2019 22:13:22 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-17c49630.us-east-1.amazon.com (Postfix) with ESMTPS
 id 9AE6CA25D0; Thu, 12 Dec 2019 22:13:18 +0000 (UTC)
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 12 Dec 2019 22:13:17 +0000
Received: from a483e73f63b0.ant.amazon.com (10.43.160.109) by
 EX13D03EUA002.ant.amazon.com (10.43.165.166) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 12 Dec 2019 22:13:12 +0000
To: Jan Beulich <jbeulich@suse.com>
References: <20191209084119.87563-1-elnikety@amazon.com>
 <180013ce-7b18-335a-f04b-1db0d4f2adf4@citrix.com>
 <eca670cd-7f8c-a662-320a-43981ba60c9a@amazon.com>
 <5bdb27b7-f827-23bd-a1dd-a0cec039ce54@suse.com>
 <e25e1ae4-d5b1-7ce8-348f-f2d1809d0635@amazon.com>
 <eb8beed3-3b9e-25f9-94bf-c6fe56a397f5@suse.com>
From: Eslam Elnikety <elnikety@amazon.com>
Message-ID: <ff5b0699-5010-fabc-f7fd-2d40f8c56644@amazon.com>
Date: Thu, 12 Dec 2019 23:13:07 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <eb8beed3-3b9e-25f9-94bf-c6fe56a397f5@suse.com>
Content-Language: en-US
X-Originating-IP: [10.43.160.109]
X-ClientProxiedBy: EX13D08UWC002.ant.amazon.com (10.43.162.168) To
 EX13D03EUA002.ant.amazon.com (10.43.165.166)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] x86/microcode: Support builtin CPU microcode
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMTIuMTkgMTA6NDcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDEwLjEyLjIwMTkgMjM6
NDAsIEVzbGFtIEVsbmlrZXR5IHdyb3RlOgo+PiBPbiAxMC4xMi4xOSAxMDoyMSwgSmFuIEJldWxp
Y2ggd3JvdGU6Cj4+PiBPbiAwOS4xMi4yMDE5IDIyOjQ5LCBFc2xhbSBFbG5pa2V0eSB3cm90ZToK
Pj4+PiBPbiAwOS4xMi4xOSAxNjoxOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+Pj4gT24gMDkv
MTIvMjAxOSAwODo0MSwgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4+Pj4+PiAtLS0gL2Rldi9udWxs
Cj4+Pj4+PiArKysgYi94ZW4vYXJjaC94ODYvbWljcm9jb2RlL01ha2VmaWxlCj4+Pj4+PiBAQCAt
MCwwICsxLDQwIEBACj4+Pj4+PiArIyBDb3B5cmlnaHQgKEMpIDIwMTkgQW1hem9uLmNvbSwgSW5j
LiBvciBpdHMgYWZmaWxpYXRlcy4KPj4+Pj4+ICsjIEF1dGhvcjogRXNsYW0gRWxuaWtldHkgPGVs
bmlrZXR5QGFtYXpvbi5jb20+Cj4+Pj4+PiArIwo+Pj4+Pj4gKyMgVGhpcyBwcm9ncmFtIGlzIGZy
ZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKPj4+Pj4+
ICsjIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2Ug
YXMgcHVibGlzaGVkIGJ5Cj4+Pj4+PiArIyB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBl
aXRoZXIgdmVyc2lvbiAyIG9mIHRoZSBMaWNlbnNlLCBvcgo+Pj4+Pj4gKyMgKGF0IHlvdXIgb3B0
aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KPj4+Pj4+ICsjCj4+Pj4+PiArIyBUaGlzIHByb2dyYW0g
aXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKPj4+Pj4+
ICsjIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdh
cnJhbnR5IG9mCj4+Pj4+PiArIyBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJU
SUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlCj4+Pj4+PiArIyBHTlUgR2VuZXJhbCBQdWJsaWMgTGlj
ZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgo+Pj4+Pj4gKwo+Pj4+Pj4gK29iai15ICs9IGJ1aWx0aW5f
dWNvZGUubwo+Pj4+Pj4gKwo+Pj4+Pj4gKyMgRGlyZWN0b3J5IGhvbGRpbmcgdGhlIG1pY3JvY29k
ZSB1cGRhdGVzLgo+Pj4+Pj4gK1VDT0RFX0RJUj0kKHBhdHN1YnN0ICIlIiwlLCQoQ09ORklHX0JV
SUxUSU5fVUNPREVfRElSKSkKPj4+Pj4+ICthbWQtYmxvYnMgOj0gJCh3aWxkY2FyZCAkKFVDT0RF
X0RJUikvYW1kLXVjb2RlLyopCj4+Pj4+PiAraW50ZWwtYmxvYnMgOj0gJCh3aWxkY2FyZCAkKFVD
T0RFX0RJUikvaW50ZWwtdWNvZGUvKikKPj4+Pj4KPj4+Pj4gVGhpcyBpcyBhIGxpdHRsZSBkYW5n
ZXJvdXMuwqAgSSBjYW4gc2VlIHdoeSB5b3Ugd2FudCB0byBkbyBpdCBsaWtlIHRoaXMsCj4+Pj4+
IGFuZCBJIGNhbid0IHByb3ZpZGUgYW55IG9idmlvdXMgc3VnZ2VzdGlvbnMsIGJ1dCBpZiB0aGlz
IGdsb2IgcGlja3MgdXAKPj4+Pj4gYW55dGhpbmcgd2hpY2ggaXNuJ3QgYSBtaWNyb2NvZGUgZmls
ZSwgaXQgd2lsbCBicmVhayB0aGUgbG9naWMgdG8gc2VhcmNoCj4+Pj4+IGZvciB0aGUgcmlnaHQg
YmxvYi4KPj4+Pj4KPj4+Pgo+Pj4+IFdlIGNhbiBsaW1pdCB0aGUgYW1kLWJsb2JzIGFuZCBpbnRl
bC1ibG9iIHRvIGJpbmFyaWVzIGZvbGxvd2luZyB0aGUKPj4+PiBuYW1pbmcgY29udmVudGlvbiBB
dXRoZW50aWNBTUQuYmluIGFuZCBHZW51aW5lSW50ZWwuYmluIGZvciBhbWQgYW5kCj4+Pj4gaW50
ZWwsIHJlc3BlY3RpdmVseS4gWWV0LCB0aGlzIHdvdWxkIGJlIGltcG9zaW5nIGFuIHVubmVjZXNz
YXJ5Cj4+Pj4gcmVzdHJpY3Rpb24gb24gYWRtaW5pc3RyYXRvcnMgd2hvIG1heSB3YW50IHRvIGJl
IGlubm92YXRpdmUgd2l0aCBuYW1pbmcKPj4+PiAob3Igd2FudCB0byB1c2UgdGhlIG5hbWluZyBt
aWNyb2NvZGVfYW1kXyouYmluIG9yIEZGLU1NLVNTIGluc3RlYWQpLgo+Pj4+Cj4+Pj4gQWx0ZXJu
YXRpdmVseSwgd2UgY2FuIGludHJvZHVjZSBDT05GSUdfQlVJTFRJTl9VQ09ERV9JTlRFTCBhbmQK
Pj4+PiBDT05GSUdfQlVJTFRJTl9VQ09ERV9BTUQuIEJvdGggZGVmYXVsdCB0byBlbXB0eSBzdHJp
bmdzLiBUaGVuLCBhbgo+Pj4+IGFkbWluaXN0cmF0b3IgY2FuIHNwZWNpZnkgZXhhY3RseSB0aGUg
bWljcm9jb2RlcyB0byBpbmNsdWRlIHJlbGF0aXZlIHRvCj4+Pj4gdGhlIENPTkZJR19CVUlMVElO
X1VDT0RFX0RJUi4gRm9yIGV4YW1wbGU6Cj4+Pj4gQ09ORklHX0JVSUxUSU5fVUNPREVfSU5URUw9
ImludGVsLXVjb2RlLzA2LTNhLTA5Igo+Pj4+IENPTkZJR19CVUlMVElOX1VDT0RFX0FNRD0iYW1k
LXVjb2RlL21pY3JvY29kZV9hbWRfZmFtMTVoLmJpbiIKPj4+Cj4+PiBUaGlzIHdvdWxkIG1ha2Ug
dGhlIGZlYXR1cmUgZXZlbiBsZXNzIGdlbmVyaWMgLSBJIGFscmVhZHkgbWVhbnQgdG8KPj4KPj4g
SSBkbyBub3QgZm9sbG93IHRoZSBwb2ludCBhYm91dCBiZWluZyBsZXNzIGdlbmVyaWMuIChJIGhv
cGUgbXkgZXhhbXBsZQo+PiBkaWQgbm90IGdpdmUgdGhlIGZhbHNlIGltcHJlc3Npb24gdGhhdCBD
T05GSUdfQlVJTFRJTl9VQ09ERV97QU1ELElOVEVMfQo+PiBhbGxvdyBmb3Igb25seSBhIHNpbmds
ZSBtaWNyb2NvZGUgYmxvYiBmb3IgYSBzaW5nbGUgc2lnbmF0dXJlKS4KPiAKPiBXZWxsLCB0aGUg
ZXhhbXBsZSBpbmRlZWQgaGFzIGdpdmVuIHRoaXMgaW1wcmVzc2lvbiB0byBtZS4gSSdtCj4gaGF2
aW5nIGEgaGFyZCB0aW1lIHNlZWluZyBob3csIGJleW9uZCB2ZXJ5IG5hcnJvdyBzcGVjaWFsIGNh
c2VzLAo+IGVpdGhlciBvZiB0aGUgZXhhbXBsZXMgY291bGQgYmUgdXNlZnVsIHRvIGFueW9uZS4g
WWV0IEkgdGhpbmsKPiBleGFtcGxlcyBzaG91bGQgYmUgZ2VuZXJhbGx5IHVzZWZ1bC4KPiAKCkFu
ZHJldydzIGVhcmxpZXIgcmVzcG9uc2UgaGludGVkIGF0ICJ3aGF0IGNhbiB3ZSBkbyB0byBhdm9p
ZCBwaWNraW5nIApyYW5kb20gYml0cyBpbiB0aGUgYnVpbHRpbiBtaWNyb2NvZGU/IiBNeSByZXNw
b25zZSB3YXMgb3V0bGluaW5nIAphbHRlcm5hdGl2ZXMsIGFuZCB0aGUgZXhhbXBsZXMgdGhlcmUg
d2VyZSBub3QgbWVhbnQgdG8gYmUgdXNlZnVsIGJleW9uZCAKZXhwbGFpbmluZyB0aG9zZSBhbHRl
cm5hdGl2ZXMuCgo+Pj4gYXNrIHdoZXRoZXIgYnVpbGRpbmcgdWNvZGUgaW50byBiaW5hcmllcyBp
cyByZWFsbHkgYSB1c2VmdWwgdGhpbmcKPj4+IHdoZW4gd2UgYWxyZWFkeSBoYXZlIG1vcmUgZmxl
eGlibGUgd2F5cy4gSSBjb3VsZCBzZWUgdGhpcyBiZWluZwo+Pj4gdXNlZnVsIGlmIHRoZXJlIHdh
cyBubyBvdGhlciB3YXkgdG8gbWFrZSB1Y29kZSBhdmFpbGFibGUgYXQgYm9vdAo+Pj4gdGltZS4K
Pj4KPj4gSXQgaXMgdXNlZnVsIGluIGFkZGl0aW9uIHRvIHRoZSBleGlzdGluZyB3YXlzIHRvIGRv
IGVhcmx5IG1pY3JvY29kZQo+PiB1cGRhdGVzLiBGaXJzdCwgd2hlbiBvcGVyYXRpbmcgbWFueSBo
b3N0cywgdXNpbmcgYm9vdCBtb2R1bGVzIChlaXRoZXIgYQo+PiBkaXN0aW5jdCBtaWNyb2NvZGUg
bW9kdWxlIG9yIHdpdGhpbiBhbiBpbml0cmQpIGJlY29tZXMgaW52b2x2ZWQuIEZvcgo+PiBpbnN0
YW5jZSwgdG9vbHMgdG8gdXBkYXRlIGJvb3QgZW50cmllcyAoZS5nLiwKPj4gaHR0cHM6Ly9saW51
eC5kaWUubmV0L21hbi84L2dydWJieSkgZG8gbm90IHN1cHBvcnQgYWRkaW5nIGFyYml0cmFyeQo+
PiAobWljcm9jb2RlKSBtb2R1bGVzLgo+IAo+IEkuZS4geW91IHN1Z2dlc3QgdG8gd29yayBhcm91
bmQgdG9vbHMgc2hvcnRjb21pbmdzIGJ5IGV4dGVuZGluZwo+IFhlbj8gV291bGRuJ3QgdGhlIG1v
cmUgYXBwcm9wcmlhdGUgd2F5IHRvIGRlYWwgd2l0aCB0aGlzIGJlIHRvCj4gbWFrZSB0aGUgdG9v
bHMgbW9yZSBjYXBhYmxlPwo+IAo+PiBTZWNvbmQsIHRoZXJlIGlzIG9mdGVuIG5lZWQgdG8gY291
cGxlIGEgWGVuIGJ1aWxkIHdpdGggYSBtaW5pbXVtCj4+IG1pY3JvY29kZSBwYXRjaCBsZXZlbC4g
SGF2aW5nIHRoZSBtaWNyb2NvZGUgYnVpbHQgd2l0aGluIHRoZSBYZW4gaW1hZ2UKPj4gaXRzZWxm
IGlzIGEgc3RyZWFtbGluZWQsIG5hdHVyYWwgd2F5IG9mIGFjaGlldmluZyB0aGF0Lgo+IAo+IE9r
YXksIEkgY2FuIGFjY2VwdCB0aGlzIGFzIGEgcmVhc29uLCB0byBzb21lIGRlZ3JlZSBhdCBsZWFz
dC4gWWV0Cj4gYXMgc2FpZCBlbHNld2hlcmUsIEkgZG9uJ3QgdGhpbmsgeW91IHdhbnQgdGhlbiB0
byBvdmVycmlkZSBhCj4gcG9zc2libGUgImV4dGVybmFsIiB1Y29kZSBtb2R1bGUgd2l0aCB0aGUg
YnVpbHRpbiBibG9icy4gSW5zdGVhZAo+IHRoZSBuZXdlc3Qgb2YgZXZlcnl0aGluZyB0aGF0J3Mg
YXZhaWxhYmxlIHNob3VsZCB0aGVuIGJlIGxvYWRlZC4KCkV4dGVuZGluZyBYZW4gdG8gd29yayBh
cm91bmQgdG9vbHMgc2hvcnRjb21pbmdzIGlzIGFic29sdXRlbHkgbm90IHdoYXQgSSAKaGF2ZSBp
biBtaW5kLiBJIHNob3VsZCBoYXZlIHN0YXJ0ZWQgd2l0aCB0aGUgc2Vjb25kIHJlYXNvbi4gUmVh
ZCB0aGlzIAphczogWGVuIHJlbGllcyBvbiBhIG1pbmltdW0gbWljcm9jb2RlIGZlYXR1cmUgc2V0
LCBhbmQgaXQgbWFrZXMgc2Vuc2UgdG8gCmNvdXBsZSBib3RoIGluIG9uZSBiaW5hcnkuIFRoaXMg
Y291cGxpbmcganVzdCBoYXBwZW5zIHRvIHByb3ZpZGUgYW4gCmFkZGVkIGJlbmVmaXQgaW4gdGhl
IGZhY2Ugb2YgdG9vbHMgc2hvcnRjb21pbmcuCgpUaGFua3MsCkVzbGFtCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
