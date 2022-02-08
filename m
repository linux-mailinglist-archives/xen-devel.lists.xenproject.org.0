Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC5F4AD450
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 10:05:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267763.461513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMQw-0006zD-85; Tue, 08 Feb 2022 09:05:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267763.461513; Tue, 08 Feb 2022 09:05:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMQw-0006wJ-54; Tue, 08 Feb 2022 09:05:10 +0000
Received: by outflank-mailman (input) for mailman id 267763;
 Tue, 08 Feb 2022 09:05:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v7zX=SX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nHMQu-0006wD-Gu
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 09:05:08 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36008bee-88be-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 10:05:07 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-RyCGiCk0M2-fyZpP1PLkhw-1; Tue, 08 Feb 2022 10:05:06 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBAPR04MB7350.eurprd04.prod.outlook.com (2603:10a6:10:1a9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 09:05:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Tue, 8 Feb 2022
 09:05:03 +0000
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
X-Inumbo-ID: 36008bee-88be-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644311107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k43vZkAdwGt8pNENvjLXehfRnoVM3lI5xkK+S7qsJVg=;
	b=XNjspkk0TqRdZCwa0BCld7Fz6YR8SVNT8lsxnJQ4zrmgktU2LE9BVuD6FJ0/tLul7Y69kC
	8J6Zev+NsuN21wah3SV7MtHAD1r1vB+xsa1su5/K6MSt6V/EdBNJ9qMMNDGc6EZfo9o7hC
	AeEYSrEJzuqyTTfBxQPTY6Ilwu1ynqs=
X-MC-Unique: RyCGiCk0M2-fyZpP1PLkhw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q204pzltFXIRmeF9/XI+KmN6JQvN26yyLP7O82+D35c6XdXCdeXC3kwvLbGksWJHI0ayGYxgIILWcjSNmcG1Alg0/DLgrI8TUiGwfZh65a+c4Lqz9kJIfZhX1e5HiBAdOribdx0pxh1LtcnH3HNprD7fdu7Ak61BHVhSoAPRnBJZxO8vzQp1LZJ5Qhx6Vv17tOK6sBxld7xCfKwHSB27YAstmn6tUjwmkenPziFLyf3+gmiC+GsdCahT5/e0/rkZD03C4f9ofQF9Jsr+A7WDujNmrYXjdMlZkGOJ3K+sqXpxNXpo7AddAhD/u0htNn2J/7X68aaF5ytNUXwDGBI7nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k43vZkAdwGt8pNENvjLXehfRnoVM3lI5xkK+S7qsJVg=;
 b=mgMVT3+ems75nnxjDU7IKvpMbAjm1xDwUJzi0uq4yAgkvqCQ0dK7eMUu7izhfzIk4ZHvhiMwr416JMnM1Gebde1QXvER3Myp02c4eQ+fRV0JDh1zYBgTCppW8mniKVN+11XT97nnrc4eeXkGuNAF0ksz5aAj7pPq6U1RGdKB4Db0K/8TbSR0aKP28TqQAQqkgaRfU4XJo4llAjB7ZFTD3r6BYdmVswsZ40QevdFE1VDPuyaPvcNkNv+7FolKkWCA8YGfX7PGN4Bsv/e3ScLq9ZZwkR8crJR61r35T8UidGmfE1MmKTSahczkuxJD16098gO4gjjw9/L8G9zAJxpWHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <780dce9f-7d1c-39d9-278c-e89ba0b25ee1@suse.com>
Date: Tue, 8 Feb 2022 10:04:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 04/13] vpci: restrict unhandled read/write operations
 for guests
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-5-andr2000@gmail.com>
 <b6f091ed-4fa3-e292-9a21-a780ec90ee09@suse.com>
 <f86a43af-1388-6959-3e71-ba796e4a0c63@epam.com>
 <5a87c401-4ebd-1d5c-b98d-1b535f63be65@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5a87c401-4ebd-1d5c-b98d-1b535f63be65@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0026.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a12d677-f5be-4691-e669-08d9eae217d9
