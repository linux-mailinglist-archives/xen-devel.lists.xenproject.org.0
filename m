Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A46F44853E0
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jan 2022 14:56:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253601.434784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n56m5-0002kH-ID; Wed, 05 Jan 2022 13:56:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253601.434784; Wed, 05 Jan 2022 13:56:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n56m5-0002iJ-F8; Wed, 05 Jan 2022 13:56:21 +0000
Received: by outflank-mailman (input) for mailman id 253601;
 Wed, 05 Jan 2022 13:56:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VMO2=RV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n56m4-0002iD-5y
 for xen-devel@lists.xenproject.org; Wed, 05 Jan 2022 13:56:20 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41cf63b0-6e2f-11ec-81c0-a30af7de8005;
 Wed, 05 Jan 2022 14:56:19 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-3s5RiCtFND2iEXTT76q6tA-2; Wed, 05 Jan 2022 14:56:17 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4445.eurprd04.prod.outlook.com (2603:10a6:803:6e::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Wed, 5 Jan
 2022 13:56:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 13:56:16 +0000
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
X-Inumbo-ID: 41cf63b0-6e2f-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641390978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4Rr59kPVPy4nsWrChiIdD0KPU+/prAJ0TkOCBvrOS/c=;
	b=UV0xTbJt6BDpoIIu0FZJ9Co6g5pVFzHb34w1GxygNe+lgGrCEiBPehObjc8Tb2nJSyEuZu
	ZJpnBExBcFexHU9WmYhwPJqkqG5MBoAGL4QLFAhgrY5BiIRDzw5E3P1rKeggVpxYktdoCQ
	ycNj3Rcao1ImFzpEKEozBAE1wkvjuZE=
X-MC-Unique: 3s5RiCtFND2iEXTT76q6tA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gEmlBo+fx+Md/xmP2OQxmo1A0KyH2gwbkcD55RvjrV6e18Z6K045DARtdPxcAgoM+ASOZMvKOjoidNuRSECirw5LKiP1xGtano83o4D2cqrgZhXVaeT30BLS1v+p/EPOlUBpvgmF48NOt1UURKPGhLBjx/K60RDMQzbz4FnBX3k37T2mt8wvl4/2GMo9toSNFPB4xuGACYX8bqwqKBmCOBbtXHOGPV9r70xNp9wOI5e0Ooub7UI9Q6SYM8lXVyPOMH92ZnDE5KgLlfj2GlSlCXU/IC2+F1SSExmVPP/0aRxVTybFN2C/jdA5nRu2nLadI0kQm7+dnRmLXsJH9A07zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Rr59kPVPy4nsWrChiIdD0KPU+/prAJ0TkOCBvrOS/c=;
 b=hJm/b9SlyVKborvqMc5Svkg3Bctx+6kr6kRcjYrcmSbx2sdZskLRtLiAyTuBugdBdYoepNU2ZEq9jQZ9LgobjuSO9C0mpW1oFsX+icv2U7aY5+SQPKyfiaUm2AHvrKw/o928cL7GWVYw6zXUpyki8Q8YNg2ekDiWwyf2Yo56zddsxjCIuxk0jmyQVGQAQLcDwsIcOYJADVvLYC4QzBmVDafk/qXvvvp9gm6uao5uyzIAZsJru3HCJiSXx8BY3cOMAu7Gj+oAjFNBBNaDFmZ6x6U9RXaPVdwOBqdUQptsvY4dhMDGiE8VJvEf0Z1XkUPpzkATvO81UalYLNaJ03w/2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ff461a77-93a0-5424-6565-2e947bec3912@suse.com>
Date: Wed, 5 Jan 2022 14:56:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/3] x86/perfc: assorted adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5P194CA0022.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8d60644-89ff-4b9f-690c-08d9d053248a
X-MS-TrafficTypeDiagnostic: VI1PR04MB4445:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4445592237333FD2F36509D5B34B9@VI1PR04MB4445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	85RlU5azzalA1bjRNQRR8QWnQeL5kD+n2DZe1Eed/4ot3mqvZVYEGBLaRHX4FCcjBpi7WFw+uM86Hqgp0Qtj5C43/SNCm/G25TnEaCrcESxv3MD3cngPv5EzFb289RhkhgcKSy+XYYLLphwwpkO4O8ktz14NFDgapZVLOGWPjt2oLqbqSgzMMJUUq5nIpT+RNwJdThoc4tasvkz2SERtVvLzVK8iUcZQMfEm24eUMlD1qzDWI6U8bc9saU8KclORtfAEw4D3Mftl/qITicR2Gmog/MiRau0Sjz0sQ4GtIppcZunqvwk9AGp33D9WZvTrL4h4e2LbzKJOoPTHXtMChMswpozBWqr9fkYxT5XIiRasLpaRTafED1Hz1Figcidm8JsvXY6GB80/0WQP8THaeZx1eGutrxqpr8ibfJJU/32wzUMCEyHDNcrJRMhT26PCCG5f/zd2b7qEJ0z3xJfP5zj9vf9jqOkddsnqcDqADhaPq1hKVF83AnP/8SMb3fWWmb7o6/+OioRGf8M3bDSEroqlnEcw2fofQxwPXGriRY7ohgMzQcT93+H2YZJDbxhMDDGbrbwlgsK5CBT69HOkyoZwD/Q6XJzqnt5eF/P9XLdzJWqJdZXrHfwVklwk/jBxat/mzag7BGS/f7t4P0ygyNjxfhnwZiCxfAT/e2ksL+8gWx26b0dhp2UJccefZUjY5kb2nnvHLRJCOm7m6Z+w88ytcgNNLdHjJgP1jTgEniU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(86362001)(54906003)(6916009)(66476007)(31686004)(8676002)(26005)(2906002)(8936002)(186003)(6512007)(66946007)(4326008)(6506007)(5660300002)(31696002)(36756003)(558084003)(316002)(6486002)(508600001)(66556008)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlVURXJnc2JQSGdFajRtenVPbTN3KzRubG9NVDlqb1JsZ0ZlRU94S2EyNGM5?=
 =?utf-8?B?aXZEOFl4VkZKaTVXUDJaVlNpMEh1Mi9tSDkyM0tkdzN4d0ZjbUtJYlFnZnVq?=
 =?utf-8?B?VWE3ZXMvblBCaVhvQUcvdDZKVGhlS01mbzArYWNPUFZpTmlNdFZEbjNBcVpD?=
 =?utf-8?B?VCttL0pxVGEwZGJBb2xMVGNSa0FsTHBpSXN0cE5oUDllTWRxNWpDQU4xTXZR?=
 =?utf-8?B?Wkdrc3pVNFg2UkxvY3k2bXB5SkNybGx4ZjA4MUxQTW5nTTR6aFVweS9sZ2Ir?=
 =?utf-8?B?ZnFjaG9yU3VrWmg5ZWZLTlVNQSs0Z29yNklEaXE1aWJQRCtoWldpcUxYUWFV?=
 =?utf-8?B?R2JNS3NVZE5QQlZWdnAvS3pYNW1ST0NXbGJVM3lsKzVtUDJMUWhBYTVRa21Y?=
 =?utf-8?B?b1A2MW1jWG42V1BjMlNwdXVLN3JmbTZieTlWNHE2Qm5paFVZbllFc3FDRzhJ?=
 =?utf-8?B?WDluQURjdi9NQm8rUTdnZm9vV0xZSzRPZ3pwaHpKaUU4SVkrN3I0V1BscElG?=
 =?utf-8?B?MzFaRWZMcmMyRkNSaG0rL0V0WWtxSlhVV1QzUElJeHM5SnUwU2E3bVBUaS9D?=
 =?utf-8?B?RjZ5aUhLQVFuQW10NkgxUTQvbUFIdkN3ZEFnSVZ0Zyt0K2xCV3NMRG0rMUp3?=
 =?utf-8?B?eW1WWC9BVTdPK1B2VUVxTk9sU2NReXJGZDJ2S2RGVy9rNU9kdUdVK2Z6bnAv?=
 =?utf-8?B?SUFEbSs1WEpoZFp4dU5BSkFJVTZwOTY2eVp1V0NtWXhVelp2dG1wQkNyVlhJ?=
 =?utf-8?B?cEliMnk1VjUxeXprRkN2U1hZWDBvbG53b0YxQy9jVXNuVmlCcGJ6bU5zdjZ2?=
 =?utf-8?B?ViswQlpPVmx2RXJGdzNoUGVlSnFVVk95cEFabjFubjBwRVVwTUNrTG1YUTFR?=
 =?utf-8?B?aFNvVzdGaWRyNEVFV3hXeFltejBCekVEbGtwMTQ2WDBqclJROC8zdE42V25Q?=
 =?utf-8?B?djdlS1lIRFF4ZVF1UTg1eHo3RFRXRFJTVlAydEZ3cEtkZnpmelVuSVFhSHc1?=
 =?utf-8?B?YStLQjFMNEVrOHB4akZ2TXl0OXZBeVYwRmtxUTArYUNNTTg1VngydEhPUmRY?=
 =?utf-8?B?V0tRR0ZIL3ZIc1FKWFNoM2UwSUpTS0JvOVpZcG9FbE40M0g0dEJZK2RYTjVv?=
 =?utf-8?B?ZjQrYzl1V3B4ZFQ0dzVXUjhNWGxHVWk0dG90dEhzbHY5Mm8xeVMvYmpMcUNo?=
 =?utf-8?B?bUxteUNGSEpiVDFla1ZSRlFCb2VQS1Z1TkZKeGtTbTEzbUZsNWJ0SThxdngw?=
 =?utf-8?B?TGZjdWNBRnlob3hhVExURmU4Z2dQdUtCN3RmTkNBdnNubHlneFJHYm9KVWxy?=
 =?utf-8?B?TWNKOUUvcisyZEpkaDY0T2FvdWliU3FvU2Jnem56elhZZUpDSXUrbWpwMXFU?=
 =?utf-8?B?TlhCRGRhMjBLUm4xa1B3SSt6Z3RCMGRUTmlheWlybFA2bHdWdHNPWVFMZ2l2?=
 =?utf-8?B?QkFOdkNBbUxhT205UE0vbHVXZFNMTmprZy81cWFFc1Ztdk9ZVmcwcG5STE1F?=
 =?utf-8?B?VXVRRVJJMjZmUndJQWtDN2JCdTJtd2JNY2dkOTBmVVdUMEtBWitGRW53LzVK?=
 =?utf-8?B?UVk2ZVRIbUZURFlPWmFkSVFNa3ZvdFNLRzlmcy9pTVVUM29Xenk0Tndqbzh5?=
 =?utf-8?B?eU5ZbnhCUFZYZVFnYkFQSmw1M09mb2VxMm0yS1Y1dXVYb0I3SC81VGVTSk9D?=
 =?utf-8?B?K1l6ZHhDSXJES0hFNit5VlZHN2tmMEVieDRLL2lxWENZSHFRdzdLQUhnL3Vv?=
 =?utf-8?B?QThYbndKQXFobWRrWFhPL28xZ0VRNXBFYk1SU1F2SlFkZmNWYzNlbGNxNFEz?=
 =?utf-8?B?cCtTQ2Y0ckFuSkhDeHl4QkRUaGwvbTkzQ0wzSEVXZ2pRZGVSbDlTbjgreUd5?=
 =?utf-8?B?ZEYzVjVHb3BTdko3TUdYR2x4enFkZUFtanZKLzVhbm15RlJnZmptazRGZTZn?=
 =?utf-8?B?SDJhR3ZGQXM2cjRRYWNNWFJhaHZIL1RpVFZoMWFkMStmdmRFY01DUi85N0p4?=
 =?utf-8?B?SmF3bnJHK3d6Yi9hdjlvamZ3Rm9sRjVKekVBYjNhemFPcWIzblNjajNqWVVE?=
 =?utf-8?B?NGpoR1Jmay90d2dJSEhqYjZiNUhQSFgyWEpVM3VQVUVLVHpmZzV2VXVyaXM3?=
 =?utf-8?B?clk2azBCLzJOZnl1U1JaVm5BOTZHWjJPRmtmR1ZFQWQrSTYxTE01MDlNWVNo?=
 =?utf-8?Q?NAdzfmbwC9IKKjUoFgcyBkM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d60644-89ff-4b9f-690c-08d9d053248a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 13:56:16.6038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gp7oNoWZ2WsOdFyXl2ZeIIeLdPtYWgWH6DhHAV1MAx4pQLechx541snv7M+4HHvKMUm7Hsj54gNh27lTY1cQOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4445

Addressing some observations made while reviewing other patches.

1: VMX: sync VM-exit perf counters with known VM-exit reasons
2: SVM: sync VM-exit perf counters with known VM-exit reasons
3: x86/perfc: fold HVM's VM-exit counter arrays

Jan


