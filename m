Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8314C7313E0
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 11:31:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549486.858045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9jIU-0000Ar-3A; Thu, 15 Jun 2023 09:29:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549486.858045; Thu, 15 Jun 2023 09:29:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9jIU-00008t-05; Thu, 15 Jun 2023 09:29:42 +0000
Received: by outflank-mailman (input) for mailman id 549486;
 Thu, 15 Jun 2023 09:29:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v+p7=CD=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1q9jIR-00008l-HB
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 09:29:39 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 247c2d87-0b5f-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 11:29:37 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by PH7PR12MB5853.namprd12.prod.outlook.com (2603:10b6:510:1d4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Thu, 15 Jun
 2023 09:29:32 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6477.028; Thu, 15 Jun 2023
 09:29:32 +0000
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
X-Inumbo-ID: 247c2d87-0b5f-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cH86Y9T5uThPhHlekyI2rYKzhqQ+u7EPcrToVxJNyPaGW5Ot+YfoHlCh2EPhct+CPh1ecPQgdTzqLPHKw+hPE934jQn+zgR5v3ugpcPWP7ZGb3r7sDbW8cRZrjnClxbXIFJj7YFz07SwmyW1an7+RA8rHGCrRmRV4CW9zKdFFleaqPgtG9QyvRiQpraQ39GHNKqdJG5FQbNyiNpAT35kwa2I1Qh2Wd/ILFGumJiAsUyMkywvHQ4rEx9Smo7/rSzd19oJdD7EkoV4u2m7fivFK3pzMxSidrEdczXOhmbk/0lAbJm66ITimwMv7ilR66HUu17RHS2COIGmggM3KX+VOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9+hB91vdYIyh3ZL/5nCng+79saeOXjbX4b2GHDomPY=;
 b=J65e8fWyynq2HQRZtrZH3oDVW+Hc9c/IucsteM9EqUrYkh3lD2PsKAevERvIBJnmnAJJA173W3PYAQhm1/TxvPhMC99xJ+iOjx9Fs4SYEn40E6IYBaKC2o20xuwba55OF29LeCs7iotn+0G9BzYgCDhQQHROYP/uc9tV9hhYPikL6Z8lZWe58hv87zw58/RlFU3o49l3ruE7RTSFNifLjdd+4Vy7Rf77RUed4y28JIBGJ20za0TVxAMHFqQwYw0rEVNdNPwRSH2wgQTPkEhurA51yDz/wPm4x9Ygeq8pXbbWtmhsAP0tyy92KLjc4cwGfosevMSPkChNyAUvpJMBzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K9+hB91vdYIyh3ZL/5nCng+79saeOXjbX4b2GHDomPY=;
 b=fZ+PB7PGnRA4OuIqFO0M1u21BLW7ZwhEd+9dhyRRWt3eUSoWXEJlIbMsCs/uIPyShttzZCFRr+rTeJH1tFBHxeEhu57KpUkaeSdMRRJoUeskSo4lq+u09C4+nckZDTzm6hUB7a9JhW0M3cju4TNW7KcqPUJwZCD8deEPsYJ1/Q8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <35d0fd4a-4afe-6203-183b-d0a1f2f5d5ba@amd.com>
Date: Thu, 15 Jun 2023 10:29:24 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [XEN v8 1/5] xen/arm: p2m: Use the pa_range_info table to support
 ARM_32 and ARM_64
To: Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230602120754.23817-1-ayan.kumar.halder@amd.com>
 <20230602120754.23817-2-ayan.kumar.halder@amd.com>
 <c48d763b-4b58-69f1-4cce-2f9855aa8ee0@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <c48d763b-4b58-69f1-4cce-2f9855aa8ee0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0178.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::22) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|PH7PR12MB5853:EE_
