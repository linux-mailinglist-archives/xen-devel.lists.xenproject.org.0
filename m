Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B622A3F830C
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 09:23:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172702.315147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ9jZ-00078C-5o; Thu, 26 Aug 2021 07:23:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172702.315147; Thu, 26 Aug 2021 07:23:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ9jZ-00076N-1P; Thu, 26 Aug 2021 07:23:33 +0000
Received: by outflank-mailman (input) for mailman id 172702;
 Thu, 26 Aug 2021 07:23:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJ9jX-00075k-F7
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 07:23:31 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f591d2b6-2369-4d41-99e1-f9b903433ea0;
 Thu, 26 Aug 2021 07:23:30 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-GGNzO-H_PK-fTiWSckZddw-1; Thu, 26 Aug 2021 09:23:28 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6671.eurprd04.prod.outlook.com (2603:10a6:803:11f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Thu, 26 Aug
 2021 07:23:27 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 07:23:27 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0072.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.10 via Frontend Transport; Thu, 26 Aug 2021 07:23:27 +0000
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
X-Inumbo-ID: f591d2b6-2369-4d41-99e1-f9b903433ea0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629962609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y3vU+XGm5rYzrY6LNyo51wrX3oOoFfQmjAZpGnDlC68=;
	b=H3i14XsPxzgrQcRyciZ4uEJVJ02tyCAK55Rdxc1v25j6qvEGoKM8OHM9F2PM5gGDNWoXgm
	4F8fFMysuYcElxYlnp9e6M5YUmgdjnFvJMsg6uBoe05HlGFYqSVEt8jfVBNqjEgMwD+8hc
	eMpl/DaWW5WSHu8cZaqEqhlfOHZaV5M=
X-MC-Unique: GGNzO-H_PK-fTiWSckZddw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I2bfmG3o22Yc6bhRvWJOR48oYNNXD41+O6tB1syPt45xH75X7heFU1uEzxl+6J/XQj6FOSgm53YT4d3Nta6ma8nYZ0gmqusLkVd00bWuWkwVGM3X0qanOkhKDKwfwLc3i96KLKjHcfSsFM5a59HhlM7v839sH2exIb6f7DNNVu5AJOwAzvxG/aeSLBS6BlXVO7qmBk+Mud8+X7LkeZ6RZ9f8AMO4V/0IfmwXlQlG26QEpl6tR64jV7MdUFbyYyGJJAxvC3eWMQgL7Smy9guhagsTTnI0z9Lzjith/uMLlHctHAmrXGcg6oecNWirE3UzqfYe3+l4bPX93WjztE306w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y3vU+XGm5rYzrY6LNyo51wrX3oOoFfQmjAZpGnDlC68=;
 b=VD6f3dmO3OufkTQCWiz2Yx907vzhdluD99490cAXM8gdFPr+2yC9NIByzsRkN+5f24s5HcXMsr+NEdbNhxfss4gtEv37iL850wL+sdPilL373vwNqsordYmouTRFa466oVeSOu7AePKhE2yn78hegffyphKD1EYPF+VUAv9MICoNQF+POsJ7WmqNCvO/P6MXj+fUtjWG7dBIA2rkDasH66PgqztePrGHV1lAEnU8AnryDOElnIaWAsYM8FutdIIOgIAPuJjv/D3QAfhcUh5umhCQ7saQu89nAg3RPZU99THK8uNoHnlZ+9xleAScU+JxugBURTivbW+bZW1Yvo/bGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v7 2/8] AMD/IOMMU: obtain IVHD type to use earlier
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <bf4b3be9-1274-9750-7340-08b29dcecfd3@suse.com>
Message-ID: <e4124802-d671-0e19-a062-f71b251cdfad@suse.com>
Date: Thu, 26 Aug 2021 09:23:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <bf4b3be9-1274-9750-7340-08b29dcecfd3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bfd0ae9-45ae-4b7a-0a07-08d9686265c1
X-MS-TrafficTypeDiagnostic: VE1PR04MB6671:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB66713C4A336E6E4BFB9C322AB3C79@VE1PR04MB6671.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tEC9DLGjVYQNelVhRpTG8V5slgGEVI49cb6sBBZOuEVVRAY62d48e6yg0jidEdi8OVM3B4qU/tir3JgXKTup8DGWiNpHsc1ZUpV74zIO+IrDjWtHhQe2d+RJBy5ukbUA/Ny0KrBi7jmlHI6oPQ/deHp/KVBGx+Qjs8CTJnGUqYLzVFzao7CICbF4jWZAauwwNhgnAfADGH4yV1wOj+KsRe/nJZTQTccx8IUmwp7CZCc7uqkzkVru5oHao1fJYeYSPUjb5xlYzvgVsSzoLdrRg1roAtSGXQyhlLnUO0GMNAxiofmGDMNtdFWzQ9xNGL9ksA3df5zxTS8HOEGn3L2GJ31+vSRUS68S0a5RpLAB+qsMFdGWpFVL8bxd5a1SiNQBivzXYivdNrCdL2r7O3Upb2GvU90lij4j1PrU5UffKrHJaAhrYpB1boMrNeJ/K4PdNo1Hp9k/4EGJVc/PL2656XJYV8AT6EL5f2MGZer40cFFGy8NXNHYUJsztYHD4kSHfQtMOzgdY3Y3vC8orjOZbK0tmVH7lQpzUzgBtYYgAsWEKhfcaPw+40kM4DS89AIlatPyCKqo6+X4WQTZyPVBz5xeqWasFaFI5e6KEl8bbtLq8RbjUmdim+BCMPYaW3Yx9CcWx5cBupKqYe0mbIW2WfuS40TPVfTrGjl+4RAR6zkPBLwBYLY8swgu0gXiPeksLZFDCqOG/b3h99/IJQzXbOTaAHh+4X8li8cxqylWbU4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(31686004)(38100700002)(2906002)(6916009)(86362001)(26005)(2616005)(186003)(956004)(31696002)(83380400001)(66476007)(6486002)(66946007)(498600001)(36756003)(8936002)(54906003)(5660300002)(66556008)(16576012)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0pUOWlyd1NVVU0weldZRjAzZjk4YllvNXBmZ0lYenR3MC9XVHhjTjdvZkFI?=
 =?utf-8?B?WkF3aTVDNFFpVWk2b25uemUyMk0vWitMeFRPVHJ6ZTFKUUdHMnZEM2F3V1ph?=
 =?utf-8?B?R0l0QlZxWnFrZTJHd2FQbC91YkIxWXEybGtkY05oeVhpQ2MyTzlVbnV1akVz?=
 =?utf-8?B?QXdTa1B3SllxOWFZc3hPdGttRzh6bm0yU2R1cHZ0bURjdHJyL295MStKUlhX?=
 =?utf-8?B?aFlURndGUmZwc0Vzc0VoZzRxS3BtRGp6M3NVZXRsWS9yOTRuMzVHNUJscnpL?=
 =?utf-8?B?OTFKaWVVQlhzYWlVd2ZVYW43RFAwSW9WODBPUTFjZ25tZDhLNjltd01DaDFO?=
 =?utf-8?B?WGFkK0YvVHhqQnEwL1E3Mkg5QTNkOTFqRTVJVCt2NDRLNU8wU1ZPRUJLUE9m?=
 =?utf-8?B?OUkwTGFQa0lleUUrem4wdERHSlF5SXFBMGZ6UXJVWDBmOUR0bGxISGpJQlJk?=
 =?utf-8?B?ZFBKSlV2VlVNdVNNTFpFenVtVnBNY2hJdlFCeVkrdVUwdnEyUk1WYko3dmVM?=
 =?utf-8?B?Y29ZejVOdlBjbDlBV2pHVFhRTGRCWFB1aVVkVzZ6UnlMMFl2dXZFaFh2VjMw?=
 =?utf-8?B?WnU3M0VoZHlsbkxscG9kUmZMaGgyalRiRlphMEhzUk1NZVZqUnBzcHp1eHBy?=
 =?utf-8?B?a1hlQ1RQVzJSVUhqTGFYbzZ6OUpYV2ZidTlDVHczV3RSejRqbm1odzZCS2Nl?=
 =?utf-8?B?R1RuQkZLa2xIdzlhOVBPa3JCNXRDZGl3K2tyazMvRnpPZzZMOWMvOVpQK2ZZ?=
 =?utf-8?B?UHB2c1loemE1SkROcEN4aDQ4L0lZMml6TG9qQXFFaXlpbHBYcDRBU29SaUhI?=
 =?utf-8?B?Mk9POW0rTU04Y0VyNUVRbk04OTlrb2s0ZDgvdlFJaVdwbVdZZHNVUkxYSzY0?=
 =?utf-8?B?TTFQU2pudUZRYkllbVJieS9yays1VHlROGFXUjl3WjgzSkUvN3hWd2N4SWI4?=
 =?utf-8?B?Mm81Z3hUdXFKcVVZeEl4ZGN2R1Q1Z0xKU003MzRZQzVySHYvcytmVjgvalpS?=
 =?utf-8?B?azY3ZU5kaEVtc3pHNXZGTzAvdzVJdThwdFc5NmlRUW1SMVVNUER4UXZNZ2lX?=
 =?utf-8?B?ZGFFckI5QU1WTXgxanRiMkI5N2IvOEZaTnpncnRTNGtYT3N0TURkNGNDOEJv?=
 =?utf-8?B?NFQ0d2ZpSXVJdEJXRHI3ZEJadGZJVkhHQnhLMVR4YmdHRTlvRnU4SVJud2lj?=
 =?utf-8?B?NlpnWnJRTHBxWmd0N3BsODkxMGRLeDJ2QlUvYmYxWDhRc0xOclRyYUYxbXVQ?=
 =?utf-8?B?MnJlQnNhRDFSOWJCYUU3TDRQRWF6TGNPVVU3WVMxemVURWdoaXFvdFhrUWpF?=
 =?utf-8?B?WVRpbWxoaVFlUGtNZmNBSURheXUydVFEL1d6bkgxZ0FRdFBIbFVSaUJVWTdv?=
 =?utf-8?B?TkMzTUU2YmtmMExLVXRuTllsSUw5cG4rVVczdG9MbGljbHF1ODlEVThuODJR?=
 =?utf-8?B?QUU5eEVDZFlwNnkvS2UxRnc0Rnp1S1lRd2czbjZHVTZKbzBYNGRjN2o5a0lJ?=
 =?utf-8?B?UHFlMnVZRGRRcTVWdnhrWDJxMWhQU2VhdHB6VmsvUUM3V0NJcVpDTmZBeThp?=
 =?utf-8?B?TEVad3hYSXduMWNyZGxKcXdQR3FteTNMYXE4amhyVTdaREFqY1Y1a0xUNk1Z?=
 =?utf-8?B?a0FuVmEzOGtDK291eGVRZUVvVEtLSytncm15RnFhWW1pRHVEdWd2MkdwNTEw?=
 =?utf-8?B?NUdHRlYvblZXbGh6RDJnUSs3MGJaN2F0b0l4OUU2ZmZWZW9VZGRRUU9ZWWNv?=
 =?utf-8?Q?CeJLkBhYeRsPuJS+73/CgUjXY6l5/1VHOtvXYYP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bfd0ae9-45ae-4b7a-0a07-08d9686265c1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 07:23:27.3878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ur4PqRfGPCGwQJxL1ACJCnGKrcWg1Y3leIpxBwDtAapL6EHzEIiCjwCBUcghqp6ups6q5w6S6EATwlOqk9MpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6671

