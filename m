Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCCE4D7B84
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 08:27:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289931.491647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTf6Z-0003kQ-DP; Mon, 14 Mar 2022 07:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289931.491647; Mon, 14 Mar 2022 07:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTf6Z-0003hX-AM; Mon, 14 Mar 2022 07:26:59 +0000
Received: by outflank-mailman (input) for mailman id 289931;
 Mon, 14 Mar 2022 07:26:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=29fN=TZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nTf6X-0003hP-3A
 for xen-devel@lists.xen.org; Mon, 14 Mar 2022 07:26:57 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2021cc6f-a368-11ec-8eba-a37418f5ba1a;
 Mon, 14 Mar 2022 08:26:55 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2057.outbound.protection.outlook.com [104.47.1.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-O68Q47QFMKOV75QchKGNFQ-1; Mon, 14 Mar 2022 08:26:53 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR0402MB3627.eurprd04.prod.outlook.com (2603:10a6:7:84::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Mon, 14 Mar
 2022 07:26:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 07:26:50 +0000
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
X-Inumbo-ID: 2021cc6f-a368-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647242815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0n9mSjleTTMOFrCey1eo0rX4dS8KiDyB9jcU/KFeHLg=;
	b=jld6A+jk3US38LQ9Ah79jCjIpDNqGfRhFMQ/tfHfI39A/TYJDEC56RgRHmo/g0O3th29AF
	NoZdsrfCoexE5iG3lw+ufHLWEQ+wjzli64hhsdV5jp9G47rVEM+tCzgfs/eVlnRm6/Iw8l
	gEWdc/y9J5uAGQP6+M6gTmGKQh7JoQ8=
X-MC-Unique: O68Q47QFMKOV75QchKGNFQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMi+vZmKesBHNp+2WM4qdJVBh4gp6yovoz5uDZHi2ZN7KYWwQrRfSBkdQeX2PwZ6fdKUfoNlTn+jTsxdvCCCT0S510b8bsa7IP+tQJA4/DuBjBWd1XnTSBYW1j5++YTNjfQXxMX2+8jyc8Vgl26RiO7rEi+ht/TQLJuEp8lAko/6nb7vHHY2j9oHs4F/KhVQBMAabGwDMuYLF8fiYs/ROJXP+svt+HfStcuVjyOhKEumXaTNItoO8ODGSe3CbqNLOoIDU4lp/1kalJPOfbhDtXPc5jlEuWg2wWZjWIOF5W99aCJWm7qA055KNRk1KBzNHSMFkbyYOkpM+dNKMmUh9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0n9mSjleTTMOFrCey1eo0rX4dS8KiDyB9jcU/KFeHLg=;
 b=QP0GEDjWyzEW0klFj4iLKoN8ra2CIdpMEzECES0U9/1lmvDIf1WqaLTHbOfFRL/nyx68wiZww5cp4TALVeeBc4lacJG2FGIs7CSaV2GC27b6uOFv3T5RWeI4m8xgKo+tj0f03IGxDrzOIMyw5FkrC5crBcgy8aMf3+PqX4aQmREezG3fdiIzHwAGI0G4OL4haEGlPHSniZBVSpgUCrEI36s9jm4mK+vTCTjI8csy2EeM0PYFi8SzVHGUmHIIIVj/CiGp+lZJ8CEFUSeDYM6g2cLdu+emtCaoUdu8r1XR6I+5pbOhVFTDlsCDlqfAWgqeyljv+pSTLqCQrHJdKHToJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d3f31e6a-706e-cc24-1d9d-d78ace0cc705@suse.com>
Date: Mon, 14 Mar 2022 08:26:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: BUG: libxenlight fails to grant permission to access Intel IGD
 Opregion
Content-Language: en-US
To: Chuck Zmudzinski <brchuckz@netscape.net>
Cc: xen-devel@lists.xen.org
References: <4703b7f1-8d3c-5128-213c-e39f487e4cde.ref@netscape.net>
 <4703b7f1-8d3c-5128-213c-e39f487e4cde@netscape.net>
 <2e74415a-d0d4-321b-be2e-a14db297c51a@suse.com>
 <ed955608-9c62-3dc8-fbcc-df5b4d3c5e46@netscape.net>
 <e0a49022-097b-b9ae-eff9-eb2111e7acb9@netscape.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e0a49022-097b-b9ae-eff9-eb2111e7acb9@netscape.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0270.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 203ab75f-d526-44f5-70f3-08da058c015b
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3627:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB36277572F842226A60F4476EB30F9@HE1PR0402MB3627.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z2oFWGlBWsUL4p6OPGuuC/1I8IjKbOAEWO7yAr8tJGiom8wxQKO8nPyXkPC7jp36OJMg2Uq9VzKsymNV+Lq71Lhlli5pDXUrLQ4gtXWMJgRMelrNmoi1UId15Gr9WIPpPsc+NIJ8Guefu0T0DzKe1lOZ1o5b8jiK4A/GlhHdat3AGrw//DbIFHDd+HLS58MsW6r0Hutyd9sgoYbn9IumDzgyG9DwNxdlzTUeD9OimBDmR9QVkcwfgHBEkfl9xKNm9RhNdptAJoW1cBNeyJItVMcEWq50ygVQ8FItKeT1tlzmKSe0velQY7L5QIUh/jSZ4o9Ytg9FZVufDqnTZ00mMmgq7NxcgQhG1MvT4F/pY4vk3gnKJt7lDDNGVGd/v+D7ChJbG6CG9XOM3wxdl435g+A2IN24cSCXaj0PXAJYM+2kJO3fdrR65DIMfsk5tSFVkkoH8m8UWrZtNnwyp82XoJWiDCd17xTkrCO6qFwV+0PoCHzh/lm14tr/S+ASneKj3h5uPVDrG5eTpC0yTnoEWkv9rx9yPktRICwFk15v5yTW1pH5kOzf8cT5eDGHR5p03R6GB0e3nZ2rQD1sSN085Tr3+FZPXAwSpFER7ob/6dT0SKFzYyAtQh2iDCFsuy4ZRPx8NwCdynHn3eb6vAbwQlvLyuT4P2XtV4rTOp4OlcpJPHi4brLGuKaHrtr8+M+jhhTtlRp8wyRSsbhzZEW8gTs1wX9g06Uw3N7H1oDwBDs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(36756003)(5660300002)(6506007)(53546011)(2906002)(6486002)(86362001)(8936002)(186003)(31686004)(26005)(31696002)(6512007)(66946007)(66556008)(66476007)(8676002)(4326008)(558084003)(38100700002)(316002)(508600001)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUJ1TmZmVjhJM2RVUjQ5NUZCUHpyQ0tQRUlSdEpOKzVmUFFvWlBNYk5KSEVm?=
 =?utf-8?B?VUo1bW41OTJjam1Na3RVMS9yWGZSa21QOUd3RXRvbEZFaEtQNzhENTdqaUgv?=
 =?utf-8?B?RGpNTXQ0VjU1bWJUUnFuVFhsZGZVTE83RmNxWEVUWXN0U011aG45SEtiNWxM?=
 =?utf-8?B?bk40VUk3akhjdmRUZUJicFR2VTE1emFuVjllRS9EbmJ1WlNvNHBlU2J0R2dC?=
 =?utf-8?B?dktkNllzL3Z1NmF0NmJvM2ZqNUZSVHlpWDk2L0pFSWt2aENZSVZUZkFWR0xE?=
 =?utf-8?B?MjJZdXpna3BHTTVSN2Q3YTNLSUI0VTlNRjBOMS94VGhZU1FJY1RwWlIyUlEw?=
 =?utf-8?B?SS9kaG43eHNTNWNld3BjTkNxYmR5U2ZpN1YvSmZwNTR3R1JHUkFsWk9kSXlY?=
 =?utf-8?B?WnhobUlnd2JzSTdaT0FDUnI3eXVTdXNZNHJDMVdwbzR1a2F2UktrOVpXYXRy?=
 =?utf-8?B?T25idjN6ZVgvY1dEQnZqTWRjVUtPaEZLNnBZOWRyYlhYSC93TmlnVm1ZMThx?=
 =?utf-8?B?Z2I2bFJheW40VXJnWVFUOS95RXVPUGxYNGcrQjBhWUJUbkFoQUpLTkRteVN4?=
 =?utf-8?B?TVdNR2xia3JkSEJRWlhmQyt4YmxEbGhUVzZWd0VQTkc1OHg4aWZlWnYxVHk3?=
 =?utf-8?B?RkZmOE1sU0ZlRjdXeW5qaE9qYmtwdHM3VEtBV3NBeFZLNXR1OEFhRjZpZmVD?=
 =?utf-8?B?MGF6dTlhc1UwSXFSVU1Wd2dWUDdmbjJCWXZIbHRZU3lFbVM2dWxSdXJBZ2xp?=
 =?utf-8?B?RU51RGlKU0s1QnNHMmlXTW1ycnBKNzN4Q3BoaUkwV1BSMFd6Q0ZVbkI1VWM5?=
 =?utf-8?B?Q0UzQUUxOXlIeG96TEo1ZjM3UU5ZeWNnMDA3enBiV2YxTHlqNWZSRWdlQ0R3?=
 =?utf-8?B?T09SVndJQXEyR2xGdEtoYzh5Q01GNGNBMjlrOG9PZnVIdUxnQVNZM1ArY2NO?=
 =?utf-8?B?TkhuNVUxMzRkMFhTdE1uRmc1UVFCcjVSNnpiM0Y5MlpkNkpMUG5UUzlDZzdE?=
 =?utf-8?B?R0t3czNLY2Zmd1crNitqSm5aOEhnWXZhd2NIaSs4QVZvUkVFeFZxNTVVODVP?=
 =?utf-8?B?RjkydzJPQ3RDNlFTV0ZZWGJBT0g2czVJTEEyb3hucElET0lNZ1RNbGpwMUNS?=
 =?utf-8?B?ajBkNUczYUFGQ2lWRWh0c1g3OWM0VUxGdVZocUdGMWlrelFyN25Pd3p6ajdE?=
 =?utf-8?B?NVFWU1BxWDlFM1pWQWpmMXJ4emN4RXpDNlRkRGd2MitPUTRLR0hrVXBtSHNj?=
 =?utf-8?B?RTdteGRTYlFIQ0NSMjlPR2diV0JHa1haNFg4S0NGd0N1VW1OV2xOcHFEMk5X?=
 =?utf-8?B?K2wwNnB0QUluZEZvR3JKRUVWWG5wYVIwWGtFakZydlJMK3lMVnRiQVR2TUIv?=
 =?utf-8?B?RkFhNjMvMFVsdGZhdkhOOGtCRG9rSHVsQkFGNXVSVVh0dmlBeVRqSjZxVnNO?=
 =?utf-8?B?M2VZY3hEZU1yS25GRVFxbXNXdFZaaXI4d0NQcUhzNEU4WnhLT2gyWUh4NkI4?=
 =?utf-8?B?QUR4NTM5bzZiMnIyTVZsM0xlK3l2eGRaR0Rrbm1FNjEweHB0V0J3cmJpVkt2?=
 =?utf-8?B?dFNoY045bzVXRW9KVE5TenNqOThjck02MmFtaDdmMWRvaTE2NmdmaVJjWUds?=
 =?utf-8?B?bDVRQlJzY0dtQS9MMHZBRVBtTTNsRE52RHMxVVM3Q2V5QzNHdVY0M25tSWht?=
 =?utf-8?B?ZGlRZjBPSSt6TEVQTXlGMXIxRC9oWkFuVUdhdnZucG5MNFBhOE8zQk00bTlJ?=
 =?utf-8?B?Rm00NVZCQjBKcjVFUm1iSDlLYTh2Mm5lcjdPNGFQTHRsdnB3QTF4N2laRUgv?=
 =?utf-8?B?bk1kamRNYlpsM3BwVDRZNmxCSmlXTE5JYWhIZnFlRzR0UHVrTzZlVDFaNHla?=
 =?utf-8?B?bldManRsZ1VHcGdsN01MRm1IcCt4TEJzTXp4TFd2NmFZdVZ2Z2FzUjVKU1pG?=
 =?utf-8?Q?LKe0CRk3ea6psD4vSebtRssl4sBL5HQV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 203ab75f-d526-44f5-70f3-08da058c015b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 07:26:50.5020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yn0tRveS2YL2nJavyRu0ApZiO9wEnBYksMXcGhLTZ8LCEi7SzVUuluu/D5qGskQ1vej4nNwYrZfKZiIxd8DEpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3627

On 11.03.2022 21:35, Chuck Zmudzinski wrote:
> So my only question is:
> 
> Is it proper to include header files from tools/firmware/hvmloader in
> tools/libs/light/libxl_pci.c ?

No, it certainly is not.

Jan


