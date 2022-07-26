Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E89258150A
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 16:23:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375347.607672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGLSX-0005sr-N5; Tue, 26 Jul 2022 14:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375347.607672; Tue, 26 Jul 2022 14:22:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGLSX-0005pc-Jl; Tue, 26 Jul 2022 14:22:53 +0000
Received: by outflank-mailman (input) for mailman id 375347;
 Tue, 26 Jul 2022 14:22:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGLSW-0005pW-Dt
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 14:22:52 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130052.outbound.protection.outlook.com [40.107.13.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e0f743b-0cee-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 16:22:51 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0402MB2747.eurprd04.prod.outlook.com (2603:10a6:3:e1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Tue, 26 Jul
 2022 14:22:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Tue, 26 Jul 2022
 14:22:48 +0000
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
X-Inumbo-ID: 6e0f743b-0cee-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJcvpiX0iNuMNtwFflw4zXcDrCKrEUP+EmjOX7nhpzew2Yx1RxAJLkegZRWkZCBDXPZiCkHBWj76vZK4X4h6UUCMR/P6hAXvDH6D4vtR4vKFRVNb2F+Li2hNN/1Oo5tbVXwHHhashS+nPA36Dzb2lpHmX23zMmD8n6UHyp/ofd9DDfU5wadh2O0xW4rDXv7v+/dovkO5d8EbGgCLeQ0ZUOgeAr9zUxHv9sq53fzyt1KQdG6yBbMx7Omt017+PI1vDiL3FJVYGr8bn1YxE8e8EkfFxyvHFEevuPoCfAPlzxJqFJZq6QpPefjI+AsOF1D3xlduwinnxbXkxrH7M1ChJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5FDg5yIlwKx00AS1KOPVi2ZDa7fNr/Sis7oi5947cg=;
 b=LgLsXCbqcdZroXZESvi4pM3sqFwrtWIWY4gltAE7YLYF7l0Xiuf0zcXV8OsGOpfDTJJ9Yfs85G/FoqE/bG5WE/ht2yfy61l6+b0/Fq6Asd2yAbmlE96PrISmJ6awD/tXU+yxxBjC1h7QWccm/x1Jo62/kIUbbu37InHcWZ83wKXFz9Q9amSbvyjWn3OCcoqlaqjSbhBGuY41pmbQ9bg0BVlBawAlqnGGPuanVlan/qmYa6nHHVGhBmrzx0M4FnWMAv78X0Iyo3ubcIpJeYOmCkhmCnwpRoDgHWUZGJAusAPdJczCA/s9z3NRRL1IvFyI6p2WNs0fDbG57bSdangxsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5FDg5yIlwKx00AS1KOPVi2ZDa7fNr/Sis7oi5947cg=;
 b=5RwcFZ8gYae8Rigp10RP2P7uC2FMvO4xyKZnr+ubvygTBC3Uu8t1SdQWgaIh5uNym4aMANWxTQJTTPu4x4q01OLhuHLd2arug4Bf56yhx/MfVfrzPpGTNj/1aqAXlJKRPNPJ4t9DVdhT1Nt/Wvo2qUrPfJ5+tAdAQoxC+X+O5T6oqjumSDg1B1LWzVTSvdeJPTaCVyKPY3ZVNbbCgU/uuP5QfeqI5d6YUrgBN1Qi3Vybx/bwxL6/R5fJMo2ZIO20tpi+qCfRSSTmKb/REojpOYuoghdfDfZY8C7Aj/qkmOE0xRyKLt3T7BsXS/dZnSlT+nBK69o9Iv85MsX0c7vBCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aac5944d-bbef-ad95-d2e3-77b24ed4794b@suse.com>
Date: Tue, 26 Jul 2022 16:22:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 09/18] x86: introduce abstractions for domain builder
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-10-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220706210454.30096-10-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fdd31817-5b17-4247-824e-08da6f125108
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2747:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Dx2HS+g4y92rW6KrFahosZ2C/CYRbpgnR637O4wmDDaYzArOnOCpKAbdj66LobcuHCzfR//TkSm5Xe+kllesoQalXnW7mK5anjejM/6jdgUWPfQ0QI4+nLwKWaS6mRQGr8KKK87b/uMcuCyugOJB4WJ3GC8oz+lZ4SBqL3hKUlQjgnhsWlVTrQEgKrcobB+pJxAYt6gQcsEbHNfwi9RhToV64lTU3D6LCB/KbgobhZzUaoOkmzZABDvZhCW+w+kg89WtqwrnrpIr62STdkp49/J7Du8vTR2prJiZ5XuIzzzT3ItVlvgvbzOTsBoamB2P84nPsccVqk0wSW0dJqc+fEx0fMZJ1/5kFC6z4BucbHF9mWKBBeNDRC/SP7v4J9RzNfx8A0n8z6b6D565qSCTY6Od83WE2XdZ6zC9XsWbroehCVRlSxwpzB4tID3UM3NPlwZexog0XadtxLPTxhmG0eXRK/IFSNJG2daWlHsUQsro+RjIBk0QGtNsz6DsBsDk2+TOFBuakyykO33p4qBHNo0Ds3V+MCqsw5Z5V8KUYb2OfwAqZYSlZuxvC5HWsqCSuEAMJ+DfASDEb3ARQaBtOEACiSsEKySSNf8YXc9P4HGTxgQZhzRI7stut1hz9H8psgYPat3tmNsABLQFpJXzx9R5vvicc6fzp5xG5GBp/4/Zm98kPeVRyC5SFuaIiQWKHh7rKaAtgBizLdvj3svCvtlvxEO1K93p748Lr7+vJbwqYyObIti+PRMTEVMSlV0SLAB/2b9bAlv9R3G9/RBRCXzOeqN8OTeLfIzlmS9qar0ZGj0CDNvTrv742hGboZEfjtL4FVqLZntuijd/4f7ztg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(366004)(376002)(346002)(136003)(38100700002)(316002)(6916009)(54906003)(36756003)(31686004)(2616005)(186003)(66556008)(6486002)(86362001)(5660300002)(8936002)(26005)(41300700001)(7416002)(4326008)(66476007)(53546011)(2906002)(31696002)(478600001)(6506007)(66946007)(8676002)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1JEcy9oQmNzMkJpbmYyVEM0Uy9WU1hZdzB0UkFnY2F6MitHRzRteHBrZm4y?=
 =?utf-8?B?UzY2bjJSWkZTRnBFZEZNNFIzeVBNbnpMU1VqSitKMCtzVUllUDVsb0hVOFFW?=
 =?utf-8?B?ZmZRWHU5SndZN2RXS3kvRlhabGhIRWkxdnNRSW5jNkJvNm9CS0tkbjVHSTRS?=
 =?utf-8?B?Um03SWxNL3JYZS8wUmVIN3BWeUtMNHl6cGNoaENXQnpXdDFLWllGaUtLdlVu?=
 =?utf-8?B?V1hjZkFtdFRaUEdobnA0ck9kYlgyS09CUHBKOUh1dnZaNDBzTHR0TmY4RWNQ?=
 =?utf-8?B?bmRpWjJUYy9oZFBUU3RDbmt6SVZuVlBubUZMV24wVy9VNjBhaStOeFRxOXEw?=
 =?utf-8?B?Wk1Sa3RyYVlBZldqZlNncU5OMnNRQ2twblZtaWJiUVdMdWMrdVQ4dDduWmJO?=
 =?utf-8?B?STJCTS9IQWFLTU80YVNOTUpYY0dlV2djVXNpbktUY2tjNjJiT3NkVzB2NWlo?=
 =?utf-8?B?bkE0NWlFSDdKaWIxYjNQSm41VmRna1FrZUJLNHdGWnk2R280TGo0R0Jic3pN?=
 =?utf-8?B?MkhycmUvSnpEUnBNRkFjSis2UW1RYzdNMVYwS0JFaEgzZnBCajJVemx4NnAx?=
 =?utf-8?B?Yk5XaW0reXRSRll2V3hNeXFka1Bab0orc3I5WWpBWm5Uam1WZmZoZTlpTzFH?=
 =?utf-8?B?cmkvdFVCQktwWG9DTjhzanBaNmU0cVlkUHM2VjlyUDdRbnk1RUNNOXdxMkNZ?=
 =?utf-8?B?OVloUmJCYU5vdlNuMWkrWnB5NlE3YS9Ob3NJMjJ5NysvL3dOS3BOZVVXbzJM?=
 =?utf-8?B?OFgzcmdZeXB2QVFiUWxqUHd0b3EvY2NTVCs4UWp6aStKa1RTelNPek1rYkky?=
 =?utf-8?B?OU5TUFp2M1M5T3FPMUtDMFp0cnUyQkNxSlRUNFFTcXV2WG5uN1N4QWNYMTAy?=
 =?utf-8?B?MXNHRXpndjQxRDY3QUdXVHpoYmNuc2FKVjVjNjh6TTArMEFTMlMrMGFtdGQv?=
 =?utf-8?B?RmtrYlBmMUNHS243V0JjSmJuSjF6bWJxcmFzY1lYRzVMNE1mN2RaWGZqS0p0?=
 =?utf-8?B?YmZxcHEvZzFqMVFDNnpQbXdSVndxbEJrbDFQWHViN3FnS0hSWEFYamVvbTA5?=
 =?utf-8?B?V2ZxMG5QYjd2dWlvWVBqNVNXZ0xZcjJlK01SZjdrckRjeVZySGhRMGdzUnU0?=
 =?utf-8?B?OHhkaTdxNVVYdzZOczFkTk9DWmdBaU8yLzY0dXQxcVpqMFZPZ0RWcHRUQjNa?=
 =?utf-8?B?V1REbnFXcHJiS2s3eTlReGlSRmtNb1ZCcW1PSVBmUDhZWUtjVFFxT3VsaVk3?=
 =?utf-8?B?ZWZLVmxtbVFZc0ltZDRlclZ1eW03dFNHZEZkV2Q1MkdRQnFZQ0hKSjh5a2k2?=
 =?utf-8?B?QkV4MjNsVWxNMkFpeG5aU0l2Zm84dGhtZkdmVGJ3eUQ1VGU4THRvNG12KzhT?=
 =?utf-8?B?MnZsb05xUEMwMVdiWHZ4VW5pK2JubXZzMDJKcmM4dHBjSVhKeFh1dk0vVklL?=
 =?utf-8?B?Rk1jTm5pWks2bEx1V0FiaVZOUEpYdFBKc2xMUHZPMUNMTm52cHNjK0xKVG1y?=
 =?utf-8?B?WjQ0RW8vM0RSNWFhYTNaNHAzckM5UkhUbGg4aTBOSnhnRXE1NVB2NjJudHIy?=
 =?utf-8?B?eWNzUzJlSEp0K2gzMHZOejdrRUg2OXpkUCtYWDk5L1FoT3MxMnhPaXBzWlVj?=
 =?utf-8?B?YlVxaDVJUEtnRVpJRGd5NndCR1ZEUTI5Q1R1cTR5MXQ4VkVLWDRGZkV5SXlJ?=
 =?utf-8?B?ek9tc2h5aW90ZjFzVGRhU05LUHljcStGY0tuVC8xby9HQzgrTTBLdnNFcE15?=
 =?utf-8?B?MlhNT0NOVXoycGYvQVc5V3ovQzhWNDFJTk5ONC9ybTF5YmY5LzhUaWVWaHV6?=
 =?utf-8?B?RE1uZnNCM25NSVhWTFQ5bGZYK1lWa09HY20yZ1FCaStkVlB1ZDNjcGsyYWpH?=
 =?utf-8?B?VkE4Z0JzWkpiU1NKK3Ercnlrb2prYll3b1pZMHVNYVRkT1pIQnZ5c0tEb2xL?=
 =?utf-8?B?QTJxSHFkYThFT0lwOW12M2R6UXBzcDNQY1AxSHV4WUI2aGp1Q0N4Y2Q0Mm54?=
 =?utf-8?B?dFhmMXVaaWdkbEdwRGU2R3JXZWgxcGRBN0QxU2ZUWEZiQTF5L200OWlCY2dj?=
 =?utf-8?B?Q2dXMFNxNjRKYU9obWR3OWpxYVk0YTFsUWwzZ09PTytsVGIvYTlUUHRKa3A1?=
 =?utf-8?Q?Ps/wIibHjmVqMluhYgMC9Bj8w?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd31817-5b17-4247-824e-08da6f125108
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 14:22:48.7515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l4/jq1jGL/YydQ1yHs68JdpJKrSekgImeG2IkToEwhHAnfPCWyJuUYviKiDGdrmziEL/Soz406s5N7ZjMdgANQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2747

On 06.07.2022 23:04, Daniel P. Smith wrote:
> --- /dev/null
> +++ b/xen/arch/x86/include/asm/bootdomain.h
> @@ -0,0 +1,30 @@
> +#ifndef __ARCH_X86_BOOTDOMAIN_H__
> +#define __ARCH_X86_BOOTDOMAIN_H__
> +
> +struct memsize {
> +    long nr_pages;
> +    unsigned int percent;
> +    bool minus;
> +};
> +
> +static inline bool memsize_gt_zero(const struct memsize *sz)
> +{
> +    return !sz->minus && sz->nr_pages;
> +}
> +
> +static inline unsigned long get_memsize(
> +    const struct memsize *sz, unsigned long avail)
> +{
> +    unsigned long pages;
> +
> +    pages = sz->nr_pages + sz->percent * avail / 100;
> +    return sz->minus ? avail - pages : pages;
> +}

For both functions I think you should retain the __init, just in case
the compiler decides against actually inlining them (according to my
observations Clang frequently won't).

> +struct arch_domain_mem {
> +    struct memsize mem_size;
> +    struct memsize mem_min;
> +    struct memsize mem_max;
> +};

How come this is introduced here without the three respective Dom0
variables being replaced by an instance of this struct? At which
point a further question would be: What about dom0_mem_set?

> --- /dev/null
> +++ b/xen/include/xen/bootdomain.h
> @@ -0,0 +1,52 @@
> +#ifndef __XEN_BOOTDOMAIN_H__
> +#define __XEN_BOOTDOMAIN_H__
> +
> +#include <xen/bootinfo.h>
> +#include <xen/types.h>
> +
> +#include <public/xen.h>
> +#include <asm/bootdomain.h>
> +
> +struct domain;

Why the forward decl? There's no function being declared here, and
this is not C++.

> +struct boot_domain {
> +#define BUILD_PERMISSION_NONE          (0)
> +#define BUILD_PERMISSION_CONTROL       (1 << 0)
> +#define BUILD_PERMISSION_HARDWARE      (1 << 1)
> +    uint32_t permissions;

Why a fixed width type? And why no 'u' suffixes on the 1s being left
shifted above? (Same further down from here.)

> +#define BUILD_FUNCTION_NONE            (0)
> +#define BUILD_FUNCTION_BOOT            (1 << 0)
> +#define BUILD_FUNCTION_CRASH           (1 << 1)
> +#define BUILD_FUNCTION_CONSOLE         (1 << 2)
> +#define BUILD_FUNCTION_STUBDOM         (1 << 3)
> +#define BUILD_FUNCTION_XENSTORE        (1 << 30)
> +#define BUILD_FUNCTION_INITIAL_DOM     (1 << 31)
> +    uint32_t functions;
> +                                                /* On     | Off    */
> +#define BUILD_MODE_PARAVIRTUALIZED     (1 << 0) /* PV     | PVH/HVM */
> +#define BUILD_MODE_ENABLE_DEVICE_MODEL (1 << 1) /* HVM    | PVH     */
> +#define BUILD_MODE_LONG                (1 << 2) /* 64 BIT | 32 BIT  */

I guess bitness would better not be a boolean-like value (and "LONG"
is kind of odd anyway) - see RISC-V having provisions right away for
128-bit mode.

> --- /dev/null
> +++ b/xen/include/xen/domain_builder.h
> @@ -0,0 +1,55 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef XEN_DOMAIN_BUILDER_H
> +#define XEN_DOMAIN_BUILDER_H
> +
> +#include <xen/bootdomain.h>
> +#include <xen/bootinfo.h>
> +
> +#include <asm/setup.h>
> +
> +struct domain_builder {
> +    bool fdt_enabled;
> +#define BUILD_MAX_BOOT_DOMAINS 64
> +    uint16_t nr_doms;
> +    struct boot_domain domains[BUILD_MAX_BOOT_DOMAINS];
> +
> +    struct arch_domain_builder *arch;
> +};
> +
> +static inline bool builder_is_initdom(struct boot_domain *bd)

const wherever possible, please.

> +{
> +    return bd->functions & BUILD_FUNCTION_INITIAL_DOM;
> +}
> +
> +static inline bool builder_is_ctldom(struct boot_domain *bd)
> +{
> +    return (bd->functions & BUILD_FUNCTION_INITIAL_DOM ||
> +            bd->permissions & BUILD_PERMISSION_CONTROL );

Please parenthesize the operands of &, |, or ^ inside && or ||.

> +}
> +
> +static inline bool builder_is_hwdom(struct boot_domain *bd)
> +{
> +    return (bd->functions & BUILD_FUNCTION_INITIAL_DOM ||
> +            bd->permissions & BUILD_PERMISSION_HARDWARE );
> +}
> +
> +static inline struct domain *builder_get_hwdom(struct boot_info *info)
> +{
> +    int i;

unsigned int please when the value can't go negative.

> +    for ( i = 0; i < info->builder->nr_doms; i++ )
> +    {
> +        struct boot_domain *d = &info->builder->domains[i];
> +
> +        if ( builder_is_hwdom(d) )
> +            return d->domain;
> +    }
> +
> +    return NULL;
> +}
> +
> +void builder_init(struct boot_info *info);
> +uint32_t builder_create_domains(struct boot_info *info);

Both for these and for the inline functions - how is one to judge they
are (a) needed and (b) fit their purpose without seeing even a single
caller. And for the prototypes not even the implementation is there:
What's wrong with adding those at the time they're actually implemented
(and hopefully also used)?

Jan

