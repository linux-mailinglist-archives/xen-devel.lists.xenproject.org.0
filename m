Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gTwALLWeQmoe+wkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 18:35:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E14C16DD627
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 18:35:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=HgT+B5F4;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1347778.1605617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weEvi-0000OH-P0; Mon, 29 Jun 2026 16:33:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347778.1605617; Mon, 29 Jun 2026 16:33:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weEvi-0000Mc-La; Mon, 29 Jun 2026 16:33:54 +0000
Received: by outflank-mailman (input) for mailman id 1347778;
 Mon, 29 Jun 2026 16:33:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1weEvg-0000MW-LW
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 16:33:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weEvg-000qhq-1w
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 18:33:52 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a429e67-bab6-0a2a0a5309dd-0a2a4501c528-14
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 18:33:51 +0200
Received: from [40.93.196.17]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a429e6e-400f-0a2a45010019-285dc411eebb-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 18:33:51 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB5908.namprd03.prod.outlook.com (2603:10b6:303:9d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 16:33:47 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0159.016; Mon, 29 Jun 2026
 16:33:46 +0000
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
 b=eSc8NPlZqxC1xdHTl/AnhuIDh65ntp2KPE1xktF2GKz1HRkgtM7HRjC5DMnewcL5zMV7/3udk1L92wcLXtwET9HAbo8P4TmymfDF6FGwclrHTMGDnB8mhLvMazhIjCR3HI73KqabksYaXshuQGa+Y/RcjKLxGz8hfBTO8Gkw2RnxbmHLD5vU2Cg4LZPjGrNeoymn3LbLTLpA+QUMkHqFbLFPXMIPk4mcw7HTeBsHn26APIc23/2xPPBrfPuwE4YEpGnujTh2qf+5owacipDzPkbVIsJU+iaisHCkTsG7Wcfcp4QDaSvHLPfJoR19xxGO6x+X6XRe6efTBXEyBunP4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSGQN0XEbXOcrZMgs3VvXAML6QXKxcUkF8MrS3LCm8w=;
 b=ZB11yrpX9E9esy3ToSrNoGvJxfWOQvrc5iAT0fBIjql5fSbrz6RTns4HBOautUgyv+CYu4emZvvXNeb//mGRF9wlf1UnwiIFwJsK7gdGYhn1TYYsJlxeqLRgoCePq8B3iXbRrEQ8Gh13QTVQ60IyTwJT3+pGsLJ6Kkr2Z/S6avQzpm7z466mZNYSMALd4c/oz7jX1BeBO2Mt7SHWdif21lrVT3EgznTOaodX064Zgzt7V/dKUhJGwz4v/6EEqU2y5NKX0clX2V6dPpqZ9nI1jmxzB4+P6BvP2uiM1GN84HRudS/Zd2XoYZfwEzEdhj0he6Gz0lhgIBEAYGy65LlXrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSGQN0XEbXOcrZMgs3VvXAML6QXKxcUkF8MrS3LCm8w=;
 b=HgT+B5F479qV/5nLGnt80/yCVTIktRnkC03yGxvCIrbZHlezYAQBn++/pM/mbS6nE0qN1Ufnno8XjWzLhLJbpCWtndXDgry+NSciaqhE/S8yXNfYAz55wlEUuLeA9WaCyQw9Dz6MJoNduM2AYqNeOdLLDzRb8bR2lpww9nW3oMI=
Message-ID: <69ae3671-aa66-4717-91e5-3b989e99c8d3@citrix.com>
Date: Mon, 29 Jun 2026 17:33:40 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, roger.pau@citrix.com,
 ross.lagerwall@citrix.com, sstabellini@kernel.org, julien@xen.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
 anthony.perard@vates.tech, jbeulich@suse.com, taka@valinux.co.jp,
 den@valinux.co.jp
Subject: Re: [RFC] xen/arm64: livepatch: enable attaching callbacks
To: Ryo Takakura <takakura@valinux.co.jp>, xen-devel@lists.xenproject.org
References: <20260629020128.30561-1-takakura@valinux.co.jp>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260629020128.30561-1-takakura@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0103.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB5908:EE_
X-MS-Office365-Filtering-Correlation-Id: d8522c12-6bbc-488f-2e97-08ded5fc30e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|7416014|1800799024|22082099003|18002099003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	2+SewIGV1bh3bp0I7wasVVeEj9pdg33/2JmML2rayvRNZBa2yFvnUMQSD0slKecRiTqnRgMrz2PoR/hRD3/mmU8CQj87kMXuPfoc423e+6B377lEu3nRBfBVVM3eM71v8+AVD/6JSLlRGIfGPMkxHi/58QcodWyeCls7PEsnhRSFi22JA9MEyHps2f2JO76dm8mWg2Iv86Ru5Zph+4lLdLOMwZA4Qbo4tPbl3ADw2K4O4sGN3qYzOBYOk44e0z+M735POh9dcvSccd6cxYm8gePSsQok9hHs+YDET8cHaAWwqi1RXQOcCJfzd3DVzY2f8OJoD6C4IGrUv9solkCO2m/aAdmazriB90Ll65Mkb2bv9trsoz4kiRBXNAffcqD5gJQ/7BVsCn7uMkFRJMxVBKxLlax4wWAV2yp5Wx4V62C8LPkDRKHY4mLqL4JWST/iRfByEVdEeqZDD3NaCWia0Ls0Ki/+TzTXPE5vT8iLiQbJJasxX8N7Tgnotw13p0V2kG6ZqfxtfaMAjuPRGDAVfnhHFLsqxDfzMPX8DAj0rYsLSKZfWxsWoPfbCiYifcQ2MlwGIhQ93OLoQDFqZdlOQU0EHKgflzUI12MJ4d32r86SdV3XgZaRysluMvXu5XBTbaQVb9ogaIETJiC1Z1McXg11wc7plPUBgW0K+zyeBDA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(7416014)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzlUeU5TR2R5cjNmZzE2cDNBWUJpbktiSE9SYU5jT3ZFUTJ2YUZSUXd6UlNk?=
 =?utf-8?B?enR5L3NqM1J1MXhRT2grUWVvNm5zU2dYR0ZWLy9SbHU1QXNWV1FFZU41LzZX?=
 =?utf-8?B?VDROM0pVSCtCdEVZcytZZlZ2ckE0NTczMFhDd0M3U1RJZXd5MlVuc0E1UmdG?=
 =?utf-8?B?WS9SNkZLYmswditJN0FEODhWYlJwWHh0YWJDS09CZ2FIWXlYWlowU2VrVE1o?=
 =?utf-8?B?S3V2S0pYZzlHelAyL1BsN2EzMVZnNFczbmgrdVZBS1U0bVlXdFpCYnBSZ1dV?=
 =?utf-8?B?K2MxVUY1enh6VWt6MjJwVy9MU0ZHV0RGMDBQZlJEQnl2YU84WWZCSm1lMlpT?=
 =?utf-8?B?UExPTDMzNW1Pc3pyc3lVY2dzR0EySDN3b2J6N2o4a2gxN3ZnbEZGbmdZendQ?=
 =?utf-8?B?UE41OHRzNURPUVNIUzNRczJ6VTRzNGZWdjR4dXNxZVNFZEhWRVFHWExKdFZs?=
 =?utf-8?B?ckVYTWZTQTE2dGtLWDd2SVB6U3FmejE4KzNGOUZjRmVsL2RBcWYvbGtzV3Nu?=
 =?utf-8?B?SFZnVUVYbDhzOEM2RUpjRjlJUGtFTzJuMFdmUEFQdkl0THRmZHdBNGFYOUtP?=
 =?utf-8?B?OW4ycUJ4MWFSZ0xwSGUrbXB1aFhoR1dxdXY1MjY2MWVoTnkvSXRYMVVNRVo4?=
 =?utf-8?B?TEEvN3BYWVBxVnNPR1VZYjFXNFEyU21aZTlVeTAyY1ROd1YyUTdFOHdnV2Qr?=
 =?utf-8?B?bCs3bDZhKzd0Z29kMWx2djN4Y2JZUWp3VFZYeThjVjVmdU9sSDZRNXBaNUZ3?=
 =?utf-8?B?UzMweEFVRXMrR3NNVERXbzFrNExFOWtaSGhNa2UxTVYxRkpYSmdIUmpxVkJw?=
 =?utf-8?B?S1ZDWmQ3MkFrREJaY2JVc0hVWWRmbFNuZFRZL3czTTNmVWdTbTd2cVB5aTZp?=
 =?utf-8?B?eXZaV1VpZmVSSy81SmpWQmQ1Q3VFQ3ZvejBCeXU0YzU1UnZMRXhpYlJrZHRG?=
 =?utf-8?B?Uzl2ZWhuZVZhd2JDRW00cnk2cGlCYjJkUnZ2aFcxbmZ6Q1gvWFhQdHFCRUx6?=
 =?utf-8?B?VEdoRGEyaGs3MExITVRqQ3hFL1FjNmlZRXZiRmFMNXNVOW1hbmo2N1N5TVNn?=
 =?utf-8?B?bVk0STI5RU4rMndwZ1lMRmgxMDZ5TmFYYUQ0c3MxeUdUSnkza08vSHpnczVL?=
 =?utf-8?B?bUtVYndEY1JRS3VkYzRzMHhkTGl5VVREcWhMV05xK1pPeXo4ZzUrOEphWkRL?=
 =?utf-8?B?Q011ZHFSZmJTUjRkMjFhNERjMjBVWGFJN2F4RnljMWNaNkl0SW43WG1CTTVT?=
 =?utf-8?B?OEs3Sm0xQW5SL3dhNUtPYnUwdUlxZmp5SXdwWEhDdFZ3S2c5UWVLMjVmN29X?=
 =?utf-8?B?VTkyNDYwK3RDRlVaeGQxUjRPYWFPdjE1aDVxYTdodkdXZ09lenJHK2pKSnZ3?=
 =?utf-8?B?WWdCbUpBTS9FNHF1NXRCYWx4VytiQk5ob3JidEgwa2JoTG1MYmNTU2ZMMWsw?=
 =?utf-8?B?R0tXcjFVZ0lFTElYTUl1VHFsZjBkdmwrOFZVakdGMUlGci9mQ0hrZE45b1hm?=
 =?utf-8?B?QkRCck5jUjhUcTRMOEpSU0FnU2tZUEVqQjR4c3h4T1JpeHBpYkh1amNXY2Yy?=
 =?utf-8?B?L3RqQW5xK2JBUE1aMldIMXUzRXZyenM5YnJYcGczTms0VmJkV0YyV3FDcyt4?=
 =?utf-8?B?ZmZrMVQ2bzVWQ0xLYXpaTEtMZGtveUd5SGRkMWlxbTdyVjZLN3BQc2xSM2dn?=
 =?utf-8?B?OHh4dGZDdHF2OXdWUElKWjZubVBOZnoyeTNlM1RDTEw1bFZFbW1FeFhDd3Iy?=
 =?utf-8?B?Z2tUT1ZMMXo1a0pKamVEWnZOWW4rc0g5ZS9BQzNFWW5KNFZMVzl1ckN5MUxm?=
 =?utf-8?B?ODRueFpDM3lDMHdxbE12RkVQWFUwVWVCbzVNQ3JQbW1vUVpPR0hOZ2pLdE1C?=
 =?utf-8?B?MHkvamM2cXg2TWJsWTdDb08wK0ZQb3ovTUFWZEg1TVNJbHZicmw5Q3ZROTZ1?=
 =?utf-8?B?UDJadG1MYUxSU0xlaHYwRGtGWTNpOHhURkZ0NWVnL1FqRDB3MVJKSEI0NjIx?=
 =?utf-8?B?ZkI4WDhTeURveExNcEQyWlBlWnVkMHZlRVZUaHdoRjRlY0JhOGpIRVVQeXFC?=
 =?utf-8?B?d3E4cWlkcmxWN3JVSUNlRS9LdGFSUytkNTVGUGpjekE1OGVvaWE0SnRNdGha?=
 =?utf-8?B?RXBBekRNUTB0NmZlNW9UT0tVNkh4cmZLVkxqK2t6N3ZIdDdjUlVHbnI1VXRm?=
 =?utf-8?B?TVpPVU9RcnpLQ2ZtUktGVG1nWjVKSURncjU0UFlVcTdWUXh6dmw1NE5obHlD?=
 =?utf-8?B?TTJaZVV0eFI2eTFrTFdpYXBQcWg3cmRxQWFOdGJnVWdyeXhFaWM2OWhMRTJj?=
 =?utf-8?B?Z1EwRTBhWmRoYmljdXBUMStPTi80Ky8xTUFpWlVpV1lVeUovR3VoUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8522c12-6bbc-488f-2e97-08ded5fc30e0
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 16:33:46.2717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PybJ5dlp4KLgQU2Acs44zOYkWn0WHO7mtt8Pwc5Rx1WfFr7Prik2OO1IAtZ8W04bedCn0EHs+u0SEn1YUedHCczwI+4DoNYnpCINxTzbaPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5908
X-purgate-ID: tlsNG-d62444/1782750831-836CB1E0-E73D4AD6/0/0
X-purgate-type: clean
X-purgate-size: 6922
X-Rspamd-Action: no action
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:taka@valinux.co.jp,m:den@valinux.co.jp,m:takakura@valinux.co.jp,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E14C16DD627

On 29/06/2026 3:01 am, Ryo Takakura wrote:
> Linux ftrace allows registering callbacks which is useful
> for debugging and tracing events. On Linux, it is done by
> reserving function entry points at compile time which can
> later be patched to branch to a trampoline.
>
> This patch implements similar callback feature, but with
> different approach using existing livepatch infrastructure.
> Instead of reserving function entry points at compile time,
> the traced function will be livepatched so that it branches
> to the trampoline.
>
> The role of the trampoline(illustrated below) is to preserve
> the context while jumping to the tracer function, and return
> back to the traced function with its context restored.
>
> trampoline:
>     Save regs
>     Call tracer function
>     Restore regs
>     old_addr
>     return old_addr + 4
>
> One can request the feature by setting @trampoline_buf to 1
> which will allocate a buffer for trampoline.
>
> Signed-off-by: Ryo Takakura <takakura@valinux.co.jp>

Having something a bit more like Linux tracing would be nice.  But, this
is very different to the other livepatching functionality and a few bits
don't match nicely.

First, you write a lot of the trampoline manually.  You can do most of
this in the target function with
__attribute__((no_caller_saved_registers)), avoiding the need to do it
by hand.   This would require a minimum GCC of 7 (where our baseline is
5) but it's acceptable for new features to require a newer compiler.

Secondly, what happens if the instruction at old_addr is an ADRP, or a
branch?  Right now, there's no case where we move an instruction; we
only produce new code, and branch from old to new.

When you're moving the instruction at old_addr, you must compensate for
any IP-relative component.  Also you can in principle have a conditional
branch as the first instruction, which gives you two branches to fix up
at the end of the trampoline, rather than one.

On x86, you've got an additional problem that it's generally more than
one instruction, and rarely an exect number of instructions overwritten
at old_addr.

Some high level comments, leaving aside the details until the above
questions are better understood.

> diff --git a/xen/arch/arm/arm64/livepatch.c b/xen/arch/arm/arm64/livepatch.c
> index e135bd5bf9..b7c9aba94e 100644
> --- a/xen/arch/arm/arm64/livepatch.c
> +++ b/xen/arch/arm/arm64/livepatch.c
> @@ -34,12 +57,87 @@ void arch_livepatch_apply(const struct livepatch_func *func,
>      /* Save old ones. */
>      memcpy(state->insn_buffer, func->old_addr, len);
>  
> -    if ( func->new_addr )
> +    if ( !func->new_addr )
> +    {
> +        insn = aarch64_insn_gen_nop();
> +    }
> +    else if ( func->trampoline_buf )
> +    {
> +        int rc;
> +        uint32_t *trampoline = func->trampoline_buf;
> +        uint32_t *tp = trampoline;
> +        void *orig_cont_addr = (void *)func->old_addr + len;
> +        unsigned int trampoline_code_size = len + 12 * ARCH_PATCH_INSN_SIZE;
> +        unsigned long trampoline_start = (unsigned long)trampoline & PAGE_MASK;
> +        unsigned long trampoline_end =
> +            PAGE_ALIGN((unsigned long)trampoline + trampoline_code_size);
> +
> +        /*
> +         * Make the payload text area writeable while generating
> +         * the trampoline instructions.
> +         */
> +        rc = modify_xen_mappings(trampoline_start, trampoline_end,
> +                                 PAGE_HYPERVISOR);
> +        if ( rc )
> +        {
> +            printk(XENLOG_ERR LIVEPATCH
> +                   "Failed to make trampoline writable: %d\n", rc);
> +            return;
> +        }

This ought not to be necessary.

The trampoline is executable code, so should have space reserved for it
in .text of the livepatch.

Then, you can identify it simply by references in a new section, without
having to have a pointer with a sentinel value (void *)1 in (which MISRA
will have a fit at).

> +
> +        /* Save state before calling the tracer. */
> +        *tp++ = aarch64_insn_gen_stp_pre(0, 1);
> +        *tp++ = aarch64_insn_gen_stp_pre(2, 3);
> +        *tp++ = aarch64_insn_gen_stp_pre(4, 5);
> +        *tp++ = aarch64_insn_gen_stp_pre(6, 7);
> +        *tp++ = aarch64_insn_gen_stp_pre(29, 30);
> +
> +        /* Call user's tracing function. */
> +        insn = aarch64_insn_gen_branch_imm(
> +            (unsigned long)tp,
> +            (unsigned long)func->new_addr,
> +            AARCH64_INSN_BRANCH_LINK);
> +        *tp++ = insn;
> +
> +        /* Restore state before continuing original function. */
> +        *tp++ = aarch64_insn_gen_ldp_post(29, 30);
> +        *tp++ = aarch64_insn_gen_ldp_post(6, 7);
> +        *tp++ = aarch64_insn_gen_ldp_post(4, 5);
> +        *tp++ = aarch64_insn_gen_ldp_post(2, 3);
> +        *tp++ = aarch64_insn_gen_ldp_post(0, 1);
> +
> +        /* Original instruction. */
> +        memcpy(tp, state->insn_buffer, len);
> +        tp += len / ARCH_PATCH_INSN_SIZE;
> +
> +        /* Branch back to original function. */
> +        insn = aarch64_insn_gen_branch_imm(
> +            (unsigned long)tp,
> +            (unsigned long)orig_cont_addr,
> +            AARCH64_INSN_BRANCH_NOLINK);
> +        *tp++ = insn;
> +
> +        clean_and_invalidate_dcache_va_range(trampoline, trampoline_code_size);
> +
> +        rc = modify_xen_mappings(trampoline_start, trampoline_end,
> +                                 PAGE_HYPERVISOR_RX);
> +        if ( rc )
> +        {
> +            printk(XENLOG_ERR LIVEPATCH
> +                   "Failed to restore trampoline RX mapping: %d\n", rc);
> +            return;
> +        }
> +
> +        /* Branch from original function to trampoline. */
> +        insn = aarch64_insn_gen_branch_imm(
> +            (unsigned long)func->old_addr,
> +            (unsigned long)func->trampoline_buf,
> +            AARCH64_INSN_BRANCH_NOLINK);

This entire block wants breaking out into a function for writing the
trampoline.  It does not want to live inline in arch_livepatch_apply().

> diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
> index 45c8924f34..7a81763cf2 100644
> --- a/xen/include/xen/livepatch.h
> +++ b/xen/include/xen/livepatch.h
> @@ -48,6 +48,8 @@ struct xen_sysctl_livepatch_op;
>  #define ELF_LIVEPATCH_POSTREVERT_HOOK ".livepatch.hooks.postrevert"
>  /* Arbitrary limit for payload size and .bss section size. */
>  #define LIVEPATCH_MAX_SIZE     MB(2)
> +/* Size of a trampoline used for function tracing */
> +#define LIVEPATCH_TRAMPOLINE_SIZE 128

This is a common header.  How have you calculate 128?

At best, it's an Aarch64 specific number, but if you reserve space
properly in .text then it won't even matter, I don't think.

~Andrew

