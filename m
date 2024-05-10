Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF978C2972
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 19:41:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719992.1122890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5UES-000885-JT; Fri, 10 May 2024 17:40:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719992.1122890; Fri, 10 May 2024 17:40:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5UES-00086Y-Fl; Fri, 10 May 2024 17:40:32 +0000
Received: by outflank-mailman (input) for mailman id 719992;
 Fri, 10 May 2024 17:40:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ycSx=MN=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1s5UEQ-00086S-BY
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 17:40:30 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2414::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6318a868-0ef4-11ef-909d-e314d9c70b13;
 Fri, 10 May 2024 19:40:28 +0200 (CEST)
Received: from DS7PR03CA0297.namprd03.prod.outlook.com (2603:10b6:5:3ad::32)
 by DS7PR12MB6045.namprd12.prod.outlook.com (2603:10b6:8:86::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.46; Fri, 10 May
 2024 17:40:21 +0000
Received: from DS3PEPF0000C37E.namprd04.prod.outlook.com
 (2603:10b6:5:3ad:cafe::9a) by DS7PR03CA0297.outlook.office365.com
 (2603:10b6:5:3ad::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.48 via Frontend
 Transport; Fri, 10 May 2024 17:40:21 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF0000C37E.mail.protection.outlook.com (10.167.23.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Fri, 10 May 2024 17:40:21 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 10 May
 2024 12:40:19 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 10 May
 2024 12:40:19 -0500
Received: from [172.30.155.127] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 10 May 2024 12:40:18 -0500
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
X-Inumbo-ID: 6318a868-0ef4-11ef-909d-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FvafahyBO87WAMtN8IBUGdj/ssg7lvYqbzM1vaatAHu12M6gz3T7G4q8PEROremfS+l79p7DxJa4jyHmcFC9uD8V85sHI4FkI2wOsJzKngdxJ4t3I3fkQfzht+OVtfJzmqslC7Pd7FQUKjCNw8Gi2iTHAh783sYA9HbuiH/2Lh8scGTpIHlYnQMGwO5sobBOugUUgOTeVoIp8EUBJIgr6EFAUQPpGBRpa8VHgkMzS3cyUK7/iVChJzjsecPG7Ff09v5JvzikUocdGP63gNgfT3NIwpccwuWQlgoQJx58dSoE+rftrP2li666g5S7EQ5S480PESNWMrl0AyZkYA7b/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a11P9yYW/fZFQXXStAFZjMiY+7Mw3PQbrY/J83w7YV0=;
 b=gpgX+f3r8zMhgh2lPatmGJ5KjkSXuVwyKeozmxjS821YR4c2ECdfzGBxRc8Pp7saWhVMuFRpPYX3j+PX9eJRjOylvWL9+PGJu+NiMxfKHYLyV6j0uaknvOUnhSsngeuAbu9gJb7AIXW1ouy0YDomN6GxfOglWRiCBbszpekl8O6L7IXHtOJilRiBoiakvgmI1yGDo8vxpiddaPON2rsyF18qduSYNAeVis0/5ulDTzcOLAZId3WpiEAiLxGvxl2iSMALtiwh7DXlc14gPGcA3XzTk+tD8LQR484dqYvRGqZZ4m95cSyKbMvblugVGEshzBD2QfbPTShoFmSt6L8J4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a11P9yYW/fZFQXXStAFZjMiY+7Mw3PQbrY/J83w7YV0=;
 b=zmxEAJvlmWDt18xN7RrdlhyHR2ygpf09S+QvrmIV1vVl/UYo1VndasxocjxwAn4RJp7Js1HCCvaNRo5ttUwyw10kNq6J8c0JjeAvUMdujGyxQunMzlUQo4t6KxwSGAl7pvgLSc0sysjRMpFnIQfHqjKJsUXM7W7c84dHDKDM/fw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <0cfaeb1f-947a-4e45-9f69-a0e3f8143e2a@amd.com>
Date: Fri, 10 May 2024 13:40:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86: detect PIT aliasing on ports other than
 0x4[0-3]
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <0c45155a-2beb-4e69-bca3-cdf42ba22f2b@suse.com>
 <039b9ceb-4862-4e26-a344-e47fc04bd979@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <039b9ceb-4862-4e26-a344-e47fc04bd979@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37E:EE_|DS7PR12MB6045:EE_
X-MS-Office365-Filtering-Correlation-Id: 5687ec14-f0c0-4af0-3991-08dc711843fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|376005|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OFVzUXZiZTFnMUFXSVpkcks0TGJWVk9zVXJ5SmQ0NmsyQlBPN1hxcVhIbFJk?=
 =?utf-8?B?N21vNm9IanFrQVdrc2hxTFhteS9SeVRjUkVDR0k0S2VKMEJPa09Ea0s2VmNp?=
 =?utf-8?B?TFBBWkcrd0JLYXcwMkY1aFRNUkRMeHdKd3dkc0phcTJ6R0RiZWVFaDBDbDZj?=
 =?utf-8?B?N2lia3dDMHAvOWloVjRENVFXMnJpTlV1U3MrVUdXMWFqRlUzeFEvVTkyaVZV?=
 =?utf-8?B?d21vQTNPY2xXclE1dE14eFQ5QVRMZ21kb01WR2x4dFdURzkyS3VmckQ2Nyt5?=
 =?utf-8?B?cE03Yk1XdjY2cXg5aUNiZlBRRXI0UW1NWjg2TVpkZ2M5aTB1dG1oenNUZW5R?=
 =?utf-8?B?eFBkUU4vVzc5Qy9JWXcxeU5LNEY5MkZFdnREZEhzZ0JEOHhUNFZuaGhlaXZI?=
 =?utf-8?B?SWtrZ01ZS2hERy9idEZ2YlV1UVRCRHJnSWsyMi8wdXpUaTFiSTRBSFhZVjgz?=
 =?utf-8?B?Zy9jUWxTS2pOK0Z5elhPWTU4RE9WcnFlb29sT0JPSVAvN25rUHJBQTlnZEdr?=
 =?utf-8?B?dGlvVGorWDdCV0RHZEkyMDgrRjRmZFp3TUxsUFQ3aGpsRWcwYlVRVXA0Y2Rv?=
 =?utf-8?B?eHpqTjF6STF1WWpSeTVLdDk2UlA4YkoyZ2VpTVo5c3Z5cjNRNmFhNGxOMWtG?=
 =?utf-8?B?a1BLRzVFZDdEbGVRYkdkZ01KN2RnbFFLVjdLRHdYSkE4bW5BcDFQZStxNG42?=
 =?utf-8?B?ZXhacWZlVjVSNGFTcVhWR09JY2FyOVJFbDdNeHk2amRsejVQL3YxcFV2M0Fv?=
 =?utf-8?B?emtVdzRrTlR1RFhGclhPQXFrWi9oUWtoMU5Ra1RzN2NMYmdWMVdQQmxLdWdH?=
 =?utf-8?B?blBBcjN1T2VidURhZnRINjR2dFJEajhwMDB1NjRkbktSYmVoZVlOcDlPeHFX?=
 =?utf-8?B?amNEZWQvMURid2wxcmdwakx3MmJSaDBQQjVsRndvQTNOdUpHVGU0T3BJak9I?=
 =?utf-8?B?MDBqQXZORXJ2aUdZNTZzZzNvWGxmL1U0ZFo1akNtSzdzVXU3SDJncHhhWHZS?=
 =?utf-8?B?dTJ6OGltYks3OXpzSUpYTGFIMFd2Vk1hUzZDOHNGTE1SVXE1S0YvNjN2Sjkv?=
 =?utf-8?B?Z3QzSkQ4d2J4K1FhdytGVjFhOXFHSHdlWlkrYkU2b2VpbmdpeGZwVFF1bE5i?=
 =?utf-8?B?dTFydnl0V0xxelNxUkM5c2oraGlDbXBEMkt0YXEwbUcrNmhCNW54dTgzbkZ5?=
 =?utf-8?B?aG5qS3NYT05kdG51Z0M4YkNjWFFpTklRV204SlhaRjdRd0h1V1F4TmVqMTZV?=
 =?utf-8?B?UnBtbk9mL0phU3VBcGRudkdrbjhjTTlrRDMrTjRDekptOVpmd2ttT1Q1Z2ZJ?=
 =?utf-8?B?VFFXMHJOWHRUcThyUVZvUkFoZkNWc2h6aTk4T0JQSGF2TVdGVjFnZ3hHTW1W?=
 =?utf-8?B?dnpxTlZEMlk1Nk4vUi82YkZkZ3pvUVc2OTI4MS8yY29NalY2RG5PdVMzYWNQ?=
 =?utf-8?B?bkJ1NmdwWUxFaWZhMVdrQnpteTR6ZCtBM3gwK3ZQREtyTlJiU0RmWGtxWU5P?=
 =?utf-8?B?WE9vYnBMdkZhR2RGaFdIazZCTDRjV1o0NTI2YWF2eENUN0tlNWdKUE9wWUxJ?=
 =?utf-8?B?NnFaN0JpTHFSR294MjZFanFNek1zbkZtN2ZnNzdtcUthSGx0N09xUXU4eWtt?=
 =?utf-8?B?RVFkaTBVZzdxR1J6VDlQeDVBci9rOXNtc0hMNVhta09VT3BJejM1SDRIdEdl?=
 =?utf-8?B?d0pHdElMT0Y4UVFNcnArSkJzb3ZUVVE4bkhlQXNKaGczWVZyQTJMTjNTN3Rn?=
 =?utf-8?B?M3hWQXRjVUhoS1BtWW12VVcrZkF2bVpxVWtHQkhVY3RDMllVQkdPYnJ4ZmdR?=
 =?utf-8?B?WW1EUkN3YlUvSHEwV3V3Sm5WbW5XaTcvd0QxNHAvZG5ibXJMOFBzRDQvK0lm?=
 =?utf-8?Q?jsc9TBpQ/hanv?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 17:40:21.0803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5687ec14-f0c0-4af0-3991-08dc711843fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6045

On 2023-12-18 09:48, Jan Beulich wrote:
> ... in order to also deny Dom0 access through the alias ports. Without
> this it is only giving the impression of denying access to PIT. Unlike
> for CMOS/RTC, do detection pretty early, to avoid disturbing normal
> operation later on (even if typically we won't use much of the PIT).
> 
> Like for CMOS/RTC a fundamental assumption of the probing is that reads
> from the probed alias port won't have side effects (beyond such that PIT
> reads have anyway) in case it does not alias the PIT's.
> 
> At to the port 0x61 accesses: Unlike other accesses we do, this masks

s/At/As/

> off the top four bits (in addition to the bottom two ones), following
> Intel chipset documentation saying that these (read-only) bits should
> only be written with zero.

This might be more useful in a comment next to `& 0x0c`.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> If Xen was running on top of another instance of itself (in HVM mode,
> not PVH, i.e. not as a shim), prior to 14f42af3f52d ('x86/vPIT: account
> for "counter stopped" time') I'm afraid our vPIT logic would not have
> allowed the "Try to further make sure ..." check to pass in the Xen
> running on top: We don't respect the gate bit being clear when handling
> counter reads. (There are more unhandled [and unmentioned as being so]
> aspects of PIT behavior though, yet it's unclear in how far addressing
> at least some of them would be useful.)
> ---
> v2: Use new command line option. Re-base over changes to earlier
>      patches. Use ISOLATE_LSB().
> 
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -495,7 +495,11 @@ int __init dom0_setup_permissions(struct
>       rc |= ioports_deny_access(d, 0x4D0, 0x4D1);
>   
>       /* Interval Timer (PIT). */
> -    rc |= ioports_deny_access(d, 0x40, 0x43);
> +    for ( offs = 0, i = ISOLATE_LSB(pit_alias_mask) ?: 4;
> +          offs <= pit_alias_mask; offs += i )
> +        if ( !(offs & ~pit_alias_mask) )
> +            rc |= ioports_deny_access(d, 0x40 + offs, 0x43 + offs);
> +
>       /* PIT Channel 2 / PC Speaker Control. */
>       rc |= ioports_deny_access(d, 0x61, 0x61);
>   
> --- a/xen/arch/x86/include/asm/setup.h
> +++ b/xen/arch/x86/include/asm/setup.h
> @@ -47,6 +47,7 @@ extern unsigned long highmem_start;
>   #endif
>   
>   extern unsigned int i8259A_alias_mask;
> +extern unsigned int pit_alias_mask;
>   
>   extern int8_t opt_smt;
>   extern int8_t opt_probe_port_aliases;
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -425,6 +425,72 @@ static struct platform_timesource __init
>       .resume = resume_pit,
>   };
>   
> +unsigned int __initdata pit_alias_mask;
> +
> +static void __init probe_pit_alias(void)
> +{
> +    unsigned int mask = 0x1c;
> +    uint8_t val = 0;
> +
> +    if ( !opt_probe_port_aliases )
> +        return;
> +
> +    /*
> +     * Use channel 2 in mode 0 for probing.  In this mode even a non-initial
> +     * count is loaded independent of counting being / becoming enabled.  Thus
> +     * we have a 16-bit value fully under our control, to write and then check
> +     * whether we can also read it back unaltered.
> +     */
> +
> +    /* Turn off speaker output and disable channel 2 counting. */
> +    outb(inb(0x61) & 0x0c, 0x61);
> +
> +    outb((2 << 6) | (3 << 4) | (0 << 1), PIT_MODE); /* Mode 0, LSB/MSB. */

Channel 2, Lobyte/Hibyte, 0b000 Mode 0, (Binary)

#define PIT_MODE_CH2 (2 << 6)
#define PIT_MODE0_16BIT ((3 << 4) | (0 << 1))

outb(PIT_MODE_CH2 | PIT_MODE0_16BIT, PIT_MODE);

> +
> +    do {
> +        uint8_t val2;
> +        unsigned int offs;
> +
> +        outb(val, PIT_CH2);
> +        outb(val ^ 0xff, PIT_CH2);
> +
> +        /* Wait for the Null Count bit to clear. */
> +        do {
> +            /* Latch status. */
> +            outb((3 << 6) | (1 << 5) | (1 << 3), PIT_MODE);

Read-back, Latch status,  read back timer channel 2

> +
> +            /* Try to make sure we're actually having a PIT here. */
> +            val2 = inb(PIT_CH2);
> +            if ( (val2 & ~(3 << 6)) != ((3 << 4) | (0 << 1)) )

if ( (val2 & PIT_RB_MASK) != PIT_MODE0_16BIT )

I think particularly a define for PIT_MODE0_16BIT would be helpful to 
show what is expected to be the same.

> +                return;
> +        } while ( val2 & (1 << 6) );

I think Roger might have mentioned on an earlier version - would it make 
sense to have a counter to prevent looping forever?

Also, FYI, I tested the series.  My test machine didn't show any aliasing.

Thanks,
Jason

> +
> +        /*
> +         * Try to further make sure we're actually having a PIT here.
> +         *
> +         * NB: Deliberately |, not ||, as we always want both reads.
> +         */
> +        val2 = inb(PIT_CH2);
> +        if ( (val2 ^ val) | (inb(PIT_CH2) ^ val ^ 0xff) )
> +            return;
> +
> +        for ( offs = ISOLATE_LSB(mask); offs <= mask; offs <<= 1 )
> +        {
> +            if ( !(mask & offs) )
> +                continue;
> +            val2 = inb(PIT_CH2 + offs);
> +            if ( (val2 ^ val) | (inb(PIT_CH2 + offs) ^ val ^ 0xff) )
> +                mask &= ~offs;
> +        }
> +    } while ( mask && (val += 0x0b) );  /* Arbitrary uneven number. */
> +
> +    if ( mask )
> +    {
> +        dprintk(XENLOG_INFO, "PIT aliasing mask: %02x\n", mask);
> +        pit_alias_mask = mask;
> +    }
> +}
> +
>   /************************************************************
>    * PLATFORM TIMER 2: HIGH PRECISION EVENT TIMER (HPET)
>    */
> @@ -2414,6 +2480,8 @@ void __init early_time_init(void)
>       }
>   
>       preinit_pit();
> +    probe_pit_alias();
> +
>       tmp = init_platform_timer();
>       plt_tsc.frequency = tmp;
>   
> 
> 
> 

