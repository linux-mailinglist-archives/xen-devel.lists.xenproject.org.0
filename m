Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6759EC3A4E
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 18:20:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFKpU-0004ka-4f; Tue, 01 Oct 2019 16:16:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=78uS=X2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iFKpS-0004kV-Ef
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 16:16:46 +0000
X-Inumbo-ID: dc8bc212-e466-11e9-9703-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by localhost (Halon) with ESMTPS
 id dc8bc212-e466-11e9-9703-12813bfff9fa;
 Tue, 01 Oct 2019 16:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569946606;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=3tCOX3cICpF1no9CXfkS0NCae+zAs5N+Qjr/2fJA530=;
 b=XkSe57Y54+KJEgwvz3eflVgz7OTWnCuj/noyeGINyOE4T4eCH+ulOq+g
 ia5b6FMky4C9Eg0TpZ+jzo7JaM+O+8xNpgsc+bTGACciBIXq/cD6bSlhA
 TgGPUWedu4dvj50xA4ckbVM/5Er1YOOpRFhedWasKuDRBSVGPgO8C87U+ 0=;
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
IronPort-SDR: sf8LNYM7loUEQ9PI2iQ+55keFiAZWbdmNo9XcpqLqFf31PdmydqrZtQoS/7nlUn5ihgwHV+E4B
 YBuTC0X7oGcRmyUpb0DlS9ZfbPZzcCIvWAWJ/7vdJuF68RltI7K/S8Q3swvbn8Zqxf3DqJm8Z1
 psagbwHp2miQGbAY45S04sb6OtPejjy260PJ9JS/ZoTDTnsGyLNGDv0kskVzjrZ4hJ2lwtfFIE
 ZrBwwMpV1NqG/iiRVwJQPsazT168Vjd+VK/qaowDGPyTFyQnlbjrsBbwKW0YTs4zINf7JsoJZD
 Lo0=
X-SBRS: 2.7
X-MesageID: 6317974
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,571,1559534400"; 
   d="scan'208";a="6317974"
To: Jan Beulich <jbeulich@suse.com>
References: <20191001143207.15844-1-andrew.cooper3@citrix.com>
 <20191001143207.15844-2-andrew.cooper3@citrix.com>
 <b5101087-a0db-50bf-8276-78f38b859aff@suse.com>
 <f8483c39-947c-1ef1-34b7-3927d55cbf42@citrix.com>
 <88f519eb-ca6b-56ce-991a-3699942db1f7@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <fc096d6f-8abc-6095-8ab7-5b13045f6a3f@citrix.com>
