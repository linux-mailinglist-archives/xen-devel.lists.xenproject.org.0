Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 465446FF0A7
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 13:47:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533270.829784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px4ke-0001SV-01; Thu, 11 May 2023 11:46:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533270.829784; Thu, 11 May 2023 11:46:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px4kd-0001P9-SJ; Thu, 11 May 2023 11:46:27 +0000
Received: by outflank-mailman (input) for mailman id 533270;
 Thu, 11 May 2023 11:46:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DXxA=BA=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1px4kc-0001P1-DR
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 11:46:26 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e83::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73416516-eff1-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 13:46:23 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by SJ0PR12MB6990.namprd12.prod.outlook.com (2603:10b6:a03:449::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.29; Thu, 11 May
 2023 11:46:13 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::ef8d:bf8a:d296:ec2c]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::ef8d:bf8a:d296:ec2c%7]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 11:46:13 +0000
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
X-Inumbo-ID: 73416516-eff1-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dOmxBFx+9O/X2BjuhUYLcc1pcE0O09o7YYacjI8LjQxBhtX8IDeReRFy16MkWQWU8F2ZKLkc9a3bqorMum0P+vRsSD0To/FuXeGcXCmT4XWx3kSjxKgDneHXr7+Y6peIT3b+AnPDgsTiAlst4qjYHUnz5IATONfK+Pj5TOuHwgJqibhCamJWARAZx7C2kMKKWuN8t1aSJe2N2ssUCR6H3VqkXl75/18GR41kyFTrGKzyofrEK2+05rlks/MXVElexD3FIvo08jwSw0nnu+jUVhVci2U2If0QlbJXl11gpWBSX0WudHcFnJac3GOyFaP2QD4GwofAuI5SkrgBjHEnGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3L93PlTDNF/+ZVKt9KlAsKMqQwonQfUPGmZBB3GjyjY=;
 b=aIEGJdwZI4SneVPzwjr3+cCq2h3iYT7jXNZUF0z+qAeo+UzrTsWqhEWe8IlxnMnXDVLgiQw/37kgqruWdc9YKYKIwghKl61yT+SC3om3hS+ITWbOqYQz1kZ/FVAoZI8c8HL9yA8PjRHu6xnZaT1lnU5dGcEJlxWpbPX+V3MEbP7eSYPePa//hErfcVVuHh+gSq3/OnKucD4X+AvNhZ3JYYuBrA82FcOFFrSlMWwm3R+ak8pylglz98ZwcroHMck2am4bT3kUhr9f8SDOhxYRS14zeHK1ASIXQCvQXWm4hZp0D/SyEC5J9RWVD1aqsKyRLRx7n7HIS0Y4h0u6rJCVkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3L93PlTDNF/+ZVKt9KlAsKMqQwonQfUPGmZBB3GjyjY=;
 b=w9wMAIR+dw/1+vyKZgJvZqc6zD0QJxX8ZrAFoJzuBgeY8K8b7kJsx1jH12rpT3Y/qNwPmfWZS3J9yjwIvoQcnRCerNdxpt/f0Vnwr7gY7zqxkCG2YyBIQmCB/H8MpHmAx3StUdbYpLjNPh8Tcel6PT3GUVH5R4xWiOVAhYbXiAA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <4681a4d4-68d3-01cd-912c-bca2cdc83266@amd.com>
Date: Thu, 11 May 2023 12:45:59 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
From: Ayan Kumar Halder <ayankuma@amd.com>
Subject: Re: [XEN v6 11/12] xen/arm: p2m: Use the pa_range_info table to
 support ARM_32 and ARM_64
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
 <20230428175543.11902-12-ayan.kumar.halder@amd.com>
 <63fa927e-72f5-1645-97c0-6986f2fdcabe@xen.org>
