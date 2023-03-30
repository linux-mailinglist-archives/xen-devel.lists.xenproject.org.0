Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9508D6D0A68
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 17:51:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516784.801458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phuYE-0005vB-1v; Thu, 30 Mar 2023 15:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516784.801458; Thu, 30 Mar 2023 15:50:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phuYD-0005rt-VA; Thu, 30 Mar 2023 15:50:57 +0000
Received: by outflank-mailman (input) for mailman id 516784;
 Thu, 30 Mar 2023 15:50:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IhQB=7W=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1phuYC-0005rn-5L
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 15:50:56 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5e7fac4-cf12-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 17:50:53 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by SA1PR12MB6945.namprd12.prod.outlook.com (2603:10b6:806:24c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Thu, 30 Mar
 2023 15:50:49 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::659f:af8f:6d3e:8242]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::659f:af8f:6d3e:8242%4]) with mapi id 15.20.6178.041; Thu, 30 Mar 2023
 15:50:49 +0000
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
X-Inumbo-ID: a5e7fac4-cf12-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iEiRtmcVoBLZWBtC41eXQsAeA8WMG7WAjtvgtGmZWxxGF7+m8pBy5x4zdaYGxi+Fnlc1MAPcsC2RtdPe3jxYX3XWlVqCAxmufURbr6+NZvM5Ma2M9IIF7Pn5mxDTR4Gbq/g0Cp0TooYDXmBlNWBUqkAJg7wpCZrD2AhsYuTNS/puFdqMkDYjnC2NoFbNkcSNrJq3EIP7W1w3pJh6KI3MGxQjuwwHm76l9BTM5ocl5YIm00lIs5xsNwDgZvrBgBuMvfu+LRsvwyL93+p5/J8ClE9hXQ9zL+uXoqgs8h2gSi7Z3Aki4NJf2RPqYTHAfT06K0A6S78vgGt5E3n6hLAgPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36UGZNAd6m+VrexqEHUbCI4Q7pyBZp5b4OX2S6to97c=;
 b=BNdwpTPvpMpvC2nbZFT1ZZlJPfRIHdopUYqAcmMYLePjcH5QeTl9+kKzqbwJtEkSiO8jw8+pFLcbqWsR4GsZ0nXZr6c1yf7oQU7bJlSlFxMujw3ARDHIe3OzgJFFOCYvWQAmRVZxvJZdI+WMpEUHFNOJ0otfOMCqwjfvIf6cd3WgvqT8HwIerpQVcRSH+vdzvTNhqwiSwI034T/i+yg2CtiIGT6NfuC+J353z/+iHhUkEgsJ6Ea6PWc6J8CNz1HK2CQQiWSJXOsRIyzyKCXoAdXQGt8OwwH1p6fITR2naVZHzmjV1RZzchaB5Saa8dO+VwLvcO1doRqGQ3iq3DqXXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=36UGZNAd6m+VrexqEHUbCI4Q7pyBZp5b4OX2S6to97c=;
 b=1nmDs44SJ/u8EcapobazN32V7dVSj6mxeet0WhhRY0cUsazdgWGfnb+3qsViDTTN6UY+g3VcuY31PS0pvwa6YGGUL1lKgg4Hlg8gX15jQ10JfRJ9IQNytdstBBZFj6DbIF/7Qgmfm7R1/gwa7naqNGBzS38SHz/1/pwqJp+lbsI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <b4badb12-8887-d8d8-138e-8b4536ad95a4@amd.com>
