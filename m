Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 041ED18CEAD
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 14:20:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFHWs-00017g-2n; Fri, 20 Mar 2020 13:17:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=c5od=5F=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1jFHWq-00017T-Ne
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 13:17:36 +0000
X-Inumbo-ID: 2a2a4e90-6aad-11ea-bd58-12813bfff9fa
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a2a4e90-6aad-11ea-bd58-12813bfff9fa;
 Fri, 20 Mar 2020 13:17:36 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02KDCx70053685;
 Fri, 20 Mar 2020 13:17:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=Ca0hhfBrNJRfEHmVEAesPO0pLfWlBN93+jbMeyIxlq4=;
 b=qaKSz/Uq3skWoC5I5YMTYvFjQWSSoSsGQvPsBrH+Cikd5o4hPZdXqrjFOAO/TfVd3lY/
 sRRsboP9MvJ+bY2a6jztntwMgIe0qmNyr3gSoMRr7ZWY3D/V/bLMgdvgoABDvbqT4t0H
 xE2Y90EgZFILlctEwHm31bxzIwMwAHJGUSoJA585u1hY6K9NBMvFu8iiNgYoj2JrWibO
 +XPl7V2jABqEsCNz8wCHCN5+wFIMCH5ITd33IrfVxwsKaLFZ0RF8/reTqKRsPPsQjQ/u
 R6cuOxr0sVFveBq2BTrpxC1NUgpfYTvX+CkAHixLFEmRD00+7XKMslFuZ9LTmnKxMQGq iA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 2yrq7mdh11-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Mar 2020 13:17:31 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02KDCdfQ057200;
 Fri, 20 Mar 2020 13:17:30 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2ys906s8xn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Mar 2020 13:17:30 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 02KDHSh5006058;
 Fri, 20 Mar 2020 13:17:29 GMT
Received: from [10.39.249.71] (/10.39.249.71)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 20 Mar 2020 06:17:28 -0700
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20200320030929.24735-1-marmarek@invisiblethingslab.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <46cf0d25-11bc-e580-fe30-9898551c28e2@oracle.com>
Date: Thu, 19 Mar 2020 21:21:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200320030929.24735-1-marmarek@invisiblethingslab.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9565
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=802 mlxscore=0
 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003200057
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9565
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 mlxlogscore=858 priorityscore=1501 clxscore=1015
 malwarescore=0 mlxscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003200057
Subject: Re: [Xen-devel] [PATCH v2] xen-pciback: fix INTERRUPT_TYPE_* defines
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
 Simon Gaiser <simon@invisiblethingslab.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDMvMTkvMjAgMTE6MDkgUE0sIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToK
PiB4ZW5fcGNpYmtfZ2V0X2ludGVycnVwdF90eXBlKCkgYXNzdW1lcyBJTlRFUlJVUFRfVFlQRV9O
T05FIGJlaW5nIDAKPiAoaW5pdGlhbGl6ZSByZXQgdG8gMCBhbmQgcmV0dXJuIGFzIElOVEVSUlVQ
VF9UWVBFX05PTkUpLgo+IEZpeCB0aGUgZGVmaW5pdGlvbiB0byBtYWtlIElOVEVSUlVQVF9UWVBF
X05PTkUgcmVhbGx5IDAsIGFuZCBhbHNvIHNoaWZ0Cj4gb3RoZXIgdmFsdWVzIHRvIG5vdCBsZWF2
ZSBob2xlcy4KPiBCdXQgYWxzbywgZG8gbm90IGFzc3VtZSBJTlRFUlJVUFRfVFlQRV9OT05FIGJl
aW5nIDAgYW55bW9yZSB0byBhdm9pZAo+IHNpbWlsYXIgY29uZnVzaW9ucyBpbiB0aGUgZnV0dXJl
Lgo+Cj4gRml4ZXM6IDQ3Njg3OGU0YjJiZSAoInhlbi1wY2liYWNrOiBvcHRpb25hbGx5IGFsbG93
IGludGVycnVwdCBlbmFibGUgZmxhZyB3cml0ZXMiKQo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIE1h
cmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KCgpS
ZXZpZXdlZC1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
