Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD8640C285
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 11:13:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187381.336222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQQyU-0000HS-9c; Wed, 15 Sep 2021 09:13:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187381.336222; Wed, 15 Sep 2021 09:13:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQQyU-0000Ea-6I; Wed, 15 Sep 2021 09:13:02 +0000
Received: by outflank-mailman (input) for mailman id 187381;
 Wed, 15 Sep 2021 09:13:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQQyS-0000EM-Lk
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 09:13:00 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ed06cdc-1605-11ec-b4ec-12813bfff9fa;
 Wed, 15 Sep 2021 09:12:59 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-KL9Vz8YcNlqdHYbQZdp6-w-1; Wed, 15 Sep 2021 11:12:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4605.eurprd04.prod.outlook.com (2603:10a6:803:65::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Wed, 15 Sep
 2021 09:12:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 09:12:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR05CA0009.eurprd05.prod.outlook.com (2603:10a6:205::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Wed, 15 Sep 2021 09:12:55 +0000
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
X-Inumbo-ID: 1ed06cdc-1605-11ec-b4ec-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631697178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/83ivPXoMWZK0DfJ0iAElyITmi87CEwTYL/CkVUUj8s=;
	b=Cc0S76Pgw7Xx9WhPjKbIeA/msdNf8NxNQGHTO7a11i9L8RwXMObvDT/0ztRm7/ozxrtDOb
	qbxUBAqCifmDTyJnDjwzzL9KCKwZzAwmVQ7Hp7QQYtsYoY+g+38XWjiBFQYMx7QcA64k9W
	NXMCoO2Jendr9ON3Plgn1rEqvn6VvdM=
X-MC-Unique: KL9Vz8YcNlqdHYbQZdp6-w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmo4aJFhHb5z7pPEqc2GAtj+S1xtd9BW2LEyOEttEoofkxpSIIKuXUmDTYdjKM6DlCt+ewJjitwqyxIBX0AZQ+kaQHWXPA3Y+bsQzg4Rk5sFfUrIESGwG8pWM1ZLgGSJy8jgsr9ho00oaApM49u1YVHVCGNMc1X8jvZPBjT0KMnUwdiU5jO60nkM/wTBqyBFGlrrvlLje4m2N5h/jUxhOYOiJ+GF54jqY9bdzn5+4uXkFVOI292bFvXazUnBGQlm6VOHkYOLzi6cBLee/Yxs9GKXIV4pa1ulVQH+HFzkE3L7pj8noWUQX6pk8GgsbxHCTfEOFISA0W6CLXxqhuyc3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=/83ivPXoMWZK0DfJ0iAElyITmi87CEwTYL/CkVUUj8s=;
 b=BcSHQKEWuqj/X9b6xvanuDEmFQkUsmYBodHk4Hh8yr3AFlFD13Cg71CGZetPVibgIPtRXCGiROsa8m7TAVG2unwu+18c/NFEc2rm3BeDwxAjMWALtfnNfyTjNKstHk/ko9kwaVLCSycyPQGGbxtR9lCNYZs+sH1r/Uo26wvgh4wsGAEinfZcrJQoKa9uBxP+GLN3gYCi1xzxDFdcE51G3JQjXwb/lhEr/UjGKu8WERPI82EFz0p4KzDdTrSiHtREZa5Da7KgrK4r7BfzzohZFGWJA7HvDHFQUVE9GO9BRWwEX3hg8sjObs4c+yV6dZyVA0xrbQ4Os9/Lzr6imWu1Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 2/4] VT-d: consider hidden devices when unmapping
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
References: <6b7fa64a-bd6b-353c-30cb-ec25b850cbed@suse.com>
Message-ID: <5cf392cf-09a2-b23c-2a25-610c64f20707@suse.com>
Date: Wed, 15 Sep 2021 11:12:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <6b7fa64a-bd6b-353c-30cb-ec25b850cbed@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR05CA0009.eurprd05.prod.outlook.com (2603:10a6:205::22)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 642123a2-c9b4-46ae-6e17-08d978290152
X-MS-TrafficTypeDiagnostic: VI1PR04MB4605:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4605AD7B26D394D073B3A4A9B3DB9@VI1PR04MB4605.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8PCAqCp7QC3Nmn0avbgNteqcuwg/I5Oi3mqHVHYZIh24OwBgi67u0vS8fe1AFKYsG9Cm/qRAqUWGx8bkHuSmluHZRvpKJtv6iZ0n3htwamiJjKPbNUf2F29WWzqxJKHMVdkMYtPi4V90FUCuLX0LtR9KXP3LJy3ktVN3NxJkHSFIitntcWXUog2MR35cDqpmP5x9vjeO7OGjj2MMMON+Wd7qhhITuhRVjlDGR4GQccDmgnxgcQXZbBAAQpO2cP8R/EFX+gDPL6HNECJnlf360DcTr6rL+1TBx8yVw9yNsnGK/63O5tPBM1f0XZq4zpEYJrkQHwXMRpviKEsXmOL3LWMeaUfqXGGA+a89RCi/ONiPilD8SGTt7pCRCx0ycERy4mTodkGPoqovxKHSEJIaPtf7E2nWuZbh7snSkyxgo9cm2n2fMTwpNEfPbWJp4zW1JdOILUAa+qp3bLTcKi9yuyMnHuXL+nfZV5ubt8zpcWms1jmxNdgczlcKhsMb/D1XhfuAeaKmPZg8VX5VvzRyennMd3rb4u/J7ZIvzGsV5sfNh39ghStO8YhHBBfhFqdrhHXUFwDeDHWKh5vaI5Qd6rUwsxKBReHq1c+2Lkhz0l3rSbmnf2V/j//Ami4PskCFoUGSLvXxE2BUtvlua8nmOkP6QvfPBk3id3gnrFqKR3SSQLNjSPbTgucC5O4dGtBBkew9bqNYTwPOvBw0ZOPPc1D4yWguv3v1fZqie0I8N6Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(346002)(136003)(39860400002)(396003)(2616005)(38100700002)(5660300002)(956004)(86362001)(6486002)(478600001)(66946007)(4326008)(316002)(16576012)(6916009)(54906003)(66476007)(66556008)(31696002)(186003)(26005)(8676002)(2906002)(8936002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L29zdmU1bnpXRkkwZE00ZWoxNS9UN2FWYnJpL3VmTVhxRjBmVklqRmU0OFhF?=
 =?utf-8?B?Z2IvZ3JtZ2VjenZPQkNJNnJKTG4xNW9SQVVObWFFVHdnODRxem4ySjc4dWVX?=
 =?utf-8?B?M0Y5Q2JvWXNiM1RtNjdtMzE5TklVb2UxL1hDWVdzaFhjcFpjc2ZRNUFnSHl6?=
 =?utf-8?B?UTNraHdZL2xmUWZzRTdxS0FUbnU3YTBLeVQ5V0RiVWZibUFqS0U3aDE1eisr?=
 =?utf-8?B?N0Jtay9ZSHRyV2E0WU10R0lmZ0RVNy90MkF0ZmNVVjR3ZmZIM1BJaGFTcTRl?=
 =?utf-8?B?VFhsMFNPWlpTMm4yTUl6bVFwN0QvbWNQM0s2ZzVUWmkwRlhrK2Qzc0VkbFBI?=
 =?utf-8?B?ZWRXZGswWmtTTEg3eGl1bllpZXFjSGVyeDN3SzhXTUdwNnQranN1R3l6bDFr?=
 =?utf-8?B?NUdBVWlydE5mY0RuNzVCOFByZUw0aE1KbGdjYm1pV1dHSHA1aUhHblVpV1pt?=
 =?utf-8?B?TkduVkFER0wrSDR6WXUwU0ZVZnloenk0eDRLZXBITFViSXk3S3ZxTVZGN3Jq?=
 =?utf-8?B?L1AzRmQ0TEwzbmczT2N2ODlYVHVSNXN3cGFjdEMrUURiT0VIME1Kc3RSUjFR?=
 =?utf-8?B?cU5VM2R4RGt1OTBDV1hRV1BlOW1GZ0w0ZnVjNmZKUDdUcVdTYTdFWXd4NW1o?=
 =?utf-8?B?UGpuTXRxZG93SEsrazlTNVh6cDNYK3JYTXZ1eEFVY3dUTmt2NVpRT3RGSDk1?=
 =?utf-8?B?dmIrT1NGdW1WSlZqaXkzRHlVRFA1SS9LUnR2MjJZbGQ5M2k0TW15ZXAxMzB4?=
 =?utf-8?B?UmMvclU1SldkL0pnWEh5THVFZDZ1cG9saUN0SHhHc1cyY3ZlVDJKL0M3SEJj?=
 =?utf-8?B?S1JZWm5sTFhrUGM4Qk1Cb0wyZ2lpemw2WHdZeW85S3Vpb1FWQ2JKRXpwOFlk?=
 =?utf-8?B?OE00eXdFWUQ5aVhNaVRPR3VDV0FReWNoQmFFaTQ0TlJLNjJhYjdQY3FOWTBN?=
 =?utf-8?B?Z25YZXZtZU9PRmtvNllSc1I0N1ptUkszcVFjVUJtSE9PZkZ2WnQvRVIzaERo?=
 =?utf-8?B?cFREOFV0TC9WSm1sSTNjUWxEWEV3QzhhVWdaREh3Y0I1RVM1YmprQlJ1dWlE?=
 =?utf-8?B?ZWtmRXpHakhmV1lyWkQrODIwRE4vOGVxYWhCejJSM1owRFlYbFVONUtVL28w?=
 =?utf-8?B?Tlc4ZEJtSVNpLzRpVXBpUXAzSlNnYk1UYkExa0JmQW5aSjE0dlh2SWlZYmdG?=
 =?utf-8?B?SFdZV3dTWjBZd05qS09LMHEvRkdPQ2VnU1hGei9NWlpDbnNQWk54T3liQWlk?=
 =?utf-8?B?ajVWWXZZK1grTE1lWXFCMThqeURicThMS1VYWUg4VzV5VmVObG1VSG95RnFq?=
 =?utf-8?B?b2d3MFYvMjNxd0lNT0tvMjFwVUFrZFlCWXFwV0ZSdlZwRlY4aXR3WDhqUTVo?=
 =?utf-8?B?WnJJbmtmc1hWamduUlNROTZENTV2TzE4ZU5kZVlEYVNyWVdMa3RCaVZoSHBZ?=
 =?utf-8?B?N1FUSnUvK2hsNE44NmI2cDU4LzBFOVgvMTQwUU8zTmFkbTI2a0Z1UmxMME8x?=
 =?utf-8?B?dkxqUnVuMFZXbFpSSzVzU2xsUkpUT0wrbklYV3lwZVdIUjZBZTl2cnkzYzE5?=
 =?utf-8?B?dXViL2prejVwdGw0T05TQytBSDV1S1lBUzlPV2RuZC9nVmRia3E3WDNFVm1I?=
 =?utf-8?B?UXV6bkhHMVV0dEFQYzRYS2Zka1QzUFRuaURPa29sZFZxNU4zWE83YTVheURU?=
 =?utf-8?B?cFk0dGYwSGMyYVZqTFJ4dHlRMjU3SUh6YmVqQU1DbHgyMEhUb2R1elZTZG1y?=
 =?utf-8?Q?xhsmtLPiCL3N1nmIB6wjIPadBfuAJL8ogfBrFj9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 642123a2-c9b4-46ae-6e17-08d978290152
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 09:12:56.1517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eZ6/Of8FrrXKMK2D3Sd0BBq9yCilaEf2KewdtyO7iSh17n6kJ1v2pJFvEjPJWEAAm9TBOm1i3gRktrbHfERjyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4605

Whether to clear an IOMMU's bit in the domain's bitmap should depend on
all devices the domain can control. For the hardware domain this
includes hidden devices, which are associated with DomXEN.

While touching related logic, convert "found" to "bool".

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1657,7 +1657,7 @@ static int domain_context_unmap(struct d
     struct vtd_iommu *iommu = drhd ? drhd->iommu : NULL;
     int ret;
     u8 seg = pdev->seg, bus = pdev->bus, tmp_bus, tmp_devfn, secbus;
-    int found = 0;
+    bool found;
 
     switch ( pdev->type )
     {
@@ -1737,23 +1737,33 @@ static int domain_context_unmap(struct d
         return ret;
 
     /*
-     * if no other devices under the same iommu owned by this domain,
-     * clear iommu in iommu_bitmap and clear domain_id in domid_bitmp
+     * If no other devices under the same iommu owned by this domain,
+     * clear iommu in iommu_bitmap and clear domain_id in domid_bitmap.
      */
-    for_each_pdev ( domain, pdev )
+    for ( found = false; ; domain = dom_xen )
     {
-        if ( pdev->seg == seg && pdev->bus == bus && pdev->devfn == devfn )
-            continue;
-
-        drhd = acpi_find_matched_drhd_unit(pdev);
-        if ( drhd && drhd->iommu == iommu )
+        for_each_pdev ( domain, pdev )
         {
-            found = 1;
-            break;
+            if ( pdev->seg == seg && pdev->bus == bus && pdev->devfn == devfn )
+                continue;
+
+            drhd = acpi_find_matched_drhd_unit(pdev);
+            if ( drhd && drhd->iommu == iommu )
+            {
+                found = true;
+                break;
+            }
         }
+
+        /*
+         * Hidden devices are associated with DomXEN but usable by the
+         * hardware domain. Hence they need considering here as well.
+         */
+        if ( found || !is_hardware_domain(domain) )
+            break;
     }
 
-    if ( found == 0 )
+    if ( !found )
     {
         clear_bit(iommu->index, &dom_iommu(domain)->arch.vtd.iommu_bitmap);
         cleanup_domid_map(domain, iommu);


