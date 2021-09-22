Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B0E414C3C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 16:38:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192892.343616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT3OS-000567-TZ; Wed, 22 Sep 2021 14:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192892.343616; Wed, 22 Sep 2021 14:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT3OS-000542-PX; Wed, 22 Sep 2021 14:38:40 +0000
Received: by outflank-mailman (input) for mailman id 192892;
 Wed, 22 Sep 2021 14:38:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cZP0=OM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mT3OS-0004ys-8Q
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 14:38:40 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b2ff7cc-b033-4d38-b88e-1507635c57dd;
 Wed, 22 Sep 2021 14:38:35 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-37-E95VvMe0PpS4HE8kUjRD6A-1; Wed, 22 Sep 2021 16:38:33 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7024.eurprd04.prod.outlook.com (2603:10a6:800:124::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Wed, 22 Sep
 2021 14:38:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 14:38:32 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR04CA0127.eurprd04.prod.outlook.com (2603:10a6:207::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 14:38:31 +0000
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
X-Inumbo-ID: 2b2ff7cc-b033-4d38-b88e-1507635c57dd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632321514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=04x1FN662zVsOx4AF8ENkQRIOoZIpNC+jLSRni5iedE=;
	b=X592sk0E9+CYPDVnDEE5dHo0LkNfOwQrWsIuSXx7WSo0sfeHiYXV1NjZ6/e2aUAfi+jfy8
	HtAR27o2aeh4tGUl+W0t9hP9ioZp0CWjH5GMdmSRDS0V0Lb4Wn4A/te7brAXkE5uF43lBS
	Q6vGvHHJv5vB36ii12BeB68mK9yE+Wk=
X-MC-Unique: E95VvMe0PpS4HE8kUjRD6A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=miQD+jlnl/Wt42LIOFroovVzmLJbrBrSyKqHXs6ZZEj1K3Wo9R11YxzmC3WSAI57HNi7iaoOvi50yxeDzb1GAUkPov7+x6+CmxE1MayrvErSD1hpp2oZxx0JEABRADkEZmB8b/iN7L5OCMRXDR8/8HIpwm8UNTHlrJkx3gh5Jh286BYCM/br9/f34O/f1DXbAC8kGItZ8DoWi5DVJzQVECgcEVBTC7DbfTWpYNvv1xrZGGyvLEk9ISQt2LYvvrbUAvWm4c4/buO4tys4Zt4qz249R92tqN4gdzMOqB0udcrkeND3pD62ukdK+2kQ6oiDQffbGRwkmbFXr77jQ/qFEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=04x1FN662zVsOx4AF8ENkQRIOoZIpNC+jLSRni5iedE=;
 b=jxECi7dC9VTTmgtgNevgYWdIGAtE9FIDT0XoZTBLfU6CrbWDJrWFSDpJAaWss088JKtDmyKvHl2AhP6eeoQaKw32u1oy4X3D+tkRWWkcqK6TMh85JswdAwbeE0m69aWL8lqczLNOFBVPwtWtaMUR0ZKbLRODD1rl1sVOGENmBc6l79bxbyW/KDTJaqnMzoC5g2RuxFBGA6G2smy35jascfVTnA2sTyVM+n/JbuvePD0aS5ktnBiuJzb8d+LXo/Un7dJv0ruPXAYrdlFTaZQn6pt7aKKpaAdJFY28Ct9bMQ1vD+hPajO49FSnpEstFV7IR4JADHUS9EEZ6UZ7fa/UQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v8 6/6] AMD/IOMMU: expose errors and warnings unconditionally
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <d249a759-188a-d689-316a-4743922827e5@suse.com>
Message-ID: <dc0cd7f7-a313-099d-3e89-e3862ed11f43@suse.com>
Date: Wed, 22 Sep 2021 16:38:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <d249a759-188a-d689-316a-4743922827e5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR04CA0127.eurprd04.prod.outlook.com (2603:10a6:207::11)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 336a2ede-e6db-43f0-4424-08d97dd6a66c
X-MS-TrafficTypeDiagnostic: VI1PR04MB7024:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7024C8271E1FF78F03A4396CB3A29@VI1PR04MB7024.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:82;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4rIZEWo7cpE39OwVJ+uB7CrckO0bPNZv5ffJsjxsRRkmX0B7BPM7U2iadIAm8+T5f3c5d61kQGIdGVLQmd/FD9RzNmHptOjkUhU1TEng4z2cheIhhWpW3LV2k9W63HXEv1yZL9WfE/uTh2muiQuusnMNSfnLLzFJoVysYK9BQ0Zw3NdLFK5Gzjl8qFQszf+V6JHB+EB0qBIPkmhe4eqmHZsggwm+9HtF2pY6v1V1ET6Iqz+HYxOtrpbMZwTGAxwl80yYXIthJIEf5+Ym5cPFC4b8qKpgebF18zJMJtRXrTDpBY4FVwo5ekp1Bodp+fSAIYemW+9im7+vyaBw0FowqzMZcbPHCTSSIC+8NlJNJBHUpRXr0G+j6TmVCA6+I7Oq/6TpPnPt1GqyhTec1/Y8okuupyClh/Ir/JtWzFw+5N5GeArLwA4pmYVwQ/vbie6/d1hiHgG4BEXsIPur7YcyMzCtXXIH+6fFw7Mv2r0JKNlrvii6Ij992cVI3ITYA9Erea44FlGtkY6xPdIADoZav1HRGmQph2Ue1p4CDjTcgLPdzt2PsUsoz9cBL4HqGmr7ZDR1gTtNEnxopwqaLMcA9sD+bYhCOvEX5rqg2024V9psYyXPRs+uLL7rV82502ofJqhjDipZtrYTjR/fU6o/wtLvN5i3f8R4zL55Fa66teLUDi+nsvtcofmNJvZ12XjoNUf1rPYV7iCsViXy74WDnHwflZcv5ExRTMeMD48/r20=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(8936002)(66556008)(16576012)(2616005)(316002)(6916009)(4326008)(30864003)(66476007)(2906002)(508600001)(66946007)(86362001)(5660300002)(956004)(26005)(186003)(38100700002)(54906003)(31686004)(31696002)(8676002)(36756003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0RieW9MVGdNOWtBRTgrMEozK1MvRmswUjZxdlBBdHhyR3ZqMVcxb25YTUFt?=
 =?utf-8?B?bUlwS1VZTWk5Vm1jdzFhbmhtTFVSTGhtdG9RQTVnVmJlT1FubEZtWjBYdGp2?=
 =?utf-8?B?dXk2aVZzMXVEUlRadFRKRm9hSTVrSmsyNWN6UjBGbjJRSkRWSERVZkJRa2Vu?=
 =?utf-8?B?YVFXOW04aXhVdGFVeDVuNWRkNDJmaGd5WmRCYk13R2lGbTB1akRlMWxWd09N?=
 =?utf-8?B?T2JPanJrdjhMd2FoNkxxTWpNS1JVemNiTUdJRnE0RXJPb3ZrcnZYQUR5cHcz?=
 =?utf-8?B?anA5UTlONnIyUStJdVBZSWxkbHZPV0piaDFaZEk4YTNMeWwrVEhPVGVhV2Jw?=
 =?utf-8?B?SE9UUUcwTE1ORDVweUpuS2FLNlYzTGJ6UENic1B4djdrNGIxcnZFeG9hQ0tS?=
 =?utf-8?B?MUZ6cG85Y1V2bC9SWTB4TENUT1V4Q25XWWg2Qm43ejJLTmxUWUVySDlzTllj?=
 =?utf-8?B?ZGZjL0R3TnhIT1duOXh4UVE2dnFaT0hYWGdSQUQ4bGdvTnFRdWpwbDZHeGZz?=
 =?utf-8?B?T2paUXhwVlQxNW05RWNCZU5TRkROTnVndjZnbStQZ3FKTVQxdVJIUEpuRDNw?=
 =?utf-8?B?S09lVWlBa2xvQUxURVRpNXZKN3dZcFJVcmFjT0RMZzVWQXE2aWdGWXVCelZF?=
 =?utf-8?B?UnFTc0pIOGt4cHJaNHV6VVhqOXlvVDdwUml6T3dlQlF6eXlwZjhzbkVLWHhL?=
 =?utf-8?B?L0dQbUY2aG5wVGlQbTlxK0M3U3BXOGlieUZsWlRkRjllVTlZemMwQzQvSkFW?=
 =?utf-8?B?VDJRY01GQ25VdDAvb0JtZld6TC9ObVh1a1p3N3o3MlBGMDFyekxBRUJJZkYw?=
 =?utf-8?B?MVFwL0tLT1FyeFhOWGVRaldVU1FaVFdZZEwrZ0JRa1ByV0t0MXpqa2pRZ1g1?=
 =?utf-8?B?cUFiQ2xROHhST2MrdTFmUnByekZVMm5BMzFPMmpTMjZuU1F2cmNlNUdTVGFi?=
 =?utf-8?B?QzRtZnFUK1E1dWVsS3FUYmg0SkRkdzMzUjNBaGNmd09jTzBiQVFKVW9icHo2?=
 =?utf-8?B?V0NiNmVrVGc5allFNFpON1VlL2JlTXM5dTZyWGorWGhhSkU1ZC9GWjBJQllX?=
 =?utf-8?B?SU90c3hNWWVzNTVGQkp0a3VYNDhSN1N4QjFFaE5VaERvNE9OM3NqNG1ZWll0?=
 =?utf-8?B?bE1LUFhONUtzVjJkL0dROE5MeHZoZjBTd2hTeGR5cU5ORmFkUGJSdnF3UlpK?=
 =?utf-8?B?bTdtMzRRVGNlRXZtNllMUEZlckhqaXQwY1FCY2F0NEN1OXd5bFhvTVFwdGNW?=
 =?utf-8?B?UzFCbGloalZwM3FGdGRmTUtqOXpiSDl1aENNK3haa1o2VUZTOWd4Y2d0VVEy?=
 =?utf-8?B?VHIvV1FrTXFiMy95S3RUaDZoRjRCRkpSNFdFVnVlU0htQ2NoZjZWWWN5TGJP?=
 =?utf-8?B?dFJ2OEdNNnNCZ1JiZXRFN0RETUNmT3pXNEJ5ZlJ3RXNPNnVzWG5IS0hjRjk2?=
 =?utf-8?B?YVYvc2FpZ251VzVLK09sd1RWeitYR0lzd1lyVkNpZHd0bzFicFBvaFl5YkdG?=
 =?utf-8?B?SkFCQ0pWVlZVU01IY1RUUHNuejBNN2ZzY1p6aEtTL2VDYWhmNjNLWUZGZy8y?=
 =?utf-8?B?R1BHdlkxbThJMUQzYU1pZHdIblZOYkhZb2grbmN3SG1yckhrandva1Mya0xT?=
 =?utf-8?B?U3YvUG9RZldPV2R6dVpuQTZHTUNuZ0Y2MGtZZGhncTNlVlhHY1lNOElBQ3Jz?=
 =?utf-8?B?QkswaHJvNlZUOVlGRktlNUJMcmtCN3hQSzVBWlJEcnRZMTVqZGwrY25oOGZG?=
 =?utf-8?Q?/L+zaJaRDV8aqUI/eCGg43M23moT7KWNbVp/jzW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 336a2ede-e6db-43f0-4424-08d97dd6a66c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 14:38:31.9561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p5RF9mDBppMBR0c0nUUQb5mTsGRYkk8StNK2WNKBkkQovI5ijNzOJKwvojM5Z2G7gtCbqvNWfse7D1xl7zPJUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7024

Making these dependent upon "iommu=debug" isn't really helpful in the
field. Where touching respective code anyway also make use of %pp and
%pd.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
While I'm adding AMD_IOMMU_VERBOSE(), there aren't any uses for now.
It's not really clear to me where to draw the boundary to
AMD_IOMMU_DEBUG().

I didn't bother touching iommu_guest.c here.
---
v8: New.

--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -203,6 +203,18 @@ struct acpi_ivrs_hardware;
 
 #define DMA_32BIT_MASK  0x00000000ffffffffULL
 
+#define AMD_IOMMU_ERROR(fmt, args...) \
+    printk(XENLOG_ERR "AMD-Vi: Error: " fmt, ## args)
+
+#define AMD_IOMMU_WARN(fmt, args...) \
+    printk(XENLOG_WARNING "AMD-Vi: Warning: " fmt, ## args)
+
+#define AMD_IOMMU_VERBOSE(fmt, args...) \
+    do { \
+        if ( iommu_verbose ) \
+            printk(XENLOG_INFO "AMD-Vi: " fmt, ## args); \
+    } while ( false )
+
 #define AMD_IOMMU_DEBUG(fmt, args...) \
     do  \
     {   \
--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -174,7 +174,7 @@ static int __init reserve_unity_map_for_
         if ( unity_map->addr + unity_map->length > base &&
              base + length > unity_map->addr )
         {
-            AMD_IOMMU_DEBUG("IVMD Error: overlap [%lx,%lx) vs [%lx,%lx)\n",
+            AMD_IOMMU_ERROR("IVMD: overlap [%lx,%lx) vs [%lx,%lx)\n",
                             base, base + length, unity_map->addr,
                             unity_map->addr + unity_map->length);
             return -EPERM;
@@ -248,7 +248,7 @@ static int __init register_range_for_dev
     iommu = find_iommu_for_device(seg, bdf);
     if ( !iommu )
     {
-        AMD_IOMMU_DEBUG("IVMD Error: No IOMMU for Dev_Id %#x!\n", bdf);
+        AMD_IOMMU_ERROR("IVMD: no IOMMU for Dev_Id %#x\n", bdf);
         return -ENODEV;
     }
     req = ivrs_mappings[bdf].dte_requestor_id;
@@ -318,7 +318,7 @@ static int __init parse_ivmd_device_sele
     bdf = ivmd_block->header.device_id;
     if ( bdf >= ivrs_bdf_entries )
     {
-        AMD_IOMMU_DEBUG("IVMD Error: Invalid Dev_Id %#x\n", bdf);
+        AMD_IOMMU_ERROR("IVMD: invalid Dev_Id %#x\n", bdf);
         return -ENODEV;
     }
 
@@ -335,16 +335,14 @@ static int __init parse_ivmd_device_rang
     first_bdf = ivmd_block->header.device_id;
     if ( first_bdf >= ivrs_bdf_entries )
     {
-        AMD_IOMMU_DEBUG("IVMD Error: "
-                        "Invalid Range_First Dev_Id %#x\n", first_bdf);
+        AMD_IOMMU_ERROR("IVMD: invalid Range_First Dev_Id %#x\n", first_bdf);
         return -ENODEV;
     }
 
     last_bdf = ivmd_block->aux_data;
     if ( (last_bdf >= ivrs_bdf_entries) || (last_bdf <= first_bdf) )
     {
-        AMD_IOMMU_DEBUG("IVMD Error: "
-                        "Invalid Range_Last Dev_Id %#x\n", last_bdf);
+        AMD_IOMMU_ERROR("IVMD: invalid Range_Last Dev_Id %#x\n", last_bdf);
         return -ENODEV;
     }
 
@@ -367,7 +365,7 @@ static int __init parse_ivmd_device_iomm
                                     ivmd_block->aux_data);
     if ( !iommu )
     {
-        AMD_IOMMU_DEBUG("IVMD Error: No IOMMU for Dev_Id %#x Cap %#x\n",
+        AMD_IOMMU_ERROR("IVMD: no IOMMU for Dev_Id %#x Cap %#x\n",
                         ivmd_block->header.device_id, ivmd_block->aux_data);
         return -ENODEV;
     }
@@ -384,7 +382,7 @@ static int __init parse_ivmd_block(const
 
     if ( ivmd_block->header.length < sizeof(*ivmd_block) )
     {
-        AMD_IOMMU_DEBUG("IVMD Error: Invalid Block Length!\n");
+        AMD_IOMMU_ERROR("IVMD: invalid block length\n");
         return -ENODEV;
     }
 
@@ -402,8 +400,8 @@ static int __init parse_ivmd_block(const
          (addr_bits < BITS_PER_LONG &&
           ((start_addr + mem_length - 1) >> addr_bits)) )
     {
-        AMD_IOMMU_DEBUG("IVMD: [%lx,%lx) is not IOMMU addressable\n",
-                        start_addr, start_addr + mem_length);
+        AMD_IOMMU_WARN("IVMD: [%lx,%lx) is not IOMMU addressable\n",
+                       start_addr, start_addr + mem_length);
         return 0;
     }
 
@@ -411,8 +409,8 @@ static int __init parse_ivmd_block(const
     {
         paddr_t addr;
 
-        AMD_IOMMU_DEBUG("IVMD: [%lx,%lx) is not (entirely) in reserved memory\n",
-                        base, limit + PAGE_SIZE);
+        AMD_IOMMU_WARN("IVMD: [%lx,%lx) is not (entirely) in reserved memory\n",
+                       base, limit + PAGE_SIZE);
 
         for ( addr = base; addr <= limit; addr += PAGE_SIZE )
         {
@@ -423,7 +421,7 @@ static int __init parse_ivmd_block(const
                 if ( e820_add_range(&e820, addr, addr + PAGE_SIZE,
                                     E820_RESERVED) )
                     continue;
-                AMD_IOMMU_DEBUG("IVMD Error: Page at %lx couldn't be reserved\n",
+                AMD_IOMMU_ERROR("IVMD: page at %lx couldn't be reserved\n",
                                 addr);
                 return -EIO;
             }
@@ -433,8 +431,7 @@ static int __init parse_ivmd_block(const
                            RAM_TYPE_UNUSABLE)) )
                 continue;
 
-            AMD_IOMMU_DEBUG("IVMD Error: Page at %lx can't be converted\n",
-                            addr);
+            AMD_IOMMU_ERROR("IVMD: page at %lx can't be converted\n", addr);
             return -EIO;
         }
     }
@@ -448,7 +445,7 @@ static int __init parse_ivmd_block(const
     }
     else
     {
-        AMD_IOMMU_DEBUG("IVMD Error: Invalid Flag Field!\n");
+        AMD_IOMMU_ERROR("IVMD: invalid flag field\n");
         return -ENODEV;
     }
 
@@ -471,7 +468,8 @@ static int __init parse_ivmd_block(const
                                        iw, ir, exclusion);
 
     default:
-        AMD_IOMMU_DEBUG("IVMD Error: Invalid Block Type!\n");
+        AMD_IOMMU_ERROR("IVMD: unknown block type %#x\n",
+                        ivmd_block->header.type);
         return -ENODEV;
     }
 }
@@ -481,7 +479,7 @@ static u16 __init parse_ivhd_device_padd
 {
     if ( header_length < (block_length + pad_length) )
     {
-        AMD_IOMMU_DEBUG("IVHD Error: Invalid Device_Entry Length!\n");
+        AMD_IOMMU_ERROR("IVHD: invalid Device_Entry length\n");
         return 0;
     }
 
@@ -496,7 +494,7 @@ static u16 __init parse_ivhd_device_sele
     bdf = select->header.id;
     if ( bdf >= ivrs_bdf_entries )
     {
-        AMD_IOMMU_DEBUG("IVHD Error: Invalid Device_Entry Dev_Id %#x\n", bdf);
+        AMD_IOMMU_ERROR("IVHD: invalid Device_Entry Dev_Id %#x\n", bdf);
         return 0;
     }
 
@@ -515,14 +513,13 @@ static u16 __init parse_ivhd_device_rang
     dev_length = sizeof(*range);
     if ( header_length < (block_length + dev_length) )
     {
-        AMD_IOMMU_DEBUG("IVHD Error: Invalid Device_Entry Length!\n");
+        AMD_IOMMU_ERROR("IVHD: invalid Device_Entry length\n");
         return 0;
     }
 
     if ( range->end.header.type != ACPI_IVRS_TYPE_END )
     {
-        AMD_IOMMU_DEBUG("IVHD Error: "
-                        "Invalid Range: End_Type %#x\n",
+        AMD_IOMMU_ERROR("IVHD Error: invalid range: End_Type %#x\n",
                         range->end.header.type);
         return 0;
     }
@@ -530,16 +527,14 @@ static u16 __init parse_ivhd_device_rang
     first_bdf = range->start.header.id;
     if ( first_bdf >= ivrs_bdf_entries )
     {
-        AMD_IOMMU_DEBUG("IVHD Error: "
-                        "Invalid Range: First Dev_Id %#x\n", first_bdf);
+        AMD_IOMMU_ERROR("IVHD: invalid range: First Dev_Id %#x\n", first_bdf);
         return 0;
     }
 
     last_bdf = range->end.header.id;
     if ( (last_bdf >= ivrs_bdf_entries) || (last_bdf <= first_bdf) )
     {
-        AMD_IOMMU_DEBUG("IVHD Error: "
-                        "Invalid Range: Last Dev_Id %#x\n", last_bdf);
+        AMD_IOMMU_ERROR("IVHD: invalid range: Last Dev_Id %#x\n", last_bdf);
         return 0;
     }
 
@@ -561,21 +556,21 @@ static u16 __init parse_ivhd_device_alia
     dev_length = sizeof(*alias);
     if ( header_length < (block_length + dev_length) )
     {
-        AMD_IOMMU_DEBUG("IVHD Error: Invalid Device_Entry Length!\n");
+        AMD_IOMMU_ERROR("IVHD: invalid Device_Entry length\n");
         return 0;
     }
 
     bdf = alias->header.id;
     if ( bdf >= ivrs_bdf_entries )
     {
-        AMD_IOMMU_DEBUG("IVHD Error: Invalid Device_Entry Dev_Id %#x\n", bdf);
+        AMD_IOMMU_ERROR("IVHD: invalid Device_Entry Dev_Id %#x\n", bdf);
         return 0;
     }
 
     alias_id = alias->used_id;
     if ( alias_id >= ivrs_bdf_entries )
     {
-        AMD_IOMMU_DEBUG("IVHD Error: Invalid Alias Dev_Id %#x\n", alias_id);
+        AMD_IOMMU_ERROR("IVHD: invalid Alias Dev_Id %#x\n", alias_id);
         return 0;
     }
 
@@ -597,14 +592,13 @@ static u16 __init parse_ivhd_device_alia
     dev_length = sizeof(*range);
     if ( header_length < (block_length + dev_length) )
     {
-        AMD_IOMMU_DEBUG("IVHD Error: Invalid Device_Entry Length!\n");
+        AMD_IOMMU_ERROR("IVHD: invalid Device_Entry length\n");
         return 0;
     }
 
     if ( range->end.header.type != ACPI_IVRS_TYPE_END )
     {
-        AMD_IOMMU_DEBUG("IVHD Error: "
-                        "Invalid Range: End_Type %#x\n",
+        AMD_IOMMU_ERROR("IVHD: invalid range: End_Type %#x\n",
                         range->end.header.type);
         return 0;
     }
@@ -612,16 +606,14 @@ static u16 __init parse_ivhd_device_alia
     first_bdf = range->alias.header.id;
     if ( first_bdf >= ivrs_bdf_entries )
     {
-        AMD_IOMMU_DEBUG("IVHD Error: "
-                        "Invalid Range: First Dev_Id %#x\n", first_bdf);
+        AMD_IOMMU_ERROR("IVHD: invalid range: First Dev_Id %#x\n", first_bdf);
         return 0;
     }
 
     last_bdf = range->end.header.id;
     if ( last_bdf >= ivrs_bdf_entries || last_bdf <= first_bdf )
     {
-        AMD_IOMMU_DEBUG(
-            "IVHD Error: Invalid Range: Last Dev_Id %#x\n", last_bdf);
+        AMD_IOMMU_ERROR("IVHD: invalid range: Last Dev_Id %#x\n", last_bdf);
         return 0;
     }
 
@@ -651,14 +643,14 @@ static u16 __init parse_ivhd_device_exte
     dev_length = sizeof(*ext);
     if ( header_length < (block_length + dev_length) )
     {
-        AMD_IOMMU_DEBUG("IVHD Error: Invalid Device_Entry Length!\n");
+        AMD_IOMMU_ERROR("IVHD: invalid Device_Entry length\n");
         return 0;
     }
 
     bdf = ext->header.id;
     if ( bdf >= ivrs_bdf_entries )
     {
-        AMD_IOMMU_DEBUG("IVHD Error: Invalid Device_Entry Dev_Id %#x\n", bdf);
+        AMD_IOMMU_ERROR("IVHD: invalid Device_Entry Dev_Id %#x\n", bdf);
         return 0;
     }
 
@@ -677,14 +669,13 @@ static u16 __init parse_ivhd_device_exte
     dev_length = sizeof(*range);
     if ( header_length < (block_length + dev_length) )
     {
-        AMD_IOMMU_DEBUG("IVHD Error: Invalid Device_Entry Length!\n");
+        AMD_IOMMU_ERROR("IVHD: invalid Device_Entry length\n");
         return 0;
     }
 
     if ( range->end.header.type != ACPI_IVRS_TYPE_END )
     {
-        AMD_IOMMU_DEBUG("IVHD Error: "
-                        "Invalid Range: End_Type %#x\n",
+        AMD_IOMMU_ERROR("IVHD: invalid range: End_Type %#x\n",
                         range->end.header.type);
         return 0;
     }
@@ -692,16 +683,14 @@ static u16 __init parse_ivhd_device_exte
     first_bdf = range->extended.header.id;
     if ( first_bdf >= ivrs_bdf_entries )
     {
-        AMD_IOMMU_DEBUG("IVHD Error: "
-                        "Invalid Range: First Dev_Id %#x\n", first_bdf);
+        AMD_IOMMU_ERROR("IVHD: invalid range: First Dev_Id %#x\n", first_bdf);
         return 0;
     }
 
     last_bdf = range->end.header.id;
     if ( (last_bdf >= ivrs_bdf_entries) || (last_bdf <= first_bdf) )
     {
-        AMD_IOMMU_DEBUG("IVHD Error: "
-                        "Invalid Range: Last Dev_Id %#x\n", last_bdf);
+        AMD_IOMMU_ERROR("IVHD: invalid range: Last Dev_Id %#x\n", last_bdf);
         return 0;
     }
 
@@ -789,14 +778,14 @@ static u16 __init parse_ivhd_device_spec
     dev_length = sizeof(*special);
     if ( header_length < (block_length + dev_length) )
     {
-        AMD_IOMMU_DEBUG("IVHD Error: Invalid Device_Entry Length!\n");
+        AMD_IOMMU_ERROR("IVHD: invalid Device_Entry length\n");
         return 0;
     }
 
     bdf = special->used_id;
     if ( bdf >= ivrs_bdf_entries )
     {
-        AMD_IOMMU_DEBUG("IVHD Error: Invalid Device_Entry Dev_Id %#x\n", bdf);
+        AMD_IOMMU_ERROR("IVHD: invalid Device_Entry Dev_Id %#x\n", bdf);
         return 0;
     }
 
@@ -844,12 +833,12 @@ static u16 __init parse_ivhd_device_spec
             {
                 if ( ioapic_sbdf[idx].bdf == bdf &&
                      ioapic_sbdf[idx].seg == seg )
-                    AMD_IOMMU_DEBUG("IVHD Warning: Duplicate IO-APIC %#x entries\n",
+                    AMD_IOMMU_WARN("IVHD: duplicate IO-APIC %#x entries\n",
                                     special->handle);
                 else
                 {
-                    printk(XENLOG_ERR "IVHD Error: Conflicting IO-APIC %#x entries\n",
-                           special->handle);
+                    AMD_IOMMU_ERROR("IVHD: conflicting IO-APIC %#x entries\n",
+                                    special->handle);
                     if ( amd_iommu_perdev_intremap )
                         return 0;
                 }
@@ -944,7 +933,7 @@ static int __init parse_ivhd_block(const
 
     if ( ivhd_block->header.length < hdr_size )
     {
-        AMD_IOMMU_DEBUG("IVHD Error: Invalid Block Length!\n");
+        AMD_IOMMU_ERROR("IVHD: invalid block length\n");
         return -ENODEV;
     }
 
@@ -953,7 +942,7 @@ static int __init parse_ivhd_block(const
                                     ivhd_block->capability_offset);
     if ( !iommu )
     {
-        AMD_IOMMU_DEBUG("IVHD Error: No IOMMU for Dev_Id %#x Cap %#x\n",
+        AMD_IOMMU_ERROR("IVHD: no IOMMU for Dev_Id %#x Cap %#x\n",
                         ivhd_block->header.device_id,
                         ivhd_block->capability_offset);
         return -ENODEV;
@@ -1016,7 +1005,8 @@ static int __init parse_ivhd_block(const
                 ivhd_block->header.length, block_length, iommu);
             break;
         default:
-            AMD_IOMMU_DEBUG("IVHD Error: Invalid Device Type!\n");
+            AMD_IOMMU_WARN("IVHD: unknown device type %#x\n",
+                           ivhd_device->header.type);
             dev_length = 0;
             break;
         }
@@ -1113,8 +1103,7 @@ static int __init parse_ivrs_table(struc
 
         if ( table->length < (length + ivrs_block->length) )
         {
-            AMD_IOMMU_DEBUG("IVRS Error: "
-                            "Table Length Exceeded: %#x -> %#lx\n",
+            AMD_IOMMU_ERROR("IVRS: table length exceeded: %#x -> %#lx\n",
                             table->length,
                             (length + ivrs_block->length));
             return -ENODEV;
@@ -1214,7 +1203,7 @@ static int __init get_last_bdf_ivhd(
 
     if ( ivhd_block->header.length < hdr_size )
     {
-        AMD_IOMMU_DEBUG("IVHD Error: Invalid Block Length!\n");
+        AMD_IOMMU_ERROR("IVHD: invalid block length\n");
         return -ENODEV;
     }
 
@@ -1261,7 +1250,8 @@ static int __init get_last_bdf_ivhd(
             dev_length = sizeof(ivhd_device->special);
             break;
         default:
-            AMD_IOMMU_DEBUG("IVHD Error: Invalid Device Type!\n");
+            AMD_IOMMU_WARN("IVHD: unknown device type %#x\n",
+                           ivhd_device->header.type);
             dev_length = 0;
             break;
         }
@@ -1327,7 +1317,7 @@ get_supported_ivhd_type(struct acpi_tabl
     checksum = acpi_tb_checksum(ACPI_CAST_PTR(uint8_t, table), table->length);
     if ( checksum )
     {
-        AMD_IOMMU_DEBUG("IVRS Error: Invalid Checksum %#x\n", checksum);
+        AMD_IOMMU_ERROR("IVRS: invalid checksum %#x\n", checksum);
         return -ENODEV;
     }
 
@@ -1340,8 +1330,7 @@ get_supported_ivhd_type(struct acpi_tabl
 
         if ( table->length < (length + ivrs_block->length) )
         {
-            AMD_IOMMU_DEBUG("IVRS Error: "
-                            "Table Length Exceeded: %#x -> %#lx\n",
+            AMD_IOMMU_ERROR("IVRS: table length exceeded: %#x -> %#lx\n",
                             table->length,
                             (length + ivrs_block->length));
             return -ENODEV;
--- a/xen/drivers/passthrough/amd/iommu_cmd.c
+++ b/xen/drivers/passthrough/amd/iommu_cmd.c
@@ -291,8 +291,7 @@ void amd_iommu_flush_iotlb(u8 devfn, con
 
     if ( !iommu )
     {
-        AMD_IOMMU_DEBUG("%s: Can't find iommu for %pp\n",
-                        __func__, &pdev->sbdf);
+        AMD_IOMMU_WARN("can't find IOMMU for %pp\n", &pdev->sbdf);
         return;
     }
 
--- a/xen/drivers/passthrough/amd/iommu_detect.c
+++ b/xen/drivers/passthrough/amd/iommu_detect.c
@@ -141,21 +141,21 @@ int __init amd_iommu_detect_one_acpi(
 
     if ( ivhd_block->header.length < sizeof(*ivhd_block) )
     {
-        AMD_IOMMU_DEBUG("Invalid IVHD Block Length!\n");
+        AMD_IOMMU_ERROR("invalid IVHD block length\n");
         return -ENODEV;
     }
 
     if ( !ivhd_block->header.device_id ||
         !ivhd_block->capability_offset || !ivhd_block->base_address)
     {
-        AMD_IOMMU_DEBUG("Invalid IVHD Block!\n");
+        AMD_IOMMU_ERROR("invalid IVHD block\n");
         return -ENODEV;
     }
 
     iommu = xzalloc(struct amd_iommu);
     if ( !iommu )
     {
-        AMD_IOMMU_DEBUG("Error allocating amd_iommu\n");
+        AMD_IOMMU_ERROR("cannot allocate amd_iommu\n");
         return -ENOMEM;
     }
 
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -386,8 +386,8 @@ static void iommu_reset_log(struct amd_i
 
     if ( log_run )
     {
-        AMD_IOMMU_DEBUG("Warning: Log Run bit %d is not cleared"
-                        "before reset!\n", run_bit);
+        AMD_IOMMU_WARN("Log Run bit %d is not cleared before reset\n",
+                       run_bit);
         return;
     }
 
@@ -754,8 +754,8 @@ static bool_t __init set_iommu_interrupt
     pcidevs_unlock();
     if ( !iommu->msi.dev )
     {
-        AMD_IOMMU_DEBUG("IOMMU: no pdev for %pp\n",
-                        &PCI_SBDF2(iommu->seg, iommu->bdf));
+        AMD_IOMMU_WARN("no pdev for %pp\n",
+                       &PCI_SBDF2(iommu->seg, iommu->bdf));
         return 0;
     }
 
@@ -799,7 +799,7 @@ static bool_t __init set_iommu_interrupt
     if ( ret )
     {
         destroy_irq(irq);
-        AMD_IOMMU_DEBUG("can't request irq\n");
+        AMD_IOMMU_ERROR("can't request irq\n");
         return 0;
     }
 
@@ -992,7 +992,7 @@ static void *__init allocate_buffer(unsi
 
     if ( buffer == NULL )
     {
-        AMD_IOMMU_DEBUG("Error allocating %s\n", name);
+        AMD_IOMMU_ERROR("cannot allocate %s\n", name);
         return NULL;
     }
 
@@ -1224,7 +1224,7 @@ static int __init alloc_ivrs_mappings(u1
     ivrs_mappings = xzalloc_array(struct ivrs_mappings, ivrs_bdf_entries + 1);
     if ( ivrs_mappings == NULL )
     {
-        AMD_IOMMU_DEBUG("Error allocating IVRS Mappings table\n");
+        AMD_IOMMU_ERROR("cannot allocate IVRS Mappings table\n");
         return -ENOMEM;
     }
     IVRS_MAPPINGS_SEG(ivrs_mappings) = seg;
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -377,8 +377,8 @@ void amd_iommu_ioapic_update_ire(
     iommu = find_iommu_for_device(seg, bdf);
     if ( !iommu )
     {
-        AMD_IOMMU_DEBUG("Fail to find iommu for ioapic device id ="
-                        " %04x:%04x\n", seg, bdf);
+        AMD_IOMMU_WARN("failed to find IOMMU for IO-APIC @ %04x:%04x\n",
+                       seg, bdf);
         __io_apic_write(apic, reg, value);
         return;
     }
@@ -747,8 +747,8 @@ bool __init iov_supports_xt(void)
         if ( !find_iommu_for_device(ioapic_sbdf[idx].seg,
                                     ioapic_sbdf[idx].bdf) )
         {
-            AMD_IOMMU_DEBUG("No IOMMU for IO-APIC %#x (ID %x)\n",
-                            apic, IO_APIC_ID(apic));
+            AMD_IOMMU_WARN("no IOMMU for IO-APIC %#x (ID %x)\n",
+                           apic, IO_APIC_ID(apic));
             return false;
         }
     }
@@ -765,14 +765,12 @@ int __init amd_setup_hpet_msi(struct msi
 
     if ( hpet_sbdf.init == HPET_NONE )
     {
-        AMD_IOMMU_DEBUG("Failed to setup HPET MSI remapping."
-                        " Missing IVRS HPET info.\n");
+        AMD_IOMMU_ERROR("failed to setup HPET MSI remapping: missing IVRS HPET info\n");
         return -ENODEV;
     }
     if ( msi_desc->hpet_id != hpet_sbdf.id )
     {
-        AMD_IOMMU_DEBUG("Failed to setup HPET MSI remapping."
-                        " Wrong HPET.\n");
+        AMD_IOMMU_ERROR("failed to setup HPET MSI remapping: wrong HPET\n");
         return -ENODEV;
     }
 
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -222,7 +222,7 @@ static int iommu_pde_from_dfn(struct dom
             table = iommu_alloc_pgtable(d);
             if ( table == NULL )
             {
-                AMD_IOMMU_DEBUG("Cannot allocate I/O page table\n");
+                AMD_IOMMU_ERROR("cannot allocate I/O page table\n");
                 unmap_domain_page(next_table_vaddr);
                 return 1;
             }
@@ -252,7 +252,7 @@ static int iommu_pde_from_dfn(struct dom
                 table = iommu_alloc_pgtable(d);
                 if ( table == NULL )
                 {
-                    AMD_IOMMU_DEBUG("Cannot allocate I/O page table\n");
+                    AMD_IOMMU_ERROR("cannot allocate I/O page table\n");
                     unmap_domain_page(next_table_vaddr);
                     return 1;
                 }
@@ -301,7 +301,7 @@ int amd_iommu_map_page(struct domain *d,
     if ( rc )
     {
         spin_unlock(&hd->arch.mapping_lock);
-        AMD_IOMMU_DEBUG("Root table alloc failed, dfn = %"PRI_dfn"\n",
+        AMD_IOMMU_ERROR("root table alloc failed, dfn = %"PRI_dfn"\n",
                         dfn_x(dfn));
         domain_crash(d);
         return rc;
@@ -310,7 +310,7 @@ int amd_iommu_map_page(struct domain *d,
     if ( iommu_pde_from_dfn(d, dfn_x(dfn), &pt_mfn, true) || !pt_mfn )
     {
         spin_unlock(&hd->arch.mapping_lock);
-        AMD_IOMMU_DEBUG("Invalid IO pagetable entry dfn = %"PRI_dfn"\n",
+        AMD_IOMMU_ERROR("invalid IO pagetable entry dfn = %"PRI_dfn"\n",
                         dfn_x(dfn));
         domain_crash(d);
         return -EFAULT;
@@ -343,7 +343,7 @@ int amd_iommu_unmap_page(struct domain *
     if ( iommu_pde_from_dfn(d, dfn_x(dfn), &pt_mfn, false) )
     {
         spin_unlock(&hd->arch.mapping_lock);
-        AMD_IOMMU_DEBUG("Invalid IO pagetable entry dfn = %"PRI_dfn"\n",
+        AMD_IOMMU_ERROR("invalid IO pagetable entry dfn = %"PRI_dfn"\n",
                         dfn_x(dfn));
         domain_crash(d);
         return -EFAULT;
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -367,10 +367,8 @@ static int reassign_device(struct domain
     iommu = find_iommu_for_device(pdev->seg, bdf);
     if ( !iommu )
     {
-        AMD_IOMMU_DEBUG("Fail to find iommu."
-                        " %04x:%02x:%x02.%x cannot be assigned to dom%d\n",
-                        pdev->seg, pdev->bus, PCI_SLOT(devfn), PCI_FUNC(devfn),
-                        target->domain_id);
+        AMD_IOMMU_WARN("failed to find IOMMU: %pp cannot be assigned to %pd\n",
+                       &pdev->sbdf, target);
         return -ENODEV;
     }
 
@@ -484,8 +482,8 @@ static int amd_iommu_add_device(u8 devfn
             return 0;
         }
 
-        AMD_IOMMU_DEBUG("No iommu for %pp; cannot be handed to d%d\n",
-                        &pdev->sbdf, pdev->domain->domain_id);
+        AMD_IOMMU_WARN("no IOMMU for %pp; cannot be handed to %pd\n",
+                        &pdev->sbdf, pdev->domain);
         return -ENODEV;
     }
 
@@ -527,9 +525,8 @@ static int amd_iommu_add_device(u8 devfn
              pdev->domain,
              ivrs_mappings[ivrs_mappings[bdf].dte_requestor_id].unity_map,
              0) )
-        AMD_IOMMU_DEBUG("%pd: unity mapping failed for %04x:%02x:%02x.%u\n",
-                        pdev->domain, pdev->seg, pdev->bus, PCI_SLOT(devfn),
-                        PCI_FUNC(devfn));
+        AMD_IOMMU_WARN("%pd: unity mapping failed for %pp\n",
+                       pdev->domain, &pdev->sbdf);
 
     return amd_iommu_setup_domain_device(pdev->domain, iommu, devfn, pdev);
 }
@@ -547,7 +544,7 @@ static int amd_iommu_remove_device(u8 de
     iommu = find_iommu_for_device(pdev->seg, bdf);
     if ( !iommu )
     {
-        AMD_IOMMU_DEBUG("Fail to find iommu. %pp cannot be removed from %pd\n",
+        AMD_IOMMU_WARN("failed to find IOMMU: %pp cannot be removed from %pd\n",
                         &pdev->sbdf, pdev->domain);
         return -ENODEV;
     }
@@ -560,9 +557,8 @@ static int amd_iommu_remove_device(u8 de
     if ( amd_iommu_reserve_domain_unity_unmap(
              pdev->domain,
              ivrs_mappings[ivrs_mappings[bdf].dte_requestor_id].unity_map) )
-        AMD_IOMMU_DEBUG("%pd: unity unmapping failed for %04x:%02x:%02x.%u\n",
-                        pdev->domain, pdev->seg, pdev->bus, PCI_SLOT(devfn),
-                        PCI_FUNC(devfn));
+        AMD_IOMMU_WARN("%pd: unity unmapping failed for %pp\n",
+                       pdev->domain, &pdev->sbdf);
 
     if ( amd_iommu_perdev_intremap &&
          ivrs_mappings[bdf].dte_requestor_id == bdf &&