X-MS-TrafficTypeDiagnostic: DBAPR04MB7350:EE_
X-Microsoft-Antispam-PRVS:
	<DBAPR04MB7350661386FFD2BA78F5648CB32D9@DBAPR04MB7350.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SOl90jslKjRlqxeKiMpbXNHxSnBpbplKdAb1XM/Teo4TXLg3AGOrwYxxv7JjBGGSObeu6KcCZWMlszzgJh7F8xuBhCnJyrRm3E8VsR71Q4eWeanjAlWk5FdG/1VEApSolMqsFsZEAVNj8seW/We83kzXbt6UZzKhURq4K7y3/V3Cufj7LzG5+vzXO3eCGXZxGAV8tn8g/ONfsWVStAkTN9/LRarO7a82NayckNKvEt0Lbk4JUkFFSqncMswWEhz/U56tFqtkpHNFDTZPNWYqop6hZmJVy141CFH69B54KeGX8T0h5vMZYx/hTwT/+jxtPNy+5e3r5lUugRPHSP8C6ZPDjRTEa89+JSokUo2K2JQkJP7O4DTktsTIWUfsmYIPE15IRaPcOJN+fhn9Sig8lvT+ckWZXvBXhCx0KGoyq/BjhZLMwtCRF+1TIHgM5a4Vd/AXebiIjFqFZYe3BOdH01vl2bLzeJjFqkbt0Gu1dyimP2uK3k8CCtl2uNl3UqaOGEOqtP524ZZwmupWmm8iXkU+akYz42y7BNnWro/grH73Xf35qkpu3C0T6E1gMV1gyTpvqkg87A+5C1U3O22BJS/qorih4HXy6qDZCkz0cAbR1vDfCw/vwDzfHb09SmSqyZbHm2Tl37Ns/MQJkt3s1WmSK2e47evMiyKNTRkHYc86R8g0gJkA8llQ5tAzOPabF8cKDWRMa261OOl/7U8fLBC5OPgoWEBFbA1oGmXg7Kg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(5660300002)(8676002)(6506007)(66556008)(31696002)(4326008)(86362001)(508600001)(66946007)(8936002)(6486002)(6916009)(38100700002)(2616005)(36756003)(54906003)(6666004)(83380400001)(6512007)(186003)(53546011)(26005)(316002)(31686004)(7416002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzM5RjdiT1FrZ2luMEVKeVliMlVuTEk3Ryt2Y09Ua2RkSEYvLzN6d21xbFJ1?=
 =?utf-8?B?YUtJcU1XTUZlK3k2U1g1M2oyeTFyM2drN0MwMFRtN2xwUlNQTlJ0WlQ4S3Iv?=
 =?utf-8?B?NTR0NUVCcWxFWmkwWWxWMFJBNkliSzJkWmtGRDg0bWhYeXVxeTBwY1hUV0d2?=
 =?utf-8?B?VXdkdXhRUHA2WGhTK202REMxTjlWUzlMMHdsa09Jc284K1p4RTBBTHRwWUlM?=
 =?utf-8?B?Wmp0QVJmWHZFbWNSY2ZnTEMzZ09jMmdKWWw2K2lEd0RtQ3gyNTBObUpDdnhh?=
 =?utf-8?B?eEEwalJuK2tGbDZHQmh5NWhOZkFBNHVBMVFnS2c4TTlucnVnNWJNSEg3L2Y0?=
 =?utf-8?B?MElVcFNvSE04VjlCSDBuMWlGMG1VOGRLd3FjQXhDUXFHb2U0Y2N5TzJPWDZW?=
 =?utf-8?B?cUI4TE5lNGJQSGtSLzB6UjZuZ1gySFpOcVVaVTNIcXR4WWJtTVhoQmJ2dTJP?=
 =?utf-8?B?b2ZXeFpwR3pKRUpIU1VyRHA4Zy90VFJvUEZjbFlaZTlYWCtmcGMyeWtzK3JX?=
 =?utf-8?B?Z2pqWFgrZlBPa2ZEQzRmNTdPVXhpR09qTklzaTA1dndBc01YMUg1TTEvTngy?=
 =?utf-8?B?UklHaHU4eFVNRHpNQ0x3OGdsbW1YU05VdXNrVFVqWDc5eGxWVVdTaHRaeFlp?=
 =?utf-8?B?azdsTGVScW5JTFJEdFFaVHI4UG1SMVUreVYzOHB3MVc1K0YxMWtVWHV5WmZL?=
 =?utf-8?B?aHA0OERBbW84RnBEZk5aUnBQZTNEWGFvbU9GUkpTb29jNklWbVQ5WkI2ZFVM?=
 =?utf-8?B?UHZUTlQxNVhFOGtTdVdDNnhYTEdpZWNVVTNDcjJFUE1NZFVDdTdFRGlkOEFM?=
 =?utf-8?B?Z040aHJQMjc2YW9BZzRROWlZeG1nOElHYzJSelorL0VsTnJkckJjREs4Vmc3?=
 =?utf-8?B?VldJbDJQZmVhQi9leVRqQVNKdEZ1VFM2Z05QTEhCM2lER2FTSXYzNmg0eThx?=
 =?utf-8?B?RXhUUEI0UjdWUEM0ZytMaUNDZkk2ejdLQzR3NFAyQ0Z2alh2aWRhWTV0YTBw?=
 =?utf-8?B?MUIyZGlRbEpBWklkekI0WktPZm9lSG9qVVBqcFc1M2pQZUtDMjZTbTY3SlY3?=
 =?utf-8?B?ZlhvRitTS3l6YWpkYjNFWG9CQ0JjSS9aK3dHaUNlSU40dmNFUlY0NG5NZnBM?=
 =?utf-8?B?djlrMFJDTjVpeE40dnBUMTkwRmZPSDliNU5zVWd1NDFqck5SSzB0NUZ5OSs4?=
 =?utf-8?B?dXIwdHhsNmtjK2RZZlc2RnpobW13Y3lDRzAralBJTTlKc2lueEJZSUpEV2Vw?=
 =?utf-8?B?TzB4U0lSVmFZNzNHL2M5TmxPcHBGdW9tanJkYVBBUXpsUTNQN0JCWVcwRG1Y?=
 =?utf-8?B?OWFUbjh4TWZ0ODk0RlNFTGRSdW9DOFhEVCsxZmVHeFFSZjJMSW9yeTVDQXU5?=
 =?utf-8?B?TE5SNGlBbWwxZnYvenMvTGlieW1pTFRmME9TalhTS2RTczFwMmRJTUlhNjI5?=
 =?utf-8?B?ejc3ZGJNS0M2ZWVmQXM3Z2VIbDRzK3VWWXBQQWtjOStvQXVma0c5V1JDdERI?=
 =?utf-8?B?a0w5Z25ocUVReStSVnV5RjRoMGRqVXUybVd4c2ZIR3Rwa1lDUDVmY1dYVDZx?=
 =?utf-8?B?M1hhWXoxMldCOUxuY3RRa21zVHc0SzJ4bkxTNDNNSzU5UHVqb1ludU9SNkRV?=
 =?utf-8?B?OVZjNFBBcmJhWmlyS1NqWVNvdjlyS1Uza2JjV3gyR0pQcU95alVVY1hZWU00?=
 =?utf-8?B?d3hhbE1YL200bnhCR3JLVUpNY2FyeFVKVk9RTFV2b0QvNkU0QWNRb1RtR0V1?=
 =?utf-8?B?SW5sc1VqTkZyQkx0c1J0bTFnUkZac0NrYW4xaXJKcmRnaHkxcGYyTmk5K1hl?=
 =?utf-8?B?cEcrcUw1clpEUjBCSXkxY3h2YUJCeEZBNzZWOEsvK3dlRUEwNUpTSTVrNFA5?=
 =?utf-8?B?Yjl6d1RkU2VvWU44NHlmSVdVZTVqLzAzTFpKNTJhVjJwMk5hVjNabVNnckdX?=
 =?utf-8?B?bTdqM1l2WW1CSnJrclk0aXc4VW9kMFdXOTRIbnF2OHJqQUI1Nk41c1NNRFRN?=
 =?utf-8?B?UmVhY2JKcVQ4OU0ybmJxbEpCM2svb2pTN0oyZnV3VzBpYisyYk55K0tEZVd1?=
 =?utf-8?B?RlArMVd2cDZPNnpmbGM1cWNGNkxkWXVwdEYza0Q2OWh4OW1QMm9CR21BS1pN?=
 =?utf-8?B?SUFXZTBFUElSYjU0aURFVVJBOEhURktWTHhHTDRaSTRNSVZ0aFBmS3RhODhV?=
 =?utf-8?Q?2CTO0KbEzxXhZ5WUPfEW0k0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a12d677-f5be-4691-e669-08d9eae217d9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 09:05:03.4862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rxl7MaOWQPSLM8RmDkoRIOSlQQJTms78CRpB1VkBi/YcO4gEQfEEsNujAZ6cBvD3Tukn9hVr9UpYda6SQ5xd2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7350

On 08.02.2022 09:00, Oleksandr Andrushchenko wrote:
> On 04.02.22 16:24, Oleksandr Andrushchenko wrote:
>> On 04.02.22 16:11, Jan Beulich wrote:
>>> On 04.02.2022 07:34, Oleksandr Andrushchenko wrote:
>>>> A guest can read and write those registers which are not emulated and
>>>> have no respective vPCI handlers, so it can access the HW directly.
>>> I don't think this describes the present situation. Or did I miss where
>>> devices can actually be exposed to guests already, despite much of the
>>> support logic still missing?
>> No, they are not exposed yet and you know that.
>> I will update the commit message
> BTW, all this work is about adding vpci for guests and of course this
> is not going to be enabled right away.
> I would like to hear the common acceptable way of documenting such
> things: either we just say something like "A guest can read and write"
> elsewhere or we need to invent something neutral not directly mentioning
> what the change does. With the later it all seems a bit confusing IMO
> as we do know what we are doing and for what reason: enable vpci for guests

What's the problem with describing things as they are? Code is hwdom-
only right now, and you're trying to enable DomU support. Hence it's
all about "would be able to", not "can".

Jan


