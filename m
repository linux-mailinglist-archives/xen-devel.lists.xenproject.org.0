Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D29B5401D51
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 16:57:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180028.326531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNG3o-0000rb-H5; Mon, 06 Sep 2021 14:57:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180028.326531; Mon, 06 Sep 2021 14:57:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNG3o-0000oN-Dz; Mon, 06 Sep 2021 14:57:24 +0000
Received: by outflank-mailman (input) for mailman id 180028;
 Mon, 06 Sep 2021 14:57:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNG3n-0000oH-56
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 14:57:23 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd050988-0f22-11ec-b0a9-12813bfff9fa;
 Mon, 06 Sep 2021 14:57:22 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-xl1GQZ_MNoeOQNhEmmZ5jA-2; Mon, 06 Sep 2021 16:57:20 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5744.eurprd04.prod.outlook.com (2603:10a6:803:e4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Mon, 6 Sep
 2021 14:57:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 14:57:18 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0055.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.22 via Frontend Transport; Mon, 6 Sep 2021 14:57:17 +0000
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
X-Inumbo-ID: bd050988-0f22-11ec-b0a9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630940241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CNSM9aGdDV9WVXdpSczpiqZ5PzSE+iG54YbevdVOLVA=;
	b=Aj6JQBDKTboW+LnBDQ1PezGm9DKpiSLxcm/cqghdiPBCgbvjO9EHG4bVvaCtxR6MOyus1d
	0MbDiJPnu7NRLmZtpRykwAN02dxbltQ7qcaarQ/RcLiMGsqqk/vfVhKjduXFuJwPtHjm/X
	42DSjQwP1j8weRLCQHnqvKtCIFxOjMQ=
X-MC-Unique: xl1GQZ_MNoeOQNhEmmZ5jA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eoV6waeUU42V5jrePYS3N0ueKaPI4dv65AXSjYxS2ZhBu+8hiHNOY253nED/6BzgH2P+zfCZz+UgCDN4KSoFLRRX5c+JgscgqR6p8cL0ch9nnM4D9h9VstMk8Hcxs3bxk9n9RMsnKr2EdPCYCQSdwQkWctm/s77td4EeAgoTwYhLFa1T8lw9HVkZoFv9SVr6JvaCBV6gb7vQsji/1iG4j5p0d8u0N3lWngN4neynAk0E2f2Fqih7lpNRH9PYPTxPqWI2vjRpyaLWAsUoHga/ngsMyyaJnov7t5nQ7erL3DHxVkMpyO9d7w2eylCeI5Drf2Efcc3ShL4lkp/AvJJlpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=CNSM9aGdDV9WVXdpSczpiqZ5PzSE+iG54YbevdVOLVA=;
 b=Z1ud5JtNboivYcmO8CltTTEyQOyClvUyMP8C8sCUNkUSdZtYNAd2u4MJ9DY0MtAWkHUG6OFBC5X6+NBC+dSfbeD0fSywd/BiHhK/3aW979Oa2ESbWYJZ0Tp3Gxxdis4vKpxu1NMKOiLXrlwdF/akoP3p8B+iOavDkHUjQ9V17hIKNUwR6TA6wk7biimpUrZBQ/i5+Qr8By6dhTpxvz/0do95RIKfy7NJtRlIEyu9K2XEuDnQ5HfbHgCdC6ik42loGPKw/AuDhOZCH56evbGGyV68NJYbP/X7Fyzgnksx+vvJ8csYUKYw6+zXw6wo83LVYmJeA3Gf+b41G/JGVW6jcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 9/9] vpci/header: Use pdev's domain instead of vCPU
