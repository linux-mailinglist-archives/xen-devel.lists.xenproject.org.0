Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF0CAE81E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 12:30:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7dM4-0007hn-SY; Tue, 10 Sep 2019 10:26:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zTA9=XF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i7dM3-0007hc-0Y
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 10:26:35 +0000
X-Inumbo-ID: 762bcb6f-d3b5-11e9-ac1a-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 762bcb6f-d3b5-11e9-ac1a-12813bfff9fa;
 Tue, 10 Sep 2019 10:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568111194;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=UfuFVogf0LMZELBhdkOZpa0xhvRF00xdz8DTs1RzK/I=;
 b=ECqWyaLGmxbFqBK7Laz1bLIFvwa7Pl8Qe6KQYlPOD/5FTwXcVLBNrCcL
 MnU8+JHy3MrXtK3kAqv4VHu3YsErGjs56sQOopPKe0qfZpysnYUqhUJCg
 M2pBBzWzZH/++8OcLeI10XRxPJEnFeNHlZA8w6in34IGFe8RopIORlvNu A=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: W6GWzc0q84ZFNBnrbUqqdRQV/GVV9bAmD4aglOoR/FI3XAjIHCMPNo1OPFmEeh37LpYG8VUqrC
 oGITO04g46KRWd6fbx93eW9QEZqHH8dTM3UIGvKI3prES+lLHbG13L7VRqmTSCVus4VkMgNd2f
 U9t13P+g9MUJ+lFTfwPniJm+3Hy/NeaIoDmcVIkJTk58xZvYsE44Kdel7ObLV0E48FMadfLqXV
 to8QDKuFz26lD0OWphTqQ9n3DeP7WfNb0gLwXYSzSb34s2RpvSi0FuV8Es/yxMmz3O45RneuMB
 4Uk=
X-SBRS: 2.7
X-MesageID: 5412951
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5412951"
To: Jan Beulich <jbeulich@suse.com>
References: <20190909155124.19942-1-andrew.cooper3@citrix.com>
 <ba415d32-3b4e-1ac5-2968-ab01d526de00@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <ef4b2f5c-fe07-215e-638f-bd21bf9ec064@citrix.com>
Date: Tue, 10 Sep 2019 11:26:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ba415d32-3b4e-1ac5-2968-ab01d526de00@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/cpuid: Fix handling of the
 CPUID.7[0].eax levelling MSR
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMDkvMjAxOSAxMToyNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDkuMDkuMjAxOSAx
Nzo1MSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gLS0tIGEveGVuL2FyY2gveDg2L2RvbWN0bC5j
Cj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9kb21jdGwuYwo+PiBAQCAtMjE4LDExICsyMTgsMTYgQEAg
c3RhdGljIGludCB1cGRhdGVfZG9tYWluX2NwdWlkX2luZm8oc3RydWN0IGRvbWFpbiAqZCwKPj4g
ICAgICAgICAgaWYgKCBpc19wdl9kb21haW4oZCkgJiYgKChsZXZlbGxpbmdfY2FwcyAmIExDQVBf
N2FiMCkgPT0gTENBUF83YWIwKSApCj4+ICAgICAgICAgIHsKPj4gICAgICAgICAgICAgIHVpbnQ2
NF90IG1hc2sgPSBjcHVpZG1hc2tfZGVmYXVsdHMuXzdhYjA7Cj4+IC0gICAgICAgICAgICB1aW50
MzJfdCBlYXggPSBjdGwtPmVheDsKPj4gLSAgICAgICAgICAgIHVpbnQzMl90IGVieCA9IHAtPmZl
YXQuXzdiMDsKPj4gIAo+PiAtICAgICAgICAgICAgaWYgKCBib290X2NwdV9kYXRhLng4Nl92ZW5k
b3IgJiAoWDg2X1ZFTkRPUl9BTUQgfCBYODZfVkVORE9SX0hZR09OKSApCj4+IC0gICAgICAgICAg
ICAgICAgbWFzayAmPSAoKHVpbnQ2NF90KWVheCA8PCAzMikgfCBlYng7Cj4+ICsgICAgICAgICAg
ICAvKgo+PiArICAgICAgICAgICAgICogTGVhZiA3WzBdLmVheCBpcyBtYXhfc3VibGVhZiwgbm90
IGEgZmVhdHVyZSBtYXNrLiAgVGFrZSBpdAo+PiArICAgICAgICAgICAgICogd2hvbGVzYWxlIGZy
b20gdGhlIHBvbGljeSwgYnV0IGNsYW1wIHRoZSBmZWF0dXJlcyBpbiA3WzBdLmVieAo+PiArICAg
ICAgICAgICAgICogcGVyIHVzdWFsLgo+PiArICAgICAgICAgICAgICovCj4+ICsgICAgICAgICAg
ICBpZiAoIGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciAmCj4+ICsgICAgICAgICAgICAgICAgIChY
ODZfVkVORE9SX0FNRCB8IFg4Nl9WRU5ET1JfSFlHT04pICkKPj4gKyAgICAgICAgICAgICAgICBt
YXNrID0gKCgodWludDY0X3QpcC0+ZmVhdC5tYXhfc3VibGVhZiA8PCAzMikgfAo+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgKCh1aW50MzJfdCltYXNrIHwgcC0+ZmVhdC5fN2IwKSk7Cj4gQXNz
dW1pbmcgeW91IG1lYW4gJiBpbnN0ZWFkIG9mIHwgaGVyZSwgd2l0aCBpdCBmaXhlZAoKT29wcyAt
IEkgZG8uCgo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpU
aGFua3MsCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
