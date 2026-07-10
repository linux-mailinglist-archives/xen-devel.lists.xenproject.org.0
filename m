Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bq0LMq9yUGqzzAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 06:18:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 427BE737180
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 06:18:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=NzNfbYcK;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1358719.1612672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi2gH-00017k-0c; Fri, 10 Jul 2026 04:17:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358719.1612672; Fri, 10 Jul 2026 04:17:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi2gG-00016B-RI; Fri, 10 Jul 2026 04:17:40 +0000
Received: by outflank-mailman (input) for mailman id 1358719;
 Fri, 10 Jul 2026 04:17:39 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <okamoto@valinux.co.jp>) id 1wi2gE-00015H-Pw
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 04:17:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wi2gD-005cGu-0j
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 06:17:37 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <okamoto@valinux.co.jp>)
 id 6a50721c-bab6-0a2a0a5309dd-0a2a4504ea42-30
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 06:17:35 +0200
Received: from [52.101.229.135]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <okamoto@valinux.co.jp>)
 id 6a50725c-b1e5-0a2a45040019-3465e587d751-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 06:17:34 +0200
Received: from TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:af::12)
 by OS9P286MB5189.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:30a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Fri, 10 Jul
 2026 04:17:30 +0000
Received: from TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2067:ff0e:4c3:ad0b]) by TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2067:ff0e:4c3:ad0b%4]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 04:17:30 +0000
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
 b=nNMicJZStZnRvkaGwDLoYaEcajf8SW2tCb5W2JI/a2+/ukEWMQYFtv+sxQpF0ovU3JQtLxEb7VTVO2Oj46ezbRWc2QmS2cndFcvb3QSCH0n+mvXz+coSOC9xaCFsxzZR6WTDNt+DyPv9EOh6DNSrpA90Z7xRkWbLVRTl/BOZqb66fG2AMBDTxUz8aBOmhtoEudDIMsT3Dr2RuLh0A0Y/UKpwBTkAnvQOxxBjuTkyPTe3sPCyqGrLYZlIxvtk1iA+yi1lxaz4D0kjdv4SsYxtD5MlREV92gSgqJ2jVGgUZstQvsGYfaCSeH0YdquoXlUho+Lk6zCzJxCttrlv2JA03A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j446YXyiZOrK7fknZZSi/XJ96d4r0srzO+3ZbD/Tt78=;
 b=oozkRMRx59IN2ffft2vKC0gs2RyMXMwtR6CKPgBFoodmdFf3kcNOYIHcTLGu9/eMMUKviAUIX2Anmi32LCGZtsvCv9V5Ilq8XAhtwBZNmCZbHKjHGMM9M794zxLSZpUoRYbBM+qs3ZA0ZUB4OCymeOH01FLLFxsK+glEkDvqPiS+O/E0IRuBTZH+ZvmXlkPo9ez4ujpvGc4uf7UNJTPpzYzV3Z+JTaVX3j22Ci9WUgvEwTXtkfeJDDeGW8AfUeooar6l7mSAdjnpbTNKCSTheWQIj3baNQ/f+71Hgv3QH7PLznNfOhjJxDp6RvxWyjnfwoGtsLdqeYsR7pQ+GBVO9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j446YXyiZOrK7fknZZSi/XJ96d4r0srzO+3ZbD/Tt78=;
 b=NzNfbYcKoUh4yF0VKFALA5j47m+K8OCEhB3oNJEHAgIbXINHAwWn9+dGz/eMp5d7zVhpbn4/M1b2vrrcep83zRYa8wke72R+elBsobFFpKKuMD/HX4qcSqVPl9PFeqxTepK/xGpqK/GxdzT8K9IUKe0oXKR7IwUl3TrJRditdJ8=
From: Ryoji Okamoto <okamoto@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Ryo Takakura <takakura@valinux.co.jp>,
	Hirokazu Takahashi <taka@valinux.co.jp>,
	Jan Beulich <jbeulich@suse.com>,
	Ryoji Okamoto <okamoto@valinux.co.jp>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH] tools/xentrace: decode RTDS priority in repl_budget records
