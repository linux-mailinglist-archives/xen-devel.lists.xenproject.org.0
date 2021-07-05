Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3A63BC16A
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 18:11:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150480.278228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0RB1-0007jm-GE; Mon, 05 Jul 2021 16:10:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150480.278228; Mon, 05 Jul 2021 16:10:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0RB1-0007gv-Bw; Mon, 05 Jul 2021 16:10:31 +0000
Received: by outflank-mailman (input) for mailman id 150480;
 Mon, 05 Jul 2021 16:10:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0RAz-0007gl-UP
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 16:10:29 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 82e5c6c8-ddab-11eb-844d-12813bfff9fa;
 Mon, 05 Jul 2021 16:10:27 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-6-qB3jOu3wNkaUmLvdoDMhpg-1;
 Mon, 05 Jul 2021 18:10:25 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3293.eurprd04.prod.outlook.com (2603:10a6:802:11::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.32; Mon, 5 Jul
 2021 16:10:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 16:10:24 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P195CA0017.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 16:10:24 +0000
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
X-Inumbo-ID: 82e5c6c8-ddab-11eb-844d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625501426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KPGxH8re/zFguGwgrpavyMsiFmWQkEU9gtkRkREhVRQ=;
	b=ikAXLgycNis9EO7JiaGHmHciJVG61PL7m8sT6ypFdxjSFFUBV7U8gG3z5q3/c6t1GPZqZT
	5NIzl9HAFRs/RTQPyVs29UqL8eU78l1XELWyek1diPHSWPLEgwE89SHIgw0q3NQnB52VR8
	pybcY3f/9XsElZIY6v+qaKPu/xdRGV0=
X-MC-Unique: qB3jOu3wNkaUmLvdoDMhpg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L/nR9zIhBNr7cyvBTdwDGgg4Cmnwf9DVCEFe2xh/5rBtZgMkJc/s3oWA6LV9sxCqgM2Uwe6gjfeYdP1uRiT8YuBbvk0yBjVuzqreRB9jUOeor+2icyrADpKcThKxcDm48k4dPyPhHEoj5utvL2VGSdfgT22mxYsguQLUoRfkaRrmMRpjvos4tap1y7Hc7qXr4mgOGL1oGCYVN51B+32YCH41SmtSRN73si5iD1PdIYFe81/P9yTgpaSF3xgC0MVsVhd9UxIQ+2vRJVdEpnmvtELnKFl51P0SOpK6QlamvC6LaJwH5bKnH5Q5gG/PIQsNzkUqAJAD541DH7bpnShY5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPGxH8re/zFguGwgrpavyMsiFmWQkEU9gtkRkREhVRQ=;
 b=WO1Xd+wKOZMJtDQprdTOXuEb0wK4TwEHQBooRG0DSlhFiXCJxoEOozOX+BJ1nkMqNgRcxt35d5cJTI2QhHyRa9MkC/v5r6asfMPx68sRCox4TUrNYpFXH0eqcY27PpKgwU88d2A2FwWAAHPTdMj19pVy7BQ+EigiCGD8Po0JYy1PhVVW30AayOVjnzYZ2BesGe+ENBfEHMAPdMRlNKWzOhbwMVJ0Ibjr9ABfD5MMQz2P5h/YEmevrMO3dyJXABZA3sFrBI0payHATLpTvgpUGmbPF1zIbh/450vBUwHb3tHxpqoexyz4DgRGLOi2Cqvqudgi1HJLBFx8Hr3ZfJNKSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 09/16] x86/P2M: split out init/teardown functions
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
Message-ID: <01024f3c-22e9-cdf5-46b7-c9479c8937b1@suse.com>
Date: Mon, 5 Jul 2021 18:10:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P195CA0017.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b1b2756-8e18-473f-5ac6-08d93fcf658a
X-MS-TrafficTypeDiagnostic: VI1PR04MB3293:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB32932C4F3405D9AB45A5FB55B31C9@VI1PR04MB3293.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Qz0/5LYN+Dv7k2GCan7aUwwq/1iD8M22aSfjwPScg+BSDjIBZEMsGSfg11EdFhH/DnWBiJwfA3k2WrKtu233ldWvBX98xuNyZRKQ2FHVcJJt35fTRkj0ukI1ZtAZaJuNWIem1nEEEABIgPkGBI2E9wIvVhjvvesAboNnOhMknt5rOp6jDMs/KBqoXVRdqA+j/0nqKkaIbRis+tX3BxLNm67kmqhxJ9UtFVVeLlu79rVio14OZthnjrTs9ofKwRo+quLPmcPlx8mElYaF7kFhKWyA1YADXUC+7wJ8UOCJyC+JvnxJVg25R5AJvZueQSlVyz0W5t52rzG6VW0+xaKufCPKriAOOGBQhYAFcHCkRBdRk+noL+6aMnpjv66Wc2mOhLd1dkEsgq+QKdN6LNKzgLUQAXr8PL4rXFh1htlOzViXr2x4RN0mqbtPNqMVuHDiR88hpVZrR+QOBUJuu/uTKY+TaKNEW+j4Evma7fumf96n88OaqBfPWjtsvE2XNcOf7GMoxDHZrg5OUKHty2v4KDB+iB8P4MYB2mLwkhx5l96OVnfqazwap+mFWsuzSqNSBy8JZGcECIvgaj9cwP3kLU3m9WioxYLIFOU9t9+kSR0OjMBeYgphQH4tuwex4o5DktZbnmxKtSIGRm2K5blc1ifsmRcnsrrvGCdt5SDOc+IeOIjmIh5N/HWfPH5D9Xc9zISjnf3vC+x/tKboKsTNLeRqjhgANYTLDly/wxkNN106aIFAZ4EZgAtAIMrEfu3odz7Tj01/vukzHVb5VJJpzPNjP6bJoWMQtzIWPSl2DM3Pa/YVo79w0neWaaihkmb3ooB9H6n/pEhOK4LeyPEKPw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(396003)(136003)(376002)(39850400004)(5660300002)(316002)(956004)(66946007)(2616005)(16576012)(26005)(38100700002)(186003)(66476007)(66556008)(2906002)(36756003)(16526019)(86362001)(31686004)(6916009)(54906003)(83380400001)(31696002)(4326008)(478600001)(6486002)(8936002)(8676002)(30864003)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkU1Q2I5MXo4d0pzUDMydG9MWkRHYlV3LzUzbzVReHppallSUlRqVE1pVkdl?=
 =?utf-8?B?QjdEaWV4N280d1MyNzkzYkN3aU1xTFNzQmNtcm5aZ2MvKytFRzltaHphUWMv?=
 =?utf-8?B?MU1sMS93UFhSb1JoMW9iTThLSHE1eDB2UER3RlFlTXQ0R08weWZiQW9HWHZu?=
 =?utf-8?B?SU5YbUVieXVJS1hUSDJjdEdhUEFDQnVFaTZKWmQ0MEZKNWJHVlh4bkF0ck9E?=
 =?utf-8?B?TkFqQkQ0dmo3Vks0NVdBWjVURThUV3RFUjZ6c2xYWWs1YnowWlhjUTAvZ1FX?=
 =?utf-8?B?L1BXT0c0U1phZFJZR1ppS2ttczVWbFBNY1dMdlAxK0s1QkF2eVlZM1pIOHc2?=
 =?utf-8?B?a1NnTzIzS3ZwQ1IyQVE3blI5dFNPK25PdEpYcSsvb211KzBJNFhuSVpYSHJZ?=
 =?utf-8?B?Rmtqd2VjcUoxZnAwY1RTSU41TUdDSTlKenNGT2s2YWxGTEE0bHhJTzc1MUs0?=
 =?utf-8?B?MGhlWWc3MlcxTDgzN0RUZFhsRlc4NUdoblZ5V0tvNENNSmxQbldaamUvK09s?=
 =?utf-8?B?NWxjWU9CUzI3d2hSTlI5Y1JJOTM5K2RFTFBkY0RNcnhFcmhkNDdLbE9NeEhS?=
 =?utf-8?B?L0dRLzZZRk12SWtxeG16YVFsVEdLZU9KOXVneEpLODRHSG93cUljeGNkcHZV?=
 =?utf-8?B?cityYVo2TW8vd3RKbjZ5WjZCeEVFVU1lMGg4ejlYcU9abkxIb0hLdzJ3QnlL?=
 =?utf-8?B?TmVUa0s2cGdCT0tnMXY4cHNGcm9SRmIzMmxYZFNnSnhzRytxVFZVZTlER2Vy?=
 =?utf-8?B?T3NzODFxaThzWjZXL1JaMGpqRVRRZm1Ddlh5cExjWENsbmhudDlYSFQ3cXpM?=
 =?utf-8?B?VmVrWFExd0hPYytpMS9QdU0zS1Z1RnZ4TDExOVpSdmUzQVR6dFkxSU4yeUEr?=
 =?utf-8?B?TXhtK0srUFlPWXh3a1NKa1ppalB1aGdqUWxKVFd1SEdLTSsvd0Z5c3lLQ2g1?=
 =?utf-8?B?WFR1Q1NTeXFNcEVyZFYycGRzcERTaDZEdzUwbUNLemJucHRaaUNMdk94NzVR?=
 =?utf-8?B?L0o1Ty9XaXprV0ZxZlRXY1JSMzhPaVRzd3UrenRxUjl3NE5kdGs0SVpvYTR1?=
 =?utf-8?B?dCtlSGxERXBnekw2OUx1b3R0Smsrd214RUJUdlRnZkpJUEltQ2pZcUd3eWdH?=
 =?utf-8?B?cUVSTktad1dWTVEzMjFDZTNNb2VFeFBaT1BNUnBwMHdjV21lOStUcDROSk02?=
 =?utf-8?B?aWtoeUUzVThhRUI4SEYwK2JuQjFLR0ErV05OT2FuNHRXRWt0cENYbllUZUpC?=
 =?utf-8?B?cDZhNzlxbnZNRDZwanRjYW1qQko3NU94aWszSlljUVJGcHZZQUpQcDNzWFF5?=
 =?utf-8?B?OTgyRDFudHltQUg0N0k3Y0t0Y3F6SUd4anJyNzdqNUg1T3lnNi9NZFdscDRs?=
 =?utf-8?B?dFpGQS9UOHlBbUdMWEVpbGk1QUR0c3hWZHBhak5FTHpRU3IzNURYV2JxY1Vq?=
 =?utf-8?B?ZWVqelpQNityQXh5UEZzcWo1bjF0TDMybWY5cElXdy81NDA5ZFRnSTB1UFdi?=
 =?utf-8?B?L01DVkp4K3NxakRnNVlydVJGNUFva0IyR0xCRUhKREJzOENTQzZPWXIza2Ev?=
 =?utf-8?B?ZE4vUUY4MmlyTUwwaHJtV1RvNFRKL1RTUlpZVk9WOEF3dlNrZ2J2R21RaEJO?=
 =?utf-8?B?dSt6RDdNTkRXTjhkNTdhWTFudnpKblhpVDZPMVA4L0FZcnFxUjBRcnhHNnIz?=
 =?utf-8?B?cCt2L3R3b2ZUU2NvT2VOUjJ1bHdYcjBZY3plbC9sdHp6aEdlUGFpWlgvYkhP?=
 =?utf-8?Q?YBKIpsYzmU2Xpef2lPGVDgdqeONA2cG24NeRLG8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1b2756-8e18-473f-5ac6-08d93fcf658a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 16:10:24.5131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NP4fr2VZx0R4DfMwcSbnkM1mic/bNIyHfU6t01zBBn5S4U+18/pDbW9o+y/O3jTxkLXxe/3G667BWnmHRcN1aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3293

