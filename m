Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGrmMaDqBWr5dQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 17:30:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B682544101
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 17:30:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309009.1580214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNY12-0003au-Ft; Thu, 14 May 2026 15:30:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309009.1580214; Thu, 14 May 2026 15:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNY12-0003ZS-Cy; Thu, 14 May 2026 15:30:24 +0000
Received: by outflank-mailman (input) for mailman id 1309009;
 Thu, 14 May 2026 15:30:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wNY11-0003ZM-OD
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 15:30:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNY11-00DQo4-4n
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 17:30:23 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a05ea8e-5cb7-0a2a0a5109dd-0a2a4504da3a-0
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 17:30:22 +0200
Received: from [40.93.194.31]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a05ea8d-1dec-0a2a45040019-285dc21f4b91-3
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 17:30:22 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS0PR03MB7179.namprd03.prod.outlook.com (2603:10b6:8:128::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Thu, 14 May
 2026 15:30:19 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 15:30:19 +0000
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
 b=T4WrUfZV370VbWlTITY3EA/LDdT8AHZdqp/+4aQjDkro1O+FxP4R8GxOQJPeRxWzjJPTD1HxCB1QDaSHjO3kMprg4fQA9xeZm6zMmJAoFXNrPEWr+UdY6EibunKsTKpe+h28xI2NBUMSADKdydkMCvFUzKNtlA9PkRKwsdYhk2dGtso90aTkDWM1Tg8/WRQgJ8+GKzqPrJWEiTb1bAV1OXb01oCLdAJPDKU0+yNEHDUx5HYIzfHeXmv5PUBqEkqzBHddCeGEVbIgoc6vLD257kbgaxL33TTv4RSrOrMskMVsbdKLInuWQRH8ARzBVu1Kg8PxZY/26n6u/P/rYvw6cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBiqVYPwabwUfivU1IAFkfCckRxapBDna4UB9iJWJtY=;
 b=MTZtLbf+bopMzkyBpXfh5VQS5U++dpX3BMImgKZY7zX4E4D5GJBEphcetmuO5xYrBAgyUKMfHidLtY+pG82Efab/sHr3FiWdo0gvrr/qDw4X+zfPAzrGCS74zmQg9QvaVVpH404ygZuVu0av4Stx6h2KG3fjxqiXF0oHed6MBfZIo80HgxhdJ/rE4u/q0r4cmbrqM20U7PxpyoOvk6qaPGqQLE04RPVTmtP3/uk94LFdZJI7n4vCI6AX3DuLshjgmPsmWCTx76iFAxjCEDZiDJ7diC+hEyA2sIO0tTujOBSHKsWzDiEHg45M3QvfEKIgYVh2yJ7C9lFCsS5ADRwTRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBiqVYPwabwUfivU1IAFkfCckRxapBDna4UB9iJWJtY=;
 b=Mezr1cZ39J+Ex6monRilcT1GgmO88tSEhSiDd+CZ6gesN9OUIuZ8FcF+7LP3w07sEd4x95yQ9J5A1sG/kRzKV1zVNwqiasqTbg1+NKVSxzjg4h1DkH3pDuBTqkeAq0ExmzOMKaAdWJn4lO8zkMZCIOXNOHe2zyZ1C7nZ+24/alk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 14 May 2026 17:30:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.22 v2 8/8] x86/mwait-idle: Add C-states validation
Message-ID: <agXqiEQgGblLyc7-@macbook.local>
References: <178739fe-fa41-4ff7-b16e-67c4b2a99b38@suse.com>
 <d8c66d85-59c1-4107-b283-a03f92f6eab1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8c66d85-59c1-4107-b283-a03f92f6eab1@suse.com>
