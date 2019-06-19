Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 400424B04F
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 05:03:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdQqN-0005Ha-LE; Wed, 19 Jun 2019 03:01:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5kts=US=oracle.com=ankur.a.arora@srs-us1.protection.inumbo.net>)
 id 1hdQqL-0005HU-W0
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 03:01:02 +0000
X-Inumbo-ID: 777acc68-923e-11e9-8980-bc764e045a96
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 777acc68-923e-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 03:01:00 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5J2xYt0070365;
 Wed, 19 Jun 2019 03:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=PU/QrzBhX1uRODKyqt1OB2b+ZI2Y0GRQ2fyxY3ZZbo0=;
 b=HuDXGRU7GQwxXiFXtOKnyASfppsjV52cCnaFNBeV+I7vIMTLNUP5rmbhk0FL7p5TxcpJ
 FFSM34/PVM70T/rzInzVvcaEo2ET9J7PwBD2TTDBQwrKxTi+6VtUvb3SiilFLLgVFZeC
 aQOHB6Tdk/Tf+5LAmHZ2c8C2/Neu96Oe3NdSvxrUhimkdWXoZ+PNa7kSckbxtDcu5RGC
 OPq/gQGdQUP0C3urjtz/M6w+RKpPVW1JITRrnFRv0wyWbgVVf0X6VkZX4WTjvnPOOYSL
 Kq2LPogVFA5dHfqSZwu433L6yvwPPCl8LYFncAtg7slPyshJAGyqR9ktrNXBuc/NCCo2 rw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2t78098qva-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 03:00:58 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5J2vpmm044585;
 Wed, 19 Jun 2019 02:58:57 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2t77yn2wew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 02:58:57 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5J2wuUd007233;
 Wed, 19 Jun 2019 02:58:56 GMT
Received: from [10.156.74.184] (/10.156.74.184)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 18 Jun 2019 19:58:55 -0700
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20190509172540.12398-1-ankur.a.arora@oracle.com>
 <20190509172540.12398-15-ankur.a.arora@oracle.com>
 <1a4e2fe7-ed2d-05f1-9f2f-f0a940b30151@suse.com>
From: Ankur Arora <ankur.a.arora@oracle.com>
Message-ID: <54f3f690-4e71-325a-6544-6867174a0f0c@oracle.com>
Date: Tue, 18 Jun 2019 19:59:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1a4e2fe7-ed2d-05f1-9f2f-f0a940b30151@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9292
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906190022
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9292
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906190022
Subject: Re: [Xen-devel] [RFC PATCH 14/16] xen/blk: gnttab, evtchn,
 xenbus API changes
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
Cc: pbonzini@redhat.com, boris.ostrovsky@oracle.com, sstabellini@kernel.org,
 joao.m.martins@oracle.com, konrad.wilk@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNi8xNy8xOSAzOjE0IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IE9uIDA5LjA1LjE5IDE5
OjI1LCBBbmt1ciBBcm9yYSB3cm90ZToKPj4gRm9yIHRoZSBtb3N0IHBhcnQsIHdlIG5vdyBwYXNz
IHhlbmhvc3RfdCAqIGFzIGEgcGFyYW1ldGVyLgo+Pgo+PiBDby1kZXZlbG9wZWQtYnk6IEpvYW8g
TWFydGlucyA8am9hby5tLm1hcnRpbnNAb3JhY2xlLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogQW5r
dXIgQXJvcmEgPGFua3VyLmEuYXJvcmFAb3JhY2xlLmNvbT4KPiAKPiBJIGRvbid0IHNlZSBob3cg
dGhpcyBjYW4gYmUgYSBwYXRjaCBvbiBpdHMgb3duLgpZZXMsIHRoZSByZWFzb24gdGhpcyB3YXMg
c2VwYXJhdGUgd2FzIHRoYXQgZ2l2ZW4gdGhpcyB3YXMgYW4KUkZDLCBJIGRpZG4ndCB3YW50IHRv
IHBvbGx1dGUgdGhlIGxvZ2ljIHBhZ2Ugd2l0aCBsb3RzIG9mCm1lY2hhbmljYWwgY2hhbmdlcy4K
Cj4gCj4gVGhlIG9ubHkgd2F5IHRvIGJlIGFibGUgdG8gdXNlIGEgcGF0Y2ggZm9yIGVhY2ggZHJp
dmVyIHdvdWxkIGJlIHRvCj4ga2VlcCB0aGUgb3JpZ2luYWwgZ3JhbnQtLCBldmVudC0gYW5kIHhl
bmJ1cy1pbnRlcmZhY2VzIGFuZCBhZGQgdGhlCj4gbmV3IG9uZXMgdGFraW5nIHhlbmhvc3QgKiB3
aXRoIGEgbmV3IG5hbWUuIFRoZSBvcmlnaW5hbCBpbnRlcmZhY2VzCj4gY291bGQgdGhlbiB1c2Ug
eGVuaG9zdF9kZWZhdWx0IGFuZCB5b3UgY2FuIHN3aXRjaCB0aGVtIHRvIHRoZSBuZXcKPiBpbnRl
cmZhY2VzIG9uZSBieSBvbmUuIFRoZSBsYXN0IHBhdGNoIGNvdWxkIHRoZW4gcmVtb3ZlIHRoZSBv
bGQKPiBpbnRlcmZhY2VzIHdoZW4gdGhlcmUgaXMgbm8gdXNlciBsZWZ0LgpZZXMsIHRoaXMgbWFr
ZXMgc2Vuc2UuCgpBbmt1cgoKPiAKPiAKPiBKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
