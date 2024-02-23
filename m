Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E014861617
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 16:41:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684900.1065128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdXfv-0000tY-33; Fri, 23 Feb 2024 15:41:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684900.1065128; Fri, 23 Feb 2024 15:41:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdXfu-0000rv-W2; Fri, 23 Feb 2024 15:41:22 +0000
Received: by outflank-mailman (input) for mailman id 684900;
 Fri, 23 Feb 2024 15:41:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nHXq=KA=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1rdXft-0000rp-Tc
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 15:41:22 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2009::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc3705e8-d261-11ee-8a57-1f161083a0e0;
 Fri, 23 Feb 2024 16:41:19 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by DM4PR12MB5246.namprd12.prod.outlook.com (2603:10b6:5:399::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Fri, 23 Feb
 2024 15:41:15 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::22eb:b0b:62c0:f3e5]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::22eb:b0b:62c0:f3e5%6]) with mapi id 15.20.7316.023; Fri, 23 Feb 2024
 15:41:15 +0000
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
X-Inumbo-ID: fc3705e8-d261-11ee-8a57-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXlTMmglhcrhqV0RbcCZNkOIfAltjwSbkY6Rdzc5o5TKEzUqtnE71Dityq1zpqBEDjLCx6xT0p+tpJVGuB6oFbZbXBIaiuIRI9d9KZvoj4ZOeNmJSrBkEoAmkB04iBagfoDkfhbrB5QsKmCQMarPjfxMC7BbwopZnnb1G5LCwxoHMJ8T3rBE8XiT6oXdwWgEkSQJDJJBa0lteWFBm/kyR5jqitBhisfMjTzj+cjIuuqHK+KwTr2d3nYANCKgtV/ebl9j63yn1LSY0DONKICYSDpeGYNTFFSnIa6zCLmi6fg5Xnb9GqlScwDpmQlfixtsGgxTs4Km9CkuYzUrgcHJig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5q0K7Dq6T/xYtj3KkhpP9soL7g+L03o69A9EYnaFMMs=;
 b=FrVH4Efec5+Iq+aaK27nFx2917rkHdPCzOD3Wku3M0Ew4+2ayy2kOP0Hkw/ub+wSsc5w6hmA2HDomPqeF7N9mPtER4g5JJwp0Kr4zRzF2t0xGxOiccCFssRvg/07U916uTPdD6YQwrCOLxVUijjaVERvXF0nSfbNjmtv1trSovCRz0kPMaeICtEw4MTEWpQDrpcrExJiSI52fAXQtozk1evSsKYg7u6+gpxTivkIrcMKtPCxcXsIh3sCiifvZvdKes7wHX7TfiEAUpMVEPzXOR3JOJXO53uYCKvNXMNYcP7qd5zv2p1oiCG+HjkQCpz3/DzvosKD3kpVsbPBS2+mNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5q0K7Dq6T/xYtj3KkhpP9soL7g+L03o69A9EYnaFMMs=;
 b=S1yq+Lo0cMH/OQIiOpRa45mliydj51WbK8ImGzEaz5tBADUKqnV1Yj/Uic9IuxA0SoY3TbeAFeBwZX0J7oL4KEmYiv5LbQO9ax7712gmkFWmoMirfaAeOocNH5XRpDqaxTRQ78KRRIVTV3Ux/M92lmz9lZOFYkPuMVRLQNG8csA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <c5c0a46b-8793-481d-a678-da0929a0d6e9@amd.com>
