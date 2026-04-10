Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDi3AmA22WkjnggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 19:41:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6955F3DB26C
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 19:41:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1279658.1563979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBFrR-0004E6-W8; Fri, 10 Apr 2026 17:41:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1279658.1563979; Fri, 10 Apr 2026 17:41:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBFrR-0004C3-T4; Fri, 10 Apr 2026 17:41:41 +0000
Received: by outflank-mailman (input) for mailman id 1279658;
 Fri, 10 Apr 2026 17:41:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wBFrQ-0004Bx-HR
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 17:41:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBFrP-00FFs4-QP
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 19:41:39 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d9363d-e002-0a2a0a5209dd-0a2a45088b7e-10
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 19:41:39 +0200
Received: from [40.107.201.68]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d93652-fab6-0a2a45080019-286bc944da18-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 19:41:39 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO6PR03MB6210.namprd03.prod.outlook.com (2603:10b6:5:356::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.44; Fri, 10 Apr
 2026 17:41:31 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9769.018; Fri, 10 Apr 2026
 17:41:31 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GEcJ4gdU2/yO88as9sBHBHih1jvebj+/p4TI2I9DCxQ7itN2weN2xpcoMVyvGhlX97Z8xMSxbwmIq+PWNUmWTGmy07kgGoD1kYRBJpLeOZFFqljnbFp1a+88RH6iVc3cOTYZq5eWD5F5ntcAwj60K+7LFCxko+VTPp59s4er9tR+DmDltWXlLdLlmhdN2YxHjbo1C/mdQjBOnlp0Hz2BWO6IvqGpOapAP72lX5LLc0uIXDmvgGkB5dkZ7R0RLQZw6pjsbRVt0zd5UcUXHem2p7QbkE/H7MwoPp6VkXD3OGn/hTSCmcLVzFp57TQBJkACncwjsJGIg6rvKYB1J9jjhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfu7roJvbPHD/ETMldfDilvOFITe9DSQltzRwvMt2Xg=;
 b=SP23ZSkyvKayCsnIWq7cI+w3YYADynUKMP7qKk3iceeWvflNlN2mojVA4JZlXZc/FkShFGjADBjHUm8BJLiTfTdEIGkHWk+hdpDNClXpyoG18bUlW6/43FtNBCM+tf9Ea8yVJqbmnAeMLYAypRRFEWPdjsvo676JSFng9WSdqQZJw+wzfnh5kFVjgJxoCAV4vB+koKWXwexTdeLbhG8c9rVmMKiKOyWLDXFWwaa/mrT8havDHcZRA0vXZtSjPRam+SRr1psZXABuFP5k0lcv6yXsVhWqhu1ISJ+2uHf/x3HYD1l5+ir+rF0s4bHJkfNo/JJXw6crnhJ3ug00ZozriQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gfu7roJvbPHD/ETMldfDilvOFITe9DSQltzRwvMt2Xg=;
 b=ahPYl8TnkiqI5RpxomlkBvLG6+HszMAjMZDaIeHNpzVeRc0tXwfX6VKEyxemkY5AuHrhHpjJV5Y+HSg/rnciaSVHgJQMbBUe+31vmz4mFcYG8fSgyWm8Ps1kagj1xmgPnF5MvYCCsL4fk4FvXwhQ+eRRYluCi6kdyJ0kwad/gQY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9eb6c6d9-8e1c-40f6-a44b-579df213bda0@citrix.com>
Date: Fri, 10 Apr 2026 18:41:27 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/riscv: allow Xen to use SSTC while hiding it from
 guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <eba232ac5a338332ddedc2cb084e0c04ee8744c2.1775835741.git.oleksii.kurochko@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <eba232ac5a338332ddedc2cb084e0c04ee8744c2.1775835741.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR1P264CA0041.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cb::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO6PR03MB6210:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a626fb1-4c7f-4056-2848-08de972866ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lcpub/7EqG40uxiSMAjegDg/b+D7VlJFvtGMtVGF/x0LnMhi4Vosigx1iOTz6ZYASeoycNhkd/BHpcNc0BDnni6fCfLVGzf7aX62aCMsYyyjOhL8kuT3lxUlNG2C4aBj7EYcki415AykIzxeG0Rv2AtLjMpQ8aDiuSKQBdiAj6oDXLu6ZO8WjFBjIl3grEa8LCKrzKoPBpsP/jm7cK0toDRQe164O2RxJw/w7XEOo6ovzDPzEGAJ/pPcSsgtVM4wJNl2VEH2VcugyP9JekTJaVL/NHlC/Fv5HlnntYuJcUAsDcYm+vbYQVAYS/zczBYHvOx6VHxtB5hxdTCufGQOMdXvpdgzTPnCVayHbTl7vPnAdBgusycEFWNN+UKvmTlaeDhERlMQWV6rBuOJzwVEAUUOP8pqWKZ3qM1mSQ5q8DOL11tgzHEUGWSlCSQ9voBjuexIPTYhp2rAIIDvrEydmdOYZRHAA3cfukABi35au5Uw17eKx2AUs2FX7CKZIB9OGAh5IZlEMrSbPSsLW4IRsyj9+TEAkvwMhOGsamiCXYpAlyYCI0/+vLYOCJBrCiq/HruRhhpm1eCRC7vtbWhwCGoENfI0+jeK8/60Tv2/ziUL1jlSo6gbUESd0ByKyUTxlFijXsVgamucCms6YHDm6uv3wHltVlTxOyTv2D5yPJeIoamhq6hFDgwRwjJ99U0mliBK+EFjeDBu6FYNkHmHCr6ewcxqUGX27of09jDEftw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWZrYXRnNDlKT1FrT2ZTeHgzV3lmRHVJeXJtOEtuU0JrL3NhZzMvaURqMFlK?=
 =?utf-8?B?R0tMSlNGZ2ZJbDdCS21sOFdhK1ltTUM1UUo5TXJ3REZtNHRnbWppalIxSFVO?=
 =?utf-8?B?UjEwV3hldFhDVW9qZXB1eUlJUzFZbnZnZW9kTmJvck52Qm5WVU9pR2g4L2Z3?=
 =?utf-8?B?ZmpNd29VUG43NnFVQVZ4M1U0bEE1MEdRT0V4REhWdmZvdHBVbkRnNDE3UUlv?=
 =?utf-8?B?NngrQVpJVHh1dXJaVFNad3BqbldBVmFhTkdsWTZ1K3c2M3VFejdTb3JLVW9z?=
 =?utf-8?B?ZE16Y1daYlp6Z2NBNUduZFRpeHJ0cGlpYVU2YXY3QW9qR3JlUDVVWG9DZWo3?=
 =?utf-8?B?cG43WUpESjcxdVJ5U0gybWdoUW5JUmhWemxDTC9Ga0dGdXQvcjA2TGJyTTUz?=
 =?utf-8?B?UFRyb3RkYzR5TlNRbjhiZUdFWjBEa0grUFZBYkVCN0k4MlNiSEpFWXUzN1Ax?=
 =?utf-8?B?T1A0Mm1xaVZvOURoUHVqY2dFclcvWGxzTVBFN0V5VjhTaldsNmdHRHRJb2hy?=
 =?utf-8?B?YWMyOU5mK28rbm5RUmRodkZGL0pLRmY5UTgyNmJZSFVrb1cxT2NDTFBBdmJj?=
 =?utf-8?B?MGZaTndLTXVvK01DYlVHUXRkYWVXYmVkQjIrN3hRbWV3MmdFemJscndWU2NI?=
 =?utf-8?B?SW9jNkdjcUY2Q1lIcWhWWDFDL1ljbUtQb3ZHLytzSFllOTloQ3BTS2NyaThm?=
 =?utf-8?B?YjE5MzNTT1BzYVp6SUYwcmNPYTRjWjVaeDkyb3hOM2MyZ3ZJUXpUQ1B1Uk1n?=
 =?utf-8?B?M3A5R1RkMU40NnRvSUZhbVNENzJDdlNQRjFocGxTYXVJQ0V1QWxXbEN5RnE5?=
 =?utf-8?B?bVNCQTRHd3hGekNVZ1ZrYm9TcWFSUFpkZENieGlQZXFnalA2SEhEWGlmRCtR?=
 =?utf-8?B?SXJYK2N1d2sxMXh5M3JRSS9BWmx1RDFTRUVxaHNnWGwwcnM3Y0dpM21EMTQ2?=
 =?utf-8?B?UnlzelczVGVtckI0bFRvbzNPbUVzeGliY2R2YWlaN2ErNytUdnR0VmVFZEF3?=
 =?utf-8?B?d085QVIrQUwvYk9RcVRza3JSOGtZOG1ya3hxT3gybHV6WWZKN3NNdFVUNHYx?=
 =?utf-8?B?Ulh0UjFpSUFwOWZUcjRXeUd5RWdSM0dlTndDVUtQdU5weHFjYUxBenhOQnJr?=
 =?utf-8?B?WHd0b1NEMVo2b0ljemFScWJhczRQRG9Sc3R1cndaK0poN1lPb1BrbmxFSW1u?=
 =?utf-8?B?ZS9zYkpPS1RPOG5teDUxbTB3U0NNNFV0a2NQZmpFajVUNFBUM0ExdWJnS0Q4?=
 =?utf-8?B?MFpzaFlxV0tCUmlNbEwzVGg4VFdKem5PRkVoWTdDV3pIb1NleXFrOFh0Z3NI?=
 =?utf-8?B?OW1KU1dzUGRubm9tbVNFaXF2d3pGUlRkNFZlMy9HdFlYZVo5SHlYc04rb2Ux?=
 =?utf-8?B?UCswM09mUjQzcnc4T1NhNzBCV2xrMW5wK0NqREQ0RmVyMks1bE1uSjRWeEdz?=
 =?utf-8?B?M0ltSmt6VkdXdUtMeUtlKzdoU2ZuMm13SnBKUVQzSWNXYkUvWHJDc2JsdTFV?=
 =?utf-8?B?bGRkd3c5ZWpxelVNYmwxUTZTOFA1K0RWRkhLRUtBMlFXYlFmbTZ2bGNYbWFh?=
 =?utf-8?B?Q254Y25kN3FnYTFtQU84QWxWazN4M0dhVGtSMEhFU1E5YXp3NXJNRmcxM0ts?=
 =?utf-8?B?clI0RUF1UlFWUEtMamtTNzJCNGNaU3Ntc0hKMHpxZnFGYlY0SHBTTGtmWDRP?=
 =?utf-8?B?RkhkVnpwczlCYjRZMUlGR0Zma3AzckJYZUcxQU9hcys3eWEyY3pRcW9PMkFJ?=
 =?utf-8?B?Z21iZGE1RlYxK2VrZ2Q4YXVvcTVESkVPQnIxdWo2eEVFUWxXb0Z4ZUdUaDla?=
 =?utf-8?B?ZE9FYVlrVS9ZanFWUW45NDFucVFabXBac1Q2Zi8vMFhOeTBKamF1ZW1YSGx4?=
 =?utf-8?B?Z0svWGJCK2wyWXFVVlNEeXJmN1RpY0xEek1CRE9SZURGaS8vSFJKamNyRmNo?=
 =?utf-8?B?TGNzbzIxZU13YTFSN3pMN3JMRG03aW55TmVscEI4QlAwZERsSkJocFpYOWFI?=
 =?utf-8?B?RUlBRHRZRHhXdmV4UTZ5djYrci84WEZqUUR4dlAxWmdKY2s0Wmt4dVdvbFdO?=
 =?utf-8?B?YkdQeTB3Z08wanllU0ZWTUJwTk8vbnErSjFqRGJiZTZHNVB2aUNSd1podW94?=
 =?utf-8?B?RSs5Y2NqWEJrUEJoSlYwUjhobG9kVjY2SVUzZXM4enhhWi9iNFRsUkFodi9o?=
 =?utf-8?B?ZDlXZmRrUEZyVmRYTk1ScE9nLyttd2VEZENOVElreHp6bmp1TkE3V3NNTzE3?=
 =?utf-8?B?LzYrQlUrclRtTVA4dXJkamhINHdXZ1ZJSnFTdk9iaGEvRjh4N2tqbjlSRmRD?=
 =?utf-8?B?QVcrc3J6UmhxbEg1NjN3NDViT0hUSnNDWm5TaGNPOWJXMDNqMTU5dUVIZC9J?=
 =?utf-8?Q?IL21hJwmbQ5WlZqc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a626fb1-4c7f-4056-2848-08de972866ea
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 17:41:31.6237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NIKfWPDIXObG3P7x8GzYDAGyRDDqEOf3UJ7Y/RF3BCmVswdKFLydSdDb3H3TsbBLeuwuZmFWpXgU7gF6RSwAtKhXggNDV1YxBl8DLjPUe5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR03MB6210
X-purgate-ID: tlsNG-c1860d/1775842899-F4B5C497-48329AAF/0/0
X-purgate-type: clean
X-purgate-size: 1706
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,microchip.com,wdc.com,gmail.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6955F3DB26C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10/04/2026 4:45 pm, Oleksii Kurochko wrote:
> diff --git a/xen/arch/riscv/time.c b/xen/arch/riscv/time.c
> index 7efa76fdbcb1..80f0e9ddae6a 100644
> --- a/xen/arch/riscv/time.c
> +++ b/xen/arch/riscv/time.c
> @@ -91,4 +90,23 @@ void __init preinit_xen_time(void)
>          panic("%s: ACPI isn't supported\n", __func__);
>  
>      boot_clock_cycles = get_cycles();
> +
> +    /* set_xen_timer must have been set by sbi_init() already */
> +    ASSERT(set_xen_timer);
> +
> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_sstc) )
> +    {
> +        set_xen_timer = sstc_set_xen_timer;
> +
> +        /*
> +         * A VS-timer interrupt becomes pending whenever the value of
> +         * (time + htimedelta) is greater than or equal to vstimecmp CSR.
> +         * Thereby to avoid spurious VS-timer irqs set vstimecmp CSR to
> +         * ULONG_MAX.
> +         */
> +        csr_write(CSR_VSTIMECMP, ULONG_MAX);
> +#ifdef CONFIG_RISCV_32
> +        csr_write(CSR_VSTIMECMPH, ULONG_MAX);
> +#endif

You've got this pattern twice in this patch alone, and these aren't the
only CSRs which are formed of pairs to get a 64bit value in 32bit mode.

Sadly, the numbering isn't consistent for the high constant, but we can
let the compiler do most of the hard work for us.

#ifdef CONFIG_RISCV_32
# define __csr_write32h(csr, val) csr_write(csr ## H, (val) >> 32)
#else
# define __csr_write32h(csr, val) (void)(csr, val)
#endif

#define csr_write64(csr, val) ({
    uint64_t _v = (val);

    csr_write(csr, _v);
    __csr_write32h(csr, _v);
})

will get you a csr_write64(CSR_FOO, bar) which does the right thing on
32bit mode.

~Andrew

