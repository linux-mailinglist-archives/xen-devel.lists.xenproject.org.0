Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE79494FB5
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 15:01:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259065.446794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAXzX-0005AX-L9; Thu, 20 Jan 2022 14:00:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259065.446794; Thu, 20 Jan 2022 14:00:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAXzX-00057c-HX; Thu, 20 Jan 2022 14:00:43 +0000
Received: by outflank-mailman (input) for mailman id 259065;
 Thu, 20 Jan 2022 14:00:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YGoM=SE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nAXzW-00057W-Ep
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 14:00:42 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59cfdb2d-79f9-11ec-8fa7-f31e035a9116;
 Thu, 20 Jan 2022 15:00:40 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-efJ8GxvjM6-3RN71HmrO-w-1; Thu, 20 Jan 2022 15:00:38 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3966.eurprd04.prod.outlook.com (2603:10a6:803:4e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Thu, 20 Jan
 2022 14:00:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.010; Thu, 20 Jan 2022
 14:00:36 +0000
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
X-Inumbo-ID: 59cfdb2d-79f9-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642687240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Pn8MUYECdd99UlXTjh8FIDsdBFCYTiXsFNaqwLg0X4I=;
	b=CHO5Mw9u5KlIvEVMi51bgTb9LN61Y0ERsZwLPniSTXWzUu2yZX4p3kH9aWm18UJ1SsfnGr
	0M8UPviohgoC9NePO57S014I+rlRht4z+PgRJ7FIbLDeNgIyw+dsKtaqxSJO/grVZp2jTQ
	z+HfrLO5rSPeuT2AkrU4pr4NZ81dG5E=
X-MC-Unique: efJ8GxvjM6-3RN71HmrO-w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GHElwSa2TZGHAuUSrWi5YW8X/lQC47SP9AuCUO8wOBc0MyRn52louegpAkjQ8Grvh5A7RNcys6Jmxe4rMr6+Hkp4h3sJ9OA0DYzLVtn/M68ns4rVsj6k3ZHPy/bmHpk/xb0e8/1CxIWTcYdmpnFBasy9GKyILzxp365DdboXuFcPz0fGs8fS3Qq5MucthaFngQIrMtBBqysofqISzbqeZLaB8uRsUzmK8qiJxrhxRMjEOMnjUgZVSsIS4IbIqH+pPU09vhXnPShw3MrU9AFk9pja66kBioNw0adWJFMsskjUQn/wCj7b9c3PE/58JW/PdD15OT8ph/67xSWpEDcNwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pn8MUYECdd99UlXTjh8FIDsdBFCYTiXsFNaqwLg0X4I=;
 b=ZVim81nz16VsiYrJupP7thENk0aS9Ld+uHPf4j1kXWiMpZNxgzX0ZCSpySfMfGuGGqoHhTkJjRpAmAjhptvqnNSA++56IgopfI766QaHqJhovYrSX2MQ2o79R9rtSE7j6Rk/gdx1l/ERJH06OBKQ8FnKqlAVr9sFLpxXDjv0IifnflNJtoUqGKo/tC80YJzHx5P/aDg7Iyzc7LLUfmYvFBO0lHQgHNlVjiD3FZTdtc3JARoW4Ok5mJLEEM4KxeP3FhAj6eifVkimxS6l+j6uWa6ZsmuhyOP9f+fEoF1bWYacchG/DNqIne2V/60NPn78Fur4YWgPpvs5kOm/CHfzPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <568cb6dc-127a-9c8f-0073-2df173d4677b@suse.com>
Date: Thu, 20 Jan 2022 15:00:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/5] x86/mwait-idle: updates from Linux (and more)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0402CA0012.eurprd04.prod.outlook.com
 (2603:10a6:203:90::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15321522-c1cd-45ce-98a1-08d9dc1d3bb8
X-MS-TrafficTypeDiagnostic: VI1PR04MB3966:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB39666C7B4155E021D7DF558BB35A9@VI1PR04MB3966.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xf7P1rpmw/PUTszZZefTFG1XXHllCuMx4jn3qaFUqRL7fTGWFRTCBrEg7wdV2sK4GCeLg7ZCCixSJtuaIhyV1UkZXTC5uRNb+ZEjpuVCxMaN9dtBIXKn6DtgblDauM5avZgxM+ju2q6ManmU11byZ+pxUUYaO/C8XWUp/reR83TKu6Ao8wY/L9jqhGkR9YkCT3wHYR3fmHtTGLWt7T6i0UZCjZKcQ1fFLYDmYYctbIV0eAQ0VDmhwJdEwL6RSxQxzM2M/v447kEpapqrZr01ejj68Wv7Hct4huKkaafIuh0DyiwspgGRDCrNK/Ja5H4lvXBV8IMsR9Tavs4mQ1x/pLO8xx6XkvIg77qPgHuL9ISyYpKGVTmwg0g6TyFfcwQRe6iTwsAMFVOQIHwzwSbb2KTFY3K9SQ9nXbRKYRd+KDNZsjhQxJBFsNTZaR9aBhxDGzBttXm9W7RAhEVc1MwLfx5SlaoWT6uRvH5J4h0mHh+aIagef/YJBDVA4L129iHXCb2H7cX3MPMqzdZ29hkytLCLaS2j5YBYCOYf+6AS3Jh/jolsjMUPppQCYCXq66r8OQN17kk8tG9ZDXdkgKdea8WWVncD5AcL+PvY2Xy6o80uF92m/KS2fnBOGOUS3bAp1RNmX17AmQwQDXEqU0MoHoBYNqz/0pOX642tSRjUMEk+S1+jRKZjE77rKVesqHAbQ+byXiLjPBFqBnLuzmG2l6/5KlObbjb8wUXW3/ggTRo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6512007)(26005)(2616005)(15650500001)(38100700002)(36756003)(31696002)(8676002)(83380400001)(31686004)(54906003)(66946007)(4326008)(66556008)(66476007)(316002)(8936002)(4744005)(6916009)(6486002)(6506007)(86362001)(2906002)(5660300002)(508600001)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0ozcHZBbUdPaUl2MVNmVEgyVm14TlVUaUVmWTE1QXJaTTc1YytLOTBRWUhr?=
 =?utf-8?B?SDJzOTNYYzl3Rk5BUkJQMWE1M1pYakZacVVkenU2dWUrT0FvMGRUc0kzZi9F?=
 =?utf-8?B?T1Q3L0FlL0pCSHA5Y1NoMHRXMkw4Q2w1Ym91SE5ZV2NRZWFoZnh3K1R4MlhU?=
 =?utf-8?B?QlJFSmdhOGtJa0ZYK0ZOdkEwUE9Hdzk3d3Jlc3pTRWNjdEh4Y0VnMHQvaDR2?=
 =?utf-8?B?Y00vMFNrUEtFQUVrUnJ5cXBKWnE3SnNPUk16TFplRVlLRmU4N0FVZWJoVTJ0?=
 =?utf-8?B?OU5RSXFnaEJiaHBWc3JkNEJiNmdvK1lhUE91dXAxRTlrNEQyZDRNK0pwcU11?=
 =?utf-8?B?SDQ4N3UwNXk1Rk9YV1IvRTBMRG9PNU93QjJOQnpJeXVzL3lUczVsSkFIZGYr?=
 =?utf-8?B?aWRkSldQQ2IrblMwT2V6Unhzc1AxU0ZqcGJJbldlMTMyc2RTZkN2ZjhNZm1y?=
 =?utf-8?B?Yk93czFHK3ZEUjlrWE03VzV5VVJZUUJRUjhQZ0FoVktIcTdpdEVCajFtcTE5?=
 =?utf-8?B?b2g0UGVoWlRlS2VGR0Q3NWRCQjh6SVNtcnR3T1JEa1NnVGhZMXB6T2JReFlC?=
 =?utf-8?B?dGlFNFR0V3ZlR1A0OXY2VU44K2N6ZW9CeWV4NTEza0s1WTJ2cWJlMWJpK0dl?=
 =?utf-8?B?YXF4UU1KMTg0ZzU5Y1JucEtCWDlucmw4cnhYNERqRVdEMXZxUnNiaGtLREVj?=
 =?utf-8?B?TWpqTkZ6SjZSMUp5OEtxem43SjhwbWhMd1Z3ZFRZbGVPWk91SVZscU5La0lX?=
 =?utf-8?B?bW9kVkxCa2tPNW0rQjcwVy9BdVd0OXpVcXBEVE5WWERNbDQzSmU1eVVUOHpx?=
 =?utf-8?B?ZUMzdGo4dmJWakE0WWJ1Y3hsbGtzODlJL0c4N1pEWW1uRVBMc3dxK2JmWUp1?=
 =?utf-8?B?d3VucytSSkNEMFJmNWhxZzc1N3Y2cW1VTWxyeVF1U2hOeEU0ckg3cXJpWHFi?=
 =?utf-8?B?UHJ6dnBWdnZZODV5bzNPSEVSUnR0WU03NFF5VVhnSEpoZTY3VGZ2ek9MOVVZ?=
 =?utf-8?B?Rm9yNU8yOHJZOHZ5Vm16d2VXMDREVDBLdzBhU0xnS1lmS0lmbTVMUXJxaVVY?=
 =?utf-8?B?SVBWSVJraXNKZGpVcjVYUVZuN01aekdKQVkrcEJYUFNCWE9ENDI0MG4vU2JZ?=
 =?utf-8?B?djhVWGZaQ2hiQ1Y2eC9QeDAwT3dNeUZmWEpjcDdxMmFxRmtCZURKU1FZcDQ3?=
 =?utf-8?B?b0l4WHZOc1c5MVhTNkVUT05zenBNWmhXTFQvbEdiajIwd1h3dkdQTXFOaGNU?=
 =?utf-8?B?eHJkZFJRQy9Vay9ZT0MxTWdEcEkxeCt3ZC8rU0hpZWJ4OWRPNGt4dnd0YUxL?=
 =?utf-8?B?SWhhZVgyaU5aMUVCajVKaUd1Vkw2eFBHeThyUjkrN2dDYnNKcnhTR3JsUXY4?=
 =?utf-8?B?a0tZNS9HQm9oYTBGZklQdTkrdVN0akFlRnpqNFpPZGdGZWJoYmhDNVZFRWpN?=
 =?utf-8?B?VDAwd0h3U2c3dlcyd2dEMGlPaElzUEM0VktEMEhpcXVQemx2cVVxVUtiQlFK?=
 =?utf-8?B?VEI2ZlBwWkR5TW9IZERLMFdJcEJyNVJHZjZVVm92RUwrTEFxNmQ1cERNRzJo?=
 =?utf-8?B?ZFFUK2liWXBzUEpVOVpNT2FhZ3dDT0M1TVMwRFl0SEFIRzY4RTV1bEI3MUxJ?=
 =?utf-8?B?N2dncXNrdHRTYUFXSEc1dldkZGc0cjU4LzB0aU55S0RreWdhRUVlaFBtUmpo?=
 =?utf-8?B?Vys3N0gxMVJLaTE3bHE4RUJuVzMrVGluY3FOdnlXNi8xcjVucU53LzRmeHor?=
 =?utf-8?B?QURTMk5MUDRDSW9tUjVlRXNJMW05OGpaU0VmSThiRCs4OXBJbjFoY2w2aXN6?=
 =?utf-8?B?Z2FkNkpWZm4waUZjWm1maHJUMGF3R3lEUWl0aWpQV3ZPZTJUZkdKNHUwSXFR?=
 =?utf-8?B?RXE5UFJOOGdpTXJ5KzdPN0pmV2xnY2xCSGE3aHJmb2Vud21vZlpjNkxXSUpx?=
 =?utf-8?B?K1kwSnY3NTdFd2puamlWalp4RHlwOTNHM25sbkNyQXc3WWdBUzdjRk5xRmtw?=
 =?utf-8?B?N04vN1BNVklHUzFHaFhLaTVHd2EySjdBR1hONkY2UE5TV1JBR255NWFqdWZy?=
 =?utf-8?B?anAyVDc3SlA4VWVUaG5LL2lrdkF0ZGxVT2laSENnTGkzcVZVTGEzM1ZCV3c5?=
 =?utf-8?B?cnk2K1BraWswbGdqVTdNYzdlZ2x4NkZDd3dnTmpFNVI3RmpqNnZFSUkvOE96?=
 =?utf-8?Q?VND9NdljYXljYB8p+11XxU4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15321522-c1cd-45ce-98a1-08d9dc1d3bb8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 14:00:36.6410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HcPPvv5PDKMI9DweWFQ3ENQVjd3cjuKjLbYOksUNc7eJAb/9qieuzn71W3VdG/cisYFVmRvBd0D4l8OyT4J0Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3966

Besides the prereqs requested to the remaining patch from v1 there's
yet one more thing to consider pulling in (RFC for now), and one
further custom change I'd like us to consider making (potentially
even going farther than presented here).

1: stop exposing platform acronyms
2: switch to using bool
3: add SnowRidge C-state table
4: enable interrupts before C1 on Xeons
5: squash stats update when not actually entering C-state

Jan