Date: Fri, 23 Feb 2024 15:41:10 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN v5 2/3] xen/arm: arm64: Add emulation of Debug Data Transfer
 Registers
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, michal.orzel@amd.com
References: <20240220121743.3680715-1-ayan.kumar.halder@amd.com>
 <20240220121743.3680715-3-ayan.kumar.halder@amd.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20240220121743.3680715-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0526.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::12) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|DM4PR12MB5246:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e3d8eca-cae8-4ef1-fa38-08dc3485dea9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IU9z36TpQD5+e6oYsXwyjcGSVj2wghj4DIDZhPPlRoKsFdxt1OWud6ZuljL8vpNk0YOpOJryADJy3rSh5aTtE2MIWR5616fRmkSmELTHR0JNtsZsQQKMeRKBzPIrXGhK1GTkgngUJBxojNwAtckXFWsjI28KbL2Iujl4O6UVIsKqQzc76Ne04kyGBAunPOuptpJLbXHs9nBQDIncWaJWfNaENFiGBr5x2lFyeBU3CmNoY8Av5PqkEF1kNWTJpZ9shk77CingQqEZjjITR1Lh3/XcyCT1bzqWmM+Y4dIxL+wV08rkWkgSYKEENZReilvmIQlRIDoP/E5c6B2dz56jG2TXsp6KPyIGcOwbk38euW/WgJSeKTbphF6SlpPkfNzgHR8pvqXd0ZEnJaH6adj34clKsuzCCgs74IBAYjQDSGlwvtz29ED6AKB6sRacvVBsmFWquyr29WRZNLtbWKxxHKbdv15LScWWYsnksKPoLfl7YVBr+lZU2KZmK1aeB98c9lYM85To9pFRK9lztZJ2S3XkZtklr54b+geyzT3UPCc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzgxT2RHSHdVbVNqZGZhYUxuSEVQZ0hVaENORTQvZG1xRXJhbEkyVk9jcThv?=
 =?utf-8?B?aHlITldwY1dJZkVmYVhhS0cyNzlBeGVyRW5tMVpTMXF3NWxNQ1Npa2JYM2lS?=
 =?utf-8?B?YThPUG41dVlSTXRLb2tTZFZFYXpNQ2RGVkl4WHM2NFRnM0oxMUlSWFdxSGRC?=
 =?utf-8?B?NlVSMldWRWJTUlJIVlBHZFh4V2tWWXJkMUN5ckpLSFJpWjhsNVhWOXJuUURJ?=
 =?utf-8?B?MDV4ZVNnclVrSzllSUxkd3o4V0pKNGh2Qm5FZUs2MHlGYVUxUDVySU94Sitx?=
 =?utf-8?B?M1ZtK1NubW42bzYwQ0F2TTZRbGdrc2tocURnamFqQ2I2UzlJbCtJSTVuQXh5?=
 =?utf-8?B?ZVI2UlJYZzlPN0lOMzJuTDZXTjJudUNRK1ZZYldRaEhtdEVqYzdjOFJIYXYy?=
 =?utf-8?B?VDRmZmowTHJYOXFQemQ4bWloZVhDUDViZHZTMFFaNm92VzYyTUhWZ0NwdmQx?=
 =?utf-8?B?UDUvYjhvN1AyNzYvYVgveUNGUDdBdm5SYnVnN0dRMVQ4MlJHRVdqOE5XMUcv?=
 =?utf-8?B?cU1BOW5aMnJFcnp0TkNQSVRDNEJZZkNGYzVjdXVRL3VoZkdlVi80NDBXTnE0?=
 =?utf-8?B?NEJOQzlROWhWMk5FVHVONnpxU2VvR0dDVUpSRGEyUjJLN3N5MHVPejNzejZo?=
 =?utf-8?B?dGhzdEhQK2JFeUdqdTNNWnQ1eEpMVEZudDJLQS9QZmttZzYzOEt4b056bzZm?=
 =?utf-8?B?amIrU3lUQk1GaHBnbUhGVnZnR3YwRWhDN3YycjkvbGNLZUU3VFczWnhVa29z?=
 =?utf-8?B?WGcveVVGQ05FYVBQL2FUV2gwbzJiK0p1YWFmZnlFbjZsZHFVQ0RLQUJYbS9z?=
 =?utf-8?B?d2RzcVlpVWJEY3NCSDZwOXlJVDlvV011UmdBRTVmV3IvcUZLbS9tV01VVy90?=
 =?utf-8?B?VGJDMHEyRHlIVUZLUkJDSFc5UmtYSFFqODdneFhrNjlDemY4VkxEbTBja2xO?=
 =?utf-8?B?Yi82QXQyQ0FoUU1SNG0rWjNxR2xFUHRUOGhPVVFid1lROVhvR0xWOUxFUk5T?=
 =?utf-8?B?dmp6czZiMXBuYmJheVFrMWs1bGg1czh2Zm5YZTh2aGZGSzZoVmVCM2JrbEdq?=
 =?utf-8?B?RUtiSXV4cGY4T2M1QTFYRXhpdC9pM0dDVjZjTElYcE4vSXFra1RmOWxYZkNy?=
 =?utf-8?B?NW9Da1k1bjFrWkcxckRQWC84WmdPMXdYU1pQb2VQZzlwd2tOMkl6MmphblEw?=
 =?utf-8?B?NllSWHh0WU1OUkNuRW90YWZkYXRldk8yVGdkMXFUZlR1S0VOclRhUUlYUHBo?=
 =?utf-8?B?djVIYlZEcFR3VnJiZ055SzhrQXdicWZpMHkzWUlPQ2VYcUNyUDVSeGJvYkE3?=
 =?utf-8?B?QU1vNU9wWVdsUnE0YTdQMEZXZXJnREZBS2hUTDZXREdBNXM2UE5NTFlvMXgx?=
 =?utf-8?B?UUtodmN0bXFObk5CRW50NDBMN3QybTIyNE5neVRQME00bUIzWldTb2VpMGtT?=
 =?utf-8?B?MVdOZko5MFFzVEh6SW1tKzZuOURtVXZBS2VoOVBUS1h0ZWI2YzJNSHFhd3Vo?=
 =?utf-8?B?ZGxvbEpmZDMxbWZSNEdwc2hJVTk5RWZMclZxbnVSN0dFQVhXbVpvSFdYdmZ1?=
 =?utf-8?B?cjVYbDR6ZG1sZzhUMGhac3hFZHZLZ3VSUFFSUTVLUkdsZ2ZFV0hGQXF5L0hD?=
 =?utf-8?B?bkNBbzgySDRIK3lGRTdnUnFpMW9UTzNQRGpZVWp1UDNMVlA1L1ZjRHYwU0s0?=
 =?utf-8?B?UkdrT3FHZExBTW5jUUxqbEVRejE3clpzWFFlYkVvZlpISGNGd2FFT2hBS2Rm?=
 =?utf-8?B?eE1UL1NFdkRhK09UQm5BazV0QVlyZWpkSjN0Mms0VHRaSVo1bHZkKzFjNXc3?=
 =?utf-8?B?ZytvOG9xYXhhekZ1NjZ4eURHYkNWUkdXUjlWclF1aUo3Q3hsYk14dmxRNXJR?=
 =?utf-8?B?Vjd1TzBadzBURldxckNQOGxXeHJEbU84dTJoTmNCV0p5T0IwUkp0UkdIYU53?=
 =?utf-8?B?MDlKbGMzSHlSem9WU2xIRHBIQ0ROT2VxMjc2aUx0Q05FaDAvZkFoZXk2MXUr?=
 =?utf-8?B?VnEyZUM0UlFNK2h6NFlQeVlsSndJRmF3OE1jYWFYWUN0VlZRWEJTUkFoWnFX?=
 =?utf-8?B?ZHF5M2VhaFE3ckM3a2JxdlM0YVdMZ0N5VEZqekxZUEloVmxWVWt3YVRXQ2tt?=
 =?utf-8?Q?CqVqPBB0hpWQG75ECOv81ErBq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e3d8eca-cae8-4ef1-fa38-08dc3485dea9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2024 15:41:15.2035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cs9wjPnrvhbjO8A9JGcahhesFF4QO57qPQIAHVLrJA97ew+ZPT5ZsgmDfeg8u6tu9ixfooqr9qJ6OYVFfkrJwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5246

