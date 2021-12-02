Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CD24662BB
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 12:50:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236506.410273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mskaP-0003RE-Sd; Thu, 02 Dec 2021 11:49:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236506.410273; Thu, 02 Dec 2021 11:49:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mskaP-0003PJ-PU; Thu, 02 Dec 2021 11:49:13 +0000
Received: by outflank-mailman (input) for mailman id 236506;
 Thu, 02 Dec 2021 11:49:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mskaN-0003PD-TH
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 11:49:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbd57d4b-5365-11ec-b1df-f38ee3fbfdf7;
 Thu, 02 Dec 2021 12:49:08 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-5NJi43zbNBy6gg37VQ3Icw-1; Thu, 02 Dec 2021 12:49:07 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6174.eurprd04.prod.outlook.com (2603:10a6:803:fa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 2 Dec
 2021 11:49:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 11:49:05 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR10CA0056.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.17 via Frontend Transport; Thu, 2 Dec 2021 11:49:05 +0000
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
X-Inumbo-ID: dbd57d4b-5365-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638445748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vqa1QaGYbNFu5AzPmjdvaUHMTfQl02z8cX6ZFDKPAVM=;
	b=B9gpDumhxlJLpiifUTWiG92u8wqhu1jmQv9jzpZmFRyOmYGPY7llRipThOyXwXCzomYttu
	2r3hFmPjjt9pQe98xl2f5m8UceiA1xBkkP9X8DoouVUg/N3Zyz4oxIQsWjrX3YlqGkF96w
	KoZ7jBG89nX3mGROUbnsnhburHDh/38=
X-MC-Unique: 5NJi43zbNBy6gg37VQ3Icw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbTcz2nUeqy6TUvPt7xFEI5mJLrwE8ii1iOzMvMnKsq0jHQ8tZ4yMiVymzxz0VzfWglO7sz8JXvzQAr3fxXYL5U7olersyGA8UB/FR7XZOhIOSyn2MSuPjcn2EnuLp/jZkOPRXQdg1Nzm21AHmvdI/kDhE541HhWHnJwq//OYJI6WA+ccGoFTODK8uEWwpb2OUj2Pw7gCYzOAd3Rb0Pq72rnPfCIwFGsHLriwV1BGPc8y5ZSgNzIp6R9EfulZUTyQ/DEbNbPGejW7RwieeAIqmOfnGFzMTEF/pk6sk6rhVm+nFJ6Xvw5f5YTaHR5x4qA4S4XK66CSIHEHJ3XWAWUGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vqa1QaGYbNFu5AzPmjdvaUHMTfQl02z8cX6ZFDKPAVM=;
 b=dEheIqelaCm3cEE/V1f6QhbODGMvls0vU3DelRaMwZckhG/5t8IXCk05nusyteufJWFhOcROHwbOAGO9CS87glRmsopXzdhgT75pqLr02MX2UqW2ieIaTqa+5wzseYdDthXJotDY5BGQ1eKyZBpW7wy1MkGqsvdCwNHKCH88AAh1PK/MQh5iEP1YPoT1LFghC1mtOgUdQkCwskn0dAGaaFf++zV81Uj867JSq6e++OyU/wpQQKQAJ9XNro2nmkNx1CLxSwYOaDZP9Vjt2lkHMJUKiTH6KjCskdxwHHSHQ1RNxflr2zimiec4o30dHxn2SXI+rEd89o99OLJGOGv3Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4615dde8-fe24-020d-0432-6935e9c0c9fa@suse.com>
Date: Thu, 2 Dec 2021 12:49:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 3/8] x86/boot: Fix data placement around __high_start()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211130100445.31156-1-andrew.cooper3@citrix.com>
 <20211130100445.31156-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211130100445.31156-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0056.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97782daa-f5bf-4b8c-296f-08d9b589be19
