Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB8F758F53
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 09:42:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565611.883901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM1pD-0001ni-Kq; Wed, 19 Jul 2023 07:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565611.883901; Wed, 19 Jul 2023 07:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM1pD-0001m0-HA; Wed, 19 Jul 2023 07:42:19 +0000
Received: by outflank-mailman (input) for mailman id 565611;
 Wed, 19 Jul 2023 07:42:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qM1pC-0001ls-Ah
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 07:42:18 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8c040e7-2607-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 09:42:17 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7205.eurprd04.prod.outlook.com (2603:10a6:10:1b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 19 Jul
 2023 07:42:15 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 07:42:15 +0000
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
X-Inumbo-ID: c8c040e7-2607-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Agqbb5QOojnV0ChjlFOxTgaVAFPHGyToCxn1z2N12DimVDjJdgwLgJ0E3smf/wBFwLIcYALArOkEmD25axi8vVtzMggTvUZd2ifM+DFNaUr/XB7eo3rOmdT/uWO4mFLAiwmf3T/3UlkbCibLboYMlDz4Aj2TZX/GcXYx2GlL+hMj10CHUZ5+VE/IXPsEcRApmFEyt8EagTU2oyU8EPq3ItMcrtDGOhMYQ9dQNNOE7spYtYB6ezEaTVV1GUHQ+8A6d4RbE7AHiE0QqBBxIfk3NTYatM1Sr5Fgbj/4YK1zD1Tr5tw6S+aS4atkK/8SGVyOj8wz/LAZ8xfVHWsgtduwHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=urAS2YzNoRjBY+LetuLyMk9uUgsXBHqnXDX79SaomeE=;
 b=HHWMQ+Ncbfk5nXUJv7QeW59vYMl+gJOsJiC0rsdJrEqauGSsN5WqOw4MBfW9e2Vmv9vGD9koLJ+km0NMxcJilAPN6Ehqoy+nnk732u3WbOs5S7ubFt3sRBXECdWOz4yr3HC+jUl2AoF/eaEr7/Uh1tgrYGcmXdLAdYgUA81PpjZ/6wi1nEozaNCRFUaIqcdd//aP3EUHSfVSPhhkM5zeleNtjANPZGp4zEmmmNVB9q8/4OU1pGGDiLElkZrdt02jWLvYG4v2gA3Wlv3AfNgaGMS5zvn/8e093Xyo8+z0NBIzkI5jfMMS+KFH8qSbcARY5VN2iv2VstzYMpgnddVM+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=urAS2YzNoRjBY+LetuLyMk9uUgsXBHqnXDX79SaomeE=;
 b=S0Qn5THzTWLb9acK4CMEfke967uIPGBrv2RA9/zFoQ8Mu8i3sRYmTlhDJ0YF1b226faU8rsJJQnaFuhFRO6gQh2WlAYqUG8ZH8CzOmmyxuPw4Rjvx6ltX+sYG+IOVJYJ2mMOa0e+Znxmkn8KPXoPUCQAoCJ4tafWI4BYPkLKErg93QFsDhZoQJfQYmkDU+YLPvDLtfSxwr9GOAt4ON1n1W4L6Qu6RD7qXa/P1JEWHN+gCLFwBMEM8bD3c1gPPos+i5iVzFonfT0BT8hbusuSwYB7lBz/YxgZV5Lh3NhM5JgPnb2QbJuuDwupMOtIGNuWkXFSMVHrY8i1YeeEpDDnrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2a86cbbd-ef8f-10d4-e2d5-e806dbaac18c@suse.com>
Date: Wed, 19 Jul 2023 09:42:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/3] xen/arm: make has_vpci depend on CONFIG_HAS_VPCI
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Artem Mygaiev <artem_mygaiev@epam.com>, Rahul Singh <rahul.singh@arm.com>,
 xen-devel@lists.xenproject.org
References: <20230707014754.51333-1-stewart.hildebrand@amd.com>
 <20230707014754.51333-3-stewart.hildebrand@amd.com>
 <0dcbc190-2719-6c1d-55d1-4b229dc32e05@suse.com>
 <a90a2858-c2ea-624b-8095-2e2976e1b34a@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a90a2858-c2ea-624b-8095-2e2976e1b34a@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0151.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7205:EE_