Date: Thu, 30 Mar 2023 16:50:40 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "Garhwal, Vikram" <vikram.garhwal@amd.com>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
Subject: Need help on a issue (Unable to schedule guest for Xen on Arm)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0135.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::10) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|SA1PR12MB6945:EE_
X-MS-Office365-Filtering-Correlation-Id: aeba4d60-8ccb-4ee7-be39-08db3136882c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tQqzUofPHYpfgaeTB9KOeTlb6zRc1PX4+C5rYTsiXraCEuWFK2rsu9RJp4p5/sDM1HdGuQ/RzT3FZlgmkU/lXGiRiCnzZZBBjmpUxoXoSdn3QSEtUZQa5yd+dV3y+0zfUZGTFHpEjrwVZcGQ8z/nZWjA1Bu0Osm1Dh9uxF25m95g+t8sq21SB7F2jbdB9bxsCmUBi7da0klO8MCkM58vWLLt1MzfHD+R5tgoB1l+s5+H1I/7DVAa6GBTZFIPjHmKX2tb8eHtWh2bnOqOCUZ9YRl416EZF6uYteWzY4HzWQkj8C6LCZerzlaen5pgkyymWVG9Xb1WU1Xerbv+FktIZDguD3uv9YjMZuwAnf0/aQX+dw0CgpCcormJfX7jUNIL0tQ6LpEie67NY/B5W4A3MdjbOF28I4aXWBd0j/LYJb3x4zOWJMmCV1IuVaubCJrXJb32FHQIIwlvst2vZlpTp9Um2xmQpKNgOauQiL6E2vmagzYVgBixoCScxQCBSGheeJ7zr20XSPVIiRvwscxP6lEfw//ejBQFUjcuap3GDIuVuIiAKSsziR4/JfOUe80iARWetFNb8PCu9dlKZdcHtLG6tOZzd58/abZmQeUiL0ePR+S3fZjmjzXjtvedU5SJPrTp+tTfoyYTe3H7Z8QmRQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(39860400002)(366004)(376002)(451199021)(2906002)(38100700002)(4326008)(41300700001)(8936002)(5660300002)(31696002)(36756003)(478600001)(31686004)(6916009)(316002)(54906003)(6666004)(966005)(26005)(6486002)(6512007)(6506007)(66476007)(8676002)(83380400001)(66946007)(66556008)(186003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S00zOWgxaDh6RTNiNVYxbWtlczdQdUlaSjE0UkU1bDE4ZkdUcDBQeTh0WUhi?=
 =?utf-8?B?bGRTZ1NQRG9ZSGM0YUlVLzlzdWZOYWtNL1crR05GejYzb3FXbllOYXFJU1I2?=
 =?utf-8?B?MzZaZlUwaDNySmd1R3prQ2pYTTlIaklQY2U0VktMSTFSbTJpSElLNXdlcko5?=
 =?utf-8?B?cEtNR2dwdVV6T0FQZW1nbXhkc2pmenR6QkUzNElkUW5IQnBGbUVuRXh6dG1K?=
 =?utf-8?B?MFNDL0kzQnJVWDBmejV0anU5Q0NERWVxTmdUdEFnRncydkVCSUpFZ2tSdzFM?=
 =?utf-8?B?bkRGSEE1WWpKL2MwMUJ2MUlsdmRhUUJtMHJFOTNQU29DTEtSYVVZS1lNRy9T?=
 =?utf-8?B?ZjV6eTlMUldOdmVwbVR3VE43TC9iaEppQnpwTjRSWDNvcUo0ZGpJMHI0WE5Z?=
 =?utf-8?B?UWt4UUo2SzdkczFmaVhRZHQ0bkpmdW9saFJDQi8wakVMZnpHUmR3Q2RCNHpU?=
 =?utf-8?B?OGgvaC90UmlBWVgwdk1xdFo2ampmcXczMThickJhWXd4N1RWUkxsS3NvY3Fv?=
 =?utf-8?B?ZlhoUitrMUtGTS9GMkowYkZ2dFB3ekFGOVFYUVlZaDRsOVYrUzhxRmk2K1JX?=
 =?utf-8?B?Z1FDdmVFMDdodVFWeTVXRVBaYkxxSnNueVFYYXpGdTlydzdxYWFNK0NCT0Ny?=
 =?utf-8?B?VzdUZW5Cc3pJZVBaMElJcTVGeGxxcEhsNHJBbGgxUWwzRk4xNGxLWUp6SVl5?=
 =?utf-8?B?YjF1ZmtvVW44ZC9rZEVtWTFCUFhXQTQwelhHTUR3ZEpSS0NCTnJUdFdVd25t?=
 =?utf-8?B?M1Y2RWxSYXovaittOElhVGJ5WEx0VmVIV2FwK3VTMEhwa0U3T3BOMmZ5RlVl?=
 =?utf-8?B?VVplUStBUllMSG1JU29lbFh0cjAyTGo4NlV1N2xqL0xJaHY2N2twdkRpWGhU?=
 =?utf-8?B?WkxKUGwzK0tPZEFabmRuNW1MUWFzSndiOHgyblVQTHBXcHdXd3BSMDd6ZDRx?=
 =?utf-8?B?NXBCSjkvWitaM0tydEE4OWdPUUs3eUlkZnZldGx0R1dsWlZHZ0Fwb3gxUmR1?=
 =?utf-8?B?OGk4eldiUk9MR2NxVWhQMzRvbi9UMWwrNE9SQnFObXQ4d1MwTXhERnZGWFNx?=
 =?utf-8?B?TDRiajVlSzhMY2g5U3dOWjZncUdHQkthVXovNmlmMitGb2dLMFhtUE1qYXV3?=
 =?utf-8?B?SkUxdTBwMWtoMzEwamZ1LzA0Mi9tMkFGeFpSTnczeGZHRWZVczh0dkh0dEZs?=
 =?utf-8?B?S3E1WTVmdXJIZzNQZzdpRGJJRjZ5dUx6Z2hLK013cmRBeFByWlpheTBHV0Zu?=
 =?utf-8?B?V3QraHcwR2krd3JHV25ESUcxMFlFNWhIK3dNMHBYK2dRR1V0UmszelZ3SDN1?=
 =?utf-8?B?TVRFQ1FxUktHTkJJRnJXVWI5RllyamFwT1ZIRHNyUGRrWVhSbWNYallVQ2Ur?=
 =?utf-8?B?UjhQQjNUdHJxcmZaOXlTR2QrV0s1clhCT1JXS2FON0NCbHNycEtMZzVOZUor?=
 =?utf-8?B?UkFwekRSWWhTanhlL2w1NG1ldXNYYXBXTXdid002M2ROTG5FQ1d0VlREcDVr?=
 =?utf-8?B?MUE0Tm0waWRsNDAzc29DZ2RCUXdoRWFRZExCcmtWeVdQSjdOM2M4TEw0ZFBk?=
 =?utf-8?B?LzU4aXNIZm5laHBmQm1TU21yUFJoZ2cvRUJGVFAySHBIM1BxVFgvdWlOc0VK?=
 =?utf-8?B?YjJCWWt0ZGRyRTZEWWY0cFBOMGFMdGs1Q0lBRExzbVdZVkg0TEZxMSsraDhN?=
 =?utf-8?B?MVNGYlJHYTcwbkg2Q0FvVnlNNzVNTUJmRlk4UTZNR3R6RWt5MytwVW1OTTFO?=
 =?utf-8?B?clZrZXl2aHhpMm5BUzVLRC9YNTA4cGVocW9zaHlvZjBuV05ONkNjL1RHN2Zy?=
 =?utf-8?B?MmJDMFBCNnIwczBjU29IbmQ5MU5zNFNDY1FPT0QyejAzdkVKMHdEOTh1ekJ4?=
 =?utf-8?B?TXdDYTV2VjJZcVJiZEl1ZEFsaEg4MC9Xam8rOWdHMHR3RjFNYjlzbUFOVUtY?=
 =?utf-8?B?TjlOeVF0MzM5Q2NRc0tvMmlOQ0t0eVlNVCtoQWlFR3VwVUhoNkpFdUxhUDRv?=
 =?utf-8?B?KzhlRnoxWWIwVytSa1FabStEeWNkZzB5MkFYdUVubnpNMUhzSlFhZnNyTm5C?=
 =?utf-8?B?cG5yTHBsL1lSeFRDRkduckJjbTNyQUhnbU9WaTFCQXY2K21ja0ovWVhrc2xN?=
 =?utf-8?Q?lNqvJbs7A9EFUYlG1XdltSPCi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeba4d60-8ccb-4ee7-be39-08db3136882c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 15:50:48.8966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MUZ4fkImpo6I6Te3eiH83mIcIoMoJjEC3CN9n2tUUVWfapQTqmYLx3kiYvNZ2QPim1qgDmMsw984JHbwIefMpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6945

