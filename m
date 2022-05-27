Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2902535F07
	for <lists+xen-devel@lfdr.de>; Fri, 27 May 2022 13:12:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337942.562654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuXt7-0007Zh-Rn; Fri, 27 May 2022 11:12:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337942.562654; Fri, 27 May 2022 11:12:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuXt7-0007XD-Ob; Fri, 27 May 2022 11:12:13 +0000
Received: by outflank-mailman (input) for mailman id 337942;
 Fri, 27 May 2022 11:12:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nuXt5-0006tv-El
 for xen-devel@lists.xenproject.org; Fri, 27 May 2022 11:12:11 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da520db6-ddad-11ec-837f-e5687231ffcc;
 Fri, 27 May 2022 13:12:10 +0200 (CEST)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2055.outbound.protection.outlook.com [104.47.9.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-eiF3JyVZPQa2T0-rr7aKNA-1; Fri, 27 May 2022 13:12:09 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7210.eurprd04.prod.outlook.com (2603:10a6:102:8f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.15; Fri, 27 May
 2022 11:12:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 11:12:08 +0000
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
X-Inumbo-ID: da520db6-ddad-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653649930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9E1G4wR+PqEH6Q/fpL7fSV+Z1/ahzOqCt4WvVVI8szc=;
	b=XrTJi1g73F3wZ3FuE34P/wvSEDVxbew+cTrHk3SNizB2G+3vfzAjVIJU6HDSFsBolptW07
	ueCy8WNR9UfzvYOhB72bphMiQQcDk70wNAzke+bBd6NotIzzEL6Dg7pWbr5llS7pw4UOrn
	1eQPlRnUZax0rHnznrypiM+gB1rTkcw=
X-MC-Unique: eiF3JyVZPQa2T0-rr7aKNA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z9/u5YLxd2PRcf4XKD/GEcir5aRLl5iNzJcFJcEHc/G7JkowlSLwcTQFtEjxU6VZUsIm2u73wqvWCxQNoVDQgCr0zo0XLZq1xmw3+rqp+pDcvvS5O32SjCpzT4AnGGOCq/59xZE7Zc2/E7JGnTgdK2abZg9T2yBr7OYX0mwjnoGhs4YiWCcMTBt6e+UNOTQ7TlRzuDCSuJIraIqRNkQ0jTVn7HtRnVahA8nBE6DT74lPowk21s6FTNtE3LH0RUygZ0kk6GlPPIC1Gxbr6XfBXp56y7wDTaP7q5wZUqa2xmqhIyn71vCcafOehWXpnTWsJSRki/dK1mdKWxOw9A0tQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9E1G4wR+PqEH6Q/fpL7fSV+Z1/ahzOqCt4WvVVI8szc=;
 b=Lk8OLdLx3u0XAiYVHV/uwp+4R4ZL31IJtUMA6zaqhsnB9hhaodQJ1blw3AlzVK5FSutjS4gxFh4BHp5By9pwDpUbqdMHcts9CapBM/jUP+RiTUfHA1cnqJOBKFcrin3P8Pq/Rc3MyCmag08h1oBlcwYCFiTyKUnA99Dzm2gYxn+/BY33qZyyYFGAHOjt1uPXiDQmOe6CVk/svoC7OD6anTWMPRsJT57B7uNk0f/2+UEyj8JAOKHiz5hnaI6oHQlwRrS1G5fMTA1Pmyjv0Ac77KPqEd0+drcYqDQQ8jxy4gRGCGZdhim9gu4jKS6OoEkRTQididf3Lv3DOFiTttvUlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1de2cc0a-e89c-6be9-9d6e-a10219f6f9aa@suse.com>
Date: Fri, 27 May 2022 13:12:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: [PATCH v5 01/15] IOMMU/x86: restrict IO-APIC mappings for PV Dom0
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
In-Reply-To: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5P194CA0005.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9446ce4b-94c1-4d15-1622-08da3fd1bd14
X-MS-TrafficTypeDiagnostic: PR3PR04MB7210:EE_
X-Microsoft-Antispam-PRVS:
	<PR3PR04MB72109527C9E36B157431B503B3D89@PR3PR04MB7210.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4JnqS3xQm+MpDtJwOEXOotAtiA1CfGoRlxKEGfIcvTHRVg2xbd3rm9eJUg4D5RIj/2mAdMmFRtpItWdACjbjXBm66xHsKpJYgDOpUZHJDAQOpmqhcos3qnfqs+dxzr9o6xbQrIOigymw7EEKa7uMffgxfUkkVLcTQdr8hQCRED5OYLZeR1ElxVL6qzffTEXTdWqlStu1SRxfEZaoc4kZ7V9CkDzfwOx3dhxqzTk6J4J5GQs8YE46e4qcEtygWMbmFJeAf+X10K+L4555Ex6DTM/cekCjdAJkn38fqhYK57+3rWu2+KUYf2QWA1XPTiXE5i+b13nBWWhmBy1/Qs9Ve4YTlYEr/9RvR8sESUo+F8z39nGgqcmOqKvmcYX+XEh8BzIjyj9W8YMak2MBkPezvu/rpvcQA8gRunqoOSVua/LNUe8RZR3vhbMKYVUBMoSnpe8wPnqkD0A1C0g4HaStBgr2iso/rubCMy+KH2+H97S8ldCIrSMxV2yxFRPLRaD+cZrAy+MZ67OT/udhEGx4Kdn5BEEWNrS6Xz+XbcIRUtzM4bazI891YXgnhW8kD3oMWgXxQofznOHHWJ/qu+tfeKy7L+5WCaco/uwZvivtz9BvU1eY4JVBCPgYEuJTsYmC6IcPpOYiD2CCjQtaFGssjONxkUrTYwf5H09uZMvDlBwFodxtmI2KothtJHmB6xmytvd3+a1KbMectfJZ6RUfE0dInFuHfxhjERMt0aaEHFk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(6486002)(8676002)(66476007)(6512007)(83380400001)(8936002)(508600001)(5660300002)(66946007)(66556008)(26005)(38100700002)(2906002)(86362001)(6506007)(186003)(54906003)(316002)(36756003)(6916009)(31686004)(31696002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWNkbVFYbXY4UTN3cWZoYVkrQ2h0RlVkdS85bUZOY2VIbVZYK1VIMzU1ZFVN?=
 =?utf-8?B?UXYzYU4rbEhueXdFSVdkdXdqbHhJNVM0aWpjbDNnc3FXNGpnLy9oVVhjQ2Nz?=
 =?utf-8?B?MGdaS1N1anY5Mm9wNHBNTlgxaTloMFB5ZS9qekRVWm5KMTBQOFlvd2tqTHVl?=
 =?utf-8?B?cExzV1FzckI1cVlIczdaWTR2S1JXNVlwbHloWXR4MlZVVk1oSEQxcDFKeU8y?=
 =?utf-8?B?Tzc3TTNYOXZCcWlXV25odUhRbmRmZ1JXM3htL0t0Z25MVlJPQlljak04WVJ1?=
 =?utf-8?B?VktTMjVjalJlMHZHcm5iRjhaQVU3eXhlNFVBS1NNTTdtc3NaMkdEc0thZEhW?=
 =?utf-8?B?NVNZZ240QVJHZ2RibHBsT2RFeGFCcW1FS2M3WkV4ajg5clQ5T1VxbnFCMWVk?=
 =?utf-8?B?dWpaQVVTN0c3dWlJdVJwaGFrLzRhTlBTVXhodnJrVkxXS2xPUklIUFcwMnNY?=
 =?utf-8?B?MFJURUcybUJEY0IrTjVzb3ArTzJ1MmgvbjdLZy94TE5uUzAvcGRyMmRQQTNV?=
 =?utf-8?B?QUpDZ0VpNktwOW83Z3BNazJ6cE1IdmdkbTBGQUN1VE1yU0YxRjRPUGpSbEUr?=
 =?utf-8?B?TVU5NWZ2MmNOZlNLTVQzYk9kU1ZkTHNCY1Y5dlRQak5tS1JGSVdkUzNJZXNs?=
 =?utf-8?B?VnR2NDQyUEd2RzFMTGs2ZE5jZzJFU0hNc1ljeHo3NFh2R0JycjNielBJTThx?=
 =?utf-8?B?T1pJUTY2clljZXYyVk9McVJ2OVZLNWUrblpxNk1aNWlaY21MYk5Wa0tJQTk4?=
 =?utf-8?B?c2haL3hSOHdaM29STzNKWWpJT1c1enloblBxclBUdnRNaVdpZzVzYjgyV040?=
 =?utf-8?B?Y1d6emlzaFNQQ3ZselZiMDVVL1dsTlFnZXRUVDUxdWgxQXZscVk0SGtpdzRU?=
 =?utf-8?B?eVA0aVljU3h4S2hMeEFqL1NqSC9sVDlsaFV1OTlKdk5acGdzK1R5VGxtVVl3?=
 =?utf-8?B?dTgwTlIwRTd3R1ZobnBaZEZtTGFMK0V1R2FkczVyNlRQT3BJYWNmVGJMVnMx?=
 =?utf-8?B?QzJxRGhJQXBsdFZCbUxiVlBZTU5IS1IwMVhkYVJlc1M5Y0sraGdBZWFDMHlv?=
 =?utf-8?B?RE5CRTBLbUdRdUplMWkxMDBqNEo1QVdQVzcvRzZsNm9FaGsra2ZkRDVGVSti?=
 =?utf-8?B?QUUzVHcvM3hEb0xSOFRGb0JPUWQrL1RiQzdRNGVPT2N0ZGdSZDBVMjJYZmRn?=
 =?utf-8?B?SjVZS0pTdnNBK1FIdVZ0Q2dHOWwwOStCRjFUemdob0haVVJ6NTFDcHJ6MVlH?=
 =?utf-8?B?RlV0eHNZL2Uwb2FUekVERUJmUjNSODdiKzRkRnlYMmRwQml6SnZaUkNUalJP?=
 =?utf-8?B?NkpvVGs1WG9oMDVSRTJ5VHdXMkllbkNLL0djRzhSUXJUc01QeWptMkNtdmlC?=
 =?utf-8?B?R3p6bkVNQjYzeFJxWWJteHJKZnF4ZEhCejEvMHNMbXFIUkRKbjQwZExNbGVP?=
 =?utf-8?B?VWM0QWlKVGVkaFgvdHVsQWdobFQ1VEp1WnE1aTZTRTdhejdGTFcxSzU2WmRM?=
 =?utf-8?B?TEMzVWUya1BNVlI1eWZiSkRydmxNSFVJSXArZWd2MFFsWEdjQUVOS1pacWdG?=
 =?utf-8?B?V3hOWEhWdTNEQ3lVRDdoanEyNEYwaGtFdkt0c0RTM3dGeG43QkVVYUlBQTVS?=
 =?utf-8?B?aGdHQ3ZTVmJqanF6UXB3R2d0Tnl2RVVERzBEMUtUelkrRVk3WU84aTJZSWJT?=
 =?utf-8?B?dXR3SE1udno4L21zMlFxT2hEcWFXaUh0WE0reTlSVVhlWVZwR0FzUWZtK3hY?=
 =?utf-8?B?Q2RJQTRRN081dk1XOU9wZ2RBNjQ2ZCtFM0xScGRqb3F5WWluU2EyWlJhMVVC?=
 =?utf-8?B?Rlc2LzhTWGxIV2s4dEJHTHMvRTgxSzlUVm9tUXhUNnNlMDBncnBwM1pLb0My?=
 =?utf-8?B?emxSdll1eGVEK3kzMUJCM1owVW1BYlpUaDhTNkZ4dVozVFpXcHlxWlBIYjBD?=
 =?utf-8?B?Nm1zK1NzSEZtSXJGSkhFb1pvbUhWdSttcVRFTzlEL0FZTkJhWWZ1bHVzRjVr?=
 =?utf-8?B?R0xRTXg4WnYyak5MSGdNbHJsZUYzeU1LVDRXMnlITHNGbmJUY0VNZUdWOEFN?=
 =?utf-8?B?a1FMVWM5UHZVcHJERkVFK2tINzB6bURPYWRHNWwxUlpnbXNSVDlYUmRyODlW?=
 =?utf-8?B?YTE2ZzAySGMxdC9rMXBybTFHSXcwYkZxVUpSL1BmTlFucUhhRlVpTlVpNzFq?=
 =?utf-8?B?UUVHVWNLeS9jN1Y2bWVBUW16WXhDcDBPNXdkWmVNU1J0Y0FQVTllbHlQZHNL?=
 =?utf-8?B?UGRlNW5wUUtmOU91M2tFTUdLSi92dzJHakllcjBPZk5YbHQwNXdQSVYyZVFC?=
 =?utf-8?B?RjYyOXpPUUF4VExPMkRaTzY0dXVSbjRSNk5ra3d3N28yRng5YW0ydz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9446ce4b-94c1-4d15-1622-08da3fd1bd14
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 11:12:08.0833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F5x0Juf9oxVOlfdbMv15/uHfN4vdP92LPP9inOqf8PIn55yS3LsZxzVLIh59tNaC3MB9wB41L1DZfbs3S+a1zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7210

While already the case for PVH, there's no reason to treat PV
differently here, though of course the addresses get taken from another
source in this case. Except that, to match CPU side mappings, by default
we permit r/o ones. This then also means we now deal consistently with
IO-APICs whose MMIO is or is not covered by E820 reserved regions.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v5: Extend to also cover e.g. HPET, which in turn means explicitly
    excluding PCI MMCFG ranges.
[integrated] v1: Integrate into series.
[standalone] v2: Keep IOMMU mappings in sync with CPU ones.

--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -13,6 +13,7 @@
  */
 
 #include <xen/sched.h>
+#include <xen/iocap.h>
 #include <xen/iommu.h>
 #include <xen/paging.h>
 #include <xen/guest_access.h>
@@ -275,12 +276,12 @@ void iommu_identity_map_teardown(struct
     }
 }
 
-static bool __hwdom_init hwdom_iommu_map(const struct domain *d,
-                                         unsigned long pfn,
-                                         unsigned long max_pfn)
+static unsigned int __hwdom_init hwdom_iommu_map(const struct domain *d,
+                                                 unsigned long pfn,
+                                                 unsigned long max_pfn)
 {
     mfn_t mfn = _mfn(pfn);
-    unsigned int i, type;
+    unsigned int i, type, perms = IOMMUF_readable | IOMMUF_writable;
 
     /*
      * Set up 1:1 mapping for dom0. Default to include only conventional RAM
@@ -289,44 +290,75 @@ static bool __hwdom_init hwdom_iommu_map
      * that fall in unusable ranges for PV Dom0.
      */
     if ( (pfn > max_pfn && !mfn_valid(mfn)) || xen_in_range(pfn) )
-        return false;
+        return 0;
 
     switch ( type = page_get_ram_type(mfn) )
     {
     case RAM_TYPE_UNUSABLE:
-        return false;
+        return 0;
 
     case RAM_TYPE_CONVENTIONAL:
         if ( iommu_hwdom_strict )
-            return false;
+            return 0;
         break;
 
     default:
         if ( type & RAM_TYPE_RESERVED )
         {
             if ( !iommu_hwdom_inclusive && !iommu_hwdom_reserved )
-                return false;
+                perms = 0;
         }
-        else if ( is_hvm_domain(d) || !iommu_hwdom_inclusive || pfn > max_pfn )
-            return false;
+        else if ( is_hvm_domain(d) )
+            return 0;
+        else if ( !iommu_hwdom_inclusive || pfn > max_pfn )
+            perms = 0;
     }
 
     /* Check that it doesn't overlap with the Interrupt Address Range. */
     if ( pfn >= 0xfee00 && pfn <= 0xfeeff )
-        return false;
+        return 0;
     /* ... or the IO-APIC */
-    for ( i = 0; has_vioapic(d) && i < d->arch.hvm.nr_vioapics; i++ )
-        if ( pfn == PFN_DOWN(domain_vioapic(d, i)->base_address) )
-            return false;
+    if ( has_vioapic(d) )
+    {
+        for ( i = 0; i < d->arch.hvm.nr_vioapics; i++ )
+            if ( pfn == PFN_DOWN(domain_vioapic(d, i)->base_address) )
+                return 0;
+    }
+    else if ( is_pv_domain(d) )
+    {
+        /*
+         * Be consistent with CPU mappings: Dom0 is permitted to establish r/o
+         * ones there (also for e.g. HPET in certain cases), so it should also
+         * have such established for IOMMUs.
+         */
+        if ( iomem_access_permitted(d, pfn, pfn) &&
+             rangeset_contains_singleton(mmio_ro_ranges, pfn) )
+            perms = IOMMUF_readable;
+    }
     /*
      * ... or the PCIe MCFG regions.
      * TODO: runtime added MMCFG regions are not checked to make sure they
      * don't overlap with already mapped regions, thus preventing trapping.
      */
     if ( has_vpci(d) && vpci_is_mmcfg_address(d, pfn_to_paddr(pfn)) )
-        return false;
+        return 0;
+    else if ( is_pv_domain(d) )
+    {
+        /*
+         * Don't extend consistency with CPU mappings to PCI MMCFG regions.
+         * These shouldn't be accessed via DMA by devices.
+         */
+        const struct acpi_mcfg_allocation *cfg = pci_mmcfg_config;
+
+        for ( i = 0; i < pci_mmcfg_config_num; ++i, ++cfg )
+            if ( pfn >= PFN_DOWN(cfg->address) + PCI_BDF(cfg->start_bus_number,
+                                                         0, 0) &&
+                 pfn <= PFN_DOWN(cfg->address) + PCI_BDF(cfg->end_bus_number,
+                                                         ~0, ~0))
+                return 0;
+    }
 
-    return true;
+    return perms;
 }
 
 void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
@@ -368,15 +400,19 @@ void __hwdom_init arch_iommu_hwdom_init(
     for ( ; i < top; i++ )
     {
         unsigned long pfn = pdx_to_pfn(i);
+        unsigned int perms = hwdom_iommu_map(d, pfn, max_pfn);
         int rc;
 
-        if ( !hwdom_iommu_map(d, pfn, max_pfn) )
+        if ( !perms )
             rc = 0;
         else if ( paging_mode_translate(d) )
-            rc = p2m_add_identity_entry(d, pfn, p2m_access_rw, 0);
+            rc = p2m_add_identity_entry(d, pfn,
+                                        perms & IOMMUF_writable ? p2m_access_rw
+                                                                : p2m_access_r,
+                                        0);
         else
             rc = iommu_map(d, _dfn(pfn), _mfn(pfn), 1ul << PAGE_ORDER_4K,
-                           IOMMUF_readable | IOMMUF_writable, &flush_flags);
+                           perms, &flush_flags);
 
         if ( rc )
             printk(XENLOG_WARNING "%pd: identity %smapping of %lx failed: %d\n",


