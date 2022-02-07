Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C214AB8FA
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 11:47:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266704.460405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH1Xh-0000QA-Ek; Mon, 07 Feb 2022 10:46:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266704.460405; Mon, 07 Feb 2022 10:46:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH1Xh-0000OC-Ak; Mon, 07 Feb 2022 10:46:45 +0000
Received: by outflank-mailman (input) for mailman id 266704;
 Mon, 07 Feb 2022 10:46:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nH1Xf-0000O6-Ca
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 10:46:43 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c05cb7e-8803-11ec-8f75-fffcc8bd4f1a;
 Mon, 07 Feb 2022 11:46:41 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2053.outbound.protection.outlook.com [104.47.8.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-tFyAzUNQPNOKZNEvDkpQQA-1; Mon, 07 Feb 2022 11:46:40 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DU0PR04MB9444.eurprd04.prod.outlook.com (2603:10a6:10:35c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 10:46:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 10:46:39 +0000
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
X-Inumbo-ID: 3c05cb7e-8803-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644230801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cUjpp8UpJffA04V3EbdopeSNBUXOJLg4fXPA0jqT3xk=;
	b=lZGMRdr3Epp03aFk1MTSrsQVQnyxeAA6ewZYBvM+/eXJOqgjdiOEoVQOGonVMUw4PP+GkK
	fghZnO59fK1Nydvmwr/H5FXUOdyeka4h/D/JLwYBLOFYkm0oxPZLFfzJBoCzvrwnQzxV/f
	arhlar39YHBawfxMR1Y2vuCUYtEfHDc=
X-MC-Unique: tFyAzUNQPNOKZNEvDkpQQA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fR7y2og+GQNLkB6bF6Njb+baSoGekstzngIqby7smq5sgZWo7tpGx5Vfn0DyHAkk8zNGFEEV6hhsAgo0ZBkvYoJK1kXrZUi2ZmTSDd39XrWqWKXjSd78ngz/2UxqbQG/UzVrhljsHM97paaYwIGAY+cywonp6+0ciuqjYOtmdRKWgQ3BzGiPWEH+Xsr6YwpYtNVkq2cypepZ/gjMZOaDuOfHGTMOkdDjyQdhgZla64N3sWMjJIL98gLMg+FhaZtYRFl1kAvHVHnA77VXJ1Y4+rTX59YjdrURMcWIshRuMA/ZVsFvy8SRQ8mWE5w361wS+vLIP6yD9Dw9M40SZo/uMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cUjpp8UpJffA04V3EbdopeSNBUXOJLg4fXPA0jqT3xk=;
 b=Ze9NZYzWFvuBtWlyBYt4iPD+swc0x2XSAiXM04SK7yK5Fpq51nfnCdBwGB4DHz4KHFBLfsksi6s8DvwW3+iKHbHIJwd0RWIJqBN5cqx/Ng9Adohx/B1zX0NXWCHCyid//Lg6abN0USLwKh9WnQjw6I5S3vJ4ZWatO+rx0WmMGcI4o+JIrSP5U45Y3Q2GSixkinuFpd3AI3DkNWe4DQpiCQ4U1hf+rxaVA3jPjn/IYPc2kl8xCXmJQKjb33ULgPmDwy3IAbDqV9RPOV/exm3GyrMpx1MkR0Isn6pktxH/pvWWIoFLLWui91GNGMoJT6jtmUFm9SVxOP/EQtMwHIGXQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c2c185cb-2368-cd61-df72-7792b075746e@suse.com>
Date: Mon, 7 Feb 2022 11:46:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] xen/public: partially revert commit 7c7f7e8fba01
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220207103613.32260-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220207103613.32260-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0346.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3308b0f8-e465-4ccc-8a7c-08d9ea271eb4
X-MS-TrafficTypeDiagnostic: DU0PR04MB9444:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DU0PR04MB9444ABAB934ACCB90AF8A10EB32C9@DU0PR04MB9444.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FKBg1Y1MognvSzW0Q4rkJmhaWJxxwOUbYYMXzJeOrvCZzho7mQjV+VT+Yqjive50sPr7aqE6gz715M1iu97865sPsdOZTpEBMRamDLQEbPv94637yyCGLB07RK89FIvfSVXUgw7ifDpq6pnGZ8U8us8GsnrgKQq8x85x+CbCyOYhXQfo4WRs7pzRcmnQYzc68AlUILujNWCDfV7VXXX9TS0nJ05UFLsxRvwUpoxKtJFDFeCG9lFe80SVstDAs1MrIggysD2t22O47d301miEaUOdt67MSpSFR/eMLPFyg8w+E7fUKxLPELMiIGSrov8ExKiCd0he6pJk/OxOupBAxg1OdA3XsQtWI0d1AV4DKb1cfajprCksnPYDVFbvkXGhpxbs343oePlCJryhvTEQqVdOGippNagaZURC8mfPCq1LK96lZ53zWgwCujxOn+WhMW7G/yCh/LfUfOJLkazQI4nzHBkT6qwu3Qz8u5cCJLR7DIUoqNLKuhMaRxG7Vs6hSTrFg6OV9dNuTMsOQGoScecilIKmk/V8Tcfwb6eRMqtili+SqaBq6BRDrRwBt17MOiOjFNOhAit9Eef4UgvqgcXBQS2wpGWtg31uCG8PqyyTl1yE+1c4rQ3/XVgOy8MT1FWWJyX24OBoVGkgb8Nf5DWl22bjBUPCSsNb+oUcOvdiYO2fmeNH+Nvag9obtY5RV9fBy0JBenuRNWnStbz/SGZDqC/couIV8Ds3ZCIWCCbrTWrJWaAKSTwiAYY5cPjUhH7ntt+6L4e7p2FPQeOwjQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(86362001)(2616005)(26005)(6636002)(316002)(186003)(37006003)(54906003)(508600001)(38100700002)(6512007)(6862004)(4326008)(6506007)(8676002)(66556008)(6666004)(5660300002)(66476007)(31696002)(8936002)(66946007)(53546011)(31686004)(6486002)(36756003)(83380400001)(98903001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDJsS2NqRTgxd0gybWpXQWR5bXhtOUUxTDE4Uzl3QTlaME41YWQ1eEsrQzdy?=
 =?utf-8?B?ZkFlQUhKckFxL1RQRTl1RzhGRmpYU0lJdnVaVytob0lzR1hwUHpyTWd5Wnd1?=
 =?utf-8?B?dmlsVmkrVG81czhtaEVHdjErR0xvMmNHZFN3bUdlQ3lLQitERmJGTXlUZDVK?=
 =?utf-8?B?VXhsbmdydzB4SnJlRFpuVXBSc09QSFVpbU54RW9SNHdBQjhkQ0VwWDdOaHhv?=
 =?utf-8?B?N1ZWSzRHdVJ1dWZrTlhqeStwbVoxYWdFT1dnVnlVZEpyU2pQcUhXc0JWeXhF?=
 =?utf-8?B?ajNlTFltRnpzU0lGaXQrYkp0OXBQaHU2MTZZMkhxK1RrL3dSdVMwUnJzVUVK?=
 =?utf-8?B?cmxrVzk4aDg0RktUQ29ESUJFUVZ5WHk3YWRETUcxV0NIMXlEL1ZVQzVzMEE5?=
 =?utf-8?B?MVNJYjdQNkFjU2FZZU1LU0U4Z2hCYnRZRm5QOWp5Mm5QN0lPbVp3SEc0VUZC?=
 =?utf-8?B?c1dZQzlwbEFGOVFkaTJxRmdza09vV0FjK0ZYd0NVUUJpYUJiQzAxQm5LZ1Vz?=
 =?utf-8?B?cXhqSTZoRU1OTkpzMDRvVjBhNDJTd0NKQWhseHh5ZGoyb1plTVg2RVU4a0pp?=
 =?utf-8?B?Q2NYY3NvZzhseFBFZ1QzYStlTWVsb1lYSVhWenZwanE5YlpHOFRBL05LN0VS?=
 =?utf-8?B?L0NLcUxBMmVZVGlqbXJzZTArelowL2x4b05KcU9kMTZkL00wZEF4Rlh5Mlkv?=
 =?utf-8?B?cFk1V3V5SHNNRWlrYldnUFphUXlpdENrSlFYT2ZmeXpEcjM3RHBMYWVJTG5W?=
 =?utf-8?B?Q1N4eTdSK01GaTFNeW5uaWx3VTV1MHh2TzlzQ3VFVzlSMytZZ21mdTBBYms2?=
 =?utf-8?B?TkR0M3Ava3N3N1IxdTJuWUZ5SXk0bk1ueU1yRzVzMXl4ZVhpY1BCcnI3T2E3?=
 =?utf-8?B?Y25udzhVTGdHOUpWVlBHMFhVeHB5cGp4cEE5SzNVWGFrOWtxcDRxUnhHU2d6?=
 =?utf-8?B?MnphV2ZRWFg5RVcwU1VmRlhuRmZFcmg1OHFnSVdlSXZacStTa0V2UnJ1UjdT?=
 =?utf-8?B?L3JSSVoxOVdDak84OG1lalR5TkR2VGFWekR0eHdjeGhEMWZIUkZ4MkJxc1hK?=
 =?utf-8?B?bnZ0TGJUT1AwT25NeUU0SjNVY1BJdnMwbzBOemN6c1ZuSDJieGRBOEVtS0sr?=
 =?utf-8?B?OVVhajZPRkl6YW8rVHdDVnFBRUxhMHpMZjZkMjc2U25CY0FnYWhOSmJvUHc0?=
 =?utf-8?B?ZTdQWHFYY0NmTHZSZWY1dDZoclBzVVNHNEJRd2E1MEdBNW1VeEdBYU1md1F2?=
 =?utf-8?B?K25BS0dhSk14WVdFVFZVYURSbUIzeHBicVJacW5OekliVjdjN3Zqc3htUmFt?=
 =?utf-8?B?RlVqY0VNSm40Rmszc2pxeHhCaXZpTjdUM2RWR3A5cktIUU04cDRZOHorMkJ0?=
 =?utf-8?B?OEdNYitYQ0w3RjF4RUJRU1RBVExESXFDN1VRSldMSnVKd0ZoN3h4TUJKZXF2?=
 =?utf-8?B?WTVLL2VseWdtcWxVcStzbUFIWFY1SldZZjNJVk80VWZZb2Q2bWFhYVEwTFFk?=
 =?utf-8?B?QnAyM2FJYjdNMHphMUYvd0VrOU1IQVhMZGNUaVFFS20wN1NUck10TEFsUGJ2?=
 =?utf-8?B?UEVjaU5aWWMwWjhPaS9EUGpGaVA2TnI0YWZXZWxsQ0pIdEhHZFRCYk5mSjhE?=
 =?utf-8?B?QkNTNmxtWkhGN0ZUOXVPa0NVWVBZQ2lhbUt3Q3hYNjJ6eVRkT3RCQ3lTSStp?=
 =?utf-8?B?ekFjQVFvckJZUGs0REZ1bzl6STFONy9Ra2tDOTVqZDJRMlU5WGtQSEo1QXZa?=
 =?utf-8?B?ZXhQMkFDVGYyWk0vWW9tWDBCNzB6MFNoZHlUZEpJKy90a2syMm5jL04yRHlC?=
 =?utf-8?B?NTRVL0FBeEhaVVhJTENMdUNvNzQ2aGlVRW9Sbmw5clRnTXI5OS9FMW1FSFNW?=
 =?utf-8?B?NmUyVytNUHpFUzdaODBwTEh1L0tCWmZSTHhNLzEyaEtxWnhjVGs3RUphU3ha?=
 =?utf-8?B?RTJMSnVkdmFmSW8xNkgwRm9FaHF6amwvaHZwbDZQMUpxcFpkd0NXS09YSjdB?=
 =?utf-8?B?YUQwQ1hCMUtFdnJwVzZwOHVhb3JsTjUwV2tFTld0akdLYW16cGEwdDBvMVhU?=
 =?utf-8?B?ZzBOQUtyS3U3UHBRQnJpbjdGbVE2MDVDMGtOcUFjQTZES1FyRTN2UHpQeU1r?=
 =?utf-8?B?akp6YlhHY1NmMDBQcS93b2kzTjEwMGtQdGJDOUJycFg2SXl1RTlENGJxRUZF?=
 =?utf-8?Q?s5lIzOtZ7NKtVBbcm1QGHhQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3308b0f8-e465-4ccc-8a7c-08d9ea271eb4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 10:46:39.1751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z07LEEl9N9vR+VwZ6gKU5Gy7fdWI2hlFrlHyaYymYQFAkSWzjuJKKDp1CpeVhKMkLJOv7yAPJTWPQ3eAUdJ+MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9444

On 07.02.2022 11:36, Juergen Gross wrote:
> Commit 7c7f7e8fba01 changed xen/include/public/memory.h in an incompatible
> way. Unfortunately the changed parts were already in use in the Linux
> kernel, so an update of the header in the kernel would result in a build
> breakage.
> 
> Even when removing its usage from the kernel the used flag bit should be
> marked as reserved in order to avoid to give it a different semantic in
> the future.
> 
> Do a partial revert of said commit in order to enable the kernel to take
> an updated version of memory.h.

I don't think it should be a partial revert, and as said on irc I'm of
the opinion that ...

> Fixes: 7c7f7e8fba01 ("include/public/memory.h: remove the XENMEM_rsrc_acq_caller_owned flag")

... it's 0e2e54966af5 which should have taken measures to protect
against re-use of the flag as an output.

> --- a/xen/include/public/memory.h
> +++ b/xen/include/public/memory.h
> @@ -662,7 +662,17 @@ struct xen_mem_acquire_resource {
>       * two calls.
>       */
>      uint32_t nr_frames;
> -    uint32_t pad;
> +
> +    /*
> +     * OUT - Must be zero on entry. On return this may contain a bitwise
> +     *       OR of the following values.
> +     */
> +    uint32_t flags;
> +
> +    /* No longer supported - will be never set */
> +#define _XENMEM_rsrc_acq_caller_owned 0
> +#define XENMEM_rsrc_acq_caller_owned (1u << _XENMEM_rsrc_acq_caller_owned)

I think this goes too far: Neither do we want to re-introduce the
#define-s, nor should we re-fix the purpose of the padding field
to be OUT (only). All we need to make sure is that the field
coming in as zero won't get responded to by setting bit 0 of it.
Imo this can only reasonably be done by way of adding a comment.
This comment may, in turn, mention XENMEM_rsrc_acq_caller_owned
of course.

Btw., if the field was to become OUT-only again, I think you'd
also need to revert the change to xen/common/compat/memory.c. At
least to not leave a trap for someone to later fall into.

Jan


