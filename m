Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86ECF208A0
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 15:53:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRGml-0001aX-BV; Thu, 16 May 2019 13:51:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sIOE=TQ=amazon.com=prvs=03207e7a1=graf@srs-us1.protection.inumbo.net>)
 id 1hRGmC-0001YZ-Ql
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 13:50:28 +0000
X-Inumbo-ID: 8f60bcf5-77e1-11e9-8980-bc764e045a96
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8f60bcf5-77e1-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 13:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1558014627; x=1589550627;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=JOuNpojcOraO39wt6wtg3pPIWv2HnVSSFGiVGtHt9l8=;
 b=WcewTOwALML73elL0hc9mJgtCi2I90JhH85yN4DCcBjPZDtn//38zjRt
 q2HG0320gSL0awkSFG/ce0etAE5PB60dM83h53ZYUrm/3GBJnq8HvjzCi
 arr7x/GCZyAHyDUZbtGJ2K+tcFNNka5VuQyWc8YNxykOx3XpOiO8pg9GZ g=;
X-IronPort-AV: E=Sophos;i="5.60,476,1549929600"; d="scan'208";a="800005507"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-2c-168cbb73.us-west-2.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 16 May 2019 13:50:25 +0000
Received: from EX13MTAUWC001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2c-168cbb73.us-west-2.amazon.com (8.14.7/8.14.7) with
 ESMTP id x4GDoOfG043830
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Thu, 16 May 2019 13:50:24 GMT
Received: from EX13D20UWC001.ant.amazon.com (10.43.162.244) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 16 May 2019 13:50:23 +0000
Received: from macbook-2.local (10.43.161.34) by EX13D20UWC001.ant.amazon.com
 (10.43.162.244) with Microsoft SMTP Server (TLS) id 15.0.1367.3;
 Thu, 16 May 2019 13:50:23 +0000
To: Filippo Sironi <sironi@amazon.de>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, <borntraeger@de.ibm.com>,
 <boris.ostrovsky@oracle.com>, <cohuck@redhat.com>,
 <konrad.wilk@oracle.com>, <xen-devel@lists.xenproject.org>,
 <vasu.srinivasan@oracle.com>
References: <1539078879-4372-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-2-git-send-email-sironi@amazon.de>
From: Alexander Graf <graf@amazon.com>
Message-ID: <e976f31b-2ccd-29ba-6a32-2edde49f867f@amazon.com>
Date: Thu, 16 May 2019 06:50:21 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557847002-23519-2-git-send-email-sironi@amazon.de>
Content-Language: en-US
X-Originating-IP: [10.43.161.34]
X-ClientProxiedBy: EX13D06UWC002.ant.amazon.com (10.43.162.205) To
 EX13D20UWC001.ant.amazon.com (10.43.162.244)
