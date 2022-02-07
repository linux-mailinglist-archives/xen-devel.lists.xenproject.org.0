Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A74E54AB623
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 09:11:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266516.460196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGz7N-0000nc-SN; Mon, 07 Feb 2022 08:11:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266516.460196; Mon, 07 Feb 2022 08:11:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGz7N-0000lo-OP; Mon, 07 Feb 2022 08:11:25 +0000
Received: by outflank-mailman (input) for mailman id 266516;
 Mon, 07 Feb 2022 08:11:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nGz7L-0000li-UG
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 08:11:23 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89499e78-87ed-11ec-8f75-fffcc8bd4f1a;
 Mon, 07 Feb 2022 09:11:22 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-578sGXC5OdyC4YIgvIE-jw-2; Mon, 07 Feb 2022 09:11:21 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB6324.eurprd04.prod.outlook.com (2603:10a6:208:13f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 08:11:19 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 08:11:19 +0000
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
X-Inumbo-ID: 89499e78-87ed-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644221482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XywlAjTsXDZgrpXx3Ss1iRAl8VekY6dFKCueH/IrcNY=;
	b=WhDXsuVDSjwLF5E55Kxfvnn9g7BxAEKNylzoHnoiebeUpsaL/p9fP9oY6D1RgW9eyb2fgb
	x0q7+avwVxqJGGdsGEf9CdmVoEaQTvDsH73/qyEO2r59/VnHnnISjW9oRdgfw9+v2ssyFU
	i1Sa4w+Dpf8lAYnZWtJsMA4/VWZraeY=
X-MC-Unique: 578sGXC5OdyC4YIgvIE-jw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MuYdGtPVsURcoc2G9nd9C5X77zGcucfS7M+vFoz/cuxzVzKthkCwfSVURC5xqvm8wa+M4mSyfhSOuLIvxEg7I1uoLgIlfk8emvFMcZDlVXeqpjb07vcoy8lfMwfJOvepYk+Q6NoDcmIGGuFYYroZJGS1Gt1uDJVWuvWjFRIF+P5FK095UHjO3Vm0xIuvDJgpCpdT0S3yq5LUIywxbjpULOqNZGNiKxfL50yGeiUFvh4wVPXBtGA2SslUQQC5pHXZZ9IgvliYUrV4ox0Hr10AECtURIVdvXFxExzldezCxo3pDj6iyekSoN0irA60H3uiojUzV6NlUogyXzHN0hdHRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XywlAjTsXDZgrpXx3Ss1iRAl8VekY6dFKCueH/IrcNY=;
 b=cZy02JQqoTGxkCGEphKC2x/rU71Sl+kRCfkFgBKUGOaUdLWA6Aa+bf3HuNWby86gBCSLW7LWO7FXV7zyeBkOngtYi2MHm+i5pzt0Y0ZLgaNI4CZToEkEm61eKNvBsTB8rF6Q5eJbSUCBbIHvZcKXpLSBy6t5MVpaOR5NczI3HMYU5VDMHQ/AAB+lTp3YQAleohpGZYKwWawaPyqO1qeK8oPcgyfnCdIxZ8rnJVSE3FWjgKH1PJqp2tRW+ypFiKDFPlS4HfFjHFsWDwtCRk5lSFqXbjcRTtda1/iQeRYvr3fh6QIgxT8uz2JwAtati0Se3Nb3JGBzip0r1XlcPXRnPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <613d2033-47ba-1f67-9d90-322caeaef5dc@suse.com>
Date: Mon, 7 Feb 2022 09:11:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] xen/smp: Speed up on_selected_cpus()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220204203115.13290-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220204203115.13290-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0085.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ac65ce2-5ced-4aea-8c2c-08d9ea116b81
X-MS-TrafficTypeDiagnostic: AM0PR04MB6324:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6324C648EF0355EEF8654BB1B32C9@AM0PR04MB6324.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6wmu00PMN6BsN1GVNE+YrHArrsExogbSyL4Yv9aOOvgabDCbOCT8U4qCVAR4j0AEGgWUhnf6NJQunmyHiQ8G7xStitKJ8Wrcyp/2UU47F4c8iR4wDAdWdhM5OfkGHL8DnWt54q0tWhjVjjqXydqWpSGDEoElitUXfvUhfsV5zrBcXpo1LS+9EGrSee+1TJgUiirsHDlkOdwuzTGeLxmX/TjGhIu85JDgX3JlSGg4DABb/agPUayimHejPSn7WWXUKIdcsjtRFT8sfUbb5oUPNwy4inf8SQpkHOYcldCubpLEK6j6kCsj5/fCPNeRggJYjCOd9VBv9UTXqXp5xP8hTml/Fijdtpk+LBbS1pzEROZLQUK0ACIBfVFtHVV3vlQqsd/a5zy8vLv0I4uRtCmAtayfHbWRmbRxniOOQ8vYv7Ztibb6aX2wNParyqdxxdTdM4PjBCi7oo9bkJQROs6ofXGLfOf9IS0YQUO6k/EMUuwYBnjFkOELpYFqYAGHmXjeqSrAM1XrCm1l6Q4+G35LcjgI06xutgZFynoegsEc1WbTrmLbK5D40quHFeZcy3k4ANUV2oNCre+eE8W0ZWmZF4zCgFg3ngvrC/hrOj3AswJ2gIAgPniYqHIyTNz6JW8azTOb1hKk2HSPx1t8l0T5GYBWEWjxkfEOw0xV3lenHt0x6lKU4+S59PWdppPYe7s2NIFN+mCEw7C1bM/MDFObchm3zyNv7pcmOX7aRXet/lUmBrFVlXFLMQARg3izB/0m
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(8936002)(66556008)(4326008)(83380400001)(66476007)(8676002)(36756003)(508600001)(6486002)(26005)(31686004)(38100700002)(6506007)(86362001)(31696002)(53546011)(6512007)(5660300002)(4744005)(316002)(66946007)(186003)(54906003)(6916009)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjIvN1JNNjZBT3NLek00R0NqV3hoVzN4VXdDdHJrL3IzLzI4elRRQnVTd3h2?=
 =?utf-8?B?NmJUbndvRUxKbWQ4aktQTFNXMjRoQS9KZjFPdU10cDdWbWdTMmpOTHVjSERz?=
 =?utf-8?B?ZlBzdE1XTVNtb3JFWTBETU9qdXNpVk4vcmk5LzBFaDVUUjlUNmdtQ2RqU0FL?=
 =?utf-8?B?YUNHQU54UWtIRkpyUWxvZGlVT3VFRTNESGRJZzFHTGVPRnBYU2tERUxOc1E4?=
 =?utf-8?B?eVI2ZmlpUkV6UWRITHZMR0ZBbzZvelBKSncyNm5KQklBNWZ6dEtQS0hvWEM4?=
 =?utf-8?B?aFdkV0U2NWc1clVJcGREKzUyRlJLTWZjaG1QUkM0QmNmZmhyQ2VxRTZhU0Rn?=
 =?utf-8?B?dUJ3UkpmOGFWUXAyVXE2cnVURHZRY3lYK0puN1lIMFE4RjZ5SjRXN3lZeG9S?=
 =?utf-8?B?THM4TmZVeW1Id0gySjBKVzB0KzUyRWtFVkxSWGZZVXRVZjFzSjVIWDFmMGpx?=
 =?utf-8?B?amRwZ2hMOCsvbzZBdWY0VnB0a1cvNE9HZWVoVk5OdEg3NkJZYTdyWmpZc28v?=
 =?utf-8?B?NExBRElwUnY3MHluMEdraFFhUFdJeEVHUStDUTlnV1dxckxzc0tiekY0RU42?=
 =?utf-8?B?UVNuZCtGQUQ4TEZ3WENoVmNFSzNOVzEwSXpOalQya3VrOTg0REgybm4ydFhF?=
 =?utf-8?B?cnF3NTZ3dlRDV09qVHc3bnpmR2ZJQ2FRR2R6LzFtdVduN2UrYThxUmc0dEV4?=
 =?utf-8?B?RklzbFZVbW1Cd0Z6ditqcUZuY1Y2b0lQV0JNbUdXZlI2b0FYdGROOXFZYWdW?=
 =?utf-8?B?c254emZDRWE3a3B3dEdPWUUrMnQrR3g1NHNoL1NHNXZ0OER6RUlTcXF1aHNV?=
 =?utf-8?B?SkFUYkN1NUVRR3ByMlBsckZ2NWZMN09zS1B5UTRHNXVVV1F2bXlpQVJrKzlx?=
 =?utf-8?B?YmJ1RmFNQWVRSzlMRWJFd1BRdk5tVFVoQkJHc212NnVtZWNvMzdJV0tQbk5k?=
 =?utf-8?B?dVY3ZnJYRlBlQXliVHkrSGxsUW9LZzNLRUNUTzIyczJFWkR2ZFVycW9rZXVX?=
 =?utf-8?B?S0dHVnQxa0tqVWxTOXVmVENyLzBZTk1KbS93bzhyYmRWMmU2eTRwSzRueW9J?=
 =?utf-8?B?bW15UkJ5T2d2R0R2ZUlJRThid0RxN0dVOHdxakpNOWFnREU0eFQwaUsvOXht?=
 =?utf-8?B?YnNxRjIvVmo0aGVIaXFvSGIzT1NpdGdPYzlvZlVTa2daSFhBdnlKTk54Ujcy?=
 =?utf-8?B?aXNpK3NGMXZGeEUzOEhpZllvR3BZRVkxbzN2LzBvWktWcWJSdHoxcnhKSnV3?=
 =?utf-8?B?RXBRNXMrU0pYWER0My82Q29RU0ZaYktUQWJaalZ1UnJ6NERDRzR1VVhmb1Fz?=
 =?utf-8?B?MDFvbFFhUTJaYXpFWUJJblUvbS91emJBTzFNR0VHbmNFVVBldWc0Ny9sSmN0?=
 =?utf-8?B?V0pDQ1ZxcWNET1pRTDV6OURDckhWV0tGd0d3dWRCcWJ1bFJCalRHZm9JTEdO?=
 =?utf-8?B?aTllMXJoeXlJZ3RvVDhXRDV5bXR5d3J2ZW1UcEk1Zis1WG1kMmRTNmxMVGFX?=
 =?utf-8?B?WFpVdG42aG1vZzBmTnNLejh6dkVweDhiUkFmeVlMbDdBQ2o4V1U4dXVMY0Fr?=
 =?utf-8?B?VWprTktERUZKM0FrbjBXSUVQb21IYUIyblZLeGhJa0piVW5BdlBXckhKMGJX?=
 =?utf-8?B?WXJycVduYkx3VE5KaHlYdTFKSWJrKzByREhQd0YraHRpUk8xcGxtYVNTQ2Nm?=
 =?utf-8?B?dEt5dDY1UkR4cm1qdHB6akFzb1h3NC9QUFlzOEo0U1k0Vk8vRDdTTWhCV0tB?=
 =?utf-8?B?QnhkRTl0blBTZ3Fhb2tNNU14OWQ4bjN5QytIVit0VEs4aGtxa1YyT05qT3I0?=
 =?utf-8?B?bm9XbFllTk9GTzBra0liaTJvcG9tL1VBaHk0MC82VHpncVNBOENzUTZmc29k?=
 =?utf-8?B?eWNIL0ZqMVVyMjdsY3R0SzZHQmdYcG90WWpSQ0lqeW9xSUF1b2w0a0FqMFJk?=
 =?utf-8?B?QUd6SWRsYzdLbzgvbFp4c2JPZTExUWxDaFpzUStkTUJLRWlBNzFlZVk3V0xV?=
 =?utf-8?B?RE1NamsyanJPZnpGS2lJVEg4cmlVTXdWYmdjekt6VkV5cW8wWlhibkt1RHVn?=
 =?utf-8?B?UUErYTJWV0RHOGs1KzMvV21xNm9PczZIeW5lZEtYbmpaaEs0OWJOZUZ1VnFu?=
 =?utf-8?B?dGw3TGVKRFJMOUQvMWEyakNRM0pvYlhVMFI0VDVUWndxSHZVb0YvSmdFd0tV?=
 =?utf-8?Q?BNuNH0UqVp7RZ1iJ2kvOHaA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ac65ce2-5ced-4aea-8c2c-08d9ea116b81
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 08:11:19.0194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8CEwGQ+mO6ks/XGPmCzaFYmRJQ1LFRc0VkeFgQcRVOkMkcgIkf6GIhIo9XC/r7Hgcp65LZQU1ZFUiEJ1RayLhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6324

On 04.02.2022 21:31, Andrew Cooper wrote:
> cpumask_weight() is a horribly expensive way to find if no bits are set, made
> worse by the fact that the calculation is performed with the global call_lock
> held.
> 
> Switch to using cpumask_empty() instead, which will short circuit as soon as
> it find any set bit in the cpumask.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

May I suggest to drop "horribly"? How expensive one is compared to the other
depends on the number of CPUs actually enumerated in the system. (And of
course I still have that conversion to POPCNT alternatives patching pending,
where Roger did ask for some re-work in reply to v2, but where it has
remained unclear whether investing time into that wouldn't be in vein,
considering some of your replies on v1. Thus would have further shrunk the
difference, without me meaning to say the change here isn't a good one.)

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


