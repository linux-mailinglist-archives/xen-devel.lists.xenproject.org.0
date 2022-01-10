Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9681489D84
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 17:27:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255419.437683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xWK-0005tj-VB; Mon, 10 Jan 2022 16:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255419.437683; Mon, 10 Jan 2022 16:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xWK-0005qw-Rf; Mon, 10 Jan 2022 16:27:44 +0000
Received: by outflank-mailman (input) for mailman id 255419;
 Mon, 10 Jan 2022 16:27:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n6xWJ-0005LN-MX
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 16:27:43 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c4f73cd-7232-11ec-81c1-a30af7de8005;
 Mon, 10 Jan 2022 17:27:42 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-b74EuAIoNwSR-9eoBflEuQ-1; Mon, 10 Jan 2022 17:27:41 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3392.eurprd04.prod.outlook.com (2603:10a6:803:7::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 16:27:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 16:27:40 +0000
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
X-Inumbo-ID: 3c4f73cd-7232-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641832062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Ci6FYr5vgpsddeQQwvwG0AliVo/oTZ9JlrqAuexlIw=;
	b=SZF/aNXqj6NJBdSZ4qh80TpE0i0lJ1RQf/fDSsuanWnCVohSGDZktJytRmzXrfcIBLqR/x
	D7uWt1XTCaSwCGVwusMZsB3mM48GuMz/iCwfX7WD8HSdmInK1OGiG2fU7CgP+jXokbQzD5
	u1E63MDV9MPDXKKeRIkxvO2BYOJzj/A=
X-MC-Unique: b74EuAIoNwSR-9eoBflEuQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oXe3FErESdwWK/tVqWDUYncUiGknfHvuriFH0ty0fpW4RZnNwhcCFtACO/qcQylUXmKFonbiVZ6RGSBiJLMSWYhWnncZ87gl/Lxmtr/o8U4u8hFeBnLn9FPxYMjyYZebl3KmtlmT1DccFdcq7/BzwqSxGQVtd2wzcH1D8h/n0kZX/zcA89krCm8k14VDInjg49nSkr4gOPxHyFK+suO3t4DMqw903/hcOwFC+LNXNkVg0Vxi/Cf7833A7LYIs9jykhg4xfRA+SbO60i/4MGfFcxbY7lf7zaHazSxKGxFzSUliICYr4ZWj98BIRLXeXSBEc2pxqwWd/R/ZvSpSQ+ePg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Ci6FYr5vgpsddeQQwvwG0AliVo/oTZ9JlrqAuexlIw=;
 b=N1GZOzsz9A9oPgAYorYKQuEeGisKYaZdQCRQOj3zDZ6C9dtyv4pbgCBGDjVL3abD+fQDzO0aSq1X8N17E9wmf7XlPLcuGfHUBdOxgEEDywum+rDY3Z790zcDubGPwyz4rPPXAf4E9BhM5C17SeyjQ5BvQlKEmxt6m+ChhZeLrTiG/8DgP4NfXvm3kYNpvhiZvGhSTPB3eNAgVHFy1iYXQRBpngwLTgRkYV+5nH56rqPbrJgLrH1kRzyWuTxOyWD5nz0H9Lx1uUmCprsu0hd1N1h+yeDVjaR6xCzH1j84JKMpw+wbDC2tK97ZFE3liPU2/vrqDN/YZ69UAcVDoMI6BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ca78dac2-98d8-0fcb-4aea-31aac8e94309@suse.com>
Date: Mon, 10 Jan 2022 17:27:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: [PATCH v3 07/23] IOMMU: have iommu_{,un}map() split requests into
 largest possible chunks
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
In-Reply-To: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0301CA0030.eurprd03.prod.outlook.com
 (2603:10a6:206:14::43) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76fa2955-1683-4df7-8fef-08d9d4561efc
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3392:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB339201B31758DE0CCC9CB578B3509@VI1PR0402MB3392.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	raB7xktxxd0Gs1P9zrH+PqCt4PoNG39gAcJ21lW15J/BPfr4ThcLvUYmmUFfdjdWk/wuuVxrcLQKa2IqClWaK18FVR5zIG0nhkLzEhdxMs3I13sd4ptiOLKchXoRRWJE/kjUoz9PaQZpG7y+jgBFcG1PlhJFu9u9BV6Dt9CfTNztHbfeXqM1C//U7PEE+/4K8W3Fz5wVrpjq4TOfpjG0khbsivZn615RrE26vpC0azPSXweabAxOVIxpGmfYLlfG9yarC19KpopkL2y3v9Uddh9H0FJm6jcWSCRBWeyJmDYqjv4H+S1qHN+oE+DL88yeie/IG20zsSHMAaGYj38/iRl59JgO0WiFs1gSmFgLvJdpcI46/I54UDYxcKHOPvL7IYkrIWgJnfz4PTjYA4cWUZpD/R1brt5ZRRzlRnKqGrQUi93CvfwdFXRWSZwgB7UjmYP+v2UkMct90ALeG3tDWsEHov7/aHiIdojsIs4Zm259SdbJwhwhTvEEkdp8UGyorr7xZ3abKkrXum9+431PhjHdolgKfj0fZUrPWxbhJYyloZxJd/FcZWn1ir9VV3EHs68rxwwYfwLrR6uCv1BntxALaGPFSaUOo0rJhuxVjEjNgYSkdjM3zClLywtDAr1N28iqA2TRZE7IlHhfMlM4I/0PN6f/OLzWehmFdsB8yucC0O5LuB9yuxHrvOuoZCyF1f1iuk8rSgPYOsTeLd16F33Ue1ocdlq6ed+xOc0c1tU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(6512007)(66476007)(66556008)(66946007)(86362001)(8936002)(2616005)(316002)(5660300002)(508600001)(31686004)(26005)(31696002)(186003)(6916009)(38100700002)(36756003)(6506007)(8676002)(6486002)(2906002)(4326008)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHdVVmV1eEkyMXhSaG84NjJZdEJ2TGNQTTFYOE84MmZTRVc5bG1xbVQxaUNp?=
 =?utf-8?B?S1lrZEFKRmhXKytkWEdYelFROUNqSWVpZUJLRCt6RXNQcW9qTEFmVjFjUGRm?=
 =?utf-8?B?WTRzcUZnVDA5THlIMEcrbEh2ZHlJYnZQRkNyanVGUnpmcHZLczcxZ1JsMHRF?=
 =?utf-8?B?TDUxQi9nc05Tai9neHVQZENZU3BNcVJnYUEybnNMdG9leUxMbUFVNW9hTmdw?=
 =?utf-8?B?TGRaU2paL3dkY1NhNTZyTmwzbkRTQ1NWRVY1aXBDZncxSjU1Q2lzeWVHZW5C?=
 =?utf-8?B?OXZrelg1SWo0SWg2a1hqaDVuZ3BvUnlGQkVJOTZaaW1WMmJ3WjRqQmE4am05?=
 =?utf-8?B?WE42YXpMK3hZSXJBZ0VEb3JsNVVtUm9TbXQwNy9JalM3bU40U0VqSllkMzNw?=
 =?utf-8?B?eUFHN1k0WFJoQWFCbE5uUTk3eTVmbGRkWSt2SU9wdzZzUWJ3a3lUTEwrZE1K?=
 =?utf-8?B?VzJmMzVmckU2TTM0RmhuOHpXc2VvZmUrNk94ZE95cjlseG5YOEJoNCtXcFZP?=
 =?utf-8?B?WVYxVldHZWxUOXowb2ZFZEhBWlM4bSt3OFl1UytZQ2VPL2Z0cTJQOU50eHpy?=
 =?utf-8?B?c1A3UDcvOGd1TU0yTmxIZXhzSTNrTDdNSjY5N3NabGdoZ3ZTWWR0NW9UVlI3?=
 =?utf-8?B?N2Iwdm94V1RUK2FGbkh4WUpSc2RoMlYvM3FaYTN6RjlXNC9iOUlpV2tneVJF?=
 =?utf-8?B?T0k0UDJtS2VzSWFPcmJpck82UkNVc1RPU3pJZW0vSDh4T0FjNGxGQkVITDdD?=
 =?utf-8?B?VDJhN0tIS0dpRTFUNVVWY2JqMHZ4bWdhTU1hMjVhK1ovR2JyRDZIRFRTRkdF?=
 =?utf-8?B?M1hVUHQrRVZFL2lQczVWNzY2QTNnZi9jUVo2U0dtL2orNnZtZTEwNzFIOUxm?=
 =?utf-8?B?OVY5eFJEZUNvT1FRbU82L01vNytVU2VhZTIxUjU4VmY4RFVPZHRsdGVNNFlq?=
 =?utf-8?B?dU1yQ1hqYmhNY3IzU3huVHV3WVdOSi9ZQThlNVp0SGQyajMwbm5JMFU5dXRm?=
 =?utf-8?B?ZkNTTGlWbUZlTVZsdWVIQnFHQVIydS8xNmpwc1ZRMTFJdjhCck0rb1lCQndh?=
 =?utf-8?B?YlpFUlM4YW41YlJqVWxtMm4vVGhwOGFwcHBpQ21ZajBlUEVpYTY4dnlUcXJj?=
 =?utf-8?B?Zk5MVFl4ZTVtZzB1dEVNNll1cWtTNXJXL3lrdVlnYVV1a0Z4blZhN2JpTFEv?=
 =?utf-8?B?YTZMNmFsMUZhbEk0NGNkM2pKUE9pRlBMNUxEWFE1Wit5WW9nZmNOakxYUXVR?=
 =?utf-8?B?dVpoRWUyOGJKVTJDT3RUQnhCdmNWY3VxMVE3MzEwaDhnNWRNQ3FCTk9rNDQ0?=
 =?utf-8?B?VHZwMVVaWTlOaEpicVYzMkhiRlJta3F4VDVxQncvbGZaZktGekE4bERmUGdI?=
 =?utf-8?B?UWpteDhOVXlndnZPUmpYWWg5a21KUTlmSjZLQy9vMm1OYmsyQlBWUEI2a2No?=
 =?utf-8?B?aGozUXF3c2pNQnJaREYwdUJ2MmVJb3N3ZFQ1UWlGMGs1M3Q5dDN4VkRhRmJr?=
 =?utf-8?B?WEhVTlFqOVdiOERXNnJ3NTkyTXkvQktIYzNpUGM5YnFKTG5uK1NmUEt3dmRm?=
 =?utf-8?B?Nm5FU1BrZ1BWbG9yUGZ0RjhobkVQTC9LMU10eFJlUHhlWllEVHlxdDk5UnBP?=
 =?utf-8?B?KzRJRFlHYnNlL1dLMkNxRk5melZuQ2cwY1kwQVhxd0VEMWtMT1BYUHFEd2FL?=
 =?utf-8?B?YlhKQWxSTU5tNk1Vb2FZTzlXZXJyemFzSUZ1Y01PSlV6YXVrNytLSncvYW9T?=
 =?utf-8?B?dGloMENGUjBucEVUbzVxbkRjMzBkQnpSQVVFcGVzUUI5V0VxK29nbDYvYVI4?=
 =?utf-8?B?QjJjVmNwVlFNTFNPY2k2REJyV2VONGk1TjBaWGVQdFNnNEMwYllReWZTM2M5?=
 =?utf-8?B?OTZkM3FMRW5LeHFIbWxjTTBEY24xQnJ4VlB4SzFzclZWbzVGN1dFNHRueHdu?=
 =?utf-8?B?VDlVVENTSGVweVRKbllseTVtUVdlVW1nSlluak8zT0xWbXB0ZHdjWWxZOFZj?=
 =?utf-8?B?QXBmdnBhU2w1eGdHN3NtMkk3LzE5cTNmUmtDNGh3OUdVdXJYejVXZk1PUjBB?=
 =?utf-8?B?RU1BOTFJK25qQitza3BLUSsxUFpVb0ZjaGg5cnluRW0rNFJKVGl4ckFwUWNm?=
 =?utf-8?B?clpzWnkxekxaa1paeUFjeURCZjJUSW05TGZCbHBidm5od3d0OXhta2tNWVVz?=
 =?utf-8?Q?ktixdKHK9Y6hAWSh8voM1G8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76fa2955-1683-4df7-8fef-08d9d4561efc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 16:27:40.2619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: niSfhnqbCFklJOUP9DIxn+G055ylzYnAqBQm5Su01XOvqnDsEvxx1cfD4tj2qj7WIQ1pOw2Uc9j4+PwzeNuzAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3392

Introduce a helper function to determine the largest possible mapping
that allows covering a request (or the next part of it that is left to
be processed).

In order to not add yet more recurring dfn_add() / mfn_add() to the two
callers of the new helper, also introduce local variables holding the
values presently operated on.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Re-base over new earlier patch.

--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -260,12 +260,38 @@ void iommu_domain_destroy(struct domain
     arch_iommu_domain_destroy(d);
 }
 
-int iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
+static unsigned int mapping_order(const struct domain_iommu *hd,
+                                  dfn_t dfn, mfn_t mfn, unsigned long nr)
+{
+    unsigned long res = dfn_x(dfn) | mfn_x(mfn);
+    unsigned long sizes = hd->platform_ops->page_sizes;
+    unsigned int bit = find_first_set_bit(sizes), order = 0;
+
+    ASSERT(bit == PAGE_SHIFT);
+
+    while ( (sizes = (sizes >> bit) & ~1) )
+    {
+        unsigned long mask;
+
+        bit = find_first_set_bit(sizes);
+        mask = (1UL << bit) - 1;
+        if ( nr <= mask || (res & mask) )
+            break;
+        order += bit;
+        nr >>= bit;
+        res >>= bit;
+    }
+
+    return order;
+}
+
+int iommu_map(struct domain *d, dfn_t dfn0, mfn_t mfn0,
               unsigned long page_count, unsigned int flags,
               unsigned int *flush_flags)
 {
     const struct domain_iommu *hd = dom_iommu(d);
     unsigned long i;
+    unsigned int order;
     int rc = 0;
 
     if ( !is_iommu_enabled(d) )
@@ -273,10 +299,15 @@ int iommu_map(struct domain *d, dfn_t df
 
     ASSERT(!IOMMUF_order(flags));
 
-    for ( i = 0; i < page_count; i++ )
+    for ( i = 0; i < page_count; i += 1UL << order )
     {
-        rc = iommu_call(hd->platform_ops, map_page, d, dfn_add(dfn, i),
-                        mfn_add(mfn, i), flags, flush_flags);
+        dfn_t dfn = dfn_add(dfn0, i);
+        mfn_t mfn = mfn_add(mfn0, i);
+
+        order = mapping_order(hd, dfn, mfn, page_count - i);
+
+        rc = iommu_call(hd->platform_ops, map_page, d, dfn, mfn,
+                        flags | IOMMUF_order(order), flush_flags);
 
         if ( likely(!rc) )
             continue;
@@ -284,11 +315,10 @@ int iommu_map(struct domain *d, dfn_t df
         if ( !d->is_shutting_down && printk_ratelimit() )
             printk(XENLOG_ERR
                    "d%d: IOMMU mapping dfn %"PRI_dfn" to mfn %"PRI_mfn" failed: %d\n",
-                   d->domain_id, dfn_x(dfn_add(dfn, i)),
-                   mfn_x(mfn_add(mfn, i)), rc);
+                   d->domain_id, dfn_x(dfn), mfn_x(mfn), rc);
 
         /* while statement to satisfy __must_check */
-        while ( iommu_unmap(d, dfn, i, flush_flags) )
+        while ( iommu_unmap(d, dfn0, i, flush_flags) )
             break;
 
         if ( !is_hardware_domain(d) )
@@ -320,20 +350,25 @@ int iommu_legacy_map(struct domain *d, d
     return rc;
 }
 
-int iommu_unmap(struct domain *d, dfn_t dfn, unsigned long page_count,
+int iommu_unmap(struct domain *d, dfn_t dfn0, unsigned long page_count,
                 unsigned int *flush_flags)
 {
     const struct domain_iommu *hd = dom_iommu(d);
     unsigned long i;
+    unsigned int order;
     int rc = 0;
 
     if ( !is_iommu_enabled(d) )
         return 0;
 
-    for ( i = 0; i < page_count; i++ )
+    for ( i = 0; i < page_count; i += 1UL << order )
     {
-        int err = iommu_call(hd->platform_ops, unmap_page, d, dfn_add(dfn, i),
-                             0, flush_flags);
+        dfn_t dfn = dfn_add(dfn0, i);
+        int err;
+
+        order = mapping_order(hd, dfn, _mfn(0), page_count - i);
+        err = iommu_call(hd->platform_ops, unmap_page, d, dfn,
+                         order, flush_flags);
 
         if ( likely(!err) )
             continue;
@@ -341,7 +376,7 @@ int iommu_unmap(struct domain *d, dfn_t
         if ( !d->is_shutting_down && printk_ratelimit() )
             printk(XENLOG_ERR
                    "d%d: IOMMU unmapping dfn %"PRI_dfn" failed: %d\n",
-                   d->domain_id, dfn_x(dfn_add(dfn, i)), err);
+                   d->domain_id, dfn_x(dfn), err);
 
         if ( !rc )
             rc = err;


