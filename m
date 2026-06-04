Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YIsJNc+MIWrkIgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 16:33:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4CB640EA7
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 16:33:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=eXNYS8KF;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1327959.1592636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV98d-000484-8C; Thu, 04 Jun 2026 14:33:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327959.1592636; Thu, 04 Jun 2026 14:33:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV98d-00045G-5P; Thu, 04 Jun 2026 14:33:39 +0000
Received: by outflank-mailman (input) for mailman id 1327959;
 Thu, 04 Jun 2026 14:33:38 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wV98c-000458-0S
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 14:33:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV98b-00AUbE-DN
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 16:33:37 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a218c73-bab6-0a2a0a5309dd-0a2a45069744-46
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 16:33:37 +0200
Received: from [52.101.61.63]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a218cbf-7371-0a2a45060019-34653d3f2b52-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 16:33:37 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA6PR03MB7567.namprd03.prod.outlook.com (2603:10b6:806:43e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 14:33:33 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 14:33:33 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dstMBRxZ5Wt/VokSM1ZYCdJq5yzVT/xyjeoRBQBS1UAhdUNrxkW1s74p+0eLEMvlM771M4I0E0vGIXOSnR1keDlCqqDfFFExVJuxv1xSSpaIQc+BOjER20Jk1iyPI5ujfC7Nmm7nMXZuceDUR1ahtrI7rrovzazTNLRgWx8pY8A3qZD1DoiZ+vQFu9dUvY7FXulG+O3P/PeLeDLxR0jsgRlQIdEXz+XwZwDXNNVnQOQ30FlP6cOojGgDedApyIVWxoyoapPCHS3keIdDrsyqoiY013WNKpKmYH4fVtQV3UfH9zPgkzfKJdPgsXu08xlW4nR22giJmD6dxpLD+5dqmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cmH+XJsS2FbEJhkNmrc5TcFfyQP3UCxdJaPWlgpUQH0=;
 b=fX5mJr7sVD7tFQzt6SYOb26rs2NkQOHS2MVbUzbe9yjy1jSkWp+DEvgkH4XCIDX/AwFvqPPbFbI/xlfR0woptvn33BrAoZ2zx4rJwUUST5GkdfA2hbq4DGmEccW+W6qf2Gryt1A6Wd1Qu4gzzLvicuBTsV8Cp5eo9UB5JF0adzFt46HAQysJK4f2ifxBy0vACaZbp12g8YlnJnCT4NapS4DpUEii8kEKjb9PlbWaU0E8k8vLvHPB/hwk2wqCzlbE2MnurJ69AZe6DhNnmApLAMy4rKDT4cX6d+HPrsV74/+2fkj+DDTsS2dc2wMmu2Rb6qkPUaoaq8GZtXq4PlbDRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cmH+XJsS2FbEJhkNmrc5TcFfyQP3UCxdJaPWlgpUQH0=;
 b=eXNYS8KFWxacwnWSUIGUN4UimSp3JwbQMrAkajRdqJmqOxwr7OLFIgDcQLH3xVZGNGr6I8OmimArB8IoSyMCv3LAdCJsqfF+3C+IR7PnXTV2tB+IrDzW8uUU6h8qskB+CE7H9GEXjEaYqQgFBx6DXy3xxhIuAoC/qvGPthfozmQ=
Message-ID: <f975ad88-522a-4e0f-98b8-28d2ae25afb1@citrix.com>
Date: Thu, 4 Jun 2026 15:33:30 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 4/6] x86/efi: discard multiboot related entry code for PE
 binary
To: Frediano Ziglio <freddy77@gmail.com>, Jan Beulich <jbeulich@suse.com>
References: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
 <20260529153531.1341542-5-frediano.ziglio@cloud.com>
 <dea51228-0eaf-4e30-8ca4-fb4a5077a624@suse.com>
 <CAHt6W4cxh6bQ=zY4e13cG=nvsNVyd9cMx_T8ajNwaAT19tu1Lw@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CAHt6W4cxh6bQ=zY4e13cG=nvsNVyd9cMx_T8ajNwaAT19tu1Lw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0431.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::22) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA6PR03MB7567:EE_