In-Reply-To: <63fa927e-72f5-1645-97c0-6986f2fdcabe@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0095.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::19) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|SJ0PR12MB6990:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d8dffde-a487-465f-c784-08db5215520e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6e5n35glgCd5lVf5Nofvs8tluwDvnP4mT3yw/mi/lQIAcBVsb3utJqVkrinaaadneP9rpdGn5T6YGd+4otaeb6fhbRzEJl831FVVjBqqr1z1D8eknYbtL9z0rUnPMlEtYeQ7SuEAp0uvYUAb49TX+JXJCj3NMHx393TZTZdl5Xv9HwB3Xw7Gbq/p9DjUR48/E8rTy9zJzuB2z72dbIqf8SZnLYBJYEb0TNJdKYZ1ft9IVVtjtQECPln4UY8cebs3uNHUXILlbfLLwqNqq11bQWoNyS721uYX1g0HqrhVLMeqrh5xEeGyY19wsJEMWTIbmAyIZlQ1EOz9feqJKIu7L+pJB2fLBK92iKX2P5XsQwUuwqmb8JGhdexBq+tZ2zOGoBlqCFMfmlkdKmXD7TsJcMKPxVKtdtmLuOXT5+EzLZLO3mosjFaD2bYbNwFJhQ/dDaDMTcfo1bZRj7xwwgJUna4mp1kXrFi4dB18wQn+FRXVbnE4nstxEiSqaNw4Wn9ysX3ivQbHORAeWWj2Y2Xuwyw7fgfJPvnDqKHWFbeBF0TQ/1T/au2aGrp4+/kTcif8cfzC0WgDfULs3ITvQ+eAhkxOi/GKbgbuKiQCpgToxuJJMuqKJ3a0G7HI2DBPrcvaQLgfH+ghwIwHF+tmPmZTkQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(451199021)(6486002)(6666004)(41300700001)(38100700002)(8936002)(6506007)(2906002)(53546011)(6512007)(26005)(478600001)(110136005)(186003)(31696002)(316002)(36756003)(7416002)(5660300002)(8676002)(4326008)(31686004)(66946007)(66476007)(66556008)(83380400001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTE3ZEE4Nk94dkpQNEJrZ3gwRkRaTFlsWjNzRjNpUWpTOWc0bERKdmRnQXdK?=
 =?utf-8?B?c1U1OFpqdE9SN0J3TWlpdXpPenFGMEtyd2ZJRThZemFlK1N1ZHF5Rnc2VWdD?=
 =?utf-8?B?UzVkT2ZSdUFFckIraU5JYUpxUW4xVzhWeXpiYWkyT04xeGQ5aGpwL2tXYjgr?=
 =?utf-8?B?Q2NseFlGVG94NTFFZTVwTXdWSUhWMG5vUmd1WVFLTVhFR0hudCtBZ2ZvMi9B?=
 =?utf-8?B?RSsxKzluamN3TUZxUHliL0k0MHVmU2JPMlFjckdhRGV6ZWtGaHJic0p4SHFM?=
 =?utf-8?B?QXFjRlUxNU5jdjRqcHcyb2h6RTJvQlh0TUlvRk84Z1RybkFsUDNydTRSUExU?=
 =?utf-8?B?aTFwdkI4cVozQlM5Qm5QeDliNVZ2WFhkOS9QUjVmS0JTY1hjcllvb3Y0OEo5?=
 =?utf-8?B?UEhvNlFyM3A4dlQ0NkVRdzhTTzExb2szOVVGaFRpSXRoN3JUZlhFVXhPdi84?=
 =?utf-8?B?NkY3am9haEJ6bGI2TmxmMkg0Sy82cDBCL0N2QW9HeGsvdXZIYXdxMGtOYlRM?=
 =?utf-8?B?L0JuMHJPNkVhalliZDRuS2NwVEZSOXVOaXpyNDJ2Wm9iVkwvZ0xsQStNYnpo?=
 =?utf-8?B?bWE2dXZPV08vL3lYUmhLaVczRUdRdzRBUldGTzQrZmJzYUlzZS9Dc21zQUlT?=
 =?utf-8?B?bW1Ta2ZkV3kzUnZFVHN2eTk5THR2dlUyUkxkN252clorejR5a1BPTGM5NGhE?=
 =?utf-8?B?cDRNbnVrM2FpcWk0d3ZjRFF3OUR6TlpNRE1mRm1QZlFqVFhQbVlzZ0kweGls?=
 =?utf-8?B?Y2xWczRoL1ZmTlZIRFFERkRBWXdsQ0xJOFJtcmM1ZEtzamVwbWovTUwyZ3ov?=
 =?utf-8?B?anJ6cUN1M1RvdlVPOUx2NzZCVmRzbFV3MEh6MUFveWs0cC91azFCUDViQ2xz?=
 =?utf-8?B?bFNyb3RBWkp0NlpmbEtXSDErUWFKZXR5ZG1RcFk4djNFRG1FT21TYjBabXhz?=
 =?utf-8?B?dnJNdDU3bjU0d2F5ekFKVFhpREc5akdGQitwa3U1a2dSeWI1QTRaMlRkQlRv?=
 =?utf-8?B?amZVQVZkSFN4Z0Y5V2RHRlNIMXMvSjFHM0dMYTkyYXNUWTBSR3lhQXJqbFd3?=
 =?utf-8?B?MnhJOWFPc3VYellvVDFDTEJCVDVMSUZxbXBJSi9XNzM0bXFiZTV6MVkxY1Vn?=
 =?utf-8?B?S2RGcEJodmtta0w2elBIaGd3OW1EcVQ0YW90c2xPSFp0cUtFamt3Q0lVZWRW?=
 =?utf-8?B?UUtGMytybGR2Y1VVL255cC8yeDl1MWp6K2M5OWg0VkdCK3lBbndYWjlLT3Jw?=
 =?utf-8?B?dXhQbEE4QXRTNmhZREFxYU5wRnEvK2tLUjBMT0NaNy9nMSt1Qjc0c3pXS1FK?=
 =?utf-8?B?N1RlUE9hMi8zRVpVWXFNUS9SeDFJcElZY25MNUNkYjJvQXZUeHpYdjlZcHBY?=
 =?utf-8?B?bXRmSU5ZNHp2TGY2N0E2N09sUTZXUnhKQ3NsQ3ROTFVMM05xNy9lbmRCbGVL?=
 =?utf-8?B?eTNIWG5aOURlS0czOVhQL1EwdkFRY2laL2FDWVEyMjFmOGd4MmdBOUNlelhQ?=
 =?utf-8?B?cndjTzl2NTVYa0Z3M3NQUDAxTy85QS9MTGFZRWR0dVd2OUlvaUZjQ2VVNE1n?=
 =?utf-8?B?ZEE2Q2R2QlFKRHhoTXdGS3hsNlZkWDE1d2hVY3JmMGVDYmJEZW5FeUFNZFdQ?=
 =?utf-8?B?NDFQMkVaWFJ6dTRrMmUyMnFFQU5iVWsvcFZrQWJyUXFGV1FlTG9SUCtTbEFD?=
 =?utf-8?B?c3hkTlo0WWR2N1ZvdHhUeXlTdm1yZStUS3orQ2U0TzZpSkhsT3M3MDFYZkIv?=
 =?utf-8?B?V2NsdUZlMTVvYkhaYVdqQXNuOFBWYnYveWhhTDFnRW5vWTVZRlFiQlI3SW40?=
 =?utf-8?B?MldMU3ZaSG5sWEVDRHd4K2xyb3JxSTlTdUt6K0dCZnRUa082TWh2cjBWOW5G?=
 =?utf-8?B?Sm82U3VGNEkvb1BRdnQ4WS9VTFdLZHJqUkJxRDFMaElhcnljSFQrdXRuYmk2?=
 =?utf-8?B?TmdtY3FBZG55TXFIVjl3SmRSeHFxemRHWS9pcnEzQTZyTyswaWMzYis1Q3ho?=
 =?utf-8?B?QlRZR0Y4VVVVbnFhc1IySWtMaUpvRGtSR1NjcDNOc3E5aytaQUdiUmZsTS83?=
 =?utf-8?B?K3YwdzA1eDZ6SE1GdjhVTWZIM2Y5UGtZNm5pSEdQeEtLTEN1UzFIQ3lJYTNS?=
 =?utf-8?Q?+z7CyV1vLS+9nTtnWi54P0gak?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d8dffde-a487-465f-c784-08db5215520e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 11:46:12.9809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZUOAA/SBE1bqXELzzFGqt9GvfQyrqPT/X5e2RYWEr/CGj4ivyPq2LLUB8A8VnpGeRbyApd2PQgmg4MPitSx4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6990


On 03/05/2023 13:20, Julien Grall wrote:
> Hi,

Hi Julien,

I have some clarification.

>
> On 28/04/2023 18:55, Ayan Kumar Halder wrote:
>> Restructure the code so that one can use pa_range_info[] table for both
>> ARM_32 as well as ARM_64.
>>
>> Also, removed the hardcoding for P2M_ROOT_ORDER and P2M_ROOT_LEVEL as
>> p2m_root_order can be obtained from the pa_range_info[].root_order and
>> p2m_root_level can be obtained from pa_range_info[].sl0.
>>
>> Refer ARM DDI 0406C.d ID040418, B3-1345,
>> "Use of concatenated first-level translation tables
>>
>> ...However, a 40-bit input address range with a translation 
>> granularity of 4KB
>> requires a total of 28 bits of address resolution. Therefore, a stage 2
>> translation that supports a 40-bit input address range requires two 
>> concatenated
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
>> VTCR.T0SZ must indicate the required input address range. The size of 
>> the input
>> address region is 2^(32-T0SZ) bytes."
>>
>> Thus VTCR.SL0 = 1 (maximum value) and VTCR.T0SZ = -8 when the size of 
>> input
>> address region is 2^40 bytes.
>>
>> Thus, pa_range_info[].t0sz = 1 (VTCR.S) | 8 (VTCR.T0SZ) ie 11000b 
>> which is 24.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from -
>>
>> v3 - 1. New patch introduced in v4.
>> 2. Restructure the code such that pa_range_info[] is used both by 
>> ARM_32 as
>> well as ARM_64.
>>
>> v4 - 1. Removed the hardcoded definitions of P2M_ROOT_ORDER and 
>> P2M_ROOT_LEVEL.
>> The reason being root_order will not be always 1 (See the next patch).
>> 2. Updated the commit message to explain t0sz, sl0 and root_order 
>> values for
>> 32-bit IPA on Arm32.
>> 3. Some sanity fixes.
>>
>> v5 - pa_range_info is indexed by system_cpuinfo.mm64.pa_range. ie
>> when PARange is 0, the PA size is 32, 1 -> 36 and so on. So 
>> pa_range_info[] has
>> been updated accordingly.
>> For ARM_32 pa_range_info[0] = 0 and pa_range_info[1] = 0 as we do not 
>> support
>> 32-bit, 36-bit physical address range yet.
>>
>>   xen/arch/arm/include/asm/p2m.h |  8 +-------
>>   xen/arch/arm/p2m.c             | 32 ++++++++++++++++++--------------
>>   2 files changed, 19 insertions(+), 21 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/p2m.h 
>> b/xen/arch/arm/include/asm/p2m.h
>> index f67e9ddc72..4ddd4643d7 100644
>> --- a/xen/arch/arm/include/asm/p2m.h
>> +++ b/xen/arch/arm/include/asm/p2m.h
>> @@ -14,16 +14,10 @@
>>   /* Holds the bit size of IPAs in p2m tables.  */
>>   extern unsigned int p2m_ipa_bits;
>>   -#ifdef CONFIG_ARM_64
>>   extern unsigned int p2m_root_order;
>>   extern unsigned int p2m_root_level;
>> -#define P2M_ROOT_ORDER    p2m_root_order
>> +#define P2M_ROOT_ORDER p2m_root_order
>
> This looks like a spurious change.
>
>>   #define P2M_ROOT_LEVEL p2m_root_level
>> -#else
>> -/* First level P2M is always 2 consecutive pages */
>> -#define P2M_ROOT_ORDER    1
>> -#define P2M_ROOT_LEVEL 1
>> -#endif
>>     struct domain;
>>   diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>> index 418997843d..1fe3cccf46 100644
>> --- a/xen/arch/arm/p2m.c
>> +++ b/xen/arch/arm/p2m.c
>> @@ -19,9 +19,9 @@
>>     #define INVALID_VMID 0 /* VMID 0 is reserved */
>>   -#ifdef CONFIG_ARM_64
>>   unsigned int __read_mostly p2m_root_order;
>>   unsigned int __read_mostly p2m_root_level;
>> +#ifdef CONFIG_ARM_64
>>   static unsigned int __read_mostly max_vmid = MAX_VMID_8_BIT;
>>   /* VMID is by default 8 bit width on AArch64 */
>>   #define MAX_VMID       max_vmid
>> @@ -2247,16 +2247,6 @@ void __init setup_virt_paging(void)
>>       /* Setup Stage 2 address translation */
>>       register_t val = 
>> VTCR_RES1|VTCR_SH0_IS|VTCR_ORGN0_WBWA|VTCR_IRGN0_WBWA;
>>   -#ifdef CONFIG_ARM_32
>> -    if ( p2m_ipa_bits < 40 )
>> -        panic("P2M: Not able to support %u-bit IPA at the moment\n",
>> -              p2m_ipa_bits);
>> -
>> -    printk("P2M: 40-bit IPA\n");
>> -    p2m_ipa_bits = 40;
>> -    val |= VTCR_T0SZ(0x18); /* 40 bit IPA */
>> -    val |= VTCR_SL0(0x1); /* P2M starts at first level */
>> -#else /* CONFIG_ARM_64 */
>>       static const struct {
>>           unsigned int pabits; /* Physical Address Size */
>>           unsigned int t0sz;   /* Desired T0SZ, minimum in comment */
>> @@ -2265,19 +2255,26 @@ void __init setup_virt_paging(void)
>>       } pa_range_info[] __initconst = {
>>           /* T0SZ minimum and SL0 maximum from ARM DDI 0487H.a Table 
>> D5-6 */
>>           /*      PA size, t0sz(min), root-order, sl0(max) */
>> +        [2] = { 40,      24/*24*/,  1,          1 },
>
> I don't like the fact that the index are not ordered anymore and...
>
>> +#ifdef CONFIG_ARM_64
>>           [0] = { 32,      32/*32*/,  0,          1 },
>>           [1] = { 36,      28/*28*/,  0,          1 },
>> -        [2] = { 40,      24/*24*/,  1,          1 },
>>           [3] = { 42,      22/*22*/,  3,          1 },
>>           [4] = { 44,      20/*20*/,  0,          2 },
>>           [5] = { 48,      16/*16*/,  0,          2 },
>>           [6] = { 52,      12/*12*/,  4,          2 },
>>           [7] = { 0 }  /* Invalid */
>> +#else
>> +        [0] = { 0 },  /* Invalid */
>> +        [1] = { 0 },  /* Invalid */
>> +        [3] = { 0 }  /* Invalid */
>> +#endif
>
> ... it is not clear to me why we are adding 3 extra entries. I think 
> it would be better if we do:
>
> #ifdef CONFIG_ARM_64
>    [0] ...
>    [1] ...
> #endif
>    [2] ...
> #ifdef CONFIG_ARM_64
>    [3] ...
>    [4] ...
>    ...
> #endif
>
>>       };
>>         unsigned int i;
>>       unsigned int pa_range = 0x10; /* Larger than any possible value */
>>   +#ifdef CONFIG_ARM_64
>>       /*
>>        * Restrict "p2m_ipa_bits" if needed. As P2M table is always 
>> configured
>>        * with IPA bits == PA bits, compare against "pabits".
>> @@ -2291,6 +2288,9 @@ void __init setup_virt_paging(void)
>>        */
>>       if ( system_cpuinfo.mm64.vmid_bits == MM64_VMID_16_BITS_SUPPORT )
>>           max_vmid = MAX_VMID_16_BIT;
>> +#else
>> +    p2m_ipa_bits = PADDR_BITS;
>> +#endif
> Why do we need to reset p2m_ipa_bits for Arm?

Ah, this is a mistake. I will remove this.

>
>>         /* Choose suitable "pa_range" according to the resulted 
>> "p2m_ipa_bits". */
>>       for ( i = 0; i < ARRAY_SIZE(pa_range_info); i++ )
>> @@ -2306,24 +2306,28 @@ void __init setup_virt_paging(void)
>>       if ( pa_range >= ARRAY_SIZE(pa_range_info) || 
>> !pa_range_info[pa_range].pabits )
>>           panic("Unknown encoding of ID_AA64MMFR0_EL1.PARange %x\n", 
>> pa_range);
>>   +#ifdef CONFIG_ARM_64
>>       val |= VTCR_PS(pa_range);
>>       val |= VTCR_TG0_4K;
>>         /* Set the VS bit only if 16 bit VMID is supported. */
>>       if ( MAX_VMID == MAX_VMID_16_BIT )
>>           val |= VTCR_VS;
>> +
>> +    p2m_ipa_bits = 64 - pa_range_info[pa_range].t0sz;
>> +#endif
>> +
>>       val |= VTCR_SL0(pa_range_info[pa_range].sl0);
>>       val |= VTCR_T0SZ(pa_range_info[pa_range].t0sz);
>>         p2m_root_order = pa_range_info[pa_range].root_order;
>>       p2m_root_level = 2 - pa_range_info[pa_range].sl0;
>> -    p2m_ipa_bits = 64 - pa_range_info[pa_range].t0sz;
>
> I think this line should stay for 32-bit as well because we 
> p2m_ipa_bits should be based on the PA range we selected (see the loop 
> 'Choose suitable "pa_range"...').

This isn't true for ARM_32.

ReferARM DDI 0406C.d ID040418, B3-1348, "Determining the required first 
lookup level for stage 2 translations"

"...The size of this input address region is 2(32-TxSZ) bytes, ..."

So for

#ifdef CONFIG_ARM_32

p2m_ipa_bits = 32 - pa_range_info[pa_range].t0sz;

#endif

This will be a problem for 40-bit PA as T0SZ = 24.

So p2m_ipa_bits = 32 - 24 = 8 (which is incorrect).


To get around this issue, there are two possible solutions :-

1. For ARM_32,  do not modify p2m_ipa_bits. Thus p2m_ipa_bits will be 
using its initialized value (ie PADDR_BITS).

2. T0SZ should be signed int for ARM_32 (so that it can hold -8) and 
unsigned int for ARM_64.

ie

     static const struct {
         unsigned int pabits; /* Physical Address Size */
#ifdef CONFIG_ARM_64
         unsigned int t0sz:5;   /* Desired T0SZ, minimum in comment */
#else
         signed int t0sz:5;   /* Desired T0SZ, minimum in comment */
#endif
         unsigned int root_order; /* Page order of the root of the p2m */
         unsigned int sl0;    /* Desired SL0, maximum in comment */
     } pa_range_info[] __initconst = {
....


I will prefer option 1 for the sake of less if..defs.

Happy to hear your opinions.

- Ayan

>
>>         printk("P2M: %d-bit IPA with %d-bit PA and %d-bit VMID\n",
>>              p2m_ipa_bits,
>>              pa_range_info[pa_range].pabits,
>>              ( MAX_VMID == MAX_VMID_16_BIT ) ? 16 : 8);
>> -#endif
>> +
>>       printk("P2M: %d levels with order-%d root, VTCR 
>> 0x%"PRIregister"\n",
>>              4 - P2M_ROOT_LEVEL, P2M_ROOT_ORDER, val);
>
> Cheers,
>

