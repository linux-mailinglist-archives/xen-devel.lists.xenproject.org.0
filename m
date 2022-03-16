Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E14B4DAD3D
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 10:10:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291102.493880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUPfN-0006qd-NZ; Wed, 16 Mar 2022 09:10:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291102.493880; Wed, 16 Mar 2022 09:10:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUPfN-0006oR-Ig; Wed, 16 Mar 2022 09:10:01 +0000
Received: by outflank-mailman (input) for mailman id 291102;
 Wed, 16 Mar 2022 09:09:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7auh=T3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nUPfL-0006oK-5o
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 09:09:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9e150fb-a508-11ec-8eba-a37418f5ba1a;
 Wed, 16 Mar 2022 10:09:57 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2059.outbound.protection.outlook.com [104.47.9.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-CWqGqfA6MwW_4lJmZG-jeQ-1; Wed, 16 Mar 2022 10:09:56 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5070.eurprd04.prod.outlook.com (2603:10a6:803:57::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.28; Wed, 16 Mar
 2022 09:09:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5081.015; Wed, 16 Mar 2022
 09:09:53 +0000
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
X-Inumbo-ID: d9e150fb-a508-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647421797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cx4tnqs/wWARA+sl3FemMKoPttYmicbLY2XbWDuaZOA=;
	b=iDP5t5VwzvLM1SQM/jOvAAj+h+bBSjS8QxEzMgk+4L5nFl3mbZOr8eJyNYFx7BjinFeBX1
	xNWK/XxuNxjakzRsHuQIh6Xc3VrQgzU5B/qM22H7TGoZzJNNygUlzqxI/6c2flae+s0uGV
	WLQrK4Hf3TxGVA9pUphZ6EVExeh6pgk=
X-MC-Unique: CWqGqfA6MwW_4lJmZG-jeQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RxPRNIAxl+74KBMK76Rc6pP/LAckfDSFqhN6Y0py2JfHlhKifr3nOCW/Xo9G73Au2/xtlRKWYN8MiPSK+1JWE653SPvxlLqcclEDRv7haft5/xWUhHXUiKCF8AyqtBKudQ3A3cCHIuds5xGjutJx2MQir88wz4LtbM0+7vsROtzssz393AkFrgV3b1B6tU2p1CWZMwSoJl86ruCYSvuna89+WdxYVAGvIMTwtaaVUoHJiA6Gw4uEsDiqNxy0+tcuu1NTGW5ij2Ohk7HH6sIWhpGJtCou4nVoMSiiigC3V7WeAxIMVo2j9nZSJ2VRiEBe+uheFV/5St6wXqfIYLIjNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cx4tnqs/wWARA+sl3FemMKoPttYmicbLY2XbWDuaZOA=;
 b=QQqZrs54yOKq/SFtgM0WzhhqHz80kiDO8HuX28ABIhXQQx543kVKHw1UbqkZvba7OhTor43dtE297RxCqnHkXpAoI+ERuSBwYQs3Uqv9PCj+oWcbJQf+vaAvBjYIiqT1FyQ4SC5UJYexJ73N2esoSjUExiWYqhqBh6wUXorIFXAtAsZfIPRUQqldySmxW8BmlYN99x0Ytb9gTWbDV0DIv0uHs2J8a7BS0zuc2fuPi5hw4+3EjPRvST1YXt8NsjGHALci87KEuZC/d/sdAu8+IcAFIquGdSqsd3OCGypyfrNMz9597nemJ1QyC38TjV7BWV5URsbM22l0GMHUhm6JqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e836cd5d-b59e-948f-5de2-61766377b27d@suse.com>
Date: Wed, 16 Mar 2022 10:09:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] include/public: add command result definitions to
 vscsiif.h
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
References: <20220228112224.18942-1-jgross@suse.com>
 <c489f4f8-c24e-ba73-b33e-b797527d25ac@suse.com>
 <b31ccba4-6a99-9ac6-b50a-a2b32e570a44@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b31ccba4-6a99-9ac6-b50a-a2b32e570a44@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0010.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e37d3a4e-d749-4772-5621-08da072cbb83
X-MS-TrafficTypeDiagnostic: VI1PR04MB5070:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5070CDB226111F70A270A3DCB3119@VI1PR04MB5070.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Wm25CvH8cwXAsiaYFY4Uj6jugmQ4T6pTzMI46nTeXwsHF+1rjmBxZOz96uO4eyUsAxkJG2wBICwZGpaKj0oz2E8sC3X2QSDlvSFMNsXOCcMhBqhbaDzcdIx6Cf682WaNuuhaLxA/9/0WWFg8gg62QJ1mpY2nrWbkopNcsnZjJrJaRG9YeYd5KJSBl2F8O9FL2mTcLfiLWJZYSIJ0SZBgLbQHvpUYLMwzK5/ajJjeoIBXe4yPX+AxUhMv/TYZm+9eZ7lBJ3ghOej4hKjSqQaQ3OcV6ZiYF7lui7CQsN/coorvqj7BuSDqI3q61AWym8I73q/uFW+P/3DnnDoxmDJKxClVBVNdoCYyyPakiQx969IUOxtGfyGzu9iEp9i9QD4PJOlOE/RYFac+4Jq+7pAMw1S2InrG+ryrRoxc6F9AOsi6KNHgq0xGLQmpdL3UIl78VrAchXW+dete5sScsQxEU/vvuA9KtxkVx/4ZH09vkak+VSPlRXq7ZQdqL5qgM9Uei2mYjfihbEMSEcLXSEdWV9yrwvLijo6yoe5ggxZd2LBR0eADfPAuZnweMZObJMo3q+qv5RazdGPeOpRvJuZ7kWoXhTajjsnYFq+Cjzn3rtXXTtKiz+4rJ1oKALADHobcRVcDW8k2gCMXUrAyj7hplGMPk5aUkSvb3DNbjxZJqPpBt8DTNBexERSTCx85JAlS5FJ3+XcItfhTUlHB2oMB3vDycZ5iSrepoLdLZmsBR2rR/euun+cijj3Tke5BjVYs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(2616005)(36756003)(8936002)(2906002)(66946007)(66556008)(6862004)(4326008)(8676002)(186003)(26005)(53546011)(6506007)(6512007)(66476007)(31686004)(508600001)(31696002)(38100700002)(86362001)(6636002)(316002)(5660300002)(37006003)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVMzZEFFMWs0MC93S2xoNmF2UzA3MUtOQmJjdUVwR2JKMXNJaXJUb2tNWXNl?=
 =?utf-8?B?YUpNTTZaVGhzT0J2bE1LbDY3YWZEMFB6cXdxT1J2MGJESkxwanJFeVQ2U0FN?=
 =?utf-8?B?R1ZvQkNOdTI3b3hUWGtDaGM1bWlVcFZ0dlhzVzZiTVBrVm4zZ1lTeGgya0kx?=
 =?utf-8?B?enFHS2hNRkdUUGZoY1diNVRIN2R0YmdCVTltbDJvekppaUMwRkFEMmdnaDlz?=
 =?utf-8?B?bUxhaS85OHdITG5RWGFETitOQkRVaU9MbFFtM0hOcFhSb0RCK1FEWXlZQVE1?=
 =?utf-8?B?anYwK21mWGNIQllTS1pTcU5hM0ZZQkF6K25kbXZUM1RLalNSWWRBS0M1Yy9t?=
 =?utf-8?B?eURZTTFnR3EyaDZTRTNGcDdwSHE3emVrQ0ZXYXlwb1d1aS9pQUFEd29CYkRu?=
 =?utf-8?B?Nm16bFVoNWxzc2tsbUVBc3RKTnUxSHRDOFpqR1JLZzV1RUoyQXpjTHBxUGJq?=
 =?utf-8?B?eVZLOWQ4dEQ0UUR6NEFyZEVVdWRlYldSVHIyOXdIbDdRaTJwaWJaYXpnV2pR?=
 =?utf-8?B?UkVUclliS0E1aVVpTjN2TTlQOEdpdUFEOUQ0VmVsOW11dXRiUHQxc21xWitl?=
 =?utf-8?B?VE8vT0x1c1QrWjRzNjdla2w5dHc3YWRscklaajFrTUtOSXNZd0lJKzhHLzkz?=
 =?utf-8?B?NEF0TTF4MUZWUVB6WTZETUdocFZIZXprSkVXRDhGbzI0QURRZTZUQTlZUWZL?=
 =?utf-8?B?c3RVSU1SdkxHYjRwMi8zMlNPbEpGbmprN0RrTEVFcjRPaXFkK1VkZmczTGdD?=
 =?utf-8?B?ZkdSSDdxK3RKS2Vac282RHBtVDlMN3ZONDIyRWF3eTRpTmZ4S1M4anFPUmNI?=
 =?utf-8?B?ZU1sY3k5Y2tGZ0ZxQjlpTDBYUEtsbnZxMFVxQy9xaUk2ekVja21yL214cTY0?=
 =?utf-8?B?UXJ2QUJCTURvZTFMVE5EcXcwUDZBdUpEN1IrRkJwbzRsNWI0elNjK3BxbXBp?=
 =?utf-8?B?QTlUczZ1S3c1Mk02MlpRTFhrQmVTdmE3K0cvZEVVcWZwWC9vLzNKNG1lcXRB?=
 =?utf-8?B?L04xUE5kOHZ0Q3AwcWIvT1M3SHd1OTY4MWZMSjNnYTUyWGYvSDhucWRKM0Nq?=
 =?utf-8?B?TE9xeVJrbHhLeC80QmJmUHp1NE0wMzhzN1VMSmY3WHNzei9YcFcza25icm1K?=
 =?utf-8?B?VFVFeWNQbm5ER1EraUVaNDBpN09sTUE3TFJtM28rSS93dXMzTFhqelhwZEpN?=
 =?utf-8?B?WmdIM0syTzRjb1dOVDdENUFCZi9KeUtIejBTTUhNeGxKdkxqaXFBQWRwMG5Y?=
 =?utf-8?B?QTRhSEdLUXVwV2FnYVRjQ3ZuOE84YmdWUjA1aTByaExQcVQ4Mm5jVUkwL0RK?=
 =?utf-8?B?dkR0bkdZUFk4NUtTVTAwaHF6V1RWa09Fbzh3WFlHVHlEMzFXa21zbmVmeHJ4?=
 =?utf-8?B?TUZEdEFIMjZnaWpSTklvc0JaZ25FMVBieTNndzNlQWdFdmc0ZDBQblZEbGhP?=
 =?utf-8?B?OHppSzBjZkJtNERzdEZpQTRUUU8yTzBDMGE2RGE0Y0czVWtpam16YkNVR3Nv?=
 =?utf-8?B?aW8ycEFQcm8wVE1SL1B3a3FWNTVpWnc5ellEN3huODVMVjdKY1d0dldpaWE5?=
 =?utf-8?B?eUdtakpkV3pPSVA1d05GcFAwTklqK1IyZ3BUYmxuYmwvVUVhZVh5QjRuUW1R?=
 =?utf-8?B?NUtYTkMzWFh3RU1oY0NEYVd3NkViQ3ptQkRWUXFWSlVYUEVDaDJ1RzFycmIz?=
 =?utf-8?B?YjNNN096aGFvK05BN3MzelJaM0JkcW1rOVI0QStCVFZRZzFabVVzcUpIc0Z5?=
 =?utf-8?B?Tmx5RFpxaWJFMXp5dERZb29HcjFJQk1QeC91enlGN1NvOS9yQ1NHNGpCM05s?=
 =?utf-8?B?Y1BpbDZOT2lJQkhjbitjNE9uT3ZDTW5XUXFFSHJHVXpoRU5LdDB6Tzc0d2hC?=
 =?utf-8?B?RnBqRDhQWFZPaTRKclQ4dmxJTm9JUm0rbExnRWI4c0Z2aVlrcWVhZXBoWCtk?=
 =?utf-8?Q?AoQsXrw45GjSuJ/BEqTVHF/PqRWYYwxk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e37d3a4e-d749-4772-5621-08da072cbb83
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 09:09:53.6623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DvXonVu9uy417W5buOJy6kXnmNWEuibZpKvKyYez4lPkhFu+YoohsyBxPSVTbHe7Ak23PUhkQl4J4TUBKtoekg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5070

On 16.03.2022 10:03, Juergen Gross wrote:
> On 14.03.22 10:55, Jan Beulich wrote:
>> On 28.02.2022 12:22, Juergen Gross wrote:
>>> +#define XEN_VSCSIIF_RSLT_HOST_OK         0
>>> +#define XEN_VSCSIIF_RSLT_HOST_NO_CONN    1 /* Couldn't connect before timeout */
>>> +#define XEN_VSCSIIF_RSLT_HOST_BUS_BUSY   2 /* BUS busy through timeout */
>>> +#define XEN_VSCSIIF_RSLT_HOST_TIME_OUT   3 /* TIMED OUT for other reason */
>>> +#define XEN_VSCSIIF_RSLT_HOST_BAD_TARG   4 /* BAD target */
>>
>> Are the all-upper-case words really in need of mirroring this
>> aspect from Linux? To me it gives the impression of this being
>> acronyms of some sort at the first glance.
> 
> The backend can return all these values, so I think I need to define
> them here.

Oh, I realize I didn't say so explicitly and hence what I said
ended up being ambiguous: The remark was only about the all-
upper-case words in the comments. I would think they can be
spelled normally.

>>> +#define XEN_VSCSIIF_RSLT_HOST_ABORT      5 /* Abort for some other reason */
>>> +#define XEN_VSCSIIF_RSLT_HOST_PARITY     6 /* Parity error */
>>> +#define XEN_VSCSIIF_RSLT_HOST_ERROR      7 /* Internal error */
>>> +#define XEN_VSCSIIF_RSLT_HOST_RESET      8 /* Reset by somebody */
>>> +#define XEN_VSCSIIF_RSLT_HOST_BAD_INTR   9 /* Unexpected interrupt */
>>> +#define XEN_VSCSIIF_RSLT_HOST_PASSTHR   10 /* Force command past mid-layer */
>>> +#define XEN_VSCSIIF_RSLT_HOST_SOFT_ERR  11 /* Retry requested */
>>> +#define XEN_VSCSIIF_RSLT_HOST_IMM_RETR  12 /* Hidden retry requested */
>>> +#define XEN_VSCSIIF_RSLT_HOST_REQUEUE   13 /* Requeue command requested */
>>> +#define XEN_VSCSIIF_RSLT_HOST_DISRUPT   14 /* Transport error disrupted I/O */
>>> +#define XEN_VSCSIIF_RSLT_HOST_FAILFAST  15 /* Transport class fastfailed */
>>> +#define XEN_VSCSIIF_RSLT_HOST_TARG_FAIL 16 /* Permanent target failure */
>>> +#define XEN_VSCSIIF_RSLT_HOST_NEX_FAIL  17 /* Permanent nexus failure on path */
>>> +#define XEN_VSCSIIF_RSLT_HOST_NOMEM     18 /* Space allocation failed */
>>> +#define XEN_VSCSIIF_RSLT_HOST_MED_ERR   19 /* Medium error */
>>> +#define XEN_VSCSIIF_RSLT_HOST_MARGINAL  20 /* Transport marginal errors */
>>
>> Some of the name shortening that you did, comparing with the
>> Linux names, has gone a little too far for my taste. But you're
>> the maintainer ...
> 
> There are basically the following alternatives:
> 
> - use longer names (using the Linux names would end up in e.g.
>    XEN_VSCSIIF_RSLT_HOST_TRANSPORT_DISRUPTED, making it 10 chars longer
> - drop some part of the common prefix, e.g. the "RSLT_HOST_" part
> - keep it as is
> 
> I'm basically fine with any of those.

My personal preference would be in the order you named the
alternatives, perhaps with prepending them by "use longer names,
but in extreme cases not quite as long as Linux'es".

Jan


