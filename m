Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EAD56A14D
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 13:56:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362942.593238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9Q6d-0001bO-6p; Thu, 07 Jul 2022 11:55:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362942.593238; Thu, 07 Jul 2022 11:55:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9Q6d-0001Zb-37; Thu, 07 Jul 2022 11:55:39 +0000
Received: by outflank-mailman (input) for mailman id 362942;
 Thu, 07 Jul 2022 11:55:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+VJ/=XM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o9Q6b-0001ZV-0f
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 11:55:37 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2079.outbound.protection.outlook.com [40.107.21.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b57f0eed-fdeb-11ec-924f-1f966e50362f;
 Thu, 07 Jul 2022 13:55:34 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM5PR0402MB2737.eurprd04.prod.outlook.com (2603:10a6:203:95::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.17; Thu, 7 Jul
 2022 11:55:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 11:55:32 +0000
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
X-Inumbo-ID: b57f0eed-fdeb-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h12FesejtBGC6PoazOtW5eu2kDUkyB1BTFmA7StogqGudLhVTmHK7DUKfzA9m//Bl/3jlKXNJ3ASHi6TlowglcsaaOQ+JnEjDyO/a0PDLQNU6XpWz9wOnDCh+ormqqG2G2/eeywjF6stN57VtoR2oUEPPzNvhsyuc0UZBwCnarvdCOd+MSs4EyNkhSY8LXvysoe2qB0NBDG89NEZWloquQE3yovPs5tVzxQregWwwiJVa0Rrr73Cmj3Kv6JzckH1XbyBA+uPtYT33nnC7fY0ujxZdGhoB+zgM7kRdih2mX7Fzmeypzb+lKahJbeH6W21PUH+HITUk8lzyEixlcHO5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RMS5ols3p0aQi8ODPiMUrqXvEneE56yD24DzW4xORYI=;
 b=ithDGRj/zeg4dKKX9wJyQadHY/HkkjSwANyx5txyG5ajaLEDxc6eXPY8kYlhr7P/rrKuyL9oezQMl8tNSzYU/xCIQPsgJ9ifzgA4p8ScQaIlY34Q8yZ3IhIBmo+T5hvGSveI7jUkyXIt/McCIB+1NbHjIXu1txU3ckuczkJBPM9HBWX3ocmH5ultv16J/ZdclVJsgpi/KsX3wQXF1lm8nz8gCrxoWAjHORimuPsQf2j4x9+oua17TPxyYMOuY16noFv2BjvpLORDpZipiu5fwuECJs2xogSygzkl8xa21QeabOxj5yjS63MhyUgAiBWEQZNjdgstDBIIq4r3bDLJOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMS5ols3p0aQi8ODPiMUrqXvEneE56yD24DzW4xORYI=;
 b=AW2feoHKLh/4ugTDJeSuaQ5Y1tC45HXaZsoOz91Qxt3oF+wRxUeLCPlxvTwzVN+jfHtYsvIFAO+B/yydnlahlhqlokYSp9OZxjRtkSA9gG+RZ5pK0VzISehXkQEChQTbl7VxR+b2au1l3qIAKwLMTaHbAM4HInlL9rlhmudf0krc+4DTH1ertfsUHk01r9xeczVGup42mcEC40fVC2wKbxbjRm3y1mnWe5Y17J3LyL0KSzdMa57jb0NLPhwBhezk29OH2id9QVC+TRe4cT1FU4mKEF7w6tdOqM7D2g287I7AhxhETwv4NH6VUK2eIzJCA+hp3iCQ9q7O21bBD+qi0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <16803e7f-5a7e-91c0-03f0-3133e0dff957@suse.com>
Date: Thu, 7 Jul 2022 13:55:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC] DVFS and Thermal management subsystem proposal
Content-Language: en-US
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220707103500.GA1959452@EPUAKYIW015D>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220707103500.GA1959452@EPUAKYIW015D>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c48c93f-76a2-4f74-74e3-08da600f983c
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2737:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gPsNvac0gJN0nL+aljFE+OBwvIIof5SbkzX5Xtjle0KDKoj6DvKYlfSonwrhF6nYBfamlFs+u3FNSmLyOWtMtZc5irgn6WrFHTho7VE2LDcb/YO9nkeYAO7/gKaWp6nxW7LmCUkzioTeRzWQE1MNykzUfemWKVACfoVHnPe9VjVI2UNQzSq5MWdqCKEPPHrVW1DtxvtMC0s37P/W40Hx96P++7E2Gr4nAyZChp7MadS73PJbHetn30J0puXPq/7NhNEYYArwTIVIkmc97W9rFXMBz7deB/41/JhVezNr4oL1FqvTlLoAkPOzdX8QSI2H6IVTBGsR2oElAdqMxvtge/emhjzYR99sJpegf2J/wIRbWSmuRWjJy88GM9yfinnPCsbLPLQgmZuWi8y+2iqBmTZwJMu2+ZTzy1dxL5w/VsxgIR+x0RO/nsJByqHV48sDcuU/50T0/tLWgpSzibjexaESQLt/XOBvS5gpG2AxDCCAATpUkW8hM1bFQMEdIfsrgiO5VjwowPv2dW9IRY3rYuVggYZ3bMgozEnV1NtjELmkc1OH3UYZ8gsZbZFlfpWZWUBmxV9RcqImEfNAoDLueB397dtr9lKTDWCcGTQyMp6wH2wTAsqV1/B9QoshksC+WEOO0V0YtN0Hq7uQAKirnFtXEmZVae2BUMu2hQtemE+jULV8bHFaL3PqoG6MnP2cKmrNA/rJZkpUyvKK4KKkoRqndJFsouBg1ZlhJHPYFdjJpimMvnPOj3Ijll+huhuPBGa0mnGyUxzCMGi3nCzBah5kNe4BcGuilDH7jYntWmni0VwgcM/ietTf2bahtsEsOkw+tnr2cneZ8xJnptQLCUq+ThmvOc5m7ahuR3gz4HI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(136003)(346002)(39860400002)(366004)(83380400001)(6486002)(478600001)(31696002)(66476007)(8676002)(4326008)(66946007)(316002)(6916009)(54906003)(186003)(66556008)(2616005)(53546011)(41300700001)(38100700002)(86362001)(6512007)(5660300002)(36756003)(7416002)(31686004)(2906002)(26005)(6506007)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1pTdlhQNWExaVlaQlV5WHhQYUt5eDNoSmRmblBOV0k1SnZFYWNteFNCcFNa?=
 =?utf-8?B?OXlDWU9hNEJsYWFGNGtNMTFNait2cnVxNjU1YWtNdXVJbzY2aVdZaU1Zd0pn?=
 =?utf-8?B?aUVPYW8yVzBWRWtlZkY0cUlRMStxTDA0VDN3UlE3R0FoKzlQUHlBdnU3Ukc4?=
 =?utf-8?B?VHhVVkNPc0wxeVZEZG93ZTJ1amZRM21TK1lUSjE2OFozZUFqOHMweldjM1lP?=
 =?utf-8?B?allpdDZSN3cydDNxaUhaRTZmcnVEelRUZ3ZhU0NVdURkWUV0dUsrOE1WRXFC?=
 =?utf-8?B?MUEzbmVvNXVjMSt0MTVTSUVRd3pGY0ZQbWlNUmlFMmRnSjVoYzhCdFJHdDVy?=
 =?utf-8?B?Y1l4ZFJjVmV5RVc3UFRzcUtRTm55NTVjVC9GcXhJTkRyVjdEUWNxNzhCazNB?=
 =?utf-8?B?eE1nd1pSSDUwRTQzOVJCcVVaNnI5akZUcDNMNVBKOU9XYlF4TjBVRWdyZkZ2?=
 =?utf-8?B?YktTMnowNWs2NktuM1ltZkUzTmdzY1BON3NxeVlVQ3Fpd2prRDlQUDR1c3du?=
 =?utf-8?B?cjVMeVJEVWVGSzJMc0FlNTd4MFJZZzgwVWJOOVJZcFc4YmFwRURjTGRmd2Zj?=
 =?utf-8?B?bGZoWGtJbmtrdE9UZzJpT3IxYlptSGZSVjB2VkJ4dHBHdEl3c1gvTXlYQWk4?=
 =?utf-8?B?ZEhYQjQvcFp2YkNCSTBWQWN1dUU3Qk5wRG5nR1BUZTBSTE9ody9PRHVlMjhw?=
 =?utf-8?B?T1BVTmpiUStqajVzQUZqdy9wVzZ2S1NBVkhSUG42bDlHTmFwNEYrbE1SNFBp?=
 =?utf-8?B?bG5lMVZFL3VKZ1pYNWpMS2gzOUhhQjEyQy9wNXpKeW0zTTJLOGpwWG5HendN?=
 =?utf-8?B?L3dzb2dUVS81U0k2bnZZaitOSkt0Q2FEZHBjNXZnZ1piZkszNFFXdC9JckZT?=
 =?utf-8?B?b1NRUnRmSDZkdVdhUGRjVjhOWWh6bklDS0ErbGZCWUVWZ21oK1FWWUQxR2ts?=
 =?utf-8?B?anFJOTlFNXhYWkRoNnhHS2plUHB2MWV1anJVa0Q0empycU52ZGwwT1FCMnBw?=
 =?utf-8?B?Sm80ZDFHakt0a2txaTlDbFRiS1VmRTdmQ2EwWENIWUtjNkVXWldweFIzM0Jp?=
 =?utf-8?B?ZjVPU3pYWjRHT1R5VDlPSFNNNk54Nkx2ODlkTTBFQ1ZWMFRwT1lkci9XZ2I4?=
 =?utf-8?B?WjkxWXA4djVOTXVNZGZoU082b3M2TXRKVWpzb3pseU1NYVJyMmIyNGtUVlpm?=
 =?utf-8?B?VDRuOE1tZHdCOUMyZndjbnVVdGtHcnoxaUlkSjU3WWd1cVYwY0hOVnl4MERP?=
 =?utf-8?B?dkZRNWQ1bElBYm1YQmc3U3RabTNYbk1Reit6dHByeGljU1VuYk9FY3BMdlE4?=
 =?utf-8?B?U3lQaXFnMFdBVzBCYU44dEJldUxyY0YrM0xqRzNvMjZWcktULzNOMzBBMjIz?=
 =?utf-8?B?bjF0VTAxTVRScU16Z1N6YUdIRVhJZ051d3VkczR3Qkw1OU04U2dKOUM5ZHJI?=
 =?utf-8?B?d25YTXk2Z1p5Y0V5M1h3WkJhempnQkhINFkxd29iaUY0M3Z0YWsyRlBoUlNR?=
 =?utf-8?B?bXFKdmwxSkRhT2lsNElQT3VZYjJNaDJoY3Q3WHRQMDFuOWRWeWE3cEU0MWhH?=
 =?utf-8?B?VE02M1dWODNqS2dpVjRja2wyMGZQWCs3YmpmeGIyWTlRVERFYkZNbzhzcmdV?=
 =?utf-8?B?cWRCNU1aOXVsZDZEd2NVVm8xVlpIS2dwZzBaejVpcThlK2hZSjlNU3VicU8x?=
 =?utf-8?B?VUpURDdnUmw3cXQvNmZpaFA1bjVNL0ZXRitEb0NXSWNKVmZqa0JRMjBDdHpG?=
 =?utf-8?B?R2d6Y1d3V1BtM2pJUVN6VG9DcjM1WXB2MW1rc0o2M2trc3pRMTlLWEtsTStU?=
 =?utf-8?B?THFXcXhwSldzR01EZ1FYYUt4TkVuMHJwSUNVNnUwdVNtK2ltQWxFT1pnSnZF?=
 =?utf-8?B?QzdvZURLUmMrMXMreU96RUY5TDFzVytGcFJpVTk5M0NObFNYMWxvdnN2TGU2?=
 =?utf-8?B?OHgyWk5DZXVTK1hFVjZzUVJvcndCeDdiYjN6aXBCMDNDQzU2M3o2eFFZV3do?=
 =?utf-8?B?VCtRMFFOeTJaM01ocUtNQTFpQjFiYU52c2hmeHVJaWcwZFBEem5BU29LUUYw?=
 =?utf-8?B?b3F1TXV0ZnlaSnozbmF4M0laSDFycGhRNjVsUUdNZ1BBNnZ5OFdacHhzRU1l?=
 =?utf-8?Q?7Va3ip3COmC40oKIOjLUFxoe5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c48c93f-76a2-4f74-74e3-08da600f983c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 11:55:32.2627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0nuGOPOueE0YTNGY6gzAmKS37Je5Em/kcSBfy9nlRdo+eaHAOnyykvHlPAAH+h2zTDbDQvjDoQlNcSGq3feVGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2737

On 07.07.2022 12:35, Oleksii Moisieiev wrote:
> # Synopsis
> This document is intended to describe the design of the thermal based cpu
> throttling in virtualized environments. The goal is to provide generic thermal
> management subsystem, which should work with existing cpufreq subsystem in XEN
> and could be used on various architectures and hardware.

Looks quite plausible to me, just two questions:

> # Cpufreq subsystem in XEN
> 
> ## Brief overview
> 
>    Governors
> +--------------------+
> | +----------------+ |  struct cpufreq_governor {
> | |  ondemand      | |      .name
> | +----------------+ |      .governor
> | +----------------+ |      .handle_option
> | |  powersave     | |  }
> | +----------------+ |
> | +----------------+ |                              +----------------------+
> | |  performance   | |->cpufreq_register_governor() | +-------------------+|
> | +----------------+ |                              | |  cpufreq_dev_drv  ||
> | +----------------+ |   cpufreq_register_driver()->| +-------------------+|
> | |  userspace     | |                              | +-------------------+|
> | +----------------+ |                              | |     ...           ||
> | +----------------+ |                              | +-------------------+|
> | |  ...           | |    struct cpufreq_driver {   +----------------------+
> | +----------------+ |       .init                  +----------------------+
> +--------------------+       .verify                |    Hardware          |
>                              .setpolicy             +----------------------+
>                              .update
>                              .target
>                              .get
>                              .getavg
>                              .exit
>                           }
> 
> Cpufreq subsystem consists of 2 parts:
> 1) Cpufreq governor, which should be registered using cpufreq_register_governor
> call;
> 2) Cpufreq driver, which provides access to the hardware should be registered
> using cpufreq_register_driver call.
> 
> ## Hardware drivers
> 
> There are two Cpufreq hardware drivers implemented by us (see Appendix 1 and
> Appendix 2) to provide support for Rcar-3 and i.MX8 boards. Those drivers are
> designed to support thermal throttling subsystem. They are going to be the part
> of the contribution package.

