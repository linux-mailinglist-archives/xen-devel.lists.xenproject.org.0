Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 702C83BBEBD
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 17:16:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150356.278016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0QKC-00077p-TF; Mon, 05 Jul 2021 15:15:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150356.278016; Mon, 05 Jul 2021 15:15:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0QKC-00074z-Pp; Mon, 05 Jul 2021 15:15:56 +0000
Received: by outflank-mailman (input) for mailman id 150356;
 Mon, 05 Jul 2021 15:15:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0QKB-00072R-By
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 15:15:55 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e374b8c6-dda3-11eb-844b-12813bfff9fa;
 Mon, 05 Jul 2021 15:15:53 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-tPKz29GRN_e0adUJ8AjNUA-2; Mon, 05 Jul 2021 17:15:52 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5472.eurprd04.prod.outlook.com (2603:10a6:803:d3::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Mon, 5 Jul
 2021 15:15:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 15:15:49 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3PR09CA0014.eurprd09.prod.outlook.com (2603:10a6:102:b7::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 15:15:48 +0000
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
X-Inumbo-ID: e374b8c6-dda3-11eb-844b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625498152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7XE0MZ5Q/V0/alHvDtFRmInLwfamZyLpxplt2pkODz8=;
	b=mJWP6zjGx2WJ8PfR+cK+svDCw0629p5eFklD+7F1/67uP5bklh4lAiK4gUG8JGk0w0Drwj
	ODiEduiYkN7zjeWrTxom6/7kTe5FRYhLpoipANB47iXfLzSLAAQ9vVqV3ibaewVoeaxj5Y
	ud/24vLr71GI5NToWgmCT1lJBq0sYF8=
X-MC-Unique: tPKz29GRN_e0adUJ8AjNUA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WADPiN/JXsDyUbHSx5qzTYfVdMjozrVuaC9j+EZab/3AVhmd/Sif/TCK73CuQuqP5SuNebvCoa4TWaXbYQCa4cnvscec5WEV3HP7OW35YW+YK6xEtx0hbB1YvWVco/NnqB7k51+Ulkifbvwbt4SLPAOOeltFem9hl3rIY1jB5EigEuLHrmIghlblXhXgHc0Rl5Gq2wlEH3KtYT+iOJ3DsvRgmWD8SwoaJx11ED9a0cDB5/rFaE4yCtKvdxTfeJVQYjF0y89EHuLrG9Abaxzwn/Wn7Vf6h9/zo1wp601B5J6SjJEmtFAVWvwSroVFqoMeP774R6y0uPrwybv4hVtLOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XE0MZ5Q/V0/alHvDtFRmInLwfamZyLpxplt2pkODz8=;
 b=VuDYhOeTJcMcRJJVpOViklN0rZm+VKxELRqWowKgJU88NbKpv39/y6teAqplSysKHmc11PZwsCVw07HMcEyqOuuIg6AV+BGZzhirSUkfNTRHgo1Ac2/5uzuEu6p5QSR2fD2fFMEvuJ49DDc3GBBt/ivgKHxq4PjxQrx/bYm4E7D/QgZfxZI2vqsSqMyHdDjYhf+1Raea/NEYAV20Te8+6v12iPz5P0D4cO+heSPC4Gd/5CpoC8T6TbQYy4DOPSUZNQXmcBcMmw2Vwzaa7UCwVFMcqXzP5Ym4HHiBUBbxitPW7vJ7pwcKgc2mqB2hUMKY4T4to4B8t5Eoc4iv/Uhp+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 09/13] libxenguest: restrict PV guest size
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
Message-ID: <94076a26-c19b-4da8-02d5-6c7ce1759969@suse.com>
Date: Mon, 5 Jul 2021 17:15:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3PR09CA0014.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26f0d2e1-51d0-4fe7-1ac9-08d93fc7c558
X-MS-TrafficTypeDiagnostic: VI1PR04MB5472:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB54726EBB865378AA457035ABB31C9@VI1PR04MB5472.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IXA/fcprChrsczjt1FPCnZLBvqRPF3+AphKRsQiScvFF8aZg2XWM3vqXwG9DU2KOl/Y6gLgAeZalv6jmCbNBJ8ExxeVKt1zaAIijK9+UquQuS99yDMlC7IH7u9d4EWKFW5365dPPp2zBEtDYD4vRNlX4zstoqOi2gxuBogn+sAx59fUbYDiu5jI33wopJYSvc7cz8/NeOlluiqZ//STEfBXPeAybRnEWu/7wF4cE2FHd8MIoAOCTCph83IA402rndf6D1uf2xI7hvhY8CoROoULZl6jqq6ai/pscI+uDZ4KDGpvPpCCHT0JdeaQjRvKuZv5w9rRw2He72mOq5cU34kOi5LKb5xtvcdKy818NOx3e5BsZNJ1a25WOwDChABakB7cpd1zfrwoEuynDn5LLMeeceaNhWW5C+LBwyQUK+DYdDV4acnHn5g6DOj8BrcGMziHk8DKyy//McbaUnm1mll4FQE7XqVYKfo39eIRG+Yyg89BAIXmgUIc+MH8lorQXNJ0lj3Mg6QvD6uEZ076Djvzxsj2Vs29K0uU6YSZtMTC36BG/05Jbus4Q1ZKhaYWMb1Hi2JnGDk5cXwbJ82eJ+5iR2ooa+xghvXAfUw2VAyODpq+ihFUHVL5LXfB28QXgzX2v7AiOXHBZdxTXaKgsvce2Dqwj31LRjzJRUDsYXj4aNs6Gb2Z6WZfqzw16aG3RgodjTphR+WftPvY/GMBud6HF8LCQz79gPBMaFWiypYc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(346002)(39860400002)(376002)(136003)(66556008)(66476007)(86362001)(66946007)(5660300002)(16526019)(31696002)(31686004)(38100700002)(36756003)(26005)(186003)(2616005)(83380400001)(54906003)(478600001)(16576012)(316002)(6486002)(956004)(4326008)(6916009)(8936002)(2906002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWNlL3BnVkpXNUtycW84NjBQeVM3QzIwZnVhUVNSTktxUXBVT25qcll2V0xD?=
 =?utf-8?B?Qk03b2lvNFl1d0VvOFQyYkFsem5RbElOby91a05hVEpTTm9XTVlKYk16SHha?=
 =?utf-8?B?V2JrZDhIUmE2ZllJUEJYODlWQkNaMTREMERXNHI5b05hN3J2NUl0TThqV3pP?=
 =?utf-8?B?MUZWMnhRZVBUR0R6TDNxNTl6bjhoQWRueG5JMmhQS0l4ZmdGMUZyeSthNWoy?=
 =?utf-8?B?SU81RmI2SEZEcTdoOHg4dVpjd3FtK21HQ1RWdlNiUVI2M1BsWllCa21YQ1ov?=
 =?utf-8?B?WjlJY2hRSnF4b25VUkZoQUFCWmdJSFJuV2Vwc04xKzU2eFZNcXJDWkVRVTAz?=
 =?utf-8?B?NlhaN21EbnhUUlREN3IwRTk2a3RCbW1lRXRxVHBheWtLZlhDeEZKaUxHdExB?=
 =?utf-8?B?eEgrWFg4bTZDTUNadGZ5MGtwM1VoM0JVZW1WblhTZ044VFo3bGNLR2FRc2x3?=
 =?utf-8?B?Rlc5K1dNRmwwQitldWp3d3huZVJkMTAvR3dOSkV5Z0xhUXYwM0tTUkxZempT?=
 =?utf-8?B?SzVnSlN2eGQzNVpjZXhYaUx4RVhuTEE3T0ZqbnNJKzdid2Vlbk9TSVEvQTNr?=
 =?utf-8?B?cU5wVVBaeTFwK2JGbzNNeWxOVGxJTi96NExHSTFVU1U1dFZqOVU3YW9mVW81?=
 =?utf-8?B?Q0t1SXRMbC9GZHVXVlcrcXRheFVnTmxYNGZLMkFROEJNbVN6aTZWRzluVFZK?=
 =?utf-8?B?WkVySHlOa3hkdUJ0eW5LaFdxVmlzWVViSmZacGo5bmY3OS8rb2l5cWR6bVFV?=
 =?utf-8?B?anpGcjFKaUQ4aTZDdlFQVS95d1dnV3RhMjVtalNOblRRd2FvcW9vQmRKUGY3?=
 =?utf-8?B?WThQMjJKd2V4TlByM0dMVVRWbEUxVlpRbVJLNzZPaGhkT3hYcGRycnpwSDdv?=
 =?utf-8?B?RFllaGlkUytGaFBuM2dGVlRJaUpOT1J5bTh5NDRnZ3hPU2g2VWtmTDEzOGhJ?=
 =?utf-8?B?dUxUSEQ4dUk1VENxVisyYU0vSnJUOFBaaU9Hd092ODNNMU0zUGRCNGgxbHQv?=
 =?utf-8?B?TFFBVi93YXYxdEFmSmlLSkVwNmVlZnlhSVg3Q2VjN0RVRGRpR2hwdHZyRmJN?=
 =?utf-8?B?V2RmYkRkQVhUNU5yam9Ja2VxdEw0T2l4a0l5aHM0SWR2NWFkWEtIZUc3Zksx?=
 =?utf-8?B?bXM4R2Ivc0YyZmxYa2xjbWtTMGMwYUE4SmI3NGFhOFZMb2s4SlN0Qkg4WGh6?=
 =?utf-8?B?Z0k1NUJxektqVWtaR3RQZlc0TTA5bHcrbmgzNHBlb2s0MitwTWdGazNBYzAx?=
 =?utf-8?B?WmoyY1QwQzM1dVdBVXY5OTJwL1RGV1JvQ2Q3T1lYZXBRd2R2QXd2YU5PdEt0?=
 =?utf-8?B?K2VUNFAyMXZhM0ROZENsY2tNRk5vRmRYVlpmdk1tNEhnRllsbEx3QW5QMTRx?=
 =?utf-8?B?T0F6VWRITnh4L2lZbDV5SUwzd1pKOUdwaTZTYy9rb0t4M2ZTL3lkVHFNL05X?=
 =?utf-8?B?T1U1TEQ3ZjVEY0JucFhGY2NRN0ZJbHZENW1rRGhPYWhnTC8zbHZ1TDZPUFpw?=
 =?utf-8?B?ZCs4K0VsTkQ1WGJmZmgvRGJZZFV0ZDB2djUyb2hrQ0pra0JIK0lHVGk5RFpH?=
 =?utf-8?B?UHM1Mzd2WEI2Rm8wMmtGaUU0bmR4QW05aGxFQWRaeDhvOFBySlVRa05kaTVM?=
 =?utf-8?B?blRod0U0TGV1cmJ6cnArckR1SjZPbHZKYmlHN2w4aTBmVXhaeXNkTUtJRkRR?=
 =?utf-8?B?a09GNldsaFMwWXJzWFVCMndnSU5JVU4wNkd0bjlOVlU2RE8wMFFxVHUxUWk0?=
 =?utf-8?Q?2k6+nv+uccW4MMiDHoBgPWhDjrgeYVz03nPLRto?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26f0d2e1-51d0-4fe7-1ac9-08d93fc7c558
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 15:15:49.2672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uq8hewjFD1uk68ufLlLljtfDdBZ1EEJzoBlirxFGXkvbRKvWplMQsYXjFaakVM4IurEvFrYd6GDaqWBhjW7VIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5472

The P2M, the use of PFNs, and hence the maximum valid PFN are purely
software constructs in PV. In principle a guest is free to use arbitrary
PFNs. However, at least page table normalization requires that PFN space
be, like MFN space, limited to the architectural 40 bits (52 address
bits). And of course a 32-bit tool stack places further constraints.

Bounding the values also makes sure that various subsequent calculations
won't truncate values and then continue with inconsistencies (see e.g.
fl_entries vs ctx->x86.pv.p2m_frames in map_p2m_tree()).

