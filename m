Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C718B10D680
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 14:59:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaglj-0006ZP-Jq; Fri, 29 Nov 2019 13:57:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UeaM=ZV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iagli-0006ZD-Jx
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 13:57:10 +0000
X-Inumbo-ID: 22d99b5a-12b0-11ea-83b8-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22d99b5a-12b0-11ea-83b8-bc764e2007e4;
 Fri, 29 Nov 2019 13:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575035831;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=NqbQx1odqDrFYqBPmSQlFLWEvRfj0eo+7JGVNR2/LfI=;
 b=W2mCrcPP51lzJ6gyMrazkRNNLeZPESbp3eUnhg+IGX5d1/qCvm3EQ7yk
 iCtBNVmv9n9/MvFl202ywfTRrA0r4ApY6tB/S4no0Zsz8aDxbE6ZihbIF
 ipP1Q9AVQRzCXkw4w5fFVK8PZA4IWatQBvxnCfCL+t6rJb0HjM9sPqvpn U=;
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
IronPort-SDR: 8R2eoTc2/N3qOkNXFidH2pS9HRbSWrta98mhZewABe3XmETnR696d7dXjdgha3+rkmsiKruqIG
 9YQx4LfVY3jXrs7pChIKo62G4pEXI9JvF2367bZBCtRv9OPV/aAgPBdxm6/4l4wQ8/heMQzLqy
 I4aKEtNJjEd2RgK5LGa7p7ty3TVPHVYkUu8YhPklIyy5RmY9troshdm9zmy0EMDglXT3a1ur4o
 OWGs1ZiavM/HHaK9s2nxMBTIAOy2yLOILYq/Gqcv24C8/YkiuKHvL6+lsuf2uWooyChBNtEoCt
 hMA=
X-SBRS: 2.7
X-MesageID: 8980987
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,257,1571716800"; 
   d="scan'208";a="8980987"
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, Julien Grall <julien@xen.org>
References: <5766dd2b-2aa7-bafe-56ad-3ea33ddf4591@suse.com>
 <78b1df38-864c-768e-b306-2db75f3b76e0@citrix.com>
 <e765c741-cba4-42bf-b61a-20a206cd628d@suse.com>
 <24033.2185.509756.178278@mariner.uk.xensource.com>
 <47257a2e-5454-6115-93c9-e1b9ed3a4131@suse.com>
 <d8e8729a-3a20-f65d-0c1b-9f5522f4a450@citrix.com>
 <f998ce81-8b77-a2c6-ab90-cedff89799da@suse.com>
 <358e29a0-0fce-28de-fdf3-730e6b4aaf26@citrix.com>
 <11a7ce02-b4cd-a24f-f477-d3fe720b04ee@suse.com>
 <8b7db8ee-8dc8-0390-0d44-f12de573e81a@suse.com>
 <abddefb1-6fac-67d9-c825-43a1b63300c1@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <91765e08-cb02-0d3e-1989-13118c2521e1@citrix.com>
Date: Fri, 29 Nov 2019 13:57:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <abddefb1-6fac-67d9-c825-43a1b63300c1@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] console: avoid buffer overflow in
 guest_console_write()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 KonradWilk <konrad.wilk@oracle.com>,
 Ilja Van Sprundel <ivansprundel@ioactive.com>,
 GeorgeDunlap <George.Dunlap@citrix.com>, Ian
 Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkvMTEvMjAxOSAxMzo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjkuMTEuMjAxOSAx
NDozNywgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4gT24gMjkuMTEuMTkgMTQ6MjYsIEphbiBCZXVs
aWNoIHdyb3RlOgo+Pj4gT24gMjkuMTEuMjAxOSAxMzozNywgQW5kcmV3IENvb3BlciB3cm90ZToK
Pj4+PiBPbiAyOS8xMS8yMDE5IDEyOjE5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMjku
MTEuMjAxOSAxMzoxNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+Pj4+IE9uIDI5LzExLzIwMTkg
MTI6MTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDI5LjExLjIwMTkgMTM6MDEsIElh
biBKYWNrc29uIHdyb3RlOgo+Pj4+Pj4+PiBKYW4gQmV1bGljaCB3cml0ZXMgKCJSZTogW1BBVENI
XSBjb25zb2xlOiBhdm9pZCBidWZmZXIgb3ZlcmZsb3cgaW4gZ3Vlc3RfY29uc29sZV93cml0ZSgp
Iik6Cj4+Pj4+Pj4+PiBPbiAyOS4xMS4yMDE5IDExOjIyLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+
Pj4+Pj4+Pj4+IElzIHNpemVvZihhcnJheVswXSkgYWx3YXlzIDAsIG9yIGlzIHRoaXMganVzdCBh
IEdDQy1pc20gP8KgIEdvZGJvbHQKPj4+Pj4+Pj4+PiBzdWdnZXN0cyBpcyAwIG9uIGFsbCBjb21w
aWxlciB3ZSBzdXBwb3J0Lgo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gRWl0aGVyIHdheSwgaXNuJ3Qg
dGhlIG1vcmUgY29tbW9uIGlkaW9tICsgMHVsID/CoCBQZXJzb25hbGx5LCBJIGZlZWwgdGhhdAo+
Pj4+Pj4+Pj4+IGlzIGNsZWFyZXIgdG8gZm9sbG93Lgo+Pj4+Pj4+Pj4gSSBkZWNpZGVkIGFnYWlu
c3QgKyAwdWwgb3IgYWxpa2UgYmVjYXVzZSBpbiBwcmluY2lwbGUgc2l6ZV90Cj4+Pj4+Pj4+PiBh
bmQgdW5zaWduZWQgbG9uZyBhcmUgZGlmZmVyZW50IHR5cGVzLiBJbiBwYXJ0aWN1bGFyIDMyLWJp
dAo+Pj4+Pj4+Pj4geDg2IGdjYyB1c2VzIHVuc2lnbmVkIGludCBmb3Igc2l6ZV90LCBhbmQgaGVu
Y2UgbWluKCkncwo+Pj4+Pj4+Pj4gdHlwZSBzYWZldHkgY2hlY2sgd291bGQgY2F1c2UgdGhlIGJ1
aWxkIHRvIGZhaWwgdGhlcmUuIFRoZQo+Pj4+Pj4+Pj4gc2FtZSByaXNrIG9idmlvdXNseSBleGlz
dHMgZm9yIGFueSAzMi1iaXQgYXJjaCAoZS5nLiBBcm0zMiwKPj4+Pj4+Pj4+IGJ1dCBJIGhhdmVu
J3QgY2hlY2tlZCB3aGF0IHR5cGUgaXQgYWN0dWFsbHkgdXNlcykuCj4+Pj4+Pj4+IEkgZG9uJ3Qg
a25vdyB3aGF0IGkgd3Jvbmcgd2l0aAo+Pj4+Pj4+PiAgICAgKHNpemVfdCkwCj4+Pj4+Pj4+IHdo
aWNoIGlzIHNob3J0ZXIsIGV2ZW4gIQo+Pj4+Pj4+IFRydWUuIFlldCBpdCBjb250YWlucyBhIGNh
c3QsIG5vIG1hdHRlciBob3cgcmlzay1mcmVlIGl0IG1heSBiZQo+Pj4+Pj4+IGluIHRoaXMgY2Fz
ZS4gV2l0aCBhIGNhc3QsIEkgY291bGQgYXMgd2VsbCBoYXZlIHdyaXR0ZW4gKHlldAo+Pj4+Pj4+
IHNob3J0ZXIpIChzaXplX3QpY291bnQuCj4+Pj4+PiBHaXZlbiB0aGF0IG1pbigpIGhhcyBhIHZl
cnkgc3RyaWN0IHR5cGVjaGVjaywgSSB0aGluayB3ZSBzaG91bGQgcGVybWl0Cj4+Pj4+PiBhbnkg
dXNlIG9mIGFuIGV4cGxpY2l0IGNhc3QgaW4gYSBzaW5nbGUgb3BlcmFuZCwgYmVjYXVzZSBpdCAq
aXMqIHNhZmVyCj4+Pj4+PiB0aGFuIHN3aXRjaGluZyB0byB0aGUgbWluX3QoKSByb3V0ZSB0byBt
YWtlIHRoaW5ncyBjb21waWxlLgo+Pj4+PiBXZWxsLCBJIGNhbiBzd2l0Y2ggdG8gKHNpemVfdClj
b3VudCBpZiB0aGlzIGlzIGxpa2VkIGJldHRlcgo+Pj4+PiBvdmVyYWxsLgo+Pj4+IFBlcnNvbmFs
bHksIEknZCBwcmVmZXIgdGhpcyBvcHRpb24gbW9zdCBvZiBhbGwuCj4+PiBPa2F5LCBJJ3ZlIHN3
aXRjaGVkIHRvIHRoaXMsIGJ1dCB3aGlsZSBkb2luZyBzbyBJIHN0YXJ0ZWQgd29uZGVyaW5nCj4+
PiB3aHkgd2UnZCB0aGVuIG5vdCB1c2UKPj4+Cj4+PiAgICAgICAgICBrY291bnQgPSBtaW4oY291
bnQsICh1bnNpZ25lZCBpbnQpc2l6ZW9mKGtidWYpIC0gMSk7Cj4+Pgo+Pj4gd2hpY2ggaXMgYW4g
KG9mdGVuIHNsaWdodGx5IGNoZWFwZXIpIDMyLWJpdCBvcGVyYXRpb24gKGFuZCB3aGljaAo+Pj4g
aXMgd2hhdCBJIGhhZCBhY3R1YWxseSBzdGFydGVkIGZyb20pLgo+PiBXaGlsZSBtb2RpZnlpbmcg
Z3Vlc3RfY29uc29sZV93cml0ZSgpLCB3b3VsZCB5b3UgbWluZCB3cml0aW5nIGEgJ1wwJwo+PiB0
byBrYnVmW2tjb3VudF0/IFRoZXJlIGlzIGEgImNvbnJpbmdfcHV0cyhrYnVmKTsiIGxhdGVyIGlu
IHRoaXMKPj4gZnVuY3Rpb24gd2hpY2ggd291bGQgbGlrZSBhIDAgdGVybWluYXRlZCBzdHJpbmcg
YXMgaW5wdXQuCj4gVGhhdCdzIG5vdCB0aGUgcmlnaHQgY2hhbmdlIGZvciB0aGlzIHByb2JsZW0s
IEkgdGhpbmsuIE5vdyB0aGF0Cj4gd2Ugc3VwcG9ydCBlbWJlZGRlZCBudWwgY2hhcmFjdGVycywg
YSBjb3VudCBzaG91bGQgYmUgcGFzc2VkCj4gaW5zdGVhZC4gSnVsaWVuPwo+Cj4gSSBhbHNvIHdv
dWxkbid0IHdhbnQgdG8gbWVyZ2UgdGhpcyBpbnRvIHRoaXMgcGF0Y2g7IEknbSBoYXBweSB0bwo+
IHNlbmQgYSBzZXBhcmF0ZSBvbmUuCgpJIGFncmVlLsKgIExldHMgZml4IHRoZSBjb25jcmV0ZSBz
dGFjayBjb3JydXB0aW9uIGlzc3VlIHNlcGFyYXRlbHkgZnJvbQp0aGUgY29uY2VybiBvdmVyIE5V
TC1jb3JyZWN0bmVzcyAod2hpY2ggd2FzIHRoZSBwdXJwb3NlIG9mIHRoZSBwYXRjaAp3aGljaCBp
bnRyb2R1Y2VkIHRoaXMgdnVsbmVyYWJpbGl0eSB0byBzdGFydCB3aXRoKS4KCn5BbmRyZXcKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
