Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QDrrBj5+IGos4QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 21:19:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9FD63ACBA
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 21:19:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=fbFycBGI;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1327043.1592243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUr7K-0001Br-2P; Wed, 03 Jun 2026 19:19:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327043.1592243; Wed, 03 Jun 2026 19:19:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUr7J-00015U-US; Wed, 03 Jun 2026 19:19:05 +0000
Received: by outflank-mailman (input) for mailman id 1327043;
 Wed, 03 Jun 2026 19:19:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wUr7I-00013R-6g
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 19:19:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUr7H-00Gsxh-JS
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 21:19:03 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a207e26-5cb7-0a2a0a5109dd-0a2a4509b786-2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 21:19:03 +0200
Received: from [40.93.198.17]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a207e23-2497-0a2a45090019-285dc61193eb-4
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 21:19:03 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH5PR03MB7886.namprd03.prod.outlook.com (2603:10b6:610:215::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 19:18:59 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 19:18:59 +0000
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
 b=nzDGl4RZgDk/XhVwMQx6C3h98B6SmdF5Hnb8/+wgDVdmhOGeqtBazxqAaBnJxXQauE/jPuAIK7PTRVsjgvz99Kl/pLMxa5j7a8vdS0OTSD+nKMuAZqDWrI2zjpUDfNVvRkkkTpjEls3G3jACYZXnlf/7C9qMo23ul7Fi/jPhXYF+VyiJxXNTOB2IoFiQOdT7t4nb1Ajkq01o63O4G0bU3O0LPzqzrMKpQYpcdKNkJdAfBZhHR4VBU2iW9CsRt7jEv5qhTFsCH8noXiFgBA4IA6LxCqWRx96donu7LcT3+Ce/Cmn+itLQjed0CrqwJzWjzp9LhnJkEaCefehMxPIdXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1wJ9H+HlV1Wc4owYx/eZP6Kj5pXUK2qFLHUPDz0i2Q=;
 b=k4pMP1HYdLZh5ntm07OOphIKTU34aG08Vz8wE0qkhrCOfvphc5ln+4ft+2C02ZjXIKJ1Y93lW9rGBKYc5r2Rpgtxe6ZEFuJUprc+43JLnLEzdW2fZ7VlldUMGideP/VBE+KOvJ6n/kex5sFVwBv/xTYnWGE+cYbhl9iFIStGBsXHV/qqpg4eEF8AuhRjIXWmuKclRC56r+YYw5H0kgtYnc5lONdaPg5Nhc6ekmtWa1Ahdcu0IOl//1WJY88vt7wUXqTDy2TVXZyFZZcuSu0jhdayphiZxGtyJ+fGeEhH1P8qTkDzK6ovvEJjcA8813ChO3u2dj/QgtgS9PabP/laPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1wJ9H+HlV1Wc4owYx/eZP6Kj5pXUK2qFLHUPDz0i2Q=;
 b=fbFycBGIpPF8cTqe6xzbM0S7G6kLO2IzjQeAChapbDjy7w/m9Skb3jhgI7Ie9XcpdaJHPZF27wgMFcRwPpe4LH+zmdRHuJNA9gMXmoyPk6We13b2Rs2utxBxeUMRBAXerw9VEu9Kg8ncCAT8mlQt9KHP1wp4SdZmAEAV9G2OC/o=
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.22 v2 1/5] tools/bitops: adjust bitmap_or() interface to match hypervisor
Date: Wed,  3 Jun 2026 21:18:32 +0200
Message-ID: <20260603191836.77955-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260603191836.77955-1-roger.pau@citrix.com>
References: <20260603191836.77955-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN1PR13CA0016.namprd13.prod.outlook.com
 (2603:10b6:408:e2::21) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH5PR03MB7886:EE_
