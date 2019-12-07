Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B509115E15
	for <lists+xen-devel@lfdr.de>; Sat,  7 Dec 2019 19:57:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idfCq-00032m-65; Sat, 07 Dec 2019 18:53:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ACXR=Z5=amazon.com=prvs=2375083a5=jgrall@srs-us1.protection.inumbo.net>)
 id 1idfCo-00032h-Gb
 for xen-devel@lists.xenproject.org; Sat, 07 Dec 2019 18:53:26 +0000
X-Inumbo-ID: d89cf091-1922-11ea-85f0-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d89cf091-1922-11ea-85f0-12813bfff9fa;
 Sat, 07 Dec 2019 18:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575744805; x=1607280805;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=8mbIwN/OtySEFnW4+ktrzxEPOV9+VkfZaD8EOKSyRGQ=;
 b=Z9+Z/8r5clzbIgt1dpBt7D4ZnDvZOeuEWIOVOpGzOjJiqvzP1L9RI8Tw
 FvxB2cHaHcLdVTNxZEkZnWe4i5NvN6i1430l9auGdkJu5X8UvfRrBNQHc
 YkSQYX39pcfdikGyr3sLzZdQmqI3EbrGNTY473OhXeCwVcjWBt2O2o1U4 I=;
IronPort-SDR: THoPWKFaowL5/GAJLB6rU3GF17QmSiiU5DzJ1BVg5t0MqM6MPK9CANoVG5VDR5Oq2gWZHQu0d9
 1vhiP50U8b3g==
X-IronPort-AV: E=Sophos;i="5.69,289,1571702400"; d="scan'208";a="13560706"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-715bee71.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 07 Dec 2019 18:53:14 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-715bee71.us-east-1.amazon.com (Postfix) with ESMTPS
 id 043CDA2227; Sat,  7 Dec 2019 18:53:11 +0000 (UTC)
Received: from EX13D37EUA002.ant.amazon.com (10.43.165.200) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Sat, 7 Dec 2019 18:53:11 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D37EUA002.ant.amazon.com (10.43.165.200) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Sat, 7 Dec 2019 18:53:09 +0000
Received: from a483e7b01a66.ant.amazon.com (10.95.117.106) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Sat, 7 Dec 2019 18:53:07 +0000
To: "Xia, Hongyan" <hongyxia@amazon.com>, "andrew.cooper3@citrix.com"
 <andrew.cooper3@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <cover.1575646580.git.hongyxia@amazon.com>
 <86a6fb68f76ab287f5c2d99d1e7954e8b2d1ab05.1575646580.git.hongyxia@amazon.com>
 <43b7603e-bd14-d6eb-8d79-9afcd8627efd@citrix.com>
 <fa150bf7d436472befaaea2a076f3b8b917d07b7.camel@amazon.com>
From: Julien Grall <jgrall@amazon.com>
Message-ID: <f95f40f5-bd3c-6511-85a9-1f7413e664ab@amazon.com>
Date: Sat, 7 Dec 2019 18:53:07 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <fa150bf7d436472befaaea2a076f3b8b917d07b7.camel@amazon.com>
Content-Language: en-GB
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 1/2] x86/mm: factor out the code for
 shattering an l3 PTE
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "wl@xen.org" <wl@xen.org>, "jbeulich@suse.com" <jbeulich@suse.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwNy8xMi8yMDE5IDE4OjIwLCBYaWEsIEhvbmd5YW4gd3JvdGU6Cj4gaG1tLi4uIGlm
IHdlIHdhbnQgdG8gbWFrZSB0aGUgbnVsbGlmaWNhdGlvbiB2aXNpYmxlIHRvIHRoZSBjYWxsZXIg
d2UKPiBtaWdodCBuZWVkIHRvIHBhc3MgJi4gSSB3b25kZXIgaWYgaXQgbWFrZXMgc2Vuc2UgdG8g
c2ltcGx5IG1vdmUgdGhlCj4gbWVtb3J5IGFsbG9jYXRpb24gb2YgcGwyZSBpbnRvIHNoYXR0ZXJf
bDNlIGFzIHdlbGwsIHNvIHRoYXQgdGhlIGNhbGxlcgo+IGNhbm5vdCBoYXZlIGFueSBpZGVhcy4K
CkFGQUlDVCwgdGhlIGFsbG9jYXRpb24gaXMgZG9uZSB3aGVuIHNoYXR0ZXJpbmcgdGhlIHBhZ2Ut
dGFibGVzLiBTbyBpdCAKd291bGQgbWFrZSBzZW5zZSB0byBtb3ZlIGl0IHdpdGhpbmcgdGhlIHNo
YXR0ZXIgZnVuY3Rpb24uIE5vdGUgdGhhdCB5b3UgCndpbGwgbmVlZCB0byBwcm9wYWdhdGUgdGhl
IGVycm9yIGlmIHRoZXJlIGlzIGFueS4KCgpDaGVlcnMsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
