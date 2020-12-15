Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E44E12DB483
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 20:36:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54794.95386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpG7B-0002eY-Lv; Tue, 15 Dec 2020 19:36:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54794.95386; Tue, 15 Dec 2020 19:36:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpG7B-0002e6-Hq; Tue, 15 Dec 2020 19:36:05 +0000
Received: by outflank-mailman (input) for mailman id 54794;
 Tue, 15 Dec 2020 19:36:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qx/l=FT=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kpG79-0002dt-Nv
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 19:36:03 +0000
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 51b1f04b-56e2-42a6-8ef0-da9e77fdff67;
 Tue, 15 Dec 2020 19:36:03 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BFJXqZR156836;
 Tue, 15 Dec 2020 19:35:58 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 35cntm4dwn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Dec 2020 19:35:58 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BFJZ9UW009806;
 Tue, 15 Dec 2020 19:35:58 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 35e6jrmaqq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Dec 2020 19:35:57 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BFJZv03011217;
 Tue, 15 Dec 2020 19:35:57 GMT
Received: from [10.39.237.186] (/10.39.237.186)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 15 Dec 2020 11:35:56 -0800
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
X-Inumbo-ID: 51b1f04b-56e2-42a6-8ef0-da9e77fdff67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=s0Cs1JEkSZnaprExuXHSIt4siSUpbCCqvHiWI9iK+Dc=;
 b=Ro0VZ1qVg2R7st409/BXYUjldRN15ppn5/7vDVpnV4wjD6w0NRhRg0F3GxDfUffJdrcj
 J/Sn0PRL/olk8HDRkDJses0JNQLQPMRmzEx6U5SVqz7G/HMIRhNbP6tV5eZbaIdNL8KL
 OSHjhYovQUtqDjo4Mjd7kw+2HNP4kOdZDoTVhGrNuBiPM3gr6YAjkgy/PKM+QvNXkJ9z
 ynGyBfTY56XK5Gf/ocSXBrOOfi1RUrToOBmJ+angZ7hhisKhy8gC6pErPGa9frP2FIA+
 MSzvk6Q6HhKO++64dLImSbUWzf0qet0e5d1UXVlwwMM7SbrJu1clVyWUaq5OESlfWV1m AQ== 
Subject: Re: [PATCH v2] xen/xenbus: make xs_talkv() interruptible
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>
References: <20201215111055.3810-1-jgross@suse.com>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <bd15d0d7-e4d9-74e8-31d5-131434af7f1e@oracle.com>
Date: Tue, 15 Dec 2020 14:35:55 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201215111055.3810-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9836 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012150130
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9836 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012150130


On 12/15/20 6:10 AM, Juergen Gross wrote:
> In case a process waits for any Xenstore action in the xenbus driver
> it should be interruptible by signals.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - don't special case SIGKILL as libxenstore is handling -EINTR fine


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com




