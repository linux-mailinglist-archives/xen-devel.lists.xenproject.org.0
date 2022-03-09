Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C30A24D3141
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 15:48:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287895.488182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRxbW-0007f2-PI; Wed, 09 Mar 2022 14:47:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287895.488182; Wed, 09 Mar 2022 14:47:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRxbW-0007dF-Ly; Wed, 09 Mar 2022 14:47:54 +0000
Received: by outflank-mailman (input) for mailman id 287895;
 Wed, 09 Mar 2022 14:47:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gSYI=TU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRxbV-0007d9-5V
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 14:47:53 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e55615b5-9fb7-11ec-8eba-a37418f5ba1a;
 Wed, 09 Mar 2022 15:47:52 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2051.outbound.protection.outlook.com [104.47.0.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-XyGGK6VUNMqCrhKWmPySqw-1; Wed, 09 Mar 2022 15:47:50 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB6707.eurprd04.prod.outlook.com (2603:10a6:208:16f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 9 Mar
 2022 14:47:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 14:47:48 +0000
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
X-Inumbo-ID: e55615b5-9fb7-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646837271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T53xnU4a/GGcxOM16qpKB8AnLIKiqNrKNO5PjcXhuIY=;
	b=WMVcb9u2bBOTIe7y+h2wPZisaw96IDtgeJ2BT3jhxE12+uiXlMVsRgDgf7ZRQBMgeYpEkh
	RcuTd9zQIg71kOCM1kGObrhTeWwBLD5nuEh4GTvvsCjrFFilmrMtiz4P0BzRdw0zJ6TAH6
	r5+UlRikqG68g7BSN2yt5HrBnpEQxTA=
X-MC-Unique: XyGGK6VUNMqCrhKWmPySqw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fOVhtZMsCi/TqCHs7xZrcOthq0z6eG7egpJfhkcUXMJ/Xb9U3OR/C/Kptwrp0yx6Nbj+TU+lQvRGHidI6xHc6/JiL4pDON5Va5or+l4BRfsDJkHOcRRrT8WBkN3OJzv/YzH75N/AbQPxctCuC56hKKsliMiJTnBc2AUFzkuKq7ej8L3VtZpAqb/QqrZxKP5zoUUUOGvhrXTnu13Y5tl7fWdKA3l1uGCGd8tpzR722Hl1H55pUbjoHhOOVQ0FUoqADa5yOcLkmknpJexybWxb0QkI3nho7V1wDFcti5z6ABFT+Pqh2hez9KbOPh5nCAAelrcRVFPn7PgpgKpQPZwClg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T53xnU4a/GGcxOM16qpKB8AnLIKiqNrKNO5PjcXhuIY=;
 b=lLTSLFibPV0yVDnbMgXIP4WK2VQ5aI8Ndh7WYle0btDQS9lytWQS+1q6UrREM6zjiUDDgPaYjqBc/VMboE1pxM8yiGtAMFFGLv/iQHjhtCPRo4mVE+QUB6Pg0VvOoNGIvNtQu0zP10qd75gYuCBkaCF9yWdN76QSna+lISKbzKy7RRtmo5k6Z3f4dI5FFtmhT4cTJkSE/5A9OlDhhk5OenmRcQQmhTM1+Bj/Z26RnUqHf284KO2x7KEsxBa8sjmIIW/NTfTcBRnNH9NO3FccsvW6GUtAMdekGCO6CF5ROjOefKQJMrER/CTvSPanHExOC3jp0a6rrqW7gjoiJClfUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <30e21992-8476-c0c2-4d20-206af5eba2fd@suse.com>
Date: Wed, 9 Mar 2022 15:47:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 20/36] xen/common: introduce buddy required reservation
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Marco Solieri <marco.solieri@minervasys.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Luca Miccio <lucmiccio@gmail.com>, xen-devel@lists.xenproject.org
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-21-marco.solieri@minervasys.tech>
 <438cd24f-cbe4-5406-ab7f-3a6e599907c3@suse.com>
In-Reply-To: <438cd24f-cbe4-5406-ab7f-3a6e599907c3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0065.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::42) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc9fabb3-ce7b-4204-1b68-08da01dbc765
X-MS-TrafficTypeDiagnostic: AM0PR04MB6707:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB670783536957C9E9017BE7D9B30A9@AM0PR04MB6707.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QFeRiuRsBCWq12C/ijI2bPDR0KtBcJ1bIhzp4RZqrwVyS08el3BjCTmr14pEziDGytxSlHh/dqPNypjUVxmFRPpqzEMOEYyPr03ALT9ztTZI82xQOw3JYJpg5Ey6bV1TfPQk5SmquawkvmXfkvS7s7CtTZs9t7RlIbV4OcC857G2oLM+q6kHwmAgFvi3DiFGQSitzCRObusEW568tHE9DrvC0wTDaqoLCqvOlaErMLJIrX9GprL8FU80x93yM2WONvgYFIs5COIsbOac6XyFapF/fT3K3uaJbVZTVuoxe+TnIx0uwBK8XPwSs3kb6Df2DVG1cNt1nI19ufSu8OHf46VBU3njLloIcp4lgeVn03eJuc4ljJeLgsdwwFeDv8ST6sbmXaezCTNp3dknCoTbbwHFtkbOBCAvxPGl6PeKkVPyy8H60MoBeBYTMiVsuiq+MyiZgv5TvoG9MxC7QFVyYgERrJxz+16h8XbwrrzWT/ldlKrbS9woq3sob9MMJezeLjFocuI22b/8K2ojJtl/TdAm8c+gtcViQ4hSsMrMuoENFb1qCZwI5rrBdWXqkieYQ/baR2Wb3L5D/gR1hfiMGoVY6D1qLxJ6WEHkISt+oFUK3JNg6C/A/StB+xosYo/5k3v2Cj6FKg5gZUPcMTnqNccOkgp/eJF2S3TB2X10nB2+8zn7MEr523iqYJ/pnQMKwwdCE7j0E2mK1/SpMgHDnNnwT+cjJb3274xnnBKSxw5Bp1LsBlH9M5H3AI2NKrCT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(6506007)(2906002)(6512007)(66476007)(66946007)(66556008)(8676002)(4326008)(6486002)(508600001)(38100700002)(316002)(6666004)(31696002)(6916009)(86362001)(54906003)(186003)(31686004)(4744005)(2616005)(7416002)(36756003)(5660300002)(8936002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXMxZUI4enFSSnBLME5nNWRGTHBlOHpUMzFYV3RTWUFIcmdHSUFzTjFwbnp1?=
 =?utf-8?B?UGR0YVE1RDB1OTVhUlFlUm4zZFEvOUlsQk80NDR1VXBFWllHY2tEemU1SXlG?=
 =?utf-8?B?djdTVUFSQ01tbDhCd01FRXhzTDkyTnVwdnZMaFdURkdZcEdUeDROU3NhS0lB?=
 =?utf-8?B?emtHR0pWNUd3S2dnVWlVTWdWZDhSd1VkVW56ZDZ2QThYcUtqNVh4V3o3blk5?=
 =?utf-8?B?TWRBdXIvbTFLQWo4RlBmTEJuc1VzcjlUM0ZXd3ZLaVF4WXY3MlhtQlZIYzFE?=
 =?utf-8?B?VVZmQTJPY2hvRU1IQUxIelg1R2dDUitaS0huNkE4WXhSNGtDL3dUVDlobzk3?=
 =?utf-8?B?dTBIblUvRUpJTEYrd1BRVldKUjZRakJ6MVRHMWExeXoycXBSZWZjVkcrRjhS?=
 =?utf-8?B?cXZ1QS9GVGNZUTBmYVQwdzdOMnF1di9WbWN5U3liQTZmVnkwbEoxZkViaHp1?=
 =?utf-8?B?TkFhb1NnT1JJdnpESERuWnNnYWJzc3ZPTGl3S1ppWlJEMjh1MTE3TkwzK0Zn?=
 =?utf-8?B?WTRUS2xTbGQxb0VYYkpZd2tPTHA1UTJJQWQyMFkxaSszQlRiK1FpOEVZbnVD?=
 =?utf-8?B?dEVOSUFGaW4zY0RpcmRtRkpremlTZitGTWQ4VmFvQUlVdFRxY2RpcWcya0Y4?=
 =?utf-8?B?dkMvVytCcm9KZUtTSkdEd0F3M2M1VTdMS0liUzNmSXMwNENHbGtEWld3ZzNp?=
 =?utf-8?B?ZGFnUzNLZjZWYW45TU5CTlF4ZWc0YTZMWDJ2Mm10dkhFSnVOVTVHZGlucDNw?=
 =?utf-8?B?MU43Q1FnMENpWEFZUUg3VjRaTWhDODM0eEJOYm1UdlZ1eWdjbFBPZ0Fjak80?=
 =?utf-8?B?ckNrMUJMb1ZVUjREYmdTNXZQTVZFYzh0dFMyekw0b0g3ZVlvcktYOXBCWi9N?=
 =?utf-8?B?K1NLeHVQd1BqbzBoM09xSG5wQmgydFFRYlA3L1doVDRSMFlFTjBSK3V5bnJI?=
 =?utf-8?B?UnJvbUQxdjhaSWRhMWUyS0pNWEZwaEl6VDgrNFlHZXZJUGJxVjRFaFFtd1dT?=
 =?utf-8?B?M2V3STZtODdNOElXS3VzNGlReE5KV2FUSFVsdTRMa2JLMDFveFFsdTVhNzVM?=
 =?utf-8?B?c3BKY3Y3TFFqOWttbEtRMlE3ZTdXYzdLakJsb1U3cVhJZnlWWFA2WkVZYlFu?=
 =?utf-8?B?MmRROExIRjVDbVdoTGd4TGcwclVPWGYrRmlsRlZZczFOWUFjbDJaMVJueXZl?=
 =?utf-8?B?bjE3Y3YwWVpvWkU0UFNYZ0JDZ2pHVUE0SnRaU3U5SWZtMVFuWU5IOTFyNTdC?=
 =?utf-8?B?bFc5aXdiNGQzcFFUSUlOR3ZPOGdWaHI0aWNTYSticm5rZ0RKU0dLdzhMK2lM?=
 =?utf-8?B?QlJWdHpzVUR4MTExajNVQjhxUXJVZ2I1R2tWOWJkcm9WelZ0YzdBQWhSTnhZ?=
 =?utf-8?B?a0g1Zko1V1dHRG5PODhtZTlueTRVYTNzeWRlL1h4TUNJamUveW82dXMwMnFY?=
 =?utf-8?B?Vk1uSy9mR1dGMjJuZVRTRkpMQXdxSGdFUENtRkdGUnBmZW1DWmxqSzlNUWVI?=
 =?utf-8?B?OXNadzZ6ZXpwSEtRYVdrVXRBMEkxdlJaVEdmenlFZ0J6bFlJM2dpR2VWRjg5?=
 =?utf-8?B?Ymh3dkExYTJaUDBIWjV4bUhXU28yakFHWXhQcEtlZGtlNnBDWHhURlY1TFEx?=
 =?utf-8?B?ZHRCYkRKMlhqeVlOZWthS0pqZDR4eWhWZ0FYSDdMUk1oSkQxajVRRHRyV3BN?=
 =?utf-8?B?RUxLYlk3NW1wR1dHTnJna0JrVUlPL1N0UkwycHppMVZqS3U4YThGZFVYd0xR?=
 =?utf-8?B?Z2drVGRqL0t4Yk1OQlBtRkFSaFNDckFMUjlJSzNzMmJ2ZnZHazN6bWtNZjRE?=
 =?utf-8?B?UUJQeis2dTJralUrT3lwS08ybDlFWXVyc3l2Z1E1VWpGTWFnOU84a1NxV0hw?=
 =?utf-8?B?ck5BTU9VR3M1YVFCNVZCMTFZRjIvNlpZZHIzdGplcTFhRm5PazRlRUJIWHAr?=
 =?utf-8?B?UTk0R3BhQy8yTlZpeVFram9UZVdxaTIyOVFXb1JnYmRGRmdXY01jYWZGbk1S?=
 =?utf-8?B?OVFPNG1DcVRJbDh4TzM5Rk9oWWtqejRWY2VPejRjTmZTbytHaGRqUlVhY3p5?=
 =?utf-8?B?dy90bW01b2h0ME0vWlRoSUtWZ2hjUFlPNXQ3VExJWkEwU0l5V013SXgzV3hh?=
 =?utf-8?B?RTNHMGxNNTViY1lrZzZjVVhENk1yL0EzYVVSb2poQlRDTXFISWJ2a2p2YWt5?=
 =?utf-8?Q?Hs0qCQIgIxqZwP2aCU7uKL0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc9fabb3-ce7b-4204-1b68-08da01dbc765
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 14:47:48.2354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hwMcz3aMq9gtMmG7coOR8F1+i4YYZ7DRq/XOZGNt3K5mz9iN8M39YrkgeHAMfczn+7XOfpER5CyK0R9b7qJcOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6707

On 09.03.2022 15:45, Jan Beulich wrote:
> On 04.03.2022 18:46, Marco Solieri wrote:
>> --- a/xen/common/page_alloc.c
>> +++ b/xen/common/page_alloc.c
>> @@ -230,6 +230,13 @@ static bool __read_mostly scrub_debug;
>>  #define scrub_debug    false
>>  #endif
>>  
>> +#ifdef CONFIG_COLORING
>> +/* Minimum size required for buddy allocator to work with colored one */
>> +unsigned long buddy_required_size __read_mostly = MB(64);
>> +#else
>> +unsigned long buddy_required_size __read_mostly = 0;
>> +#endif
> 
> Please avoid such redundancy when possible. Here perhaps easiest
> by having the value come from Kconfig. By giving that separate
> option a prompt, it would even become configurable at build time.

Oh, and: Why is this not static? And without seeing what it's going
to be used for it's quite hard to judge whether the initial value
chosen is actually sufficient. I could imagine that this would
rather want to be derived from total memory size.

Jan


