Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6746E10B37C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 17:34:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ia0F3-0007aY-Jw; Wed, 27 Nov 2019 16:32:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=u1X1=ZT=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1ia0F2-0007aP-IU
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 16:32:36 +0000
X-Inumbo-ID: 848f1ef2-1133-11ea-a3b9-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 848f1ef2-1133-11ea-a3b9-12813bfff9fa;
 Wed, 27 Nov 2019 16:32:35 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xARG9hW7098441;
 Wed, 27 Nov 2019 16:32:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=RPlFB76BWuXCaigtduo11H+Wr+YWSUqW9SDehQw2mxY=;
 b=ZJlpzPdr5103mTHSRApj+PuWqoeXXFtOYfo5JlkmWi4gtEh4HgVhTsi5VGJkE3cdZXJj
 gdqt5jUuQ7YemsYnDCU4tQGaGp9U1CbqjVU5iNQGbFV2QVZ5UxPDtzA2nH8RGy3KtjA8
 aoPd39MVTYkQ6FJlEUP/CG5MssgS8o7CwTFLkEE8bcYOU27QoN1nFlH7gZH+N6TJqPAT
 VvIjDA0kv80b2sERorcgvglYpxGBoUjZxN62LW90c/6nkG9MirtbLRxUxkVrtOp930pM
 4dI/brWgW58QAGi2kDjNdLFANZw9o7JOSzop6Oh16RWmfikW4XlPBGUuZAjCFaCdXuyx Xg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2wewdrem6a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Nov 2019 16:32:32 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xARGEXvB140290;
 Wed, 27 Nov 2019 16:32:31 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2wgvhcer36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Nov 2019 16:32:31 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xARGWTQe000303;
 Wed, 27 Nov 2019 16:32:29 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 27 Nov 2019 08:32:29 -0800
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <pdurrant@amazon.com>
References: <20191127120046.1246-1-pdurrant@amazon.com>
 <f847a83d-ce95-5fd4-3cdd-d74f45dcadd6@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Autocrypt: addr=boris.ostrovsky@oracle.com; prefer-encrypt=mutual; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <7dcd5d27-d368-4242-68bc-17f3bb4d1eaf@oracle.com>
Date: Wed, 27 Nov 2019 11:32:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <f847a83d-ce95-5fd4-3cdd-d74f45dcadd6@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9454
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911270139
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9454
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911270139
Subject: Re: [Xen-devel] [PATCH v2] xen/x86: vpmu: Unmap per-vCPU PMU page
 when the domain is destroyed
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMjcvMTkgMTA6NDQgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI3LjExLjIwMTkg
MTM6MDAsIFBhdWwgRHVycmFudCB3cm90ZToKPj4gLS0tIGEveGVuL2FyY2gveDg2L2NwdS92cG11
LmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2NwdS92cG11LmMKPj4gQEAgLTQ3OSw2ICs0NzksOCBA
QCBzdGF0aWMgaW50IHZwbXVfYXJjaF9pbml0aWFsaXNlKHN0cnVjdCB2Y3B1ICp2KQo+PiAgCj4+
ICAgICAgaWYgKCByZXQgKQo+PiAgICAgICAgICBwcmludGsoWEVOTE9HX0dfV0FSTklORyAiVlBN
VTogSW5pdGlhbGl6YXRpb24gZmFpbGVkIGZvciAlcHZcbiIsIHYpOwo+PiArICAgIGVsc2UKPj4g
KyAgICAgICAgdnBtdV9zZXQodnBtdSwgVlBNVV9DT05URVhUX0FMTE9DQVRFRCk7CgpUaGF0IHdv
bid0IHdvcmsgSSB0aGluay4KCk9uIEludGVsIHRoZSBjb250ZXh0IGlzIGFsbG9jYXRlZCBsYXpp
bHkgZm9yIEhWTS9QVkggZ3Vlc3RzIGR1cmluZyB0aGUKZmlyc3QgTVNSIGFjY2Vzcy4gRm9yIGV4
YW1wbGU6Cgpjb3JlMl92cG11X2RvX3dybXNyKCkgLT4KwqDCoMKgIGNvcmUyX3ZwbXVfbXNyX2Nv
bW1vbl9jaGVjaygpKToKwqDCoMKgIMKgwqDCoCBpZiAoIHVubGlrZWx5KCF2cG11X2lzX3NldCh2
cG11LCBWUE1VX0NPTlRFWFRfQUxMT0NBVEVEKSkgJiYKwqDCoMKgIMKgwqDCoMKgwqDCoMKgwqAg
IWNvcmUyX3ZwbXVfYWxsb2NfcmVzb3VyY2UoY3VycmVudCkgKQrCoMKgwqAgwqDCoCDCoMKgwqAg
wqAgwqDCoCByZXR1cm4gMDsKCkZvciBQViBndWVzdHMgdGhlIGNvbnRleHQgKmlzKiBhbGxvY2F0
ZWQgZnJvbSB2bXhfdnBtdV9pbml0aWFsaXNlKCkuCgpJIGRvbid0IHJlbWVtYmVyIHdoeSBvbmx5
IFBWIGRvZXMgZWFnZXIgYWxsb2NhdGlvbiBidXQgSSB0aGluayBkb2luZyBpdApmb3IgYWxsIGd1
ZXN0cyB3b3VsZCBtYWtlIGNvZGUgbXVjaCBzaW1wbGVyIGFuZCB0aGVuIHRoaXMgcGF0Y2ggd2ls
bCBiZQpjb3JyZWN0LgoKLWJvcmlzCgoKPj4gIAo+PiAgICAgIHJldHVybiByZXQ7Cj4+ICB9Cj4+
IEBAIC01NzYsMTEgKzU3OCwzNiBAQCBzdGF0aWMgdm9pZCB2cG11X2FyY2hfZGVzdHJveShzdHJ1
Y3QgdmNwdSAqdikKPj4gIAo+PiAgICAgICAgICAgdnBtdS0+YXJjaF92cG11X29wcy0+YXJjaF92
cG11X2Rlc3Ryb3kodik7Cj4+ICAgICAgfQo+PiArCj4+ICsgICAgdnBtdV9yZXNldCh2cG11LCBW
UE1VX0NPTlRFWFRfQUxMT0NBVEVEKTsKPj4gIH0KPiBCb3JpcywKPgo+IEknZCBsaWtlIHRvIGFz
ayB0aGF0IHlvdSBjb21tZW50IG9uIHRoaXMgcGFydCBvZiB0aGUgY2hhbmdlIGF0Cj4gbGVhc3Qs
IGFzIEkgc2VlbSB0byB2YWd1ZWx5IHJlY2FsbCB0aGF0IHRoaW5ncyB3ZXJlIGludGVudGlvbmFs
bHkKPiBub3QgZG9uZSB0aGlzIHdheSBvcmlnaW5hbGx5Lgo+Cj4gUGF1bCwKPgo+IGV2ZXJ5dGhp
bmcgZWxzZSBsb29rcyBnb2QgdG8gbWUgbm93Lgo+Cj4gSmFuCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
