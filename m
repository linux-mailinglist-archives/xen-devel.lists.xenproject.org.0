Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2ED727EAB6
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 16:13:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744.2501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNcr8-0008Bw-VT; Wed, 30 Sep 2020 14:13:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744.2501; Wed, 30 Sep 2020 14:13:18 +0000
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
	id 1kNcr8-0008BX-SM; Wed, 30 Sep 2020 14:13:18 +0000
Received: by outflank-mailman (input) for mailman id 744;
 Wed, 30 Sep 2020 14:13:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4L7U=DH=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kNcr6-0008Ao-OE
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 14:13:16 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6dc593b-7e56-4bf1-8b2b-dd3746006640;
 Wed, 30 Sep 2020 14:13:15 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08UE3pWr152280;
 Wed, 30 Sep 2020 14:13:01 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 33su5b0tcj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 30 Sep 2020 14:13:01 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08UEAuc6120305;
 Wed, 30 Sep 2020 14:13:00 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 33uv2fe7pp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Sep 2020 14:13:00 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08UECwlq023022;
 Wed, 30 Sep 2020 14:12:59 GMT
Received: from [10.74.86.12] (/10.74.86.12)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 30 Sep 2020 07:12:58 -0700
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=4L7U=DH=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
	id 1kNcr6-0008Ao-OE
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 14:13:16 +0000
X-Inumbo-ID: f6dc593b-7e56-4bf1-8b2b-dd3746006640
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f6dc593b-7e56-4bf1-8b2b-dd3746006640;
	Wed, 30 Sep 2020 14:13:15 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
	by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08UE3pWr152280;
	Wed, 30 Sep 2020 14:13:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=U/RoOYQ4A4TqJFSLqRj2gU8U+HDYbbjA5tSPrITjo2w=;
 b=pd+f1r6ljAVpW4XX8XAk2WCmCz/PDmzXqqGHiA1BN4LGQ11n2MOtkVB9Vk4qTy8rbY6A
 kRzKSDfd/KQjcxKZtLoXzmkqMkK5vw/R7KY4jipGkWoP2c8DbfInFlo3NT/ic5i5R2qR
 CCWTurP812znbdfzn1i5nPu7Gojc8g17J0NWmAL1GDJS/jpbmJ3in80HIODFtsUhkc9q
 4o5XYUtaBtm+HhBRkzwZdXviD5SmTvkpmyAt3uKYfOGZNiqNqzjf6Ab+ZhcCOS8qwDJq
 vmFG5ypOVJcDK/MpLVQNkKsWqAFIic6PztWh3EgNFqqXqE0EdY+66TgCwM9JDHRtDgiS 1Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by aserp2130.oracle.com with ESMTP id 33su5b0tcj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 30 Sep 2020 14:13:01 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08UEAuc6120305;
	Wed, 30 Sep 2020 14:13:00 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by aserp3030.oracle.com with ESMTP id 33uv2fe7pp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Sep 2020 14:13:00 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08UECwlq023022;
	Wed, 30 Sep 2020 14:12:59 GMT
Received: from [10.74.86.12] (/10.74.86.12)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 30 Sep 2020 07:12:58 -0700
Subject: Re: [PATCH] xen: remove redundant initialization of variable ret
To: Jing Xiangfeng <jingxiangfeng@huawei.com>, jgross@suse.com,
        sstabellini@kernel.org
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20200919031702.32192-1-jingxiangfeng@huawei.com>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <73499fa3-fe37-46b8-0276-7e4f42a98f40@oracle.com>
Date: Wed, 30 Sep 2020 10:12:56 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20200919031702.32192-1-jingxiangfeng@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9759 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=2 malwarescore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009300113
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9759 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=2
 lowpriorityscore=0 spamscore=0 clxscore=1011 mlxscore=0 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009300112


On 9/18/20 11:17 PM, Jing Xiangfeng wrote:
> After commit 9f51c05dc41a ("pvcalls-front: Avoid
> get_free_pages(GFP_KERNEL) under spinlock"), the variable ret is being
> initialized with '-ENOMEM' that is meaningless. So remove it.
>
> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>


Applied to for-linus-5.10



-boris


