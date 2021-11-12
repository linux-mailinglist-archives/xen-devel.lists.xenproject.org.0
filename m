Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C442B44E41E
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 10:48:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225033.388639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlTAY-0004Qi-VO; Fri, 12 Nov 2021 09:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225033.388639; Fri, 12 Nov 2021 09:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlTAY-0004Nj-RM; Fri, 12 Nov 2021 09:48:26 +0000
Received: by outflank-mailman (input) for mailman id 225033;
 Fri, 12 Nov 2021 09:48:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gYwu=P7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mlTAW-0004Mh-VE
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 09:48:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad45fad4-439d-11ec-9787-a32c541c8605;
 Fri, 12 Nov 2021 10:48:24 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2053.outbound.protection.outlook.com [104.47.9.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-4-21gbcw4IMbadGv0vIOpLTA-1;
 Fri, 12 Nov 2021 10:48:22 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Fri, 12 Nov
 2021 09:48:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Fri, 12 Nov 2021
 09:48:21 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P193CA0140.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Fri, 12 Nov 2021 09:48:21 +0000
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
X-Inumbo-ID: ad45fad4-439d-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636710503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T5pPKnQj5UnvBzgr+/BnzNrg1H5CCPhXELs+pod4pwM=;
	b=nnc/ZZVHblZUH+5Ak85NSW/KjpPwnAKvpyH9HR+Md3zDi6qA7d3dSBubq2eQ6lSxkCw00C
	KpLmpJe6tuqA0Y1bo//ecx6LXlYj3vkaOuqpcsKbrItis2I+xN+CMaKWkndNYSOkTnHyHB
	HnnY7p7+PJuQRR2QJCApVQUTrqV5haA=
X-MC-Unique: 21gbcw4IMbadGv0vIOpLTA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3i5GW2NsHkETFrxaBkPtaKNrEWKlGhAg38I9CiOpd0oJgnM5jW3fe/rLpAKWairhKz05hvF37NkdE3uAYYZg66dlbPO2w6ueWGWCDg21WbUwgvF7rnyS2p/stl7D4xI157tZ5g3EraI3C1nxvCeUUmFmLch0Wmppc1jJzIu8V/BqqrguOiqTt97CK6k+qNR6OGVXspJzo7K/W8kGQIAXtrXTFBS3fPVpsMut7svhbbC3KfFhzrEDm5CQLj0RTKRmiVctBb4FKXcBrx51wKtp9nKTdzudRZlD/Jz080dBs1Nvhz5TTvYzt0ZA4Ct8eygxpmqDm4kUcc0jUJtFQP+Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5pPKnQj5UnvBzgr+/BnzNrg1H5CCPhXELs+pod4pwM=;
 b=geLzZO3elEL9b+3pKvqtTK2qVx2jvrFspBurMVyPK5vlZ4mmG1DyeSmMRtdKQje8FSz4LphE3IYjUKFsrOV5htGAu95RQw1NAWeHVtK4NH7eYiY2wxZ6ZMFM+Br4V3IkOKRhQ7zva4bQ5TqBVw7seIHL7pejS+OG8Rpy6X93xyCKb3JBzdj2FcomMFZTRAjALFDR12uAVy7/kPwh5U7t4WAgf+O3RN1ofP3MfUHWZ+6S01Vecvx+qR4JBOttTVpl7NyNdy2SWLS/ofmeloAfIeFh8rlI8Law3/q5U9IeyWC+J1XNEbTa2jwh/fD+99WordEelyMZzfxoBadBhcASPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <57c32156-369c-a92a-ecc0-fc4b890eb05c@suse.com>
Date: Fri, 12 Nov 2021 10:48:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: [PATCH 2/6] VT-d: split domid map cleanup check into a function
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>
References: <a97adc3d-2808-1c87-8fd6-d6b24b83bd2b@suse.com>
In-Reply-To: <a97adc3d-2808-1c87-8fd6-d6b24b83bd2b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0140.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::45) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 050e1c80-c7f6-4b28-fa86-08d9a5c19049
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB233578E2272F89A57DDA44FCB3959@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xMs5D43AUuEv0aRZ04rlnggXcFl6w96gzoiGF/SPBtgHqE+uqu4mQUM8lfdHfUKIl36pRG2TN6Df2ONGtrD4+3Ay+Em5E8mpJVCwX+WqUsUSQ1ZRLgQWrr6XlSFddWkMyBJKOM2Fmq7phrlBDi+udikS/aLhO5jIZAx/T8IBkVw2V1+C3A2pTGzpZUHXrmD1Jucu2wpRFdP+wjY19+uQrvWKUi35H28wQpe/6sOUfLXhEYacgRcCaPVC0NJKO7n+SffW6g00UL4Js+2HH5zFyHpK9hLwFuzJhIlv3vOmdSF44BEYhdIyuIJdwzvm7T5m237PBpKjSOFyVg+B8d/wXImN494Hj6XC+nkEBZ5IoYC1leTcllDDgRxLO2H3vNFMx2bd/9r/S9bKFvBxJCf0sGXCq0k2CnoZMDXh2D5pj1lPDb2PcokQEGox4TDhaW1rth+WSigk4pySigcprIhHt5zxHlyIn/WF64Prv5Ympg/rSsv8vQoFYsragt1/8yAF6Cx1+FNW1KQURZtMB2ohDr8AQm6VJTarulln4ymkG60cZsnfM03mVE4+ZDIRQrcd0RTX2jIg+Nkxp/aNaIWfo/0vR+GJ9OvKZJiqqL41VPJJv4SBqPj07x6iui5p2FIP0Z0hmSqf3xyZ1CbFkW+0jRZbXnEGABDodpfhjGwm5Md/jvZHPuVwRAf7UCDwAYabT9Nw1V8t4Ls8THPDt7OV1DFkoATSDIvjvaUVTyrdAQg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(4326008)(16576012)(86362001)(956004)(2616005)(316002)(186003)(26005)(31696002)(38100700002)(66946007)(66556008)(66476007)(5660300002)(8936002)(8676002)(508600001)(6916009)(6486002)(36756003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N04wYXRBQ2VkQnVzNlY5UHZjekh1eWdWM3M4Y1IwVHRsdk1RVTZySU1qQzFn?=
 =?utf-8?B?ZlNEc2tBdFdsMWRrbGJGMlJkL2JJaDJ5bXN5VVMzTGpja3FPZEZOT2JDWU1C?=
 =?utf-8?B?UldPUHlCcWtwNVcrRUVHMVliS3k2aDd2dGcyU2YwUG8ycWJSMWFnVlBySnBr?=
 =?utf-8?B?SFZGZEppb2lSOFcwdTAwUTlUQUo4SDZqN3oxcm1Jekw1bjZHM29OU3NuVlY2?=
 =?utf-8?B?NkE1OHBueGVCOVVJNjdmUElBaDVEVzFvWTBhNExuWXI1TWtPNkNSYnJaRzF4?=
 =?utf-8?B?dkwzdlQ4cTA5Nlg2ditwUXQ4ajNTQ2dtblJEY3IyRFVtaEZsc1hpdHN3MjF1?=
 =?utf-8?B?bjl6eWZpNFk1U0JqNU9ZMWxWbERYQzgrVkNlSXlCZW9FcnBqLy9CTTJUVzBj?=
 =?utf-8?B?R0ZWTHVFazBRR1NEWnh2WTlvM1FxUWlGVTRIeERMVEhyNkEzNEdnZ2N4M3A0?=
 =?utf-8?B?VEV4dVF1eUp2a2VRQTZNR09HSkQ4RTVlTTM4WUV5SVRMUUt2Q0YrR3M0RS94?=
 =?utf-8?B?c05FSHBVUmZLY1FNM1l6MS9rWEZUSHkzanVGVHhDWTdNcDFPbCsvS1JWWkhM?=
 =?utf-8?B?b0VKUVVWZDF3Z0dPczA3ZXBVWFNmaFFHd1A5VndQSUFiU1BZOVFXVXdXcENt?=
 =?utf-8?B?dmFwb0V2VGFyZDIvWnFjRnRyb2JYWjNzQmpYS1BQTlVZRzl5VE5rVE5YdUxy?=
 =?utf-8?B?ME9GTVpWQkRuZHpqUmR5SHBYWG5WRGw2cWJXN3pqbnp4R1hNZ1VmWkJlb1VG?=
 =?utf-8?B?SEZoSzZUWUtWRHlhTU16OVpkNEQ5V3pDd0ZLaEhabGRrZmE3OGFZRTZqcXdp?=
 =?utf-8?B?cUhhdEJJZitUaWxFSWZINUxtRjRkTHdFZFY2QjB5ci9ZOGFpZkljOGF1eUh0?=
 =?utf-8?B?U3ViZG1Rek5EVjBVeFZXWUc4V3JZRmVUN2lMYm9VY2dUbkp1QUFLYmZXOHdW?=
 =?utf-8?B?dmhkdHhQNWphdEx0UitrQ2RySC9pVmVWSldPUzFlUkQrMUFFZ0lNNm4zR0dM?=
 =?utf-8?B?dWt0Z3YxdThUMmJaSUt1YUVzUFhuREJaREtZZzJ1emJVNEtVdEQwMHc0Q1V2?=
 =?utf-8?B?TzFkQlo0QkZmbC8yLzdGVW9kNVdjRUNScXF1OUVSNkh3dXM0QUl6UkFhTzA4?=
 =?utf-8?B?NmFIenFoVzA4d3EzcEdyMzZ2Rmh3K04vYmlSTlIrVzJSU2ZlQWROaGRaeDh2?=
 =?utf-8?B?eGRVMkdxdURrTDR1a0NpTTNOOGhjaG9kV0x5Y1A4cjFxWm1DaXB0TXNjcXJG?=
 =?utf-8?B?ak5JWExpa0lwU3QyZkZjSFZ3MGZkSHI4ZVFDVW52SlRXd3k0cWIxNEJwaTNp?=
 =?utf-8?B?TG9XT0RuQkZHOHM4TjJZZmlaNjBQYTdrNHRNakErb1VGZ3VNT2xlL1F2b0w5?=
 =?utf-8?B?TWN5VXFuSjc3ejNKUlpoQk9MUUtoOWpQbitrSmpOd3cvRlNVVk51b05aK1B4?=
 =?utf-8?B?MllhRUYrT2YrNVlSbkpVQTFSTlUyTFBtMVFyRWtaTHNyWk83NTM3b2pjOHpk?=
 =?utf-8?B?dlNzYmhkdXdpRDdmR1dTTWM5aGVXdnpSNE9uM0ZqM1pOQW84S0VrWW8rY3RU?=
 =?utf-8?B?azE5bDFCUGxxL0txblpzb0Z3Ny9ZUHpxc3RFOXZmOUtLNGMycm9id1hKTERy?=
 =?utf-8?B?RjdnMWJ4MnJwOURPRjdFMTM0WjRscEtFczN3UFhFeTNua0N3anlNWjhjSjZ6?=
 =?utf-8?B?N1ZRa0I1OS9VR0xCNzVlM2RUK3o0SUFKQWpOSURJZENhVEpoR0RjQ0Q2VUt4?=
 =?utf-8?B?ZHF4aVhicTM1OTdGalgzMisxNVQrSGk1emNaenAzV3ByMVVnd3dlbFBZYzNp?=
 =?utf-8?B?L2pFMDZMRzRHUnVNOThGTlJ5TjM5MUZnei84R1VnU01XZnc5NE1lSmtUOHhh?=
 =?utf-8?B?M0loRW1wVVUyc0tzWllHc2hvWUR0M1plZkd1emplN1J0UmJEQXNJR1VBamh5?=
 =?utf-8?B?QWZIc0xyY1FQbmdFMFZWaDlFSXRReUtOb3ZKZ1Q5Zno1K1pIUVUxMFVwY1ZR?=
 =?utf-8?B?WHpTL2picDdCMUhnOFAvbFpPUXhhWkxYS0hjc2xxMW1XcGNhdFpMTXQ4a05m?=
 =?utf-8?B?dmlrakxWTWxkNDdnOWpzaVFSTHNYZWFZOUFBQklTVGRYWmsxQkwrSDd3c1FE?=
 =?utf-8?B?ZjY3RjNreG1GZjl4bFhZeUtFVW9MU29ERjBLbDVoQ0FrbmpwUHYyT1M2c3ZN?=
 =?utf-8?Q?YFAa9b1QdbZacaqedLucjq0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 050e1c80-c7f6-4b28-fa86-08d9a5c19049
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 09:48:21.8863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S88J141z0536St9f1ChgWjQUBW2GftoxH80TwBwLVh+BFROxVB6IAJC1QlhwoA1oYj/fgBfbJ82BP5G4vpguKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

This logic will want invoking from elsewhere.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -157,6 +157,51 @@ static void cleanup_domid_map(struct dom
     }
 }
 
