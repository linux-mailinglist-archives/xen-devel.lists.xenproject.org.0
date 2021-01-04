Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFFD2E9DF3
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 20:07:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61490.108274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwVBj-00055K-ES; Mon, 04 Jan 2021 19:06:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61490.108274; Mon, 04 Jan 2021 19:06:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwVBj-00054v-BV; Mon, 04 Jan 2021 19:06:43 +0000
Received: by outflank-mailman (input) for mailman id 61490;
 Mon, 04 Jan 2021 19:06:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yCAg=GH=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kwVBh-00054q-VU
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 19:06:42 +0000
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38f065b5-c631-4b68-9bb0-f59ed3222108;
 Mon, 04 Jan 2021 19:06:40 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 104Ij2hG123656;
 Mon, 4 Jan 2021 19:06:35 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 35tgsknrnb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 04 Jan 2021 19:06:35 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 104IjIBI090315;
 Mon, 4 Jan 2021 19:06:34 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 35v2axk7vb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Jan 2021 19:06:34 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 104J6Woo014790;
 Mon, 4 Jan 2021 19:06:32 GMT
Received: from [10.39.231.107] (/10.39.231.107)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 04 Jan 2021 11:06:32 -0800
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
X-Inumbo-ID: 38f065b5-c631-4b68-9bb0-f59ed3222108
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=3pT4+CY1Dh0s2VEu43pfDDziCYSS+IiUVXWJ0Y/C9cE=;
 b=Nw6McFHNuQNnzG4E8+w3f+E8AJ78QO4SMvmAKKYVTmrel2jQV16MQqD3muE7ynMkJ/oQ
 nldFXFtYqU/w+IR6Js6n9IubjeXF07uLM/VONF9ps5/6PrioQ5Ht3p/iqvYWaKWxjHfg
 kq27LnI5+JMAixztWiSy1iDmTPqNgGeWfIa9q3cDpIPFaTyyY5QysGKu7BqVGYT9yGAp
 Qz1dJTzwBn69fJ6HS5h7bo3Hr6qsBuvL6hnxUhRl2E8eMC8u1SLiCchDgLtBQCUSNyNY
 HXf44x0UEUtHl32ZrOWfFtAHaRBZW3EDn4rI+Llmt9MuF4a6SQal3FvQw86BGotcdZdG 7w== 
Subject: Re: [PATCH 5/5] x86/xen: Don't register PV spinlock IPI when it isn't
 going to be used
To: David Woodhouse <dwmw2@infradead.org>, x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Juergen Gross <jgross@suse.com>, Paul Durrant <pdurrant@amazon.com>,
        jgrall@amazon.com, karahmed@amazon.de,
        xen-devel <xen-devel@lists.xenproject.org>
References: <20201224115323.3540130-1-dwmw2@infradead.org>
 <20201224115323.3540130-6-dwmw2@infradead.org>
 <b6681a06-4c00-61a9-2112-63ee3eb8d86d@oracle.com>
 <eb7378cdbbdbff2548d510c453ede8baa917647f.camel@infradead.org>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <f681dfe6-d0fb-e451-a58f-ad5cafa1cd62@oracle.com>
Date: Mon, 4 Jan 2021 14:06:30 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <eb7378cdbbdbff2548d510c453ede8baa917647f.camel@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9854 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101040120
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9854 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101040120


On 1/4/21 12:32 PM, David Woodhouse wrote:
> On Mon, 2021-01-04 at 12:06 -0500, boris.ostrovsky@oracle.com wrote:
>>> @@ -115,7 +115,7 @@ PV_CALLEE_SAVE_REGS_THUNK(xen_vcpu_stolen);
>>>   void __init xen_init_spinlocks(void)
>>>   {
>>>        /*  Don't need to use pvqspinlock code if there is only 1 vCPU. */
>>> -     if (num_possible_cpus() == 1 || nopvspin)
>>> +     if (num_possible_cpus() == 1 || nopvspin || !xen_have_vector_callback)
>>
>> xen_init_spinlock() will not be called without vector callbacks so
>> this test is not really necessary.
> Right, that's just paranoia to make the conditions consistent and safe.


OK, but we still need to do something about virt_spin_lock_key.


-boris


