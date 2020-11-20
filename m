Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2267F2BB86E
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 22:39:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32683.63792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgE75-0002dq-NB; Fri, 20 Nov 2020 21:38:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32683.63792; Fri, 20 Nov 2020 21:38:39 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgE75-0002dR-Jv; Fri, 20 Nov 2020 21:38:39 +0000
Received: by outflank-mailman (input) for mailman id 32683;
 Fri, 20 Nov 2020 21:38:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mmwl=E2=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kgE73-0002dM-Km
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 21:38:37 +0000
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c962f002-2e17-4381-8882-e2b39e7b6164;
 Fri, 20 Nov 2020 21:38:36 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AKLc9ED004163;
 Fri, 20 Nov 2020 21:38:31 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 34t76mcr2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 20 Nov 2020 21:38:31 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AKLVUlF003267;
 Fri, 20 Nov 2020 21:36:31 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 34umd3yqg2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Nov 2020 21:36:31 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0AKLaREe006534;
 Fri, 20 Nov 2020 21:36:28 GMT
Received: from [10.74.102.87] (/10.74.102.87)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 20 Nov 2020 13:36:27 -0800
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Mmwl=E2=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
	id 1kgE73-0002dM-Km
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 21:38:37 +0000
X-Inumbo-ID: c962f002-2e17-4381-8882-e2b39e7b6164
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c962f002-2e17-4381-8882-e2b39e7b6164;
	Fri, 20 Nov 2020 21:38:36 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AKLc9ED004163;
	Fri, 20 Nov 2020 21:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=vdgWyMqTZ/KgANno+C5rCsxsLffEg7/4wEFhdg4BzwI=;
 b=hjCAAPiQuGKgg9PQlmF2CEhfXgsK4V3IL0TBllq3pwdLW2cAsCBNqTQ4ThGfPvnQoh9+
 V7EbbfgvR6mElEDy6mt+/BayXJ+D9umRbQoMUux/U76sqn2bBS0eFkGWVhKyhmvo+iOW
 pOZGAsOecys9/DjyqOootIsFGCbj54uTsMShNy2TgH7R72HHP4isQNzlEyT35/1CmhDI
 JCsQZTzIA37BdmeXrTiRI13i2DeCcMcrOP56wP6TIXdMpjjWdE4ef5e6oK3KN5BTnDFc
 Ak9rAB4fR9ngZI1whbbshi5ybA/yEtPOObnfChfOccclqBnRcR5YseEhI/aYwHBhJ2g3 3Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by aserp2120.oracle.com with ESMTP id 34t76mcr2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 Nov 2020 21:38:31 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AKLVUlF003267;
	Fri, 20 Nov 2020 21:36:31 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by aserp3020.oracle.com with ESMTP id 34umd3yqg2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Nov 2020 21:36:31 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0AKLaREe006534;
	Fri, 20 Nov 2020 21:36:28 GMT
Received: from [10.74.102.87] (/10.74.102.87)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Fri, 20 Nov 2020 13:36:27 -0800
Subject: Re: [PATCH 058/141] xen-blkfront: Fix fall-through warnings for Clang
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini
 <sstabellini@kernel.org>,
        Jens Axboe <axboe@kernel.dk>
Cc: xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <cover.1605896059.git.gustavoars@kernel.org>
 <33057688012c34dd60315ad765ff63f070e98c0c.1605896059.git.gustavoars@kernel.org>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <e8d67ea1-3d0d-509a-a2f1-cf1758bb373f@oracle.com>
Date: Fri, 20 Nov 2020 16:36:26 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <33057688012c34dd60315ad765ff63f070e98c0c.1605896059.git.gustavoars@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9811 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 phishscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011200143
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9811 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1011 mlxlogscore=999
 malwarescore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011200143


On 11/20/20 1:32 PM, Gustavo A. R. Silva wrote:
> In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
> by explicitly adding a break statement instead of letting the code fall
> through to the next case.
>
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/block/xen-blkfront.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
> index 48629d3433b4..34b028be78ab 100644
> --- a/drivers/block/xen-blkfront.c
> +++ b/drivers/block/xen-blkfront.c
> @@ -2462,6 +2462,7 @@ static void blkback_changed(struct xenbus_device *dev,
>  			break;
>  		if (talk_to_blkback(dev, info))
>  			break;
> +		break;
>  	case XenbusStateInitialising:
>  	case XenbusStateInitialised:
>  	case XenbusStateReconfiguring:


Reviewed-by Boris Ostrovsky <boris.ostrovsky@oracle.com>


(for patch 138 as well)


Although I thought using 'fallthrough' attribute was the more common approach.


-boris


