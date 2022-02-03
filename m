Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 669DE4A8500
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 14:18:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264756.457971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFbzl-0006nY-Du; Thu, 03 Feb 2022 13:17:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264756.457971; Thu, 03 Feb 2022 13:17:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFbzl-0006lj-AO; Thu, 03 Feb 2022 13:17:53 +0000
Received: by outflank-mailman (input) for mailman id 264756;
 Thu, 03 Feb 2022 13:17:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OTfZ=SS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFbzk-0006ld-JE
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 13:17:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a461aba0-84f3-11ec-8f75-fffcc8bd4f1a;
 Thu, 03 Feb 2022 14:17:31 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-uKo8084GPwG68tnx4lB5mA-1; Thu, 03 Feb 2022 14:17:50 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM7PR04MB6792.eurprd04.prod.outlook.com (2603:10a6:20b:dc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 13:17:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 13:17:48 +0000
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
X-Inumbo-ID: a461aba0-84f3-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643894271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KraDiBsPtW/5qsRQGD4muTqPq5mDALoHr8tGsweK3Wg=;
	b=J55grUBwrsDwJcVEy+t01+kq5EvtIGPZjot7YIlM4WhDrX1uKfKHZocSOgNeXxWe8BBLQJ
	DTXSvPR8VLs+et2td89qnUCaxqFQnoY1HPxXSphDf9BgQ046YxDvkbtX7kRwwQY+5DScDp
	546WzjALy9MDzmjQ/X+eVN3Pta6XP2U=
X-MC-Unique: uKo8084GPwG68tnx4lB5mA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzSIvw+Df251FetQSJi0S4x7f+H4lNKZbvzNaRmJfaPywlejdbsMDfRVFdd/pcC9gBOaIGbvv2gprn7mStR+z3kNjzB41x6g9YosMdQOvQcaTyRgTK/+wQyN0uUkqsr71AR4oE7E7BGyXSj3/4ziDJ/DHytj8/hPGOcJg9W6QjA3Eo/xMfadjIBCRfjXKwn2LR6DuaC1bFMe40lyxmCoLWuXNaqC0sVWJQuGnmRENtlKtpK2RXFrEIKXuZR5PlPGoBJZKuCGMNFiUSX50DRo1W3zkYKPXe5KyB3rFgmnIALweHAsHJBa8+qvbu8qG0f+5Y3gkIKVY01TMoOwQ023rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KraDiBsPtW/5qsRQGD4muTqPq5mDALoHr8tGsweK3Wg=;
 b=lbFLt+L4p31hqf9jnHsdaU/V1GMSdznMtdmu7WmKlOAi4eZUXsReADKmcxA55gnQwvXFl2OHl6ukxgwExxCT/Xz9zPL9veNvXaagOCil9EMmqPpAf78waO8yiV6seUmCc7hTFBXeJXF2qLGNyTP2qCYPieGf7HVo5Sm3oERQoqTgw8iPVzSflVB2cnWdoYgSfkXUv2jax+MBZ43G00Y61t5UJoyIfB8G8+AwmN/GCDpre9EzgJvkO67pTxIEYmrdZkwYzhkQ1AExBFjLG3yKKr1f9fnyFJah4isYGf/MpgscuG3hrJ+0jIkWiaMQginfv+5tlbSRxPF71jWtec+zzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <41828b2e-a824-fd3e-93d3-2de28a392b6d@suse.com>
Date: Thu, 3 Feb 2022 14:17:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] xen: add option to disable GNTTABOP_transfer
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220203131418.1319-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220203131418.1319-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0602CA0011.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b3c76f6-76e5-4ef8-6bbb-08d9e71792d6
X-MS-TrafficTypeDiagnostic: AM7PR04MB6792:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM7PR04MB6792DE8EF4743B0502A41C9FB3289@AM7PR04MB6792.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/ov5OEgvDXAYqj/kO5H2VOMf/HrKnHGas53U/0vccnzkeE4IKNkR0BK424LU54oLaXyvlaylO8M0dtJrEQp0+/oIjenOu5p6/fWjtHjeHfbAbPiCeWHI1jw3yR5ONbW9WSUUwLkilp3OAvz+9Wi+m6PBh5KNcSs7RFhtBMGw2+ix44tG2GeZeWN6tZSh0wsPZKg4fn3Abu2MJRYbQOJdJBiiPQOzgiqdfpmZwjAVde+I4BjtcJgCj+xDW4i83yD8zzwpgxFm4bDK5TsRYz4Nz+rt1amX5+N4u9fgEgxzlHtncKe09qM0makb1EXZHF9INxmFNICfPXi1+wuqXyRU5iwKg13Xnc/vNsY+nddTNGNYbhS3U4cCN9ccCcy8bxYu1Mij6acoDXGl6rX/O1Wi3NRfwYgRmp++yzQ34shPVEoyVzvy2JdSZIyFWClkQ4buKyYypcH5Q1yGl0ujG2lK40rHiNfxvFZqC8pGIYfdpbhmymfp0XKrHg5OzmTOjiyhfwlsL+fdx/vptd1KtYBvD4n8Xro3TAxxQ5uKApcdWx8F7wJeo0Nrrjf4bCJNl38GmTH57kWE+KRdcGi002x6x4Y7wD5fK0lZq/nW37mahIZAbGzfFSMIUIWPMY2izwtyU/F0EE+89kS/YY0dfyVPuqtFqg87qhK6sFUBUrn7SpPjqa0VpA3t+4hOLKgow147a6VB1ZSCQO1ueVKvxvkYv8cZTpWEd8YT88M9ofHDvc8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(6636002)(86362001)(8936002)(36756003)(6862004)(4326008)(8676002)(186003)(26005)(2616005)(31696002)(31686004)(508600001)(66556008)(6666004)(6506007)(6512007)(4744005)(5660300002)(53546011)(37006003)(54906003)(38100700002)(66476007)(6486002)(66946007)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTYzejBaa2NBMnY1VVNsWVM0c0paZHc3dmErZldKUnl3QzNpQTNjcVUvdUVD?=
 =?utf-8?B?VWdlSGhQWDJRRFcrMFdCZC83WTdLZFhJTExhK3dwUU9CZWtBbUlGS2Ntbk0x?=
 =?utf-8?B?S3ZrLzZFQ0NHNFp2Wm9nQkF5bmRuSnUvZWRWQ1ptU3VjaEFybWwyTzJoWEdS?=
 =?utf-8?B?T3BOYTVNcnkrNFgzNlpETzhJeW5zWWlSQWttajJrNTZ4ZUhtRU95enpXQUtI?=
 =?utf-8?B?eXJtbGIwTlVBY1FMNHdwb0FVNlFXMXlsbEFCSXBxcVEwL01ab1JvczdxV0Zo?=
 =?utf-8?B?ZWRsbjFScHJJdUlaSjh1ZVhrRHFmV1lKb0dJNERmUm1zbE83NGhaanNpN3JE?=
 =?utf-8?B?TWN0Ty9yeUN3YkQxLzZ0ck5mNi90U3RCLzJNd2xxR05DSHBJN2d0c0g1cVQy?=
 =?utf-8?B?SWZBUG5MMW1ZOEJ5TFpaUjZmSURzWGpqT3l2UXQvVzZkQmxoVmNsa3BoMnRR?=
 =?utf-8?B?L0tJT0RkSEp3S09aTk1WQm9ualR2emhqOWxuam5LYVltVzk2cDNvUlAyL0I3?=
 =?utf-8?B?SkRnUFpyM2NTM1lVd0tGKzA1RmhqNng3cmpieHF1MC9hK3AwY2ZIdEVOMlJs?=
 =?utf-8?B?OE9HTU5YTXR6bWs4Tmk4SDAwMDJLeG9naUgyNmRoenlENVVuYnNmQzh6WTgr?=
 =?utf-8?B?QnYxSEZJV3ozT0hKdG5RYzNXdHFoMUw0L2RyZEM5SmhHanZZbUtzdWVIWS9P?=
 =?utf-8?B?YU9jTHVWZlplYTAwMlhwSEpDN2RVc3BFMmNvQmxDNGprajkxSnBpN0FLUXE2?=
 =?utf-8?B?TVhUNWZYd3N4SmVUVm8vMFFrV0dZUXRvVjRabHZVTE9WWXhNTUl3MWx2WkYx?=
 =?utf-8?B?V25zK3NPd2lxaDlOWTFOclJNZFBxN2laNkkyRTlpYmd2V1cvRjFhV1AzaHB5?=
 =?utf-8?B?b2ZsM3RKaWhBWHVDS24xQVpmZldHU0lGZHUzMUFXVVU0WGRZOWNBKzk1MERO?=
 =?utf-8?B?Tnk0ZTlUZHRpajBaNGVFanc3WmFrdXhybWw0cUwxVlBzRHh5dXFtV0drQ1dj?=
 =?utf-8?B?aHNoUklDRjR6bTBLcnZHS1ptWUJZbUR0MDNRWkZsbTE5M1NxUFp0a0U0Y1l6?=
 =?utf-8?B?RER6bnY1R3lSWDd3S2tDbHRaK3ZhQmhSUmpzRWFCZHhlMnRxbHR5dENOS280?=
 =?utf-8?B?RUd2N21hZm5aWHUyMVc3VDhmcEJ3Skg3S3pocngwenFvVStiMDl2cUJFTkFV?=
 =?utf-8?B?enQvamVWVEd5NFM1a21BaW1zZWY5OHlGcE5JU00xVHh4N1B0UmtaNHF1NUI2?=
 =?utf-8?B?aFVzOHQvRUtpMnBxOGwyTnpIbnVNZ3oyaUZmQ3luZUpCUjN5MUVkT2JWN0cw?=
 =?utf-8?B?UGlUV1ZnNHlEbFhaYy9PdTlJd3NpaHE3bUJiMlV2WXN0STNabmpiRmhLNm9i?=
 =?utf-8?B?b2Y5aUZLSjhzVGpjTzhTYlc3THRkdlZsQ1g1RGtaaGhwZUgzbGtGb3M0WDVy?=
 =?utf-8?B?SjNqY2taMlVkU1llblM1YVNONWgxdzVZcXc1MXltQloreHRpdXowQmh1ZEt2?=
 =?utf-8?B?MGlBV29OVnNsb3FENnFoeGpYU1lRZkl3QWZPYklXbXdPMDF5WXhSTmdiZ3RQ?=
 =?utf-8?B?OGVjaGF0TDZ1a0piTlZTRlFjcmd1VGxqVXVCTGFaNS9jVHFDVUs0NmpvSXZP?=
 =?utf-8?B?aUxHUWllYkVqYUJIUU9uQkhzaTlEbHJKMnNSRGVEb2l0dTZKRWZrWDhPM1JT?=
 =?utf-8?B?NThYaUN1YVlhb3hSTE1LZEEzNkN6Ry9oT2xTaXUzUHdadlhzczlIWmxrVVJR?=
 =?utf-8?B?Y0RlMnVxeUtyYzh2RWcrZEFERWpGUDRLaENGUzFKN1pmWmdUdTU4dkl2dEow?=
 =?utf-8?B?T05oSW0xZEFuME5TenB3a0RjSnZXb05YTTExdDBlc1gySG4zVURFdlNOenM3?=
 =?utf-8?B?U3dvWDMwMFZDSXA2ckgySjhSSktBQ0JvYkE1RFZhSEl0T1VieW9RcUFQS3hU?=
 =?utf-8?B?MEQwMVZDdE4zU0d1b2xORnRtMFQvL1B1MVd5eXBOZWIxOU1tRGt5RHltM09C?=
 =?utf-8?B?cVdpZ1ZaVFJBVSt3WkdUQm9LZ3huZWNoOVRndnIvZURwZU56bk10L1JHR3dk?=
 =?utf-8?B?SWx6V1RqWVcveVhjcmZlT0VwOC92U2hmOHFvYkxGdnNYZDM5YjF5TWJFT0t4?=
 =?utf-8?B?WFBGR0FScHRzS1lrcDA2ellibWo5bGxwcTcwYnZYUXA1TWxmUi9nWElZTWE4?=
 =?utf-8?Q?27T8Oq51tn/BewM1wJ4xYsc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b3c76f6-76e5-4ef8-6bbb-08d9e71792d6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 13:17:48.5300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tuIv1P+bH6EnIHIBH58d3OdOs21NCUOz4UH38iaR0Y72hXWnDK7KtMXx9f1VgwXFQsQU0BG5HgTSmStrVbMcjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6792

On 03.02.2022 14:14, Juergen Gross wrote:
> The grant table operation GNTTABOP_transfer is meant to be used in
> PV device backends, and it hasn't been used in Linux since the old
> Xen-o-Linux days.
> 
> Add a command line sub-option to the "gnttab" option for disabling the
> GNTTABOP_transfer functionality.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


