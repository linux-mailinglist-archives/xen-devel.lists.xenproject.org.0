Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BE5D8E38
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2019 12:43:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKghT-0000on-KK; Wed, 16 Oct 2019 10:38:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tJUx=YJ=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iKghS-0000oi-9N
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2019 10:38:38 +0000
X-Inumbo-ID: 1ba40194-f001-11e9-93ae-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ba40194-f001-11e9-93ae-12813bfff9fa;
 Wed, 16 Oct 2019 10:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571222317;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ky71ZsvjHnsmOJA+n3ezoLi8q4SDUt99vk7HpQaitJw=;
 b=GUaaG4CTeLkhZazs+cGvROdVxy3CHRsRCOJPOmGSRuP2hrLtFrnq2K26
 NiZE4WKI64iIItqFFE5gZiNrQBgBTD+1IJ9zS40CLG7o4tBYlo4bpvX81
 h6x5RuCqI/tQeFD4IYm1R/DBhSFoju0AwvdwRVblwVsQ+dGaKH9uop/RO U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jz2fv1Z/zf19i9O248yMlHwIpuRBcjor+x+z+7TJ6RBTXyVAoZf7ibNELqafYYr9wOH46SXQDj
 zQLG0zG4hBCM072aiRyG2GZLkXsPMp6Rcx77E5R1csdfdMJp/ye/sRtWXlGvmHJuq7gZj3Ex5B
 WALc3RdJOMFluAKAxaMqj0NvccOMvoY0Dl2PYOH5wDHzWptmPplKhhlDd3HHbIcPLvlhWWLM/K
 TfMIbS85eNei149COkBzU24IGp0TaxTv/hhBUVKkESwshg/P8ds5+A6XgNu6xheR4IUJe9llQx
 NwU=
X-SBRS: 2.7
X-MesageID: 6949465
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,303,1566878400"; 
   d="scan'208";a="6949465"
To: Julien Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>, 
 Stefano Stabellini <sstabellini@kernel.org>
References: <20191015181802.21957-1-julien.grall@arm.com>
 <alpine.DEB.2.21.1910151221270.30080@sstabellini-ThinkPad-T480s>
 <bfb3ac7c-19bc-90f0-381b-32a1491a967c@arm.com>
 <alpine.DEB.2.21.1910151249160.30080@sstabellini-ThinkPad-T480s>
 <9520fef5-a21b-e4cc-12d1-97794b979883@arm.com>
 <alpine.DEB.2.21.1910152124170.30080@sstabellini-ThinkPad-T480s>
 <23974.61064.928585.36020@mariner.uk.xensource.com>
 <3f7be099-158d-e10b-7934-19c7fd9e9c75@citrix.com>
 <1531968b-6657-14b4-c740-85995f21b521@arm.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <a41acb21-8390-935f-4897-f1e5ade81a4c@citrix.com>
