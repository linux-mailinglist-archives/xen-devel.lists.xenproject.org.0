Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F408735723
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 14:45:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551059.860362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBEFq-0001pi-1z; Mon, 19 Jun 2023 12:45:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551059.860362; Mon, 19 Jun 2023 12:45:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBEFp-0001mz-VE; Mon, 19 Jun 2023 12:45:09 +0000
Received: by outflank-mailman (input) for mailman id 551059;
 Mon, 19 Jun 2023 12:45:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jerb=CH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBEFn-0001m7-TK
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 12:45:07 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d5dc612-0e9f-11ee-8611-37d641c3527e;
 Mon, 19 Jun 2023 14:45:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GVXPR04MB10022.eurprd04.prod.outlook.com (2603:10a6:150:11a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Mon, 19 Jun
 2023 12:45:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.031; Mon, 19 Jun 2023
 12:45:02 +0000
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
X-Inumbo-ID: 1d5dc612-0e9f-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NViPQjfKItfodKlB1cSw31LXjMYwqYzY7NZNIHW/EaPelyJuNhn+nRwTZRHBEZ8tjTHkFD3JGeKLumLDQ7HIaWl6xoSg1PFwnYwpXOLZKXGsGQXeb2ssO0Hyq4JcIR1dyhDM3lmz+6AVfnZGM2jEUJbCfZMI8hquEcy0hw3i/DMlrKVZaZt9xrwKCMHRhfVmeXXv4q5Q10mxc6/atVMT1gJlo7H7HH7lVwvMmgg6MK3ASv700XZgwzdG6Y61PyR3kSnIlmvpL6D88pD6fCSiGt67VbMBKO3w8uNz9cSD+H2g6mcec/GbXHpnCrM01AcHfPDTzbbbdbHpP0DN/bSWEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/YBdnd0lsiqXYrrMs5g6OE/u4YNc6fy+QrzJl2Zmp34=;
 b=ko44cFBvd5EWgzAoujkxX71ZmV71LINSx/jCFL/sfC6NtmRj23OOS/CcxQ36P0ohF3g++BT0GC6f3DmgqvEHXYXv5Wf2cgj04wWfApoTS9jlS1XGk6kog6ggKFusOA4wGqcyYP79HCg2vLb99mGlW/CrfKquGySuW3XlLu6T3rgE2qRpcbMrb1uVOubiUDpvbw/TXhwH0m7rFxD4zC5aIulTGFpvpZxDP8IXb/Gfrq76culCkhWWpFh2qdKJ0MAFvpuefBUBbz+pFkByTBtaEha+Y8USpc11SoN3ZVaubRsz7XReKF5KDxERgaLhN0iRyDwZq4suBOmlrWcSQ7/HZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/YBdnd0lsiqXYrrMs5g6OE/u4YNc6fy+QrzJl2Zmp34=;
 b=WgAk2SB2yz0VF2ttGEDxp1blyBFqT1A8qu6m2HiHFAfaJhLEp1CKCl3o3mVYjCLUc69ZSyHO3qIk1KsyzMcBG8iER4JLpl9M5Dy7QrPf2UYZED7zi8f3JnEbJeIcMPqOiYUdBohL9FBC8+KNqX3fmPFtBifQxKWEcsJkAyW8sBveZd1vi+onOG+tG/SlybbaUHNOzkc1CoYPIahz3TYNMlg4K/wuYBc4wF4amDafYnpG9TDdtbCsDOxz1WY7lCsZ3HE41XjGJvXUXQ7fV0mkqp3VL+JUS5Ni3j2XXRzC3jr2wH9VJCW5xXVLveUcWuuUmDIGkSYJdrxtGzXF6DRniw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a7cdd28d-1ebe-39b5-d89a-60cbd3ab8b65@suse.com>
Date: Mon, 19 Jun 2023 14:45:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 0/3] hvm: add hvm_funcs hooks for msr intercept
 handling
