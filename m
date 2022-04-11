Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1714FB7AA
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 11:37:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302775.516540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndqTd-0007ng-RL; Mon, 11 Apr 2022 09:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302775.516540; Mon, 11 Apr 2022 09:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndqTd-0007l2-Nj; Mon, 11 Apr 2022 09:36:53 +0000
Received: by outflank-mailman (input) for mailman id 302775;
 Mon, 11 Apr 2022 09:36:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1peA=UV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ndqTc-0007jK-V3
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 09:36:53 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e47771de-b97a-11ec-8fbc-03012f2f19d4;
 Mon, 11 Apr 2022 11:36:41 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-tNEkerSfNjqnywlkASB9kA-2; Mon, 11 Apr 2022 11:36:47 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by HE1PR0401MB2457.eurprd04.prod.outlook.com (2603:10a6:3:7e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 09:36:45 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 09:36:44 +0000
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
X-Inumbo-ID: e47771de-b97a-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649669810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JIOtB5hoGvxfTiBr5WkyK/emu3c33KdonytgCqOz8N4=;
	b=YSraPXG+NKJPKQV7XEbpBJSCUveMbHQ61KD2AwzOiOHZ46FeWXudkL1ogykJj84ASjv6b6
	W6A/AxrKGK3eYij+cd0JrRBfFcxnsMrsCtLGyli7wX9739GxgKHPYe2/8RDj22VvZWgsfh
	PlLpFiGBG8afqqO3RwARErCwp+hw7+Q=
X-MC-Unique: tNEkerSfNjqnywlkASB9kA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QKToGTdRtFQqfWWcuJbuadyybRdJuj5V94VWNj0rB/6eq88t74cT7QbVPd8ZUhQul/c3clXjgNNE/7As+2QaGpHqWnnDHqW1xClA0293YqUcS5l9b1SKM1W/F6peWFyTV6D3AKYsafWQI1xPMYuyoa/MLpGikoSyynivQaHj6cN6oRs5eQd8CdEeTOzo969XxCIZ+994yr8jPa2x2lPlcXkBXE1nxrqvq5fQdyZhoHIG1l0MNZA6yPLt0YV8Wfoi7v1TDkuakfpCpA8MFF4WhIuiiWsZqYvOP5QQhdXfxCy9Mp6G5FgsZ4TvJW6jw6mjQM70x5WnGhsZOxNzwKLdpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JIOtB5hoGvxfTiBr5WkyK/emu3c33KdonytgCqOz8N4=;
 b=EH86Tdakl5zMvOABjYeAHevrsu26w0tIVYhywTlDjI+gzQadw6YE5cK+QJQ4rstD+gcvEvz0bXidNWxtw5V3km9qWSKsc1w4xgtFZeIZszaQyGSoySoz4cdNDaE2QFHh0u48M9/pJ2T7O5ToEsO/a3SRTNgdTHGaneDn0Lrlqq/f6RUQjXvjLjhuRCELNhDWbFPd3Dmfo8GNJ02jjnY+S+YrVwt2b5S+ozpFD4bNKcqg4WV08V0VGnNvKzPKPF6NtuQjNfsGsc1qCGVnoRovsla2MFxKQB/ANHAtCfZuDGy+DQ8vg50UqoPkx52/MnQqNHCwsH6jk7zbcg73w6kdoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <10f43cc4-7a09-9f4f-0a6b-fd7ffd88310d@suse.com>
Date: Mon, 11 Apr 2022 11:36:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: [PATCH 3/8] VT-d: plug memory leaks in iommu_alloc()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
In-Reply-To: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0040.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::17) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 950c6d75-ecac-4771-7c14-08da1b9ecad8
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2457:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0401MB24574513F65C57BCCCAD40FEB3EA9@HE1PR0401MB2457.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	obY6t5IbgFK8u0LdxwRleVsbxyDuAAhLmLUvXt+wT/PQo4Kpvrotb8ux3+Gs1gpcCHWcrlQqGbflQUWD477CahsGbyEu2wU3Vv/4vPYy1rLon34Zy6HZIr+EZC9D3hyDihouuNej71+a2K+O0sjToypjlsuHZyvTvN0+1WEN++S7e2haspKzusu4m/RbguqnAL/W88Vk2Q1590dFaWQyhKrFc6Rc93zlEjh2STQgLmbRHEtXnZECu9y+xkGYCYXKqwCXfy58ur2rJO4N+9djJFqgBhDjAnQ8sNlnPryw322MfsK1G09df/qQiGxWlshPhROk/I8vyHmcRv8M14kochL5+pvUxrhctLWCi2nFWKuBXMN+jqKQFw84ijObl2pS5EOralmQvfblFsGakgn8BOXxGvLBgqNdmpqA/qSupV7sFEszEyW0uZrG8S0+WswrJ5kwQyC2J3D5HAc86Vvuu2411czLsq+fK3MCB66J2Y5L/k/WeQSoaBTre7bIZlPil7CpaC3kElYnOxr1+gP4iqy69USiy1AbvdyU/vonT1xRQmCoNSHsPhGjXFGkp3iB9wKdUvth4Z0UO6XuqqrWhuYHzSXmsGe8NCVogiCtbTxSWsJlMYvEBcw4XzgNbA/5h9AS8KkRJXC382+EQ7nPAVkOTrRhSakVXcqAoV4kinXS6clLcrUHf89XhNlzsSx+hXBJNXii2pa1/WUmlEVJnosc2CbHMDeCHP2gNr8sQSGcJD7uPGexww+8srIBEk6T
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(66946007)(8676002)(31696002)(5660300002)(6916009)(66476007)(66556008)(4326008)(8936002)(316002)(86362001)(6512007)(6506007)(83380400001)(186003)(6486002)(38100700002)(2616005)(26005)(54906003)(508600001)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bm9BcFNqSDhqcEJuckpJYk1QWUxoT2hkbnBjQjk1NjhRb2luRkF4LzFUb2No?=
 =?utf-8?B?VUZXVyswTVlldElVRytPODBNMWxHK3YzUlNkUlNxc3BsT2tMRVlvVmo0ejVv?=
 =?utf-8?B?TUdvZHFrNHZrM3dEZUliaHRyc3pVUUNWcnU1WUpIK29GbTJMM0g1cGdwUm1H?=
 =?utf-8?B?dnJkcGJBRXpOek1meHpNYnE1dEhYSkg2cXZQNHdLMFk0YXdGTlFlbmZGOWR5?=
 =?utf-8?B?NUQ0ZkVYUm96Sy9QRVJ5UlpJaWNFakgyN25tOGlTeDg2aWtzTkMya1hldzV2?=
 =?utf-8?B?QWZ6dnFpMHdrdGpESXhpV2NBL0Z3R29icG52bXRib0pSZGNnenB2RFBILzVq?=
 =?utf-8?B?eS9PTmJmOUNuME52NWFKbld4VFJvV2hDV29wTEVrUGRaNlU5YmlLRW1IaVJw?=
 =?utf-8?B?ZzRmQU50YjdkbWdrSHc3TXRwVXhNbkgvNzlQblFhVmgvQ3E4aXJIcHNlRWU1?=
 =?utf-8?B?M1k0djJCMk5wdlJPa0RhL3NlVEd6c0MxOWRXMStsM29NWHdleTV6Mnk5VVZW?=
 =?utf-8?B?RG84bUtpY3NPd2Y2MGZVb1dQT2xYallsRm84ZkN1b3V4aFVhQjdPTDN4c1VU?=
 =?utf-8?B?ZHNXbHBpVnF2elYzdTV4MDFDN3BZT2dIUU5CdEFGdmdlWmRuYXRraW9oT0RZ?=
 =?utf-8?B?bW50VnBXTWxhT1pYMURKaUlCMGdGNm1OejBrUTllSXMyNHhrT3FGV3MrcWpV?=
 =?utf-8?B?V1pMVDRhYWRpYVpBTGFETzBmZkxqT0U0cVY2eWgvOFhycUZXWEdaQUdzTHlP?=
 =?utf-8?B?a1V2T1hlOXAvdWpxOEVsaXE3WGcxdVpMSncrMWkvSk5SMHM3eWM1d3d5dHU5?=
 =?utf-8?B?ZU5qMUlpTUpvZzlldEozL2FNYUxIZ25EVXlseEZjVVBObUtlZ1RwVGJpeGF5?=
 =?utf-8?B?OFU1ektrTlg5KzNUajBiS0NuMWdhdklzK1l0VDZGTlpXOXd1d3FSeUV6MW1k?=
 =?utf-8?B?Zzhud2NPS1ZwRjBzWGs1dmxFTDdUM2RkVml5T0w3cTVYa1BDeDZOOCs2Y0Ev?=
 =?utf-8?B?amxyai9GaW10a3NOaXByMWcrU3Z2enU4NllSRjVXRXNaYVpqeWQvRDZ5MkFB?=
 =?utf-8?B?TExqY2l6VEhpd3Z0WWtqNEdSNGkrZStuUjR1bW1reWlJdlBGQTZhZzdDVHhF?=
 =?utf-8?B?V2lPT1dEamprOUtMbnNsM2xvSG5UNTQzejFIak1NZWZBOTZMbUVUT1RMOWhi?=
 =?utf-8?B?N1d6SUZlY3hHMVRjYVNYOW5ucmN1VU5vL3U2WmZ1cWQvY1B4ZEF2Ujh5VHRC?=
 =?utf-8?B?S3lxQ0w3MjU4d0JVc3psTUtQT05uR2QwMWFoTVJPaG85aDk3SUZqNHF3OFQr?=
 =?utf-8?B?Z2kxWXpkeWxHOXZMUWFiU0tJdE1ra25oV3ZScTVOSnp0ZXBXcEs5dS9BYU15?=
 =?utf-8?B?QkxYNjM1WExKWGk2aTNMQUhpOUZzUSsvL0Q0anB3WC85ZGdJSWdBQVFyb3la?=
 =?utf-8?B?NHNZRmYzZEs3bk1Jdnc2a0hCYVA0Um1GODR5ZlpVdUpuSkVjZUNSNlZ2M1BD?=
 =?utf-8?B?NlFVT3pKTVpTK1M3QjNiZHh3UFVrcHQyTmcybmMwVmJPVDhkbjJSZTdNWFR3?=
 =?utf-8?B?ekRYc3NLKzFBM0VrMHVwTXNsNjBadEw2NEs2TWFMZCtTNEtCN3NMNDR2MExC?=
 =?utf-8?B?NWVnN0VSYTlta1I3dEtDeEhwSEJydGRBWkFhb2hoRVYvYVdEVUNTbkdUK21q?=
 =?utf-8?B?b1pRWXZ6ZVVEWU9PS3ZMVWdmOXlkZWg5dEJQMjh2T2Y0V3VsTm05dkdiQnNs?=
 =?utf-8?B?UThFZkpsZzBKOS9KM1RuN0Z0Qk05OGZscU9KN0ZlaFlMRGpBcGErSGNzQ3Z2?=
 =?utf-8?B?NDdGdTkzY0lNSk5ZUlUrYlVOMmsxOUNWMjg3U28wQSsxcHdWYzRFY09pZGdY?=
 =?utf-8?B?RFJkWXllSkVxWkYvVkVtVTQzNkJ4eWtYVXJJRG1WZWs5VVBRUzdNQ1AxQThC?=
 =?utf-8?B?d3d3VDNMVjZPaXFzWlp4NmtrYm9JSEQ4NEV1VUgzcWlQaWdZa0JwYkhTbzg4?=
 =?utf-8?B?Ym5tRnRKRDIya0hLTFRkNDJ3QURycGVsMy94R3QzZGZPdEpVcnRTN1J2OHBp?=
 =?utf-8?B?Wk1DWjJUa3RtTlArV3ptWVBsSk41NjJRdEtZWVNNeWRXeEc2T2hnOE1XZUhz?=
 =?utf-8?B?OUxWV09GTFBmQnc1TjFRbGdpQmJPNkV0SE5ic1lHbHU1ZkVuR3ZybTIzR3lr?=
 =?utf-8?B?d0pteXFGTDVmeDl4ME5rTnp2UUV4MCtSblhHVXFGbWxoVWtGWVNwbW55TUI0?=
 =?utf-8?B?R0h0bXNKbE9GbE1EMWp3YjJCOTdLak80WFRDSGtSWnlvZlVlL0w3Ym5hUW1U?=
 =?utf-8?B?Z242YVZuRzdDU0hOSnFDQllxZ0NMUlQ2bVRVRWhqTEJuZDBKTzB5Zz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 950c6d75-ecac-4771-7c14-08da1b9ecad8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 09:36:44.9385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BpIIM1C5pDpEjrlV0/H+9/SlOts+Wlj56MEf8UR5QJihAC/6i+r4DHUb2r3X12IzDAOXKguONI1BoU1JTT1l8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2457

