Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJt6N1OkC2qRKQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 01:44:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFD05751A7
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 01:44:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312312.1582451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP7d3-0005jQ-49; Mon, 18 May 2026 23:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312312.1582451; Mon, 18 May 2026 23:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP7d2-0005fv-W2; Mon, 18 May 2026 23:44:08 +0000
Received: by outflank-mailman (input) for mailman id 1312312;
 Mon, 18 May 2026 23:44:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Edgar.Iglesias@amd.com>) id 1wP7d1-0005dV-AR
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 23:44:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wP7d0-009rrh-N8
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 01:44:06 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Edgar.Iglesias@amd.com>)
 id 6a0ba42c-5cb7-0a2a0a5109dd-0a2a4501dea6-20
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 01:44:06 +0200
Received: from [40.107.208.71]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Edgar.Iglesias@amd.com>)
 id 6a0ba443-c1f2-0a2a45010019-286bd0477965-4
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 01:44:06 +0200
Received: from SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
 by SJ5PPFCB5E1B8F5.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9a1) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.21; Mon, 18 May
 2026 23:44:00 +0000
Received: from SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::ae79:f50b:b7a6:4cd8]) by SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::ae79:f50b:b7a6:4cd8%5]) with mapi id 15.21.0025.016; Mon, 18 May 2026
 23:44:00 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pfxRAHLVZpqjun1aOR/Ym5QxUDSLE/1GQFy4g7LrwIYlMsFyU+ZEbA/v1apNzXEJcuUbVXIxzcQmeku/lvyeAChCFGDL6GGbMW+j6i9ICa8ClCpr4p8+35maphTIQrLIDSVT1uEeIZ7CMWko1jsHPyYU1pRERhO3VrQOU15p99LSLFjZhT1v1XocScILuwRNq+ypNZcD/PRA2dirJkW+tyFoVl+kEUglf648lLqXtLgynH6a5M3cqPceTBTZd/bLCtBOo0zqOvVJ4DCkuq1+y4PgN3Jlj/985xFXI4jn2/TzSgn5w0LRAT0OpJhgodZE5M2GAcmDTnxZJ0m3QvwrlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4S/4MTwq6hxCSZMJo8SlPlaAXuhjtvdL1rd4CEbqZM=;
 b=GuOso1Xw3Y11m5OVgfV8anJPMeNKcHlzupE20XVOmJBK8fDN288Fcmhw7ZP5ymnvHlMGhJ6UY2JhBPISrMjnnXxq4gxcxIZJJi7ctB0pwj1G+uDXX3sCUjWuDLU4mLA5K/7ADxthBPCYwpb5L0RP0u3wMXHdcdd7lrK+taaHWEuYmFc1kertDUN2/Yw2iFylku0i0GZLql+tWpw4nkbkJ097T0Su/Y5WzPqShiT59bsFx+SQoeG/zkS+KZIKx8HWxDmRnRTpkT01PzlU57OJ0N16rMXFoGX1XRh0JyULHmePnc8ppU19FCIc/QTMTGtTKz87tLNjDEX+CZLE5orSWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4S/4MTwq6hxCSZMJo8SlPlaAXuhjtvdL1rd4CEbqZM=;
 b=m8o9U5DGJs2DP5N5NjH3/NdMQjj6hDpmSJWirWC7p7KB62P9LkSAqSTzq6NU+HbQvI6fOan+p24CSAp3oroU5zAuDiac4X5MtIGiuuZxwGGGJVir4HTCHGyPZtwrlrWa5boy0XeUfg6rR6oA2WoPcyb1mVpQW2fp/R+tyhH3rm8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	edgar.iglesias@amd.com
