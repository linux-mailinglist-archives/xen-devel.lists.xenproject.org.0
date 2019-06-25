Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F44553D3
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 17:58:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfnnV-0001A9-HK; Tue, 25 Jun 2019 15:55:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ot0M=UY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hfnnT-0001A0-UT
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 15:55:51 +0000
X-Inumbo-ID: b2fb225a-9761-11e9-9f41-ef5efea120d2
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2fb225a-9761-11e9-9f41-ef5efea120d2;
 Tue, 25 Jun 2019 15:55:48 +0000 (UTC)
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
IronPort-SDR: Hd7t0eHGqi5vvEy/sV2LB8A3NEAuGUTDd6c1zrjDvex95jV4R9E/d4JFEryNKglNl+w9jvZnV/
 05YjTP1XB+b6gob9+GHyro8jVbj+G5K3RPdF4el+GbQJZVsSWNi9j87ZAQF3rn3JGp1Prks6Wb
 pC2U0Ihu9NAN8fuVKD/7HbMwLIzAb+kHEmSMTUOCqAS1+PgZUDK0+7elJ8N9BGreLR4BsH1L9g
 1msKxsGDCmSdOXrYduTQ1ZavjUi5nLVQve/Bnaiw7uTncYI/+gkKIOUky7j3CaOj6ZqM7qh1JU
 AqU=
X-SBRS: 2.7
X-MesageID: 2206461
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,416,1557201600"; 
   d="scan'208";a="2206461"
To: Jan Beulich <JBeulich@suse.com>
References: <20190625144350.6176-1-andrew.cooper3@citrix.com>
 <20190625144350.6176-4-andrew.cooper3@citrix.com>
 <5D1242E9020000780023B0A1@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <ffe90ff5-c0b0-c07d-ecdd-a8a84cca4e82@citrix.com>
Date: Tue, 25 Jun 2019 16:55:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <5D1242E9020000780023B0A1@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 3/3] page-alloc: Clamp get_free_buddy() to
 online nodes
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUvMDYvMjAxOSAxNjo1MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjUuMDYuMTkg
YXQgMTY6NDMsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gZC0+bm9kZV9h
ZmZpbml0eSBkZWZhdWx0cyB0byBOT0RFX01BU0tfQUxMIHdoaWNoIGhhcyBiaXRzIHNldCBvdXRz
aWRlIG9mCj4+IG5vZGVfb25saW5lX21hcC4gIFRoaXMgaW4gdHVybiBjYXVzZXMgdGhlIGxvb3Ag
aW4gZ2V0X2ZyZWVfYnVkZHkoKSB0byB3YXN0ZQo+PiBlZmZvcnQgaXRlcmF0aW5nIG92ZXIgb2Zm
bGluZSBub2Rlcy4KPj4KPj4gQWx3YXlzIGNsYW1wIGQtPm5vZGVfYWZmaW5pdHkgdG8gbm9kZV9v
bmxpbmVfbWFwIHdoZW4gaW4gdXNlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cj4gZGVzcGl0ZSAuLi4KPgo+PiAtLS0gYS94ZW4vY29tbW9uL3Bh
Z2VfYWxsb2MuYwo+PiArKysgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwo+PiBAQCAtODExLDEx
ICs4MTEsMTUgQEAgc3RhdGljIHN0cnVjdCBwYWdlX2luZm8gKmdldF9mcmVlX2J1ZGR5KHVuc2ln
bmVkIGludCB6b25lX2xvLAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbnN0IHN0cnVjdCBkb21haW4gKmQpCj4+ICB7Cj4+ICAgICAgbm9kZWlkX3QgZmlyc3Qs
IG5vZGUgPSBNRU1GX2dldF9ub2RlKG1lbWZsYWdzKSwgcmVxX25vZGUgPSBub2RlOwo+PiAtICAg
IG5vZGVtYXNrX3Qgbm9kZW1hc2sgPSBkID8gZC0+bm9kZV9hZmZpbml0eSA6IG5vZGVfb25saW5l
X21hcDsKPj4gKyAgICBub2RlbWFza190IG5vZGVtYXNrOwo+PiAgICAgIHVuc2lnbmVkIGludCBq
LCB6b25lLCBub2RlbWFza19yZXRyeSA9IDA7Cj4+ICAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGc7
Cj4+ICAgICAgYm9vbCB1c2VfdW5zY3J1YmJlZCA9IChtZW1mbGFncyAmIE1FTUZfbm9fc2NydWIp
Owo+PiAgCj4+ICsgICAgLyogQ2xhbXAgbm9kZW1hc2sgdG8gbm9kZV9vbmxpbmVfbWFwIGFuZCBv
cHRpb25hbGx5IGQtPm5vZGVfYWZmaW5pdHkuICovCj4+ICsgICAgbm9kZXNfYW5kKCZub2RlbWFz
aywgJm5vZGVfb25saW5lX21hcCwKPj4gKyAgICAgICAgICAgICAgZCA/ICZkLT5ub2RlX2FmZmlu
aXR5IDogJm5vZGVfb25saW5lX21hcCk7Cj4gLi4uIGZpbmRpbmcgaXQgYSBsaXR0bGUgb2RkIChp
bmVmZmljaWVudCkgdG8gQU5EIG5vZGVfb25saW5lX21hcCB3aXRoIGl0c2VsZi4KCldlbGwgLSB0
aGVyZSBpcyBhbiBPKG4pIGxvb3AgZm9yIHRoZSBjb3B5LCBhbmQgYW4gTyhuKSBsb29wIGZvciBh
bmQsIG9yCmEgc2luZ2xlIE8obikgbG9vcCB3aGljaCBkb2VzIGJvdGggd2hlbiByZWFsaXNpbmcg
dGhhdCBmb28gPSBhICYgYSBpcyBhCmNvcHkgb3BlcmF0aW9uIGluIGRpc2d1aXNlLgoKfkFuZHJl
dwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