X-MS-Office365-Filtering-Correlation-Id: 97ab3bbd-890e-4467-ada9-08db6d830636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VpBxhCYKHTjTgfNXu8gakFOVW14aibFPD3Q7QT+7kN4ptiXmlXKlpGn9zHcMe+lzs2wskGfalYiR6S8ffj1GV+dR7EjPEa0V6EsaLc1VRb3Ih7QpIvYzAOMoTyXAbK+ravQriqSVi/lg5ny3+IqKv+3iHJgkQWSDqGoS+NT4gi7SA97k6hSUVTQowaNFSOhjz/9WB95H1q/9/EoHXsV/fJ8pcT+rExuj1LZrY8CpeuiBjYSyHfe+WofYDYTNRII7rLiwhI3iynNuWQmbFQsE5+68WQGzbtJEtbT7sazw21ULhzPO+YRvxh7+bRJMBDpqbrUCPQxx5nuDUdx6ugE+3fVat9n6MDeJbrrZ0zFeDSyvr48xu0/tclWIIdUIcSQMAQVqtHboz4ppGsXzfirLNjKCsvEWe/ervEdgO8Q9YFMDO9hPrfFIHWPfliuKxlRKRPOr88aiKC+K5UodHjduvGD7Bz/hPcQ1e9OhM3jhXwN8rMHc1LLFmOkLzaNm3klQ1AAdhjLzuUN3F51YhcITVpbEDXiQsYOtYQcKeS1nHJ4IURTuzBAp+d1OJErrpK1tL5x0sydjOpM4u/ACBzQ20Z2xYM308CgRw+zfeD86a624SnKDAVVcxEWwhmcd1X5w2p9X1x7w4IsARLYN6VwJrw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(451199021)(8936002)(6486002)(26005)(8676002)(6512007)(41300700001)(478600001)(36756003)(66946007)(38100700002)(4326008)(66556008)(66476007)(316002)(110136005)(31696002)(6666004)(53546011)(6506007)(5660300002)(83380400001)(186003)(7416002)(2616005)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnU0SzBvRE1ZR2t6MW9zNExnOWt4NU9URXgxdERncVJxaUliczc0Vk9uSFJz?=
 =?utf-8?B?RDRISXRNV0RRNU1WcmUzaGZzZnJjeFpVd1VmbmlrL0ZsTFFaRDVPOVRhdEFY?=
 =?utf-8?B?bHJjVHBQd2pQaEtMRE1qUjREdzNqWkFuamR1MzVLT3VQZWxCUDIweGNjd2hG?=
 =?utf-8?B?bCsxVEZnNmI1bjFVZ0tJQ3VhUGxhcmVhQktFbkxFZFhvMUc0MjJPZURLV3NG?=
 =?utf-8?B?am5WR2VKR2FQTXAxQ2FZWmQwME9TblJrZEZjNVRkYmRGaUx6ckpHbmthVnc2?=
 =?utf-8?B?RVlsdEIxSG5xb21Bd1huWmwwakVYaldWekhseWljeDBQaGVGcmQxRk43bWI4?=
 =?utf-8?B?K040V3pWY0hDeTZVSTlOMjRsOSt5aFhsazBqOVV6NXVoYzQwcEpTay9Tem1i?=
 =?utf-8?B?enVtNFJJTVVJRGJYUlp3UWhkckF4dXlGdW42RHVKcU5yR21aM2didkdZd05v?=
 =?utf-8?B?QWwxQ2c1c1VJVHpGOTUzVk95NmIydGRibThEekl5aDgxSENWUTR5MHRwSmFE?=
 =?utf-8?B?V0pkSkFJL1dKS3FiS2VuNW9pcjErblNrb2ZENWRFWnlFc205L2hHbjcxM051?=
 =?utf-8?B?MlNQcjVlMWNPbFdFaFZqLzNLWWZXWmwyY2NCeE9mbkxFZko2THF3SUdXaFFE?=
 =?utf-8?B?c2ZRNnFnNW12dTlWT0xWS3IrWEszdDh3TGVpY2ZjSUR0Uzl6TE9WWkpFb3Qw?=
 =?utf-8?B?YlNITk91Qy9PWUFJQnh5UXNZdW1JaUVEdkxsbUMyb0ZKTzlTQUlvL2FvdHV0?=
 =?utf-8?B?ODRJVEFWQ2QrWm9Rdlg3Vno0VjIvTXFleWJ2VmVNa21DaENhcXVQZlBZY2Q0?=
 =?utf-8?B?UVpkNENVdTdlTElBUUhqaDNlUTZvU2xFdmtJRXgvSUFHYTNWQ01QaHhJT2RP?=
 =?utf-8?B?a0s5TTNBVitZSVZ5ZXdrS3dEUWppODFoYXNLRkJ2TWtld0tieW5aMWdscDNR?=
 =?utf-8?B?VFFTeTF4bTBudjNYZ0V3dHBTQVViaXpTZnFEdzA3L1cvUlFPbDNpc25mOHZt?=
 =?utf-8?B?NVNIK29SN1V5ZEJnTStTNUliZ0JPb2NuRmNZSk05WUxxZW1xVXdkNWRmMW15?=
 =?utf-8?B?alltcUoweUlrUno2amk5ZzdSQVZHYVFDaGNlOWd6WS83RlB0dE1EQzZ2VU5s?=
 =?utf-8?B?Q3JhREhhak1QdnZlT3plMDMwYlBBd01tVGpPeVk4cksvWWYySWJ4dTgyQ0F1?=
 =?utf-8?B?YzNKd1l5YUdkMFpLWXpzNGEyRVRyOThrdnl5WkladDZsYmF5dTM3SzZOaTFI?=
 =?utf-8?B?c0xVcnNTNFZpOVRnY3Z0MFRGYUloL2hWQ2loUkNwNU9tbTJ1V21USzFBczJi?=
 =?utf-8?B?dmJ6bS9hNld1N0Myc1YxUk9VcU1OMjJ4dWZsN09FV1k1VEVjNkVnNVVzOHlB?=
 =?utf-8?B?ZUpxMTRva0ttOTZoL3MyeUhXeXNGYk1zMTY3ejBMODYxMlc4WmR4MW5qT0hY?=
 =?utf-8?B?ZEZPQk12S0g0S2N3bGdWaUFiODFtTkI2QitUUWxKdkpwUjJ2VW14VnRwOGVU?=
 =?utf-8?B?cVQvSlcvUWZOY3lNMUh2elh5WC9SYnM3WlFwQUpUQS9sKzJmUmgzeG9Qc2xK?=
 =?utf-8?B?UkVCS2tSUUVzc0pSajJSaVAwVU5BY0dZWmZRMWZGdzlZSUs1WGJQYmNSb2pT?=
 =?utf-8?B?bjhKWFU3dmV3bWNuYWs1bng3dGpiSjBpUVVsVE5rS2NjcXRpUDdEZDRZaGhP?=
 =?utf-8?B?aEtDYXZXTEl4YTMwQzBrTTBZZ0VWQ2FOUE1CZjIzU2dhRk5SczlJcVgvOWJT?=
 =?utf-8?B?QnVNd2FFRWFOTUFYaW96eHVLcU53VXBRSkIra25uWUlDZHRCRVdoeFczd0xX?=
 =?utf-8?B?ZUx6R3hIblZjRTR1RUY1d09OZ0xhdXp6bVp5ZlFHTEF5eEt5Qk90UFdDSE1G?=
 =?utf-8?B?azVXeGcrcDJJVHFTV1UxTW00bGZGNGl2eWIwNWNwSEhKM1FmcXJocmU0a0VS?=
 =?utf-8?B?aC9iVjlXdkJOODNOcTFhZFRyalN6MzdKbXlMZTVBMTljVHo1ekFRaks5NWRU?=
 =?utf-8?B?bUs3bTBqU2pKR3lRYmh0RFViYVdORGppQlR0ZlRIdlNrNE4zazEzL3Fncnc2?=
 =?utf-8?B?MzFlTjZLV0F1YkMwRDdaLzNyMno0ZWtNd3lHMlZXeUlOWGdKdHpRb25kbEFp?=
 =?utf-8?Q?pSHel7ixr8A5TpPGid1TEqm0w?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97ab3bbd-890e-4467-ada9-08db6d830636
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 09:29:31.7370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cxoje+Z0whCnhoqg+AW0uzIw3l8l38dx4QgsBrri6a9F5y3eScj+q8KCK8mWa5qsKH5jtSLjx7VCR7CPA53Jyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5853


