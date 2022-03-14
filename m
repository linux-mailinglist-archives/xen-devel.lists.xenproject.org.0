Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF6B4D88F4
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 17:20:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290324.492360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTnQ9-0007rI-M3; Mon, 14 Mar 2022 16:19:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290324.492360; Mon, 14 Mar 2022 16:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTnQ9-0007np-Ix; Mon, 14 Mar 2022 16:19:45 +0000
Received: by outflank-mailman (input) for mailman id 290324;
 Mon, 14 Mar 2022 16:19:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=29fN=TZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nTnQ8-0007nj-9O
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 16:19:44 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e223b17-a3b2-11ec-853b-5f4723681683;
 Mon, 14 Mar 2022 17:19:42 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-0PDbdx2XNEmNV71punguOQ-1; Mon, 14 Mar 2022 17:19:41 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB6164.eurprd04.prod.outlook.com (2603:10a6:208:13b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.28; Mon, 14 Mar
 2022 16:19:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 16:19:39 +0000
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
X-Inumbo-ID: 8e223b17-a3b2-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647274782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MC1aTq8eBPqoW7LhedZJT2jYiMxUdc6PUR427adhDGM=;
	b=bGGkTDxGND24GGED+vbRTxvbKBfFLqd5RiXHH37HF9ZwZ4XWQjaVdMnzQn51ohkJgQZ/zo
	3HSC1lhTSJ5EAY5Z3OCFw3WSoSL7F5LvDIITe6mrIKnXnL95UjxcORWUyaVXwpFsO18qtS
	VCmhxjfoGdk8bju6jwzP3nHbZpbXBv8=
X-MC-Unique: 0PDbdx2XNEmNV71punguOQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kt8657JLAIJ2gxOmGh4eJLZPJkNb42X+MvoMSgAr0aSPXkgObeXBPKjS2dXjta3u86YAVVhOs6sHYS/4Y2HETUJdW5SdhotCFhbNLhuNVr6MGyIbZl3dii52h1TROHkviNeHnwYV9DW+rwQ9WLicoomeaXNP3zMGQmcdcr355DjW3tqBp2wB/RW8m0OGlsy28D5qjKNqgYTcOSKpdHk62yZUgUxXWFE5CtMyoQjqMabhMX36BbvQ4JgDGSeMPbsZPyDDsecrhZxa7uDBZsRASMVJw7YoC71foynDGIi5AI+oO12SJhqYE2XmRnHKn+HhPVn12Qo009kE1uK9N04Ljg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vamNvXXFeAoiY8vR1OqjNhR9vHUC1PgaJARD/Mh/ts=;
 b=Pv1qxTTNAKFSURj0HbIwvsd+lli7gCVm889IAYpAbFiu3YJNGUwPPkE+8hJAC34oOdeIeUmt/gPM/Rlw2sxK1cQZqMfpRsgzdu9hR7A+YOQ1mXQob32Abdsn7HV8OffzsLispHg8uwK1QvugLLX/f4dV5D62RecQsSwf624NHiK+l5LAdkCJzWs72AVYRO7VSFsPYgsFgm3nJ1MyJQcC3PH4O+9Gtzds+c5/Ns+sw4PyyZA4DG+qzJEV41KVyK3a2cAQb1kbnhBVEiRvEGm0TN3hUAapLSFsJyIS8J8M+P7GFLJOwj6MvN7+MWPslLgVwKKMibua6I7dmMz2M0DfeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d6bcee5b-abbd-5cef-f174-8609df94603e@suse.com>
Date: Mon, 14 Mar 2022 17:19:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 2/4] x86/APIC: calibrate against platform timer when
 possible
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <35cb3c72-05ba-24c7-1fdd-3ee1aced3aec@suse.com>
 <cb7dd6bc-79a4-2137-5e82-805b9daf5d58@suse.com>
 <YitSc/Ky6PJb5ndV@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YitSc/Ky6PJb5ndV@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0aa2260b-cf4b-4037-a6ae-08da05d6704a
