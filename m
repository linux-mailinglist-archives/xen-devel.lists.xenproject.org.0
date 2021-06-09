Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8940D3A0FD6
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 11:53:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139077.257279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lquV4-0008TI-P3; Wed, 09 Jun 2021 09:27:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139077.257279; Wed, 09 Jun 2021 09:27:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lquV4-0008Qz-Kf; Wed, 09 Jun 2021 09:27:50 +0000
Received: by outflank-mailman (input) for mailman id 139077;
 Wed, 09 Jun 2021 09:27:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jMcQ=LD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lquV2-0008Qk-R8
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 09:27:48 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0ed03d5e-0a3e-4932-a0df-f274291f086d;
 Wed, 09 Jun 2021 09:27:47 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2054.outbound.protection.outlook.com [104.47.8.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-UvvotrcLPiOp8iylrO5OhA-1; Wed, 09 Jun 2021 11:27:46 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Wed, 9 Jun
 2021 09:27:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Wed, 9 Jun 2021
 09:27:44 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR2P281CA0020.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.12 via Frontend Transport; Wed, 9 Jun 2021 09:27:43 +0000
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
X-Inumbo-ID: 0ed03d5e-0a3e-4932-a0df-f274291f086d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623230866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cqeP7V5sPiTn4G53r8FVAMkSkYXDA8o5CuxWXa7EIrQ=;
	b=RR/SPGgQAgt9XF9L9Nzv86jY0gf4LA4HAgW3gerrcO4AQYp4AmnSyqWxWfjwxaiMG6XPXf
	Y3zfgVV/ZyRXvGWH1s4/yXEyspVyxB3eOxQwvy0/n8Zhz0HEOeSlNpGs+F4PAZhDlwv3m8
	Sx4XptOqQhLmSVSEIaOsGpvOrlmMb1U=
X-MC-Unique: UvvotrcLPiOp8iylrO5OhA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWypa+c5uJfrbEJo1oDv3A8Wa1SR9fY39yXsZJH5OSpK4c4tzHZDBE46GM++M7wi7k1RM+PkYfNPt+QC9bRdWJMxDSDu1pZJLfWGbduNtRwK3wSG+IT2hYJ2QDWNJA3wXMg0vRrO+zPAtWhKHIWxwNq+D+mi7eVOx33gCsK1fo40MdDijww2s1j+F/pWhvLa/ek9DeNp+JqVKQk0MB+AU2X7nuDQPRqmZicuSFX/BBsUt35nmR85EdPSPUMZ8u0EljPlKoAYJHJBNpmMFXeHFO3kRx2L0Ku7yBLHP13kF+gwzWnil9K7ER6fIuCGwFCAgDHvd49B1/Mvhjx1ojVVFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqeP7V5sPiTn4G53r8FVAMkSkYXDA8o5CuxWXa7EIrQ=;
 b=k8Xl99bUmPu/vkXV+Bk4dNWRVUDvDOzzdujYM2IUFG6FYtuFGt/KZLbrnsW61Mtr/2YnfJfFJp9DBE624DW1BJTAm1Fi2TNieVC4Q+Y95/VWeWGs4jh/o+wH4D/6xHKejE6d8sxIT+yCPUDaVCZvYe3Dr5Xu76Yz/2TeXYctdp6sB6Tn7umm1ymLpvd0p9GSaVahzbXhEFNmI6OShm9Ka3cUrQQcPT08fdYVk1/+BSzasSQKzlTgC4+rI67so3+wNg7GKFKAoNCsmFE5OTgghQXnqVcL+g7xZuqLIsQFPzKxZCOnjmawCkRD+zvhvpk3lRwunRTu/UcZHOBErkPu5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 3/9] VT-d: undo device mappings upon error
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
Message-ID: <d6370703-97e3-2571-5ae3-8a5ec11e9bcd@suse.com>
Date: Wed, 9 Jun 2021 11:27:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR2P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7def0a65-ef3d-431d-f3a4-08d92b28d62e
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB233501EEEB5CD2E8BB2069DBB3369@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XMMBxkHU0TM1Z32AdotnvmPfTWnx3j0UbFg4j/DH0WCeQ5XLECKwVsZy5tWe566s2cExxMfUjBEdvanbBpLQsGhUnT7o3P4r6r6uK0EY444k428uj/wSBoWt/gqqwPzrsql8Dlf7okKZfmxPdbrzl5FsqJQ0gVYtWRGllalSiwrgn2N6O/0t8CcGso/8wrdd+OWcbkVoxb+yv5toi1Pfpku22ApBWhaK3q5ujdSScvyyOuqDqKy3V5P9cOtiiXcWLhrszUt6UkNXmnx4lFtYLYf1v7BkWLaRyd3ifOeqNreV9avVkbqfqFgBy33rif+Q/pCb+Ygldm+eg5RWATK9XtApa5MHn8XO5g/ZIn9c5s8ebbJagqiuPIZAIMaJVoe04QXFF3lkaTILvbocj7sCyfP/Ozeaf02kjHJKbrn3n6spZaxgyvwKsqbf5L3bwyDM3kHxVXSxFFWWlEV2xXWk6ACbTTnUEfeyNpG+XLTU3UT4W3zQlWdOc/X0/sfD/mPCfVgXsM0KCrmGiv5Uxwnpg+r7W5HZjTxgWS8ZFV7MpfScj/pfFXJJQ3atyDQPSiEPI94OFlvTLxzk3+l9lemyjNHHL/2dwfpxW3tc5HUY3HxbU3PrPij2ogTKDPJYCjRlTipVBTjXykWtkbIxXrLlSkeuA28kQTQoq4USF+ylSqRTWMgHG2BerMAZeZlpEo+9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(376002)(346002)(136003)(39860400002)(6486002)(6916009)(83380400001)(31686004)(478600001)(956004)(2616005)(36756003)(2906002)(8676002)(4326008)(66946007)(8936002)(66476007)(5660300002)(38100700002)(66556008)(86362001)(16576012)(26005)(316002)(16526019)(31696002)(6666004)(186003)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?ZWNTdS9vKy80WkhnVGtrellsc0QvVTEvRTJuQTlxSjdFQ3RMc2VKbHlKZThY?=
 =?utf-8?B?ZTRMZkZQUFRseElldnBqajFMajZNS0VIN20wVXRDTit5UnFKbFYzOXIxamp3?=
 =?utf-8?B?SisxMVptOHlETWViN21ibkl5T1RaMWhDM0x3YTFBRTh6QmlFZzdpMWtFc0dZ?=
 =?utf-8?B?VU16Y3NrMGFPTzVJUmFsd3B6Y3JXSTlheWYxUTZQZFUxa2owa09QYmU4dmhG?=
 =?utf-8?B?am5RcnhiV2hINGxiZmloQkt3RU81a1k1SlcxWUdSbS84N3dSZ0dtVUtZaHd5?=
 =?utf-8?B?a1NwKzNCQTgxQUpBOHEva2UvclBJUjdnRjJSb1Q0TU90bEROYXVwUUVJbmtG?=
 =?utf-8?B?UllxZjNmNHIxL3BmaFJObUpKbUZ5bndEZFBUaUJ2VUZkZEdKUTBZN1VPUXdj?=
 =?utf-8?B?akxHclFtU3hRR0pqNjlGcElvSzVwbWx3dnkra2lwcTVlUUdidm42cS84TTh6?=
 =?utf-8?B?V2U1eTZuOTQxdjdpMXg4OTNlMUZPSWx3THlmZzhQakVlOGhHMTFaNzUreEcz?=
 =?utf-8?B?QjU2ZXFrYlBTbHRoem1uSHhxS1Z1K2t6dmg0eldyZHd1bkMya09sSVNUWXdq?=
 =?utf-8?B?Tkt1SUowT2VjVGJ0WEZvWDhTd3RTc1RXbEFNaS84a2VWQU9ydkNJL1NTalRL?=
 =?utf-8?B?N1doZlQwVkpYR1QzL211Mk94allzSVYzMC9nR0RxalF6SDhOWWRSY3c1V243?=
 =?utf-8?B?U3M0T2RwUWpnamlwbjJMQmNSTWt3ZDF2aXhWSVdYRDVRVVMxT2hkMEtVRzFx?=
 =?utf-8?B?L2lTUkVINnRlMkR4WnYrYkh0RkhBSFZFVjF1QmtSV3BFWjZnWnhodjg1ZVhC?=
 =?utf-8?B?T1JZNmtoQjBJTFkvVUJQQlBJNmovbXFySlRIRCtoMWdVVVlMVzBjQ0t6dElR?=
 =?utf-8?B?QlFNNDdEb3dxS0NYRFZvT1lja09LeWJweHdKVlJtS0psbVZOK1BqQTVpUDAw?=
 =?utf-8?B?YnY2bGhnSjhYbWZmSTg2TUZWSWhDcE41eTljRUdSZjlWbURyVTI2R21SUXYr?=
 =?utf-8?B?UlZTVU5jOHo1bUVDaTRzdmEwQW56NDFkeHZjTFRiUE1yUzFYSTMva0hrcEQy?=
 =?utf-8?B?SjA3WUJvNVFoVjZqYkpzd2JHRmdOdTFDeWRIMllINmdDeVV3dlpLcVpKaldB?=
 =?utf-8?B?dWI4UEMrWER4VnE5aEFHQzR1ZGwzVERkZEYwU2tpOGdSMFhDdk5tYkUwRVBm?=
 =?utf-8?B?emtOclM0NkJtdUVaZGJwZXR4SUZJVEMzTzNuVExlRS9ZVjdzRm55Q2wvU1Ny?=
 =?utf-8?B?MmV6cHUrbFp1Y0xtY0hxTFIzcldJcmhVMm1kOEhUTnhQZkpyN0daQmpCQS9W?=
 =?utf-8?B?UjdpUGFqQ0g4cDFNdktJamV2aVphZ1R5VnY5dVNxdnp1dmYrRmp4Mmc2ZUZo?=
 =?utf-8?B?SFlwT2Z6UmdFR0Ixek15UG9CblZiclBYZW1YdEJTRTlsNXFLczRzRFFEY1BB?=
 =?utf-8?B?SmFVZjNtcnM2MXhrdThaejRCNmhtcUVFdnVYKzNnV0d3NGtZQVlseWdlWURU?=
 =?utf-8?B?MFNueVRpM0Y0dTJONHkyb05WL2l1bHRDRldUaVVqWUp0MzNudWVOUnVyZUV5?=
 =?utf-8?B?Nlpwd3VWZ3dBU01aVHVQUEhRV3NndUxnSTRyS1hqY3ZaQXlUUGhMVWllU3lm?=
 =?utf-8?B?cFIvcitwYUFsOFVtbUsxMWtic0VEZUVOMmpuQkhxWlJvcjllK01rdExtRlg4?=
 =?utf-8?B?U0wyZzBGMHRTSDZIUmpkQmpoYVNuNndFQXBKL0hEVTJWeWNtb29TSjVXQXEx?=
 =?utf-8?Q?gjSUI4QHic7u/72TaGWjhJOlDeNCGtxMYYZflsZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7def0a65-ef3d-431d-f3a4-08d92b28d62e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 09:27:44.2932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VNGgCepyb4rKoLMW5iFXijfValxv5Rc+vICQGkbgtt3zgY1GBh1mE28q8ITQ6IpxkNwJSH0PUXuiXqd5dbxhGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

