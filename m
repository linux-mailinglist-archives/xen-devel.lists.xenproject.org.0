Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBAE63C2D3
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 15:40:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449429.706151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p01mg-0005Px-F3; Tue, 29 Nov 2022 14:40:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449429.706151; Tue, 29 Nov 2022 14:40:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p01mg-0005Np-Bb; Tue, 29 Nov 2022 14:40:30 +0000
Received: by outflank-mailman (input) for mailman id 449429;
 Tue, 29 Nov 2022 14:40:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EGMg=35=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p01me-0005M4-Q4
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 14:40:28 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2045.outbound.protection.outlook.com [40.107.7.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3e07841-6ff3-11ed-8fd2-01056ac49cbb;
 Tue, 29 Nov 2022 15:40:27 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6803.eurprd04.prod.outlook.com (2603:10a6:208:187::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Tue, 29 Nov
 2022 14:39:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 14:39:58 +0000
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
X-Inumbo-ID: c3e07841-6ff3-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SiQcVvRSDxqo9ugkci0oD/o+iiOkZg6N9kAzZ/mhsN+9CapGpBFVXu38mtU3SR/NYT+ndm+QGCG5JLdCzsFiFUN5wk2nwkr6Z5uD+mbo6SaPfq2x1Ed/rA1lMylfR9WCr4X+VDYlxBE4AGycX1blvS8LC/dnXjl6zgSiTu9x6hWOZws9ydmyWD1/uCKem4aZXGGipZ+hNyElbSrUClXAL25Ix5viLviFm8kClWQv51SUpPrdjK05goz1kmMZlePBXSOVmTwYiXBy7P02u5NqXZTdxL10F+U9NeZ1Pvn7DSAByf66nX8W4YtTmijihhoZRsswjA1wGrhF+7daCBajAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yvAci0YWhtZSwDYtSxfg7I4sW/keT/nE9BZRusa5KkU=;
 b=njUcrXm5hq0TqWitTwzJrNAC2L8pImbCCQhoNIr51nilBXz24nTA2hWue301LvvDcHj01NUOwj0jvI30Q950JlPIqkslmBGQaAP0py6/XeDu30A5yM2AtQ/Csb5YDcGex468TQsVQfJx4/VZEx95mbQrUq3xLiojVzUunhCfuZau+R+oLT72OJ4vxzjLKya5GjayqutQSO10fo9gSKt0UJUNTIn6kcdA3Ei4lh5RQXNPkMDtRut4So0rE0aLL3N41UhyX6bVMUgOpiEf2yTyo3ueTvw9gB9WhpBQlC7LIG7PPeTtvx8S6ZNpVtYyn1ihPs+mEaX8TtgVFTzWnp6sgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yvAci0YWhtZSwDYtSxfg7I4sW/keT/nE9BZRusa5KkU=;
 b=bvCWAYQ/1CTiTMfbdkGML0dBrJ6AKKmPCi4Sm3xAdquOiVDi6UEt1+7A38g8vmuOT0jKhN+PyZF2hRMWZ/SXu0jZw9BKgLI6bhPJ3kO7HrPvauqS/dcc5KPsezm+C1u/y9asBvKyCojAD146XvHDEtcYRksIbwyJWnceVwwMkV4LMW/GYq70uvpeNY/bGue9P7oA392Ml/ouvPsqKMz0/PAwBN7ne2tHK/lDyp/0zuJEri5DhvyzJI7qU71+Wl7IO8AY78rKBBERHX12K9bH9iaEQaA9XsEAT3pDSxhgLKpoxkOAsuiMBEfcLMBegrPPfgPhVW+OzrhY3piXLXxxTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c29a48ba-a662-f92a-4b97-0694dc93684a@suse.com>
Date: Tue, 29 Nov 2022 15:39:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Arm/P2M: reduce locking in p2m_{alloc,free}_page()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6803:EE_
X-MS-Office365-Filtering-Correlation-Id: 4073ba79-99a2-467a-362d-08dad21796e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	goXt26xbGLZ/APML71CZpAb87Yylv8gGMnVXX2vYDgK7EmSHOCxVnSNrHUx/1aQLBBvl6Qg3lNCpNqd0OsRG0mSgre7cxY81BudG2QIbc9vnJu+p9LfKCKi/1GfkmTeQQWwBvENDVfAA11ZyMusX4ncMZ6lSOnOIOdnJ0kOK31KB13YoNMgZyNj4b+CnGhlCoXiWYVZMmqmhf3bmQDD7ZUG6MuFKcb8R/QRQ2gtgNeg/y9x5452qUbN4+EclizEfHFYGxnUG86tSpEUsEqQE6jTQqHDIhzA0RzzgOLsXeeYoVIu7j8tbIQ0MFSEULNwz58jBwEZpcS8lmAVS1ZAim6pukLOBAQ6QQBtpEJPSmfZhuB+kRl2ieUfkSZ6R4Cwv5+nhNMtWPzOnyZ3ZW4lk/GNX+J+AzXoVTmiFy04mmQqdzLDrDs/LMsuhhpHxWTOp42BlW8fpsSYS6dsOgLtXVmvW9Vf/3zmCQWdgJ90R2ESoHO8WWMw7nlr0xXVkyCi6ThMDvvftKRiBolMKtCtJ39anLTMSUTJPDxS2uP35luIMLepPqhghceBLBhN9DiwccltRUT+91aTNUAcDD3BNoCCwXdgbXVQZa6SxS+WDofPfTwghhSb2H9dJbD577qRQ2GvqqWwTmAlx1myVjII/TdkT1f1oj6FKQeNxwEJ8yycjKbFZXE9Mh+8r+KwtV2/ZITnDnpCbehDJ6Fqp6Mu9XzpC2BtS09kyOfSeHRoTNME=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(346002)(39860400002)(136003)(376002)(451199015)(6486002)(6506007)(31696002)(83380400001)(86362001)(478600001)(31686004)(26005)(316002)(6916009)(6512007)(54906003)(41300700001)(2616005)(5660300002)(38100700002)(2906002)(8936002)(4326008)(66946007)(36756003)(66476007)(186003)(66556008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWkycnFKaWlzbUNRWTVCeWUwR1hrMEVDL2FPOWtiR2lCdEZJd0VmUkY2S3M0?=
 =?utf-8?B?Qk51dFptVitacnJGUlgvYWR0SzB3TE9WYmRjNFZuelJlTUxLRytVbzZlS0VC?=
 =?utf-8?B?QnpodzBoMXI2ZlkvMmJoQVFxdTdEZHIvSmp1QVdJTCtvL3hRLzRwc3huTm1N?=
 =?utf-8?B?Tm1uWnhLeEJILzM0d0pnMkJpU2g2YzNLZXpYSENYTmFEWDNmVGQza2dEdlMy?=
 =?utf-8?B?c1hFRlR6Zjd3dEVCb0xLNDg3R1A2M0Q5eGRHbUpSa0JrV3o3Z3QzZ2tPWFB2?=
 =?utf-8?B?dG4reGkzRWxFcDVtMlkrNlRWWXBvM3FsYnpwSU5LbXExRmZna3JjckZJYjdl?=
 =?utf-8?B?bWZBaStFRkJ0aWpvVTI3eTh0dThGUjdzSGYrTXBMZlZtZ09ScFB6V3pjdEdH?=
 =?utf-8?B?SmQxL3U5S3lPTEVnY24zTThYVGJpd0lVZG00QWlhMmJjWElwVCtBMUxTS05x?=
 =?utf-8?B?ZkZxc09yNGRnbkR5c2RpWlNibS9LQnFpeG16Z0krLzNDOVpKSmprcUNqSUhw?=
 =?utf-8?B?Z3VaM3JCaEdwelhIbzUxbjBURzNXV1gvS0h5VEVnbzhJek5CWldtcTcwTTZ3?=
 =?utf-8?B?R2VUUVBOejBMK2JNS3JmMjVlNDVoTGJRQksrWVNaRmdTakxlQmdrK0lZMnpX?=
 =?utf-8?B?cjdSMG9neWJ5THpBNEFTRk5kbXh4OWZOY3hybEtsc0wzMEpyek5odFB3S2VU?=
 =?utf-8?B?R2ZvbEx5Tzl2MDk3QVJVandnWDBSMCtjdStNRWprTW13ODB5dnoyekhOQUlt?=
 =?utf-8?B?QU1DOTRIclNydGVTR3BybnZuRlFqS1lFRHEvZHc2NVRRS2ppb0ZndG1QZ2w5?=
 =?utf-8?B?bnJGNlE3QVdtV29qN1FXR0w0ZkFHRlpzVExWb1k0bFE3eEFqRGIxU2dXdGJC?=
 =?utf-8?B?ZWxiRkJXYys1VFVCcVI2OHpkUWZLZTl0ZlZUUDE4RXIzT1Nnb1ZsRjNPdEc1?=
 =?utf-8?B?T0h4a2xBMk1tRXE0cHIxUEtpaDdFVXBZZXYxbVhTWUUxVE1mK0g4MmF1UEZ0?=
 =?utf-8?B?SVdjQ1FiUS9zc240eFVhbWxaZTZpeVR4L0ZhSGdWdDFjY2FZRTZLQnNJdk50?=
 =?utf-8?B?Y3ErZU1yL2JQczUzZlRGWk9vbnhtVE1Fa2ZFSTQvbGh0TUV4QnJpZkZwQ0ZO?=
 =?utf-8?B?K0k1UGRzQ0wyZTNMSjBuMGVTWC9nM1MzbE1WQ0xsN1IwZXYwRU9BQi9sdnFl?=
 =?utf-8?B?WE8rSjQvUy9XRytPaTUxeGYxb1ByYTAySEVmalhOcFhzRUgzQXNNQnhFdnZC?=
 =?utf-8?B?S0lWY2ZLRVJ3TEQ2K1NaZ1ZjSUt3QmxUQ0J2TTdQaXkzQWEwRFNtMUpCVUlG?=
 =?utf-8?B?aWtJQUNvZEF0c0F4eitybDVGdGxMWnNybjEvaVVVRlhsemFwR01vdC9relI0?=
 =?utf-8?B?SGVtWDFXSlFRdHk4WGRXbGJYRi9zM2hsTGVJUmI1U0FrdzV2U3hxYlI1Zllp?=
 =?utf-8?B?TitTdHVKUSt4RGowSjFCd1QvTjZSS3RWS1pmRDVwNVp1YU13TzlGVDRTZU1o?=
 =?utf-8?B?Nk5mNjNYNVROT28wZUJ3UXNCZWdRWDh0VlM3NGVWelRXUkYxTXVXK0FvWkVu?=
 =?utf-8?B?WmplSWFkK1F5alNXaG9tMjN2MXlOK0EyU1BhWkhuc2x3dTBmTTFXSFFIZ20z?=
 =?utf-8?B?K1AwVFNWTmdVSjlwK0dhTnA5c200QjJxb0FCZTZJbjY4Y2djNzdiWjhuTlVY?=
 =?utf-8?B?b0dnSkZzc05lMXBCMnZ6OXg1dDVWbmlGc1VuRktMZnp1V09tRm9lUWhNcTJo?=
 =?utf-8?B?RXQ4Z3lEWEtrTjM1b052MkNPbGl5RTd1VjdjYVNXTVNXRDdzVXQ0QWpUeUdB?=
 =?utf-8?B?NlBkN1lYQXlmV2pITjFZS2M0THZnU2ZnR2pTMHlsZUdzbmY2RXZKTG5FN0tQ?=
 =?utf-8?B?Q2JZTytDMkp4SzJSbDVpQ0Y0U2sxeUJXbzVnT1VJYU00cUpaQ2dtWlRTbnR1?=
 =?utf-8?B?QjRjQU8vbDZ0Yy9DVldDQnBHSlB3ZWdTQ0tGNHpCdHo2SGFjcWpKZWQ2RDN5?=
 =?utf-8?B?bDF2WURIbXg2SXVqbEJsWTR1K1pJbjdERktIUTQ5YXNpTGlOVmNZeHNxdEhx?=
 =?utf-8?B?UTdWUTV6TFJEU1pEZUR2QWpLUmpzWkxJWGxURDdsUDl5ZVBMdWlYeGdQb1RI?=
 =?utf-8?Q?tXeZ8zkNl31ski8ZEY8r1kwbM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4073ba79-99a2-467a-362d-08dad21796e0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 14:39:58.4797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kssug4apavp/EdaZACuymJg9iE+PaRCA4tekR6p0hm6dPwIe5jcDIZIClBUh05kOgRuU2kdsY/TR5G/3k0jl1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6803

It is generally preferable to not hold locks around allocation
functions. And indeed in the hwdom case there's no point at all to hold
the paging lock. Reduce the locked regions to the non-hwdom case, while
at the same time arranging for p2m_alloc_page() to have just a single
return point.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -48,7 +48,6 @@ static struct page_info *p2m_alloc_page(
 {
     struct page_info *pg;
 
-    spin_lock(&d->arch.paging.lock);
     /*
      * For hardware domain, there should be no limit in the number of pages that
      * can be allocated, so that the kernel may take advantage of the extended
@@ -58,34 +57,28 @@ static struct page_info *p2m_alloc_page(
     {
         pg = alloc_domheap_page(NULL, 0);
         if ( pg == NULL )
-        {
             printk(XENLOG_G_ERR "Failed to allocate P2M pages for hwdom.\n");
-            spin_unlock(&d->arch.paging.lock);
-            return NULL;
-        }
     }
     else
     {
+        spin_lock(&d->arch.paging.lock);
         pg = page_list_remove_head(&d->arch.paging.p2m_freelist);
-        if ( unlikely(!pg) )
-        {
-            spin_unlock(&d->arch.paging.lock);
-            return NULL;
-        }
+        spin_unlock(&d->arch.paging.lock);
     }
-    spin_unlock(&d->arch.paging.lock);
 
     return pg;
 }
 
 static void p2m_free_page(struct domain *d, struct page_info *pg)
 {
-    spin_lock(&d->arch.paging.lock);
     if ( is_hardware_domain(d) )
         free_domheap_page(pg);
     else
+    {
+        spin_lock(&d->arch.paging.lock);
         page_list_add_tail(pg, &d->arch.paging.p2m_freelist);
-    spin_unlock(&d->arch.paging.lock);
+        spin_unlock(&d->arch.paging.lock);
+    }
 }
 
 /* Return the size of the pool, in bytes. */

