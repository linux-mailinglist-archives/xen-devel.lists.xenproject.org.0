Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MB2QIoJJzWk+bgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 18:36:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4070837DFA4
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 18:36:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270701.1559284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7yXh-0007lW-UA; Wed, 01 Apr 2026 16:35:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270701.1559284; Wed, 01 Apr 2026 16:35:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7yXh-0007iQ-R8; Wed, 01 Apr 2026 16:35:45 +0000
Received: by outflank-mailman (input) for mailman id 1270701;
 Wed, 01 Apr 2026 16:35:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1w7yXg-0007i3-DZ
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 16:35:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7yXf-00CBO7-NK
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 18:35:43 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69cd4956-2eae-0a2a0a5409dd-0a2a450c89f0-6
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 18:35:43 +0200
Received: from [52.101.43.11]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69cd495d-f40c-0a2a450c0019-34652b0b80af-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 18:35:43 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by BY5PR03MB5112.namprd03.prod.outlook.com (2603:10b6:a03:1e9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 16:35:38 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 16:35:38 +0000
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
 b=dm5WlS4fHjM4OOi5FDFbF8EwnFfo79vrL5EziX9KsAQfnj7drgl3CCcjMUHU0Gb9SB5B4A4FyRWoMZcbjwsGI+OBc59Eyg92Ugn9fDVlp4D8zR7tLpbCbXFOqU46GfdYOjj9O4hxLpkmJ4K13TerGI+XGd0GxfQ1z28ZFpvb6iuZSIhbhR0X0mtt7Z4gERatJfnUqyMWEEDplgiCPdZ0/vqqblPLUnBZOnQh43j9eOkeAtLACc6nkkYK25ToqxHpHxkU0cblqzy+HFt4xbSSCJ5VbKfOi4fDajEbSGyScrMAMAdYuuyh0loagq+pTePT+fuDjbN5a0LU4Gab6WCrWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z1T0p5+LO56SqZhy9doBFm6QObAwtVsf6lJgM5eq988=;
 b=Fh/QkfRMfQAqyi7datx7mqaalM3qztSmCYrJqApm26/WIqpvwqgiczBUB+Ry7oF4AtX9Pw+N1eEh2PUVYGMDyxIRKGGRhpM39jqVqE/t+YdKqGVaXIwre3BgQZTeqCcaCIYNSmvZ2V0ax2tL53H5VSgjawueBaC39iVAl22IZZiPhSaHd0LhERHmWmIGiHuocoSXqguUcsBbTnqaX1qW4xHbBlVJcZGiqO1r6xrsIBbfdUVpyI6JaZ4t9zrX1597lik72mF/oxS4uPc2HuxhJcbA3O7oc+8qBzKLlq97XA4amo8Ngv5QUH6tT85pQyLBx6yjTNflHfD54GoUpbYY+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1T0p5+LO56SqZhy9doBFm6QObAwtVsf6lJgM5eq988=;
 b=CVc9N8aQFQ2JhmBzcJtvLL8XehryxVXLwX5qtpJT8U+zzwoGiPu2otNn0n1+bQq7FfMGeMPpNR56rnCZTtOj2Bt9CZgjFD2QBMuUs0x1F98ixOQans136WUD1kuuW0oiR323rZ9YrBHnGx67j8I1f7JFgVDP71XI/srwwVgR3vU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1 1/3] x86/hap: Wait for remote CPUs during TLB flush
