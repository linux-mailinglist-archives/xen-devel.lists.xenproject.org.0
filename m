Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BB97AE27
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 18:38:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsV7C-0002j3-Md; Tue, 30 Jul 2019 16:36:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x3jf=V3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hsV7B-0002ip-G5
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 16:36:41 +0000
X-Inumbo-ID: 320b927c-b2e8-11e9-9213-0ba74332f376
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 320b927c-b2e8-11e9-9213-0ba74332f376;
 Tue, 30 Jul 2019 16:36:35 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vdZ2gqpH1L0pMhKx6Q5FtYAzmuMop29skGh6eUOuzcXGX8d4W9pTBU59MQkcPvybbi/J4c1Z46
 fPBQwpz0ml8pW2JAq31GSSyqoaU8rQydIGUjYMZ0qG2XFXjudAbrNdiO4z3we2VAbzsnwGLgzs
 hLn76+0gqZW1I+7qOF7dHvH06QqmylEgVTxr5qKSEc3+nZZmrpC0ERqrI2DaJoz17CcixN9ZcJ
 hKwJKOt3/AkGbD15ckfBu6GTsftS/O/QZrlv1FB2Hrz3gqsCrgTEbzOg29jSakMrlLhfSwOxjI
 lnk=
X-SBRS: 2.7
X-MesageID: 3625018
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,327,1559534400"; 
   d="scan'208";a="3625018"
To: Jan Beulich <JBeulich@suse.com>
References: <20190729173843.21586-1-andrew.cooper3@citrix.com>
 <20190729173843.21586-2-andrew.cooper3@citrix.com>
 <446e9293-2689-39cb-9086-19abd6702431@suse.com>
 <fb4f5507-11aa-d197-c759-a84d84c7779d@citrix.com>
 <7061f1db-aa45-d016-8645-1f733f753944@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <5cc90018-6795-1a90-05a1-de1911aed8ce@citrix.com>
