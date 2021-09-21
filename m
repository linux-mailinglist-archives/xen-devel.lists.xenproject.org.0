Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E44412F2F
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 09:17:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191405.341419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSa1p-0003jz-0l; Tue, 21 Sep 2021 07:17:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191405.341419; Tue, 21 Sep 2021 07:17:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSa1o-0003gr-TG; Tue, 21 Sep 2021 07:17:20 +0000
Received: by outflank-mailman (input) for mailman id 191405;
 Tue, 21 Sep 2021 07:17:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n1Hg=OL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSa1o-0003gY-3q
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 07:17:20 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d06a7d7c-9448-43b7-917e-8e7aa29e0d04;
 Tue, 21 Sep 2021 07:17:19 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-3s8Ti9AIMfarizSjot36hg-1; Tue, 21 Sep 2021 09:17:17 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3293.eurprd04.prod.outlook.com (2603:10a6:802:11::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Tue, 21 Sep
 2021 07:17:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 07:17:16 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0059.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.6 via Frontend Transport; Tue, 21 Sep 2021 07:17:15 +0000
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
X-Inumbo-ID: d06a7d7c-9448-43b7-917e-8e7aa29e0d04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632208638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MFNiMXoiKa06wTzVJFs8SMvmLCcjsyrCF6I15nLpdgY=;
	b=T8G82C8rBXnrXx4dNUCfLqoFZgVfOZ34RFARepyjE9AYal5RVlIpojY8yE3dsRijT1U7lx
	QmBaBFzzoY/tGjs4BiGUEftoEkoJxWOpBCvH9RBAfd7F8dpCrFVoGvSDzAkGMS6rAh/qz9
	C8qiLYncYnec74vggrc4qr/kcIQl5Xc=
X-MC-Unique: 3s8Ti9AIMfarizSjot36hg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0pYYLv5LZzVYX05b16L7+HauN2z3XNp7O1xn0TLbo1Wby8DTpgRvZrw4KLuPs1uq98Mun/YJrZBQ2WWXuSJYWNRnxWNka4ICRkdmOxNWrp+Mv9UmJE0DbyxoKwPnYgZq5KbLzfrPzyNVSQ91cqSUiFJdnkR8VB2856ASiJovltcWztKi673ry5W5f7FPsLbgqavLEb8KJoklsiogOhh7AAHiIwRLTeiHS8mintk35CvOyj0O6H9WYnUWaavURpezkV59mA5wg/lzEo/qvkxUXbY/86h4+3aVRFu3IlOT6r8OzJtze2tvWGbiGUJl7eBMwn3shmDCPiFFy9u7Ql9Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=MFNiMXoiKa06wTzVJFs8SMvmLCcjsyrCF6I15nLpdgY=;
 b=AHXntWIYCVqrxmvAEZmvpYPPCdZC6BrqTI3wc6Sqj5TbGEdtsFrAoBG/xOT3e3dVhneAUBWcaqsam0fNxVevcRypQc6dadj0pPOxfH53Ey4vWMBKf5znIGPE5A6+o9NWqb0cjkRDHEJ4xkr7eDctQ5GaLVsR1yDXw33Vaz0a8OA5abV0hQEl6Jgh+8jFnS6LAI7kOxrjFGa6b2yUWuzkUM96oo4EnjiHAeVOH9alUp5GgWPI399J/2cvMUA+rzghceLz2CzBx3ycFpK8Y49+4js6dtf902vKaR4mU2rOQdauiowiPEMV/7TPhk+U6G2He6smGHQEzumKIHPcR6Cx4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v3 2/9] x86/PV: properly set shadow allocation for Dom0
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
Message-ID: <25958e72-40b9-30ef-a348-6ac9ef02b261@suse.com>
Date: Tue, 21 Sep 2021 09:17:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b117088e-0409-41d4-e185-08d97ccfd73a
X-MS-TrafficTypeDiagnostic: VI1PR04MB3293:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB32932CB7619789DCD9875634B3A19@VI1PR04MB3293.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VV4IQ4OoTE21WTgek+id9N1AX6i11nUc/sdCJYlQ4Vv++TSyN5VNDFYCFuV9kB5j2GnpmJK4DQyjLz9k+3QxTl5cUpGOvo1w85S6K4IN2Jgrq6CUDraiu0eZ3yAZ5aeiitZuWXUHDprDtAyPkh8X+fvCm2Eak3ZV+wmuEwyAHGL8SIUqwj4hBLtC/VEJT8YKS+mFuVsrTY6I1/4beV5m5kZEpkvseo0CWzLABoxAfNr2mUbI5FuzrM1j8Y4fJaxLIxu7lx7EgXgDTTc7PrmvS005a+uN9eqUWnmLWbtZVm3/rT7AcDoWah4crSfsnMDP6IPS0inXaih6Ydw17MrfPQi9jGBr2uc/UIbbKqUJmnSTCV4sfgD0CM8er54a8/B+HSqxrgXnvGCSmh0OOV2kLcRIK01Ib99pd6WlSVu4AgG4c6SdVGzxUjClY8eSj1T/TXIzUcFuwW+XGmb9dfmZ53FiS+/683gHYUhAqrdpXAVVY/dkl9uJYZN6AKcLA3wYSgjrNL9U+vacVZ09+3pD3XeeSe4USMoU96NblXnZXfXtDnNLoMhj2G4ooyf0qJ1XWo7Ks2YJfjFFHWqpDCL36OdXcdwIiWwDMYFaNC6W4fyURyZmDG6lAGOnaPdB+shTWlu1/SDo/aIolUaslxTR+SD3VLjtdSiOxDqWnB2ZW+AFKUTtjBntNZFhgmHb/yp7jBVsFGw8SkRF0gYb1yuHFpfjTitWUm1UtYLhrKpRQWw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(316002)(83380400001)(31696002)(8936002)(956004)(36756003)(2906002)(86362001)(54906003)(31686004)(6486002)(508600001)(66946007)(2616005)(26005)(4326008)(38100700002)(8676002)(66556008)(66476007)(186003)(6916009)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YS9mUk9pTjhGRUp1R2FOcWxVbHA5eTRyZDdaNnpES2pvbHhtRVlRNlliZFJE?=
 =?utf-8?B?VHhvMjlCeXVuZlU4cVVKeTdUeG9BMEVIWU42TEhQSmt2VTJEeDFYT1I3SXc4?=
 =?utf-8?B?VEdGdkVzRGF3MlFVTFIwajlVSzh6RDRQZU1DMWU4dWY2SzB1MmJ2TlRFVHdT?=
 =?utf-8?B?YkY1SDlPS2NrUFVGVWxZcGNWajg4WWRIdGJVVnpWZjM3WkQ3TFFCdWkyVGdz?=
 =?utf-8?B?TGhpb3ZtNTV4VWs1NU9aZ3RlU3kyVUNxLzA0RFR3SXorTUpyYUpzM2lKMXpl?=
 =?utf-8?B?UlJkTkpCR0FqYlcyKzVFdTNpb2EwRGdPVnVGbHhNYWxlbTM0STVCcWd1dFhT?=
 =?utf-8?B?QXFCRnpSMTUvaGJxR3VTbGNlaTF0bnU4MHd1VXUvYTAvOWpJV05LMFhFeGRC?=
 =?utf-8?B?RXJGSzFLbkwzeFJFSUJmQW8vaVBtWThvZE5MRnV6d0lhLzV6WHFrUW1WTURw?=
 =?utf-8?B?K1FKaTdXUVZvYzMvUG8vY1JnNzFSOWlFL1FGcG1VOHNUU21Ec21yRTdQd1RP?=
 =?utf-8?B?SmVhSXdOQlZEZFRZZ2V3WVBmTG9CdkFMak0wUWpnMVgwdUVoU3U0MVZJZHRR?=
 =?utf-8?B?TkJMNHFYeGxMVW1SMk5WQTh6OVA4eXpSUjViMDdjdUVGeG5ObmVyaTBqUlVT?=
 =?utf-8?B?cTBvTmkzendQQUwxWHJONDJNQXdQQlZuU2VsdWljU2JaSmtscm5NMkZRTzk2?=
 =?utf-8?B?cC9IT2ptSGFEY010ZFd0U01RVUlCak9ySE16YVllWGx5MjUxcVBVTjVVRlBK?=
 =?utf-8?B?Z1hoS21WY1NrSUdEWDFIZm1GYXRZQXBwaGhjSHkrUnl1SnFsZEtFeG5Xakpz?=
 =?utf-8?B?L2MvVi8yQkdJaVhCVGlReFpmc2pQM2syUGpEL0ZWdng1ejFJQUxNcyt6bENZ?=
 =?utf-8?B?d1gwZ015WGRoTytQa0I1dmRNYm5kbWJsMk1oVktNN1ZvK2tRMldxOUlPd3dQ?=
 =?utf-8?B?VkM0c3N1ejM5Q2k0bEdKUW1XSElSb25ONDlPN2NnYXJsaSthUlBmdnBlczNT?=
 =?utf-8?B?NE1vcllUOUQxQTJVOE9lenFJbVgveHR3eERLS0g5OFpadWlnVmtVNUtUbDIw?=
 =?utf-8?B?ei8vT253a1UybktOeitOb0lYWnM0Wm41OWRKUW5KL2UvZnpKemRHdHVaT1A2?=
 =?utf-8?B?VHM2S0xLNXArQ29Fb2R6dHVzY01mTGowSFhBRjh2elJ5NFE5YUJOTjVRM3JY?=
 =?utf-8?B?c3ZaSmtjUWJwZlZIRXU2UEhTVjJYRkd0OEpnWUQ3ckRPOERFUmw3VWxjM3dK?=
 =?utf-8?B?QWU5SzZXTkNieGI5Rk9oRVB3bUg1NWg2K0lOcWhtdnFnMWV3TTdqZ2lUNEdU?=
 =?utf-8?B?Mkg3WWxLSHNXQVBXVEpTUnJaTXdaRElGeE0vSlFub1IxRE0rOWp0ek5BQm9B?=
 =?utf-8?B?bXlOOXNRSUxnNGRnV3o1bHhBbGI0MmhGVmxuajl1Y3I4b296M3JpNjU0NVd0?=
 =?utf-8?B?c1pUVFFLcnN0WFdvV001S2Nlck1obHJRSWJrdWZSTCtyOHFlS2xrVXR6aHlD?=
 =?utf-8?B?REMvWnozT2pTLzZNdGdsUk9tbHc4MXB1Y2w3cytQS2NXV0JBZmNkKzVZZXZl?=
 =?utf-8?B?NGlBQnhzczFzVWsybmpESXpOOXFUSVNSMENxU0tGYWJHYXk3WVdKdHdkTE9K?=
 =?utf-8?B?NHUvTThxZlpMUDY0RUp5cVNCaGhWVURsN1c1aEd0TThSbU12T093UWp0OHoy?=
 =?utf-8?B?L1B2dkZ1akVWUjN5Qk55WmxhWWhFeGNvYmhnYzl3RGRWcU9xSmtrcGo1NjVu?=
 =?utf-8?Q?E1HbRgthSY5SC+WqWMCV6rFXOkxGi5FblTPclpm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b117088e-0409-41d4-e185-08d97ccfd73a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 07:17:16.1969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JZ3n+cYOVUDjh4563IapgqOAZe7RFOXUImThO7pp29Y4ksrd56iE9GMzOXgm9lDW9f4tTIDR4kHhGcFfam5mBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3293