Doing this in amd_iommu_prepare() is too late for it, in particular, to
be used in amd_iommu_detect_one_acpi(), as a subsequent change will want
to do. Moving it immediately ahead of amd_iommu_detect_acpi() is
(luckily) pretty simple, (pretty importantly) without breaking
amd_iommu_prepare()'s logic to prevent multiple processing.

This involves moving table checksumming, as
amd_iommu_get_supported_ivhd_type() ->  get_supported_ivhd_type() will
now be invoked before amd_iommu_detect_acpi()  -> detect_iommu_acpi(). In
the course of dojng so stop open-coding acpi_tb_checksum(), seeing that
we have other uses of this originally ACPI-private function elsewhere in
the tree.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v7: Move table checksumming.
v5: New.

--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -22,6 +22,8 @@
 
 #include <asm/io_apic.h>
 
+#include <acpi/actables.h>
+
 #include "iommu.h"
 
 /* Some helper structures, particularly to deal with ranges. */
@@ -1150,20 +1152,7 @@ static int __init parse_ivrs_table(struc
 static int __init detect_iommu_acpi(struct acpi_table_header *table)
 {
     const struct acpi_ivrs_header *ivrs_block;
-    unsigned long i;
     unsigned long length = sizeof(struct acpi_table_ivrs);
-    u8 checksum, *raw_table;
-
-    /* validate checksum: sum of entire table == 0 */
-    checksum = 0;
-    raw_table = (u8 *)table;
-    for ( i = 0; i < table->length; i++ )
-        checksum += raw_table[i];
-    if ( checksum )
-    {
-        AMD_IOMMU_DEBUG("IVRS Error: Invalid Checksum %#x\n", checksum);
-        return -ENODEV;
-    }
 
     while ( table->length > (length + sizeof(*ivrs_block)) )
     {
@@ -1300,6 +1289,15 @@ get_supported_ivhd_type(struct acpi_tabl
 {
     size_t length = sizeof(struct acpi_table_ivrs);
     const struct acpi_ivrs_header *ivrs_block, *blk = NULL;
+    uint8_t checksum;
+
+    /* Validate checksum: Sum of entire table == 0. */
+    checksum = acpi_tb_checksum(ACPI_CAST_PTR(uint8_t, table), table->length);
+    if ( checksum )
+    {
+        AMD_IOMMU_DEBUG("IVRS Error: Invalid Checksum %#x\n", checksum);
+        return -ENODEV;
+    }
 
     while ( table->length > (length + sizeof(*ivrs_block)) )
     {
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -1398,15 +1398,9 @@ int __init amd_iommu_prepare(bool xt)
         goto error_out;
 
     /* Have we been here before? */
-    if ( ivhd_type )
+    if ( ivrs_bdf_entries )
         return 0;
 
-    rc = amd_iommu_get_supported_ivhd_type();
-    if ( rc < 0 )
-        goto error_out;
-    BUG_ON(!rc);
-    ivhd_type = rc;
-
     rc = amd_iommu_get_ivrs_dev_entries();
     if ( !rc )
         rc = -ENODEV;
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -179,9 +179,17 @@ static int __must_check amd_iommu_setup_
 
 int __init acpi_ivrs_init(void)
 {
+    int rc;
+
     if ( !iommu_enable && !iommu_intremap )
         return 0;
 
+    rc = amd_iommu_get_supported_ivhd_type();
+    if ( rc < 0 )
+        return rc;
+    BUG_ON(!rc);
+    ivhd_type = rc;
+
     if ( (amd_iommu_detect_acpi() !=0) || (iommu_found() == 0) )
     {
         iommu_intremap = iommu_intremap_off;


