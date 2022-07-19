Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B25579F40
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 15:12:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370634.602483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDn18-00083o-Ti; Tue, 19 Jul 2022 13:12:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370634.602483; Tue, 19 Jul 2022 13:12:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDn18-00081F-QC; Tue, 19 Jul 2022 13:12:02 +0000
Received: by outflank-mailman (input) for mailman id 370634;
 Tue, 19 Jul 2022 13:12:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UBo5=XY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDn17-000819-Ht
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 13:12:01 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00089.outbound.protection.outlook.com [40.107.0.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f611659-0764-11ed-bd2d-47488cf2e6aa;
 Tue, 19 Jul 2022 15:11:59 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6755.eurprd04.prod.outlook.com (2603:10a6:208:16a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 19 Jul
 2022 13:11:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 13:11:58 +0000
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
X-Inumbo-ID: 5f611659-0764-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SzufNF2FX6yfgxE/lk4IZ9hc+Dt7PwZChVxoSuUnz1gmsILS2S2LTuFkRcZiCPqsXveaF1W1W80W0myyPduN2m1eXm5xXcgFeaCOOOPq6GWHeArAEtTByr4KxitMQGZ8+fFtcztVy3cyHnElTMuivW/LcGNlexyNSfWgkDH2OAmwUnb4EvPoE/XM6CjWO4/Xvt2GUVWFnLRXNJhE/GhArB0sQBh91NBe+cxZYeH7JZpTZ6BEYWfOcyvjihmaJE9U5vrQ53thk7E9FAs4fMhNRq32ZEbKoigM2cK32tQc2xvKDP/pBBsrDUKJV78COoifBoNiEplKuszQZicB+ngN3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMIYP5hlYXCfohQKOngoeBwMxv8+5FmVs6MIHhxCB88=;
 b=SX65p7GBXs9hMxl0yw85QSzompWouZU3wfDJ4ir95HSlfIt2T+Kbh3Xq2Rhz/t8mKfEPiTDa5BPMmWaZH0Y1skEKi6jTXxRtT/PUynZ3fyrmQ9AxwfV6+wgnH44UrdCHZ6WeKh/nzWjZnyhVbhcNISJGPuHAzULjb40HpbDf9MccYO5vkDQGS3hV8DJXmapxUNjSkFZCCUWmQlzTBG+/GOS0VkNPamYPiIPLoa9KmhX+npdG+pkp3bUlpTygs+tsr7IIx1ugUmlBNEWHEk+1tiNYDtBWzijvwI9OahWWFZqSB2pv8mihDesIfHRUw9MI4KjJH6ovqcKALnpgvfCpvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMIYP5hlYXCfohQKOngoeBwMxv8+5FmVs6MIHhxCB88=;
 b=MnQnfq7YJP++S8Ypqj4Q5dqY/geWZCPLllEgbtVz3yarBTl0sNffnX9nXwt9vrmS+Eygos0sN+TLyPEcxiPnlQZzE5R2cyw/u9PP0gFcnVgJgXh4P+v+XCu8SvplRTNSOR7qLLvow/xPYNcyhIACjO6wsrrzTa0la6zSqKCmzBE6QjEatVQEtdeCltPd6fautdxvbx59PVfUxf1in6cGZOssDmbkzISOuN7N515oMYHQDwNuUQ9XT6cwWo4Yn0bm+XauqVjJtlu7z4hKH1f4F3KREJmm1X9wPxAmzrP+5jUINygj+FRSxvN0/j5uPDU9j8N11JFpUTCA1gTeR1wKrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <39c02342-649b-1f9f-f685-27efb7293c69@suse.com>
Date: Tue, 19 Jul 2022 15:11:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 02/18] introduction of generalized boot info
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-3-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220706210454.30096-3-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0040.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d0d8fac-7269-4d8a-1866-08da6988427a
X-MS-TrafficTypeDiagnostic: AM0PR04MB6755:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WRrFfG0FfcbEvKLbIYJ0b6eHwohPY1upp+zeni1d+F0uMKbz3WJQ3rSNAnAc8xhbfYhMfsuVR7sjIsHvTp8VoMwnIkz+xa5eRq7WCrDoMKjctn9qbXRCJn6HLVCTUQfDkNqsAnafhhkLZIHgGs2d3jZg71swLyp/qZiznQxKLN6Pi9m7kEtyZ8hpsL+LcRb/0U4n3gJXU27eF1hPS0OV0L7Yef6eMzyx55iNR661JtkBs3x3I6e/zA2NRIg0knlcnU+Wc5fQWC5NB1LP625T9xGJUjVqURFAhXQjBYU4nOe77jTSB1RASEKjQ2oHMq+DbP1usA3yl8JuzWh8q2/1I+dCc76En+mpZK4xP1K8N8m1YwqlE8GnlJA/HB494rNTa6X6EzSnXAyyJfIdBbnML5x/khzMwce9ja/JQrHA1+tlHpyDBUJEEEJbkglala7LCMYp/JwayF72CUE/amaQIzGVfn/yQO5gxisKLehizx2cVSgUvsQ4avHmDDPwcFzu2rN9+N73uEJ8TICDJY2PdWsa+Hb7Ht6eA8DeHg5mIXtHdKsvt7Y3u+keBtTF0vJXp4x+4E2UNeMB6j/L7unLZQfovsk7dM/YFR+EaRffFOMYlWEfcdV7qUQIpJbyefgemtOlS8IUBAqGhYO7LMF841pMQ8+Sq6MkHZK/25Gk+7fJ7LbEiQj66Qkg5Ld4fXAkTUf3I4lMPXPaJyCAO8x5F6m+Cw3+hB0wPEDLY8Kn3KXuxc+7Qs4UNmp+vCi6Du1f9HilSe+BteyS3w0laFC/pHThIMXm09lC7Tu6hqC/RkKwqG59ma9kLzX70sXqLZ/2MS4fmcY47Rz3YwPW7iXKWA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(346002)(396003)(376002)(366004)(5660300002)(8936002)(7416002)(66946007)(66556008)(66476007)(8676002)(4326008)(38100700002)(2906002)(36756003)(31686004)(6916009)(31696002)(316002)(86362001)(6506007)(478600001)(26005)(6486002)(41300700001)(6666004)(83380400001)(6512007)(2616005)(53546011)(186003)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2tSeVJ2RzNMSDBIc0V5OS9NeGdTaHE1WEpXdVdQS0Q3Nm1nZ0ZRRFVUNlda?=
 =?utf-8?B?WUptM1V3NVd5WUtQeGRwT2VZTmgvYnZFZGVmU2JiYmNRTWxMaTFabEUzajBI?=
 =?utf-8?B?WWRrcFhBNFJzNCtDejN3YmE1L3hJb28xTXBOamo3M05Zcjh1aDEwcTRWNzQr?=
 =?utf-8?B?Y2JZYU9mMXF3aXhWaURWZnl3ZjlUcGNhVWlrUGdta0dCbnh5WGpIWFczUjU2?=
 =?utf-8?B?aWh2OFRkaDIyWk9BYnNTSUc5ZDBLTlBQa3lyNHZYVFRQSGhGU1BFVjhyaGRD?=
 =?utf-8?B?dTE1dFVoRGpwaXdKeWtNUUJuK0E0cHBoNjVreEs0dUlRVGZwcVNKbFd2dWxv?=
 =?utf-8?B?OFFERHR1Y2xOaGdVWVVMNklxMXcrUTBIN2l0UmdmL1ZQTUlpeHpDYlR1Nito?=
 =?utf-8?B?aUF3YisyOGdvTWpuRmxjb1pWaUlyd2Jpc2c3MHFGbGROM1FuWjB3Z3U2dVBo?=
 =?utf-8?B?d0JaTEJ5YkhOM1R6WCs5eFJrVkcyd2lPMWorY1pVVkJhQTVrdWVxVkhGd2ln?=
 =?utf-8?B?cVAxSFFkV09HZmFocDNoc3hweU42MHVSVXNwMWxZd3BDYkdZWEdVQmhoa3Yr?=
 =?utf-8?B?M1JROXpxMGdacnVLbElGKzErZHhxNTNxWVhZTUlhd3M3RlViSTNvVGo0WTkx?=
 =?utf-8?B?dUxGbzRjd0RpcTNuejd0MXhtK0ljMjFQNW0vV0JLZXdxVXVCV1RuNHJIdE1t?=
 =?utf-8?B?YU5QM0wvTFVOWms4K2pSY0J5TWowbXRvaW1BZFFDeFRtb1ZWQnJZa0tzTG5x?=
 =?utf-8?B?Rm5VWHdnZURwODZsMllqcDhEQUFvemJiUlFSVG41S083K0Q0MnA3Wkl3Z2k3?=
 =?utf-8?B?MWdzbkd4YTRrYjRtNHg5aXRkZ1VIeit1anNyMkhPTlZtYlVPeENFVXVJdVJn?=
 =?utf-8?B?SlhnTFJiaTEvY2JkS0tObEtYRFJlVjNTa3hEakRLd3JDeW9IUE91MzdYVjZ2?=
 =?utf-8?B?MVBwcTJUMStGYWhyT2pQM2NEOUtaczA5Z1hHUy80VlJrYVlXdEFQMlBMc0t1?=
 =?utf-8?B?MVV5WU02bnhPakNodmMxRTF2Sml5cHVoZ1BnNkRzWEFuTktYQ2FVWSt2Qi9D?=
 =?utf-8?B?NGsvZDhCYVhCYUpnZjd5UVcxUUJ0dkxYVCs3OWNPME5QcEJ4cy9FUTVvTy9r?=
 =?utf-8?B?Q2VuSlR5WTQ2RWtKRlhaMUlvVWZac2p4Yk9iNEpadUJVS2FDbVZydjgwSTYz?=
 =?utf-8?B?OVhpNVpDczYya2x1ZTZXZ3JpaGswSUFBMmVnZ1V6ZlBSZ1VNZldyaWU0Rll0?=
 =?utf-8?B?MFdnbjBuNEprMlFBMWQ2bTFJelF0ckJUUS9xZUpSaFZCaHJHVERwOUNZRWs0?=
 =?utf-8?B?NzM3RjBTNngwR2NDWkREWlhDQVhFT2pZZ25sdnFOZ2dKWnBkNm5OTFJ2aVJX?=
 =?utf-8?B?NnM3U1dqMkN0bnlPTndCcFpSc0JHY3BycENwVzFsbGJONlQvdTlGOWtDdFVL?=
 =?utf-8?B?c1ZIY3FNaTJqRTVTZGY0bjkrdDlZUnNnS3ptNWtIZW1OaHMyQktIN2NJd1l2?=
 =?utf-8?B?TDA3azhJSnBYUTFOZmZIWFJFTVBXZy9SM2J0M2Ivblk3eDNLeTMvS2srMCs3?=
 =?utf-8?B?Q241Zmg1dnJCeWJwVmxGanY1Qll5bzhFTnZxbGFCZnZucThlS1hoMW5LR3Vr?=
 =?utf-8?B?T1FNbG9iVjl0ZVI2Y2FCdXNFVG1CZmVhUkcwSnB5eVRYUFV4TmZLOHlkRTdB?=
 =?utf-8?B?YTFoTmZZVjZ0VDZCV09KMFNpa3UwT2NmYXlFd3FVcm1VMklCU3cvUGsxVmlp?=
 =?utf-8?B?YXpadjZTeFZBcXhOWTg2Qllxc3RiZkZYOTZUZnJreDJuZWFCRzc5bVZPdXBG?=
 =?utf-8?B?cVRlYm4yVlV3YmpNbEtjYXZldHVRN1UzTkNiei9TRExGL0c1akdtUStoKzlI?=
 =?utf-8?B?ZzFGc3AvZ0VsMmFYWWMwVkJ6L1NpbHgyLzRXdjdJa2dIanp5TEVMa3BPdktj?=
 =?utf-8?B?aDlRdFJvNkgwNUhrQnNhdlV1SFpqTDkveHhhcUpiVGJDTFpvM0gwN0YzSEhu?=
 =?utf-8?B?c3Y1OHBOenp4MzlUdGJoa2l0Smh3aE5RbVUveVJvQnhlUUxZVy9rdkxrcTB1?=
 =?utf-8?B?Vlk5LzcxTDA3R0o1V2EwOWJVUWFKeFZqMUxVYnk2NENPWnBLbTRWZWtqRXlM?=
 =?utf-8?Q?eRzxWhKy/ChpFVrB/hKqv8YLp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d0d8fac-7269-4d8a-1866-08da6988427a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 13:11:57.9206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ViowguatBJHb0f4OLoBKfrwtBOwqQIItakKuOSQTILixnx5axQEbrto0ey5xp+8H5CPJ4g8BqKVkjk9UtQ9Blg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6755

On 06.07.2022 23:04, Daniel P. Smith wrote:
> --- /dev/null
> +++ b/xen/arch/x86/include/asm/bootinfo.h
> @@ -0,0 +1,48 @@
> +#ifndef __ARCH_X86_BOOTINFO_H__
> +#define __ARCH_X86_BOOTINFO_H__
> +
> +/* unused for x86 */
> +struct arch_bootstring { };
> +
> +struct __packed arch_bootmodule {
> +#define BOOTMOD_FLAG_X86_RELOCATED      1U << 0

Such macro expansions need parenthesizing.

> +    uint32_t flags;
> +    uint32_t headroom;
> +};

Since you're not following any external spec, on top of what Julien
said about the __packed attribute I'd also like to point out that
in many cases here there's no need to use fixed-width types.

> +struct __packed arch_boot_info {
> +    uint32_t flags;
> +#define BOOTINFO_FLAG_X86_MEMLIMITS  	1U << 0
> +#define BOOTINFO_FLAG_X86_BOOTDEV    	1U << 1
> +#define BOOTINFO_FLAG_X86_CMDLINE    	1U << 2
> +#define BOOTINFO_FLAG_X86_MODULES    	1U << 3
> +#define BOOTINFO_FLAG_X86_AOUT_SYMS  	1U << 4
> +#define BOOTINFO_FLAG_X86_ELF_SYMS   	1U << 5
> +#define BOOTINFO_FLAG_X86_MEMMAP     	1U << 6
> +#define BOOTINFO_FLAG_X86_DRIVES     	1U << 7
> +#define BOOTINFO_FLAG_X86_BIOSCONFIG 	1U << 8
> +#define BOOTINFO_FLAG_X86_LOADERNAME 	1U << 9
> +#define BOOTINFO_FLAG_X86_APM        	1U << 10
> +
> +    bool xen_guest;

As the example of this, with just the header files being introduced
here it is not really possible to figure what these fields are to
be used for and hence whether they're legitimately represented here.

> +    char *boot_loader_name;
> +    char *kextra;

const?

Jan

