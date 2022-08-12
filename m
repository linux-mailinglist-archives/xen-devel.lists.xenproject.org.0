Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A93F590CCC
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 09:45:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385364.620989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMPLp-00015D-CF; Fri, 12 Aug 2022 07:45:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385364.620989; Fri, 12 Aug 2022 07:45:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMPLp-00012v-7u; Fri, 12 Aug 2022 07:45:01 +0000
Received: by outflank-mailman (input) for mailman id 385364;
 Fri, 12 Aug 2022 07:44:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yzoh=YQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oMPLn-00012b-TE
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 07:44:59 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10052.outbound.protection.outlook.com [40.107.1.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9a37fad-1a12-11ed-924f-1f966e50362f;
 Fri, 12 Aug 2022 09:44:58 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8646.eurprd04.prod.outlook.com (2603:10a6:10:2dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.25; Fri, 12 Aug
 2022 07:44:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Fri, 12 Aug 2022
 07:44:56 +0000
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
X-Inumbo-ID: a9a37fad-1a12-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KmF3ICwdXbCb0LihB5VXsMyWCDhnKfZ4ER3GffL8gGLBCf3J6yMJQcSAQtRQ2SPwpX1BGC2SiBGbNGrBviMvNmqK7cg4YPVoX7pB4NgU1fBX0O/wdabeKhbJ/g4GTxDWKKzOdIZwxYb0eUPMW8bfasRP7WhYK9cXcsUJx81CLsrLT+iSfDvxqB2cAFCEmx/HrdreBIK5RtZcsr5Fn2IKgyaV68kkz3S5BudYbKpjKgfIwX5M39U4r/JUGZXGpnn4wWQuWNRaAWHdoAqZnEaLmGHlH/Z51XKpHt6R+j3n8dyUzQgaOBwgbiutUFaaR74jZH2l8ZJa6J3fEsMuwmS9Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxtZ+MVir5YJsKHAmigIFPCuHzEhnPOLkFiSiePFqik=;
 b=J6KXikWLHwtE2JTraQSkyvX8cX9I7Aeboktc9uYmPzqGPMfJ6u+MaXLKqxoyujyP8FiyRvqe8JZ1L5Cmnl3G01kDID4BZe3QsPVM6BwOgHqyNC9t2t4ogHsWu6gI8kSqxquXDbbCOhlkXJBj/dn0ZuGo/yP5HdVGcwmfLxhj/zgv8uO8P6dDAHF1WdDiEVXME6t+EucbbU/sERt83jqYYhefXB18AuHhkjQbPf6HrSawSb2XkhNKTRigljL9TsiI6pLzITRgk9gERWpJnJzgNEr8e0Ou2GeRLi31518GuGe1AwVC6axy9SLKQ3npa1uS/DmKO9BEMjjrLxLXGtT2Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxtZ+MVir5YJsKHAmigIFPCuHzEhnPOLkFiSiePFqik=;
 b=mx6d0+mjsIetwq54AAg8rEAaJCK/wSPhd0z5TyPIv31i7g6ebDFWY3FFoh4IQ0qgq5gk2LXXhDWxG/60FjsdxdjIsS4p0RczFRQF7gA3Lp40PUDo7TYxB7iRA2HZ0yO0ZdH8y6WAQUqctFMIHWpAry71gFbbi7hzkmxKT+rewDVnKXO9FwexeHVa4UHemwO1fl6Beae4NFbDiX8H+LUwmX4ZZ0q6uLk0p5yTq4Jy5qi1naVktP2fvynC2YSMXRCLFeLvW5EpAG67wivUtS4ld6gKVh5zkmYk9jqXqd0sn44koBWHC6Ck0eEVRfZd5xYaOpZjDRICvak0nvYvSwfkvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <761cfc4a-d9b5-4aef-d1ef-0ef408046a68@suse.com>
Date: Fri, 12 Aug 2022 09:44:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: [PATCH v3 3/4] x86/shadow: slightly consolidate
 sh_unshadow_for_p2m_change() (part III)
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <1522137d-cfa9-22e5-64e8-b1795ddbce21@suse.com>
In-Reply-To: <1522137d-cfa9-22e5-64e8-b1795ddbce21@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82a13475-de44-4847-1584-08da7c368d25
X-MS-TrafficTypeDiagnostic: DU2PR04MB8646:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S6ZLNojawJSRMBNY9uHR05PS+FETHgrxpUFitzyETjnfLKz0sR+UJdrBWcJGkrc/quVcR1Dwc9WR91opbdltmjhT/nORr9ohRP1mx9wZph+Mre5p9qjsvroQz8URetGRX8opwVAPmV8KY8nJiiAlHjClAp6rR0HIQ4UE/QpFz5skKPLFq7XmcDOKHSpvbvrpspyic51eTeVQ4KZcHGSzGLwqYCeCTbTttKJjBoKvUXR3XNS2CRAp0AQVoruO70bbxKDvbnwChhEywcaRz00DuIPeHOVCqlKneCdiLP7HvGauMvCfjvuEPJ19dOn3rzwwzI18gSQbCxCRf7YYY+GPQmKTqINhMONzH1NvFjrSdlh9isMv7LFp8zm7AZM4aYJmateQQQPlvjxBV3+qLv+twf8BoaIyVZSyl5ywKaaxPb992X9DouCJ3ZPRLvU9k3FksfC8rIhmxgsth6n5cwm29Saqdrldmu1sF8x3Me9uEKDAamMfHkwvYkd47nwhCH5beIJK6IBbtTiMQTMplXM+z0yeY9P0XjzynMZett42MP2aBzSdvb/xPHyVDZkDCTJTn90YDi5XYcQLDgRmF7ZRw1NFZw/BJls3t8ypxJ7k3RKUieigUaiOsjUCUw9K72Bn4OKKfZPK5OohvpHr9aZZd4cVkEgfGhVQz2WEzYDjR1mnKWun5iFlV3Tn/zlK15gpF9FCw2WETP5LENtwFh3/8ecNxiYXIF3mqh0dhKQDgyp7HbLoz3Pugnq3IOdLoE2xgoo0LOlQn09YkOF+PZEGylKeMo76wzTLAr0JfL3/NGxLnQR5bxFx6dL5f5Zzagt97wqmHp2SUq0FU213yPj3qX5vB1sbnz2sJM529k7op3YSkwBIWvFQZQqxG1EsHA1E
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(136003)(346002)(396003)(366004)(6506007)(8936002)(26005)(6512007)(54906003)(6916009)(2616005)(5660300002)(41300700001)(6486002)(86362001)(31686004)(36756003)(478600001)(186003)(31696002)(316002)(2906002)(38100700002)(4326008)(66476007)(66946007)(66556008)(8676002)(70780200001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWhSRFBPRUcreWFURmZZYk02Vkc5cmFQT3dpdHU0d1haUzlvSEIyd1BKL01F?=
 =?utf-8?B?TXp2bHp0WkRQTHA0eHVoSEhNWkUvQ2pVNzgrNmJza1huQU1qYlFRaXZTRGF4?=
 =?utf-8?B?TUVqYUo1V29XOEFhaDBMMzNUZUNXbFdNelB5c24vck1valhpMlN4azBMR1Zt?=
 =?utf-8?B?amJONW83YkllQ0I4OG4yVDVCbmRXdjlJNXRnLzdOd3ZJWEJ3ZHBtcW1JZ0Z6?=
 =?utf-8?B?T2F2RmgyUFZDQVM1c2ZYZkp4bm0vRFRQZCtGUW9TZ2l2QlVXRFRMcUMyWVZi?=
 =?utf-8?B?WHNGU1JIRWRNY0Vud3hBSDNwUGYxKzcwTXl4cjErVDNISExvMktxWmlRK0lj?=
 =?utf-8?B?cFdZSE50Y0hXQlg2MC8xRjZWcEJxSUVKamNzcXVoSzJhaHZrZ3o0Y2N5MFVJ?=
 =?utf-8?B?UFVFQU1UNHV2bWNuU3FtbmlVcC9MUU5LQzRLOGZVbXlER1U2aCt4U1R6M254?=
 =?utf-8?B?MWF0SXdFMUhsUWl6aXNFanFVbVZ4UStFU2pocklHRldlODRrQjZZdXpGZG81?=
 =?utf-8?B?QnhheVAxOU9saTJqRVZCQ0VyMldQWG0vZWhzbE45Ri9NNHdncnhkQlhvalFL?=
 =?utf-8?B?QkhQSE9oSU5YVkIyaHMweG5sNGJsUUttSHkrM0NaNmU4a0dnbDRqaHp0YXpV?=
 =?utf-8?B?V2RSOE4rZml6L3c5dXZZVlkyMkIrNlptTEtRNERxVHlFNTJEM0RuSlRZaXNl?=
 =?utf-8?B?alhJcTJhc2FDaWYwOUdJc0VHVFhkdlIyS0ppU2M0NGRjOGs0dXdkM1FDZVBL?=
 =?utf-8?B?SjNUVDRiS1dqQU94RDI4c0dYM05NajlkN3VrWVJpU2lQNFh3ZllkcE52emlm?=
 =?utf-8?B?eWpTYU9McExnS1FJdThhNWRSNTJLT3dRRHdtUGJRNFZXRUpObXBtL1JKYmMw?=
 =?utf-8?B?L3p2WmZXTWt6S05YZStMVWV4RGpqWXlWcllTa2JqTVFKNXc4V1BuVTN1T0pH?=
 =?utf-8?B?RVB2bmlFK1lUdFk2eVp5TW1xRzVoQzR1M29jVVdPYy9DaW55QUVvOVRiekdx?=
 =?utf-8?B?eFV6WkNVdU53Qyt6NFhtUExaNHU4eDFBV2hFYjE5ZDBDWVVneC81SzZRR2xi?=
 =?utf-8?B?RjRRV0RiYXl5WlZ4WFFiMWtDOHgxQTNndzhrcWdBR3RMU0ZBUERjOGdSU3Y4?=
 =?utf-8?B?ZExLUjArcUVYVzAwMXQvRnRRSUxzaFNoRmhnaGM2Z1oyakNGbTZiajdTRGlM?=
 =?utf-8?B?TllXRXZXNFdnckFDMWJRL2RyODF2UjRjdXk0YUtXZEJWWHorQ0UwNnp5YTZH?=
 =?utf-8?B?NVZsM096YlppdDJuNkpVZ1FvRXdHL0tuRHV1WWlJVVFUdGNyNWtUNXlqMkZV?=
 =?utf-8?B?TVZTSXFkRXJYZXVURTRtWEVFQXBPUVVzd3FFa3Z6NVlOT0lPR2gwaGNxZXYz?=
 =?utf-8?B?cDJuWUdONThBZTFxYXhjUUhRQ3Z6MjZkYWVkZHFrMmJ2UVFBQXlmNlRrZEFw?=
 =?utf-8?B?YlVOMk9rTWk0eUVzUExTa1hIREM2cVJSc280eVB2RHdweU5aaGd0d2FYbEo3?=
 =?utf-8?B?OUQrMmRBUjQzSFcxU2pqT0hUR3hhSFh0ZWYwUVhzb3A2dU43bDZ0TFR5WUZr?=
 =?utf-8?B?ODh4QjRTNTdMSmhEZnpodVhyZXQzdmRGQnZXWHdkWEMzM1Q1TEg3T0NIMEtx?=
 =?utf-8?B?SEFqWERibk11eUxkOHhyRWwzb21WNDBDR3pGMUJaeWFNS0xrZDMvS1N0R3Fo?=
 =?utf-8?B?bWlodU4ycGpXYXQ3Tm1lMllJYWJuK0VGME9MTGxxdGcvdXlkZUFHbHFEQnBQ?=
 =?utf-8?B?bm1xQTVub0ltcEJqdjZxQWpiWmVMajBTOElRV2Y0eHpjdE1rVWc3ZkNYUTJw?=
 =?utf-8?B?VE5HK3pFK0g5ekJycnZqdDhxYitHZnAzNjZVZzB0M1I0VXlBYWVaNE9vMEE0?=
 =?utf-8?B?NjZ4MnEwZHlCalNsRE1pZ2IwZk4xQXhGaUNsYXRva0diUUIrSHdvNWY2M0Nv?=
 =?utf-8?B?WW5DVWlUWm9OMkJpVnZaL2JINGJBZ0dPc0p2T1lZcEUzb2lhTURkNnBoaThG?=
 =?utf-8?B?ZGM4R3B1SnQzSkZsQVQ4WjJWcmlTL05hY0FNM2E0anBrTjRXWVE1WnNVbXQ5?=
 =?utf-8?B?MHBYcGF3VUxxSkMyQkNFYno4TVpjdFZmZ0ZPTysva0s2a1U1dUlMSDJVMHNi?=
 =?utf-8?Q?+wclcR5BnNI1iN4NjubXic1S3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a13475-de44-4847-1584-08da7c368d25
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 07:44:56.5379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a4nJuCAQ6o0FUE28BcK2WbZaUIa68seh8r8ILxqmgeMPZm3yW6658oLWS9AL3mKdYJ4jv6PezLnt3LXzHZ2aBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8646

In preparation for reactivating the presently dead 2M page path of the
function, also deal with the case of replacing an L1 page table all in
one go. Note that the prior comparing of MFNs to bypass the removal of
shadows was insufficient (but kind of benign, for being dead code so
far) - at the very least the R/W bit also needs considering there (to be
on the safe side, compare the full [virtual] PTEs).

While adjusting the first conditional in the loop for the use of the new
local variable "nflags", also drop mfn_valid(): If anything we'd need to
compare against INVALID_MFN, but that won't come out of l1e_get_mfn().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Compare (virtual) PTEs, not MFNs. Correct MFN increment at the
    bottom of the loop. Respect PAT bit.
v2: Split from previous bigger patch.
---
The two mfn_add()s dealing with PAT aren't pretty, but short of us also
having mfn_sub() the cast there is pretty much unavoidable (alternatives
not really looking any neater).

--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -844,40 +844,65 @@ static void cf_check sh_unshadow_for_p2m
      * scheme, that's OK, but otherwise they must be unshadowed.
      */
     case 2:
-        if ( !(oflags & _PAGE_PSE) )
-            break;
-
-        ASSERT(!p2m_is_grant(p2mt));
-
         {
             unsigned int i;
             mfn_t nmfn = l1e_get_mfn(new);
-            l1_pgentry_t *npte = NULL;
+            unsigned int nflags = l1e_get_flags(new);
+            l1_pgentry_t *npte = NULL, *opte = NULL;
+
+            BUILD_BUG_ON(_PAGE_PAT != _PAGE_PSE);
 
+            if ( !(nflags & _PAGE_PRESENT) )
+                nmfn = INVALID_MFN;
             /* If we're replacing a superpage with a normal L1 page, map it */
-            if ( (l1e_get_flags(new) & _PAGE_PRESENT) &&
-                 !(l1e_get_flags(new) & _PAGE_PSE) &&
-                 mfn_valid(nmfn) )
+            else if ( !(nflags & _PAGE_PSE) )
                 npte = map_domain_page(nmfn);
+            else if ( !(mfn_x(nmfn) & (_PAGE_PSE_PAT >> PAGE_SHIFT)) )
+                nflags &= ~_PAGE_PSE;
+            else
+                nmfn = mfn_add(nmfn, -(long)(_PAGE_PSE_PAT >> PAGE_SHIFT));
+
+            /* If we're replacing a normal L1 page, map it as well. */
+            if ( !(oflags & _PAGE_PSE) )
+                opte = map_domain_page(omfn);
+            else if ( !(mfn_x(omfn) & (_PAGE_PSE_PAT >> PAGE_SHIFT)) )
+                oflags &= ~_PAGE_PSE;
+            else
+                omfn = mfn_add(omfn, -(long)(_PAGE_PSE_PAT >> PAGE_SHIFT));
 
             gfn &= ~(L1_PAGETABLE_ENTRIES - 1);
 
             for ( i = 0; i < L1_PAGETABLE_ENTRIES; i++ )
             {
-                if ( !npte ||
-                     !(l1e_get_flags(npte[i]) & _PAGE_PRESENT) ||
-                     !mfn_eq(l1e_get_mfn(npte[i]), omfn) )
+                if ( opte )
+                {
+                    oflags = l1e_get_flags(opte[i]);
+                    if ( !(oflags & _PAGE_PRESENT) )
+                        continue;
+                    omfn = l1e_get_mfn(opte[i]);
+                }
+
+                if ( npte )
+                {
+                    nflags = l1e_get_flags(npte[i]);
+                    nmfn = nflags & _PAGE_PRESENT
+                           ? l1e_get_mfn(npte[i]) : INVALID_MFN;
+                }
+
+                if ( !mfn_eq(nmfn, omfn) || nflags != oflags )
                 {
                     /* This GFN->MFN mapping has gone away */
                     sh_remove_all_shadows_and_parents(d, omfn);
                     if ( sh_remove_all_mappings(d, omfn, _gfn(gfn + i)) )
                         flush = true;
                 }
+
                 omfn = mfn_add(omfn, 1);
+                nmfn = mfn_add(nmfn, !mfn_eq(nmfn, INVALID_MFN));
             }
 
-            if ( npte )
-                unmap_domain_page(npte);
+            unmap_domain_page(opte);
+            unmap_domain_page(npte);
         }
 
         break;


