Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E001539840C
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 10:26:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135882.252213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loMBy-0006fn-9k; Wed, 02 Jun 2021 08:25:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135882.252213; Wed, 02 Jun 2021 08:25:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loMBy-0006dR-64; Wed, 02 Jun 2021 08:25:34 +0000
Received: by outflank-mailman (input) for mailman id 135882;
 Wed, 02 Jun 2021 08:25:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bHXv=K4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1loMBw-0006dL-TZ
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 08:25:32 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 744ac108-af33-4bfd-855e-ddc459c8f8ed;
 Wed, 02 Jun 2021 08:25:32 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-O1tkgl9sPIm4OQOQMC2ClQ-1; Wed, 02 Jun 2021 10:25:30 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2336.eurprd04.prod.outlook.com (2603:10a6:800:27::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.29; Wed, 2 Jun
 2021 08:25:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 08:25:28 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0007.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 08:25:27 +0000
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
X-Inumbo-ID: 744ac108-af33-4bfd-855e-ddc459c8f8ed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1622622331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MGEewtoTLdysqJ/eZQzK7sQhSOLg8c4FGiaByxsHPfQ=;
	b=fJ5cPFfMl+w3KQvH1766HrLcE3ZSlLdFejOV8tti+p1zq2HfUZJ4tbgAJBComomtedfO5X
	RIof2X0uU9KcPp1qIu6+k7HkMLTDYykm62tX5HH7emUDSTcrrrfYKxLLQhZQxNcbW8UY0P
	EHhaJmIsJL7Gmyw+2qpMqvTvOcTxdGw=
X-MC-Unique: O1tkgl9sPIm4OQOQMC2ClQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WztAxJC49dqJYUc0o05AL7cwYnRpNr91+Niu3ICx6wjgbP+k5tlgwcf9tNPcssSFz85SlgPfoHtDmC2aSDvjfBBhzFsXiJVZV4imA5lMzGWHY/GumFPC/av/fbAh9aRFnBEuLFllZcShLOVAQrArkVKGP5Zzwoyu4X/vFSbD8YE+4IVVquve8DBW9lGYkz3IcOouWLqUl7wAexgfhvqccKIAZ8ldsH7ooilcVRdr7dzTfCA/CiwJ3Cv4ZiIisN2h0+hPUT75parJ6OeW+PCcOZqZZbUeNfLX4pjlAWML3xC27/q+PrqaZF4MPJEIvOU0KZYNS34DwRxIEpCoPNR/ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MGEewtoTLdysqJ/eZQzK7sQhSOLg8c4FGiaByxsHPfQ=;
 b=mAF7luLKZZtEz8P4Aj5AZ4a5PMPAE/Pek3bQDp95YcDtpy4DWyFKTRn3JF0N28BDJ0hsCx2dhWq0iJOxbPesW0/8WSdS7dKqWLOd9zGUpn3UB6+9ZpJ6leUPRuZBuSdbHcbPGCDddxPUJ5cyfIkPGtQ3UMBt6+oJQ2aKPeUPwneLDp/N/qj0bXjU9347A2Iaxio7rNcpI106GcS5Y9czedATojvGvo4rx1+7wTbRfRMkGpcrH7WueKqVI72TwCqHwiNtxWFs3CsFqdibzqtnMxZ52gzOqdQIITlkYhvb5nFzYtjn4BdemFJw/JDwF9BGRyMfS6v5WvoczoOD5czT1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH] libs/foreignmemory: Fix osdep_xenforeignmemory_map
 prototype
