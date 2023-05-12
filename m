Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 915A67001B2
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 09:46:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533723.830611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxNT5-0002Wu-Ul; Fri, 12 May 2023 07:45:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533723.830611; Fri, 12 May 2023 07:45:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxNT5-0002Tq-RP; Fri, 12 May 2023 07:45:35 +0000
Received: by outflank-mailman (input) for mailman id 533723;
 Fri, 12 May 2023 07:45:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mY6V=BB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pxNT4-0002Tk-DE
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 07:45:34 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0605.outbound.protection.outlook.com
 [2a01:111:f400:fe02::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f916a7bf-f098-11ed-b229-6b7b168915f2;
 Fri, 12 May 2023 09:45:32 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8516.eurprd04.prod.outlook.com (2603:10a6:20b:343::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Fri, 12 May
 2023 07:45:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Fri, 12 May 2023
 07:45:31 +0000
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
X-Inumbo-ID: f916a7bf-f098-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HPz6FQmvy/10do14R5N/drPQvvI18oQ6JjwERipX4tn0wBTuyxNOTnNtOqGKEGDfPnOuLbtC725MCf6NL5M+jUWbBDLxuyXA4tedFR41Q+AfwjFb95d3hXYZNl4sn9vnTWXCRUeCxYCBth+2n0Z+7ExSK78Y/B1mUA8Qo/EX/TAPUoJBGKkPA9HGBL96mH7ibEKzGrlRZmmYTkUvGmXEuksz/507CsLU9nOuEY6Yz+jAIf5pfeoujXdKtqy7Hyc6FaJO2RBdz6BK1yfTdrJAAoJVIG16Gd/PL35OjguTwLia6pa39y/TaYf9gUdeQj5IAFOY1sngKzKJPopFb+Eyxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ue930GgMb0OzNyelI18ojsmGR6aRJTnwoO0VsjMJKw8=;
 b=MzVo2gRXXa5L3PM14E+xYwmzAP13hKIqAkDtmdkSkTtD4oZ0gfk1UWqQ1ZE1og8vBmBrg96yAvyFzVpHuBFKsgo5Mdo3G1yCgL7gmiijQ64twlO3NW9RH2eu4Qu0TqAHaEZ+a6s0xrExHB7wdiQZv3r6/fddecjqeLFXzu8C0ZijTzmE2bAo+tnNSepMa9qi4VZ49HA46YKnp8wqGI6sT5VS47bF9lGG4LFDVJdaOlonvWMrGh3C9bG8culkMoird0FGc5P327zQZUuRNmYhtF+mf1tehiA21Yp2VIVsPWO7aWF2Mwm0xp/sVGAMG+5KTzjm7HBSFTvUj//4mSdEWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ue930GgMb0OzNyelI18ojsmGR6aRJTnwoO0VsjMJKw8=;
 b=hz1r2NzAEfVdfvOJaLYXrc014GbC2GYTtWRXr1Q6+1Q3kqcb5Pd6+1rxg4al+qUrV5JkWteSt+CdFQ4xMHVk0VlofRP7nAxcLzekbtXSj01f826jUAdsMFjXfUy4dc0mpVrxkuyae9tgaX7bwfg0nwvlrkZ/JbmpYATW4+GS281+LMGa2eFoS0gGkOUn8wYhA4t/yz5TsvWTZWv5mzxVW44TJUc8h8O4Xh77UICRmTISEUUPDAn3tHO8rqk1Ad098v7kvxhiVu6sckC1HJBFz3pfEyCkhfU8skbwaHid6CLRmwjCBbd43tO2Fk+0M8mi8sViTBvtneH49nt36+WVvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7ae95b59-3c13-373d-191b-97a80bddfc4f@suse.com>
Date: Fri, 12 May 2023 09:45:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v7 3/5] xen/riscv: align __bss_start
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1683824347.git.oleksii.kurochko@gmail.com>
 <2e9018989c628a519aadeae150786efe5e8054ab.1683824347.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2e9018989c628a519aadeae150786efe5e8054ab.1683824347.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8516:EE_
X-MS-Office365-Filtering-Correlation-Id: 37fcfb08-f533-4005-71b6-08db52bcdc7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jJFKkgPN6UG7ZvwniNoA1tNcoJvpsdi68ofthO/AZveBBBEgJ+jLvigu7mDwSJeUs1Pj6L+/yepG9V7GjJaz7SpW9RiBRJIShC1dyk8pUwt/0sxMTrnau8QvR6bXag2cU6S+QusuqsTU6ftTc0LaWeRoUFPKx6eFcCuUvCu1PfWU6W2r18pOWFNKvLhKTgkftH5hN+Rn42iYSU3GrUxDiMqJ1F7JOQfz6iljPu8XRAkaEn1g+SKyLor6s4Y2Dhwt1JmRTka6thtViOeMprkMkASgf5QIzQ0KFpXO8uyGkVd81KFEzGAddL2MgIxvJ7yeGyVvGNt38xUClrDSK90QhcCnDxww6f17U3vSniuMsQvSuUx3XOx0Wi2y6aSdS68sGfWHipQpzQ4yF8gry5QaeOJQbOw7IJlQzm2LuS0s6i9L8LRvQ/J+UBJhANzW2VXlxkKUb4RBuGvz2Z1dOd9QXy6Ep+PsgOhG4c97pFdjVYMTxrnqcJFamZrP0f8HfmB039IEUGPzl9L7ZnqSe+00xdJaEivbglHNqgzt76eRgycBbfhggGs9ygmVaVwmoV+l01BeVoPqaczjKIVxBw47h77MbyZsO38tStgWP1dTN8AmACCy48wQ7bysSFPl4vu1hL7M91PPEAPASDRf1eUXug==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199021)(478600001)(66556008)(66946007)(66476007)(8676002)(4326008)(6916009)(5660300002)(8936002)(6512007)(26005)(6506007)(53546011)(31686004)(316002)(41300700001)(6486002)(6666004)(54906003)(2906002)(2616005)(186003)(83380400001)(31696002)(86362001)(38100700002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1pXdDJOa1lxdVF4WjVIM0pLRmNFdzhwZ0dHMVhDU2JtVjNtN0pDRmQ0TGs3?=
 =?utf-8?B?M2VBWklDbEZQZDBCQlEwaE9yUVNqbjl1QkM1N3ZCYkJvc0lwcXc1dWkvdWFy?=
 =?utf-8?B?VXBmTEdSMklJOTB3SEdYOFl4MmI1YzJGQ3c5Y0hOM2pHa2lzb0NPNndZWndw?=
 =?utf-8?B?aWxpQ2htMHQxSVc2WmoxVTlZcUZhR3UwTUhhaG9pYmVJMFZ5bmhHdllSMk42?=
 =?utf-8?B?WWZ3QzRvL3lKaG1IMWdXUHhEanVIMDdYRkhRM2NjOUQxbkR3eElCREFwR0Y4?=
 =?utf-8?B?TWFuTExlMjNRQU5GK3FoT1RITm5RMzVTRlpoZHBjc2hLWXNYYUJhQUxJcXpB?=
 =?utf-8?B?RnBRNnJEN2ZqeFljQ2JZYzNsY09uODI3T0dqTWlsWGxwOUgvbWNYTU9ORW91?=
 =?utf-8?B?a1FQVlorY29tZmdWS2tlZmFzZWlYTXllQVVIRmhheFJvaGtJNkttWXkxWUtu?=
 =?utf-8?B?RXNDeXpDTTB1cCtOdlZqTk8vdkVjV3c4bkNiK1JqallNMXhJK0REOUNkR2ZE?=
 =?utf-8?B?bHd1YlpETHNmYVJWV0ZjOGQ5aUFpRGtlRXAwMXRxMWxyOVlwM3YvY1VZbVpt?=
 =?utf-8?B?RnZCUjRiRnVFc3F2THdmUEtIMHFwaThVRGpLWVQxcks5ajVlbUdldGpsUU8w?=
 =?utf-8?B?dS9VUVhaVXVJaVdVUDU2R2dNbkNqRW0wV3FhNEpnWHhmZ1cvcnNQVVNvdU1r?=
 =?utf-8?B?Mk5WWVAvYnYzT2Z3OEdvelNDVUswU29mNWR1SXZINFgvUVpzL0liSWdEQWZu?=
 =?utf-8?B?UmxEY0V4aVJFRFRMS2hoUk1ta1lrclVQbE5rQThJUTdYdHg4MkR1RzRmSFdB?=
 =?utf-8?B?VHNJa2s4TzJnN1plVXRPSkpjVWsydmxaRDFPUEM5bVg0a0RhU2lNd3Z4UGJh?=
 =?utf-8?B?L3dtZlU0bzFLcWhZTGZnRWIzakpSbXhRZEZsbkpNUWlIN0JoR3AyY2hJbDZV?=
 =?utf-8?B?YktBVmZmd1FySzZUd1A0L1BrTWpLMXo0aTFKZSsvcFFjWXJvbm9nbzlSTUU3?=
 =?utf-8?B?ZWtaS21GUHpoYXd2WnArdXoweThMU2xubU51b0ZDditPNkx1Skd5ZUNCZzFh?=
 =?utf-8?B?TytmUXdGQ21BOGYreUMwVFBQTC9OU3VaYXE1RXdzTW1FMmp2VG1tOW92ZDBa?=
 =?utf-8?B?SzJOTWhRNnBrVGlhVDZLNkZRV1hXR1JqTFI5NXJsRzJSNEEzdE1PdUx4cVdX?=
 =?utf-8?B?dTFSdW8vM2gwYzZjMDYyNFp4T0NjWWE5TTRzUThlMnozUWdYeTN0enhwUEIv?=
 =?utf-8?B?bDM2MlROcFBhUEpPZ1dINEcvQ0l2QUNGSHM1SjNUcmVOZEhMZFMvNThGeGVK?=
 =?utf-8?B?QzdrejA3OUVoaG1XcVcyTDlwd21zMVpxNzg4eDhYdi9HVFVxVWw0dWJ0TlVG?=
 =?utf-8?B?WFE2cVV4QnNVYVQ5UXFyL2lobkd3SVpjeFBIekl3ckYwcnZ5UjRqdUw4d0dQ?=
 =?utf-8?B?bC9jSml3dU50TXBGNE1pSjhRUmJMeWl4TWIvUFJtbG9VczV1WW5YWEtYL2lw?=
 =?utf-8?B?b0Vpc3BEbjdxNEkyTXZYT0RwMno2dzF5MU5xR3ZGYXpudHAydjJEYTFvak8v?=
 =?utf-8?B?c0JyOG43STBnOXJkSlIzRzduWUdwaVFodTNleGhzZ3VkeFAxTERzd3lvOXBI?=
 =?utf-8?B?VHAzSWx4VlEwR1FuMjVkaFY5bWo3dTRZYjlRdnFKL284VTNOdXpzWUdFbjNk?=
 =?utf-8?B?MGZVZWVaMWtIMjV1aFRTSlorWDR3WVg0dEp1RmFHQTljQitoQzJ0Sk95N2xQ?=
 =?utf-8?B?U05hZm1uY0dmMkZzOEpORTVjNDFjdm9hWmhKQkR3OVdtMHZkQXNxamhMdG9D?=
 =?utf-8?B?WEJwbkZIdytEczBRZkcydTZqREpTUFY1YmhMalhvOU8yWmpxdGlSd0R5cVRl?=
 =?utf-8?B?Q2h6cHFLNkcxZEJMelIya01oRXVsM05MSGdIdEhjRFJRWUgwbVJFbEtTbHBX?=
 =?utf-8?B?ZEdsa2ZhY29zRVBBQWJ2d2w1N3F3bmFBOEc4MXQ2SGQ5dGM1QkljSmtvRXhU?=
 =?utf-8?B?TXRFa1o5STFLRDNxdUw0aGs1R0tnV0RFdlZQSlc0Y0szR0JPMUcxbjd4eWhq?=
 =?utf-8?B?MEVrTk5VZ0x0alRLRW1DZ3gwd2tQVkg3T2ZnMUE2blo5c3RvSVFvN0FNYmEx?=
 =?utf-8?Q?m9uZpcuJinIfxV0tNsmEwS9Ay?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37fcfb08-f533-4005-71b6-08db52bcdc7e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 07:45:31.1136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1MHK+e84NRt+CuzsOPegHh6LbJnfJeGsr8egHsBALiR8EIVKyWNdRaZDPcpsrZrHU1emDShj8pHEs/SS86hvbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8516

On 11.05.2023 19:09, Oleksii Kurochko wrote:
> bss clear cycle requires proper alignment of __bss_start.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with two remarks, though:

While probably not very important yet for RISC-V (until there is at
least enough functionality to, say, boot Dom0), you may want to get
used to add Fixes: tags in cases like this one.

> --- a/xen/arch/riscv/xen.lds.S
> +++ b/xen/arch/riscv/xen.lds.S
> @@ -137,6 +137,7 @@ SECTIONS
>      __init_end = .;
>  
>      .bss : {                     /* BSS */
> +        . = ALIGN(POINTER_ALIGN);
>          __bss_start = .;
>          *(.bss.stack_aligned)
>          . = ALIGN(PAGE_SIZE);

While independent of the change here, this ALIGN() visible in context
is unnecessary, afaict. ALIGN() generally only makes sense when
there's a linker-script-defined symbol right afterwards. Taking the
case here, any contributions to .bss.page_aligned have to specify
proper alignment themselves anyway (or else they'd be dependent upon
linking order). Just like there's (correctly) no ALIGN(STACK_SIZE)
ahead of *(.bss.stack_aligned).

The change here might be a good opportunity to drop that ALIGN() at
the same time. So long as you (and the maintainers) agree, I guess
the adjustment could easily be made while committing.

Jan

