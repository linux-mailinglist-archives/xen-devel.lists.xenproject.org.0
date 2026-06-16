Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wA5fLpEVMWqKbQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 11:21:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D66468D7A3
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 11:21:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=YYr7NgWW;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1338908.1599999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZPys-0003iW-1b; Tue, 16 Jun 2026 09:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338908.1599999; Tue, 16 Jun 2026 09:21:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZPyr-0003dM-Su; Tue, 16 Jun 2026 09:21:13 +0000
Received: by outflank-mailman (input) for mailman id 1338908;
 Tue, 16 Jun 2026 09:21:13 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wZPyq-0003a4-Ta
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 09:21:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZPyq-003yDE-AT
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 11:21:12 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a31157f-2eae-0a2a0a5409dd-0a2a450bedd0-30
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 11:21:12 +0200
Received: from [40.93.196.22]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a311585-212f-0a2a450b0019-285dc41680db-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 11:21:10 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ2PR03MB7093.namprd03.prod.outlook.com (2603:10b6:a03:4fb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 09:21:07 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 09:21:07 +0000
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
 b=wrUyX8A2vhCeqduS9ARhrSdWsKuptiISH0rvlwo4jJy7YpSouFPpZB3yQnFLVnP3EX+dsiY+4zB51zM0NlyhnNGJlEWtupELQUFS9PPQOqOWn6s4PyKm0c+JgJm7SEmXN1WBCGhY5DL9hEN3g3Z5Bdx0zvDNc++zpuygNLpCoLLuq3zgZ4AN+vwico2mCB2fvDVgC2XXdmmHV0WkaSMcAOmDXoDWjzii2o58b13BXXimn3hRqC6XMCSN62AC5ESeLWuLOIa8d0njwMT3OlD8WRsQSrzGYwRxiVKW13SmN/ZcC8T/ykbTrEOmif71B8WnZcYiLqPMtkJScyRHh4zCbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pwbwP7gCfF5/rDXGJ8fAmIA1wF8P+Dldrhh0Zeb1iNA=;
 b=lvE7VdDutESMsrv995HSwE0s7sNMOYMwOoNnAOhna+BKhpu+2EncRMK6LAtnZKVR9YjOC3RRjooHAbm5E5TQpxb3ztR1HQ4oflyBJ18dHCbeFyauJprL0oYIGYUcETJNqiDot2wveXm7l8m8OZckOZ9KMrPdBPMXZMMsvLO0L6Omhx3hv/j7MVsyLLbPJIS0tvKC8PPPsozQypQLz2XzBtUVdGgc6eKDIdXDf5FrBPc7qy5UBteTsmwHFlLvPeq12OvSz/t/lqdythwiZxsivPJJDsTGBNdkQfWiYRVmscuY69R6ZooUCygpCnfr5zFOPaiHtmn6OEL46I2Oo2UINA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pwbwP7gCfF5/rDXGJ8fAmIA1wF8P+Dldrhh0Zeb1iNA=;
 b=YYr7NgWWqZ7zyCVqRqBr/IVLtbBPUxIXV+KeUL7QVIh+MM5V2s2MHwe8nkTj4yPLI6+lQLEEOUbSawwyacz6z8p80SLJsP6ZxJpqlOxYIVuvt0064SHRwqFaYJy4L1o57Lp2OREgZra96cAXQ0zm4WnSKHk8VtyyMgUCRQLhgU0=
Date: Tue, 16 Jun 2026 11:21:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22? 8/9] x86/domctl: don't imply I/O port
 permissions from I/O port mapping
Message-ID: <ajEVgN9h78QFh6mZ@macbook.local>
References: <e2f2cd28-a8f9-4455-8a3b-f55f8c08e1dd@suse.com>
 <a88eb54a-f0ff-4ad6-971f-ae526297a15d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a88eb54a-f0ff-4ad6-971f-ae526297a15d@suse.com>
