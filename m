Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 825C770F88C
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 16:22:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539072.839589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1pNU-0001ML-22; Wed, 24 May 2023 14:22:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539072.839589; Wed, 24 May 2023 14:22:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1pNT-0001KJ-UL; Wed, 24 May 2023 14:22:11 +0000
Received: by outflank-mailman (input) for mailman id 539072;
 Wed, 24 May 2023 14:22:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+R+=BN=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1q1pNS-0001KD-35
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 14:22:10 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20612.outbound.protection.outlook.com
 [2a01:111:f400:fe59::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d241d7d-fa3e-11ed-b230-6b7b168915f2;
 Wed, 24 May 2023 16:22:07 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by SJ2PR12MB8135.namprd12.prod.outlook.com (2603:10b6:a03:4f3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Wed, 24 May
 2023 14:22:04 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 14:22:04 +0000
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
X-Inumbo-ID: 5d241d7d-fa3e-11ed-b230-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzZc9/lLws6oU4dSMRJooDL9UeF3+GaIT1OGbaLuG4u8o39lM7JJGlElN2RsrBkEtjemdqud0Zn/GWCz6HaM5Ey5bd8z3PLj8FdN/uy5hZmkjwWoSjH+5yn1hUNdjRe0No2JaZfcJwvvYouLJof+RSeuvFg4N9r1WwqB5tEHGxpBz7G9Y22Pb5AQvUs/xnIsEnGqF94Aq65vJ2r9Xv6zppsH7RnWT9vR7ATIq9SIaBnybql3WgVJD6qVr/bo+dqeNmDH5nEJWksdQ66+VsyzCivlAEQ7wJBs1ZbCCRPc9IY6rVMSWWg5CDDG9Q9nR47JFd4Q4aDsQ8ln++uVysLqUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NCThOBywJsRM4cIDOyqxsqcp71KqHSL7k+aLtuBgGX4=;
 b=AtQUC3zpAbGuMgQfVn4s+lH8uEUnLOS7WGVEQnhaSbx0bsdyQuMxoSymyHOAPT/FmIs5MZAa+0l0U883k9GXobnvukSzE0uXghJyGBxz3PFyrjSdTZ5WdmUFSoHkUui41Dx2k9HEDE2AEjV5Sf0xY8n5nGg+og6lJ47P/W3gb80Fw540bPLFcfYLVaxadhbRWuN9lWtnuXdEGiUP+Ds2cbtgu83mAkDMtnDpvDLvhBoZW6Ztf+tZ32fPNhnvTB9qXsFb7Wi5wJcOphlt6IpjYck6vVCCWqyeIsiubJLFCO9zv29ldUOdU7etLo0Tu+R1k7kfNenB2wrp6NwB9uc+2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCThOBywJsRM4cIDOyqxsqcp71KqHSL7k+aLtuBgGX4=;
 b=wGrqLD+46xnN1BKKV0pHLuDUVmLVLAw3VVJU2FjFUjiV0WjfoIpcoTNy1EoZrEzTBEf8tGjaBXgcbMQcHy9Au8SDWTRmvitB9B+ejSJS2qaTq1Kqq4WfJYF3oxzlQ4KYE0kpuYw5UAeQwmli3wrKw51orS0nM/UpWn0aRbnt30o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <06e08bf5-ac14-b0ae-743e-60da5e2396e4@amd.com>
Date: Wed, 24 May 2023 15:21:56 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [XEN v7 07/11] xen/arm: p2m: Use the pa_range_info table to
 support ARM_32 and ARM_64
To: Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230518143920.43186-1-ayan.kumar.halder@amd.com>
 <20230518143920.43186-8-ayan.kumar.halder@amd.com>
 <66f04988-9a4b-39c0-fb17-c508b98e3bdf@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <66f04988-9a4b-39c0-fb17-c508b98e3bdf@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0242.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::16) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|SJ2PR12MB8135:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bf46f4e-9076-4c2c-b0c4-08db5c623f2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OrsW8L9lg5nWz3yz2XlXnnzcBRoa94Gp4ycVMkK0VStmwv1Y5ZDfxgRsObvB84V7yRh3XVW1Uaux6F6W+sHLRBdn91nJ2fjkGkylLrh/f0fvToTRpt0gP4OoDikSQciQMPnsqruC7g4gkOl9FwkSYTfYoxHunFrX3WCJw9JEV6iBps+Tk28qJArkIVvEo0Qcrb5rZ2zHtoFTsuHJ1GotW4wJoaU6NkF8kAKhXpEAOEcUblduwyA/oYwPt7HY08VcWOGOTrU3ReYDFwgKn2XnCD/HUpSwBAzvufoDurJ/OzbPt8mpe6qfq+/NhhyfGh+M7h/GrA8gvGg2hRg1aWqFRC3xKtiHWdLuYZZsESsYdoGGysANN1RkhmVxUtHSPPZ2vCDz0HlecEe6CbTotaUmroMt8BkJN1vyXDmS9ssHzVYQyuriVnj7TYPz8VA7J9EZPNWzU2+jnkZ5QbcY7XLljM+DUKocCuhC2aKJDv23LWxOFmuNa2AV5wNykI8qKEuVd0Q73R+KALQgVtyH9S9MC9SO8806CWQf96QWGwnwwX6eyypBKm8tqGvKXW2dR45grbSbyfKaljZH8UZiST8rqGDCH2k5yjNdVy+CQrkuueHnXIT7UkLYgLsE1CXGOQuQ9MdzL2H3BK5IugSjFavSkw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(451199021)(31686004)(66476007)(66556008)(66946007)(31696002)(478600001)(41300700001)(6486002)(6666004)(316002)(110136005)(4326008)(5660300002)(8676002)(8936002)(26005)(6512007)(186003)(53546011)(38100700002)(6506007)(7416002)(83380400001)(2906002)(2616005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVBXeU5YZG11bVFPazhtbEROcVIyaG81azhqL1RsckZvVzlzbzF2ZGZqSklI?=
 =?utf-8?B?dDY4WTdRUzB4N3R0Mk9qM05uLzBVQ1d4THRXVEpOQWVCT0dkeUJmaXE4WGRj?=
 =?utf-8?B?NUx0K01YSUlDOXBKeCtQcngxdCtMVWNqejJJZUFSQ1ppNjFTQmtHeFIxVnNK?=
 =?utf-8?B?SmpFRk1sQ1I5Q24ya2ZpSHpRU2ZzVU9yU3kyaDBieFQrbFcrckRpS2txaXFx?=
 =?utf-8?B?QU5IN0dEbFBTM0lYRXdhK1lXQTAvdXQ1OGdMQURZUTUwaHZaVUIra0FZNkVs?=
 =?utf-8?B?ZFkyRlBxVDdCN3FFYVBGdUJiVnJodnZsWU1lREM5LzRSQU5ETzIweUlEZ21T?=
 =?utf-8?B?WEdLc0RvanlLb1ZabkFMdWVta1JsaXpZcXdTa1JsM2ZMUjQ0d0h3cnYyUVlB?=
 =?utf-8?B?VG9RTGRNbjVvYTRhRmRyQnhraC9vZU8vYkQ1M04yTHBhWGtxTmVvNlNobzNI?=
 =?utf-8?B?dXRnTWF0QmVXaU1XZ3ZJUy9rd3FOc0lCa00ycE80d2VRU2RoVDBWbjlGRUZS?=
 =?utf-8?B?bStBSFVDVzFqczJtTmliOGE2RXI1WlA3K3VpUGdiOFVaRUpLZ0xkYWRNN1lO?=
 =?utf-8?B?WmR4a1ovQVU4enpNZVk3bEVxRkpGME9FeTk5TjI0TW5OSXA0ZVRSa01uUmhJ?=
 =?utf-8?B?a2hRNHc2amFkamxoVFgrTUJnNXN4VW02NlJIM3BHMWVXYU5uMWdOdVJnRnpk?=
 =?utf-8?B?RXVlcXU1MHpxbE1jWWxIcjU5ZSt2NDBBNWY1TUhJYlcrRkttbzhSTzBvcEds?=
 =?utf-8?B?RnFRZkNEUExWbGdHam9SOWJiN0JsU21SSFN6UkgxRk1yMjlpL252RllIaTgy?=
 =?utf-8?B?Ulp3M2I1WlRMeGZHb2RSWXR3TWRURERNY2hHYUlncWUvTU5WekZRc0Nzd3kv?=
 =?utf-8?B?bnZmSmlTaXZiVStVQmNjSjBEVURiQy9yelZ1czlhQjFZWTVrajM1YjA3NkQz?=
 =?utf-8?B?a3V0b3V3Sy9JdjlWZjFGWU05cE9PYmV1RFdZOFNsZG1FaVpNU2R4KzJPNjlr?=
 =?utf-8?B?bkJDZW85c2pGVFVoTmVDTkt4a1d3Q2RrbmM5Y05sME5KWG1NNXNSOWFzemRM?=
 =?utf-8?B?TlNqYWpDZHdWUGg0UERXWktiNVBPOFFiaWVLeDFTN3NZV2xBbXluRlQvV0VG?=
 =?utf-8?B?MU02UFhtK3l0VXFObU5CcG1FekJWL2x1Zk9DaHAyUnFVVXFlYTdublBUSkFs?=
 =?utf-8?B?RCt1ZGxIQjE1MUttNFVEbktGcms2TVc0c1JLSGZQM0JtcWZtOXVkZWhsVHFW?=
 =?utf-8?B?U1BFSEJHNGJYc0hvU0VSdE5CUnVLT05wQVFseHNBSi9BSDU5akh1NUpGTUhx?=
 =?utf-8?B?eVBnWm8wTEQ3WkkwY3lLYXdYSEJJWVJuakJhV0xnRllFQm13cHNNUFVoYUpv?=
 =?utf-8?B?SDVMUGRyMUU5NUd2UGhkT3JzcEY3bFZCYU9EaVp3blNCR3l4RUJnQ1VNQ2tP?=
 =?utf-8?B?QlhFUlBxNzdESTRjYVlmS1J3S3VBUWRRUGlMWTN6UXI3RXU0U0xYNi9LMFE2?=
 =?utf-8?B?WWpXclFEVmpnWVB2aUxoMVB0Wksyd2JMTnpvR1F6S3FNdXdVWnpQU3c0NXBl?=
 =?utf-8?B?MkEwMXB3VGRLZFdpV1RVMit4S1dqcjM1RzRwa2Q4Z0VwNm5pY1dJUU90NDll?=
 =?utf-8?B?ZW1SUllOWWpQZXRDZVVLWG9ERzZaeHJpMUw1WnV4QjhXdHg1N1U3U0VsT3RH?=
 =?utf-8?B?VFN1M2NMYUVjcTRnUzNYNVBtOWZEYWNwdFhEVGdSRVFXZDdDakRUWHlWTnl5?=
 =?utf-8?B?NFVNVGNhNk9mZlVDclppTzM5RTNTdWgweWJJcysrQjRwOTZnYVFKLzVhNU94?=
 =?utf-8?B?OHJxWkw1OVhOM3grVFNodllUWUNhemI0TlVHYmdYWUZYL2laY3NUN2JiKytt?=
 =?utf-8?B?QnNvb1hpTWljTjNqN1grMmhGQngwWDlxV1hzbDhYb3o1ZVNMYmhQeDdSWHpH?=
 =?utf-8?B?cldjeTAzUTRFa0ZmbnBOcUdtVk83QmhzSHJCc3U1dDBJQnFFaTQ3cTFGdEQ2?=
 =?utf-8?B?WUxLK0l3R0hEaDl5bDl1dFNEdzZ2dXNtSnhubUNWTk5rWFNicWNMWlQ1Slpp?=
 =?utf-8?B?a3UzQ1FSeGZaRFJyUDd3M1RYV0F0czZGNTdwdnJFRDZQQStMdys4NU5QclRB?=
 =?utf-8?Q?/pCH0RbDlgVYOfHYz9EZJpcPX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bf46f4e-9076-4c2c-b0c4-08db5c623f2b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 14:22:04.1935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jmOwpMZpjVFj/htW2B/Kw/LB1jY/kz/ZjYB/XAd/spibcl6e0HcNCxF14bxpN2VProb12NpWnlYnZ+6rT/EAkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8135


On 19/05/2023 09:54, Michal Orzel wrote:
> Hi Ayan,
Hi Michal,
>
> On 18/05/2023 16:39, Ayan Kumar Halder wrote:
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
>> Thus, VTCR.T0SZ bits are interpreted accordingly for different architecture.
>> For this, we have used union.
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
>>   xen/arch/arm/include/asm/p2m.h |  6 ------
>>   xen/arch/arm/p2m.c             | 37 +++++++++++++++++++++++-----------
>>   2 files changed, 25 insertions(+), 18 deletions(-)
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
>> index 418997843d..755cb86c5b 100644
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
>> @@ -2273,11 +2264,22 @@ void __init setup_virt_paging(void)
>>           [5] = { 48,      16/*16*/,  0,          2 },
>>           [6] = { 52,      12/*12*/,  4,          2 },
>>           [7] = { 0 }  /* Invalid */
>> +#else
>> +        { 40,      24/*24*/,  1,          1 },
>> +        { 0 },  /* Invalid */
> Do we really need this invalid entry?

Actually I preserved it to be consistent with ARM_64, but we can drop it 
for ARM_32.

The only benefit of keeping this entry is that if p2m_ipa_bits is set to 
0 in p2m_restrict_ipa_bits(), then ...

panic("Unknown encoding of ID_AA64MMFR0_EL1.PARange %x\n", pa_range);

This will print pa_range as an index pointing to invalid entry.


Also, this reminds me that I should change the message as 
ID_AA64MMFR0_EL1 does not exist on ARM_32.

So this may look better for both ARM_64 and ARM_32 :-

panic("Unsupported value for p2m_ipa_bits = 0x%x\n", p2m_ipa_bits);

>
>> +#endif
>>       };
>>   
>>       unsigned int i;
>>       unsigned int pa_range = 0x10; /* Larger than any possible value */
>>   
>> +    /* Typecast pa_range_info[].t0sz into ARM_32 and ARM_64 bit variants. */
> This would want some explanation in the code.

/*

VTCR.T0SZ, is bits [5:0] for ARM_64.

VTCR.T0SZ is bits [3:0] and S(sign extension), bit[4] for ARM_32.

Thus, VTCR.T0SZ bits are interpreted accordingly for different architecture.

*/

>
>> +    union {
>> +        signed int t0sz_32:5;
>> +        unsigned int t0sz_64:6;
>> +    } t0sz;
>> +
>> +#ifdef CONFIG_ARM_64
>>       /*
>>        * Restrict "p2m_ipa_bits" if needed. As P2M table is always configured
>>        * with IPA bits == PA bits, compare against "pabits".
>> @@ -2291,6 +2293,7 @@ void __init setup_virt_paging(void)
>>        */
>>       if ( system_cpuinfo.mm64.vmid_bits == MM64_VMID_16_BITS_SUPPORT )
>>           max_vmid = MAX_VMID_16_BIT;
>> +#endif
>>   
>>       /* Choose suitable "pa_range" according to the resulted "p2m_ipa_bits". */
>>       for ( i = 0; i < ARRAY_SIZE(pa_range_info); i++ )
>> @@ -2306,24 +2309,34 @@ void __init setup_virt_paging(void)
>>       if ( pa_range >= ARRAY_SIZE(pa_range_info) || !pa_range_info[pa_range].pabits )
>>           panic("Unknown encoding of ID_AA64MMFR0_EL1.PARange %x\n", pa_range);
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
>> +    t0sz.t0sz_64 = pa_range_info[pa_range].t0sz;
>>       p2m_ipa_bits = 64 - pa_range_info[pa_range].t0sz;
> This should be:
> p2m_ipa_bits = 64 - t0sz.t0sz_64;
Agreed. I should fix this.
>
> Another alternative would be to use anonymous unions+struct/union inside pa_range_info, e.g:
>          union {
>              unsigned int t0sz;
>              struct {
>                  signed int t0sz_32:5;
>              };
>          };
> so, if t0sz stores 24, t0sz_32 would automatically store -8.
> This could simplify the code later on, as you could just do:
>
> #ifdef CONFIG_ARM_64
>      p2m_ipa_bits = 64 - pa_range_info[pa_range].t0sz;
> #else
>      p2m_ipa_bits = 32 - pa_range_info[pa_range].t0sz_32;
> #endif
>
> However, I think it would require placing extra braces around initializers, i.e:
> [0] = { 32,      {32/*32*/},  0,          1 },

I am not very sure of this alternative approach because of the extra braces.

However, if you think it is better this way, then I can change this.

May be Julien/Stefano should also comment on this alternative approach.

- Ayan

>
> ~Michal

