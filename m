Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3542B704DC1
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 14:28:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535163.832788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pytmG-0008PM-Px; Tue, 16 May 2023 12:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535163.832788; Tue, 16 May 2023 12:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pytmG-0008M1-Mj; Tue, 16 May 2023 12:27:40 +0000
Received: by outflank-mailman (input) for mailman id 535163;
 Tue, 16 May 2023 12:27:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pytmE-0008Lv-Uo
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 12:27:38 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe02::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ad1cac0-f3e5-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 14:27:37 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7431.eurprd04.prod.outlook.com (2603:10a6:10:1a1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.32; Tue, 16 May
 2023 12:27:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 12:27:34 +0000
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
X-Inumbo-ID: 0ad1cac0-f3e5-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EqKn/DKq2Dz0n8WX/xTVY9eJe5bA/lgqyOdgHADHAxIep0K4rVQvueLgUFO8pT0ipo+kdnvjbixLlmey9I7vKKrVByHoiCC2ZYDiCLioVnq/hraUjvHwoFy0CWrUUKpkc+L55+c8ZmH5hWpyFiWOrSFoU2QIkXSmgEhrbeo28dz3Cd5RD+zcN//pGsng04y2VEBFkKBOfhZ2F8DpwRsOiVkGG0asXRE7AImbow2LLlC+qQAsETNfl91Gaig9xFpicu5wKTKIkpqdDuEf49Jcu6xlYWBEdQdHtkr/oNe4d9IisYD7AXHdahCYVQ/sQqiK0H1v1qb+y1EjPfOXDN8BDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/klQvXHsLzX7lzggijdvUmRRhCoUDlBDMqxHfTJ3OzU=;
 b=bGfa9/+qTox1x1BXMOX9Tpd1P4uHW2p+e7yJdJ4aVZzWeSLq6/0XsCitIAEOvthPcbPF6hX22Prqo4ITjZNtHnZBw50BRt6B0u94RREp36uKUOFO6UVfCJCcx56Xxgnzj5FsM6RYXjvlfXN8EPpKrxJV04U1+QWH9Y2uGjux+sIsVbVY8L1ewAsWEDTzVHPGJLSZxI75pp6ePZlCUoOr/TjOgu2BYr+5Ke62Ocfba5QVsc8CQ4BMlZjkpeFYJTwUw42AXM49LBNiWXg4Urho06RTSf9FNrtwm3ohjMEJgvHxx3P6Q4HuPyW1DRtjDHttGiEMNsZ7C3kikds4KYFSlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/klQvXHsLzX7lzggijdvUmRRhCoUDlBDMqxHfTJ3OzU=;
 b=J+C+N3RIFtTzMl+oadCUSChWhdQGmg6gURgTTqB8y5fxkL1koE1TDvC7atx9weUOHEAsiJYYvkLqx+MR2fs4VATuQT8QiMjg93IN+SMQcsgLDrNYWa1pPn/+AMxE1OE2R6W0IdPuNO4K8wuzJ64GW+4+ryqnR/MPDmJ/q3fVM3YD0quPAgoo0HLYkgQ3x1CnMjFXl+4VomQDCX4pKAP5RzeHAG6Og3jrTxlWO5kTgtgsMHTd4D1JOjcDcQafeOCCAtHgW3Z8VSJOX8TtEZOk/kDX3R8W9nx6xfftCgaVKWsVA4kIRFK09FcvXh1nHk7k5kuj/Hi7ekaPlK4iQLnDXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <20a1b108-68a3-a200-1d0e-390cd20b5500@suse.com>
Date: Tue, 16 May 2023 14:27:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 4/6] x86/cpu-policy: MSR_ARCH_CAPS feature names
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
 <20230515144259.1009245-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230515144259.1009245-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7431:EE_
