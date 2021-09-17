Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DD640F666
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 13:00:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189290.338889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRBbE-00073b-G5; Fri, 17 Sep 2021 11:00:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189290.338889; Fri, 17 Sep 2021 11:00:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRBbE-00071X-BK; Fri, 17 Sep 2021 11:00:08 +0000
Received: by outflank-mailman (input) for mailman id 189290;
 Fri, 17 Sep 2021 11:00:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fBbp=OH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mRBbD-0006xR-E3
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 11:00:07 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a450cfc-17a6-11ec-b682-12813bfff9fa;
 Fri, 17 Sep 2021 11:00:06 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-tYwZSGEaO0W7H4KmVvNh_w-1; Fri, 17 Sep 2021 13:00:04 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2703.eurprd04.prod.outlook.com (2603:10a6:800:ae::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 11:00:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 11:00:03 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM8P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 11:00:02 +0000
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
X-Inumbo-ID: 6a450cfc-17a6-11ec-b682-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631876405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UppQocqB70WkQjVr0azZfPR+2KVYqhGJJEBclpY3yOc=;
	b=mBjrbQ4qRu+WvdMsZtVBDbT8YdJPrNCffticJRp3KvriMxiVuMtzgLoYzPV07AxSt+5RJY
	gI6MNEXVldzHvS5U7NiXRF1zTKhJAvxBP0m9hjwve1xsxK/802gAtdDCsNMwLWZTWqs90K
	AeVKoECF3JKqdmvyS1H8qw8hB/4v7FE=
X-MC-Unique: tYwZSGEaO0W7H4KmVvNh_w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esBbik5m8aj4/bF7Qq79cwRcycdRp8/IY9JuTaL+h2HZk3EcfOnDm/L3lM+htqnPrx+fBLBEjGj6eY/xNiIz1+Gby59NZWnW4XCfjS/2Fx79FSjnksru0xGcqUrHTby6IgiMiYN3NOu3ou/dPkuBoDePTqQFdKPI8SqazBj82M55UgJ3oUcjqTZJnfK5Gn6RnMO4eK3yCkQ1Cm3UEZtRaanR5lZcDUoch2bMdzyA9Qr6VMBwAN10Cgezs70+pe4UgzsXsuAoOTPL3S+DYay7dU1YIjdhJq1ud2dEliqUaDFYsh6m9cX74/z7TAojaPgLxiCR4cckkQIMGPOS8+HvVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=UppQocqB70WkQjVr0azZfPR+2KVYqhGJJEBclpY3yOc=;
 b=hH/snVUFNV+ZU+56I7eTrijwfQ7Sp0wOsdkrBWl8OUeFyDsU9gX80Sp2Lcvc/UpKiql2m6E0Iiy5+XW0W390CNC8tbSr2uedAMPmeSKrZZi7VymbG/gV3SJk542WAt0ggtwwbDum/lBw/STqGJwUmQdzpZnqAasdbQmGZ/+GjgYpO/bJyAy44yU65dUlJgmZN/+BVrYzGoIYAbxx8aWQerrHbh/UQwO/zSlJV3d24AQCaqneNcZWPZYav78c+XUFGUgssEovnywk5iGd0Gu5/4gBgi2ZMY9uEnMrZz0Ya3b6dmykyJx9WGanzTuglY6XtJH2qBiL7aF5RXsVqehANQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 1/3] VT-d: consider hidden devices when unmapping
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
References: <c0a460c0-9d7e-c015-37cf-4775bdef33a8@suse.com>
Message-ID: <64c6b3e8-045b-9308-b77f-721c3d57c08b@suse.com>
Date: Fri, 17 Sep 2021 13:00:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <c0a460c0-9d7e-c015-37cf-4775bdef33a8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P191CA0011.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ec7cb6e-93ee-4b4d-9d0c-08d979ca4ce1
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2703:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2703794C093615299B78C6F3B3DD9@VI1PR0402MB2703.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dKyHHbmrcPEuo/NCRuctTFLIFhU/QU4k74zor3ELysknluJmr16aa/lw4vh0/8jbq8dd7d9Zoc2qAWhWMxbtwMePaIxcm1TXgNFOgi5VJAS3HE13iDNgfrFJVlZ+xW9iBmKlXe6XUZIiIZvmfuTVbf7CcXhFXWxAyp4eHbeZdtgwJDF8nbGx4gSyXRQcVIeD5/Z4rVacsxqODbLjxWHdsTd+20gej8vQ0hIXEfjOlvYvUO7bH8HzdsONGVAazOTWZa6Ag5ADBePge60rL8yZGG2lZPyUYhUvwdBKevgrdn9ak6J9MDIC/k73pwq9wRi6QYL+SSAdCWvYsVDRFiLmTZ0/6LUiYY6wUWsfQQ+3u8zruE+ArUAPOk5FC5qD3lSzSIpJ+0vTk1V2fCOrkiwq71xQrt+e5RrENvr9kA2GmtEn0d0l5UeTltxd4XCcuceYR9fbNKor53iau2uGboVvek3LBjR7GugkPllLCrdhRRfS9CLelMBU3f8zOOBXnhjT8rUvYQp1av7bRsh9uUQUVq3cJgzgRI0fRjlGw7rSxk5iTHMIXEw5X1s2mqAF4ennsacwh/sk1+cisyp4kAGMeINfYYwOB5agPx6zk6Qia1yA8FjDgCgyOkoepFg2ir1s4ER1808jtBFG7eD+/iJAVm6BeuhR4NyvqLgLk+8+o/LwOEX16QpLfQUNfO3JodzFHd3eLQ642o2eRcG9dl39aoDV30bGs6IRrphp7P+6upc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(396003)(39860400002)(346002)(136003)(2906002)(186003)(316002)(4326008)(16576012)(31686004)(956004)(2616005)(26005)(8676002)(8936002)(31696002)(6916009)(6486002)(38100700002)(66476007)(86362001)(66946007)(66556008)(36756003)(5660300002)(54906003)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cW8rWGM3NWJpWE1LOEZXQ0k4MGJkWmY0eENGcm1EUG1YNEhEclBRT1pjL0VL?=
 =?utf-8?B?cmNiQzI3SlRnMnI5WWJiMmtqSlJoem1wUUpZTFZaUHVqMkZFY01UZm92N0Yr?=
 =?utf-8?B?d0JyYlNKNG9NV0N1QkJyR0RyTVB5VlArRWRWYk53ZDFSTm9PWFZWT0pqMWNa?=
 =?utf-8?B?Ykk5QWtjK1N4TWltMUo5SExFYmxmT0p0MFJFN2ptK0ViOFFiWG0xRmtpTlVv?=
 =?utf-8?B?MmlHSndrWHFNUk9OdS8rTUtqOFFGN2owb0lPV3ZUeUYzL2pFdTBNVkQ1UDNs?=
 =?utf-8?B?NHJtREFRdFVMZC9LbkoxcTh1Y3VaNEEyYlk2d3IxMy9oaUdiUXVYeTJMTTlp?=
 =?utf-8?B?eUFoNldpcUxyNk1pbWhHZVlSTktZOWpRVFl0YkhLWmpkUjA3VkFQSDE5R0U4?=
 =?utf-8?B?Mlp3SW53NDNZb1pzOHJWMytNcFdGVnBkTnBCM0dhS2VoQXBRUkxYZEU4U3c2?=
 =?utf-8?B?ZHd6ZzhsUG9rT3l4TWN1Q1hGNlBUZ1dCMDJzbEhLZVBTeUsvck0xalA0cGNX?=
 =?utf-8?B?b3ZBMW9aM0VtemhzWWl6SWpLWFVCbStjWkQ1L25FNDc1b3hZOVNYWkd1ZitZ?=
 =?utf-8?B?T3RBRXBWY2VHT0dkUm9zTnoyOVE4ZGVldEk1SFZ5QWlnL1hnblNJVmVodWZR?=
 =?utf-8?B?WlpqOEhkUi9VZ3BtRWU1VjZGZllBMHNjT3pmeFIzcC82VUxEOWUxaDhIN2Fr?=
 =?utf-8?B?Q0NIZGhIdElZTy81eUgzZ2d3YTh4OHMvK0psR2JrcFFUcjhpSW53V21ldGlq?=
 =?utf-8?B?UXNQaVM0YkZHK2lrUm5TcTN1dS9xeU01ZFI3UTRMMENkdEx6V01KR3I2eEdt?=
 =?utf-8?B?azNCUXI0OVRXdEtrQlIxcmNQN2l2V0F5dGVHYXZjOE9wK0lVeHZBUDA3SUZV?=
 =?utf-8?B?WXJxOW1ubndaRW8wemF2YVE2TmVpTUIrMTZka280R0p4T2I1OHp2UnRPT0w3?=
 =?utf-8?B?MWFuVXc2dFpnK3JhaWR0ZWlSQ0Q1R3J0TFZiYWpyVFRRMWdrM3hzS1hBSWNS?=
 =?utf-8?B?K3ErZ0VkNzJJRzE2OXB6QkMxK1VObjFpTEE2YkM0WTZZc0V5ZGFyOUFQM1lV?=
 =?utf-8?B?eGJpbldxcHFNQ0M2QXh4K3R4ODNLcUdidEZlNXNWaXhYdDJiSTF1VlZrZW56?=
 =?utf-8?B?SGZQUDg5ckxzVVlPeG53aDJQbkJvS3VKL1NleXhWT2lpL3ZLYlFnWGs5Nk03?=
 =?utf-8?B?dDV5RDVKb2YrRjllaFVhVnEzSDNwai9kZ1dwdXRiclk2WGFEdGhNcXZVb2hw?=
 =?utf-8?B?d1h5ZFlyWGV4UTJVaGw5N0dNT2hWc0J2VXVQZys2QUNMMktFczRrWE5rQStO?=
 =?utf-8?B?ckx1VGJrWUliakRXSk42c2tBWXhLM3cySG1yMlhhV1ZhUGlHcW1jUmRBMDZX?=
 =?utf-8?B?SGVVd0Fwc29BeTRvQnYxSW45VUNVRS9UcUVabXBxVEpBcTdMMU5NR1Z2VCsr?=
 =?utf-8?B?amxyd1BpZ1hCd005bnd3WDJMNWM3VTRIZXBZTnZxUm5EZ1FjNEcvekNoWUM5?=
 =?utf-8?B?SkNYOEROdUZmUGs1TGc3UmtMd1hBeFJzbnUvR0JxWTNER0JmdUVYaDRraUZQ?=
 =?utf-8?B?WmpHTEduL2k4OEFkWXJ5aGJoZDZnM2N0aklnSkZtTFlJL3dFOGNqck1nYlE1?=
 =?utf-8?B?Zlk5Qk80K0VvQWZMRmxZaXdlNVYyUkZlSk83QzA0RWo0SnVFYXVYU2prcnBo?=
 =?utf-8?B?ek9KWkxBNUlJTnEwbkxOMDBiT3pFcSt1YVZoQjUxR0JleFJ2WkIvMUUvNkk5?=
 =?utf-8?Q?RNrl5n4n4mPsscVjP66XAMgYrc98U5xwjcaUxwv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec7cb6e-93ee-4b4d-9d0c-08d979ca4ce1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 11:00:03.0704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BL0M5Gv8SywsN8nJ3IGt1Hm5zkrlziDRlouI/vHLYjQvGuy+4eIfYW/yDAs4lW5delnivzbhZNVIQvGfuuax/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2703

