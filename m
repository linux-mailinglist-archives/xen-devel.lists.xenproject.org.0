Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nAeHAxQ/Qmqa2gkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 11:47:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8E76D86A0
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 11:46:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=pc94AQ8x;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1347358.1605242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we8Zl-0002al-Mu; Mon, 29 Jun 2026 09:46:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347358.1605242; Mon, 29 Jun 2026 09:46:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we8Zl-0002YJ-IO; Mon, 29 Jun 2026 09:46:49 +0000
Received: by outflank-mailman (input) for mailman id 1347358;
 Mon, 29 Jun 2026 09:46:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1we8Zj-0002UU-VG
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 09:46:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1we8Zj-00DMOt-By
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 11:46:47 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a423f01-2eae-0a2a0a5409dd-0a2a45038398-14
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 11:46:47 +0200
Received: from [40.107.209.34]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a423f05-ec1a-0a2a45030019-286bd122e0a2-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 11:46:47 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BY5PR03MB5141.namprd03.prod.outlook.com (2603:10b6:a03:1e9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Mon, 29 Jun
 2026 09:46:44 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 09:46:44 +0000
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
 b=Bj+0BGrk8leKWPuc/6N4WrlRZVJKJm19Jdqee5/i7HCgUPIIyDAaJMxZtoqc+zXdVqhy4DZHX6ME680/38i2oNx6WNCKM1Bb+PCw/B+DzFj8JJnS6PuW1teLQtJPjhMy4B3WwsoA85rOFyo/rTkQ+JOtkBgV8sfshAejarB12ymIs2asfz9rJQXLw832jaBB4MuVkL354K/hmVz+flDjosS9vVtVVhpmQTtKUcNvq/9ej0Iq3IVWNMJ2oZlj0V0523/NdeMJvzaeh8ao/X2n2y0wgnqw8ALsHAD8Hts2cPWoOBzi4rOOYmtW+1ODarBCIa30h1uQN4by9GlL6D9BEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQ0ARhz1drnK6o4nFWM5dxAzHHPreb+bqF6dDS8tTi8=;
 b=Y3QTQuqAD+G6T/6+Qi2NJkDph6/dpsCxyvbARO0nVpyqFaQxuZFKgoobsgzHHvSV+jiFWl92vKolTEVqfs+oBNV/fMqdHge+w1u27xX5WTkobkmPyFY2pUmWIsvJSEFdCwLO7DjSQ+AWoQNPt6ZmlxOqpmiFID59YHmVx2wIZasSD4k9IhCPL7Moesula5RlJY23RSkR+ZxIzV18mWRE3IDLTorTRwSsJOdnjjvXOE7RAgYT9o7+89DXuRHRtlxCR3OcxCe+rzr3/r0lVX3dOpy7xbILfFIrUwevJbmxU434bG2JcaIPnkzyCIRf5AC7no4zVkLO4zs31TF1Nj/U/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQ0ARhz1drnK6o4nFWM5dxAzHHPreb+bqF6dDS8tTi8=;
 b=pc94AQ8xIU8G0sl2BTd5jMuxqaJKE0MmyT1nrMtAoz3DRgT0WJLRf3MC7FUiMqDe5bOxySKMwlggR1VqOjERjsUrrb/pTnCI9Q3rgYBizE9Nt8TI63pKZRDhtxd+V/2g+Z5+c/9+PxdJv2Vyyqt80fsX31Gb5WZ3VpmL9ni2uHQ=
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.22 v2 4/4] char/ns16550: bound execution time of ns16550_interrupt()
Date: Mon, 29 Jun 2026 11:45:31 +0200
Message-ID: <20260629094531.55555-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260629094531.55555-1-roger.pau@citrix.com>
References: <20260629094531.55555-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0192.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::8) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BY5PR03MB5141:EE_
X-MS-Office365-Filtering-Correlation-Id: c6dabde2-b356-4a6b-23ee-08ded5c35419
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|56012099006|6133799003|18002099003|11063799006|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	R0OFv4v0xLGxFKiUSddbYgsKR7hRPBGVa3fA0nPa1+yFoBCrW84uRV3zkK75LRWfWBlj+nhZtvIN66z/FS3WmILfCU4i3R+ztaq2pmY04eWSvuC6UzkyFgVnR0TKHXShxahUcCokZBZzlVfwFQvvuqhsFOF72mjCH3DLGh4fE9DhWrB1EjeurksCesVY9kiKz8j38hFjc3hi21zsU569q5Cz+v+rhpAXZfV9zpnm8momf2qGp7L9G/DM53BMn6WWo+2ylK4Xqg8klT1aFyI0Nn2U+CYG2tFFVnM9x9O7w3yZ4AE0Bw6+EezQwvhEWNHPHxSls80GuC8l1ZWJekhnaBIaDxcYR4TbZfCTKZY4AMGSXrfhx2Fbl/bwqjw0BwZFFhxBgYtnPH2vfIpljxu7Z0g+zf4ahj4Hr/An3w4fFIWcgtXEtR7JtVufGabFRNgO0i6unHvXJJx9w97req2nIw6cugenHFEWpnML5E65tNyLQo8FZPXIAQjXtl7SbpXiEqYpD6jkb8fQIUeufzR+M91kMheQ44zgGC7xBbDbloI1mnLRecJRR2iN+2DNp8PC8X32vTVLZYlIiVsA02FQDSL/L1A28beBLmvGdz1NYW9NRRLxZXeI3X/vv6U0kyQ93RO4C5tFWpBnB7lD/8tbC/R0Ojjrja26SNI2SiqWlO4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(6133799003)(18002099003)(11063799006)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3JrYzgwZndSZlVFWTFzOSs2RzdoKzZxM1l2QXlZc3FUQ1BPc1JMbVlpQ1Ar?=
 =?utf-8?B?cUZZVWdScDRtTStVMFp0eWFXOHhzVG9kbFQ0ZU9kOXZlZkErME4va1Fwd3hZ?=
 =?utf-8?B?SFFiSmMvK0d4cXFwenBXTTJ5NEExU0RKZFE1YlB3L2pEK0hVQitENmpReTh6?=
 =?utf-8?B?VUkzYmp6RVVMbDlWd1NFMjVBSXk2a3B1OGtpZUdObHUybVlXdFhQUUpGWGQx?=
 =?utf-8?B?Wno0a01FcXhIUXoyUmw0cEVCUEdOa3BVRXpoWUszbnB3algxQTFXUWNrQS9D?=
 =?utf-8?B?WXQ4c1pHYm9VU3k4Uk5OZnhMOWcxZUVCcmNoMVkxZkhtMWJ5Zmc1Qk44UXNW?=
 =?utf-8?B?L0VLS0h1b2V3TGhVNFF4K29BaDFlc3hWY1g1NTBpa1hVWWovVkNGSWlwUWZw?=
 =?utf-8?B?SnJuYU1OVzdZZ2tWREc0NmU1cHQrVW5jOWJ4ZmlPUCtRRUpXYVFZRG5aYnpi?=
 =?utf-8?B?ZzZ5anJneVFWZWZpWHlNZDY3YzlaSlJUaDJCeWdKRU53SlpWTlFFL282QUk3?=
 =?utf-8?B?K3NNNE13MWNZRnBOZ3V1ZWZ3cE9xWU5hRkxLcENGNEFlWXZmeWVCK0Z0c25V?=
 =?utf-8?B?NWRmZE8rZHo1WCsyU05HaS9pTmZIRTRjK3IweTBhOU1KSk45bVBwTEVYM0Rm?=
 =?utf-8?B?V01IMC85b0F1M3B4eDE1cVBPYW0rYmgzUXh1WVl4S2tRZ0c0VzY0ZEZjRTcv?=
 =?utf-8?B?Z3JMUmlJMEVsSEtmM3hwbSt0bHU0Mk1jM2ZLV0s5QjhCRVA2Uit2REMrc1k2?=
 =?utf-8?B?ZVVtQTJyS3JqYVpBKzczKzRySWt6TzAxanRyb0p2bUwzTG55SS9UUzVZVit0?=
 =?utf-8?B?cU9aMm0zUHlZSW11Yy9FUjZZZHBRb2c2NDJMeWN2ZXRWZ2JJRzNreVRrNUdX?=
 =?utf-8?B?ZGl1RlEvTWttaU0wTnVoeTUxaXFFZ09Gc20vNHF0NHl1TS9sTG5EWXRYMnRv?=
 =?utf-8?B?cUZsNEFmejN4ZFF3R2tJNVVkOGpWU09PdUpvQmZMNmlDMU9adkE4dFhhb1lK?=
 =?utf-8?B?d0hNWVRZK3VvdlVzOFBzV2RlV3VPcTJyVVFlVkRSZE5VYnVaUldYczJJQ1Ev?=
 =?utf-8?B?Y01pWkptQ1pMZVQ4VGFSd2phU2w2WGhtWm5rOEpLM1dDUmgrbUZQUmFoSGZs?=
 =?utf-8?B?djZ4Zlg3UGIwQjRCV3pTa1ZvcGdhMUFRYmdVRzFCYTRXVFl3U1VBczQzenJD?=
 =?utf-8?B?aVRYZUhvV2JHSzlreGtSUjk0bzhxNU1TN3k0eGRVUVdQeEVLSUJvbHVRL0pa?=
 =?utf-8?B?RVFtQ2VGdVYvdFQ2c0FwSi9ZYWxIT0lRSWRsSU54REZjMHc5d29CaGczMmFn?=
 =?utf-8?B?RXp6RGhzN05SRmxxWmduTWlhdHZCTzd1SExBYXJjaUltd2NTd2FqUnB1TnZk?=
 =?utf-8?B?NVhMeGxSWW9vbTFmcnF3VDlnTVhtdmVvUnRJVUx4eTdLZG5pTE9oWU5aTHVU?=
 =?utf-8?B?TC9UOWs0V0RHeVJQOTJQSEUyemQ1Z2hQOGZFSGFHM1h5RjlwYWhYa3B4Sllx?=
 =?utf-8?B?Y2ljKzRXVkcvMGVFQmU2V1g3UFdlWGNZZmVvQTVPOWlobUdpcnM5M2dLbi9q?=
 =?utf-8?B?bnFBd25EdXMva2szMXFzdkJ0LzhnQWNtWjVzbHhmaGgxaWhRMFllVlhUdXBH?=
 =?utf-8?B?Y2Zob3hmVlZObE1ldDRVcCtTRjJtczVqTm9iVmF3cldCNVVGZmNIZ0hsZXFu?=
 =?utf-8?B?RURxcFlXeG1rcnRZUlFTL3dMRDQ0cS9RdjExcFJxMlNwMFZMb1F3a29TUnZx?=
 =?utf-8?B?L3B6WEdPd096TklVKzlHVnZMZVJ5M0djKy9KMDdxaVVIbkxIa3ppbkN2NW9F?=
 =?utf-8?B?Vkt5MEdCT0NHTVk1TGtnTXpUYmhtb2NVQ1lJeCt2b0VVQUJIUEFCRjArL0NS?=
 =?utf-8?B?aEpFd3VYSHRzT2RRbm5ETGhrd1ZHWFlzWGJVbGZRUjVSUnM3aHV0bVRTVnJT?=
 =?utf-8?B?ZDFYcEpGYjdmNjkxWnYvWjlXcEdBYlN1SXBBRE1ZVjhaUEFZU3Fsc1FCVjVp?=
 =?utf-8?B?Q2Z5SnREaEpESktIeldIL1FGa1VPZkZtRWJrUFF2VEdGZGxjOGRDQmFGb0p5?=
 =?utf-8?B?WFMxcS9SQXVacEhlRnNIdDEzYjcrVEtPbWdSWi9nMFNaRXdzZzFkMUlRelRT?=
 =?utf-8?B?TjI2Vmo5S2xNNVlFcEFGNHNmeTI2cm9DSXQxMXRoMkVGdjlUNkR3d0Q3eUdh?=
 =?utf-8?B?bVk0S0FmOUZDUGhiWURMYUNpazJXaUJOSS9iTmNGcGpFdXg3SGlVTEtUeGRy?=
 =?utf-8?B?M2xFdk1wRGpPQi9Mc2gyMUN0YlRVaGw2ZFdYRGRxUzVCejkycUkvSHNMUW9D?=
 =?utf-8?B?T0k1TTVjamVmL3RFRHltL0VESU1ZQTZhOHJTdlhjaVNqR2FBeVZjdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6dabde2-b356-4a6b-23ee-08ded5c35419
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 09:46:44.1172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bQqQmkpISebonw9TOsEfBS1R9gluA/mIBuQVy9ul2LxJuURjpx8GysIDj9KZc8H9bbpoDfhgIPK+aMUdeuRRqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5141
X-purgate-ID: tlsNG-33051d/1782726407-06F2A5D1-F6231E85/0/0
X-purgate-type: clean
X-purgate-size: 4855
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE8E76D86A0