To: Oleksandr Andrushchenko <andr2000@gmail.com>, rahul.singh@arm.com
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-10-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <214a8300-e818-321c-7618-185c56684db0@suse.com>
Date: Mon, 6 Sep 2021 16:57:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210903100831.177748-10-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0055.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ddbb2616-ce5b-4ac1-37b7-08d971469f4c
X-MS-TrafficTypeDiagnostic: VI1PR04MB5744:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5744103CEA4B3172531B51B4B3D29@VI1PR04MB5744.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iCKw+/27HlMB6LnhDHuHC3dHURHfAdhZDdl9u0/8aObUrgGozNPCGLMrjMCKlkRZ+mb16B1Sz5Y4ZtHHBWLF/Em7kGuF1rpXaE9hUaYrMHctw+bY9AXRadVxGw2PioUhAC7PsFy6Nh4pSAZt7xGTyMoC0wJIvYdXD8cGTHGxBGSPciT1F9tWXVdaUF0N/zqjOhzl9QBs8pjWT2xnQRhRbZiUQMdEOHFMXUuTxywqI7LoDTftTgiF0Uc27t+ip1XOIHaGUsfIDS5mQeMnAzf6koRRzDIb4Txtol+qPIIvD4TkJpXQ/HUCYklCaAzcFOC5HdwB0u6fjM14jND14yNJP65Mo4yrQqhsWpdqZTOMDHaK0ox4pZf2+6iUKDP6j0JifZooLKJLhXYr03K5phNdymKouIHJDmoKobeVDEpvQNDq+xS06vtt9cqGEhO2No4+AWhRWEt8jU+f2crCaDaPOmMSIVE2PPyd76s4gLrmGMCbFLrKlnrZFUnjFAs3sBDwxTUkDAwWTWpWBW1uAGBVFSwe2LO5JBQnR/cSNwcz6EAcOOhJJnrzi/nL+SGzaUqWuK0bYXHqhscy+T20i8B7Ts21ni89RiGV8l9/gd3V4ptFC/NyGD/FoJajzERCyP5qGYGZZZgKs/a2m9zshVaM7KmmmX4TAeLSNG3ln0AxeWqo7Tj486q3TkaIF2nSqJZBicoZYkXzf40gk9+6bd3E0Cz0TQRY4KcT0cAtGer37mY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(39860400002)(346002)(366004)(396003)(16576012)(5660300002)(186003)(478600001)(316002)(86362001)(7416002)(36756003)(38100700002)(4326008)(6486002)(8936002)(8676002)(2616005)(956004)(31686004)(66556008)(558084003)(2906002)(26005)(53546011)(66476007)(66946007)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2QwdHBCdnlzeHJpRHdNWktsU2tzUDA5aDZ2engxT0Nja2c3azI0NEJ3c05K?=
 =?utf-8?B?NFVmU0pCL2UxOTZKbG9zcGJBR2VxOU5jaWV6SlhQaEJpOE5vT1o1akRuaHNq?=
 =?utf-8?B?djZnZ2ZXUXd4dnNxcDZaL05nbUIvczVvUU1CYWtxYW9MMjBFUkFhWGRuMlZs?=
 =?utf-8?B?N05raDl4bk5OYzFtTlZsVWtKTHFSRWt2UUVCS21LQ3FuQTFOdUpOV1N2Q1JM?=
 =?utf-8?B?SS9xTXZHT1NLVTYwbys0NURiNU13aks3dEhDVTZDbU5PWXdKZWlnWnhydlht?=
 =?utf-8?B?QUhhRmpDcDVUUjlsdEhPRit3SytldW1sMjkyV3Q3bUI3azBud21TckpvU3JV?=
 =?utf-8?B?R3lDUk1ia3pvTms0ZEZDTDZQT0Nqa21ISWhPMXRuUDVwSkRmS3lFc0NzQUQ0?=
 =?utf-8?B?RVZLTkxST1NMSWlRM2lCWUZvdm5tNU9ibFF0WkJoNTJMQWlGSTZnNlZGdjVO?=
 =?utf-8?B?bExmTzdWUUJnTVpWZEhhNlU3RU9MTnMva1dvbW1JZTFDSEc1bVdGK1dEOVJl?=
 =?utf-8?B?Y05pOEU3aEFVV0xxM1ZLRVlQK2lhaXJ5aWxvTFhXelQ0TzBiZC9UNXMweHlL?=
 =?utf-8?B?ZVBqYnFMNHpBQUYyUWp4cExkWm5vcURKWGVNWllGR2NZWTg2dDF1K0xBME91?=
 =?utf-8?B?Z3JwbnJGMTRsU3EyWVNuYkpsd2pSaTBUUEZhTHVQdlVTOUo4L3BkV3JlcWky?=
 =?utf-8?B?Yk9Nc1dOSjFTR1N2ZUplNHYxTFlJWW9CSEFvclNnRSsxZEdGVGlCTXkzZE5n?=
 =?utf-8?B?ckRPdTBaR2dhYXhqSlJaV0c4ZGV5RHMzallEeHIrcGpZbUoyOWRmdE82SzdO?=
 =?utf-8?B?ZnJZa1ZFc0hEZFcrRllGU2NzS3Z3aVFIZlJNSFUrTWcxcTIyOERTeDVQU1pE?=
 =?utf-8?B?OHhFUm5PdkRXZi9FRjRod3pjdC9oYnM1Zm5rWC9IaXovM1RwWUZlODZjZVcz?=
 =?utf-8?B?WWxMdEhNMHl3VUNWWFVXZVo2Z1JIVnJIVnhKTUk3ZmNkTlFFNEhhdkowYW1i?=
 =?utf-8?B?eTdQR25SbWhwc3JOMVlsTFY2TDZxTTAvS3cxUTNhc2FBVVNqQWpEbHpLUEFk?=
 =?utf-8?B?OUxmSm5zMjZnc1JpMFZ4KzhMRG93UTFLbzhjQlQwOXVKRkF2SHpGbDFxMVZZ?=
 =?utf-8?B?cjBUZXptb05vS1M5aGYvbGh1MW5vd05xMGhTNGwwZnFtYW9HYkNnR0VjdE5L?=
 =?utf-8?B?c3BxZkp3LzBURURBVHVLV1QrWVhWWUQ4VWJjRUEvSWZIaWJQMzl4VUJKT240?=
 =?utf-8?B?ZWtlM0xTWUxmQzJSN2NKQ3JSYm9wMTdkMGN1VjdxS0xLbkwwQ1hTMDI3bkNM?=
 =?utf-8?B?aTB0UWtqT3IvTzRqc1lXZko5NXpvRkZSRzZvVHN0UFBxdEs5bjFsdHIxL1FT?=
 =?utf-8?B?aU1EaTc1Y1JsQUdZU3NRSzVNM3RUOVcwdkNlZHdRa3ZYbkw5aERwYXMxT1pp?=
 =?utf-8?B?TTRJdlZvUk9zaG1Qek54bE1XNUExUFZ1SjZ0Umg0bEUyTGgrSzhFS2t2dTdS?=
 =?utf-8?B?OGQvdFJQMkRvRklMcnJkSktuZEtqbHJqUC94alpGL3N4VkpKa3J3V2xGVGVD?=
 =?utf-8?B?UUV1MkF4N2ZvSjhXV28rc3BWSThpVTJmb3p3SitVYVZHOFUzeForSVc1Y0w3?=
 =?utf-8?B?REpLSXRBaHVLZURlYXkwOUpVVVpocUtRcFpnMGZrQUF6VTVQcnhaMjdNN0M3?=
 =?utf-8?B?MkFuZzZHWkw2anI4KzlVL0FFdlpoYkZ4dWx2UGcrM3kwaVRQY0N5a214UnBu?=
 =?utf-8?Q?vuBAxG3ai6bcByaRbG6P40tfswOobfW97Mn4aRL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddbb2616-ce5b-4ac1-37b7-08d971469f4c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 14:57:18.4797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G6/d6yR/MC4L8o+bNxrgNtnQksFbKVdI62Rp8R0sAuZ484tZAMqO0/8L64eqld/PvY88MCg2RbAJC0sR0rbxHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5744

On 03.09.2021 12:08, Oleksandr Andrushchenko wrote:
> From: Rahul Singh <rahul.singh@arm.com>
> 
> Fixes: 9c244fdef7e7 ("vpci: add header handlers")

In which way is that original change broken? The title doesn't
clarify this, and the description is empty ...

Jan


