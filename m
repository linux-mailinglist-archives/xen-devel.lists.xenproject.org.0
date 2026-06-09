Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9x2hCeE/KGoPBAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 18:31:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9CA662664
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 18:31:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=wnEjJOcx;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1333667.1596843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWzLm-0006qJ-4f; Tue, 09 Jun 2026 16:30:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333667.1596843; Tue, 09 Jun 2026 16:30:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWzLl-0006nS-V2; Tue, 09 Jun 2026 16:30:49 +0000
Received: by outflank-mailman (input) for mailman id 1333667;
 Tue, 09 Jun 2026 16:30:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wWzLl-0006nK-1U
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 16:30:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWzLk-005ED9-EI
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 18:30:48 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a283fa4-2eae-0a2a0a5409dd-0a2a45099e70-44
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 18:30:48 +0200
Received: from [52.101.56.71]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a283fb7-2497-0a2a45090019-3465384720db-4
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 18:30:48 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA0PR03MB5546.namprd03.prod.outlook.com (2603:10b6:806:bb::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 16:30:45 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 16:30:44 +0000
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
 b=stDTKF+ta5z2wsyt9yj8r/XOq0lkLMzwDjdMCJHZkhSmWrciHQqm46psGT+JjON4aa+OnLrSYtYLTZCpkBOhX4YFiVY/+fgzTWGLA8sXjjtOC07xd5oa/0/XjFXLA+kd0Ac0I7Evca1o/ByP8NceSdiXhYb2PowwjBLMe0BxuPdNofH2BNkZU+snhdCOXl4LPkrqQ0H0NC2hci4Sq+4S3b3qu2e2K/TU65Aw58+Bo4ffsFw0mqgHYieN9k72sHh/TCnfEcHczzjfG93eotfmf4ThH1rJ6kpKnWNowhIE/QD+qKQmHAnYNGGbssPRXc4d6lJR+uKx+7KYwulGy4aF1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IjH3sAuizMS53IN1fY8dPGGLXNVAjqiVjVWBh1c4/nY=;
 b=tcus/kF1od/jJgt7OXY2z+Xnn9REqEZUcaAZYq5ohnFeReLY+6f2YBd3YZOJqsInihGxTN57P5ZBTuLbcqKxXoP2Lb0ePBYu7Ae2gG/BXnu+nYO0QRaQPx+pzfl7jBWh6bZJmXXQ494zP0s0ztKK8NezUMLPpI7cBGGax1rvGSjyjCQb76DUtBxVVZXkfArpdHL3rkRbyElbV63Tg1s2iE6N6Psjvo0gL2U3SktkSfwECbQqPvIW41gfx6gkIydUuD4h9QhOExQ9QxBBrZ/U/gGhgSWrV+8823dHe++HkhU+UTsv9gwDzIrdT5DkvdBNV9w1EcbDXbSbxv/6xNB2VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IjH3sAuizMS53IN1fY8dPGGLXNVAjqiVjVWBh1c4/nY=;
 b=wnEjJOcxyQ5ON+s1BqD2Atwi842CU5YN729//9n6rfng8JzuFt14Slmw9XU/Xrd05y3UsOWcN0t8iOkEzmjbrnPGkl2tOb671fHFj56tX3wOrh3VaPgy1dDTh9q2n9I/0z7PtMQwgjQEnKa2sgKZQZLQg9ktTFoFlwt/Gu0G7KA=
Date: Tue, 9 Jun 2026 18:30:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH for-4.22] xen/x86: Always strip xen.efi
Message-ID: <aig_sPP3MpBbddXr@macbook.local>
References: <20260608173108.2848469-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260608173108.2848469-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MR1P264CA0146.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:54::7) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA0PR03MB5546:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c717865-7ba2-4492-4d73-08dec644743f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|11063799006|3023799007|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9Pf4RXEjM0B6HLmehhsyHjFa084og1mbwTB3pSxO4IdKEuRGrtpQk6yo0G0VwZH8lJRGZWrsJH8CgAzR2hY9nx7oKKacAyBnn/M8vdfIcQ6bhAvWMRqBdJ6SObdKOXYpxh7mReoTpBeeKff7GlP6YWUzCLsoWYOvdqi7QoYxkyGbZ8scfNYTCQBUucFYV68XyeEKA4tlfB+f10OfqRkE2Y5tKvEIuvbKqtnHBvHS+GGtkIqIOZiWM9Y/LxkEOazFxvEJR4y4ppo9IF1gkPh9SDbMpuWpq5NO2pokIMtGcgqp2MNvZkrCD0/cBGLGAFB/5A9kHdsdU9QJ4DPqd5fYu5BqmqyOa2sKVT4PFiSkq5bq06XI5h9Oa2QkLM7NP5iBCEzqICanTZdAhFM5Wa4p37pWjcNwEWJwOwkMMEmk/L3spzKMHZr7e9zwEwIZKBNwRBLe9OMFjiknA9b7yMAkFjc/DCwsszWxDztMJHPSJ0d4oPeQM4eaMegVO2zJTEiPkbWkfis0G+UIgE36rt/P0CNZ4xKJAX57kcTAcxsQvL+vXwsY5Yk3rp4fFqIOhxJORBu0Chm0EZFTC6Nn7AkCYQTU8wdQusLuB5oRbD+xiDpy5pkbwXjUGoKCpL4XIjyxst7zlnt9gDdoqlnkMhuGMQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(11063799006)(3023799007)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1NSelQ0UTgzd0VVSjRRV0diS2dWK3F1b2c1V2E2d0ZlTGsyd3dBOGFqdHZL?=
 =?utf-8?B?V2NRU0t2dTBYOTUyT3kxNDhQUHdwaEZma3pmNENCVUpuMjZrUEdwTGlQTjh3?=
 =?utf-8?B?WlNtc0ptNmJ5MzFIblI4ZlBDYndzOUxHQ1FjejdoclNWS2w4VlVlaVBMQUhz?=
 =?utf-8?B?aFQ0UnAwTkM4dkRaeXhhZHNVcmZFWlJtWm5Tc2lUL0p0bnB5QzhkN0UzNnBr?=
 =?utf-8?B?SEZGQ1VoS2VocFJMWU8xSnhObEZ1cVFFWjh4a2R1MElyWnRlaG1TZ0hLK3Nn?=
 =?utf-8?B?dTR5VDZvL3U5Z2tQcGVCcHBsUGE0M3Y3a25jdWZYUEl1ZjRlNnRReG91Tjcx?=
 =?utf-8?B?aSt6dnJTbmlNOW9xSHdHTEpSNVZERFJLRThKV1QydXlwanFBR0VmS2xXK1BR?=
 =?utf-8?B?TlA5VmVvSC84TEdjZ2RMNUhjMnU5VXFneW9pT3QvZkZIWW9oQW95ZzZKeXJ5?=
 =?utf-8?B?eEZ4Q05QOUovVEFEb25RejlXOU41U3YvZTVrZzZ2N1BTbUdjZzZFSWtCZ1ZT?=
 =?utf-8?B?aWRsT21TdzhlMWNWVUJ2VHZrQ0VUTUlaMFZjNXlpai9qUFZIYmtYVzhUL1lh?=
 =?utf-8?B?Sy9IV29pL1drQ3JoME1YK212dGxtV0xsRmZZSjJYempBQVFhNUNwUEthMnNW?=
 =?utf-8?B?S0ExeHJQRjdHNUxkM3VlcGRDeGI5ejhPSVR4dWxXOVkzTW0yMEFjdW81OUpX?=
 =?utf-8?B?bHVLTmdKOGhETE1OcVp3QnkzQm8vMlNRYzNzSzFQT3hVNW5qZ3Z2Rk5vUEs5?=
 =?utf-8?B?bXZBUm81dDV1eURxNFllZUF2Y0xKRmJNYjJZV1p1dEdUanFQSUlERnVvQmJ4?=
 =?utf-8?B?S1BnZXVPSXFqQnQyVmloeVltVy9tQmowS3RQZ0pqMnJMNjl2VkEzQ0o4UEJO?=
 =?utf-8?B?Nld1eFJCS3ErYkJvRXAxTjhDay8ycUtxdzVna3ZuQ1JUYnlKVktEVEg1c1JB?=
 =?utf-8?B?K3NyMWFKc3orUjcxRmxaQmdWSFpqQ082czcwQ3BxWmxKdzRFdXJLbFRySjBW?=
 =?utf-8?B?QVVsOU9yTnpvVDJTMlB6N25Ta1N5RkU2eE83YnRVN0g1UHV2ZytjYzBaZ2JC?=
 =?utf-8?B?Z0plL016YVJpODBPblEvQVNtWmZIZ0FTc1Evd2gvTmIrZ3RYajZtWnJSZy9X?=
 =?utf-8?B?ckJGZUdmZlJtRDQzN3ZVQUlCbEdEWXQxekZvb0Z1UmxTdGFQdXlMZTg5Vzlt?=
 =?utf-8?B?akhKRkJUeUt3M1BXNzcvMWdpUzVvc1B6VHYrSGpHVVVmYVI3QnZDSDM1MGts?=
 =?utf-8?B?Y3dvSmQwV3ZJQXlHMWdraHJIaWdBOGNEV2paVUxmTDAySGh1RnBYMFh4SXMw?=
 =?utf-8?B?WTAycHlYRzJCL2dUdHNKRXZZQTBldWVqVCt1bHJSODVOTVNKU0FkRjM4amF5?=
 =?utf-8?B?dzUyWVorZmRZaHkzV2Fsdm1CZW9INUJvb0J1Zm1PaW96Slh0ZjhERGZHOGxk?=
 =?utf-8?B?UDcvTzlqVTRWeVMrQ0tqRldpVXNkOGIvSkRXWE9YVXM2KytURGppM3RNSHJ3?=
 =?utf-8?B?dEpKQnZXV2FUUXA2TlNFM3pCUzJjSjlUc2orYUFYUUdPaVZ3bDREZEFPTlV2?=
 =?utf-8?B?cXNPaktqMy84cW1yQzBjMEkxM013VHRlVGk2Mk5oQURaVGc4ZzNYSjI5VkN4?=
 =?utf-8?B?OERpMWxWL0pGZHVBYm93VU44UUNEM0o0YmI5di9yQkRLaVREZ0V3UEpaVHM5?=
 =?utf-8?B?blVWNW0rOWFOU1VmWDRQOTB0R1U3ZGVORlFPekEvMkg1NVRjYnJKZkN2NWVI?=
 =?utf-8?B?T2xXcDFCa09mMlUrYUJTS01ZWnNzUnZvTmJ1bUNhUTJWR0ZyTnNQU3kzOTBC?=
 =?utf-8?B?emx1N3NZbVdGR1FqT1FmdlRXdDVwNEtrNHZGR0RHaEJQVmN1cW1pQVRScjNh?=
 =?utf-8?B?YVBMVGtYSi9hTDFHL0FJNy9iWitkOEZBVVk5VEJXU0Y0T1lDaEI4bmZ3QUFr?=
 =?utf-8?B?eDljWlFrQ0tZQk9zUURHYjZBMDRnZU5xbUJ2dWRrbXVTSEVQVEh0OUs1SExv?=
 =?utf-8?B?WGlJRitWSWwzbEZBSFhoekRDLzgwYXovNko4djZna29ROGMyQ29TL1hsdmpr?=
 =?utf-8?B?OFc0VEhQWXJKZUc3V2RtZmNiSDgvdWlHclJzWHFGZ3RtS0lxYUpkYU5IOWZ6?=
 =?utf-8?B?aVAwZ3BDN3FDYlByalFRczNtOXVyOStJMTR6cFBCYUs1QVB2V21xTUZRcllq?=
 =?utf-8?B?YmNBQmNJQm5PNmNySHJJTkY1b2dlc1VyT2g2L0JRK3AvMjEwWmI2VUF6dnA4?=
 =?utf-8?B?eHBRQVBLRmwxZFozRkV0eVhEaFczMHZBUjVReG1MZncxNHdtc2pNVXh5T2NU?=
 =?utf-8?B?RkNPNWZrbWd5NGQwV3dETTU2cCt3UnVUZ3lwRFoxN0UrandiZDRNQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c717865-7ba2-4492-4d73-08dec644743f
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 16:30:44.7003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: guBHdrCFhRyvdb39Jqubem19r/lxd6OuHGXqBrG1WzBy6IMI+Mvq9mLxJOl05tyGeBdz/AKVAmHDzz2G/WBA0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5546
X-purgate-ID: tlsNG-bad1c0/1781022648-43979A53-B9896A55/10/73395122804
X-purgate-type: spam
X-purgate-size: 8749
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
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,suse.com,vates.tech,gmail.com,invisiblethingslab.com,apertussolutions.com];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid,vates.tech:email,citrix.com:dkim,citrix.com:email,citrix.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3B9CA662664

