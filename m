Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 203C127C69
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2019 14:04:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTmNk-0003gB-FV; Thu, 23 May 2019 11:59:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=52eM=TX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hTmNi-0003g6-39
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 11:59:34 +0000
X-Inumbo-ID: 379d1646-7d52-11e9-8e50-eb7f3039dd6e
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 379d1646-7d52-11e9-8e50-eb7f3039dd6e;
 Thu, 23 May 2019 11:59:29 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: UtiBUwhKZgwyAlGFgxJscrELx1WkmyAsJmOLKvXEC17pDZqNmW+ILTSHUFVWslTNE41ggygN7/
 3/zt4IhLsaxSt7zO+CnoSxkbCtBECuDukL5t9UK3gw+eVuMZQb2dtcz1wrYYkY1HVjm5XnvSxM
 MEbKg+eFXJXJFYs9KgFVrzu3NuBJ3mzeguhJln+0xYRmume60lyM+3VAgs/fLDEvjUX+lTqLnW
 D78sSki4YlAjjv0MOs+RhnCSH4AA/Wv3fzjL3E2KTveRFNbqsr7bVFGubMloNZWdnm3Gnyx1uX
 Fo0=
X-SBRS: 2.7
X-MesageID: 823195
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,502,1549947600"; 
   d="scan'208";a="823195"
To: Jan Beulich <JBeulich@suse.com>
References: <1558540230-26612-1-git-send-email-andrew.cooper3@citrix.com>
 <1558607223-19630-1-git-send-email-andrew.cooper3@citrix.com>
 <5CE689970200007800231AD9@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <2c57c495-3149-f883-ac6c-3db50334d21b@citrix.com>
