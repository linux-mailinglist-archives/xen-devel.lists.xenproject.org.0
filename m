Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 67XtIeJFKGqsBQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 18:57:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C858D662AC6
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 18:57:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=humV3xf6;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1333684.1596859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWzkU-00037r-4z; Tue, 09 Jun 2026 16:56:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333684.1596859; Tue, 09 Jun 2026 16:56:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWzkU-00036T-26; Tue, 09 Jun 2026 16:56:22 +0000
Received: by outflank-mailman (input) for mailman id 1333684;
 Tue, 09 Jun 2026 16:56:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wWzkS-000367-0t
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 16:56:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWzkR-0057Nk-Ds
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 18:56:19 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a284598-bab6-0a2a0a5309dd-0a2a4504831c-20
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 18:56:19 +0200
Received: from [52.101.48.8]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a2845af-1dec-0a2a45040019-346530088eb1-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 18:56:17 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM6PR03MB5131.namprd03.prod.outlook.com (2603:10b6:5:1f0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 16:56:13 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 16:56:13 +0000
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
 b=rzvtNlX4srjLcyv4mGttFPJOCp8027qqylNK+x4R1TVZb/TgSu7fCKL95gg5LsZu3ScACW4i0Mu1adlrTIOwK+K9Iayv1TtU4vGbi7dFAW2rR3kl77H4tJ/SLPhTgt3AruWuQ67OvrXlwcw8/5puiICPMxXqORY9wVLTqEaBF66NQpapipaA8SXNDeh1PFFRWestbA8hGqJR+6micO8aIyLTXyieSYHacBebfwHFZ/z09EiZDbFeBDtVhArtFWhKEMIRW3V6yikiw3iXO4gYxJNGMfpfNJkZQ7eY+9+DqHmwlj1mQcK5thyvvTXnH5YHKd2A9Z3IrN27l6JZ11zCIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJvYR7Rs5w8xc21xSwGvaTN/T2XUc4XuVtXzndOTBPU=;
 b=pDusH6S4TO71fqahVgmjfao1Ywr7QNO4isGvdlgPQXtvW4CwEEXNHUVPaz6Jmnq7JsKDftJlVQV50P9r/wvvrmDSjEiN5aQnX2x+/5bRIAZMSD7r83MQMMwYC2tkbu3bLNSAjX0k2asCy8azsBiKRCeiQwwl5e09J0Ege1P8t4chKUObxSuynkTJNK2O4p43sgctXO0ZwF1SqY79hO24uc2Z4DbYTpQ9ytociq5JNbBJSC+kvlKzfT9FldFjLEW6dfLpHAR0QLwXDwiW0NKsLAijPqgV3mxSabx9DhhQMHstm8znGgfpjkjw6GHQdjDHEPa/CO7tFdcYIO34o6bMCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJvYR7Rs5w8xc21xSwGvaTN/T2XUc4XuVtXzndOTBPU=;
 b=humV3xf6SujWsSuWRFrRlPjG3+T6znW2/79LCUxm2NsCeuk4kW2IHk5WUC6LRh0flxKNQIBuodoMBPykmnjjBj2ocl7PKV/weDCarQsyTufftbQs9pzQ8P+Eyh2MB9i2d9sH+uRrZu/nNbeuqftBVYW28978ElkVoUBETYFdQDA=
Message-ID: <696a426d-0007-4cc1-9997-169fb9af7c7e@citrix.com>
Date: Tue, 9 Jun 2026 17:56:10 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Frediano Ziglio <frediano.ziglio@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH for-4.22] xen/x86: Always strip xen.efi
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
References: <20260608173108.2848469-1-andrew.cooper3@citrix.com>
 <aicffd9gRs-HQ88v@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aicffd9gRs-HQ88v@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0284.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM6PR03MB5131:EE_
