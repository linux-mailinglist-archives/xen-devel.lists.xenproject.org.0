Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA1166918C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 09:47:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476866.739269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGFj1-0005EM-T4; Fri, 13 Jan 2023 08:47:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476866.739269; Fri, 13 Jan 2023 08:47:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGFj1-0005CM-Pg; Fri, 13 Jan 2023 08:47:47 +0000
Received: by outflank-mailman (input) for mailman id 476866;
 Fri, 13 Jan 2023 08:47:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=grKZ=5K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pGFj0-00056k-3C
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 08:47:46 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2058.outbound.protection.outlook.com [40.107.6.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2a8557c-931e-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 09:47:45 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7433.eurprd04.prod.outlook.com (2603:10a6:102:86::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 08:47:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 08:47:42 +0000
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
X-Inumbo-ID: f2a8557c-931e-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRmT0ij8gAtOOt4rCEN/vyCQ7Aso5MV0XWank3L9GX8Pm9kdJRjqWx/qqSwvB8d/eNZnZDKpwQFamjhtOleQnz5PVlKfPIbNUt21UtVhKO2ThDlXjEK14uZfOXkOfizcNQ0ZyVj3GUtEq40jNJTdH3FA5Rc3kV0QBoSYM15K72gT81P1NIdMMGRyeysQj99x6ND9ykfmv7FZMsja/efWtUwRHwodik/2u734w1ZHBoFS6ll2lJgdyMac1t0cRSZFtUlmDOn+6/aEOTMvvpZbG55dfOt3Uyc3ahHsVSCzXBYpBl6/CVAsTW2Cm/Mdab15awaPbnJasv9VsEdSJBeSlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PIN7bYME3B1gixZ9fvJuwYJvOqsQq3RxKGZEx+HCKzM=;
 b=CCxguQIoxLhGj1nARBQ3OCJP9W45jvd85jKIXF7a2E6VS4X4lCQ0XYef5nieJIz1osyMAWuZJsulp3drkrt+4LPjlRCesLTlgf9rdbCdx8mDf8HcaWhj3tHy8co6UiBin3eg0ZFEe1SklInxp1TU1+B0sd7dFKFW6lMIveKs7k6MfTpan7laquOBC/AG0jlnSXLRvAXYrpCXLUreXYHFAqcgddHOVfEz6XHrtRG2NxNYQbDO2w9gWDtF/TiozCswnK2NKUDftiti50iKehtCfeILBd0zYYiSXOeL4zHcJTYJT1M2zI4UGrjM17xguo2CTQ9LugHUAUfkG+dvP03/RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIN7bYME3B1gixZ9fvJuwYJvOqsQq3RxKGZEx+HCKzM=;
 b=5jFDtqWuYfKhs9AEiFfHSZzeg1IMGMKLgqtSorQ6bBlBPqwynqVIFdG3KUrx/wrEuxuPUkPgDzte1DN4CDuicNYasVjmo5WneaZo+gIaKt+EWJa+KfTWAptHhmCK8XaCF4cITchiihyyk5tpEUElofQ87CyclBIXxwOrsb83lhBH1ZE03BU8VMxq5xsr9ALGaVEraOTG2Km+0O7r7ZZS+IPV3yzZ7TpcfQP6jgpNYXFPH20VU/LnQPLMpA6uwQQukyF3BIEtA0gimAtNwZZ/zstNgFXqZAUVuEwTdG2obkMDUKPs9VB8Fml5byY9NmApLz/pD58IVHMfbMubEzBlAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cf0ed06f-4d49-0f73-cfd9-eb49e951048c@suse.com>
Date: Fri, 13 Jan 2023 09:47:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH 1/2] x86/shadow: sanitize iommu_snoop usage
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, Xenia Ragiadakou <burzalodowa@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <01756703-efc8-e342-295c-a40a286ad5f1@suse.com>
In-Reply-To: <01756703-efc8-e342-295c-a40a286ad5f1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7433:EE_
X-MS-Office365-Filtering-Correlation-Id: c8992c1a-1ff5-48e3-afb4-08daf542d54b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uPegB6XImAJuvmJpNRvfuo3EQ8pI8B1Yz4N6b5aBhPvl3m6NePkT3E+5ZJgz9mxDUqDvspc4sXNvMz+S3nWfJO3EJRm5rG6cpUXq28xS34tZXkZZ9NMPhVPpLPDdMQI7gKK3xyrV98EbrsZRTAcAlo/9ZoTZTt/N7Fa/CQG/jCvifm+RzpDFcq7A/ebzG6LTKiXZvHr/OFyRAR3mq2ooeSy1PDX8oJfLnwq/t0iEknFIhpwGC342jWrSlvmDbSvxuz3QKTMToMMNe93mIKi8mc2V0QSQvGYRQwa4337713lSRNlgX1U+MwKFhE5pikuu0skIkIkW/HYbOcMied8vYzpAQQr+j10mkGxpc1hA3bjRfJLHjt0iFli8Klrypc4J+HZVjavYvQb6m+W2j1o0F4aTzcWzbPgxwJeZF9+IbfwXhq/77Rwfs5rql4SdRE3s2culqMSQLjWr9LwLo8qFVHibRQBKOJk2yJpqATXICRXlsrevKpzaezpElq1yzja0wmd7iYUXXQOJz259KeocV2y3UpFeWmprdb/5QyiuQbAUYc6iDIW9dWpbXwggsK0k/WCguMT3lfyUZXdiXF0+tDF+rZPHGhJifJRDlcTf+ADm4L3ZdnlLTB6KIZSFu3e81Gu8e9t+izt+E0mlxR4jA6iifqQ0jOX/DiaPXW3MII8W/tnn42ZPs/eGHjJJ7n5tyoSJz40cITFouPSnexK7cAKe+dL+lz1prx+b1RjUxRcCfDq7R5N58+VceNNBeIGFvaSg8zJZIpJGifUpEORYPw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(376002)(396003)(366004)(346002)(451199015)(6512007)(6486002)(966005)(478600001)(6506007)(31686004)(186003)(26005)(66946007)(66476007)(316002)(66556008)(54906003)(2616005)(6916009)(4326008)(8676002)(86362001)(38100700002)(8936002)(5660300002)(41300700001)(83380400001)(31696002)(36756003)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDVuczl0cWM0VUJrUHlVVnY1bk5rZVU0Q2ppZGY3VHN2RlNOUkhBRVhMM1Ev?=
 =?utf-8?B?TkQ4UDNyNC8venVNOWJYUWR2TGY2aWVpaTFnNmJadkcyaTgwcjdpOGlOQWx4?=
 =?utf-8?B?eFBRUExBWExwQjRwaU5RRXF1VU9OWURDcHFTYm9pcFFFa1NjYUNLcVBGT1di?=
 =?utf-8?B?bUZYZVRwbUlqMjRrZmJVcWtHRDNrd1ZlTFhzVHo1UEtmVTVmT3Ftb2xqMXZn?=
 =?utf-8?B?bkQxNUp4ZmZUKzBpTVFoVDEvSVJIcDFtMmtLV2Foc3J6d1JDS0ZJaHl3OW9m?=
 =?utf-8?B?MGYrS3lPbmdranZxZWNTVExCN2hJbWc5SWdjUi9XL0IvNmozLzU0dDZpbWNn?=
 =?utf-8?B?UXRuYW4zSnBaazFaUVc4QmVDWk8yTWJxQTlmbWloTUIwMEowcnIvR1JOZURQ?=
 =?utf-8?B?d3V3Q3ZDMkZVTGVodzRuRGNFNitwclZQMXdRL3l2K3Y1V3ErTmUxMWcvd2Jt?=
 =?utf-8?B?UE5iYUtLOG05bmxRbTFZZk5Id0JaWk10cHo1bXIvYVpQOUdZT3VVdUZxWGtX?=
 =?utf-8?B?SzZ1dHBQK3NOSEMrVEJMV2xFUkpnY0kza3ZXWWdaSmRrRXZ2bDEwVzBrRStt?=
 =?utf-8?B?MzBRNUljL2FlR0cyd1VlK1hnbTUrSHZJNGpvZk1LVythc1ppOXl2dEtwTVN6?=
 =?utf-8?B?N2pkY29mdGdCVDhLUTJTTnR3UGEya0tNZWRwcWp5WFBYcHNGeXRaWXBJdFNU?=
 =?utf-8?B?cXY5V2NjM2hXWVRrNlpWYzNLdmV1ZVlYcjkwM05TNlBRdlQ4WXVEZXhhZGNv?=
 =?utf-8?B?OWhsaDhFNGwzaE1CNExzTFNCaEJ0UVZlMmpZcDA4QzdOSFBXVU5YbHliSFdH?=
 =?utf-8?B?anNRbTV5ek1TM0ZYRnhENkM0YU14c2dXRHQ3cEVyWGo2d3J6QlhEQm5Makcx?=
 =?utf-8?B?UU1wVVZ3RWZDWVBUbzBYYnRudlFhTzVTMktyTFhyUWowb21haXhGbG1yUEUy?=
 =?utf-8?B?OWE4K2Z5M1ZIeDBwSnkrQ0pnaUduWTF5RERYcUJmRW1OSmtaZlZ5M20wRjY0?=
 =?utf-8?B?cmp5RStSK1dDRU5OanowQi9nYisyd29WL1JYSjlvcC9TLzdBZGowazlXWWFX?=
 =?utf-8?B?NHZ1NEkveXlJT3gzbVovTElDdGdxY3VHT2NGcytLdGZ4Qk1VbHc0UCsrMnFl?=
 =?utf-8?B?Z0FPeEJpS1QyRUdLZ3Y5eU0yZ1VuYkh6TWNZSWozU0F1dGw1cWgxeVpQSXo1?=
 =?utf-8?B?NjFhc3UzRHNML3JkNFFzRXplcDFNakloWG5OR0dYbDhWTjNnQ0psaXN5cEt5?=
 =?utf-8?B?OUloM1lGalpHWXc3NTlDYm5IallYYjB6UjNpSGdBN3g0NXF3VWN2RlowV1ha?=
 =?utf-8?B?Y0M5eUNmSzIrM0hzWEtVblRsbTZyVkRwMXZ5SjB1b29JcGxiL290bG9nQmxQ?=
 =?utf-8?B?b0VyZkJxYUdZbDFua1JuYWVvZWkwZTVoVUxsblVKSlQ5YnMyaTJFSkh2TmVn?=
 =?utf-8?B?RWtiVzI4ZzNHamdXL2xKcVIzcE9SMEtIcG5GQ2Fkb0taMEdHZFAwVU9pTWJX?=
 =?utf-8?B?RStjazM5STdUVTFxQWdWSXpuRGZobGRjaC9NaldnMGNWQXlXdm9QZnk2SFBS?=
 =?utf-8?B?RXRXODNQSHZvZU4rRWNORWFzY0tvUXRrZU0xcEdKNHRldFhTL1paVVBiVXRy?=
 =?utf-8?B?aFZTT2lNQzJUNmRCNnJRN3lOQkxxdjlHUzduTFR6dm8yNE1yZU1Ea0NPVm9z?=
 =?utf-8?B?NHVaSVUrdmc2UW5Jb1NYSHUrUll5TzBFUmVLY0NZL1UwQkc1amxuUzVaclNO?=
 =?utf-8?B?Ym9NR2JXc3VyTHFCK3BLRmJKdHA2ZDB1d05UTUd1MEJ0TllSOStFQnhZY3kx?=
 =?utf-8?B?VjVsYXRvK0d3a2w0Vi84QmVvbFQrSDErK3pyeGc1dE9YcHBDSzVuV1dHQjdY?=
 =?utf-8?B?STYwTCtoOFAzN2YyMUw0M0orOE1IRkdqOUQwYy9neEtWaTRsbEJMYm9XeTJE?=
 =?utf-8?B?WXFhTmdrQS9vVDZqUmFLbGV6eXozcmFNSnBqcEMyOGZ1TWZzSVhrOTdKUlFU?=
 =?utf-8?B?UjVYTVB0K25iSFpmMlZGSVJxV2dDUjdnQkRWOFRQOUMreWUrTWxyQjZNS3dw?=
 =?utf-8?B?VDFOVlRkOCtISmhqekQwWGZVUjAwVUE2dGh0ZWFQdzNvRFV1YVhDbmc2eTNr?=
 =?utf-8?Q?wJmVqrocJuCNf/Uzy2tQGlrMh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8992c1a-1ff5-48e3-afb4-08daf542d54b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 08:47:42.2906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4LmJ6pT6TAxMypz69GVfbm4OWgd+10mmUco7RWBX1ljKZzMqSn+8XB3y32EGXqNMUBvoM8UqPvCHwfoO8D2GVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7433

First of all the variable is meaningful only when an IOMMU is in use for
a guest. Qualify the check accordingly, like done elsewhere. Furthermore
the controlling command line option is supposed to take effect on VT-d
only. Since command line parsing happens before we know whether we're
going to use VT-d, force the variable back to set when instead running
with AMD IOMMU(s).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I was first considering to add the extra check to the outermost
enclosing if(), but I guess that would break the (questionable) case of
assigning MMIO ranges directly by address. The way it's done now also
better fits the existing checks, in particular the ones in p2m-ept.c.

Note that the #ifndef is put there in anticipation of iommu_snoop
becoming a #define when !IOMMU_INTEL (see
https://lists.xen.org/archives/html/xen-devel/2023-01/msg00103.html
and replies).

In _sh_propagate() I'm further puzzled: The iomem_access_permitted()
certainly suggests very bad things could happen if it returned false
(i.e. in the implicit "else" case). The assumption looks to be that no
bad "target_mfn" can make it there. But overall things might end up
looking more sane (and being cheaper) when simply using "mmio_mfn"
instead.

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -571,7 +571,7 @@ _sh_propagate(struct vcpu *v,
                             gfn_to_paddr(target_gfn),
                             mfn_to_maddr(target_mfn),
                             X86_MT_UC);
-                else if ( iommu_snoop )
+                else if ( is_iommu_enabled(d) && iommu_snoop )
                     sflags |= pat_type_2_pte_flags(X86_MT_WB);
                 else
                     sflags |= get_pat_flags(v,
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -56,6 +56,13 @@ void __init acpi_iommu_init(void)
     if ( !acpi_disabled )
     {
         ret = acpi_dmar_init();
+
+#ifndef iommu_snoop
+        /* A command line override for snoop control affects VT-d only. */
+        if ( ret )
+            iommu_snoop = true;
+#endif
+
         if ( ret == -ENODEV )
             ret = acpi_ivrs_init();
     }


