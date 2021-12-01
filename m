Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BBE464BBB
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 11:35:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235823.409044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msMxP-00053Y-6o; Wed, 01 Dec 2021 10:35:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235823.409044; Wed, 01 Dec 2021 10:35:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msMxP-000515-3X; Wed, 01 Dec 2021 10:35:23 +0000
Received: by outflank-mailman (input) for mailman id 235823;
 Wed, 01 Dec 2021 10:35:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msMxN-0004wm-Ao
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 10:35:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61fa0950-5292-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 11:35:20 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-z4X1OmauPkigwr8uNN8wvg-1; Wed, 01 Dec 2021 11:35:19 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6175.eurprd04.prod.outlook.com (2603:10a6:803:fb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 10:35:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 10:35:17 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0198.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Wed, 1 Dec 2021 10:35:16 +0000
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
X-Inumbo-ID: 61fa0950-5292-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638354920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zWiZkdcG1+Y6rmdkCu8SSuxZST9U/BC4xB8A111L5Vc=;
	b=OyCbWRicmrv5T1IiZEpqLHOQT5SMER/GYRsrzLq6Kxc0qTX1aXtoS+4k7Ow95U6WlJj3Pw
	xArLYBVLcYo48p67yBK1HR3a2vRm5kX1UQbRQRLItA4c8o/sk7V61oqnOWz/QzLyGJ9F3d
	bkurU/yfVoec3Vb2KlB05kVC70epoFc=
X-MC-Unique: z4X1OmauPkigwr8uNN8wvg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aWZejNfdecTejKrdOEXvfRj58P9ULZiuBi/nqZMBPnh4owj8UK9juPdcca5crKQbb0OlmCPex7aQZA8MJnNEd+g6GmjVBGcAl8DZhobj4EUxmTSsWkoKQBJysA/VCMIJLzn120wwnst85WhNtljBTS+EQDJxMjfLPUMp5J7vC91XJ/Niu42MwNQLDToYzLoVfzPM/8TOwtVVSH1Y2OPsdU6UBZQMG5XEoZu1x1BLHzeaSRuI9kGFVT8YrtMtjF8mgQx90B8FsPDzXZej/zNvqtPHXRAYIb3R8TRubexQSLGsq9+2EBDNUby5GII8QX+xs3dMpzAyTpfQho6gipER2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zWiZkdcG1+Y6rmdkCu8SSuxZST9U/BC4xB8A111L5Vc=;
 b=fkvmoIiV3DBA58hC7d5JhsHTdKbZHySRUoiTgo5jWI5IH02sTZd8CiEki0tYmPj2Zmy0qiOAIrr700viOPn+odqm5ewWnlJRk4ehvzz/BDhTNh/faPyZ5Inj694c4FkPGL9CGm5YC2m6SYCAoFBJt4mNod86VEkKRHjHCNuBQva51E2Lr2hmYybAYJ3JIqhlNoD5WTWIjZnRh4wXu13f2H9jrUN916UL6jbMOR/t5NBDNs+ZFXomtsIjQM1qwtjL8m2WagoxHHTKRgw6IvLy9WG0LJJtZKLWD1696nEL5yJO8/gK/uFLwEvXz7RaW+3+HE1Y0iU1s5pngGffMhcVpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3bb2018b-8e28-6469-6b6c-c6de935bf669@suse.com>
Date: Wed, 1 Dec 2021 11:35:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH 1/2] x86/shadow: defer/avoid paging_mfn_is_dirty() invocation
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <69b75eb5-82fe-e075-146a-28a9758da433@suse.com>
In-Reply-To: <69b75eb5-82fe-e075-146a-28a9758da433@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0198.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 842f7db3-5124-4375-db99-08d9b4b643fc
X-MS-TrafficTypeDiagnostic: VI1PR04MB6175:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB617560D8F44B4F6CE13A3099B3689@VI1PR04MB6175.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DpGWalZMph4UvWpQvFg8dNImAFBgVi5vdTWJWbfgylxEPZ8Vcn7wAVXkUlFWxM2gkGIyB0NeL5hlYRLx8n4PLawETQmVZcbGSt4N0j+Ge2ZQxhKCfgNeuNuHfCQPQAMR8alaxV3MBZKuzlIW4ls9wFLXPI+RA9Eo812tGSgZ8dnt+VSx/yV5H6v34VDdyhOZDzkkk5JyVorVFs2hfC5b/rHGI6P51JbMrAiY/v2OTbVYLPJt0o8n3qSR4sIWjM3ZDxopx2In5l8ZozOs9hU0LugFDvSsKxj3sTLRfbJoajIR9O0FnFV/IhRCnr+gVNlPUfQMC7+OEcFOBcymT6c2HR+7MynVGxbEcGdYlpXcxB0ynoPUrxoNAljOK8HZLyIfqzFPeUiPYp9pKcI6UNDp5P3Hr8xudNstEfN5qbjmZn05ntjmUQsofwxiBgSXGizB2fh/tYnLJiho7TsYfU/GIM4qaHZcHhXDI4wQh23Fn7ZwFdLHAE5rnjdtPA76VOE8gV0VPIjPutokM3iOFW2Zgzz1x/hxIixaEIyZYRSqhd0B+dYSH+GdsR7tVr3Ue2Hz6bRCd2lmD9vSKb6m9SC9kO3rMjA5S1HHXmytO7Ip3aiDOpDLgBr0v5qkB3zE8Q6xz84mfshU8BX88zYSMWcDJiy2xwyXAssxUiK0DTQoQzUDdr4XIAlx3Tf1EpQDXhJkZhyeY5L4w9wBZxJhTY3Bb0Qw3JfPtuyPphFV4Kq3QN2kx57hUKiYvkS1Bbdpb3yudbt5itOIBmCJmj4DAy60PA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(6486002)(26005)(5660300002)(86362001)(2616005)(8676002)(956004)(54906003)(508600001)(36756003)(66556008)(6916009)(4326008)(31686004)(2906002)(16576012)(316002)(83380400001)(8936002)(31696002)(66946007)(66476007)(38100700002)(14143004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDZiNWE0U01hOVEwNlNNNENLTE9VeERQcHFUMG5Hc0FxMlVlRHMvWlA4STda?=
 =?utf-8?B?V2lwZXZEeWxhLzVpQ3pVdzVxNE5MaHJSbmJ2dkxZaFM2MHhXbk0rei9zcnV5?=
 =?utf-8?B?dkJ0b29wQy90Rk5tV0ZldURnYjFSQ3BTVmxqeUx0Qm5jMzczRkNMU0ljdGlW?=
 =?utf-8?B?L3V3TmF3WmRndVRodzRwK21JcTM3N3MzR0RhR1RwSmk4MTRuNThkZFptYUxY?=
 =?utf-8?B?c3FDaGFjeVVjY2owMFJTaHlWY04zZ1oxQ3RVTTZTcllxbjRKL0dRa2hmSStQ?=
 =?utf-8?B?QkRTa0xzcHFwWitGSUltc0x6MU1USUE0b0ZvVTBqc3kxdEFubmlrV0x5ODlj?=
 =?utf-8?B?dVJNM213MU5aRWk0RG05QmtyNnEwWHVuWHN6OURyKzZ0bE95NVROdWVtZUEy?=
 =?utf-8?B?cVU0emxMV1ZlaUNmd1c5dUlFOGF5QWhEVjVzd2ViOHFtQlRQbWJjTm9kM2Rw?=
 =?utf-8?B?NDVUUm9wMVlBY1N3MHBOeW4xZ0tYN05MYXFkaHQyemdjTmpvSExWdUZyUDhj?=
 =?utf-8?B?akdaQlQzSzJTYW0xU1U1WkxFMk9FM3p1S0tDZTd4RjcxNjRTb0M0MmYrSjI0?=
 =?utf-8?B?OWVtN2gyQ2VzcWtIajlwckpTcHhhUFVMZjlBZHI5WnJVelgwS3p2MER5VWZk?=
 =?utf-8?B?c1h3b1FlVnI5WnZqTVZwTG5IdkFDaGtZamdWNnd0ckU5QjNtLzlxRHgrTGl0?=
 =?utf-8?B?Rmk1M3hocDI2OWt3dk9mNmNkdGRBcFhSS2hCN0JyaGs5bHk5NW5ZRCt3TzY0?=
 =?utf-8?B?dXM3QU1XRm5QZWJNUDNIR1hZa0RZbkdlaWFZcTVrZFZRTlhXeXpDYWxuZ0dy?=
 =?utf-8?B?eklVNHluTEJNOUNPYnZNSHBFdjBYY3RRbXFzNjg2VVU0WUxSRFkzZGlCMUFC?=
 =?utf-8?B?Wkg5NGxPM1VkUzNqWGdJUUxzdysydmRkS2ZHTDhxZjRVeUk0R3JBelVKUjU0?=
 =?utf-8?B?a0lzNEhPVXNobFRHUmtsZFRkMTJBSkpjM1ZMeW5QU1h1aEdpbkwyMWJseGd4?=
 =?utf-8?B?ZCtMelc0TDM4WnQrb3RPdmRvNmlrVkV0dWwzTmgyQXZZUlJvVDQxU3p4ektK?=
 =?utf-8?B?Nnk4cnZZd3FZKzUzc21WK0ptTXRzcGRXaXJiRnltOW9ZVEN5c3Q3QjhWbjhs?=
 =?utf-8?B?aU11SWZ2U0FiTHBrcVNObTZSVWZ1N0xRNmdJOXVXRWk1UXRaSURmUkdteGxy?=
 =?utf-8?B?TUVWTUhDdnBVVjZjWlZteDdtbkNNalJ3QWF4elNqcStaS3kwYktnd3lyN0lx?=
 =?utf-8?B?SGVZdW5LZHJjc244Ukh2a3htKzd3b1hlbUl2VGJFTEQ5VE4wblBPZ3VhVHQw?=
 =?utf-8?B?YnFybUM4dlJTZExDVG1xTVV3TFVjQW9JWXBlRDV0VStoaWIzSkRnbnRtSUg1?=
 =?utf-8?B?UEJ3YjIwemdYODN2bmFnZks4Ykw3SUhoOGh5K0RkREpwdE5KOXVCWHY5SlJn?=
 =?utf-8?B?OFJJNGJMZEFoTktraE9QdE9XSWJuajlsV25QUUR5Z29NMWRSYVBBdnVzMTh3?=
 =?utf-8?B?d3I2NHd4RXMzRTBvb2Rwc0tncmdjWUQ5dk5lcGVFSE1wZ1N5c1BXdi9nOGZF?=
 =?utf-8?B?a205eitCUU41R2tZSGNyQld3amZBb0Z4R3RackVKc1lMOVcxQlNjRDdJVWNQ?=
 =?utf-8?B?UTd3c0pGU0U4WnBLdHBiYVNTWE51WGlMRzY1eTkrUkkvaHJzUnFKNmM2U2hq?=
 =?utf-8?B?Q1JVRFJiSlJ0VUlHT3J5OWdDMUIwQm9hNHhrMmh3aUMwTGhvbjNwTFgwbURp?=
 =?utf-8?B?bTFqdkJBb1FCNkJVRTNuSnN5bUgyanZiUWF1TTd4U05HcHZ5bnV5U2VlM1Ba?=
 =?utf-8?B?bmVKZXFCMnRVc3RpM3ZaNjc0N1UwU3BwcFh4YVVUOEV1bEx5enQzZGNnTDZV?=
 =?utf-8?B?a0NxOVNCV3BhS1BMOVhrbkVSbzluc0syd0dXcUIvdVJGUS9WT2VVMCtldWpF?=
 =?utf-8?B?TkhZLzRWWEFtbE5sSDRrWDNLZytKNHBrcml0WlVIcW9TZUV0VGp1d0ttOTYy?=
 =?utf-8?B?UE1IOUFoSURISm56aXEzcEFHdFhBRjBtbXFxWnppQUZSYTZXSndFQktyZVdw?=
 =?utf-8?B?ZWV0Z2E5allnN1pCdjJqRUVpRS9sSWNrVkZiNXZxUGdXaFpDWTVxOFhoSHFR?=
 =?utf-8?B?T0VzenU2SVQ0UHVSWkxhMHpZVlVhcXF3VS9UbTBkSERCNXhWS28wY2JwUDVv?=
 =?utf-8?Q?Hl3F7L4Qxj7b/SXDCcdXIAM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 842f7db3-5124-4375-db99-08d9b4b643fc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 10:35:16.8597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y3T1qsgzS3Oz6h7mxv4Xi6lQU/TEQmYtuG508I8eIRzstYdqS43c2Gx9kJ/h5s/oLfs1uEyzug9duXuBBToL3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6175

paging_mfn_is_dirty() is moderately expensive, so avoid its use unless
its result might actually change anything. This means moving the
surrounding if() down below all other checks that can result in clearing
_PAGE_RW from sflags, in order to then check whether _PAGE_RW is
actually still set there before calling the function.

While moving the block of code, fold two if()s and make a few style
adjustments.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TBD: Perhaps the dirty-VRAM piece also wants moving down a little, such
     that all three "level == 1" conditionals can be folded?

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -604,23 +604,6 @@ _sh_propagate(struct vcpu *v,
                   && !(gflags & _PAGE_DIRTY)) )
         sflags &= ~_PAGE_RW;
 
