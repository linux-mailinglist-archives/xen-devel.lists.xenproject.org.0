Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2734D59BD42
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 12:00:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391304.629075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ4E1-0002Xw-QJ; Mon, 22 Aug 2022 10:00:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391304.629075; Mon, 22 Aug 2022 10:00:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ4E1-0002TQ-M4; Mon, 22 Aug 2022 10:00:05 +0000
Received: by outflank-mailman (input) for mailman id 391304;
 Mon, 22 Aug 2022 10:00:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oQ4E0-0002Bg-4W
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 10:00:04 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2043.outbound.protection.outlook.com [40.107.104.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 307c2fe8-2201-11ed-bd2e-47488cf2e6aa;
 Mon, 22 Aug 2022 12:00:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM4PR0401MB2289.eurprd04.prod.outlook.com (2603:10a6:200:4f::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 10:00:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 10:00:00 +0000
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
X-Inumbo-ID: 307c2fe8-2201-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkFTIO2vdAnqxCRwqGZUI/VGrmGRZGq1+iYX7P8Ds17iHQml823RP7aGrYPU1MDb66I5CiD8mjHBysJdPbRBPfuf6M0qfCxYeCyMKYSBk4OeD2dD39C22fL7+7Q1lSXgrHSM2giC+qG+/2Ky25bYynnGEDFu0sqVbrNoFHbud22pxLuKuGwHAYFr5EqPT28rIAJk2kg6edK7qYrImGuSPJfSC2+sGs97vunHfjBdEdc4U5x/O6oUc9WaIEYfd5dhAmkKtACW36NkGx96h7/4WNiOVhoq47geFE8hQafE5reF3jzC+RdtJ17umL3AwshsHr7KTKR/yQML/aNbKdsLcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCSLAks50XrcWc6++GVzg7BuGcHKd0HodZbHpcQBZG4=;
 b=Rs9X3f4Q7Hc80XBnlvsqU9CcwoHns4UZrkaUxXyuVn4On89WKYjT1OQqcq0n/ZNwieiu4LWPLnxkJ1R/GJ6W3TF5U3Lh2irIsauioSD4YgfJ1hnHvpG9R3XCWKnMjxERVMJhZT6kYqC16zleWathsZEQD95qVxV/G0RjW5AKX/6KUp/uMMjWDPRT4iy8O/s0iDnt0izBAK7Uvs32Fb0qq9XRoJPq9tqi8ZTshZRX7BZmCyLtUbLNvgBJBEeHBTNUFLJC4MCHwPO2q+93erocMpH5mnNHXP4zfgCZzL038C6ALQQPsfgLCrmqF2LhhT6SVQV2HYi6LuNcVLoGc1Ricg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCSLAks50XrcWc6++GVzg7BuGcHKd0HodZbHpcQBZG4=;
 b=MITXghKOylZObjVEgmYIZoqdNESI07RKP2d4CZUHYgF8UmPZNv747FGqaeVlEfkrYVVpLSz7Ijd9dybukExUwdV4E2Mm7fDdjoQ5uQkiR/j8b1BUfXl9ESYqii/Hrv8/32g0yF9ADEvefPWdcgqz4Ofv6ct1fl5xFiMEhMC0My3PS4gLZrKrE+/RdcPa9mYJg+UgxyJibh2mDKysqgcr0ChR4CxjXoT03chIaNeSAlZpCMLsjKkJC0fTw+o6n0H42o8V9VsdnjXpKhZ9kgnqW6UCciiz+mvKcGcigZ2Gh94oONlYUCyxR+vBr7JHb3j3C74zAFLX9zbA8n58oJ457g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9b053c3f-0274-a63b-2a6b-a1715c639092@suse.com>
Date: Mon, 22 Aug 2022 11:59:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 7/7] xen/device_tree: Fix MISRA C 2012 Rule 20.7
 violations
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20220819194359.1196539-1-burzalodowa@gmail.com>
 <20220819194359.1196539-8-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220819194359.1196539-8-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3821e1c4-b82b-4875-52cd-08da84251396
X-MS-TrafficTypeDiagnostic: AM4PR0401MB2289:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QZ6cl+JpeesZo1xYJmCsE5wFRa/FBjXNc5eB9qqQMZI/jjrbAf3VRLGJ42SJeEzpbnMzmQ9CW1OLbbUSlAcY42mRbmkvneQErpNy7XgFMq6HqvAOmQB0fD1Zhaec9ZoKe4gVaz0EKjoTCi395W3gF9iLdWJ3A0j3EqskYh8fKjtGquTXMhUbrYf+hMp4+k64qq74RciP2rDlLx9VySL9CJtZvzgJ8xNGrKORw3mcygW6YcVbOFh9oyEtpsQPnbSb44bOuK9+vJ4tRWOWwi5FUoCcQL+Lk1u8eYgK1dNNOTw6ooRMmUIj5V30iIfIOebQtMfTKQjDTHw7WAoiXayrPPVwjNapWKM4vccjhzIyLM89qUAVirnt7h+s0Bb3D9f0jC9/1VVt30f+ad/yEUc94Ya2FiMAOhqbUVlO9Q0TRpQYixsYFE08VxFJyE7EpOLx6mbGmsPAIymqgSNRDxhEH0kUxiTPEMOn0vAF21D3d4xp6cE4VudUUuIATsR3EwQc8FsUE8hBhuOQ43vAqKhg1gwJJAO0R4DXHH8JKO6vk0aOgGiXhfCELDU3hOLcD5Hk5TZaxrCQsruwZKVDp5Wb3hjNqx1mGs0d1yKKiK64PMlov5MI04AYD/i8nCf4ieoVYhTwqMktJP1t6xB4Kar5df/tp0um8SppKAh2qatq5FvGgZQpV8rOCM9HGif6KF9i3tbxbgi/EUNzVIpPoEf9EQ0XvyWZFDfIBdodWEGTgM7fbJT5wzBhjGKMlCFXv8ujTxH7NHdx3zz6bO5UgFDpf48Uon0xZRlNgLmMSP7JSWU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(346002)(366004)(376002)(39860400002)(2906002)(5660300002)(86362001)(31696002)(6506007)(53546011)(26005)(6512007)(6486002)(478600001)(41300700001)(8936002)(186003)(2616005)(38100700002)(316002)(6916009)(4326008)(66946007)(8676002)(66476007)(66556008)(36756003)(31686004)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkJTQ0Zwb2dxaktxSzNScGlyVHdud1UzS2tuVndTVU8wN0R0ZjBoQXdXWUxZ?=
 =?utf-8?B?bWJMbGNRRUhYMU45YnFBVnR4ZUgwWDlhdDc4Vkt3TGJIWkNwdTJaVnYvZHZx?=
 =?utf-8?B?T3RlMWgrdVZvWW1ndHhVR3REQ3FMczFCVTNjaGxIUzBZUFNMZWVJUCtKUkVa?=
 =?utf-8?B?QmZaTUNZaU9peHZKbUxON3J5KzRvU3AyYlJDcEhrM3M4bEh6ejJES2xOanlJ?=
 =?utf-8?B?WDFJTzY5TzQvQzBYelFSeWhrMEFDWG04VU5LRmlTWlhROFM3UVNlNElFYnBz?=
 =?utf-8?B?TU40cWdCaW9DdEZuYlJjZ0MvL08xVUlaVmh5d2pld245amE1ZVA4dGlMNWpI?=
 =?utf-8?B?dWpHeFpicFZDRlBNZk9Iak1FczJuUlA0NDA2Y0dGYU9aQmpXMDBTYi85RHJU?=
 =?utf-8?B?THk0WnhmUjEyTjZuaEt6bVVzTUMxdjEyb2dNOEkra1BzWW0rdm1sSHlBTXhu?=
 =?utf-8?B?MExWcE9ZTWVvYXF2MStaYlhFaDJOdElZNTFSdzIrSFZheHBTbWZsR1VrWlRP?=
 =?utf-8?B?Mm5Ka0ZwSzlHMUNsZnRweVhGWWUxdDh0MCtvcSt1cDRjeEtsMFovcU5FNks0?=
 =?utf-8?B?cUVHSjBkcmZtM0xtQkVPWUltdjBpTVNFR0lZNG5FVFY2QnNyY29kbEdoNHFm?=
 =?utf-8?B?QjRld1JJRmVQTmJ3WnFmaDJnbExDOHdIbzVkVjI2WWpDR3ZCVk9DS0h2UFpB?=
 =?utf-8?B?K2hVWDN0dnJFTmN2V1M2ekVkNEViWi9aZXpEbGdqZllJUHp4RHhXaTVkbmdR?=
 =?utf-8?B?ejRldEZWYUxDNUVhNkhUeDdCUVM0ZnRuNWo2MFg5R2lnM1cwVkRGWmFYSVEv?=
 =?utf-8?B?RStySzFXYjVObGREQ0RJTjlaa0crcktPcW96cGxaV1BwSWlBVVA1QWNsMW5a?=
 =?utf-8?B?Z251bmdaYVNTNGlRM3JyVG5GOXViTFBZOHdGc2FDbVRXenc3anIvd3VKZ3Ju?=
 =?utf-8?B?N0s4R0FtVzE1V0xBUHlxUWdEbEFkOHMzZEJCRUN6TnlRN2RuVHR6WEhtN3hZ?=
 =?utf-8?B?dHFrK3YzVERibTBvVVZxNktUZUVGTGt2TjkyaDZjR1RIaXFIc280ZGxjTDV1?=
 =?utf-8?B?YjNVTGs1VHpjSUtUQ25Mb3duL3JPRGxvUFE4ZWtvK1dFUERCRm5UdmZ6cGhB?=
 =?utf-8?B?MnRXMlpmLzJjTFpqVVVWa0FtMEpBSThzQzFLc3Q1Rk5QNmFJSFVLbUhXM0Np?=
 =?utf-8?B?TDFJN1VGY2hVanBONE9FTEUwOVBJdzVyeHFsNW1GeVlMRVM2UGs5T0luRlA4?=
 =?utf-8?B?QmN4NWpTWGZxMy9seE9VM2hYOUNZY0Z0VEFWaGcwUTlIdUlzU1JDZnREVUVN?=
 =?utf-8?B?ZUxQSG5URVpHQnZXNjlhUGNCalVPclJYaldsWFBYTHFqSngyRytFd1dJR21Q?=
 =?utf-8?B?WjNucDQyT25EZG5IdkpSTk9XTnJwY0ZiNk1KWWF6TS9xL2pCelZoMUdDdkRI?=
 =?utf-8?B?bW8rcGU5bENLdTJEbFkyL0U3RkZDQk8rNkhld0FSSzcwU1VKejd1ZE1aRk1r?=
 =?utf-8?B?TzNFM0twelE0MlNZSWl3RVcrdjAwcTRwSGpxZFlMSFphQktHTXpWNm90S2xz?=
 =?utf-8?B?cmF0c2o1cWYvUitNa1FYNUlKT0k2ekIrMmg4bENVaFIyYkI1TXFSQUZlSmxw?=
 =?utf-8?B?TzN5bkViQ3RRZnl0bXpwUDJtN0Q5SW96UEt2S2crZUVlSU1RUzg5cVVKKzhU?=
 =?utf-8?B?cG9DSGdJRXM0WStwdFN2c2tockdoNURJdWhIQWJFdjgxYU9oVmNWVlRkSWpr?=
 =?utf-8?B?SFowbzVHeVloZjNiWE4yL1pFb1Q5bk5kNG9RVlBPNWI5L2lyR2VVWEJIaWd2?=
 =?utf-8?B?TU1Ja0oyNkIrVTgzWUNVM2RUUVlPQkViZFB4RkhOcGxFdStLei9BL3VwQlU4?=
 =?utf-8?B?cFU4cXRlVXFmMVdlWHprUDhoOTRmMXVQMDQwMEU5N0JSNFpiMlh5MFh2TzJ3?=
 =?utf-8?B?dW9Cd094VnIwQk1DNkVsVkxYSW1DQmt0ZEdFMnlvcTBMUlpUbXI2a0htQ1E1?=
 =?utf-8?B?SXRQaG9Nc3VyS1UwZm1PMkpyWHRkU0NNTHVHSVlRaDRIQk0wWm16VEhiYXI0?=
 =?utf-8?B?Q0pXRDgwQi8raW0wdFFEUWliS0lpNk9ET1lBL3BtWkJnQVRVSlEzNjVZOHdS?=
 =?utf-8?Q?toMzfvLeXI/MA9m/po5aAGEaB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3821e1c4-b82b-4875-52cd-08da84251396
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 10:00:00.5183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5X6foYeAK3p3EqkeDyFjTQt+/3jYcpKDpOqv7odNZ68cpH8/4mktXKV+tkNjW1G2OpZ7o50ov5s8fZn+jbnkbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0401MB2289

On 19.08.2022 21:43, Xenia Ragiadakou wrote:
> In macros dt_for_each_property_node(), dt_for_each_device_node() and
> dt_for_each_child_node(), add parentheses around the macro parameters that
> have the arrow operator applied, to prevent against unintended expansions.

Why is this relevant only when -> is used? For comparisons and the rhs of
assignments it's as relevant, ad even for the lhs of assignments I doubt
it can be generally omitted.

> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -222,13 +222,13 @@ dt_find_interrupt_controller(const struct dt_device_match *matches);
>  #define DT_ROOT_NODE_SIZE_CELLS_DEFAULT 1
>  
>  #define dt_for_each_property_node(dn, pp)                   \
> -    for ( pp = dn->properties; pp != NULL; pp = pp->next )
> +    for ( pp = (dn)->properties; pp != NULL; pp = (pp)->next )
>  
>  #define dt_for_each_device_node(dt, dn)                     \
> -    for ( dn = dt; dn != NULL; dn = dn->allnext )
> +    for ( dn = dt; dn != NULL; dn = (dn)->allnext )
>  
>  #define dt_for_each_child_node(dt, dn)                      \
> -    for ( dn = dt->child; dn != NULL; dn = dn->sibling )
> +    for ( dn = (dt)->child; dn != NULL; dn = (dn)->sibling )
>  
>  /* Helper to read a big number; size is in cells (not bytes) */
>  static inline u64 dt_read_number(const __be32 *cell, int size)