On Mon, Jun 08, 2026 at 06:31:08PM +0100, Andrew Cooper wrote:
> From: Frediano Ziglio <frediano.ziglio@citrix.com>
> 
> xen.efi with debugging symbols is ~45MB, down to ~9.3MB when stripped.
> Multiple firmwares (as seen by QubesOS, Trenchboot, and XenServer) are unable
> to boot xen.efi when debugging symbols are included.
> 
> Either way, having debug symbols by default is abnormal and contrary to how
> the non-EFI path works.
> 
> Produce xen-syms.efi unconditionally, just like xen-syms.  If
> CONFIG_DEBUG_INFO is enabled, these will contain debug symbols, and if not,
> then not.  When xen-syms is processed by mkelf32, the debug symbols are simply
> discarded.  For xen-syms.efi, call $(STRIP) to produce xen.efi.
> 
> Some old versions of binutils ld managed to produce efi files which the
> matching version of strip couldn't process.  This includes Binutils 2.26
> included in Ubuntu 16.04.  Delete the workaround for this bug, and require a
> less broken toolchain.

We should then bump the minimum required GNU binutils version in the
README, as strip is also part of the binutils suite itself?

> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Teddy Astie <teddy.astie@vates.tech>
> CC: Frediano Ziglio <frediano.ziglio@citrix.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> For 4.22.  This was posted previously as
> 
>   https://lore.kernel.org/xen-devel/20251208133945.61375-1-frediano.ziglio@citrix.com/T/#u
> 
> but merged the two patches and rewritten the commit message to make it clear
> that failing to strip xen.efi is causing boot failures.
> 
> Previously xen.efi.elf was produced but it's unclear why, and unnecessaerily
> different, so I've dropped it.
> 
> While this does want backporting, it can't be.  Xen 4.21 and older still build
> test with Ubuntu 16.04 and choke
> ---
>  .gitignore            |  1 +
>  CHANGELOG.md          |  3 +++
>  docs/misc/efi.pandoc  |  8 +-------
>  xen/Kconfig.debug     |  9 ++-------
>  xen/Makefile          | 19 -------------------
>  xen/arch/x86/Makefile | 11 ++++-------
>  xen/arch/x86/arch.mk  |  7 -------
>  7 files changed, 11 insertions(+), 47 deletions(-)
> 
> diff --git a/.gitignore b/.gitignore
> index bfc7bdf043c3..49e2c6961768 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -224,6 +224,7 @@ tools/flask/policy/xenpolicy-*
>  xen/xen
>  xen/suppression-list.txt
>  xen/xen-syms
> +xen/xen-syms.efi
>  xen/xen-syms.map
>  xen/xen.*
>  
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 5cf19372a361..71d1e9ab8c69 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -14,6 +14,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   - On x86:
>     - Enable pf-fixup option by default for PVH dom0.
>     - The libxenguest bzImage loader now uses the system liblz4 library.
> +   - The install-time environment variable INSTALL_EFI_STRIP no longer exists.
> +     xen.efi is always stripped, while the symbols remain available in
> +     xen-syms.efi.

