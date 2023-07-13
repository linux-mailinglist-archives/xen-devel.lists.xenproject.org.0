Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A08A75231B
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 15:13:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563155.880195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJw80-0005hB-1P; Thu, 13 Jul 2023 13:13:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563155.880195; Thu, 13 Jul 2023 13:13:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJw7z-0005fT-UX; Thu, 13 Jul 2023 13:13:03 +0000
Received: by outflank-mailman (input) for mailman id 563155;
 Thu, 13 Jul 2023 13:13:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0tL6=C7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJw7y-0005fK-FG
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 13:13:02 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20620.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd9ff272-217e-11ee-8611-37d641c3527e;
 Thu, 13 Jul 2023 15:13:00 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by DU2PR04MB9114.eurprd04.prod.outlook.com (2603:10a6:10:2f5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Thu, 13 Jul
 2023 13:12:58 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Thu, 13 Jul 2023
 13:12:58 +0000
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
X-Inumbo-ID: fd9ff272-217e-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdP+J5eNOns6j1+OWdZ2qY/7f7yVb+nzLnw4YYzoVcwdG5D/JJ6Y64YjDGMD3sBmFop6L/l/b0IdvKJEV/hLy1YkTNRiCQCFyl+YoSS7odxiASMtHZKFAHK0H4W8Nrtsp+Y3B7Ahl9+CcrNbTERXihVA6KAaeBtqif8+3JLvh1yBv9CL/3SaweN1jFmciIk789sUJvNlFHt26EkLTxM9nh/OvF7zOCTbmd80vRP+WTNg3Rx4EiGAugvbgFEMfYbxrjCkn3DZFn+Bzj0DaKktIXh/kKYaybS6k9sNk4rjXHoAOq9Gxvq+xFORjx9cqsrV6Tfc39PGB5iCk1UrTFJ/7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0BYXk1Yk4nLEnI1bExbCgN5JYJ0yDm2Or9qYtttFtU=;
 b=U7+T5MsvHkkTJ2zz7WRjRftp3bV6xzWkBb0bEU2XU0uu1Pm8hMRTXRquctckEiGeT65knV08uWDGabQwq1/BzVC1m7MLYUMl1aS7s3oLF3r3fW1hVs/M74yoy6L4VktLdV/DRZA/WKHGXlI5u6QkixvHwbmhytiwBLnrD1PTJzLaFmuIkDjTwvL83/a6O4buN+abiVOZbOCdz5DFr550EfPqZWfbMlZ2OM1M8L5bplii1J/rfwOj8HjKE9zH6dDZgyQyhf6hh49a273U3ti79D05ItPY77gBAFJKJMx0tVlN9Hb6/eIGBObHee0Rh9iv1MZo4zby/kts0cRQg7lAhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0BYXk1Yk4nLEnI1bExbCgN5JYJ0yDm2Or9qYtttFtU=;
 b=G5spflWqUE+vN3e2G+WYLqdTd3Xlwi3pGhPLWc5HLTV0NQhiBGrsORE/BlrrUKsa8l21d3SxCiHTkL0Bk63HyicSVtxtC248zqHHVjgMem6ekp7Fhyi3sNtAgJiDjJwHB60RgL4pZc6DtoxPdfN7laD/LyCd44AZuo/mUhfpUeKFVC49Q/P4P4jdb3KJgwOej8fo56P2gu4k2fnwsD2hVFWqT4yVGEXrm5fS3anv6Dz9yRzxVI5IJEoSs93NgaUN3tF6juD0iFfWbTXlOlTML5Oq0VwOG5HhVv1+uCYgEj+R8xWYj/IVxaCptCDbfCR1Mfk0ZblEqBst+amfR/g9fQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3b16e1d8-acfb-8dd4-763b-57908ea6a2a1@suse.com>
Date: Thu, 13 Jul 2023 15:12:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/3] x86/APIC: modify error_interrupt() to output using
 single printk()
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1689191941.git.ehem+xen@m5p.com>
 <7771343b52e6769d7670ad73094f5276025a10fe.1689191941.git.ehem+xen@m5p.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7771343b52e6769d7670ad73094f5276025a10fe.1689191941.git.ehem+xen@m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::22) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|DU2PR04MB9114:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bfb5aee-867a-4d09-2cb3-08db83a2e0b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JLm8r/4UUj2bv2Tt/b7YEhW25GihVzptf4gYM8RqXeASxb0C9FIFTYp/qP07eskp+NSx4kgQQk540+xx27P5WWp9dHYflty3wPUvG8NGILVROFyg06CdxTzr4JWxX5UjhmmJH+4bT/GxdxAIxgjcKB4cTes45nc8LWRQC26+H1GAFYWQNEgGAVRCA/Rm61L9yotfPiBVCAxRMAkHuDu6BDLaAOxw+ulfOA/Wr0Q/IcreWQS2YEk7zItozecqiHCBXYQaaKenK0U3Yocyd5A1q06PgSKOEDpY83D6mz2gENdzbRQPT4YYBh2Msrfcpo4DJOReDW2h5zpqBxPyR6uKyv1BIap6gL/LCUf20NW1jKGXax961dFQDQU+LyFx4GmsjXwkN9437v5hCH8ThW5ppiM2y5TXYz51chrg8BryvAlQhU9fK2YjjrIlZd5THkkX3ZTfV/IXUkoiGtTzGqg8DrOp+4fahHtyuaFiVsC6hg8H5a0oVTt6AEfK4eTghnFuR2E4ssk4ShCBfiTzw8/xlWwnpocDoFnRYLpt3h0RojHCTXx6yOaMi6maxGgoIsY0ael1p3AMgfKe8EnHy4lbdSmj9eTvSqiPG1CYcYD7Qa/eiNn24YL7ARZMYpzuotWZT1oKFyIYtsQI3vBqdFox2w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(396003)(136003)(39860400002)(366004)(451199021)(478600001)(31686004)(54906003)(66946007)(4326008)(2906002)(5660300002)(316002)(41300700001)(8676002)(6666004)(8936002)(66556008)(66476007)(6512007)(6486002)(26005)(6506007)(53546011)(38100700002)(186003)(2616005)(36756003)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGtHNHlDWTdDcHphV3poV1h2eUhJY2x4NkZMSXJGdzd0NTduYThlcGxOQy85?=
 =?utf-8?B?T1hxbzdQOXkyUXNvb0pMZ0xVQ3dVSFlvQytEZE1udUoyaTY0VWlhV1F2c2lr?=
 =?utf-8?B?NzllMHNrd2padWt4YXAwQ2ZEckErN25XTzVpR3B5WUtFendQRCt0RjhVRHd2?=
 =?utf-8?B?VTZPQ0o3R2NNQStyKzR2MUlGMWcxNjlUOGdtT2JHTEtacWpKdXY1dDg3YU9E?=
 =?utf-8?B?VWNROE9BZ3BxQm9yT3NDUWYvYnhxdnF4UU82UXNHTkRPWHpYSkJDdjNFcExU?=
 =?utf-8?B?Tm9HVnd0L3l5Sm1HUEFHczA5bzgzL2pkanBBRG9PMVY2MWg3YjExWWd6N0JH?=
 =?utf-8?B?SVpERG53ZUlEbGk2NkxyM3VXTnQrbE0vaDJ0ZlBlLzUrYm1FbGVZRGtzbGZs?=
 =?utf-8?B?Nm9RREZBZ1N0TENpYytlSTE1WHdHNUlKUVNKODR6WXNraWhqditjb1lsNUJr?=
 =?utf-8?B?aERWblNNbjZOMDBLNFNYTHdiMTRMd0dQYm85MThQbzBrZzBwTHNQY0JFNzNG?=
 =?utf-8?B?WWJieFcrbUlKRWhVVGx2N3czMGhyTTMyWTdtaUVMbnRlZURXbVBXNUptK2Jy?=
 =?utf-8?B?bjllVUJMUzhuUlNVN2MwL0pLWE5RaUpobHdBaW5TMktkemFVOFBsT0JYeEVw?=
 =?utf-8?B?ZjUzeGthZFZlTi90Y1Y3U2NSYWhnWnNXVDRqcTBBRnh0TWg5THIrVjZGcmR5?=
 =?utf-8?B?RzltT2wyUHhOL01lTm5NTE1aSTlEYlhSZU9LZkMvWURZb1NqSm1sbVRMRGRN?=
 =?utf-8?B?N3lZSVlCZUZHR0IwK2daM0RQTWlPL2pVR21xWEhFdlowWTBwL2EzTFk3ME1T?=
 =?utf-8?B?NCtYT2VsUG9VTy9mVit1TUtzbGw5ekEwNU5pMUJxL0kwM0Y1UTgrZXgyODI3?=
 =?utf-8?B?U0RFbWJ4TzB2bHZEY2Q5U0FYamc3UHladmRwcE5STmd5ZWpBd0N1cG9Na0VE?=
 =?utf-8?B?b3dTSWZ3cnM2b0xZVm9POVBCM1A1Z1JtQ2VtMkxOSXA1eXBrVFllYWdzcjJj?=
 =?utf-8?B?YzNnZm85QloyelVEblk1bi9WdTVzVVRGOU9kVWphRTN4WFZJcDJQbUVnQzZF?=
 =?utf-8?B?NndEeUFrK2ZScTQxc2V2N01EVitQelFwV0hZYVdvSGU3dTllK0RuN01pK1ND?=
 =?utf-8?B?eXRHbzRqTWFCWGk2SUNHOE9iOWUwRVdCWnpyRFBkYXppMXljZVhaenBVVGVj?=
 =?utf-8?B?TjdTWkRUTWRMUnV6WXkxc0hDUG5aVU9UczNHWlZ2U0hnamlteVJjTzdyWHpM?=
 =?utf-8?B?L2M4STdhL2RmdXUzK1FadDJDKzNXRWM5eGpBRDNTZ0hiS3pNTWJlUUVOVFVB?=
 =?utf-8?B?empIRFoxc2U2cjVoSlFFdEphVm5BSXpIWElFRGk4UHFYQ0NjMXVuSUJjaUhx?=
 =?utf-8?B?YlBZaE5IM3Z6RzkzaS8zempVbUZzb2xVUm1ndjY2aDZlREJuaW9tblorRTVL?=
 =?utf-8?B?ZnhETE10YmRleHdqbllUQjJPV21wSkJYSWVDMjZYOVJSZmZORUNISGtYN056?=
 =?utf-8?B?V0F1YzNZbWpwSE1lS2ZrVXFEY21sYWc4aEVXMmU1R0JaT0N2KyswZmVwWjVP?=
 =?utf-8?B?RWF4LzBxVWl5ZndNTkJiMnk4MExYcEVlbzY1OWs1UUlTUUxYc1lEaVZ4M2Ro?=
 =?utf-8?B?ODVlM3BhVjJISWtkbmJoWXowZEJLRjdhVlVLNGN4OUdHVHVBU0gzVGdwQ0ly?=
 =?utf-8?B?cEsybkgzMGZuWEZGWTZYRWcxTXIrM0ZwZEtpQXBPSmhhMTZWZEhHSi9VTEly?=
 =?utf-8?B?UTJpVWtCdFBTTVFtajhhTTRkSWhrN3piQ21sQk5jRXAwNDYvdWw1ZW9GMm91?=
 =?utf-8?B?OElsRDlDUFl1dUJoUTFObTVsYTRPMUEwWDJwQ2J5OUEzS2hzRUk1RHN0b05o?=
 =?utf-8?B?ZnRQZG85bURXQ0hObUR3VEhKVm5MVm1EQ3N4eW1ueFIrTm1sN0xkelJLRTlL?=
 =?utf-8?B?TnNxd2pNOTlXQi9wYjRka3BrQnBVSDFUa0pjd3FBSmxidUlWZlErUzlQT3di?=
 =?utf-8?B?ZWhaNEh2am8zYU9PODRFK1phcmJKKzFyME5vNXVTdW92MzVzeDRpMFVVMmJz?=
 =?utf-8?B?L0JMQVdlNWNSMzcxdFJlUWMzVzkzU1NnNUtkNlB1QXNLUUNKeVZVZ1lrVUNp?=
 =?utf-8?Q?3E/tOHt2WjX1ex8crOcIxvQKf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bfb5aee-867a-4d09-2cb3-08db83a2e0b6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 13:12:58.1785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LqYN+bL/2BNxidrJL6w3+pdhgFWBdhbuOUH56YjpNnxAtcaY2Wzlw5MmQUagzhX5K8VHJIl8MMFKUNaRKfXt0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9114