Date: Wed, 16 Oct 2019 11:38:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1531968b-6657-14b4-c740-85995f21b521@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/arm: Don't use _end in
 is_xen_fixed_mfn()
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
Cc: "jgross@suse.com" <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 \(Xen.org\)" <tim@xen.org>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMTYvMTkgMTE6MzEgQU0sIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSBHZW9yZ2UsCj4g
Cj4gT24gMTYvMTAvMjAxOSAxMToyMiwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4gT24gMTAvMTYv
MTkgMTE6MTggQU0sIElhbiBKYWNrc29uIHdyb3RlOgo+Pj4gU3RlZmFubyBTdGFiZWxsaW5pIHdy
aXRlcyAoIlJlOiBbUEFUQ0ggZm9yLTQuMTNdIHhlbi9hcm06IERvbid0IHVzZQo+Pj4gX2VuZCBp
biBpc194ZW5fZml4ZWRfbWZuKCkiKToKPj4+PiBNeSBzdWdnZXN0aW9uIGlzIGdvaW5nIHRvIHdv
cms6ICJ0aGUgY29tcGlsZXIgc2VlcyB0aHJvdWdoIGNhc3RzIgo+Pj4+IHJlZmVycmVkIHRvIGNv
bXBhcmlzb25zIGJldHdlZW4gcG9pbnRlcnMsIHdoZXJlIHdlIHRlbXBvcmFyaWx5IGNhc3RlZAo+
Pj4+IGJvdGggcG9pbnRlcnMgdG8gaW50ZWdlcnMgYW5kIGJhY2sgdG8gcG9pbnRlcnMgdmlhIGEg
TUFDUk8uIFRoYXQgY2FzZQo+Pj4+IHdhcyBpZmZ5IGJlY2F1c2UgdGhlIE1BQ1JPIHdhcyBjbGVh
cmx5IGEgd29ya2Fyb3VuZCB0aGUgc3BlYy4KPj4+Pgo+Pj4+IEhlcmUgdGhlIHNpdHVhdGlvbiBp
cyBkaWZmZXJlbnQuIEZvciBvbmUsIHdlIGFyZSBkb2luZyBhcml0aG1ldGljLiBBbHNvCj4+Pj4g
dmlydF90b19tYWRkciBhbHJlYWR5IHRha2VzIGEgdmFkZHJfdCBhcyBhcmd1bWVudC4gU28gaW5z
dGVhZCBvZiBkb2luZwo+Pj4+IHBvaW50ZXJzIGFyaXRobWV0aWMsIHRoZW4gY29udmVydGluZyB0
byB2YWRkcl90LCB3ZSBhcmUgY29udmVydGluZyB0bwo+Pj4+IHZhZGRyX3QgZmlyc3QsIHRoZW4g
ZG9pbmcgYXJpdGhtZXRpY3MsIHdoaWNoIGlzIGZpbmUgYm90aCBmcm9tIGEgQzk5Cj4+Pj4gcG9p
bnQgb2YgdmlldyBhbmQgZXZlbiBhIE1JU1JBIEMgcG9pbnQgb2Ygdmlldy4gSSBjYW4ndCBzZWUg
YSBwcm9ibGVtCj4+Pj4gd2l0aCB0aGF0LiBJIGFtIHN1cmUgYXMgSSByZWFzb25hYmxlIGNhbiBi
ZSA6LSkKPj4+Cj4+PiBGVEFPRCBJIHRoaW5rIHlvdSBhcmUgc3VnZ2VzdGluZyB0aGlzOgo+Pj4g
wqAgLSArwqDCoMKgwqAgKG1mbl90b19tYWRkcihtZm4pIDw9IHZpcnRfdG9fbWFkZHIoX2VuZCAt
IDEpKSkKPj4+IMKgICsgK8KgwqDCoMKgIChtZm5fdG9fbWFkZHIobWZuKSA8PSB2aXJ0X3RvX21h
ZGRyKCgodmFkZHJfdClfZW5kIC0gMSkpKQo+Pj4KPj4+IHZpcnRfdG9fbWFkZHIodmEpIGlzIGEg
bWFjcm8gd2hpY2ggZXhwYW5kcyB0bwo+Pj4gwqDCoMKgIF9fdmlydF90b19tYWRkcigodmFkZHJf
dCkodmEpKQo+Pj4KPj4+IFNvIHdoYXQgaXMgaGFwcGVuaW5nIGhlcmUgaXMgdGhhdCB0aGUgY2Fz
dCB0byBhbiBpbnRlZ2VyIHR5cGUgaXMgYmVpbmcKPj4+IGRvbmUgYmVmb3JlIHRoZSBzdWJ0cmFj
dGlvbi4KPj4+Cj4+PiBXaXRob3V0IHRoZSBjYXN0LCB5b3UgYXJlIGNhbGN1bGF0aW5nIHRoZSBw
b2ludGVyIHZhbHVlIF9lbmQtMSBmcm9tCj4+PiB0aGUgdmFsdWUgX2VuZCwgd2hpY2ggaXMgVUIu
wqAgV2l0aCB0aGUgY2FzdCB5b3UgYXJlIGNhbGN1bGF0aW5nIGFuCj4+PiBpbnRlZ2VyIHZhbHVl
LsKgIHZhZGRyX3QgaXMgdW5zaWduZWQsIHNvIGFsbCBhcml0aG1ldGljIG9wZXJhdGlvbnMgYXJl
Cj4+PiBkZWZpbmVkLsKgIE5vdGhpbmcgY2FzdHMgdGhlIHJlc3VsdCBiYWNrIHRvIHRoZSAiZm9y
YmlkZGVuIiAod2l0aCB0aGlzCj4+PiBwcm92ZW5hbmNlKSBwb2ludGVyIHZhbHVlLCBzbyBhbGwg
aXMgd2VsbC4KPj4+Cj4+PiAoV2l0aCB0aGUgbWFjcm8gZXhwYW5zaW9uIHRoZSBjYXN0IGhhcHBl
bnMgdHdpY2UuwqAgVGhpcyBpcyBwcm9iYWJseQo+Pj4gYmV0dGVyIHRoYW4gdXNpbmcgX192aXJ0
X3RvX21hZGRyIGhlcmUuKQo+Pj4KPj4+IEllLCBpbiB0aGlzIGNhc2UgSSBhZ3JlZSB3aXRoIFN0
ZWZhbm8uwqAgVGhlIGNhc3QgaXMgYm90aCBuZWNlc3NhcnkgYW5kCj4+PiBzdWZmaWNpZW50Lgo+
Pgo+PiBNYXliZSBJIG1pc3NlZCBzb21ldGhpbmcsIGJ1dCB3aHkgYXJlIHdlIHVzaW5nIGA8PWAg
YXQgYWxsP8KgIFdoeSBub3QgdXNlCj4+IGA8YD8KPj4KPj4gT3IgaXMgdGhpcyBzb21lIHdlaXJk
IEMgcG9pbnRlciBjb21wYXJpc29uIFVCIHRoaW5nPwo+IAo+IF9lbmQgbWF5IG5vdCBiZSBtYXBw
ZWQgaW4gdGhlIHZpcnR1YWwgYWRkcmVzcyBzcGFjZS4gVGhpcyBpcyB0aGUgY2FzZQo+IHdoZW4g
dGhlIHNpemUgb2YgWGVuIGlzIHBhZ2UtYWxpZ25lZC4gU28gX2VuZCB3aWxsIHBvaW50IHRvIHRo
ZSBuZXh0IHBhZ2UuCj4gCj4gdmlydF90b19tYWRkcigpIGNhbm5vdCBmYWlsIHNvIGl0IHNob3Vs
ZCBvbmx5IGJlIGNhbGxlZCBvbiB2YWxpZCB2aXJ0dWFsCj4gYWRkcmVzcy4gVGhlIGJlaGF2aW9y
IGlzIHVuZGVmaW5lZCBpbiBhbGwgdGhlIG90aGVyIGNhc2VzLgo+IAo+IE9uIHg4NiwgeW91IG1p
Z2h0IGJlIGFibGUgdG8gZ2V0IGF3YXkgYmVjYXVzZSB5b3UgdHJhbnNsYXRlIHRoZSB2aXJ0dWFs
Cj4gYWRkcmVzcyB0byBwaHlzaWNhbCBhZGRyZXNzIGluIHNvZnR3YXJlLgo+IAo+IE9uIEFybSwg
d2UgYXJlIHVzaW5nIHRoZSBoYXJkd2FyZSBpbnN0cnVjdGlvbiB0byBkbyB0aGUgdHJhbnNsYXRp
b24uIEFzCj4gX2VuZCBpcyBub3QgYWx3YXlzIG1hcHBlZCwgdGhlbiB0aGUgdHJhbnNsYXRpb24g
bWF5IGZhaWwuIEluIG90aGVyIHdvcmQsCj4gWGVuIHdpbGwgY3Jhc2guCgpOb25lIG9mIHRoaXMg
ZXhwbGFpbnMgbXkgcXVlc3Rpb24uCgpJcyBpdCBub3QgdGhlIGNhc2UgdGhhdCBpZiBgbWZuX3Rv
X21hZGRyKG1mbikgPD0gdmlydF90b19tYWRkcihfZW5kLTEpYAppcyB0cnVlLCB0aGVuIGBtZm5f
dG9fbWFkZHIobWZuKSA8IHZpcnRfdG9fbWFkZHIoX2VuZClgIHdpbGwgYmUgdHJ1ZSwKYW5kIHRo
YXQgaWYgYG1mbl90b19tYWRkcihtZm4pIDw9IHZpcnRfdG9fbWFkZHIoX2VuZC0xKWAgaXMgZmFs
c2UsIHRoZW4KYG1mbl90b19tYWRkcihtZm4pIDwgdmlydF90b19tYWRkcihfZW5kKWAgd2lsbCBh
bHNvIGJlIGZhbHNlPwoKVW5kZXIgd2hhdCBjb25kaXRpb25zIHdvdWxkIHRoZXkgYmUgZGlmZmVy
ZW50PwoKQW5kIGlmIHRoZXkncmUgdGhlIHNhbWUsIHRoZW4geW91IGNhbiBqdXN0IHVzZSBgPGAg
aW5zdGVhZCBvZiBgPD1gLCBhbmQKbm90IGhhdmUgdG8gd29ycnkgYWJvdXQgY2FzdGluZyBiZWZv
cmUgc3VidHJhY3RpbmcuCgogLUdlb3JnZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