Date: Fri, 10 Jul 2026 13:17:28 +0900
Message-ID: <20260710041728.336181-1-okamoto@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0091.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::11) To TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:af::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB1053:EE_|OS9P286MB5189:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b49f1d3-03b5-44f9-0693-08dede3a2857
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|23010399003|18002099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	fsizMsSgJejtnRkivpj/5cQ9gWmktxORGe+SJ8cR/HDOTjAnLjfAwybBuK6u/tqCBXhQnz/qWf0OLaZsJ+QonTuUPo8EReAZUy9rUqoov1wk3bc6jda0CRkiVWTcCme14vWLJ7bXAbPW/h0uFjZCvKU4E8fwUJdU+Xc9I247ebwt8wZG5JXc4A4cHNmwKJIG3abLr889Z5YTUy4Sj3QB5V1GAfQEFavO22g4f+v48xDviJ/M7w4797Arp0HyMj6LqM87Iv7f86NYsxkQfmn7juJU/+Q9IvoqMoeE9Zk8GFJfrwAnrRJ4ScRqFhZmTF8iYWB6dXcBXfgufIe71u0OC2UzJXwAdGrM4k9q3Svf4EDuSVxEkkW9DKzyfG8N623FvXn3hu23XSp/WRRQyi/5VpDxdelAgPXqvx4pETmXo8c97dSc3lQW53ls+AmqnRjh64cqrZPpo/z1zLMDXGIdQ8yqRu9Sfb/cq+p7tntEGLn3v55jb7u5qNDV7U70MpVUwpoWcN83dzCN1fXDKbwMomWmen7MsvJhXrE3b9NDpmen0ktMrtUw+YcUAV3XrzaocgME66+y5NZMNGZfrPWvd4U6P4VCnNR/AdhNWxJK5d0istu9iFhzi+UUbASKNs2YygyeDjtgsKj3MFPS2Ge6KIqY/S8rhjpu6Z7I94TZ434=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(23010399003)(18002099003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?plYebQeHWPotIfQ6/uizAZFuCnDQOy/aTC4nM6HHv0AwtgjJO/l4i3ukIyfh?=
 =?us-ascii?Q?iq4Rn6pin/GZXoZwHX1oRie00vNFGyLIEpEBsMat1YUqPce5iD8D5mGAKkjC?=
 =?us-ascii?Q?b820MLMZMNQ+rBhR2uWVQAfjj1D8KW5YTtPjlTSDHED3/lSn2snnFW3KNbQi?=
 =?us-ascii?Q?fTzrgzNdu/lTrRPi63iKpKiK+c6+Tpc51gHB0AH7PDWJ1UrGzYeb43KmNIan?=
 =?us-ascii?Q?JhmGtOJ22tYCLGmc4oMvwCmavEEadwkW8WJZ65W1UQa7o6DaKqQyNpA4jjte?=
 =?us-ascii?Q?H568ifoNV/Ljpas4+5BchTRMAR23a5S/3JwO+cT38kllqaaz5OmYX/2EkKF4?=
 =?us-ascii?Q?2YAk5ZttPHAHjn0vVwE9dtvGOkCyOgcsdxM68ZuM7LlntZCmixSkOS8Q/SO/?=
 =?us-ascii?Q?EmNH/ZQ4G6hhfrufMXZJY/9wBJP70hsuy6+/2Ull8JfYrXi9i5gpErwXwG8E?=
 =?us-ascii?Q?37BqmALlJO+58NhJD1bmi6wWEXaJeh8ODI6Jp2/0s7ON7bjnp40ENw5Z1JvO?=
 =?us-ascii?Q?3ZkxStzGjMMsm6XQD00EuIH7Cd1fbpRCCDIj8wwU8YR5aGPcIYiSVSttSdTJ?=
 =?us-ascii?Q?t/KCY6IpONcFJfYJvBA6o5nHDl/Zk+j8y2ENKjz8FSQZmuxkgfquvNTPcF8R?=
 =?us-ascii?Q?RklUSsEXbuhRiq33bSXjR9ErARDyHEnFHEKWVMxXHI4532ZsGSIl2DFgXPtz?=
 =?us-ascii?Q?ypjGVQES6uqdymq88ZFEPPblRtGvU3V9UEInnu1ulLUugfe+q5FtKHBAtDNT?=
 =?us-ascii?Q?Ol+Gynp6obOaqMBoKdn2LAzejQ71DpkKNTaKba+jyinzt2akvch7EmWFchdb?=
 =?us-ascii?Q?8Erzt7kvLBuLyf4tBj69tPIE7/Af333FvdyEC4Xnf/IZyfUO4mpqvaLka34G?=
 =?us-ascii?Q?6Wd4OOkznOc/eM79Zj4zcpmiS1eUE1AK7ytLWO0q0eUPuogTJjJhcUpp/ru3?=
 =?us-ascii?Q?lmJOfoSeq8apTn2JwDTo5D4Eftjqu9LYjknAUYltua7EgwoWDHntNSwBKVvi?=
 =?us-ascii?Q?fsbHZ0p/w88ViMqGz+gU8GkeT09SqRT6OpWOWc8lTuD9ujnd/QhXNJdA3FYm?=
 =?us-ascii?Q?ohpvbRnU24rHY63HyE07ewAbTvL6UitQ5AvfPBM2oZodc/pE5/N4ynq1TTfG?=
 =?us-ascii?Q?35uqdT9arQI70OKecVUcdqnkOZdTnKSXAsRA9E4hlSTDT60+SyBAGJ07B7k/?=
 =?us-ascii?Q?5w71JEpAHvqHoIiW8ZRHe8gyUpYBGPn85HMCRWoWFQJvoA0lfyFVrkXFM0YE?=
 =?us-ascii?Q?QUmRo/QNEcqr+MO1qiV2phbmIatu9+kWHBbdr1skTmaveXfqOzsHwjJoqbM7?=
 =?us-ascii?Q?YSAku1XNLgHCyZqPCApNh+1LetSuKhHEJBMGCy97GKvfB6PBswNsdsl6xJg4?=
 =?us-ascii?Q?9yMYnQdWEYhrOWj/is71wQGZmbMAGD3eR5r1v/KE7LuRhW01VCHuYoy53jMV?=
 =?us-ascii?Q?XubBATxfArLVNxZb7ILdNsX9fFz2enMPdvk3gKLJZfyhOgiLjZ5tvQcLo6d6?=
 =?us-ascii?Q?X0sOzDLutypROz4VJISeRKx2P6JYXQmC45Kk7qO2WiyepFIc6xfq4zHEmzj6?=
 =?us-ascii?Q?7Yj1M4N0l8OJojuEBCqyHGiFXCFA+fX/OXvJ7rXtSV/fIwOgzfYjYwId4f4h?=
 =?us-ascii?Q?qd/OCaENv0SeeGUrx/VmZPP+c7rLfa9geRLomHms7n+WUefVtSOJIgB3RWcs?=
 =?us-ascii?Q?nbExMIH4m+p2zEOzx9KKas0b2icnZZo8Nmqw9Jov/wVsjMEdmlQqgJwqypLg?=
 =?us-ascii?Q?bekug1o/RCEYEotUWW/WC7y6vwhgEvfEgJBFNmzgthBYCfc5LttIAvpL50VW?=
X-MS-Exchange-AntiSpam-MessageData-1: 2jS29UhR0ccspg==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b49f1d3-03b5-44f9-0693-08dede3a2857
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 04:17:30.1637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQVVB1qzzyHP/baYaXl2/IetkWOcJtkDHdvgrv1SuBZFmV3TG4YTK/Y14+vxnlg5IYL+xozOwVqdLrP0l0byEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB5189
X-purgate-ID: tlsNG-ebf023/1783657055-7DA5DFE7-B509B2B5/0/0
X-purgate-type: clean
X-purgate-size: 1496
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[okamoto@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:takakura@valinux.co.jp,m:taka@valinux.co.jp,m:jbeulich@suse.com,m:okamoto@valinux.co.jp,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[okamoto@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 427BE737180

The RTDS repl_budget trace record now contains the vCPU priority
level. Update xenalyze to account for the additional field and print
it when dumping the trace event.

Without this change, xenalyze interprets the record using the old
layout, causing the deadline and budget fields to be decoded from the
wrong offsets.

Signed-off-by: Ryoji Okamoto <okamoto@valinux.co.jp>
---
 tools/xentrace/xenalyze.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
index 42feeb282e..439066e352 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -8039,12 +8039,13 @@ void sched_process(struct pcpu_info *p)
             if(opt.dump_all) {
                 struct {
                     unsigned int vcpuid:16, domid:16;
+                    uint32_t priority_level;
                     uint64_t cur_dl, cur_bg;
                 } __attribute__((packed)) *r = (typeof(r))ri->d;
 
                 printf(" %s rtds:repl_budget d%uv%u, deadline = %"PRIu64", "
-                       "budget = %"PRIu64"\n", ri->dump_header,
-                       r->domid, r->vcpuid, r->cur_dl, r->cur_bg);
+                       "budget = %"PRIu64", priority = %u\n", ri->dump_header,
+                       r->domid, r->vcpuid, r->cur_dl, r->cur_bg, r->priority_level);
             }
             break;
         case TRC_SCHED_CLASS_EVT(RTDS, 5): /* SCHED_TASKLET    */
-- 
2.43.0


