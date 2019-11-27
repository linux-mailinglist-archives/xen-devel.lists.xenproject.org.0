Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEBB10B4E3
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 18:55:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ia1V1-0007Kb-79; Wed, 27 Nov 2019 17:53:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qf8Z=ZT=oracle.com=joe.jin@srs-us1.protection.inumbo.net>)
 id 1ia1V0-0007KW-A5
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 17:53:10 +0000
X-Inumbo-ID: c5bc1fdc-113e-11ea-83b8-bc764e2007e4
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5bc1fdc-113e-11ea-83b8-bc764e2007e4;
 Wed, 27 Nov 2019 17:53:09 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xARHmslC006683;
 Wed, 27 Nov 2019 17:53:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=ELrV2szhV2CxVd7xt8Rnhp2CqGYYiSPEysSs4Nzn/hQ=;
 b=XSJ5KgQcFYY4OE/X+bWjTr5KnrjNpLer0DrMILln5AoemGyREMeyzSOpwqAbfL/t15oM
 q/Z0VawnnfteUY+GsuXXNlEJovQycezFUZk+pRVD25cLMB8tuQP1oOXGVuyPgUobin5l
 l9RNyVI2uxNxgGz/61W7jU/XGlQs90KVpQFB7D132aQP/U8ID4ION2I6+Pn1vht+7eDV
 eQF6qvE8mHkOja7NXoW+zSxdsMO1yox+Ykimup0mHS/QHB9AeErGGavbxfpqr0V5kszd
 l3O1bvXeRWSUGrm3c2MoDn5YNgjXCFscjvJQRy3DLVwVkoptm1QcB26Z8/HLYuLYUxpR yQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2wev6uf5ak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Nov 2019 17:53:07 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xARHmEhP096523;
 Wed, 27 Nov 2019 17:53:06 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2wgwuuxasb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Nov 2019 17:53:06 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xARHr4su023175;
 Wed, 27 Nov 2019 17:53:04 GMT
Received: from [10.211.46.60] (/10.211.46.60)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 27 Nov 2019 09:53:04 -0800
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20191127154817.12103-1-roger.pau@citrix.com>
From: Joe Jin <joe.jin@oracle.com>
Message-ID: <cbf1ecda-c3fc-d73d-f7be-350895d4368b@oracle.com>
Date: Wed, 27 Nov 2019 09:53:01 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191127154817.12103-1-roger.pau@citrix.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9454
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=991
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911270145
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9454
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911270145
Subject: Re: [Xen-devel] [PATCH for-4.13 v4] x86/vmx: always sync PIR to IRR
 before vmentry
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMjcvMTkgNzo0OCBBTSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFdoZW4gdXNpbmcg
cG9zdGVkIGludGVycnVwdHMgb24gSW50ZWwgaGFyZHdhcmUgaXQncyBwb3NzaWJsZSB0aGF0IHRo
ZQo+IHZDUFUgcmVzdW1lcyBleGVjdXRpb24gd2l0aCBhIHN0YWxlIGxvY2FsIEFQSUMgSVJSIHJl
Z2lzdGVyIGJlY2F1c2UKPiBkZXBlbmRpbmcgb24gdGhlIGludGVycnVwdHMgdG8gYmUgaW5qZWN0
ZWQgdmxhcGljX2hhc19wZW5kaW5nX2lycQo+IG1pZ2h0IG5vdCBiZSBjYWxsZWQsIGFuZCB0aHVz
IFBJUiB3b24ndCBiZSBzeW5jZWQgaW50byBJUlIuCj4gCj4gRml4IHRoaXMgYnkgbWFraW5nIHN1
cmUgUElSIGlzIGFsd2F5cyBzeW5jZWQgdG8gSVJSIGluCj4gaHZtX3ZjcHVfaGFzX3BlbmRpbmdf
aXJxIHJlZ2FyZGxlc3Mgb2Ygd2hhdCBpbnRlcnJ1cHRzIGFyZSBwZW5kaW5nLgo+IAo+IFJlcG9y
dGVkLWJ5OiBKb2UgSmluIDxqb2UuamluQG9yYWNsZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gLS0tCj4gQ2M6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KClBhdGNoIHdvcmtzIGZvciBtZS4KVGVzdGVkLWJ5OiBK
b2UgSmluIDxqb2UuamluQG9yYWNsZS5jb20+CgpUaGFua3MsCkpvZQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
