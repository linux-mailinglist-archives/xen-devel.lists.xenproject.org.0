Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CAF13C143
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 13:42:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irhyN-0008FT-Be; Wed, 15 Jan 2020 12:40:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aRIg=3E=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1irhyL-0008FN-KM
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 12:40:33 +0000
X-Inumbo-ID: 334d0fae-3794-11ea-b89f-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 334d0fae-3794-11ea-b89f-bc764e2007e4;
 Wed, 15 Jan 2020 12:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579092025;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=7f4N30+PEZBVLztY//KS9JB8S2C88Gr/NHpjaW3DDIE=;
 b=Wx4IS6tNQQ/S7zictGnOW5xs8Wsth934atjmlpmlZP4F1djvpbxft1De
 +ld600ScbAA8C9lM5k7VyEN97BvZuY0620y+p6Cp1UE8iMiwK413gaa15
 dIug/mj/XSwNMf3/x7JZTOiWeBa3zOL2chs+t86j7OVbSdMmCwudoUget U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: C8YNQyMgG8+g3RWwkeNnbB2kOa+YFIeRrllSXAhrPyvIiAHBxDX0Y44i62yXE4j2fF+T2AAdxC
 dZxA9BXG5EpLrwwxNUtM9biW7GQoJ6VSMv/98/th/Cptv8hq/rT/eqcOb6xNwULuRsSBSodMOq
 ioUnGKG1dOc2hNXFTgE1YbV8i6Eldo+9jUND2IJnFZjYQcaRH7x/sT/LYe4rTA5etwe7kz9wxf
 O+1LuMo9hHiSHMCa4TgQ6Cim40LYeyLDu7eCCrLS+ZMBQCydJe7z4BIA+F4gyWnKXL1e0DfKxK
 X3I=
X-SBRS: 2.7
X-MesageID: 10935993
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,322,1574139600"; d="scan'208";a="10935993"
To: Jan Beulich <jbeulich@suse.com>
References: <20200114203545.8897-1-andrew.cooper3@citrix.com>
 <ad6edefe-a295-d00b-179b-c95efc5f34b0@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <436c2c07-a1a8-b5b4-5ddb-7d205ba28f3c@citrix.com>
