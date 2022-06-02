Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A3453B5D0
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jun 2022 11:16:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340965.566113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwgw7-0001Bj-Ar; Thu, 02 Jun 2022 09:16:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340965.566113; Thu, 02 Jun 2022 09:16:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwgw7-00018n-7v; Thu, 02 Jun 2022 09:16:11 +0000
Received: by outflank-mailman (input) for mailman id 340965;
 Thu, 02 Jun 2022 09:16:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4LFK=WJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nwgw5-00018h-OY
 for xen-devel@lists.xenproject.org; Thu, 02 Jun 2022 09:16:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a31890b2-e254-11ec-bd2c-47488cf2e6aa;
 Thu, 02 Jun 2022 11:16:08 +0200 (CEST)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2055.outbound.protection.outlook.com [104.47.0.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-0VyicMXIOM29Qgeh1V_07g-1; Thu, 02 Jun 2022 11:16:06 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB4329.eurprd04.prod.outlook.com (2603:10a6:5:22::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 2 Jun
 2022 09:16:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.013; Thu, 2 Jun 2022
 09:16:04 +0000
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
X-Inumbo-ID: a31890b2-e254-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654161368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4A0y2OIPRh60XTuImXXNs/nsDNBronnHLrHCIry5G8g=;
	b=f9zpbWHhhJamX+aihHtVBoLNLQsU/25XrdEuqqkwtopHY2JVJSm8MQa9G+PUWk0Rhk4ZGL
	0YfryUBJRKpLSpO8t4cW5g9teOQa6gaW5QM+ZSlFnXtO1ZRvkId90xmqE7ykPhmCnoXMVJ
	Dgp35KQ7lK5ZxPKBX1kzycRVszaFIPg=
X-MC-Unique: 0VyicMXIOM29Qgeh1V_07g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VcaFSrmZS7dCB8R1Htn3hXkT2OC3gSUisAckcq4eEVyZHP2DKYI1rqUbLniRwiv/IuYHEMppszBTSb8RfJU06maUTol6PdvfU9B8dA0FQP+2uCbKgk8cUQQqhZaG5K1N3B6KBcjVZTMCYEKy6nxbHnpbKml3OjMTnEXcHNKULMyK42/6JaSDRt5n55o/zADuXEdqcsA7oo6BxWURNbS5vy8FnenbWV5HOfN8Xg6YRCwQNTXNrew7NDV6gLRoMAmI9n1Rnk+hpP5NBhmtcV6OL7hjarYNVLgO/1kgMv0OMMtehf0aJgrXcjMlHxEIihs9QPNBO0I7SvES4K67RS4q3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4A0y2OIPRh60XTuImXXNs/nsDNBronnHLrHCIry5G8g=;
 b=bXFfimcBZzEwTwnukyluxcPbN0i1MPhXvmzCL45E/qq+DIqcrnBRqrW6sozOdMqEUy4T3p78+aUerc5TQ7tgOX1RvlCS/ktVjMVCL52m9lpc/9KvPz5+YUYTOvPschE2Q0c2TZ/9C5hKTtQLA6B8q+66lryfUddsVusHwso/j2NZPulYXzC9/VHFz1FDyY2BefjI8F8o9Ld6AI9i5cGECORw4hrLryJtgrvmuDmZ9nparJyswZ51WhJVaw47gWH87+/qpi9glJ3hTO4IOX2haxHF6caujzJAFshJUWEiEH3g8Sxs/5cgkK6/zB89tC/EPMcM3AM8KCi1b+RNFtIg5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1b9cf24f-87ec-4b49-04b8-72eb94c82c97@suse.com>
Date: Thu, 2 Jun 2022 11:16:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [XEN PATCH 4/4] build: remove auto.conf prerequisite from
 compat/xlat.h target
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220601165909.46588-1-anthony.perard@citrix.com>
 <20220601165909.46588-5-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220601165909.46588-5-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0074.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 995acec0-8318-4618-67b1-08da447884b8
X-MS-TrafficTypeDiagnostic: DB7PR04MB4329:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB43297D35D8E007C92232840FB3DE9@DB7PR04MB4329.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LkZhL8yaKgOkKTKbTZn3TAJvdRHTWRRCMO+LAs0tDe09/dRRH80Cu4Ie7qroUNnOixaBpTB62+15c1eUvjWlvFLn+Abs7m4hYbh3kbNKgoVyE7D12rqF0SJeaGaVhV1qEQ/FlD1i3I+8kv5B8aiClIjTJtsLqjtj9sXgzPDjSTXm609Q6VxnVAnaJZLpC9+wdGNQUYo53UJ/QFg8haBiakkQhKIQWv8J1Hh0O8wFx4cHXIXQzbYubvSxOrzg+jh9Z2WGfhcYPtThau5cNtr1RlwQ/F/yZLLUyf73UjhGTiF/SAziWBtjem702r6LVogh4iNxHKQERJb5yH/r5IkXDZcl+W0jrlgz3/t4pJ5mUdP7V16ST/219pxIIY0ACIsTHaQxg8Kiq1KpTgzXk2095+zvD7TysFnW/ZDVhR8yOuHcBo3fmOEGbeW0xn7+3ulITDop3SpHRuepMv8SCvOylSXnXeIS0qee6p3+bTePoda7naa5zxoSEKluDvUbCPqWqsVkOkCEvSKeQZO04UGmc7WDE4ZJQKiDNW69EGII9vkar8diwlDaL8GmP8iSD2bwWuMNKV2iNJfT+W5OIVrw2G7jIG2fN3QsxBDDBYZRCJzOlVBSZt3E8RcsSSI1ZqVO+3S4JbGs/s3WvtWqz5F9EbwOLGjzooQ1w2SspdZfEbphyaiccZZexvM4F4c4a/s6PWnVt8mqDVALcUz3zl2x7xu86QoqGhKwTxHxOEa9sFSBwwafruW4JrrHwuXMZjOq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(6916009)(6512007)(66946007)(54906003)(26005)(66476007)(8676002)(53546011)(2616005)(66556008)(6486002)(508600001)(86362001)(31696002)(316002)(38100700002)(186003)(8936002)(4744005)(36756003)(5660300002)(2906002)(31686004)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmJZUTVTOVJSTFNGd0xJSFhMVm5GUjdTTXJnRUNQN0drY2NnMEhyamFRd2hZ?=
 =?utf-8?B?SWcvQ0RjdlFtemFFWDJrbXNTSlNsNm15N0dGU29FeVVjUmhxTVo0RFNTV29h?=
 =?utf-8?B?M3Z1cVM1TGhwMXB6by9DMmFJbDZya2FTTlhGVnFXQjFDYUVaRmpoaFcwU1E3?=
 =?utf-8?B?RDYxbDRwQm1VTlFaeEZZUmNhaDhGS1J1ZkhFMC9jRDUyVDl0ZUpRbnZhd1cw?=
 =?utf-8?B?bVVDcDBpTHVQNjdwNEVIeEk3SkE5cE5rbzVzbm9ONXNQUzRzSCtBQmVkK21D?=
 =?utf-8?B?NWhjVmt2NG0vcEgyUzVIVzMvcG9taVJ1TDRnZFQ0ejBqaHFhVHFlaFFMUTZp?=
 =?utf-8?B?M1NaS3R0dklCeTJBS0RBOFA5UUdpTCtnZlJxWTBha204VmRYdUdqbG50S1hX?=
 =?utf-8?B?YWpHUXd4Ly83R25BVWY3d0FJMTdyTUJGZ1RjeENlNFJ4N2pTb2FlMGtUVjJU?=
 =?utf-8?B?dzBTQ25TT1RYb2VVdWhMZUdQTURxdDBYQnE4clJDcXBUTE8xeUVVYWdNb0wv?=
 =?utf-8?B?QkZJQ3NXck0wbjVhdkpraGZSZ0xmMWJUZ1oycjduQjZjU09WTlIrYzFTZzIy?=
 =?utf-8?B?OFdDUC9yMWJhVG4yNmJhRk9ST0Nlczc5UXBFc0Z4K3RrUk9HeDZlbVkvNjJ0?=
 =?utf-8?B?VUJGNitnV3pqTjdmVXVMbUJwK2YwSU82aXVFRk1hZnpVRVRTUW1ZZzJ2ejZo?=
 =?utf-8?B?YmtRd0xmUFJDbi9malZzNGoyd01qMURYbUtIa0oxOThRNnluMFQyalEwYnls?=
 =?utf-8?B?aHp1QzRhcm0wZ3g2NVlKNGFyTHlIemxGU2kyUldvMDV4ZEplN2Q3RzBTUmdP?=
 =?utf-8?B?NFNTeWVSK3lJcDBZR0FWcFJwTFRKSmFWcmVqNU90U0dqR0lEV0k4RW1XaHhG?=
 =?utf-8?B?R2o4YTlDZ1lubU16SW10SVQrRFRNZHM4MjVrWjcycXExRTE1dFVNQ0pSMDZE?=
 =?utf-8?B?cFBzdkJZNnQxK3QyNGpJaGFCcHBpSFhrbVVVdmlpMCs3WkVRYUtHZ1RUaHVK?=
 =?utf-8?B?RFRKWUNKbmtvc2NzSFErMmIra3pTSVVLYzV6YlVXY0kxSVErV2ZIeWJURytD?=
 =?utf-8?B?MDhES25VNlkxVHhzZGlGdmlyOHNNSUVzTXVnY3dwR1FCZmVDVnNJaW8vc3V0?=
 =?utf-8?B?a1dWSHp2d2F3K1RPc2JNQ1F1WjJXbDdtcFZoS2lmdXpzWkJPUkhsRmJGWXRD?=
 =?utf-8?B?S3E1NmdzVGpGODNXU1pUbGlUbjlDU09KOEV4TDYzS3oyV2xwWnEzaklqVWhq?=
 =?utf-8?B?UjQrUWdYb0Q3c3FLZUJIZGppQWVjeXlPQm5OSHJUM3czL3U4UEhodjllRGZE?=
 =?utf-8?B?SGcwUEFrNXV4VnNrMERSeVhsYmlWRnl4RmpLemJBNnYwbXNoOStkcFVRWGgr?=
 =?utf-8?B?L1l0SjBsY3dnV0FCVFpQQklOa3dJaXN5TGl0aXNWNFdrNXRVSVpqdWd3S1VT?=
 =?utf-8?B?a1RWdTc1Q0JiRjhVdFkxMnZGVUJ0ZDJJK0xQMTgyNXR6Y3FGdTV0T1MvQXEz?=
 =?utf-8?B?S2o3RFFFZW9uaFRwVUY0Tk92T0g5MnJBand3Vnl3R21NNzlqNmYwV3R6Mldu?=
 =?utf-8?B?a3B2cmZ2Yk43RnFUVEJuanA1UXl1Um1QQUs2NndrbXRYdmRrR0hUMVFrWVhQ?=
 =?utf-8?B?UnhTK3JzT2l4SVlZU3BZMmpMN3NSL1hIUFBZMGxPT3NKR2V0M0R0NlRJRWVq?=
 =?utf-8?B?UVZ3Y1JrRDBiZVY0Y21RMEpleDNNVElwamxuZEpJbWkyV21mblFhWDd6Y2lG?=
 =?utf-8?B?UWQxWWFmdmdsNXBwbUpVK2hUdGdNQW5Vc293ZWdmMDJjTTYrRXA2ODJoV1FT?=
 =?utf-8?B?MGxuWnlHTE1iL0pDYzk3RHhPb3VBU0w5ekVLZkc3MEpXdzZpbDJCbGRnL2NK?=
 =?utf-8?B?ZkpYNmtuc2Y4WU5vM0NkYTh0Ly81Z015RGRPUUtLRnZUZTFGS1Z3cHNVcWtY?=
 =?utf-8?B?TUptK1FBdUdhcmpucklBbjZYQUhSclhXRTZwOVIzMXVkbnFGcS9rSVlSeEZ3?=
 =?utf-8?B?K2wvYklqSk0wRnlqM05yelJ5THNKZ2Z2T0NYS2hUWkFiZjh2OFNUelh2MUZ6?=
 =?utf-8?B?K0NRejB5THpZZEdNcmViLyt4SEhUamVRVDBPSCtQU0ZPY3Z1NkJqTStLWVRa?=
 =?utf-8?B?dlZBSVE2czg5MFI3cHpoOXR1Vm5abzg2c3B6TjRwZUNYd0cxQWI5NTN3R3pC?=
 =?utf-8?B?bzJKVk0zeFVBSG5xQ0VrckdSdkNuY0s1bmt2dlljODgwQUdoMFJEU25sdmhh?=
 =?utf-8?B?akE4NkM4N1FYMGQ0cThyUkxUdDlHbHdWNVFWQ2JzYlRQSStrK0IwRk0yMk4w?=
 =?utf-8?B?L1pZOS9DM1FNKzVzLzlnUWE2dmNEdk54QnJ4UnprSE8zK0VtaDVsdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 995acec0-8318-4618-67b1-08da447884b8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 09:16:04.1350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l9pG1h1iOlbvLmnF5uVGUqojtvhiGH0FIi8TgZWvhKaxfdBUNkfDKQCMbsEnKXNl7CC1vsvU/RrXqe5ghWV3Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4329

On 01.06.2022 18:59, Anthony PERARD wrote:
> Now that the command line generating "xlat.h" is check on rebuild, the
> header will be regenerated whenever the list of xlat headers changes
> due to change in ".config". We don't need to force a regeneration for
> every changes in ".config".

This looks to be dependent on only patch 1; I wonder if it shouldn't be
viewed as an integral part of that adjustment. Anyway - if you want to
keep it on its own:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


