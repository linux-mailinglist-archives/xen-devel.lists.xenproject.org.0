Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB822761B1
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 22:09:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLB3m-00052H-5J; Wed, 23 Sep 2020 20:08:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MdZq=DA=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1kLB3k-00052C-VE
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 20:08:13 +0000
X-Inumbo-ID: 845d645b-95eb-40ea-8262-ad1dd968bf38
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 845d645b-95eb-40ea-8262-ad1dd968bf38;
 Wed, 23 Sep 2020 20:08:12 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08NK5MeX162814;
 Wed, 23 Sep 2020 20:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=+bF0Y3pJwQVU206msgY0xGA4jeQnQf6Jy5Yw7gSqLJg=;
 b=nDpnjPAZ4irr7f9Pomk4/IlIzLCGNqLrYrAIa5nEetyA6SdyH15WtYIkVfA9xZIIjTtU
 xtLKV+oUfhvmO6sdyC0CLq+hweMxtS2sUBdEXV/uleNyVfK2V+MPkuR1o5BkSqAm7+bO
 vVGQfRm5wUoVmBNcYEkKfXYKY5kueUMIwTgB9tBwrjQbID4wPHh6iob5lqmIQ4bqoNEp
 /2h4NQ4dWpWvCre/eTlbpuz12YJq/dkhcXetwbdsqypM48T8ZQMagOfpahQJSxymFNgY
 UcjX1DKPdtrbQASefbu2AOdZqatLKcKtgsjkffmRR97kki18YqXDJZaZvLNIkb9RJeD0 Yg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 33q5rgjxu0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 23 Sep 2020 20:08:05 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08NK67LD055477;
 Wed, 23 Sep 2020 20:08:05 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 33r28w39s2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Sep 2020 20:08:04 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08NK831j014560;
 Wed, 23 Sep 2020 20:08:03 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 23 Sep 2020 13:08:03 -0700
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id C365A6A0109; Wed, 23 Sep 2020 16:09:30 -0400 (EDT)
Date: Wed, 23 Sep 2020 16:09:30 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: SeongJae Park <sjpark@amazon.com>
Cc: roger.pau@citrix.com, SeongJae Park <sjpark@amazon.de>, axboe@kernel.dk,
 aliguori@amazon.com, amit@kernel.org, mheyne@amazon.de,
 linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xen-blkback: add a parameter for disabling of persistent
 grants
Message-ID: <20200923200930.GB11767@char.us.oracle.com>
References: <20200922070125.27251-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922070125.27251-1-sjpark@amazon.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9753
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009230150
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9753
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 impostorscore=0
 clxscore=1011 suspectscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009230150
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Sep 22, 2020 at 09:01:25AM +0200, SeongJae Park wrote:
> From: SeongJae Park <sjpark@amazon.de>
> 
> Persistent grants feature provides high scalability.  On some small
> systems, however, it could incur data copy overhead[1] and thus it is
> required to be disabled.  But, there is no option to disable it.  For
> the reason, this commit adds a module parameter for disabling of the
> feature.

Would it be better suited to have it per guest?
> 
> [1] https://wiki.xen.org/wiki/Xen_4.3_Block_Protocol_Scalability
> 
> Signed-off-by: Anthony Liguori <aliguori@amazon.com>
> Signed-off-by: SeongJae Park <sjpark@amazon.de>
> ---
>  .../ABI/testing/sysfs-driver-xen-blkback        |  8 ++++++++
>  drivers/block/xen-blkback/xenbus.c              | 17 ++++++++++++++---
>  2 files changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-xen-blkback b/Documentation/ABI/testing/sysfs-driver-xen-blkback
> index ecb7942ff146..0c42285c75ee 100644
> --- a/Documentation/ABI/testing/sysfs-driver-xen-blkback
> +++ b/Documentation/ABI/testing/sysfs-driver-xen-blkback
> @@ -35,3 +35,11 @@ Description:
>                  controls the duration in milliseconds that blkback will not
>                  cache any page not backed by a grant mapping.
>                  The default is 10ms.
> +
> +What:           /sys/module/xen_blkback/parameters/feature_persistent
> +Date:           September 2020
> +KernelVersion:  5.10
> +Contact:        SeongJae Park <sjpark@amazon.de>
> +Description:
> +                Whether to enable the persistent grants feature or not.
> +                The default is 1 (enable).
> diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
> index b9aa5d1ac10b..9c03d70469f4 100644
> --- a/drivers/block/xen-blkback/xenbus.c
> +++ b/drivers/block/xen-blkback/xenbus.c
> @@ -879,6 +879,12 @@ static void reclaim_memory(struct xenbus_device *dev)
>  
>  /* ** Connection ** */
>  
> +/* Enable the persistent grants feature. */
> +static unsigned int feature_persistent = 1;
> +module_param_named(feature_persistent, feature_persistent, int, 0644);
> +MODULE_PARM_DESC(feature_persistent,
> +		"Enables the persistent grants feature");
> +
>  /*
>   * Write the physical details regarding the block device to the store, and
>   * switch to Connected state.
> @@ -906,7 +912,8 @@ static void connect(struct backend_info *be)
>  
>  	xen_blkbk_barrier(xbt, be, be->blkif->vbd.flush_support);
>  
> -	err = xenbus_printf(xbt, dev->nodename, "feature-persistent", "%u", 1);
> +	err = xenbus_printf(xbt, dev->nodename, "feature-persistent", "%u",
> +			feature_persistent ? 1 : 0);
>  	if (err) {
>  		xenbus_dev_fatal(dev, err, "writing %s/feature-persistent",
>  				 dev->nodename);
> @@ -1093,8 +1100,12 @@ static int connect_ring(struct backend_info *be)
>  		xenbus_dev_fatal(dev, err, "unknown fe protocol %s", protocol);
>  		return -ENOSYS;
>  	}
> -	pers_grants = xenbus_read_unsigned(dev->otherend, "feature-persistent",
> -					   0);
> +	if (feature_persistent)
> +		pers_grants = xenbus_read_unsigned(dev->otherend,
> +				"feature-persistent", 0);
> +	else
> +		pers_grants = 0;
> +
>  	blkif->vbd.feature_gnt_persistent = pers_grants;
>  	blkif->vbd.overflow_max_grants = 0;
>  
> -- 
> 2.17.1
> 

