Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6868CC29C
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 15:57:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727722.1132369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9mTE-00010F-9e; Wed, 22 May 2024 13:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727722.1132369; Wed, 22 May 2024 13:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9mTE-0000xV-61; Wed, 22 May 2024 13:57:32 +0000
Received: by outflank-mailman (input) for mailman id 727722;
 Wed, 22 May 2024 13:57:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8RWL=MZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1s9mTD-0000wD-60
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 13:57:31 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2417::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39889712-1843-11ef-b4bb-af5377834399;
 Wed, 22 May 2024 15:57:29 +0200 (CEST)
Received: from BY5PR20CA0016.namprd20.prod.outlook.com (2603:10b6:a03:1f4::29)
 by BY5PR12MB4257.namprd12.prod.outlook.com (2603:10b6:a03:20f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 13:57:24 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:a03:1f4:cafe::10) by BY5PR20CA0016.outlook.office365.com
 (2603:10b6:a03:1f4::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Wed, 22 May 2024 13:57:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Wed, 22 May 2024 13:57:24 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 22 May
 2024 08:57:23 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 22 May
 2024 08:57:23 -0500
Received: from [172.21.89.32] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 22 May 2024 08:57:23 -0500
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
X-Inumbo-ID: 39889712-1843-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqTs30b683Llb2qdtzxD8zJ0hon4k8WMc7NCXyklAMPj4fzfGPu4gVF6v9DXOKdjHMjyL2XOjeIyX+S0+ZZGFQxJgVeo1AesTMIrImQU80AQex9WB695TbwJ2YJzbV0IV6xPaa+1fsaIMEO6Fll6sWH+NIN/KYwf/NTL4f5SWCqGrjZe5D8iYips/KcLb/jfUAoSnhkq9GHZf6MBkYGNHVaJzMEHzG0WvpoJn+QKeNlYhBFccmoY42JRPlvNLA5cLCggs5K3evbUfoj8/wMp0nIXTRmm9Re7NiKUL1eQPbVrNft+4rpwBsF3coMVPcAvXwiDdbuOlQf59PJCIQYxVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHQ7yRqcmXj9s0rkz0OK7BakOpjTzOKqOpjDy3dS5/0=;
 b=fVxwc1mODReGAeEx9ZFdXBSJduiQS4Iy6vKXRdaHXKbE/wJg57tzW3bKsSOyQO0BAK3gRUqG/pgy2gX14nXmZPk6t80SYnaQHUSYa0qpfXB7rVEJ2Yu5xycPHvwZLj2YdTqfVzDZBQAcESUJdmVEkpZIPH0f/OwURBUhx+UstH1RwXdPB/5PBulpt38fN1zfehPoAWuGFK1PYmZcyvRBQmGSaZsjYhjRnjOR2Wz3FuN0NhhBf9KO0psZ+fMv6QoPvWIoKSSUS84OPaZDvkFzw1RQtBoz3xF2eNuyRO5efSaVTxWMlEo/MVGgZHmeOhLNL2RQocyFpyTO4XsCpHG08Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHQ7yRqcmXj9s0rkz0OK7BakOpjTzOKqOpjDy3dS5/0=;
 b=m6U7L3We9GbvySGVZQxzUEdBTuBR4OkkqHansyqdybECtnpB8Mqae9qXn5NImUMF9s/97ekyZX8Xp0TAF8rdn6e8+xVTZVyfoocpHIBeojd8dHC+V+f5XPuicm9njMxNyu9aoOreRR9zhz7YR52ufCxPrNn58nb4l/PJxV0P8to=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <aee2a6f1-c94c-4265-af24-ae54e1ceca96@amd.com>
Date: Wed, 22 May 2024 09:57:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] x86: detect PIT aliasing on ports other than
 0x4[0-3]
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <14d35449-fc65-4dcf-95db-8d94dd3455fb@suse.com>
 <df53dd77-9341-4a72-a4ce-33654b2e877d@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <df53dd77-9341-4a72-a4ce-33654b2e877d@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|BY5PR12MB4257:EE_
