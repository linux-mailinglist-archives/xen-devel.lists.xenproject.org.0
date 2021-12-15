Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E329475671
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 11:33:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247316.426439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxRat-0006MF-BR; Wed, 15 Dec 2021 10:33:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247316.426439; Wed, 15 Dec 2021 10:33:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxRat-0006J7-8H; Wed, 15 Dec 2021 10:33:07 +0000
Received: by outflank-mailman (input) for mailman id 247316;
 Wed, 15 Dec 2021 10:33:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E5lv=RA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mxRas-0006J1-8m
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 10:33:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62c4540e-5d92-11ec-85d3-df6b77346a89;
 Wed, 15 Dec 2021 11:33:05 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-M3fWBv74Mya1BFhAjLtbvQ-1; Wed, 15 Dec 2021 11:33:03 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7038.eurprd04.prod.outlook.com (2603:10a6:800:12d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Wed, 15 Dec
 2021 10:33:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 10:33:02 +0000
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
X-Inumbo-ID: 62c4540e-5d92-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639564384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fNY97RAWAvq49SPTtqhfLbGCOmtlRioiKDhBUo1Ak8Y=;
	b=VIM5UBf1pQOSekriDTo5OnOSg0Q2DYYWW0w3LiVTXcJS+YFQ5Xq9unmOhddrfhonba9Dj4
	Lzb6W8vTrh1XM7qdM8hUOqU7Rys6pfPaADRbcMyrFdLohxr8l3bHSujqrY9Dzt6mKXvn4u
	1w/VMmQ6190PwDfBpM+tn8DYgJei3m8=
X-MC-Unique: M3fWBv74Mya1BFhAjLtbvQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAK28v7D0zIw+kCvuWgAIjrWGnDNIrI2JJP7/N7FwnVRYEHHSvGqWTSjSIm/5OfSFH5eTpufAGKDJc0Wda5tEGyiT4dAdsNtSMm+UwR18xaANLJ/O4Y+6GDyCOsDxpnfgfJUUAVeIefJAgRPzEXucq2WezXw773R+my5WC99YhK8bOwbcA7h1YlNS3RP8TSJV5K9vqjva3sCuMYdv7pK5BKGCNGct2det3fJh5VCG3PtN/N03DAwQgvj5nYtRFHoe0TQBWJ/t6biGJBWrAxBynn/ebVVK6J5vBq1q9Zo6Z5Us0cjyJRlJTuEZqp2gv2HDBAJh4pbCz0ZG+JR5G7c8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNY97RAWAvq49SPTtqhfLbGCOmtlRioiKDhBUo1Ak8Y=;
 b=OYKZ9RFxP5MQ2uMw+Jxq+Yb57KhMGZpmO3xYjhC2cwgqiM5mdfVAG365Sr1QEUVCR+QDgEgDxglxpG/nJxrFzU2l+6N0WDyApWSL/3Dqc6s7S1Ea4HtzzW+VYwiz5BrW0kglffOL6v3HSBHwp8CYhrZMFajpMdHCO0nrywGeQogCZVqc71Vb501CtzxAUV3Ci85sP7IN+/frC4BtZlgeoKNLJkdXF6Rn5HijG0lnO3ZzGBWIyppmEZ+Fu/55WVyOvlsKBoEPkeCrySgzoAokNX0pqbiqpDur1H0TMBcd5VVSHi/w2romRSIaQg55Ww3ytJxPxSHMflipgVq94Vl/Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6e54f971-84c3-3635-12c8-643b619b2b53@suse.com>
Date: Wed, 15 Dec 2021 11:32:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
From: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] xen/arm64: Zero the top 32 bits of gp registers on
 entry...
To: Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>
References: <20211206142032.27536-1-michal.orzel@arm.com>
 <f3573439-4893-440f-54e1-fdeba3eb4508@xen.org>
 <dc114877-b9da-7a5b-260d-b9438cddd777@arm.com>
 <b7a53384-39cb-f368-f39b-9b560336226b@xen.org>
 <6ab797ce-86dc-2c32-1cd0-417fab7516c7@suse.com>
 <73913bdf-7449-34fb-b86b-662774cb3e62@xen.org>
 <865fb3a7-76fc-24da-e07d-c6e59e3e1abe@arm.com>
 <3aae0020-938e-d5fe-7d7f-d5d1c8335a24@xen.org>
 <447b6c54-7d0c-132f-6202-c1ae7fb16e5d@arm.com>
 <871bda7e-3f94-a5bd-3caa-16b0c8f6d693@suse.com>
 <87080c9d-803d-608a-1c5a-2102f014d2bc@xen.org>
 <1fcc18d4-70ce-12d1-6d54-ae82e511a4d7@xen.org>
 <040a1871-08ee-00e9-b46f-ca4854e8a541@arm.com>
 <82557218-539b-204a-a1a7-7c796a2baa8a@suse.com>
 <9dc003f8-4dd0-282f-61ce-6ca74c543f20@arm.com>