X-MS-Office365-Filtering-Correlation-Id: c146359a-3727-438f-e74d-08dec64803ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|5023799004|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GGcharn0bGEa4EgmfUUoA02lgNcBYLHi/mGcLjeZXbSCWUTXmd/PqD2hoNZONUn7P6X3GgRy2XgaM/54aW6qaqf4J9quEZ7dJvCoVvjaExlyrewOfL3LQCqUNyY1R7SMAJqLJwBPDwOLJlDVqyjfaNQA3yjb7aCIAHOI24M9M6YXmqVVmTSpNPCTj6sadr71qizltY47mDncV3Xjqsn5lV7tIVtUXiBYrjRUkWI4nbQJ4V+KpteJMK5fdW7qekXs/87bw6DE8AZz/4GGSIsB/QSNe/EQWReZtnpTtPcmwsovnlrNdn/QWK/ErmZ+0seG2z8TlHXvRNzk+qqkW4YcJkd1S2YOs1M6oqh4jVTl2+RBTsNQkGlNM4d0roRyZ93C1NIVtFuN3U6JFwvDCGQqJET5GG92AzdOvtl0QSmolTTxVq6gDQAer7VviGi/R4c30wnApFMCPXx0vdNsjXf85n01VV2oIdRlUodQ7pd+FKOfyVvM5ctS4TcF/GVgbie3GRTw/5zBWvwK4SeUuXYDWsqAf3dNxmiBYg+aiPNtQvX8DJJHSbODUCE5ZRG+fpFEZb3CbNvHcP0//f0BsVUGbLS1XuJvksft3sV0yEBDu+MBUHvnihFQgSFqIn4gN5ZSkYaUBJdrzgc66l4oe3UO33Td8eIi6o4UsncC7jrZddv0wxIUu3V2e5tMNzF2hHCg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(5023799004)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlE1NlNxaUZLdVU4SVV4U1pCYm1DeUxGNkRqaHFIT0Q1YTc5T3BtYzNiL0xZ?=
 =?utf-8?B?dkFlZytXY0RKNEVoRW1rSnBzQ3UrcnQ2V0laUko5SEdMRXhMNFI5dmMzZ3gw?=
 =?utf-8?B?dnYvak9Zb0kvR3lYaFZsTWF6OVN0cVZwWHA1cVFkQkFZY05kUGRNNG8zUVli?=
 =?utf-8?B?WjVZVkgyR1l3T3k1cG1CNzVQdzBlZUo3cUdnRkRwMHFjNHE4ZGUzODJHUVQ2?=
 =?utf-8?B?cmcwbytyS1NoQzFPNEJQdGtvQjhwaUJlQllSOTBpN1J3dE9OSDF3MUNpc3d5?=
 =?utf-8?B?T2xUTEROTDhpS2pGQnBBYlNPelFtWEVjNkN0WnZRdUVhandEZ0N2WnJ4SFE0?=
 =?utf-8?B?RWI1WngxdzE5eDlSanRjQzMzUTJteU1nQ1FOU3A2aGJDV01KWWE2SWRrMjRv?=
 =?utf-8?B?UVVPUm5SYWVJeU1zVGJ6Sno5QjFvZVU5ZS9NUFFSajVpRGtHTU9KWE1lcllN?=
 =?utf-8?B?dTRWMlhZNllKL3RVbUJsdFRNUUc2Uk94ZXBQbHpNaHQ5eHNyTHVxbUF2NmJS?=
 =?utf-8?B?d0ZPYmxPREgvOFUyMjQyMnVGTG14am5JMFJ6WGtteE45TFlwS0RTTVl0dWdz?=
 =?utf-8?B?RENDUWtvUTFPM0I1TG1MaC9INVFXSTh5ZGZyMWVPNjZMWVMvRmhuZCsyRDJp?=
 =?utf-8?B?TndweHRlRlB3bjdURVkwS2NzQWZEUlVwaFNuelo0c0w4My9hbzVNVzFJYlgy?=
 =?utf-8?B?WGtxYmtOekRLN0xwbThhenVsYVduS3hZa0EwU1lrMHpIVU41SkVXV1E2dnRO?=
 =?utf-8?B?TG1ka25rTlFkSEZvTnU3cmNaU0dTRjFPcmh1SEZjeHloelJnL3d3Zk1OYjdP?=
 =?utf-8?B?T0VON0ZVbGNqcG1WWHpBR0d4c1l4S1VScTFpNFNJaktIYVI1cXZEcURqL3lQ?=
 =?utf-8?B?RmJZY2R3TVc5ZjNZaEIrc29rR0FBbkJXWDJZNnRsN2MybG9DdzdvNUwwcUJU?=
 =?utf-8?B?c3dKL21rUTBCMjF2MDVDREtLbmRpWlE3NXBTb083NGJFcHhNWVhHUHZkZDY3?=
 =?utf-8?B?RUhpSjkzandlbzlPVHBBUkpHenEyWTJ3cnZwMWptVXp4UUdlM09VMTh3azFC?=
 =?utf-8?B?YlRYWVlaZGM0L3dGbTNpNmNtQ2t6MllCTm9VOXQ2d2dSUDYyaC9tTStUMm9E?=
 =?utf-8?B?czRUb0lnTVJDK0hUcjB4VVNSak93a3N3a0kwNHZKeDZNbzNFd3dXYzI4d0hU?=
 =?utf-8?B?bER5emUyTzBXSVB3bDJlMUFoZHp6ZTNtdGQyVnFKVWZwaVlub0ZKeWtOZjJt?=
 =?utf-8?B?SjRMRTFRUldndFJtVmJtak50R0VkYVdBN2hzVnY1MFhxTThsRDZjdDMwclJ4?=
 =?utf-8?B?UFF6bkk2Qlo1dndEODNIbnIvVjRYYWZrTlRoK1FMZTE3UlF4bUNrb2xnNG5y?=
 =?utf-8?B?ck95emZ6YjY5Qk9zMVlLOWdUdzVqekIvd2Q4UEhkQmFMSm5CMTZUaVdNby8w?=
 =?utf-8?B?K0lHZlRXUUVEVUFRbDZRaEU1KzZmM3dVaEJKRXc3aHBtbHRwT3k5TkpLZjEv?=
 =?utf-8?B?dElzcGhCUlVmS1E0UDFIaFJCcGFDR29nVFd1UVVlcUNzY1JsOW83NkdRVVpY?=
 =?utf-8?B?clZRZUNSOG4xSTZLVjhxVU5xZy9wQjVGWlluMy9JancwNGFwTE40Und0bmZq?=
 =?utf-8?B?eWNGNWZWSWQvS2svUnJ0emlNME9UQno3MEFQYnc1VDdKbnFzRldMY1R3ZzVq?=
 =?utf-8?B?dXRtR2Y3YTZPRjlyRFJrNXdMemVCelMrS1VvSG9xTXoyU09rRXF4RGlxUnFI?=
 =?utf-8?B?eGpkaUhUcEVJRktlRG1NTUoxczNoRUNLcm5Fbm9Sc1hIeFlONkdYN2h3UFdt?=
 =?utf-8?B?NjJDMHVkTUloTlBWYjBYQ0pUSnBiRTE3Y3RIMmozOThsVVFKU0hCQlBqb0No?=
 =?utf-8?B?NGIySjF5SEtPY0FZWThXK2gvT2FhQm42ZDZRMm02TmtaUlY4VFFKc0FXSmtx?=
 =?utf-8?B?RVZmMDNRWXYvbHIxeXN2Vk9vcG9mQS84NVBscmY2cjVnL3llVkhyNDViNUZN?=
 =?utf-8?B?cExQOExibUt6S3ZBMnNLcHk0azUvY1BDeHFjVVhrT3crcTdQMzhDV0NKZkNX?=
 =?utf-8?B?Y0lYN2UzY28ydis0NGVFeTdkUGMrZC9BbktUa2RnVzg1UGNBVktpU3cyM2lD?=
 =?utf-8?B?U0Zlb1J3aWtlamZPUHNFSFFVNnJMaCt4bERjT1c4Rm4zN2xoZUVwZG9mVjhE?=
 =?utf-8?B?akRhVEIrNy9ZNmY1SVk1WHhpbE8vT0lUYnpMOHlrR3hiQldBTGhEcUJDckhk?=
 =?utf-8?B?dW8rWkxubDBKTVRkVTRWcFpZSFg5Yzl6SG5DdVlTRzV6ODlqNEMvMUhhTSt1?=
 =?utf-8?B?azlxanlOdUlIbmdXWUVYb1JlcFJrL0hkc09GRlFuSXJuNTZuVG5lQSsvWmhp?=
 =?utf-8?Q?gCUQW8I6yWkoT1rk=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c146359a-3727-438f-e74d-08dec64803ba
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 16:56:13.6774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CG7bt9DaufAT5Jc08KcJ2l5OVQ3bg3A8gD8RHrxaWY+zArxDmvmg7zXURcNjmUiZpJ2K+kcTj+iNlVvNd/D1M/S2kgF7YvhXxmxsE+Yw+qM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5131
X-purgate-ID: tlsNG-ebf023/1781024179-40B733FF-01C41925/0/0
X-purgate-type: clean
X-purgate-size: 2403
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
	FREEMAIL_CC(0.00)[citrix.com,lists.xenproject.org,suse.com,vates.tech,gmail.com,apertussolutions.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C858D662AC6

On 08/06/2026 9:01 pm, Marek Marczykowski-Górecki wrote:
> On Mon, Jun 08, 2026 at 06:31:08PM +0100, Andrew Cooper wrote:
>> From: Frediano Ziglio <frediano.ziglio@citrix.com>
>>
>> xen.efi with debugging symbols is ~45MB, down to ~9.3MB when stripped.
>> Multiple firmwares (as seen by QubesOS, Trenchboot, and XenServer) are unable
>> to boot xen.efi when debugging symbols are included.
>>
>> Either way, having debug symbols by default is abnormal and contrary to how
>> the non-EFI path works.
>>
>> Produce xen-syms.efi unconditionally, just like xen-syms.  If
>> CONFIG_DEBUG_INFO is enabled, these will contain debug symbols, and if not,
>> then not.  When xen-syms is processed by mkelf32, the debug symbols are simply
>> discarded.  For xen-syms.efi, call $(STRIP) to produce xen.efi.
>>
>> Some old versions of binutils ld managed to produce efi files which the
>> matching version of strip couldn't process.  This includes Binutils 2.26
>> included in Ubuntu 16.04.  Delete the workaround for this bug, and require a
>> less broken toolchain.
> While I see Ubuntu 16.04 dropped, how is the "require a less broken
> toolchain" addressed? By implicitly disabling xen.efi build on broken
> toolchain? Maybe README should have a note about needing newer Binutils
> for xen.efi? Currently it says just Binutils 2.25. There is a section
> about optional build deps, maybe add there something like "GNU Binutils
> X.Y (required for building xen.efi)", if the version is known, or at
> least "GNU Binutils capable of producing non-broken PE files (required
> for building xen.efi)" if the version is not known.

xen.efi has never had any relation to the README minimum toolchain version.

It has always probed the toolchain, and silently turned itself off it
doesn't like the result.  In this case, we drop one of the "lets work
around this bug different" checks which ends up excluding the problem
revision.

If you prefer, I could re-split the patch, and state on the first patch
that it's a prerequisite to be able to use $(STRIP) in the second patch ?

binutils' PE+ support is horribly buggy and Xen is the only user in this
area.  At some point, 2.46 (practically bleeding edge) is going to be
required, seeing as it's the first version of bintuils where we don't
need to hexedit the PE+ header in order to satisfy the signing process.

~Andrew

