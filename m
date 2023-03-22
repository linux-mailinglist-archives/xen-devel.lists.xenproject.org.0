Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 315FF6C4398
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 07:51:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513099.793601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pesIe-00054I-5t; Wed, 22 Mar 2023 06:50:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513099.793601; Wed, 22 Mar 2023 06:50:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pesIe-00050u-1o; Wed, 22 Mar 2023 06:50:20 +0000
Received: by outflank-mailman (input) for mailman id 513099;
 Wed, 22 Mar 2023 06:50:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pesIb-00050i-F9
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 06:50:17 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0629.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb5dd8d5-c87d-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 07:50:13 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7404.eurprd04.prod.outlook.com (2603:10a6:102:8f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 06:50:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 06:50:10 +0000
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
X-Inumbo-ID: cb5dd8d5-c87d-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AFdiYyevWYDUrPOMRbfUcnMbO0MgB3YMmfAFGtJYFsuAUBj2soK0HWqstxkBcKnpzJyURap1ObmpcSnwQzQV8mmMEw5ysl6o1s94cWuRVIHkk57wgCqiLkBFMyGVIFDuXyoQObBjIviZjvRbNJs3R7FxoZOJqDmPojUFMg9svpU0/kkE5fGteLz0e043PV+9cqezPjmCr8MBf2ywhhUPElLtVADBxvUJ7wK+TKFq1/g+wwv9AlFq/JXOQ2t9Rl8aJfuQLhzrzMqFcdK+5joeemTsFpku62en5iah1gW6b3ryL8vguLUdrTiHqAmGwdteCkIr+g5/nN1BI84oE0OU4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZ2B/+PSfbweO2EOadT4u03RuDriTFODuo3jKuiQPU0=;
 b=cu3wVkHfihNCOLowW8N/9RzTBQ9iFeH8vpp/A7V+V/FyyxSBM8QQ1N5TFNx4RJ+Yc6nmN3Me81oDJ/BMye8YWkfzTrcc3ECIjdG3UfJKCmOBSU5+aSbljykDRNP2Ma5o9c6Td8eZAur+o+gTkMr+5PGFxd35YUKmYtocJxueCfJ1U+lc5pkZ9NTugPWi1BHZI+KovBUpDPt6IjewwxubKDi8Xs1R/Zp2LECie2ZdL+2R40sa0kQ87PItrr6wQjAb/sdnN0t5OD3+kxbTX+i7zV2opmYFRxaaJIeh4n/axfJeKdp4KwQSbW+P94C5fHaJzudectmeXZOsldODfWePgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZ2B/+PSfbweO2EOadT4u03RuDriTFODuo3jKuiQPU0=;
 b=viQuq9FSrScx+X4v1evUr18ty5/AGT7M+655vq5B4HQivxlN/FzUb3q+NqPVonkEwieETJEv1CZqlMfhb74cGDizBbH28hfj71Rr/EWhTWt80RKCgdT6s8489xw8oqhjEnWbPKh9kE9ZPghb8LO2K5rjFDC4CeBOp2aeCQfKUr42D7lSTwvmF8zMMWB8ReXfX4h7l/2kl0shRkdr/RiVzi7W47HEEenhe8AMvePScrM9tmuaj2bNof5uzeNy0LgLCY5wHFok8fthiTCRzAvYK22tskxIKtImXqfFBRECiMGKinCYW3jH+Kc3ixL+kyCIpiL9UE986QyNyffNC39kSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <42d40da1-bc38-82fb-154a-e1fc876b0c24@suse.com>
Date: Wed, 22 Mar 2023 07:50:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/HVM: restrict use of pinned cache attributes as well as
 associated flushing
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7404:EE_
X-MS-Office365-Filtering-Correlation-Id: da6f1a4e-599b-441c-8573-08db2aa1ae33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qQ+BnbKgoLrJ61L8i3e6vLIrplfYie//qegARXQVEEqNfKUealHjRidEUGf3R3tZ/OZaXp8p++0ENNsJ8xuOgu4X4wzrDljCHFmoezW6rtbTNylrohYpND7b9ZItnz8JdPqSKMhJOkjb7ZMdp6yCAtXcSC3SVRw9i+DrGTpQ/i1wz340Zgu8nu62BosLYPTrq7uifzkd3p9FLMeQQAmSexLzhtVCblJMPYt1rlArGH8q5aCjaMzn06Wf9uJerCFObTTjM652/9jA+RaMEyGCKCoYepWqO0YCc/pL7AmJhJgQz216gnmS5NwF8bXBKuvrJtgbDRPTYYcdNp+HS4mDzMvtAZo14jFO0ZX6mfcZtCMa9bvVaHyWH9xvGAZBScPU9BnihC4H+j6FBEAggNN7g/jz5sz2xA+GwTVjHZyk8PieUC6hn0kEm3PWoStzlEJyvsFtKEZWvD9ttT/64UHzDeXFyxJaDVuoCgM7OVhoftI5j6Vp4m9YZuI8FZFDj9cu0BlYje0ST+S1KP/gHxRjuJRad6bx2f+Mg4M3rYBcltZmwOpk6I0H7zGRiSToFUHZKuZ+pLe88RKs/lV9q1pqsX9SJV/pmxLmr0DpN/kvIc1f+hauR7PeicV0LTsPVzEzxCjwTvlvR7Lo4tzX5KTEcQCIF9R6x8r8dj2Zx2jPf+neroluemTU/RZjoMkvYZ4J59D3lVBmiC1zlQi26E2N2aD8rEVYBD8HMrk4zfn9O4Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(39860400002)(366004)(376002)(396003)(346002)(451199018)(2616005)(6506007)(6486002)(4326008)(186003)(478600001)(83380400001)(316002)(54906003)(6916009)(66476007)(66556008)(66946007)(8676002)(31686004)(6512007)(26005)(66899018)(8936002)(5660300002)(41300700001)(38100700002)(36756003)(2906002)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3NSNnB4R0E0blFDUy9Xdlh1eEhuRG5zd2hnMkQzNjNpYjZSTFpoajFDMXBx?=
 =?utf-8?B?UGFBSTl4aXhSc3FtSVc0VmVhS2lObHBhWW43ZzBiRys3bmF6YTA5ZTJLZzF4?=
 =?utf-8?B?elN1V3NUTFFxZklwbENFeTFuUjhyZ1dXNjlveXdQblIvYTJ3eTZGalpVZ1pN?=
 =?utf-8?B?bjMzYjd3aDg3QUxabTBlRXV4VHhuaDg4blZxSlFuTTJyRzY1QVZIN2hQTHJS?=
 =?utf-8?B?bFRFVkxHQWIrQzd2K2RhMjdpNHQ5clplczByTUJxWTNKNTI5b2hnUVM2S1VU?=
 =?utf-8?B?VFRaWFpZMHhES2hoL1lDTVoxczBSWEFQSUNiNHVlSS9BK3plYnh1SGZNSkpL?=
 =?utf-8?B?RHZCVDBpU1BrUGhrbEpienIwaTBiVzMwR0JMWldBbEtTWDVzZjhSeEhsNUk5?=
 =?utf-8?B?VDB5YTVKNlBtQWQ3ekM3SEhuOEtxSk41aDBVTWZtb2tCc3doR3JxbWo1NVBo?=
 =?utf-8?B?eFl2YWdOWktSTTZWTGJXT0REYi9OaVBhZHhPdUtXb3hIMXYwMXYvQytyb0gx?=
 =?utf-8?B?V3pmbzBDRkJBdGRtSGxGMFU0K2ZZKzFIOTJsMTQ4bDh2OEZNSjhFU0MxWXlS?=
 =?utf-8?B?NVlvV0c4ZHlLYUhYMnhLWE1vSVVkUTRVMG9OQkNnUXpTVkRQT2tqVTc2MW5u?=
 =?utf-8?B?Sm1GUEhob0Zob2lYMmpZUi9uZUJYWHBDdktmUW85SjZYemV6b2JTTDhDaWI5?=
 =?utf-8?B?b0dIQ1JFSUhRL3I1aXUrNVVlcGdBU3RvT1dVR0ZDaGJqSnlQTVd4c3F6S3RY?=
 =?utf-8?B?TWU4c1Joa0ZZbGtnUU41SXFGZTRJUWpNY2E2WnhiM2hIUVl3VzBmVzg1djVa?=
 =?utf-8?B?UXpweStNZG40WGtjU1pRM1FlaUwvMkU4cVdiZ0VMcXErTTk2ck5NMFVnT2Ra?=
 =?utf-8?B?U2kxT2tBUGl0TzdHK0lWOHNQVzhTTVo3TTh3TG5lck5Eajl2Vys5RmFYNWpH?=
 =?utf-8?B?U1pyVWN0RTIxbXpkYjc1RmZRellzMzYwN1dsVXZXQzI3RCtiOU1UZlhRTEJ5?=
 =?utf-8?B?eHB5ZXZqbXJ2b3kxNy85T2ZvYnhKU2NHRVpTYi9YdFVIQjdtL21LdU5EM3dP?=
 =?utf-8?B?aHFtcXI3czJ1ZGdKTXNhT2NHWjd6amNGTEVmdWVJRzNTRnN1aHNsZ0t4Y3Zl?=
 =?utf-8?B?ak9UbnBpZE5JcDJMeHJsMWtwSkNUU3RXWFB3SS9BMzBZc1phV3liL0UzNGNU?=
 =?utf-8?B?NzdwSk5sTXF5NnZvWGNGVHU3Q2EyQTB3d2hPbkowaTdreVFZQVhxSkl5T3o2?=
 =?utf-8?B?VXFjWXpweE9lTWtyd1psZlM0dDdpRDNUSTlXVWlxb25lYVBsSDRqVTc3cWt6?=
 =?utf-8?B?aGJxaFFzc0Z0Q0c1NC84UWVibXVldlp0SWlGdzF0bHRXbEw4VkJ6OEd1NEtz?=
 =?utf-8?B?YmZXMHc5RjdJc01jWGdTM1dlbzB0MExDZHB5TTR4RlJOaWZEUVRYODVMTXc3?=
 =?utf-8?B?U0ZDa3JUc3Z5NytYbjJCTnloZnA3VVJoV29kaHNsbklEd2NrdUJoVDVDckpO?=
 =?utf-8?B?N0F3Z2k3YzgzVHA2VGU1dXBZanpoSXcrVWlOcjN5QVNnWEY2M0pKejRFc0xS?=
 =?utf-8?B?RjN5eEtCMWJwajdha0QvVzFVUXBzOE03dHhJUW1GancvWW0vK2F2WHZCdDYv?=
 =?utf-8?B?MUhQS01oekxENVVoVUVxTTNQQStlSGhXcCtvWUJ4VFRXemt1dCs2SHNHZFJx?=
 =?utf-8?B?WlVOeFZPLzVsWlZJb1pGS0UyME5lNEUzd21mNVF0NHdxODlXUmNGU0htczNm?=
 =?utf-8?B?SWRnVWxMM3FQSUVENUhqd2pseE9rdVBNUS9BUjZwUnljbWZadUtsMlpGUlJn?=
 =?utf-8?B?Q1h4enZUWVgrd3ZCWEtyYkNsR0FtWjROZ1NtS25sRUd2NldsRjUyMUorTTZU?=
 =?utf-8?B?VjZjR01pMklCOWJ6SkVwSjNUd200OXRtR2NlT1hzSVM2ckQ4WjRhQmg4TzJn?=
 =?utf-8?B?UUV2VGU3UitFckxLVE5sejJqWnFKMVZ0QmNsWmhhWGJmZktRaFYvUzVxWHZp?=
 =?utf-8?B?R2cya2s0MWQwZyswMzJab3pOcUEyYTZPTjhlaFh4UHY2NkxMcUVLRjBlWXRq?=
 =?utf-8?B?TXpDdWtwMHBSZThjSlQ1R1BzV3VZY21NbnBSWDA5M244Q3MwSHhmMWRSNGR6?=
 =?utf-8?Q?YxUuA5k6EUsRrn1wRmGaaVv+H?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da6f1a4e-599b-441c-8573-08db2aa1ae33
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 06:50:10.5489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EyYLKRsdbkpBdjXRdrUqC8uEnweUdjM7sCVUk0YVpNhp11PrcrNnAkCkyNkDfD9/HseF4soTjQt5ZwukX3rnGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7404

We don't permit use of uncachable memory types elsewhere unless a domain
meets certain criteria. Enforce this also during registration of pinned
cache attribute ranges.

Furthermore restrict cache flushing to just uncachable range registration.
While there, also
- take CPU self-snoop as well as IOMMU snoop into account (albeit the
  latter still is a global property rather than a per-domain one),
- avoid flushes when the domain isn't running yet (which ought to be the
  common case).

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
At the expense of yet larger a diff it would be possible to get away
without any "goto", by moving the whole "new entry" handling into the
switch(). Personally I'd prefer that, but the larger diff may be
unwelcome.

