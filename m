Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F14266167
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 16:43:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGkGT-0002fD-IK; Fri, 11 Sep 2020 14:43:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dCNT=CU=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kGkGS-0002f8-DP
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 14:43:00 +0000
X-Inumbo-ID: e15bb2b6-0527-4a61-9d07-3547a2457210
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e15bb2b6-0527-4a61-9d07-3547a2457210;
 Fri, 11 Sep 2020 14:42:59 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08BEcvnK173439;
 Fri, 11 Sep 2020 14:42:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=fH2VWtYI2GLBtZfBxWlfRQb2fBKiGWhmGFozJ1Mo+qk=;
 b=oJcQNXZ4VbshYtUu4OuRRAwJvqdI3lP364vqlkVnWfYwzR2vFRBwj7A9i+cGR8at4uk2
 HuETbYyeGa6lu4r5NPzwKmJGsbfov8lKRMs5YTCsii1z0Heh0dmMs9SfwXnDVG/z52JX
 /LwaZcYiOjFSL3WDVGmTysgjKd63U6hy7DuwI1VBIGxfbODwyftgaMJlT48oMKxpjGjF
 L1lCYdb9I4OjnafP1Ob3EtGc383KCmq9hwzMN3Ao+P+te0UVsoDJawouO34FyuMSMssm
 +2j+5soHrRKu40I57kRcIv2F2zxXQnE9iL0yiwzXIzSSTMHn6mxgl7NOmPgFIUTnlO1S cg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 33c2mmejuq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 11 Sep 2020 14:42:56 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08BEZaXK173252;
 Fri, 11 Sep 2020 14:42:56 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 33cmexa6tt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Sep 2020 14:42:56 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08BEgsu4019337;
 Fri, 11 Sep 2020 14:42:55 GMT
Received: from [10.74.86.16] (/10.74.86.16)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 11 Sep 2020 07:42:53 -0700
Subject: Re: [PATCH 2/2] xen/gntdev.c: Convert get_user_pages*() to
 pin_user_pages*()
To: Souptick Joarder <jrdr.linux@gmail.com>, jgross@suse.com,
 sstabellini@kernel.org
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>
References: <1599375114-32360-1-git-send-email-jrdr.linux@gmail.com>
 <1599375114-32360-2-git-send-email-jrdr.linux@gmail.com>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <8a608871-af25-fee6-24ea-24d78010cd6c@oracle.com>
Date: Fri, 11 Sep 2020 10:42:51 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <1599375114-32360-2-git-send-email-jrdr.linux@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9740
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009110120
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9740
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009110120
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


On 9/6/20 2:51 AM, Souptick Joarder wrote:
> In 2019, we introduced pin_user_pages*() and now we are converting
> get_user_pages*() to the new API as appropriate. [1] & [2] could
> be referred for more information. This is case 5 as per document [1].
>
> [1] Documentation/core-api/pin_user_pages.rst
>
> [2] "Explicit pinning of user-space pages":
>         https://lwn.net/Articles/807108/
>
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: David Vrabel <david.vrabel@citrix.com>


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>



