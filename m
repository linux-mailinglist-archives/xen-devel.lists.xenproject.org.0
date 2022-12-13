Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8BE64B56A
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 13:47:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460640.718585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p54g9-00085n-Tu; Tue, 13 Dec 2022 12:46:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460640.718585; Tue, 13 Dec 2022 12:46:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p54g9-000831-Qn; Tue, 13 Dec 2022 12:46:37 +0000
Received: by outflank-mailman (input) for mailman id 460640;
 Tue, 13 Dec 2022 12:46:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F6Pn=4L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p54g8-00082v-1U
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 12:46:36 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2072.outbound.protection.outlook.com [40.107.13.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c082807-7ae4-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 13:46:33 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7124.eurprd04.prod.outlook.com (2603:10a6:208:1a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Tue, 13 Dec
 2022 12:46:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 12:46:31 +0000
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
X-Inumbo-ID: 2c082807-7ae4-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHR8hv2QvZaYkOcVkJHf6M6RVZZzp1dm2sAwPMkkunrasMjACUnbkODfpritfziMPsYkJAsVB5jyiEpmGcq7t7LNJTuOKF5Tfd13LmoOWZVlwKmF6lJEDMqpJ44ppiSJH5SYljbe+Mp9LMYQUzVa8THs9duYr5X3p3QwQq1gqf8z++/PRpgDGT63Yr3NgDV0jb3oSC2y34ZqakuGpFUbpiZVdz4Q2yEUlCk7m+B0/PE/YM4Jt5wv+o+I5251yImsPdXl5Gr6s7CFaQbeVAeiylNxtP/M0LwhxmBcYtL9XJNjBKPogfQTQQBQVjyexQY/6hkV9Aeb5k5qbdayt+QclA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gsyNg8PR+tPEEr8HkotP5cSLT5uho8ff65Ed90jliM=;
 b=l1PtIFHrTSZHSZMqJB5Mws8hH1g+HALzCylKd1yA+DzYSWqF1x6HVYCA87TmD41vLc5xCHSZmU0bjFvwus3EMcYsbRj0DLh50HKgG4BIQZ8i8ypXEXeesAXo6o92QupIDLZJjk4c5FhrSPectwA+FS0Mqyy7spAEz76CL4inRR+cOgOV4wzfxfr+DNzgZr7+diR/Y9MmdpfmsniRR/ymPxPvAWRAHzaWQbrAF2LdiyrEfTgi2ippjK8cNA+rtvx4S9pqxmkXbjaJN/c1odIpD3io41pwDZHYFpIqmWkOHpIRf8Nb/npYJ3Q5/1kJZfr7qgY0vfqRsa4HbK80JInMvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gsyNg8PR+tPEEr8HkotP5cSLT5uho8ff65Ed90jliM=;
 b=SEWSeceDCYrfYQs1mep/82SrLiuWKvkz+On3pmrBhbGqY1u2Ct5a9TZHsqptQFGp92wkI+DqenoN35eZpjDZHJUc9rAwF9y8qU4PMtTDmxMSdOv7f/MJ1sfv5MjQE5I3Oy8qfjTBgLtaxGwlL1TIXM50FUb7CHv7WRkdQ2aLV1oQ47WC9SyQnlKuTIi/eN6k+eJFXesi7hCS+LtM6wHM+gIDj8RRouxDupiP97UU6deSRxXPi13Ai2Rw2prm+Eloc0IEHbrPV3xC3V7GAh38mXwgJ5IL/KhSM/iY03hC8eVCSiKYoJuFAKWXqhhqkZu0v8oWPOA+JPiWZaxcrbenIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <76e1edfd-07d8-1d02-788b-bd9e6beb49fd@suse.com>
Date: Tue, 13 Dec 2022 13:46:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/2] NUMA: replace phys_to_nid()
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <471bd202-7bf0-81be-e8a5-780ea5975a70@suse.com>
 <670b7017-4a6e-fa9e-9d65-65013bd4ad80@suse.com>
 <520abcb0-0edd-bb09-f3a2-bb3d96c569b3@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <520abcb0-0edd-bb09-f3a2-bb3d96c569b3@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7124:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cf55397-deeb-45f8-a4ce-08dadd080f2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ALDmgOQoeqb+1VmJw1He8uXmvsIeUG9NbVBzY6eMUkxn8E5LtwTQFumsgfyWcCE84UAjDDNwWSc/PGDX/g2UN3x8MvrDIWvgOIvBK0fLZ8XfK0gy+PuUNSztGJceb5XYBfL8g3w7D4wBT1rtAE4K4dHgdYUaJsfOrMU7mc9rqNWp0TF2MrVpM8z0rLv+canTV9edBpBoIGEXkT8GBP0dwogTsk1lWsCSDeBT1e/fF9xj96z+8J6Sl9sK0Kx/Pp+TESv8s0ySrynzmjHkL52z0+iofmyu+LgmoxWe5OJIMpdLsjrTaX5JYO+EG/OFadgt0xUPi441L0l2AuzdiJAyzDzE+ufWZjBd5u2DxWm0z6kbJIwKzD98zUKiiV9q/PTFdWJ9ovdovlhpnwDm/DNOYQqhPK/7Rnl69a5B7eVlkoU22CpFangpHtkdISu2UNC8DygLru4XTH8DuNWfCxOG5d1evj+I/7x5cxCG8qOHLnBQlT/SYVVwAB0MybfMrbIeQfItjDfJ6PbhOs3D+kQLQuPxmrlvHXDU1YFbJvdE5uujtMu7PbohHrSrh8rbHKx3p5aY2IsRGvdMayaDf+nWAmzIxF7qU2/6ce6f8hFIm9WW05a4aWN+2fOrP7oMWpWseS759MxOP4bf+D3ca8y9XhM+1aZyWBkDBmyEZ/LI4MTsPTFFjs+T9e7hNKbE8GFaqRk71r7YRbrXKxKWYhEr/LNMdpQDYWK8MCUHwIRTtk0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199015)(36756003)(2906002)(38100700002)(5660300002)(8936002)(41300700001)(86362001)(31696002)(83380400001)(31686004)(54906003)(6916009)(4326008)(316002)(6486002)(66946007)(8676002)(2616005)(6512007)(66556008)(26005)(66476007)(186003)(478600001)(6506007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGoyZ0c5YmFoenNaVWJXekx2bUN6aldtczVyRUlNVDF3L3RmYUlnb1h1Kzl5?=
 =?utf-8?B?UzY5S0h5ZTNGVVg1WUl1Z3o5OWdnYVAxdXoycTJTSVpaYURWMkNpejJuVzQr?=
 =?utf-8?B?TjBmTjRFUFZObTR4U3c3YWpncmRTS2k0SjdhWjBTbjVJbEdaT05MV1lPS0xz?=
 =?utf-8?B?SEE1WFFBeDJ3U2p2Q3JUaThBSWVIcDJNVzl4RVlvK2l0N2s4ZVZzZXVRNTRU?=
 =?utf-8?B?WFQyN0VHQ3RLd01kOFpNVFNDeGd1aWFsMFFvTjRhVHI0c3FDRFBkZ3NUMEtu?=
 =?utf-8?B?TzFablZGajlVS3h0WFFab1lVMWxkVFBUZXZJa3FUTERMQlRjUkYrcyttWHB0?=
 =?utf-8?B?ZG5ub2xlRGV0WUxNZFdnbEhvd0Q1dzJXTEFKbk1pZjdnOWdjd2lFVXVCN2Rz?=
 =?utf-8?B?Z2J1Wnh3ekZjeWdBMTczTFd1SGk1L0tnMTZndkVaOVlVajVkaEFBRit3TGFE?=
 =?utf-8?B?RXRjVWluRFpMRDFHVnl4emREYkdXUkdxSksvRlFIT2owTmI2VS9QNHBCOEVs?=
 =?utf-8?B?VmlpZ1M4ekM1QVp2UDA2VkpMeVBwUkoyWVZZMTMvOUw2cnRmTmhMeXVBZ3dh?=
 =?utf-8?B?Syt4d2c1U0NMSndvK1Zwd0VqRU1rVG03L05aNnJJWGJnd0grK0ZWTm5JeXJ2?=
 =?utf-8?B?cnU4eTZEaDNxeS96OHBQWkZaZHJPWlpWeHZPS0oyUlNMRWRwbWdHWEFDdzBa?=
 =?utf-8?B?MWlCYm81cnVVQXBvUE9hZmxkak5FTlhsVlJBQWpBVkdSMGlTZHF6dmdTZ28w?=
 =?utf-8?B?dkhrWW43SHpMVUI5TlVIb2F6WDJaRjVVS1VKTWZTdk1qSmZBcDlUOGM3Nmgx?=
 =?utf-8?B?T2lzTjJVOU9kVHg3dG5Nako2UnpJckxjZmc1Vk1tM3NQemNpRXZYb2E4blll?=
 =?utf-8?B?ZE41MGZHVG9hblNCcnRFYVh0Rk1kN3drODZ1cFdmbyttMjMyNFVmay9EQ2VG?=
 =?utf-8?B?cVk2b2lPcjZHbzhwR0FoQU83aTJocFpXTWRWaDcvU0tDM0JwUWFOS29rVHhB?=
 =?utf-8?B?YTdzV3FDZXJjUkJ6L09NNDhJY1lCV0EwWGgwbVRCNTB1a2RTVkd4ZHVHbmF4?=
 =?utf-8?B?TVZJaElzVWIvZThlWENpYXAxdUVqeHZhUGc0c0w1aDF5Sk4xZS96d3JqNldn?=
 =?utf-8?B?VE5mbEZ5dmlVdGI1VHZtc1k3WGFwWG9iVlZLZWV3YUlSREQ1YTJFS2lTT2c2?=
 =?utf-8?B?SUpnaHRDWHhxRVh0N3djeEJVKzQ3SlBtdXFNdndMdWNjdEltODdZWitUd2xl?=
 =?utf-8?B?R2ppRld0OHVvbFVMQ09ISHU5ek8rSXJSZHFBZXd1V1ZGZEE2U2dwTGFET3A2?=
 =?utf-8?B?NGcwSFp0bmtnb3RKOTAzY3RpR2tVSUtRd1lHeUw0K2UzTmJBeFBWa3JsZTlN?=
 =?utf-8?B?QjY5NmsySVlSYXNLdWJMendDOUlMMDVQZ2xUcVFwbmpaQWVzL1dxMmgxWWVr?=
 =?utf-8?B?ZVYyYlc1MWhMQmJSQmtXNUhGbkVoNjVXa2NnQ0FuaHdNQ29uY05TK0NSYUxi?=
 =?utf-8?B?VU90c1FyU0tSQmRpWGF3NHR4dWpYUG4vdmFpMmhHeDNsNmtGRm5WYkZpbkx5?=
 =?utf-8?B?VFRqRFNQc0d3WDdTbEFqd2dmcVRDMkh6MmxjbFE2Q1NDU2FlTWZPaHFwbTBR?=
 =?utf-8?B?ZEhKT3hzUHhxUFpxcUEweHhtVjhvOTlJUWJKNG9aN3hVMGh2N0x6TU02QWZW?=
 =?utf-8?B?TUU1amp1ZXprNHVFM2pzRW5sYmFYcURhQmR0RDRNUEJxZlMrYU9YWk5CV0tG?=
 =?utf-8?B?MFVMQXJnTEtpenpERXV1eUFQbk51emlIUThqQmoxU3JhTlRkZDlMaFJScTNo?=
 =?utf-8?B?dThhMjdkS3RvQWhyYlRjSnFGTEhDYmYxK1N6TEJsNWVhYlpLdnV6QnFRdWpH?=
 =?utf-8?B?OGNWRzFxOWs4SG1hc1JpNk00K29vMmhwZk9nQkNrRVRZMVdHTDduWGwvNGE4?=
 =?utf-8?B?YTRwbS9Pb1JKNWFQVjNML2h3a3doRFZZMDZYU0tKcWduNTFoUlNNUnN2VmNN?=
 =?utf-8?B?MXh4MTdBV2h6ZzBoZHdhLzJDcWxXSzByWXZROFFnRGpYenJGbTc5ZVl4bWt6?=
 =?utf-8?B?Zm41S3k1c1l5aER3WVVHckZYVXdtd2NlK2dzVnM4REtqdWVJQ2xvTW5uYUFR?=
 =?utf-8?Q?iXnkO2Z+OMJaCSURAjNxHnEGr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf55397-deeb-45f8-a4ce-08dadd080f2f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 12:46:31.1853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vtuks8OPkZ5rfhufSey9fgWiyiORXM3g86lNwgPijJBCRoyAfrPfZjeIpvbu2fWgh6siNcyIikuL8y0hI6XmQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7124

On 13.12.2022 13:06, Julien Grall wrote:
> On 13/12/2022 11:38, Jan Beulich wrote:
>> All callers convert frame numbers (perhaps in turn derived from struct
>> page_info pointers) to an address, just for the function to convert it
>> back to a frame number (as the first step of paddr_to_pdx()). Replace
>> the function by mfn_to_nid() plus a page_to_nid() wrapper macro. Replace
>> call sites by the respectively most suitable one.
>>
>> While there also introduce a !NUMA stub, eliminating the need for Arm
>> (and potentially other ports) to carry one individually.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> At the top of free_heap_pages() mfn_to_nid() could also be used, since
>> the MFN is calculated immediately ahead. The choice of using
>> page_to_nid() (for now at least) was with the earlier patch's RFC in
>> mind, addressing of which may require to make mfn_to_nid() do weaker
>> checking than page_to_nid().
> 
> I haven't looked in details at the previous patch. However, I don't like 
> the idea of making mfn_to_nid() do weaker checking because this could 
> easily confuse the reader/developper.
> 
> If you want to use weaker check, then it would be better if a separate 
> helper is provided with a name reflecting its purpose.

Well, the purpose then still is the very same conversion, so the name
is quite appropriate. I don't view mfn_to_nid_bug_dont_look_very_closely()
(exaggerating) as very sensible a name.

>> --- a/xen/common/numa.c
>> +++ b/xen/common/numa.c
>> @@ -671,15 +671,15 @@ static void cf_check dump_numa(unsigned
>>   
>>       for_each_online_node ( i )
>>       {
>> -        paddr_t pa = pfn_to_paddr(node_start_pfn(i) + 1);
>> +        mfn_t mfn = _mfn(node_start_pfn(i) + 1);
>>   
>>           printk("NODE%u start->%lu size->%lu free->%lu\n",
>>                  i, node_start_pfn(i), node_spanned_pages(i),
>>                  avail_node_heap_pages(i));
>> -        /* Sanity check phys_to_nid() */
>> -        if ( phys_to_nid(pa) != i )
>> -            printk("phys_to_nid(%"PRIpaddr") -> %d should be %u\n",
>> -                   pa, phys_to_nid(pa), i);
>> +        /* Sanity check mfn_to_nid() */
>> +        if ( node_spanned_pages(i) && mfn_to_nid(mfn) != i )
> 
> 
>  From the commit message, I would have expected that we would only 
> replace phys_to_nid() with either mfn_to_nid() or page_to_nid(). 
> However, here you added node_spanned_pages(). Can you explain why?

Oh, indeed, I meant to say a word on this but then forgot. This
simply is because the adding of 1 to the start PFN (which by
itself is imo a little funny) makes it so that the printk()
inside the conditional would be certain to be called for an
empty (e.g. CPU-only) node.

Jan

