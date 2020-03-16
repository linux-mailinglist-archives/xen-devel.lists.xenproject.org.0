Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93191186C66
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2020 14:44:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jDpza-0003Am-En; Mon, 16 Mar 2020 13:41:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JvoA=5B=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jDpzY-0003AF-La
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2020 13:41:16 +0000
X-Inumbo-ID: cdeecdfb-678b-11ea-b834-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cdeecdfb-678b-11ea-b834-12813bfff9fa;
 Mon, 16 Mar 2020 13:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584366075;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Ct+F3M7AXC714gxmhJKG82dMprXMMaTrf6gx/jf5OQM=;
 b=c6exJ7nGmzZFeroDsoPK2tCbL1ggEtSXvKKEG9AFdcHbMc8cl0n2lRDc
 8lp4ZNr1jlJXYJz0ZuvrBQcAO8NdodxfD9OIDFafXQKAgqm5tg0ssKfiD
 FJtLHaY+wepxOJkZCZP8Dkezddq1FauFa1O0objpS1tPXq90R1NAk5IfE A=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: a9n2XiEl7dKvw4EduNUSgUTwUFbVqDHHg9LlpE1gJPHD9qzGgTvzfLHhEcg8/jHdzUAEiA3oQj
 7T33RbHff371l1hWyIr0ssN/s7RqJ1f3+cirzzjHTyVF47YhePmkY1d6wNCkDRjwITSFHCWc78
 s3LEcz5WxBGB41fyr2SfX5co+3W9YXZXAPERL7rKO6f91tw3JDeK+UlZuQ8hnDLpsnjMQmw9g8
 2mrd+rNHto6dcDfOScpe/iUVJjWoCD/4mDgGomjuyMlXdHzHlS8OdnRjiSa/OSVusR6kLWOwm7
 5JE=
X-SBRS: 2.7
X-MesageID: 14035677
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,560,1574139600"; d="scan'208";a="14035677"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <a036b093-0f0d-6998-c6ec-4463d53b337f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f6c5299a-e84e-dd81-9143-0c7bda4eb782@citrix.com>
Date: Mon, 16 Mar 2020 13:41:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <a036b093-0f0d-6998-c6ec-4463d53b337f@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/HVM: fix AMD ECS handling for Fam 10
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
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYvMDMvMjAyMCAxMTowMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlIGludm9sdmVkIGNv
bXBhcmlzb24gd2FzLCB2ZXJ5IGxpa2VseSBpbmFkdmVydGVudGx5LCBjb252ZXJ0ZWQgZnJvbQo+
PiA9IHRvID4gd2hlbiBtYWtpbmcgY2hhbmdlcyB1bnJlbGF0ZWQgdG8gdGhlIGFjdHVhbCBmYW1p
bHkgcmFuZ2UuCj4gCj4gRml4ZXM6IDk4NDFlYjcxZWE4NyAoIng4Ni9jcHVpZDogRHJvcCBhIGd1
ZXN0cyBjYWNoZWQgeDg2IGZhbWlseSBhbmQgbW9kZWwgaW5mb3JtYXRpb24iKQo+IFNpZ25lZC1v
ZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKPiAKPiAtLS0gYS94ZW4vYXJj
aC94ODYvaHZtL2lvcmVxLmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMKPiBAQCAt
MTI4NCw3ICsxMjg0LDcgQEAgc3RydWN0IGh2bV9pb3JlcV9zZXJ2ZXIgKmh2bV9zZWxlY3RfaW9y
ZQo+ICAgICAgICAgIGlmICggQ0Y4X0FERFJfSEkoY2Y4KSAmJgo+ICAgICAgICAgICAgICAgZC0+
YXJjaC5jcHVpZC0+eDg2X3ZlbmRvciA9PSBYODZfVkVORE9SX0FNRCAmJgo+ICAgICAgICAgICAg
ICAgKHg4Nl9mYW0gPSBnZXRfY3B1X2ZhbWlseSgKPiAtICAgICAgICAgICAgICAgICBkLT5hcmNo
LmNwdWlkLT5iYXNpYy5yYXdfZm1zLCBOVUxMLCBOVUxMKSkgPiAweDEwICYmCj4gKyAgICAgICAg
ICAgICAgICAgZC0+YXJjaC5jcHVpZC0+YmFzaWMucmF3X2ZtcywgTlVMTCwgTlVMTCkpID49IDB4
MTAgJiYKPiAgICAgICAgICAgICAgIHg4Nl9mYW0gPCAweDE3ICkKPiAgICAgICAgICB7Cj4gICAg
ICAgICAgICAgIHVpbnQ2NF90IG1zcl92YWw7Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