Date: Tue, 30 Jul 2019 17:36:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7061f1db-aa45-d016-8645-1f733f753944@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 1/2] xen/link: Introduce
 .bss.percpu.page_aligned
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
Cc: StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAvMDcvMjAxOSAxMDo0OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMzAuMDcuMjAxOSAx
MTozNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMzAvMDcvMjAxOSAwOTo0MiwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAyOS4wNy4yMDE5IDE5OjM4LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMKPj4+PiArKysgYi94ZW4vYXJjaC94
ODYveGVuLmxkcy5TCj4+Pj4gQEAgLTI5MywxNCArMjkzLDE3IEBAIFNFQ1RJT05TCj4+Pj4gICAg
ICAgICAgX19ic3Nfc3RhcnQgPSAuOwo+Pj4+ICAgICAgICAgICooLmJzcy5zdGFja19hbGlnbmVk
KQo+Pj4+ICAgICAgICAgICooLmJzcy5wYWdlX2FsaWduZWQqKQo+Pj4+IC0gICAgICAgKiguYnNz
KQo+Pj4+IC0gICAgICAgLiA9IEFMSUdOKFNNUF9DQUNIRV9CWVRFUyk7Cj4+Pj4gKyAgICAgICAu
ID0gQUxJR04oUEFHRV9TSVpFKTsKPj4+PiAgICAgICAgICBfX3Blcl9jcHVfc3RhcnQgPSAuOwo+
Pj4+ICsgICAgICAgKiguYnNzLnBlcmNwdS5wYWdlX2FsaWduZWQpCj4+Pj4gKyAgICAgICAuID0g
QUxJR04oUEFHRV9TSVpFKTsKPj4+IEJ1dCB0aGlzIGdvZXMgdG9vIGZhcjogV2hhdCB3ZSB3YW50
IGlzIGZvciB0aGUgVFNTIHRvIG9jY3VweSBhIGZ1bGwKPj4+IHBhZ2UsIG5vdCBmb3Igd2hhdGV2
ZXIgcmFuZG9tIG90aGVyIHBhZ2UtYWxpZ25lZCBvYmplY3QgZW5kcyB1cAo+Pj4gbGFzdCBoZXJl
IChzaG91bGQgYW55IGV2ZXJ5IGFwcGVhcikuCj4+IENvbWUgYWdhaW4/wqAgVGhpcyBpcyByaWRp
Y3Vsb3VzLgo+Pgo+PiBPYmplY3RzIGluIGEgc2VjdGlvbiBmb2xsb3dpbmcgZm9vLnBhZ2VfYWxp
Z25lZCBzaG91bGQgbmV2ZXIgZW5kIHVwIGluCj4+IHRoZSB0YWlsIG9mIHRoZSBmaW5hbCBwYWdl
IG9mIGZvby5wYWdlX2FsaWduZWQsIGJlY2F1c2UgdGhlbiB0aGV5IGFyZSBpbgo+PiB0aGUgd3Jv
bmcgc2VjdGlvbi4KPiBIb3cgZG8geW91IGRlcml2ZSAid3Jvbmcgc2VjdGlvbiI/IFNlY3Rpb25z
IGhhdmUgYW4gYWxpZ25tZW50IGFuZCBhCj4gc2l6ZS4gVGhlIGxhdHRlciBkb2Vzbid0IG5lZWQg
dG8gYmUgYSBtdWx0aXBsZSBvZiB0aGUgZm9ybWVyLiBUaGUKPiBzZWN0aW9uIGVuZHMgd2hlcmV2
ZXIgaXRzIHNpemUgc2F5cyBpdCBlbmRzLiBVc2luZyB0aGlzIHByb3BlcnR5IGlzCj4gYWN0dWFs
bHkgZGVzaXJhYmxlIGluIG90aGVyIGNhc2VzLCB0byBsaW1pdCB3YXN0ZSBvZiBzcGFjZS4KClRo
ZSBwcmluY2lwbGUgb2YgbGVhc3Qgc3VycHJpc2UsIGZvciBhIHNlY3Rpb24gd2l0aCBwYWdlX2Fs
aWduZWQgaW4gaXRzCm5hbWUsIGlzIHRoYXQgdGhlIHNlY3Rpb24gc3RhcnRzIGFuZCBlbmRzIG9u
IGEgcGFnZSBib3VuZGFyeS7CoCBUaGlzIGlzCndoYXQgcGVvcGxlIGV4cGVjdCB3aGVuIHRoZXkg
c2VlIGEgbmFtZSBsaWtlIHRoYXQuCgpJdCByZWFsbHkgZG9lc24ndCBtYXR0ZXIgd2hhdCBpcyB0
ZWNobmljYWxseSBwb3NzaWJsZS7CoCBXaGF0IGRvZXMgbWF0dGVyCmlzIHBlb3BsZXMgcmVhc29u
YWJsZSBleHBlY3RhdGlvbnMuCgo+PiBBIHNob3J0IFRTUyBpcyBhIHBhaW4gdG8gZGVhbCB3aXRo
LCBidXQgZXZlbiB5b3Ugc2FpZCB5b3UgZGlkbid0IGxpa2UKPj4gdGhlIHhlbl90c3MgaWRlYSB3
aGVuIHlvdSBzdWdnZXN0ZWQgaXQuCj4+Cj4+IFRoZSBuYW1lIG9mIHRoZSBzZWN0aW9uIGlzIHZl
cnkgZGVsaWJlcmF0ZWx5IG5vdCBUU1Mgc3BlY2lmaWMsIGJlY2F1c2UKPj4gdGhlcmUgaXMgcGxl
bnR5IG9mIG90aGVyIGNsZWFudXAgd2hpY2ggd2lsbCBlbmQgdXAgd2l0aCBvYmplY3RzIGluIHRo
aXMKPj4gc2VjdGlvbi4KPiBXZWxsLCBpZiB0aGV5J3JlIGFsbCBzdHJpY3RseSBhIG11bHRpcGxl
IG9mIFBBR0VfU0laRSwgdGhlbiB3cml0aW5nCj4gZG93biBhIHJlc3BlY3RpdmUgcmVxdWlyZW1l
bnQgbWlnaHQgYmUgYWNjZXB0YWJsZS4gQnV0IGV2ZW4gdGhlbiBJbm90IHN1Ym1pdHRlZCBieSBt
ZS4KPiB3b3VsZG4ndCBiZSBvdmVybHkgaGFwcHkgZ29pbmcgdGhhdCByb3V0ZS4KClRoaXMgcmVw
bHksIGxpa2UgbW9zdCBvdGhlcnMgaW4gdGhpcyB0aHJlYWQsIGlzIGFjdGl2ZWx5IHVuaGVscGZ1
bCwgYW5kCkkgZ2l2ZSB1cC4KCkkgY2FuJ3QgcmVhZCB5b3VyIG1pbmQuwqAgTmVpdGhlciBjYW4g
YW55b25lIGVsc2UsIGFuZCBub29uZSBoYXMgdGhlIHRpbWUKdG8gZGl2aW5lIHdoYXQgeW91IHdh
bnQuCgpJZiB5b3UgZG9uJ3QgY29tZSB1cCB3aXRoIHNvbWV0aGluZyBtb3JlIGhlbHBmdWwgdGhh
biAiSSBkb24ndCBsaWtlIGl0CnRoaXMgd2F5IiwgdGhlbiBJJ20gZ29pbmcgdG8gY29tbWl0IHRo
aXMgc2VyaWVzIGluIGl0cyBjdXJyZW50IGZvcm0sIGFuZAp5b3UgY2FuIGFkanVzdGluZyBpdCB0
byB5b3VyIG93biB0YXN0ZSwgaW4geW91ciBvd24gdGltZS4KClRoaXMgZ29lcyBmb3Igb3RoZXIg
c2VyaWVzIGFzIHdlbGwsIGluY2x1ZGluZyBvbmVzIHN1Ym1pdHRlZCBieSBvdGhlcnMuwqAKSXQg
aXMgYWJzb2x1dGVseSBjcml0aWNhbCB0aGF0IHJldmlldyBmZWVkYmFjayBpZGVudGlmaWVzLCBp
biBhIGNsZWFyCm1hbm5lciwgaG93IHlvdSBleHBlY3QgdGhlIGlzc3VlIHRvIGJlIHJlc29sdmVk
LgoKRm9yIGFueSBub24tdHJpdmlhbCBwaWVjZSBvZiBmZWVkYmFjaywgaWYgaXQgY2FuJ3QgYmUg
cGhyYXNlZCBpbiB0aGUKZm9ybSAiSSB3b3VsZCB0aGlzIHBhdGNoIG9rIGlmIHlvdSBhbHRlciAk
WCB0byAkWSIsIHRoZW4gaXQgaXMgcHJvYmFibHkKd2FudHMgcmV0aGlua2luZy7CoCBXaGF0ZXZl
ciB0aGUgZmVlZGJhY2sgYWN0dWFsbHkgaXMsIHRoYXQgZ2l2ZXMgYQpjb25jcmV0ZSAkWCB3aGlj
aCBpcyB0aGUgcGVyY2VpdmVkIHByb2JsZW0sIGFuZCBhIGNvbmNyZXRlICRZIHdoaWNoIGlzCmVp
dGhlciBhIGNsZWFyIGRpc2N1c3Npb24gcG9pbnQsIG9yIGEgY2xlYXIgZGlyZWN0aW9uIHRvIHdv
cmsgdG93YXJkcy4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
