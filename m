Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8794546EC4F
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 16:54:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243161.420554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvLk0-0001hs-E0; Thu, 09 Dec 2021 15:53:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243161.420554; Thu, 09 Dec 2021 15:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvLk0-0001fi-Ay; Thu, 09 Dec 2021 15:53:52 +0000
Received: by outflank-mailman (input) for mailman id 243161;
 Thu, 09 Dec 2021 15:53:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Con=Q2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mvLjy-0000XI-QF
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 15:53:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 336dd862-5908-11ec-9d12-4777fae47e2b;
 Thu, 09 Dec 2021 16:53:50 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2056.outbound.protection.outlook.com [104.47.10.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-BB98DskpMUW7IVCK5smIrQ-1; Thu, 09 Dec 2021 16:53:48 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 15:53:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.024; Thu, 9 Dec 2021
 15:53:47 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR04CA0036.eurprd04.prod.outlook.com (2603:10a6:206:1::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.24 via Frontend Transport; Thu, 9 Dec 2021 15:53:47 +0000
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
X-Inumbo-ID: 336dd862-5908-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639065229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8gDGJGQ3q/kpTI39nNO6K9uOCAOBK2KpkmRZMpGfFgk=;
	b=dTNl99rnJ9Ryi5rDZrwcwHHBNBCnWFr6IwhJhVbdUVVzacxS1broKmJFBFMNRmIhXrfn5E
	AeXs78FdwQegLtULE6YUCLEHZolaSWmXzh8jLUrIxhc/Wm2stVIwGwSeexVmMdzDIwy60i
	A7bMDWR3y7yUA3Fc99x9lFQdcWzn5ds=
X-MC-Unique: BB98DskpMUW7IVCK5smIrQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UWLzl1zyjuVeYIx2feedc+vlvBNl5RWnqFc9aFH2Xm2/0OarYuQrhFQD0una6cbAQK7F0tPxTK9+la2HV6ZwEtp9szsMYcerNRm02kP6LWGWfY/QowYMeWBTc2TEixukADt36ANU6oVO2EO7BD3skZLX4Qf+moImlAP8gOnFkcNDdtgllfUlDszOQ0ryO3brG87jOWUV3QYFg++Jy95kEG81GrUbvYuJA8ZnP4d/5hmytiIrX7cUp3bJGxC40K3EoQ17i6yhbbcsMjTeANVJR5u392wnwMBEwVQOQZs6X9LR1mnx00n+nV51y88ZWY823mODFWqSKiB6toft3O+fSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8gDGJGQ3q/kpTI39nNO6K9uOCAOBK2KpkmRZMpGfFgk=;
 b=OS78/GKHVSCFKaoFfvtYx4qp2ubPgc9JErZP2NGrwxEO89jE+ByYdHchaNlWAgLpM9iqFK7SJpm7kfo4xvKt+DuQGcwnhPblyH2e2jMf3KwZaQs6hioyf0n4TK8uHnBeSfwBxXXfCbapzyy8utvKU/9I2IEaiPpKq5qj3VlcvrPfInNlkmrJ5uVlDaWKDt6ge68vOjNqoCKRgUahHJpGyAXC6EDVU7WerVoZmYYyZOGOddqeuvO+EQmO9I7v1AECjlR7vGWJHy/9HW7uv3P/pj1o0xtilA8mQv3rqOOm4pbUgAWRsbCNWhdswXUqIbhGbnsjZig/cMgeFJRhduxYFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4d1b5bb2-e5a3-e581-1bc2-9ac7eb61af35@suse.com>
Date: Thu, 9 Dec 2021 16:53:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH 3/3] VT-d: shorten vtd_flush_{context,iotlb}_reg()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>
References: <5b1a5093-610d-f7d3-8d48-e843d86609da@suse.com>
In-Reply-To: <5b1a5093-610d-f7d3-8d48-e843d86609da@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR04CA0036.eurprd04.prod.outlook.com
 (2603:10a6:206:1::49) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87bcba05-e96e-4656-069e-08d9bb2c1657
X-MS-TrafficTypeDiagnostic: VI1PR04MB6861:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6861996695E87CABE567D08AB3709@VI1PR04MB6861.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rpLg3uDfwK47yqOk+h8p+ZJN7iEkZl+g+SIjl1Y8RNTgjyh/IFKv57jCWDjDcT75NO71Xu7INOlwiisuwXRe+Osudz+fBPBPql/2xhMhs91XHSi0pkK/up76A5FSUKaJ0QWtRR3+naKy+3nFBVoeePsTI1n8JRIlbpsTcHfpl0GTaVeGlgSqMqQi29CJ4XxzHcML5cMZTaCKZBhiA1EstalQ2bj8zKyIKMjVz6+l0dxZ6KzNQ+4eiHLoYwmO6ewKd7G4I5YHzYMPHD6r/0Goy1wyjibXfbHObueOTTNatOogGVakcgsM+Z2w3ioGfw4V71iLvBw8nhCBXEsJ4Iwpe7bilfs6tVwDuliTwQCmK7i37v0t/CF+WD8YyrpW02g2EEwkeubJ4uomzoWSlA62lGkXUn6U9qK72VrXwyeMpwXM4249n0d2u8EWq+EXOfQa/07WhGq6jAFG+YdZMQLyetotEv5FPIsHqoMMuMgoi/Me22vCUgeR7t6EWOLiK3+3tBtoNVUZac4QiR4R7pcaCQBKbxGUeYG9Qxncd3PuuLBVVGWidfjfEQOuOg9vOYNpeyHf1s4bYuU/izWECSnsjEcngBUvoLd7sPCa6NC/hfLAp/X0o/17E6blF6gRpWqHA42f4W6wJfG+KBiz76nNRiPZdCpMnmcmMlRdZdTarLzgEA3LoSo92MnKCrXKMDIkoeH89FtK4kI+Og5Ys09oyEpN0Wx4tKBZFnHkW5eFIfAJ6SRuMmrE64Z1BwhCGHd5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(66476007)(4326008)(66556008)(8676002)(186003)(31686004)(31696002)(5660300002)(2616005)(16576012)(316002)(8936002)(38100700002)(956004)(36756003)(86362001)(2906002)(83380400001)(26005)(508600001)(6916009)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGxjQUVjcHJlM3RnbTJWQzljZDdpb2ovci8xVVB6NFBrc2ZNMkE1RlAxWmdJ?=
 =?utf-8?B?TVZEZ0NZZFkzSlp3UjVDNHFkY3pqZGgvK1ByYkkyREo1YWRNM05saWFSbG1G?=
 =?utf-8?B?WWtlWlIyTDlPRTErVGVwWFVsWG40YWVDUTBvZUVieG1uR2FQSlIxTUFGMk1V?=
 =?utf-8?B?UGZUUy9aOCtJQUR5K09heUZZRXowVXBabVhrWGw3cERyRzZ1cmVaQmt2elIx?=
 =?utf-8?B?anBkcTVWWXNDY3RFZ00wYVJRd2ZvRk9YUDkvMmYxUE82UTdlTWg0bXpVdFJQ?=
 =?utf-8?B?ZkRwZXZTL0JySHFhMC90OWZ4WDhjRXlHdm9CK2dGUTNXOXJsdWJMQkg4K2lw?=
 =?utf-8?B?cmkwVXZ2UnZMeXV6bGhnTXFaSEZ6aGI4RkJxUHZ0K0x1K3loM2ZsNGtDUDFT?=
 =?utf-8?B?WG4rc0dtRUlzc0IxSGl5VWp2Mmp3bHpQM0NZOTNVV0J6SlYrWnc1c3p2aVg0?=
 =?utf-8?B?TWVJcU5kS2lyR3BQZEhHSmhRQmlCU2ZiT0xBb05DcXBiL0xpekdyZEttV2tL?=
 =?utf-8?B?V1NvTEo1N3dncm54bHNOKzh6T01vOHpOMUI3UXFRb295MVIyZXpSeUdvVC9v?=
 =?utf-8?B?L1hsczMzeWNTQVNRNTZ5RkZEN2dDdUgxaHBrOUl4VFRTWkRQdXFmbkVzYmpv?=
 =?utf-8?B?VnFTc3VCSzNCS0dGdlVUTnFwM2RXSzg5bzdHMzZVaUpBdUY2UHplcXVURk54?=
 =?utf-8?B?T29MNzNmL3hEUmtuOFRDd3VmSXRnTEtpN0I0WEFZaFN6ZjF6b0NWZXFIYktM?=
 =?utf-8?B?eVRjY3UyQVZMR25iSlQwTDVEWnJtZ3ZncG1zU3hIalY2QmNweVpBWVFXdTJm?=
 =?utf-8?B?ZTJoUUxOQzhvbGJQekVlb056MXcvbGtIZUJYOGY1RGQwMWlndmhUSU05dFJB?=
 =?utf-8?B?NUtUQzdiK0lic0hzNHI3d0xrbWR3NjZ1eGVaNjU5Y2EyZGNldldia1VEdW53?=
 =?utf-8?B?SXBxNnlTYTI4aUEyazdMMDQ0d0hWVmZKeTNmVHNVS2hEYmU4aXpxNVhSRTh5?=
 =?utf-8?B?TE8yUG80RWZzYTZpbzlNMzFnTG5odVVMQkRXNDBhSFJWVGJGUFQ5T2FPU1d3?=
 =?utf-8?B?NzgrelZUV1ZUb25ZeHZFcFRnWTV4Sy9PTTNDc0o0TkNUYmE4azRHRi90L2lV?=
 =?utf-8?B?SjhrdFA2QjR2akI4U2t6MmFxQVpPcnFnRGJYSzlmQlJjTUVWQmxUcVFXdnhp?=
 =?utf-8?B?eFV0SkUrYUY2WlptS2NXVTA2WFJ1R1J1VVQ2UFpPSmp2eG5TSGZLVUxXd0lX?=
 =?utf-8?B?b3JDbm4ydldnMENtT05wU011aGYzS1FkQk5EbTYremw4WGN6eVR2cTk3R3hQ?=
 =?utf-8?B?STYrTkY3ZUl5WFpHdWowQTlCekNUMlkrYlF4RHFzelRpTWt4ejl0eHBJaE5r?=
 =?utf-8?B?NmtpSmNsbWdTRmd2OG9KVmxack12ZzZiVTlWaDRHUHY3LzN4dXdURXdxa3I4?=
 =?utf-8?B?NHpHYnkrcjFlNENQWlFna09uNC9zckF4WFNjOGl4OEU3QndKYks0SFJ2R1Z0?=
 =?utf-8?B?dHhhNXdnVXNNekZmbHZIVHRwOWZUT1pTNlNzRjRnZktJd0VMWUN1YlRGKytz?=
 =?utf-8?B?OUNucGVkS3ZOWitZOHpaRHhSeHVRdGRSbTYxUVo3QjRDODM1ZnBKMHk2REZ3?=
 =?utf-8?B?UUNsaUd0cWdUeFE5Z2k4K1oveHZ0T2ZJdytWeWlQZVd5WEkxSEZZNWJEZjJF?=
 =?utf-8?B?NGdqcTE2b0tCTUR0Uk5HWVFoLzRPWGZzY2Q3RzBmamI1dXdid2FnOXdwVExS?=
 =?utf-8?B?dFcrMXBESUVtek5GUy9KNzBXaTJEVXdBclhlUXNPb0ZsZnlXRmdlTEVkOXpO?=
 =?utf-8?B?U2Q5eGcvbTd5NE5mSlF6dWtzUEkxdTl5NHpPYURhRjRjaVFCVy9kVGhrY3JF?=
 =?utf-8?B?SFlnbzhtNWZNN2gyeWJDa1g4R0s2M1NwdXpzY2IxZnorVE4wYmZCMmZISDBl?=
 =?utf-8?B?UjBDeWNIcEVqVXlOZzl3dW5USVhzR0lYY2xrV0d3K0xNemxPNDN5bEhZY1Jm?=
 =?utf-8?B?eDZPVlRvWmJ2T1p4REhFOG5UcHBQdG1BRDYrN2JteDNGVXZUbnhQTjJIemFh?=
 =?utf-8?B?aVBZZDVnZU9uUDY5aTdhaFlYTDJZdzFYS0JudHB2NlZ1RzIwUlpVM3hwUkZy?=
 =?utf-8?B?bmp2LzFTWlVuQTJhY1ZGdVFNQWdsNmJxMVRCeTBuMm13elJocm5uNDRQZGVT?=
 =?utf-8?Q?DTpSxZzzTrDh1rYrcUMyeu8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87bcba05-e96e-4656-069e-08d9bb2c1657
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 15:53:47.8612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hx1LfhPr1sn/dFGEx0DNiBHa19d6i024n0m7M4i+ZlQLkOC2s8aB/wjufVFRP2jzFmU7m8GhmPWDZBSK7WJW3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6861

Their calculations of the value to write to the respective command
register can be partly folded, resulting in almost 100 bytes less code
for these two relatively short functions.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -441,7 +441,6 @@ int vtd_flush_context_reg(struct vtd_iom
                           uint16_t source_id, uint8_t function_mask,
                           uint64_t type, bool flush_non_present_entry)
 {
-    u64 val = 0;
     unsigned long flags;
 
     /*
@@ -462,26 +461,26 @@ int vtd_flush_context_reg(struct vtd_iom
     switch ( type )
     {
     case DMA_CCMD_GLOBAL_INVL:
-        val = DMA_CCMD_GLOBAL_INVL;
-        break;
-    case DMA_CCMD_DOMAIN_INVL:
-        val = DMA_CCMD_DOMAIN_INVL|DMA_CCMD_DID(did);
         break;
+
     case DMA_CCMD_DEVICE_INVL:
-        val = DMA_CCMD_DEVICE_INVL|DMA_CCMD_DID(did)
-            |DMA_CCMD_SID(source_id)|DMA_CCMD_FM(function_mask);
+        type |= DMA_CCMD_SID(source_id) | DMA_CCMD_FM(function_mask);
+        fallthrough;
+    case DMA_CCMD_DOMAIN_INVL:
+        type |= DMA_CCMD_DID(did);
         break;
+
     default:
         BUG();
     }
-    val |= DMA_CCMD_ICC;
+    type |= DMA_CCMD_ICC;
 
     spin_lock_irqsave(&iommu->register_lock, flags);
-    dmar_writeq(iommu->reg, DMAR_CCMD_REG, val);
+    dmar_writeq(iommu->reg, DMAR_CCMD_REG, type);
 
     /* Make sure hardware complete it */
     IOMMU_FLUSH_WAIT("context", iommu, DMAR_CCMD_REG, dmar_readq,
-                     !(val & DMA_CCMD_ICC), val);
+                     !(type & DMA_CCMD_ICC), type);
 
     spin_unlock_irqrestore(&iommu->register_lock, flags);
     /* flush context entry will implicitly flush write buffer */
@@ -510,7 +509,7 @@ int vtd_flush_iotlb_reg(struct vtd_iommu
                         bool flush_non_present_entry, bool flush_dev_iotlb)
 {
     int tlb_offset = ecap_iotlb_offset(iommu->ecap);
-    u64 val = 0;
+    uint64_t val = type | DMA_TLB_IVT;
     unsigned long flags;
 
     /*
@@ -524,14 +523,13 @@ int vtd_flush_iotlb_reg(struct vtd_iommu
     switch ( type )
     {
     case DMA_TLB_GLOBAL_FLUSH:
-        val = DMA_TLB_GLOBAL_FLUSH|DMA_TLB_IVT;
         break;
+
     case DMA_TLB_DSI_FLUSH:
-        val = DMA_TLB_DSI_FLUSH|DMA_TLB_IVT|DMA_TLB_DID(did);
-        break;
     case DMA_TLB_PSI_FLUSH:
-        val = DMA_TLB_PSI_FLUSH|DMA_TLB_IVT|DMA_TLB_DID(did);
+        val |= DMA_TLB_DID(did);
         break;
+
     default:
         BUG();
     }


