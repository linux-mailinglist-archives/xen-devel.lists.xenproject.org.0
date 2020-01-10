Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C40C6136C44
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 12:48:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipskf-0001up-Oi; Fri, 10 Jan 2020 11:46:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VEhH=27=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1ipskd-0001u5-Nb
 for xen-devel@lists.xen.org; Fri, 10 Jan 2020 11:46:51 +0000
X-Inumbo-ID: e369e492-339e-11ea-bed0-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e369e492-339e-11ea-bed0-12813bfff9fa;
 Fri, 10 Jan 2020 11:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578656810;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=y9AKCGeI0refv9ETLVVTW4z3Pz3rtt3THeDYBOo2/wE=;
 b=FvOAMMR5f8eLTK3NxxHyu/8PopHfon3iP+5TLAgHD+W4aGusuwvSy5Wz
 qaj2W1BPChAdQRL0z+XPCG/N30rX0nSvmlio7RXCYD1CqbxKdYCqCWZWy
 WD+wxl66p38dHr72C8rBv88qv2HnQ/Lq5R+LtCA5JGdWn9qruGwNuTQAX M=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: uyM5kwOdR2boap5K896BuZM84UBNSBDkO98FNlQkAu1Pj8mEBmSHIJetocQa4TMSHZ5FlS1ZZ8
 LQ7Ezx4Cyu7dTOA9vnCIENf0//Jq9LBonK00mllB4r9zO85tePdpm8VKBNWPtqdtrz95uK2CSm
 4wNwJiYw4IV9dZU+CcLCtIYauqxKnZ2eXkLY9MyWOibSjc/+GtY9Jab+ag3z78vT2azmeSx9BQ
 LtSAC1vlJ2gPOsHdFGAd4MyoA0rR+e5lIIYaoRs30pVRHB2FiFLgC8bvfSky/1sdJYTgceZCE1
 xzI=
X-SBRS: 2.7
X-MesageID: 10896649
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,416,1571716800"; d="scan'208";a="10896649"
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, <xen-devel@lists.xen.org>,
 <kasan-dev@googlegroups.com>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>
References: <20200108152100.7630-1-sergey.dyasli@citrix.com>
 <20200108152100.7630-3-sergey.dyasli@citrix.com>
 <5214cb54-1719-f93b-130f-90c5da31e22a@oracle.com>
From: Sergey Dyasli <sergey.dyasli@citrix.com>
Autocrypt: addr=sergey.dyasli@citrix.com; keydata=
 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
Message-ID: <76cf8b94-6f71-9f8c-0fc9-07ad4aded3be@citrix.com>
Date: Fri, 10 Jan 2020 11:46:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <5214cb54-1719-f93b-130f-90c5da31e22a@oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1 2/4] x86/xen: add basic KASAN support for
 PV kernel
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
Cc: Juergen Gross <jgross@suse.com>, "sergey.dyasli@citrix.com >>
 Sergey Dyasli" <sergey.dyasli@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMDEvMjAyMCAyMzoyNywgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IAo+IAo+IE9uIDEv
OC8yMCAxMDoyMCBBTSwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPj4gQEAgLTE5NDMsNiArMTk3Mywx
NSBAQCB2b2lkIF9faW5pdCB4ZW5fc2V0dXBfa2VybmVsX3BhZ2V0YWJsZShwZ2RfdCAqcGdkLCB1
bnNpZ25lZCBsb25nIG1heF9wZm4pCj4+IMKgwqDCoMKgwqAgaWYgKGkgJiYgaSA8IHBnZF9pbmRl
eChfX1NUQVJUX0tFUk5FTF9tYXApKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaW5pdF90b3BfcGd0
W2ldID0gKChwZ2RfdCAqKXhlbl9zdGFydF9pbmZvLT5wdF9iYXNlKVtpXTsKPj4gwqAgKyNpZmRl
ZiBDT05GSUdfS0FTQU4KPj4gK8KgwqDCoCAvKgo+PiArwqDCoMKgwqAgKiBDb3B5IEtBU0FOIG1h
cHBpbmdzCj4+ICvCoMKgwqDCoCAqIGZmZmZlYzAwMDAwMDAwMDAgLSBmZmZmZmJmZmZmZmZmZmZm
ICg9NDQgYml0cykga2FzYW4gc2hhZG93IG1lbW9yeSAoMTZUQikKPj4gK8KgwqDCoMKgICovCj4+
ICvCoMKgwqAgZm9yIChpID0gMHhlYzAgPj4gMzsgaSA8IDB4ZmMwID4+IDM7IGkrKykKPiAKPiBB
cmUgeW91IHJlZmVycmluZyBoZXJlIHRvwqAgS0FTQU5fU0hBRE9XX1NUQVJUIGFuZCBLQVNBTl9T
SEFET1dfRU5EPyBJZiBzbywgY2FuIHlvdSB1c2UgdGhlbSBpbnN0ZWFkPwoKSW5kZWVkLCB0aGUg
Zm9sbG93aW5nIG1hY3JvcyBtYWtlIHRoZSBjb2RlIG5lYXRlcjoKCiNpZmRlZiBDT05GSUdfS0FT
QU4KCS8qIENvcHkgS0FTQU4gbWFwcGluZ3MgKi8KCWZvciAoaSA9IHBnZF9pbmRleChLQVNBTl9T
SEFET1dfU1RBUlQpOwoJICAgICBpIDwgcGdkX2luZGV4KEtBU0FOX1NIQURPV19FTkQpOwoJICAg
ICBpKyspCgkJaW5pdF90b3BfcGd0W2ldID0gKChwZ2RfdCAqKXhlbl9zdGFydF9pbmZvLT5wdF9i
YXNlKVtpXTsKI2VuZGlmIC8qIGlmZGVmIENPTkZJR19LQVNBTiAqLwoKLS0KVGhhbmtzLApTZXJn
ZXkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
