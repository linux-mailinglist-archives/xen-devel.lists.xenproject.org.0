Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A621040C8
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 17:28:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXSo4-0001zB-EO; Wed, 20 Nov 2019 16:26:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXSo2-0001z1-5i
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 16:26:14 +0000
X-Inumbo-ID: 77a6d094-0bb2-11ea-a31b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 77a6d094-0bb2-11ea-a31b-12813bfff9fa;
 Wed, 20 Nov 2019 16:26:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 84241B308C;
 Wed, 20 Nov 2019 16:26:12 +0000 (UTC)
To: Hongyan Xia <hongyax@amazon.com>, Wei Liu <wl@xen.org>
References: <cover.1570034362.git.hongyax@amazon.com>
 <f2e5ccd13e8f1cb400393b8e01c9a4408efe365f.1570034362.git.hongyax@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2c98170a-2dee-4a9a-25f5-53eefb237779@suse.com>
Date: Wed, 20 Nov 2019 17:26:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <f2e5ccd13e8f1cb400393b8e01c9a4408efe365f.1570034362.git.hongyax@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 7/9] x86/mm: make sure there is one exit
 path for modify_xen_mappings
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMTAuMjAxOSAxOToxNiwgSG9uZ3lhbiBYaWEgd3JvdGU6Cj4gQEAgLTU0NjgsNyArNTQ2
OSwxMSBAQCBpbnQgbW9kaWZ5X3hlbl9tYXBwaW5ncyh1bnNpZ25lZCBsb25nIHMsIHVuc2lnbmVk
IGxvbmcgZSwgdW5zaWduZWQgaW50IG5mKQo+ICAgICAgICAgICAgICAvKiBQQUdFMUdCOiBzaGF0
dGVyIHRoZSBzdXBlcnBhZ2UgYW5kIGZhbGwgdGhyb3VnaC4gKi8KPiAgICAgICAgICAgICAgbDJ0
ID0gYWxsb2NfeGVuX3BhZ2V0YWJsZSgpOwo+ICAgICAgICAgICAgICBpZiAoICFsMnQgKQo+IC0g
ICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gKyAgICAgICAgICAgIHsKPiArICAgICAg
ICAgICAgICAgIEFTU0VSVChyYyA9PSAtRU5PTUVNKTsKPiArICAgICAgICAgICAgICAgIGdvdG8g
b3V0Owo+ICsgICAgICAgICAgICB9CgpTYW1lIGFzIGZvciBwYXRjaCA1IC0gSSB0aGluayB0aGVz
ZSBBU1NFUlQoKXMgYXJlbid0IHZlcnkgaGVscGZ1bC4KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