+static bool any_pdev_behind_iommu(const struct domain *d,
+                                  const struct pci_dev *exclude,
+                                  const struct vtd_iommu *iommu)
+{
+    const struct pci_dev *pdev;
+
+    for_each_pdev ( d, pdev )
+    {
+        const struct acpi_drhd_unit *drhd;
+
+        if ( pdev == exclude )
+            continue;
+
+        drhd = acpi_find_matched_drhd_unit(pdev);
+        if ( drhd && drhd->iommu == iommu )
+            return true;
+    }
+
+    return false;
+}
+
+/*
+ * If no other devices under the same iommu owned by this domain,
+ * clear iommu in iommu_bitmap and clear domain_id in domid_bitmap.
+ */
+static void check_cleanup_domid_map(struct domain *d,
+                                    const struct pci_dev *exclude,
+                                    struct vtd_iommu *iommu)
+{
+    bool found = any_pdev_behind_iommu(d, exclude, iommu);
+
+    /*
+     * Hidden devices are associated with DomXEN but usable by the hardware
+     * domain. Hence they need considering here as well.
+     */
+    if ( !found && is_hardware_domain(d) )
+        found = any_pdev_behind_iommu(dom_xen, exclude, iommu);
+
+    if ( !found )
+    {
+        clear_bit(iommu->index, dom_iommu(d)->arch.vtd.iommu_bitmap);
+        cleanup_domid_map(d, iommu);
+    }
+}
+
 static void sync_cache(const void *addr, unsigned int size)
 {
     static unsigned long clflush_size = 0;
@@ -1675,27 +1720,6 @@ int domain_context_unmap_one(
     return rc;
 }
 
-static bool any_pdev_behind_iommu(const struct domain *d,
-                                  const struct pci_dev *exclude,
-                                  const struct vtd_iommu *iommu)
-{
-    const struct pci_dev *pdev;
-
-    for_each_pdev ( d, pdev )
-    {
-        const struct acpi_drhd_unit *drhd;
-
-        if ( pdev == exclude )
-            continue;
-
-        drhd = acpi_find_matched_drhd_unit(pdev);
-        if ( drhd && drhd->iommu == iommu )
-            return true;
-    }
-
-    return false;
-}
-
 static int domain_context_unmap(struct domain *domain, u8 devfn,
                                 struct pci_dev *pdev)
 {
@@ -1704,7 +1728,6 @@ static int domain_context_unmap(struct d
     int ret;
     uint16_t seg = pdev->seg;
     uint8_t bus = pdev->bus, tmp_bus, tmp_devfn, secbus;
-    bool found;
 
     switch ( pdev->type )
     {
@@ -1780,28 +1803,10 @@ static int domain_context_unmap(struct d
         return -EINVAL;
     }
 
-    if ( ret || QUARANTINE_SKIP(domain) || pdev->devfn != devfn )
-        return ret;
+    if ( !ret && !QUARANTINE_SKIP(domain) && pdev->devfn == devfn )
+        check_cleanup_domid_map(domain, pdev, iommu);
 
-    /*
-     * If no other devices under the same iommu owned by this domain,
-     * clear iommu in iommu_bitmap and clear domain_id in domid_bitmap.
-     */
-    found = any_pdev_behind_iommu(domain, pdev, iommu);
-    /*
-     * Hidden devices are associated with DomXEN but usable by the hardware
-     * domain. Hence they need considering here as well.
-     */
-    if ( !found && is_hardware_domain(domain) )
-        found = any_pdev_behind_iommu(dom_xen, pdev, iommu);
-
-    if ( !found )
-    {
-        clear_bit(iommu->index, dom_iommu(domain)->arch.vtd.iommu_bitmap);
-        cleanup_domid_map(domain, iommu);
-    }
-
-    return 0;
+    return ret;
 }
 
 static void iommu_clear_root_pgtable(struct domain *d)