I have to admit that I can't spot what part of epte_get_entry_emt() the
comment refers to that is being deleted. The function does use
hvm_get_mem_pinned_cacheattr(), yes, but there's nothing there that talks
about cache flushes (and their avoiding) in any way.

Is it really sensible to add/remove ranges once the guest is already
running? (If it is, limiting the scope of the flush would be nice, but
would require knowing dirtyness for the domain wrt the caches, which
currently we don't track.)

This is kind of amending XSA-428.

--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -589,6 +589,7 @@ int hvm_set_mem_pinned_cacheattr(struct
 {
     struct hvm_mem_pinned_cacheattr_range *range, *newr;
     unsigned int nr = 0;
+    bool flush = false;
     int rc = 1;
 
     if ( !is_hvm_domain(d) )
@@ -612,31 +613,35 @@ int hvm_set_mem_pinned_cacheattr(struct
 
                 type = range->type;
                 call_rcu(&range->rcu, free_pinned_cacheattr_entry);
-                p2m_memory_type_changed(d);
                 switch ( type )
                 {
-                case X86_MT_UCM:
+                case X86_MT_WB:
+                case X86_MT_WP:
+                case X86_MT_WT:
                     /*
-                     * For EPT we can also avoid the flush in this case;
-                     * see epte_get_entry_emt().
+                     * Flush since we don't know what the cachability is going
+                     * to be.
                      */
-                    if ( hap_enabled(d) && cpu_has_vmx )
-                case X86_MT_UC:
-                        break;
-                    /* fall through */
-                default:
-                    flush_all(FLUSH_CACHE);
+                    if ( is_iommu_enabled(d) || cache_flush_permitted(d) )
+                        flush = true;
                     break;
                 }
-                return 0;
+                rc = 0;
+                goto finish;
             }
         domain_unlock(d);
         return -ENOENT;
 
     case X86_MT_UCM:
     case X86_MT_UC:
-    case X86_MT_WB:
     case X86_MT_WC:
+        /* Flush since we don't know what the cachability was. */
+        if ( !is_iommu_enabled(d) && !cache_flush_permitted(d) )
+            return -EPERM;
+        flush = true;
+        break;
+
+    case X86_MT_WB:
     case X86_MT_WP:
     case X86_MT_WT:
         break;
@@ -689,8 +694,12 @@ int hvm_set_mem_pinned_cacheattr(struct
 
     xfree(newr);
 
+ finish:
     p2m_memory_type_changed(d);
-    if ( type != X86_MT_WB )
+
+    if ( flush && d->creation_finished &&
+         (!boot_cpu_has(X86_FEATURE_XEN_SELFSNOOP) ||
+          (is_iommu_enabled(d) && !iommu_snoop)) )
         flush_all(FLUSH_CACHE);
 
     return rc;