Leaving shadow setup just to the L1TF tasklet means running Dom0 on a
minimally acceptable shadow memory pool, rather than what normally
would be used (also, for example, for PVH). Populate the pool before
triggering the tasklet, on a best effort basis (again like done for
PVH).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Tim Deegan <tim@xen.org>
---
v2: Latch dom0_paging_pages() result.

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1298,7 +1298,7 @@ int shadow_set_allocation(struct domain
 {
     struct page_info *sp;
 
-    ASSERT(paging_locked_by_me(d));
+    ASSERT(paging_locked_by_me(d) || system_state < SYS_STATE_active);
 
     if ( pages > 0 )
     {
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -21,6 +21,7 @@
 #include <asm/page.h>
 #include <asm/pv/mm.h>
 #include <asm/setup.h>
+#include <asm/shadow.h>
 
 /* Allow ring-3 access in long mode as guest cannot use ring 1 ... */
 #define BASE_PROT (_PAGE_PRESENT|_PAGE_RW|_PAGE_ACCESSED|_PAGE_USER)
@@ -933,7 +934,18 @@ int __init dom0_construct_pv(struct doma
 #ifdef CONFIG_SHADOW_PAGING
     if ( opt_dom0_shadow )
     {
+        bool preempted;
+
         printk("Switching dom0 to using shadow paging\n");
+
+        nr_pt_pages = dom0_paging_pages(d, nr_pages);
+
+        do {
+            preempted = false;
+            shadow_set_allocation(d, nr_pt_pages, &preempted);
+            process_pending_softirqs();
+        } while ( preempted );
+
         tasklet_schedule(&d->arch.paging.shadow.pv_l1tf_tasklet);
     }
 #endif


