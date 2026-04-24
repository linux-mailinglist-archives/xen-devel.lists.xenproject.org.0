Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APReL6s162nRJwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 11:19:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 207ED45C0FC
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 11:19:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1293339.1571137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGCgj-0008US-Sy; Fri, 24 Apr 2026 09:19:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1293339.1571137; Fri, 24 Apr 2026 09:19:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGCgj-0008RT-Q4; Fri, 24 Apr 2026 09:19:05 +0000
Received: by outflank-mailman (input) for mailman id 1293339;
 Fri, 24 Apr 2026 09:19:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wGCgh-0008RN-VY
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 09:19:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wGCgf-004CWq-Qi
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 11:19:03 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69eb3581-bab6-0a2a0a5309dd-0a2a4507ce90-12
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 11:19:03 +0200
Received: from [52.101.85.42]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69eb3585-229c-0a2a45070019-3465552a0f60-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 11:19:02 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH4PR03MB7697.namprd03.prod.outlook.com (2603:10b6:610:237::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 09:18:59 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 09:18:59 +0000
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
 b=U//UUp+U1xy/Xs4PKLqNFGsRsLMkU0+CrnEeb9p1od1K6bg6qdsS2BmF33Bdn9CT3O130R/Xr6Kq2riR08mcdjqpMCm+0mgLDfjENYRX7CekkVaY05sdBo71uJZPwCrBX2wdBQzhUWXvRpyHG17rDQvNcBk2U+mFD16GhIFM1TdYHeSSFVLF600mWJ0JWUBzBWNal0lEnOIKxcqxGTG4b7PcQ0+/P6cYLmY6ongU1hx5k/BuulUY90F4+3boCuStQZGnLGy9In9OOolA04dgzN3DSg8Q+nnleOzQxX4Rv71l96ZBv64vFOZJsOUDUIGW/rkOobFQKBf0AgA+vG5TyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFUNOq35SS9TlXGJ1fGi37ywXBa40Ktwa2HkQYkPPtA=;
 b=wNqASm5AezAzef4+XGGMV3XWWJ9Nyb30q2Lw/ZIlDK+a6dKFlbMHNTnmOvJtICs1wQCF7W4tzV+fiBHhB8FTujtPqmfXkylnvfpM0bepWh0F3kwhrBGcJWsfTZJz1u2WYojZM7iYcQoBK123cVraGwdXuhJ+TA2JybX0UqIWAwhWTBvJlJfoxx/m18bDOcv/3iUQnar+2c+2KQuQAZeXqeJTY/ihE9a7rB6ngmRwFPcnaLPJnkJFhMgCnHqpZS1xQqScnh4OS72C2kUl+78pTipo8eUy12/dMKh2i22NZ9iUYv25ESrodExZ3xznl4XvyBEV3kPCHhwL3IeQpneyMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFUNOq35SS9TlXGJ1fGi37ywXBa40Ktwa2HkQYkPPtA=;
 b=arVVJxLwWXVxixkTzxWgz+neYhArkT3NL+Wa8x07Wvc5PyX2kFudKXWKOsUnMS5n4+MsSENcbFmlUhMROG1TMG3K8i/qwxPO0/9RY/7pROpMYjD0QrQmZ5u1aNMzL7MnEtBVN9WvdaRVjrzwYgoAs89rTqcCFoZ8Sed/RTGn/PA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <60c94a2c-a414-4ba5-b22e-54beae3c25f3@citrix.com>
Date: Fri, 24 Apr 2026 10:18:56 +0100
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/amd: Drop allow_unsafe parameter, tune down XSA-9
 mitigations
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <1776877188.8631fc262581453bbf619ec5b2062170.19db6223737000f373@vates.tech>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1776877188.8631fc262581453bbf619ec5b2062170.19db6223737000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0416.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH4PR03MB7697:EE_
X-MS-Office365-Filtering-Correlation-Id: 978621f4-e7f6-4ad9-3620-08dea1e284cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Mde7VDmcvi8qj3JTOLi+pmvf4FE2BQ/rN9zmFKjwFkfOiJAK4K9ZpURkXNNIfc3pPnAZnRjGuFvhdcG5iZQ12X1KQ9RnVBjSvvOgY8swytd1qXdrsZZP1kucV1++3eDob1JA0uXRLVXTW99uu4gyQ7PvL85ZuB6XPOCxEGntFu3DWajXZSFKrTv3h8fIq6assFf6LH/s94CsXTBjcxnAASTETM84e8XV/Py5/FeBsC/7UAMCRCEfnEwoHSQnyhVQ+xHmNq8nHwMeG0l/nqtEuV9gom/NkcsIwDiK9cD89cVQLzEsvUHX+AnOWdv2QQ7pm87oFzj+He5LSaSJ3le1LjULOJpUIBeyp702d5b7OIy6Z9GHRR3OheIas0ndxLqV9NUOMM9Uoq7p7zI3D/OpaLkup5lql7djB2iVZJAAEHFtFs3rInnSLYZXluY5EYGhabmvpMxM+WIdJidahBrcZWyJgFKV+YjcQ/HWbfiofs7ZCEchOFUvfZqitjLRw9QdKMA+zOupbO1hPtZDtMW13ecr+/AUShLGLrT3mei46AofOJKyHxDiVjzFxc8CctVmXgckHOrD7T4KYw7mnbozcpEbWEIc3coH3mlwbtAtHT2AZeHkJ0MYf+7pf320mx83eDNTPXZLntjtVTZSlAflC9CU45+eQ6m0mgSlYbihOKEP/JhbVJRaEwUzt51Kxp1Yr4vowuj0aa0OxEl6BvBwIbjX2jD8GfE6FsjBvr4Rj0A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFl3a3E2V2toeHcwcjZ1WmVxNEIyYmxHdExTQVVEdHdtc0pvelNGQks0bjlQ?=
 =?utf-8?B?b2hSUC9oWUdIbmZtTGpkbUFTU1AwRk9yV0poUlNac3BWLy84QlhlT1ZMRk5B?=
 =?utf-8?B?dnMzK2xCcXB6L1VEN2JHWVkvd25RNnc5YmNHZFVOS2xxUE9oaEljbE1yRVVX?=
 =?utf-8?B?YmdRNDlOWkh4NHhsSmpUVmxKV0MzRnY0VXRpL2lQS0RQLzJScmNxcm8yNWp2?=
 =?utf-8?B?SjM2eFZTTmt3a0hpVGVDV3UzMzB4VmpJWTFxT3d6TjFESHN3bTdWU1VLSGti?=
 =?utf-8?B?Zjh5L1FsdmJDdFVmWkc2RUswVVEvY3k2STlyN3NlTWdYck1DZytOMGVNUHlh?=
 =?utf-8?B?dnFqTmM5ZHZiUnU0UzZQaDRPQnVnQmFzNTRITnhpUzdsZi9xc3ZMbGJYTWVI?=
 =?utf-8?B?T2hXS1p6T1Nyb000MGhqS0FJUFpMVVNud3BrODlMYXhWd3pDbVN1c1RxTGd0?=
 =?utf-8?B?d3p6ak5HelhrU2pWYkdEUWZTNVkzNkJXUnp3c00wVCtpM0NGSmdPYVprRXYz?=
 =?utf-8?B?ZG8vbXNFeEcyWkJGUjVSc25MWUZldk9UR3F0NUNIUXRuaGxkUk5rNXpqSDR0?=
 =?utf-8?B?TWYxN25kM2FHM1JRU1FmS1RlcWVxcE5yMnhVdVFmT2xRK0FRY0R0MGM0WEJ6?=
 =?utf-8?B?Wml0aGJENmxwaGlIYkNwaUZEZHFkdy96OExpSittMmZ0QWxCQnZVYXFoUVZj?=
 =?utf-8?B?VWFPaUl0RnJTNWppVmlJQTMvSjRKem9Oalkvem5rUlgxbUFIb3V1bWw0OS9R?=
 =?utf-8?B?bnBGR1RDSlg4QVQ1REs4dmNpUkdQY1lWRmZrU2wyTU9zM1dLOGsrRUc2WTFC?=
 =?utf-8?B?Nmh4NWM5Y0tLY0xCeEp3cjVSN1JGN2JjeWFMem15c1ByVG1Xc2d4MExCRkJy?=
 =?utf-8?B?QVpVdzNoM0tYMFFqNUpNcFB1Wkh4aDgxOFdHdkZ6NW04bFd1SkJsNlh0eXV4?=
 =?utf-8?B?RjRqZFlKM0o5QVVnU2lha3NMaW1LaW1TQm96WDlvYytLTTBRdjIzN1hYYkJo?=
 =?utf-8?B?SU5Udkx5RWsyVml1cVY0TThZRmc2alROTUs5SDd6cDZYcHdhZG1ybFlYelIw?=
 =?utf-8?B?TmZpdG9pOWtQYWFDYjV0VXBpNmNEN0ZtcnRnNVc0SkdKSk5SSTVDZE1uTVNH?=
 =?utf-8?B?dUNYbVdkWHVIZVNMSW5DeG1SSlpGNmtCNXgvSUN2NEdsekJNaC9HNlN5TzVJ?=
 =?utf-8?B?Tyt5LzA1L3J3ZHZGb2RHOGxLSDBxdDhMNWh6ajBsWlBvQmVDdi93eW16L3ZR?=
 =?utf-8?B?UnJGZURybEMwWlhDeC9oR2c3bVY4b1dpQWpHaVdKbDFEY2p1NEk5aWZNSFJa?=
 =?utf-8?B?a2ZTL05FV3dLejFYeDVFWFVFVDVSTW1xSU5OK1NVS2RDUXpEd0V3U3N4REdt?=
 =?utf-8?B?ckZjQnlWNUVrZFMxZFY1VTVVY0pHeTRTUEpnZE9HQUJVdnNsYjB5SXJvRW9H?=
 =?utf-8?B?STV0WjdKeTdLd2o4aXY5KzBMcWt0Q0ZtR3YwWEszUW5sOHJtd0Jid0cwLzNa?=
 =?utf-8?B?Ull4VFZyVThIWkVQVExMcFJyczR4bEhaTVhWTWhPTkxvNDN4aldNNUkzMWxX?=
 =?utf-8?B?Y3JEdGZHNTNTY3c4ZkdKVStJYjJsS0Q1cUxCckMwNXRiRVY2UFJMbjhwemQr?=
 =?utf-8?B?SW1xcGpoMSs1bHYyWjg1TDYwSTJudEtiZG4rcHdGSk11dVZxbWk0QW0yODNN?=
 =?utf-8?B?YmFUazhWWk5nSTViZlF1UFMrOEFwZlR2VkgxM3dhSG9yMk5ld01GTVRzN0p0?=
 =?utf-8?B?TVBjczNXdUwwdXNMaTZwQzRwSm0wZDIySkE0VmRMUEdxeDNRNkVTZUpjQlQ3?=
 =?utf-8?B?RkliNWVUanV5MnNaNzZBMU9PNFhRMjMrTnJ6OVg4M0ZpVVBuMXJmRnlnZ1hI?=
 =?utf-8?B?UGVBcWFydStlU0FRbkVHcnNvQ2pibmZQWHluQWNvcE1JdlJWR3FPL1dDZ29y?=
 =?utf-8?B?L3p3emhGVXM2SlRlMjQ4ODgwYnhheXFKcDZsdmVpNkZGWXBTVUlkVFZIZElo?=
 =?utf-8?B?N3UxaEVFTHhwTUE5V2w1RDZWdG51Qy9kRkQzUERTUG9CUnk4SHEwRmtJbWV4?=
 =?utf-8?B?YTZrNXUzMDhpM3dFSnI2dG91aFhFT2xPd0ZrZG0xN214Rnc5TXExWWs3aVBO?=
 =?utf-8?B?MFFjRHB4R2paU2xGU0loUmZ6Y1E4b3VBSVBlbkFpeVZHUmVzRW5RSXM4TTBL?=
 =?utf-8?B?c1VwN0Z3VXZVTzNTbUd4dkx4U3RiR0dJazhGSm5ZZFFxblk2V05lT2V4U0JW?=
 =?utf-8?B?SElicGVHNzR0ZXJjaW9rWWhBbk5tc1hTdkQ5bUszek56U2ZxT2VCbUx0dW10?=
 =?utf-8?B?Ylp4M2d6MnlHS3JuWkJjUUt6NWdsVkJPd3NnQktMQmFURUY3cXdBd2ttRk41?=
 =?utf-8?Q?tnrrl171+jyNTDVc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 978621f4-e7f6-4ad9-3620-08dea1e284cf
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 09:18:59.6849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eftfF2xRWUKP5hT0irV4vStcVF5KgmCKr0bckp+tLEVXOvJ7NBaM/GZ0FBvDGQVEpBqfFgcYDHE9SrmMTNDIZ/XIWp6Kw8eeQ5wL8cydTIQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7697
X-purgate-ID: tlsNG-ef75cf/1777022343-15458C48-77D3B104/0/0
X-purgate-type: clean
X-purgate-size: 1680
X-Rspamd-Queue-Id: 207ED45C0FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

On 22/04/2026 5:58 pm, Teddy Astie wrote:
> XSA-9 mitigations prevents Xen from properly running if a affected CPU
> is detected. While the vulnerability has no mitigations (aside not running
> 64-bits PV guests), it's only outcome is a DoS.
>
> There is no real point in preventing Xen from working here and it would
> be preferable to just log the vulnerability to the user so it can act
> appropriately.
>
> Also reword the errata message regarding that it only affects PV64 guests.
>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> It's hard to tell whether or not we would want to drop allow_unsafe, but
> currently, Xen is allowed to boot with XSA-304 mitigations disabled
> (intentionnaly) which has a similar outcome than this one.
>
> From a user standpoint, preventing the system to boot or starting guests is
> too extreme and would be in practice seen as a bug, even if it's justified
> policy which can be overriden.

There is a lot of history here, including for why the panic() is
actually completely unreachable.

I actually have a very similar patch, from almost certainly more than a
decade ago.  The difference is that now I'm a maintainer and in a better
position to say that this logic really shouldn't have been taken;
certainly not in this form.

Perhaps an easier justification is that there have been issues like AMD
erratum #121 prior (e.g. Pentium LOCK CMPXCHG) and post (Zen1 has a
related errata, can't remember it off the top of my head) that went
unaddressed.

There is a reason why most OSes blanket disallow using the page leading
into the non-canonical region.  It's rife with bugs.

~Andrew