On 17.03.2023 20:53, Elliott Mitchell wrote:
> --- a/xen/arch/x86/apic.c
> +++ b/xen/arch/x86/apic.c
> @@ -1410,6 +1410,7 @@ static void cf_check error_interrupt(struct cpu_user_regs *regs)
>          ", Received illegal vector",
>          ", Illegal register address",
>      };
> +    const char *entries[ARRAY_SIZE(esr_fields)];
>      unsigned int v, v1;
>      int i;
>  
> @@ -1419,12 +1420,13 @@ static void cf_check error_interrupt(struct cpu_user_regs *regs)
>      v1 = apic_read(APIC_ESR);
>      ack_APIC_irq();
>  
> -    printk(XENLOG_DEBUG "APIC error on CPU%u: %02x(%02x)",
> -            smp_processor_id(), v , v1);
>      for ( i = 7; i >= 0; --i )
> -        if ( v1 & (1 << i) )
> -            printk("%s", esr_fields[i]);
> -    printk("\n");
> +        entries[i] = v1 & (1 << i) ? esr_fields[i] : "";
> +    printk(XENLOG_DEBUG "APIC error on CPU%u: %02x(%02x)"
> +        "%s%s%s%s%s%s%s%s" "\n",
> +        smp_processor_id(), v , v1,
> +        entries[7], entries[6],
> +        entries[5], entries[4], entries[3], entries[2], entries[1], entries[0]);

While pre-existing in both cases, two nits: There's a stray blank before one
of the commas, and indentation is wrong too.

Furthermore there's no reason to split the format string, especially not
ahead of the \n. Plus line wrapping for the 8 entries[] references could
also be done more evenly.

Since these are all cosmetic, I guess I'll do adjustments while committing:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

