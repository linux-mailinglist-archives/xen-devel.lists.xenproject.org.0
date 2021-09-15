Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A570940C284
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 11:12:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187373.336211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQQxq-00087D-04; Wed, 15 Sep 2021 09:12:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187373.336211; Wed, 15 Sep 2021 09:12:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQQxp-00084v-TF; Wed, 15 Sep 2021 09:12:21 +0000
Received: by outflank-mailman (input) for mailman id 187373;
 Wed, 15 Sep 2021 09:12:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQQxo-00084l-4H
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 09:12:20 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88ed0497-ce9b-4681-86e7-8b084330d285;
 Wed, 15 Sep 2021 09:12:19 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-PV71D0OkNracoxx4ys6C6w-1; Wed, 15 Sep 2021 11:12:17 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6862.eurprd04.prod.outlook.com (2603:10a6:803:130::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 09:12:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 09:12:16 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR05CA0035.eurprd05.prod.outlook.com (2603:10a6:205::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 09:12:16 +0000
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
X-Inumbo-ID: 88ed0497-ce9b-4681-86e7-8b084330d285
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631697138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V/tbiUwwg7Omg2atvKwkwb61QSkxuOMN4oMJkXQ5UrY=;
	b=AgkEgSA3u0KOLRp/wV82xAP5lKnDRHEMflkNJ/pQLF2g4IvNq6Ws+LbC2PBJSdaV+z0QQq
	Wj4uR7I+lOD54Pbzh4TJU1dZ2H93pwqPTOqlxgu9iZlF5+jKgeWjwTJFUH/MC/z2hnpZLm
	RIkZmh1WG5+tVL3SIJGT7mgcbopKX54=
X-MC-Unique: PV71D0OkNracoxx4ys6C6w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DoxJu4O3kBhUwA1+Al1FtezdmH+x/dkBK+PxRhrJbBcEite+YB5phhidKBdz+bfTtApAZnjMnIZMuFOVuKbKXr0b18Aa/DH5sNVzvIkRm7W2njqs77OobJeGnXi3756dsrIdbdObbEjWoMxLEdn8ypSEl0KKmJfz2uPSo/aNFvMyLN2cRUB9XPFI6rcxfNKktQUVTDnscqFneO8/6XhPOtXpq7IflxYFFIXPpTEA1+InsaCbXr1WCVYZnM7L1qFarVWvEJEX60FbZ+6Xdt7h2VRN0ulcicOxAiq3rm2vmUdKvGKX/b6LhbHr/2xXFGsXEitpUFsgBRE+OeSizLVTpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=V/tbiUwwg7Omg2atvKwkwb61QSkxuOMN4oMJkXQ5UrY=;
 b=J2mI4pjQqc7dMjKuSy1Zx4GijafkfEK4O5znFMStR3qZPS8KZQJK4TzTfbKPn062R9phTgSarJngcD5YULpa9KDeGvAFmLSmgwgC9qVwJvoxgPx+0eeXm/aS87HZc6HUpeKy2i9FTizKHaww0gXcDqArdwR2xl8NQopBCyPPVr71XnPptjlZkfmOfi/sDEaFMPe+Ph3kRyEvLHNnVZ5CdE8rAiZ6MBWtUe5WqykLoS0wc8fNtBMYAzKpia3+pfj1OlNWWXrP0h/ZLIS+7ulXsBIkIrqA0kTcyz6w5JFKzqT5kath97El/O8rgFCvMLufXvviVItD7Bu4pELZ5NLG4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 1/4] VT-d: defer "no DRHD" check when (un)mapping devices
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
References: <6b7fa64a-bd6b-353c-30cb-ec25b850cbed@suse.com>
Message-ID: <afd4520f-7966-eec6-b1dd-9e0c12dc8836@suse.com>
Date: Wed, 15 Sep 2021 11:12:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <6b7fa64a-bd6b-353c-30cb-ec25b850cbed@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR05CA0035.eurprd05.prod.outlook.com (2603:10a6:205::48)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb7040f1-58e0-4f76-6c61-08d97828e998
X-MS-TrafficTypeDiagnostic: VI1PR04MB6862:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6862EBBAEEA3A876527242CDB3DB9@VI1PR04MB6862.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8wa41EkcSi/iLP6H9l0G/u6Uz5E5snSIurSnGN2FoqWNkbcI/WtQRBH2i0iWqCgSGL4QFChsNGvuHDRVx5qWrVY3gUWdJfdKkP/VwDj7yG2amRgN6IXnL4LlJtnf+Xms2yB2IjwL0uUrkQgZkcv9ZL45gvpwTa91sb2AZqauOgrBhbKy9z3bf+4yxhzHZuiRwI4LGXVCyrNJdcESpmqyPyw8gpgEM3meviYPisvWtTTDSpeISHe0os/qMgqBN+TN7tzyrCEFP6D2SVS8n8yBuPuuujMeaWfOVXIZjGNVc0M7nf6PhLG5Kb4TEav5yQzv/Gq7tRHVjyp5rOPP6+RQIpiQSSttshLPPgjz8ebmq6J0eqGIa+lD407bWRovLTSlLzRDPLM0y3vypWGCCh1SDmEvhM7+8E9GAGRQ8+l9PrJ4bqNnqa/+X0Op/fGFXvCabl30C0Ma4jYmqnmYynR5JIfQrzeBsT5mWZB3/0oKcMVEx/rJEGe128I58luJOWheJC65q4T1l7x4xyPrin7hl9/dEscZqOpZeo50an/mI6+MjxaQrEVoadgSdNH2xjfg8alKftGhWDvhsk+kh72/aAv2Wm0GLircDIsThj7HcJ2aDTTCfBqVXD2fCksNQ1JImkyVOSUmeJ178mRq7HlBcfvopfjzSVMX6mcFd6qaepEgIcLyVoX/PJnnXsWQXvvzNUOuDunfhFklB0gWCLfG70ZLbVa0JCzPRhUN7Hzx/cq6YljfchdalKJKU5OIyOhp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(396003)(136003)(376002)(346002)(36756003)(956004)(2616005)(86362001)(83380400001)(8936002)(31696002)(2906002)(31686004)(66946007)(66476007)(4326008)(66556008)(26005)(5660300002)(186003)(8676002)(478600001)(6486002)(38100700002)(54906003)(16576012)(316002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFZ2N0xNVWpoMWVlcWFZeUhlWW5Xem93QjR2UzllWDcxZTQ2dUthUXYrNWNh?=
 =?utf-8?B?VXRicGRLVERRZUd1YUx4VWh4S3Nlb0pUckg1UEtSM3AxajFYbERYazZzWHJK?=
 =?utf-8?B?UElLTHQ3WGVGbWJoUHN0YXk4K3hiSmxkRHd2MjdnWmtmQThNRkw5cXcreHoz?=
 =?utf-8?B?MUlJdEVHeUhHM0JMakVGQ1EzSnkvVnZBQkdRQ1ZHUVN5UG4wR1o0TXBEcS9m?=
 =?utf-8?B?akYwN3ZBWXo0RjBUek04N09ORXkzNVcxWjJYK09qa1VnLzRyZC9MclJNVzY2?=
 =?utf-8?B?WXRubUxQdUQ3K1l4TUQ1eFRaUWk3TVNpcVpKTDl2Q0l0aW1uNE8zUjFCTFA3?=
 =?utf-8?B?OGdITVNib25leEloeS8xTjdNbWtMZ0l6Skw5Z2ltS1dTbS9DcDNYYmt4bFN2?=
 =?utf-8?B?UnJ3bFRzUTE5RW5HbTdndnF4U1Nmd1pWSzZ6TlpBcHJlQXJRSHRaZ1lTU2FJ?=
 =?utf-8?B?djR5SDByNTNpTFg5c3dLbmxkQTM1KzNzS05GNUFWSThVVEhhSGQ4bFdSUjNE?=
 =?utf-8?B?K0MyOCtnNnBlRWxrQUM0dzZuZllWdnhleHhmZk83djY2dGErOWduVDBJUkds?=
 =?utf-8?B?dEZmOVlzTVR6RjVvRzE2bGwwSFlNUVRTZUJtZm5CMzFSdytaWkVmOEhJWVI0?=
 =?utf-8?B?YWg2bXI3clNXUG4rOGtmNGY5dkFqT08xN2lteVl3dk5ZbDBhMHAzU3p4eWo3?=
 =?utf-8?B?ZjhFbjNNa0VZVWxLOUlQL004U09Wcy9MUHpIYzlrK0NRcFVERkdsdnIyaUl2?=
 =?utf-8?B?cm9HZWN6cG1rc1NMNGROUmE2VU9oY3hhQjc1YUtFV0o2dUpkVUdDY0JrR3ZQ?=
 =?utf-8?B?MHBEK1piU2tYbzFkakRsV3h1YitiQzh2bkJEZ1BQU2hETzJHUVdBVm0vTWZO?=
 =?utf-8?B?M3g3NCtKWXhiUHl6eXJ2QUNqUkk4bzNZbVhYN0lHQmYwQUk5TlhnZktWbjVu?=
 =?utf-8?B?eGFWdWFJNE1DbUROYzJJODM4TzV3TUpzdE5ucTRXQlppSEQra3ZCelhiWnF3?=
 =?utf-8?B?aEdvMlBkeFpkQjBUMTZtMHZVNndjeVBLaTg4WUxUVUZIMW10dGVvcG92Ylc3?=
 =?utf-8?B?UnBVTlc0L1JoWUFxV3pVVDl2NFZ5TEQzWU1zSEwxc1VKN3ZWZ0RjVEFDbDRJ?=
 =?utf-8?B?Y0dBZ2NHc3NYZzFJTTIvQ1I4dUF2bnQ4bG10OU5aOXZGR3V0RUhvVjNvQXBF?=
 =?utf-8?B?Q01mRmVQajh2Nm9UeHRxTG5WOXFxOXN6RUNHRmNQQkk0d0hHRS9DTUY5TkZ5?=
 =?utf-8?B?RmZhZ2dzcGJhdmxNM1I5NVFtaHB0eC9XMnl4OFVGcjdjeSttK0NGZWtwL0JE?=
 =?utf-8?B?WkZxb0xXTFFCRUI0b2RVQ0ErUkhpdnZqVTl1bXVqQXVHZHZqQ25ISHdiSWcz?=
 =?utf-8?B?OHdoUTNQMVgzQVU5MlVmd2VjRi84N2RlTE45S01Qb25tdklwTmhOVmErc2VT?=
 =?utf-8?B?MTZ1aCtFdWVhYjB5WjFZd3V2aWR5ankvdG5LL2pNQ01zOHNCTUxwSzY0R0FF?=
 =?utf-8?B?bUZMU3ZyN3dPZSsyR1VneTVBSHRjbTB2SmRESWxUOC9yZUhINFdqZWljNmFC?=
 =?utf-8?B?SDVnWFljb0F5b0N0R2J2Ujc0cGxhMmtLY0FZVy9ERllxaWJrQmh5L0l5cmRG?=
 =?utf-8?B?Tld4QlZ6SzkrNGpLL3VkbGVQU1d4Y2k5RGJaMGN0Q05GQWlTY0FnaFJMU0ww?=
 =?utf-8?B?SXVpU3RCUm9jd2Y0QlRwTWlFWXZvTjZmd2xKdnVwOWE3N1ZNZlJyM3ZWVWZE?=
 =?utf-8?Q?jEYy68EGI7J04EVJU8XUJdKuq0Tmv2CbY+NmA1X?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb7040f1-58e0-4f76-6c61-08d97828e998
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 09:12:16.3550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2C3DQbQQUSfj381+o7dsR+d52WpPrWN89NZu0BYtO2gTmTEArHDPG9peT10NAlivFqKlTE4cQsdZwJ6/XcXw4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6862

If devices are to be skipped anyway (which is the case in particular for
host bridges), there's no point complaining about a missing DRHD (and
hence a missing association with an IOMMU).

While there convert assignments to initializers and constify "drhd"
local variables.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1460,14 +1460,10 @@ static int domain_context_unmap(struct d
 static int domain_context_mapping(struct domain *domain, u8 devfn,
                                   struct pci_dev *pdev)
 {
-    struct acpi_drhd_unit *drhd;
+    const struct acpi_drhd_unit *drhd = acpi_find_matched_drhd_unit(pdev);
     int ret = 0;
     u8 seg = pdev->seg, bus = pdev->bus, secbus;
 
-    drhd = acpi_find_matched_drhd_unit(pdev);
-    if ( !drhd )
-        return -ENODEV;
-
     /*
      * Generally we assume only devices from one node to get assigned to a
      * given guest.  But even if not, by replacing the prior value here we
@@ -1476,7 +1472,7 @@ static int domain_context_mapping(struct
      * this or other devices may be penalized then, but some would also be
      * if we left other than NUMA_NO_NODE untouched here.
      */
-    if ( drhd->iommu->node != NUMA_NO_NODE )
+    if ( drhd && drhd->iommu->node != NUMA_NO_NODE )
         dom_iommu(domain)->node = drhd->iommu->node;
 
     ASSERT(pcidevs_locked());
@@ -1497,6 +1493,9 @@ static int domain_context_mapping(struct
         break;
 
     case DEV_TYPE_PCIe_ENDPOINT:
+        if ( !drhd )
+            return -ENODEV;
+
         if ( iommu_debug )
             printk(VTDPREFIX "%pd:PCIe: map %pp\n",
                    domain, &PCI_SBDF3(seg, bus, devfn));
@@ -1508,6 +1507,9 @@ static int domain_context_mapping(struct
         break;
 
     case DEV_TYPE_PCI:
+        if ( !drhd )
+            return -ENODEV;
+
         if ( iommu_debug )
             printk(VTDPREFIX "%pd:PCI: map %pp\n",
                    domain, &PCI_SBDF3(seg, bus, devfn));
@@ -1651,17 +1653,12 @@ int domain_context_unmap_one(
 static int domain_context_unmap(struct domain *domain, u8 devfn,
                                 struct pci_dev *pdev)
 {
-    struct acpi_drhd_unit *drhd;
-    struct vtd_iommu *iommu;
+    const struct acpi_drhd_unit *drhd = acpi_find_matched_drhd_unit(pdev);
+    struct vtd_iommu *iommu = drhd ? drhd->iommu : NULL;
     int ret;
     u8 seg = pdev->seg, bus = pdev->bus, tmp_bus, tmp_devfn, secbus;
     int found = 0;
 
-    drhd = acpi_find_matched_drhd_unit(pdev);
-    if ( !drhd )
-        return -ENODEV;
-    iommu = drhd->iommu;
-
     switch ( pdev->type )
     {
     case DEV_TYPE_PCI_HOST_BRIDGE:
@@ -1676,6 +1673,9 @@ static int domain_context_unmap(struct d
         return 0;
 
     case DEV_TYPE_PCIe_ENDPOINT:
+        if ( !iommu )
+            return -ENODEV;
+
         if ( iommu_debug )
             printk(VTDPREFIX "%pd:PCIe: unmap %pp\n",
                    domain, &PCI_SBDF3(seg, bus, devfn));
@@ -1686,6 +1686,9 @@ static int domain_context_unmap(struct d
         break;
 
     case DEV_TYPE_PCI:
+        if ( !iommu )
+            return -ENODEV;
+
         if ( iommu_debug )
             printk(VTDPREFIX "%pd:PCI: unmap %pp\n",
                    domain, &PCI_SBDF3(seg, bus, devfn));