X-MS-Office365-Filtering-Correlation-Id: 77842db6-7172-43ba-baa0-08db5608ed70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fkPgn0DaIgBYcU8MK0IzszUVeXJHR4GRaXVlc5U7DIiElycNhD3wi7gQNCpmqegoCMmQvzjDLcojn+B3VPYTkuoWSEw5FpNokD6fBsHis3HUpTI3aDrLfZnQ+0IjZ2LVWlGONdvdthLNMkOyYsQ3uzdD7rJZlTLjTyvzRVgW7J2EwI6QQUU1wQosbYOGgbgInWNstmPV8wvRKAaPBDXISuTaAVBPAGQ6OGEtAOFyS6uYvb5zl49BFFS2jJ3XTZrNvuI7J/dQ+HQ50tV/5ssHaf04GRLyn3wpxcChoA6ELDLsgk3MOQoQwIaAsXQPcgqm/jfe0DxQ3OdjpA6oxDssEihmTTKGZWYHQq+zc5ml+PT1H5bq5m7why/LBsrmfTgrIe/iOLI2MKbxJJa7eVrvoEoXNFoILS63JwvfjW1KrPKHWZMM9DLkQAf6wOVA7rehInMOcWqQ0PNWtwUUxpJHehw7ha1XcBPHYiWa/gIlSm99xdDFMt8Mm0/fw+iXrrxLClNr4PIii1lcHcnZpm1hZdTx687tyCdijfH9k9JWTUCIIusIaE12FE8hvQfZZ2MumTDFa92JBj3D87kX75O5xgde7akPUI7rL7cypJyneuAr/D73yVfOE5otloQPgcpEtm11peKf8AgJOUrqUUwUYw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(376002)(136003)(39860400002)(346002)(451199021)(4326008)(6916009)(2906002)(31686004)(36756003)(5660300002)(8936002)(8676002)(86362001)(41300700001)(316002)(66556008)(66476007)(66946007)(54906003)(6486002)(478600001)(186003)(6506007)(6512007)(53546011)(83380400001)(26005)(31696002)(2616005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXdWcTY1L3BLZitqdWFJRnJiTHdSSUxBQ1llNnZoWDZHVXJIUy9JTE91b3Zt?=
 =?utf-8?B?bWdJL282Q2NRRFFnNk8wZTRvQnl6c29KQUYza1pSMFRxc1ZpOXMzd0ZxM21K?=
 =?utf-8?B?WWx5Sy96SVdUMmIvZnRxUWg1bmlWa0ovUktGU2JGa1Q4ZzJQNjZzK2M4Tko1?=
 =?utf-8?B?RCtHRGdSYU8welRYaWFpUUhWSGR2a2hEUFl4VHgzSmd6ek1XRzMxR1JGNHVQ?=
 =?utf-8?B?RGdUSTVFS0ExazFFY3lxVytzYVZaK081U1FHQzhzdi90VjgyZ1NaZ0RsajBt?=
 =?utf-8?B?amRZVVhTTHV0dklIUFZ0TnRuSktHdDNZa1dtQWU1Y1l6SW1WRGJRb29iaSt6?=
 =?utf-8?B?cWVwditNR3pqdVY4aFhqNnhzRVRUK25ONEEvZTk4N0ZNbTBHQUVxQWJhZzAw?=
 =?utf-8?B?WTY3eW1KVHJOVStXcFVZVTVIbk9jaG9QaTlUVk9KOFBOYkd4eGFLKzE1WnJ0?=
 =?utf-8?B?c2NMSU9WTWRWL2l5WXg4RXJMWS9vaUIvbUtnNEd2dUlCR0ZuZXkybGtuNFln?=
 =?utf-8?B?M0YyWDNGMHFaM3oyREs0bFNhT2JySHVObkNZQThJMFBSQzREdEVnUXErRFN3?=
 =?utf-8?B?Z3ZxbWdoM2NWTTY0Z0Q0b3F1OVZKYmVUYkFuSzI3czMyUkdSV01VSHBkWVhR?=
 =?utf-8?B?VkRJRkR3ekJmM0poN2M0Q2lnMXRNYjQ0bFRUTWw5SG82blRiRG5rcjdCN3FD?=
 =?utf-8?B?bVA2eHl2QitDUTlMZFNNSzd1RloxRGpBT3NzY2pzQW1VRVpMcmpPb2pSNm1K?=
 =?utf-8?B?YlRpcWxDZU5saVlaTG9UYWh0ZUdOK2FrTVNhOHVmR1JRMVYyblQrNmdOVDhQ?=
 =?utf-8?B?TlRQTFBkcmhCQzlWcVNKWlpWQ252ckx2MTF0OGxLLzBlS0xIRzJYa2pOVFBS?=
 =?utf-8?B?N1gzUXdoSHVuV1NjQ0x6ZDkwRWpoRC9kV0FJN21PZ1hEUkM5K1N6cnA3c200?=
 =?utf-8?B?QStWQTBUaWI1ZGs0ZHppY0xQRkRvNHlBeVBmbEs2QVU4QXJPL2RVLzdQUEFr?=
 =?utf-8?B?LzdGejJwcjBIT1ljRWtPSVczSjRYUnE0MmtHR2dzdVBMb1N4WmVnNk80ZTNl?=
 =?utf-8?B?aVF3TGEwajJPeThzV2NJcnRVd241ZnpPYWZGeEYzRW9OU3FwdkF5VVhEL3pq?=
 =?utf-8?B?NGJZTlhZTk9DeUR0K1FicGpVQWh5ZThtNDlOWTV4S2VQdnkxdCtSRDVaclor?=
 =?utf-8?B?MlZjMkVzdFpmaU5jMGtqZ3lGZFhNcXhHYlVXQzdqbDlRVWJYbUJRM3hpZThh?=
 =?utf-8?B?Q2J3TGcrSlVpYmFIU096YWNNSjFGbVZUV0lwUTVydHFMZGpHeWlRZWxVUTFy?=
 =?utf-8?B?TTBxZmNTQ0t2U1FNQk8za25rZ1dEaldCN2NCeUxwWlZ3dGd5QStaLy9aN0NV?=
 =?utf-8?B?akQ1ZGF6UTAweDJYeUNrNTd0ZXJiS0JQL1N5OHFPMFlJeks0M3JjQXExQm5S?=
 =?utf-8?B?SFpMaXh0S1YrclVGTzNSUU5TVW5OZndJZTg4REpZVnlJdTdBRkNrcENjZ1lu?=
 =?utf-8?B?VENZSmYya0dvcWFFYnlqU3hGdEx3SGNFVXFuZ1VEWFU5T3NOdlg3aVo1Nk96?=
 =?utf-8?B?UHh3UU5yMjhpajRGejkwMllQUE5KL1gzcm5tWlR6aHArSXRlanJIOXV4UFFB?=
 =?utf-8?B?SjEyTjNwbkVHVmhZYlluZDhOekFDVVI1R1plVzdGSlFrL0kwVm1YQm0yV0Jh?=
 =?utf-8?B?STAyV3JiU2oweVAxUTY0M2Z5RDFGVTZQN2hOUEw3cWhuSGpqVUNqRkQwcHAv?=
 =?utf-8?B?WTMzZ0pvdlJ4SU45eXpxZGNlUG4xZC9aTGlEUC9UVktWdzRmSXd0MGNqaTRC?=
 =?utf-8?B?Q3NSVURzMjdBYXU5a2FFR2ZRbHBXcFltV0tldEUxa0pIM1JxdjdyM0ZOWS91?=
 =?utf-8?B?TGFoaHdOQm5jWGczUGpEWjJ2NUJ6T0xLbmJXYmE0ZFJ4UnJqM20zR0grQSt2?=
 =?utf-8?B?ZFlzUUFhMG0zNHF1YWIwQTRka2V2OURBU0xUZjR1aEJPYnFkbFJpcUc0bnVX?=
 =?utf-8?B?eTN0bUQrV1c2bGZFUWx0VG43RE9uSzlXa0JPRXZGSlJybk04RlczZC9vdzho?=
 =?utf-8?B?WGVaWm51UkVLRzFyUXhiSEh5dWtXNzZnblc1T2FSS2I5czNkMFRGUjdvMTl6?=
 =?utf-8?Q?HJyWbTzhoebXqcTDmtGHC5odL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77842db6-7172-43ba-baa0-08db5608ed70
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 12:27:34.8356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k9V4zxUQdYmPyOT68H7SEpt3xTZmHcv+CvOGgmBX0tTc0c7RlxPJEuOMX7Euu3uKb/X2w3mHTylNs4scmpsu3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7431

On 15.05.2023 16:42, Andrew Cooper wrote:
> Seed the default visibility from the dom0 special case, which for the most
> part just exposes the *_NO bits.

EIBRS and SKIP_L1DFL are outliers here, in not presently being exposed
to Dom0. If (latent) exposing of them wasn't an oversight, then this would
imo want justifying here. They'll get exposed, after all, ...

>  Insert a block dependency from the ARCH_CAPS
> CPUID bit to the entire content of the MSR.
> 
> The overall CPUID bit is still max-only, so all of MSR_ARCH_CAPS is hidden in
> the default policies.

... once this changes, as they're also not just 'a', but 'A'.

> --- a/tools/misc/xen-cpuid.c
> +++ b/tools/misc/xen-cpuid.c
> @@ -228,6 +228,19 @@ static const char *const str_7d2[32] =
>  
>  static const char *const str_10Al[32] =
>  {
> +    [ 0] = "rdcl-no",             [ 1] = "eibrs",
> +    [ 2] = "rsba",                [ 3] = "skip-l1dfl",
> +    [ 4] = "intel-ssb-no",        [ 5] = "mds-no",
> +    [ 6] = "if-pschange-mc-no",   [ 7] = "tsx-ctrl",
> +    [ 8] = "taa-no",              [ 9] = "mcu-ctrl",
> +    [10] = "misc-pkg-ctrl",       [11] = "energy-ctrl",

Not "energy-filtering" or "energy-filtering-ctl" for the right one here?

> +    [12] = "doitm",               [13] = "sbdr-ssdp-no",
> +    [14] = "fbsdp-no",            [15] = "psdp-no",
> +    /* 16 */                      [17] = "fb-clear",
> +    [18] = "fb-clear-ctrl",       [19] = "rrsba",
> +    [20] = "bhi-no",              [21] = "xapic-status",
> +    /* 22 */                      [23] = "ovrclk-status",
> +    [24] = "pbrsb-no",
>  };
>  
>  static const char *const str_10Ah[32] =
> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -308,6 +308,29 @@ XEN_CPUFEATURE(AVX_NE_CONVERT,     15*32+ 5) /*A  AVX-NE-CONVERT Instructions */
>  XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow Stacks safe to use */
>  
>  /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.eax, word 16 */
> +XEN_CPUFEATURE(RDCL_NO,            16*32+ 0) /*A  No Rogue Data Cache Load (Meltdown) */
> +XEN_CPUFEATURE(EIBRS,              16*32+ 1) /*A  Enhanced IBRS */
> +XEN_CPUFEATURE(RSBA,               16*32+ 2) /*!A RSB Alternative (Retpoline not safe) */
> +XEN_CPUFEATURE(SKIP_L1DFL,         16*32+ 3) /*A  Don't need to flush L1D on VMEntry */
> +XEN_CPUFEATURE(INTEL_SSB_NO,       16*32+ 4) /*A  No Speculative Store Bypass */
> +XEN_CPUFEATURE(MDS_NO,             16*32+ 5) /*A  No Microarchitectural Data Sampling */
> +XEN_CPUFEATURE(IF_PSCHANGE_MC_NO,  16*32+ 6) /*A  No Instruction fetch #MC */
> +XEN_CPUFEATURE(TSX_CTRL,           16*32+ 7) /*   MSR_TSX_CTRL */
> +XEN_CPUFEATURE(TAA_NO,             16*32+ 8) /*A  No TSX Async Abort */
> +XEN_CPUFEATURE(MCU_CTRL,           16*32+ 9) /*   MSR_MCU_CTRL */
> +XEN_CPUFEATURE(MISC_PKG_CTRL,      16*32+10) /*   MSR_MISC_PKG_CTRL */
> +XEN_CPUFEATURE(ENERGY_FILTERING,   16*32+11) /*   MSR_MISC_PKG_CTRL.ENERGY_FILTERING */

These last two aren't exactly in sync with the SDM; I assume that's
intended?

> +XEN_CPUFEATURE(DOITM,              16*32+12) /*   Data Operand Invariant Timing Mode */
> +XEN_CPUFEATURE(SBDR_SSBD_NO,       16*32+13) /*A  No Shared Buffer Data Read or Sideband Stale Data Propagation */

SBDR_SSDP_NO?

> +XEN_CPUFEATURE(FBDSP_NO,           16*32+14) /*A  No Fill Buffer Stale Data Propagation */

FBSDP_NO?

Jan

