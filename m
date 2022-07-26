Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9537C5816F1
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 18:04:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375498.607925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGN2l-0004tw-6g; Tue, 26 Jul 2022 16:04:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375498.607925; Tue, 26 Jul 2022 16:04:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGN2l-0004rh-3z; Tue, 26 Jul 2022 16:04:23 +0000
Received: by outflank-mailman (input) for mailman id 375498;
 Tue, 26 Jul 2022 16:04:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGN2k-0004qN-5c
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 16:04:22 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2070.outbound.protection.outlook.com [40.107.22.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c332135-0cfc-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 18:04:21 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DBBPR04MB7532.eurprd04.prod.outlook.com (2603:10a6:10:207::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Tue, 26 Jul
 2022 16:04:20 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Tue, 26 Jul 2022
 16:04:20 +0000
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
X-Inumbo-ID: 9c332135-0cfc-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ILxcUxJLb7q9yy1y5PRcRAIVslwpqfmSuIL82NVIb+nxzvFTOWy96TWhcL9gxtLE1C4Rg0X1fBOjk1C247J/R2nDegcPakx1HqE06PIBKSAdjG69n0enhms3AqnlmH40Ag9FPP/sZA3n7H+OwGShBNJQ7qIAKp0X4xpc8m7AgbVkqeMxcJg+SdM2niendm78S5KrACvCT95lUE93s71esZPhF8UVLHwEFrmREl5UTh42UK4JeUkin3wGXsHcyEBE8d0OQQ8t15bnsZq+jzfTOY91qW4bcpyeEsyrabA+6kzsQDmYS/83Mj6n3P+XcPi+dXriujYWus9LF5AQGFYBNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrAeJ+7JwL3BaEmhi04AyXYTC/yrxXIxXKPGzKWit1k=;
 b=JaE4PxB/feSaTEZa8MSQRCrS9wwef6BETjInWBg1M0Q+9/moESrHdqLYDZ8OGzrQehAeXgTJraA4plylB1qtsFyf5WTN/XTGBdOXeCYKy0dKU03cu/Vt426t7hXgC7GerfBssu9EgZEuZUxfqVlU8/HyjAsY/DQxqSfqrjt2C0mTLFkNLnQgjdYHmjRSY8qNOgCvr8SuqC3UVC2+O3K0PsjidVimG5e+aSsrsLQVwwcS/K2p4haoPwg5WE89yBZYeAlk1AHQkT7urzA4N5OOuUXO1yo2AVNXA/UkwvgMBtrInKovb0uYdRiVeFckqqx0XQLOWF7MZf+iPGCLGaGvyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrAeJ+7JwL3BaEmhi04AyXYTC/yrxXIxXKPGzKWit1k=;
 b=2hO1q4da9PgrGJOKCsrZvH5I8ssBkjwnzGbrYYtY6wr6x3hT/wzWlocQZpA3ZBjM+vbg8aHF6Gt7+Tl0VvrLWVNUdLIbS2+wu0mRNRtVfPjznFp+C9kq3n5Yn9ow/w+Onmd6aYnkkrbOVHDpPkVuV2ajilFQ4icBcp6lhpRxvxIN752512GaV3WnPqh+DdhI3x2xFN8+9aQ9/bRN8EI7vzeqc3EHxFaTUlzVDWgRwklnTTiodUIE2skTIVkqKlCyWTbBOND+0THc22CDRlmDAQK9x4vdHi97q4S1W5xstV51LE7gCPV6E+iUpnGBjF5ZvU9aR2H0bk1keYv80qXa5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c5797fa8-8ee1-7668-936c-392f8298dff1@suse.com>
Date: Tue, 26 Jul 2022 18:04:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: [PATCH 2/8] x86/shadow: properly handle get_page() failing
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <3fdfad2a-7891-0b08-5541-3b226e0555e1@suse.com>
In-Reply-To: <3fdfad2a-7891-0b08-5541-3b226e0555e1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0188.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::15) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a961b870-8995-478a-3513-08da6f207fc4
X-MS-TrafficTypeDiagnostic: DBBPR04MB7532:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e8qw2uv5ETEeFEMU8WfBMkRIPCFz4G2LadShFmtgnQ+gvYXn7z6/bp7uMkpbke25qc0IRkY3i96nLLGlevJUl6mG87uRxwvXykn37kDhfleLkhLF4FvwEMuVb1DE2HFt1H/W/JEWeQENIxdLwsJk7qoVBVDT89d9NdaGWobaHtteEDrGAA7kDZwhqsG0t43xEc3OVg6wLEOxnm758zGa9acasBJf05mJjcpYcZn5b6kpp5KQzX9tKukHA78EvfajgZlS++ux2EMAGMDC5l0xL3W8+9g2J9smafwr5+0g+1DhoWbDZtgGpPhTO4zpS6yc/d/OrNZsA8QD0elXbwuxMOzEowQ4H9dvQJZ4/z1cOpP/q2SafihTwWsWpuhisK1xYXPOMpo3Lf+mfErjTnFO8Q/MGgqAPRd1cWqFBa/cjvgEmTRnIoz9vhBXJ/ls6rXORBGEAUyzHNen5liDWs6ReFY90ZRQIwEJZk0wOGOgrLvuZXRElaf0kC/lCzVm7gzh8jJuuVTq8HBalljrd5fhoCO+bwad0oXzI24iKt8gX3ozxoEPwei9pfbtnB7K/ujPyhlAf9qI0N5zuYznrNMzvK1T4QxRRyavjG/7lskmmJsjhIDXwFTdeS2H5SXVUVkrHj1MvFsspIGuyb2yvpo9urM7l38Uhptdmy6KZ66QtqFiwLLuyaavZUrNnesZCWUEz+YC3YchaAYVqW1USoB97TxfDBfl1VcmfVPBIa1RhnJjZzNNMMgJACk22JJEX/QKKooYp4TWo+dwFjVsxYtZC9QlmOtokJbt8jxdRw4VJQhdQG/5fWgEyKcQDWbvn1HxfBRFOgYT98DEjF8aNvAwWg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(346002)(376002)(136003)(39860400002)(2616005)(316002)(8936002)(83380400001)(38100700002)(2906002)(36756003)(41300700001)(31686004)(6486002)(5660300002)(478600001)(6916009)(26005)(6512007)(54906003)(31696002)(66556008)(8676002)(66476007)(4326008)(86362001)(66946007)(186003)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWNFdlNrZElPZXRzeVNoMXQ4MjVjczFYdnM5d05GRC9kaExMUExReThWVng4?=
 =?utf-8?B?S3RvM0RoMTkxZnZsSnY1R1RQcWlVaGJiUE5saVhORTBqUTRUWWZucFJYT21V?=
 =?utf-8?B?WWM1SnNyWHBidFd0cCswSHhrUU9tK3RZUHVkUnM2bTRURHlBRWZ4c3Arb3Ev?=
 =?utf-8?B?NDhCUmo1RXNXZ2M1RWRPTlFDNi9CenlWYUovRWgzTWFqdkh5d3JTUkcvVXAw?=
 =?utf-8?B?RW1iMnU3V0VQWDZFUXFIMGhIcHFZMlREMCtRajRKRjZNc094Nnk0ajBpWmhO?=
 =?utf-8?B?L0lKdTVzM0UrQTJQNVUyRlROYzROYlFIY1ZNMDk4dFoyLzNtU0xXUFBlQ0o2?=
 =?utf-8?B?ay9mTEpnY3dzQjNWZFNrT25vanpBTWpyWlY3UEFvK2huelkxdGt5Q3htaXJ4?=
 =?utf-8?B?RnUwQm55eWJJa00rZXV6SGJCUWVLdVBpa1FHSlBnRm9jeEo1WWNLQXlHRk0z?=
 =?utf-8?B?TGZ1aUdRUExDQWhhVlhtMVJXcWw3cGZKRUdDUEhFMUtjM0tPNktTQTcwZzd2?=
 =?utf-8?B?NEh6VHM3RnByamhpcjV1SHVYQVhmUHdyeWpvVjkvZHR6QzlLaWh0ZnFibity?=
 =?utf-8?B?VWhoTVBhTVBadjNFL3gzOHhKLy9QWXNTY2hySXpURnNTWjE2ZlJ5dHdkcEJQ?=
 =?utf-8?B?dkxNMHByQ1ltaFdtY0UvMFI2VlNzSHlGMEl6SUx2SU1aUnRhMVEyWk9jSVlv?=
 =?utf-8?B?K2NWUjVURVJmTE5zOWF2RktCRjQxZkhpYVZxM2ZhSEZOOTZBY3Rad0VITkdv?=
 =?utf-8?B?SC9zM3hhcEhsdWtuNDhCbHNQejRkblc1cU5oOHp3RVZHc216UXZuQ1drcjUz?=
 =?utf-8?B?dTc1ajdCNk9ZaW5Wd0dWWE5TRDJOcXB2YS8ySHFzSlhrYkVJSnlJQTF4SXJv?=
 =?utf-8?B?MWkyYWR3Qm5QckViUVliOXN1b3hDaHFtbkFuU21EdklNQVJHTFN0b09jNWo1?=
 =?utf-8?B?WlNuZEZBVklkK0x2ZE1qdWhzU0s0cm9FeWVqU2VYMi9qeHUrNlpzc1RHTXlP?=
 =?utf-8?B?eFJoSGNhNTlwT1BDZXhvTm9TR1A0TlNxR29HanQ5Y3hoUWFNRytRWHliRG1S?=
 =?utf-8?B?OEs4bExaaThxY0g4UDRXdDJ5eFNEWkVjMXNuVzBHVWlhMWhoUzFWbUtEakVh?=
 =?utf-8?B?S3ZUbHlsU1Z0U1oxbnhLSlk5WXVBL28rQ1Z0emhtVnFnTlBnYVh2QWdJa0NK?=
 =?utf-8?B?aFdKSE9xT3NRQlFZRzkyUjRyZDlsS2x0MTR2RjdjU1JqN0RYQW5xekZwVFQz?=
 =?utf-8?B?MkhZOVVKQWpoVkJlMFdQUlBFNi82OXBMWUpMOVNudTlGSEpEWHFlUG51SmRj?=
 =?utf-8?B?WWUwdG9oazRIQVB1cFE4SXBuMVVJaTB4ck9jMkJvbko5QnJMRTh0M2xCejhY?=
 =?utf-8?B?aHEwMjZiTTN5Q3hpbU1hcjcvU3h2OHFzU1ZIbUZTc2Uvc3o0VkJPVkhsNGxj?=
 =?utf-8?B?M25ybXBLRVpFOFN6VTY3SDdxWlRaN3B1R3h4ZlVxN0RUblVVMSs0UnY1TExP?=
 =?utf-8?B?b3MvbE0yemtRV25pVTBKQW96QTZaWnhaQjZ3VEhSUUJHcm84enZxc2FyUWxk?=
 =?utf-8?B?bW5XVjFtcFdkTVNIYzg2REswekhadWhEVXhuNmVwVWJNMjNHdWxlQWFjVE1r?=
 =?utf-8?B?SWh0S0RxWVZtUVFrbm5HTTlwQVp3blk5a0N2WW1GblNTeHdPRkxJd1MxbHB5?=
 =?utf-8?B?Z0Y3V1B3NUtjdEtRN3F2aTVHT3ljQTd5NlJVdHRSYzhiT3NvRVI3a3QwWHZz?=
 =?utf-8?B?OGFBN21uM1B3cUdxRldzRG5LcGhIS3Y2MXlXZEg5SDhFVjRnZTdJaXpMOSs5?=
 =?utf-8?B?Y1NWVVBXbGc1WlBwMSszQnhhNENyTnhzTUtNd1J1VVF2SFg3LzlYVWN3M2Uy?=
 =?utf-8?B?VjRIUHV0QTYxTHdiU3lXeXdNRUwyTXhTRVhGbi8yOUo5dm1hL0Nwc1ZQdTNS?=
 =?utf-8?B?UHV2RkpXdW5HRU0rbDdwa1ZRZ0tsdWdETG9PY3NmbVh3R01jUHozdzBNK0M5?=
 =?utf-8?B?RnVRS05mbTIrZld4N1BiWmFhNnFDOU52Z250QThtM3plR2U3dG5kQkNJa1lQ?=
 =?utf-8?B?cWlOeFN0RjRtclFmWTMyUlhEVnZ3RGIxa0J4ajJvSzN4dks0NHFXRTRmbkdE?=
 =?utf-8?Q?hyn0ca5/7Kq6oEn5o4ZTEN9Yz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a961b870-8995-478a-3513-08da6f207fc4
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 16:04:20.0485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JO9FxrYO8nc0Okp9G8Xi5sRPolurkK9QHd0xYEfbgxPPScWEgcbwTyCxia7U9U+NKxF6lqZbvLBnv4xpYFPlXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7532

We should not blindly (in a release build) insert the new entry in the
hash if a reference to the guest page cannot be obtained, or else an
excess reference would be put when removing the hash entry again. Crash
the domain in that case instead. The sole caller doesn't further care
about the state of the guest page: All it does is return the
corresponding shadow page (which was obtained successfully before) to
its caller.

To compensate we further need to adjust hash removal: Since the shadow
page already has had its backlink set, domain cleanup code would try to
destroy the shadow, and hence still cause a put_page() without
corresponding get_page(). Leverage that the failed get_page() leads to
no hash insertion, making shadow_hash_delete() no longer assume it will
find the requested entry. Instead return back whether the entry was
found. This way delete_shadow_status() can avoid calling put_page() in
the problem scenario.

For the other caller of shadow_hash_delete() simply reinstate the
otherwise dropped assertion at the call site.

While touching the conditionals in {set,delete}_shadow_status() anyway,
also switch around their two pre-existing parts, to have the cheap one
first (frequently allowing to avoid evaluation of the expensive - due to
evaluate_nospec() - one altogether).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1581,7 +1581,7 @@ void shadow_hash_insert(struct domain *d
     sh_hash_audit_bucket(d, key);
 }
 
-void shadow_hash_delete(struct domain *d, unsigned long n, unsigned int t,
+bool shadow_hash_delete(struct domain *d, unsigned long n, unsigned int t,
                         mfn_t smfn)
 /* Excise the mapping (n,t)->smfn from the hash table */
 {
@@ -1606,10 +1606,8 @@ void shadow_hash_delete(struct domain *d
     {
         /* Need to search for the one we want */
         x = d->arch.paging.shadow.hash_table[key];
-        while ( 1 )
+        while ( x )
         {
-            ASSERT(x); /* We can't have hit the end, since our target is
-                        * still in the chain somehwere... */
             if ( next_shadow(x) == sp )
             {
                 x->next_shadow = sp->next_shadow;
@@ -1617,10 +1615,14 @@ void shadow_hash_delete(struct domain *d
             }
             x = next_shadow(x);
         }
+        if ( !x )
+            return false;
     }
     set_next_shadow(sp, NULL);
 
     sh_hash_audit_bucket(d, key);
+
+    return true;
 }
 
 typedef int (*hash_vcpu_callback_t)(struct vcpu *v, mfn_t smfn, mfn_t other_mfn);
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -132,7 +132,8 @@ delete_fl1_shadow_status(struct domain *
     SHADOW_PRINTK("gfn=%"SH_PRI_gfn", type=%08x, smfn=%"PRI_mfn"\n",
                    gfn_x(gfn), SH_type_fl1_shadow, mfn_x(smfn));
     ASSERT(mfn_to_page(smfn)->u.sh.head);
-    shadow_hash_delete(d, gfn_x(gfn), SH_type_fl1_shadow, smfn);
+    if ( !shadow_hash_delete(d, gfn_x(gfn), SH_type_fl1_shadow, smfn) )
+        ASSERT_UNREACHABLE();
 }
 
 
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -375,7 +375,7 @@ shadow_size(unsigned int shadow_type)
 mfn_t shadow_hash_lookup(struct domain *d, unsigned long n, unsigned int t);
 void  shadow_hash_insert(struct domain *d,
                          unsigned long n, unsigned int t, mfn_t smfn);
-void  shadow_hash_delete(struct domain *d,
+bool  shadow_hash_delete(struct domain *d,
                          unsigned long n, unsigned int t, mfn_t smfn);
 
 /* shadow promotion */
@@ -773,18 +773,19 @@ static inline void
 set_shadow_status(struct domain *d, mfn_t gmfn, u32 shadow_type, mfn_t smfn)
 /* Put a shadow into the hash table */
 {
-    int res;
-
     SHADOW_PRINTK("d%d gmfn=%lx, type=%08x, smfn=%lx\n",
                   d->domain_id, mfn_x(gmfn), shadow_type, mfn_x(smfn));
 
     ASSERT(mfn_to_page(smfn)->u.sh.head);
 
     /* 32-bit PV guests don't own their l4 pages so can't get_page them */
-    if ( !is_pv_32bit_domain(d) || shadow_type != SH_type_l4_64_shadow )
+    if ( (shadow_type != SH_type_l4_64_shadow || !is_pv_32bit_domain(d)) &&
+         !get_page(mfn_to_page(gmfn), d) )
     {
-        res = get_page(mfn_to_page(gmfn), d);
-        ASSERT(res == 1);
+        printk(XENLOG_G_ERR "%pd: cannot get page for MFN %" PRI_mfn "\n",
+               d, mfn_x(gmfn));
+        domain_crash(d);
+        return;
     }
 
     shadow_hash_insert(d, mfn_x(gmfn), shadow_type, smfn);
@@ -797,9 +798,9 @@ delete_shadow_status(struct domain *d, m
     SHADOW_PRINTK("d%d gmfn=%"PRI_mfn", type=%08x, smfn=%"PRI_mfn"\n",
                   d->domain_id, mfn_x(gmfn), shadow_type, mfn_x(smfn));
     ASSERT(mfn_to_page(smfn)->u.sh.head);
-    shadow_hash_delete(d, mfn_x(gmfn), shadow_type, smfn);
-    /* 32-bit PV guests don't own their l4 pages; see set_shadow_status */
-    if ( !is_pv_32bit_domain(d) || shadow_type != SH_type_l4_64_shadow )
+    if ( shadow_hash_delete(d, mfn_x(gmfn), shadow_type, smfn) &&
+         /* 32-bit PV guests don't own their l4 pages; see set_shadow_status */
+         (shadow_type != SH_type_l4_64_shadow || !is_pv_32bit_domain(d)) )
         put_page(mfn_to_page(gmfn));
 }
 