X-ClientProxiedBy: BN0PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:408:141::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS0PR03MB7179:EE_
X-MS-Office365-Filtering-Correlation-Id: 50415295-9392-43d0-0321-08deb1cdb475
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|4143699003|18002099003|3023799003|22082099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	Iyft93PZ3tdojxGfC0geFeopdruzX/s9iQTFnuaJqXUcxuaLW4P+lxEFNYM5zEaO9jI1hMH4w8wN40ttMjamZRX6o9Lr5B6CBJabZGSeKwz2xAyyB57BVx4Ud0gAB/hMlVY+1ESiTmmkFcc4sMDl3/oB/lI0yieDwqg0cINH1PwveK/W0Sy7JEx6rknTrndgOXEbdoenrxZfpFRORvD8AlZcSudw0Ldaw4TTodTU6wnEhDGDV/XagfM02ROFfYdmeVNOS2u8VMrQaQKbLT6gqzg0xbI/z+3CzpfflQ8Ywic47xPCfdc9RoP2h0uVVdb1AtiSctZUI5qVWRWQrO9ucukUGkNgg49EDtZUwt9wpSi5LST/KknvLfTH3HimIJKJpL4pMHQAEXt0OLN+tNtVVIZDeHPgGk6+wo5BO2qV6zZ86KZy8bHev4tTv6oCh9IqJTTwNKbeOylVUM9YEbKtdnLcvsYP+ga75438MAkTTG0Fem+WIaNTVwlvBRjKU7gX9FIEbe5m5UNSvf+7M0yP0YiK1UV4j2nEULa3qQmbXRAsz1vUFikKeP5SNZqMS8J6Bh9oAhXw1mo0oth3fR5c3I8It1n7oWetNcAFnYQMq6Rk+BCKQfatKdSr5+adcRfOMEp93V2z+h5AXkY5WU/1QA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4143699003)(18002099003)(3023799003)(22082099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkdMT01RNm1OWnAzajdXakpCeXFoTmFJVGNnTnl4ZE9QUGUvenhDOTdEL3Fx?=
 =?utf-8?B?cE1wOFlGemVUQ1hVQ3lkVXIwbnJSSnYzeDd3ajg5WHVUYXZMQ2JzRWd4WVh6?=
 =?utf-8?B?WnVqQytYaURMMUd6OTNJNjJ3VUp1bW55VUxoa3VWUHhyV09Pb1h0L3NFaktQ?=
 =?utf-8?B?TG5BQ3lNeCtNSzBPS3FEZVZDajhnK3FPQmYwY2U4UENoNDMzM29JcC9JbENx?=
 =?utf-8?B?bHdGNUovdWVGdTVES3pMdG1xTWlPOGNaenFJME0rSzVlNDZNckJLcXMwa1di?=
 =?utf-8?B?aEozQ1hvR0lmMGpTWTJnZG9GVmVCemU0T3hIdlJQMEl0SUZERDdQYXZ4S0I0?=
 =?utf-8?B?bkcvaEhGYThkM0Qxa2xDdjlzdzc5a3BmcXhHWS91YmhmaU9lSWF1STdnUTZK?=
 =?utf-8?B?RVFOMDRibjFsSXZta3dVZTFiOW5zOHlITVpmY09PT3RyanhNYzlMeWxoNGdG?=
 =?utf-8?B?QmZQVWhlQUl1RWVCTGZKZzNkQks4UjhLbG9MYjQzdEVCQXFiYTh1V0ZuMWxH?=
 =?utf-8?B?TDdKRzdkcTJabHVtMlFaWGQ2QXpJRWdqV0JxZXRVRmR3MWRndU5UNktSdzAr?=
 =?utf-8?B?SzhtSzFiVHorc1ZYdDhGYVJCUGl1SlhCb1RYdDJhblU4WlJ4T2NlNldGVVBU?=
 =?utf-8?B?OGhiQzZ6Z2kwY0l1VXArQTlWVmpXUWdjNVB2Y3pzSzZuTmNCeVJDQ1AzbFli?=
 =?utf-8?B?SDcvMkJJRXhFditOSFExa1pQb3BvZWt1dEdyaDJ6NllrYUd3NkVaejFUQldH?=
 =?utf-8?B?SlpQSmM2ajVZWkdrUWpyT3drYXVUb2NWTHR2bVhUOHR5QThUck5FZjdtYldV?=
 =?utf-8?B?bUd0dUVDOUxsUGpxQVNjd0kyOWJxc2MyNE5MNzIvWnhBbWtzK2JxSjJZNjFM?=
 =?utf-8?B?SlMwYmRIUEFkdWNlV2VFVTJ4dWdRNzF5ZndVejBxWlZZek15RHVxQVYwdVRG?=
 =?utf-8?B?RTZ3dHRoRTAwdm44ZEhWRk5YLzZpeUM2Z05XZTU2T0xsbTRkenZVam1ENVU5?=
 =?utf-8?B?ck9BUW5JV3B4cjZIU01KV3VRQXJ5VEM1bzRocVZnNXBwczJvNTZkM25lNnFT?=
 =?utf-8?B?d1hWRXNrajlnNjFxQWZPc1NROU1XS1o5bXR2UCs0V2NiNGRiTVpNYTVUQTR5?=
 =?utf-8?B?bU04Q2xrTHVDZ0xXTUJPK3ZSWmZZMzFrZm1yNWNrTk4zSmFvS05QYnE5K2pX?=
 =?utf-8?B?THdJUTlESS9idEM2ZjdnbTlKVUdoUnpCQUcwejRTeElkZ2dtcjQzRWpqQmkx?=
 =?utf-8?B?L0JrN20zTFFXN0RWM0Rwc0ZUa00wQi9tZjZ2VVJPSFhvdHloOW02OHI0R2pJ?=
 =?utf-8?B?Vzk1WmF3dVh5clp1ZXVVbzd3bmxDcVl0SkE3c1VmQ01HdnlYR2Q0TytVL0VH?=
 =?utf-8?B?ZWR1cDA4WFlQY2ZZMitPZmtYUXFvRmpuOUIrUWpQSVBTdEFEWkN6NzBEU0Zu?=
 =?utf-8?B?VUV5SUtBTDY4Yyt2SFJETXF1MWVWb2ozVmNIZ2hFSEFNdkZrajNsQUhkNEZZ?=
 =?utf-8?B?azJSWTF5SjB2ekJOSm1IUndxSW1vR2hUSi9ycEFMeE1RTkF6ZUNWTnJmb2Vm?=
 =?utf-8?B?emZ3SlBRUm5NZ0hLUVFFL2hXU1NGaVNwaHhSTVZiMmdzb0VSOFgzeVhDYjdl?=
 =?utf-8?B?ZUIyc0cycHgyWFQ2MnE4SThLMUNTMmlKYnVQZTRkZ0VKZGpOdUxiaTZjVGNz?=
 =?utf-8?B?bTk2QzVRMEhkN3g0bUlMUTh4NVljV2dUeVRHNzNpZXVMVStSUlZKaURmbm5Z?=
 =?utf-8?B?bHR0VGlvM0dZc3o3VlBpU2ZOMzNXcnRyYlB6S3RyN1NQUjQ5V09VQTdTZGl1?=
 =?utf-8?B?YWZCa2Vkc29SQ1F1YVg2RDVkRFA2akhLQ0drWE1CL2RwR2hCa0xPSmhBUDRJ?=
 =?utf-8?B?KzNQQnE1NkZINjFGR25CTmZoUWNpN082cHA3TlZTUDBybUFLUStjUjR2SWF6?=
 =?utf-8?B?YWZrWmM4cU5mY1R2ZWZsK0JuSHV3Vk9nc1VGMnlwSU5BWlgvKzRTTjdvRUI2?=
 =?utf-8?B?dUQ4bDEycWs3Wnh1eExsMXNad1RXa1BJekczTUlPU0JvUVVQa1VNVDlqbEUx?=
 =?utf-8?B?UTlWVFVMK21nNHZCVnBCYnBINlZySVNZSFJ6Qk5wUDRTbkp5Wjl2SVIwaGRJ?=
 =?utf-8?B?bTJlT01ucUhOWHd5cEJMV1NrZDhnOUt5amxIZ01UeXpITXZHM0Vjb0xIMFJT?=
 =?utf-8?B?WlZIUkN6ZG9GL0xWZWdXYUI2SGxLRkVXRlpwUEdtU0tqaldwZmRKSzQrVEly?=
 =?utf-8?B?VEgrOWdIZWVSajgwcUM4dlVKRVBQVDArSWdaMElXZnRkUlk5S0t1MFRNMDBq?=
 =?utf-8?B?WWhiTExTMUlYY09jMlRMUUlQYW1GRjRiL0JVMzhxaGhRRjFiczA4dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50415295-9392-43d0-0321-08deb1cdb475
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 15:30:18.9519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ym+g6zuwxblsUW6JFzgoZukwgnELBlyjG26KIUpyZxXAQ+xGXCyLnUJLqEkLIwlVgbrIbpsUb/QC2SyP9jz6bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7179
X-purgate-ID: tlsNG-ebf023/1778772622-407713FF-D04EDE9D/0/0
X-purgate-type: clean
X-purgate-size: 3182
X-Rspamd-Queue-Id: 3B682544101
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,macbook.local:mid,intel.com:email,msgid.link:url,citrix.com:email,citrix.com:dkim];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 05:38:32PM +0200, Jan Beulich wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> Add validation for C-states specified via the "table=" module parameter.
> Treat this module parameter as untrusted input and validate it thoroughly.
> 
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Link: https://patch.msgid.link/20251216080402.156988-4-dedekind1@gmail.com
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git be6a150829b3
> 
> Add __init to validate_cmdline_cstate(). Other adjustments to fit our env.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

