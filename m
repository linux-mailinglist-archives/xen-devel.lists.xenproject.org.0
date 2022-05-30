Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F151D5384F7
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 17:31:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338637.563433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvhMh-0003Pb-0L; Mon, 30 May 2022 15:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338637.563433; Mon, 30 May 2022 15:31:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvhMg-0003MH-T9; Mon, 30 May 2022 15:31:30 +0000
Received: by outflank-mailman (input) for mailman id 338637;
 Mon, 30 May 2022 15:31:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nvhMf-0003MB-DH
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 15:31:29 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 926e95e2-e02d-11ec-837f-e5687231ffcc;
 Mon, 30 May 2022 17:31:28 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-X8e_HYraMCaLo5M6hA1UrQ-1; Mon, 30 May 2022 17:31:25 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB5134.eurprd04.prod.outlook.com (2603:10a6:803:5f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Mon, 30 May
 2022 15:31:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 15:31:20 +0000
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
X-Inumbo-ID: 926e95e2-e02d-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653924687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4LXyEp60Zou1OM8fr0OM9SFCpu3hxAG+y7HtdMn8/n0=;
	b=KTeRsxxY4iAWI+MDD4D/tBS0RhqjxUvz15/6e+sAHsMLTxcSjQWN7NEI8CuijUYOz1g4QA
	L1NG1kauUupVQqlMX6qLgXUI6Ld0n+7KNMyfxNr34TzDzFEJFLkxnKdjQpnEa/zO/LWTrf
	qgYOV+GJdZYBUx6wkHz4CN1ZTJg95iw=
X-MC-Unique: X8e_HYraMCaLo5M6hA1UrQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHCxdiwlupQzP/ERqhMZC71xOLzSbHIUSfAI5LlUQ3YSXxKgIvfU+MayIgx/pSeeFp+ZZ8cwh4m4UoWmZ6mqHRseeOKP1pKmgj31AE39CNOs9RVnsswkWXbdyJfsymACgS2KQook27brr1WxG2WchrqWtT33/mWONeByOJjZ7BN6LMMA0Cf0ncC4Wi6d9n/2jtU/wzpmMpqO3gV0kwnBZTAphJ25dQM1bm4PsnaVo9gyFBl3p7aEg+KCFtdXpWoDXi2GALnJL8/TDguBmsJI0/Yuk08tzZUBxsWXKWjrv3zW5/pkRoWqNTEvYIj3Vlr4OPtgVO+GtBbP0dVRQx6pkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4LXyEp60Zou1OM8fr0OM9SFCpu3hxAG+y7HtdMn8/n0=;
 b=bu9UYjvvbJDgjmJW2iPsmYqcW8/Zhs1+qCuZjIFyHq3pGSU58oKbRoNdL+a6d7F5D0Z/FPFGqsygG1udyVgQm47K1dXfFrmceJMCEC5a8mXDCWFHUv96fJVMJLXX1O6FDHfeYbvzwWTxPY0DH+rWjDhYQfFFOaprwAAt0b1fXDGw9eqLFA0Jtas1DNe/7rW7u3AUNGe/qe0hygsiyCvwKuLaqByxXp1H1dGiwYSFz9CGmL99vQhtTq6S+xmBq136q/G3EQ0OO1M4eSwT86j1e+ZlBsJpYcTSp7dKF6GoaDVxNZBENpxZRgudnPEXmxfIJXu6/vXMjWGGcvyScrfDwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4a193fd4-deb3-12c3-2faf-eed33e7b52af@suse.com>
Date: Mon, 30 May 2022 17:31:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/5] x86/lbr: enable hypervisor LER with arch LBR
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220520133746.66142-1-roger.pau@citrix.com>
 <20220520133746.66142-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220520133746.66142-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0475.eurprd06.prod.outlook.com
 (2603:10a6:20b:49a::31) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e618d75-08d9-4520-c615-08da42517201