X-MS-Office365-Filtering-Correlation-Id: fd2aff4b-36e2-4743-f3f7-08dec246417c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	kWrOrAS2DZ5+EcdBLTbivMJL1VCvI44Vu+vxBzgxuk2pHdb575+Au54vL0zS7MhQgnPqmKKisoQ2ngk0YCu5LjHlR+aNei28s+yHqqagAINC5kQ/YJmvufPofEhcBBfJk7B0a4FUfyWeCf7O/yKnYlAG1CD3PXZ8Ogh2CeHP/sMSbvl+WTSZlcfTiTYqUoTgZoKokW2xzftkrdmm+U0O89yu9B7yP4O7vftwXt4nZ1p44uFN/iV13aD8+rnWrR5G+YwBewQX2MnIrm3bJgKdGn1KCdvd6GgyuhkdXTuiOllXUz3d48pEwabJvH1cA2pcjm5Nw36UGoBG4FqHK55e8xf1x0idBlsj0cdn3U54k4p27rICCk3Qkl/iaDuOxksKazTgapAFdXJ0v1SMPcBqd27Ugf8hGW/nYsvuqBDRNoaYg7qckSEyeltG0cv4nY74fjn1gd8vwCL9uZeNe4HDhgzZk5XvkQCW9sEYskpourJZ17CVbs4spCZh9FVx5dkdVYv62QBTUJIozYCzWsDaADeS//7zRvXA+FDJI7tk2T68xCP/rk10fibarun2KzfI172o8dym/00BxyacKSyNReLF7BK+hSgov5S1cbTGyshLD+hVHEY+2N/uWCGm6Q+BAfSIrDTrtkAYg5GNSeNRuPcOQWFkAokp78SG4K36kWsN995hpRlmH/1COX7RuXOt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bU4vWm1wQWEwSURMdzhrc2lUUnBnMlQ3TmxTOXo0OStUSXcxa3pETWkyaDZW?=
 =?utf-8?B?NVIrOHlKUGNqTEhWcG1Mc0F5VityTUtHNXp6c21mVmJ0MnFWeTRGZkIzODJI?=
 =?utf-8?B?Q2I4SmVQcWpMYjVRdXZUMXNRTUNNVUxac1FodzZVemUwaEpUQ2daS215b0pS?=
 =?utf-8?B?aUFPMEtoQnZFYnpYY0o4OTRBSTU2TytITWsxU2RkMHZkWnhlNjJOK0lxM0pH?=
 =?utf-8?B?dExESElIL3Zud3hqM292alBiQ0E0eE5vTjU1a2laZ0lXZ3pPTzZ0TEd0bmJv?=
 =?utf-8?B?cHV4MlQ3NXNLZEkxejEzRHpJaDNaenJ0NzZSYVpCbXJFMUoya1NzQzN1VThw?=
 =?utf-8?B?dWpxbFkzbnNLYk1WdDhxYmtRd244ZzhvdmxabkU1TGJMNlRUNndObW1DbjJ1?=
 =?utf-8?B?ZnZEUG1lQmZ2SVpLYjFTYWJOMUFwckZzelE3VGdSVzA0VlR2eHI0WGJKSGpU?=
 =?utf-8?B?aDhIR1hJbXJyZDhtYmNObS82dEJ2WXNRUW5sTlZLWWEyeW9WaE5HbCtVMUIx?=
 =?utf-8?B?S0ExRlo5U3NDOFZveGRaMS94SmRnS0FFY1pOOE55VVZoVlFHT2hLMHJ2ODBr?=
 =?utf-8?B?QnVSV3V5SHg0Nm1YWjFEMUZpckc0c2dyb1lFWUxzbEV3b2dJVzdTdjFNbkRS?=
 =?utf-8?B?UG5kVXRHOE1WRzNHR0VHaVJ2OWRTUkkzRVFyS1o3TXVXQm53OGdrdkt4TVBY?=
 =?utf-8?B?OHNWSWFuZ1A5ZjVNRVRkV1pxR2c5WEhnT1MzTzdyUUxOM3JmWGJYd3ovSEhy?=
 =?utf-8?B?dXg5Z2JId1BpT2tMbWZxTjNIdjFVeENlSEF4bzkzN2l6cHcrQ1FtZXQ2MHZt?=
 =?utf-8?B?Ymw2eG0xVHpVejI3dmdrMi8yMFNDenZJVW1tVVlwYWVQZHFBUXYraWgwb1Fi?=
 =?utf-8?B?WFlGcUJEamhsaHpYc0lIWXB3OTUwVHEraWVoajhHZ0JQSUtLMlpXYXJ4bm14?=
 =?utf-8?B?a0s1VHVQeXUrTG8wcnNmT09IMFlBVzhFT01kMGtKMXdESXBSVEc5OFZwUUlq?=
 =?utf-8?B?MWdqR1Q5N3gyV2F2dVF1NS9jRmI0cUl2dFIrTEtub3Z5Yk03ek5xSGhabEFZ?=
 =?utf-8?B?OWlkU2RDRVAvRWdLMWk3K0ptNUpwa3Zwa2h2QWd2SlVydFV2dGtjR2UwNnZ1?=
 =?utf-8?B?MVoxL3RqV0JveUdmaXVUeUxNMy9FWEhRcGZvK0p5RWRXdlZ1N01FbEQyVEpi?=
 =?utf-8?B?N3dwODcrYmVUNFRtZTNQWHNCY3JZZVVXRHlZaTIzNzV5dTJnZVpZdU51SmJI?=
 =?utf-8?B?RTBYWTgyUC9Hb1BKSmZDUS9GMGsxWmlLZ3htL1p5QXJXTWljRUJ6Q01lVWZn?=
 =?utf-8?B?bUNtc2o2T0hKM0ZFS1p5S1drWVJNSTZHT2p0Q2RscEZsUTE3Y3ZMdVM3TlJM?=
 =?utf-8?B?QWJRM3hkeDBHb3FTeVg4Ykl1Vm93SkhZenZ0a1BtUHZWS1JWMGIxRS9kbHF5?=
 =?utf-8?B?VTRxNzU2NXU0Z0hob2gwaEFrVnJjdmdPWEo3MEk4L3VxQVpFeS9ZbDl0clJm?=
 =?utf-8?B?czhWSjM1ZURLQnk1amt5ZFRxdkt4VWNNbzRjME9uemkyZ0dTdWJGUzNUY3Js?=
 =?utf-8?B?Q21MQ0gvNmd5TDl4VFJGQkR0b0FNaStqamVFaGZiK2Fkd2RRTENzMXljVE5l?=
 =?utf-8?B?Qk1kMHZMLzNPMyt5Q1M0K0JqQTJYaHg2emhia251Qyt3b1lRN2ZxSlJYeU9Q?=
 =?utf-8?B?aHI3cThncGYxdFNBa2ZQQzROcTd4MXpPY2J5QkIxNzVWaUs0dzZSUG1PQ0U3?=
 =?utf-8?B?NG5aT2U3M0dxRzFJamFvM0hGMzhhblNxZGo0akVhWEl0aU4rWXNJRmxFUDFW?=
 =?utf-8?B?WGVTYWxSV2JCcFNMbDM0UTdMYzZPbG1DRS80NFJYN29JSFkxYlp4ZnZZcE8r?=
 =?utf-8?B?aVYzVkk3bElBUEpRVVI5aGEyU1Z5c1c5WHA0UG0zdXVFMDZTL3lVQ2Z0TUts?=
 =?utf-8?B?QkxvdHhBRTZuSzY4ZHJETWRRcitvR0JvekFlbHJ3MjlpUy9XTERrM3Jhcnly?=
 =?utf-8?B?WGpqeGpVdHg0U2RrRHM4d1U4ZG00eEc1NWp5MEcrUWxMK1NVbVhaWUVrRUVZ?=
 =?utf-8?B?YmxhNHBzeEVuZmYyQTE4S0ZuNlBxeStjUXRTVURiUCtCRU00Ykh1YTRBVEVL?=
 =?utf-8?B?Y2xXMVJ5ZzNJVUh6Ymdia3B3ZHZxNHlGRkp3aGZyUlBOZG0vM2ZheEZYdHFz?=
 =?utf-8?B?YTE4cHdtWVJkR1VjZi9KdTFKV21ZUE1TNUM3U3lXN29VNEhMNHlSYmdWVDNt?=
 =?utf-8?B?cFJla1Q3aCtLdzNWOUtZTGVSeWtzUFNLQy9CTytiaG0xOVBVOWZaZ2l6cWRI?=
 =?utf-8?B?UTBYWGYxRjdOQVNEWWxHOTVjS0xScmMxOUhKUUM2dlJ4RkJTRUExYnlnUlNa?=
 =?utf-8?Q?A4QRiSlPM6bRD3Ms=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd2aff4b-36e2-4743-f3f7-08dec246417c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 14:33:33.6040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JP1LvOhRaAS3o2l2odrekdqsL0OEIV4O+8jsWrLrVYrFIYIKDrcL+/MvAW3/qjv3BcXrxeIftvc7mttQOyAHt3cTlx/KfUKksK0CJgdTKNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7567
