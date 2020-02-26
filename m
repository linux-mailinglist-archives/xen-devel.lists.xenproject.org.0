Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4975B16FCC7
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 11:58:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6uMd-0006BW-Re; Wed, 26 Feb 2020 10:56:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dr0i=4O=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j6uMd-0006BR-5a
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 10:56:27 +0000
X-Inumbo-ID: a1a7e132-5886-11ea-93f6-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a1a7e132-5886-11ea-93f6-12813bfff9fa;
 Wed, 26 Feb 2020 10:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582714586;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=HBNUNeKmQQJTm9zi02LbSDMXqKHBVa4Utd3i/FqNFv8=;
 b=QQpYwqsRw7iy0O6MJR11R4PF6a2govGkVNsV+DY8CvdoROE8vdtSy50H
 3K6GWwKeho3LJg9MYAmiit4Q/a8e0DB1ot0BMCZVCFmnjLt6v5YD5ZKj2
 KzydLkZIbHlsjjD+pcg2UgbTy3eC7sMIh7k8Jq6Ia936yE1m0HOjuTqCI Q=;
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
IronPort-SDR: 1uDwa8f2GnSoge4q/YehKYqo5JE2MM1SmWt7oirVajY2ynvzsZ6rrAyMtnoWiufC7f4oUjidBf
 MNjvWlmN9KEusSCrl+NC+ZGhBRJR+1Bje0M/IbESuIlpti4wGQVA8rLiPxRe8lfUJWgOFnKWlB
 h2Dg2erKXmF7hDa76xGx+Mp/khmI1DKyR/nzcT/ih50FHPdr6P24PmClzue+aB/w0iaZG3c/2w
 ib77AMQgAJh1nLglSSgyGd3xm4S0PnXZSpN7wSx86Dy6r+R2WVWzRWNJEgk4gyiDmAuvt/SrcG
 jr4=
X-SBRS: 2.7
X-MesageID: 13011249
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,487,1574139600"; d="scan'208";a="13011249"
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <1B925CC0CD9F3341B32D442251E7E1DC3E3DBF54@SHSMSX104.ccr.corp.intel.com>
 <b33cc365-6537-d816-8a89-eadd514a2427@suse.com>
 <20200226100937.GA24458@Air-de-Roger.citrite.net>
 <75a795c2-4218-5e1a-7db8-4167e69fabca@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9746ed58-b786-011d-5890-22a1a12195f7@citrix.com>
Date: Wed, 26 Feb 2020 10:56:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <75a795c2-4218-5e1a-7db8-4167e69fabca@suse.com>
Content-Language: en-US
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/vPMU: don't blindly assume
 IA32_PERF_CAPABILITIES MSR exists
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Hao,
 Xudong" <xudong.hao@intel.com>, Wei Liu <wl@xen.org>, "Chen, 
 Farrah" <farrah.chen@intel.com>, "Gao, Chao" <chao.gao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYvMDIvMjAyMCAxMDozOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjYuMDIuMjAyMCAx
MTowOSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4gT24gV2VkLCBGZWIgMjYsIDIwMjAgYXQg
MTA6MTk6MTlBTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBKdXN0IGxpa2UgVk1YJ2Vz
IGxicl90c3hfZml4dXBfY2hlY2soKSB0aGUgcmVzcGVjdGl2ZSBDUFVJRCBiaXQgc2hvdWxkCj4+
PiBiZSBjb25zdWx0ZWQgZmlyc3QuCj4+Pgo+Pj4gUmVwb3J0ZWQtYnk6IEZhcnJhaCBDaGVuIDxm
YXJyYWguY2hlbkBpbnRlbC5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+Cj4+Pgo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2NwdS92cG11X2ludGVs
LmMKPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvdnBtdV9pbnRlbC5jCj4+PiBAQCAtOTAwLDcg
KzkwMCw2IEBAIGludCB2bXhfdnBtdV9pbml0aWFsaXNlKHN0cnVjdCB2Y3B1ICp2KQo+Pj4gIAo+
Pj4gIGludCBfX2luaXQgY29yZTJfdnBtdV9pbml0KHZvaWQpCj4+PiAgewo+Pj4gLSAgICB1NjQg
Y2FwczsKPj4+ICAgICAgdW5zaWduZWQgaW50IHZlcnNpb24gPSAwOwo+Pj4gICAgICB1bnNpZ25l
ZCBpbnQgaTsKPj4+ICAKPj4+IEBAIC05MzIsOCArOTMxLDE0IEBAIGludCBfX2luaXQgY29yZTJf
dnBtdV9pbml0KHZvaWQpCj4+PiAgCj4+PiAgICAgIGFyY2hfcG1jX2NudCA9IGNvcmUyX2dldF9h
cmNoX3BtY19jb3VudCgpOwo+Pj4gICAgICBmaXhlZF9wbWNfY250ID0gY29yZTJfZ2V0X2ZpeGVk
X3BtY19jb3VudCgpOwo+Pj4gLSAgICByZG1zcmwoTVNSX0lBMzJfUEVSRl9DQVBBQklMSVRJRVMs
IGNhcHMpOwo+Pj4gLSAgICBmdWxsX3dpZHRoX3dyaXRlID0gKGNhcHMgPj4gMTMpICYgMTsKPj4+
ICsKPj4+ICsgICAgaWYgKCBjcHVfaGFzX3BkY20gKQo+Pj4gKyAgICB7Cj4+PiArICAgICAgICB1
aW50NjRfdCBjYXBzOwo+Pj4gKwo+Pj4gKyAgICAgICAgcmRtc3JsKE1TUl9JQTMyX1BFUkZfQ0FQ
QUJJTElUSUVTLCBjYXBzKTsKPj4+ICsgICAgICAgIGZ1bGxfd2lkdGhfd3JpdGUgPSAoY2FwcyA+
PiAxMykgJiAxOwo+PiBXaWxsIFBNVSB3b3JrIHdpdGhvdXQgUERDTT8KClRoZSBwZXJmb3JtYW5j
ZSBjb3VudGVyIGludGVyZmFjZSBpbiBDUFVzIHByZWRhdGUgdGhlIGludHJvZHVjdGlvbiBvZgpQ
RVJGX0NBUFMuCgo+PiBJJ3ZlIGJlZW4gZ3JlcHBpbmcgdGhlIEludGVsIFNETXMsIGJ1dCB0aGUg
b25seSBtZW50aW9uIGlzIHRoYXQgUERDTQo+PiBzaWduYWwgdGhlIGF2YWlsYWJpbGl0eSBvZiBN
U1JfSUEzMl9QRVJGX0NBUEFCSUxJVElFUy4KPiBXZWxsLCB0aGVyZSdzIG5vIG90aGVyIHVzZSBv
ZiB0aGUgTVNSIGFmYWljcyBleGNlcHQgZm9yIGdldHRpbmcKPiB0aGUgb25lIGJpdCBoZXJlLCBz
byBJIGFzc3VtZSBpdCdsbCB3b3JrLgoKSXQgaXMgYW4gb2ZmLWJ5LWRlZmF1bHQsIG91dHNpZGUg
c2VjdXJpdHkgc3VwcG9ydCBhcmVhIG9mIGZ1bmN0aW9uYWxpdHkKd2l0aCBrbm93biBmdW5jdGlv
bmFsIGJ1Z3Mgb3V0c3RhbmRpbmcgYWdhaW5zdCBpdC4KCiJub3QgY3Jhc2giIGlzIGEgZmluZSBp
bXByb3ZlbWVudCBvbiB0aGUgc3RhdHVzIHF1by4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