While 97af062b89d5 ("IOMMU/x86: maintain a per-device pseudo domain ID")
took care of not making things worse, plugging pre-existing leaks wasn't
the purpose of that change; they're not security relevant after all.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1238,8 +1238,9 @@ int __init iommu_alloc(struct acpi_drhd_
     drhd->iommu = iommu;
 
     iommu->reg = ioremap(drhd->address, PAGE_SIZE);
+    rc = -ENOMEM;
     if ( !iommu->reg )
-        return -ENOMEM;
+        goto free;
     iommu->index = nr_iommus++;
 
     iommu->cap = dmar_readq(iommu->reg, DMAR_CAP_REG);
@@ -1260,8 +1261,9 @@ int __init iommu_alloc(struct acpi_drhd_
         printk(VTDPREFIX "cap = %"PRIx64" ecap = %"PRIx64"\n",
                iommu->cap, iommu->ecap);
     }
+    rc = -ENODEV;
     if ( !(iommu->cap + 1) || !(iommu->ecap + 1) )
-        return -ENODEV;
+        goto free;
 
     quirk_iommu_caps(iommu);
 
@@ -1272,7 +1274,8 @@ int __init iommu_alloc(struct acpi_drhd_
     {
         printk(XENLOG_ERR VTDPREFIX "IOMMU: unsupported\n");
         print_iommu_regs(drhd);
-        return -ENODEV;
+        rc = -ENODEV;
+        goto free;
     }
 
     /* Calculate number of pagetable levels: 3 or 4. */
@@ -1283,7 +1286,8 @@ int __init iommu_alloc(struct acpi_drhd_
     {
         printk(XENLOG_ERR VTDPREFIX "IOMMU: unsupported sagaw %x\n", sagaw);
         print_iommu_regs(drhd);
-        return -ENODEV;
+        rc = -ENODEV;
+        goto free;
     }
     iommu->nr_pt_levels = agaw_to_level(agaw);
 
@@ -1298,8 +1302,9 @@ int __init iommu_alloc(struct acpi_drhd_
         iommu->domid_bitmap = xzalloc_array(unsigned long,
                                             BITS_TO_LONGS(nr_dom));
         iommu->domid_map = xzalloc_array(domid_t, nr_dom);
+        rc = -ENOMEM;
         if ( !iommu->domid_bitmap || !iommu->domid_map )
-            return -ENOMEM;
+            goto free;
 
         /*
          * If Caching mode is set, then invalid translations are tagged