X-MS-TrafficTypeDiagnostic: VI1PR04MB5134:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5134624F7135E438EFCF7F0CB3DD9@VI1PR04MB5134.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K2J+Jbn+LeIxviH2cmKqhq+MZZEx3Q0+C6V6Ge+y2LufP6Q/6wGAMR1wMnzdwNEbC03P4sAdH70WObqEUPda2zEAk+hOFrsGNiUdN2Vgk39qOsgkgQnPDxTEa82aJM1lDG6fw4NJ4uFUC9i+4OuawTlBd090F6IXdDmRyx3wI6Hu6RY0TkXDWzJCZua7Uy847+5CDAAqxIt580+M4olfhLO7Oy6SVHDIFAtvEqLl/avIF+AQyA4HJv0oYL1i33XYlvZfzl2qJ9QQezSLYgdsMwxX7QO3wmV9d9c47n1qHW26wVc0RK2GdHgxFAK1q3nsbBiXDzLCRa0yJ7Mhimoc0vG0VruXzdJty7rgGX5Vvfuop53PToj3PyN9KPHMp+L2jUu6eicHH17fNN0QQt16+VbbepD0VyWG5XVb0AZ1u4wlrePCu5iJIWP5nT40M7rC7ipc+F35iLtMSlqU/wns01ze1bCXpoSdaVi61oqAwH37c6PB20f2TQ3QZ6W7nnUlZ7HeZKiSUEGaUstN4vbX4lSVOnW63dS7W2t9pURqf93GOJVbUG13OEJsA0ZQsQy2HPSo93RlW5jMpTpMIZVa2fpN8vC4b0ji0nJL15ebS5eIaym4fXmqWIQo8zY/7N1A4u6QzSOdJiXACRG0yRxKfAbUKnxX+aVir45yktkEIxBoVFPjAAEn6q1CUpGnVNdQFxy9o/Z0Qzeq4eB0cPTH5JW5R0SvpVgwTYK9VNjC2fVreJta9gjOjDsIn5GgjuS7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(83380400001)(66476007)(31686004)(54906003)(8936002)(66946007)(31696002)(186003)(2906002)(2616005)(38100700002)(66556008)(86362001)(8676002)(53546011)(6512007)(26005)(508600001)(6916009)(5660300002)(6486002)(316002)(4326008)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFVBdzBvWnBMNHdTU0JuZE1KTWUwOHh1Zmt0OU4vcGl1UVRDUFpjTDI1aVVN?=
 =?utf-8?B?MFprSkFWN3RHRXBNODZlZXIxdE94eVRveUNrMmhpazMvbG5HNVBRK1o4SFRk?=
 =?utf-8?B?dktaZUVyMlJ2UlVvNEhPL2xtbHRXSENBOVV6MHVCSEdKUU5XMmpOK0xRM0ZS?=
 =?utf-8?B?b3FkUDc5aFdBNG8veGUwM055U1piditCczlRZlpNd1QxdUZvalZ4RDkvT2Qw?=
 =?utf-8?B?MDgrZEcydm1xaVFXWmhBSmVJeUVIT0hCTWpyUFN0alhsMmNKVlBrUkpadmFi?=
 =?utf-8?B?VGYyNG5pNUd6WGtyV3lIem41eVlaN1lhYmhDZ1Ixb082bDFWOHd4UVlkdlZ6?=
 =?utf-8?B?UXB0ZTBoV0pabTNOblNSRng5cTY0UllraGEybUwrbVNxZDdpWm40ZEtlYTZ4?=
 =?utf-8?B?d01OZlNOUVdWTkNlQ3pTVVdNcGRReG1HTzRxcnN5SDVPZEhuUFd6a0R5WDJZ?=
 =?utf-8?B?Q1p4UExVT3QrZ2gyQnA3WmxRMHU2M0lVc2ZLNTJIZ2lMc3dQMDNDTTVqQ2Vm?=
 =?utf-8?B?QTlXWnYyNlpReE50S0F0SjJRNTRMVnY3UWZWVFRyeUkyVXovY3JhSkdrbFNu?=
 =?utf-8?B?ZzhZb1Z2QUJDM293SlJxWDdPRERzcEZtQ1hiTTQ5QVpYbVZSUW0xQU16UFYz?=
 =?utf-8?B?akVlZXZTN2hLUlRSNW82Sm9MSjgxNlFrckJsZDh5MFJ1bVM2M2UrOVVPczNU?=
 =?utf-8?B?alBpb2FKL29pczV5S0MyZ3hTYXdZeFp4a24zRmgyWVdpNHJCYW1ocnRxVzQw?=
 =?utf-8?B?RC8wZUdKNnR5R1BwZFd0NHFKbnN3WXdta0d5djE2R0JHd041M3dpV240eFMx?=
 =?utf-8?B?Mm5Fc2o5bkJzRS9JbVMzU2lqVnFkd0ZxU09TQ0ZYUVhLT2pGdmloVGtGZHhw?=
 =?utf-8?B?QXl4eUt5YmhVUFFSeDl4ZjYvR1h5bXlrMHI2aVpYTEpuZGN1MmJUWEJjT2hZ?=
 =?utf-8?B?aHdkeUp0RmpaeXFsQXlraE5QME9hbkVFaHpBcUdCa0ZJOE1ZdUlWVVcwZ093?=
 =?utf-8?B?SzBKNGU1bGl5cDFyb2p5Unl2ZiswOXU5bldzdWovSDhaUkM5UDkvdlFTL3Bj?=
 =?utf-8?B?ZFFCMFVIU1drWENxTFlqRnRmUW1ReGVDNXBZdEtZS0RlMDBsZWVhWW9sZVZa?=
 =?utf-8?B?djc1OW9yZ04wTk5DbnV1UUpZcmxVT2JMSm15QWMyemx4MlZIdVloLzBLQ1J2?=
 =?utf-8?B?UE1tMXNJbWYyQk5zYThtcmdGaHB1R1RweElacGsxTzN0S1lnRm1IdEhTaG4w?=
 =?utf-8?B?NUE5V1JlUjdOdHp4OFZqREhwN1JWT0lvZ2hVNEcrblRsbkxFNVlxaEgwdHFj?=
 =?utf-8?B?bjBUWUhmWkRCaHgzdzhDUXZtQmxvNlE4SGpKcnYwSE8yL0pva3V5N1lvc3JG?=
 =?utf-8?B?M2pNRHpDSEJSeGhROVh5TEZNZzI2SzUza0drWXZTQURNVndSY0Y1RmVZTWRr?=
 =?utf-8?B?TnoyNVliQW9GaE4vdi9Pcjh4WjBnVUVlOUl1cXg5TzNmWHpiZHZEMTVLOXRB?=
 =?utf-8?B?NlF0cGN4VVZkWlRzNVJkeWFmdms3ZlQvN0Q1NU13ZDVLb3YyMUJrWkJzRkVZ?=
 =?utf-8?B?bzBqM1JDUzFYT1FMRzZ0cFkrNmpmVGJYUUtFNkdJcGtlUVNuS2prZkxRNTNY?=
 =?utf-8?B?UkJZdkdUQWNSNFhGOTIxSHR3Ujd2RTk3c1o5NW12Y3U3U1pPZHBmTkk0TC84?=
 =?utf-8?B?K0UreHlpRG5idTAyMVV5bUFzQWFrV3RSNyt3SHNtQkh0dnc0Q2RKbnZRMFlq?=
 =?utf-8?B?dUdOalBIN3VrcHZSbWpudHZPQTU1MWJTY3Q5VnlvY0ppSUR2VnpOOVV4Umhv?=
 =?utf-8?B?ZmpScE56aW56dVNXQUNzQlVXOFBaU2cvcHBBVXFHR29Ua3MzcTNZVEVFQ3Bl?=
 =?utf-8?B?TUNkSXNneCtxTU56RzdIM2ZZeXoyZ0o2NG9rNVZkQzhpSkJSZTlUQ0ZVcDl3?=
 =?utf-8?B?NDhjN1pRcDVXUG1LakpwcHhaRVkwSktqNXFjTThxUE92RUtlclhONzd4WDcz?=
 =?utf-8?B?R0ZvNmFocFFpK005S0V5QkdCOUwzZHd0b3A1WjRjZ2g3M2dPZUw0L29RNEcr?=
 =?utf-8?B?bmJyOG5pUmVLV3pqdzBIUWZyaWlQZ3hlR0FNZWdWeWxxY2dBcGxmMnZZQ0VH?=
 =?utf-8?B?RkRCZDNxalBQbWtVS2E2NFJKZVl1c202bXJwOGtzRGk1NFU5MlpvZ1hoRU50?=
 =?utf-8?B?QnlNQlhXN2ZwNElzc0hkUEdhRXRaQ3M0UittSWVkM0FmTjRNT0lWcHFLSUhI?=
 =?utf-8?B?a0xpdktmYlZsUGpvajJ3eU9rdTBQUWN3UmNzeFd3RWYxdnBFZjVRN1pNOVlV?=
 =?utf-8?B?QlZ2WlNLbU80b0JoUCtkTER5b29EMFVrZW1NaGZrVlpGTjk1WkI3QT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e618d75-08d9-4520-c615-08da42517201
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 15:31:19.9786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hrKHitJAYeANPmb5QpGY9Vz7FPShSKVBgUgnuNYL0QRPgG5ZZO2CQhZP6BWUBajjlQKjRelp0hl5AqrOvDrpnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5134

