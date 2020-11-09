Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6820D2AC7DE
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 22:59:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22915.49442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcFCO-000592-Qv; Mon, 09 Nov 2020 21:59:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22915.49442; Mon, 09 Nov 2020 21:59:40 +0000
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
	id 1kcFCO-00058c-No; Mon, 09 Nov 2020 21:59:40 +0000
Received: by outflank-mailman (input) for mailman id 22915;
 Mon, 09 Nov 2020 21:59:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZjvN=EP=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kcFCN-00058S-C0
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 21:59:39 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab8d546c-15ec-4a61-b6aa-e0724f2b22e4;
 Mon, 09 Nov 2020 21:59:38 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A9LE6TI082669;
 Mon, 9 Nov 2020 21:59:27 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 34nh3arqj8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 09 Nov 2020 21:59:27 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A9LFHn1119274;
 Mon, 9 Nov 2020 21:59:26 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 34p5br4kcu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 09 Nov 2020 21:59:26 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0A9LxJ0U027159;
 Mon, 9 Nov 2020 21:59:20 GMT
Received: from [10.74.103.185] (/10.74.103.185)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 09 Nov 2020 13:59:19 -0800
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ZjvN=EP=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
	id 1kcFCN-00058S-C0
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 21:59:39 +0000
X-Inumbo-ID: ab8d546c-15ec-4a61-b6aa-e0724f2b22e4
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ab8d546c-15ec-4a61-b6aa-e0724f2b22e4;
	Mon, 09 Nov 2020 21:59:38 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
	by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A9LE6TI082669;
	Mon, 9 Nov 2020 21:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=iudd/pWhUkjLp/Fl5sIWyMMOmTzZfRPFExPcv41Jvgw=;
 b=qWXC8FRu7L7SesUBbDQz8EvTZ4cCbyhLuaovb9eAOJYFy6TlNOz/OhUfq/72lHwgEqCt
 Jca2rK2h/8E2vTvrV14slrUZk+Vh5uA7HbIM7se26y9UxlDNXqGYUhFQRPBPZgif0lEK
 hegUPs/8y8x/1jndLVLicIudA+X5Di7PSJdHxOwz9tq9Un1OokWdvPJC9QmBotkYl3bi
 FgXWmSsZc4NBefpT8aWK6SOkb6UwoGPhdzzufvD8A5F9ZHFwRV47NBlWOcjZfc2TLWug
 XKSTn+Uk2IVAS/wTZkSJ4CziX9E3K9n2F5rZ+JvB4i7ByrP+xipFvW7iZA6dYraREs67 Lw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by aserp2130.oracle.com with ESMTP id 34nh3arqj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 09 Nov 2020 21:59:27 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A9LFHn1119274;
	Mon, 9 Nov 2020 21:59:26 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by userp3020.oracle.com with ESMTP id 34p5br4kcu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Nov 2020 21:59:26 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0A9LxJ0U027159;
	Mon, 9 Nov 2020 21:59:20 GMT
Received: from [10.74.103.185] (/10.74.103.185)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Mon, 09 Nov 2020 13:59:19 -0800
Subject: Re: [PATCH v2] x86/xen: don't unbind uninitialized lock_kicker_irq
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
        Brian Masney <bmasney@redhat.com>, sstabellini@kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        hpa@zytor.com, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org, dustymabe@redhat.com
References: <20201107011119.631442-1-bmasney@redhat.com>
 <5950df5c-79d6-b2bc-4f2b-35624a3c0d1e@suse.com>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <87d1122a-ca5a-786b-5b25-4caaaeaf386a@oracle.com>
Date: Mon, 9 Nov 2020 16:59:14 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <5950df5c-79d6-b2bc-4f2b-35624a3c0d1e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9800 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011090139
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9800 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011090139


On 11/9/20 12:34 AM, Jürgen Groß wrote:
> On 07.11.20 02:11, Brian Masney wrote:
>> When booting a hyperthreaded system with the kernel parameter
>> 'mitigations=auto,nosmt', the following warning occurs:
>>
>>      WARNING: CPU: 0 PID: 1 at drivers/xen/events/events_base.c:1112 unbind_from_irqhandler+0x4e/0x60
>>      ...
>>      Hardware name: Xen HVM domU, BIOS 4.2.amazon 08/24/2006
>>      ...
>>      Call Trace:
>>       xen_uninit_lock_cpu+0x28/0x62
>>       xen_hvm_cpu_die+0x21/0x30
>>       takedown_cpu+0x9c/0xe0
>>       ? trace_suspend_resume+0x60/0x60
>>       cpuhp_invoke_callback+0x9a/0x530
>>       _cpu_up+0x11a/0x130
>>       cpu_up+0x7e/0xc0
>>       bringup_nonboot_cpus+0x48/0x50
>>       smp_init+0x26/0x79
>>       kernel_init_freeable+0xea/0x229
>>       ? rest_init+0xaa/0xaa
>>       kernel_init+0xa/0x106
>>       ret_from_fork+0x35/0x40
>>
>> The secondary CPUs are not activated with the nosmt mitigations and only
>> the primary thread on each CPU core is used. In this situation,
>> xen_hvm_smp_prepare_cpus(), and more importantly xen_init_lock_cpu(), is
>> not called, so the lock_kicker_irq is not initialized for the secondary
>> CPUs. Let's fix this by exiting early in xen_uninit_lock_cpu() if the
>> irq is not set to avoid the warning from above for each secondary CPU.
>>
>> Signed-off-by: Brian Masney <bmasney@redhat.com>
>
> Reviewed-by: Juergen Gross <jgross@suse.com>



Applied to for-linus-5.10b.


-boris


