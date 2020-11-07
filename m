Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0852AA1E1
	for <lists+xen-devel@lfdr.de>; Sat,  7 Nov 2020 01:44:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.21215.47519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kbCLQ-0004Sb-Ge; Sat, 07 Nov 2020 00:44:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 21215.47519; Sat, 07 Nov 2020 00:44:40 +0000
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
	id 1kbCLQ-0004SC-Dg; Sat, 07 Nov 2020 00:44:40 +0000
Received: by outflank-mailman (input) for mailman id 21215;
 Sat, 07 Nov 2020 00:44:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Tei=EN=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kbCLO-0004S7-Na
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2020 00:44:38 +0000
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dfb0ef61-8e95-4c51-95c0-ffd4d2eb40f0;
 Sat, 07 Nov 2020 00:44:36 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A70Z841013792;
 Sat, 7 Nov 2020 00:44:26 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 34hhw33m6q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 07 Nov 2020 00:44:26 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A70Ue9H195816;
 Sat, 7 Nov 2020 00:44:26 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 34hw0qdmy7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 07 Nov 2020 00:44:25 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0A70iI4U024046;
 Sat, 7 Nov 2020 00:44:18 GMT
Received: from [10.74.103.192] (/10.74.103.192)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 06 Nov 2020 16:44:17 -0800
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1Tei=EN=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
	id 1kbCLO-0004S7-Na
	for xen-devel@lists.xenproject.org; Sat, 07 Nov 2020 00:44:38 +0000
X-Inumbo-ID: dfb0ef61-8e95-4c51-95c0-ffd4d2eb40f0
Received: from userp2120.oracle.com (unknown [156.151.31.85])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id dfb0ef61-8e95-4c51-95c0-ffd4d2eb40f0;
	Sat, 07 Nov 2020 00:44:36 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A70Z841013792;
	Sat, 7 Nov 2020 00:44:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=icpgsybhv1Wj9WQrwswn7c2yra/D3Oe807HPp2ql6Mg=;
 b=GWCllC2zxHNdUwiSF3B4GYyw35a2Jn12rbwdWrB//bEwuYB6tvxLU6MVxV+QVGTJhDR9
 xawOpIIOTzW7rt72RzDXGbaKB0GhTSLzmU/DvF1Kp3WC+ed78ajOEgyEgfeGTjxDPSDo
 27Z+IQRc4aABbQPtaCZtNa0yFqqFKUzFniq/cX8nN+ZUVI9W3ByqzDL/UyJbQtHZNHvk
 ywoYkx7OxNUyVDYhzSrDTL5UfNXWrmBplc/Z/12E/V7uOh1mu+i2x7NJMnHdUNnkQN5a
 jBMar3BdwyrlHkNBqq3770xjUiRIhUv08oJ5jqiZrtTFLekf/+hCiX6Lfsvsa2QZjnWV fA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by userp2120.oracle.com with ESMTP id 34hhw33m6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 07 Nov 2020 00:44:26 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A70Ue9H195816;
	Sat, 7 Nov 2020 00:44:26 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by aserp3020.oracle.com with ESMTP id 34hw0qdmy7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 07 Nov 2020 00:44:25 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0A70iI4U024046;
	Sat, 7 Nov 2020 00:44:18 GMT
Received: from [10.74.103.192] (/10.74.103.192)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Fri, 06 Nov 2020 16:44:17 -0800
Subject: Re: [PATCH] x86/xen: fix warning when running with nosmt mitigations
To: Brian Masney <bmasney@redhat.com>, jgross@suse.com, sstabellini@kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        hpa@zytor.com, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org, dustymabe@redhat.com
References: <20201106003529.391649-1-bmasney@redhat.com>
 <20201106004743.GA380136@tp-x1>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <a541a64b-aabc-bb62-4cf7-da5004a756d7@oracle.com>
Date: Fri, 6 Nov 2020 19:44:16 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201106004743.GA380136@tp-x1>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9797 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011070001
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9797 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011070001


On 11/5/20 7:47 PM, Brian Masney wrote:
> On Thu, Nov 05, 2020 at 07:35:29PM -0500, Brian Masney wrote:
>> diff --git a/arch/x86/xen/spinlock.c b/arch/x86/xen/spinlock.c
>> index 799f4eba0a62..4a052459a08e 100644
>> --- a/arch/x86/xen/spinlock.c
>> +++ b/arch/x86/xen/spinlock.c
>> @@ -93,9 +93,24 @@ void xen_init_lock_cpu(int cpu)
>>  
>>  void xen_uninit_lock_cpu(int cpu)
>>  {
>> +	int irq;
>> +
>>  	if (!xen_pvspin)
>>  		return;
>>  
>> +	/*
>> +	 * When booting the kernel with 'mitigations=auto,nosmt', the secondary
>> +	 * CPUs are not activated and only the primary thread on each CPU core
>> +	 * is used. In this situation, xen_hvm_smp_prepare_cpus(), and more
>> +	 * importantly xen_init_lock_cpu(), is not called, so the
>> +	 * lock_kicker_irq is not initialized for the secondary CPUs. Let's
>> +	 * exit early if the irq is not set to avoid a warning in the console
>> +	 * log.
>> +	 */
>> +	irq = per_cpu(lock_kicker_irq, cpu);
>> +	if (irq == -1)
>> +		return;
>> +
>>  	unbind_from_irqhandler(per_cpu(lock_kicker_irq, cpu), NULL);
> As soon as I saw this on lore, I saw that I should have passed the irq
> variable to unbind_from_irqhandler() rather than doing another per_cpu()
> lookup. I'll wait for feedback about the general approach before posting
> a v2.


This looks good. I'd shorten the comment though: your commit message already describes the scenario. And change the subject to something like "Don't unbind uninitialized lock_kicker_irq".


-boris