Subject: [PATCH v1 1/1] arm64: Fix strrchr() matching of null terminator
Date: Tue, 19 May 2026 01:43:53 +0200
Message-ID: <20260518234353.453193-2-edgar.iglesias@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518234353.453193-1-edgar.iglesias@amd.com>
References: <20260518234353.453193-1-edgar.iglesias@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CPAP307CA0001.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:3::10) To SN7PR12MB6839.namprd12.prod.outlook.com
 (2603:10b6:806:265::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB6839:EE_|SJ5PPFCB5E1B8F5:EE_
X-MS-Office365-Filtering-Correlation-Id: 85b7c497-cb8b-4c24-1e07-08deb537558d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info:
	+ebV+xXB68rlaQ8lTEH80loxF2gsh09OyqSrp/0UaIjjnIkyIVIUDtBQLk0l86v2XWzscjjlmbCnEcM6Ij8BjwVnCR5FxDrhBoFnEG5vMRUGx10TAxAfj7vzurdYevOwT4NBPzq+N88YrCo44zX714mZ4+5X01cMZgXss48CxO/fTgZymkkylL3N8pb6sCkhHL/knkI21zIhqHOkKq7zekAQLaBdIc3FfpCSVrClKFCqg8cdUKhi47HHFs/7zivEnM0+TA+NaUSZ8KGbkI0/MPAOkCF38sU+9BWPqYZ9C1OC7wpmNpw38EQh9TpkLvyggJh/H/0CFnnBK1zN3/v4OGWuXxVq2j+k4i98SBpo6W9ojByFGXIvMlo0tsfn4Eg2S44HjuZlTp2/Zu/QWl37a9iAXnLuR3Wo6f8PeGR7GZThf3N/os2jWkG9UiLzoK8VIYHWvLQMjYpET9wbf+nfqI5h7wpQRVD18X1iyZBvdb1tIWZcN/QH18o9RsY7UWkRw8UQOseTtQBERjtDVBGVn9RxN7/5pWwF0SiNc30rqnRVvoaydCs1SdD4nJIwW+xRjq01CQiaFSk4x3jKNZLpkIKPxNwFJrxohmDyFvyxVUTFDLHCrcAqvS6OSIgB914w0bx0LgPWSE6gz/HNJM3Cuwh1QlPGqg+mb4qhmwairoKBPSf9Eb+qrs/xIR6wFI3V
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB6839.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sl6faaC22LTiQTpXYfJIVQeAl/QGu8nGbCQiP4dWVB5HQU2tFYFatfaBaNgG?=
 =?us-ascii?Q?1jXoft3+AtZOyQ3qdYDY/1HKvETHqeOJCfiTJ32TkHDIW4I2zsF40mbWnpWJ?=
 =?us-ascii?Q?iVUYGCQs0rW8M3Ap6VwqgSXHYkESt5dVJQfneD7ZnVcFiYSm9e+QNJPARkys?=
 =?us-ascii?Q?lJ4yJj9cspWzHsPZXfW2JCSCjybxzFlXH9RdZ+lenTJFthWKJ5sKOkOIL3Pv?=
 =?us-ascii?Q?jSffyP7InN/3hk6GTBcwLTVs0wnQqpcf1oLQ/QV+3feKot9BhS8wKI08h+Iv?=
 =?us-ascii?Q?cXip1kKrO/GKt18EtIFqukF27f13HjUXv7g5ErxOXNyJ2PA1Ou+9TmqrfRwv?=
 =?us-ascii?Q?MRrjIrVj7yHKoufpcQFtMy0SRGoNCusYPBOJ5e+frSiu16IpER9MZSoleoTL?=
 =?us-ascii?Q?0MUJDm4hyvDYmgGtbkdnVYBHPwO6PLf8fAsVcE9QrOATnrCLIS+LdKNIs8Ek?=
 =?us-ascii?Q?SLxF279NO8sOyZPXqrfMS8B9Zp1UuI7ov3WYmt0nkjea1babZvCmderlAt21?=
 =?us-ascii?Q?qlrLjUfNec+EH+PVh7kwRvIR8ULaIVCPaOyBnwQceavSQWHzUvNgoGbMydGA?=
 =?us-ascii?Q?/rkNmLoHxZDTTlYptzLH8Jb8VenynpmEP8YUe+GhThQuJ05M1vv+yIB8bCO6?=
 =?us-ascii?Q?ile3Ma5549k2sdHk2QjlPGgQ2FdUj3RzjO9XhY5qp8fzPmAjCS4GnUtM9kVI?=
 =?us-ascii?Q?Hehf4NlAVSC9OW/PVp1B/BM+3QdrzT4Z2goadWEhey4O67ALUrZlrAPUHaD6?=
 =?us-ascii?Q?AjUrln+4PvH0sUXx88pXqIwQbY7bhXeSLW4TXTtE322qjhq1z9Ry0QcKzR3L?=
 =?us-ascii?Q?IM675rQj9AF5HHMsfWXqPn5/i5jncpf2hs17OS8Rd/mYiu8eYFwiR/fuxyE1?=
 =?us-ascii?Q?qmMXXVvpEnnJXKV6cJyVuuVpK1um0fQjfSVnMpltSBWpWwJBnYBRLXjv/fHW?=
 =?us-ascii?Q?BusHbK17rhqOmecQZJkPCw3dVnUJ+HpLhFskVEKQ+tJZrxRCyNL7BLdx7kWb?=
 =?us-ascii?Q?fQ2VgyJyAnXWJDKCtHtybc2A8KoSilA/EYUnP9WwbEYJUM19+ystCVjrpzSl?=
 =?us-ascii?Q?G23WEk3ShfRGfKPoOoF8bSinXzBjQwXmrvIDadT6/6vDFwxRdluiNJHhfhAz?=
 =?us-ascii?Q?ETPRTy++dHnHogl2ZtXlqCauiDg5JaKxHzGEX7w7mo9G6tPCJCNLm46eOyT4?=
 =?us-ascii?Q?J3oIzLkK/se0T2sgrO8afNJ/CTldYJTyRQDMiTCiGG20zPmES1t9ubf8s4bI?=
 =?us-ascii?Q?Qh7kcoE8uxiPyk6uFvEnaLM4lufRm+hhb7JuO+MupFltzEW1MSb4SY53tXVJ?=
 =?us-ascii?Q?rrqjP/lQ+BuQ9/AybytEffc63jGDsuOCStGBTFjF79AiP2DXoKledro2DhDH?=
 =?us-ascii?Q?04MCjq4wH0qyoLMj2OFlGKjmavzimK8TpRHaRKnMP7KOcqEi+tL8k2PzRSPD?=
 =?us-ascii?Q?Eagw5AjO97rakcRrDecXyD6m4VlattWFlfzWAMSO/FWk53Z6taDlv9SbD01g?=
 =?us-ascii?Q?poRyO+ky3/w+clo2AW1bL1CAZqPH8/y2J7kd5vbTvj7sbRo74wDCrZGh3LB+?=
 =?us-ascii?Q?WxLyCUiDlCk6EoJ35R/SmvD+f4F6YsfiIKp6AYN+7kli0n8oqpqJtFFLboXw?=
 =?us-ascii?Q?MSappbzvhJcKitJKBa5VGpX4LgQ7hoA2TJy+xoYk9864yQPwZ1asCljrsNJD?=
 =?us-ascii?Q?IUlqiIHV8dHeH+NI9s3WDviQ6qvV06RjeNheLiHn9hmtEQBw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b7c497-cb8b-4c24-1e07-08deb537558d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB6839.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 23:43:59.7508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZz5uhwQOVsMX6YNoqhbS3WNkl3uGAmzBbsrf1ozXDBeoSvER8NcCxTJbtoq77RY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFCB5E1B8F5
X-purgate-ID: tlsNG-d62444/1779147846-AC457FF4-796B972A/0/0
X-purgate-type: clean
X-purgate-size: 1187
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER(0.00)[edgar.iglesias@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:edgar.iglesias@amd.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edgar.iglesias@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,amd.com:email,amd.com:mid,amd.com:dkim,b.ne:url]
X-Rspamd-Queue-Id: 4CFD05751A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The generic Xen strrchr() implementation returns a pointer to the string
terminator when searching for '\0', matching the standard C semantics.

The ARM64 assembly version stopped as soon as it loaded the terminator and
returned the previous match pointer instead.  This made strrchr("", '\0')
return NULL.

Compare the loaded byte against the requested character before deciding
whether to stop at the terminator, so the terminator itself can be returned
when it is the requested character.

Fixes: 42c4eb6a83 ("xen: arm64: assembly optimised mem* and str*")
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 xen/arch/arm/arm64/lib/strrchr.S | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/arm64/lib/strrchr.S b/xen/arch/arm/arm64/lib/strrchr.S
index 81033c0822..31f304b183 100644
--- a/xen/arch/arm/arm64/lib/strrchr.S
+++ b/xen/arch/arm/arm64/lib/strrchr.S
@@ -30,11 +30,10 @@ FUNC(strrchr)
 	mov	x3, #0
 	and	w1, w1, #0xff
 1:	ldrb	w2, [x0], #1
-	cbz	w2, 2f
 	cmp	w2, w1
-	b.ne	1b
+	b.ne	2f
 	sub	x3, x0, #1
-	b	1b
-2:	mov	x0, x3
+2:	cbnz	w2, 1b
+	mov	x0, x3
 	ret
 END(strrchr)
-- 
2.43.0