-    // shadow_mode_log_dirty support
-    //
-    // Only allow the guest write access to a page a) on a demand fault,
-    // or b) if the page is already marked as dirty.
-    //
-    // (We handle log-dirty entirely inside the shadow code, without using the
-    // p2m_ram_logdirty p2m type: only HAP uses that.)
-    if ( unlikely((level == 1) && shadow_mode_log_dirty(d)) )
-    {
-        if ( mfn_valid(target_mfn) ) {
-            if ( ft & FETCH_TYPE_WRITE )
-                paging_mark_dirty(d, target_mfn);
-            else if ( !paging_mfn_is_dirty(d, target_mfn) )
-                sflags &= ~_PAGE_RW;
-        }
-    }
-
 #ifdef CONFIG_HVM
     if ( unlikely(level == 1) && is_hvm_domain(d) )
     {
@@ -661,6 +644,25 @@ _sh_propagate(struct vcpu *v,
                   ) )
         sflags &= ~_PAGE_RW;
 
+    /*
+     * shadow_mode_log_dirty support
+     *
+     * Only allow the guest write access to a page a) on a demand fault,
+     * or b) if the page is already marked as dirty.
+     *
+     * (We handle log-dirty entirely inside the shadow code, without using the
+     * p2m_ram_logdirty p2m type: only HAP uses that.)
+     */
+    if ( level == 1 && unlikely(shadow_mode_log_dirty(d)) &&
+         mfn_valid(target_mfn) )
+    {
+        if ( ft & FETCH_TYPE_WRITE )
+            paging_mark_dirty(d, target_mfn);
+        else if ( (sflags & _PAGE_RW) &&
+                  !paging_mfn_is_dirty(d, target_mfn) )
+            sflags &= ~_PAGE_RW;
+    }
+
     // PV guests in 64-bit mode use two different page tables for user vs
     // supervisor permissions, making the guest's _PAGE_USER bit irrelevant.
     // It is always shadowed as present...


