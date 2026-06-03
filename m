Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id grKGJTt+IGom4QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 21:19:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F257A63ACAC
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 21:19:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=w9NnyLLt;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1327045.1592264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUr7P-0001mj-Oy; Wed, 03 Jun 2026 19:19:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327045.1592264; Wed, 03 Jun 2026 19:19:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUr7P-0001jt-LF; Wed, 03 Jun 2026 19:19:11 +0000
Received: by outflank-mailman (input) for mailman id 1327045;
 Wed, 03 Jun 2026 19:19:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wUr7N-0001Ue-G8
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 19:19:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUr7M-00Gsxh-Sk
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 21:19:08 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a207e26-5cb7-0a2a0a5109dd-0a2a4509b786-10
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 21:19:08 +0200
Received: from [52.101.53.11]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a207e2a-2497-0a2a45090019-3465350b80a9-4
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 21:19:08 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ2PR03MB7094.namprd03.prod.outlook.com (2603:10b6:a03:4ff::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 19:19:05 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 19:19:05 +0000
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
 b=wIpoNdjtSYPqpDU6OFisPUvCUqXuB9Uc0t47MwIqKigkVC71v7RmY9N1sQ+MtrTqWM6p6oTmIpPSAtXb7WSPFDNhAqrjCOJ1Qdg2yU7nAGOs/A5Rh8DK4bg6QNiM0UI1DL+Tsbo48yc4jFpEIwVA6OmwX8SJoyIW+4CaafogUda0+w22vqN0PTxwh/8X2Gzk/MvFl7eY5rPQOibcCdTTMt7KLOqDZcGbxWIi3rvktGxBk3A9HF7IdRtPHM8efYJU2yf4C8UoB03Vkj4rpLGllB5YyNiEYP4mGOKDI0l1EgZoumJIDA4ryrD/ruc/DgGj23UkE976agxy9Ri3xTMlqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PAog/pzcyLlB711VQLeJLXsjxkMQopNDsvcdKsXahBg=;
 b=sWaj9vhFJwpS8iCicbu4t2OJ2G49JFCdDmO0gljajEQUdGZzJA5w0cu/lABXo+wu3Pk1meGm+lOala/Ap1vZr8XC3PGNUbqgt/ert9VaACdTwrS9w+80I4fRuWXkkqa3QTVvzHhmQOXTFGGm8Be0DtrhpzHMSPF+t+13PsEiJTQyUKJFA7646O/S+HiE6cONBHBBQngNKMan4eKoEDvjz1gsoSufkEKYK4f7skm3aXT1+ESFs20hP6iKiNVthaLckIjS6oxhmb8/oUBZuBaRT+IQEjhn99MXlaeOLUYdfTHn04oNkeWjGKc09OZtjvtiquzSEXrNG/BZKbnwj8sW9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PAog/pzcyLlB711VQLeJLXsjxkMQopNDsvcdKsXahBg=;
 b=w9NnyLLtb64mLk7jlWiePtvXUmFaplpwbVP41388thVh5ENvxDWUmYHJf3HbRjN8BEzsJwDgYJ8x7zipX8rtji+p+DbKk6ad2SxiarFHKDFTgD6FGKAjBTU1fP29vzjn2/l/LF+7Zg/H+2VsYRK7nejqXdkd29YTgNmeSFoV8zc=
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.22 v2 3/5] xen/numa: prepare NUMA setup code for unit testing
Date: Wed,  3 Jun 2026 21:18:34 +0200
Message-ID: <20260603191836.77955-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260603191836.77955-1-roger.pau@citrix.com>
References: <20260603191836.77955-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR04CA0070.namprd04.prod.outlook.com
 (2603:10b6:408:ea::15) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ2PR03MB7094:EE_