Mostly just code movement, and certainly no functional change intended.
In p2m_final_teardown() the calls to p2m_teardown_{alt,nested}p2m() need
to be guarded by an is_hvm_domain() check now, though. This matches
p2m_init(). And p2m_is_logdirty_range() also gets moved inside the (so
far) adjacent #ifdef.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/Makefile
+++ b/xen/arch/x86/mm/Makefile
@@ -7,7 +7,9 @@ obj-$(CONFIG_SHADOW_PAGING) += guest_wal
 obj-$(CONFIG_MEM_ACCESS) += mem_access.o
 obj-$(CONFIG_MEM_PAGING) += mem_paging.o
 obj-$(CONFIG_MEM_SHARING) += mem_sharing.o
+obj-$(CONFIG_HVM) += nested.o
 obj-y += p2m.o
+obj-y += p2m-basic.o
 obj-$(CONFIG_HVM) += p2m-ept.o p2m-pod.o p2m-pt.o
 obj-y += paging.o
 obj-y += physmap.o
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -19,6 +19,8 @@
 #include <asm/hvm/hvm.h>
 #include <asm/p2m.h>
 #include <asm/altp2m.h>
+#include "mm-locks.h"
+#include "p2m.h"
 
 void
 altp2m_vcpu_initialise(struct vcpu *v)