Precedence: Bulk
X-Mailman-Approved-At: Thu, 16 May 2019 13:51:02 +0000
Subject: Re: [Xen-devel] [PATCH v2 1/2] KVM: Start populating
 /sys/hypervisor with KVM entries
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDUuMTkgMDg6MTYsIEZpbGlwcG8gU2lyb25pIHdyb3RlOgo+IFN0YXJ0IHBvcHVsYXRp
bmcgL3N5cy9oeXBlcnZpc29yIHdpdGggS1ZNIGVudHJpZXMgd2hlbiB3ZSdyZSBydW5uaW5nIG9u
Cj4gS1ZNLiBUaGlzIGlzIHRvIHJlcGxpY2F0ZSBmdW5jdGlvbmFsaXR5IHRoYXQncyBhdmFpbGFi
bGUgd2hlbiB3ZSdyZQo+IHJ1bm5pbmcgb24gWGVuLgo+IAo+IFN0YXJ0IHdpdGggL3N5cy9oeXBl
cnZpc29yL3V1aWQsIHdoaWNoIHVzZXJzIHByZWZlciBvdmVyCj4gL3N5cy9kZXZpY2VzL3ZpcnR1
YWwvZG1pL2lkL3Byb2R1Y3RfdXVpZCBhcyBhIHdheSB0byByZWNvZ25pemUgYSB2aXJ0dWFsCj4g
bWFjaGluZSwgc2luY2UgaXQncyBhbHNvIGF2YWlsYWJsZSB3aGVuIHJ1bm5pbmcgb24gWGVuIEhW
TSBhbmQgb24gWGVuIFBWCj4gYW5kLCBvbiB0b3Agb2YgdGhhdCBkb2Vzbid0IHJlcXVpcmUgcm9v
dCBwcml2aWxlZ2VzIGJ5IGRlZmF1bHQuCj4gTGV0J3MgY3JlYXRlIGFyY2gtc3BlY2lmaWMgaG9v
a3Mgc28gdGhhdCBkaWZmZXJlbnQgYXJjaGl0ZWN0dXJlcyBjYW4KPiBwcm92aWRlIGRpZmZlcmVu
dCBpbXBsZW1lbnRhdGlvbnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogRmlsaXBwbyBTaXJvbmkgPHNp
cm9uaUBhbWF6b24uZGU+CgpJIHRoaW5rIHRoaXMgbmVlZHMgc29tZXRoaW5nIGFraW4gdG8KCiAg
aHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvRG9jdW1lbnRhdGlvbi9BQkkvc3RhYmxlL3N5c2Zz
LWh5cGVydmlzb3IteGVuCgp0byBkb2N1bWVudCB3aGljaCBmaWxlcyBhcmUgYXZhaWxhYmxlLgoK
PiAtLS0KPiB2MjoKPiAqIG1vdmUgdGhlIHJldHJpZXZhbCBvZiB0aGUgVk0gVVVJRCBvdXQgb2Yg
dXVpZF9zaG93IGFuZCBpbnRvCj4gICBrdm1fcGFyYV9nZXRfdXVpZCwgd2hpY2ggaXMgYSB3ZWFr
IGZ1bmN0aW9uIHRoYXQgY2FuIGJlIG92ZXJ3cml0dGVuCj4gCj4gIGRyaXZlcnMvS2NvbmZpZyAg
ICAgICAgICAgICAgfCAgMiArKwo+ICBkcml2ZXJzL01ha2VmaWxlICAgICAgICAgICAgIHwgIDIg
KysKPiAgZHJpdmVycy9rdm0vS2NvbmZpZyAgICAgICAgICB8IDE0ICsrKysrKysrKysrKysrCj4g
IGRyaXZlcnMva3ZtL01ha2VmaWxlICAgICAgICAgfCAgMSArCj4gIGRyaXZlcnMva3ZtL3N5cy1o
eXBlcnZpc29yLmMgfCAzMCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgNSBmaWxl
cyBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L2t2bS9LY29uZmlnCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2t2bS9NYWtlZmlsZQo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9rdm0vc3lzLWh5cGVydmlzb3IuYwo+IAoKWy4u
Ll0KCj4gKwo+ICtfX3dlYWsgY29uc3QgY2hhciAqa3ZtX3BhcmFfZ2V0X3V1aWQodm9pZCkKPiAr
ewo+ICsJcmV0dXJuIE5VTEw7Cj4gK30KPiArCj4gK3N0YXRpYyBzc2l6ZV90IHV1aWRfc2hvdyhz
dHJ1Y3Qga29iamVjdCAqb2JqLAo+ICsJCQkgc3RydWN0IGtvYmpfYXR0cmlidXRlICphdHRyLAo+
ICsJCQkgY2hhciAqYnVmKQo+ICt7Cj4gKwljb25zdCBjaGFyICp1dWlkID0ga3ZtX3BhcmFfZ2V0
X3V1aWQoKTsKPiArCXJldHVybiBzcHJpbnRmKGJ1ZiwgIiVzXG4iLCB1dWlkKTsKClRoZSB1c3Vh
bCByZXR1cm4gdmFsdWUgZm9yIHRoZSBYZW4gL3N5cy9oeXBlcnZpc29yIGludGVyZmFjZSBpcwoi
PGRlbmllZD4iLiBXb3VsZG4ndCBpdCBtYWtlIHNlbnNlIHRvIGZvbGxvdyB0aGF0IHBhdHRlcm4g
Zm9yIHRoZSBLVk0Kb25lIHRvbz8gQ3VycmVudGx5LCBpZiB3ZSBjYW4gbm90IGRldGVybWluZSB0
aGUgVVVJRCB0aGlzIHdpbGwganVzdApyZXR1cm4gKG51bGwpLgoKT3RoZXJ3aXNlLCBsb29rcyBn
b29kIHRvIG1lLiBBcmUgeW91IGF3YXJlIG9mIGFueSBvdGhlciBmaWxlcyB3ZSBzaG91bGQKcHJv
dmlkZT8gQWxzbywgaXMgdGhlcmUgYW55IHJlYXNvbiBub3QgdG8gaW1wbGVtZW50IEFSTSBhcyB3
ZWxsIHdoaWxlIGF0IGl0PwoKQWxleAoKPiArfQo+ICsKPiArc3RhdGljIHN0cnVjdCBrb2JqX2F0
dHJpYnV0ZSB1dWlkID0gX19BVFRSX1JPKHV1aWQpOwo+ICsKPiArc3RhdGljIGludCBfX2luaXQg
dXVpZF9pbml0KHZvaWQpCj4gK3sKPiArCWlmICgha3ZtX3BhcmFfYXZhaWxhYmxlKCkpCj4gKwkJ
cmV0dXJuIDA7Cj4gKwlyZXR1cm4gc3lzZnNfY3JlYXRlX2ZpbGUoaHlwZXJ2aXNvcl9rb2JqLCAm
dXVpZC5hdHRyKTsKPiArfQo+ICsKPiArZGV2aWNlX2luaXRjYWxsKHV1aWRfaW5pdCk7Cj4gCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
