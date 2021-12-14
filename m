Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A394474620
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 16:13:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246829.425674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx9UQ-0006DJ-51; Tue, 14 Dec 2021 15:13:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246829.425674; Tue, 14 Dec 2021 15:13:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx9UQ-0006Aa-1P; Tue, 14 Dec 2021 15:13:14 +0000
Received: by outflank-mailman (input) for mailman id 246829;
 Tue, 14 Dec 2021 15:13:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pVj/=Q7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mx9UO-0006AU-CB
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 15:13:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59e2b2b6-5cf0-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 16:13:11 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2059.outbound.protection.outlook.com [104.47.8.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-8HEjJ2HxP1-o3b5JGQg4Kw-1; Tue, 14 Dec 2021 16:13:09 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3533.eurprd04.prod.outlook.com (2603:10a6:803:b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.25; Tue, 14 Dec
 2021 15:13:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 15:13:07 +0000
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
X-Inumbo-ID: 59e2b2b6-5cf0-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639494791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LFhltr32nVeBPERlqPOzT0ScrNpALWIB781vsRvEsbk=;
	b=UYVTJbJEjnxLJKaoMMZZY+h8hYmdBjpWGQpBkW4zv98AAvbZkCAbaPRnkdr1gt/vRKk++t
	3rHMdxDapI4sQYk6vqjoKWxySjlNDIWUnDpUKm4wTvgrzSQcLr9YZbncbz/13YpO4ToLk+
	3JayHShNOhg76oFgNqxrFneOJGuDrOE=
X-MC-Unique: 8HEjJ2HxP1-o3b5JGQg4Kw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MIv0tdKOoo3rcjxCgyU35RiRbwWAX693dcOjrNbvjJE1xZ/ju26wHpGSgcVE/OC14T+C4XmDeVmJ7nFS9Eg46y1LSKwaoQnhUYCBb2Mgjf7YuE0e0KGkdz/HgD8QP0rxG59E/ViCc712CcCAH6iF16AUEA9enNgYaGqJ+y3YXlgFYWRllps9Niy7hV1il0WmDeU9FFPV7fZ2oQhkr9nAIvR+q0TGFRxZ/JPXA+BvWLrc5nzMepn1fFqdT3/LaGtP5ny1GSC29AfqWCc4d0Y9/9PHB2W9N3vQlCj5H5J9miK/INgqa/Xr7SjS7MrC1aDDKcIBAh6QyfO+mPJ6kZefnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFhltr32nVeBPERlqPOzT0ScrNpALWIB781vsRvEsbk=;
 b=LxbY3faQh/etsREWJKLycxzmL/rV0x34E6q6oFS9W4RejMoswe1dcSEigq3H5uL5eq8jBrgKy3ycZYEUDI5u3Z9OBdm+asAc66snAYmuSMU30HtJaiX3FqOS4JgflZoMqCpFWvg2PEjkCjCvh8LUswXOiAwA0q73shys/4xMdsqWq7CKTjdHPxdk/rvVT+uA6DbAnzxR+ZeKuoafdqzXWWNXn3qxXAWvc1Dfb89jLt7bzWnOXZF9oCCoHt2MVcuPeNYemjTvmHYb7bMN3rwjllEewkZxMEu0EbafstKJ4VpTJg6fuLmdD51dt+rij4yKFLLHM3x7kk9toA8wIYuIGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f751205c-941a-5ce0-44a1-e8151a1a0887@suse.com>
Date: Tue, 14 Dec 2021 16:13:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: drop/replace MEMORY_GUARD
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0096.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::37) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a3be98f-60a9-409d-4b91-08d9bf143c17
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3533:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3533E0B056680CEC51BE8477B3759@VI1PR0402MB3533.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:514;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0kySnK4Hlom7yrlk8myp/ULleRt7FeJ4b5uW6UPl9mw3LSmBMaXBBB3kwmh1AahLpA3tQPx9x/w38nqcuIb0SaZprWFGVSLpoEEfSK7iQc79R4nYXeU0X6vqtRvBNzKOMA8YSJzKTGk6IVgwOK3pYIxWN/MEieVsCel2n0CWlsthGbIR0ihr/vx9ypB8A8j+XDgwBmGZu92UvuES/ss1l0nzO+Oi+z/Aq/6hCdHOZs83eF2yW00ZgPdruG9K4zHoM+1LpfJ7fq3RYRsJZ6rWtcnzimK3u7ejKffjm1fxojPEojWjNR9bTYLgjY07vepaX92Jsvp6r11mIbEIBsYvWTu5u/PedPjm6kgwO0UfuzU5uf8WVbMrj69zyx42DAYuxeqYqDP4Qc21RtYS10ijXTS5fQMKXJOzX66U51Y1h8X/wXCkvXJjBzSSvhLbRSS7qGLwmMzFssxkJL1/Yy7b6bk6wwVTsUVL5yrl18Yor3VAGW1x3fZtvbJTlxfJlInzCScnGG8AYsMfKsbGcAeiSDxAopSyl4uTlWah6egfmZcMaSnE3XQpLoWTphknFpcVgcfLfjxTK15jZDra+hDGLanxKYod4OorKtfTOb5zy8NbJc3xa6gYlMHYO74jJsLET+OpyyaN6k1IdLurWy+a86Cc6r0DIKaxmMJeCjZJREq0g8EZECe+b2G9/wU9XFPoiX2U8G/r7+4q5FxbkZJhbz1rwUtcfG3+fGGbOqSIZno8K4qzohW0b7YnZ6utsGYu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(5660300002)(6512007)(83380400001)(54906003)(2616005)(2906002)(26005)(86362001)(6916009)(38100700002)(6486002)(66556008)(186003)(8936002)(66476007)(508600001)(66946007)(8676002)(36756003)(4326008)(6506007)(316002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEVyQ2FhMllkWWVUTlJSQlhwYjI3NWdOdUtWTThHaTlFT2gycENjcWN1TzJp?=
 =?utf-8?B?RG1sWDcxemtadGlqMHVBRWpXNE8rVHNlbEJVYkd0SzhpaHE2KzBrVzdYWHV6?=
 =?utf-8?B?UFh0KzRqSUhNWDF1bjVId3ZIMGxlNnRLUnZJM1JTZXRsLzkzbFpZcVZ0NEE0?=
 =?utf-8?B?UUY1TTFjcjRnN0ZRamJwTWhNZFBtcDA3ZjdUQ3gvdU52NVRCbFJlQ25tbVJR?=
 =?utf-8?B?ODErTWhPUG5QYWNpN0pVL3VwbktGd25pNTdzenJTUTFtQmp0ejExdlNJWGE0?=
 =?utf-8?B?TXgvSG1qREV6ZEpFUnZUa0RDRzZSL3ErT2ovZmpTSHVoYTZYUzhvN2dDL2o2?=
 =?utf-8?B?aGpRNjRDNUJ1SlhOSko0Y0RabjVKbHNmZklmVG5jeUZKRW5pL1R3NUIrdUpO?=
 =?utf-8?B?N3RJaFVSQ0grcDJDRFg4TEcrNnoxSmpyQStBWlBscjFjUFJqTUMyTlpTZmJ0?=
 =?utf-8?B?M0wyeGVqVGtFNUlVOWxpY2xtSXl5Tk1wVENmT3JkNlB2RC9zcDUyd1dPUkFp?=
 =?utf-8?B?eTJLaDlQSkFCVllkOUo4VWFPRU1odzAwSnlPYkxiTVlHYUkrL25tSFdYVlV1?=
 =?utf-8?B?enhVWkJydkN5Y01oWTRSQVE4M2xzYzJ1ejBJSE10Ui8vTnpROHFyQmdlVCtB?=
 =?utf-8?B?aTlrRGRiUm9udUR4T3pSODFLeWw4R2lKcHdTSGloMG5MaEVXR3hYRm91cUhW?=
 =?utf-8?B?K0JEUXl4alYvM05aczJPSHRIOEw3cXE3SE5wVmloSC9ubFljaDZIQ0h1NXYx?=
 =?utf-8?B?TzR0RHdrUkdLWjZDY3ZEcjVHcFRqZG9JeDlOdjY1S2NMWk1Xem5QajNYeTJY?=
 =?utf-8?B?Y1JBbmZhcUEwdWVUajQ4cGxyckV3QVhhNGQ1S0FvVC9WYmpZZktYU0xtT2lM?=
 =?utf-8?B?clN3NkR2cnRTbFVCd1ZCbkhsSW5IWHRQVjdLb3MzaEhnWW1zWHF0NHRkeVBP?=
 =?utf-8?B?VGJnUWtoWTk0S05FMTV3Vm5HMStLVHo1amoramwya0RkZmNYT2wwUkxQOHE0?=
 =?utf-8?B?L2dkK1FvV2RDZkJidm9hVHFzT2grMlE3Qll2Q3JpUlZ5VTlXY3Q3d1pWeHFF?=
 =?utf-8?B?QllIWWVMdWFnYy9CL08xb1RXb3hKUkUvUkNlSm96MFJZUzc5dklTTDVtRnpj?=
 =?utf-8?B?dXQwcEhQeC9hVHMxbUM5OFBHVGs2SWZuWjE5VTV4cElLdWRtZTdJMUpia05F?=
 =?utf-8?B?MGFzelRCY1dLOXlUV3Y2K2RCU0lGbENYenFUdXhIQ3ZZOFYyWVNMVjluWUQr?=
 =?utf-8?B?dVNQOXNwcmx4NHZWRnhsM2pIeHRFV0RWWmovbXA5b0lPZWVJd1RlWVN3RHN3?=
 =?utf-8?B?dHdCRUpNMzlMUDZsekFVOEdQWmVPWkQ4dTd6b2VlZTlJa3ByMHZDbkJCR3hR?=
 =?utf-8?B?cit2RGVDdmtEcWt0bjRsRHg2N0pDWTdRNUxZV0V0cExyR0laWUN5WnhJeW1v?=
 =?utf-8?B?VEZsMUEyQll2b1B1TitEd3U1ZHo3cnRLVzhmTDd1QmZVaHRrUlpQTXI4azU0?=
 =?utf-8?B?aHEvTnp4VHFOaFExQUJEcVBUU0VxZ3Y5WDNLU0xFYWZ1R0lpazhZaE5hNDc4?=
 =?utf-8?B?ejhUT3RlcFRaL2UxYUYwVmtIUGFkREFhNVBaVlRZenk1K2M1VzNpL0pIaEVo?=
 =?utf-8?B?QlV3NExrWjRwTWVNMTR1Zzh3aGc3U3ZoTVVJK3JpWm91Ym5HTXYvdUFMQi9X?=
 =?utf-8?B?ZFU2THdVeXhWNkgwWTJvYnBMMGZONnE1ajhUd3JJUnpGNTlIOWdySnVyYVBy?=
 =?utf-8?B?TmZhWU9NWnhtZUIybXNjdUlZdjAxSEgxRjRqWHB1alhqOURxUHlEa2ROQXNM?=
 =?utf-8?B?S05oVVJ5UE1hV1VtRW56R3UyS29GOFpJbklKZDhiamFURG1oWmEwQVM1dVdl?=
 =?utf-8?B?MEhWWG1wRmpXVzdQc0pFclo5eFlRMkJjV2YvVzZ1RERRWVo1UGUzUDYweWh5?=
 =?utf-8?B?enBmK3p3a2ZmZ1cxaFZqSU9LWXcrSGN0WHY3YStGcGVrZEI0RHJKc3d6WVlJ?=
 =?utf-8?B?N0R3MWFVdStJcjVaWXUzNDNKOUlkcmJ0WHRvZU1lMW1oUGNEWXh2T2FMVFFJ?=
 =?utf-8?B?ZHpZM3o5Y2hGZzJ1enlzLzBVeGFGU04zeE4yeVhUWDdwZUVFTmpUS3h6eHZm?=
 =?utf-8?B?TDJiM3dNcEsvajdTQkFBcGZOM1lhaURDSVBSTUJKUW9oeTBta0x2UEpQRjZw?=
 =?utf-8?Q?6XXebkvrWm6n409CQ0l9z34=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a3be98f-60a9-409d-4b91-08d9bf143c17
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 15:13:07.9106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R08874XAKCLKxn2yGdgFVFeAIRRI8q0FW3wxvfVpYkfvZ3B/LbuZExYcL4SHK4PaINl61qOxth+PE1mrbWp3qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3533

The functions it guards are dead code. Worse, while intended to exist in
debug builds only, as of commit bacbf0cb7349 ("build: convert debug to
Kconfig") they also get compiled in release builds.

The remaining uses in show_stack_overflow() aren't really related to any
memory guarding anymore - with CET-SS support the stacks now get set up
the same in debug and release builds. Use CONFIG_DEBUG there instead.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6109,36 +6109,6 @@ void free_perdomain_mappings(struct doma
     d->arch.perdomain_l3_pg = NULL;
 }
 
-#ifdef MEMORY_GUARD
-
-static void __memguard_change_range(void *p, unsigned long l, int guard)
-{
-    unsigned long _p = (unsigned long)p;
-    unsigned long _l = (unsigned long)l;
-    unsigned int flags = __PAGE_HYPERVISOR_RW | MAP_SMALL_PAGES;
-
-    /* Ensure we are dealing with a page-aligned whole number of pages. */
-    ASSERT(IS_ALIGNED(_p, PAGE_SIZE));
-    ASSERT(IS_ALIGNED(_l, PAGE_SIZE));
-
-    if ( guard )
-        flags &= ~_PAGE_PRESENT;
-
-    map_pages_to_xen(_p, virt_to_mfn(p), PFN_DOWN(_l), flags);
-}
-
-void memguard_guard_range(void *p, unsigned long l)
-{
-    __memguard_change_range(p, l, 1);
-}
-
-void memguard_unguard_range(void *p, unsigned long l)
-{
-    __memguard_change_range(p, l, 0);
-}
-
-#endif
-
 static void write_sss_token(unsigned long *ptr)
 {
     /*
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -642,7 +642,7 @@ void show_stack_overflow(unsigned int cp
 {
     unsigned long esp = regs->rsp;
     unsigned long curr_stack_base = esp & ~(STACK_SIZE - 1);
-#ifdef MEMORY_GUARD
+#ifdef CONFIG_DEBUG
     unsigned long esp_top, esp_bottom;
 #endif
 
@@ -650,7 +650,7 @@ void show_stack_overflow(unsigned int cp
         printk("Current stack base %p differs from expected %p\n",
                _p(curr_stack_base), stack_base[cpu]);
 
-#ifdef MEMORY_GUARD
+#ifdef CONFIG_DEBUG
     esp_bottom = (esp | (STACK_SIZE - 1)) + 1;
     esp_top    = esp_bottom - PRIMARY_STACK_SIZE;
 
--- a/xen/include/asm-x86/config.h
+++ b/xen/include/asm-x86/config.h
@@ -57,10 +57,6 @@
 
 #define NR_hypercalls 64
 
-#ifndef NDEBUG
-#define MEMORY_GUARD
-#endif
-
 #define STACK_ORDER 3
 #define STACK_SIZE  (PAGE_SIZE << STACK_ORDER)
 
--- a/xen/include/asm-x86/mm.h
+++ b/xen/include/asm-x86/mm.h
@@ -530,14 +530,6 @@ extern struct rangeset *mmio_ro_ranges;
 #define compat_pfn_to_cr3(pfn) (((unsigned)(pfn) << 12) | ((unsigned)(pfn) >> 20))
 #define compat_cr3_to_pfn(cr3) (((unsigned)(cr3) >> 12) | ((unsigned)(cr3) << 20))
 
-#ifdef MEMORY_GUARD
-void memguard_guard_range(void *p, unsigned long l);
-void memguard_unguard_range(void *p, unsigned long l);
-#else
-#define memguard_guard_range(_p,_l)    ((void)0)
-#define memguard_unguard_range(_p,_l)  ((void)0)
-#endif
-
 void memguard_guard_stack(void *p);
 void memguard_unguard_stack(void *p);
 


