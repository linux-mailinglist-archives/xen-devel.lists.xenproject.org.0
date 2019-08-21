Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D4197710
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 12:23:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0Njh-0008Hk-Tq; Wed, 21 Aug 2019 10:21:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WlBC=WR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i0Njf-0008Gn-Qf
 for xen-devel@lists.xen.org; Wed, 21 Aug 2019 10:20:59 +0000
X-Inumbo-ID: 5c6c3669-c3fd-11e9-adc3-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5c6c3669-c3fd-11e9-adc3-12813bfff9fa;
 Wed, 21 Aug 2019 10:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566382858;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=RTiXgVBm+YG5ShEE3Dom6+XeRqH9bmokaPTohmmkk2o=;
 b=V1oZVH2tShFZe2OnSYd5fC1rNlmJYOJPYmFB0hGbtXLdvDGllI2HK410
 jiYci5YQ17nNS3zO7h0aRBQL73as7hINNTlgrZQ57l8mZLJXNm4ck1/xt
 kckZYnmPfNTO368WWsg4vEKJZoJGx7EBHqy6fYxtrIjdrHvDLNu6SSaJn 0=;
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
IronPort-SDR: fNfVBMhu8SPkNZii5jvIf+LNX6ekdoCdYvbqWNccd/CbP/87ViQ1q6p+gAP1rW+cKRutZni9/h
 IuXXAvdhBsenFauSiOjEE5Pj2mxspr6fzXDvk2O8WoKraFWgLFcDs7PwufVp4Qa2cOav322IMS
 MM7UoelJpXY/Xe52Rwa86ulkDqa+geO6zAl+Do/yJngr1wn/7ih6alHDoQEYqcnwyAPyrVJxXL
 eLywdGHlTTbHf2fq4bEZW5i4t+oUGT1wgO9U3uzwJKxbWL4bAuT1ONs5dXq3HkBsdqhLRejw8n
 x+Y=
X-SBRS: 2.7
X-MesageID: 4519683
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,412,1559534400"; 
   d="scan'208";a="4519683"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>,
 <xen-devel@lists.xenproject.org>
References: <20190821100430.89909-1-wipawel@amazon.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <c1a8b2e0-e621-82c6-e577-fd19791257d6@citrix.com>
Date: Wed, 21 Aug 2019 11:20:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821100430.89909-1-wipawel@amazon.de>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] livepatch: always print XENLOG_ERR
 information (ARM, ELF)
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
Cc: wipawel@amazon.com, Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross
 Lagerwall <ross.lagerwall@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEvMDgvMjAxOSAxMTowNCwgUGF3ZWwgV2llY3pvcmtpZXdpY3ogd3JvdGU6Cj4gZGlmZiAt
