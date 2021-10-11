Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 923B8428922
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 10:49:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205482.360790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZqzw-0006Lh-Fd; Mon, 11 Oct 2021 08:49:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205482.360790; Mon, 11 Oct 2021 08:49:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZqzw-0006J7-BH; Mon, 11 Oct 2021 08:49:28 +0000
Received: by outflank-mailman (input) for mailman id 205482;
 Mon, 11 Oct 2021 08:49:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mZqzu-0006Iv-QR
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 08:49:26 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36fbc9d1-8bc8-4235-98ca-399788137746;
 Mon, 11 Oct 2021 08:49:25 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2056.outbound.protection.outlook.com [104.47.5.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-MHBVtFnzPyWzDM7LWSOuFA-1; Mon, 11 Oct 2021 10:49:23 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6384.eurprd04.prod.outlook.com (2603:10a6:803:126::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Mon, 11 Oct
 2021 08:49:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 08:49:22 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR2P281CA0006.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.4 via Frontend Transport; Mon, 11 Oct 2021 08:49:22 +0000
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
X-Inumbo-ID: 36fbc9d1-8bc8-4235-98ca-399788137746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633942164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vNrRYdc+maNGDxk3iToGndB3rT0CzIV0Hu920Zv7nlI=;
	b=SEvb9/LeNHb8UaEbf9s/p/T/uF9zTT3drgC0zB2DJjWciTN/zgIRJJuL/4GoRpSQOZvdM2
	ouqxjFJyqFureigPQVxH0z5QbUT4VYv7i6VzojhwkZW/PXFaqzdbS01dUlM5y0bOHjvzoJ
	p/CPPOIr1QmvQEpLXHm4XhQXLgiMfCs=
X-MC-Unique: MHBVtFnzPyWzDM7LWSOuFA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=StFg5nrlBoxL+VC2GVLwzv+Z4bCtrdEJ1yOmx2JasMDbivfJKPOF+O9E7RkJbw1YDuht1pHNVO9lsn8vDsGCZIviVn73e6V/42gsyWaIleJksiawuG5Vshi0oQcACjDkLyFLFTtILDac7+Im2b/bQw83jE6AI2wGrnN63htB/YV35e1CkmCbdNkyrARJQZOOb1O8OkN8ELeqls7dDMwqteoHgucVD1jwDWdld7vDdFkmEfIxj5JayIvnL4JakIQCidbN9zwuAujgt0B6fJBXT9Cj0IvC6fkNPkotmS5nyYQScU914oeAKat5TlRArT1GmXP1opQ/bS0hnQZ9EV6tVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNrRYdc+maNGDxk3iToGndB3rT0CzIV0Hu920Zv7nlI=;
 b=C2vv5ejybbVyxsZ72Vmj3oh3UHKNdwivp7MTN68YDLwUeq3Xce9I9F5MFpYAhT6E/c3hpM1Oj20IoqDvp5KMcOJ41+KgEudq3vLBjwmiI7P9qZ8QwYFzdWJsNNC4sEWpwk54WghBgOG5LxxsJRxwcaC5imGj+I+bgnU3IwxTHpBDHRShDcm+QOxbv/lOpotAph7uSUetBChkn1kYEj0e3DgNqCi50PLfUe0A1SUug2lzRAVTr806FNEJPbR4e8Nbi2s14yWalzxx4mQ7NeHfumxo0oA0YqUyVPcpVv1AV/LTbPUzpflE9lXcFdZn883iFaqF2ULvHXVOQQVHzoQFHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 1/2] VT-d: generalize and correct "iommu=no-igfx" handling
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Ian Jackson <iwj@xenproject.org>
References: <ced41449-6aa2-3b20-77cd-78dafcad4bc7@suse.com>
Message-ID: <388b8562-e76f-e07c-a13d-f325bbc731c9@suse.com>
Date: Mon, 11 Oct 2021 10:49:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <ced41449-6aa2-3b20-77cd-78dafcad4bc7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69c5bf46-5c11-46de-1e72-08d98c940579
X-MS-TrafficTypeDiagnostic: VE1PR04MB6384:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6384FFCED7261207EDC187DFB3B59@VE1PR04MB6384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wck8LBDeyUZCB0/db1559QZWuv2+UYla01REYO0w3JSNvN8Rx/uyVh2VTiJsCkrBjQW/jcj7AYQoc5LU062uiLy7JAiQ2lLcSz7cfRwgQnONJSyrl07dibYi9yxVPuKXpK376rQug3MvKAiAUefb0Yl87HFWNLrm1QA1QZuLsjWmoXiSYLtO77SXA6I4HBWtrPfLNkAGMKpOYe7Od40s4oTS8YF6iEhPizHgz1R+p2uUhclyKGHupRZB9/ihG161JNiYbdaj9AJQw5VfJq9X+bCindiI6D6P636C33TRCrRqIgjRqXSBIYri75PT9/0u1oM9sxwvUTu1dVeZVG42AIq/SBov6XekYwpTh07PlHKOJNww8UeY5g6LZxGInRqeyhUCbxOOaOOx6gU2eitdPYpkEtgxikBo1Dg/HHDyKj9H6wh820KwwP8q/J96lauL3EVphFe8YNyyt1XMxa41u3Viz1hRA6VRjWXbjWQfJnJJo4/fOXq7r+NV6qWMoR+mKdSMUaw5u0UJ9olj83AoIifq1EfR67/QbY+WvQL3K3KvOOGS45TD+jZvgLKEhwgyiOl4iGTTOxbSRW2Ugz58zEwE3vpdUgUtkJhuvxXnLEntUD/UUIDVeluJK4ZLAQiVBbqbDFR4jYit03iftoXMO8BhDMy4jRxYXka/paqLxIqhdHpB28qbIiM1xvwDo7jK3tm7ZIlbBxG1bQgc7gP9GtEz8aX9M/aFMmR92uPmmIi1MFoCQ2tUySdm0unX0b0T
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(4326008)(31696002)(38100700002)(8936002)(31686004)(5660300002)(956004)(6916009)(36756003)(508600001)(2616005)(86362001)(83380400001)(66946007)(186003)(8676002)(26005)(316002)(54906003)(16576012)(6486002)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2FCNUtRbTNpU1p2THRJNTFCVnJUY3MrNUpVVVY2c2R6MGpiaWpiSytrRXBN?=
 =?utf-8?B?VHhhU3dWU29ML2N4aEFSSGpsL0NtLzR6NHhkRXc0ekhLdW1ZSFJkeUR0NDdr?=
 =?utf-8?B?UDNkWEtwb0ZRWVZJWE82dTZ0Tks2R3BIczNBRHJaYUwzdmplZFlBZWJBWVpp?=
 =?utf-8?B?Q3pPTmhVTUd0VG1uUnpMeTVSN2MyY3Z1QXExQWpucHZudytSWHpUZ1h6amRY?=
 =?utf-8?B?T0RqL3BuT01hYUMrQUpOR0dnd2ZaSkk5QlFtVENDOUtzdVd4SkNtZ3BxWkdO?=
 =?utf-8?B?UU9XWkhaaWlHbFg0RXRUaW85czBwN3V5MG1QNGUwRHJqeTFyZXJ6SnZMeU9Y?=
 =?utf-8?B?YkxTaVRiRGtEUkREejJtTHBqWWZ0VGxSc0FocnlmS2lhdi9qNHl6SUhac1U2?=
 =?utf-8?B?SVRzdDVPTWhYZnpiRTk1OUNFZkVYVitwOHhaQUt4VDNxZDgzbS9VNk1DZTlW?=
 =?utf-8?B?a1IxM2dJSEtqUjVjUXcyK0hpbng2WVRDZzIrR0FzOUtqWTYyWnAxNWR3UjJH?=
 =?utf-8?B?Y0QvTEtLVUFUaFp2Z1lZMDZ3akt0UlkzVGNqVldIekppRkNubnBUb25ENW5q?=
 =?utf-8?B?RFpsZ3FsWjRhbTFtRmRzY1RqTytTaGJPd1VLTitZVjZDWCtlWVE0bjFJbmww?=
 =?utf-8?B?UFpSNXNUSXVFeHRQNHMwNGxGM2VvNitrUTFYb2xRYysrVTNCTVBwNlRUQXBv?=
 =?utf-8?B?K1V3Sjd1cUlTKzN2V2pvNVNFV2c0ZmlZWjFXTm9TQ3VlQzNlUTlueWNmSko0?=
 =?utf-8?B?NzFkUEZrenUrVmQvdjZtejVMY1JpOUJKQmNyRVRhclo4b3gvQ091YkJiQ3lw?=
 =?utf-8?B?WTBCU0d0ZWNkTkY4eDVXSFpsR3o4T1dNWFlEWElZU1FXaTBTVVRTMGtDUDdV?=
 =?utf-8?B?ZGJrS0dpcjV3cHlpT1pTSmN3REI0Q0hIQUtXTk5jTTN0cExFVHd4TDA4WUtT?=
 =?utf-8?B?OFRLeEZnT3dkTDVWSXVRTmd4TWxxT2NSZU9KbFV3OC9ONml5bHdhdXI0UlFI?=
 =?utf-8?B?bHc4ZUlhblNRRXpNdVJSZDl6WHh5Wmd4Z3VPUlYvVVZZUndERkxybDBzMjFu?=
 =?utf-8?B?dFEwODFlNit5WjQzTzBEc0Y5SlhtOWIxanZ6NGhjT0ppb1VOTWlINnRCMFM2?=
 =?utf-8?B?dXdIRGVBd2ErNnE3a2NNOSt5S1FYUzRYdjduVysxVGxEbVZ3SmFOMXdmNDVP?=
 =?utf-8?B?UnRBZmMvZjNDUzc3TUN1S3BNYWdMUUZ5V0ZpUFdhNERiQXI3T3Mvc21Hb3lp?=
 =?utf-8?B?T2IzSng0NXFoSnE1SXNXUXNkSnRuNXNuNWVrYWhDYXdEbDBXaklYMXR3clhm?=
 =?utf-8?B?emd4QU9LS25LQUJzY01va0NXaXZJR2RmK3VzcHg4aURKZzRtSkVyOWRFQ3FX?=
 =?utf-8?B?a3NiZHBuQkh4QlR1cGg4S3lsRnQ4dlBXRmFEUE5YM1FjRG5zL0U4VWlKeHc5?=
 =?utf-8?B?dzRUbm83M3hEUWRHOG5aK1plR01zc0hPTHN6Q0JOcEx1UHU5VU0xZjNYMXox?=
 =?utf-8?B?aUdxTWpvQlljWWo0cHlqWGJ4anliTXFXYmhpQld4WUlCaWJVNTdXSlpVQ1Iw?=
 =?utf-8?B?VU93dUVnYUVVRW5jd0R5b041UjFCRWVUL0hKSGFPWktITGoyYW9GZmQ3SktZ?=
 =?utf-8?B?MHRXK09KQ3RnN2p3S29ySTZ3Q2o3bWdSMG1jTzlSSHJwYTNCNmhUc2lxTXhp?=
 =?utf-8?B?a3F0dHBMRlJaODByeWVUSzVkTHlxME00RFFuSjBlWkI1YmpFdkp4R1l1TXla?=
 =?utf-8?Q?PBcqpKYojQIeMiK74Ja4WwZ8uHEVFd4oa+S53mI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69c5bf46-5c11-46de-1e72-08d98c940579
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 08:49:22.5337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OiOKKVVvVaQd1KUinLC8er65/LAl5mMman9SA4HNkHm2p4N8BHw4iWytHaY9ADAgvJyiz77rS1Vlpr/uio8Ctg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6384

Linux'es supposedly equivalent "intel_iommu=igfx_off" deals with any
graphics devices (not just Intel ones) while at the same time limiting
the effect to IOMMUs covering only graphics devices. Keying the decision
to leave translation disabled for an IOMMU to merely a magic SBDF tuple
was wrong in the first place - systems may very well have non-graphics
devices at 0000:00:02.0 (ordinary root ports commonly live there, for
example). Any use of igd_drhd_address (and hence is_igd_drhd()) needs
further qualification.

Introduce a new "graphics only" field in struct acpi_drhd_unit and set
it according to device scope parsing outcome. Replace the bad use of
is_igd_drhd() in iommu_enable_translation() by use of this new field.

While adding the new field also convert the adjacent include_all one to
"bool".

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I assume an implication is that these devices then may not be passed
through to guests, yet I don't see us enforcing this anywhere.

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1494,8 +1494,8 @@ The following options are specific to In
     version 6 and greater as Registered-Based Invalidation isn't supported
     by them.
 
-*   The `igfx` boolean is active by default, and controls whether the IOMMU in
-    front of an Intel Graphics Device is enabled or not.
+*   The `igfx` boolean is active by default, and controls whether IOMMUs in
+    front of solely graphics devices get enabled or not.
 
     It is intended as a debugging mechanism for graphics issues, and to be
     similar to Linux's `intel_iommu=igfx_off` option.  If specifying `no-igfx`
--- a/xen/drivers/passthrough/vtd/dmar.c
+++ b/xen/drivers/passthrough/vtd/dmar.c
@@ -315,6 +315,7 @@ static int __init acpi_parse_dev_scope(
     struct acpi_drhd_unit *drhd = type == DMAR_TYPE ?
         container_of(scope, struct acpi_drhd_unit, scope) : NULL;
     int depth, cnt, didx = 0, ret;
+    bool gfx_only = false;
 
     if ( (cnt = scope_device_count(start, end)) < 0 )
         return cnt;
@@ -324,6 +325,8 @@ static int __init acpi_parse_dev_scope(
         scope->devices = xzalloc_array(u16, cnt);
         if ( !scope->devices )
             return -ENOMEM;
+
+        gfx_only = drhd && !drhd->include_all;
     }
     scope->devices_cnt = cnt;
 
@@ -354,6 +357,7 @@ static int __init acpi_parse_dev_scope(
                        acpi_scope->bus, sec_bus, sub_bus);
 
             dmar_scope_add_buses(scope, sec_bus, sub_bus);
+            gfx_only = false;
             break;
 
         case ACPI_DMAR_SCOPE_TYPE_HPET:
@@ -374,6 +378,8 @@ static int __init acpi_parse_dev_scope(
                 acpi_hpet_unit->dev = path->dev;
                 acpi_hpet_unit->func = path->fn;
                 list_add(&acpi_hpet_unit->list, &drhd->hpet_list);
+
+                gfx_only = false;
             }
 
             break;
@@ -388,6 +394,12 @@ static int __init acpi_parse_dev_scope(
                 if ( (seg == 0) && (bus == 0) && (path->dev == 2) &&
                      (path->fn == 0) )
                     igd_drhd_address = drhd->address;
+
+                if ( gfx_only &&
+                     pci_conf_read8(PCI_SBDF(seg, bus, path->dev, path->fn),
+                                    PCI_CLASS_DEVICE + 1) != 0x03
+                                    /* PCI_BASE_CLASS_DISPLAY */ )
+                    gfx_only = false;
             }
 
             break;
@@ -408,6 +420,8 @@ static int __init acpi_parse_dev_scope(
                 acpi_ioapic_unit->ioapic.bdf.dev = path->dev;
                 acpi_ioapic_unit->ioapic.bdf.func = path->fn;
                 list_add(&acpi_ioapic_unit->list, &drhd->ioapic_list);
+
+                gfx_only = false;
             }
 
             break;
@@ -417,11 +431,15 @@ static int __init acpi_parse_dev_scope(
                 printk(XENLOG_WARNING VTDPREFIX "Unknown scope type %#x\n",
                        acpi_scope->entry_type);
             start += acpi_scope->length;
+            gfx_only = false;
             continue;
         }
         scope->devices[didx++] = PCI_BDF(bus, path->dev, path->fn);
         start += acpi_scope->length;
-   }
+    }
+
+    if ( drhd && gfx_only )
+        drhd->gfx_only = true;
 
     ret = 0;
 
--- a/xen/drivers/passthrough/vtd/dmar.h
+++ b/xen/drivers/passthrough/vtd/dmar.h
@@ -62,7 +62,8 @@ struct acpi_drhd_unit {
     struct list_head list;
     u64    address;                     /* register base address of the unit */
     u16    segment;
-    u8     include_all:1;
+    bool   include_all:1;
+    bool   gfx_only:1;
     struct vtd_iommu *iommu;
     struct list_head ioapic_list;
     struct list_head hpet_list;
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -751,7 +751,7 @@ static void iommu_enable_translation(str
     unsigned long flags;
     struct vtd_iommu *iommu = drhd->iommu;
 
-    if ( is_igd_drhd(drhd) )
+    if ( drhd->gfx_only )
     {
         if ( !iommu_igfx )
         {