X-MS-Office365-Filtering-Correlation-Id: 68d0045b-11ac-443e-a849-08dc7a671bbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|36860700004|376005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c1hLYmhMQnBFaktCQm1KcTZSU2NFWTRJcDZBeXYwMS9BamNLYUtkMmFhdjZr?=
 =?utf-8?B?ZDVCUTJDREY5UHhLRzRXMTIwYzFCWmVIUzRFZjVoVk1ZdXJ0c21iWFhpSXh1?=
 =?utf-8?B?dXNqc3FRRlFWZDR4NGRwVjJDKzZjTGV2ZSs4U3BJRXpyQUlXYkRRUllzUE8x?=
 =?utf-8?B?Y0xwUTlPQzVTMDc2dUNvQ3BkVmxMSXhGM3BWTWlsRGkrenlhcVBNWVBOTVMy?=
 =?utf-8?B?dk45TE00WGovRVVqMm41NU9oM1dJVUpHbVV1Q2JTMGNDWVk1NlJiRC9HSXAy?=
 =?utf-8?B?dnVNeHg5cmViTjJYODNuNUptTFMvSkEyV0hOcDFsTzRqU1RqMjgyOVNyN2pn?=
 =?utf-8?B?b0hsdWJFUGtOTThFVVQ0ZHdjbnVBNWF4bzhUbWV2c3d0T2E4SzBPaWpURE0r?=
 =?utf-8?B?TmVnUXRFWFFqYVcyelVUWWFVUUhYMFQxTS9zV2VJUktBLytZdjd0WVVDTXls?=
 =?utf-8?B?RHdTT3VpelRUN2wrcXJ6bGUrSXdhb2ZIUVVDdjh0cUt2N2VvVjB2MnNvZnVs?=
 =?utf-8?B?N2paQy8yTkJHYitZUmlsWG1YRzJTK2g2ZFhPTXFVTDZ5eWx6d3NhSkg3MHl5?=
 =?utf-8?B?bHJ1K1d5S0NCdVdQVG44czNUN1ZkZk1JOTI3WlNiYzRWWEVuT2FCdEFrRkQy?=
 =?utf-8?B?VnFQLzkzZkFtYk9xM1JrbWJJSk9VSnFkS2hqOWpJeXYyM0ptRG4wMFVvU1hF?=
 =?utf-8?B?SUZxNmlkaTNjK1Fva01DWFA0YjVrcmdNSjV6VWFBbnE5OXNuUjZGTHh6VzRB?=
 =?utf-8?B?c2xDakd3Zy80TWVIY0hEOW9BTUhqdk1lMGNlLzFNNFhTMXg0NS9DTFB5RWRU?=
 =?utf-8?B?dzh0QnFaam8zZ1pDTlNsTEJPb2dyL25FVTFTaCtOc09zV1VLUzd3cC9pUnpV?=
 =?utf-8?B?MmtUSXgzZ0pYRWlMelFsYXhLMzlSa3dlb3lwempzY0grMU9MTHVTcmZ6Yks1?=
 =?utf-8?B?MmcrMXAwdlhkN1dCajFLbEZlMllxQTd1ZGNoU0ZSaUZEVmswNkw3VXRIcy9M?=
 =?utf-8?B?YVcwc08rMWlnY2FEbEdJVFNBaENFTmNnOHQybFhVLzlrNWh6dUpzVUxkSS9O?=
 =?utf-8?B?eGtBVXZwcEVEZFowQ29abk5wUjZTYlp1SnNrUlA0cGdSOGNCc3hEaWZ2bDBl?=
 =?utf-8?B?RWVRNjFIMFI5WG4xZi9jK1o5OGwxSjVmMmttbDcvR2NsSmFvVHN5L1k1bXlP?=
 =?utf-8?B?VTUxYmNLREd2aFIzMnN3akNIZ1A0b2JWN1BJVHVvYjJtd1Z5Mnh1eG1WeG1N?=
 =?utf-8?B?Tm5aQTBHNUxEUjFGUkdzV2VTaUVEQ1VqR2RVTG9RNUVnamx1cll5ajlGZFZQ?=
 =?utf-8?B?T2Fhb01ueWd4ZmlOK3N0OGpOUUQ4Uk84bEd2QXVYbk41NkhpczV1VnArenJO?=
 =?utf-8?B?NkxlM2ZDREJvNVAvZ3gzWGpzZEQxMUsyc2xCbHpYQkJQWm11TTkzOHBzR056?=
 =?utf-8?B?UmxxbXVtVTFNVzY1M3AvQTNHWktLS1Q3dHk4UExMVTZ0d2JTeUhDVzBiZnk0?=
 =?utf-8?B?OTdFWGZvenNJbUpkTm1tWWlYcGRSbncwMUVQQlk1Z1Zva3RFWVhMaEFXWjQ1?=
 =?utf-8?B?bTFESDRpb1ZJRnZORlI3MmFtWktMbmFYVmpqekQ4U0pkbHlVYTI2OFlGRzdr?=
 =?utf-8?B?YjJwdk9aSldyaHdtYmt2aStFdGlBdjVhTWlVRjlqVDBoYklEMlg0SEZrWDRo?=
 =?utf-8?B?b2ZCTStxeHlBUUgvUDVMSm0yZXNJVnZlQk43dmJTV2ZQRTVOOFU0RGpJaE9H?=
 =?utf-8?B?ZFpkNFBCcXhKMWN1NDhDaGd6RzlUeDR2S0N6YXBtMGg0bDAxeUIxNkxIRmYz?=
 =?utf-8?B?VWtYbDdKODllc0RxQTJ2R1Y5UUc0Rnh5K1FqTjlic0ZrcHdXa1FOYjZtOHlC?=
 =?utf-8?Q?svWH7+0Al5xpI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 13:57:24.4152
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68d0045b-11ac-443e-a849-08dc7a671bbd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4257