Content-Language: en-US
In-Reply-To: <9dc003f8-4dd0-282f-61ce-6ca74c543f20@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0016.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31895e42-28bf-45a3-4bee-08d9bfb64595
X-MS-TrafficTypeDiagnostic: VI1PR04MB7038:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7038F0E21144F28213EEF000B3769@VI1PR04MB7038.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6Tw3mtNEioUQ2d9x7CLUBhR7pxDc2iHcS/WovX64qg5D/E//8qDahdEfXxto9Tc2V/Wq2vVKdZDrwBvcHxoJdRqGSnQ6e23wSXDUiSR2q467yeiv5ph2/BLFg+oKRoZkFb+zjQdgrzszOuCV+IiHH9/j01iMPCrGIUSOIfz/uUBM5gDzDagyNRott9owyPiLgDY+Lk+cJQKPF9CGcPaXuNdw1NbX2r3jTbXVKGJUoEVZI56xD3CHDff1Hhggac0/S3IZIwa1ctcaO4ifxLoRuQF2Vct9+yV4gYaSO9a35u/vFo8feN9MlISc58tLth26yRNKin47oE6CQXpH0c5gD5RGmIsWN99yigR55cHjiXQGp647Iz4py5MEu3idm+u6sKBYdvY7sapk6VNX9GQdGLO7F+ZQ8DuTemZzBqEWsiKYkueV+aWvQsxQh2QQG3SfxaLssNooG73bluFX83xdze+fCtvksCRFzam5mKNn0nfdvGTMkL/dC2mHgvjfz/EFJeqPpH14X+xFd+5a5qcZrtqgHN83tw68usl/jSQFPhmXhNLLOmPYGg1Mq9GOzRykiMjtmdw2hLLbDqkwRQcfhkJaKuIG5Gt1DqZfeupFySkMOPAuJvbN2UusdfWiUgzYptl+yewVKQo6LHETN/RHJH6NE/k1hNamAwDJnHMUr+2aajDrWdgbGCrJGR99imPkUmlh7FkfFViM/zU945hg68sfy6cFP4y3J/L/UsWKopAxBytAgLQPtumxLlPbMcp0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(26005)(8936002)(38100700002)(8676002)(86362001)(6512007)(66556008)(6486002)(66476007)(508600001)(66946007)(83380400001)(31686004)(36756003)(186003)(4326008)(53546011)(54906003)(4744005)(6916009)(6666004)(6506007)(2616005)(316002)(2906002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzFTaXIwaXdRRDdNRmMvK3A5M1JkSWY1cS9RR0p1NUp5eGljUkszZjhvcWZ6?=
 =?utf-8?B?RndPUnhrcDNMZU9JZTVORURiaWJ4V09WNGlYaE1EZGJvZjNnb09VZmJMeWxN?=
 =?utf-8?B?dFdTeFdTMGFCdHpJZ1hkeWJYdDF0RUJhSGpndW44Z2JDaHVNRzhObWdsVzZO?=
 =?utf-8?B?VFViNnZhTW1lSklOdE02d3BBS0YrbGNldHpFWkZFazRoS3dkSkJqOXVnRFpz?=
 =?utf-8?B?b3BPWWJrZitRcGFCd0VTZEJsMzFZQzlhUnlqbERIbzJhNmxkaWU5L0UxRFM0?=
 =?utf-8?B?ekFpaFo4T0RMcmhKTkNqRHNDZGhQd0doRHlVRExhZVpZNWdKNEdidWZXTTFh?=
 =?utf-8?B?aHpwM0MvdnlsdlA0Y09SY3JadnNDRHg5TVhRRnZVbXhReE0wTGt3NjFyNUR6?=
 =?utf-8?B?NUh4SnN5ZXpTSTJ6OWdyQTBDbFZQeldrV3NiTngyd2p0cnRxZlR6amJhWnk0?=
 =?utf-8?B?TlZLZGJTTmFCMnVFdzRQbno3bklsNHRUeTh2NWJBYmN4bjUyaFdZTERoNllM?=
 =?utf-8?B?TGc0cTJ2SkxxNm9DaEZkR2ZPZUpBV3hWaytKLy83cFgyWnRyVm5pdy92V3d0?=
 =?utf-8?B?U3JMWnJOd1FWQkJUM0VsME5seG9YYkZXNTBZZzh1VlhEYjJVWmVCYlU5V2Vq?=
 =?utf-8?B?d3N2bEV4emNvVzZtYm1aOExKNEpCZEorUFB5bVlwUmJDOVJYUzJtZE9sNmJm?=
 =?utf-8?B?YmRFM0E3THVBMTB4NURvNThhQUpWcHBJRkJsZk52U0JTdmd4cG1mRkpOcDRu?=
 =?utf-8?B?S0RpZGZXdng2bmJaL3FlbVFYMk5ybndHTFN3aFIrMnR0eUNKcGJFVm1Pb2dx?=
 =?utf-8?B?dmVpczNYdmVBRGEyVHJaUHh1aSs0MkYvT281djNiTHpoTG9LbGdBUVBaZit5?=
 =?utf-8?B?Sk5Fb1BEem0waHFlck1semJBVnNYM3BiY1F1bEp3SlRLUjhKN3YwOTkyTWcx?=
 =?utf-8?B?a2szVE1NZWZKcWdxTjI3cUE5V1ZkaGYweCtVVFZmaGY5US9IVDdIRmRSN1pC?=
 =?utf-8?B?SlNMekV6ekluMXdkWmNNa1VyeWJSRHJGN1A0YzVYQ3RsY0tzVkwxL2VYVDg5?=
 =?utf-8?B?RHRvYzdDWnp1VTM2U2hzWlhBMkhReSt4b3lIU3FkUGNTLy9lRWFGZm1uY04r?=
 =?utf-8?B?Y0dkRnhmdzJuenVwMWp2Y21QVzJvUjVhTlE3SFhmNzdaUDRHRWZsQnQ4Y3hU?=
 =?utf-8?B?ZjVmcUNOdkUvQW96cHpsTlY1cDdvNlhwY3RIbVNTY3VSRWp5WlI4TnlkSlAr?=
 =?utf-8?B?OFdIU25vK3pwelpXbmdoT0hBVjRkNExJREx3aFc4M0srQkdrNGVBamp2UkFa?=
 =?utf-8?B?R2IwUU5kUmk1V01wU05JSDlpaXM0SHloRml2eHkyNkhLUGZ4RUhMRXFxNy93?=
 =?utf-8?B?UjcyRXRoZGttamtPZUY4SGJ3TlV0djFWZ1dmWXpUcmNLanJEazArYkI0OG9w?=
 =?utf-8?B?N2lVZnlyaWNoOXd1WERNQ2VHV3VwQWZnYWNiSm8zWk1LTzlyV1VWbXJIS3JG?=
 =?utf-8?B?K01xNURpS1c1YjRPUlBDMWpla3hnSUpnZlhvMWtWaFFaMDlPZk1lM1VhWVZj?=
 =?utf-8?B?UWtlV1FWSnBpOFdCRHZxQiswRUtHam1aR2lxRkM0M1lBN0NQaXByb1BTSXpx?=
 =?utf-8?B?bTZZNklHYmc0cU11MkdmQ3VXWEVkTmhsRjZGaVlVbENTYTdzcGUxbTQzY3A3?=
 =?utf-8?B?aW54cjFiY28wVDNjbTcwdVJVQ1ZtSFVMc01CalZVdFVVTTdTNk42N2EvM1hp?=
 =?utf-8?B?c3JOUTlKWkVCYklQZ2QvOVMzWWNDSmMzdmswVjk5a0k3THJMdWpaek1palZJ?=
 =?utf-8?B?dStPWFFPZjZtMzdaSGJOZ0UxNnZEOGhlak5HU1VBR05uclpJS2x3L0UzczND?=
 =?utf-8?B?aVIxdm96YWJIa05iU0JZT3dGTTkzNmlvYW1mY0VaYUthemZRa095TldqektQ?=
 =?utf-8?B?VWNRR2JKeDhYdHYydUEra3pKU0ovWVJzbXhUcFRSN2pWY1Brcmtnd0xjRWtM?=
 =?utf-8?B?bnRFVkNlSnFTblYvaTIxWDhMVDRGT0tvUENRQmJCMnJHbU0yTzgrbStFcEhz?=
 =?utf-8?B?cEJtRjJ2R3haZHkyeENhcytRMDdhRjZPOFVBTHBZVXZCQXFNVEswR0RLekRO?=
 =?utf-8?B?UFc5VVNqcmU0QWdyMEdSR0tpNkI2WEc3cFBxMzZkcGJ5Wnk0a2E4T1dpaERu?=
 =?utf-8?Q?1M3YsOZX8vMdObCF8HtSwGo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31895e42-28bf-45a3-4bee-08d9bfb64595
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 10:33:02.3380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6JGLAg5zdottTN4nDTv8dfDAOYoOhnV9608AF0aNhHIgSFQRL0Fd7oAcHxrnKS8tM85n31gszmafVjR9vx0K6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7038

(Re-sending an abridged version, as apparently spam filters didn't like
the original message with more retained context; I'll have to see whether
this one also isn't liked. Sorry.)

On 15.12.2021 10:48, Michal Orzel wrote:
> This patch and the problem it solves is about clearing top 32bits of all gp registers so not only x0,x1.

That's well understood. Yet for everything still in registers simply
using mov ahead of the respective push (as you had it) is still
preferable imo.

Jan


