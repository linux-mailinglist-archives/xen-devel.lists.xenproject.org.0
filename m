Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E430918F5EF
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 14:42:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGNIt-0000vB-94; Mon, 23 Mar 2020 13:39:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z9Ug=5I=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1jGNIr-0000uw-Ho
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 13:39:41 +0000
X-Inumbo-ID: bd33cb2b-6d0b-11ea-82d5-12813bfff9fa
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd33cb2b-6d0b-11ea-82d5-12813bfff9fa;
 Mon, 23 Mar 2020 13:39:37 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02NDd3DW046802;
 Mon, 23 Mar 2020 13:39:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=B6xbo+X/W6byPkLPB8gr8u9US63A3zZRiGNQn2Uu/x8=;
 b=J0pPqTUx6IWbzNSK6u5Y4GqggULLph8AOavUaFMxu2gakwglKsBdrBDlwi5PEwoxbTSO
 VYb/n21qrkYKwWB37KpO/3VQ+BhZDJhX+uC96AaPXIXdRS0vSVc/4FqfZ8rsYQlGKwoF
 hn1g/fMWEQ/7so1044GZVT3MNtse4FcGF4Q1atu5PspCvKjaaXWjoNgCA9K/apYhUn7H
 juhle/qUwsfVTMoVHyVXkAgn2hTTeuDC+Sb5BOmalkbm43j/r9Cp3L40LdOkgRM+XjGZ
 A0nAQj6xa1vZsDtsI/9jjSOXseqGFVC13/uRepeVLCht1iTD6qsE0XwtfjVKz96qzsGn tA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 2ywavkxjvy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Mar 2020 13:39:35 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02NDXI7S180921;
 Mon, 23 Mar 2020 13:39:34 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 2yxw6jk9py-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Mar 2020 13:39:34 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02NDdTwK007738;
 Mon, 23 Mar 2020 13:39:29 GMT
Received: from [10.39.222.158] (/10.39.222.158)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 23 Mar 2020 06:39:29 -0700
To: Yan Yankovskyi <yyankovskyi@gmail.com>, Jan Beulich <jbeulich@suse.com>
References: <20200323053325.GA15004@kbp1-lhp-F74019>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <0d9d07e1-a828-28f2-b6ec-9d4d5bdc14be@oracle.com>
Date: Mon, 23 Mar 2020 09:39:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200323053325.GA15004@kbp1-lhp-F74019>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9568
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003230078
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9568
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003230078
Subject: Re: [Xen-devel] [PATCH v3 1/2] xen: Use evtchn_type_t as a type for
 event channels
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDMvMjMvMjAgMTozMyBBTSwgWWFuIFlhbmtvdnNreWkgd3JvdGU6Cj4gTWFrZSBldmVudCBj
aGFubmVsIGZ1bmN0aW9ucyBwYXNzIGV2ZW50IGNoYW5uZWwgcG9ydCB1c2luZwo+IGV2dGNobl9w
b3J0X3QgdHlwZS4gSXQgZWxpbWluYXRlcyBzaWduZWQgPC0+IHVuc2lnbmVkIGNvbnZlcnNpb24u
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBZYW4gWWFua292c2t5aSA8eXlhbmtvdnNreWlAZ21haWwuY29t
PgoKClJldmlld2VkLWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUu
Y29tPgoKCgo+ICAKPiBAQCAtMTI3NSw3ICsxMjc2LDcgQEAgdm9pZCByZWJpbmRfZXZ0Y2huX2ly
cShpbnQgZXZ0Y2huLCBpbnQgaXJxKQo+ICAKPiAgCW11dGV4X3VubG9jaygmaXJxX21hcHBpbmdf
dXBkYXRlX2xvY2spOwo+ICAKPiAtICAgICAgICBiaW5kX2V2dGNobl90b19jcHUoZXZ0Y2huLCBp
bmZvLT5jcHUpOwo+ICsJYmluZF9ldnRjaG5fdG9fY3B1KGV2dGNobiwgaW5mby0+Y3B1KTsKCgpJ
J2QgbGVhdmUgdGhpcyBhcyBpcy4KCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