X-MS-TrafficTypeDiagnostic: VI1PR04MB6174:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6174C9A29897736720D4FF55B3699@VI1PR04MB6174.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lGDU3PdDu9H2IG4Bk4HpeHgKffI+k4mqbhiC6JL/JE1XLuvNgyI+fyZo3K7fxgKLOwqOzAXBKiUclcohHNCtGl9czE4YaG2MK3XOiHJrFeNP29Zol0UZ+2hJLLEUvl5ERSn5ROvoFUlCXrtzr3L9GiwaqWaBFltf8wVewWk4nAoqTUCldTogDzXuD5fTkRIPN2PABG7a5astT8LUJyQDWDqb0wtpd8dvp6bI8nFgvm/yxukpjTUE7nADE8WgNn/GkrGBE6OdE1YmsglrBkgWYZ6f9MWx/weV6ozDJ5S2eSSyLi5pbM61o7jnzhk4o2+MkiDkz5MPnrzSbaH4mbeCpJ/Es0dT0ecE9c7Oo7sUt6t67hJLVc+Shbk1gjh2XAofIoxdbjKEtgDczkji2hwqX9DIWp83lXCMoytHFf9e7wjalKPxZ46Yp+u2IXaIMb3O8YCVewPPbcw/B1xKYlOH2hfuJpc912zK4NYl0g1N8a9lfF1yR3TomDCPI+uQ+1/ApjdWw33/HwBp9r6ZkXXlRGnJiVyIf6JV/zIG046VDaI13aGBQbcN6c3tIb5NhUlYWLbiV6NaWiuzTw0nAI7gD4es3CeEHvREIfmM2r8y11MM9gYE8B9PvfkdZhcHycbKASytNsshOByi0XHGZjDhL+wiIys5NT56qb+9kYDsmrf143L08TdgK3LUKG6xG8u8l83gyjpFUXGDlQPriPvsdpM80U4wKdlw9Keeg/EVGQenjkIutY3lVJdBX/TPJK+/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(4326008)(2906002)(31696002)(36756003)(66556008)(8676002)(508600001)(2616005)(5660300002)(66476007)(53546011)(86362001)(956004)(38100700002)(54906003)(186003)(66946007)(6666004)(6916009)(316002)(26005)(16576012)(6486002)(4744005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWFNZXc0bldQYTdHbnliR3lvYkVQdXk0VjZxUnJmN1QzRUpPZEdWZ0xZVURq?=
 =?utf-8?B?WWVYYkhTN1FuWnFpWlZXSTU5bElGY1pGdGNPTk9IRmtyWmJDTWVkcTFTQncz?=
 =?utf-8?B?MVAxbVE3d3JyeVp1QVhXejhQNTgyRHNpTVp1Q2lXT2Q3WEVscTBJT0VlTjNv?=
 =?utf-8?B?TGQ3TW41Zzl4WmpMUUlBODc1eWJQTllPcCtEcCs1SzEwVlo2eGlpQ2JUODZy?=
 =?utf-8?B?QkVBT2hRQ3pEOFJleEhqOHJTU2l0RGJGKzhCbXZDR0EzWWdEQmhZS3dLWS9i?=
 =?utf-8?B?L1Z1Wm02cWJ2SWtIT0VvTC9lbUxIMkhGUlRyMDRWa2dadmdjNzFDOTNWcURM?=
 =?utf-8?B?WUltRXpuU2pUb1VWU3BQbTJONFJ3TXhFVUZQQ3BENEU0M0g0dDdzbTlzWFNO?=
 =?utf-8?B?RzFBd1MwbUxwczJ4Sll3YXgrbmtmck9FYWYwN0xkQVNqWFhFZzdLTUI4N3Mv?=
 =?utf-8?B?T2pSdnpPdmMxck11L1piM2ZFSWJyaDd1SEdLM1RSZ0poSTd0TU1MelArUi8x?=
 =?utf-8?B?cjBWVmxtRkRnTk10eHRRbVdZWllLdHNvL1NZRWpGS05MTjVEcHNhc2MwWXNl?=
 =?utf-8?B?VTZXV0FySnd3eUFSQTdmaVdOL2ZGZ1FUczR6MkFIcjdUM2J0djRtOE1sMlNE?=
 =?utf-8?B?N3UvVkk2M0NlcGFCY3RnVGIyZ0RQR2IxNWJEV24xZVZoMmhDblhVeTlIZFVo?=
 =?utf-8?B?amZSR1lEUklzOHUzSXhQRStheGJubmVqRGxiSW1odWVKcWpLeTcrVU5pak9U?=
 =?utf-8?B?K0s4VVhwbXBVOWRpaEN4VDlQR1dWUEdwR1pCaXN0YTl3Q09SemVQcFl5SU5y?=
 =?utf-8?B?VzJ0bWNJeUswSEJHdHBmT2JaZXg2bVp3RU43YzJ4L3RGN1VWaVkzMXU1c1ps?=
 =?utf-8?B?cHVIczNVL3N2bHhTSDB5elhLSU9zU3hlazJra0tVb1JXTERxNTRrd3kvRXNp?=
 =?utf-8?B?bklSRDJ5UXhzR2ZGUEdHd1c1NnduU29ZYVVYbG0rQm5STjJ4UENvK2dvUGl0?=
 =?utf-8?B?VnZCSlBjbDZ0a2M1RUJ3anFJVHIvYXNjR0hEUnFYbFBhaVp3WEtkb3BSY3dJ?=
 =?utf-8?B?ZWIvMDZhR3hoaEFpWHBJb3JUWDJHaVhsZjVrVW1GT0MvT3BCdS81RTltRk4z?=
 =?utf-8?B?T2NJSlJiTUN4Ym5MajM3dUhHYk5na3pFd1BqaTdkVHNyTWoyOXF6UFFYRXE4?=
 =?utf-8?B?Sm5VbUFEYzZwMUlmNTk1T2JCU2g5ZDNOZmVQNmpzYm5rWkZBd0xXZ2dMRnpy?=
 =?utf-8?B?VFZnWnlNNDZVcXpOM2R3K0VuYkY4RTAxYUVUZGpDcXkzdEluRU54eWE2a1hq?=
 =?utf-8?B?YllMd3BQck1XekI5Nk41ZGhUZ2VyQ3gxQlg5NE9IQzlyL0hkZS91L0RDOXg2?=
 =?utf-8?B?MzhrMlYzZlZpWHR0MElKWVhGSG9OMXNMWU5SWGIxWTlYZXR3UTZhSUIxdFNr?=
 =?utf-8?B?OWNJc2lXZkVNS2liYzFFVGc4Z1E5UW1GeGtYa1FTOVRqeW1ac0pIZXNWaGVN?=
 =?utf-8?B?WnQxSmNPYWl5KzEzTVVOcjN1Y2dicnprY3h5WGxLVGFvaU0yYlYybVZwb0tI?=
 =?utf-8?B?em9ZNWJVR05UQUZ1eTBHeWd3NTRqNkpPMzM0NVR2aWlKZmxnY1hqeDUvY3cw?=
 =?utf-8?B?Y1B3bHlRU1dEYzZSdUJobHdsRWFTNmt0VktIWmdyK2JUTGd4Wmpla2RidVNj?=
 =?utf-8?B?ZjFmWUpWWHMxaFdkY1B1eGp2a2dtNCtrOGV6TXdOQ043K2JtSUNpSS9zRHdP?=
 =?utf-8?B?UHhZL0N4dUZnelZUa040WTl4ZGJWbGZ0WHAzcnhCRk9CY0JBdW80WXlLeng4?=
 =?utf-8?B?YTZnb3ExUnl2Si8vODNYU2hob0VROTlrOGNTazRxN012eUEvNEFLRmFyTlZZ?=
 =?utf-8?B?bGxyNWV5LzdVRmUvQmlSRXdlV0hZdGMyYmRQSmxMOWFmT3NMeVluYmVUNGZi?=
 =?utf-8?B?bWR2SWM4RzcxamM1YXl3RytGMWFKNTB5YktNbHR3SURYRHBTcWs0VlBkd3RD?=
 =?utf-8?B?cVpQbEU1RXVVRTZZZVFjWVQ4OUt0N2w5c1N1MG83dThJSzhPdWJxYnNRcmJV?=
 =?utf-8?B?TjA5OWlSck1HUlZOSWRIcjBPc090ai9OUG1MMlArS2dML0JXOHU3R3l1aGxY?=
 =?utf-8?B?ZGQ1MmtkRU1HN3BFd1UrK3dUTkJkTmhOaExjakZ4Y1RUbzlZWC9iU0d6djg3?=
 =?utf-8?Q?1G1R99suWtBbpgSv7++o2Do=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97782daa-f5bf-4b8c-296f-08d9b589be19
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 11:49:05.5252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NOVHSGNX45CItcg/aim+DaTde0R8rku8KT9YbWQH9dkHoSq5yhxO68JKvxQAEtH5jWFag2p8EbRlXozNIiIoQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6174

On 30.11.2021 11:04, Andrew Cooper wrote:
> multiboot_ptr should be in __initdata - it is only used on the BSP path.
> Furthermore, the .align 8 then .long means that stack_start is misaligned.
> 
> Move both into setup.c, which lets the compiler handle the details correctly,
> as well as providling proper debug information for them.
> 
> Declare stack_start in setup.h and avoid extern-ing it locally in smpboot.c.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Nevertheless I'd like to state that defining a variable in C when all
its uses are in assembly seems a little odd to me.

Jan


