Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CEA412F39
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 09:18:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191421.341440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSa2e-00051O-LP; Tue, 21 Sep 2021 07:18:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191421.341440; Tue, 21 Sep 2021 07:18:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSa2e-0004yl-He; Tue, 21 Sep 2021 07:18:12 +0000
Received: by outflank-mailman (input) for mailman id 191421;
 Tue, 21 Sep 2021 07:18:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n1Hg=OL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSa2c-0004y8-Fl
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 07:18:10 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7599eb2-73d9-48c5-b499-691ebcd457a6;
 Tue, 21 Sep 2021 07:18:09 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-_46qPZCjNa6EFG6pHLvE1w-1; Tue, 21 Sep 2021 09:18:07 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3293.eurprd04.prod.outlook.com (2603:10a6:802:11::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Tue, 21 Sep
 2021 07:18:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 07:18:06 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0P190CA0029.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16 via Frontend Transport; Tue, 21 Sep 2021 07:18:06 +0000
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
X-Inumbo-ID: c7599eb2-73d9-48c5-b499-691ebcd457a6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632208688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=52koP07e3NaHR5tP62Xc53aym67B0vZJLqdc3ZgaWY8=;
	b=RPd46UMZtmtMZ4jckRbW6fZf6vxV68eutVjz09cPyOPaZse1TdVVafVjfWQyPhL+Xm6hbT
	+YL3zAqUKp6mXkXXKiWtgrl1nSo/8fVuWXkAVdUQ61IuoSHo+85p7IagztGFVS7tUeaBSc
	PptyrfMpu2CDMETLS5LVtFXbXPkN58c=
X-MC-Unique: _46qPZCjNa6EFG6pHLvE1w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UbRThvdDBVayNVbt2MvjeYXE6UYWlef5lu8TZc1+dNew7bOh1UkT8SSjkVbYlK9XlCrkVYE5BofDBUxzA8pnvxRk/SYBvE3QOg4OF46ADy7IVv+Tx4eiZ0xG7HCRUpJ6om0xooIshtMNNJJZUNOZ22B46loPw93laOfb0PgV+t9Rf8nUFL1WCmnR8U7iamDw6mHdaIEOchD9hbLoYVBODhBo3nHalJiuUx0ow2GAfC3uCJTxD5EBJN/4gnL2AfEniJ/f88w58qi9TyWKY1BPZpfPJKf/JUY7C+3eEtvxbsmAQqQrSGYW7hzBJLHGqhZwVCq4CR11/Y/g/5O5G1X9eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=52koP07e3NaHR5tP62Xc53aym67B0vZJLqdc3ZgaWY8=;
 b=RvAM4xaN7snbVlZnp8LCn9br8VBxGwnzEGaZkyLLQsNqHk3lutxVSK1Jpif64ApGcsO0dfuqiZnsNtXseOmTlOocgo+2CZKAjq3bwBT1j8gUsmOHA7q127kD0vXWvtmem7GFDql3Sputr4XYts2ijciGyv2wDRGPGquHV22388Htsl3uaa13qHtXl2rzvFj+tkI52J1Ed26fnpVvLVy6jBNUbcpMHJBxd7xMqzUFCJHSnKFS7DmDBA9SDXfndqVJaz3NAboJlVdDLC3mU9cUcysaMS76ohEV83Ppp8/uJ75MHxJnVLnss5WMzy3cHxCelb9C9vDircJawsNQsnZXRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v3 4/9] x86/PVH: provide VGA console info to Dom0
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
Message-ID: <215e2ea4-cb49-7d94-7f97-c6b81e522a60@suse.com>
Date: Tue, 21 Sep 2021 09:18:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0P190CA0029.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::39) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc55bae7-f929-421c-52d3-08d97ccff532
X-MS-TrafficTypeDiagnostic: VI1PR04MB3293:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3293CBC749A535D7D6406A17B3A19@VI1PR04MB3293.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	82q5LXkChGB0DZawfOcqS7gbPxNFrD2ouq7+J/Xv+MiqcYUBMpOABgLxl+WQSGwHwG+n38WVrtiQOxG8lAdycMO96kpjbbSgCQufz0b+9DjFfe5vMF7VjMytFse22FTHzgdD++zNVRTcNlziIxuxS04LCVfdDIzmA4shboTvBAinlktxNY+45iqxuRlmLGdbZhcCOxMdWmgigH/pPm+5T8cJ6O9xJ0hVnRqprle2BQpilqFpj7jFkPank3GW/U7qPdBYy0+iLflLCTfweV6id05CI29VB5tB9jSyPMBEKiFXF0Wygbml5dlBlRyASR8ZdEV6UMlNQZb+LMBMtnd/Ha4oGbxl3s86CGIRFdeNfsIa3repJ8cQ0vTqyIHpJSJMaX49cl9MrsaTv9gnHixD+JNyprT3iFSMBpJhBVIRu0GHi72BPPWF8fnZrT4HAHEd78wILyCqZ+trDkbo+rE3RFoG74iVkbPFoDafep8d5ED3mEd0i0Tun8bcjF4II4BvkHZ0EUmv19vNfE4IYtY1D26abXH4Lx7HaINLxRUkUke6c5bcWfgNEtpWlpFXqZ4TEjYQgVk6qMU5gnCjnxDEdjve1RdaZork2zUd4pxzvN8QmBAF9BOsRW5EI4mYC2FZ63wdX0J22bJSwYZPJ2JsQTX48cpx/uuSH/XrA/akz6rxCi15l6lnMqThQ9ZaVs5WpJyK4pXsmUn2URRdT4k70mvoF6r8iybUjPnV/Je1VOq8sCo8RXOxlU3z1TvJpXCO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(316002)(83380400001)(31696002)(8936002)(956004)(36756003)(2906002)(86362001)(54906003)(31686004)(6486002)(508600001)(66946007)(2616005)(26005)(4326008)(38100700002)(8676002)(66556008)(66476007)(186003)(6916009)(5660300002)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVVuUExkQmMyNFdoR1JJNTVxcDY3YnE0UDllOEtQVzE3WDQ1U0lkSWNFWDkw?=
 =?utf-8?B?OVZ2Y3U4VmdqditiMlluNm9tZXdOdkZNTjRkSkc5TGlVMlNXSGNJaVh4TWhk?=
 =?utf-8?B?dVV3TDEwTE9lZTVhWmxGVEFmVXkzYVdhYTNqVnhoNkN0eEJyYndNQnZKZ0Js?=
 =?utf-8?B?a3c5Q1Fvc1kzaWFWQ1BlRzFyaUgxSXU4L2FRSDBQL3BLL3FmTUw2alQxWWF3?=
 =?utf-8?B?S0kvSkZOZmpuaU5CSjM3KzlBMkNxeTY4RjF1d3F1cTVVS3JuTDhDMTR5b1Rk?=
 =?utf-8?B?djJObjh4T0liZ2FCZkhtNkZhVEUzYjNqckU0OW10elB2U0ZnOW4wck80eFZv?=
 =?utf-8?B?MVArUWdVMWVrU1RsK0I1cHdsZWhaU0I2L1NINVhobHJaWFZYMlNVenZuUjh3?=
 =?utf-8?B?ZmdEa3E3NDRMMEtVeGxmcll2K3JGVFVxNm1FV3dLbHhLb3duc3VIQVQzT1hJ?=
 =?utf-8?B?K2VqbnhoeVFaVE9Ybk5uZmVCemgrdEs0Mmk1VDJHdGhFUlV0Z0VVZnZWL2hK?=
 =?utf-8?B?eUpqNjMvOXdDY21oRkhRL2dkeE5nU3U2OGFJNW9vdDAxSXo3cC84ZXRlYVJx?=
 =?utf-8?B?UmJCS1pJR3JpVjFIZnhRVlNOb3REWnErR2J0MlpWcjNDTnc5RGZwVC95YWp5?=
 =?utf-8?B?MENFNzlTK3ZQZlp3M2gxTjRoRnk5ZkVOUG92MldyTEhYL1ZPOFJVSkFISk1K?=
 =?utf-8?B?MWdYcElMa3FScTdrTWhacUdBWm9VRGE1NHUzeDBzODc5ZEo2WkRNSElQNWNu?=
 =?utf-8?B?NG1NTGt4b0N5T3JmM3J0RVA4Rm1PNG5ESCtUS1A5TmtJZXA4b05MaU01TDR3?=
 =?utf-8?B?VnYrOWZyT3ZWVExKMk9hejFPWUJoNlBJajFXeEVHcVJRVmYrVDhKQm1xWlRz?=
 =?utf-8?B?SnBWb2VsU2g5YThRL0R2bFM4bTBDQzcwbVMzZmR4ZFJQMVFpMkhqQk8xL3Qr?=
 =?utf-8?B?R05PQXI0R3cyY1Vaa1FzbmhQSjZJT2kxWWlFRFVFLzVBb2luRFB1NEEyU1ZO?=
 =?utf-8?B?aldFSHRXZHVyOVI2ak5HRW80aXg5L2NHeVIvRk8yd25vSnAyK1JFYmxBWWwr?=
 =?utf-8?B?N3lZS256YU9FK3Y1VzZpdnk1ZGphQmhGS2pZTlAyQ3V6RmpmQngrWXh3MkVT?=
 =?utf-8?B?Vkl5aHV1ZzlySTQzTmZNdTVhK1IwUGgwdTBFYmNDN001MUF5Mm1HVCttcFRN?=
 =?utf-8?B?RzRJbS92ZlZKS1lSRS9nLzZMbWRiNlcxc0l6TmJCbTUwVnRNb1V5Tkl2OUth?=
 =?utf-8?B?MkpmT2xLeW05dk9EQ285YSsweGl1NGFrZG85UmZjbHh4dVRhNTR6K05ZKzJC?=
 =?utf-8?B?Ym9ZMEFOVnZPbDNsRHBVUHcyWG5LU0tWYlJVU0Z3dG0vTlpuMTZWZ0NhMkZo?=
 =?utf-8?B?K2FtdXE2NEcwQmk0RDJGUzVaVGRJMGZ1Rlk0YUdaRDhSdnQwaVdyWm1BUkNa?=
 =?utf-8?B?SjgyWGdZRmozcnI0Uy93TU9sTnc5OXY3ZkVtd05ZSkdCdEZMY1BnWlptVHM2?=
 =?utf-8?B?WEluTWt0TG4ycFJZZDdhY2tOV1g2blk1ZG1sUEp3TGZmUUJjWXdnandIQ1hF?=
 =?utf-8?B?MHdxSXpEbURyR1BzdWsreThLT1kyc3pZMmUvVmZIV2VWWU1haUVTdGpMTHFr?=
 =?utf-8?B?bEJQMWR5Vlp4b3V6N3ROTkdLZ2s1VDFLZkY5R3V5b3hPZHpCTFNaT0t3Yjdr?=
 =?utf-8?B?aWtyL2R4empwWjFQa2ZLMVFIUjFZcDErZVBPR1dkdlkySk9YUkxMcFVvdE8x?=
 =?utf-8?Q?ZyFouIQ+G7Y0BCKrvZGbRu65TloD5Xl9Qom198M?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc55bae7-f929-421c-52d3-08d97ccff532
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 07:18:06.4805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Obme7KzxnDdnISlUP0hQRyt6iuxFFL+Ica5tJ9PqiaE9bpD5/ev5GvEcGKpJaXf74BYAuVrH/66574w6xM3WDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3293