@@ -123,6 +125,44 @@ void altp2m_vcpu_disable_ve(struct vcpu
     }
 }
 
+int p2m_init_altp2m(struct domain *d)
+{
+    unsigned int i;
+    struct p2m_domain *p2m;
+    struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
+
+    mm_lock_init(&d->arch.altp2m_list_lock);
+    for ( i = 0; i < MAX_ALTP2M; i++ )
+    {
+        d->arch.altp2m_p2m[i] = p2m = p2m_init_one(d);
+        if ( p2m == NULL )
+        {
+            p2m_teardown_altp2m(d);
+            return -ENOMEM;
+        }
+        p2m->p2m_class = p2m_alternate;
+        p2m->access_required = hostp2m->access_required;
+        _atomic_set(&p2m->active_vcpus, 0);
+    }
+
+    return 0;
+}
+
+void p2m_teardown_altp2m(struct domain *d)
+{
+    unsigned int i;
+    struct p2m_domain *p2m;
+
+    for ( i = 0; i < MAX_ALTP2M; i++ )
+    {
+        if ( !d->arch.altp2m_p2m[i] )
+            continue;
+        p2m = d->arch.altp2m_p2m[i];
+        d->arch.altp2m_p2m[i] = NULL;
+        p2m_free_one(p2m);
+    }
+}
+
 /*
  * Local variables:
  * mode: C
--- a/xen/arch/x86/mm/mm-locks.h
+++ b/xen/arch/x86/mm/mm-locks.h
@@ -25,8 +25,6 @@
 #ifndef _MM_LOCKS_H
 #define _MM_LOCKS_H
 
-#include <asm/mem_sharing.h>
-
 /* Per-CPU variable for enforcing the lock ordering */
 DECLARE_PER_CPU(int, mm_lock_level);
 
