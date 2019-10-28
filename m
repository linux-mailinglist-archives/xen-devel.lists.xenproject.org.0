Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B83E703B
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 12:18:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP30B-0003qc-KQ; Mon, 28 Oct 2019 11:15:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qotU=YV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iP30A-0003ps-52
 for xen-devel@lists.xen.org; Mon, 28 Oct 2019 11:15:58 +0000
X-Inumbo-ID: 4cd2033e-f974-11e9-94f3-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4cd2033e-f974-11e9-94f3-12813bfff9fa;
 Mon, 28 Oct 2019 11:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572261351;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=HXSqOhQWGbEdqW1jtf9r68DmrFGLjJNEVyMNblhPTWQ=;
 b=AgmkvfiEAigJ69Sb6TYK82v8ERCzr3P5PI822eBiHX1xO9cxitCSmFtQ
 17h69wL/36TJm1cUT9rPaaGn8VEyO0NhoJFUkAkWY4Pi4ScW3BS5gMWoJ
 aLSPdSuf5RywAnfxWfFi6dEaVawm1l5JLoF2U2VM3OEO73Ws4wyVunhmC U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RGjzujS8vnBUxq4PozGCbpJaGQ7lvFft2uuizp9J2/BoLp6rOnN88CRTcXOfMB6KN7VnL9g5IR
 WPMoB9SDUNhFSo6qurSYLM+OEVvhEJCdrGHUMinY8ntaQaDzWovpwH0VJo1tc5JI/YvipA8fjc
 h+69ni9M6/6X4hqKnVIl+kG+UYzzD6uaewCEI1qc22k3dczOv+b8yfdctLWmhbBvOELPkptaT6
 MqsrqhkLA6IHIzTVryiGzZTjfb6y4rxk/m0vkPwwBxzgYifjBfiSSkMKSCzFbtr8I9rkiTKziN
 JpY=
X-SBRS: 2.7
X-MesageID: 7811971
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,239,1569297600"; 
   d="scan'208";a="7811971"
To: Jan Beulich <jbeulich@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>
References: <20191028085603.32037-1-sergey.dyasli@citrix.com>
 <e55613e7-179d-ee5c-34a4-bc3e41997869@suse.com>
 <19a597f0-1694-02fb-2c01-3446407b35a9@citrix.com>
 <28c68c6f-2812-eb48-5cac-c7a5b05dd3bd@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <7a4dc34f-a817-e2ee-5ded-407ffc86db22@citrix.com>
Date: Mon, 28 Oct 2019 11:15:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <28c68c6f-2812-eb48-5cac-c7a5b05dd3bd@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for 4.13] x86/shim: don't reserve 640k - 1M
 region in E820
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjgvMTAvMjAxOSAxMToxMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjguMTAuMjAxOSAx
MjowOCwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPj4gT24gMjgvMTAvMjAxOSAwOTowNiwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAyOC4xMC4yMDE5IDA5OjU2LCBTZXJnZXkgRHlhc2xpIHdyb3Rl
Ogo+Pj4+IENvbnZlcnRpbmcgYSBndWVzdCBmcm9tIFBWIHRvIFBWLWluLVBWSCBtYWtlcyB0aGUg
Z3Vlc3QgdG8gaGF2ZSAzODRrCj4+Pj4gbGVzcyBtZW1vcnksIHdoaWNoIG1heSBjb25mdXNlIGd1
ZXN0J3MgYmFsbG9vbiBkcml2ZXIuIFRoaXMgaGFwcGVucwo+Pj4+IGJlY2F1c2UgWGVuIHVuY29u
ZGl0aW9uYWxseSByZXNlcnZlcyA2NDBrIC0gMU0gcmVnaW9uIGluIEU4MjAgZGVzcGl0ZQo+Pj4+
IHRoZSBmYWN0IHRoYXQgaXQncyByZWFsbHkgYSB1c2FibGUgUkFNIGluIFBWSCBib290IG1vZGUu
Cj4+PiBUaGlzIGlzIGEgUFZIIHByb3BlcnR5IGFjY29yZGluZyB0byB5b3VyIGRlc2NyaXB0aW9u
IGFuZCBhY2NvcmRpbmcKPj4+IHRvIG15IHVuZGVyc3RhbmRpbmcuIFdoeSB3b3VsZCB5b3UgdGhl
biAuLi4KPj4+Cj4+Pj4gRml4IHRoaXMgYnkgc2tpcHBpbmcgdGhlIHJlZ2lvbiB0eXBlIGNoYW5n
ZSBmb3IgcHYtc2hpbSBtb2RlLgo+Pj4gLi4uIGFsdGVyIGJlaGF2aW9yIGZvciBzaGltIG1vZGUg
b25seSwgcmF0aGVyIHRoYW4gd2hlbiBib290ZWQgaW4KPj4+IFBWSCBtb2RlIGluIGdlbmVyYWw/
Cj4+IFRoaXMgaXMganVzdCBtZSBiZWluZyBjYXV0aW91cy4KPj4KPj4gTXkgb3JpZ2luYWwgZW1h
aWwgZG9lcyBoYXZlIHRoaXMgdGV4dCBhZnRlciAtLS0KPj4gIlRoZSBjb25kaXRpb24gY2FuIGJl
IHJlbGF4ZWQgdG8gYmUganVzdCAhcHZoX2Jvb3QgaWYgdGhlcmUgYXJlIG5vCj4+IHBsYW5zIHRv
IHN1cHBvcnQgVkdBIE1NSU8gLyBST01zIGZvciBQVkggZ3Vlc3RzLiIKPiBJIGRvdWJ0IGVtdWxh
dGVkIG9uZXMgYXJlIGludGVuZGVkIHRvIGJlIHN1cHBvcnRlZCwgYnV0IG9mCj4gY291cnNlIGEg
Z3JhcGhpY3MgY2FyZCBjb3VsZCBiZSBwYXNzZWQgdGhyb3VnaC4gSWlyYyBwYXNzdGhyb3VnaAo+
IGlzIGEgcGVuZGluZyB3b3JrIGl0ZW0gc3RpbGwgYW55d2F5IGZvciBQVkgsIHNvIGRlYWxpbmcg
d2l0aCB0aGUKPiBjYXNlIHJpZ2h0IG5vdyBtYXkgbm90IGV2ZW4gYmUgbmVjZXNzYXJ5LgoKVGhl
IGJ1ZyBpcyBYZW4gYmxpbmRseSBwcmVzdW1pbmcgdGhhdCBhIG1pc3NpbmcgaG9sZSAibXVzdCBi
ZSBhIGZpcm13YXJlCmJ1ZyIuCgpJIGNhbiBiZWxpZXZlIHRoYXQgdGhlcmUgbWF5IGhhdmUgYmVl
biBzeXN0ZW1zIGRlY2FkZXMgYWdvIHdoaWNoIGdvdAp0aGlzIHdyb25nLCBidXQgdGJoIEkgZG91
YnQgaXQgYXBwbGllcyB0byA2NGJpdC1jYXBhYmxlIHN5c3RlbXMsCmNvbnNpZGVyaW5nIGhvdyBz
dGFuZGFyZGlzZWQgdGhpbmdzIHdlcmUgYnkgdGhlbi4KCkknZCBqdXN0IGRlbGV0ZSB0aGlzIHdo
b2xlIHBpZWNlIG9mIGxvZ2ljIGFuZCBjYWxsIGl0IGRvbmUuCgp+QW5kcmV3CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