Hi Xen experts,

I need some pointers on an issue I am facing.

I am running my downstream port of Xen on Cortex-R52 hardware. The 
hardware consist of two R52 cores (the second core is in lockstep mode). 
So, currently the hardware does not support SMP.

The issue is that Xen is unable to schedule a guest. So 
leave_hypervisor_to_guest() ---> check_for_pcpu_work() and this does not 
return.

Debugging this, I see  check_for_pcpu_work() --> do_softirq() --> 
__do_softirq() --> timer_softirq_action().

In timer_softirq_action(), the problem I see is that for all the timers, 
"((t = heap[1])->expires < now)" is true.

     while ( (heap_metadata(heap)->size != 0) &&
             ((t = heap[1])->expires < now) )
     {
         remove_from_heap(heap, t); <<<<------ So, this gets invoked for 
all the timers.
         execute_timer(ts, t);
     }

So, further below reprogram_timer() gets invoked with timeout = 0 and it 
disables the timer. So, timer_interrupt() is never invoked.

Can someone give any pointers on what the underlying issue could be and 
how to debug further ?

I do not observe this behavior while running on R52 FVP. The difference 
is that for most of the timers "((t = heap[1])->expires < now)" is 
false, so reprogram_timer() gets invoked with non zero timeout and 
subsequently, the timer_interrupt() get invoked.

