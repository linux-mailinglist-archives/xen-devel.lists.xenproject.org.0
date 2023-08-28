Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD7978A6F5
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 10:00:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591401.923795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaXAD-0003Jd-CH; Mon, 28 Aug 2023 07:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591401.923795; Mon, 28 Aug 2023 07:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaXAD-0003Gw-94; Mon, 28 Aug 2023 07:59:57 +0000
Received: by outflank-mailman (input) for mailman id 591401;
 Mon, 28 Aug 2023 07:59:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UdW+=EN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qaXAB-0003Gq-Ao
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 07:59:55 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2040.outbound.protection.outlook.com [40.107.7.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de8f78ad-4578-11ee-9b0c-b553b5be7939;
 Mon, 28 Aug 2023 09:59:53 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9579.eurprd04.prod.outlook.com (2603:10a6:10:306::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 07:59:23 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 07:59:23 +0000
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
X-Inumbo-ID: de8f78ad-4578-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gO3YWZb+X6N1DvFygljEcaVFZJ1mT/ksAew6VnTnf+BhQiPjobDEgpzlNyWdEMmrDbBsp3y60zr79CIfSNOtzhxrSyKVXsdJ17Fd5Qrnyt01QgWhFRK6RKwwms1hZ+21uMNmNDejFGMg66+/+gBILUq4jeOa5NztJGlo4Pip33FZjLoyoJDBKv3FyUAv5VRKmhNmRdvDvYnWcz6l9nUXSHwg4mZcyN0HJrZmMf46LRO4FQXhbA0P3LTG6V7mGM0xL3Tjbo7WVqJujx82fDVgTOF72S7mHGfaOMwv6P8i9WjzlTpb15Y5JW1vpzAhq+EEbaMQMsSmYowSQKKdnT33+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E3B3TcCNXq6pGw9ceHzzqKqwai7vuBf4WPWv6cGiZWQ=;
 b=DEAaPueG/7LJLEDhyfya5kwajVWnoP2C50k+0zVqzML+h7pr2MO58L0w2PlhWinla5BG3aBxkClLf2tArODkF3J/giOlOTThhTT7XMSi4NWtlTl6JLJ2Xk0LLnCe3R0UKTN4rH3H+ZD3mReZfSo8oNkjm01r3oqLg7yW1smn1hpRopNztRCRc/E63Ttbu4WMmwwEG1y9QUdHUoue+Gobf+mQWlwdrAgZkN22ti8UskO9dApItCzLXW8v2lezAxg2f18rzwS6WWUGixvJBd+utFkO9XcZ/P1GYh73YY/xE78pdYwikstF4oH2iGw27gjmJj51HC+wCPkgVvQTN0tOCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3B3TcCNXq6pGw9ceHzzqKqwai7vuBf4WPWv6cGiZWQ=;
 b=UwrMZcZ+0412Dk4K41wtUsTSFFkY03XOvfQaUN3nMw7d7Hh6yu04TffDZ+VTNOMbz/cxCbJS2RXuJvsC3ufT9vB+jsVrtJg84mpXH1kU/jSEPbDVYDS5YTU+7GSEhULSW0WdT/mVnM1mwamiXnbMrt3E3j602aNwulwrG78TvptGdb6gW8JQpaGzLcPvaWzbV69HkhaWWGu/FIL00/WG6u0sx0v8HZH04JWuWtpkcMP2rvyGVCnHutj3EuCqeIViYhNbFihdEfpGlmRpXjUsST6J6SSpMho/H3ZFFcYknhwc5LNr3VRhyCP9KH9gBqCGk0nsVuZFjrolVgjvPuRt+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <73a78132-a086-5ae1-2617-fb38c51e64e5@suse.com>
Date: Mon, 28 Aug 2023 09:59:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH] ioreq: include arch-specific ioreq header in
 <xen/ioreq.h>
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <e5f13920dfcb9f828abb4a36dd410d342f4c0939.1692974235.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e5f13920dfcb9f828abb4a36dd410d342f4c0939.1692974235.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9579:EE_
X-MS-Office365-Filtering-Correlation-Id: 0662389a-40ad-4700-e50f-08dba79cb16f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0OtaGa/jnfJEelADcPD+J0MdJCeI0jyihkQ6bRcZDL0dkXRj1a/dYLFaf1LuEJtTol6JG2buZq8BB4qih3uoM3IzgqEk9qZcwNslZzw36chUDk2jtPijqiFdDES6V6VQpErjkG56sJe+moFqNqsbT8K6cIaJwXUvHK9VWIFiuo0Dz+If9QcqqPH/abFs/ZTKl2TVLm15a/2NyC/2eiR1H3naOv8wDPRcGu3yliQWaZCFtD6xEgqt6IWWsajkmS3hRQmFRB6nnif5f/iUsxVDYrO/xO89NYHM2WpVvMgnldMW/TEhz6/Qp9zcrbwtEDsggj9sTeLHE+btKKm0hxEnDX2mlntTQQrt0zbrO4Jegy9dwJzOd9YVLlxa8DgAoy22fCJNCPbUlrGkvHlNeEdm/flJksVatoNjBaQy5Mkv+JXCWdrajB4ZClWlkbiS3DlnPfenMYkSH8wMrUVtpwYlJnpNVhVE+hi0m0eacuQheSxGbDnnbNbcc63CaWKqz1vOTj31uKaDTzJHfQW0VSqnv02CcNGq0X/pBA3SUwTYOCQVX27DL4z2ngZ9XY/qN5s2r5KVaDhykDZP/hVbZ3Kmw53c/36S1UQpbFrNNpXvPjZRc/szTDj+hPBsjZjbM79fmMCLGhLaMfmiiTwjFwllxg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(376002)(39860400002)(346002)(186009)(1800799009)(451199024)(41300700001)(7416002)(38100700002)(31696002)(86362001)(478600001)(26005)(2616005)(6512007)(53546011)(6486002)(6506007)(4744005)(5660300002)(66946007)(66476007)(6916009)(36756003)(54906003)(316002)(2906002)(66556008)(8676002)(4326008)(8936002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkJYbUlTdmlDNVhIcXdSRnM4azZmelFTM2QrSUs1c2FKUkFscVE3TGM0b08z?=
 =?utf-8?B?aE9VOU5DSUhWUGdXUnN3dmNKWi80dDhwOGF4aVNwbUdFaUdmNFFmZHlQMEVi?=
 =?utf-8?B?NmxmdWUzUUxmWTBia2ZHQjNXTWg4TTczRVRqZjdxZDd5SG1ubmV6dy8rOUt6?=
 =?utf-8?B?U2Vlb29wZWMwU1ROeThHdDExUllhUFFmSVVNU1JqZzhWUzI5bjBYZWZNQTdC?=
 =?utf-8?B?UENYTm13MWg1SWFEM2g3OUZybXhGR3IxMDRGaTdndTBQaFJTNUlES29ZRGNa?=
 =?utf-8?B?UU5zb0dXUXlpM2tPZzYwQUZuQVJwSFN3QkI0NzhPcVVpcW8zaWc4Y3BYYTcz?=
 =?utf-8?B?dlZpcEk0M2dLVkUrU3EwVVZWR1hEdDJDTHNoQ21jblpVMlAyN0VOK2MyUjhn?=
 =?utf-8?B?RU9uVGRUNndoQkpKdVJiY1VZWmlqWnpSN1I2YXRaYWI5OWNrZnQ3aUlHcXBp?=
 =?utf-8?B?QUNrc0dMNnRGajJYWVROU3ZJVTBvRkFGdkRBWGwzTXFJa2hxRGU4SnJrR000?=
 =?utf-8?B?MTRpWU1UMFNLbDQ5TGhnZWhnKy9qU1JDcHBZbXd5VjlyTmxPZ2F4eU4rdTVq?=
 =?utf-8?B?Qzd5UnkvQ2RSZVpxcDAwRGYxQlhtakJodTJadDhvNFAzR3I0d3dBSndsQ1Vh?=
 =?utf-8?B?UnlHNW5uSUpuZmlHeHBmeXFHSUJRb2ROcUVxUVMvQzRwL3E3NHpZK2VITkl4?=
 =?utf-8?B?UllPRXR5aUhmMXo2VzQ0SFhmcWsvMnVMTDZ1NXJCM3hVcnJobDVwYjR6RG1u?=
 =?utf-8?B?cWxFOVBoOThqU3g1dFJiUkZmeWdxV0JWNHRsVkxiUkVtS1pyOS9IY0ZpMDUz?=
 =?utf-8?B?YXIyRy9ieW5zZXh4NnR1bmdQQVp0eXBzZTJmOU0rbWdqM0c3ai9BcXp4Sk1r?=
 =?utf-8?B?NW5wUzJ0MFArVkN1V1M3cUFKenRFNlIwYlExbFVpUGRTaVhPajZQODBCZTRI?=
 =?utf-8?B?cTUrSGk4aWNzdHN2TEViL0dvc3NkVDc4Rno0K3VMNzAzVGV1b3hFUHZsVDla?=
 =?utf-8?B?R3V5NWN4ZURwRUhDTGdoVlUrdmk5SDZYTWxkOElybGh6STJDRmU2M3FQN0Nq?=
 =?utf-8?B?Ukh0cmtWeS9PbXd0a2o3Mk1ZZ0VRMnUvUW5rTXpEbSswZjI5N0F3VDBNdjFs?=
 =?utf-8?B?ZDJ0eUdiWFJGNjBnL0dzQ0tldGt1VWRHdlY4YnVmWW15NVNndmpEYnJNYUNZ?=
 =?utf-8?B?Smd1eklrL2M2dmFBRGF6c0RldW9rckp5OEVnNGVFaUVVNDlrd0svalYwMXlB?=
 =?utf-8?B?VUNJN3o3Ri9KaTJmWjhXR0VrRldMY2NPbG44ZW9lbjNTd3BOWUYvNXREcXY3?=
 =?utf-8?B?K0V2VUVycGtKMVhkbzFGVHNuMjR6UUl1NjZhazFnK3FzMi96L2E1MmZDTU5Y?=
 =?utf-8?B?TFRTY29DckFrNEVtaVRZNC82Tm9uWE5tTGsxdldPN1NMVHo5ZTkwNko0bFhh?=
 =?utf-8?B?ZzB2b3ViUWErRW1vdUlXVmZocEJod09iUHc5RWlieVFYOU5ZTHZEUldpd21w?=
 =?utf-8?B?eHZVNVVTQ3ZPUFhYTTAvRURwSjBRd3RYSGV4OUdST0RQcjY1N3lIb0lhVlpF?=
 =?utf-8?B?RHhxWHNQTmYzZjRTdWo0TTR1Ky9XdytaeGphMGxOS0lQMTBaM0JmOEIwVmw1?=
 =?utf-8?B?NktoMWlNN0ZEYk83Y2hLSE9zSzVMUXRIR3hHcXl2cjZWVjhsMnVuTS93UU0w?=
 =?utf-8?B?YVJ3L09nQU9Zdm5oU3g4dVFiV0lpaHdwazZTVndyakZOVU45WEZpdDJ1UDgr?=
 =?utf-8?B?RnhndThiUmFlWDc5eERacG01anA4TVJ1U1RYVmtJVldLRmg2VUtxUjQzR1Zj?=
 =?utf-8?B?M04yRkpLUUJYS3NLRVFXVTdTZzNmZDczcERCaWtIdWVzUW8yU2ZQYlFIM3ZQ?=
 =?utf-8?B?VDFJOXVLTldRZDU0RjlWaTRRTEM2dUZKaDRIY2dHc1VXNzV3eGU0L1Y3WmJV?=
 =?utf-8?B?Ulk1Tmgrdjl3bXFHK1U5RlJJS0VaL3NTZ1Y2MEMvZ0U5bkhBTnpxcHBoZHJr?=
 =?utf-8?B?QXpBU3BWWEx6T1lSMllYVzdPb3drdnQxaG9ONlZvT2xXZGpINE96RjljbzRj?=
 =?utf-8?B?cUN0RXVTanJ4UlRjdEgrM2k1aVJDYUJrT3RZYmdVUWJCTHZUa2s3U2V2dWtF?=
 =?utf-8?Q?vNYYCpwUtTqEEV9N1CGTidrLb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0662389a-40ad-4700-e50f-08dba79cb16f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 07:59:23.8103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /S0dWe0rQPfApFsldb38jmbYYiSQKOVaqKSipwpGgqytGiYB6VZTMSXIUHqz92eIfIS9s29g6PSvlgipMJOQug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9579

On 25.08.2023 17:02, Nicola Vetrini wrote:
> The common header file for ioreq should include the arch-specific one.

To be honest I'm not convinced of "should" here. There are two aspects
to consider: On one hand it is good practice to do what you say. Otoh it
introduces a needless dependency, and it'll require new arch-es (RISC-V,
PPC at present) to introduce another dummy header just to satisfy the
xen/ioreq.h use in common/memory.c. Therefore, _if_ we want to go this
route, besides a wording change here I think ...

> --- a/xen/include/xen/ioreq.h
> +++ b/xen/include/xen/ioreq.h
> @@ -20,6 +20,7 @@
>  #define __XEN_IOREQ_H__
> 
>  #include <xen/sched.h>
> +#include <asm/ioreq.h>

... this #include wants to be conditional upon CONFIG_IOREQ_SERVER being
defined. (I'm actually surprised that there's no respective #ifdef in
that header, meaning types defined there are available even when the
functionality was turned off.)

Jan