X-MS-TrafficTypeDiagnostic: AM0PR04MB6164:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6164A479C655D8D560A268C5B30F9@AM0PR04MB6164.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iNut6mAaH/CpI6oCEO8+COiELcgOmZAJbhgL8Mm/Q8vXZEARXVDzPth1bDJsM6xh223ggfwx/sA21N+8GY9Tre+hld5ie3RNpDz/8ptYvsBviC+XwQow3hsRH10LM0T53rnEQJF1yN3aAhE6vbH0dL2tLF+GC0dsyKDKm32r3cVWfs0RODjtFor/BdAxTPzFPM11hzzBcLnYH6lkjYOx+zBNe+2/Uzhllv+zBVbBhnynfV4vYGj2aGNnlX9IQ8d6x6k08ethu7P0xjUIAxqiULDjJG3tOoLHIf9IuRDd2zpvAUYjnAd3741Z1AH7z0Zu4nn5q79penBIvnm4cvXlof7rFjiTrCAXcIxWmRN6Sj4Dyh4ecbaYmn+abFkJjgVrRSjFRImCA54jlg2CZTVQSz0sN4UaA3+5NEJtOnZYjgbtcRW7iS2UXfHkHiQoz3fuebF4BhnR4VihlqYhzNnic7Nx6JiXDquBOBqK4+IQc3/OvmN3yjiLW0Fy0vGtIeOnSRbLhOrfF+kNg08uqCp+p7KUxyNz5ad/QP69UrMrQhPIm+hNamDCCkNrpfFtCYouBXv7sycB2B4aPn/067+pfruLqbPc0jUBwNg4grXscSfCCDq0rI/zFbWYJmO18aVZPpd5I0DzXJeuTYUu5wqxnJAztWquFnmwkDaaxl2vZq3nIgonSE/3J5L/m+RsM++h4U4jpjWUXxBz1Z6CkxKkbFAulaC1ZKj+Y1FXU3aEHHc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(186003)(38100700002)(26005)(2616005)(31686004)(36756003)(2906002)(8676002)(4326008)(8936002)(5660300002)(6512007)(6506007)(66476007)(54906003)(6916009)(31696002)(66946007)(66556008)(53546011)(508600001)(6486002)(316002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qX/rOcr6BRMrxcRdzGzO4XOtibiuj8Gq7Nqgn5s3wSoKtPWSt5mxmmHMjtWp?=
 =?us-ascii?Q?oyXnaJVfMJpgHvnr30ERtsNuFo3U8y70pwZFtAZS+rHPrzMiP0yJXLk2Gfv/?=
 =?us-ascii?Q?QK3l335ZL9HJ1+W+4vqHLyH9H7E5IR2oCZXyMsZcC9VXloDDrykdLN9+NYlA?=
 =?us-ascii?Q?khwTJzZknM1UMieQl5kS15QYQLK79EQfC2GwfNGDs7eFG3cnGqhNSwC8YrqK?=
 =?us-ascii?Q?Dot8CHyGil4isXKMGUUP1lu481w54kqGx3gcPVzsf/MMwfnpTqnf6mX/1FZv?=
 =?us-ascii?Q?/nlhQ1ZjpvL2CwupKkQBxJP5V86fbMDvIFiEFdBy9vZ+QXFxVRPYLIPG/cVm?=
 =?us-ascii?Q?AjqH0uFiW+YwfKVGf9nRABjnOjcEngoTbIpODvFPXX50xZyeQHesLYumVPj4?=
 =?us-ascii?Q?lOxS01v6Odm9mJD4YIi76N9Sm2ho6BrpQlfCU/oyj6h60K9NbYj3t+LY32Xw?=
 =?us-ascii?Q?Ko/TdYEDsSnZxv3NRV0JnhZCpsgp62H1slgf78gjHyrTYSvd2ohBxDhsESe9?=
 =?us-ascii?Q?flkocojI4xYetrC1oXbV+2IHB3UPPxO0z4BAgIxyhDe0zjTkN+pU/P0Sbi+Y?=
 =?us-ascii?Q?hoiRUKYzu9j69Cd6Q/+KiRFhRjdT7JT1HvWBCzyXYj/MEvByR/YbBitPomxO?=
 =?us-ascii?Q?Ww9ZIyOEdVTpese26sByCohdcmq2zDM0Z3ehwoJdLKni3ZqLc/K2uXDe/IFu?=
 =?us-ascii?Q?9M8OI8LADB8ag2IPoAO5UMKjU2R7nTOhWzAEgs0EVwECVAXnmAcUxY9UucIp?=
 =?us-ascii?Q?D8U8TVXV4CWdSzKgXg+GLv11svS3hnaYSyamaxAiXsb72sKxswNqv1Zzmr1L?=
 =?us-ascii?Q?a3Nfmxezl3Td7h0eIVcCgeOcZT3I25/j3xrGKpW1xVfJBhKY0iffEvBCcNY+?=
 =?us-ascii?Q?ZC+R1uxglqYVapjIhOUgX52pmEKRjK4PBtmA0EwCNJtsnNW/oV1l3tdJiWRO?=
 =?us-ascii?Q?Zfft3zd5KA4V1RbgZvknesZ+TMPFbAhspAtDt7oIjcDOO7Pg/QnZFNMQprm/?=
 =?us-ascii?Q?hKzLmhZckVdD9zqA90krv40YxiT3jieffTo3PCwud3FUEDE4G37J51uxkjLl?=
 =?us-ascii?Q?ftX8hEPAz1X5uiB1BpGE66zU2F3p5AKzBnARHmPlzx4r3pzOdxFdrAk1MQLn?=
 =?us-ascii?Q?CSNV2AJvUBrmy8Gl2Kszc7xGnFI9ECzbE0qTqOHQttG4lpFRZgfZsvjszFV1?=
 =?us-ascii?Q?F9LzjGpAhXToBzQTcF95rx5LfNQFOaPLTTC5UInLLrsZIV5utjZI70wmO3n9?=
 =?us-ascii?Q?ThiY4DANN2n3fo/JcnLL5aIW2vnrZw0bQDsGyO4NRRu42cPQTqkETAIaZddd?=
 =?us-ascii?Q?ifx8S8lrw2ai6ZXNNyoZhZbYUljleBbpdQ3vMGxv39sATyOEwLN27PIyfKu2?=
 =?us-ascii?Q?LKUKD7OLWjiGc8Ae9hRtkhnsIGnems2yRvwOJeCw5NhMlJAeZbhmK5klDD8c?=
 =?us-ascii?Q?LEkaonYPN3dTHX8cm56nJcnPtu2ugQXe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aa2260b-cf4b-4037-a6ae-08da05d6704a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 16:19:39.2833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HRRbmBXKve5T/8wVHUJClFCTtV7QcR8R9lkzubxVGH2o/bffWoYXkBJkPfe44zsWVhJe6AB5G6GQ1NJnvSZUUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6164

On 11.03.2022 14:45, Roger Pau Monn=C3=A9 wrote:
> On Mon, Feb 14, 2022 at 10:25:11AM +0100, Jan Beulich wrote:
>> Use the original calibration against PIT only when the platform timer
>> is PIT. This implicitly excludes the "xen_guest" case from using the PIT
>> logic (init_pit() fails there, and as of 5e73b2594c54 ["x86/time: minor
>> adjustments to init_pit()"] using_pit also isn't being set too early
>> anymore), so the respective hack there can be dropped at the same time.
>> This also reduces calibration time from 100ms to 50ms, albeit this step
>> is being skipped as of 0731a56c7c72 ("x86/APIC: no need for timer
>> calibration when using TDT") anyway.
>>
>> While re-indenting the PIT logic in calibrate_APIC_clock(), besides
>> adjusting style also switch around the 2nd TSC/TMCCT read pair, to match
>> the order of the 1st one, yielding more consistent deltas.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Open-coding apic_read() in read_tmcct() isn't overly nice, but I wanted
>> to avoid x2apic_enabled being evaluated twice in close succession. (The
>> barrier is there just in case only anyway: While this RDMSR isn't
>> serializing, I'm unaware of any statement whether it can also be
>> executed speculatively, like RDTSC can.) An option might be to move the
>> function to apic.c such that it would also be used by
>> calibrate_APIC_clock().
>=20
> I think that would make sense. Or else it's kind of orthogonal that we
> use a barrier in calibrate_apic_timer but not in calibrate_APIC_clock.

But there is a barrier there, via rdtsc_ordered(). Thinking about
this again, I'm not not even sure I'd like to use the helper in
calibrate_APIC_clock(), as there's no need to have two barriers
there.

But I guess I'll move the function in any event, so it at least
feels less like a layering violation. But I still would want to
avoid calling apic_read(), i.e. the function would remain as is
(albeit perhaps renamed as becoming non-static).

> But maybe we can get rid of the open-coded PIT calibration in
> calibrate_APIC_clock? (see below)
>=20
>> --- a/xen/arch/x86/time.c
>> +++ b/xen/arch/x86/time.c
>> @@ -26,6 +26,7 @@
>>  #include <xen/symbols.h>
>>  #include <xen/keyhandler.h>
>>  #include <xen/guest_access.h>
>> +#include <asm/apic.h>
>>  #include <asm/io.h>
>>  #include <asm/iocap.h>
>>  #include <asm/msr.h>
>> @@ -1004,6 +1005,78 @@ static u64 __init init_platform_timer(vo
>>      return rc;
>>  }
>> =20
>> +static uint32_t __init read_tmcct(void)
>> +{
>> +    if ( x2apic_enabled )
>> +    {
>> +        alternative("lfence", "mfence", X86_FEATURE_MFENCE_RDTSC);
>> +        return apic_rdmsr(APIC_TMCCT);
>> +    }
>> +
>> +    return apic_mem_read(APIC_TMCCT);
>> +}
>> +
>> +static uint64_t __init read_pt_and_tmcct(uint32_t *tmcct)
>> +{
>> +    uint32_t tmcct_prev =3D *tmcct =3D read_tmcct(), tmcct_min =3D ~0;
>> +    uint64_t best =3D best;
>> +    unsigned int i;
>> +
>> +    for ( i =3D 0; ; ++i )
>> +    {
>> +        uint64_t pt =3D plt_src.read_counter();
>> +        uint32_t tmcct_cur =3D read_tmcct();
>> +        uint32_t tmcct_delta =3D tmcct_prev - tmcct_cur;
>> +
>> +        if ( tmcct_delta < tmcct_min )
>> +        {
>> +            tmcct_min =3D tmcct_delta;
>> +            *tmcct =3D tmcct_cur;
>> +            best =3D pt;
>> +        }
>> +        else if ( i > 2 )
>> +            break;
>> +
>> +        tmcct_prev =3D tmcct_cur;
>> +    }
>> +
>> +    return best;
>> +}
>> +
>> +uint64_t __init calibrate_apic_timer(void)
>> +{
>> +    uint32_t start, end;
>> +    uint64_t count =3D read_pt_and_tmcct(&start), elapsed;
>> +    uint64_t target =3D CALIBRATE_VALUE(plt_src.frequency), actual;
>> +    uint64_t mask =3D (uint64_t)~0 >> (64 - plt_src.counter_bits);
>> +
>> +    /*
>> +     * PIT cannot be used here as it requires the timer interrupt to ma=
intain
>> +     * its 32-bit software counter, yet here we run with IRQs disabled.
>> +     */
>=20
> The reasoning in calibrate_APIC_clock to have interrupts disabled
> doesn't apply anymore I would think (interrupts are already enabled
> when we get there),

setup_boot_APIC_clock() disables IRQs before calling
calibrate_APIC_clock(). Whether the reasoning still applies is hard
to tell - I at least cannot claim I fully understand the concern.

> and hence it seems to me that calibrate_APIC_clock
> could be called with interrupts enabled and we could remove the
> open-coded usage of the PIT in calibrate_APIC_clock.

I won't exclude this might be possible, but it would mean changing
a path which is hardly ever used nowadays. While on one hand this
means hardly anyone might notice, otoh it also means possible
breakage might not be noticed until far in the future. It anyway
feels too much for a single change to also alter calibration against
PIT right here.

One thing seems quite clear though: Doing any of this with interrupts
enabled increases the chances for the read pairs to not properly
correlate, due to an interrupt happening in the middle. This alone is
a reason for me to want to keep IRQs off here.

Jan