X-MS-Office365-Filtering-Correlation-Id: a33c16ea-c592-4513-e90a-08dec1a4f6fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|6133799003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UoxPdt7VKOVk8sKTjPjv9x2jkAG/mxb8S0k8p+mPZY3P5EMbbGvAHoy+Ft+OOqPCyKXV/Oh4e43/eN65dYLEv92yE+955KORQhrjxF2bbc30a6oxFZAIrmc8FghPShDSQcBt/1Lg/LA6FDbseb10qcvMh2vzQ9cGp73ogj+LCym5QCSmjB20GUCCnmjMSu43qQPlFXhtcZJRbpu3AeHIjkmtRvFBekWOwnJ/tbo3Cr2MKHC1m8mtlWQjbtjqkuxnx61KVSYTC5TAQu8lMpbgY83Z1/poXcvRBKu9eUaHgZwrwmzlO++yfaEAOkuToi5gqms4+xxO6mZtC1nWFC+0ZiUgDg0HuIb2OS8iqF7Jm6Spd0HllxjSOxr5uhzhuOneVIymdJIT1w0GfBwskRBJW50o5WwmfxIuGXs9m8rDb9u3zl777C/XNSfLN+U095W8nkU+B0qhJkJtZkaLMIVkjkJ2hPJ7xjEwweWpgSn8YzdXBf7Y8jbVJ2iXqrzLwIqoH23gNVmeA1ZG0FmzLDG1UN/zXOMSiOO+cupGHlM12UdlpPBZ721d2ro8Ea22z/ORjQ5nvh5H2speB5DJCP28Pplt+jDFUeS15rHmw8pl0inyk/fDU+3S4mLOx/FPT6WaBEu4HHFsg3oO24BAZZkWRxuGvQIDibN9ruhUukLdzaJOSlDe3t66xo6Bgc3IR+Mj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlVNcFhGeWM3L2FXOE10N3haZlVCbjJ6SVIvOGFtTTFZZUJlemVGRjhGWjJV?=
 =?utf-8?B?UnBXd0ZnZHd1bzB0NVNTSzMwZVhQSW11UlRYL3BxWUtoSzRRSVZIN25oZDNx?=
 =?utf-8?B?V3NzZXhjK1J0TTNLVTFudjdpUE5vV1IySWpyZ3dpTXlQUXVJVXUvN1lpNUJV?=
 =?utf-8?B?OGVpaUpDZlJTZGVlKzQxbFc0NVpFVU8rZjVpV1RkQ3Qvd0ZsOXhBQjNuS3J1?=
 =?utf-8?B?aThlcVZwVmUrWWR2OVc0elR0c1dJNmpDeWhlb2RBdytqblZISkd1bmJPMTh1?=
 =?utf-8?B?UHpuazVuVGFGcFZjRWRqK3g1U29RYlhCbk5qYjhabHcxU3FUOTBWUHpwWVhp?=
 =?utf-8?B?aWd6dm9FWTdMckU2RW1IYjM3WFU5YnV5NnRkRmlibm92YXhGS2FxNXUxZldw?=
 =?utf-8?B?QXRyK0xlMFpRb2tVd0N0VHc3RWxxcnpCZUVXM2dGOU5CVjQvOFhOM2VGYmZm?=
 =?utf-8?B?STJmd3RpNGpUL004U01MYlM2WFMvQ3ZmOUVBckk5MTZkZnkxamtjQWMreVRq?=
 =?utf-8?B?am8remg5TGRwN1M5OU5vdTV5NjdaVEtlNjhDN01KU1ZuRkZYdkZhbkJTcG51?=
 =?utf-8?B?ajNueGc3YkdsdHpwY2FSRFhGT2h5RGRObmdQR0lCZk5lSklGaytLTktTNVZQ?=
 =?utf-8?B?ZTZiQm8xY0E4Q2diWTVyaUVpNnVLYUo3Mi9jOUlJUTNMelBqU2tSdW9pMUZu?=
 =?utf-8?B?U2hrMVVtQmtNL1JNOE5WK2hCK0M3TUhzcnZjZlJmaFczL0pqN01KeDZ0Q2xz?=
 =?utf-8?B?M3B4bU5IeEU4QVNiWFM4SHV4TE9zdFB1bnVRUmNobU1EQnV2YmZSQ2NMNGlF?=
 =?utf-8?B?Q3poVlR5MFpZbS90dTZkU2JXZVlMM20vOEs4Y0hwNkVGQWVLYWlENVFmNTVK?=
 =?utf-8?B?SWRNd3pLR2tMYm9vbE9rOW5BVE9PZ0lZNGxjVS92NXJsL241d0lXcGpCQXpX?=
 =?utf-8?B?VTF4cGZxVHpXM3dLZmMreWtaOGhZaUJwN05rMjBrWnc0Y1BKbkFVS0xXMTZN?=
 =?utf-8?B?d1F6SXh3NjlDUVRwTWxidXc3eEpoNlIrUkRNa251cDArcFowb3RYaERnUGxX?=
 =?utf-8?B?YkJJSDQ4ejRmcnQ1bitQTUpLUjMvUWNteERDN3Z5R2p2akpMcjJEVGR4NWVO?=
 =?utf-8?B?bTZIWnpXMnNsdk8wSncxTldraGZQbTdPNytZQ0kwZnFLR0ZWL0VHcWlMWlpJ?=
 =?utf-8?B?TzdFVW5wNkdXWWF0Wmg5MmlIZjhhMEd1L05yMDNaSnJhVldxV3ZiUlF1bnJW?=
 =?utf-8?B?WCs5RTVMOFY1Q2l2UEo0NlpwMjBJWEVaVC80TllpTytCZmFnaDhOUWRValJX?=
 =?utf-8?B?UE5rMTFHVXkxRFR3UDl0VG9CZ3hzOCtveGpCZ0lBZGdlV05IWU1rWDBkTExi?=
 =?utf-8?B?ejEzSmpRSi84Y0pQbkZjNHpCdlRRYzdsQThiVVpWeG9EYnZqNjFodndZajdp?=
 =?utf-8?B?QjBacnZ3bHYrN0s5Y3UrckhWZzV3RDE5RWJlNkpFSUpYUzNUTDRHYnhNVHBX?=
 =?utf-8?B?RFRsUy9OK3NkREFYY2VXS1F3YlYvODlBWjgwTWpicVhWK3hUN1ZIODRxdjBK?=
 =?utf-8?B?VlNHZlJ0cFB5OEhyQ1pXcFJ6WkJuNmkva0dUVDBRSWU5VEFBZUNNTDhxOEFk?=
 =?utf-8?B?UEowTmlQNDdpWlYyOHFIUFg1emJSUm5HcWUrRjdvOVl0THY1MjJKT3VuNElN?=
 =?utf-8?B?RnYxNGpvR0djTC9pSlcvNHkxME9YUTJTelJXeDJ3RUFRR3VkYzlYejA0eVdD?=
 =?utf-8?B?NTgyakFTNFNManBKbFoxSmJsZ1FFZFU2VHpybjh1NmR3K2Ixa1NvTVhaOUZt?=
 =?utf-8?B?WGxoK2FLVzdIUWliRlhRZDB4N1ppNW90R1YyZE5BQmgxN0FCL2srNXM5S0J2?=
 =?utf-8?B?aDQvNHExOFJ6RUZ4dEd4dkM4cFlXbERjRzlBNlFLbWJlWFlPYXRRYXFOamRX?=
 =?utf-8?B?Z2Y2VVVQcmFpYXRxd05STk9NN040U2ZuWktxNHFVZW9EeTNkK0xuSndNQnYw?=
 =?utf-8?B?NGNMcUhoU1pGSDQyS2JDWUJtYjdsMWtmSXF4MWxSY2E1VE9ieVE1WEtPWnQr?=
 =?utf-8?B?eXR6NldEeW9FNlhHR0lSSGF0SGFDMlEvby9yeWxzOGJadlJBT1RCcmR5OElH?=
 =?utf-8?B?WGI0REpuZ2xtSWxWLzVLZTVqSVdQd3lUQ0VsTnQ0M2hqTG56UVNWVmxRQmM3?=
 =?utf-8?B?bEJtdWo2ZU5SL0JiR3dUOFB4V2dDOHdlQUt5bDIxTnZHQWU5NHJ0WG9vb2dh?=
 =?utf-8?B?NzVkUHYrRURaWjdHS2VQTlNRbmdFME9mZ3BJMnREK2JtcnozNk05RTBJSmRK?=
 =?utf-8?B?V3pWSEF4K0dpNVJXUkphMmYrRnNhbzczRW9tYW84QnNTbVBlM2E5UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a33c16ea-c592-4513-e90a-08dec1a4f6fe
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 19:18:59.7551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kT76ydqrhkTauoAV0pLj3sP4bgrGkYAe3wP1ezg+ikauMHKc3UpxaI/NQZeckVU18gpaSlqaDgjCh2TqQcVYBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7886
X-purgate-ID: tlsNG-bad1c0/1780514343-41F6EA53-361116E2/0/0
X-purgate-type: clean
X-purgate-size: 1792
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A9FD63ACBA