On 2024-05-22 08:59, Jan Beulich wrote:
> ... in order to also deny Dom0 access through the alias ports (commonly
> observed on Intel chipsets). Without this it is only giving the
> impression of denying access to PIT. Unlike for CMOS/RTC, do detection
> pretty early, to avoid disturbing normal operation later on (even if
> typically we won't use much of the PIT).
> 
> Like for CMOS/RTC a fundamental assumption of the probing is that reads
> from the probed alias port won't have side effects (beyond such that PIT
> reads have anyway) in case it does not alias the PIT's.
> 
> As to the port 0x61 accesses: Unlike other accesses we do, this masks
> off the top four bits (in addition to the bottom two ones), following
> Intel chipset documentation saying that these (read-only) bits should
> only be written with zero.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -427,6 +427,74 @@ static struct platform_timesource __init
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
> +    outb(PIT_LTCH_CH(2) | PIT_RW_LSB_MSB | PIT_MODE_EOC | PIT_BINARY,
> +         PIT_MODE);
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
> +            outb(PIT_RDB | PIT_RDB_NO_COUNT | PIT_RDB_CH2, PIT_MODE);
> +
> +            /* Try to make sure we're actually having a PIT here. */
> +            val2 = inb(PIT_CH2);
> +            if ( (val2 & ~(PIT_STATUS_OUT_PIN | PIT_STATUS_NULL_COUNT)) !=
> +                 (PIT_RW_LSB_MSB | PIT_MODE_EOC | PIT_BINARY) )
> +                return;
> +        } while ( val2 & (1 << 6) );

You can use PIT_STATUS_NULL_COUNT here.

With that:
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