X-MS-Office365-Filtering-Correlation-Id: 39054209-7e11-4659-9295-08dec1a4fa81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099006|18002099003|22082099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	iwZ/M8SRSbp5VbGB6oArYMClXsg8UZqcobsR6ajneb+Ccv+mnRorUDjQ7XCQPeVNPhVx6Ehlu8NTELwBJljhFz0rofDdrqdB8RPbHm1j0DlqYRKVCoRjZDx5OttOmb7XrzZbcdHgsYTwCjk2otT/R8OoTlFiT8TgGx9VmGQEHZxcQdKoBFis+fTArabqb53tcawlyAu2ooyrDk/LreLdCFq0KU/9yGEAPlpRmUrKqeOvz9xmZ91Ud9gbcBdPbKrIRH68gdWHK2VxZMf7FrFuuIemRhwII8Z+2LMyZ2BL9KerNdv/Qegrs7jjCYfgOohlK2AWjHgJ1ajYr3P1iMHUzQFWl/7T6yDB3cJ+DIPxhmQCoQjfcuv679cfi1oYu9tnsGJGlGaw91W7MQKE7paNNoVwzRwu+cjxZxcE8nwhr+9fHuX19s5gtMyJA0WGVD+J+ah0gImPBY6WEGDLLAxGmv1iGcciuBiK2NBaPxz0ojgN34MXROHurBphJWtvHBQY2DShJcxI0fmnn2LiaqqpH/N3FQ11Pe7l0xvksuyGb+jToGHnGDurh0F+GUFo9FFGCHeXcbDY5FbG8shMpC14uSCO8F20bpMNzoCiP0DAMYnUC+uqmgL8CLnjjpW7aRIsaIJUpXWaHh/ParNoVLcH9n4VjD4zjTNPjvcekhnrphx5m+2shDKcRcuVEuIhnS8a
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099006)(18002099003)(22082099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVhwNDVzZU9pbTNramN2dVhzRG9ueUNUQ1pLU21QQXNoZFYzTDF1cDFGNWJB?=
 =?utf-8?B?S1cvUFRZUmRXVkxRczZqM0RzQktDWUV4dmY3ZEhVWk5JcXlTVEplaDlCTGZ1?=
 =?utf-8?B?Q0tVT0pqY0hzMExVWmREWVhwMzNWSlRBL01FU0JJSFFFeFo5TTF3Z2ZzU0kr?=
 =?utf-8?B?ZDZ6NXIrNjlDWXEyVGZwUnF2c3pTY2kwREhHOGMrYUIyNE8raVVmVjFmZkQ3?=
 =?utf-8?B?VzVRMFVKem9XU1hvZXk0QUtaQkhRc0xuYWNBdG9kRXZUZkEvY1FCTEhZZkw5?=
 =?utf-8?B?QlBmc1F1K2NPMmd6MGhJczBYKzQ3T3V2ZjhFZktxeWtIcUJyNU4yd2hNQS94?=
 =?utf-8?B?QVUzVm1MdG0ydGlkL2JxZFVvdElyYWJyNTBpZHNBcjU2SlZPNnJ5S1h0Zkt0?=
 =?utf-8?B?aWJYYUo0cHFqd0xNdTNDNXZ3c1RjM0lNekswSWUwUGVyekJBa21oN0o0dE5V?=
 =?utf-8?B?eCtvYkxnMVhhb0hYRkRFSm1zZjhqRmoxT3QwSnBMSE9kK1Q4VnlzeGEyRVMz?=
 =?utf-8?B?cWdMeC9iTFQ1WTc1SFhSNXNESUZiYytoa21yY3BCNjJyWHdtSElpQXYzTUc1?=
 =?utf-8?B?Qjl0OXZ6UExUSGZscXBaN3l1eFhvaUhIZ0FuTEk1Rm5lR2UrZDhIeEZhY1U2?=
 =?utf-8?B?My83cHBiY1phLytuTUp4aVk0a0U0cDZaR2tLdEEvUXlXOXA0Mm9vajFqNkp5?=
 =?utf-8?B?MGx3MWlTb0tmYW1xM3BNdkpjUjA2MlFpaFdyMVByaUQrVHA4djA5NkNQY0s4?=
 =?utf-8?B?ZGY5RnZoV1U4bmw1Y1NaMDdhQm5qaTd4QTY3YU5Zd3AySlFGaFZGRHZnK1Yx?=
 =?utf-8?B?eHpUZXNHUzR0SDlDY0pVSWU1VmJweEVZb0NFeUkzczJrQmMwanVVelhXS1lE?=
 =?utf-8?B?cTZ2c3ROUnVhN2l2NVN6R3E5Tm52b3psdTl2ZHB2TmIyWEVTUnhSVVNpNnJS?=
 =?utf-8?B?RnlSeEtSL1l2NWpPVUtJWHZlOUFua0d4alI1YXRrYXZMZ1IzL0txZGhaS0hT?=
 =?utf-8?B?bGRMNVhKa1RMR3cwcVpvODAwc3RvOE9LZUhwL0NJUTdKemY0WExDdFlkdEJn?=
 =?utf-8?B?ODVYMlFjWEFIcGdkZWFhT2J4ejNEV0MxaGVaZjA0YjdzelJPV0NyejY1a0JK?=
 =?utf-8?B?WVZaTXFIaS81VzM2RnE4M3YwYiszNzhvZ2VpemdyYVMyZGtNY2NicklGaStQ?=
 =?utf-8?B?TnlJR2Vua3QxRGdZN0ZKTUp3Q0dVZnFaVk9MdHFUbnBCNWVnSVlhRDUxUjhs?=
 =?utf-8?B?dDVYZnFoMDFOSWhyT25mQlRqZlJwMlpwdHlNNGtQWkU0YzBBSjVGZFYxbUEr?=
 =?utf-8?B?M1RxamVhOFZFOTNUNXlucVozcy83a29Gbkd0dVpUYVgwMFVBQWNCd21EbDA2?=
 =?utf-8?B?b0h1a3NnaHQzN2hzdFBMVmpJaG5CNkdyekFGd2dzKzA3bVRnM05WSkw2WlV1?=
 =?utf-8?B?UVBJQmt6YzZGaVdnaWRKN3FrT2ZOMStHbjQrSUl4a3Ryd2NQUmxPdVhmaHli?=
 =?utf-8?B?YisrdG95R284SzlpN0RYREU2L25RRGpLeW13YmlMVWFzU3ZTY2dkSC9FZWNS?=
 =?utf-8?B?Z3pmYmNnMmwvYmxrcGtWZ0kxMy9WVW5DdVo2WEwzMkRaSC8yTEhKRmUrajZH?=
 =?utf-8?B?QTM0VmJicG4xZU42V1JFdFZsa0UzaiszRHlOQzVoY2x2bzViMkV3blhiZWR3?=
 =?utf-8?B?MXlzRTdDbEFYbEFNSU1PdFFXQ0lQVlJNSXpGeS85dTltWmE4eDNRZklEOGJp?=
 =?utf-8?B?b2s1UGErdjFpZllteGl2RnVLbjI3b3J6UjVqNTNQRE9rYyt2eDRuaWpENE1t?=
 =?utf-8?B?QThoTmU1MndQdmdkczA5YWtQcVFsNXZ6OE1JZnJMemNQRnJNMGVaVUhLTHZ2?=
 =?utf-8?B?dzdEZDBLNFRGTytHdlNFRUFEVzVGNS9Gb0NkQmRHZ0ptR0F6NmVzeW5MT2ZY?=
 =?utf-8?B?WG1uWGJxU2poY0M1MC9vVlR0MDZ4TUFDSmtYekQ1SUI1Wm1Wc0pCaUliekpM?=
 =?utf-8?B?b1kzR2hyM2ZRVkdKVmJKa3VuWFQrVTQ5VnJGYzFZQ2NBeWdielZlZnRacmhQ?=
 =?utf-8?B?QWIwS0VEclZOUlNCb244MGUzVW5kU3NDemh0N2psSTVYTUllYU5Wb1ZjYndi?=
 =?utf-8?B?d0lkdXF5TXAzNEhUWUlpbFRlNEhRbkR3NWRTMTAxbnpsOEFpeFpNckVtZ3RM?=
 =?utf-8?B?eFhqMEFoeTNQTk1mRDZrY0JoT3dERmZ1YnE3UlVrNHByM3dpR2dzYzdWN2h5?=
 =?utf-8?B?cXY2SHRrV0RiRmg4VnF2eFI2dHdSUGdCOGNUTTh0ZkdjS28rTFZ5RXhvOFBn?=
 =?utf-8?B?YkxNWUhjQ3F2RU5Sd1MxRnhkcUVXWVk1b1gxYWdpN2lzamh6Uk5BQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39054209-7e11-4659-9295-08dec1a4fa81
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 19:19:05.6578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dTLceQpyQExzpQNasPPBzdw9roPPmeT/BJ29MXR8meROf3P0NrFjjIywMSaq8V/wwCDRk8YCZdAAQjKwtQN97A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7094
X-purgate-ID: tlsNG-bad1c0/1780514348-43D7FA53-75B02161/0/0
X-purgate-type: clean
X-purgate-size: 1652
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F257A63ACAC

Introduce __XEN__ guards to differentiate between hypervisor vs unit test
builds.  Also move numa_set_node() so it's outside the __XEN__ guards.  No
functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/common/numa.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/xen/common/numa.c b/xen/common/numa.c
index ad75955a1622..8544a1598218 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -4,6 +4,7 @@
  * Adapted for Xen: Ryan Harper <ryanh@us.ibm.com>
  */
 
+#ifdef __XEN__
 #include <xen/init.h>
 #include <xen/keyhandler.h>
 #include <xen/mm.h>
@@ -13,6 +14,7 @@
 #include <xen/pfn.h>
 #include <xen/sched.h>
 #include <xen/softirq.h>
+#endif /* __XEN__ */
 
 static nodemask_t __initdata processor_nodes_parsed;
 static nodemask_t __initdata memory_nodes_parsed;
@@ -561,6 +563,12 @@ void __init numa_init_array(void)
     }
 }
 
+void numa_set_node(unsigned int cpu, nodeid_t node)
+{
+    cpu_to_node[cpu] = node;
+}
+
+#ifdef __XEN__
 #ifdef CONFIG_NUMA_EMU
 static unsigned int __initdata numa_fake;
 
@@ -661,11 +669,6 @@ void numa_add_cpu(unsigned int cpu)
     cpumask_set_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
 }
 
-void numa_set_node(unsigned int cpu, nodeid_t node)
-{
-    cpu_to_node[cpu] = node;
-}
-
 /* [numa=off] */
 static int __init cf_check numa_setup(const char *opt)
 {
@@ -830,3 +833,4 @@ static int __init cf_check register_numa_trigger(void)
     return 0;
 }
 __initcall(register_numa_trigger);
+#endif /* __XEN__ */
-- 
2.53.0