One comment below.

> ---
> v2: Const-ify validate_cmdline_cstate()'s parameters.
> 
> --- a/xen/arch/x86/cpu/mwait-idle.c
> +++ b/xen/arch/x86/cpu/mwait-idle.c
> @@ -72,6 +72,11 @@ boolean_param("mwait-idle", opt_mwait_id
>  
>  /* The maximum allowed length for the 'table' module parameter  */
>  #define MAX_CMDLINE_TABLE_LEN 256
> +/* Maximum allowed C-state latency */
> +#define MAX_CMDLINE_LATENCY_US (5 * 1000 /* USEC_PER_MSEC */)
> +/* Maximum allowed C-state target residency */
> +#define MAX_CMDLINE_RESIDENCY_US (100 * 1000 /* USEC_PER_MSEC */)
> +
>  static char cmdline_table_str[MAX_CMDLINE_TABLE_LEN] __initdata;
>  string_param("mwait-idle.table", cmdline_table_str);
>  
> @@ -1590,6 +1595,41 @@ static char *__init get_cmdline_field(ch
>  }
>  
>  /**
> + * validate_cmdline_cstate - Validate a C-state from cmdline.
> + * @state: The C-state to validate.
> + * @prev_state: The previous C-state in the table or NULL.
> + *
> + * Return: 0 if the C-state is valid or -EINVAL otherwise.
> + */
> +static int __init validate_cmdline_cstate(const struct cpuidle_state *state,
> +					  const struct cpuidle_state *prev_state)
> +{
> +	if (state->exit_latency == 0)
> +		/* Exit latency 0 can only be used for the POLL state */
> +		return -EINVAL;
> +
> +	if (state->exit_latency > MAX_CMDLINE_LATENCY_US)
> +		return -EINVAL;
> +
> +	if (state->target_residency > MAX_CMDLINE_RESIDENCY_US)
> +		return -EINVAL;
> +
> +	if (state->target_residency < state->exit_latency)
> +		return -EINVAL;
> +
> +	if (!prev_state)
> +		return 0;
> +
> +	if (state->exit_latency <= prev_state->exit_latency)
> +		return -EINVAL;
> +
> +	if (state->target_residency <= prev_state->target_residency)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +/**
>   * cmdline_table_adjust - Adjust the C-states table with data from cmdline.
>   *
>   * Adjust the C-states table with data from the 'mwait-idle.table' parameter
> @@ -1697,6 +1737,21 @@ static void __init cmdline_table_adjust(
>  		       state->name, state->exit_latency, state->target_residency);
>  	}
>  
> +	/* Validate the adjusted C-states */
> +	for (i = 0; i < state_count; i++) {
> +		struct cpuidle_state *prev_state;

const?  FWIW, you could also init the field at definition, but I
understand this might diverge too much from the Linux code.

Thanks, Roger.