Are these drivers also intended to act as "ordinary" cpufreq drivers,
i.e. controlled by cpufreq governors instead of thermal ones?

> # XEN Dynamic Thermal management design
> 
> ## Synopsis
> 
> Introducing the design of the Dynamic Thermal Management for Xen hypervisor.
> This feature is an enhancement of the Xen DVFS feature and will allow system
> admin to configure different thermal governors which will perform CPU
> throttling, based on the CPU cores temperature and thermal configuration.
> 
> ## Top level design.
> 
> +-----------------------------------------------+
> |    XEN                                        |
> |              +-------------------+            |
> |              |      Thermal      |            |
> |       +----->|     Governor      |            |
> |       |      +---------|---------+            |
> |       |                |                      |
> |       |                +-------+              |
> |       |                        |              |
> |  +------------------+  +------------------+   |
> |  |   Thermal        |  |    Cpufreq       |   |
> |  |   Driver         |  |                  |   |
> |  +------------------+  +------------------+   |
> |                                               |
> +-----------------------------------------------+
>                     ^
>                     |
>                     |
>            +--------v--------+
>            |                 |
>            |    Hardware     |
>            |                 |
>            +-----------------+
> 
> 
> ## Thermal management subsystem design in XEN
> 
>  +------------------+
>  | +--------------+ |
>  | |  powersave   | |               struct thermal_governor {
>  | +--------------+ |                   .name
>  | +--------------+ |                   .governor
>  | |   stepwise   | |<------------+     .handle_option
>  | +--------------+ |             | }
>  | +--------------+ |             |
>  | |     ...      | |             |
>  | +--------------+ |             |
>  +------------------+             v
>           +----------------->register_thermal_governor()
>           |
> +---------v--------+                         Polling temperature
> |   dyn_thermal    |<--------+             +--------------------+
> +------------------+         +------------>|  polling_handler() |
>                                            +--------------------+

Polling (only)?

Jan

