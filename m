Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKrIOEDGwmn/lgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 18:13:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 297BC319D53
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 18:13:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261195.1554301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w55Jf-0003WH-G5; Tue, 24 Mar 2026 17:13:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261195.1554301; Tue, 24 Mar 2026 17:13:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w55Jf-0003TN-DA; Tue, 24 Mar 2026 17:13:19 +0000
Received: by outflank-mailman (input) for mailman id 1261195;
 Tue, 24 Mar 2026 17:13:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1w55Je-0003TA-4M
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 17:13:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w55Jd-00BWC5-GU
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 18:13:17 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c2c626-e002-0a2a0a5209dd-0a2a4503eaee-16
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 18:13:17 +0100
Received: from [40.93.194.61]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c2c62a-1947-0a2a45030019-285dc23d7258-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 18:13:17 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN9PR03MB6121.namprd03.prod.outlook.com (2603:10b6:408:11a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 17:13:03 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 17:13:01 +0000
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
 b=odkKdcaaSitncP5QxgGaT51LiU0AZo+ox6n+KrVwBWVN8OdiqFaM3l37/oRoXtd+KzQaP9iB88/fykZNiSa6Yn2MdycNLrGsLctmOVg8qv//EXRMH6MVLHuV8yLu9HxkULA01MuNDdB/A6SZ5TGrmoSHYqRde8ko/sqpelm27GwWLDeGyGzzzmNQLfqij653DrnVqME5ZpqIiQConygB7bbgG0myuEx1VIGnIcpedZcy0hwRdQCuUv+3oirc2KY0SvuIR8scbrFX4b95AWleQWSvBn/IjMulFCvVFloD8o0FKGJ1od0GqgKjpzfKQK+sqbtR7jEeHtSufpi6XrZiMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qhMGwzGJ/7+t3uvmLVEJQqUphjtVXBWb4pG9lzmuOJI=;
 b=ub18UPvjetQC7LSylOtcL9VDaN/H8PWo+91K1dMKZV85kHTk0WO5i2lozi9EPx02I4EIozywcaYm5ODoEEA1fDOhCzY1jO+dbsD4qiEw1pX93KO+uLV0VxiEBGvjaRmU/ZSufp8TnkFOhsr+RhnrBv4CAu8hUCBd2Dd/zig0Sp27kYeD4vLxW4+GxMo6PN7vlphAMG2pL/d+ORHlOqlz+0n8FqYYNyZm05jErpLU5ZShL2zs6xaQyKZYkNSwH8i+sWFVyKbrT8FEbMX5L9zDxa7UyafxHrdrtR2v1FhrF0FrSJGtzEWNaLSDC1p4rep0Y+RJecpuzQVKcyUKEwFWZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhMGwzGJ/7+t3uvmLVEJQqUphjtVXBWb4pG9lzmuOJI=;
 b=kzgWxxFDTrIcRtiUlX8h99QoIAIHrLxhclLAo74Qf7R9daPRC1WTftsjkpgM1TDTIy4SGq4sDHHYHRq1E6h+sAQYyBavgtLfSXP1WwxQWYhyCpHNUkLlFNIHvV2cy83+G2d9vibUlZE/KJE8ifGpToppYxN/zcD7M/Ch0AVYV3s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d86ec941-ba0a-4beb-b213-7d1bc9a1ec19@citrix.com>
Date: Tue, 24 Mar 2026 17:13:06 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Kamil Frankowicz <kamil.frankowicz@cert.pl>
Subject: Re: [PATCH 1/5] EFI: avoid OOB config file reads
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <63284ab7-8e38-4448-a789-1b9c23c4d95c@suse.com>
 <f56a8eac-bd35-496d-ae9a-b429f8305b31@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <f56a8eac-bd35-496d-ae9a-b429f8305b31@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0072.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2de::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN9PR03MB6121:EE_
X-MS-Office365-Filtering-Correlation-Id: d5c59d36-dfb2-415e-26fc-08de89c89a16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	L8fsnY0/Y/A40TD8Cv75Rm+2gpmFq/Ce0ShzEcGsr7Y27KGxnlfRKXau/V308sTj9WZwRxiellA7eupmXkdzjwDHACH8Ds1UkVqOWLU/nmhaCR1MSjPtmJDm+DX0GHpqzN26jmlaBdTnIImrPOC7uarweUnlA2Tm0Clviv+c04eS3GyN+T4USLUwl1jnwOvSdwC+CFMBHTWcVtRwe9IQFjdOwCqQtdydTPr62+dkTp2BkgYkoox9GWorPB2It9IAB7m/TKB5Jz/gnH6L5UYEKE6gj3EQ9mgp6Hn79PdExO3/Tqfehz9z/H+GMMIMglnEkQMBBRXYGVcj1WxCg+pQrxTxBIe4UWIBbPpGrRRfBIjMvzIP2Q3xkzTe+J4eCSXkjkhtIiakvgFIgEuai2A80FqG2MhLU0AyL4Xz04aec4h8ZvJjHDo3XbV17pDtJGTEg2hhHSO1BicmGmQrqAfIA1mVIvzAa1rYTLTwM7ivGc+HT26DIpopFzwJUAFS0KV7g1u4JT8vqDamngTZacQVYGxp3B+l8ftKhFnWlCsrainLC9HZm53ZMmtJYFjYLtTarVOKyW6rQpNZvfyiDX0yPXFp4DaXfMWSlLRHTX3hdkdB1tM6KJ2XZyMfxDhGlRuERrLPkzcADj5xi8LhNchzOaIhvz/GNpoMk14itk1TztwTQ9AAm2J7sk3IxrbhscfFyMnCEam7UqKx5vxiQuKeVxeWYfxnIY3HCBCF6mLJie8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmFENW9qSkZRSkhxVHIySGxjek1abGJKM0J4aHZNY3ExbjZPSmU5TTg1cU9D?=
 =?utf-8?B?eGExYXFqdGNUMlNiVjEwN0xuU25YeU9tN2ltRG1tR0ZqSUJlR3czdnBPc3VE?=
 =?utf-8?B?NTJDZWd5TVIwcERpcEQrd0s2a3lldm9iU2VuM09IWGxUN0k4clZ4UDJCZWVs?=
 =?utf-8?B?Y0o3N1AwR2ZzWFRudHpIUVljbUZYR2xFZW1PUFhDS2dIWUJncTZveERWKzdG?=
 =?utf-8?B?OG1ZRjU3d3NRQlRWL1Nyayt0NXdMM0JxKzZVUHRXOTlxNlNRbjhUVE5xcG12?=
 =?utf-8?B?MEMwK05FVjVUMFIxT3RmNGJGMW8wZzh5eTZmM3JGb0ZxUzlQTVJVdDdBS2tV?=
 =?utf-8?B?RVlGWTRqSUhBWEREbytLY1NDMlhKeWlweVMvN1JXdmVxc2Z0MVNOeFZGd25n?=
 =?utf-8?B?d3JzRXVmL3pUTHpBQjg2V0IvaXNiZk90bVdFRXlGQ0tMRGJYYlVIUjNvY21E?=
 =?utf-8?B?ZFdyQU1mdy9RcG5uYWZ2SjNjQkhBbWdJQ0kyc2duNVpwNHlGZFpqT3RwVllr?=
 =?utf-8?B?T01KbEVaWnkwaUFoWmtOWHBWcHphcTBRdHEvRUpITGI4QVAxYkdvQnVEcGlr?=
 =?utf-8?B?RmpGOTBVMkNJdi9ORy91MUdQdWFEc2RNUU1IdUE3aEh2c2lzWE1IQnVHby9z?=
 =?utf-8?B?MWF5WFJQclVOYXBJWmtiWjJMVW1ZNUhBVTRCTUNRblJXZysvTWNOSCttRS9X?=
 =?utf-8?B?LzZOZlZEVkV3MmFLMWFNVlZCMzVhQ3Mxb1Q1UFQvNEdrUGJIQW02RUdaczBI?=
 =?utf-8?B?R1ZReGpUNzdTSE1BKzZud2xLMFpRYkd0ZnQzQVJtZWM1VCtQR3hjZFV5bnpm?=
 =?utf-8?B?bEtMOUJtK2hxNUVQUjJGSFF3c0VNNGExSXRmZk1LYWF5Q0IxcW1uYmZxT2xC?=
 =?utf-8?B?a3B0djdmYWxwNlllalNETG9IWXdpRlJLODBXRWZ4em5Kb2FuVFRpYUFLWDNz?=
 =?utf-8?B?REQrOTNUZnpGSmxXR2dKNUlLOEZVS3B6aXdIa1cvUkswTjhVOSszYWl4RVhN?=
 =?utf-8?B?bWZFSythQm56SmkxdU5tM01WR2U4SVRQNUQ2a1RES2ZiNGdFb3lhSlhQbE8z?=
 =?utf-8?B?b1dUQkRnMENjMWQzOUNXQUxHWUUreDdBL3hXYXFJdDcyV0Raak9CNi83anpL?=
 =?utf-8?B?S2s2MzVRMFMzb1M5bTJWbWxQS2ZvTzJDUWdQSzQxWEJMWHBUdTFUbGs5d0RZ?=
 =?utf-8?B?OUNndHMvLzZEenR0SCtUYkVnbFI4WGNPcFNZT24rQWxnTHFxTjVVN1FWQkVH?=
 =?utf-8?B?aXR3RnRBVEU0UXRlTUJoRHpydVovWjdwbzZPeEhaa21OYXprU1ZMTEdITEh4?=
 =?utf-8?B?aGVLVElCWVhXT1ZhM3FEYkg4ZWc1Uzd5K0dxMGFNdmx6V0gwRVkrL3lDdlpz?=
 =?utf-8?B?OWZuTUorVjRlQ2VpS3h5Y2FodkptMWh0YitnNVdDdXBsVFozM0FNd3RYZmtl?=
 =?utf-8?B?cXpRbWlsTnVYWWY1b1F1allpdFpMcURpaGkxWDZRQmtNL1k3ZUgvYmwvbGhY?=
 =?utf-8?B?S08wWDRxVHp3ODdKd3NYQmVwcHVIM3prK0pKSHM0dytBYjR2dXlrU3ZoUVNm?=
 =?utf-8?B?YkYrNEtYalo1WU1jMitZcFQ3aktmM29uTGtGcXViU1JnZFkvTm5zY1dGUzdO?=
 =?utf-8?B?bW54NFZYaVlhTy91WVNnWTFZNUw5eWJ4Ulh5TzVDc2piNVhoSWxBWnl6c2FB?=
 =?utf-8?B?WHNXaDBncDBVeXVGWG11WUpLRTloZnFFNVV6R0Z5ZkI0MWRoQ280azlhTDRx?=
 =?utf-8?B?bmhYMG5KNDZxL3RlMzQxUXByYlNEaldJeFZLbWpCOVp3cUliWG5oa2VLenZ3?=
 =?utf-8?B?dnV5RWY1YkxZSjNkNUk0K3dtY25KSUgvbCs0RXV5MHpQZjBrczFHd0sySkFK?=
 =?utf-8?B?amFGOERmeUcwZ1I5cWZqOXd6aHdRUHZxRHFObUdtWWVQV1VLVmRmTWRhTDlE?=
 =?utf-8?B?TG1uVEticVpVaXNZWTcxajhyeUlvNkMrcHp2MkRIWEFuV2pBT0s3eHlhdlFB?=
 =?utf-8?B?OTNjM0tPdHhkeWw2NzFqMGhkK2hHenVYS0E0YVE1cE1TSTJLZzZvOWxRMytp?=
 =?utf-8?B?YVIwR1JOSVN4b1F1a0ZiRUlLQVdWeFpaRitlSW9LM1R4Vm5TU0FSS2Ureld2?=
 =?utf-8?B?ZW5mK2Y4TGRTWHlhOTNPM2thbzk0SkdTdUptZFNGWkZITzRpWGloWHFKbTBY?=
 =?utf-8?B?dU90ajU5aEtmVXYrN2hCTEUvVFU1U2hxL1JrZktOcTdNU1ptSHV3bm5ZVnI0?=
 =?utf-8?B?Z2c4TDJ0WitqZkpkUy9vNG52OEtNa0tNblFnS0FUM1ZqaTBWNU1rTDVxRUc2?=
 =?utf-8?B?ZjlFUHVDR012YjBCSE9Ib0NpZ3dVOGFJVlhtQ3l1ck95ZVFOektBcjczZ3A2?=
 =?utf-8?Q?UYiSLj88IONOBek0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5c59d36-dfb2-415e-26fc-08de89c89a16
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 17:13:01.6442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i9fyA+68TGxLoTbdoJAjZY14homBYLhnR77ALedzcpHA6eAgoUrTVkNYn4SkDoMPIMjtE5tVgxzw3wS7zFQnDQf5eHVDJUcj9b4VqoMHDZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6121
X-purgate-ID: tlsNG-33051d/1774372397-EA88272C-D2C24003/0/0
X-purgate-type: clean
X-purgate-size: 995
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:kamil.frankowicz@cert.pl,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:mid,suse.com:email];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 297BC319D53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24/03/2026 4:36 pm, Jan Beulich wrote:
> The message emitted by pre_parse() pretty clearly states the intention.
> Make sure we actually do so.
>
> Fixes: bf6501a62e80 ("x86-64: EFI boot code")
> Reported-by: Kamil Frankowicz <kamil.frankowicz@cert.pl>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -907,8 +907,13 @@ static void __init pre_parse(const struc
>              start = 0;
>      }
>      if ( file->size && end[-1] )
> +    {
>           PrintStr(L"No newline at end of config file,"
>                     " last line will be ignored.\r\n");
> +
> +         for ( UINTN pos = file->size; pos-- && *--end; )
> +             *end = 0;
> +    }

I agree this is what the the function intended.

But, ignoring the final line is rude and there's no viable editor in a
UEFI shell to fix it.  Can't we just copy the file into a
one-byte-bigger buffer and terminate it properly?

~Andrew

