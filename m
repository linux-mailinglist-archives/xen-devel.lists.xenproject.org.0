Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DD250DB40
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 10:34:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312512.529777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuAu-00079t-Oj; Mon, 25 Apr 2022 08:34:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312512.529777; Mon, 25 Apr 2022 08:34:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuAu-00076r-Lg; Mon, 25 Apr 2022 08:34:28 +0000
Received: by outflank-mailman (input) for mailman id 312512;
 Mon, 25 Apr 2022 08:34:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niuAs-0005mk-D8
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 08:34:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8385b456-c472-11ec-a405-831a346695d4;
 Mon, 25 Apr 2022 10:34:25 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-ToR_TdrHMMC6fmfo9YEqkA-1; Mon, 25 Apr 2022 10:34:23 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by PA4PR04MB9567.eurprd04.prod.outlook.com (2603:10a6:102:26d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 25 Apr
 2022 08:34:22 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 08:34:22 +0000
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
X-Inumbo-ID: 8385b456-c472-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650875665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vWBl6T/hSAOh0rV2Tz0Vc2i51OiQePKLr7zssMhmHEk=;
	b=iJiO3at5AyhaD0pkDvAEjgaCB5m8onj+KmNiCfFcLDWcZoMRrct/X6zKtMoJLivPRPtRu6
	ap5MJEkS7H3C5i3SISR2GIBH6LsKtsEkHdlsk8B9UzLZVQijgI7kOqMVn4kwDFLsZ23oZK
	+1+I+Igtk3OAmSXyNwwYyJrYJndFtuc=
X-MC-Unique: ToR_TdrHMMC6fmfo9YEqkA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V0iGxl19zlvHtS3x5PhrvJpKskoHfSjw4QFkmEUlnoe4XsXV1kd15gmM3wGd/HxYM5Q8Vy3yk0ubzTMBmdEdvRu1m4NypasjLdznmNxepBO4sGSLuPVq0v/LzibQPEls9j95zZEs0wWbBkVYP6Yt88ji60T16PnAkHWiNLSsPFzgZ8+uTLySvhCAz+RBQuTNzJJDD7Vycxn6J+9GTvSb7NvvrIO7oarSs1FaLiYoQR+EnjYBV6Dq+svZ7PChMQF/raZQmjjbiqu4LFyxzDQW4cuqVPOMPDAlEpnSjqGzLvdkPDPqegSXsbiiW+vnN/oMsPB8u64SV93QoVob2WpMxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWBl6T/hSAOh0rV2Tz0Vc2i51OiQePKLr7zssMhmHEk=;
 b=k+Fk7Qn+W8Fsa4Er9wdyHjq93t096ejQv6HNToG/ihkdjbPAxKbJ3N8Wu6pKb19MyyNivpQ32CATspIUGN7MV7n56bBWTyGXdncVgTi1ekkPCAMmD61ynEsIe/1CDpliXNLg2WPYjhEmUrCp5z79BB5ll0dBYgSh8ecDu3cc3IvC73Dv1VZeg0ohCpBkZkuZajCqQ1liZ+gP604Nj6GqAjdjtnalNvC6cbnL4BSWfTo7g1Qx7MpClZK2lj2Dt38uuAKwBJAvYbZ9968XwjKTc7Ltx+G6AqZDVnK03WhiuD47pnX8dEeXtdFVeFNVUYiF6xNMz12Dm4NrVoB736yZXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5cb4dc1b-f6b0-89cc-e21c-a27a5daf0290@suse.com>
Date: Mon, 25 Apr 2022 10:34:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH v4 05/21] IOMMU/x86: restrict IO-APIC mappings for PV Dom0
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
In-Reply-To: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0011.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::32) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f64066d-4dbd-41a9-cb13-08da269665f7
X-MS-TrafficTypeDiagnostic: PA4PR04MB9567:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB95677EC948CC2FFDCF524254B3F89@PA4PR04MB9567.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oFkPV4GsiJRxgpE1BeGJBz8SYMYoymPfzbD69Z2LcS11JqaXwU1lENuhXfwNEIQU53YZu8RdqqL17vesN8IibrTjGHbBNEUn+0yHin/hhO8Ynp+pWC7zOyKOp9/bFzCONNiALZ8+f1xB/8q9XDtcIAzIS/yh76TUClHpBGsj6u0iZylbfvrxh3eeFswBabaU/hartMgJpA1b1bCDw4UxME1L1/XQC/JTD3PZJRCPSufqQ7spV11Q95XMkTaIkq5v3MMkdBNj77o0fInzY2SSRzRupaMK8WzcCgn3FyvogJTqssDGKpOG5Wc4ZmSyIZqK3fymW1hnawI19+0e6z52hNumEQqu+eTwtWTkjrme4MpoJGa5mhCHwvi6EG+oXwufdppHfg5VzEsrx9EsnxZ6gdm8QEx12Vu8QimQVnF6llOiEA/arDgwiQzE2U2YYPEJ+ZL0dzhCM1O5XPR+wyt2m3O8YkLGcthYbP1vrEniRfk951rr1g3vheg4rvKIrgKVWGmej3vPpqLi87VM58H8NoXTifg2P5cuo1WoD9ftxTvFvQBE07j1Hm9Lr2VHf4ZEhtQr9JkzCsXOMSWm9PC2KMweSA9pHz/68MjrGNgC0XfBHIJDDAttnqN7hfsBLdn4E/zcwJ1B8/9jhv6SISOPtmHUrkffQyhL60MF/AqHYCQEAE2tDGnYzPbcTErBJlyjNajsg/+ZdW/47gDrNEAWQu9aFT/sewfAm6LkvxC+PTA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(31696002)(5660300002)(508600001)(31686004)(54906003)(6512007)(2616005)(66476007)(6916009)(316002)(186003)(2906002)(83380400001)(4326008)(8676002)(86362001)(38100700002)(6486002)(66556008)(26005)(66946007)(6506007)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0svMWVKTk9sU3FDcmR4b3ZRcHBQU2RoZGhmOVV6d0RvMm5RSmU1MVlTWnVK?=
 =?utf-8?B?WUgrdkFYaEdOY2tlOHNQaHJ5RVJzMXZGeUxaODFxdlVxQW5xUHlkSkFjRHVW?=
 =?utf-8?B?QzNMK1pNRmtjcTFlb3FJbUhmdzJrWVRic2FFM2g0TUtPQmxTVWNhc0dZQVBM?=
 =?utf-8?B?M09YejdPVXF3THlQamhnOHYxWE5qQzNlK3hPcndQZ0V0WTQyOHczZmFLZ3N3?=
 =?utf-8?B?c2h5NVFOL1FmWXRXc3ZTWkM2UVpkYjZCeWdiV0t3QnU4b25UT20vU1o5MThn?=
 =?utf-8?B?Sk1Wcjl2SVk5SDlVL1cvbk16Z1djTFR0SkZtNFRKSTNQNFBzS0xoK08xbThV?=
 =?utf-8?B?VEwycEdxakdZZ0QxSTM0eFFGem51UUV5a0N3Ujl3S01LRTBrTDhoU0dia3pO?=
 =?utf-8?B?bW9GL0pHMzkxQTVwY0I3K1ltTTNmRzZ2WDlXWmlDWXZNMVJFUWZDYzlpRlZq?=
 =?utf-8?B?dVVBaHp5K2ZvQkd1STBYZldmMnhQNGhrckFac2NhbnlEcXAvTEp5ZUFFUFN5?=
 =?utf-8?B?Q2t0Rm5IZ1dzQ0poKzRqd0FKMmdEbWlTV2tBcmlmV1ZrRGlWcG5MSE1pT0pt?=
 =?utf-8?B?NlNhS3NzNEx3WThQc2hjY3pRZU5hOVJrR2dZN3dPN0x0SlNGaFdaektrcEs1?=
 =?utf-8?B?a1FTMTZWL203MjloSW9NY1k5OG5lbll3d2dUcVdHYVgwSGFFK0lVWWpNOXho?=
 =?utf-8?B?Vm1uVEJIREtxM1VXd1ROWkx0TEx3ZitwV2JDTVAxZHp1a05rajdxNGlVL3NW?=
 =?utf-8?B?R0syMVFNcTBraTdGcStpU1E4V3BmdFIrOWhMcVE4NWM3TDlVTVN4L3piWCtH?=
 =?utf-8?B?OStlOFV0VGFmL2pKUEh0T3NtWDBKTGVvSS91V0RYbmhnRi9FMEZub3Q4SkQ4?=
 =?utf-8?B?bE13QTk2STdDbGtINHpZTmticnF4bEFxNmxjWGpNL1A2dkdsVVVvNHlHS1hp?=
 =?utf-8?B?cDhtU0paRG9TbkNLMHkxK0ZIbWRyOEZNVWdmWDBRclNUR0xvNFc2eWhwV0p0?=
 =?utf-8?B?b09xTGp1RVllaHlTd3NIL1VRUExUb0w4cjFpT0EyZGIva0tpT2F5Yy9MdmFG?=
 =?utf-8?B?djFCR1ZCNGQyNko2Z2hjMFVVemNZNWgzNFVKUmoveHRsWDR6RDVYSDZneDl2?=
 =?utf-8?B?RG9LTEVQcmplV0d6REsvMFQxTEV2dDBaWGlBK2lLeVB6Y3B0S3Z1Qkc4Q0oz?=
 =?utf-8?B?QWVBaGZ3VWtKYXFtcHBGTERjNnA3dzlWUzViS2xRcFlQUGdsN0hOeE5aYnlH?=
 =?utf-8?B?VzJ5YVg3dzRlSEtPVzl0NVNwbjRmbHc3Z3FneGdUcDIySG5jN25NSmlGZlQ4?=
 =?utf-8?B?dkZLYzFkOHVRSDNGZ1J6WXE1YkIrdHhaVXpkWXNhalVFbUxTL2hUaGRxMDc3?=
 =?utf-8?B?czcyMG1QV1ZLcUZNcUhXRjJzajdSRGhnMDJ6WUxNbE05RU9IVlgvVlorUmdn?=
 =?utf-8?B?SmRKSG85VGRDTC9NQXBmc2xWQjBTL0lOWUhLZ2NraDZGR1JXS25OcnVXVGtl?=
 =?utf-8?B?a3V5NzU3NjBVM3dkMzFuaTZwQkZpbWZhM3V2ODlnaEkwRmNIOHdqbTB0Y1FT?=
 =?utf-8?B?dHJJMWcvd3R0S1RlTmh4OFlIVmMrdGxYTlNSWEhnOWJhN3AwakdONDdLcU5Y?=
 =?utf-8?B?by9Zd2w1eDhkVDNGSnJnSitkdE9YdFJoQkFIQWNBSkpydkNJMjg3emd6b0xF?=
 =?utf-8?B?Vk82Mm5jYTgyN0FpNDdQWWg1NVZjV3Q3WjFWMG1KUzcyQ214Z3JiUFpBdG8z?=
 =?utf-8?B?R1FwKy82Q05JWEU5SXYwY3dNeWxBQWVXa1NZM3FCV0ROak5tTnhvVkx2RURp?=
 =?utf-8?B?dHpJQzFzNnNBdmZiSmVuYzdiTVBXRjFPcjNwdFJEYjI3V3BwN0R2cVVUZjJT?=
 =?utf-8?B?RXdlWStpV3l0Z3VPeVZZMy9UUWxaTnRhT0VHV28vVlVNNUVzMlR5S0pWOExl?=
 =?utf-8?B?U0RRM1BLZHZOak9WKzBZcko5SFRRS3dyOG12THJOaGJ5K1hoREhBRENkcHNi?=
 =?utf-8?B?MWFnMmFlYzlLZElpME9RSlVtQ3NDMHJhMXNoZ2hvTlBQTk02UGlyVC91TlZx?=
 =?utf-8?B?ZTViT2J2ZXNsYnhoOU8vbzJYWHVWbi96a1ZObWxYd1JtWlhGSDlKSlZ1QlJ6?=
 =?utf-8?B?d3htZ3RIT3NVbkl0ZDR0Yzdock02TW54eEdTakxoWGQ5ejh0SUdvWHJoWFZE?=
 =?utf-8?B?V3FGbUk5R3lxVVQ1N2tyOE1nNnIrdlRNU3FTWHJqSWMxYzVoQjFoc0VLQk4y?=
 =?utf-8?B?NFk3ajljd3RET3hPTS9NUlVIMEdTUURYS0hzUm44QzRreVBKZnh4ZnR3M1Js?=
 =?utf-8?B?OUZiNUExaER4cXlPbFlUZ3NqMDFkbU9yNjhrTnp5bGxsK0JYV2t6dz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f64066d-4dbd-41a9-cb13-08da269665f7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 08:34:22.5596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TciKBrwbBpsQ3N6GgoXP7HCYONyH21uWr1sC4JSnk0xhUhrH4Nw5vpj9X3loRaj71v4NcTbIYvPS/Ll4llKr8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9567

