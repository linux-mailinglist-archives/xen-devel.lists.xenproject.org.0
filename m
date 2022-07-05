Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58139566E97
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 14:45:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361147.590489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8hvO-0003Xw-Ij; Tue, 05 Jul 2022 12:45:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361147.590489; Tue, 05 Jul 2022 12:45:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8hvO-0003V7-Ei; Tue, 05 Jul 2022 12:45:06 +0000
Received: by outflank-mailman (input) for mailman id 361147;
 Tue, 05 Jul 2022 12:45:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8hvN-0002rI-4N
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 12:45:05 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140057.outbound.protection.outlook.com [40.107.14.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a6feb3c-fc60-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 14:45:04 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR0401MB2613.eurprd04.prod.outlook.com (2603:10a6:4:37::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 12:45:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 12:45:03 +0000
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
X-Inumbo-ID: 4a6feb3c-fc60-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bVAY5ZcpXdbPPEtp+phcfYumjdSpjlHqfCbjXyTvpgAsmlujic20tdYE6YIp1prwAR1YWz+RRZp+GMJVJ5MFAtWPci3/B3cLisLz663yvKiZ4Q5aCSVeScAY4xCRkSJ54cBtHY2KmkMsOoz4x/HaIVGR1u6vp+OLjfraWTqK+kzcUqde/q/+snn7FHsYqGmvFg91u8YTeskDPRuZOnPacDC9Y9lr9aK0ah+LPODjl6Km8SALdehy8SpLlSOByqO0YoNU6JAGEEFUZV5UpnGHYug8qxSQtuR3Zaa2+04GPTb0ak3zzQR39AOUzfcWg7g0ThD+/yOqjcUg+N8/6DfuJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+8FHLsqYkAJd4jPM1gdjv6XWwzyRFyA3mYZWklG6gc=;
 b=enkUyvtvFsiD+1XepDyQncEmDiuk8lnJH68rKcrIoiRPhVi6IhsYjN8lzGkyzp7uDVzxdDp4iHaK/f4IqvYgjp26q+OUlg5IVYL7FSsbZmgdTON93qFNx+2T5I2GqU4eSjE4+DELRKfzBIzgaDHABODAiv4PNnWMqm7DY8hHdWk10QZlql4cR4FwO1l4LuUPGf4GsLX6uDal9QqDS6m7PfrIWNupCVeGhIbCNvPNipnmcrLT19oS9RC1nscUvz1TLJkqcr7zg5sOtK3XKMOlQxOmEUGKWpavKiGby+mvTUrk2D0RySMmyK7d8Hw/IxA47Zxpgzfk8VSsx/Qn5cOLVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+8FHLsqYkAJd4jPM1gdjv6XWwzyRFyA3mYZWklG6gc=;
 b=dCn1XpUHKLEvS5irwb7E1cgU0K0fzfZoLm+3GhuxmjmnJQnDLp1Ifc5pXCUgH/v77MgKlt20hA7yjRUioXd2d76FytV4ZX2ZkrxWGNkkLwDP+dVYnn6eu4jspxTzKgZbkZ4svTb3k1J4r+KhoILC3KMsuXs5PIxsvxDXpFEiu8v+Bm1Q07Fgy5Nm75ExJ//xoK8V5Szd9tLPP184JlcS83L/6AoOhj4OF8szMmJB3OeXXytTRfgDOcxOsn3JAbyqVViwVxgUgUfwo7q+I8hD5MTaVOQDwN3uyg4iP2+0G2ZLU1aHI6Jjmjv/24x/1TTzVmBpMuzvSQbXRfIGZw9Tvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7e587d78-43bf-70e5-b629-b7fbed0ae0fc@suse.com>
Date: Tue, 5 Jul 2022 14:45:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: [PATCH v7 04/14] IOMMU/x86: new command line option to suppress use
 of superpage mappings
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
In-Reply-To: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P192CA0041.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ad5b290-cfbf-4ce1-fc55-08da5e842e0e
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2613:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5f7ttoFzyfMxf2hmb+Za23zGEMHXbcIhET+33YWrCKU2DnS0UCyIndaqaMmmhhXL2K+fFGKBk3qJ8Em+oalMW/rVmR5+RwHi4c1PvVKZT96lkTxmZzsq9i7o6fFhQyxcNvuB7ZNO0tDiVVFxS/kT8W8njh9A5OUVM1gTDMTc7il5LAWNZiBd31v8dXs6cdeyCeAWhib1PY3BoqVer8sCKfbyR6Lq2iNDCgdp5yYWS3hxZX4mW/ump9JpVjSQ2t/F8W6TvKzGDQpV3sox8rBXbDf0JscjNEEOj73X1ZsjKSEnUGrpiAdUK8RR4fXFK/pUgxcX6YzR0u27oNQ81S3bQczzYGZwTpyWHP2LBdfTMMhOP1sbpi2UH5jODW1F2pP34LYHc/fK/5C7ScywXueRiGeyq+bc20lsLAG1ofS33pdqTKBz461k6WMielQVN1Ct37UjMgSykjW8Ll09cl/WlhN6tYSEbUzaXvqs8hz77jdPi0/rdQavArT1mrx6Me9vj2t+z76fH2sH7gwbAXyBiV9exXpTu5kCUXiKgfnwW9/EqDkT9qk/SmqgAM9fFYROpu3I8/COFJg5J/OhnTay11WLxqPB1CFTwJANv2mTNQ5ZP1RON5Vl9JFqDAq4Rt6ZtymeEP4H97Ti4m+D93W0KGy5r8b6HUVqIrGafnJEGtjTwd9/AodptQhHiCHzBTbPkrW69RkqThWSbZsZpbt7duByv6J0eMXnhOj0XeBkR1Mo6/dt+36K6OXs0vUmPNpdPv7pxZfuqgWBxdsPV7zfhrRG0ODRABrz+iWBT0SqC52gjs3WXfLDVeh86bBdJqyfN1dbBMYqYgDXnMqQF4o8JJJDZiu/SQQ0Jn24uVW4lac=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(396003)(366004)(39860400002)(346002)(8936002)(31696002)(38100700002)(6486002)(478600001)(86362001)(66946007)(4326008)(6512007)(8676002)(66476007)(66556008)(5660300002)(2616005)(26005)(186003)(36756003)(316002)(6916009)(31686004)(54906003)(6506007)(41300700001)(83380400001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anNIUGhmQndGenFQM1hFVkZjdlpiR3pvUzFxNE9DQ3NvVTU5UDQyQno5Nks4?=
 =?utf-8?B?RUhOV1JkYmFYcUVWSmxOWFN6T0pMbEtXenIyMHJkc3BEbmhnTkwwMStnVHFn?=
 =?utf-8?B?eXRNR2F2K2tvMXVUZWZnajlna3ZhOXdJNEZvS0UweVZKSk9Vd0tIWmQvNWFl?=
 =?utf-8?B?Qi9NblFnTVVDVHprTlRUK2lBZHpYeFRWNG84M016Sm03amlYcEVIWitIY2Nv?=
 =?utf-8?B?UUJ6cTJzYndWUzRpU05WTWZUY2l6SUxqODc4YTdJNUljK0xKTkZlS3B1UGln?=
 =?utf-8?B?bkx0MDZVYlR3a0hEMUlpUzNkRVVrSndFV01sOGRwcjVCdzE0d3VDU0J2em9n?=
 =?utf-8?B?SnVkeEN3RjJQZjRWYmNJblZZV1RLVEp4dEhRU2IrWFpkZlJoYzRYSlF4Rnkr?=
 =?utf-8?B?eUE4RzcvNUdMWGlPUGRXb0sySUJOQk5lNndpOG5pK1puMnpyV1U0NGZrRjAr?=
 =?utf-8?B?NVhvTFJPaVNDNFhPL0tkWmI4ZjlqM0daaG9oUEc3WW1xbEhiTFgraFl5L205?=
 =?utf-8?B?dGxKam5jM2k5aTNvZDY3NmdSNEtPUzdGYmo0T0ZuYjJ4VGtFUDNySXNLaWsy?=
 =?utf-8?B?Q09BNTU3aGNXMFBSQU1wMjJ3YU5Gem9MbkM3VjRLdHduc25wMHZaaUlFQUov?=
 =?utf-8?B?dlllSWRGWGRkdG1Sbmg1Z0VDMyt0YktOV21SNjI4ZzJMclQ1UFpBNS9idnZH?=
 =?utf-8?B?K3c0MnJubndVWTF0NmQ4cWpTclVqZm44K1JTeE5MQUNSQXhyeHZuYUdUWlFi?=
 =?utf-8?B?a0dYTEpvSXRFZENZcEcrdTIxVkxUM3dNSjlsTUVWZjNSYWtTZlJLSTB0TWdR?=
 =?utf-8?B?MWUwTUJpdXIwRFNWY2I2dEhaSHV1dXBuVHJlbGtDaUxRVHJqMjNBRS8ya1VQ?=
 =?utf-8?B?RGVpaHVUMmVod2doNUZIMWZzMDF4QjRSelN0dHRTTmR1U0dnTUZzdlIwSTN0?=
 =?utf-8?B?WGxBZ2RiWXV0bEZNUzcxemdXVUVwYUxaTFBBSFVISzlZelM3TGRLVk9wVTRD?=
 =?utf-8?B?SWhqWG4zTjY0eHFldnJ4eDVVb3h0S2dlQnJLN1JrRm1sSW5ic1ZVeXFhTERl?=
 =?utf-8?B?YUpMY1Y2N1JKUW1iY0ViN3VlSmJVeW9rdjlHVVR5Vmk2R0dxa09xVGJvL1FY?=
 =?utf-8?B?TlIyWHhJNTU3L3JNaFNLbVFmb2JzTzhvcWtPRm4wcitTMVNYaHo2RHAxclBD?=
 =?utf-8?B?SXloanlYSUNmVWE2TmxtK2FBdXFCbW5TZ0MyVmlpVDVCTnFDMlRnRzZ5WStR?=
 =?utf-8?B?RE8vRzRMTTJpajNCUldIdUJqOGVjMU5odktCVzFIZlFxdGd3M3pVQ1FPTUlu?=
 =?utf-8?B?ZDVLOG9jWHptRkxuN3VVU2UyQ1JvSjdJS3ZuM1phWGdhVTJ5VjR6MmFVaGkr?=
 =?utf-8?B?b1hBd004RFlCejVHemNVb0VVRnhrcUk5WDlmaTJZTWRFTlNZcTBJaldFaWdK?=
 =?utf-8?B?Tmh2TWlHWlBqNzFoNzFCMzVtMzhHU0tXYTlIYVhqZXhDczFteC9uMUxxQ1V5?=
 =?utf-8?B?QzhRNndOUlRnTEVnVWdjc0tRSEROTlFLMENXZEdoRjdsSW9hc3F0Yk1NcGZv?=
 =?utf-8?B?NHBUaTc5dDBDSGZwYlQycU9NczQ4M3FFdE5aS0tyZ1B6azE5YUw3Q3FibTlG?=
 =?utf-8?B?dGpNNXRybVhjc0FMK3A5NTkyNUNKQnordDZjVDhSZXRvazE4MHFZbk8yWUtJ?=
 =?utf-8?B?enlpOURYdWF1bjZuNFRMcTQ1SWJ4RTVUK0ZGbEY2REl6RGlaL0FxY3g5WUFZ?=
 =?utf-8?B?SVExUWsxSTVmSm9wYndjajFKVTBaOERGb2x6b1JldFRqSXNyMzBpaWZLdWJ3?=
 =?utf-8?B?QUVuNXZsdmFPMTYrQ0JyKzlwN29veGp5aEVYd0dUWDREME95dTZVRVFXdzJJ?=
 =?utf-8?B?OGQxN1dIY0RURm9oUWY4T3VOUkpOSnFuREdVckQ4YWlGOGR4NlNTeXV3YUtQ?=
 =?utf-8?B?Z3dWSWR1ZGV3UFVPekR5T2x1d21PNm1Xa0YyWTJnTy9Da2pHNDZ0VFRPb3pV?=
 =?utf-8?B?ZnBoek1ocGNmaE9PSW1TeVNXalJxVFZ6S2xibmpLbWZybnJ4RWI1K2l1dU90?=
 =?utf-8?B?WGtoanc1UGNoODRRT2NvQUdBUjljemtycWlQVjhWTVF6MkxLNUxDWHk4ODZ4?=
 =?utf-8?Q?QJii36vYgQS0dv8ORi7o4jCaB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ad5b290-cfbf-4ce1-fc55-08da5e842e0e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 12:45:02.9336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k8tstxAtPRIwVdAZ2a1peAGpE6ZI1P/IzSPBh2BQsCyjm3Gjxq/2FYl24NGzQ3NnSlY/GH9xL9PW4sWE6hXm9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2613

Before actually enabling their use, provide a means to suppress it in
case of problems. Note that using the option can also affect the sharing
of page tables in the VT-d / EPT combination: If EPT would use large
page mappings but the option is in effect, page table sharing would be
suppressed (to properly fulfill the admin request).

Requested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v7: Fix condition in vtd_ept_page_compatible().
v6: New.

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1405,7 +1405,7 @@ detection of systems known to misbehave
 
 ### iommu
     = List of [ <bool>, verbose, debug, force, required, quarantine[=scratch-page],
-                sharept, intremap, intpost, crash-disable,
+                sharept, superpages, intremap, intpost, crash-disable,
                 snoop, qinval, igfx, amd-iommu-perdev-intremap,
                 dom0-{passthrough,strict} ]
 
@@ -1481,6 +1481,12 @@ boolean (e.g. `iommu=no`) can override t
 
     This option is ignored on ARM, and the pagetables are always shared.
 
+*   The `superpages` boolean controls whether superpage mappings may be used
+    in IOMMU page tables.  If using this option is necessary to fix an issue,
+    please report a bug.
+
+    This option is only valid on x86.
+
 *   The `intremap` boolean controls the Interrupt Remapping sub-feature, and
     is active by default on compatible hardware.  On x86 systems, the first
     generation of IOMMUs only supported DMA remapping, and Interrupt Remapping
--- a/xen/arch/x86/include/asm/iommu.h
+++ b/xen/arch/x86/include/asm/iommu.h
@@ -132,7 +132,7 @@ extern bool untrusted_msi;
 int pi_update_irte(const struct pi_desc *pi_desc, const struct pirq *pirq,
                    const uint8_t gvec);
 
-extern bool iommu_non_coherent;
+extern bool iommu_non_coherent, iommu_superpages;
 
 static inline void iommu_sync_cache(const void *addr, unsigned int size)
 {
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -88,6 +88,8 @@ static int __init cf_check parse_iommu_p
             iommu_igfx = val;
         else if ( (val = parse_boolean("qinval", s, ss)) >= 0 )
             iommu_qinval = val;
+        else if ( (val = parse_boolean("superpages", s, ss)) >= 0 )
+            iommu_superpages = val;
 #endif
         else if ( (val = parse_boolean("verbose", s, ss)) >= 0 )
             iommu_verbose = val;
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2213,8 +2213,10 @@ static bool __init vtd_ept_page_compatib
     if ( rdmsr_safe(MSR_IA32_VMX_EPT_VPID_CAP, ept_cap) != 0 ) 
         return false;
 
-    return (ept_has_2mb(ept_cap) && opt_hap_2mb) <= cap_sps_2mb(vtd_cap) &&
-           (ept_has_1gb(ept_cap) && opt_hap_1gb) <= cap_sps_1gb(vtd_cap);
+    return (ept_has_2mb(ept_cap) && opt_hap_2mb) <=
+            (cap_sps_2mb(vtd_cap) && iommu_superpages) &&
+           (ept_has_1gb(ept_cap) && opt_hap_1gb) <=
+            (cap_sps_1gb(vtd_cap) && iommu_superpages);
 }
 
 static int cf_check intel_iommu_add_device(u8 devfn, struct pci_dev *pdev)
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -31,6 +31,7 @@
 const struct iommu_init_ops *__initdata iommu_init_ops;
 struct iommu_ops __ro_after_init iommu_ops;
 bool __read_mostly iommu_non_coherent;
+bool __initdata iommu_superpages = true;
 
 enum iommu_intremap __read_mostly iommu_intremap = iommu_intremap_full;
 
@@ -104,8 +105,13 @@ int __init iommu_hardware_setup(void)
         mask_IO_APIC_setup(ioapic_entries);
     }
 
+    if ( !iommu_superpages )
+        iommu_ops.page_sizes &= PAGE_SIZE_4K;
+
     rc = iommu_init_ops->setup();
 
+    ASSERT(iommu_superpages || iommu_ops.page_sizes == PAGE_SIZE_4K);
+
     if ( ioapic_entries )
     {
         restore_IO_APIC_setup(ioapic_entries, rc);