On 20.05.2022 15:37, Roger Pau Monne wrote:
> --- a/xen/arch/x86/include/asm/msr-index.h
> +++ b/xen/arch/x86/include/asm/msr-index.h
> @@ -139,6 +139,24 @@
>  #define  PASID_PASID_MASK                   0x000fffff
>  #define  PASID_VALID                        (_AC(1, ULL) << 31)
>  
> +#define MSR_ARCH_LBR_CTL                    0x000014ce
> +#define  ARCH_LBR_CTL_LBREN                 (_AC(1, ULL) <<  0)
> +#define  ARCH_LBR_CTL_OS                    (_AC(1, ULL) <<  1)

Bits 2 and 3 also have meaning (USR and CALL_STACK) according to
ISE version 44. If it was intentional that you omitted those
(perhaps you intended to add only the bits you actually use right
away), it would have been nice if you said so in the description.

> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -1963,6 +1963,29 @@ void do_device_not_available(struct cpu_user_regs *regs)
>  #endif
>  }
>  
> +static bool enable_lbr(void)
> +{
> +    uint64_t debugctl;
> +
> +    wrmsrl(MSR_IA32_DEBUGCTLMSR, IA32_DEBUGCTLMSR_LBR);
> +    rdmsrl(MSR_IA32_DEBUGCTLMSR, debugctl);
> +    if ( !(debugctl & IA32_DEBUGCTLMSR_LBR) )
> +    {
> +        /*
> +         * CPUs with no model-specific LBRs always return DEBUGCTLMSR.LBR
> +         * == 0, attempt to set arch LBR if available.
> +         */
> +        if ( !boot_cpu_has(X86_FEATURE_ARCH_LBR) )
> +            return false;
> +
> +        /* Note that LASTINT{FROMIP,TOIP} matches LER_{FROM_IP,TO_IP} */
> +        wrmsrl(MSR_ARCH_LBR_CTL, ARCH_LBR_CTL_LBREN | ARCH_LBR_CTL_OS |
> +                                 ARCH_LBR_CTL_RECORD_ALL);
> +    }
> +
> +    return true;
> +}