Content-Language: en-US
To: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20230424082038.541122-1-xenia.ragiadakou@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230424082038.541122-1-xenia.ragiadakou@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GVXPR04MB10022:EE_
X-MS-Office365-Filtering-Correlation-Id: c6c79946-88db-4ec8-c41c-08db70c2ff4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kY8jGglS+yMRYT869pRdxwInuBTeOmAmAgQO0z0C7FT6ZW0I39PQPjikfg41nAYjHe9ihfRvqzS2KCgqEk4ro8/5xjm6ZvUrRXaLX4AyJa1dt7KkquUv3rFsMMKa9N/8GnE5rnKXS8IpL/Gs6DuwKNPcyMyqGOQH8l6zPWkFmrxHcJ7w3UZD1+dbm1rO+laa1E05hNFmBhh5bvy1MRLeK8+Va45rTDN51zUZkPgceiI31AQE8VHcsDv24LPH35khY/v3tLhEzKl9tMpFWtUCifXTAzzK4rDI0BnLAhwm0pnp7W7d7QXSCt0IKIQwOZ6NJMQkFzkpfvvCCXKzNN2kKNAQcLrNa3E9Y5lcZOfEysegdP+WNVa9hK+2XsMNKfsUduLjFa/1J3S84OFFcv8N8Q/KRahlAnVFZxb94lbr52+nSKQNw01KVeqTYoRuqkXXwaM6kZfF5VcgfSDfo3xhNJV/v5ySHojZU56aH9Wn6F4awM6bqp01zwnbp1LOQlRiU+yXNusiUyoiA7l7g37vs/QOKP3oq+7wQ2D03w4XvodmUT39vQPe2brQAgXgkFKLSy6IwQevNuyhC5KZQWLKYssZesbE/dbLuayUjoxvS80WV0r69s1Pljp3hkLJSYg7cwZ6GizGCYCFPt2GW/dHIA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(39860400002)(396003)(346002)(136003)(451199021)(4326008)(54906003)(478600001)(6506007)(53546011)(6512007)(26005)(6486002)(186003)(36756003)(2906002)(8676002)(41300700001)(8936002)(66946007)(6916009)(66556008)(66476007)(316002)(5660300002)(31696002)(83380400001)(38100700002)(86362001)(31686004)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TW9kZDNtVXFjbThIQXowUTJLZk1IdU1XSGROV1gyWU9BR2ovV2U2d2JNbStm?=
 =?utf-8?B?U1phcmZHS29QY0o2VlZibUt3RjNjcnZzSGdBTytIWVA0WnhMTkJzYXVTcWVt?=
 =?utf-8?B?NlFoWmtaUVVKUklxbUVlaHduT091Vlgzdk5nSVlkWlZpZUJFdmdkZnFxSmtI?=
 =?utf-8?B?ZlhFSitkZERjTC9sNmNxRFJSVm9Dak5MYVJVbWs3cmt2cHphajhrQjQ3ZU1Z?=
 =?utf-8?B?U0pweGZVTlAyUHkzU0RzRFpNTVhKSmV6aE1pVUdpbGlyOW11THJMWHFabjAv?=
 =?utf-8?B?M2UwQTBtK0EvZndUcTUrKzFyUU9WUVloVjdnNTZWR2s3Q1lpVWJHZ2o3VDdP?=
 =?utf-8?B?ZUhIVjR3REp0b0NwVC9JSUhhK045NGpwQjFVOGtjd3VIVVJzWEZSRG5abWZ2?=
 =?utf-8?B?S25JZEl4S0ZwOHVVY1lleDZMMXhZejdUc0ZKek44Y29MQWdNeHhhdVBsYXVl?=
 =?utf-8?B?MytsOUJGTHF4S2JUYjRveVNxZklnMnovK2xEcjMray9YVmE3WGNKQXErQU9n?=
 =?utf-8?B?cmFjOXkvalMwdGpCZGV0NzljV2NpVXUwcWFuQXVCNkZ3TVpqU2hXQjE2THAz?=
 =?utf-8?B?eUNFVG1ZTWY0L1FUOW5PaDduM25SSjdyTGZYTFB1SlhtMkRwb3VQSXdRZldk?=
 =?utf-8?B?cVpzUTFycnNKRTA3QnY3Vk9TSlFDY2c1VDlrTFcyZXlKNDU0Nm4vYkFrdnI4?=
 =?utf-8?B?WTNYcXF0QjA4QjJPS25MTi9xZVU1TllteUh5MlRaN0lqZVZZT3l0WmRTa1B0?=
 =?utf-8?B?ancwcnFWdGJ1L1hzckZFNUZReHdsSmM3QlNFRjhsMG1YbGFkQk9ERTFWRjgy?=
 =?utf-8?B?Vk1MSWxLZnJtNi9vNVdPMkY3RE9lQ0NKRSsvSEZwOU9KeVRmaVhsSHlWd3ZH?=
 =?utf-8?B?T1NqR2w5R2dJWDk5QndtelhoeUlSTVVGWlJHT1lVbENxN3FJVDNBQ005Ny84?=
 =?utf-8?B?U0ZKWkpBeWhuS3J2ZlliUzhSM2pjY0JuSFR2SXNnTVJTOGpsQnhnQThHNjBM?=
 =?utf-8?B?M0U5cmNLTlNBZTQ3bDluSE8rQ3phcHllbUZQc1UzUG5ySUZOZDR6KzBHeUdC?=
 =?utf-8?B?dVhUa1B1dTJMWXhOOTNPbVFmTSszNnZnK1FhcjRXWURmeVlTckRoSmRQeE84?=
 =?utf-8?B?MGNvYnU5aThLRkliOWdteXFDcW1WNUVFNyt2ZlllN2x2M0VUdDZNWk56d29u?=
 =?utf-8?B?WDNkUlE5cndoSTVnMUorWUVqWUUxeFBTVDRPbm9HZ09WRWpvOGhwdVhEcCtO?=
 =?utf-8?B?V0JpbUJQdGp4V1Y1Rjk2RTNOSWxTN296QUVnaUVRNGdab2JNZi80K3RjeWZx?=
 =?utf-8?B?TUowUE5Zd3Z5b2dLc291MFh6cytVTHR4SDZSQXYyUytjQ0FEVGFGQjlhd3JD?=
 =?utf-8?B?MUJXeE5MRlJIWXA5L1FuTVBqa21EOXhNWUwvQ2wxcytWUVBQOS9CODdjMngr?=
 =?utf-8?B?K2t6Yi9IVHRxYnBQMFMraUczTHUxTUFvMXNHN0xEM041ZmR4d0RGMnAxbWdq?=
 =?utf-8?B?dVdOY0xERzRRYWJUZ3c1Mk1BNUliVGRtZEpZRWJadEpCRjRMZUZiSFZSY1ZE?=
 =?utf-8?B?REFNZGkzVThkSUdIWlhlTGVFZzkvSWZmWUlJM3YzZW9CQzViYWt5ZXBYbzQw?=
 =?utf-8?B?K3dES25JUlY1SFREc2ZNcnp3ZGtiUkI2LzFzRTFHRFVFNy96U0kzVEZobzJa?=
 =?utf-8?B?OW5PVTdWV3FwaVE5d1hrYUFzaWpWZExQVDJRTWIwV2NYMHNrb1pEanhoZ1RV?=
 =?utf-8?B?M0pGdGdpRXdvVDR5dHRoRTY0eUxINlA1V0J6YmtQR0laaHJBQlNBY012N21p?=
 =?utf-8?B?Wk03L2ZuYjNvQXVXT21HanFTc0g0YTRvNjh3Zzd0QW1HWHFlOWRFOVVPdXR4?=
 =?utf-8?B?K2JxWHhyN2phbTBCenpRRlNqVHNEK1lKdWphd1MzczVNVTR5UU10UXV5MlJL?=
 =?utf-8?B?NWUySS9TSFR2TENrVERlY0tDdXJsTS9OV1dPQlYwQmRKZmk2c1ZRWWN5QWZT?=
 =?utf-8?B?WlFrcXIweW9veVRyb2U4SnF6Q24rNkptdnUwTTRBRDdLTmRaR1pqRytES1I2?=
 =?utf-8?B?UjNQRHp3SlUwekJaSW5SZ2ZZV1p0TlNJdi9pQ2Y1OGJPR3cwdzdJN1lpdmVy?=
 =?utf-8?Q?nVlAthKGN9d0B/jBrjdBHu7br?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c79946-88db-4ec8-c41c-08db70c2ff4a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 12:45:02.0954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 45XTdE01yUzT/ql9urid5Vb7PLe1ANV7JlQShYDlqgKrZpMMePnjkqGuWCPEIt4pz28rTlaW8MLkyBRGxzmuMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10022

