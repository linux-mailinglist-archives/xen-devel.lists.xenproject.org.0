Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB18019E08F
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 23:54:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKUFq-0002QL-Dp; Fri, 03 Apr 2020 21:53:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DuFS=5T=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1jKUFo-0002QG-VJ
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 21:53:33 +0000
X-Inumbo-ID: 8f09b4e2-75f5-11ea-b58d-bc764e2007e4
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f09b4e2-75f5-11ea-b58d-bc764e2007e4;
 Fri, 03 Apr 2020 21:53:32 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 033LrQuB096116;
 Fri, 3 Apr 2020 21:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=ZmykI1jF/AuRxj1O+Z6blTUcn3zOPYoue5aVA5PrXXE=;
 b=j0Lbeu3CDslkmu4HCqlTJOy1hgXQsrQiAYqWZkENnEDPSZF1rvOW/jJGbxyw6xoEG1wG
 VqolF1XVb/NXWDrW3CctpSZUzeUA8H4WGYXRHbysFxXvrEbzxP7P1af3HOn9MTlcAUwN
 pE/HWWhTavvkI/c6ftbi+vPH6SiSQ7hD4/It5x2BWEF4T0GUvgbUKWz13WqI+Ov3523A
 xwAGFqig7rr3XM0IYC9vFaH+xM8kzJeit4lE0LCmpBHkbOoPF65ebxzLQoO31cut47Qn
 eXhi7246mItUtTIqzptZ/IHlbxgdPftC5nA/6Gdy2/kI227DHTY72KWHjKGljY0ZoqeD cQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 303aqj3u9d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 Apr 2020 21:53:28 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 033LqSjn017230;
 Fri, 3 Apr 2020 21:53:27 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 302g4y8mtb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 Apr 2020 21:53:27 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 033LrPUC020496;
 Fri, 3 Apr 2020 21:53:25 GMT
Received: from [10.39.222.119] (/10.39.222.119)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 03 Apr 2020 14:53:25 -0700
Subject: Re: [PATCH] xen/blkfront: fix memory allocation flags in
 blkfront_setup_indirect()
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200403090034.8753-1-jgross@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <1d67be51-776d-dd53-c5db-8b3539505f40@oracle.com>
Date: Fri, 3 Apr 2020 17:53:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200403090034.8753-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9580
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004030169
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9580
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 clxscore=1011
 malwarescore=0 impostorscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004030169
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
Cc: Jens Axboe <axboe@kernel.dk>, Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 stable@vger.kernel.org, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 4/3/20 5:00 AM, Juergen Gross wrote:
> Commit 1d5c76e664333 ("xen-blkfront: switch kcalloc to kvcalloc for
> large array allocation") didn't fix the issue it was meant to, as the
> flags for allocating the memory are GFP_NOIO, which will lead the
> memory allocation falling back to kmalloc().
>
> So instead of GFP_NOIO use GFP_KERNEL and do all the memory allocation
> in blkfront_setup_indirect() in a memalloc_noio_{save,restore} section.=

>
> Fixes: 1d5c76e664333 ("xen-blkfront: switch kcalloc to kvcalloc for lar=
ge array allocation")
> Cc: stable@vger.kernel.org
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>



