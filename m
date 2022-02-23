Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8937F4C1815
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 17:04:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277524.474061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMu7Q-0006s2-5s; Wed, 23 Feb 2022 16:03:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277524.474061; Wed, 23 Feb 2022 16:03:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMu7Q-0006q3-2H; Wed, 23 Feb 2022 16:03:56 +0000
Received: by outflank-mailman (input) for mailman id 277524;
 Wed, 23 Feb 2022 16:03:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMu7O-0006oT-F4
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 16:03:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3277c14a-94c2-11ec-8539-5f4723681683;
 Wed, 23 Feb 2022 17:03:53 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2050.outbound.protection.outlook.com [104.47.6.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-EznRuw0VMlmRQgSV7fuLvg-1; Wed, 23 Feb 2022 17:03:52 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB5921.eurprd04.prod.outlook.com (2603:10a6:208:123::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Wed, 23 Feb
 2022 16:03:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 16:03:50 +0000
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
X-Inumbo-ID: 3277c14a-94c2-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645632233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gz3zvRiEWYkf7LDrZ0GXIkTScZJf9PYhQI0iXwQf+w8=;
	b=KgJjdGIXL4Y/4HqVXyis53AGeWBnx8I6lJ+uzdMqZ6YUjib0UBvHK5m159Ln9SHmABCOEy
	8l8/LVBSOCJJxvarZ1TUeZ8HZX01JqtB07SCpWj44cg2/KvHqh6JFcrUIRGr7JPu+NWfby
	Tb/aaWAUURlgALumGmFUBz8QwF8sdUQ=
X-MC-Unique: EznRuw0VMlmRQgSV7fuLvg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHG+aAk22uie8LA+AXU1k0xkPThoEL6+363srUsCo3+pRU/s06yUo+AvUOWaKE0Rus7xAAF3qt5d7/X0LcKpVr/csfwTwpTVwNezxJoUf1UxH6ImX+TVUSQNXLc+vQe5dwVnXRT3x6LUShz00WKfuPYsxRg2esMnWbL/RcTSdtwvheTGtgJXP2Iy9NivDRUJcH9+LQWHs2jHlL8UHb7Q0V++BuwpgfS2cLfAycfr3Vt58gpkl7Yidq78B7UqtIsHQBVFq7Zm2wr+vmVk1xXUU5rAy6DuP/EsaE6nCsRQcz5W3xK5veGQrqBMBz/rrI1YGmIHb9FxUFGh6to48mVs7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gz3zvRiEWYkf7LDrZ0GXIkTScZJf9PYhQI0iXwQf+w8=;
 b=Gqv+/s9ev9P7wC2KGShPWjxCmG8ITGhN9zrV8Hcsq5TmDD3esuKlJfK7VM+EfJQAxhSwLtKVJNUyy4leoUoP17BiGISFsldEDnaHPOoYG+w2rb4nsFucURLZAy3MLxQFCNADKs/ZI5d2hS7tsPX2bw68fbpov3bfHpIQDBKSlCVUVTtlagHMwTgwAWc58vWYKKevBZU5b5pWC8dJeKYwuDvt9NIYNcBFQkNuuUSe1VqMb1OiVM9ZJBesdIjEofpS0ygVdzjkTbHlDhbeifplPhnpOlD+Sx/M3rBjTdL0qIOvhnhoIG1HFK+Ya+jLFO3XoIVRyFkqKTzRftxRSeoIxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7834a4ea-3b39-5557-28ce-138084f21c31@suse.com>
Date: Wed, 23 Feb 2022 17:03:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v2 10/14] x86/p2m: re-arrange {,__}put_gfn()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
In-Reply-To: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0030.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1576fe68-b70f-4874-d2d6-08d9f6e6151a
X-MS-TrafficTypeDiagnostic: AM0PR04MB5921:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB5921FC80503B5181CDF39CF5B33C9@AM0PR04MB5921.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l2N0jbVMnd3qfjhrZ8PdCAVEgki6jQy4PX8x7Zdp7pDmYCznJEcWZpIU/wsHbc/agfaHg2uoue6havCBpkctuvwG4Snfz5CPEXzKFos9vLbpm4EGCV2AfuxzEQZIOJutCrfIPAJ72ql43G1Xd9FX8cIKQdyl9Fh5UmJJRbJDzBykp65PbGZLhHlZxNP+O/jk4s/I/VnW0KqVexVCHFIa942VL/Wa2MRGbu049zDxXzAS0KU7FC4pY783r/Xp6E/rxzrSJPM73lXw3P3aKxJU8QsN/0McCRhBRnyR/pTifBb7n9g98BGJeB+s+juw154BErVZgsGx6XdKohKH8vo8vwVVVTFMc77WuA8ciJjhZ3wBjk/q0usmjcYThhhW6/K6tZRiz4YtoDoE2TvdXYx66VQIG6Yj27PP6W3hBZneCs8bR/prgPOetwA2vcLoV3tj878a+Go/AelF7DigQFq4BED8HBaBLa7VPDV9pipeOGix467SoS8dKY3+KCG+eLSaava3yIEsUDneqwFBJjVbU7czxOaJduHpfnx2e4eNuic68LQfXK/37EphcTGYJDIoHOxTlhiLkNzHNe94ERfXw57sUUj7wc+yqFtDhAOV2uiCilo1J8FODQqUDV82zrHPU9jN97gDGzyo0Llb7HSXqxYCxl0pXbn7MjZdKaVrzK0xf7XUOJyaV+jjJUeNgxzofa0WzGqm/hjCbijmuXkuXuH8lerVCOqVIhpEFEoaoIrY+8NZ99uZLbA3SiaEzD4c
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(31686004)(2906002)(8936002)(5660300002)(66476007)(6486002)(66946007)(36756003)(8676002)(66556008)(83380400001)(4326008)(6916009)(54906003)(186003)(6506007)(26005)(2616005)(86362001)(38100700002)(31696002)(6512007)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2FZSVRzYk1IZFkyUVRHa0VPNUVQZ0RLaUNzRTMxNnhXZXBMTHZzTG9VUFUv?=
 =?utf-8?B?ZHJFeUtWNVZpWFJadDJIenNaTTVseEp3d2RQV1RMWkVxcWhhOFJVb0ZzU1BY?=
 =?utf-8?B?TW9rYVl1THdHSnhmQ09UcWR2K2ErVlVxeUhISG5leUJtb2lWcngwOXZpWjVV?=
 =?utf-8?B?cHF2ck9tYkxCUm5RK0U2cDExSVh0WXR3Njhac0dHOHhNZzNURmdyVWtPWFpj?=
 =?utf-8?B?amNkYUpXaTl3Rk5MUUUxOXgyalJMQkZpM0daek5QRVgyektYQVRYUkpVMHBZ?=
 =?utf-8?B?dGpVazZubzNPcW9jOE1LU2xyS2Z1amlOUnJzaGVSSHRGNTQ4WTNkTi9KZVFN?=
 =?utf-8?B?MkNvc3YxWTRaVzlaNGJWMmhkYWtSTzQ5NG1zVGZ1QXdaSFh2K0lUVHhld3Vm?=
 =?utf-8?B?RHFpdTZTZ2RkOWNnU2JmUWZvOTlCc3BxZDdzZ3d0Uk9TeVJOenhJdDNsYW5h?=
 =?utf-8?B?T1FxVGI4OXoyc3J0SDJuN3NIeExZRzlSdEY5RzlBdVVhOFNUcFB4elIzb2xj?=
 =?utf-8?B?Z0JIWEl4V1A1am5Hdi9MVThxY3NXVTJJU2Q5bVBDaE9uUzg3ZXlJeHB0MnJ2?=
 =?utf-8?B?WXNMNUhXdFBpWkhlUldQdWQrWEtNTGk4cjdBcHY4TUN4VllpUnNKdkJEQmZ1?=
 =?utf-8?B?a1NsNGovV1FTYjB5anorNHIyZEIrZXJlYWpQNjRVdFhKLzU3YTBZK2tJenRF?=
 =?utf-8?B?M1hIRlFGeFJaaWE3WXRsVDllckdVVEgrWWtSR3hya2dLUW14SmhRMGN2WFgx?=
 =?utf-8?B?K3NyczJYNEppaTdvS0x1TjZ4N1FaR1pwWHMyVVZjY0dxeFM2bmkvdEVnVHZK?=
 =?utf-8?B?TDR5U3JIK3F0OVJNVms3MFZnWXZUYmo1aGVDRUttQUp1cHRZY3FCZnhQMlhK?=
 =?utf-8?B?NnR3SWs0bngzb2ZJK1Via1VVZkE2YTk3dWpvdnlWZGg4dllPcmR2VkQzLy9S?=
 =?utf-8?B?S1J0dVR6a0Z2U3JMRnptQitodFNRS3l6elZzNUdDbTFpRFBOME53dkk0Unpo?=
 =?utf-8?B?SktvUUpsOWxXaE1nTE93SmdnUXFPSjZpQXIyb1lzR0tMZElKb0NzLytGamFa?=
 =?utf-8?B?bmQyenhUcnhWc2Y2d0JaVGRVaTc1VDdZQmNUMUVzRjVyZ1lEd3d0T1hPb3hO?=
 =?utf-8?B?UHRLMjluQ09XcFBpcTlmR1JtcnVHUllPQUdaT1ZrSUw5YTIzSFNQTy9rMkhz?=
 =?utf-8?B?OGMrWVhVWjlUcmQzNGNaWjlVU041aDBIczFIalNQSE4xWVZqT2x1M1NxRWdF?=
 =?utf-8?B?dXJzMzhBRGhsdE01MkgxRGZtNTdKdk1lNUk5SnE0djN4K0dFclJ2VXgvVmJC?=
 =?utf-8?B?ckIyNTRocUZvZjhGcWdXcWY0VFczTFE1QmRBTTgxRUxGMm43ak9oMGZNeHRy?=
 =?utf-8?B?U0R3MC9jT1h2UDFPQUpTS3dodEZvbXVMV1lUbE53ZHpkTU5DM21DNUdaNGZq?=
 =?utf-8?B?VHpNUWdpT21FbldBOE44b2RvY3N4dUhPaXloK1ZVam1EL0dRVmJvaVFvTjJR?=
 =?utf-8?B?TExLQTN2WGloSDhuOEI2N2xlZXFyeVA3SjFTNGE1eEczaUFzTTU3a2dGVk9J?=
 =?utf-8?B?Umt4QjBxWTE0S1k1c0FUejlVVjA2NlRQeFBiaEVnYmcwNXBrZFM2YTBuSVNs?=
 =?utf-8?B?RzlWK2QxV3NSSUZzODJuY0ZkZDEwWUpzcWJnY3FkVUdJODIzeU9kVkJSSVNs?=
 =?utf-8?B?VXprR1V6WUlhR2VMSFAxS3NLSThtYjJIcmJmWVNYSFpudXpZSVFlMVBvRlJa?=
 =?utf-8?B?SnVzM211QWpyeVhaMHcwbnNKK0dIN2xSc3hoS3VmTHd4c3lNMXJibVRqZjAy?=
 =?utf-8?B?V0pRL3VWS09jS2l0bXNnY0ZOY1VObktBMzZMb2hGZm80d0t2M0dURVJRZERU?=
 =?utf-8?B?WW5CYytHTThRMENlUHdXM2V6Q1BrMnRSeWtCRWdWYW1JWi80MjYyN0VlUTBI?=
 =?utf-8?B?cWd4a05pKy91ZGw4dWlINGxwR2lKYXR5b013VzBveGYzUnQvbE4wYTBFRVha?=
 =?utf-8?B?bkJ4M1ZFbExmL0E3d3Y0bWdHU0xFM0tmRm5BMEJHZDdPcTFzU1Y2TDJINTZW?=
 =?utf-8?B?RXpaa3Vnc0UxVytiZWZwdlhQWlRXWmQxcFByei9idWpxU2FaWXZPbE9aU1hz?=
 =?utf-8?B?YzZQZGFWaXBqQVlKb0ZTUlpWbXdVenVabjU2YmFDQ095U0xhMEFFckRpYTRJ?=
 =?utf-8?Q?Ww6ywJmwGo6oNzQ/i7YJ5p4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1576fe68-b70f-4874-d2d6-08d9f6e6151a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 16:03:50.7719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FkRqybpzQRugmbY06uaPz1s3s73T8g6aRoIM/nxeu/1TFN3wHufwfjDcOAKBw3Z1bUcVT6kapoq/NQ3mOcY9kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5921

All explicit callers of __put_gfn() are in HVM-only code and hold a valid
P2M pointer in their hands. Move the paging_mode_translate() check out of
there into put_gfn(), renaming __put_gfn() and making its GFN parameter
type-safe.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: George Dunlap <george.dunlap@citrix.com>
---
v2: Re-base over XSA-388 follow-up.

--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1955,9 +1955,9 @@ int hvm_hap_nested_page_fault(paddr_t gp
              * altp2m_list lock.
              */
             if ( p2m != hostp2m )
-                __put_gfn(p2m, gfn);
+                p2m_put_gfn(p2m, _gfn(gfn));
             p2m_change_type_one(currd, gfn, p2m_ram_logdirty, p2m_ram_rw);
-            __put_gfn(hostp2m, gfn);
+            p2m_put_gfn(hostp2m, _gfn(gfn));
 
             goto out;
         }
@@ -1979,8 +1979,8 @@ int hvm_hap_nested_page_fault(paddr_t gp
 
  out_put_gfn:
     if ( p2m != hostp2m )
-        __put_gfn(p2m, gfn);
-    __put_gfn(hostp2m, gfn);
+        p2m_put_gfn(p2m, _gfn(gfn));
+    p2m_put_gfn(hostp2m, _gfn(gfn));
  out:
     /*
      * All of these are delayed until we exit, since we might
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -509,9 +509,16 @@ static inline mfn_t __nonnull(3) get_gfn
                                               P2M_ALLOC | P2M_UNSHARE)
 
 /* Will release the p2m_lock for this gfn entry. */
-void __put_gfn(struct p2m_domain *p2m, unsigned long gfn);
+void p2m_put_gfn(struct p2m_domain *p2m, gfn_t gfn);
 
-#define put_gfn(d, gfn) __put_gfn(p2m_get_hostp2m((d)), (gfn))
+static inline void put_gfn(struct domain *d, unsigned long gfn)
+{
+    if ( !paging_mode_translate(d) )
+        /* Nothing to do in this case */
+        return;
+
+    p2m_put_gfn(p2m_get_hostp2m(d), _gfn(gfn));
+}
 
 /* The intent of the "unlocked" accessor is to have the caller not worry about
  * put_gfn. They apply to very specific situations: debug printk's, dumps 
--- a/xen/arch/x86/mm/hap/nested_hap.c
+++ b/xen/arch/x86/mm/hap/nested_hap.c
@@ -149,7 +149,7 @@ static int nestedhap_walk_L0_p2m(
 direct_mmio_out:
     *L0_gpa = (mfn_x(mfn) << PAGE_SHIFT) + (L1_gpa & ~PAGE_MASK);
 out:
-    __put_gfn(p2m, L1_gpa >> PAGE_SHIFT);
+    p2m_put_gfn(p2m, gaddr_to_gfn(L1_gpa));
     return rc;
 }
 
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -333,21 +333,13 @@ mfn_t p2m_get_gfn_type_access(struct p2m
     return mfn;
 }
 
-#endif /* CONFIG_HVM */
-
-void __put_gfn(struct p2m_domain *p2m, unsigned long gfn)
+void p2m_put_gfn(struct p2m_domain *p2m, gfn_t gfn)
 {
-    if ( !p2m || !paging_mode_translate(p2m->domain) )
-        /* Nothing to do in this case */
-        return;
-
-    ASSERT(gfn_locked_by_me(p2m, gfn));
+    ASSERT(gfn_locked_by_me(p2m, gfn_x(gfn)));
 
-    gfn_unlock(p2m, gfn, 0);
+    gfn_unlock(p2m, gfn_x(gfn), 0);
 }
 
-#ifdef CONFIG_HVM
-
 /* Atomically look up a GFN and take a reference count on the backing page. */
 struct page_info *p2m_get_page_from_gfn(
     struct p2m_domain *p2m, gfn_t gfn,
@@ -2201,7 +2193,7 @@ int p2m_altp2m_propagate_change(struct d
             else
             {
                 /* At least 2 altp2m's impacted, so reset everything */
-                __put_gfn(p2m, gfn_x(gfn));
+                p2m_put_gfn(p2m, gfn);
 
                 for ( i = 0; i < MAX_ALTP2M; i++ )
                 {
@@ -2225,7 +2217,7 @@ int p2m_altp2m_propagate_change(struct d
                 ret = rc;
         }
 
-        __put_gfn(p2m, gfn_x(gfn));
+        p2m_put_gfn(p2m, gfn);
     }
 
     altp2m_list_unlock(d);
@@ -2310,7 +2302,7 @@ void audit_p2m(struct domain *d,
              * blow away the m2p entry. */
             set_gpfn_from_mfn(mfn, INVALID_M2P_ENTRY);
         }
-        __put_gfn(p2m, gfn);
+        p2m_put_gfn(p2m, _gfn(gfn));
 
         P2M_PRINTK("OK: mfn=%#lx, gfn=%#lx, p2mfn=%#lx\n",
                        mfn, gfn, mfn_x(p2mfn));


