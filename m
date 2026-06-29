Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z1kkGhA/QmqW2gkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 11:46:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BD86D8691
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 11:46:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="C1Y/IoWZ";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1347355.1605234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we8Zi-0002Hc-Bo; Mon, 29 Jun 2026 09:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347355.1605234; Mon, 29 Jun 2026 09:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we8Zi-0002F0-7v; Mon, 29 Jun 2026 09:46:46 +0000
Received: by outflank-mailman (input) for mailman id 1347355;
 Mon, 29 Jun 2026 09:46:44 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1we8Zg-0002Cm-Fe
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 09:46:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1we8Zf-00DxKs-OH
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 11:46:43 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a423ef7-e002-0a2a0a5209dd-0a2a45059dc2-22
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 11:46:43 +0200
Received: from [40.93.196.8]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a423f02-3cb2-0a2a45050019-285dc4083578-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 11:46:43 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BY5PR03MB5141.namprd03.prod.outlook.com (2603:10b6:a03:1e9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Mon, 29 Jun
 2026 09:46:40 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 09:46:40 +0000
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
 b=g3Fw/rpbwGRSRsZZCxcLzAPizsuE2H4e1CuTf0VVkx246aAO0ZkPRzeiaVBmDjEgh7SVbG9o1G5waz7M1NqX+xSJ4C9sByRbV1FgxTOhour1KRTsvYAnq2YgiWoRvMPlvgeo66FN2gGPFNiN0LTY5YRTgG+OXyEBhA29xzQq1QcGNB1584ckwuDL0v1bqqTvvpx8tUGVpSzsOEhldXWvy+5ojALAS8bW/4x+HJ2cGfrwc7fhlRe0d5XujKeCaSTfeEBCvRAicV6/XoPyZcnlBUKqVPsEYqGnFSNK++lmpZ1JtCRrUFNcxW4nZ+IQKsvy9WctoYSlTZBLNyVxcvl52g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hINVQXag379ub8ETN0UXT7mZHnxEf6Iv20JJg6aNYIM=;
 b=HWVs6nrWoUjPZsALRrwP5P89ZtKEo1t89m7nPvH7JA0CBLMGucJaSAddQr0d3zdZOK2PXmAfPETUU6o+k1/AsCLCJuuq3MgwgQ7CKqSWryjkddHyZclEpvPKnwWb3WgKq4f+JqA3o/fSq3nNwWa4/eB67LnFSiXs+RWCgpWmfJJRWId58HjXVJi2K1uVjHT2V9hjhIlzt+zVYbAzVPYykSsUPD/+4N+wvdFOGOGc41izn16yfjLw5bE0qmwF7Vfk17ho+ojUnHu1bnK1GWAKJ9n95ovw8+vaUXAIl22jSeFfsFqaRY4or+vv/hMA8wIpWoh8PN6HDPgvxG3ykAMxTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hINVQXag379ub8ETN0UXT7mZHnxEf6Iv20JJg6aNYIM=;
 b=C1Y/IoWZt3WhhLOBEeYlCJUsm/r3Riw/rhKITvEZ6ALDI354a1JuIDghC/QYGXOx47zojJzGqsawEdv/+aDSJ1aESsxnS5csmvZ9Xv8hWs92wgzfIo0s5S+SxLWTuxQGl8lY2ICqMmm1IHV+GkcsEyqlcqPUCJOmW797AZIK4EU=
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH for-4.22 v2 3/4] xen/irq: handle IRQ being disabled while executing its handler
Date: Mon, 29 Jun 2026 11:45:30 +0200
Message-ID: <20260629094531.55555-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260629094531.55555-1-roger.pau@citrix.com>
References: <20260629094531.55555-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0054.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::7) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BY5PR03MB5141:EE_
X-MS-Office365-Filtering-Correlation-Id: 153cc2b6-e990-4654-ab4f-08ded5c351fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|56012099006|6133799003|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	5kT278cU/EGVt+5V6M+/gbuFni4/7U/vGJrLCXlfg+mCId7O5IL4ugEvxuLbM0j5l8OZG1E3AQPDgUVUN6Wj2FzAI7cwrmYq+OgcGFn8N4xZIBrvc7y2HAxsL+JYviyk0c4HD2RT36srpRJA1rX16P//o+wnyHMR6PmRtf5Lrq3CVwzRDQ5We799cuqtBJ+J255LejXXOqRzye1uxyA/wTUgA0/Ff2C/66AvhxVMMhs2Wem6Jei99XZkw7wFmO0jM1ZTPnqNC/Qya49LsOOvL30r6DBxfFsCgDdAYpm00nerWnhXHLxgQYSDkLOiFgb6iVwGRDdLUKvfSsPVAsO57dEyi9xm3xqMkNgZPJnTK8IqkcklJG8liY7z6w4z+QfuwkMaE0eNQkCajw1/tRIIduVnGOKD2n553oUKJ3iii4nQ1MX0bNqqTJRkSpNhqAkUwcW3l/2Q2gKJ8ZV/BmL9d+YVYk3DF0ZhZ/Vybv0Re9zOrIr8vpBCLs+Oo06PMsz+nyJXpywNqxqb3nttfLlECGL7I8pRDziqXdpwZeyoahYuGvclFV6YIAW+lZZ2TuNyTZqNHp3UV9Udm42OBoo9h0WLj5nABY10VzlsQeU4eUEOXFoEff/6cQvFTHqbajrd/HRxuEPcq4t44PpdfgVAcIfR+JpWjMMeJdcmoJlnbao=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(6133799003)(18002099003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TU5ES0FURkgyVXVOdEZ3bGluVnZUVWIvYTVrNlRJbzNBYmtkT3g1VGw5QnAz?=
 =?utf-8?B?bTFYVW9ZeG5WWW9zNk4zSWZqUFlGbXk5YVpDVERwc1FuL0loOXJwKzZaTlZP?=
 =?utf-8?B?dXJmVXNhbDhrazhJYTdTTTZwRVZkVGVhYjJ2aC96QUgzZnVFajJxSkV5TlRF?=
 =?utf-8?B?N25UcGtvVWY5VUdvVXFXMWZoNXhzZVdFUXFNV1RTcFJ4ZUxrQm95aUplT0Vw?=
 =?utf-8?B?QlVrRmN2Sy83ZVdVVFgwVWc2R3EwaUd2dy9nVHh3TnlrUFRXN0hZbE1UNGtS?=
 =?utf-8?B?eExES2tjNDZJUUp0Yk5VV1VFVDB4cERKaVpHeHhTWEpRR3dWU1VJZk5kSHhx?=
 =?utf-8?B?M1NUY013OXdUeWZaUklsSG9iVXdCNHNZOVpxanUrVTNyVTJ4VlpPUW4vdTM5?=
 =?utf-8?B?dVFmdGk3bi9yYm5sSnVRL3BuaElCRERIa1c0dm5KVHo1OHJ5OVNhMmtFM0lD?=
 =?utf-8?B?cDRBSmNKK091Qmg5TVJoUjJkZ0ovbWhUMG9IcjViS1hTcTJLcnpMbVNFUzVF?=
 =?utf-8?B?dko4S2R2UFNSS0NoYUVqOVI0OEt5U3F4TGc4aWYvTGNsTFl3TGpnanRMRERJ?=
 =?utf-8?B?Qkt0bVdCOUV2aFdxY0JTTHFEOVk2TGRJQWgyc0MrWU9HRXB6VUpvYjJJOXhi?=
 =?utf-8?B?U3dCblR1VmpzVWhwWFJXSCtaQlh4dHFiTmRZdEVQeE1xQlZ2MnZtTDNvZnFi?=
 =?utf-8?B?T3FSZHJtT3FVQzNPNjcwQkdmRkxVRC9ZRUc0bjQyUXVHNTBGanZjMkp6b1pm?=
 =?utf-8?B?SmpEM3d2S3kvWGxIdSt1VnVRYVIwaFhQbWZvMVhwaHR4V2dOSTUvdzREL1Vh?=
 =?utf-8?B?M09yRmFrellpZ3RsSlVTTnNxRFN4b2RjQUZXc1BGZTRFSTRZZVpzWWJKVkhY?=
 =?utf-8?B?YTRXWk42YjBLQ2dPeWsra0E4ZlJZZ2cwTERnZkszTExjcW42a2syRHM3Q2VT?=
 =?utf-8?B?UlJUbDZDK2EvQXk1eXp6V3pJV0RwTTROdkFYa0RYUmMvSEpuRDlLTDk3TlNJ?=
 =?utf-8?B?eXR0MUUyWnA4M0hzYmNnZE1ZdmZZZlNNMkFDR1lXenNidjVzQ2lDZ2NuRkpZ?=
 =?utf-8?B?M1UyenZyMkJSUHQ5dHQrSmtORjVEakxlUW04YjVuRGhFR2diMC9CLzRQNEpG?=
 =?utf-8?B?WFNsNHlPU2orNEl3cTJoVTlvY1BtQnpqcnpVbG84dEJILzdMRUhGY1haZHpR?=
 =?utf-8?B?MGkwODJ4bWk2Rlg5WitPTkJQT2I3VldISXpmU1VqU055M0pkcG10N0ZZbHhE?=
 =?utf-8?B?b2UzdGdhc0Qrc1hXT0ExUk9OQXdkTWlDcnhSQlBjYlRJRGJUc1JCWlU1d0N4?=
 =?utf-8?B?VWorNEFkNGtMNWtjbjdzRFk0UkxwRzV0THZYdGhUSnF6Y0VvSGRjc2xud0Rm?=
 =?utf-8?B?YlpVTkVSMk9TM1BqdWNubmRFNmJ4YTBQVFptc2M0MGNjSVpEL3IrbUVMSUJa?=
 =?utf-8?B?aXNYczN2Nlc3ekV4Nkp1djBmOUV5T2Z2K29lOGVuY1RNajNJblFwaDdua05T?=
 =?utf-8?B?dGM4Ris2cThBVzRzdzYrSGdKZnB3bmRyaG5DcFhWTWROWmhXVWFtcy9XMXJN?=
 =?utf-8?B?UzJ3OXc1WDVGaS9pRFNPTTRNQWdiWmpTTmR0SWZZTWtEYy94UjFoallxRmFq?=
 =?utf-8?B?UFlsZVpwYTJvTnZQZm5JTDBycEJKcFBzM24vSGtxYzRRNkw2R2daUjNldFpn?=
 =?utf-8?B?SnpuNEo2ZUNjR2VrSFNZWDdONWV4YmhYQkNhNkh2aTVFMWxOV3hIU1BySmpC?=
 =?utf-8?B?cVFFSEZYQXpVemo1ZTBObDI3aE5mVnJPeEhqL2swZlNQcnQ5N01YVzVzdzg1?=
 =?utf-8?B?bHJ1TExSOGNjcnVrYVJ0Vmx0MzB2a1pqT2xlblFnNUYvYmVlTU9GT0Nac3JM?=
 =?utf-8?B?RStGRjN4SklDZkNVRTZsWmZMT1NFVzJtREpRWXZuNGtiYnExVDUveVNzbHZs?=
 =?utf-8?B?N3NneHZkM3RJU21rV3F1WlZ0dTB6c0E2dkhYQVd4eEc1ZWpFY2NlRzI2c0lQ?=
 =?utf-8?B?T3p4RXpEVG1XcWwyd0dKbVdXeWFsSVdlQ2pMTEk1UzYxY3BpdWh3T0hwM2sv?=
 =?utf-8?B?V3hNQUx5VHdjQkE0QWhSUTVWSDM3dUJiZnpQcXVkRnZ6VGVId2Y0VDRIVDRW?=
 =?utf-8?B?aG1vdThOSktzQ29xekgwTi9rMmRDcmk3ZVgxMnNGNGUyVDVzTW5rU2JJOG1x?=
 =?utf-8?B?TS9ERnhTRXJJVExEbGxDakhldmVxYW1Ed1hCWGFCam94TTluTW84OHhJcFZB?=
 =?utf-8?B?cnd4SUYwbEpLMVlYTmhNTExKR1UxSUFaMkRIM0hnNXh3Mk05N0xZZ0RXaGdV?=
 =?utf-8?B?R002QURkUUE5RnM5djJSV2dBZGdvcHFkRVcyeSsxOE16WWpVNzRYZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 153cc2b6-e990-4654-ab4f-08ded5c351fe
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 09:46:40.5760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Z7irz5qrBT+RazFqfDrdu1T2/38odlPBjgExY/vs1scTGpHWbkOq4xtFtaqKa2iXXiirizy1ErwyfKbeboegg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5141
X-purgate-ID: tlsNG-c201ff/1782726403-0E5122B8-99831AC0/0/0
X-purgate-type: clean
X-purgate-size: 1228
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,suse.com,vates.tech];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C4BD86D8691

It's possible for IRQ_DISABLED to be set while running the handler
execution loop in do_IRQ().  Such disabling can be done by the handler
itself, or from a remote CPU.

Check for IRQ_DISABLED not being set in the loop condition, as to not
execute the handler if the IRQ has been disabled.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I wanted to add a fixes tag, but this has been broken since forever, and
hence I should add:

Fixes: 4676bbf96dc8 ("bitkeeper revision 1.2 (3ddb79c9KusG02eh7i-uXkgY0IksKA)")

Which is pointless IMO.
---
 xen/arch/x86/irq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 739fc04bd16a..2082ad489d74 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2088,7 +2088,9 @@ void do_IRQ(struct cpu_user_regs *regs)
     desc->status |= IRQ_INPROGRESS;
 
     action = desc->action;
-    while ( desc->status & IRQ_PENDING )
+
+    /* Deal with IRQ_DISABLED being set while inside the loop body. */
+    while ( (desc->status & (IRQ_PENDING | IRQ_DISABLED)) == IRQ_PENDING )
     {
         desc->status &= ~IRQ_PENDING;
         spin_unlock_irq(&desc->lock);
-- 
2.53.0


