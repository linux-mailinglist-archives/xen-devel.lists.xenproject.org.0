Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B79C2EA061
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 00:04:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61665.108545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwYtk-0003RP-Du; Mon, 04 Jan 2021 23:04:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61665.108545; Mon, 04 Jan 2021 23:04:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwYtk-0003R0-9p; Mon, 04 Jan 2021 23:04:24 +0000
Received: by outflank-mailman (input) for mailman id 61665;
 Mon, 04 Jan 2021 23:04:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yCAg=GH=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kwYtj-0003Qv-7A
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 23:04:23 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 87e0252d-fcdf-4cfa-bdde-412ae4bd300e;
 Mon, 04 Jan 2021 23:04:22 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 104MxN1n001785;
 Mon, 4 Jan 2021 23:04:15 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 35tg8qxjng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 04 Jan 2021 23:04:15 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 104MsiAk176716;
 Mon, 4 Jan 2021 23:04:14 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 35v1f7x0vw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Jan 2021 23:04:14 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 104N4BAW015009;
 Mon, 4 Jan 2021 23:04:12 GMT
Received: from [10.39.231.107] (/10.39.231.107)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 04 Jan 2021 15:04:11 -0800
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
X-Inumbo-ID: 87e0252d-fcdf-4cfa-bdde-412ae4bd300e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=bAJqrKShGQ6IjfSK8WmKxzb02p5S+GSn+wWyiPt/M2g=;
 b=Dwe07ung4epCmD7zzFx879DzyQVs6slZfqT/huJ8Gqk1fKPdWAr9ZhLjqKq1Zs+0Sn/c
 eb7qa8i+Li9i3dZV67vA9H6xo93I5XpKbo9MO4b6xRjPGG1dVtM2/wHgAqVUJcHegeJB
 R08pHiuT2OgZVwylDuVebb8hFGuoWMwnvmh7nf8c6XANrgmLC92Ut5Igiw9X7lar8gq0
 h+OLH++/s994aSbDknKQNr8XB4RjT9lnVxDmGAHpZtIxyhSA3m6KflsYH33WTcl4pqhR
 wLAIjrwpoxHyGeI2SzraJb5ceDVldTr0CS8gsAaD6NaoZFT2JkAhOShLYacm3D7tms9m Bw== 
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
 <f681dfe6-d0fb-e451-a58f-ad5cafa1cd62@oracle.com>
 <706a569a1321deafb3ae7a4e8d569fb6f2291f50.camel@infradead.org>
 <ea05c086-3b0c-0deb-c4c6-08a25beecb38@oracle.com>
 <6a032d2ff0d52ee19b2a88ac6813e25c6efc3733.camel@infradead.org>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <3c27abbb-2f1d-2641-51c6-2f6bdbcf559b@oracle.com>
Date: Mon, 4 Jan 2021 18:04:09 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <6a032d2ff0d52ee19b2a88ac6813e25c6efc3733.camel@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9854 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101040138
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9854 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101040138


On 1/4/21 5:37 PM, David Woodhouse wrote:
>
> @@ -33,9 +33,11 @@ static void __init xen_hvm_smp_prepare_cpus(unsigned int max_cpus)
>  	int cpu;
>  
>  	native_smp_prepare_cpus(max_cpus);
> -	WARN_ON(xen_smp_intr_init(0));
>  
> -	xen_init_lock_cpu(0);
> +	if (xen_have_vector_callback) {
> +		WARN_ON(xen_smp_intr_init(0));
> +		xen_init_lock_cpu(0);


By now you have nopvspin set so you might as well leave xen_init_lock_cpu(0) as is. (and then move the check inside xen_smp_intr_init())


> +	}
>  
>  	for_each_possible_cpu(cpu) {
>  		if (cpu == 0)
> @@ -64,14 +66,17 @@ static void xen_hvm_cpu_die(unsigned int cpu)
>  
>  void __init xen_hvm_smp_init(void)
>  {
> -	if (!xen_have_vector_callback)
> +	smp_ops.smp_prepare_boot_cpu = xen_hvm_smp_prepare_boot_cpu;
> +	smp_ops.smp_prepare_cpus = xen_hvm_smp_prepare_cpus;
> +	smp_ops.smp_cpus_done = xen_smp_cpus_done;
> +
> +	if (!xen_have_vector_callback) {
> +		nopvspin = true;
>  		return;
> +	}
>  
> -	smp_ops.smp_prepare_cpus = xen_hvm_smp_prepare_cpus;
>  	smp_ops.smp_send_reschedule = xen_smp_send_reschedule;
>  	smp_ops.cpu_die = xen_hvm_cpu_die;


Why not xen_hvm_cpu_die too? common_cpu_die() sounds like something we should do, and the other three we call there will be nops.


>  	smp_ops.send_call_func_ipi = xen_smp_send_call_function_ipi;
>  	smp_ops.send_call_func_single_ipi = xen_smp_send_call_function_single_ipi;
> -	smp_ops.smp_prepare_boot_cpu = xen_hvm_smp_prepare_boot_cpu;
> -	smp_ops.smp_cpus_done = xen_smp_cpus_done;
>  }
>
>> Also, for the spinlock changes specifically --- I wonder whether it
>> would be better to reverse initial value of xen_pvspin and set it to
>> 'true' only if initialization succeeds.
> I looked at that but it would need to be tristate, since the
> 'xen_nopvspin' command line option clears it from its default of being
> enabled.


Ah, right. How about setting nopvspin in xen_parse_nopvspin()?


-boris