Whether to clear an IOMMU's bit in the domain's bitmap should depend on
all devices the domain can control. For the hardware domain this
includes hidden devices, which are associated with DomXEN.

While touching related logic
- convert the "current device" exclusion check to a simple pointer
  comparison,
- convert "found" to "bool",
- adjust style and correct a typo in an existing comment.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Introduce helper function.

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1650,6 +1650,27 @@ int domain_context_unmap_one(
     return rc;
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
 static int domain_context_unmap(struct domain *domain, u8 devfn,
                                 struct pci_dev *pdev)
 {
@@ -1657,7 +1678,7 @@ static int domain_context_unmap(struct d
     struct vtd_iommu *iommu = drhd ? drhd->iommu : NULL;
     int ret;
     u8 seg = pdev->seg, bus = pdev->bus, tmp_bus, tmp_devfn, secbus;
-    int found = 0;
+    bool found;
 
     switch ( pdev->type )
     {
@@ -1737,23 +1758,18 @@ static int domain_context_unmap(struct d
         return ret;
 
     /*
-     * if no other devices under the same iommu owned by this domain,
-     * clear iommu in iommu_bitmap and clear domain_id in domid_bitmp
+     * If no other devices under the same iommu owned by this domain,
+     * clear iommu in iommu_bitmap and clear domain_id in domid_bitmap.
      */
-    for_each_pdev ( domain, pdev )
-    {
-        if ( pdev->seg == seg && pdev->bus == bus && pdev->devfn == devfn )
-            continue;
-
-        drhd = acpi_find_matched_drhd_unit(pdev);
-        if ( drhd && drhd->iommu == iommu )
-        {
-            found = 1;
-            break;
-        }
-    }
+    found = any_pdev_behind_iommu(domain, pdev, iommu);
+    /*
+     * Hidden devices are associated with DomXEN but usable by the hardware
+     * domain. Hence they need considering here as well.
+     */
+    if ( !found && is_hardware_domain(domain) )
+        found = any_pdev_behind_iommu(dom_xen, pdev, iommu);
 
-    if ( found == 0 )
+    if ( !found )
     {
         clear_bit(iommu->index, &dom_iommu(domain)->arch.vtd.iommu_bitmap);
         cleanup_domid_map(domain, iommu);