Also, looking at 
https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/time.c;h=0b482d7db30c89fc70b191722a89dea8a675c2b6;hb=refs/heads/staging#l211

208 
<https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/time.c;h=0b482d7db30c89fc70b191722a89dea8a675c2b6;hb=refs/heads/staging#l208> 
/* Set the timer to wake us up at a particular time.
209 
<https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/time.c;h=0b482d7db30c89fc70b191722a89dea8a675c2b6;hb=refs/heads/staging#l209> 
  * Timeout is a Xen system time (nanoseconds since boot); 0 disables the timer.
210 
<https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/time.c;h=0b482d7db30c89fc70b191722a89dea8a675c2b6;hb=refs/heads/staging#l210> 
  * Returns 1 on success; 0 if the timeout is too soon or is in the past. */
211 
<https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/time.c;h=0b482d7db30c89fc70b191722a89dea8a675c2b6;hb=refs/heads/staging#l211> 
int reprogram_timer(s_time_t timeout)
212 
<https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/time.c;h=0b482d7db30c89fc70b191722a89dea8a675c2b6;hb=refs/heads/staging#l212> 
{
213 
<https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/time.c;h=0b482d7db30c89fc70b191722a89dea8a675c2b6;hb=refs/heads/staging#l213> 
     uint64_t deadline;
214 
<https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/time.c;h=0b482d7db30c89fc70b191722a89dea8a675c2b6;hb=refs/heads/staging#l214> 

215 
<https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/time.c;h=0b482d7db30c89fc70b191722a89dea8a675c2b6;hb=refs/heads/staging#l215> 
     if ( timeout == 0 )
216 
<https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/time.c;h=0b482d7db30c89fc70b191722a89dea8a675c2b6;hb=refs/heads/staging#l216> 
     {
217 
<https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/time.c;h=0b482d7db30c89fc70b191722a89dea8a675c2b6;hb=refs/heads/staging#l217> 
         WRITE_SYSREG(0, CNTHP_CTL_EL2);
218 
<https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/time.c;h=0b482d7db30c89fc70b191722a89dea8a675c2b6;hb=refs/heads/staging#l218> 
         return 1; <<<<<<<<<<<<<<<<<<<<<<-------------- Shouldn't this 
be 0 as the comment suggets ?
219 
<https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/time.c;h=0b482d7db30c89fc70b191722a89dea8a675c2b6;hb=refs/heads/staging#l219> 
     }
220 
<https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/time.c;h=0b482d7db30c89fc70b191722a89dea8a675c2b6;hb=refs/heads/staging#l220> 

221 
<https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/time.c;h=0b482d7db30c89fc70b191722a89dea8a675c2b6;hb=refs/heads/staging#l221> 
     deadline = ns_to_ticks(timeout) + boot_count;
222 
<https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/time.c;h=0b482d7db30c89fc70b191722a89dea8a675c2b6;hb=refs/heads/staging#l222> 
     WRITE_SYSREG64(deadline, CNTHP_CVAL_EL2);
223 
<https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/time.c;h=0b482d7db30c89fc70b191722a89dea8a675c2b6;hb=refs/heads/staging#l223> 
     WRITE_SYSREG(CNTx_CTL_ENABLE, CNTHP_CTL_EL2);
224 
<https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/time.c;h=0b482d7db30c89fc70b191722a89dea8a675c2b6;hb=refs/heads/staging#l224> 
     isb();
225 
<https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/time.c;h=0b482d7db30c89fc70b191722a89dea8a675c2b6;hb=refs/heads/staging#l225> 

226 
<https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/time.c;h=0b482d7db30c89fc70b191722a89dea8a675c2b6;hb=refs/heads/staging#l226> 
     /* No need to check for timers in the past; the Generic Timer fires
227 
<https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/time.c;h=0b482d7db30c89fc70b191722a89dea8a675c2b6;hb=refs/heads/staging#l227> 
      * on a signed 63-bit comparison. */
228 
<https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/time.c;h=0b482d7db30c89fc70b191722a89dea8a675c2b6;hb=refs/heads/staging#l228> 
     return 1;
229 
<https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/time.c;h=0b482d7db30c89fc70b191722a89dea8a675c2b6;hb=refs/heads/staging#l229> 
}

Kind regards,

Ayan