Adjust the only toolstack caller to use the new interface.  No functional
change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Anthony PERARD <anthony.perard@vates.tech>
---
 tools/include/xen-tools/bitops.h | 7 ++++---
 tools/libs/guest/xg_sr_save.c    | 3 ++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/tools/include/xen-tools/bitops.h b/tools/include/xen-tools/bitops.h
index 3b98fba6d74c..29587e89fa6d 100644
--- a/tools/include/xen-tools/bitops.h
+++ b/tools/include/xen-tools/bitops.h
@@ -81,14 +81,15 @@ static inline int test_and_set_bit(unsigned long nr, void *addr)
     return oldbit;
 }
 
-static inline void bitmap_or(void *_dst, const void *_other,
+static inline void bitmap_or(void *_dst, const void *_src1, const void *_src2,
                              unsigned long nr_bits)
 {
     char *dst = _dst;
-    const char *other = _other;
+    const char *src1 = _src1, *src2 = _src2;
     unsigned long i;
+
     for ( i = 0; i < bitmap_size(nr_bits); ++i )
-        dst[i] |= other[i];
+        dst[i] = src1[i] | src2[i];
 }
 
 #endif  /* __XEN_TOOLS_BITOPS_H__ */
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 3b2c5222e429..fdbceab52e46 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -668,7 +668,8 @@ static int suspend_and_send_dirty(struct xc_sr_context *ctx)
     else
         xc_set_progress_prefix(xch, "Checkpointed save");
 
-    bitmap_or(dirty_bitmap, ctx->save.deferred_pages, ctx->save.p2m_size);
+    bitmap_or(dirty_bitmap, dirty_bitmap, ctx->save.deferred_pages,
+              ctx->save.p2m_size);
 
     if ( !ctx->save.live && ctx->stream_type == XC_STREAM_COLO )
     {
-- 
2.53.0


