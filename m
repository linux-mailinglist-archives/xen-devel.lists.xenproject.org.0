Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6AClIib/L2oCLgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 15:33:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E60C1686C55
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 15:33:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=coyytbQy;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1338233.1599235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ7RB-0002Ur-0y; Mon, 15 Jun 2026 13:33:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338233.1599235; Mon, 15 Jun 2026 13:33:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ7RA-0002S5-UK; Mon, 15 Jun 2026 13:33:12 +0000
Received: by outflank-mailman (input) for mailman id 1338233;
 Mon, 15 Jun 2026 13:33:11 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wZ7R9-0002Rp-77
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 13:33:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ7R8-00066G-Hz
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 15:33:10 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a2fff0f-5cb7-0a2a0a5109dd-0a2a4502b8a6-38
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 15:33:10 +0200
Received: from [40.107.209.46]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a2fff14-af86-0a2a45020019-286bd12e1819-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 15:33:09 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB6445.namprd03.prod.outlook.com (2603:10b6:510:b8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 13:33:06 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 13:33:06 +0000
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
 b=Yqf4FZxtpRvZO46Nle1h434sAn9mxWeDaHorHhoQJ/mn18prFirhiAd5hzPAQMq8biUFZMWttofO6W8tX8ovcCJY6UEO6cN1iF/uQSNPUkip4kMl3U0VX7fwfsHuablne+tee5lTVyPaexrskNaWbVy9KEckG8juC4udhW24voFDt4shPuiVoBwtfTSMmzgJVv6bnL4m2miEY8uRulIfAxdEoYEYuoKSYdw5vVdMfekhe8zjRpYTMN1oZYHpwq6vyDKLnQYk94jpHFhbHRX+mLUOxOJIVuRkU007LIe7Rm1bpCzszqlYWANuaIqo0E/G2vMYEd80cd38mkNRirBevA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0etnpRLG2gDKiRRytEWsD6hp3CKMLTn8Jq3WuX2LqAs=;
 b=JCCvuSPciIXD+DwI4RWWX7hRBLCOEkIkuUASOCLzzNZLaovHopFLcf/ulmaaIMpSExBcb4BvJR8fmyq5wvXuVrx0FWofgZe4hOCaNgEH5C4ey35x6rO5f9z1ThGNaupzziOSWk2uO2tG6HMNPbrds6WSX7hvx3z6SR20YIlC3qoHeUjYFxD0pqpNNgSwyZkdYEpBPL+YUhn55EP9QeHSA7OnDXIGdJfCZBRara25/dkeE3SegL401ylSO5Wy4EbaOi+gwNtvZY3/0vjwFUWfvTC/MIu1Q2aUV9vo6t3xnH2rVZrXOe9NYiyC075DDtZcpV5wmcClKS5Ji+Wkt++UyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0etnpRLG2gDKiRRytEWsD6hp3CKMLTn8Jq3WuX2LqAs=;
 b=coyytbQyctFZTp+huw0T+t2+dDFRJbwUymTcW9HOqhE3xtBAmFZMiERt3XmDSEjofnSdlIxWSqs3ZtMJSKD4ziNB/ONy1hyINvOsUT7WPsqWqWS6NtgDVuSMgwTfkdlbsbLxFy/jeuNzRjVbcteT2e3llpmLrUZw5+Dcc4Y8INE=
Message-ID: <e8bf355d-319d-481e-b27e-fc3561938df9@citrix.com>
Date: Mon, 15 Jun 2026 14:33:02 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 2/7] Config.mk: Update QEMU to include pip-25.2 bugfix
To: Anthony PERARD <anthony.perard@vates.tech>
References: <20260612230924.3181154-1-andrew.cooper3@citrix.com>
 <20260612230924.3181154-3-andrew.cooper3@citrix.com>
 <1781529998.8631fc262581453bbf619ec5b2062170.19ecb7675d9000701b@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1781529998.8631fc262581453bbf619ec5b2062170.19ecb7675d9000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0199.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB6445:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b888f3e-f63f-4d28-649c-08decae2a1dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|56012099006|4143699003|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info:
	1agi1aMcguXE1JEqE1+83bjQJf4PRaIuckGJOIdEL+HRyJjcQgH+GEj27Fx4vRzoUUdABZ5kr5uPYBbaFStAClV3m3hDgeGpE40SgjS2CI3/XWyAEG5ZAU9To5/RWj5LxW0Z3TEYnd39rt1tBwWUZkpSJ8g5y5URZOD0LzBVdy3+bVBn/ircZw1Xfjdr+PUK/YaGoFrad4ezoN+d3CfqM9foXqltInh+UtbbFkKUI9sx1gWHDiBPfQHDVUBQquc0fyezCGx0qbyXcQXFObwjeQQfT4iNYNbtlUtuELzcX5uxRJs9H/w08KIizSZEBEBoPcB+4VLeNf9VND1k8C76dADhhFfwfS5OlqyI2dAqlXf8HGrSLAAJQmUstLO9Md4CZ6LXinY+Bu2DPYKVwgubaxpqNVlHRAJRvdzW4gSjGsezsr1S50qyg2ZB8RZJSMNDe3H6k/G0Frie7i/THrVesjmcvXO/HoVB9DsIuRRQqABh08NG6RrvokCzx4xucfUQKjudfhi4oyUqoXuAY0SlxP8WTkQXPWaxJJ6fRMC9Vfq2E//7Qe8EGcGx6PqKjgeu4DL497FgiPnF9AniYnlk8TIuiMlE2kKsj93Orrh+DX699jnt6FeAxsH7Q6LwOyIHhJ6y/HUH1BTFiipg27SnN8+ImRYKqh4exx154YXdH+NsbR5KGcOSfLsHapnoX00v
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(4143699003)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDhKcU90cUlCWXdXWFdqdlpGdm51RG1UZjN5SEN4cTNuSXpDRFhud29GTkFP?=
 =?utf-8?B?NVcxSVpjSlF1eWRpTlo2bVhVSjRpZThuMUpYVE5jeUlqeWxyRXBrWlRScm0v?=
 =?utf-8?B?RGptYXZUN0R1ZXFjN3ZaOG52Nm8xaUJXMHAvWENpeTduWkRUMjRMUlFEVHR4?=
 =?utf-8?B?R2ZkY2IrbEJxcHEyaE9CZmpyMS9SK0JXcUxKV0ZmWG5jdzNKY1hCMm5ucndP?=
 =?utf-8?B?MDJTOU1TN1ArRW5aZWRpSmJ5d1dHRnFDYXBKZi82TElKZ2N1Tmw1TXd2Q1VY?=
 =?utf-8?B?OTIrQTF4Y0FwT3ljWHhRU0xTMy9KRjZFWTlpN3Bad1VkeGRFMmNxTmhjS0RB?=
 =?utf-8?B?dHFSVjFkVk84UTNYZGZxQjlwSWlLdGl1cXFHSXNLWWdNUXFsaGQvM2E3MWNk?=
 =?utf-8?B?WlkvazNGckFna04vbml0YUZHRTlrU0dwMS84bmZuRklRcS8yVDdKV2FRcDhr?=
 =?utf-8?B?NzkzVXBlSnF0OWY5RytXNXpMZDluS1dTYlBTSGlaUUdlY2l5eDBUM0NtZC93?=
 =?utf-8?B?Mm1ZZU40N0tzOThUQ2lLUWFDTktuQWVoVlZ0OFVYcC9uMXZiQkhoR0J3ZDBH?=
 =?utf-8?B?b3E3NlZBc1RSaEZ5ZmtyeXlQOEVUYkJhMXJSTGVqbXR3ZThIMS93NHhrVmtD?=
 =?utf-8?B?QUhWdUwrckt3dXRHRFBtRDRyT1VaRlh1ZzFtUlN1K1FPcHFrcHh4R3ZxYnVC?=
 =?utf-8?B?MFhxYzR3cnh3bUJvdE4xZExPV1pFM2lSSFgrQmN6aHVlRzV3eUxSYXRjK1JM?=
 =?utf-8?B?L1NIMEIzM0p2NFBJNCtpcWM3bUxLTEFIcnh4NC95MHpRd3dBK0NKLzRnZHhU?=
 =?utf-8?B?dkw4ZFZ3enk4MXVWdjhXakJPdUh5aVNTY0h1UzVKVnRzK0kzcTl5eUJycE1Z?=
 =?utf-8?B?cnlwNDRTeEE0djh3ZkZuYXR2NkIrd2k0MXY1bmlHV2JzbG5iUFkzVDNVUFlj?=
 =?utf-8?B?SjJWZHdBcDYwNnFoN3Q0MlFKdHl2ZnpoZEQ0ZHA5SzU4WVBWMTlhZWd2R0N6?=
 =?utf-8?B?OUo4TGFnbDl1WE0yN2NETUJNZERoemE1d3RVWXhWZytSeGJWdkNyWk12bEUw?=
 =?utf-8?B?aVh6NTRlWW4rb21LNDJoV25naVVnV2hTZk1lUFNSVXZMMjRaVTNrTTdkejBF?=
 =?utf-8?B?aGVtQjkyRVViL0wyUTE2SjJ5UVE0KytHckhKRU50UCt1VjNQUlZEV3VRMEhB?=
 =?utf-8?B?N2o3ZkFqSVMvY1Rqck1UenJrTEphZVQ5NEVFZ0kyTHJibCtMQkNxME13dTBz?=
 =?utf-8?B?OWhubHZNTXpYVWxBT2o4bk9sYkl2RUt6eUxqaFdZajB4UitmWEFBVUJjTitz?=
 =?utf-8?B?QzVFbE1KczlVd2FEVytFTkxyd3Zld0FocmtNTmRKRzNpU3R3YzdhWExZOWdk?=
 =?utf-8?B?Z1gwdkNjRVJLLzQ4NkQ1aUxnRENwZFFQbmdRYitabEtqcUkxNnBHV3JvN1Bx?=
 =?utf-8?B?bWI4OTY3TE5XT0E1WlVMTjNrYmJLTFlHVTJvTmI3ODFEL2NhdWlyWHljWVBS?=
 =?utf-8?B?MlpuMnlKN09UVEpoMUl2Y0JkK0lkYzZIZzBNbXZNbXAwVGtVMzhXTzNLVEJH?=
 =?utf-8?B?aFVXMEtOT3BROXBxcHQ3enR5QmJDeXFhQUc4VkpGR1Y1TmdKdXZySDNPL3d1?=
 =?utf-8?B?ZjU3YnpPdTBmYXBZZ0FteCt1TjhObXhPRXJLU0pCcW5tcDhFKzIrRWxpajlM?=
 =?utf-8?B?ck1raWFrL3lQbW9yZk5YNzhabWpGdGFGSWprT2ZleDhIdHhjRE9YZEZWQmJu?=
 =?utf-8?B?SDhrQVFQczFwdWZVTXV4c1liUzZvdHJEclU4Mm5vV0F5bWtZdHVoZnc4b2tN?=
 =?utf-8?B?WXd0RDFkUjl1OTIzQllvV0Q4a25XTmJ2Z2I3Q20yRnRmWHZFNkR3Qi9XUnpy?=
 =?utf-8?B?a3AxSCtROUtYeWEzdmtsekxSTUttd0hUQkJ6endUUEhDVmV1U0VwZFNsVXZh?=
 =?utf-8?B?MllnaXQ1TFM0MG5tSzh2cGluWDJ2ZHJNNjZ0K3l0VlBrZnBkQmZGeVhBZlAr?=
 =?utf-8?B?enhxQ0tvRTNTNzZxTW1rRTlhMVorS1NyV1NraUFwMTNJS2hzVW1uVHVwZnJy?=
 =?utf-8?B?cjlobFNadXNZY3NST0RlWG9LZlhKY2FoN1VqdkEwTW1ES3ZNVmZzRWZONUxW?=
 =?utf-8?B?ckVKbktKRnJtRDRWVzBZZHJiUUlZYmZic2QxRG1yTmd2diswVytaUFMvQzBh?=
 =?utf-8?B?Q1lWa0U0ZHJVV2FZcklKQklLeWgvQ2wrN2o0OStTa0FLRCtNUnUvMlJwbmJX?=
 =?utf-8?B?cnNkeGtQUnpLbEFYeTBTR3M0bHhhYThKNTBEZG9kam1HOWpGUmdrVEhTZ05M?=
 =?utf-8?B?WW52bExtcjdPRTVEU2d1T3BzTGtyaWNIa0F0Z0h4a29jZ1FyQ3FhZnJZK0M3?=
 =?utf-8?Q?eRKuPc9dkMcn/XyE=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b888f3e-f63f-4d28-649c-08decae2a1dd
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 13:33:06.0997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: itSudPlw4mcqnN2k0gYqxASKyuicIu1VLY3SZrA5ZqIFfFUPQaJIhdE9gijYn/FPAT7TVjqs67ZHFwrv3yNc38ZImMFrgEChw0Xbzw+z80I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6445
X-purgate-ID: tlsNG-720697/1781530390-AB36C161-23134CD6/0/0
X-purgate-type: clean
X-purgate-size: 1136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:oleksii.kurochko@gmail.com,m:anthony.perard@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[citrix.com,lists.xenproject.org,kernel.org,amd.com,cardoe.com,invisiblethingslab.com,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E60C1686C55

On 15/06/2026 2:26 pm, Anthony PERARD wrote:
> On Sat, Jun 13, 2026 at 12:09:19AM +0100, Andrew Cooper wrote:
>> Specifically:
>>
>>   commit 6ad034e71232c2929ed546304c9d249312bb632f
>>   Author: Sv. Lockal <lockalsash@gmail.com>
>>   Date:   Mon Aug 11 20:01:59 2025
>>
>>       mkvenv: Support pip 25.2
>>
>>       Fix compilation with pip-25.2 due to missing distlib.version
>>
>>       Bug: https://gitlab.com/qemu-project/qemu/-/issues/3062
>>
>> which cherrypicks cleanly onto qemu-xen.git master
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>>
>> This needs putting into main qemu-xen.git first, and then the override of
>> QEMU_UPSTREAM_URL dropping.
> Done, you can use 0edeb44c093bea39f0fe4d936ee363b99113ffe1 as
> QEMU_UPSTREAM_REVISION.
> The only difference with you qemu-xen tree is that I've used
> `cherry-pick -x` to have the commid id of the original commit.

Yes, I'd meant to do that, but I was rushing.

>
> With QEMU_UPSTREAM_URL change drop, and QEMU_UPSTREAM_REVISION
> updated: Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thankyou!

~Andrew