Date: Wed,  1 Apr 2026 17:35:19 +0100
Message-ID: <20260401163521.3603665-2-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401163521.3603665-1-ross.lagerwall@citrix.com>
References: <20260401163521.3603665-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0025.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::14) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|BY5PR03MB5112:EE_
X-MS-Office365-Filtering-Correlation-Id: 75715495-99f5-435a-4553-08de900cb4c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	KCF9f2TOKbqJCvkNmhLY1vW2fq8LjdPpNA82AyHHq7DKmxpgQW22DrQoB67e9r7ws+cnrSd0r8Y+RGlyKWOgmDcOCljU3erHZOXMQWPbwMGPrEYkPctOByP6txO+WFvWnQqnGOLYCp4fV/QRzTtEUcUS3Fky7qF1+fQfYbtSGjtaEAHxTxb22g8ahbgjXzWNaX92EL7VLMFfordcuyZVFRzmM44aCNXWW6Z1EkkjI3lDgMvPEBN11KuU2akMp5NiJioR/zTHbRwz6NWwXi7XmFH062HpGgaKlE+P8RbRKPzCWpGV1H7fJaSm71o3ZhI0V/2btXmoC+w/Mbj5FeXYX46TlWIhdkMUGB8vVTIWR+lsynTKpI/zvP3H7HrrowKujqv0l6vp5bYvbVta6rZPQF+fatRIbppszJkeHClE61H4zR74rIAWl/j/iGf7iy9DRHWcPKEW3Oa4lEiLLsaXHkv7UWW4HaxtrcjGP7NUWDJZHyLuiwWj9FV09k9OpAOljppBrM8sxIupIy94cmvkQ4dkUokKiU47LibpqlN9v+3qj0ApRrYlhDR0Z81ciZNlRd3kko7/hUar2sbuOBd7N0HLbOoTFbblJQ5Sv2LgatB+QLpVXDKd6Fa7tjHym5l7GSx5RpTrZl38i2jUOIQ2DgYVexxyPUx7VMorgpa02DBlhm13lOlg9uS78eFwWrDnZ5sHXkzm6hU8cuq8cJxxhFMCw/eSOjWgZ7qo47VgtF4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D2zLYzOLwBYy2RypqSDOxpT1NaYm8jrSzfLrlD/yICkhnNioS5ZJdnGg1lBQ?=
 =?us-ascii?Q?DYjUoX9/zT54U5pCfZA8X/s4ebNFSY0+lel5bZ7CjW1shaslqXX4IPSJojSt?=
 =?us-ascii?Q?WT/NlTKs1cwYShIsqPgDgtBZ6Ljm2ANNxm7xIouwvrIY+OUmn4zyJKMLWnGH?=
 =?us-ascii?Q?+G6o51G/Uvb2yxKTMMSiuAujuIP3WPxMRtUYVZL6Za7+HriwyluiKvo4pbnx?=
 =?us-ascii?Q?BIkvh6lLZMua6yDCdBwcBPEVXjf1mc2Fy/DSotahcPTKnRTcMyEU7D37Chkz?=
 =?us-ascii?Q?4nKcSN6oCveLvPHCQ0eltdP7GmXg3VjuoNdyORNL7YjI1tmLWRQZwBJGQOBu?=
 =?us-ascii?Q?Akgr250gHjZlDBBpiDy138yBs7z3S+vhnINdMheYgr02KRSC0dQENKn2xWXN?=
 =?us-ascii?Q?tpLCjV5n3moI95ng/TQHq0VEEGl1K4t3OrnDQfwxfz6/y6f4MroCYIZ6OZ6o?=
 =?us-ascii?Q?4bJkZ/YUS1NNUaMMn7dPDh6wEz2OUEIsoDgfuHspQlQl1lnv4cXu+7paG+AA?=
 =?us-ascii?Q?t+yL0A8HfD/HS3LvoFWKl+dCoKWR82UTObKXDSmIZKqtbXZgABzsyCYoYkr4?=
 =?us-ascii?Q?oip09CCYHI8gw5Wf3XIoukdjR5rcd6FSwN/y6dGXcexjZDlheyJ5yTAG+w46?=
 =?us-ascii?Q?ZgD8GsKZ+ZZU9pUVuNbzKJi8KRY9uByKdVqvPNOxUbl84JgdLly9fSk5x3nD?=
 =?us-ascii?Q?c8e49HjoHiOCCn94QKz6WzXT5aZPxNvH0HyqI71kvVICs/1o6yD9O+Fh5iZS?=
 =?us-ascii?Q?+y9TMkPe3D1AVSXIZW7Ay8XGne/t1KTmBplgKdffaxS0mrrAcEEJstF0fkYm?=
 =?us-ascii?Q?xhfgNxs2iPW/QQEPgQ+7mtbU8Ef3NrblPSig6EW3ZDSH7liBHhvKI+S78ZQ4?=
 =?us-ascii?Q?SfgcrZNXLro/vMdFhVJEOG7hfd17hld7JpPYVLy/Ukwotu7B7zVKSMPKKZLH?=
 =?us-ascii?Q?2rH8N5JvX7bgDf4Gqek3sDsUjAmeMj7u4oqon1OrefUBSLY510EyK9jhbzlf?=
 =?us-ascii?Q?ejM9Kkz9gv/dkdXR3Vqyz2Kc0cqdeZRC9tuKJ9X80FgZuYJ71No0VutFiLI9?=
 =?us-ascii?Q?P2RNRLduFqzyGIS2k3rSSLJ08946o3ANjgN2wUy9cOi9nHtSJYooxkThzcD+?=
 =?us-ascii?Q?WlA74MNhaBB9j7pSkGh3VtD6ns/VvsgA6r+QII/neq4IXIIR2WA3IxOsOVwJ?=
 =?us-ascii?Q?qOrJJNW3d3kDE3LhMza/E60ELM0YmXEdlWnxebjXgbSdklDUpJoe9PluoB4y?=
 =?us-ascii?Q?fe2eMp+Dj84qdPQ96HhzmbsSkgDXAS/vsBrzZx12Jnfh3AJeB5g7PZs+yLwe?=
 =?us-ascii?Q?fOvlCPMI+uStBzxZp9akuFLahpjN55Yb9hApv9AnndIJayaLWLEGsgRcs/O1?=
 =?us-ascii?Q?+8TUoImkCA3eBDMKFWADoSRm1pdfHkbdQtyxgmWKKAXEmUurKVwbRRStKqm2?=
 =?us-ascii?Q?7+vY9+B6GN+QH6+76tX2aZGLCBEfYRRAMmpfeUiF4Z7a7l2ApjlFvhzoc62S?=
 =?us-ascii?Q?TRHpjYVS1XDbQg2qiHQlejoe3eOIXtpy2+s4SfMWEMtauKJwGlYyTdryR1/w?=
 =?us-ascii?Q?hNXeUP0U7lpb5PDOHR6kp0bUCMtJ6xokoHaZ6CAOyOKzrz3EOqLUsX28hrsQ?=
 =?us-ascii?Q?FSVfKI3kPm7H44vBtMaFcgGfO1hahkLQIHDTJR6Yf68b2NoW3rU+jwg9vpjH?=
 =?us-ascii?Q?VsgHOXm4Frs0OVy+kyk5gpM5NK6sAtkV2CzxJjkmnpmr+peXQ7Y04F+13LuK?=
 =?us-ascii?Q?h1GG5vffkjWKFLz56ad4XJS7NaFZHNo=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75715495-99f5-435a-4553-08de900cb4c7
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 16:35:38.0872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Va4nqss4ns8eB8wLtbUWyn47XXAAGGeFNP3e7SEwOSFRF/20S3PsJdH6OsTFinHP32i/r7HFuVgbfbEOm75HrYwALVw1Ap5bP8RnP8BXrbY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5112
X-purgate-ID: tlsNG-d25034/1775061343-FFF42A3D-A6CB9E5C/0/0
X-purgate-type: clean
X-purgate-size: 950
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4070837DFA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A future change to on_selected_cpus() will change the semantics of the
wait parameter so that it doesn't wait for remote CPUs to "check in" if
wait == 0. Adjust the call here to retain the existing behaviour so it
continues to wait for the remote CPUs to VMExit.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/mm/hap/hap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 5ccb80bda5d3..fb48e470bbf5 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -763,7 +763,7 @@ static bool cf_check flush_tlb(const unsigned long *vcpu_bitmap)
      * not currently running will already be flushed when scheduled because of
      * the ASID tickle done in the loop above.
      */
-    on_selected_cpus(mask, NULL, NULL, 0);
+    on_selected_cpus(mask, NULL, NULL, 1);
 
     return true;
 }
-- 
2.53.0


