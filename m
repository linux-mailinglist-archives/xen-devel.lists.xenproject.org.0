Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lGzhAIPaL2rTHwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 12:57:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3678C68587D
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 12:57:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=MBGTWw93;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1338127.1599136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ4za-0003N5-QV; Mon, 15 Jun 2026 10:56:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338127.1599136; Mon, 15 Jun 2026 10:56:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ4za-0003LK-Nw; Mon, 15 Jun 2026 10:56:34 +0000
Received: by outflank-mailman (input) for mailman id 1338127;
 Mon, 15 Jun 2026 10:56:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wZ4zY-0003LE-LA
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 10:56:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ4zX-005oAz-SZ
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 12:56:31 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a2fda5b-5cb7-0a2a0a5109dd-0a2a450993ae-14
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 12:56:31 +0200
Received: from [52.101.201.0]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a2fda5e-2497-0a2a45090019-3465c900f490-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 12:56:31 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV4PR03MB8212.namprd03.prod.outlook.com (2603:10b6:408:2dc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 10:56:28 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 10:56:28 +0000
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
 b=cp/E462PE3mt9JAbgPd+LBJj8E9PfIHNf9FYLVzQnW/PBkk1s65HcFwszPE2hnlMgdJQGRZ2gYgno9sTLnc+TxdjJlr/dcHtQ1TXFlxtBtw44In25MK+M8/RvOKyYKuzeOOIzTWeEj1S0QXkvc12SJ3Kxk9kLhd9Kfzgs1pUjDGoeHnoGYlK9phR/ph874o/HeZXX2g+/qqXI8TJX3/wKqGWU4niwaxYvlADARnZsGvvnomf40nQDBpnlf2adlqx9t9dKJIc+gxuOF+a9R2mcXEijuEIGcx4ZvW2ZZCCh6d0u5Eh8/xk807n7hOWkTPBKfTINioTmkw9nTe1YLoqVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pAlNxYVc4QRGDwwM8J+8QmCAUE76gH9/VnxxMleB2EQ=;
 b=UK5qbUqUU1EZ2kJK+m+r0/TIc4xO/5E+gP76V9HMGzRNaO945t3eJ6y48mNgLYiSSU6pCkbJZucq/Ti8f++f+9BpL8oC57UR3CW+ihf0fS5LmkAKlKdyEwEMZtyztNMMQNtnqnbqNeBAlgO9cKTQ43iQaQ2+QY/rzRyroWG8uyYBLIpR7ab9kl83ZRW0U8BqUXlg3b/AviKtSRVhhk/bq16LPLM+35zybk/UiuyDlTlMMkRqbneiheEhAE6xVP9G7FPbZSWUcgvy0dMUXCelTfmJt6z7H0bAKxN9R7XUabGN0of/yM6BpexCRcynaXMqlD54L40/Id+jextu+/sYyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pAlNxYVc4QRGDwwM8J+8QmCAUE76gH9/VnxxMleB2EQ=;
 b=MBGTWw93i+/ivppzr3jQuO9mGyrx8wWhDKzW793phCmsGHWlYcJoqWmzDVPkcZiLLTyRVnSocWmRMAQtdCCiQMtfW/6vDzTRCGRMtfaMdr4z3ASKNa7FFK0AbhbJQbQWt3cF3drTpVk4SxLr7Xi5LlKrd3punqR56K4K9BsCMJE=
Message-ID: <1224fa79-d1df-4382-9829-aa2eabe60d5a@citrix.com>
Date: Mon, 15 Jun 2026 11:56:25 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com,
 roger.pau@citrix.com, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Subject: Re: [PATCH 5/7] x86/kexec: Implement new EFI load types
To: Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
References: <20260609154518.779757-1-kevin.lampis@citrix.com>
 <20260609154518.779757-6-kevin.lampis@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260609154518.779757-6-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0228.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV4PR03MB8212:EE_
X-MS-Office365-Filtering-Correlation-Id: 705897e2-79b9-4abe-03f2-08decaccc077
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|56012099006|11063799006|5023799004|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Qd5Qk9cEh8KEukunTVJUWK3xa8Gddh/JXKoVgOy5fOgogHDkkuGp+agWTlfra/5UQyzCyJzXAv03+syJ1HnOKznfY5vcLoHsXvkk6RUCLiXcPebmIqmESNaf08t+p8rZRGT3Kb7/Ppvazv4QlN4sJSkpwlALvbO1NBlAQatCuo8qGgF2a6bqRVGm87obAzQ1PFhUhNfaPlT4lf7CjrxNlaIWxWn/ee5DF5EJZlNDAita7W4JYMSyUn4QttDs17qEasSop6WzfjIY+1TGc6uv+lpYuNSStSKOBrdBxJrfCLD7Qww7uzLCo9ZzDsTKau5qtrupJ3pbVYwPCK3gBMuX3KyBF1RbQZNvK8oLGVrMR69P1PK9f2ihmhA1ejuPXsLUgGLDRm2pbdqWF3tCD5wSs3Syx/H/+G/ZwTuYn1YZHh5bAMyUWQNWaa2hSzOQ4j/+jsUoL9LKGHyTXgJUtOf0AB5m5vnktNVm2uWLcn0FOhVBo7LdWZJ8xoOW3HMbma6+Vp8OxhZCHLkhW07IOdS+qpK3uMusMqKQPK2Qg2aWjcA3lP46K1+xHJI9QZwdB2Py0nwUCs8lxVV6uxdUE5vBKvfys6qRPucbtUErTpgW61SjxTtIF/Y3Pq8gGlkMhn+uTZtwfNRk+jh4sedb3yhaQiqBCelqOqz3ciQ1rNtAOxXZ/bHzMHEj2BvxlgXvvplt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(56012099006)(11063799006)(5023799004)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rk02c0E3MlVuamF1OWRzWThBMk1HZGJsK25aejZzSmhBMU1tS2NJT0x3aElO?=
 =?utf-8?B?OTJId3hncFZ3VTh4MTZLMEQrSGdIdy9oTHU5WnpUMndUSldwMDR0OWNzYXcv?=
 =?utf-8?B?QUJmdVZ2dm9qeUFpUi9TNFBtekJUVXBFUjV6R1NneFhRR0dXcmFMZWZlM0tP?=
 =?utf-8?B?bGZ0c0FDS09heHlocUV5bU9RRUF5T0VucjJOejF6TnlqZG9QS2hqbE5FRnBr?=
 =?utf-8?B?VW1wRkVzSUtPMmVWclZlTDVXLy9yd0tOemh3aEVENjNndXFWVzFXREJXd3VZ?=
 =?utf-8?B?aFNJRlpFVE1OUjFWQWhiRnRwd3VEUkFvVmw0UTNKYjZNUkRDNUVvR09Ya1Fa?=
 =?utf-8?B?NXA1cjZVdEVoTkpNbE1qaU9Fb3pDR1BXc2xYT2ZiVkNzaVVoL1FES3grQTQ5?=
 =?utf-8?B?WEpMMlVzbEJOSUFmTmV0TU04NlFjNUxDSW0vWWlZVUFCb21MZjZSQU1ROXFr?=
 =?utf-8?B?UGpPVXRkV3lubG9pczdUd01aZDBFcWNMelh4UUd6V2JFVkVhYzR6cjVWb3JU?=
 =?utf-8?B?NllVSkxCRlp2NVgwU29FR2d2YmdBdGlWL3ZLU21TRy9SeUdxc3Foc0FVSGVK?=
 =?utf-8?B?QXZMK2t2ajMrQkVhSXZiYW55YmM2cVlXZXpRZHcrdmlmTWdmRU1aYlMyRWpj?=
 =?utf-8?B?YWJHVWZ4emhmZGExVlRSS0NlWWs5TlVjcGtrdnVQcHBjaW9SNk8xbGpsUUpn?=
 =?utf-8?B?ZXQ2NjlGaFoxNnM0SHZzZU92TVpTS0hydlQrZEMzNFc5OEk5WjhhN3A3R1Z6?=
 =?utf-8?B?NWhBQldYNXJKOEpjWURVZVhWdElLN1JOZkNsUG5rMFV2ek9UK2Z1YncrOHZZ?=
 =?utf-8?B?cWdMV05pTmJTUTNsMmExZmZuQ3dsNUxPR3FLVXFsS3k5ekIzc0NidFZQWnE5?=
 =?utf-8?B?V0xtOThwaU54ZUVOQUU5dC9LZ0VVd05INU9pOHQyTG9tWTFyQ0JJbDVsYkVq?=
 =?utf-8?B?alQycTdFUjAxQVFjRGF6aE1ydkQ0ZlZnWFZRQ0g4VysyMERhQy9mbEV1Zjdp?=
 =?utf-8?B?SVAyWTVtUzJhUU1oRE1Qa2dnR0o3R0hiMDQvVmlGYnZ4MVprMytIL3BQRU5Y?=
 =?utf-8?B?bG1IWWtPNWo2cEpqMldlcUpKbnkrV093ZEI4YTZMNGs0ZFU4RDRJZitqdmRF?=
 =?utf-8?B?NkN0RzVKZVVqcUdTT1BvVUNFT2NCQ054cTJ1ZjFLZlJqMEZBaEdoVnI1cTBh?=
 =?utf-8?B?eHpoUFllZTVQV0k2OHFhVlY5aUJOS1QyUmRZWE5PQy92VXJvZEZtRUVHSzh0?=
 =?utf-8?B?ZCtQcFdmYk5EVUh3MC9idHNjWGUzY1E2bVd3eUdpR0ZCK3ArRkFkV0d3N0sw?=
 =?utf-8?B?ZjhEL2tUbDNUUE1OOExNd3Jqa2FmcEEraE8xaERSdFJONUpMT2d3Y1htOXNl?=
 =?utf-8?B?U0t6cldnTmEwNHdsUGVRQkVENDNacnVuaTNlT3J2Um9Jck0veHl5cTdmT3lj?=
 =?utf-8?B?WlhQVzA4UkdPMUt3dDBSUHVzdGhRdTF4bzBhT1M0Si8weXM2TFVkOVRlS1Fj?=
 =?utf-8?B?QmMvZXJ4V1J2RG1vN2c2UkRiZWlQMmkxZzdGOEd0NWFDQUVtTXhZWk0wY09P?=
 =?utf-8?B?SXY5S2tpenliRGRRMFFRUXVyN3VJOTRwSVFLOWNkc1hqV2s1aE16U25oUDds?=
 =?utf-8?B?YUNTc2FhNHFKdTFzQTF5YTQ5RWVWb0wxN05MNWc2VnJ5R296VElZa0JTRHlB?=
 =?utf-8?B?cVBnTkd5eTVNdWpmNmNqdFdHdS9sdEY1SWdQdzE0aUZBVVhyajZBVXNrVDBN?=
 =?utf-8?B?RDdoeUl2enRXMWpnS2RvWk1hL3lNcW9NYnBjRDcrUERGZkdTeUo1UTJpUjBT?=
 =?utf-8?B?TnQ4VklCRjg4TFlIeXZ6K09XaTVDSFppMk5zdUpqTHp3VWQ5ZkppNHRlWGxB?=
 =?utf-8?B?M3lCRXVaTlF2aHJmaUxtRWxzbndRQSt4Tk80dFlIM1NMMjFNMnRBaVRhMVJq?=
 =?utf-8?B?dy8wL0MyUE05SnJBRm1HcE9YNWVDcEdOQTl4b09JU0ZSdHlhbnE3YmVFaTFV?=
 =?utf-8?B?SS9iMFJobm5ZcXZEcTlyNEVkcWRjZmtQSWZ2bjA4amZBeFIxbHk0RTgrT0hT?=
 =?utf-8?B?amdxNXQ5emRoZ1FMWHRvbysvYmxoTGhqSGRCZ0w5MCtTMFZQYkhsRDJ5N1RP?=
 =?utf-8?B?SEJHblBOYUszOEpuL2xpWUZZU1MvaTlVZXJhM2hBMEx1Mjk5YU91am16dS9p?=
 =?utf-8?B?aFRueXZyREl0SXJIdFRmTUNHdkRPWmFQaDdVSWFCRWhPckd0TitPN2Y2dEp4?=
 =?utf-8?B?MGhBT0JBbmN5ZEJ6Q1VZa1JXSkN3bk5HOFVJZ1dZY3JIQ0czQlZWamtJSk5w?=
 =?utf-8?B?Yzdrbk53WXliMllwblRBanU0ODN4RkFSY0U3V2VzRkVJblhxVkRnNitHaFBq?=
 =?utf-8?Q?K+dXMYrEuoBBKIas=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 705897e2-79b9-4abe-03f2-08decaccc077
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 10:56:28.6171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8dF1dxzKEGNA9GAau3z/WcpsmfZ7MK2NOgB5Z4LFV58DmB4w7XnVQFHpqOLsuACMoJwIA0CBxmX8nOb78qk7juhIHEm/r/uhU4ZmHFeUh9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR03MB8212
X-purgate-ID: tlsNG-bad1c0/1781520991-41165A53-CAF3F031/0/0
X-purgate-type: clean
X-purgate-size: 3175
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[cloud.com:email];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:gerald.elder-vass@cloud.com,m:kevin.lampis@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3678C68587D

On 09/06/2026 4:45 pm, Kevin Lampis wrote:
> From: Ross Lagerwall <ross.lagerwall@citrix.com>
>
> Add new EFI load type for kexec. This load type is suitable for use when Secure
> Boot is enabled.
>
> When this load type is used, the caller should not pass purgatory as one of
> the kexec segments. Instead, Xen will prepare any glue code needed internally.
>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
> Signed-off-by: Kevin Lampis <klampis@citrix.com>

Now that you've dropped regular EFI, the subject should become singular.

> diff --git a/xen/common/kimage.c b/xen/common/kimage.c
> index 1d872916b9..9b49455e8e 100644
> --- a/xen/common/kimage.c
> +++ b/xen/common/kimage.c
> @@ -22,6 +22,7 @@
>  #include <xen/kimage.h>
>  #include <xen/sha2.h>
>  
> +#include <asm/bzimage.h>
>  #include <asm/page.h>

This does not compile for non-x86.  But how to fix it depends on a later
question.


> @@ -1064,6 +1064,63 @@ done:
>      return ret;
>  }
>  
> +/*
> + * Find the entry point to the new kernel, we need to map the crash region into
> + * memory in order to read the kernel header.
> + */
> +#define KERNEL_SEGMENT_IDX 0
> +static uint64_t kimage_find_kernel_entry_maddr(struct kexec_image *image)
> +{
> +    uint64_t alignment_addr;
> +    uint32_t alignment;
> +    unsigned long dest_mfn;
> +    void *dest_va;
> +
> +    alignment_addr = image->segments[KERNEL_SEGMENT_IDX].dest_maddr +
> +                         image->segments[KERNEL_SEGMENT_IDX].dest_offset +
> +                         kernel_alignment_offset();
> +
> +    dest_mfn = alignment_addr >> PAGE_SHIFT;
> +    dest_va = map_domain_page(_mfn(dest_mfn));
> +    if ( !dest_va )
> +        return -EINVAL;
> +
> +    alignment = *((uint32_t *) ((uint8_t *) dest_va +
> +                                                PAGE_OFFSET(alignment_addr)));
> +
> +    unmap_domain_page(dest_va);
> +
> +    /*
> +     * Ensure the kernel alignment is a valid LOAD_PHYSICAL_ADDR,
> +     * which ranges from 0x200000 (2MiB) to 0x1000000 (16Mib) on 64-bit systems
> +     * as defined in the kernel x86 Kconfig
> +     */
> +    if ( alignment % 0x200000 != 0 ||
> +         alignment < 0x200000 ||
> +         alignment > 0x1000000 )
> +        return -EINVAL;
> +
> +    return ROUNDUP(image->segments[KERNEL_SEGMENT_IDX].dest_maddr +
> +                       image->segments[KERNEL_SEGMENT_IDX].dest_offset,
> +                   alignment) +
> +                   0x200;

Ok, so here is startup_64, hidden as a magic constant.

The rest doesn't make sense.  You're finding and checking the alignment
field is within the known bounds; fine-ish, but liable to go stale, and
not providing a diagnostic when the check fails.

But then, instead of confirming that that segment[0] has the desired
alignment, you're applying the alignment to the pointer and picking
startup_64 out of thin air.

Either it was loaded correctly (and the alignment is correct), or it was
loaded incorrectly and this is unsafe to do, is it not?

~Andrew