On 24.04.2023 10:20, Xenia Ragiadakou wrote:
> This patch series aims to make the msr intercept handling, performed in
> vpmu code, virtualization technology agnostic.
> It creates a common interface for setting/clearing the msr intercepts and
> then add hooks to the corresponding hvm_funcs table to be able to call the
> svm/vmx specific handlers through a generic hvm wrapper function.
> 
> Version 2 addresses the comments made on version 1 to ease further review.
> 
> Still there is a pending question made by Jan, whether there could be other,
> than the vpmu one, use cases that would require msr intercept handling to be
> performed outside of virtualization techonology-specific code, and whether
> this abstraction is actually usefull to have.
> 
> Xenia Ragiadakou (3):
>   x86/svm: split svm_intercept_msr() into
>     svm_{set,clear}_msr_intercept()
>   x86/vmx: replace enum vmx_msr_intercept_type with the msr access flags
>   x86/hvm: create hvm_funcs for {svm,vmx}_{set,clear}_msr_intercept()

Coming back to this after discussing among the maintainers; I'm sorry that
it has taken a while. For what the 1st patch does we think we might be more
open to a conversion of VMX code in the direction of how SVM presently does
things. Andrew points out, however, that he's suspecting there may be a
wrinkle with introspection, which likely we'd need to work out collectively.

As far as the introduction of new hooks (or maybe then only one new hook)
goes, are you having further plans of using those hooks, beyond (iirc)
possibly using them in vPMU code (where I continue to think hooks aren't
really suitable, as per-vendor code is already separated)? According to
what you wrote above it doesn't sound like you do.

Jan

