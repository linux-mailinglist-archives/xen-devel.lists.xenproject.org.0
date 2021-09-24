Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3048416E53
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 10:57:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195036.347502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTh1M-0003TD-DT; Fri, 24 Sep 2021 08:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195036.347502; Fri, 24 Sep 2021 08:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTh1M-0003QL-AE; Fri, 24 Sep 2021 08:57:28 +0000
Received: by outflank-mailman (input) for mailman id 195036;
 Fri, 24 Sep 2021 08:57:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTh1L-0003QD-Cu
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 08:57:27 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 706235dc-1d15-11ec-bab0-12813bfff9fa;
 Fri, 24 Sep 2021 08:57:26 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2057.outbound.protection.outlook.com [104.47.2.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-5-Cs9DX4kzMJ-iShH5feWU1w-1;
 Fri, 24 Sep 2021 10:57:24 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5743.eurprd04.prod.outlook.com (2603:10a6:803:e0::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 08:57:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 08:57:22 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0003.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.8 via Frontend Transport; Fri, 24 Sep 2021 08:57:21 +0000
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
X-Inumbo-ID: 706235dc-1d15-11ec-bab0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632473845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O0+qqISdYcBc46T1s3IsLnxBbWiKFt4J3XldhYnLsKI=;
	b=ntptDiWFMB9l5xGu3UuTTgu97O/ABiP1p7dTyohNJsEHmdVnyd/GahQv0cPMZcvLQl3EJ6
	PP1BFqBkK8h/jGxZsTM1YGrdTROdlm7wqiHG6Z+FMiBOIsGYt7EkRj+BKwxvkHXkAc6lcW
	iUWI5PzFQmi/xQDnr0hY2P0m497OJPY=
X-MC-Unique: Cs9DX4kzMJ-iShH5feWU1w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oAIm6kD10/5aOGVDuD3dKBGMNJ0ycHk5y0zefr9QjnWpC5qu5TKz0aDhmDAcObeNkHmMMTY+ajtDQUxx5z0oQA3n7/qJr9ulcUTazAf4Dozo/NoTp4Qm09+wQTCG1GW+bEf+Wyp6n2/1XTLxls8e/1IZfJJ5PkDaG/VQbOrDnCh2bYwr/SLJ7WiAL65RqWXZqd5uSiLHVXArBG+ewvkg7CY4LHMtxLqkPvikUqZWSSkZb3G31WbckK9ZD9vXJmLWD0wGUC99jkv1kktx+yQHLPczoh5SLQo7lb+QSzLj/HR8WcCUCHDpc4Hzwn+HtBcPBSdVcY5pP8XLoyKnoUfK6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=O0+qqISdYcBc46T1s3IsLnxBbWiKFt4J3XldhYnLsKI=;
 b=iH/wi8Z0Z2PVXcXnPilvPWtJTyThhRsz/9514a0euJ9TVyylyFG/NIyK+rAjyl77c8n7K7jpsjaZNR7FDNM8fbAAjAiUHfP1oX+JUgpV36p/cKusaetFSFOgzhh2E06PLFPYnfkDt5Ac4U8hYWETjs09oo8QOZ8APfVnQHVqUXGUWRSC04OjDpp3oITHeoBJqsvYmFGNa+YtVVRvMY9A52sN4GO8dX8jxj4gHwGtSq0HbgzUxT95X8Df894utIgYt6iQLbJerSJSUcCtyN7ab3wPsCH2hL4GtofvdYF6spptyNllv6b1M6MOg2d4XUgGMYmU8KXfDNqRiWUGwUzOhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 03/37] xen/x86: Initialize memnodemapsize while faking
 NUMA node
To: Wei Chen <wei.chen@arm.com>
Cc: Bertrand.Marquis@arm.com, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, julien@xen.org
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-4-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <27150d2e-b269-c1ef-0e73-bdce1975dcb4@suse.com>
Date: Fri, 24 Sep 2021 10:57:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210923120236.3692135-4-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd59f896-4906-4e0f-2847-08d97f395251
X-MS-TrafficTypeDiagnostic: VI1PR04MB5743:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB57437D5D7B87B87E61D11597B3A49@VI1PR04MB5743.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OuJVXPLteKl+GKj1K8GrkAVrvIadLMhdp/loNjN+vpgiNHXdSYg3FH7sjhixEpfVsXk3HSoHzWhrX+rIDOjSnZF8pNwy1pY38jlY/P+NjRXmn+ZnX10trlGMXiL1fpdqF6/5+mf6yV7FBrjbLaZy7SExJMCZirG7W6AugzcBBxHN9Z7yZ6yCmBKl7yv9Jsr1E6z3dF2qgqOez0ctoKYtogCI80aQOLSMreVNFnAYh5QReQCfoX4xERmadKhX6UFSwhTz+rosHpVCvitx1YKoroNtGJgm0MdreT5t3Yk9gSDIa0MPcba/E0KnQkrR/r/lhAzV+T661n8fjR0gSsbPnrfEVnOts1QOSS0CwG0KTHY+1hmqGZJoNiHSMYeez1ogQ5pj7wK5U4r/LKkDMoJoSpvQ2R5D2UKCMNRShnQcPgrGSOp6FJWb8i7+OjGDbTpDf2uRrgto5ZPC2xS50ZSJbMndJEPrQr1fwCXncqyfmQoJ4wxXBEOT2kQmkkmuPP8nA9p1FjKOQ2a4rPMfRIWpbGZvRiQ+pCi1rT8lvM+CsURetEaUQZ2BS2lCE9wQyi5OvC9uNSrmvl1LvHgorOIuR2KYkD1Q0VBkOIluNNFlS/WwzlYkdBhfkiD0cFK6A/fwzW1V08rr6RZn4dJdER39gwa/uTmZsJTttfqMq66DHjiAwAAaseHEatQeZbJYeSD9D9egE2ggziuzQ4DSwej07EiH9TOOisK6aCmR7qIhh5qn7JbGOVTV1d34E7+gHP5b
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(508600001)(2616005)(956004)(26005)(8676002)(38100700002)(31686004)(186003)(6916009)(36756003)(2906002)(16576012)(86362001)(316002)(8936002)(31696002)(5660300002)(6486002)(53546011)(4744005)(66476007)(66946007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eloxK2F5K05SUWdUUjNQQ2EyUTh4alQ0TTZidWNkYW9ER2krZU9iMFk5TDEz?=
 =?utf-8?B?bXZnTmNyRDBnZ0hIRGVDZld0emgwcUZpVktJRFRsTitSQXFtdmdJcFZsdEdk?=
 =?utf-8?B?QW1JdEVEVXFNbnRrVnZwSUtOazJFQ0VkQnFRQy9oTmdUZFQ0S0UyK2JxRG9o?=
 =?utf-8?B?UlpNcHRWaWNWbmZKVUQ3aTB2VENaNURhblpZRHVhTFBhTXhYd3FycW0vZGhP?=
 =?utf-8?B?dDJZZnVEYnB0QzVRU2IxTDAvbitpblMwODBEMnNMWkJCaTV4cTk4RkhDdkJi?=
 =?utf-8?B?Y3Y0WFV3Y1RSWVlIWkVRWkovNkZHV0VkS2NLUmVtbnRnQ0lFeEpGd0x4U1pI?=
 =?utf-8?B?V09pd1pGVlB6T2Z5SE54eWpUZllZY0dHUG01VHZtTDNySjVueFlwTXFBcWZz?=
 =?utf-8?B?dUgrSmpGYWFpK05WVjFMWWhYUTdpS090Z3RON1NpdHoyWEJ1QmRxd2xvb3Zi?=
 =?utf-8?B?WS9ieW1LSTFFMjZTaDJEOVF1SHFOc3dLZUE4UytoUjVHUXVXZFExeCtzVU92?=
 =?utf-8?B?a0VnNVhhL0lkN0pnQ1FQVlRjcXQwQmNPKzNFTnZUbkJTWHFFaTEyUXhCZVkx?=
 =?utf-8?B?NGNPV0hZMU1MM2tadTlxeDhzQnBGK2V5UkJVSmhoUkpvQzJDMENVallOQlBl?=
 =?utf-8?B?ZXlBcHZZam9Md0kyQUZVd0tQVXlaUnpXU2dwYnBTcEM0czJuUlhlZ2ZqZ3BJ?=
 =?utf-8?B?akcrLzFvVTgvZzJsM1BGRjJ1SVBScU13NWlxOTlFWnRhaFdnZFFWVWNZZjJX?=
 =?utf-8?B?OTY2eklKU3B2NXlVUmYydmpCNkRBK3M5elRMcXp6MjBYaWpRWUhETXRVaktJ?=
 =?utf-8?B?MDltU09lYmxaRkM5S3UwSUVNbU1IY3BsWStUS0NXL2dvVE5CeXA2dE02N05z?=
 =?utf-8?B?emhkYzRnR3JOcFVSc0NrN3NCUkU3cERxWDdvUk1FV0tyWTNqZHZZbmdxUnNN?=
 =?utf-8?B?OXJ6Wm95NnB4K2IyUlQxVkMxNTQ1eGhXaVcwV3oyejA3dWE1RzNqWlFzZFdP?=
 =?utf-8?B?TWQyWHFSVUk3UlN0NmVMcUFBSGJ2MC9ZZmdYRnhPYmhOS0VqdWsxWDlCOVlr?=
 =?utf-8?B?SFdEOUJKUDlJcjhoOUFWeXIwWmxCc28yOU9zKzVXQnQrY0M3QmNGdVZxVzZh?=
 =?utf-8?B?NzR4NVVRTEs4UE5NK3Yvb2k3YkxDWEtqWitCWDk1MVBTN1RSZVF4aVY5dW5h?=
 =?utf-8?B?WXFRREZZbWNVU3QrUnhGK3BBTGlMc0RnbEhtL1NpNEpuZlk3OGtzTFI4QVRB?=
 =?utf-8?B?b0lXYnplRUVqalZFWmNIWVNDYUNmR2N0NWl3QzVlc2pGVWVKZ0xuMEV3T2I3?=
 =?utf-8?B?bVQ0UUhXMGt3cnRPT01YYjFZT3JKUE9zZ0U5anhCbU16TVJlVkplRlVRUU54?=
 =?utf-8?B?ZWtaRDJybWFtcTJPM25kMytWZmpteThCYkJXNjBnMlJPRHEvU3YreTV3TWRm?=
 =?utf-8?B?dkJOMVR3Qytvb0tLbGk5dVhtRUZ6TTZydVBya0hLWXpTYThQVnYzcnl1THg0?=
 =?utf-8?B?a1RCRnc2clR4VE1FRG1rRHE5NVRZRlZyR1ordE5xamJnajdqSlp1UDc4Zld6?=
 =?utf-8?B?bG5hL2ZlaGdqTnZ5T3h5ZmtsNk1SN0NNRUVFeU9PdStaUGs0Q3VHZFAyNHll?=
 =?utf-8?B?NUZkSHlHMGRDdTRtWnMvOXNvR3Eza0VKcUdVd08rSjdtTk1GOWI5U3h3QTk4?=
 =?utf-8?B?NURoa1U1RGhKa3lmcU04N3pTQ2ZiY2FjVy9mb1BxWVA2c2Z5Y0U3UVB6WDlz?=
 =?utf-8?Q?hlqu+94/ZNBRgTGuPBvPy2gkDS3m4sVEzQdInej?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd59f896-4906-4e0f-2847-08d97f395251
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 08:57:22.1918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hn8VAUP8uuZe0RvmQXBbPrWe3HXjME4MLp+NKVVt3yk2SgZ4HoPkVnVGdfOCo8qVPlTLw2qlD2O9oZHk96Uvcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5743

On 23.09.2021 14:02, Wei Chen wrote:
> When system turns NUMA off or system lacks of NUMA support,
> Xen will fake a NUMA node to make system works as a single
> node NUMA system.
> 
> In this case the memory node map doesn't need to be allocated
> from boot pages, it will use the _memnodemap directly. But
> memnodemapsize hasn't been set. Xen should assert in phys_to_nid.
> Because x86 was using an empty macro "VIRTUAL_BUG_ON" to replace
> SSERT, this bug will not be triggered on x86.

Somehow and A got lost here, which I'll add back while committing.

> Actually, Xen will only use 1 slot of memnodemap in this case.
> So we set memnodemap[0] to 0 and memnodemapsize to 1 in this
> patch to fix it.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


