Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA507672E
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 15:19:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr05f-0004s9-8R; Fri, 26 Jul 2019 13:16:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOBC=VX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hr05d-0004s4-VF
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 13:16:53 +0000
X-Inumbo-ID: a1d847a3-afa7-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a1d847a3-afa7-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 13:16:52 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: u9t8micTIe8MxnBN9e8HTan9EtZ60UICJaMGSnmzjLD2wtqLYgefxH7vxePKjEtP6DhQ9kRyUN
 D1QmDPDnb5DB385ugXLx2f5oE74UWoqrd+fzJkNv5FUHlyypt56tmE/OUaFz+IHXlKXMKFW/Nw
 jjq2n4oNY2MpeslM5H5DMEfxsyqCEq1fuQDrnx5p2t3t4PbEEgGYmClGDl+kPvznINJ5M+0vwP
 3O7pcSF57rmG5pxCO+HMnoPxZk7jBXf6tkNNiMKB9ZVOzu1+xwkJUTTaqr6plHwokQkJG8CPs4
 stM=
X-SBRS: 2.7
X-MesageID: 3490229
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,310,1559534400"; 
   d="scan'208";a="3490229"
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <20190726101057.21324-1-andrew.cooper3@citrix.com>
 <CABfawhncHLf=TTU8kHvFqCQxdjKOXuRaNT-stOi3wM7NLu3WWg@mail.gmail.com>
 <fee2771d-3b56-c22a-10be-de8aa23a0cc3@citrix.com>
 <CABfawhkcKFXucB=dfVQUoeN+iBeJSc__rmMHtBr4hahjCqNDnw@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <764c3c81-4348-0d5d-e7b8-a14b0b2b4abb@citrix.com>
