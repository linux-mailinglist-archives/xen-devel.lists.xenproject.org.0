Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 217053A15DF
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 15:43:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139370.257737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqy2y-0001sg-CM; Wed, 09 Jun 2021 13:15:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139370.257737; Wed, 09 Jun 2021 13:15:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqy2y-0001ps-9G; Wed, 09 Jun 2021 13:15:04 +0000
Received: by outflank-mailman (input) for mailman id 139370;
 Wed, 09 Jun 2021 13:15:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jMcQ=LD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lqy2w-0001pm-5l
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 13:15:02 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b99d3d57-45c5-46df-ae00-645cd10f6bcc;
 Wed, 09 Jun 2021 13:15:01 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2055.outbound.protection.outlook.com [104.47.0.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-NK8jlv9RPZaJjPs-9_P21w-1; Wed, 09 Jun 2021 15:14:59 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4944.eurprd04.prod.outlook.com (2603:10a6:803:60::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.29; Wed, 9 Jun
 2021 13:14:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Wed, 9 Jun 2021
 13:14:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0116.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Wed, 9 Jun 2021 13:14:56 +0000
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
X-Inumbo-ID: b99d3d57-45c5-46df-ae00-645cd10f6bcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623244500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ujG2q1YnMDOR6+z6mxxei0XuEaxDYgCI4hRLLdDBk1E=;
	b=AxXMCzB7BRWA0VXhit7GLMBzhRcKGWi3dt8hdVYrI7DuCsU6mead3EhLNXBOqMe0XfG4fB
	yOKmb9DC26qwKdu2BqHULk2c5hQKr286/Er9FrELJc3eL6yZcxU5aKpy0YRZGcHbnwgKPt
	qkYQyUgj5SsoyUrvP/OJJMClm7u6d+c=
X-MC-Unique: NK8jlv9RPZaJjPs-9_P21w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXnweP5JzaN7p7O6XJowXSVHMJC9jhUVCFitY2glRnvsI82ft2rYfZNvFKQLAoQl0YkbpberIEpMVhz33RBQMgPy/vCMYaqSo0CTKMG16zPPEhMSPr2LRLQXYlxdEjCzAEBV4cioz9rPvS8xUrwPJrV2ejTB4bv5rS7LPjB07wkcOxQUacoJIIB/Ky0RWe9MiSZieQk4eU04HLv3NmOwDxJXJlB3wdpX6c65A0EVlLspSVEvfcRXHjhXxsMPofYwxJZkkuK59GQo5dQ5JBrlcjp63jyTBDyLBDgSKeh+DpYAL0pa51H9byH1Jl6f31RUmv93TaTh2y/KxLJ7KgBVXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujG2q1YnMDOR6+z6mxxei0XuEaxDYgCI4hRLLdDBk1E=;
 b=difdWQzC0iONMX96ob2VamGGhhzlMF3aNrF5IOuNJdgYeRbI2tEpWMdUuNm18enJ0PKgS5+XQcbDHpsWE1he0La7OlhXkD4U/yHSOUke5+bt2swPUETNLSUD1A+Qkwt+XybNoxwNCe2uiZBlGlZcqyz7vhByUFKvy7KTRJ+PDjUh+rohPg1qw2BeCPaYL59vtLszaUzNgCFHbInMMDytYxkX739ILB7kiD7cLhQVQXTCEP9NpwPUpSBsLfF7y2biOv9W9t6iktYVzmNPNVtgx4qDUYDezdE8Fuzl/4vAGexv8PcE0xMRUP9uEETQe/eMF8Ghm2VSK5ZVWipsbP5pjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: please Clang in arch_set_info_guest()
Message-ID: <c758de2b-c453-4dba-ddc0-0c9548172c6e@suse.com>
Date: Wed, 9 Jun 2021 15:14:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0116.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f9ed265-cfdc-468b-30b8-08d92b4893d4
X-MS-TrafficTypeDiagnostic: VI1PR04MB4944:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4944A6E833C42818CB0C4351B3369@VI1PR04MB4944.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GVziiPIpjx4+ldEy8/FJcgd1VYjTTuyGiYY6ISlUpRGgrgHYSvO2OX/9HngjY3rqySQRgf7VxvxKlN6w0zOp0McZIy4XA5l79b8UJnOl4jZfRBsC8OaA7BQ6NIXjgFEKGOicDnD2zeAyj7YzZa52BmmJ0Rjij2rq5eqk2MsRhN7x6A6SfR0HGd6AjVx0QiFPOIls/4qvS2myBjzsaQsOtTVPJW17/5plQOV0WHRKTMgMtuat9MnJ7ArlpCa+KxUQN080+VzHt70mNjM1f7+MzazbUHsEQkE1dXMH8UzskmjIeMUmRhT9lFuQWRt21zs7HRnWCl2aoi5Pt2FzNIMxKsnHojhpLqjQfwj/idfCBFi4yK6pBwtmLXtCxo//3FTxJCLEFIBr3xEehwM+ZeEUI82ivgbm4e7DlHJcwVQBlMIbfOBxCplfhTtGjDYAUUcIAdSaLozDyRACz7G0Yp82u/w126OpLG2xAgQb8Ggab5wC4kQ5Z8Y5J36u5wsHtzQORFvOAEbalbMf6AwwTNctkCotiWFFyKihucCVDxlrW7mAo470U4dT82+MrHOaf72ETIYJIL+0eKxWXV2mN7c2CQ9+mYgUz35Zn30uZ36atIhOGek4fXX8YHpLJGoRGXW1752ovRgDLaImrXvCwJG1ZI7IadniBh9QPEQCd8I1rLAGzQ139n0+VXyapQ2Cqp31
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(376002)(366004)(346002)(136003)(36756003)(6486002)(4326008)(2616005)(16526019)(86362001)(186003)(26005)(956004)(316002)(2906002)(6916009)(31686004)(38100700002)(54906003)(8676002)(5660300002)(8936002)(83380400001)(31696002)(66476007)(66556008)(66946007)(16576012)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?NXZnelYycmRCY2lKVGc3V0tpU3RUOWJBWHNacERxNFAyUEE0aDF2ZGh4NUhw?=
 =?utf-8?B?T2FpMjdNcElZc0hmc0g3RFpaSnEyaE1keG9EQTlyN1NEVFMzcEg0NDZXeE9O?=
 =?utf-8?B?b2xLM25Balg1SndJRkVvUFpDcnNBNlZFWkRoYkJJR3doaWRsdHRXdDNIYUti?=
 =?utf-8?B?Mk1lTEtLTFg5cHUwNjkrUXhnQWY5MzBmMmRiSWI1K0h1eDZIZnErbk5wd2VM?=
 =?utf-8?B?OVdTaHlMbHlqcDRXcjdFeWtuR0FkSnFSWG9mZFV0WjVBdGJXK2RmejUxZURm?=
 =?utf-8?B?SGdsVU9RalhCdzJ3MXgwd3JoRnowd3l2QXpaVk5OeTkvMldmRVN0ekprbjZs?=
 =?utf-8?B?N2lsTE16b3I0WFFyKzBqNk5oSC9ORytEc241S29mZ3NnZXJ1VXdRNWcwUXRp?=
 =?utf-8?B?Q21kSkJKY3RPeVgvdHZHU3BtNWZvdnduS0RhUVQrUjFZekxDdFRiQ3FGclli?=
 =?utf-8?B?VkZBdXhXV3ArK1R3Ri9IWFdTYUVWTndzQjJhZW5zd081K1pZeWJTTHhkY05x?=
 =?utf-8?B?bnA1MWlxcHRXYnFObXJWeUp0bTFkclFzRG5ZOXl0M1ZVa0F1ay83RkM4cmZ5?=
 =?utf-8?B?eTJiTUNaWGVWTmFvRkdqOGRaOVQyVDdmWnE4VW16b1E1T3dIUUN4dzVFRG54?=
 =?utf-8?B?L1gvK3Y3UU1ZL25sMXg1NE93S3JpSitaTy9aeGM5ei9LQTBvVUJaOFJjQmpY?=
 =?utf-8?B?ampJeDFGVDZRWS9HWVpyU0hXSm43NmRFU25Sb3lSekhSQkFhc0VidlZtdFR3?=
 =?utf-8?B?Mkd4WUkvTCtlRStON1NiU2lUR1owL3hGcndYOVBnemFiTllia1ExeTVVN0lR?=
 =?utf-8?B?OUplcUtob3hJRU5GZjczTFdsWTkvMGZzbHA2VnJiYnZYdnZUZXc4bGtVZ0kv?=
 =?utf-8?B?RGpuMlArVFg1ZHBReHNScE93UzVBK3JTTFZoRklMdXN5MXFQM1hvQUUrV1ZS?=
 =?utf-8?B?bHNLeDk5SnlXTFd6L0hMY3pLdnNRVVRxN0FKQTI1VVBHb3pEYnZoY0FPMkU0?=
 =?utf-8?B?TDM5M2Y1UmZkdU9kSWxLY3ZOekVXVkQ3SG5hdDE5cU1iY3V3d0NWbWRycS9W?=
 =?utf-8?B?dTE4UDAwd3Jqa2hPRnB3eUpNeFNreTZlQzVXNTMvWjdTdks2ZkdwcnRRNlJH?=
 =?utf-8?B?VklaeVNNUHVMdnNpOUsvZHdzTVRQUGdsaW1NUHlJaXdOLy9PMWhOSC9WVVFi?=
 =?utf-8?B?YkFzUXRGTWluOG9HMTZ3cmdaa3N6S0ROd1BjM0l0bXRNL2pITVcvdE5mbXBJ?=
 =?utf-8?B?bnV0TjB0Nnhob1ZLdmZTZEFheGprZnkvZjJpbzNHSVk0aHdqa2FOcTRHSGpH?=
 =?utf-8?B?T2ZqbU1pdUhEQkkySTl2dEp3alRrTzNLMWl0bjlob3N5a0dSaVEyajZwbVgz?=
 =?utf-8?B?ZEZ5SThOQThCQ1VLN1BZTk4vSlQ0WU5ybEo1SEozdTZWV1lnS1duMmJuSjNP?=
 =?utf-8?B?NUQ5UkdHRm1WYWh6Skw3WSszakJoVUJkVllRYWJGV3BpeHppTzN5dnBjNWcr?=
 =?utf-8?B?NUNVSzZVelEyTU9VYnVvem1BWnpKOGdlUDJJcnR0ZGlVRkU2SHZCOFpNUWkr?=
 =?utf-8?B?YTAwdCtqajJwVDhJamZlTmcvbzg2T2pNZUdOWUJyVjBndHZmMzYycEZ4Z002?=
 =?utf-8?B?SlB2MGlnaHBNOXR0N3NSK2tRbmVmWjNqNnF2cHYyS051bVFFekhJT2Z2dHNx?=
 =?utf-8?B?VEF2d2gvSXlGOUJTYmJLOEE5NS9vZ3RXRy9ZV0ZUUTY1Q1NqTktYbFJTTTBj?=
 =?utf-8?Q?kyFbG8sDsenYUxmuGaVAU3yc4SkNNwUtS+a5XLM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f9ed265-cfdc-468b-30b8-08d92b4893d4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 13:14:56.8371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NtiwqQyQtY6TUFRBUhfQtfYeQHjCh7GA1++86AKDwoJk591Hy43ucz/E2T87Z+J7GK+6tGnPhHcQaGFZU1I4lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4944

Clang 10 reports

domain.c:1328:10: error: variable 'cr3_mfn' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
    if ( !compat )
         ^~~~~~~
domain.c:1334:34: note: uninitialized use occurs here
    cr3_page = get_page_from_mfn(cr3_mfn, d);
                                 ^~~~~~~
domain.c:1328:5: note: remove the 'if' if its condition is always true
    if ( !compat )
    ^~~~~~~~~~~~~~
domain.c:1042:18: note: initialize the variable 'cr3_mfn' to silence this warning
    mfn_t cr3_mfn;
                 ^
                  = 0
domain.c:1189:14: error: variable 'fail' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
        if ( !compat )
             ^~~~~~~
domain.c:1211:9: note: uninitialized use occurs here
        fail |= v->arch.pv.gdt_ents != c(gdt_ents);
        ^~~~
domain.c:1189:9: note: remove the 'if' if its condition is always true
        if ( !compat )
        ^~~~~~~~~~~~~~
domain.c:1187:18: note: initialize the variable 'fail' to silence this warning
        bool fail;
                 ^
                  = false

despite this being a build with -O2 in effect, and despite "compat"
being constant "false" when CONFIG_COMPAT (and hence CONFIG_PV32) is not
defined, as it gets set at the top of the function from the result of
is_pv_32bit_domain().

Re-arrange the two "offending" if()s such that when COMPAT=n the
respective variables will be seen as unconditionally initialized. The
original aim was to have the !compat cases first, though.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I wonder how many more there are to come.

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1186,7 +1186,17 @@ int arch_set_info_guest(
         unsigned long pfn = pagetable_get_pfn(v->arch.guest_table);
         bool fail;
 
-        if ( !compat )
+#ifdef CONFIG_COMPAT
+        if ( compat )
+        {
+            l4_pgentry_t *l4tab = map_domain_page(_mfn(pfn));
+
+            pfn = l4e_get_pfn(*l4tab);
+            unmap_domain_page(l4tab);
+            fail = compat_pfn_to_cr3(pfn) != c.cmp->ctrlreg[3];
+        }
+        else
+#endif
         {
             fail = xen_pfn_to_cr3(pfn) != c.nat->ctrlreg[3];
             if ( pagetable_is_null(v->arch.guest_table_user) )
@@ -1197,16 +1207,6 @@ int arch_set_info_guest(
                 fail |= xen_pfn_to_cr3(pfn) != c.nat->ctrlreg[1];
             }
         }
-#ifdef CONFIG_COMPAT
-        else
-        {
-            l4_pgentry_t *l4tab = map_domain_page(_mfn(pfn));
-
-            pfn = l4e_get_pfn(*l4tab);
-            unmap_domain_page(l4tab);
-            fail = compat_pfn_to_cr3(pfn) != c.cmp->ctrlreg[3];
-        }
-#endif
 
         fail |= v->arch.pv.gdt_ents != c(gdt_ents);
         for ( i = 0; !fail && i < nr_gdt_frames; ++i )
@@ -1325,12 +1325,12 @@ int arch_set_info_guest(
 
     set_bit(_VPF_in_reset, &v->pause_flags);
 
-    if ( !compat )
-        cr3_mfn = _mfn(xen_cr3_to_pfn(c.nat->ctrlreg[3]));
 #ifdef CONFIG_COMPAT
-    else
+    if ( compat )
         cr3_mfn = _mfn(compat_cr3_to_pfn(c.cmp->ctrlreg[3]));
+    else
 #endif
+        cr3_mfn = _mfn(xen_cr3_to_pfn(c.nat->ctrlreg[3]));
     cr3_page = get_page_from_mfn(cr3_mfn, d);
 
     if ( !cr3_page )