This is not x86-only, AFAICT ARM also seems to have a rune to generate
a xen.efi image, which will be affected by the removal of
INSTALL_EFI_STRIP?

>  
>  ### Added
>   - Support for per-domain Xenstore quota in C xenstored (includes
> diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
> index 8198a7f063cf..0a3fd67076fc 100644
> --- a/docs/misc/efi.pandoc
> +++ b/docs/misc/efi.pandoc
> @@ -20,13 +20,7 @@ Xen to load the configuration file even if multiboot modules are found.
>  Once built, `make install-xen` will place the resulting binary directly into
>  the EFI boot partition, provided `EFI_VENDOR` is set in the environment (and
>  `EFI_MOUNTPOINT` is overridden as needed, should the default of `/boot/efi` not
> -match your system). When built with debug info, the binary can be quite large.
> -Setting `INSTALL_EFI_STRIP=1` in the environment will cause it to be stripped
> -of debug info in the process of installing. `INSTALL_EFI_STRIP` can also be set
> -to any combination of options suitable to pass to `strip`, in case the default
> -ones don't do. The xen.efi binary will also be installed in `/usr/lib64/efi/`,
> -unless `EFI_DIR` is set in the environment to override this default. This
> -binary will not be stripped in the process.
> +match your system).
>  
>  The binary itself will require a configuration file (names with the `.efi`
>  extension of the binary's name replaced by `.cfg`, and - until an existing
> diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
> index d900d926c555..fcd3fc3d36cf 100644
> --- a/xen/Kconfig.debug
> +++ b/xen/Kconfig.debug
> @@ -147,12 +147,7 @@ config DEBUG_INFO
>  	  Say Y here if you want to build Xen with debug information. This
>  	  information is needed e.g. for doing crash dump analysis of the
>  	  hypervisor via the "crash" tool.
> -	  Saying Y will increase the size of the xen-syms and xen.efi
> -	  binaries. In case the space on the EFI boot partition is rather
> -	  limited, you may want to install a stripped variant of xen.efi in
> -	  the EFI boot partition (look for "INSTALL_EFI_STRIP" in
> -	  docs/misc/efi.pandoc for more information - when not using
> -	  "make install-xen" for installing xen.efi, stripping needs to be
> -	  done outside the Xen build environment).
> +	  Saying Y will increase the size of the xen-syms and xen-syms.efi
> +	  binaries.
>  
>  endmenu
> diff --git a/xen/Makefile b/xen/Makefile
> index 1f11610b5f68..0f9b56fc399d 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -493,22 +493,6 @@ endif
>  .PHONY: _build
>  _build: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
>  
> -# Strip
> -#
> -# INSTALL_EFI_STRIP, if defined, will cause xen.efi to be stripped before it
> -# is installed. If INSTALL_EFI_STRIP is '1', then the default option(s) below
> -# will be used. Otherwise, INSTALL_EFI_STRIP value will be used as the
> -# option(s) to the strip command.
> -ifdef INSTALL_EFI_STRIP
> -
> -ifeq ($(INSTALL_EFI_STRIP),1)
> -efi-strip-opt := --strip-debug --keep-file-symbols
> -else
> -efi-strip-opt := $(INSTALL_EFI_STRIP)
> -endif
> -
> -endif
> -
>  .PHONY: _install
>  _install: D=$(DESTDIR)
>  _install: T=$(notdir $(TARGET))
> @@ -535,9 +519,6 @@ _install: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
>  		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION).efi; \
>  		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T).efi; \
>  		if [ -n '$(EFI_MOUNTPOINT)' -a -n '$(EFI_VENDOR)' ]; then \
> -			$(if $(efi-strip-opt), \
> -			     $(STRIP) $(efi-strip-opt) -p -o $(TARGET).efi.stripped $(TARGET).efi && \
> -			     $(INSTALL_DATA) $(TARGET).efi.stripped $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi ||) \
>  			$(INSTALL_DATA) $(TARGET).efi $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi; \
>  		elif [ "$(D)" = "$(patsubst $(shell cd $(XEN_ROOT) && pwd)/%,%,$(D))" ]; then \
>  			echo 'EFI installation only partially done (EFI_VENDOR not set)' >&2; \
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index 47dd6c50fe88..01ed7302202e 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -196,10 +196,7 @@ note_file_option ?= $(note_file)
>  
>  extra-$(XEN_BUILD_PE) += efi.lds
>  ifeq ($(XEN_BUILD_PE),y)
> -$(TARGET).efi: $(objtree)/prelink.o $(note_file) $(obj)/efi.lds $(obj)/efi/relocs-dummy.o $(obj)/efi/mkreloc
> -ifeq ($(CONFIG_DEBUG_INFO),y)
> -	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),echo,:) "Will strip debug info from $(@F)"
> -endif
> +$(TARGET)-syms.efi: $(objtree)/prelink.o $(note_file) $(obj)/efi.lds $(obj)/efi/relocs-dummy.o $(obj)/efi/mkreloc
>  	$(objtree)/tools/symbols $(all_symbols) --source-name=$(@F).S --empty \
>  		> $(dot-target).0s.S
>  	$(MAKE) $(build)=$(@D) .$(@F).0s.o
> @@ -233,10 +230,10 @@ endif
>  	$(NM) -pa --format=sysv $@ \
>  		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
>  		> $@.map
> -ifeq ($(CONFIG_DEBUG_INFO),y)
> -	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@ $@.elf
> -endif
>  	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
> +
> +$(TARGET).efi: $(TARGET)-syms.efi
> +	$(STRIP) $< -o $@

I'm not that good with Makefiles, but don't we need a similar
adjustment to strip the .efi generated for ARM?

Thanks, Roger.

