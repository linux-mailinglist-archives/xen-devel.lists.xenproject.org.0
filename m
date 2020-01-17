Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B56140D26
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 15:59:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isT33-0005Nb-4S; Fri, 17 Jan 2020 14:56:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dsP0=3G=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1isT32-0005NW-7o
 for xen-devel@lists.xen.org; Fri, 17 Jan 2020 14:56:32 +0000
X-Inumbo-ID: 89f4c2d8-3939-11ea-b54c-12813bfff9fa
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 89f4c2d8-3939-11ea-b54c-12813bfff9fa;
 Fri, 17 Jan 2020 14:56:28 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00HEr9gs170370;
 Fri, 17 Jan 2020 14:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=RDYxmTVi6oTBCZ/d+490GqYHOHA9lPToi4gO08lPyRM=;
 b=AgWPVT2XCVmAXkqITfU70s/3cCF8Sp0GY33C70RcH0SMhQwG7itGReWnDR5elNp9POcd
 C515OTVt5ANzeQJ6+iytxN56YsmbdjQQhGRXoDQ/XqeGVxJpKt9jur7muPeJeYK4gcXe
 2x3RegrwIWpwmSktWpe5av0hWsLqsNs+35dJ4SZLF7aAyVI2O+KIFess/Y0GuRwC73iC
 +tARVqkzGDGCH2jTjZbSwmkE3UqFTj9Mci7Wld5D9x1+RbwZKBFvoyra6XWYWMs/3vs+
 vHJrZweJDTdVe5yQWPTDkRXyNdgQ/wW9/LqmUx3CjqZRXpNjvt86zG3BPhIjIp4WEH9J JA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2xf73u91uj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jan 2020 14:56:19 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00HEsBST166391;
 Fri, 17 Jan 2020 14:56:19 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2xk24f4w2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jan 2020 14:56:19 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 00HEuH6G006884;
 Fri, 17 Jan 2020 14:56:17 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 17 Jan 2020 06:56:17 -0800
To: Sergey Dyasli <sergey.dyasli@citrix.com>, xen-devel@lists.xen.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20200117125834.14552-1-sergey.dyasli@citrix.com>
 <20200117125834.14552-3-sergey.dyasli@citrix.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <28aba070-fa53-5677-c2d2-97d06514dda8@oracle.com>
Date: Fri, 17 Jan 2020 09:56:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200117125834.14552-3-sergey.dyasli@citrix.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9502
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=991
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001170117
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9502
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001170117
Subject: Re: [Xen-devel] [PATCH v2 2/4] x86/xen: add basic KASAN support for
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxLzE3LzIwIDc6NTggQU0sIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4gLS0tIGEvYXJjaC94
ODYvbW0va2FzYW5faW5pdF82NC5jCj4gKysrIGIvYXJjaC94ODYvbW0va2FzYW5faW5pdF82NC5j
Cj4gQEAgLTEzLDYgKzEzLDkgQEAKPiAgICNpbmNsdWRlIDxsaW51eC9zY2hlZC90YXNrLmg+Cj4g
ICAjaW5jbHVkZSA8bGludXgvdm1hbGxvYy5oPgo+ICAgCj4gKyNpbmNsdWRlIDx4ZW4veGVuLmg+
Cj4gKyNpbmNsdWRlIDx4ZW4veGVuLW9wcy5oPgo+ICsKPiAgICNpbmNsdWRlIDxhc20vZTgyMC90
eXBlcy5oPgo+ICAgI2luY2x1ZGUgPGFzbS9wZ2FsbG9jLmg+Cj4gICAjaW5jbHVkZSA8YXNtL3Rs
YmZsdXNoLmg+Cj4gQEAgLTMzMiw2ICszMzUsMTEgQEAgdm9pZCBfX2luaXQga2FzYW5fZWFybHlf
aW5pdCh2b2lkKQo+ICAgCWZvciAoaSA9IDA7IHBndGFibGVfbDVfZW5hYmxlZCgpICYmIGkgPCBQ
VFJTX1BFUl9QNEQ7IGkrKykKPiAgIAkJa2FzYW5fZWFybHlfc2hhZG93X3A0ZFtpXSA9IF9fcDRk
KHA0ZF92YWwpOwo+ICAgCj4gKwlpZiAoeGVuX3B2X2RvbWFpbigpKSB7Cj4gKwkJcGdkX3QgKnB2
X3RvcF9wZ3QgPSB4ZW5fcHZfa2FzYW5fZWFybHlfaW5pdCgpOwo+ICsJCWthc2FuX21hcF9lYXJs
eV9zaGFkb3cocHZfdG9wX3BndCk7Cj4gKwl9Cj4gKwoKCkknZCBzdWdnZXN0IHJlcGxhY2luZyB0
aGlzIHdpdGggeGVuX2thc2FuX2Vhcmx5X2luaXQoKSBhbmQgZG9pbmcgCmV2ZXJ5dGhpbmcsIGlu
Y2x1ZGluZyBQViBjaGVjaywgdGhlcmUuIFRoaXMgd2F5IG5vbi1YZW4gY29kZSB3b24ndCBuZWVk
IAp0byBiZSBhd2FyZSBvZiBYZW4tc3BlY2lmaWMgZGV0YWlscyBzdWNoIGFzIGd1ZXN0IHR5cGVz
LgoKCj4gICAJa2FzYW5fbWFwX2Vhcmx5X3NoYWRvdyhlYXJseV90b3BfcGd0KTsKPiAgIAlrYXNh
bl9tYXBfZWFybHlfc2hhZG93KGluaXRfdG9wX3BndCk7Cj4gICB9Cj4gQEAgLTM2OSw2ICszNzcs
OCBAQCB2b2lkIF9faW5pdCBrYXNhbl9pbml0KHZvaWQpCj4gICAJCQkJX19wZ2QoX19wYSh0bXBf
cDRkX3RhYmxlKSB8IF9LRVJOUEdfVEFCTEUpKTsKPiAgIAl9Cj4gICAKPiArCXhlbl9wdl9rYXNh
bl9waW5fcGdkKGVhcmx5X3RvcF9wZ3QpOwo+ICsKCkFuZCBkcm9wICJfcHYiIGhlcmUgKGFuZCBi
ZWxvdykgZm9yIHRoZSBzYW1lIHJlYXNvbi4KCi1ib3JpcwoKPiAgIAlsb2FkX2NyMyhlYXJseV90
b3BfcGd0KTsKPiAgIAlfX2ZsdXNoX3RsYl9hbGwoKTsKPiAgIAo+IEBAIC00MzMsNiArNDQzLDgg
QEAgdm9pZCBfX2luaXQga2FzYW5faW5pdCh2b2lkKQo+ICAgCWxvYWRfY3IzKGluaXRfdG9wX3Bn
dCk7Cj4gICAJX19mbHVzaF90bGJfYWxsKCk7Cj4gICAKPiArCXhlbl9wdl9rYXNhbl91bnBpbl9w
Z2QoZWFybHlfdG9wX3BndCk7Cj4gKwo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