--- /dev/null
+++ b/xen/arch/x86/mm/nested.c
@@ -0,0 +1,74 @@
+/******************************************************************************
+ * arch/x86/mm/nested.c
+ *
+ * Parts of this code are Copyright (c) 2009 by Citrix Systems, Inc. (Patrick Colp)
+ * Parts of this code are Copyright (c) 2007 by Advanced Micro Devices.
+ * Parts of this code are Copyright (c) 2006-2007 by XenSource Inc.
+ * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
+ * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <xen/sched.h>
+#include <asm/p2m.h>
+#include "mm-locks.h"
+#include "p2m.h"
+
+void p2m_nestedp2m_init(struct p2m_domain *p2m)
+{
+    INIT_LIST_HEAD(&p2m->np2m_list);
+
+    p2m->np2m_base = P2M_BASE_EADDR;
+    p2m->np2m_generation = 0;
+}
+
+int p2m_init_nestedp2m(struct domain *d)
+{
+    unsigned int i;
+    struct p2m_domain *p2m;
+
+    mm_lock_init(&d->arch.nested_p2m_lock);
+    for ( i = 0; i < MAX_NESTEDP2M; i++ )
+    {
+        d->arch.nested_p2m[i] = p2m = p2m_init_one(d);
+        if ( p2m == NULL )
+        {
+            p2m_teardown_nestedp2m(d);
+            return -ENOMEM;
+        }
+        p2m->p2m_class = p2m_nested;
+        p2m->write_p2m_entry_pre = NULL;
+        p2m->write_p2m_entry_post = nestedp2m_write_p2m_entry_post;
+        list_add(&p2m->np2m_list, &p2m_get_hostp2m(d)->np2m_list);
+    }
+
+    return 0;
+}
+
+void p2m_teardown_nestedp2m(struct domain *d)
+{
+    unsigned int i;
+    struct p2m_domain *p2m;
+
+    for ( i = 0; i < MAX_NESTEDP2M; i++ )
+    {
+        if ( !d->arch.nested_p2m[i] )
+            continue;
+        p2m = d->arch.nested_p2m[i];
+        list_del(&p2m->np2m_list);
+        p2m_free_one(p2m);
+        d->arch.nested_p2m[i] = NULL;
+    }
+}
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -35,7 +35,6 @@
 #include <asm/page.h>
 #include <asm/paging.h>
 #include <asm/p2m.h>
-#include <asm/hvm/vmx/vmx.h> /* ept_p2m_init() */
 #include <asm/mem_sharing.h>
 #include <asm/hvm/nestedhvm.h>
 #include <asm/altp2m.h>
