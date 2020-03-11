Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 535F5180E26
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 03:45:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBrKN-0000qg-Gx; Wed, 11 Mar 2020 02:42:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CYKW=44=oracle.com=martin.petersen@srs-us1.protection.inumbo.net>)
 id 1jBrKL-0000qb-RI
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 02:42:33 +0000
X-Inumbo-ID: f486df14-6341-11ea-aeb6-12813bfff9fa
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f486df14-6341-11ea-aeb6-12813bfff9fa;
 Wed, 11 Mar 2020 02:42:32 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02B2gPGM098802;
 Wed, 11 Mar 2020 02:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2020-01-29;
 bh=KfOy4Bpiplasnl/ncLcT96S4AGSmRKSa2SGlhHhNj7c=;
 b=Gfm9v9XcT6XQ+dTH+zLoCwiHouQb3XBcrrPjnFoVSULeMvPSTMRT1AYsdS+YZ/h3e+kK
 4LNGmyUcyHVkh6jH/c00tkOF/3GQZoqbPtYA9xyZ0kk+9/uynbRkFq048YYs1v6zp4Zo
 gxGCrvRgFEyVdsrOwOOqZtjVemeQjSMQoFFQbYD9Fd35xBUFK0CCaSdCmrcXf9Qw+7wj
 ZSq2gsUJfmR3KAUOWCRSA+8OJ99ICISH7J7Dej+rFw1v0UebuiUG/XEBfkkAmf9KIrsx
 CGHydj5mEdJ0zddeM4eAfSZduPG7zVsnIu7uMVCEiXH2n2kBXNidp0HUaJJgxcFeLscF Sw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2yp9v641k0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Mar 2020 02:42:24 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02B2g9Bi007440;
 Wed, 11 Mar 2020 02:42:24 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2yp8pvmbc7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Mar 2020 02:42:24 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 02B2gLke024249;
 Wed, 11 Mar 2020 02:42:21 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 10 Mar 2020 19:42:20 -0700
To: Matteo Croce <mcroce@redhat.com>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20200311002254.121365-1-mcroce@redhat.com>
Date: Tue, 10 Mar 2020 22:42:17 -0400
In-Reply-To: <20200311002254.121365-1-mcroce@redhat.com> (Matteo Croce's
 message of "Wed, 11 Mar 2020 01:22:54 +0100")
Message-ID: <yq1k13rr4s6.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9556
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003110015
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9556
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003110015
Subject: Re: [Xen-devel] [PATCH v3] block: refactor duplicated macros
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Guoqing Jiang <guoqing.jiang@cloud.ionos.com>, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, linux-bcache@vger.kernel.org,
 xen-devel@lists.xenproject.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Anna Schumaker <anna.schumaker@netapp.com>,
 Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck1hdHRlbywKCj4gVGhlIG1hY3JvcyBQQUdFX1NFQ1RPUlMsIFBBR0VfU0VDVE9SU19TSElGVCBh
bmQgU0VDVE9SX01BU0sgYXJlCj4gZGVmaW5lZCBzZXZlcmFsIHRpbWVzIGluIGRpZmZlcmVudCBm
bGF2b3VycyBhY3Jvc3MgdGhlIHdob2xlIHRyZWUuCj4gRGVmaW5lIHRoZW0ganVzdCBvbmNlIGlu
IGEgY29tbW9uIGhlYWRlci4KPgo+IFdoaWxlIGF0IGl0LCByZXBsYWNlIHJlcGxhY2UgIlBBR0Vf
U0hJRlQgLSA5IiB3aXRoCj4gIlBBR0VfU0VDVE9SU19TSElGVCIgdG9vIGFuZCByZW5hbWUgU0VD
VE9SX01BU0sgdG8gUEFHRV9TRUNUT1JTX01BU0suCgpMb29rcyBPSyB0byBtZS4KClJldmlld2Vk
LWJ5OiBNYXJ0aW4gSy4gUGV0ZXJzZW4gPG1hcnRpbi5wZXRlcnNlbkBvcmFjbGUuY29tPgoKLS0g
Ck1hcnRpbiBLLiBQZXRlcnNlbglPcmFjbGUgTGludXggRW5naW5lZXJpbmcKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