LWdpdCBhL3hlbi9jb21tb24vbGl2ZXBhdGNoX2VsZi5jIGIveGVuL2NvbW1vbi9saXZlcGF0Y2hf
ZWxmLmMKPiBpbmRleCBkZDhiNDdhMWZhLi4xOGI5Njg0YWViIDEwMDY0NAo+IC0tLSBhL3hlbi9j
b21tb24vbGl2ZXBhdGNoX2VsZi5jCj4gKysrIGIveGVuL2NvbW1vbi9saXZlcGF0Y2hfZWxmLmMK
PiBAQCAtNTUsNyArNTUsNyBAQCBzdGF0aWMgaW50IGVsZl9yZXNvbHZlX3NlY3Rpb25zKHN0cnVj
dCBsaXZlcGF0Y2hfZWxmICplbGYsIGNvbnN0IHZvaWQgKmRhdGEpCj4gICAgICBzZWMgPSB4emFs
bG9jX2FycmF5KHN0cnVjdCBsaXZlcGF0Y2hfZWxmX3NlYywgZWxmLT5oZHItPmVfc2hudW0pOwo+
ICAgICAgaWYgKCAhc2VjICkKPiAgICAgIHsKPiAtICAgICAgICBkcHJpbnRrKFhFTkxPR19FUlIs
IExJVkVQQVRDSCIlczogQ291bGQgbm90IGFsbG9jYXRlIG1lbW9yeSBmb3Igc2VjdGlvbiB0YWJs
ZSFcbiIsCj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgTElWRVBBVENIIiVzOiBDb3VsZCBu
b3QgYWxsb2NhdGUgbWVtb3J5IGZvciBzZWN0aW9uIHRhYmxlXG4iLAo+ICAgICAgICAgICAgICAg
ICBlbGYtPm5hbWUpOwo+ICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ICAgICAgfQo+IEBAIC04
MSwyMiArODEsMjIgQEAgc3RhdGljIGludCBlbGZfcmVzb2x2ZV9zZWN0aW9ucyhzdHJ1Y3QgbGl2
ZXBhdGNoX2VsZiAqZWxmLCBjb25zdCB2b2lkICpkYXRhKQo+ICAgICAgICAgICAgICAgKHNlY1tp
XS5zZWMtPnNoX3R5cGUgIT0gU0hUX05PQklUUyAmJiAvKiBTa2lwIFNIVF9OT0JJVFMgKi8KPiAg
ICAgICAgICAgICAgICAoZGVsdGEgPiBlbGYtPmxlbiB8fCAoZGVsdGEgKyBzZWNbaV0uc2VjLT5z
aF9zaXplID4gZWxmLT5sZW4pKSkgKQo+ICAgICAgICAgIHsKPiAtICAgICAgICAgICAgZHByaW50
ayhYRU5MT0dfRVJSLCBMSVZFUEFUQ0ggIiVzOiBTZWN0aW9uIFsldV0gZGF0YSAlcyBvZiBwYXls
b2FkIVxuIiwKPiAtICAgICAgICAgICAgICAgICAgICBlbGYtPm5hbWUsIGksCj4gKyAgICAgICAg
ICAgIHByaW50ayhYRU5MT0dfRVJSIExJVkVQQVRDSCAiJXM6IFNlY3Rpb24gWyV1XSBkYXRhICVz
IG9mIHBheWxvYWRcbiIsCj4gKyAgICAgICAgICAgICAgICAgICBlbGYtPm5hbWUsIGksCj4gICAg
ICAgICAgICAgICAgICAgICAgZGVsdGEgPCBzaXplb2YoRWxmX0VoZHIpID8gImF0IEVMRiBoZWFk
ZXIiIDogImlzIHBhc3QgZW5kIik7Cj4gQEAgLTMyOCw3ICszMjgsNyBAQCBpbnQgbGl2ZXBhdGNo
X2VsZl9yZXNvbHZlX3N5bWJvbHMoc3RydWN0IGxpdmVwYXRjaF9lbGYgKmVsZikKPiAgCj4gICAg
ICAgICAgICAgIGlmICggcmMgKQo+ICAgICAgICAgICAgICB7Cj4gLSAgICAgICAgICAgICAgICBk
cHJpbnRrKFhFTkxPR19FUlIsIExJVkVQQVRDSCAiJXM6IE91dCBvZiBib3VuZHMgc3ltYm9sIHNl
Y3Rpb24gJSN4XG4iLAo+ICsgICAgICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgTElWRVBB
VENIICIlczogT3V0IG9mIGJvdW5kcyBzeW1ib2wgc2VjdGlvbiAlI3hcbiIsCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgIGVsZi0+bmFtZSwgaWR4KTsKPiAgICAgICAgICAgICAgICAgIGJyZWFr
Owo+ICAgICAgICAgICAgICB9CgpUaGVzZSB0aHJlZSBodW5rcyBoYXZlIG1pbm9yIGluZGVudGF0
aW9uL3NwYWNpbmcgaXNzdWVzLsKgIEFsbCBjYW4gYmUKZml4ZWQgdXAgb24gY29tbWl0LgoKRXZl
cnl0aGluZyBlbHNlIExHVE0uCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
