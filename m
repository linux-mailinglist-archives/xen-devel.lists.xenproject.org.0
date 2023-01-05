Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0C265F162
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 17:47:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472087.732209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDTOT-0004rV-6A; Thu, 05 Jan 2023 16:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472087.732209; Thu, 05 Jan 2023 16:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDTOT-0004p7-3D; Thu, 05 Jan 2023 16:47:05 +0000
Received: by outflank-mailman (input) for mailman id 472087;
 Thu, 05 Jan 2023 16:47:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lIpW=5C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pDTOR-0004oy-QN
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 16:47:03 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2044.outbound.protection.outlook.com [40.107.6.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93fde1ec-8d18-11ed-91b6-6bf2151ebd3b;
 Thu, 05 Jan 2023 17:47:02 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7801.eurprd04.prod.outlook.com (2603:10a6:10:1eb::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 16:46:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 16:46:59 +0000
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
X-Inumbo-ID: 93fde1ec-8d18-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fyFAUSgsOH+zDOkh4CLbEMJmVcXFjXCYwnAzUm1vNxoTmmyqSQ6x22x4CVQqCnk3ouFVvhy0cDME3uWMixHhCNLaFt8NH1dFwqPbl87TipA7ijO6hW/CI5q5QyUVjZr6o60m1AHhW/rbbHbF1T5v8im70Cvjl86MjQD/7PV3yR2T318CzbpupVGaY9nml2aRtISUyqqmsJed1EtPb40btBCKI/sOR56LPVIdPyvMfWxV/KlWOWUfsCOmxysTjMkHS9bXzWotHOS4U/bGvpT7eHdpu5b6+xDNbNQwWXUOPwffwGpHMUoujy8GAgXiYjRwoJwGDxlZHuCQvqBjPGuPtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcGuQU1bGC5b9LD2CPTGRvx/D0t7v/48EG45UhsDssI=;
 b=EYJGaclsZu9VvnjzuYRqetiU4sJlx4UhnljHDgi8uwvVuVEUlcJZSzYLlyGgaj7NRrLt9L1ICN7ZIGyKHEqwhzDu1K1De28DsXB4u1MQK3bbCQddPdZ8io9DA2kAaolXlMi0RA3ee/fnyEqdU4D1MMDrPBjpMwoQNUMsvNImnHvXFEeJZ0o/BowyFeL7tl3Ork8DBkUbFNYBlEuvS3rvIXcpz58Ja1Cim5jGVh4cKGpUgFAD43Xz1mER413SzY1csUU0DFR8otorO91BEa7T7ElYBfq5yI987JxZicCdWexKMjnVz8WyMMizJpyADSrmadJAjNVQ3bVlRRH+I/RmXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcGuQU1bGC5b9LD2CPTGRvx/D0t7v/48EG45UhsDssI=;
 b=PVtTdxnirIoMYiH0CKO7EX+xjWYZFQ3yRGQnWOO+0W76WAvXzs0YfeNVqvTTzt6Nn2++o5OKwBT2k8cctU9HkJ0nUoJpidoyAyL+iNRDgdCTuGRAkXJTTE7M7ugz2pZrf4T7VLDzZLTO6HsZhUQ3MG4CtkTS441F0YdonOVidTtC+d5B0y1rIGpF0ENUwWD9c4iwwvSk1NfwQ76lwXRM6qtOHTFPDAZTkuG+CvJMWcMdBpggb6KcaYj2f1YZib1hf7xIHvmkHfwjw30CsHzk1imtVkB/qh5FZJ5GMmXfx59moOot9W4iQDI2lpNMqUm4IJKaKNONAfRTRa5NwKSQ3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <84a96972-3c41-ec94-3513-9944467d9e1c@suse.com>
Date: Thu, 5 Jan 2023 17:46:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 13/22] xen/x86: Add support for the PMAP
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-14-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221216114853.8227-14-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7801:EE_
X-MS-Office365-Filtering-Correlation-Id: c792d951-9630-4f99-1317-08daef3c768e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	msvgdgstWuvw1g4ocUHhX6Yi53k+MY0tvxYieSI8DYP9uD4WR1kA7fkWjQyMobP+UHB1bft4lb41MMhWaUFJORQTf1d8woFo4okqoHSd7Pap8Qx3tqICH7NJr+c9AqcVR3Ijv/4gq/JlHPwPzhLk72FIL8J7OVU+0N0ifYVM/XTc4yKFwVblCaSasOIfD5jER8TXLsC5gui5bIwLmfanNjZJGzRD6ncSq9EFKzXoGG5N+Ez1Aqvy3OZUR+qkG2Xtao66YHBLL6TuVkEJD5i0mNUOuencs+rVStYkdqLi/zgpsLqaoQQLC6by6axg7M5Y44/HM6+tQzOiOP8dwLTLMfsMxW9rBzENeiAk7TyabYYjXr+OQ2pdmx6C7GbBUDqYY8PNkyqCQ6Jhc8H7LmXQRJrgEjoUPhALBtm4Zv+OBu0qLgBuG/Y5Q6vLvb5DBwDGsUDVSOyKabNbfj5PtOPY/Rif6omjb6rSNQao7nQnoSJs/w2fwIysBktgtpUG7PfC29BJkGiAXCgBegMa3ods5wMP8RDeaROKybAq3v/frmFbjlP7dUcKzn8yGcdb9Rsp1wtSRQ/p7nW4l94A58jUcv9yFSPt8A6uuL3Qpm/Feyx6/PTAs32XJ3E206LSaM/RjWyO5/Gjr9D+mJ3Ch37z/r0NaQk/NT9UZsW1i+27wXozgkrDyHmNqp+MCtrEB7Wp8+2GGMq4NQPqDtg3ZgxCn4A2Zjo5tPPqli6HaD0dr8+xbSEnmiwJ0aXG63dUr6s/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(39860400002)(396003)(346002)(376002)(451199015)(41300700001)(83380400001)(31686004)(2906002)(5660300002)(4326008)(66476007)(66556008)(66946007)(8676002)(8936002)(38100700002)(31696002)(2616005)(478600001)(316002)(6916009)(36756003)(6486002)(53546011)(54906003)(6506007)(186003)(86362001)(26005)(6512007)(45980500001)(43740500002)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWZrb0EyaG8zNEF2WTdaT1hTcEtHQmdpSTVzM3RRM243eVJVaS9YZk9NOUUw?=
 =?utf-8?B?MDZNeXRDRjNVeExyQ01ESWc3Q0hzZjN6RzduWVRQYnJzZmNJbFgyakFQN0pZ?=
 =?utf-8?B?LzdGM21vc0Z6Ty9LOS9DYzYxK2hwc2VUOGVpTGpDL29iemY0Y212elgrMzFR?=
 =?utf-8?B?dDY2djVwOVBIa24ralhJUUNQNlFWTExoeVh0WlR1M1RWLyt1OGxOeFJPL0xr?=
 =?utf-8?B?VWpDcVA1U2dsMXV5YXRHWGxPWklZQnlVM0xmQlFYcGUyK2t0UnJudGJkY0Jr?=
 =?utf-8?B?eERyam9jOUkwUnc2Z1BPaXhSa2c0UzIrSUdWZ0FUZ0RoK2wzV05CM0s5RUtR?=
 =?utf-8?B?L0Z2dVRPOGZVTUZ6ZmY2eGtHK29ITTBMVFpKQWo3bzduT2ttQkRXK0xnVkw3?=
 =?utf-8?B?STdFVDFSSWJ6MTF4UVpPT2ZaNWdteU5KU0V5Vkx4Q0tsUmY5K1M0d2RFUFNM?=
 =?utf-8?B?SW9HTENFUmZnWnNrVC8vaitsNlhwRHBwWWVPWFh1aUUrNFJYN2F2UlNDUmZQ?=
 =?utf-8?B?d3lMTjg2dEdrUDdaMkFCYkM0Ry96dWFuTXhYZG0vOVh4cFkyVzhxNmN6MWRY?=
 =?utf-8?B?MFkxb3Vaa3RBQWpRWTJnUW8yeU1iSWI1bWhSandGZmFxSFJaWHhIQjByZkQ2?=
 =?utf-8?B?VGE1OUQrdnVPSGVzcGc4SFo1aTBxOEMyU04vclM1bFBRU1JaUFo4bVBxaFpr?=
 =?utf-8?B?Mjd5K2hoOHFFQnIzOUN0UUlSdHFIcitYcU9RMitxNnpJbUc5UVlvVXMwdWNL?=
 =?utf-8?B?UW1wSEJMeitMS2M2djFYODBGR200UFU5MUhrT2tsb1F0bW1nOHAyMzdLSEdm?=
 =?utf-8?B?anNCRWx1WmVvaVU2bVZHeEdUY2VWMjltbGRFelNxK2VFTkRDV2lhLzJ6L1Fz?=
 =?utf-8?B?MU9YZXdydTVqK0VScnJFSnBXeGRiQ25maHEvSUtjTmc3bGVLM1Aza1RXOXp2?=
 =?utf-8?B?emJpdDN2bGZuUGZEd29qb1NRTXVDSkp4OE9NUlNlOGw3VFkxTXFWTXNzczNZ?=
 =?utf-8?B?c2F1TXR1dGlveWVIN0dObHZWRDdRMkI0YUM5SU9UdTVSNDhVQjlZc3FFSEU4?=
 =?utf-8?B?S09vaFBCdEtPdkcrbVpZZmU3YUZ6aWFkbUEwbDdhWHdEMGU4QnpaYmpPZ2Z0?=
 =?utf-8?B?UEZ0WkxvbjZtb1prOWNnYVJ6SGVtYUREUHF0VnNrV3lIZzh5TkZUZU43K0pW?=
 =?utf-8?B?aVlsZ1h5V1VpeHV1cmpOYi8rYzdoV3ZwZUFyVXpEYUJlQUxoNHlGek1TeG8v?=
 =?utf-8?B?YmFKbUdBdXpveXBtYTRsTWVRR2xtdEp5MGZsY09IMVUvNkRkREtjRWVXOWpC?=
 =?utf-8?B?bVAvaWtwMzVkZEpPZlNsRlFBcjdPLzZvNm1ONVZCcjF4SUI0a2o5MktLeGpt?=
 =?utf-8?B?WGZDTExvcGtPZTljbFJqckVmSUtnQnpLMGVJVFArUWszbG1VeFgzdGFzeTIv?=
 =?utf-8?B?UkhkMkh5R1FLTWMybnp5c3JmblR6K0VoN0JpRDhxMXVjUDhmU0RrR2R4ZFln?=
 =?utf-8?B?bWxiNmlPbmlkN2FLN3Q4ZVVqMzdIaUZGYTNoQjJhYmR1U21zYzYvMUFwUjJl?=
 =?utf-8?B?NkRwZ0tWVzNOMXZsS1Y3alg1ZGJlbGtVU1lzbEEwMjBPa0I2Uy82T1JISXVs?=
 =?utf-8?B?V3VrUXMwMGpjeDhkbCtzRW1GYXpuenZuUXorNGsyeFFuZmtWeUF4QjFSa3Fz?=
 =?utf-8?B?MUEyR0NPT2Z6eW40SGpMeHV1bC9Pd3Iyb3hBWU04LytYSnllN0szNGJ5eDBU?=
 =?utf-8?B?RDRteFRkWHh4M2JGVllOQkFhY0VpV2E4aDMrWll6V0lCT2J2ZlpmZGlOMXAy?=
 =?utf-8?B?MSt5d25uM0hsalNVdTFETEEvejlISjJmdFAzTVlNbnk5SFh4cGZzaUlYeUxT?=
 =?utf-8?B?V2N3ZHE5NjAvbXRPcmRnOFJNc3F0ZHFMbEFoN3VtU2tXUE9oZ2Zyb0NGUU5q?=
 =?utf-8?B?ZHY3K3NheHhyb0xqM29QbWJpT1JwWHBWdjFnaUtiTm1Nb2I2V0RZUWtMOEZT?=
 =?utf-8?B?NVBkcWdxRm9sbFdFaXdVakhqVERxMnltYXpyR0NvZmZDMUpwY21UR2ZRSHZY?=
 =?utf-8?B?aURMQ3E3Wi92RG1yT1pmYXFlT1JLK1VJaDVDYjJWTUR1N0g2bW01UTNGcXRP?=
 =?utf-8?Q?BkaLzuenbNaTdz0GLYUjgAuE6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c792d951-9630-4f99-1317-08daef3c768e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 16:46:59.4007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VSjo84KHjVES13ybKNrfkO98Uka8BlRUk5K7bMCctnw/MxZIvuuGpMaozNlNoncG8crbPe1hkCCojKv6FciMHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7801

On 16.12.2022 12:48, Julien Grall wrote:
> PMAP will be used in a follow-up patch to bootstap map domain
> page infrastructure -- we need some way to map pages to setup the
> mapcache without a direct map.

But this isn't going to be needed overly early then, seeing that ...

> --- a/xen/arch/x86/include/asm/fixmap.h
> +++ b/xen/arch/x86/include/asm/fixmap.h
> @@ -21,6 +21,8 @@
>  
>  #include <xen/acpi.h>
>  #include <xen/pfn.h>
> +#include <xen/pmap.h>
> +
>  #include <asm/apicdef.h>
>  #include <asm/msi.h>
>  #include <acpi/apei.h>
> @@ -54,6 +56,8 @@ enum fixed_addresses {
>      FIX_XEN_SHARED_INFO,
>  #endif /* CONFIG_XEN_GUEST */
>      /* Everything else should go further down. */
> +    FIX_PMAP_BEGIN,
> +    FIX_PMAP_END = FIX_PMAP_BEGIN + NUM_FIX_PMAP,

... you've inserted the new entries after the respective comment? Is
there a reason you don't insert farther towards the end of this
enumeration?

> --- /dev/null
> +++ b/xen/arch/x86/include/asm/pmap.h
> @@ -0,0 +1,25 @@
> +#ifndef __ASM_PMAP_H__
> +#define __ASM_PMAP_H__
> +
> +#include <asm/fixmap.h>
> +
> +static inline void arch_pmap_map(unsigned int slot, mfn_t mfn)
> +{
> +    unsigned long linear = (unsigned long)fix_to_virt(slot);
> +    l1_pgentry_t *pl1e = &l1_fixmap[l1_table_offset(linear)];
> +
> +    ASSERT(!(l1e_get_flags(*pl1e) & _PAGE_PRESENT));
> +
> +    l1e_write_atomic(pl1e, l1e_from_mfn(mfn, PAGE_HYPERVISOR));
> +}
> +
> +static inline void arch_pmap_unmap(unsigned int slot)
> +{
> +    unsigned long linear = (unsigned long)fix_to_virt(slot);
> +    l1_pgentry_t *pl1e = &l1_fixmap[l1_table_offset(linear)];
> +
> +    l1e_write_atomic(pl1e, l1e_empty());
> +    flush_tlb_one_local(linear);
> +}

You're effectively open-coding {set,clear}_fixmap(), just without
the L1 table allocation (should such be necessary). If you depend
on using the build-time L1 table, then you need to move your
entries ahead of said comment. But independent of that you want
to either use the existing macros / functions, or explain why you
can't.

Jan