X-purgate-ID: tlsNG-16d1c6/1780583617-8C87AD75-FDE261B8/0/0
X-purgate-type: clean
X-purgate-size: 1113
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:freddy77@gmail.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:mid,citrix.com:dkim,citrix.com:from_mime,citrix.com:email];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,suse.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3F4CB640EA7

On 04/06/2026 11:32 am, Frediano Ziglio wrote:
> On Tue, 2 Jun 2026 at 13:17, Jan Beulich <jbeulich@suse.com> wrote:
>> On 29.05.2026 17:35, Frediano Ziglio wrote:
>>> From: Roger Pau Monné <roger.pau@citrix.com>
>>>
>>> The multiboot and PVH entry points are not used in the PE binary, hence
>>> discard them in the linker script when doing a PE build.
>>>
>>> That removes some relocations that otherwise appear due to the entry point
>>> code in head.S not being position independent.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>>  xen/arch/x86/boot/head.S | 3 ++-
>>>  xen/arch/x86/xen.lds.S   | 2 ++
>>>  2 files changed, 4 insertions(+), 1 deletion(-)
>> S-o-b issue again.
>>
> Even if I didn't make any changes to the original patch ?

Yes.  Everything you submit must have your SoB, per the DOC.  It is a
declaration that, to the best of your knowledge, the license is compatible.

Honestly, I think this patch would be better merged with the prior one. 
Both are taking out multiboot content.

~Andrew

