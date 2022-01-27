Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC76D49E519
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 15:50:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261512.452898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD65x-0005xi-An; Thu, 27 Jan 2022 14:49:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261512.452898; Thu, 27 Jan 2022 14:49:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD65x-0005w0-70; Thu, 27 Jan 2022 14:49:53 +0000
Received: by outflank-mailman (input) for mailman id 261512;
 Thu, 27 Jan 2022 14:49:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nD65v-0005tu-R2
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 14:49:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 616d1d63-7f80-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 15:49:51 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2058.outbound.protection.outlook.com [104.47.8.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-Po1JJaETOXuNNo_YttVhCw-2; Thu, 27 Jan 2022 15:49:49 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4887.eurprd04.prod.outlook.com (2603:10a6:20b:b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 14:49:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 14:49:48 +0000
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
X-Inumbo-ID: 616d1d63-7f80-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643294990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DMhzatDsyvqO50atIdsWIGLVtdsSYBlhlA7D8k9xKVo=;
	b=jl8bcgX6X07E9rkSPLl1M0sD5xkms2J0WSnsorow1Gn4zF3E9w3lYx2svr2tJMSNElIUYD
	3GFEVaOGESDZSYA1AogezaDLd+KjtKVz7QlAlujpus5KXgV1IqcTSp959WhpJlxwaC/o/H
	jcvApHBlrPCkILJIiADi9Tyi0TTLjy8=
X-MC-Unique: Po1JJaETOXuNNo_YttVhCw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iYfCO8JDt1Qf5ZdUj6PM2osKZmogIqPbjcvnELZeTH/Wu3XKGLpTUkfRodHb7/tWZEyVO+3/3JgYfgXoHY9XZC8lPBbfddw6/vAJMFD9c5dujmY+aC8rAv9PfYoC80YdBzI3mYldOHpAW+SjOU7ptz67ks9v4zW4/WawP6qtHMrCOsO/8jSfB5oOBNVkaAyJ/gckfzJk324hcX/zEbNbh+lYKr02OGRlmZ8mOcrn/xI0sTokR6FWPuFSceCa0GdG0wyUeQJqjvfAvnvmSdgk2kUzv9FT+2iZgCxfinX4GGFtByVFozzVri71jduYK/z5h8EV5WZBhWw3qRIGhQEcVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DMhzatDsyvqO50atIdsWIGLVtdsSYBlhlA7D8k9xKVo=;
 b=F2qQ3HUCbgpyGRc3HGGv+pI7BljmFMJ+MwACJxWa9maIGqRCov7BnwW6yhwmy/1OyjyH+Opjy4yogHRoPGPaXlRNRypHeYdJx8owDW7gwwDr67NfkCl2vT8tG7cuH8600DK5RJIqsl6Qcu+6y7EWe1DJW/Rxcbw/pGyLQ/MI+cyardErKEKWPOsATBuSTMG2UGZ3H0iW9Dux2M5yEkjhEzGyqIF1W4QAYhzEgeaz6YEi+dRHez1N7oGA+4jZaLGcWS9TyhL868AiVrecHlRqFIYXuVVB7YjSamfhdkNB6QtrGl4j3Lqa5WdCl1Gvov4jvVVrJwMaHFrLyyIxhiJqCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <998f6587-d64a-7336-a44b-d05ca486b4bc@suse.com>
Date: Thu, 27 Jan 2022 15:49:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: [PATCH v2 4/4] IOMMU/PCI: propagate get_device_group_id() failure
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <4b7db7ae-eb84-7ecc-4334-fe5f0f7ef46b@suse.com>
In-Reply-To: <4b7db7ae-eb84-7ecc-4334-fe5f0f7ef46b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0145.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2a96b44-7209-40c8-e3fb-08d9e1a44443
X-MS-TrafficTypeDiagnostic: AM6PR04MB4887:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4887DE40EEE0F7F352D3D0B9B3219@AM6PR04MB4887.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NzdifO8MSmmZZIFUaqJxtOO9QOiRH8c4HEm/oshoocWUt80Evcc2HgZcilL+yHUPHV4oiF1RwYdw5FKZw/PU6mxYssEYbtMFEaZzgHPOYD1TXqW3ElJkaFb7uHBviDQ7y+/oxPdkJd6dp923hT11bXZdZK4k6Qpfa8Bx4EU63wrsm4GY2dOpPYuXfAIaJSkxrZBEFLjs1pjIsfccRSVfkafMod9sGggQFidthCjg7BiB+t13FVLcTpw274fYmCaXX94+Jsr8HRID1fKra1FOukW4EInpN+2FcQh4oa9A6dbBcH9yPzP5fuanmia9TKntuG9eS5zic2hoP1hXw11kVTILkdptC3HvTgOLjOVQxYkSvaFluLH34tLhBjLDhfofSj0FNNG8PXTSKM0uZM4LPubgt2J7Ym4Yc3fi1C5FTE9JLIGEeI8BVH8vTrL4h5vBJuPR7OzIHXmAMyGAmzm4rijeDvejAHPe3yWNkzlMZm+hfu774zyzviBErqvbdAZVAjCsr6L1JobWPenJ/LzNhWbjzjGtHKbcm8aT45og1Hsw2zTaO+V/w1yFgZNeDYP6w5TggIKQJUcN0BNL7dKPW22LifuJ3+mzMuytRXco7h+VPqthx0hpK2/iq+ejou8nMU06plg7Amfzm5gzPnJw0D9EaH+6dsSe37+WnLLhpFNeFCRg/wX5SWkyY52uxRQIQ9Lu2nz/1p03nXdoY5AO9oEkWVFluHxYaih1S0cXLKFWWjVwAflkIhDaFq5/nTyD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(83380400001)(6512007)(6506007)(186003)(26005)(31686004)(31696002)(6486002)(2616005)(54906003)(6916009)(316002)(86362001)(508600001)(2906002)(4326008)(8676002)(8936002)(5660300002)(66556008)(66476007)(38100700002)(66946007)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFRnWXJMeFEwdVpOUHNpeEJLK3B2NEFsa0luQWFtdDB2TGcvTjNDV3kvdDcv?=
 =?utf-8?B?K211ZlBQTTRWMExka1lEcEZiMTVTTDFaNTdST2VRVFVMMmovaFZTbHVORisz?=
 =?utf-8?B?QlFHRWJlRzRRbnU5MFZFNWk2UzZBV2xwM21CQ2ZndS9UVWtiQkVIYzNWLzhu?=
 =?utf-8?B?cktIemlpQlM5V2dCUmFNL1NrNlRkVk1DOUU1ZTV0L3lnVWJpRnJtQ1BpQWlL?=
 =?utf-8?B?QStXb1VCM2NJelBHSk1Ka3AvTzliakdVRVZoeTd1alBRK3VsSy9HL3pPQTZ5?=
 =?utf-8?B?RnhpVDJ2bWpaMmxRM3RhUDRDK3VxRXJIVEpMRldlNVpWeDdqSEc3RWllOGdP?=
 =?utf-8?B?T2twaTM2NE5jWXRWUHAxMlZXbkI1bERQMHpWWHhLNnA0a2ZmTm5LUjNoUXZM?=
 =?utf-8?B?M01qeHhPN0U2ZXF0UFQxTWZ4bmdHcUc3SVErcTR5S253RnMvUkdQbVBvdjhs?=
 =?utf-8?B?Um9qaHpXaDNaZ1ZReGFucmNSTDVoRE14eUtkYmVNYkk0V2h2Y0dYNHNhZVhU?=
 =?utf-8?B?WG1ySk4rTGsrL2x6Z24yTTFvMzdBa0xLYWkyN2t6dEsrS3djQ1FOcFVqenNL?=
 =?utf-8?B?Z2lGU3lEdHduZUUyUzFCbnZnczNRYUE4WTFFUk5lMjl1R0Q1dHNLRnk4L2k1?=
 =?utf-8?B?UGIva0lWT0k2UmFKWHVhUDN6REdhWng0RUp4amRkQUxERzI0UERyY0tVMCtQ?=
 =?utf-8?B?UWE3d24vRW9mcjlxSXB1QW9aZkMzSDlhS3dNbkl5b2lMWGFmemRSYzdYckQw?=
 =?utf-8?B?QnkvZkorRkFabmR6anBiaUY0VGlBQ0ZPcWsvTWZOTE9kcEp3WllSVDNIeWhX?=
 =?utf-8?B?T2dSMEd3dEJ3eGMwWjdEaDdFdDdvY29CQWFSOWZ6Y00yRWw4anplaUUrekdi?=
 =?utf-8?B?S21rS0dZZDlERERLeCtYWStwbVM3OXk2djlEOXVOU1MrZklOd3krSUdqWHdU?=
 =?utf-8?B?Z2Y0TUR3aGtDOHY2RWpvWGZwbVpCaE9uNmNDbEpmOEhyc096L05za01MVlFQ?=
 =?utf-8?B?QTRUanRybTdzV0ZNdW80eXE2S0JJRTl1Lytjcm03NDBZQ3NvYzJJaE9abUdB?=
 =?utf-8?B?dUlvV3NRcjZoQTNtdFdIbjRXZVNWaTBaam5pczJMSUJmSHNmQVkwR0xCaFNV?=
 =?utf-8?B?V1VCclZsWnlPenVIdUpobE9ETVZJRUZidHVEbXRDOUhmSXRDUVJTTEkxa3BY?=
 =?utf-8?B?d1VJM0xCbE85VW5sVVlsVHVkZU1NeXhDQnhCUVE4SUNlRDhhQTRxSmE3TlFQ?=
 =?utf-8?B?ZVltUGFtN0lDNG5QSnVKcHI2dGRvNnY4NWVhUmpVbWlValRQYUh1Q2J2eUlp?=
 =?utf-8?B?NDY0L1VkY0FsczJGVm1Sa0JXL214QlVlUStEaUdHQ280M1g5ajFiMnNWdkdz?=
 =?utf-8?B?Q0VzRUZvMmpsN1pBTGZrakpacENiVlJLbCsyYlIzUlVjeFpyeUg1bUt3K25P?=
 =?utf-8?B?cEVsSDZ0UkZwY29WZTFTSG91bGhDVElmNzdEdXNjczVoeHUyaUFtOVpQOTJS?=
 =?utf-8?B?U3JkVWlKbU1uazlCY214SWg3N3RZT1NoVGR0dVhrbzJnd3ZyUWJKT2dQWEx0?=
 =?utf-8?B?T0puZDA5MXorQytCbzg3ZTJnMFM3L2o0VlRibGE1TzV5VDdlZkxzeEtFa2xL?=
 =?utf-8?B?Tk1TeFRJaTJ4bGFPS0dHcTcxYnAvaDBXeGVpeDZoU1J3a241cHRLOERSSlB5?=
 =?utf-8?B?VVMvNVk4QzVpc29kT05Kb0RPMzJvWFBSSDhHUUo4OXJFUjY1NjRHZXpVcTQ3?=
 =?utf-8?B?amtCN2l4SFhQYThWZHdqNFNwNG9obU0rUGpuVGVMVDJZNXAwcGM0YVVGb3FW?=
 =?utf-8?B?RWMwVVA0Y0s4TDMrcUZFUGptMy9jREZIMkNTQjlYTWZTMjBoTEVtMnJEUkhm?=
 =?utf-8?B?UUU4UU1md1o1N3lMUkEyYTIrcTU2blIzOWVPYjFKUkM5T0dkVU9XcmM1Y3Z1?=
 =?utf-8?B?RHBQTDRWVlo2VDZZdkdsaU5WZ2pSc2JnQ2lUekdiRWQvVkVwK2ZjQyszTTZu?=
 =?utf-8?B?NXU1TkFIVGl1MlBhYkQrNkRmaE1tQ21VaFJxZUoxOFZxS3krdGNxNmJHZlgy?=
 =?utf-8?B?Y25ZUmlWVVdOeG8vSkRqdCtUaERLTWpUbXBuVGM3eWs3bXU1TGxUMXFJSCt1?=
 =?utf-8?B?VEc5OEo0eTNrTVlJRFJFVEpHQm40MGJjTi9CeTMydXZiZldiTmJQRmh4QzVp?=
 =?utf-8?Q?tercPkYVM0Z5WV75AirCFDw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a96b44-7209-40c8-e3fb-08d9e1a44443
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 14:49:48.7071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SdxYT07Bx6nxXI0qhZFc6gIc+ncim8bEA526PCr/uVhMvkHoJG5X8RQDm5YAMIGxzbCLXzRzlBQwn1MxsBeulw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4887

The VT-d hook can indicate an error, which shouldn't be ignored. Convert
the hook's return value to a proper error code, and let that bubble up.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I'm not convinced of the XSM related behavior here: It's neither clear
why the check gets performed on the possible further group members
instead of on the passed in device, nor - if the former is indeed
intended behavior - why the loop then simply gets continued instead of
returning an error. After all in such a case the reported "group" is
actually incomplete, which can't result in anything good.

I'm further unconvinced that it is correct for the AMD hook to never
return an error.
---
v2: New.

--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1463,6 +1463,8 @@ static int iommu_get_device_group(
         return 0;
 
     group_id = iommu_call(ops, get_device_group_id, seg, bus, devfn);
+    if ( group_id < 0 )
+        return group_id;
 
     pcidevs_lock();
     for_each_pdev( d, pdev )
@@ -1477,6 +1479,12 @@ static int iommu_get_device_group(
             continue;
 
         sdev_id = iommu_call(ops, get_device_group_id, seg, b, df);
+        if ( sdev_id < 0 )
+        {
+            pcidevs_unlock();
+            return sdev_id;
+        }
+
         if ( (sdev_id == group_id) && (i < max_sdevs) )
         {
             bdf = (b << 16) | (df << 8);
@@ -1484,7 +1492,7 @@ static int iommu_get_device_group(
             if ( unlikely(copy_to_guest_offset(buf, i, &bdf, 1)) )
             {
                 pcidevs_unlock();
-                return -1;
+                return -EFAULT;
             }
             i++;
         }
@@ -1552,8 +1560,7 @@ int iommu_do_pci_domctl(
         ret = iommu_get_device_group(d, seg, bus, devfn, sdevs, max_sdevs);
         if ( ret < 0 )
         {
-            dprintk(XENLOG_ERR, "iommu_get_device_group() failed!\n");
-            ret = -EFAULT;
+            dprintk(XENLOG_ERR, "iommu_get_device_group() failed: %d\n", ret);
             domctl->u.get_device_group.num_sdevs = 0;
         }
         else
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2564,10 +2564,11 @@ static int intel_iommu_assign_device(
 static int intel_iommu_group_id(u16 seg, u8 bus, u8 devfn)
 {
     u8 secbus;
+
     if ( find_upstream_bridge(seg, &bus, &devfn, &secbus) < 0 )
-        return -1;
-    else
-        return PCI_BDF2(bus, devfn);
+        return -ENODEV;
+
+    return PCI_BDF2(bus, devfn);
 }
 
 static int __must_check vtd_suspend(void)