Date: Fri, 26 Jul 2019 14:16:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CABfawhkcKFXucB=dfVQUoeN+iBeJSc__rmMHtBr4hahjCqNDnw@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH RFC] x86/shim: Refresh pvshim_defconfig
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <JBeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYvMDcvMjAxOSAxNDoxMCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIEZyaSwgSnVs
IDI2LCAyMDE5IGF0IDY6NTggQU0gQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4gd3JvdGU6Cj4+IE9uIDI2LzA3LzIwMTkgMTM6NTUsIFRhbWFzIEsgTGVuZ3llbCB3cm90
ZToKPj4+IE9uIEZyaSwgSnVsIDI2LCAyMDE5IGF0IDQ6MTEgQU0gQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+Pj4gKiBBZGQgYSBkZXBlbmRlbmN5IHNv
IHRoZSBzaGltIGdldHMgcmVidWlsdCB3aGVuIHB2c2hpbV9kZWZjb25maWcgY2hhbmdlcy4KPj4+
PiAqIERlZmF1bHQgdG8gdGhlIE5VTEwgc2NoZWR1bGVyIG5vdyB0aGF0IGl0IHdvcmtzIHdpdGgg
dmNwdSBvbmxpbmUvb2ZmbGluZS4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4+Pj4gLS0tCj4+Pj4gQ0M6IEphbiBCZXVs
aWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KPj4+PiBDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPj4+
PiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+Pj4gQ0M6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPj4+PiBDQzogRGFyaW8gRmFnZ2lvbGkgPGRm
YWdnaW9saUBzdXNlLmNvbT4KPj4+Pgo+Pj4+IFRoaXMgcGF0Y2ggZGVwZW5kcyBvbiBEYXJpbydz
IHNlcmllcywgYW5kIGNhbnQgZ28gaW4gdW50aWwgdGhlbi4KPj4+Pgo+Pj4+IEFsc28gUkZDLgo+
Pj4+Cj4+Pj4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4K
Pj4+PiBDQzogVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgo+Pj4+Cj4+Pj4g
SSB0cmllZCB0dXJuaW5nIG9mZiBNRU1fQUNDRVNTLCBidXQgSSBjYW4ndCBnZXQgS2NvbmZpZyB0
byBhY3R1YWxseSB0dXJuIGl0Cj4+Pj4gb2ZmIGluIHRoZSBidWlsZC4gIFdoYXQgaXMgdGhlIGRl
YWwgd2l0aCBNRU1fQUNDRVNTX0FMV0FZU19PTiA/ICBJdCBtYWtlcyBpdAo+Pj4+IGltcG9zc2li
bGUgdG8gdHVybiBNRU1fQUNDRVNTIG9mZiwgYmVjYXVlIGl0IGlzIHNlbGVjdGVkIGJ5IHg4Niwg
d2hpY2ggbGVhdmVzCj4+Pj4gTUVNX0FDQ0VTUyBlbmFibGVkIGFuZCB1bm1vZGlmaWFibGUuCj4+
PiBXZSBuZXZlciBtYWRlIGl0IGNvbmZpZ3VyYWJsZSB0byBoYXZlIE1FTV9BQ0NFU1MgYmUgZGlz
YWJsZWQgb24geDg2Lgo+Pj4gVGhlIG9wdGlvbiBvbmx5IGV4aXN0cyBiZWNhdXNlIHdoZW4gSSBz
dGFydGVkIG1vdmluZyB2bV9ldmVudCB0bwo+Pj4gY29tbW9uIGNvZGUgaXQgaGFkIHRvIGJlIGRp
c2FibGVkIGZvciBBUk0gYXQgZmlyc3QuIFRoZW4gaXQgbG9va3MgbGlrZQo+Pj4gU3RlZmFubyBk
aWQgbWFrZSBpdCBjb25maWd1cmFibGUgZm9yIEFSTSBzbyB0aGVyZSBpdCBjYW4gYWN0dWFsbHkg
YmUKPj4+IGRpc2FibGVkLgo+PiBJcyBpdCBzb21ldGhpbmcgd2UgY291bGQgY29uc2lkZXIgbWFr
aW5nIGNvbmZpZ3VyYWJsZSBhdCB0aGlzIHBvaW50Pwo+PiBJdHMgY2VydGFpbmx5IHNvbWV0aGlu
ZyB3ZSdkIHdhbnQgdG8gdHVybiBvZmYgaW4gdGhlIFBWIHNoaW0gYnVpbGQuCj4+Cj4+IFdoaWxl
IHRoaW5raW5nIGFib3V0IGl0LCBpdCBpcyBzcGVjaWZpYyB0byBIVk0gZ3Vlc3RzLCBzbyBvdWdo
dCB0bwo+PiBkZXBlbmQgb24gQ09ORklHX0hWTSBhbnl3YXksIHdoaWNoIG1pZ2h0IGJlIHRoZSBl
YXNpZXN0IHdheSB0byBleGNsdWRlCj4+IGl0IGZvciB0aGUgUFYgc2hpbSBidWlsZCBpZiB3ZSBk
b24ndCB3YW50IHRvIG1ha2UgaXQgYWN0aXZlbHkKPj4gY29uZmlndXJhYmxlIHlldC4KPiBTdXJl
LCBJIHdvdWxkIEFjayBhIHBhdGNoIHRoYXQgbWFrZXMgaXQgY29uZmlndXJhYmxlLiBUaGVyZSB3
ZXJlIHNvbWUKPiB3b3JrcyBpbiB0aGUgcGFzdCB0byBtYWtlIG1lbV9hY2Nlc3MgZm9yIFBWIGRv
bWFpbnMgYXMgd2VsbCBidXQgdGhhdAo+IHdhcyBhIHdoaWxlIGFnbywgSSBkb24ndCB0aGluayBh
bnlvbmUgaGFzIGludGVyZXN0IGluIHRoYXQgYW55bW9yZS4KClRoZSBhY2Nlc3MgcmluZyBpcyBv
YnRhaW5lZCB2aWEgYW4gSFZNX1BBUkFNLsKgIFRoZXJlIGlzIG5vIGNvbmNlaXZhYmxlCndheSBp
dCB3b3JrcyBmb3IgUFYuCgpUaGlzIGlzIG9uZSBvZiB0aGUgcmVhc29ucyBmb3IgdGhlIGRpZmZl
cmVudCBkZXNpZ24gb2YgIk5HIiBpbnRlcmZhY2UKd2hpY2ggUGV0cmUgaXMgZG9pbmcsIHNvIGZ1
bmN0aW9uYWxpdHkgbGlrZSB0aGlzIGNvdWxkIChpbiBwcmluY2lwbGUpIGJlCm1hZGUgY29tcGF0
aWJsZSB3aXRoIFBWIGluIHRoZSBmdXR1cmUuCgo+IE1ha2luZyBpdCBkZXBlbmQgb24gSFZNIGZv
ciB4ODYgYnVpbGRzIHNvdW5kcyByZWFzb25hYmxlIHRvIG1lLCBub3QKPiBzdXJlIGlmIHRoYXQg
d291bGQgd29yayBmb3IgQVJNIHRob3VnaCBhcyBJIGRvbid0IHRoaW5rIGl0IGhhcyBIVk0KPiBj
b25maWcgb3B0aW9uLiBBbnl3YXksIGlmIHNvbWVvbmUgbWFrZXMgY2hhbmdlcyB0byB0aGlzIEkg
d291bGQgaGlnaGx5Cj4gcHJlZmVyIHRvIGdldCByaWQgb2YgdGhlIE1FTV9BQ0NFU1NfQUxXQVlT
X09OIGNvbmZpZyBvcHRpb24gYXMgaXQncyBhCj4gY29uZnVzaW5nIG9wdGlvbiBuYW1lLgoKT2sg
LSBJJ2xsIHNlZSBhYm91dCBmaW5kaW5nIHNvbWUgY29waW91cyBmcmVlIHRpbWUuCgp+QW5kcmV3
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