Like PV Dom0 in order to use the console if in a mode other than text
80x25 the kernel needs to be provided information about this mode. Bump
HVM start info's "current" version to 2 and use a previously reserved
32-bit field to provide struct dom0_vga_console_info's position and
size.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.

--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -19,6 +19,7 @@
  */
 
 #include <xen/acpi.h>
+#include <xen/console.h>
 #include <xen/init.h>
 #include <xen/libelf.h>
 #include <xen/multiboot.h>
@@ -549,6 +550,11 @@ static int __init pvh_load_kernel(struct
     paddr_t last_addr;
     struct hvm_start_info start_info = { 0 };
     struct hvm_modlist_entry mod = { 0 };
+#ifdef CONFIG_VIDEO
+    struct dom0_vga_console_info vga_info = { 0 };
+#else
+    struct {} __maybe_unused vga_info;
+#endif
     struct vcpu *v = d->vcpu[0];
     int rc;
 
@@ -598,7 +604,7 @@ static int __init pvh_load_kernel(struct
      * split into smaller allocations, done as a single region in order to
      * simplify it.
      */
-    last_addr = find_memory(d, &elf, sizeof(start_info) +
+    last_addr = find_memory(d, &elf, sizeof(start_info) + sizeof(vga_info) +
                             (initrd ? ROUNDUP(initrd->mod_end, PAGE_SIZE) +
                                       sizeof(mod)
                                     : 0) +
@@ -672,6 +678,22 @@ static int __init pvh_load_kernel(struct
         last_addr += sizeof(mod);
     }
 
+#ifdef CONFIG_VIDEO
+    if ( fill_console_start_info(&vga_info) )
+    {
+        rc = hvm_copy_to_guest_phys(last_addr + sizeof(start_info),
+                                    &vga_info, sizeof(vga_info), v);
+        if ( !rc )
+        {
+            start_info.version = 2;
+            start_info.vga_info.offset = sizeof(start_info);
+            start_info.vga_info.size = sizeof(vga_info);
+        }
+        else
+            printk("Unable to copy VGA info to guest\n");
+    }
+#endif
+
     start_info.magic = XEN_HVM_START_MAGIC_VALUE;
     start_info.flags = SIF_PRIVILEGED | SIF_INITDOMAIN;
     rc = hvm_copy_to_guest_phys(last_addr, &start_info, sizeof(start_info), v);
--- a/xen/include/public/arch-x86/hvm/start_info.h
+++ b/xen/include/public/arch-x86/hvm/start_info.h
@@ -33,7 +33,7 @@
  *    | magic          | Contains the magic value XEN_HVM_START_MAGIC_VALUE
  *    |                | ("xEn3" with the 0x80 bit of the "E" set).
  *  4 +----------------+
- *    | version        | Version of this structure. Current version is 1. New
+ *    | version        | Version of this structure. Current version is 2. New
  *    |                | versions are guaranteed to be backwards-compatible.
  *  8 +----------------+
  *    | flags          | SIF_xxx flags.
@@ -55,7 +55,15 @@
  *    |                | if there is no memory map being provided. Only
  *    |                | present in version 1 and newer of the structure.
  * 52 +----------------+
- *    | reserved       | Version 1 and newer only.
+ *    | vga_info.offset| Offset of struct dom0_vga_console_info from base of
+ *    |                | struct hvm_start_info. Optional and only present in
+ *    |                | version 2 and newer of the structure when
+ *    |                | SIF_INITDOMAIN is set; zero if absent.
+ * 54 +----------------+
+ *    | vga_info.size  | Size of present parts of struct dom0_vga_console_info.
+ *    |                | Optional and only present in version 2 and newer of
+ *    |                | the structure when SIF_INITDOMAIN is set; zero if
+ *    |                | absent.
  * 56 +----------------+
  *
  * The layout of each entry in the module structure is the following:
@@ -139,7 +147,15 @@ struct hvm_start_info {
     uint32_t memmap_entries;    /* Number of entries in the memmap table.    */
                                 /* Value will be zero if there is no memory  */
                                 /* map being provided.                       */
-    uint32_t reserved;          /* Must be zero.                             */
+    /*
+     * The following sub-structure is only present in version 2 and newer
+     * when SIF_INITDOMAIN is set. It is reserved in version 1 or when
+     * SIF_INITDOMAIN is clear, and absent in version 0.
+     */
+    struct {                    /* Coord-s of struct dom0_vga_console_info.  */
+        uint16_t offset;        /* ... from base of struct hvm_start_info.   */
+        uint16_t size;          /* ... of present parts of the struct.       */
+    } vga_info;
 };
 
 struct hvm_modlist_entry {


