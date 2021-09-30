Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B2D41D512
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 10:04:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199585.353738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVr3S-0002FP-NJ; Thu, 30 Sep 2021 08:04:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199585.353738; Thu, 30 Sep 2021 08:04:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVr3S-0002DY-K1; Thu, 30 Sep 2021 08:04:34 +0000
Received: by outflank-mailman (input) for mailman id 199585;
 Thu, 30 Sep 2021 08:04:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVr3Q-0002DS-Tz
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 08:04:33 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a6799f2-21c5-11ec-bd3d-12813bfff9fa;
 Thu, 30 Sep 2021 08:04:31 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-4tEksrK5MRWJb4Qd7oxIQQ-1; Thu, 30 Sep 2021 10:04:29 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2829.eurprd04.prod.outlook.com (2603:10a6:800:bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.20; Thu, 30 Sep
 2021 08:04:27 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 08:04:27 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P194CA0102.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 08:04:25 +0000
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
X-Inumbo-ID: 0a6799f2-21c5-11ec-bd3d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632989070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K95pUxLUjw7UaDwmtJKGNRMvxbs8axOcXiHMYClJwCI=;
	b=hMuq/wNDan9fauboDXeelJHX0t/474iZuNTm2wu/+6q/RnfIsGRZAfBSSd9zokVnDxBUwl
	atwzlaURrG/G4Pq7nKVvPQ0A1wYMNHLSaQNSyrCcqgzPlHOrcC0RkkBxqyEulDZa3qZzlH
	a/zDPvzwxnQseGX+Rj7MOTEGeyBUu94=
X-MC-Unique: 4tEksrK5MRWJb4Qd7oxIQQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kaVM/CiapICcdS4VhwawbQkZ5Je8ncQ+TSLGhQv8OoeLWTH6OGVudy9GFik5vicINdonEgs/ckv225y/vAQmqq0YjupXFqHP2qOac6YqWPbIzW4/6cbVCxdZkj2JGsWA844IM+xMqDrPgj5c+Z8QysHYs+MxU0K/xxCrgduP/udAtYSKlxTPjgfN8lAvmG2jCn2rShPRVzdwE4FrT5uUwtKNyFlykusN1CurxJsP0RBxp3VIbNkcX++cq1NWHQEekAZn/NSn6DM7b+X542h6pYduWIVNUMO4nYb2iz2vkIMKrbZeBOqEfRBBXmXrzA3GCf92yGf33BJeONOt/Ors4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=K95pUxLUjw7UaDwmtJKGNRMvxbs8axOcXiHMYClJwCI=;
 b=JdZ0uXRSaioMPQ9TxxcwGcs3gxLz3yr5XmEThIu0/L6i7DooimLjVIa0E09CajPMA9mIbYuFPKvZc2tRmFzeg2+YvTHBA5TtgxLB/T8/Hk3spNcRBII0ajw6EQ+GsHUTuKhW/r/a2JSnd97fgUMlhhOVKn1Rqc2xQo8V6F4UJHem2Da21Qe3mvRCE4dBrhXhw0L5I4WdLqZJZV0nU4yuNK9pWvkEFaoHL8gno+FbkNlR2U07JrToHDfqWQ1L/Kv3uCAqj3e9dcfu9LmlcyDUHtMKV8JJhS1vHutIIe7OJwYqn/gVb4+CXdQo6+ABgcB6gM7FwDbAcfNZdPb7hnuzgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v3 11/11] xen/arm: Process pending vPCI map/unmap
 operations
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20210930071326.857390-1-andr2000@gmail.com>
 <20210930071326.857390-12-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <49166fbf-6436-1ecc-fccf-98be4ad400b8@suse.com>