The current logic in ns16550_interrupt() will loop until the device sets
the NOINT in IIR.  At least on the Lenovo ThinkSystem SR630 V4 the flow
control of the serial-over-lan emulated UART seems to be broken, as it
doesn't set the NOINT bit consistently.  The Transmitter Holding Register
Empty in LSR also seems to not be properly signaled, as even with it set
writes to the transmit register take ~6ms.  This leads to the watchdog
triggering very easily on such system.

Introduce an upper bound on the execution time of ns16550_interrupt(), this
is currently set as 4x the polling interval, which is calculated as the
time to fill RX FIFO and/or empty TX FIFO.  The current maximum is 5ms.
Once the timeout triggers the interrupt is disabled and the uart is
switched to polling mode.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Move irq disabling to its own helper.
 - Turn force_polling check in interrupt handler into an ASSERT().
 - Improve logic for timeout calculation.
---
 xen/common/irq.c           | 12 ++++++++++++
 xen/drivers/char/ns16550.c | 30 +++++++++++++++++++++++++++++-
 xen/include/xen/irq.h      |  1 +
 3 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/xen/common/irq.c b/xen/common/irq.c
index 29729349a6f2..102974d120f4 100644
--- a/xen/common/irq.c
+++ b/xen/common/irq.c
@@ -54,3 +54,15 @@ unsigned int cf_check irq_startup_none(struct irq_desc *desc)
 {
     return 0;
 }
