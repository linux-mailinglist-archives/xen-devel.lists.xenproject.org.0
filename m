Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C8A112F19
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 16:58:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icWzq-0002zp-44; Wed, 04 Dec 2019 15:55:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R9pO=Z2=amazon.com=prvs=2347cf4ab=jgrall@srs-us1.protection.inumbo.net>)
 id 1icWzn-0002zk-Oy
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 15:55:19 +0000
X-Inumbo-ID: 78a7c118-16ae-11ea-aea8-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78a7c118-16ae-11ea-aea8-bc764e2007e4;
 Wed, 04 Dec 2019 15:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575474919; x=1607010919;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=zGQuZrBQCTnMYE2ij6UfvTiYffwORH+e/vYjvgX5XGI=;
 b=Ng1WvSxA95xZrMOX+q2wkzE3AryeZTS5TBOO/jJAQG8lOV60OvOXta3y
 LUtlCPaswBw3Q/zWagGQxn0tFGZyOA4F7BQzGEJUaqgPZtl2ynraufFdz
 uWTpyLJKhkwgcqRpF1QQH8ywZCr5mOUMhbKGAIFB3IcKGmbKL2bgelGPR g=;
IronPort-SDR: YeXUZCq9JATQLAtZAt2cocs1rKE+Q2uvaHPPVdYGhqJl7rkKG142Lp9AiBPb7WQsZjkJAXxHLc
 Msl9i2GEIpQw==
X-IronPort-AV: E=Sophos;i="5.69,277,1571702400"; 
   d="scan'208";a="7642491"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 04 Dec 2019 15:55:18 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com (Postfix) with ESMTPS
 id F394EA072D; Wed,  4 Dec 2019 15:55:16 +0000 (UTC)
Received: from EX13D32EUB002.ant.amazon.com (10.43.166.114) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Dec 2019 15:55:16 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D32EUB002.ant.amazon.com (10.43.166.114) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Dec 2019 15:55:15 +0000
Received: from a483e7b01a66.ant.amazon.com (10.125.106.66) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 4 Dec 2019 15:55:12 +0000
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan Beulich
 <jbeulich@suse.com>, Paul Durrant <pdurrant@amazon.com>
References: <20191128093828.8462-1-pdurrant@amazon.com>
 <33cd176f-074f-9c3a-1ba6-7a1b40f604ed@suse.com>
 <b39e656f-47a2-0132-1dd4-e6a3a9c3607a@oracle.com>
From: Julien Grall <jgrall@amazon.com>
Message-ID: <6992520f-c191-8282-d0f2-74713cfe0e54@amazon.com>
Date: Wed, 4 Dec 2019 15:55:12 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <b39e656f-47a2-0132-1dd4-e6a3a9c3607a@oracle.com>
Content-Language: en-GB
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3] xen/x86: vpmu: Unmap per-vCPU PMU page
 when the domain is destroyed
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQm9yaXMsCgpPbiAyOC8xMS8yMDE5IDIxOjUwLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4g
T24gMTEvMjgvMTkgNToyMyBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI4LjExLjIwMTkg
MTA6MzgsIFBhdWwgRHVycmFudCB3cm90ZToKPj4KPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUv
dnBtdS5jCj4+PiArKysgYi94ZW4vYXJjaC94ODYvY3B1L3ZwbXUuYwo+Pj4gQEAgLTU3NiwxMSAr
NTc2LDM2IEBAIHN0YXRpYyB2b2lkIHZwbXVfYXJjaF9kZXN0cm95KHN0cnVjdCB2Y3B1ICp2KQo+
Pj4gICAKPj4+ICAgICAgICAgICAgdnBtdS0+YXJjaF92cG11X29wcy0+YXJjaF92cG11X2Rlc3Ry
b3kodik7Cj4+PiAgICAgICB9Cj4+PiArCj4+PiArICAgIHZwbXVfcmVzZXQodnBtdSwgVlBNVV9D
T05URVhUX0FMTE9DQVRFRCk7Cj4+PiAgIH0KPj4gQm9yaXMsIHRvIGJlIG9uIHRoZSBzYWZlIHNp
ZGUgLSBhcmUgeW91IGluIGFncmVlbWVudCB3aXRoIHRoaXMKPj4gY2hhbmdlLCBub3cgdGhhdCB0
aGUgc2V0dGluZyBvZiB0aGUgZmxhZyBpcyBiZWluZyBsZWZ0IHVudG91Y2hlZD8KPiAKPiBZZXMs
IHRoaXMgaXMgZmluZS4KCkNhbiB3ZSB0YWtlIHRoaXMgYXMgYW4gQUNLPwoKPiAKPiAoSSBwcm9i
YWJseSB3b3VsZCBjbGVhciBpdCBpbiBhcmNoX3ZwbXVfZGVzdHJveSBvcCBzaW5jZSBpdCBpcyBz
ZXQgaW4KPiBhcmNoLXNwZWNpZmljIGNvZGUgYnV0IGVpdGhlciB3YXkgd29ya3MpCj4gCj4gLWJv
cmlzCj4gCgpDaGVlcnMsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