When
 - flushes (supposedly not possible anymore after XSA-373),
 - secondary mappings for legacy PCI devices behind bridges,
 - secondary mappings for chipset quirks, or
 - find_upstream_bridge() invocations
fail, the successfully established device mappings should not be left
around.

Further, when (parts of) unmapping fail, simply returning an error is
typically not enough. Crash the domain instead in such cases, arranging
for domain cleanup to continue in a best effort manner despite such
failures.

Finally make domain_context_unmap()'s error behavior consistent in the
legacy PCI device case: Don't bail from the function in one special
case, but always just exit the switch statement.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Paul Durrant <paul@xen.org>

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1442,9 +1442,15 @@ int domain_context_mapping_one(
     if ( !seg && !rc )
         rc = me_wifi_quirk(domain, bus, devfn, MAP_ME_PHANTOM_FUNC);
 
+    if ( rc )
+        domain_context_unmap_one(domain, iommu, bus, devfn);
+
     return rc;
 }
 
+static int domain_context_unmap(struct domain *d, uint8_t devfn,
+                                struct pci_dev *pdev);
+
 static int domain_context_mapping(struct domain *domain, u8 devfn,
                                   struct pci_dev *pdev)
 {
@@ -1505,16 +1511,21 @@ static int domain_context_mapping(struct
         if ( ret )
             break;
 
-        if ( find_upstream_bridge(seg, &bus, &devfn, &secbus) < 1 )
-            break;
+        if ( (ret = find_upstream_bridge(seg, &bus, &devfn, &secbus)) < 1 )
+        {
+            if ( !ret )
+                break;
+            ret = -ENXIO;
+        }
 
         /*
          * Mapping a bridge should, if anything, pass the struct pci_dev of
          * that bridge. Since bridges don't normally get assigned to guests,
          * their owner would be the wrong one. Pass NULL instead.
          */
-        ret = domain_context_mapping_one(domain, drhd->iommu, bus, devfn,
-                                         NULL);
+        if ( ret >= 0 )
+            ret = domain_context_mapping_one(domain, drhd->iommu, bus, devfn,
+                                             NULL);
 
         /*
          * Devices behind PCIe-to-PCI/PCIx bridge may generate different
@@ -1531,6 +1542,9 @@ static int domain_context_mapping(struct
             ret = domain_context_mapping_one(domain, drhd->iommu, secbus, 0,
                                              NULL);
 
+        if ( ret )
+            domain_context_unmap(domain, devfn, pdev);
+
         break;
 
     default:
@@ -1609,6 +1623,19 @@ int domain_context_unmap_one(
     if ( !iommu->drhd->segment && !rc )
         rc = me_wifi_quirk(domain, bus, devfn, UNMAP_ME_PHANTOM_FUNC);
 
+    if ( rc && !is_hardware_domain(domain) && domain != dom_io )
+    {
+        if ( domain->is_dying )
+        {
+            printk(XENLOG_ERR "%pd: error %d unmapping %04x:%02x:%02x.%u\n",
+                   domain, rc, iommu->drhd->segment, bus,
+                   PCI_SLOT(devfn), PCI_FUNC(devfn));
+            rc = 0; /* Make upper layers continue in a best effort manner. */
+        }
+        else
+            domain_crash(domain);
+    }
+
     return rc;
 }
 