On 15/06/2023 09:05, Michal Orzel wrote:
> Hi Ayan,
Hi Michal,
>
> On 02/06/2023 14:07, Ayan Kumar Halder wrote:
>>
>> Restructure the code so that one can use pa_range_info[] table for both
>> ARM_32 as well as ARM_64.
> I grepped for ARM_{32,64} in our code base and could not find any use in source files except for things
> introduced by this commit. While I'm ok with it in a commit message I think for consistency we should be
> using arm32/arm64 in the code.

AFAIU, arm32/arm64 refers to the Architecture. ARM_32/ARM_64 refers to 
the configuration.

If you see the original code (xen/arch/arm/include/asm/p2m.h, 
xen/arch/arm/p2m.c)

ARM_32/ARM_64 has been used.

Thus, I used ARM_32/ARM_64 in this commit. Let me know if it makes sense.
The rest of your comments look sane to me.

- Ayan

>
>> Also, removed the hardcoding for P2M_ROOT_ORDER and P2M_ROOT_LEVEL as
>> p2m_root_order can be obtained from the pa_range_info[].root_order and
>> p2m_root_level can be obtained from pa_range_info[].sl0.
>>
>> Refer ARM DDI 0406C.d ID040418, B3-1345,
>> "Use of concatenated first-level translation tables
>>
>> ...However, a 40-bit input address range with a translation granularity of 4KB
>> requires a total of 28 bits of address resolution. Therefore, a stage 2
>> translation that supports a 40-bit input address range requires two concatenated
>> first-level translation tables,..."
>>
>> Thus, root-order is 1 for 40-bit IPA on ARM_32.
>>
>> Refer ARM DDI 0406C.d ID040418, B3-1348,
>>
>> "Determining the required first lookup level for stage 2 translations
>>
>> For a stage 2 translation, the output address range from the stage 1
>> translations determines the required input address range for the stage 2
>> translation. The permitted values of VTCR.SL0 are:
>>
>> 0b00 Stage 2 translation lookup must start at the second level.
>> 0b01 Stage 2 translation lookup must start at the first level.
>>
>> VTCR.T0SZ must indicate the required input address range. The size of the input
>> address region is 2^(32-T0SZ) bytes."
>>
>> Thus VTCR.SL0 = 1 (maximum value) and VTCR.T0SZ = -8 when the size of input
>> address region is 2^40 bytes.
>>
>> Thus, pa_range_info[].t0sz = 1 (VTCR.S) | 8 (VTCR.T0SZ) ie 11000b which is 24.
>>
>> VTCR.T0SZ, is bits [5:0] for ARM_64.
>> VTCR.T0SZ is bits [3:0] and S(sign extension), bit[4] for ARM_32.
>>
>> For this, we have used struct bitfields to convert pa_range_info[].t0sz to its
>> ARM_32 variant.
>>
>> pa_range_info[] is indexed by ID_AA64MMFR0_EL1.PARange which is present in Arm64
>> only. This is the reason we do not specify the indices for ARM_32. Also, we
>> duplicated the entry "{ 40,      24/*24*/,  1,          1 }" between ARM_64 and
>> ARM_32. This is done to avoid introducing extra #if-defs.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from -
>>
>> v3 - 1. New patch introduced in v4.
>> 2. Restructure the code such that pa_range_info[] is used both by ARM_32 as
>> well as ARM_64.
>>
>> v4 - 1. Removed the hardcoded definitions of P2M_ROOT_ORDER and P2M_ROOT_LEVEL.
>> The reason being root_order will not be always 1 (See the next patch).
>> 2. Updated the commit message to explain t0sz, sl0 and root_order values for
>> 32-bit IPA on Arm32.
>> 3. Some sanity fixes.
>>
>> v5 - pa_range_info is indexed by system_cpuinfo.mm64.pa_range. ie
>> when PARange is 0, the PA size is 32, 1 -> 36 and so on. So pa_range_info[] has
>> been updated accordingly.
>> For ARM_32 pa_range_info[0] = 0 and pa_range_info[1] = 0 as we do not support
>> 32-bit, 36-bit physical address range yet.
>>
>> v6 - 1. Added pa_range_info[] entries for ARM_32 without indices. Some entry
>> may be duplicated between ARM_64 and ARM_32.
>> 2. Recalculate p2m_ipa_bits for ARM_32 from T0SZ (similar to ARM_64).
>> 3. Introduced an union to reinterpret T0SZ bits between ARM_32 and ARM_64.
>>
>> v7 - 1. Used struct bifield instead of union to reinterpret T0SZ bits between
>> ARM_32 and ARM_64.
>> 2. Removed the invalid entry for ARM_32.
>>
>>   xen/arch/arm/include/asm/p2m.h |  6 ----
>>   xen/arch/arm/p2m.c             | 50 +++++++++++++++++++++++++---------
>>   2 files changed, 37 insertions(+), 19 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
>> index f67e9ddc72..940495d42b 100644
>> --- a/xen/arch/arm/include/asm/p2m.h
>> +++ b/xen/arch/arm/include/asm/p2m.h
>> @@ -14,16 +14,10 @@
>>   /* Holds the bit size of IPAs in p2m tables.  */
>>   extern unsigned int p2m_ipa_bits;
>>
>> -#ifdef CONFIG_ARM_64
>>   extern unsigned int p2m_root_order;
>>   extern unsigned int p2m_root_level;
>>   #define P2M_ROOT_ORDER    p2m_root_order
>>   #define P2M_ROOT_LEVEL p2m_root_level
>> -#else
>> -/* First level P2M is always 2 consecutive pages */
>> -#define P2M_ROOT_ORDER    1
>> -#define P2M_ROOT_LEVEL 1
>> -#endif
>>
>>   struct domain;
>>
>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>> index 418997843d..76388ba54b 100644
>> --- a/xen/arch/arm/p2m.c
>> +++ b/xen/arch/arm/p2m.c
>> @@ -19,9 +19,9 @@
>>
>>   #define INVALID_VMID 0 /* VMID 0 is reserved */
>>
>> -#ifdef CONFIG_ARM_64
>>   unsigned int __read_mostly p2m_root_order;
>>   unsigned int __read_mostly p2m_root_level;
>> +#ifdef CONFIG_ARM_64
>>   static unsigned int __read_mostly max_vmid = MAX_VMID_8_BIT;
>>   /* VMID is by default 8 bit width on AArch64 */
>>   #define MAX_VMID       max_vmid
>> @@ -2247,16 +2247,6 @@ void __init setup_virt_paging(void)
>>       /* Setup Stage 2 address translation */
>>       register_t val = VTCR_RES1|VTCR_SH0_IS|VTCR_ORGN0_WBWA|VTCR_IRGN0_WBWA;
>>
>> -#ifdef CONFIG_ARM_32
>> -    if ( p2m_ipa_bits < 40 )
>> -        panic("P2M: Not able to support %u-bit IPA at the moment\n",
>> -              p2m_ipa_bits);
>> -
>> -    printk("P2M: 40-bit IPA\n");
>> -    p2m_ipa_bits = 40;
>> -    val |= VTCR_T0SZ(0x18); /* 40 bit IPA */
>> -    val |= VTCR_SL0(0x1); /* P2M starts at first level */
>> -#else /* CONFIG_ARM_64 */
>>       static const struct {
>>           unsigned int pabits; /* Physical Address Size */
>>           unsigned int t0sz;   /* Desired T0SZ, minimum in comment */
>> @@ -2265,6 +2255,7 @@ void __init setup_virt_paging(void)
>>       } pa_range_info[] __initconst = {
>>           /* T0SZ minimum and SL0 maximum from ARM DDI 0487H.a Table D5-6 */
>>           /*      PA size, t0sz(min), root-order, sl0(max) */
>> +#ifdef CONFIG_ARM_64
>>           [0] = { 32,      32/*32*/,  0,          1 },
>>           [1] = { 36,      28/*28*/,  0,          1 },
>>           [2] = { 40,      24/*24*/,  1,          1 },
>> @@ -2273,11 +2264,28 @@ void __init setup_virt_paging(void)
>>           [5] = { 48,      16/*16*/,  0,          2 },
>>           [6] = { 52,      12/*12*/,  4,          2 },
>>           [7] = { 0 }  /* Invalid */
>> +#else
>> +        { 40,      24/*24*/,  1,          1 }
>> +#endif
>>       };
>>
>>       unsigned int i;
>>       unsigned int pa_range = 0x10; /* Larger than any possible value */
>>
>> +#ifdef CONFIG_ARM_32
>> +    /*
>> +     * Typecast pa_range_info[].t0sz into ARM_32 bit variant.
>> +     *
>> +     * VTCR.T0SZ is bits [3:0] and S(sign extension), bit[4] for ARM_32.
>> +     * Thus, pa_range_info[].t0sz is translated to its ARM_32 variant using
>> +     * struct bitfields.
>> +     */
>> +    struct
>> +    {
>> +        signed int val:5;
>> +    } t0sz_32;
>> +#else
>> +
> no need for this empty line
>
>>       /*
>>        * Restrict "p2m_ipa_bits" if needed. As P2M table is always configured
>>        * with IPA bits == PA bits, compare against "pabits".
>> @@ -2291,6 +2299,7 @@ void __init setup_virt_paging(void)
>>        */
>>       if ( system_cpuinfo.mm64.vmid_bits == MM64_VMID_16_BITS_SUPPORT )
>>           max_vmid = MAX_VMID_16_BIT;
>> +#endif
>>
>>       /* Choose suitable "pa_range" according to the resulted "p2m_ipa_bits". */
>>       for ( i = 0; i < ARRAY_SIZE(pa_range_info); i++ )
>> @@ -2304,26 +2313,41 @@ void __init setup_virt_paging(void)
>>
>>       /* pa_range is 4 bits but we don't support all modes */
> this comment makes sense really only on arm64 as it refers to PARange field of ID_AA64MMFR0_EL1.
>
>>       if ( pa_range >= ARRAY_SIZE(pa_range_info) || !pa_range_info[pa_range].pabits )
>> -        panic("Unknown encoding of ID_AA64MMFR0_EL1.PARange %x\n", pa_range);
>> +    {
>> +        /*
>> +         * In case of ARM_64, we do not support this encoding of
>> +         * ID_AA64MMFR0_EL1.PARange
>> +         */
>> +        panic("Unsupported value for p2m_ipa_bits = 0x%x\n", p2m_ipa_bits);
> NIT: Putting variable names in messages visible by users is not a great idea IMO.
> "Unsupported IPA size" would read better. Furthermore, I do not think printing IPA size in hex
> is beneficial. I would use "%u bits" (i.e. 32 bits reads better than 0x20 bits).
>
>> +    }
>>
>> +#ifdef CONFIG_ARM_64
>>       val |= VTCR_PS(pa_range);
>>       val |= VTCR_TG0_4K;
>>
>>       /* Set the VS bit only if 16 bit VMID is supported. */
>>       if ( MAX_VMID == MAX_VMID_16_BIT )
>>           val |= VTCR_VS;
>> +#endif
>> +
>>       val |= VTCR_SL0(pa_range_info[pa_range].sl0);
>>       val |= VTCR_T0SZ(pa_range_info[pa_range].t0sz);
>>
>>       p2m_root_order = pa_range_info[pa_range].root_order;
>>       p2m_root_level = 2 - pa_range_info[pa_range].sl0;
>> +
>> +#ifdef CONFIG_ARM_64
>>       p2m_ipa_bits = 64 - pa_range_info[pa_range].t0sz;
>> +#else
>> +    t0sz_32.val = pa_range_info[pa_range].t0sz;
>> +    p2m_ipa_bits = 32 - t0sz_32.val;
>> +#endif
>>
>>       printk("P2M: %d-bit IPA with %d-bit PA and %d-bit VMID\n",
>>              p2m_ipa_bits,
>>              pa_range_info[pa_range].pabits,
>>              ( MAX_VMID == MAX_VMID_16_BIT ) ? 16 : 8);
>> -#endif
>> +
>>       printk("P2M: %d levels with order-%d root, VTCR 0x%"PRIregister"\n",
>>              4 - P2M_ROOT_LEVEL, P2M_ROOT_ORDER, val);
>>
>> --
>> 2.17.1
>>
>>
> ~Michal