+
+void disable_irq(unsigned int irq)
+{
+    struct irq_desc *desc = irq_to_desc(irq);
+    unsigned long flags;
+
+    spin_lock_irqsave(&desc->lock, flags);
+    desc->status |= IRQ_DISABLED;
+    if ( desc->handler->disable )
+        desc->handler->disable(desc);
+    spin_unlock_irqrestore(&desc->lock, flags);
+}
diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 878da27f2ef8..a371bc5cc85e 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -62,6 +62,7 @@ static struct ns16550 {
 #endif
     unsigned int timeout_ms;
     bool intr_works;
+    bool force_polling;
     bool dw_usr_bsy;
 #ifdef NS16550_PCI
     /* PCI card parameters. */
@@ -190,12 +191,38 @@ static void cf_check ns16550_interrupt(int irq, void *dev_id)
 {
     struct serial_port *port = dev_id;
     struct ns16550 *uart = port->uart;
+    /*
+     * Set quite arbitrarily as 4x the time to drain the TX or fill RX FIFOs,
+     * set the upper bound as 5ms or the timeout_ms value, whatever is higher.
+     */
+    const unsigned int delta = min(uart->timeout_ms * 4,
+                                   max(5u, uart->timeout_ms));
+    const s_time_t timeout = NOW() + MILLISECS(delta);
 
+    ASSERT(!uart->force_polling);
     uart->intr_works = 1;
 
     while ( !(ns_read_reg(uart, UART_IIR) & UART_IIR_NOINT) )
     {
         u8 lsr = ns_read_reg(uart, UART_LSR);
+        s_time_t now = NOW();
+
+        /* Break out of the loop if spending too much time. */
+        if ( now > timeout )
+        {
+            /* Disable the interrupt source - it's never shared. */
+            disable_irq(irq);
+
+            /* Disable interrupt generation on the device and arm the timer. */
+            uart->force_polling = true;
+            ns_write_reg(uart, UART_IER, 0);
+            set_timer(&uart->timer, now + MILLISECS(uart->timeout_ms));
+            printk(XENLOG_WARNING
+                   "uart interrupt taking more than %ums, switched to polling\n",
+                   delta);
+
+            return;
+        }
 
         if ( (lsr & uart->lsr_mask) == uart->lsr_mask )
             serial_tx_interrupt(port);
@@ -223,7 +250,7 @@ static void cf_check __ns16550_poll(const struct cpu_user_regs *regs)
     struct ns16550 *uart = port->uart;
     const struct cpu_user_regs *old_regs;
 
-    if ( uart->intr_works )
+    if ( uart->intr_works && !uart->force_polling )
         return; /* Interrupts work - no more polling */
 
     /* Mimic interrupt context. */
@@ -313,6 +340,7 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
     unsigned int  divisor;
 
     uart->intr_works = 0;
+    uart->force_polling = false;
 
     pci_serial_early_init(uart);
 
diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
index 6071b00f621e..64a25c96a4b7 100644
--- a/xen/include/xen/irq.h
+++ b/xen/include/xen/irq.h
@@ -121,6 +121,7 @@ extern void release_irq(unsigned int irq, const void *dev_id);
 extern int request_irq(unsigned int irq, unsigned int irqflags,
                void (*handler)(int irq, void *dev_id),
                const char *devname, void *dev_id);
+void disable_irq(unsigned int irq);
 
 extern const hw_irq_controller no_irq_type;
 void cf_check no_action(int cpl, void *dev_id);
-- 
2.53.0