To: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210601154147.55799-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a5d4f4ae-21b9-9798-5501-2c288a70e7b4@suse.com>
Date: Wed, 2 Jun 2021 10:25:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210601154147.55799-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P191CA0007.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bba8751a-af78-4722-8274-08d9259ffa67
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2336:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2336336719B261E6E7856BAAB33D9@VI1PR0401MB2336.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LUE6snZG2XFRXtE9JtCYuE/26h2BqNEFXCxdm3BelJWLq8KHOWNMem5h6g9FTdmNKXPxmic52X+uwSkogrY36UdTsfIfmmWUxztQb9CC5NCp+WzwhIsKb6K7PPm4hDdG5rSizp+EXcsykX+pzf4IrCmPXwfoIOBtBiYdIkJQyNIaXo7z2p2PsU9mTa5g+bd12ZKrweUqWY99nttt/HWaX3UVYNL7NtEXbHIy6AaMsINTAi0ZclX9eB9A5XKgR2gZdnduyFpCpd+NI7O46//1i0+tgEdzEBUezFQtXeUDMouKvOKDT6veDEXEb+pI0eips5ZM0zq+gLuCfVNvLG1l4ovHFnWMZP8QJV88hTO5OrbU7hFQOEaisMAKy9/7KKOBMk4vU3b2CgdJhApjWUa8LK84i3OfqqQbIrzv2cqueGqjJnHs5yu2PDSUVY0X4Tc6K0OyUoYUj2jn83vnVwrtjiY6pwMVKe8w7lqz7fjJyNkCodEplrkMmqC3XrWx9gy04MO+jO7TBslMhLpZbwzLRlxBziAnTe4CVp1Empgs5rq91hHILOKIuwJsz5qsGMHcG2JAOLy+Tq6Z1Mxp1B6nLPTdcuRN5Lj8c9nh36WMryPgvlLqV1zbPIodU6f7sutALbR4uuJDMgOjGlFgae3OYOOkDGYxMMWsmLL1reiBry/OACFMqhNKEBT0U1YUxQS3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(366004)(39850400004)(396003)(346002)(478600001)(38100700002)(86362001)(4326008)(16576012)(316002)(4744005)(66556008)(31686004)(956004)(2906002)(2616005)(66476007)(66946007)(6486002)(31696002)(26005)(16526019)(53546011)(186003)(36756003)(5660300002)(8936002)(8676002)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?OXl5aGVwRzcxM1VES1dIZWtJclNBTjdLSEZBWU4yMnM5K2d2VVRZRlZqQUFi?=
 =?utf-8?B?WjI3TVgyZVVvSUNrVjF4Tlp6VFZaQk9KZXZGbGhwZlNZaGEwNWQ5OEJaMjdG?=
 =?utf-8?B?QkJxeEV6WC9PY3M5aXMxUFJQVDFXRDJPUnRtelFHQUd3L1dBRkxmeUgyVHZr?=
 =?utf-8?B?RVN1S0t5TkgyRVZDODZmbU92Y1QwU0VhaWVaQktZSTVYcWwwb0xzZ2JRZ2tF?=
 =?utf-8?B?T0NtU2RTVzV5a1VEbmJHeUhlREJYdFZvTkhBRlI5ZnM2eU8rOXAzOEZaY2pC?=
 =?utf-8?B?Q0s3VlZqWTZRZTVqQW9FOEpvWTdtSXN6MFc1YUtDdDR4aDY4V2lWTHF5ak9Z?=
 =?utf-8?B?cmhOZithVkRXbUxLMHlUVkNGUjhQSHEySlpxK2Znc1AyZlBKcXlqVU1mVW9n?=
 =?utf-8?B?cVZlbW12RGd3T1BDRkt5WDAzVTR2STNPM3RWRmxFVGM5cXNDQTUva1hzL2ov?=
 =?utf-8?B?cE5Jck1RWHc3UXBTaUxCdzZra3pBUEFKb2FMM1E0TWxsUXhLR2pCTDBxT1pT?=
 =?utf-8?B?MS9vNkltOUhNS3RuQmJ1Tlk2SzlIaE1HSERIOWtPbFVNWDBCOVc1eGxaRkJ2?=
 =?utf-8?B?U3NYUVlybFppaGZzVXdEdTl5cmljaTZOZFBBTGFJS3ZjOXBRaHhHdDlZSUNH?=
 =?utf-8?B?MGRQVmlObTNwSUNSSkNWaXNkSHZNMUJPSkI2NW5yY0R6Vktqa0JxRHZlWllm?=
 =?utf-8?B?bCtlZU9qWXlvSm1aODU3MENTdzhNQnBsVitpT2QxU1JnQUpoZ2JVbm9oendC?=
 =?utf-8?B?Q0xocnNTKzBmSStvUjY1Q3h3Um43aWJxSnVGZXZjQ3RraTFvaEI2bHlERGlq?=
 =?utf-8?B?aXZTUDg5V2pmZnJsTGZkejgrZkI0UEJ4eEQ1Ty9GQks3SXp0ME5RbWtudDY4?=
 =?utf-8?B?ZmxFNFI2L25jT25vZDN4REhYdWk3RWVXRWlJVHRLd3lMWjY2UExBVTNjYmlH?=
 =?utf-8?B?d3EyTzQxUEp3YVpXVVVJMmY4RTZZZ2VTV3J6WmxrVG1QYUFMV2V5ZHgzVnRW?=
 =?utf-8?B?WVI0Sk9ueFRBamVySm9lWDlWLytNajRIYTZKOWFlckY2MnVWZHV3YjZrMlU1?=
 =?utf-8?B?TlMvREJWVGtuSmU3bjhmQ1kvcDYyQzF0LzV1QmxNeFEwTWZrY29jYnh3Tngv?=
 =?utf-8?B?L1hZUDhyaDZLdGphMzRiV2UvemtpRGpKWUtZT0NuWk9SN3hUbGEzV2hGcldB?=
 =?utf-8?B?bFh0VHp5Y0NBU3diOGJsMXpQdi9sNjNYa0t3REpMckw1SEVvY0hVSVV0eFJG?=
 =?utf-8?B?bDczVGRaYytEcFFBTUxlMGpGeVFJS091OUdTTU04aFJET2hXZW5XVmhpWnBY?=
 =?utf-8?B?eDA0OFlBeXcyQ21lRzgwTXpDbUFsMzdablRjNmtiajJNMXRoVmVtWHVaT1NU?=
 =?utf-8?B?Y0JtcDJvWWcvaUxzNXg3R0JoSW9IMzVML2ZQRFN0VWRMMHkxWjlQQ0hERGhn?=
 =?utf-8?B?a3UwRDJqNm0xR3E3UWxKSlNZK2xuYVg0Y1Y5L09tbm93a3ZKMEhYZHE0aTRD?=
 =?utf-8?B?cytGVXBaSk1FUkt4WHl1NFI4SXRsVkUxUkxRZ0tYN0RKWlpMT25FeDBRSkdH?=
 =?utf-8?B?Vm94andKcFNHOUMxd2psOEdIN0NIQ0FDS1RTVFZSeW03MmFldTVSbEhidTNh?=
 =?utf-8?B?K0gvRVFtSVU4WEplU1NFOHJxZmdLMnA4SnhKT0huK3h2Z0hBT0pWbVFJYmJ1?=
 =?utf-8?B?WXlNZXBMZkpYcVVhd0xsS1VhY2dWMWFxbkdYVXJXS1VabFdZeTFTT0YzaXdi?=
 =?utf-8?Q?HUtlALDcaVQ2dZbSOumP3vTsxk4VHzksTe4Bg4R?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bba8751a-af78-4722-8274-08d9259ffa67
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 08:25:28.2490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VkJCd0eeB1ElxjWB2NQzhq/KT7xJUD0K7HUQxstBo/6GNiHDDyTQ1TOvzOckOAT2CkFM1Ng98HuBWU2u6KdLCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2336

On 01.06.2021 17:41, Anthony PERARD wrote:
> Commit cf8c4d3d13b8 made some preparation to have one day
> variable-length-array argument, but didn't declare the array in the
> function prototype the same way as in the function definition. And now
> GCC 11 complains about it.
> 
> Fixes: cf8c4d3d13b8 ("tools/libs/foreignmemory: pull array length argument to map forward")
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Ian - this (or whichever alternative might be chosen to address gcc11's
valid complaint) also will want backporting.

Jan


