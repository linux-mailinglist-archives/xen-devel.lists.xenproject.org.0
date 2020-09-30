Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA34D27EAC6
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 16:19:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756.2527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNcwi-00005n-2V; Wed, 30 Sep 2020 14:19:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756.2527; Wed, 30 Sep 2020 14:19:04 +0000
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
	id 1kNcwh-00005H-VL; Wed, 30 Sep 2020 14:19:03 +0000
Received: by outflank-mailman (input) for mailman id 756;
 Wed, 30 Sep 2020 14:19:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4L7U=DH=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kNcwg-00005C-4W
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 14:19:02 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 596c0b25-d3fb-4c1c-bc4a-45aa48cffdc9;
 Wed, 30 Sep 2020 14:19:01 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08UEDpjk177333;
 Wed, 30 Sep 2020 14:18:34 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 33su5b0u9w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 30 Sep 2020 14:18:34 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08UEBmxA154080;
 Wed, 30 Sep 2020 14:16:33 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 33tfjyrgn4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Sep 2020 14:16:33 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08UEGVjd022466;
 Wed, 30 Sep 2020 14:16:31 GMT
Received: from [10.74.86.12] (/10.74.86.12)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 30 Sep 2020 07:16:31 -0700
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=4L7U=DH=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
	id 1kNcwg-00005C-4W
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 14:19:02 +0000
X-Inumbo-ID: 596c0b25-d3fb-4c1c-bc4a-45aa48cffdc9
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 596c0b25-d3fb-4c1c-bc4a-45aa48cffdc9;
	Wed, 30 Sep 2020 14:19:01 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
	by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08UEDpjk177333;
	Wed, 30 Sep 2020 14:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=ROhrJSPt27ZuEf95a2/EWS5TPJ/S9xyQX7t7cMBghDg=;
 b=FyALsHaDyOG3H3WgXjKFDnkkj7UomwH9gxYTGoso4+41uWXSicDu093xKTKTeZwsWxag
 +AQngnKm0idSDLtvbiIQu7LQX8bNsWyJ6WskdTW7cPZYCb6wm7KeO9r5KBQ3eAUZBEsx
 QcocQHSvEPoyW5huQbhet6UioV+1ambNvKT4+yVSicKYcfk3aAofqdKQgcdAqQwKh3AX
 PI2rT2pBpFhSrqx2QO/HRmCpvQlhRQLcATlT6h2373P7ucfXuBUVKjKKYJ9Can7sZRm0
 eqtsN/b7joglVyFdwOzpczgWxX+hW3mmUAs4pnL8+1wpis4e1QDO0fWoq9sJhKsjG4IN cQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by aserp2130.oracle.com with ESMTP id 33su5b0u9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 30 Sep 2020 14:18:34 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08UEBmxA154080;
	Wed, 30 Sep 2020 14:16:33 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by userp3030.oracle.com with ESMTP id 33tfjyrgn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Sep 2020 14:16:33 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08UEGVjd022466;
	Wed, 30 Sep 2020 14:16:31 GMT
Received: from [10.74.86.12] (/10.74.86.12)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 30 Sep 2020 07:16:31 -0700
Subject: Re: [PATCH] arch/x86: fix some typos in xen_pagetable_p2m_free()
To: Hui Su <sh_def@163.com>, jgross@suse.com, sstabellini@kernel.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        hpa@zytor.com, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org
References: <20200927172836.GA7423@rlk>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <c38469e1-11c2-601b-efe2-9de176ed95dc@oracle.com>
Date: Wed, 30 Sep 2020 10:16:28 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20200927172836.GA7423@rlk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9759 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 mlxscore=0
 phishscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 suspectscore=2
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009300113
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9759 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=2
 lowpriorityscore=0 spamscore=0 clxscore=1011 mlxscore=0 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009300113


On 9/27/20 1:28 PM, Hui Su wrote:
> arch/x86: fix some typos in xen_pagetable_p2m_free():
> s/Fortunatly/Fortunately
>
> Signed-off-by: Hui Su <sh_def@163.com>


Applied to for-linus-5.10 (after rewording slightly the commit message)



-boris