X-MS-Office365-Filtering-Correlation-Id: 03c49ba4-6a48-4023-1c03-08db882babdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yCQvUU8ux5T2hstoZub85LRSCO22ZAp1bXHNGo5X3pa+FYfzbCquxe4LEoK5kqzVYuJF4JSC5fGsvmZ64DHxflT6tkhPSPDEktXtf3+wwXsrEB7Cttyoeco+abDZJKN0XnmoWF4/eazU35xc2eNrMFbxIXaBW//xx1WaNSOdMZCVC5Ls9NUeey92FKud+EGvO53ZNqeMl8kkewN60dbZJDDfJLKyzTayexIOBXJ4L8RDAiuDvdDo/3ToDzARiembVX6bYGHZDqj6eNTVZE3M7hgPk3X1coBVdvD8bPMZbR05tsK1zYVBLv8HSEowSsZaEN3ZdalBAdrKsyv1usPKGfXa80xLs81qEfRWAbMIP/dC5Em9ycd4rogseJQhnahc5h9WAuNC0J/eq3DYgFhgz81homsTyHLeGzsL0+UjR5uLQcW6VX5uC5Nzlewu7HlnGsaebs702syjsXkus2w+RFfQBYpTBL45s7qmp+afQnfZ1g498eMwZ8jYo04M7xKew+unvY83BFPGg9DAI26wL8ICtmNwNTATOyhI7wX805Js7csSeFNCcPKiIcPiy2gvUs7SK/+d8tUwkqMSw/5ShiRfQwvdfoF5YVax3vaG+sSGT8UId87uSmBeXcuBLPSgOQRSmMi5r9mCwMwcbd2sBQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199021)(41300700001)(8936002)(31686004)(8676002)(316002)(5660300002)(54906003)(2906002)(478600001)(66476007)(6916009)(66946007)(66556008)(7416002)(4326008)(966005)(6512007)(6506007)(53546011)(26005)(6486002)(2616005)(38100700002)(186003)(83380400001)(36756003)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFJyQUp0bk4vUkJPN1cxblozN2RjZFNDL0k5akdMTWV2WWNQZzRmOEVMSFMr?=
 =?utf-8?B?a2UxYkVEVEJDZlRHWTkxZ2MzMmxkcjR2NllhbkZJN1BEY29aWTRIUURqK2o1?=
 =?utf-8?B?c0dtY3p3MTRZVENDaXo2K3V6bmhpK01HZjlvaWh2cm90NmUvbkVBbWNzbk54?=
 =?utf-8?B?SDl1SjRVQnFWR1dTL01WaFhMVE1BS0NVczcvZGdSMTA4bmg2UkN0dWhGRTdz?=
 =?utf-8?B?TDNBVkE4V0J6M283VEFXVWtUbkY1WERnQkgvczhVR0hyYTVicVhWdnBiSTEz?=
 =?utf-8?B?S0lPeUdmbk1nTHhsb1VJSktPY2JRT1JObkxHRCtvK0o0d3d2WGl0OWhKNVdM?=
 =?utf-8?B?bk5zaWVDUG1MMzRDM3pSTzJNbjJ4U29QWmM0Q1FSUXBzbVdydHFIeWQrc09T?=
 =?utf-8?B?eDBpdGdvTnlEeC9JSC9NeHdRNTNZUDdpN2hTVkV1cEYxZmNLc0RqelZNcTVB?=
 =?utf-8?B?eW1UTm1lWkZmR0k5dXdJeThEcEhVa3NURHV6bDRBdHZnZUhtYWlzWDlDYjEr?=
 =?utf-8?B?UlFHVTQ0eFoyUXdOR2p0UGRCZ0llQ2h5ZjVyK3JiRGorbDVlMTMxc3pISVBM?=
 =?utf-8?B?NExhZWc0QnY3cnJwL0hxamdvWEkxekFDSStoNklFdjFma29OTURuVi9SN3Fx?=
 =?utf-8?B?bkNQQjIvTlpJSnF1eTExYXFvSGhTend3S3JXaUsxb29XSjJoQjh5NjAySHRU?=
 =?utf-8?B?VE55MWZZTzVDSTVCL1EzUUhOZ1hValZxcnUrd0cvc295R0dYQ2xvOElZZzdm?=
 =?utf-8?B?eDNjOUxNbjM2VVNRWjhOM2R4RnMzRXo0TkZqL014VmZWbUZTRVlYVFdBWUYw?=
 =?utf-8?B?ek9lbUJzaTNPbFZuQjQ4RWxBNHpYdVpWZmxvS09sWG9rSW9BbzgzK3lielFX?=
 =?utf-8?B?cjYydis4Vk1YWXZ1Mnp5RVNvTmxMaHBNZUJwNkt4dDFoV2xOUUM2S0RhM2RC?=
 =?utf-8?B?anRDTFh4eWYrb2wwRG9md0VSZDUxc24zNVZraTgvNkVlZ21GSGNyekIraDE0?=
 =?utf-8?B?UTFDNFlGRGZWS2llLzdZWDZZNHFVUHVkRGt6dVRleExCMVlXZHZLVVpDS3VH?=
 =?utf-8?B?RWVDVm8wUk82MTF6K2xKaElyM2p3TWFtMDFVeXhZRmlCZ3ZxLzFhWlpMb1hW?=
 =?utf-8?B?dWVPdzNaNHJzUCt3am1kVUgzTjUzNDZ4VlU2T250WnZvN3lWbklya3JibVo4?=
 =?utf-8?B?NUtNNmU1YkNZOHJGTnhLTnlXdVUxMVlJaGlpQWtnd3pyR0Y4Q1Z3WHBQZFhC?=
 =?utf-8?B?L0dmekhGbURxVEdPQmQ3OWpDVDQzRTlkVmcyZUZLcFpZL1cwcEFDQjlnM0lF?=
 =?utf-8?B?d3BmdGhSYjFPSncwSGE0VkJsT0dkeDlBWHNKWFpTaFFQdVlSaXI5bWM5czVk?=
 =?utf-8?B?V1NnVk03ZUJRT2grTXlDaHRhbkkrRkM3ZzFoTXdTMlZnTmtjVUVteWQ2dUo5?=
 =?utf-8?B?WDlzdS9pZU1wbERkcWxwNDNkTjU1WVc2QzVXZDhDZzFOVS9BbFJXRmdIWDhP?=
 =?utf-8?B?MUZYYlU4L084eCtlekd5Zmp2dXpLWG1tNXNWUHI5bDVHS2FRN1JrRjdGaHk5?=
 =?utf-8?B?UVBCL05kdFpqb0pMUDlYUERha0tvSWVHaFhyNlQ3cFU5NVJ4QVNkQVdrMGo1?=
 =?utf-8?B?OFVzTjcxUDhVakRGMlFuVGRuWEJIeURCcE9sUG9tUGZsdjhvVUxSc1FJSzA1?=
 =?utf-8?B?UmtKQW5NSzlISUtFcHJsbEFUSkswS0kyWjJUYytaalpzbnQzR0gyVENvcDlF?=
 =?utf-8?B?d0RtRmJIR29DOU9iTm5paW81QlJDTmIrZ2MrRjdobnVZTWc0ckVtcGowSGJq?=
 =?utf-8?B?Z2NyNTFKMHhIc2FlQlVFbVZsNkgzdjZaS0VTTExXOEVFNlA2VktYUUUvYVRM?=
 =?utf-8?B?R3gvY1hXcXVMdHUzYkF6SStyc1NZM0N3ajRIVkNhT0FKQWRucU1aaGJTUnFj?=
 =?utf-8?B?Vm4yRUx2L1JSMEtFMzRvc3RGL3ptT0hyMWUyM3ZYRTBvbTJFN2k5b0F2T012?=
 =?utf-8?B?Q2ZRTS92QWg0Y2NsYXVxOUJlTDVNNVljOFJmcWdCWWNOZkZ2R2VqZkFtVklW?=
 =?utf-8?B?L2o4NWlVQXhsdTEvYTA0RVhYa1V4UnNBMUFvTFpPVkMycWxmYW1JampPZ2o0?=
 =?utf-8?Q?HXrg5oVX9Xj/Iw7XqE3QrSxsW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c49ba4-6a48-4023-1c03-08db882babdc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 07:42:15.2752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qffZENesh5w8It0yxe6IZ5W9KdqLD9oqxa/sBdM9HNpQmb+wFtfQsxFsI4+7K8ZKEQrWas9LYNZCETWQ2vMFlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7205