@@ -1661,17 +1688,29 @@ static int domain_context_unmap(struct d
 
         tmp_bus = bus;
         tmp_devfn = devfn;
-        if ( find_upstream_bridge(seg, &tmp_bus, &tmp_devfn, &secbus) < 1 )
+        if ( (ret = find_upstream_bridge(seg, &tmp_bus, &tmp_devfn,
+                                         &secbus)) < 1 )
+        {
+            if ( ret )
+            {
+                ret = -ENXIO;
+                if ( !domain->is_dying &&
+                     !is_hardware_domain(domain) && domain != dom_io )
+                {
+                    domain_crash(domain);
+                    /* Make upper layers continue in a best effort manner. */
+                    ret = 0;
+                }
+            }
             break;
+        }
 
         /* PCIe to PCI/PCIx bridge */
         if ( pdev_type(seg, tmp_bus, tmp_devfn) == DEV_TYPE_PCIe2PCI_BRIDGE )
         {
             ret = domain_context_unmap_one(domain, iommu, tmp_bus, tmp_devfn);
-            if ( ret )
-                return ret;
-
-            ret = domain_context_unmap_one(domain, iommu, secbus, 0);
+            if ( !ret )
+                ret = domain_context_unmap_one(domain, iommu, secbus, 0);
         }
         else /* Legacy PCI bridge */
             ret = domain_context_unmap_one(domain, iommu, tmp_bus, tmp_devfn);


