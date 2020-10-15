Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D6028F30E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 15:17:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7365.19232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT38b-0005tw-Jp; Thu, 15 Oct 2020 13:17:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7365.19232; Thu, 15 Oct 2020 13:17:45 +0000
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
	id 1kT38b-0005tW-FW; Thu, 15 Oct 2020 13:17:45 +0000
Received: by outflank-mailman (input) for mailman id 7365;
 Thu, 15 Oct 2020 13:17:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TbfH=DW=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kT38Z-0005tF-Ot
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 13:17:43 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8bd4586-03c1-4799-ac11-383f007489a2;
 Thu, 15 Oct 2020 13:17:42 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09FDEf3v097962;
 Thu, 15 Oct 2020 13:17:18 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 346g8ghsak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 15 Oct 2020 13:17:18 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09FDEdKd025936;
 Thu, 15 Oct 2020 13:17:17 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 343pw0brsa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Oct 2020 13:17:17 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09FDHEhc024698;
 Thu, 15 Oct 2020 13:17:15 GMT
Received: from [10.39.226.219] (/10.39.226.219)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 15 Oct 2020 06:17:14 -0700
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=TbfH=DW=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
	id 1kT38Z-0005tF-Ot
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 13:17:43 +0000
X-Inumbo-ID: a8bd4586-03c1-4799-ac11-383f007489a2
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a8bd4586-03c1-4799-ac11-383f007489a2;
	Thu, 15 Oct 2020 13:17:42 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
	by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09FDEf3v097962;
	Thu, 15 Oct 2020 13:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=dOOcmqv3ORCOAQisi0SZNKKf+PzDDb3epMdS0uvDdiQ=;
 b=VsOcvhb/uE1AkiuqhIwYpyoaN2Y0JlpwCeSOVkau9AH/4eZFn/KDGFORo2EHy2Ivp+0n
 upg8dsUz8m1RWjevnlwLIFlufFPG82PUcLhzD90Kl3KKa22VgxVcHF/wVJ/WJhTOvSwV
 SDt7rKpbcRth3EkaqnpwJweZcYo3ya1njakx1T8bz5ICbfAlJeFtR4UOJrq9WhKjJh9f
 TN9wOifglj3rLEdZdK1rUeKtTFzErdMlr+8sQDGhvcW189z/Lh+fscQ0NYnwW4Pq/rCx
 dkJfm75foKZUPaY1Wx10v/zryN9SqgraHQqv0Bd9vwDhZPga09HMwhxVtPivsGIzdx73 JQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by aserp2130.oracle.com with ESMTP id 346g8ghsak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Oct 2020 13:17:18 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09FDEdKd025936;
	Thu, 15 Oct 2020 13:17:17 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by userp3030.oracle.com with ESMTP id 343pw0brsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Oct 2020 13:17:17 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09FDHEhc024698;
	Thu, 15 Oct 2020 13:17:15 GMT
Received: from [10.39.226.219] (/10.39.226.219)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Thu, 15 Oct 2020 06:17:14 -0700
Subject: Re: [PATCH 2/2] xen: Kconfig: nest Xen guest options
To: Andrew Cooper <andrew.cooper3@citrix.com>,
        Jason Andryuk <jandryuk@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org
References: <20201014175342.152712-1-jandryuk@gmail.com>
 <20201014175342.152712-3-jandryuk@gmail.com>
 <6cd9363c-ac0c-ea68-c8e7-9fd3cd30a89b@oracle.com>
 <4e31301b-0e57-ac89-cd71-6ad5e1a66628@citrix.com>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <b097aec1-e549-a89a-ce43-e9c0a71179f2@oracle.com>
Date: Thu, 15 Oct 2020 09:17:12 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <4e31301b-0e57-ac89-cd71-6ad5e1a66628@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9774 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010150094
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9774 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010150094


On 10/15/20 9:10 AM, Andrew Cooper wrote:
> On 15/10/2020 13:37, boris.ostrovsky@oracle.com wrote:
>> On 10/14/20 1:53 PM, Jason Andryuk wrote:
>>> +config XEN_512GB
>>> +	bool "Limit Xen pv-domain memory to 512GB"
>>> +	depends on XEN_PV && X86_64
>> Why is X86_64 needed here?
>> 512G support was implemented using a direct-mapped P2M, and is rather
> beyond the virtual address capabilities of 32bit.
>

Yes, my point was that XEN_PV already depends on X86_64.


-boris


