Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3381900C4
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 22:59:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGV30-0002S6-47; Mon, 23 Mar 2020 21:55:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z9Ug=5I=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1jGV2z-0002S1-6Q
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 21:55:49 +0000
X-Inumbo-ID: 0d61df98-6d51-11ea-833b-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0d61df98-6d51-11ea-833b-12813bfff9fa;
 Mon, 23 Mar 2020 21:55:47 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02NLsiWh140449;
 Mon, 23 Mar 2020 21:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=YvIAy0wzv2+tc9aPVF5RtWgeBJRlBEGtNVz2L2/Z/U8=;
 b=l7OF3bT9wxBgDsTgSEekeq4UQlQDi7thEafWDog7Xg9UJ3oVb7I7Ib4bQY6hKtYd2jPT
 Qkq6aUIOZghWwTx/iJxA2fKIk1W9aNAMETSQeyJ8H/o3Fb7WYIXf7TWN4T4r27RqZM9L
 XeEm7hJTbuSkRvvXLQPZQFAjqFj4+CqgMWJTrvGSKl/bDMUuDON7FGlInCthfuiXXUQl
 B3Dd19mLelId9CiKRdOpiU/dmLvos34llylNSi0zkYW1cS8rpbm5YIhGT6eBfj24HMAd
 P10t8KGTYxdbzY6+vkVoOE39+L601LkkpDAqSrnnHoWhUdOklq7VxIhKBBf56dvUevsC Mg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2yx8abx414-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Mar 2020 21:55:44 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02NLpo5a182537;
 Mon, 23 Mar 2020 21:55:44 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2yxw91gjpy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Mar 2020 21:55:43 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02NLtgBB017985;
 Mon, 23 Mar 2020 21:55:42 GMT
Received: from [10.39.222.158] (/10.39.222.158)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 23 Mar 2020 14:55:42 -0700
To: Yan Yankovskyi <yyankovskyi@gmail.com>, Jan Beulich <jbeulich@suse.com>
References: <20200323152343.GA28422@kbp1-lhp-F74019>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <06458b85-fb66-faac-e75a-1ccefa848cb0@oracle.com>
Date: Mon, 23 Mar 2020 17:55:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200323152343.GA28422@kbp1-lhp-F74019>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9569
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 bulkscore=0
 adultscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003230108
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9569
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 clxscore=1015
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 mlxscore=0 adultscore=0 phishscore=0 impostorscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003230108
Subject: Re: [Xen-devel] [PATCH v4 1/2] xen: Use evtchn_type_t as a type for
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 3/23/20 12:15 PM, Yan Yankovskyi wrote:
> Make event channel functions pass event channel port using
> evtchn_port_t type. It eliminates signed <-> unsigned conversion.
>
> Signed-off-by: Yan Yankovskyi <yyankovskyi@gmail.com>


If the difference is only the whitespace fix then

Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>

and I am sorry, I should have explicitly said that you don't need to resend.



