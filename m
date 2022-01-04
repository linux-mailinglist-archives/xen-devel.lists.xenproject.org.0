Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57902483F5B
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jan 2022 10:48:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253110.434156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4gQU-0003Md-Jq; Tue, 04 Jan 2022 09:48:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253110.434156; Tue, 04 Jan 2022 09:48:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4gQU-0003Jh-FX; Tue, 04 Jan 2022 09:48:18 +0000
Received: by outflank-mailman (input) for mailman id 253110;
 Tue, 04 Jan 2022 09:48:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+k5u=RU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n4gQS-0003JT-VX
 for xen-devel@lists.xenproject.org; Tue, 04 Jan 2022 09:48:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fcd318e-6d43-11ec-81c0-a30af7de8005;
 Tue, 04 Jan 2022 10:48:14 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-glLD57jTMFqJ93DeBIDRbw-1; Tue, 04 Jan 2022 10:48:13 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7037.eurprd04.prod.outlook.com (2603:10a6:800:125::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Tue, 4 Jan
 2022 09:48:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 09:48:12 +0000
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
X-Inumbo-ID: 6fcd318e-6d43-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641289694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Is8eyqS5UXxKKaxllWqlmG+svyS0Sr+AMv6UtD6Pldg=;
	b=a9KlEQaKe//CBIIUR5vYUp5vTK1BBtIs3DxnS5fMRtR+YwiWag01NnSOguuokmC1tLQ4Nk
	afeVxLY1Ua+HU/iii10XXGzKDi9GgwLIb2n9oxDhyX7MbBzoTk1fxzShfmLtGYMcxQ/eDD
	FGo/BzvkMMp1xbXcr9VANfwHv7xvMUI=
X-MC-Unique: glLD57jTMFqJ93DeBIDRbw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lEPut8a+paEEfOYuA9cYcDBhViwxvnuXSlq/BlwdO/tb9hMAaouLu1eRGMjx6HnYQO5v+ciJQjPGK7iFHJ2MRIhHmPDw+BeuupeXswwvTUdYvwZcLKq9dDcvAiUlYLLSnWSoNZX8xrVIg5Uajhkk7XDhTVk5iQCd4b7dOslAWn52qSy6xCaSpuAgQx3ZSG3A6obLJLAGUoTXxsplQ1J4FSUVtiOaP/7nP04az4ryzaFabbQwpuZmyA692eeS/JomGNlpzNn2Aruu1VZ5OJ/e3KBVqf0m9I/kSCBHAEbbvx1h9rQi0Aren8i+bHLl3sHHZZqTZFG1KT4+tH622U/44w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Is8eyqS5UXxKKaxllWqlmG+svyS0Sr+AMv6UtD6Pldg=;
 b=I1CsEA1zr7vU+Zeys3Xe0SSLoGLH5s9TsHjpPSs2HMmulf93CgF7FTrIPU5EDo4Wc9011twjxfLobvLrvHK/J4ViGDir2v8AJdAQc7ep6whzFurgANLDeIUX9ry7HSvURmVHetTwPeV6VBZDFvyMNV3jNY8MMVZNIYWyufsiA2vJ1ux8Vh9s5W1VKjCzetUryriPKqYWpNvfmyToFlThD1vvcIkmuzoQ4J3Zkx56dxTVsfY0r20iTUKhguQcijtP+ZR1l5/HsPHGCwww1GkNSmFHBw8yWCHl34UKAdvxHz36wAJcZJXanAdUBiD/k5kUkCF3r3vbR/jV1O1ma1ro+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0c61e460-122c-6486-00b7-22a9a24ee1fc@suse.com>
Date: Tue, 4 Jan 2022 10:48:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: [PATCH v2 1/3] x86/PoD: simplify / improve p2m_pod_cache_add()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <e9257e96-ede9-2809-9a77-fd4dc206badc@suse.com>
In-Reply-To: <e9257e96-ede9-2809-9a77-fd4dc206badc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0034.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54f4de68-8035-4ed6-ecff-08d9cf675273
X-MS-TrafficTypeDiagnostic: VI1PR04MB7037:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70376EB435DFBA81626B10E8B34A9@VI1PR04MB7037.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:619;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qa40BG+guA9oAc4vcJdU5dCr1r5Os9Oiyy6SuxGtdezgwN3EDsJgFwHbVS2LLk1WSWTKERlN6TJ0EUKp7iaOEd42FYX7WSMgFBlXIDsZ+AIULKHcdnHgTmViHOqGnrn3ZwGMsH9CjSevduO3IEx6fyQ5SVJg66xrCCal3yhY3xLYfJ6UyI/OcBFPXgqEUZJVrrvFlZQHkcXTcy7Ps1Y6+3hGJzMDsudq53xGlXYRI5LpQLotDNW/sOx/S+N+aoej/u4MSp58f8HG05ZR3hWzDfakKrIb5cen66bXhS9oaa74JQr4pczSt6oc65/UD0ZtsyBVBSLnm1an7U6imbRCc7GgsBL2UsC7ykHky5CI1N+iSWj8/6bWGtBiMMIErV5JsbBsYibzP8yfDOLkSb2l0lFnZ1VbnH9FKmNOqlB+zB9sVEt52Bq8GZu8TUXNyMNuKM2i9pI3rWq5GLAuggxRkiAZZJNTCV8vhmUlz84oDSTI1dc1hZInW+fsUTmkYte3DIj2eOiJSsnOetQPd8G7o3YOZWaP+cvY9q3jFThfUFOz1hFJ41zM9GpjLxMTVfMihMFjJmi9DchtavNWm+aH+F7DdWgldBbS7jgZiZ3A3dFo6gpvW8FUGBL13BCYHIcxGRUFg0pj9PGro5kHVGipKZZTjtZosu/p575xn73XB92tF4EEQqUtaDDIeugYvBrNiUpNjJvyY/qTiGruqZWabu5aWVPJuXTRd4PvfR9qAOc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(6506007)(6486002)(36756003)(31696002)(6916009)(83380400001)(8676002)(38100700002)(8936002)(2906002)(31686004)(4326008)(66946007)(66476007)(54906003)(508600001)(66556008)(5660300002)(2616005)(86362001)(186003)(6512007)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjZwNWVGaGMrVzE0K0F1bmlhV0VHZlR3WWZ2NlZDemd2YVNuQS9RNUxTeW05?=
 =?utf-8?B?TGRyKzlzWW9CYlc0aHRpam1LdDVJNUNZYWRRSTFtd0lCSWhsalJUQ0tuQVJh?=
 =?utf-8?B?cWdjWWg1VzlUWWVlYVVXNzBRM3pmbWxNcUMxZkM1ODZwVjRmSCtwTTErTWFL?=
 =?utf-8?B?OE1UYWY0QmdKcTY3MXRpWTJyZmFNS2MvSFlRbE1TVmtVOWlrZjFCNzA2U0Uw?=
 =?utf-8?B?dmxNdGF3Z0tZNWp2bEpDZyswLzNSR3U5Y0d2U1JBZk4vNElRbG1Ndm14S1o1?=
 =?utf-8?B?SktNMFVBTzJNOThrQ1NCRXRja2NvTy9od0xUeVpxWEgyamh3bnpna1N2M3N0?=
 =?utf-8?B?UFlOQWVSdDVLd1FkMWtnMmZnZjFmNE42Z0VZK1RrQnFOT2FlMkUyRXF3QTVC?=
 =?utf-8?B?QStnck5IVW1tWTJPRWVLdWUrKzJIUmE3NTRWTDJtdjZpNjFWMDJOYURVRjI4?=
 =?utf-8?B?MHpDS1VpRlEwbHhmd0lmaGZiRHFDSzlmL1lET1ZRRG9teUlHVG5PZWN0amZO?=
 =?utf-8?B?UFlnQkZ4ak5lVWE0OVFuSlB2WVFjVHRTem5SZXZmaGdILzgwVnhyTVZCbXdO?=
 =?utf-8?B?THhPaUQ2RGZXODN5UUoxaUluYklGLzlzNmxNcjYwNEo3UUVJa3NubUlnWlJr?=
 =?utf-8?B?WXFINlVSNjcyWEJhWjA1b0pybktJKzRMU28yYW5Od3c3S29NOTlhTnFmOXda?=
 =?utf-8?B?OTd2RXNGSU9FNkpOV3JrbVE1RzRtcFA0YVBJOWV0RlQrT3dZcE5VemxxR3Bj?=
 =?utf-8?B?WFlqTldZNE1ZZ1phbGhIcGNGZGRsWU9LYXpURzJ0bnhWWnNIKytad09hZU1y?=
 =?utf-8?B?ck5INGx6K2RhSUFUWmsrY1dpVEhpZnZ2SUJReGhIMTAzSllyR1ZVSENGdFdE?=
 =?utf-8?B?b2pFT3RPaTlSRHFkcS9hMWJnY0YvWkZTMm12NEF5VVBTdGV2WGNPZ2dlRGpv?=
 =?utf-8?B?S1BqeE9janpjVExEaTI0dFhFNWFhK2tIbnF1c1U3RTZBR21XN2FKK1VLaTQ3?=
 =?utf-8?B?QmhiY2NHLzhkTzhwdEovNUJrM0swOVpIZEFCdXdPM3lFYURySTUvMm0wRXds?=
 =?utf-8?B?MEo2YkpPakpXWW5NMFl0Y1l1WlA4NkFDb1ljVlhwdnlUb0xtSEROR3RQM0FV?=
 =?utf-8?B?ZXlQTGU4aXpleTdIN21BT3JPd2xySVJkSjJWV3JFZmVMUGxTSzRDcWRiY2NU?=
 =?utf-8?B?Tkg0eE8rQkdIdDR0MVRQNmg0T2ltK0VLSVBzUFNQWTV5TFAzSmdBSm1zcVpu?=
 =?utf-8?B?bWFxSlpsbHQ1bW1wYjh4OVBDaStIdFlDcHFUVXgvOVhNRngvRWlxdzl3U2NN?=
 =?utf-8?B?T0U5MWorUDFIMytFdElkUE41SklGcE9SYlMwZHNFS3hiaWt5d1JQMnJTbm9F?=
 =?utf-8?B?aHBxN2d2WDRFbzl3RU5lTmwzbEtkN2w2WktzZ2pFSTNWNFhFVUI0S2MzUFZa?=
 =?utf-8?B?eE0rT0FJVUFLZEp5TUxIYVpZVkVwL3pYQVg3Wnp5NGRBNmpzbkwyZU5wV0NX?=
 =?utf-8?B?RHNsM2RCRFh2UTI5TWJhTXdVSVppQnJKNEhKRGJxTkNweDlNNlpteXdwcUJR?=
 =?utf-8?B?Uk1mUWoxYUgxUXFNT3A4QVBvbWNka3JZTlp0OGZ2WEFpQ1g3NDd0a1VhSUNK?=
 =?utf-8?B?eW9zM3JEcGNPVkRBQkRkTFpFYmJqVGVld1FhRnpvaG84cWN4WjQzOUVOdURs?=
 =?utf-8?B?bjNBcmRSQmxNbjNHbVpESmNmZHBxa0UzM0d1UWVDMkg4L3lBZ2pHdVZEQ25T?=
 =?utf-8?B?REUvM1RRZ01ranlGSytFMWdsWUNGRzlBTVdHTjNvcVUrNlBpcWw1U2VpRGpr?=
 =?utf-8?B?bFNrcVhGeFZjZXphWXhUZFJTdU5WbkJrM2cxYytoQnc4NXdzNml0cTF0OG1t?=
 =?utf-8?B?ODRDL0VLOU5EZ3lhaHZXbU1PN1lENlM1WitydytVYkU0L1AvbHE0U0NCeE03?=
 =?utf-8?B?Risrbk1NSmJnNTBuYm9ndG1nOXlVU2lDeTlZOEp1RWxJYmF1WGIrODc4UDlq?=
 =?utf-8?B?a0RaYmdFNG4wRFRZQXFRRzJ0dUFoOVVFL0xiOE9xMk1GQkR2Wk0zMHE2eU9a?=
 =?utf-8?B?UVBtUm1TS3lYZkU3a0oxUTNJTXd0alpkakdUNFF2d3hrMnlrQ2lzaUxtc1I2?=
 =?utf-8?B?Y1ltOStCY0I0d1FNVmRhdjZIVnRlWjdQTTloT250K1ZNMFdiSWpFNktoeDA2?=
 =?utf-8?Q?PEfXltSGl4aXjaQ4oHcpk0Q=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f4de68-8035-4ed6-ecff-08d9cf675273
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 09:48:12.2435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ROVJzJr5YsNU+DGuViDQEro/M4gjxez6eMyu0alP97jHkvtDgBuaj8CckR1a2Hm7NzOi1MmiM8I8Sssfdp2j2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7037

Avoid recurring MFN -> page or page -> MFN translations. Drop the pretty
pointless local variable "p". Make sure the MFN logged in a debugging
error message is actually the offending one. Return negative errno
values rather than -1 (presently no caller really cares, but imo this
should change). Adjust style.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Return -errno. Drop exclamation mark from log message.

--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -58,34 +58,27 @@ p2m_pod_cache_add(struct p2m_domain *p2m
                   unsigned int order)
 {
     unsigned long i;
-    struct page_info *p;
     struct domain *d = p2m->domain;
+    mfn_t mfn = page_to_mfn(page);
 
 #ifndef NDEBUG
-    mfn_t mfn;
-
-    mfn = page_to_mfn(page);
-
     /* Check to make sure this is a contiguous region */
     if ( mfn_x(mfn) & ((1UL << order) - 1) )
     {
         printk("%s: mfn %lx not aligned order %u! (mask %lx)\n",
                __func__, mfn_x(mfn), order, ((1UL << order) - 1));
-        return -1;
+        return -EINVAL;
     }
 
-    for ( i = 0; i < 1UL << order ; i++)
+    for ( i = 0; i < (1UL << order); i++)
     {
-        struct domain * od;
+        const struct domain *od = page_get_owner(page + i);
 
-        p = mfn_to_page(mfn_add(mfn, i));
-        od = page_get_owner(p);
         if ( od != d )
         {
-            printk("%s: mfn %lx expected owner d%d, got owner d%d!\n",
-                   __func__, mfn_x(mfn), d->domain_id,
-                   od ? od->domain_id : -1);
-            return -1;
+            printk("%s: mfn %lx owner: expected %pd, got %pd\n",
+                   __func__, mfn_x(mfn) + i, d, od);
+            return -EACCES;
         }
     }
 #endif
@@ -98,16 +91,12 @@ p2m_pod_cache_add(struct p2m_domain *p2m
      * promise to provide zero pages. So we scrub pages before using.
      */
     for ( i = 0; i < (1UL << order); i++ )
-        clear_domain_page(mfn_add(page_to_mfn(page), i));
+        clear_domain_page(mfn_add(mfn, i));
 
     /* First, take all pages off the domain list */
     lock_page_alloc(p2m);
-    for ( i = 0; i < 1UL << order ; i++ )
-    {
-        p = page + i;
-        page_list_del(p, &d->page_list);
-    }
-
+    for ( i = 0; i < (1UL << order); i++ )
+        page_list_del(page + i, &d->page_list);
     unlock_page_alloc(p2m);
 
     /* Then add to the appropriate populate-on-demand list. */


