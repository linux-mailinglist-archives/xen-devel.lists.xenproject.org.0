Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3A742EC1D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 10:24:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209922.366509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbIW3-00067U-0v; Fri, 15 Oct 2021 08:24:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209922.366509; Fri, 15 Oct 2021 08:24:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbIW2-00064h-Tj; Fri, 15 Oct 2021 08:24:34 +0000
Received: by outflank-mailman (input) for mailman id 209922;
 Fri, 15 Oct 2021 08:24:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FGCa=PD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mbIW1-00064Z-5I
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 08:24:33 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 522e9df9-2d91-11ec-8227-12813bfff9fa;
 Fri, 15 Oct 2021 08:24:32 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2051.outbound.protection.outlook.com [104.47.4.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-VkE-98xcN1qfUiLyU881kA-1; Fri, 15 Oct 2021 10:24:29 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7038.eurprd04.prod.outlook.com (2603:10a6:800:12d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 08:24:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 08:24:29 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0090.eurprd04.prod.outlook.com (2603:10a6:20b:313::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Fri, 15 Oct 2021 08:24:28 +0000
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
X-Inumbo-ID: 522e9df9-2d91-11ec-8227-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634286271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i3pZo031zZZd7VKTWJucMw6/RGE1cqzsBzXnvbwxelk=;
	b=idD9LHsIvkVaYdeer1Gnq++XDItW8iYhA2KODEJEqRk6LPc56ld+vanSxr+FNVabiS5Zp9
	4DWfsnWKZAv1wUXUt8jm+pcWPbu7MkB2w0wieHcqXD+FzL6E8vSUZwVq7104XDVPIOgIGS
	8Mm87ptf1SJO9bDPTkkqaoCxq6WEeGc=
X-MC-Unique: VkE-98xcN1qfUiLyU881kA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edFP/cVsaFiamomhnopHxV6K8agDiPNb791LaTSiGTrzihbHd5CyjLN4eWnbGF3Y+DM/1WWGPMYgtuo1vseR968vICj3JhCE7DLeWSTPDSpTwMIab/1VIu+2hqoqu3YhFSjkNQ3U6FIFkTkVLUgaZ7MTqbKKLj9yhnqTySkzEEVYIhwTLA+FkvT5q2r0co0Ik1/aKbOM/PBBK/X2fB3tnWXWPKtRgw5NM5/rKgOoNH/nGwFwz0Z18HlmWe/yX9ZLkMMaFfuZX9CFW4JtANpPQDVJmnWE6Wt734xmIhYZMs98pKtypP6vv9UVW+yFk+qTXOJP8MueUniKUt8EW1oZBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3pZo031zZZd7VKTWJucMw6/RGE1cqzsBzXnvbwxelk=;
 b=nFLY+CA8ArdOS7HFMzr6DMFk+Mk7vTDLLFVCTYZiVOOBs8iW+BVv6uJoRpaT5/c38ig5Vpm49A42sZ0OViN268qMOAgZsARddRV3Piu5SBWNf21mrl790clASeLOnN0ZSBboYzQv+tYJIq8iPaPW3wT/qePLkmIrrTxBQX3bTazmIuqh83JBUUfgveRaSYfEcMziWN+Cs2hSoV4dKcvkhXdS6R/mrUHIFXIX2CHnr3pMt4m1tKV7orR4ypYBs8B0ajLY1VwCy7u9ImwacLhIf+YN5bI1AXXMaV0MGD5+7HP4K+XIRn1kDDICBxz2/LkSNLhoqMrS4EQWD77RKW/A/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v6 1/3] xen/vpci: Move ecam access functions to common
 code
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>
References: <cover.1634221830.git.bertrand.marquis@arm.com>
 <ced6f870dbfabcfe8584555cc80f9a37a0655a0c.1634221830.git.bertrand.marquis@arm.com>
 <20c73f4e-5a8b-c127-f3a7-b841f50b1a4a@suse.com>
 <6C71E132-0A78-4DA4-AA52-E62833912145@arm.com>
 <8a7d1370-ee58-8e95-efea-8e4162e1e5f7@suse.com>
 <152124C4-9A34-4F5B-B6C5-CBCC6A175665@arm.com>
 <9f0f8e0b-c989-d2ae-39eb-6784446fa6c3@suse.com>
 <9B9BE725-53E4-49CC-80EC-E856081E08ED@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ab925dae-236b-d4f4-6b82-15d924297f07@suse.com>
Date: Fri, 15 Oct 2021 10:24:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <9B9BE725-53E4-49CC-80EC-E856081E08ED@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0090.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21c002eb-fb11-4bd0-178b-08d98fb534f2
X-MS-TrafficTypeDiagnostic: VI1PR04MB7038:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7038036A39BDFFDEE429584CB3B99@VI1PR04MB7038.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VdxYS3uy8IJ90o3NFwZcaMUWvu4ffXTtzXFwILtJQMyrYgs6NDWPygQZngYYSDuQZTKTokJpmQ+/L7uQ4h2NiLhVK7Lq27RHDw53RRq81Vgz6IV85yEhKxM35R6X3I0ETx2cMmU29ul4D3981IICC+VIp2IKYmB0dQcfj8QTvZKnhvo1mPfkJVnIbC6aNQavPH9YpHRXNe4SP6U5A4kxuSnuxUz3X/ytLcXUB+QNbduTjmhK1TxqmH0cpP/R9THee6I3f/gS5/DBTp992t+VFCsugKnaYHeLnG7oy+d2DVD7zqIsB/bQrcQBLsjiJ5WwQQbXKZEwWKGjCB/m5WtmFdutQ7qbGX9kPOqsdIsebFuv0i6/E7cmBLFF/YUqyqjqtxV/GL9uwAVcivuKApoQzurAQ1NnpXbI7R3kI+RRpPfNMQegLoiNoiSptM74f7CZdGYCuycVGUnWC9sl3NP55LL9xZfYhsF4IaiRzewJRrbt0kuXzh3BaR8EaWxxBj1/M/yJOgz5lTirNWjiRhQlbBIToZLtEyWp5ShpA67pexhzf6GAumfDIiAwwbb9fld4RSW0HXGVAOZ9nLbIkk2pHxMjgLmjA78cP/tcqiLZ1RzoJFYV1f6wi/qSgLwlWJBsNZlgSbah+0uLraGtJiRZW+u2JHpc3omg7qscAfVGIQfDQwZ8HEqFInAq7foIIKBfcne1hZS3QwIWAMpsE4N+3lYg4rz/q/ZQiVM24qV5KLM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(2616005)(8676002)(66556008)(66946007)(26005)(66476007)(6916009)(8936002)(5660300002)(558084003)(31696002)(6486002)(4326008)(53546011)(86362001)(54906003)(36756003)(16576012)(31686004)(186003)(508600001)(956004)(2906002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXg3Q3RiN3dyRWdIL0hEeWtOMnB5cXpIb1ZDSjJ1V29BRVVOeDZTbGNiRkh0?=
 =?utf-8?B?cStic0ZGWEovQ2lmY2tFc0gxNzlmOWJ3RzRYMzFiSWVxRDVJa3FaUUJQNjNt?=
 =?utf-8?B?NXNRT3laMEszbjhWNGNlY2ZhSUZyeXZObnJkMmhwTzBZTXdndW9IOUo4Zmo0?=
 =?utf-8?B?K1ZPa08rSFRzNFJRSElkS2dtanBaNVdxTExUVkZMaUZSa2pkSzk2bUtrRmNw?=
 =?utf-8?B?dkhyZDhPc2dYREJock9SUm1KS2k0OW9kSEtRaHJQemoraDVoTDFhd3A1RnE5?=
 =?utf-8?B?Q2tmb05WRVlDY3IvbVI5czlaYmx4UVNnNjJzdHhYYzJPWkxYRy90S3RXczRa?=
 =?utf-8?B?bHkxRmtWZHk3OCt4ekxrMENBK2U1d21SY3pwUndESktic1pLNWZyY09PTTFJ?=
 =?utf-8?B?NlArcHUyVlQ1aEoyTlcxSHpIQzdraGxvNVhyL245S0NNcWFWZGY1MFFZQ1hk?=
 =?utf-8?B?d3RaakVseU90V0N1cmpLQUVPR1JCOFU0eXQ4UWY5WEN0U08wZklIUzdnU3A4?=
 =?utf-8?B?WDYzYTNyVDl4VEtuNnBwR0pSQUpGdTFHNFpiY3l0eTQ0TjBxQXJhcmwyckwy?=
 =?utf-8?B?c3ZPSzlrUS95azRmNXZVa2lxcC9YaGZZTEU5RG51dkhMQzBXM21vczk5Yk1X?=
 =?utf-8?B?Szl4U3FMKzJkTFRLcXNMOFFjaFcwV25QZStIQklEaEs0Zk94UUNzNGxZTzFq?=
 =?utf-8?B?ODd2bk1qVWZIVnRPVGF5UGxwd29qWWI4R0VuY0haMHpoM3E3aWNLdFpNTnBt?=
 =?utf-8?B?UEZ4K3ExT1NGS2tsQ05LUmNNc0NUd3RrODducWJ1cVp3UStWcXlid3F3VE4x?=
 =?utf-8?B?L3Y3L0pMbWl1OGxMdFFzVG93YUh5cjZIMDhUZ2lYSitIMVhWQXVLdnVXdjU2?=
 =?utf-8?B?UzQ3ZW1UcTZMcEl4S0ZUbzdXVHlKYjZZb0hUVDVLS0tSUUNpbDBVUko4RUd6?=
 =?utf-8?B?Wm9pL0FVTVBuRGJWd0pHb1dHLytmaTV1S25SUzM2VXZuZWJKVWxHNFVtaHhl?=
 =?utf-8?B?cEZyYmI3N1A3UVd4dmNrS2RJb3p6UXo2NnQrcWQ5bWZXcXV4cVpRVC84Z3JY?=
 =?utf-8?B?ZVJJb3I1S3pHYjVSWk9LWVV1bEI3a2RwdFVWMEk5cFJDVnB1ZGpCbkI2RUto?=
 =?utf-8?B?VGxrdjMvbkN4WXd5T2pPOFV3TExGRFJMY3FSWlpNSVpqZDF2VE1LTWFpbG9W?=
 =?utf-8?B?b0FEMmxrcUNSSmc2VjBPcGEwUkxNYmZHR3JtNE1ub0RzMzB0SExqckNNQ1R4?=
 =?utf-8?B?VThrNWd2K0ZzQnlGVkdZQkp4ZFROZW5NYjdhWDdta3FZL25hNFNmdHBGYzVE?=
 =?utf-8?B?ZVFncjIveG9xZy9pdVg4ZEFjVjhKMm9ycW5uZTJxS2Y4ZHdwYWF4dGR6Mi8r?=
 =?utf-8?B?VitUaXFjVG1UeWd6Z3duRDFDK3RuUWlLdWp3RTY1R2NMRDZiaWZBeUVFNE1s?=
 =?utf-8?B?RUUvVFpPZFRCenJ5R2ZmM2xZeXlXdWNESktTdHZoVU1tbnZML29vaHU4cWQ1?=
 =?utf-8?B?UVRpa0REZ2NUcXk4azV3eks2STBTMlNoc2NkcFhKZFdwRnhzTXpTSllqR09l?=
 =?utf-8?B?S2VjYnFVd2FHMU5XN3k2NXQzWGkvZURONmMyMGRtdXhVNXNseW5BV0I4ck9T?=
 =?utf-8?B?V3d0SDNTZThwSTR1NWc1aGtMQUxFejJYdFpEOVdwNjVyU3o4NHVma24yNk9t?=
 =?utf-8?B?OWJmQStZOHFsL3RaT0dORENQdWxNenovd3pvdkxnd2hiZjhnRHR5NDBoVWpl?=
 =?utf-8?Q?A1ws44aEzXrQ5zgeEqw0uRHmMecudgDy9nVhy2Q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21c002eb-fb11-4bd0-178b-08d98fb534f2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 08:24:29.0828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fl3ly7suib3F15AulSLLnekAziBfZmVH4N6FGx+XMIyAS3InLKbDWQHNWHUwOAIGG3k+oX/UvIqUYWNUrnIvBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7038

On 15.10.2021 10:20, Bertrand Marquis wrote:
> Anyway if we agree on naming scheme and bool return type I think all
> your comments here are covered ?

Probably, but I have to admit I've lost track ...

Jan