Date: Thu, 30 Sep 2021 10:04:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210930071326.857390-12-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0102.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::43) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b6a8b38-9599-456c-e561-08d983e8ec46
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2829:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB282978AF393F56E14E410583B3AA9@VI1PR0402MB2829.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:580;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pi1v8CXOEPyCUV/ph5kGrkrm9Xrm00VccSzzSRi2TCfYP8n33+LyrgBhW5NwP04mjCWD6O+2U4wpjOvq9W6NKgt3PYJ/dmiUDO/7bdhDw2VT0uoH8KiwqlpgvDyr66gZYPn9EWqdg1fK5pwrSM+rTX90COj3CsNFISUbDFoKruld1ljStRlEZ7bTxfWvPj6l/LXmANpwAKTAiG4A43kZuWE0QyR8Efr7fEXhmZNdr8GhUmq+qiAnZqXzqbaG1qCpW40LLJT+2Etvt0lrUErdRPty8NL+mrwjb+eG5LDJc8mU89nZJ4y94uEEud7ROBRPVFpSLOAoFt+axrLfmzexI1H3I+nklneZWNeyRNqY6NHbIUocZgWnuqUCY/OW/RDlCZBkxdIdphDfiD9AJ4seU9yt0voE9xRFyE/BfhzU++JX5ZyybKVR72be9rMcovpaSIBPl7q7dYkwOdbHUtnmALu1MtXjljGuDRG6Y90B8vhKTKXl0HceVNfKV5Ht8GVmHVxgnh+VkoF+paCY3Cl8N8poC1BFmhZKJZIL61hPIWR6qMBsa/Wa9T1QRfehnKsOzOPl1KtW19Bx7EzfjzYzYmmi9rzDdK67xtPKCsuwL31WqC6hQgzHt5vOTmrqVmWIm/4Hm066u3DTT7sGobV9ulL0q72r5dMbCh3ImayGxHhlR66X6pGNKCF+94RmOmlf8fE9WokTo3R4atzzLt6NBZyzgD65PsyuvMEiXLfMtVA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(4326008)(956004)(8676002)(8936002)(31686004)(83380400001)(6486002)(316002)(86362001)(16576012)(54906003)(38100700002)(7416002)(66556008)(2906002)(5660300002)(508600001)(186003)(2616005)(36756003)(66946007)(31696002)(53546011)(6916009)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzlVM3ZBcGM2eXNRbkRsVFpvSEVVTG5VN0JqSE0zNGRSd1NubXVFVE9ScnRE?=
 =?utf-8?B?TE85MWtGa2g4aEx1bk82UXgxakx3NVBMV2Q5cXUvbXdocDdEeEE2VkdxV3Vo?=
 =?utf-8?B?b0hQWi8rc3hTdDg1dTFCMjl1TVN1TTZTcUtRQ0E0a3hPRUtaZkZHeStJOEl4?=
 =?utf-8?B?ck9TcGpicTZMelh3K1Q5Qlp5QjI4bHJmV3Z2Qlc3bkZnZHJMT0VMOTQ4azJk?=
 =?utf-8?B?ZUZPSW93V0dWTjZGZjNlRXpkM3dqekNSYWYrdHVZQzcyOWpEVWNyL2hURVRx?=
 =?utf-8?B?UkxyTXhUQVdmRitqVWl4UkdUQUZHYXArUUp6RHZmNjJKdDB1Wk5kSTIvU1Fm?=
 =?utf-8?B?SlBLRW5xb29qSlloN1lONkZRZjczVFVSc3hSNzNoMG5RdS9NVGJDbk5jMXg2?=
 =?utf-8?B?M0JyU3FtSkdqZzdWaElocjlCTldpb0dlTVJIUkYwSFFYc2V1a1J0ODZiRVU4?=
 =?utf-8?B?K3FtRnZERnI0ODZaNUx3WFBpUzM0NUd5WllmRUpuMWpER0svbUR6ajdpbU5r?=
 =?utf-8?B?WGlsSktIbmhwSGJ3enBwNVdicXBodS9HMzNtTTQzTVJxWElZeERiUEdiRnVP?=
 =?utf-8?B?c0dLTUdXME9va2pVRVpKK3l6ckxVUDR6OWFBNnBJV3ZBS2ZaWDNOckpCa0Ex?=
 =?utf-8?B?MWJEeGxBY25MMjRQUVhNRkVUWWpRK25UQ2hNSXA3cnlFNDFxUjVhZFhnSk5p?=
 =?utf-8?B?TjRpU0NtUGUrbHN2MWh1ckZoR0FTZEZvb0RMd3dVQzVsbEJsSmhjcTZYR0NS?=
 =?utf-8?B?MmJFaGdYK2ExanIxQ0hzSnpIck5leDE4VUhQblZqUGVqZnRrU2VWNWFQVkh1?=
 =?utf-8?B?RGhyYTRNek95WE5oTkkyR1BucFFMTkVmSVFOSkdHRTRwbGVkcGY0QWpLV2l3?=
 =?utf-8?B?Mml4VUhUOGtxNlE0SjBXLzArSS9Xc2V6KytCaXBKUmQ5dVU0Y1UxVFJ5U0Ny?=
 =?utf-8?B?VDZZQVhiSm5iY1V1ZDRyMjJ2MExQUGxNMXBWVTVncVNXbWZDTEhIOUZSMjNU?=
 =?utf-8?B?T2draDR0R2trWHBzcUZ0NXdOQTJBWmVRc1hyRUNYSksxNEdnQXV3UThrdUkv?=
 =?utf-8?B?bGxsYUprRW9HekFCSldod2lGNjZoNkFnSUw4NE9IYWJOb21mZCtKSkVtN203?=
 =?utf-8?B?STFQYVltczQycmdPTithbllEYmtLK0pCZkdzNmUrck9YMjI5YURqOXVGcjA3?=
 =?utf-8?B?OGsvNEJHZXVZajQ4VVBjYm5RbEdaaVk5Y2tFNWs0bFdscUFwVnZKaUJ2Y1E1?=
 =?utf-8?B?S0hIaXplMFJsak13K1Z1UWxjTGRjZXNSYVZZcGFydjBaNXRVWGRIV1IxbTdk?=
 =?utf-8?B?bnRBTTBYSHJQQUY4WTNGWDVXdUo4d2VzSjBKWEVFNmw5OFIvVDlJMWptaGxv?=
 =?utf-8?B?YzJmL2pNTjhacm15SVlCYXRuSG1LNnZCOTY0U1V5Q1kxaWF1QzVmdkVOeExT?=
 =?utf-8?B?RmYrQkdKMlBjU3NHc0txWHRLcnZKTEVaV0xFS2FsU1hHdUs0L3liSWtmRERU?=
 =?utf-8?B?WFBaY3A4bHprS2J6ZEhvbzF5TURZVzhQN3B5aU5VdEwvMzM0QWg0QThOaWpl?=
 =?utf-8?B?RFFTaGMrTjRQV1FOU0hpY0g5NkxhNkkzRjAzQWNtaE4zbmVRM3dXenV1cGFR?=
 =?utf-8?B?TjlCR2x3UTdsTlVIeEdELzEwRmZWYXRHMHk0QXJSSUFSWmJLS2U3ZW5iTDlH?=
 =?utf-8?B?cjRNekovbU9KZkpMOHdJRlMySWxZR05zL0JFSXJseE9XV3FpaUdYVkl0bkxT?=
 =?utf-8?Q?hgCL5bd0k1dEhTYFDZJC17l6m8W5RSz+v/CnwHa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b6a8b38-9599-456c-e561-08d983e8ec46
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 08:04:27.0385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uaE2+qPM+sJ42CJxkl36Cpp6Y5oWNfP9SUmcEyXh8+Mn3XahyHAzfSNDUxc8XjFADEGdtpUvw64tNCZfV9sdhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2829