On 18.07.2023 19:01, Stewart Hildebrand wrote:
> On 7/7/23 02:59, Jan Beulich wrote:
>> On 07.07.2023 03:47, Stewart Hildebrand wrote:
>>> --- a/xen/arch/arm/include/asm/domain.h
>>> +++ b/xen/arch/arm/include/asm/domain.h
>>> @@ -298,8 +298,7 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
>>>
>>>  #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
>>>
>>> -/* vPCI is not available on Arm */
>>> -#define has_vpci(d)    ({ (void)(d); false; })
>>> +#define has_vpci(d) ({ IS_ENABLED(CONFIG_HAS_VPCI) && is_hardware_domain(d); })
>>
>> While likely not much of a problem here, I think we should strive to
>> write macros such that their arguments are evaluated exactly once in
>> all cases (for side effects to occur exactly once). When that's not
>> easily possible, so be it, but here it doesn't look problematic to
>> swap both sides of the &&.
> 
> Thanks for pointing this out. Hmm... I'm considering turning it into a static inline function. This would also satisfy MISRA C:2012 Dir 4.9: "A function should be used in preference to a function-like macro where they are interchangeable" [1].

I don't think that'll work prior to us splitting type definitions into
separate headers. You simply cannot deref d at this point (or in fact at
any point within this header), as struct domain hasn't been defined yet.

Jan

> [1] https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_09.c