While already the case for PVH, there's no reason to treat PV
differently here, though of course the addresses get taken from another
source in this case. Except that, to match CPU side mappings, by default
we permit r/o ones. This then also means we now deal consistently with
IO-APICs whose MMIO is or is not covered by E820 reserved regions.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
[integrated] v1: Integrate into series.
[standalone] v2: Keep IOMMU mappings in sync with CPU ones.

--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -275,12 +275,12 @@ void iommu_identity_map_teardown(struct
     }
 }
 
-static bool __hwdom_init hwdom_iommu_map(const struct domain *d,
-                                         unsigned long pfn,
-                                         unsigned long max_pfn)
+static unsigned int __hwdom_init hwdom_iommu_map(const struct domain *d,
+                                                 unsigned long pfn,
+                                                 unsigned long max_pfn)
 {
     mfn_t mfn = _mfn(pfn);
-    unsigned int i, type;
+    unsigned int i, type, perms = IOMMUF_readable | IOMMUF_writable;
 
     /*
      * Set up 1:1 mapping for dom0. Default to include only conventional RAM
@@ -289,44 +289,60 @@ static bool __hwdom_init hwdom_iommu_map
      * that fall in unusable ranges for PV Dom0.
      */
     if ( (pfn > max_pfn && !mfn_valid(mfn)) || xen_in_range(pfn) )
-        return false;
+        return 0;
 
     switch ( type = page_get_ram_type(mfn) )
     {
     case RAM_TYPE_UNUSABLE:
-        return false;
+        return 0;
 
     case RAM_TYPE_CONVENTIONAL:
         if ( iommu_hwdom_strict )
-            return false;
+            return 0;
         break;
 
     default:
         if ( type & RAM_TYPE_RESERVED )
         {
             if ( !iommu_hwdom_inclusive && !iommu_hwdom_reserved )
-                return false;
+                perms = 0;
         }
-        else if ( is_hvm_domain(d) || !iommu_hwdom_inclusive || pfn > max_pfn )
-            return false;
+        else if ( is_hvm_domain(d) )
+            return 0;
+        else if ( !iommu_hwdom_inclusive || pfn > max_pfn )
+            perms = 0;
     }
 
     /* Check that it doesn't overlap with the Interrupt Address Range. */
     if ( pfn >= 0xfee00 && pfn <= 0xfeeff )
-        return false;
+        return 0;
     /* ... or the IO-APIC */
-    for ( i = 0; has_vioapic(d) && i < d->arch.hvm.nr_vioapics; i++ )
-        if ( pfn == PFN_DOWN(domain_vioapic(d, i)->base_address) )
-            return false;
+    if ( has_vioapic(d) )
+    {
+        for ( i = 0; i < d->arch.hvm.nr_vioapics; i++ )
+            if ( pfn == PFN_DOWN(domain_vioapic(d, i)->base_address) )
+                return 0;
+    }
+    else if ( is_pv_domain(d) )
+    {
+        /*
+         * Be consistent with CPU mappings: Dom0 is permitted to establish r/o
+         * ones there, so it should also have such established for IOMMUs.
+         */
+        for ( i = 0; i < nr_ioapics; i++ )
+            if ( pfn == PFN_DOWN(mp_ioapics[i].mpc_apicaddr) )
+                return rangeset_contains_singleton(mmio_ro_ranges, pfn)
+                       ? IOMMUF_readable : 0;
+    }
     /*
      * ... or the PCIe MCFG regions.
      * TODO: runtime added MMCFG regions are not checked to make sure they
      * don't overlap with already mapped regions, thus preventing trapping.
      */
     if ( has_vpci(d) && vpci_is_mmcfg_address(d, pfn_to_paddr(pfn)) )
-        return false;
+        return 0;
 
-    return true;
+    return perms;
 }
 
 void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
@@ -368,15 +384,19 @@ void __hwdom_init arch_iommu_hwdom_init(
     for ( ; i < top; i++ )
     {
         unsigned long pfn = pdx_to_pfn(i);
+        unsigned int perms = hwdom_iommu_map(d, pfn, max_pfn);
         int rc;
 
-        if ( !hwdom_iommu_map(d, pfn, max_pfn) )
+        if ( !perms )
             rc = 0;
         else if ( paging_mode_translate(d) )
-            rc = p2m_add_identity_entry(d, pfn, p2m_access_rw, 0);
+            rc = p2m_add_identity_entry(d, pfn,
+                                        perms & IOMMUF_writable ? p2m_access_rw
+                                                                : p2m_access_r,
+                                        0);
         else
             rc = iommu_map(d, _dfn(pfn), _mfn(pfn), 1ul << PAGE_ORDER_4K,
-                           IOMMUF_readable | IOMMUF_writable, &flush_flags);
+                           perms, &flush_flags);
 
         if ( rc )
             printk(XENLOG_WARNING "%pd: identity %smapping of %lx failed: %d\n",