Date: Thu, 23 May 2019 12:59:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CE689970200007800231AD9@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] libx86: Introduce wrappers for extracting
 XCR0/XSS from a cpuid policy
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMvMDUvMjAxOSAxMjo1MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjMuMDUuMTkg
YXQgMTI6MjcsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gLS0tIGEveGVu
L2FyY2gveDg2L3hzdGF0ZS5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni94c3RhdGUuYwo+PiBAQCAt
NjYwLDkgKzY2MCw3IEBAIHN0YXRpYyBib29sIHZhbGlkX3hjcjAodTY0IHhjcjApCj4+ICBpbnQg
dmFsaWRhdGVfeHN0YXRlKGNvbnN0IHN0cnVjdCBkb21haW4gKmQsIHVpbnQ2NF90IHhjcjAsIHVp
bnQ2NF90IHhjcjBfYWNjdW0sCj4+ICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCB4
c2F2ZV9oZHIgKmhkcikKPj4gIHsKPj4gLSAgICBjb25zdCBzdHJ1Y3QgY3B1aWRfcG9saWN5ICpj
cCA9IGQtPmFyY2guY3B1aWQ7Cj4+IC0gICAgdWludDY0X3QgeGNyMF9tYXggPQo+PiAtICAgICAg
ICAoKHVpbnQ2NF90KWNwLT54c3RhdGUueGNyMF9oaWdoIDw8IDMyKSB8IGNwLT54c3RhdGUueGNy
MF9sb3c7Cj4+ICsgICAgdWludDY0X3QgeGNyMF9tYXggPSBjcHVpZF9wb2xpY3lfeGNyMChkLT5h
cmNoLmNwdWlkKTsKPj4gICAgICB1bnNpZ25lZCBpbnQgaTsKPj4gIAo+PiAgICAgIGlmICggKGhk
ci0+eHN0YXRlX2J2ICYgfnhjcjBfYWNjdW0pIHx8Cj4+IEBAIC02ODYsOSArNjg0LDcgQEAgaW50
IHZhbGlkYXRlX3hzdGF0ZShjb25zdCBzdHJ1Y3QgZG9tYWluICpkLCB1aW50NjRfdCB4Y3IwLCB1
aW50NjRfdCB4Y3IwX2FjY3VtLAo+PiAgaW50IGhhbmRsZV94c2V0YnYodTMyIGluZGV4LCB1NjQg
bmV3X2J2KQo+PiAgewo+PiAgICAgIHN0cnVjdCB2Y3B1ICpjdXJyID0gY3VycmVudDsKPj4gLSAg
ICBjb25zdCBzdHJ1Y3QgY3B1aWRfcG9saWN5ICpjcCA9IGN1cnItPmRvbWFpbi0+YXJjaC5jcHVp
ZDsKPj4gLSAgICB1aW50NjRfdCB4Y3IwX21heCA9Cj4+IC0gICAgICAgICgodWludDY0X3QpY3At
PnhzdGF0ZS54Y3IwX2hpZ2ggPDwgMzIpIHwgY3AtPnhzdGF0ZS54Y3IwX2xvdzsKPj4gKyAgICB1
aW50NjRfdCB4Y3IwX21heCA9IGNwdWlkX3BvbGljeV94Y3IwKGN1cnItPmRvbWFpbi0+YXJjaC5j
cHVpZCk7Cj4gSW4gYm90aCBjYXNlcyB0aGUgdmFyaWFibGVzIGFyZSBtb3JlIGFwcHJvcHJpYXRl
bHkgbmFtZWQgdGhhbgo+IHRoZSBuZXcgaGVscGVyLiBXaGlsZSBJIGFncmVlIGl0J3Mgc2xpZ2h0
bHkgbW9yZSB0eXBpbmcsIGRpZCB5b3UKPiBjb25zaWRlciBjYWxsaW5nIGl0IGNwdWlkX3BvbGlj
eV94Y3IwX21heCgpPwoKRmluZS4KCj4KPj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2xpYi94ODYv
Y3B1aWQuaAo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbGliL3g4Ni9jcHVpZC5oCj4+IEBAIC0z
MDgsNiArMzA4LDE4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBjcHVpZF9mZWF0dXJlc2V0X3RvX3Bv
bGljeSgKPj4gICAgICBwLT5mZWF0Ll83YTEgID0gZnNbRkVBVFVSRVNFVF83YTFdOwo+PiAgfQo+
PiAgCj4+ICtzdGF0aWMgaW5saW5lIHVpbnQ2NF90IGNwdWlkX3BvbGljeV94Y3IwKGNvbnN0IHN0
cnVjdCBjcHVpZF9wb2xpY3kgKnApCj4+ICt7Cj4+ICsgICAgcmV0dXJuICgodWludDY0X3QpcC0+
eHN0YXRlLnhjcjBfaGlnaCA8PCAzMikgfCBwLT54c3RhdGUueGNyMF9sb3c7Cj4+ICt9Cj4+ICsK
Pj4gK3N0YXRpYyBpbmxpbmUgdWludDY0X3QgY3B1aWRfcG9saWN5X3hzdGF0ZXMoY29uc3Qgc3Ry
dWN0IGNwdWlkX3BvbGljeSAqcCkKPj4gK3sKPj4gKyAgICB1aW50NjRfdCB2YWwgPSBwLT54c3Rh
dGUueGNyMF9oaWdoIHwgcC0+eHN0YXRlLnhzc19oaWdoOwo+PiArCj4+ICsgICAgcmV0dXJuICh2
YWwgPDwgMzIpIHwgcC0+eHN0YXRlLnhjcjBfbG93IHwgcC0+eHN0YXRlLnhzc19sb3c7Cj4+ICt9
Cj4gSG93IGFib3V0IGFsc28gaGF2aW5nIGNwdWlkX3BvbGljeV94c3MoKSAob3IgY3B1aWRfcG9s
aWN5X3hzc19tYXgoKSkKPiBhbmQgdGhlbiBzaW1wbHkgbWFraW5nIGNwdWlkX3BvbGljeV94c3Rh
dGVzKCkgY29tYmluZSB0aGUgdHdvCj4gcmVzdWx0cz8KCkkgc3RhcnRlZCB3aXRoIHRoYXQsIGJ1
dCB0aGUgcmVzdWx0aW5nIGNvZGUgd2FzIGEgbGl0dGxlIGF3a3dhcmQgdG8KcmVhZCwgYW5kIHRo
ZSBhc20gZ2VuZXJhdGlvbiB3YXMgYSBsaXR0bGUgd29yc2UgZHVlIHRvIHByb21vdGluZwpldmVy
eXRoaW5nIGZpcnN0LgoKSSBkb24ndCB0aGluayB3ZSBuZWVkIGNwdWlkX3BvbGljeV94c3N7LF9t
YXh9KCkgdW50aWwgd2UgYWN0dWFsbHkKaW1wbGVtZW50IHNvbWV0aGluZyBmb3IgZ3Vlc3RzICht
b3N0IGxpa2VseSBDRVQgYXQgdGhpcyByYXRlKS4KCj4KPiBBbnl3YXksIGFzIEkgY2FuIGFsc28g
bGl2ZSB3aXRoIHRoaW5ncyBhcyB0aGV5IGFyZSwgd2l0aCBvciB3aXRob3V0Cj4gZWl0aGVyIG9m
IHRoZSBzdWdnZXN0ZWQgY2hhbmdlcwo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+CgpUaGFua3MgKGFsdGhvdWdoIEknbSBzdGlsbCBoYXBweSB0byBwbGF5IGFy
b3VuZCB3aXRoIG5hbWluZykuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