Date: Tue, 1 Oct 2019 17:16:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <88f519eb-ca6b-56ce-991a-3699942db1f7@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 1/2] xen/nospec: Introduce
 CONFIG_SPECULATIVE_HARDEN_ARRAY
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEvMTAvMjAxOSAxNjo1OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDEuMTAuMjAxOSAx
Nzo1MiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDEvMTAvMjAxOSAxNTo0OCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAwMS4xMC4yMDE5IDE2OjMyLCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IFRoZXJlIGFyZSBsZWdpdGltYXRlIGNpcmN1bXN0YW5jZSB3aGVyZSBhcnJheSBoYXJk
ZW5pbmcgaXMgbm90IHdhbnRlZCBvcgo+Pj4+IG5lZWRlZC4gIEFsbG93IGl0IHRvIGJlIHR1cm5l
ZCBvZmYuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgo+Pj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KPj4+IHdpdGggb25lIG1vcmUgcXVlc3Rpb24gKEknbSBzb3JyeSwgSSBtZWFudCB0
byBhc2sgb24gdjEgYnV0IHRoZW4KPj4+IGZvcmdvdCk6Cj4+Pgo+Pj4+IC0tLSBhL3hlbi9jb21t
b24vS2NvbmZpZwo+Pj4+ICsrKyBiL3hlbi9jb21tb24vS2NvbmZpZwo+Pj4+IEBAIC03Nyw2ICs3
NywzMCBAQCBjb25maWcgSEFTX0NIRUNLUE9MSUNZCj4+Pj4gIAlzdHJpbmcKPj4+PiAgCW9wdGlv
biBlbnY9IlhFTl9IQVNfQ0hFQ0tQT0xJQ1kiCj4+Pj4gIAo+Pj4+ICttZW51ICJTcGVjdWxhdGl2
ZSBoYXJkZW5pbmciCj4+Pj4gKwo+Pj4+ICtjb25maWcgU1BFQ1VMQVRJVkVfSEFSREVOX0FSUkFZ
Cj4+Pj4gKwlib29sICJTcGVjdWxhdGl2ZSBBcnJheSBIYXJkZW5pbmciCj4+Pj4gKwlkZWZhdWx0
IHkKPj4+IEFyZSB5b3Uvd2UgY29udmluY2VkIGl0IGlzIGEgZ29vZCBpZGVhIHRvIGV4cG9zZSB0
aGlzIHdpdGhvdXQgRVhQRVJUCj4+PiBxdWFsaWZpZXI/IEkga25vdyB5b3UgZGlzbGlrZSB0aGF0
IGVudGlyZSBtb2RlbCwgYnV0IG91ciBjb21tb24KPj4+IGdyb3VuZHMgc3RpbGwgYXJlIC0gYWZh
aWN0IC0gdGhhdCB3ZSBkb24ndCB3YW50IGEgcHJvbGlmZXJhdGlvbiBvZgo+Pj4gKHNlY3VyaXR5
KSBzdXBwb3J0ZWQgY29uZmlndXJhdGlvbiB2YXJpYXRpb25zLgo+PiBJdHMgbm90IEVYUEVSVCBJ
IGRpc2xpa2UuwqAgSGF2aW5nIGEgQ09ORklHX0VYUEVSVCBqdXN0IGxpa2UgTGludXggaGFzCj4+
IHdvdWxkIGJlIGZpbmUuwqAgSXRzIHRoZSBmYWN0IHRoYXQgaXQgd2lsbCBzaWxlbnRseSByZXZl
cnQgYmVoaW5kIHlvdXIKPj4gYmFjayBpZiBhbiBlbnZpcm9ubWVudCB2YXJpYWJsZSBpcyBtaXNz
aW5nIHdoaWNoIGlzIHdoYXQgbWFrZXMgdGhlCj4+IGJlaGF2aW91ciB0b3hpYyBmb3IgcGVvcGxl
IHRvIHVzZS4KPj4KPj4gVGhhdCBhc2lkZSwgSSBkb24ndCB0aGluayB0aGlzIHdhcnJhbnRzIGV4
cGVydC7CoCBJdCBpcyBiZXN0LWVmZm9ydC1vbmx5Cj4+IG1pdGlnYXRpb24sIHdoaWNoIG9uIHRo
ZSBiYWxhbmNlIG9mIHByb2JhYmlsaXR5IGlzIG5vdCBjb21wbGV0ZSwgd2hpY2gKPj4gY2FuIHNh
ZmVseSBiZSB0dXJuZWQgb2ZmIGJhc2VkIG9uIGEgcmlzayBhc3Nlc3NtZW50IG9mIHRoZSB0YXJn
ZXQgQ1BVCj4+IGFuZCBlbnZpcm9ubWVudC4KPiBJIG1vc3RseSBhZ3JlZSB3aXRoIHRoaXM7IHRo
ZSBxdWVzdGlvbiB0aG91Z2ggd2FzIG1vcmUgdG93YXJkcyB3aGV0aGVyCj4gdGhpcyBpcyBhIGdv
b2QgZW5vdWdoIHJlYXNvbiB0byBzZXQgYShub3RoZXIpIHByZWNlZGVudCBvZiBhbiBFWFBFUlQt
Cj4gbGVzcyBvcHRpb24sIHdoZW4gd2UgdHJ5IHRvIGhhdmUgYXMgZmV3IG9mIHRoZW0gYXMgcG9z
c2libGUuCgpSZW1lbWJlciB0aGF0IGl0IGlzIG9ubHkgeW91IHdobyBpcyBzdHJpdmluZyB0byBo
YXZlIDAgRVhQRVJULWxlc3MKb3B0aW9ucy7CoCBJdCBpcyBub3QgYSB2aWV3IHNoYXJlZCBieSBl
dmVyeW9uZSwgYW5kIGlzIGNlcnRhaW5seSBub3QgYQpzdGF0ZWQgZ29hbCBvZiBvdXIgS2NvbmZp
ZyBzZXR1cC4KClRoaXMgaXMgYW4gb3B0aW9uIHdoaWNoIGlzIHNhZmUgdG8gZmxpcCwgYW5kIHdp
bGwgd2FudCB0byBiZSBmbGlwcGVkIGJ5CnVzZXJzIGluIHNvbWUgY2lyY3Vtc3RhbmNlcy7CoCBI
aWRpbmcgaXQgZG9lc24ndCBzZWVtIGxpa2UgYSByZWFzb25hYmxlCnRoaW5nIHRvIGRvLgoKfkFu
ZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