X-ClientProxiedBy: MR1P264CA0167.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:55::8) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ2PR03MB7093:EE_
X-MS-Office365-Filtering-Correlation-Id: 795d0dbe-a4ce-4a16-54d2-08decb8898e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|4143699003|11063799006|5023799004|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	PtJGv+9z3ojuUJywJsBA8syJIpqeg9w4kuGK7u+PUZToLHM7IGYzLZPUqx3qLOalRUxOV9jNjHY/m/16e2pd4JIjNnFLm0JrMPDLDg4jQFUaqJJvfvETuBEzFKyjNp19Hlxs1ZJPBSwNBe4nj9w8iWddeKoT1ksTxZZJbi9uzhJL4latC5TSGpVbWcRf/HokmUCrda/tljPGTe1EK00UNSeEyk4j0PmSNn4yx/faQJ07ihhuMOGh04JNNpFwBwIomncUChxd6AjNs6RC4ad439s9WO3F5Ev+aKhMtnMCkqjJ9Vv4rzmJmCdg06b3fQe5xRczK24Q25/Zjj8BtTvuc79u3DEuNxGm6T17QHV51TCTPB8EEjnDYj0XOUpHY8iLwbPPqusjrhAJKAuMn1do9LnZnYpQ3I7xR9aN+K270W+Flic+iqPhEJgQuwU3dKrKt7DEoVJ6/S8aKcwI93qA2LPEuDVWft2AzdKSPiyR3d9YbfNr1+YQZRgHZJAjyJOm7pjbi0bUJUBoJxTNufYwOTFS+5udKbenMRYNggux572ZL92PDWkQhYURv3NYe3Bat0YDexedM7j6VZcNBeWvYdu5mezK2/jMPpX7VPTf7Dm1UJYRml2ZNpIzDyst9MqVUxkNzYzLqYJ7cWjbOdwzVvFyrJKvvUa9VyC9cygiBLNnsWDeIE+XvZdtqY/uLWdL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(4143699003)(11063799006)(5023799004)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEZmL0NMWmtlek8xOG5neDhlSGNhVlhaTC9WOFpNZytHRk1RekE3TUVITTRY?=
 =?utf-8?B?QVB5ZmVMeHVRcHQyNHFHbXpmb0dNbmJ0MFZFOGFTa2RDNEFTak5QRXIxcWVv?=
 =?utf-8?B?MW9zZGJFbFVpUmFOVG1rVXZvM0lZd2tDV2wzRHlRUnFINjMvaXhHd0ROS1pn?=
 =?utf-8?B?WmxVYld2UncyOEpFWmF5QTRHeERVY25ZUnROaUpMRjNyS2xUMEI4bUFjK1B4?=
 =?utf-8?B?MVUvcnJ3UlhmME9qL3dPOHdVUTErc1JhNC9RWHZTdk1tUlAyZFBibUNaQmQ5?=
 =?utf-8?B?amxNVzcrSmZydmZ3VGpMdllSaU9MZDZvZUFtdzlsa1BtbnJpR2NENHJERzR0?=
 =?utf-8?B?bUFuZFpvTkVTVGIrSThPK2QvbUhtQlZ5WWJzOXhBTlF3dCtLaitSZDlhaG8r?=
 =?utf-8?B?eWRqYnVhUWcxZFpHcTI0VWdwTUVIS1JpSTBvbWRUQUJqdlFLSlFNWmwxc2po?=
 =?utf-8?B?RzdGbEJYUXh2NnJGc1BYRWxJOStlUU9qdnJwaGZtd0U1Rk0zaWFyb2NqNThC?=
 =?utf-8?B?b3dDNkpxOUVGQVJGTWU2dEppSEY5cW45TGd0S0lnTlJTcFNTRUtFVmhGaTN0?=
 =?utf-8?B?bmpTZER2TGlGM0JzcSttREt2SGRVTzNUeVJabE51WlIvZ1VSK2E0SzdGQ2Zx?=
 =?utf-8?B?UUdHSHVvc1cyTmlSVmJ6YUxnUFF6L1lKejdzRGtTWE9ScVR5bHBocWl2eS81?=
 =?utf-8?B?UUlGdkZTdTV0R2p4bTdpZXR0TjRpNUpBSWNiZVF5UHA4UDBwdFgxTEQzQm43?=
 =?utf-8?B?MlVnTnRqbFJvQlpOR3QyelFHakY4ZEpqRlc2RXN4dHlTVHFxeEN2VkRDODd2?=
 =?utf-8?B?enFWUGp6aHFWZDF3Mk9MRGJ6UXBFM3BaYUFMTW9NMjc3UWJIQ3BvM0tKdnY3?=
 =?utf-8?B?aFNUMnhFeDk5NlRFVFlVTmNYYVdGS1hleWdSWjlTeXBjL2VQeDVGaWw1Zysx?=
 =?utf-8?B?VmVaL052ZkxoNzlaVDZIenVJVldWY2NkU2txZWM5S05ySCs5LzhTZzRHV0RG?=
 =?utf-8?B?WWxubzNoRDYyejBzQlZjcm5pTDRGT3YyeW9QSS9pVlQ3UWhkMUltN1N2MjBv?=
 =?utf-8?B?ZXVWbktkeTQ0WGpla2tFSUdGSzVnMlVWVzZzVENDNERwd1BwMDF6SzI2cEs3?=
 =?utf-8?B?WVNEU0o4Q2tRbVM0aFAxL3UwZUd4djFacy9TajBIa05ZQ2lEc3pmeTloN1Ji?=
 =?utf-8?B?UktPVWhlMFYyalRyNFdFTC91UU1YaXZJRUI1Zmg3QTArcXdaM1lKaWhtVlZI?=
 =?utf-8?B?SVJtN2o0aGFnM05DNGhJaDhDZjRoQW83c3ZpZlEyMXJoR29sVFluekpwWXRx?=
 =?utf-8?B?c0UxdThuREhXekZuUERtbDM2YXVCSVAzTHZLVFRDb2hxTy9EV0dQemhEYk5t?=
 =?utf-8?B?K2UrNkIvb3lGVEhzSjlQMmlVV2E0ZkhrYUo4ODBJQ244R09ybHcrR1NDQjRO?=
 =?utf-8?B?azhqaUVpTnJicm01cjZKQmF0TW1EWDQ2UUZldFN2WnpPeTFEY3ozeWsyWHhF?=
 =?utf-8?B?YVk4S3dua0ZCLzk4cjdLajNLUExKN29RWkZaL2lSbUJLVnV1M2twQ2xrWC9a?=
 =?utf-8?B?TE9tQkQ5YWlEQjdISWVXeXRGRldIelErWWVlZytmbFlkdy9TZjkyaDYvT3Y1?=
 =?utf-8?B?Uk9QN24wNmdrSzdqUWM2eWdqSUttMGRKMmFtL2M3ejE1ams5VW5OOWxwWW9k?=
 =?utf-8?B?bjAxWGg4WEwyZWQ2VU5GUEQwOFVWY29ic3BCUC9aaEJiaE1XMytMakpWTlp2?=
 =?utf-8?B?eHRjYUowMXdqdXRFR3p6SXBnRTZhWDN5OTR5S1o2RnZWWFNpV0xINkNzbUVa?=
 =?utf-8?B?aTViWGxCUFVYVk9XRlg1VWI4WHVHUkozUFNmMFdNZTllMTdveFVmRGR2L3VZ?=
 =?utf-8?B?MjF3T2FZL2lOZmdlYWZ1UnRGNWRzWEJrcUg5THU5ZnRuWnlDS1llZXZYNWpx?=
 =?utf-8?B?UHR4VS9VMFJZdGNHSE9PTk9LbUpCYytOdEQ3dVFLVWZHV3IvWm1GMWh1NHcw?=
 =?utf-8?B?MXUyL2RuU3N0Z1UyancrQ3R2YzZYV04rN2t1ZzRjMjhucGl3QU9WeDZ6cmlk?=
 =?utf-8?B?V3NTSng4S252dXl6OWt6cUZvYUxjZ0VSMHlHZW9qTFpHTEVsekhGOEtsUWtp?=
 =?utf-8?B?WUlDMlZ4K2M1cGx0RzhGcThtUmtybk9CdGliVnJEbVNWSm5wNDBiY0VxamNT?=
 =?utf-8?B?aE9lQWZveFFpVGFzaTl5cXNWaFJSMjRMSTV4aTZ0b0N0L0tTQ3pTZTZZS0wr?=
 =?utf-8?B?a0V1SzM3N2tBSGQxTXpEeEQ5dE9KbzV6ck9jZEdVQ28zWGZOVThuTTZVdEFl?=
 =?utf-8?B?WjJpN29QR0NWNjQ3NHNJYjU0K1kzbkRUTU1Jb2J2U2ZlbithK0FLdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 795d0dbe-a4ce-4a16-54d2-08decb8898e8
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 09:21:07.6333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zudtVIw8F6ULfohgRkdUfFPiPxQy8tI1fhiHen4ee4xlpM587i0H+c99AZpdDrEbLvl29sukwxme29VzWgpFeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7093
X-purgate-ID: tlsNG-42698a/1781601671-19D6FF3B-D4AA2D70/0/0
X-purgate-type: clean
X-purgate-size: 3373
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,gmail.com];
	SUBJECT_HAS_QUESTION(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D66468D7A3

On Mon, Jun 15, 2026 at 04:16:11PM +0200, Jan Beulich wrote:
> Rather than granting permissions when mapping (an operation that DM-s are
> allowed to carry out, while they can't invoke ioport-permission), check
> whether permissions actually were granted when adding a mapping. This then
> also allows relaxing the necessary locking.
> 
> Fixes: 192c4dabc344 ("domctl and p2m changes for PCI passthru")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> libxl has libxl__grant_vga_iomem_permission(), but I can't spot any I/O
> port equivalent (nor a revoke counterpart, btw). Everywhere else MMIO and
> I/O ports look to be treated equally.
> 
> Qemu uses both xc_domain_{iomem_permission,memory_mapping}() in
> igd_write_opregion(), but only xc_domain_{memory,ioport}_mapping() in
> xen_pt_region_update() and xen_pt_{,un}register_vga_regions(). Is the IGD
> region special in any way? Clearly this can't work from a stubdom.
> 
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -714,9 +714,14 @@ long arch_do_domctl(
>              break;
>  
>          hvm = &d->arch.hvm;
> -        iocaps_double_lock(d, true);
> +        /*
> +         * NB: The double lock isn't really needed when !add, but is used anyway
> +         * to keep things simple.
> +         */
> +        iocaps_double_lock(d, false);
>  
> -        if ( !ioports_access_permitted(currd, fmp, fmp + np - 1) )
> +        if ( !ioports_access_permitted(currd, fmp, fmp + np - 1) ||
> +             (add && !ioports_access_permitted(d, fmp, fmp + np - 1)) )
>              ret = -EPERM;
>          else if ( add )
>          {
> @@ -747,15 +752,6 @@ long arch_do_domctl(
>                  list_add_tail(&g2m_ioport->list, &hvm->g2m_ioport_list);
>              }
>              write_unlock(&hvm->g2m_ioport_lock);
> -            if ( !ret )
> -                ret = ioports_permit_access(d, fmp, fmp + np - 1);
> -            if ( ret && !found && g2m_ioport )
> -            {
> -                write_lock(&hvm->g2m_ioport_lock);
> -                list_del(&g2m_ioport->list);
> -                write_unlock(&hvm->g2m_ioport_lock);
> -                xfree(g2m_ioport);
> -            }
>          }
>          else
>          {
> @@ -772,15 +768,9 @@ long arch_do_domctl(
>                      break;
>                  }
>              write_unlock(&hvm->g2m_ioport_lock);
> -
> -            ret = ioports_deny_access(d, fmp, fmp + np - 1);
> -            if ( ret && is_hardware_domain(currd) )
> -                printk(XENLOG_ERR
> -                       "ioport_map: error %ld denying dom%d access to [%x,%x]\n",
> -                       ret, d->domain_id, fmp, fmp + np - 1);
>          }
>  
> -        iocaps_double_unlock(d, true);
> +        iocaps_double_unlock(d, false);

I think the new behavior is more sane, however the problematic aspect
of this change is the removal case IMO: we cannot be sure whether
existing callers rely on XEN_DOMCTL_ioport_mapping also removing the
permissions, and hence Xen no longer removing the permissions might
lead to leaks.

This is a risk we might be willing to take, but it must be stated in
the commit message.  And likely in a CHANGELOG entry so that external
consumers are aware of this change and can adjust as necessary.

Thanks, Roger.