Would it make sense to try architectural LBRs first?

> @@ -1997,7 +2020,7 @@ void do_debug(struct cpu_user_regs *regs)
>  
>      /* #DB automatically disabled LBR.  Reinstate it if debugging Xen. */
>      if ( cpu_has_xen_lbr )
> -        wrmsrl(MSR_IA32_DEBUGCTLMSR, IA32_DEBUGCTLMSR_LBR);
> +        enable_lbr();
>  
>      if ( !guest_mode(regs) )
>      {
> @@ -2179,8 +2202,8 @@ void percpu_traps_init(void)
>      if ( !ler_msr && (ler_msr = calc_ler_msr()) )
>          setup_force_cpu_cap(X86_FEATURE_XEN_LBR);
>  
> -    if ( cpu_has_xen_lbr )
> -        wrmsrl(MSR_IA32_DEBUGCTLMSR, IA32_DEBUGCTLMSR_LBR);
> +    if ( cpu_has_xen_lbr && !enable_lbr() )
> +        printk(XENLOG_ERR "CPU#%u: failed to enable LBR\n", smp_processor_id());
>  }

Isn't enable_lbr() failing a strong indication that we shouldn't have
set XEN_LBR just before this? IOW doesn't this want re-arranging such
that the feature bit and maybe also ler_msr (albeit some care would
be required there; in fact I think this is broken for the case of
running on non-{Intel,AMD,Hygon} CPUs [or unrecognized models] but
opt_ler being true) remain unset in that case?

As there's no good place to ask the VMX-related question, it needs to
go here: Aiui with this patch in place VMX guests will be run with
Xen's choice of LBR_CTL. That's different from DebugCtl, which - being
part of the VMCS - would be loaded by the CPU. Such a difference, if
intended, would imo again want pointing out in the description.

Jan