@@ -56,17 +55,9 @@ boolean_param("hap_2mb", opt_hap_2mb);
 
 DEFINE_PERCPU_RWLOCK_GLOBAL(p2m_percpu_rwlock);
 
-static void p2m_nestedp2m_init(struct p2m_domain *p2m)
-{
 #ifdef CONFIG_HVM
-    INIT_LIST_HEAD(&p2m->np2m_list);
 
-    p2m->np2m_base = P2M_BASE_EADDR;
-    p2m->np2m_generation = 0;
-#endif
-}
-
-static int p2m_init_logdirty(struct p2m_domain *p2m)
+int p2m_init_logdirty(struct p2m_domain *p2m)
 {
     if ( p2m->logdirty_ranges )
         return 0;
@@ -79,7 +70,7 @@ static int p2m_init_logdirty(struct p2m_
     return 0;
 }
 
-static void p2m_free_logdirty(struct p2m_domain *p2m)
+void p2m_free_logdirty(struct p2m_domain *p2m)
 {
     if ( !p2m->logdirty_ranges )
         return;
@@ -88,205 +79,6 @@ static void p2m_free_logdirty(struct p2m
     p2m->logdirty_ranges = NULL;
 }
 
-/* Init the datastructures for later use by the p2m code */
-static int p2m_initialise(struct domain *d, struct p2m_domain *p2m)
-{
-    int ret = 0;
-
-    mm_rwlock_init(&p2m->lock);
-#ifdef CONFIG_HVM
-    INIT_PAGE_LIST_HEAD(&p2m->pages);
-#endif
-
-    p2m->domain = d;
-    p2m->default_access = p2m_access_rwx;
-    p2m->p2m_class = p2m_host;
-
-    if ( !is_hvm_domain(d) )
-        return 0;
-
-    p2m_pod_init(p2m);
-    p2m_nestedp2m_init(p2m);
-
-    if ( hap_enabled(d) && cpu_has_vmx )
-        ret = ept_p2m_init(p2m);
-    else
-        p2m_pt_init(p2m);
-
-    spin_lock_init(&p2m->ioreq.lock);
-
-    return ret;
-}
-
-static struct p2m_domain *p2m_init_one(struct domain *d)
-{
-    struct p2m_domain *p2m = xzalloc(struct p2m_domain);
-
-    if ( !p2m )
-        return NULL;
-
-    if ( !zalloc_cpumask_var(&p2m->dirty_cpumask) )
-        goto free_p2m;
-
-    if ( p2m_initialise(d, p2m) )
-        goto free_cpumask;
-    return p2m;
-
-free_cpumask:
-    free_cpumask_var(p2m->dirty_cpumask);
-free_p2m:
-    xfree(p2m);
-    return NULL;
-}
-
-static void p2m_free_one(struct p2m_domain *p2m)
-{
-    p2m_free_logdirty(p2m);
-    if ( hap_enabled(p2m->domain) && cpu_has_vmx )
-        ept_p2m_uninit(p2m);
-    free_cpumask_var(p2m->dirty_cpumask);
-    xfree(p2m);
-}
-
-static int p2m_init_hostp2m(struct domain *d)
-{
-    struct p2m_domain *p2m = p2m_init_one(d);
-    int rc;
-
-    if ( !p2m )
-        return -ENOMEM;
-
-    rc = p2m_init_logdirty(p2m);
-
-    if ( !rc )
-        d->arch.p2m = p2m;
-    else
-        p2m_free_one(p2m);
-
-    return rc;
-}
-
-static void p2m_teardown_hostp2m(struct domain *d)
-{
-    /* Iterate over all p2m tables per domain */
-    struct p2m_domain *p2m = p2m_get_hostp2m(d);
-
-    if ( p2m )
-    {
-        p2m_free_one(p2m);
-        d->arch.p2m = NULL;
-    }
-}
-
-#ifdef CONFIG_HVM
-static void p2m_teardown_nestedp2m(struct domain *d)
-{
-    unsigned int i;
-    struct p2m_domain *p2m;
-
-    for ( i = 0; i < MAX_NESTEDP2M; i++ )
-    {
-        if ( !d->arch.nested_p2m[i] )
-            continue;
-        p2m = d->arch.nested_p2m[i];
-        list_del(&p2m->np2m_list);
-        p2m_free_one(p2m);
-        d->arch.nested_p2m[i] = NULL;
-    }
-}
-
-static int p2m_init_nestedp2m(struct domain *d)
-{
-    unsigned int i;
-    struct p2m_domain *p2m;
-
-    mm_lock_init(&d->arch.nested_p2m_lock);
-    for ( i = 0; i < MAX_NESTEDP2M; i++ )
-    {
-        d->arch.nested_p2m[i] = p2m = p2m_init_one(d);
-        if ( p2m == NULL )
-        {
-            p2m_teardown_nestedp2m(d);
-            return -ENOMEM;
-        }
-        p2m->p2m_class = p2m_nested;
-        p2m->write_p2m_entry_pre = NULL;
-        p2m->write_p2m_entry_post = nestedp2m_write_p2m_entry_post;
-        list_add(&p2m->np2m_list, &p2m_get_hostp2m(d)->np2m_list);
-    }
-
-    return 0;
-}
-
-static void p2m_teardown_altp2m(struct domain *d)
-{
-    unsigned int i;
-    struct p2m_domain *p2m;
-
-    for ( i = 0; i < MAX_ALTP2M; i++ )
-    {
-        if ( !d->arch.altp2m_p2m[i] )
-            continue;
-        p2m = d->arch.altp2m_p2m[i];
-        d->arch.altp2m_p2m[i] = NULL;
-        p2m_free_one(p2m);
-    }
-}
-
-static int p2m_init_altp2m(struct domain *d)
-{
-    unsigned int i;
-    struct p2m_domain *p2m;
-    struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
-
-    mm_lock_init(&d->arch.altp2m_list_lock);
-    for ( i = 0; i < MAX_ALTP2M; i++ )
-    {
-        d->arch.altp2m_p2m[i] = p2m = p2m_init_one(d);
-        if ( p2m == NULL )
-        {
-            p2m_teardown_altp2m(d);
-            return -ENOMEM;
-        }
-        p2m->p2m_class = p2m_alternate;
-        p2m->access_required = hostp2m->access_required;
-        _atomic_set(&p2m->active_vcpus, 0);
-    }
-
-    return 0;
-}
-#endif
-
-int p2m_init(struct domain *d)
-{
-    int rc;
-
-    rc = p2m_init_hostp2m(d);
-    if ( rc || !is_hvm_domain(d) )
-        return rc;
-
-#ifdef CONFIG_HVM
-    /* Must initialise nestedp2m unconditionally
-     * since nestedhvm_enabled(d) returns false here.
-     * (p2m_init runs too early for HVM_PARAM_* options) */
-    rc = p2m_init_nestedp2m(d);
-    if ( rc )
-    {
-        p2m_teardown_hostp2m(d);
-        return rc;
-    }
-
-    rc = p2m_init_altp2m(d);
-    if ( rc )
-    {
-        p2m_teardown_hostp2m(d);
-        p2m_teardown_nestedp2m(d);
-    }
-#endif
-
-    return rc;
-}
-
 int p2m_is_logdirty_range(struct p2m_domain *p2m, unsigned long start,
                           unsigned long end)
 {
@@ -298,8 +90,6 @@ int p2m_is_logdirty_range(struct p2m_dom
     return 0;
 }
 
-#ifdef CONFIG_HVM
-
 static void change_entry_type_global(struct p2m_domain *p2m,
                                      p2m_type_t ot, p2m_type_t nt)
 {
@@ -751,57 +541,6 @@ int p2m_alloc_table(struct p2m_domain *p
     return 0;
 }
 
-#endif /* CONFIG_HVM */
-
-/*
- * hvm fixme: when adding support for pvh non-hardware domains, this path must
- * cleanup any foreign p2m types (release refcnts on them).
- */
-void p2m_teardown(struct p2m_domain *p2m)
-/* Return all the p2m pages to Xen.
- * We know we don't have any extra mappings to these pages */
-{
-#ifdef CONFIG_HVM
-    struct page_info *pg;
-#endif
-    struct domain *d;
-
-    if (p2m == NULL)
-        return;
-
-    d = p2m->domain;
-
-    p2m_lock(p2m);
-
-    ASSERT(atomic_read(&d->shr_pages) == 0);
-
-#ifdef CONFIG_HVM
-    p2m->phys_table = pagetable_null();
-
-    while ( (pg = page_list_remove_head(&p2m->pages)) )
-        d->arch.paging.free_page(d, pg);
-#endif
-
-    p2m_unlock(p2m);
-}
-
-void p2m_final_teardown(struct domain *d)
-{
-#ifdef CONFIG_HVM
-    /*
-     * We must teardown both of them unconditionally because
-     * we initialise them unconditionally.
-     */
-    p2m_teardown_altp2m(d);
-    p2m_teardown_nestedp2m(d);
-#endif
-
-    /* Iterate over all p2m tables per domain */
-    p2m_teardown_hostp2m(d);
-}
-
-#ifdef CONFIG_HVM
-
 static int __must_check
 p2m_remove_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
                  unsigned int page_order)
--- a/xen/arch/x86/mm/p2m.h
+++ b/xen/arch/x86/mm/p2m.h
@@ -17,12 +17,34 @@
 
 #include <xen/mem_access.h>
 
+struct p2m_domain *p2m_init_one(struct domain *d);
+void p2m_free_one(struct p2m_domain *p2m);
+
 void p2m_pod_init(struct p2m_domain *p2m);
 
 int p2m_add_identity_entry(struct domain *d, unsigned long gfn,
                            p2m_access_t p2ma, unsigned int flag);
 int p2m_remove_identity_entry(struct domain *d, unsigned long gfn);
 
+#ifdef CONFIG_HVM
+int p2m_init_logdirty(struct p2m_domain *p2m);
+void p2m_free_logdirty(struct p2m_domain *p2m);
+#else
+static inline int p2m_init_logdirty(struct p2m_domain *p2m) { return 0; }
+static inline void p2m_free_logdirty(struct p2m_domain *p2m) {}
+#endif
+
+int p2m_init_altp2m(struct domain *d);
+void p2m_teardown_altp2m(struct domain *d);
+
+void p2m_nestedp2m_init(struct p2m_domain *p2m);
+int p2m_init_nestedp2m(struct domain *d);
+void p2m_teardown_nestedp2m(struct domain *d);
+
+int ept_p2m_init(struct p2m_domain *p2m);
+void ept_p2m_uninit(struct p2m_domain *p2m);
+void p2m_init_altp2m_ept(struct domain *d, unsigned int i);
+
 /*
  * Local variables:
  * mode: C
--- /dev/null
+++ b/xen/arch/x86/mm/p2m-basic.c
@@ -0,0 +1,207 @@
+/******************************************************************************
+ * arch/x86/mm/p2m-basic.c
+ *
+ * Basic P2M management largely applicable to all domain types.
+ *
+ * Parts of this code are Copyright (c) 2009 by Citrix Systems, Inc. (Patrick Colp)
+ * Parts of this code are Copyright (c) 2007 by Advanced Micro Devices.
+ * Parts of this code are Copyright (c) 2006-2007 by XenSource Inc.
+ * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
+ * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <xen/types.h>
+#include <asm/p2m.h>
+#include "mm-locks.h"
+#include "p2m.h"
+
+/* Init the datastructures for later use by the p2m code */
+static int p2m_initialise(struct domain *d, struct p2m_domain *p2m)
+{
+    int ret = 0;
+
+    mm_rwlock_init(&p2m->lock);
+#ifdef CONFIG_HVM
+    INIT_PAGE_LIST_HEAD(&p2m->pages);
+#endif
+
+    p2m->domain = d;
+    p2m->default_access = p2m_access_rwx;
+    p2m->p2m_class = p2m_host;
+
+    if ( !is_hvm_domain(d) )
+        return 0;
+
+    p2m_pod_init(p2m);
+    p2m_nestedp2m_init(p2m);
+
+    if ( hap_enabled(d) && cpu_has_vmx )
+        ret = ept_p2m_init(p2m);
+    else
+        p2m_pt_init(p2m);
+
+    spin_lock_init(&p2m->ioreq.lock);
+
+    return ret;
+}
+
+struct p2m_domain *p2m_init_one(struct domain *d)
+{
+    struct p2m_domain *p2m = xzalloc(struct p2m_domain);
+
+    if ( !p2m )
+        return NULL;
+
+    if ( !zalloc_cpumask_var(&p2m->dirty_cpumask) )
+        goto free_p2m;
+
+    if ( p2m_initialise(d, p2m) )
+        goto free_cpumask;
+    return p2m;
+
+ free_cpumask:
+    free_cpumask_var(p2m->dirty_cpumask);
+ free_p2m:
+    xfree(p2m);
+    return NULL;
+}
+
+void p2m_free_one(struct p2m_domain *p2m)
+{
+    p2m_free_logdirty(p2m);
+    if ( hap_enabled(p2m->domain) && cpu_has_vmx )
+        ept_p2m_uninit(p2m);
+    free_cpumask_var(p2m->dirty_cpumask);
+    xfree(p2m);
+}
+
+static int p2m_init_hostp2m(struct domain *d)
+{
+    struct p2m_domain *p2m = p2m_init_one(d);
+    int rc;
+
+    if ( !p2m )
+        return -ENOMEM;
+
+    rc = p2m_init_logdirty(p2m);
+
+    if ( !rc )
+        d->arch.p2m = p2m;
+    else
+        p2m_free_one(p2m);
+
+    return rc;
+}
+
+static void p2m_teardown_hostp2m(struct domain *d)
+{
+    /* Iterate over all p2m tables per domain */
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+
+    if ( p2m )
+    {
+        p2m_free_one(p2m);
+        d->arch.p2m = NULL;
+    }
+}
+
+int p2m_init(struct domain *d)
+{
+    int rc;
+
+    rc = p2m_init_hostp2m(d);
+    if ( rc || !is_hvm_domain(d) )
+        return rc;
+
+    /*
+     * Must initialise nestedp2m unconditionally
+     * since nestedhvm_enabled(d) returns false here.
+     * (p2m_init runs too early for HVM_PARAM_* options)
+     */
+    rc = p2m_init_nestedp2m(d);
+    if ( rc )
+    {
+        p2m_teardown_hostp2m(d);
+        return rc;
+    }
+
+    rc = p2m_init_altp2m(d);
+    if ( rc )
+    {
+        p2m_teardown_hostp2m(d);
+        p2m_teardown_nestedp2m(d);
+    }
+
+    return rc;
+}
+
+/*
+ * Return all the p2m pages to Xen.
+ * We know we don't have any extra mappings to these pages.
+ *
+ * hvm fixme: when adding support for pvh non-hardware domains, this path must
+ * cleanup any foreign p2m types (release refcnts on them).
+ */
+void p2m_teardown(struct p2m_domain *p2m)
+{
+#ifdef CONFIG_HVM
+    struct page_info *pg;
+#endif
+    struct domain *d;
+
+    if ( !p2m )
+        return;
+
+    d = p2m->domain;
+
+    p2m_lock(p2m);
+
+    ASSERT(atomic_read(&d->shr_pages) == 0);
+
+#ifdef CONFIG_HVM
+    p2m->phys_table = pagetable_null();
+
+    while ( (pg = page_list_remove_head(&p2m->pages)) )
+        d->arch.paging.free_page(d, pg);
+#endif
+
+    p2m_unlock(p2m);
+}
+
+void p2m_final_teardown(struct domain *d)
+{
+    if ( is_hvm_domain(d) )
+    {
+        /*
+         * We must tear down both of them unconditionally because
+         * we initialise them unconditionally.
+         */
+        p2m_teardown_altp2m(d);
+        p2m_teardown_nestedp2m(d);
+    }
+
+    /* Iterate over all p2m tables per domain */
+    p2m_teardown_hostp2m(d);
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -35,6 +35,7 @@
 #include <xen/softirq.h>
 
 #include "mm-locks.h"
+#include "p2m.h"
 
 #define atomic_read_ept_entry(__pepte)                              \
     ( (ept_entry_t) { .epte = read_atomic(&(__pepte)->epte) } )
--- a/xen/include/asm-x86/hvm/vmx/vmx.h
+++ b/xen/include/asm-x86/hvm/vmx/vmx.h
@@ -594,15 +594,11 @@ unsigned int vmx_get_cpl(void);
 void vmx_inject_extint(int trap, uint8_t source);
 void vmx_inject_nmi(void);
 
-int ept_p2m_init(struct p2m_domain *p2m);
-void ept_p2m_uninit(struct p2m_domain *p2m);
-
 void ept_walk_table(struct domain *d, unsigned long gfn);
 bool_t ept_handle_misconfig(uint64_t gpa);
 int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
                        unsigned int order, bool *ipat, p2m_type_t type);
 void setup_ept_dump(void);
-void p2m_init_altp2m_ept(struct domain *d, unsigned int i);
 /* Locate an alternate p2m by its EPTP */
 unsigned int p2m_find_altp2m_by_eptp(struct domain *d, uint64_t eptp);
 


