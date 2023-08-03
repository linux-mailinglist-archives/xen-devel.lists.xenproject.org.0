Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5839C76EC1C
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 16:14:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576412.902525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRZ6D-0004RR-94; Thu, 03 Aug 2023 14:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576412.902525; Thu, 03 Aug 2023 14:14:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRZ6D-0004Pj-6I; Thu, 03 Aug 2023 14:14:45 +0000
Received: by outflank-mailman (input) for mailman id 576412;
 Thu, 03 Aug 2023 14:14:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRZ6B-0004PR-TH
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 14:14:43 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16b7cebc-3208-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 16:14:42 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7977.eurprd04.prod.outlook.com (2603:10a6:10:1ed::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Thu, 3 Aug
 2023 14:14:39 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 14:14:39 +0000
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
X-Inumbo-ID: 16b7cebc-3208-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GwNT9JX8K3CRQToDzYxMD9EadIOu/g5BF6Bm0WuNBEdBOcNYyNt2ymIhdB5J37/pIuncLk9dfFTwNtRGakqARelboufr+l8oMtNssJSl8fjL8XJgUCX96A29WnsI+yYi5ngNlesk1MFkkVXVXa55MmbCNfDz9b5B6V7JyKlKGxnt8daWgN4vhj8Xxnvh/kYqzW2kIQdjO6hD3g/39YW0N9TN2XSSl+ELszDb69ruDzLBNDOr2h1OYOEf4nwhNBbG9I/8417vcdNoT1cPFPgouD56AQ4Iba3jZmxqwAJqZncNWr1FYSSu9JwFaJe4jsPbPQqvuw77LbmQdWIMRgXZLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=obCL3PCbJvdo09qNGQHUZs/QI2sBpH+PLePc5+Lcf4A=;
 b=F4pOvQwExrI7HTobvqoASa+gBHzt0fnxcFxySBveCjFr+JmndqGavYVJYr8f5jVja55kEXH8ylDBzJfCrqqfntUGt1A4cwJa8MHxW43b7QvGHn7TgVqTNbi9KS4DdlWvfLaueMY2HT5kz1IYgnAc3RSdac7hPKotaGYlRAPBDo/504XHiwTaG0Mon049KcC/gW5XxcNWU1RqypC0R5oTmcphre2JfqiC2/8OlEpLZ8qKOuR8b8slps6AKFd9DPIAz3/EXm3FXZkVBQyZm5eo0tcqayg7X0SCUpr6u7OWdBZJNyN+K2JQYsnMnq9s1qG7AtpWzH7j+lbLdmpB/YMIkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=obCL3PCbJvdo09qNGQHUZs/QI2sBpH+PLePc5+Lcf4A=;
 b=R126oDAvSMVh8KZRjeu3GFu0f3GNEcUDviUZ3zodrMhdV1/pR80ksv2aKnJlKU7fp/S6sbcdm3DqRw78EoKjjNtn2mE+LjfLH6eYRLbEFhOCcxevlMWDuUShLc5nGAt3+9u5jd3N4olwOG70WDgw4Ki76TLDxI1n9HOsF4XfOx8qdO2TtXkQr8CFdiHmnYIqpa4T5tZEh0BnKNt110gR3u4zNZ4iQnuzFLpSlvAznWjevlcMuLfb+4MwcvIG4o9w7xxAj8xNj3b9DtSktl+1yq23Unqjkj3CzaHnTX0CwHmToN/apG/RMtvr9cSop1waqyMlnrNbWVMdc0NHMtm4pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <71b20ec7-fcc9-9c24-2cad-fca64e949e44@suse.com>
Date: Thu, 3 Aug 2023 16:14:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: [PATCH 1/2] libxl: avoid shadowing of index()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <226f087d-34b1-1a27-4048-f9c6ce3d2d76@suse.com>
In-Reply-To: <226f087d-34b1-1a27-4048-f9c6ce3d2d76@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7977:EE_
X-MS-Office365-Filtering-Correlation-Id: e7015116-2dd2-4160-1756-08db942bf96d
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wQx/X7ukQMD7pOoXikMc7NEHJk217CJ2FVTlKxd0dyzde3f0B5weKcD15kWJjMtnMQNYZSnJWU6R9BfKDXRdWmx9/oPFn7HfwsbzY5tR5wojU/85aKfIgjDwN013Q16mBeyTgBmg5uw/ta24eJwCMuwk0LAOVpOj4F5kSB5ZHhU7IbCXOg3xgjJ++rR6OJL+7h5CHMfs5gWG1bXXcxY1dXLFg5jBjRtK4njrZFXf5NaNEXXPSnJqtS1IMmIIifUVaXA6fwItAB+Wl2nSsW1qM2peIuvqrTdlezq6bMH+iVTdwrXf4LG47LkMsEoBYBtXCcJD9lREXjiTE39tyOD0zPVhPFhxy69LjjYKe+qnXveOhOctqo4YqeymgkRnaoYZXEsTelTrghM1Fmrt59gpQhSjzw5LRD0jxMxQigGrwhZxfmRkSpY+SvfVLkuQ2Z7u7BMSRiWcgmFaNfX6FjsjD4GeWWRhC/VX01QqAXnPznESeNW2Wi5An1Nsl7edyBuENHUjEZQqgWK4RBaFFgxcWGTtZkcA2mWajWu4ipy5YDr6alMujla6l1dtcAY951Xm0A7l0hmBDEowJtA5Gy1ownSNXoyzFYr1ubrEeYVjgGjL/ImCUI53m7ffV2RDgSK31P6hRjrdv7PuX9HHNaLPqg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(136003)(39860400002)(346002)(366004)(451199021)(54906003)(6506007)(107886003)(26005)(478600001)(2616005)(83380400001)(6486002)(36756003)(4326008)(66946007)(186003)(38100700002)(316002)(6916009)(66556008)(41300700001)(66476007)(86362001)(31686004)(6512007)(31696002)(5660300002)(8676002)(8936002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bk8yNDBheDVBYVgyNGlyVWlYKzVMTSs2TnBqSGNBa0NtektLanR4cnBDK1hr?=
 =?utf-8?B?YmJJZkZmQTFCdWFZTkZQdzFlaCt0bVc3QmdNczFVOHYzRldnWFB6ZWZhOGEw?=
 =?utf-8?B?b0tPNDkxZzIzVlZyb3RiRmZtNG9WUXB5L2N0YmlySW83bG1VSlY4ZzBTYmFU?=
 =?utf-8?B?dGZSN3Rnbjg0TXdkenpKVUhjbUZ5RDlxVEUxWUpjZW1nTFlpUlRQSVdKMWF6?=
 =?utf-8?B?Rlo1K3Q5QTNIUWxjSmxaWlBqYlVrcEN6Q2d1Nm10UHM4K0c1YndRREdyQVFp?=
 =?utf-8?B?TCs4c3l3QWhoaGZpc3FiQzFyRVhVU2FyUE94K0hUOWo1ZERQR2xWVk5JbDF0?=
 =?utf-8?B?WGFzbTI0cFBzdCtKT3BVVTlXb29ua0F1WlFmZ3ZxcllaNkp5SWN5OG5oaFdE?=
 =?utf-8?B?TWxESytDR3NTTVdpbWF2aDlSZS9OSXk3ckxrWG9scndnMW1hQ2xzRnZSMk1O?=
 =?utf-8?B?TkcwWFNrVHRnSkdDYnR2bWozYjFUWk9SWkRwU08vVE94dGIrb0FwWDdlU0Jy?=
 =?utf-8?B?VC9SYXFBcThNa3NFTGVSSHpVdWhUVXpKa2pjWGhScVRXYmlzQzh0YUlNSTlt?=
 =?utf-8?B?YjNLSkhLQStKT1FjbnhZQ2FGY1pTTHdEWVg5TVlmWEpzSjFDdzRWa3BTOXhI?=
 =?utf-8?B?ZkNWR1huak5pa2FvcStqdjlocEUxK0dNMFpmQmE3TmJkRHlSSnhBNDhYNFY4?=
 =?utf-8?B?NU5sRy9oZi8vYVdyWWpuY0ovZllIKzM5OXY5NHNQVFRqNThQUFZ0TzJHaERy?=
 =?utf-8?B?QVpZMVlGSDY5VHVETFJmZkI3R1NULzNNaVVEZmZnZGZlZ2FkUVVVTzd3d3Jm?=
 =?utf-8?B?U3BTNXBlK0l6cnJqRzdrUTYweC92bW9mQitldFVIK21uWWs3UnpLdHlEZTQx?=
 =?utf-8?B?TXJFZ1dnbUVYMVhDelRJQTRqVGdweTRsaXltSVZVS050aU5HUVdpVmZ5VFhj?=
 =?utf-8?B?NEt6dzc4Si8vdWgvWXRUQ0ZvdzMxOEIxamZGU05qL0xiOXBxa3ZnVGRtUnBF?=
 =?utf-8?B?TmRwWG1BOWJsSENPWmlUbm8rOTRDM3hjb2VpQ3crWUxyWVlmZFl2UStDeVk0?=
 =?utf-8?B?bEVMbndPbS9kcWR3YmttREg2SXJlQVMzUkpSM29HeGFDZElCeUlkZVAxK2du?=
 =?utf-8?B?MHlHNDNXOXpvenN1bHBRSlpVemN4b2p5d0drRlV6a2NLTjhJdERXcFpNNEl5?=
 =?utf-8?B?WHdrVkNDU3AyUkVXMEhEeE5XUzJGa1VCVHoyUEUvTnFWZk82WEFXMUdGcHRn?=
 =?utf-8?B?c2NFZFZ4V0MzbHc5Qkp2WDFSVkljRHB1M1V0WTdsdFZ1cFVEcnB5Nm82c3lh?=
 =?utf-8?B?RWh3bnh2Y3VETkE3ZTNwT09jV1I5MEVWcTM3MVViUmZEZkVSNHB6UGx0aFda?=
 =?utf-8?B?ajYvbCthaTI2NnFLcnIzZ2s3YjZlZjd5WmdBUXVhdkNpbExhTmRtZXAydkRp?=
 =?utf-8?B?bmNSTnp6SU1rNzhvUlY2NTdaOGZHc2Z6WEx5T20xV1ovbE1hdHdxaTB0Nldn?=
 =?utf-8?B?MTRRVW9VQjcrMmp4cXVvUmxsV0trOC9KbHIrNGZiRDNzbS8yVkpnOURSYjRh?=
 =?utf-8?B?ODllRTJPaGNxSkVsWlhqWW1GR0JJamx1Ynd4bGtXdEZMRTNaTmRwMnN4bkdM?=
 =?utf-8?B?bmhPVWoyVWUzSTd0S3o5NzhBOFZ5b1J3Q3RoMGlhRmhjeW9vTUlUSlpmeXhv?=
 =?utf-8?B?M0dEU0hZOXNPRVBtck9jbEVFdnJpMzM1U0JCYVZJNzFDVXg3MWVjRTRBU241?=
 =?utf-8?B?dEc0WHF6UjRvYlBWNS9NSmtlcjNSN1RMbHl1YTN3OUlONnZUN295MExJRlZQ?=
 =?utf-8?B?Z1pHSElMREEvQytDZTRJUW1FNkgveUM3Zzl4aFVaNzZXRDBCS0R2dVZ4RDdF?=
 =?utf-8?B?TUNKc3FWVnJPaXIvSFo1bTU1Z3ZQdnZ2KytlanNjYzdzTERWZ2lZSU15c2lZ?=
 =?utf-8?B?azE0QjRocjNhYXhSQ25MT2FtbkNweWl4bXl1clVVTDFmWnRoLytuMDBlc2xL?=
 =?utf-8?B?cGx6MFhoKzRRai85eHNkUWxHMllFWGsxOEQvRFo3YzdsZ2EzczVjek43Z1Fm?=
 =?utf-8?B?Q0ZaSHRyQTRSQ3hnSmhRUm1jK2RiMm9DaWx2MXZZbjNrbGR4UjNGNlJhaFN3?=
 =?utf-8?Q?5jFSnjgvE/iYiub4lE6Q4DRyr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7015116-2dd2-4160-1756-08db942bf96d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 14:14:39.3365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m7/3v/uTBdNZrag3J7Gs528LhElzmteJz76NyCFw6jpSfoTisOAso8cVYreeVzPOnOZTPDJmaV691H3QveI6dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7977

Because of -Wshadow the build otherwise fails with old enough glibc.

While there also obey line length limits for msr_add().

Fixes: 6d21cedbaa34 ("libxl: add support for parsing MSR features")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -157,7 +157,7 @@ static int cpuid_add(libxl_cpuid_policy_
     return 0;
 }
 
-static struct xc_msr *msr_find_match(libxl_cpuid_policy_list *pl, uint32_t index)
+static struct xc_msr *msr_find_match(libxl_cpuid_policy_list *pl, uint32_t idx)
 {
     unsigned int i = 0;
     libxl_cpuid_policy_list policy = *pl;
@@ -167,14 +167,14 @@ static struct xc_msr *msr_find_match(lib
 
     if (policy->msr != NULL) {
         for (i = 0; policy->msr[i].index != XC_MSR_INPUT_UNUSED; i++) {
-            if (policy->msr[i].index == index) {
+            if (policy->msr[i].index == idx) {
                 return &policy->msr[i];
             }
         }
     }
 
     policy->msr = realloc(policy->msr, sizeof(struct xc_msr) * (i + 2));
-    policy->msr[i].index = index;
+    policy->msr[i].index = idx;
     memset(policy->msr[i].policy, 'x', ARRAY_SIZE(policy->msr[0].policy) - 1);
     policy->msr[i].policy[ARRAY_SIZE(policy->msr[0].policy) - 1] = '\0';
     policy->msr[i + 1].index = XC_MSR_INPUT_UNUSED;
@@ -182,10 +182,10 @@ static struct xc_msr *msr_find_match(lib
     return &policy->msr[i];
 }
 
-static int msr_add(libxl_cpuid_policy_list *policy, uint32_t index, unsigned int bit,
-                   const char *val)
+static int msr_add(libxl_cpuid_policy_list *policy, uint32_t idx,
+                   unsigned int bit, const char *val)
 {
-    struct xc_msr *entry = msr_find_match(policy, index);
+    struct xc_msr *entry = msr_find_match(policy, idx);
 
     /* Only allow options taking a character for MSRs, no values allowed. */
     if (strlen(val) != 1)