On 30.09.2021 09:13, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> vPCI may map and unmap PCI device memory (BARs) being passed through which
> may take a lot of time. For this those operations may be deferred to be
> performed later, so that they can be safely preempted.
> 
> Currently this deferred processing is happening in common IOREQ code
> which doesn't seem to be the right place for x86 and is even more
> doubtful because IOREQ may not be enabled for Arm at all.
> So, for Arm the pending vPCI work may have no chance to be executed
> if the processing is left as is in the common IOREQ code only.
> For that reason make vPCI processing happen in arch specific code.
> 
> Please be aware that there are a few outstanding TODOs affecting this
> code path, see xen/drivers/vpci/header.c:map_range and
> xen/drivers/vpci/header.c:vpci_process_pending.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> ---
> Since v2:
>  - update commit message with more insight on x86, IOREQ and Arm
>  - restored order of invocation for IOREQ and vPCI processing (Jan)
> Since v1:
>  - Moved the check for pending vpci work from the common IOREQ code
>    to hvm_do_resume on x86
>  - Re-worked the code for Arm to ensure we don't miss pending vPCI work
> ---
>  xen/arch/arm/traps.c   | 13 +++++++++++++
>  xen/arch/x86/hvm/hvm.c |  6 ++++++

This x86 change
Acked-by: Jan Beulich <jbeulich@suse.com>

>  xen/common/ioreq.c     |  9 ---------

Already on v2 I did indicate that you need to Cc Paul to get an ack for
this part of the change.

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -546,6 +546,12 @@ void hvm_do_resume(struct vcpu *v)
>  
>      pt_restore_timer(v);
>  
> +    if ( has_vpci(v->domain) && vpci_process_pending(v) )
> +    {
> +        raise_softirq(SCHEDULE_SOFTIRQ);
> +        return;
> +    }
> +
>      if ( !vcpu_ioreq_handle_completion(v) )
>          return;

Seeing this movement I'm now wondering whether we shouldn't take the
opportunity and move this further up. I notice that besides Paul you
also failed to Cc the other x86 maintainers, whom I'm now adding.

Jan

> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -25,9 +25,7 @@
>  #include <xen/lib.h>
>  #include <xen/paging.h>
>  #include <xen/sched.h>
> -#include <xen/softirq.h>
>  #include <xen/trace.h>
> -#include <xen/vpci.h>
>  
>  #include <asm/guest_atomics.h>
>  #include <asm/ioreq.h>
> @@ -212,19 +210,12 @@ static bool wait_for_io(struct ioreq_vcpu *sv, ioreq_t *p)
>  
>  bool vcpu_ioreq_handle_completion(struct vcpu *v)
>  {
> -    struct domain *d = v->domain;
>      struct vcpu_io *vio = &v->io;
>      struct ioreq_server *s;
>      struct ioreq_vcpu *sv;
>      enum vio_completion completion;
>      bool res = true;
>  
> -    if ( has_vpci(d) && vpci_process_pending(v) )
> -    {
> -        raise_softirq(SCHEDULE_SOFTIRQ);
> -        return false;
> -    }
> -
>      while ( (sv = get_pending_vcpu(v, &s)) != NULL )
>          if ( !wait_for_io(sv, get_ioreq(s, v)) )
>              return false;
> 