While there correct an adjacent error message with wrong way round
wording in restore code and another slightly malformed and misleading
(off by one) one in core dumping code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Integrate into series.
---
In case the save/restore changes don't make it obvious enough: It
escapes me why struct xc_sr_rec_x86_pv_p2m_frames has p2m_pfns[] with
uint64_t element type but {start,end}_pfn both as uint32_t. Imo all
three can sensibly only ever be of the same type.

--- a/tools/include/xen-tools/libs.h
+++ b/tools/include/xen-tools/libs.h
@@ -13,6 +13,10 @@
 #define ARRAY_SIZE(a) (sizeof(a) / sizeof(*a))
 #endif
 
+#ifndef sizeof_field
+#define sizeof_field(type, field) sizeof(((type *)0)->field)
+#endif
+
 #ifndef MAX
 #define MAX(x, y) ((x) > (y) ? (x) : (y))
 #endif
--- a/tools/libs/guest/xg_core_x86.c
+++ b/tools/libs/guest/xg_core_x86.c
@@ -59,6 +59,43 @@ xc_core_arch_memory_map_get(xc_interface
     if ( xc_domain_nr_gpfns(xch, info->domid, &p2m_size) < 0 )
         return -1;
 
+    if ( !p2m_size )
+    {
+        ERROR("Cannot map a guest without P2M");
+        errno = ENODATA;
+        return -1;
+    }
+
+    if ( !info->hvm )
+    {
+        unsigned int guest_width;
+
+        if ( xc_domain_get_guest_width(xch, info->domid, &guest_width) != 0 )
+        {
+            PERROR("Cannot get address size for PV guest");
+            return -1;
+        }
+
+        if ( p2m_size == (guest_width > 4 ? ~0UL : ~0U) )
+        {
+            ERROR("Cannot map a PV guest with invalid P2M");
+            errno = ENODATA;
+            return -1;
+        }
+    }
+
+#ifndef __i386__
+    if ( (p2m_size - 1) >> 40 )
+#else
+    /* Very large domains (> 1TB) will exhaust virtual address space. */
+    if ( (p2m_size - 1) >> 28 )
+#endif
+    {
+        ERROR("Cannot map a guest with P2M size %#lx", p2m_size);
+        errno = EOPNOTSUPP;
+        return -1;
+    }
+
     map = malloc(sizeof(*map));
     if ( map == NULL )
     {
@@ -333,10 +370,30 @@ xc_core_arch_map_p2m_rw(xc_interface *xc
 
     if ( dinfo->p2m_size < info->nr_pages  )
     {
-        ERROR("p2m_size < nr_pages -1 (%lx < %lx", dinfo->p2m_size, info->nr_pages - 1);
+        ERROR("p2m_size < nr_pages (%lx < %lx)", dinfo->p2m_size, info->nr_pages);
         goto out;
     }
 
+    if ( !info->hvm && dinfo->p2m_size == (dinfo->guest_width > 4 ? ~0UL : ~0U) )
+    {
+        ERROR("Cannot r/%c-map a PV guest with invalid P2M", rw ? 'w' : 'o');
+        errno = ENODATA;
+        return -1;
+    }
+
+#ifndef __i386__
+    if ( (dinfo->p2m_size - 1) >> 40 )
+#else
+    /* Very large domains (> 1TB) will exhaust virtual address space. */
+    if ( (dinfo->p2m_size - 1) >> 28 )
+#endif
+    {
+        ERROR("Cannot r/%c-map a guest with P2M size %#lx",
+              rw ? 'w' : 'o', dinfo->p2m_size);
+        errno = EOPNOTSUPP;
+        return -1;
+    }
+
     p2m_cr3 = GET_FIELD(live_shinfo, arch.p2m_cr3, dinfo->guest_width);
 
     p2m_frame_list = p2m_cr3 ? xc_core_arch_map_p2m_list_rw(xch, dinfo, dom, live_shinfo, p2m_cr3)
--- a/tools/libs/guest/xg_sr_restore_x86_pv.c
+++ b/tools/libs/guest/xg_sr_restore_x86_pv.c
@@ -709,10 +709,23 @@ static int handle_x86_pv_p2m_frames(stru
         return -1;
     }
 
+#ifdef __i386__
+    /* Very large domains (> 1TB) will exhaust virtual address space. */
+    if ( data->end_pfn >> 28 )
+#elif 0 /* sizeof(data->end_pfn) > 4 */
+    if ( data->end_pfn >> (ctx->x86.pv.width > 4 ? 40 : 32) )
+#else
+    if ( 0 )
+#endif
+    {
+        ERROR("End pfn in stream (%#x) too large", data->end_pfn);
+        return -1;
+    }
+
     if ( data->start_pfn > data->end_pfn )
     {
-        ERROR("End pfn in stream (%#x) exceeds Start (%#x)",
-              data->end_pfn, data->start_pfn);
+        ERROR("Start pfn in stream (%#x) exceeds End (%#x)",
+              data->start_pfn, data->end_pfn);
         return -1;
     }
 
--- a/tools/libs/guest/xg_sr_save_x86_pv.c
+++ b/tools/libs/guest/xg_sr_save_x86_pv.c
@@ -464,11 +464,40 @@ static int map_p2m_list(struct xc_sr_con
  */
 static int map_p2m(struct xc_sr_context *ctx)
 {
+    xc_interface *xch = ctx->xch;
     uint64_t p2m_cr3;
+    uint64_t max_pfn = GET_FIELD(ctx->x86.pv.shinfo, arch.max_pfn,
+                                 ctx->x86.pv.width);
+
+    if ( !max_pfn )
+    {
+        ERROR("Cannot save a guest without P2M");
+        errno = ENODATA;
+        return -1;
+    }
+
+    if ( max_pfn-- == (ctx->x86.pv.width > 4 ? ~0UL : ~0U) )
+    {
+        ERROR("Cannot save a guest with invalid P2M");
+        errno = ENODATA;
+        return -1;
+    }
+
+#ifndef __i386__
+    if ( max_pfn >> (sizeof_field(struct xc_sr_rec_x86_pv_p2m_frames,
+                                  end_pfn) > 4 ? 40 : 32) )
+#else
+    /* Very large domains (> 1TB) will exhaust virtual address space. */
+    if ( max_pfn >> 28 )
+#endif
+    {
+        ERROR("Cannot save a guest with maximum PFN %#"PRIx64, max_pfn);
+        errno = EOPNOTSUPP;
+        return -1;
+    }
 
     ctx->x86.pv.p2m_generation = ~0ULL;
-    ctx->x86.pv.max_pfn = GET_FIELD(ctx->x86.pv.shinfo, arch.max_pfn,
-                                    ctx->x86.pv.width) - 1;
+    ctx->x86.pv.max_pfn = max_pfn;
     p2m_cr3 = GET_FIELD(ctx->x86.pv.shinfo, arch.p2m_cr3, ctx->x86.pv.width);
 
     return p2m_cr3 ? map_p2m_list(ctx, p2m_cr3) : map_p2m_tree(ctx);


