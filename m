Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C16208C0
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 15:58:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRGrl-00024B-0U; Thu, 16 May 2019 13:56:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sIOE=TQ=amazon.com=prvs=03207e7a1=graf@srs-us1.protection.inumbo.net>)
 id 1hRGrk-000244-8n
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 13:56:12 +0000
X-Inumbo-ID: 5c7965e5-77e2-11e9-8980-bc764e045a96
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5c7965e5-77e2-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 13:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1558014971; x=1589550971;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=d3tF05X6+IMz0z3pdmsgwMoJMbbYKYQyJW/W5t9SFtI=;
 b=k2B77y/v8CaQC0rGb6Xqbv96CORAbw7wm1ve0QiujIWZVQYmLpybVI5I
 Mq/5fFi63ZZIFN139tHLU3bXfgQvYLHu4CABqsoGFY4oxPEG73vNm9ZHV
 GqOTaFdTro8T1PZoiQjEcrpVjl+Qxfxo8CBZNZ5J516YOM9QYd/EeJ5nT o=;
X-IronPort-AV: E=Sophos;i="5.60,476,1549929600"; d="scan'208";a="402404736"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 16 May 2019 13:56:04 +0000
Received: from EX13MTAUWC001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com (8.14.7/8.14.7) with
 ESMTP id x4GDu3Lg022882
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Thu, 16 May 2019 13:56:04 GMT
Received: from EX13D20UWC001.ant.amazon.com (10.43.162.244) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 16 May 2019 13:56:03 +0000
Received: from macbook-2.local (10.43.161.34) by EX13D20UWC001.ant.amazon.com
 (10.43.162.244) with Microsoft SMTP Server (TLS) id 15.0.1367.3;
 Thu, 16 May 2019 13:56:02 +0000
To: Filippo Sironi <sironi@amazon.de>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, <borntraeger@de.ibm.com>,
 <boris.ostrovsky@oracle.com>, <cohuck@redhat.com>,
 <konrad.wilk@oracle.com>, <xen-devel@lists.xenproject.org>,
 <vasu.srinivasan@oracle.com>
References: <1539078879-4372-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-3-git-send-email-sironi@amazon.de>
From: Alexander Graf <graf@amazon.com>
Message-ID: <f51a6a84-b21c-ab75-7e30-bfbe2ac6b98b@amazon.com>
Date: Thu, 16 May 2019 06:56:01 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557847002-23519-3-git-send-email-sironi@amazon.de>
Content-Language: en-US
X-Originating-IP: [10.43.161.34]
X-ClientProxiedBy: EX13D12UWC002.ant.amazon.com (10.43.162.253) To
 EX13D20UWC001.ant.amazon.com (10.43.162.244)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 2/2] KVM: x86: Implement the
 arch-specific hook to report the VM UUID
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

T24gMTQuMDUuMTkgMDg6MTYsIEZpbGlwcG8gU2lyb25pIHdyb3RlOgo+IE9uIHg4Niwgd2UgcmVw
b3J0IHRoZSBVVUlEIGluIERNSSBTeXN0ZW0gSW5mb3JtYXRpb24gKGkuZS4sIERNSSBUeXBlIDEp
Cj4gYXMgVk0gVVVJRC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBGaWxpcHBvIFNpcm9uaSA8c2lyb25p
QGFtYXpvbi5kZT4KPiAtLS0KPiAgYXJjaC94ODYva2VybmVsL2t2bS5jIHwgNyArKysrKysrCj4g
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC94
ODYva2VybmVsL2t2bS5jIGIvYXJjaC94ODYva2VybmVsL2t2bS5jCj4gaW5kZXggNWM5M2E2NWVl
MWU1Li40NDFjYWIwOGEwOWQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC94ODYva2VybmVsL2t2bS5jCj4g
KysrIGIvYXJjaC94ODYva2VybmVsL2t2bS5jCj4gQEAgLTI1LDYgKzI1LDcgQEAKPiAgI2luY2x1
ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ICAjaW5jbHVkZSA8bGludXgva3ZtX3BhcmEuaD4KPiAgI2lu
Y2x1ZGUgPGxpbnV4L2NwdS5oPgo+ICsjaW5jbHVkZSA8bGludXgvZG1pLmg+Cj4gICNpbmNsdWRl
IDxsaW51eC9tbS5oPgo+ICAjaW5jbHVkZSA8bGludXgvaGlnaG1lbS5oPgo+ICAjaW5jbHVkZSA8
bGludXgvaGFyZGlycS5oPgo+IEBAIC02OTQsNiArNjk1LDEyIEBAIGJvb2wga3ZtX3BhcmFfYXZh
aWxhYmxlKHZvaWQpCj4gIH0KPiAgRVhQT1JUX1NZTUJPTF9HUEwoa3ZtX3BhcmFfYXZhaWxhYmxl
KTsKPiAgCj4gK2NvbnN0IGNoYXIgKmt2bV9wYXJhX2dldF91dWlkKHZvaWQpCj4gK3sKPiArCXJl
dHVybiBkbWlfZ2V0X3N5c3RlbV9pbmZvKERNSV9QUk9EVUNUX1VVSUQpOwoKVGhpcyBhZGRzIGEg
bmV3IGRlcGVuZGVuY3kgb24gQ09ORklHX0RNSS4gUHJvYmFibHkgYmVzdCB0byBndWFyZCBpdCB3
aXRoCmFuICNpZiBJU19FTkFCTEVEKENPTkZJR19ETUkpLgoKVGhlIGNvbmNlcHQgc2VlbXMgc291
bmQgdGhvdWdoLgoKCkFsZXgKCj4gK30KPiArRVhQT1JUX1NZTUJPTF9HUEwoa3ZtX3BhcmFfZ2V0
X3V1aWQpOwo+ICsKPiAgdW5zaWduZWQgaW50IGt2bV9hcmNoX3BhcmFfZmVhdHVyZXModm9pZCkK
PiAgewo+ICAJcmV0dXJuIGNwdWlkX2VheChrdm1fY3B1aWRfYmFzZSgpIHwgS1ZNX0NQVUlEX0ZF
QVRVUkVTKTsKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