Date: Wed, 15 Jan 2020 12:40:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ad6edefe-a295-d00b-179b-c95efc5f34b0@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] xen/list: Remove prefetching
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUvMDEvMjAyMCAxMToxNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTQuMDEuMjAyMCAy
MTozNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gWGVuIGluaGVyaXRlZCBpdHMgbGlzdCBpbmZy
YXN0cnVjdHVyZSBmcm9tIExpbnV4LiAgT25lIGFyZWEgd2hlcmUgaGFzIGZhbGxlbgo+PiBiZWhp
bmQgaXMgdGhhdCBvZiBwcmVmZXRjaGluZywgd2hpY2ggYXMgaXQgdHVybnMgb3V0IGlzIGEgcGVy
Zm9ybWFuY2UgcGVuYWx0eQo+PiBpbiBtb3N0IGNhc2VzLgo+Pgo+PiBQcmVmZXRjaCBvZiBOVUxM
IG9uIHg4NiBpcyBub3cgd2lkZWx5IG1lYXN1cmVkIHRvIGhhdmUgZ2xhY2lhbCBwZXJmb3JtYW5j
ZQo+PiBwcm9wZXJ0aWVzLCBhbmQgd2lsbCB1bmNvbmRpdGlvbmFsbHkgaGl0IG9uIGV2ZXJ5IGhs
aXN0IHVzZSBkdWUgdG8gdGhlCj4+IHRlcm1pbmF0aW9uIGNvbmRpdGlvbi4KPj4KPj4gQ3Jvc3Mt
cG9ydCB0aGUgZm9sbG93aW5nIExpbnV4IHBhdGNoZXM6Cj4+Cj4+ICAgNzVkNjVhNDI1YyAoMjAx
MSkgImhsaXN0OiByZW1vdmUgc29mdHdhcmUgcHJlZmV0Y2hpbmcgaW4gaGxpc3QgaXRlcmF0b3Jz
Igo+PiAgIGU2NmVlZDY1MWYgKDIwMTEpICJsaXN0OiByZW1vdmUgcHJlZmV0Y2hpbmcgZnJvbSBy
ZWd1bGFyIGxpc3QgaXRlcmF0b3JzIgo+PiAgIGMwZDE1Y2M3ZWUgKDIwMTMpICJsaW5rZWQtbGlz
dDogUmVtb3ZlIF9fbGlzdF9mb3JfZWFjaCIKPiBKdXN0IGFzIGFuIG9ic2VydmF0aW9uIChub3Qg
YW4gb2JqZWN0aW9uKSwgdGhlIDJuZCBvZiB0aGVzZSBzYXlzCj4gIm5vcm1hbGx5IHRoZSBkb3du
c2lkZXMgYXJlIGJpZ2dlciB0aGFuIHRoZSB1cHNpZGVzIiwgd2hpY2ggbWFrZXMKPiBpdCB1bmJl
bGlldmFibHkgY2xlYXIgd2hhdCB0aGVzZSBzdXBwb3NlZCBkb3duc2lkZXMgYXJlLiBJIGNhbgo+
IGFjY2VwdCBwcmVmZXRjaGVzIHRocm91Z2ggTlVMTCB0byBiZSBoYXJtZnVsLiBJIGNhbiBhbHNv
IGFjY2VwdAo+IHByZWZldGNoZXMgb24gc2luZ2xlIGVudHJ5IGxpc3RzIHRvIG5vdCBiZSB2ZXJ5
IHVzZWZ1bC4gQnV0IGRvZXMKPiB0aGlzIGFsc28gcmVuZGVyIHRoZW0gdXNlbGVzcyBvbiBsb25n
IGxpc3RzIHdpdGggbm90IG92ZXJseSBtdWNoCj4gY2FjaGUgY2h1cm4gZG9uZSBieSB0aGUgYm9k
eSBvZiB0aGUgaXRlcmF0aW9uIGxvb3A/CgpZZXMuCgpQcmVmZXRjaCBpcyBvbmx5IHVzZWZ1bCB3
aGVuIHlvdSdyZSBtYWtpbmcgYW4gYWNjZXNzIHdoaWNoIG5vbmUgb2YgdGhlCmhhcmR3YXJlIHBy
ZWZldGNoZXJzIGNhbiBwcmVkaWN0LCBhbmQgdGhhdCB0aGUgY29zdHMgKGV4dHJhIGluc3RydWN0
aW9uLApMMSBjYWNoZSBwZXJ0dXJiYW5jZSwgYW5kIHR5aW5nIHVwIHRoZSBwYWdld2Fsa2VyIGZv
ciBhIHdoaWxlKSBhcmUKb3V0d2VpZ2hlZCBieSB0aGUgcGVyZiBpbXByb3ZlbWVudCBmcm9tIG5v
dCBzdGFsbGluZyBhZ2FpbnN0IHRoZSBhY2Nlc3MuCgpBIHByb2dyYW1tZXIgY2Fubm90IGZpZ3Vy
ZSB0aGlzIG91dCBieSBqdXN0IGxvb2tpbmcgYXQgdGhlIEMuwqAgVGhlCmRldGFpbHMgYXJlIG1p
Y3JvLWFyY2hpdGVjdHVyYWwsIGFuZCBiYXNlZCBvbiByYXJlIGFuZCB1bnByZWRpY3RhYmxlCmRh
dGEgYWNjZXNzIHBhdHRlcm5zLsKgIChJbmNvcnJlY3RseSkgdHlpbmcgdXAgdGhlIHBhZ2V3YWxr
ZXIgZWFybHkgY2FuCmJlIGZhciBtb3JlIGRldHJpbWVudGFsIHRvIHBlcmZvcm1hbmNlIHRoYW4g
dG8gaGF2ZSBmb3J3YXJkIHNwZWN1bGF0aW9uCnB1bGwgaXQgaW4gYXQgdGhlIG5leHQgdGltZSB0
aGF0IHRoZXJlIGlzIGF2YWlsYWJsZSBtaWNyby1hcmNoaXRlY3R1cmFsCnJlc291cmNlIHRvIGRv
IHNvLgoKPiBXb3VsZG4ndCBpdAo+IGF0IGxlYXN0IGJlIHdvcnRod2hpbGUgdG8gaGF2ZSBsaXN0
X2Zvcl9lYWNoX3ByZWZldGNoKCkgcmV0YWluaW5nCj4gcHJpb3IgYmVoYXZpb3IsIGFuZCB1c2Ug
aXQgaW4gcGxhY2VzIHdoZXJlIHByZWZldGNoaW5nIGNhbiBiZQo+IGRlZW1lZCB0byBoZWxwPwoK
Tm8sIEkgZG9uJ3QgdGhpbmsgc28uwqAgVGhlIHJlcGV0aXRpdmUgcGF0dGVybiBvZiBhIGxvb3Ag
aXMgZWFzeSBmb3IKaGFyZHdhcmUgdG8gc3BvdC4KClRoZSBjYXNlcyB3aGVyZSBwcmVmZXRjaGlu
ZyBoZWxwcyBpbiBwcmFjdGljZSBhcmUgdGhlIG9uZS1vZmYgdG90YWxseQp1bnByZWRpY3RhYmxl
IGFjY2Vzc2VzIHdoaWNoIGFyZSBzdWRkZW5seSBnb2luZyB0byBibG9jayBhbGwgb3RoZXIKaW5z
dHJ1Y3Rpb25zIGluIGZsaWdodCwgKmFuZCogeW91IGFyZSBub3QgZ29pbmcgdG8gaW5jdXIgYSBU
TEIgbWlzcyBpbgp0aGUgc2hvcnQgdGVybS4KClRoaXMgaXMgd2h5IEkgbWFkZSB0aGUgcHJlZmV0
Y2goKSBzdWdnZXN0aW9uIGZvciB5b3VyIHN2bV9sb2FkX3NlZ3MoKQpjb2RlLsKgIFRoZSBtZW1v
cnkgb3BlcmFuZCBpcyB1c2VkIG9uY2UgcGVyIGNvbnRleHQgc3dpdGNoLCBzbyB2ZXJ5Cmxpa2Vs
eSB0byBoYXZlIGZhbGxlbiBvdXQgb2YgdGhlIGNhY2hlIGFuZCBUTEIsIGFuZCBWTUxPQUQgaXMK
bWljcm9jb2RlZCwgc28gYSBzdGFsbGluZyBibGFjayBib3ggYXMgZmFyIGFzIGZvcndhcmQgc3Bl
Y3VsYXRpb24gZ29lcy7CoApBcyB0aGUgY29kZSBsZWFkaW5nIHVwIHRvIGl0IGlzIG9wZXJhdGlu
ZyBpbiBob3QgVExCIG1hcHBpbmdzLCB0aGUKcGFnZXdhbGtlciBpcyBmcmVlIGFoZWFkIG9mIHRp
bWUgdG8gY29tcGxldGUgdGhlIGZpbGwuCgpUaGVyZSBhcmUgY2FzZXMgd2hlcmUgcHJlZmV0Y2go
KSByZWFsbHkgbWFrZXMgYSBkaWZmZXJlbmNlLCBidXQgdGhleSBhcmUKcmFyZSBhbmQgdGhlIGhh
cmR3YXJlIHZlbmRvcnMgaGF2ZSBhbHJlYWR5IG9wdGltaXNlZCB0aGUgY29tbW9uIGRhdGEKYWNj
ZXNzIHBhdHRlcm5zIGluIHByb2dyYW1zLgoKSXQgaXMgYWxzbyBoaWdobHkgdGVsbGluZyB0aGF0
IGluIG5lYXJseSBhIGRlY2FkZSwgTGludXggc3RpbGwgaGFzbid0CmZvdW5kIGEgY2FzZSB3YXJy
YW50aW5nIHRoZSByZS1pbnRyb2R1Y3Rpb24gb2YgcHJlZmV0Y2hlcyBvbiB0aGUgbG9vcAplbnRy
eSBtZXRhZGF0YS4KCk9mIGNvdXJzZSwgaWYgc29tZW9uZSBkb2VzIGZpbmQgYSBjYXNlLCB3ZSBj
YW4gcmVjb25zaWRlciwgYnV0IEkgZG91YnQKaXQgd2lsbCBldmVyIGNvbWUgdXAsIGFuZCBtaXN1
c2Ugb2Ygc3VjaCBhIGxpc3QgaXRlcmF0b3IgY2FuIGVhc2lseSBkbwptb3JlIGRhbWFnZSB0aGFu
IGdvb2QuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