Hi,

On 20/02/2024 12:17, Ayan Kumar Halder wrote:
> From: Michal Orzel <michal.orzel@amd.com>
>
> Currently, if user enables HVC_DCC config option in Linux, it invokes access
> to debug data transfer registers (i.e. DBGDTRTX_EL0 on arm64, DBGDTRTXINT on
> arm32). As these registers are not emulated, Xen injects an undefined
> exception to the guest and Linux crashes.
>
> To prevent this crash, introduce a partial emulation of DBGDTR[TR]X_EL0
> (these registers share the same encoding) as RAZ/WI and MDCCSR_EL0 as TXfull.
>
> Refer ARM DDI 0487J.a ID042523, D19.3.8, DBGDTRTX_EL0
> "If TXfull is set to 1, set DTRRX and DTRTX to UNKNOWN".
>
> Thus, any OS is expected to read MDCCSR_EL0 and check for TXfull before
> using DBGDTRTX_EL0. Linux does it via hvc_dcc_init() ---> hvc_dcc_check(),
> and returns -ENODEV in case TXfull bit is still set after writing a test
> character. This way we prevent the guest from making use of HVC DCC as a
> console.
>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> ---
> Changes from
>
> v1 :- 1. DBGDTR_EL0 does not emulate RXfull. This is to avoid giving the OS any
> indication that the RX buffer is full and is waiting to be read.
>
> 2. In Arm32, DBGOSLSR is emulated. Also DBGDTRTXINT is emulated at EL0 only.
>
> 3. Fixed the commit message and inline code comments.
>
> v2 :- 1. Split the patch into two (separate patches for arm64 and arm32).
> 2. Removed the "fail" label.
> 3. Fixed the commit message.
>
> v3 :- 1. "HSR_SYSREG_MDCCSR_EL0" emulation differs based on whether
> partial_emulation_enabled is true or not.
>
> 2. If partial_emulation_enabled is false, then access to HSR_SYSREG_DBGDTR_EL0,
> HSR_SYSREG_DBGDTRTX_EL0 would lead to undefined exception.
>
> v4 :- 1. Invoked "goto fail" from "default:" to ensure compliance with
> MISRA 15.3.
>
>   xen/arch/arm/arm64/vsysreg.c         | 68 +++++++++++++++++++---------
>   xen/arch/arm/include/asm/arm64/hsr.h |  3 ++
>   2 files changed, 50 insertions(+), 21 deletions(-)
>
> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> index b5d54c569b..80918bc799 100644
> --- a/xen/arch/arm/arm64/vsysreg.c
> +++ b/xen/arch/arm/arm64/vsysreg.c
> @@ -82,6 +82,7 @@ TVM_REG(CONTEXTIDR_EL1)
>   void do_sysreg(struct cpu_user_regs *regs,
>                  const union hsr hsr)
>   {
> +    const struct hsr_sysreg sysreg = hsr.sysreg;
>       int regidx = hsr.sysreg.reg;
>       struct vcpu *v = current;
>   
> @@ -159,9 +160,6 @@ void do_sysreg(struct cpu_user_regs *regs,
>        *
>        * Unhandled:
>        *    MDCCINT_EL1
> -     *    DBGDTR_EL0
> -     *    DBGDTRRX_EL0
> -     *    DBGDTRTX_EL0
>        *    OSDTRRX_EL1
>        *    OSDTRTX_EL1
>        *    OSECCR_EL1
> @@ -171,12 +169,42 @@ void do_sysreg(struct cpu_user_regs *regs,
>        */
>       case HSR_SYSREG_MDSCR_EL1:
>           return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
> +
> +    /*
> +     * Xen doesn't expose a real (or emulated) Debug Communications Channel
> +     * (DCC) to a domain. Yet the Arm ARM implies this is not an optional
> +     * feature. So some domains may start to probe it. For instance, the
> +     * HVC_DCC driver in Linux (since f377775dc083 and at least up to v6.7),
> +     * will try to write some characters and check if the transmit buffer
> +     * has emptied.
> +     */
>       case HSR_SYSREG_MDCCSR_EL0:
>           /*
> +         * By setting TX status bit (only if partial emulation is enabled) to
> +         * indicate the transmit buffer is full, we would hint the OS that the
> +         * DCC is probably not working.
> +         *
> +         * Bit 29: TX full
> +         *
>            * Accessible at EL0 only if MDSCR_EL1.TDCC is set to 0. We emulate that
>            * register as RAZ/WI above. So RO at both EL0 and EL1.
>            */
> -        return handle_ro_raz(regs, regidx, hsr.sysreg.read, hsr, 0);
> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 0,
> +                                  partial_emulation ? (1U << 29) : 0);
> +
> +    case HSR_SYSREG_DBGDTR_EL0:
> +    /* DBGDTR[TR]X_EL0 share the same encoding */
> +    case HSR_SYSREG_DBGDTRTX_EL0:
> +        /*
> +         * Emulate as RAZ/WI (only if partial emulation is enabled) to prevent
> +         * injecting undefined exception.
> +         * Accessible at EL0 only if MDSCR_EL1.TDCC is set to 0. We emulate that
> +         * register as RAZ/WI.
> +         */
> +        if ( !partial_emulation )
> +            goto fail;
> +        return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 0);
> +
>       HSR_SYSREG_DBG_CASES(DBGBVR):
>       HSR_SYSREG_DBG_CASES(DBGBCR):
>       HSR_SYSREG_DBG_CASES(DBGWVR):
> @@ -394,26 +422,24 @@ void do_sysreg(struct cpu_user_regs *regs,
>        * And all other unknown registers.
>        */
>       default:
> -        {
> -            const struct hsr_sysreg sysreg = hsr.sysreg;
> -
> -            gdprintk(XENLOG_ERR,
> -                     "%s %d, %d, c%d, c%d, %d %s x%d @ 0x%"PRIregister"\n",
> -                     sysreg.read ? "mrs" : "msr",
> -                     sysreg.op0, sysreg.op1,
> -                     sysreg.crn, sysreg.crm,
> -                     sysreg.op2,
> -                     sysreg.read ? "=>" : "<=",
> -                     sysreg.reg, regs->pc);
> -            gdprintk(XENLOG_ERR,
> -                     "unhandled 64-bit sysreg access %#"PRIregister"\n",
> -                     hsr.bits & HSR_SYSREG_REGS_MASK);
> -            inject_undef_exception(regs, hsr);
> -            return;
> -        }
> +        goto fail;
>       }
>   
>       regs->pc += 4;
> +    return;
> +
> + fail:
> +
> +    gdprintk(XENLOG_ERR,
> +             "%s %d, %d, c%d, c%d, %d %s x%d @ 0x%"PRIregister"\n",
> +             sysreg.read ? "mrs" : "msr", sysreg.op0, sysreg.op1, sysreg.crn,
> +             sysreg.crm, sysreg.op2, sysreg.read ? "=>" : "<=", sysreg.reg,
> +             regs->pc);
> +    gdprintk(XENLOG_ERR,
> +             "unhandled 64-bit sysreg access %#"PRIregister"\n",
> +             hsr.bits & HSR_SYSREG_REGS_MASK);
> +    inject_undef_exception(regs, hsr);
> +    return;

The last 'return' needs to be removed (spotted by Michal)

- Ayan


