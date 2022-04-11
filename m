Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF524FB7D3
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 11:40:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302797.516573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndqXA-0002BQ-Us; Mon, 11 Apr 2022 09:40:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302797.516573; Mon, 11 Apr 2022 09:40:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndqXA-00029a-Rn; Mon, 11 Apr 2022 09:40:32 +0000
Received: by outflank-mailman (input) for mailman id 302797;
 Mon, 11 Apr 2022 09:40:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1peA=UV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ndqX8-00029U-OG
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 09:40:30 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c71e83e-b97b-11ec-a405-831a346695d4;
 Mon, 11 Apr 2022 11:40:29 +0200 (CEST)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2059.outbound.protection.outlook.com [104.47.4.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-c9mMjQfyOAqrDY-zPijx3w-1; Mon, 11 Apr 2022 11:40:28 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB4255.eurprd04.prod.outlook.com (2603:10a6:803:3f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 09:40:25 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 09:40:25 +0000
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
X-Inumbo-ID: 6c71e83e-b97b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649670029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uRgxPutiiXf/saj/uPcnRpqmyyUE+aGnEJJuikrPuyY=;
	b=boReclB7xzohkKsbguMNvdfBtD6ydU6AM3Ta2mygW9/xzHzyTipfza4CwKMG7lkFwRqmjr
	or32k2ep0j/IVkzCvFGXmPaWmq7KUn5Zwl/jMDdXD98hrYV91ge/kwxbf/ED7tJ/kuKIx3
	LP2auhQtuScgzKNTvaIwwe3WMguixzY=
X-MC-Unique: c9mMjQfyOAqrDY-zPijx3w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cj7XvMeYAotiN0cRAts3A3/X/fxFqCpO3A77Ueeylxp3ti7SZIAHoHk7JIF07kIffBBdAKUifSmEafLJ9UnDR9BPN7AVa8O2EAvR3UR9boq2lQB71YdYDVY4lmYqIeSe5xL/4AvWHM5Ep+SDTzGfWqJcXYyq2Eq8H1LLqprLzo8WjI+ZflQMnktVgV4LdH6gV2StBpJ6KvkqxKPuKLKigAwpQqRgXoEhBx5TzlWjRQXrIdW4jaVf+ZBkNReLaQutS3Wo/x0LFKilBK6dVf95fGhxXKDvM1b/CQeenHRxkefRGADz1JVSJ0xFqKMRY8d5KeQcm636x3kB7TKMcpGsQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRgxPutiiXf/saj/uPcnRpqmyyUE+aGnEJJuikrPuyY=;
 b=aIKHyWPNH//hDystYO6BUpgaOVIUMXoLK712SjMlBuTndoSHCyWgaeFQtWmefNnYsSiMm2KOASReqe16Hh90abcf8Td0aGet714jP88YQocmEtBeI9iPpjRPFoD2DV3VtHEEwk2yKOn7wXnk7gPB3risP2g/293oxgXsBkvW5dH3nEgvNVba1ppqCHuXkyRE13Nv/1yRmnMWXk8eNjko72kfuo/qPK9Ur4HonFd/H+0s6vMRP/DelyPPAeg/9DtUHHMrR/OPM4rZFH+HHCKHEj1DDKGrDVzJxPpJkOv6ALvAnXjh6aeEVfMpnmg0J/WKMibWa6xhKbbGWneZTn6VwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <452b42cb-56a5-3f28-989f-c02e53334447@suse.com>
Date: Mon, 11 Apr 2022 11:40:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: [PATCH 7/8] PCI: replace stray uses of PCI_{DEVFN,BDF}2()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
In-Reply-To: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0067.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::44) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 200dc4f4-e19b-4789-641f-08da1b9f4e89
X-MS-TrafficTypeDiagnostic: VI1PR04MB4255:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB42559137A13CBDC62A1E9B0AB3EA9@VI1PR04MB4255.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NvkFD4KO5QOPvZAK6YRJN3ZgJ6X9LbusCnJGo8mIZUVh/ii4FQ4UktnlyYv7iLik+Cs2zKKGDOGw1yBQCXYWKWzIspXpDtGaVwpJ0D/cPlOnZM5/3XrSA5AmIWHfFyPO2QudY2EWoNsGCce3EI0u9Gifbe+cuTVKflmTinCAidpMVocuCWlHa/kaS8F6+ISIkb45mltR3uAgWVk1uPRkNcx+aJ0T7759shX7ekOdgECl2jIsynl1KIQnKJQ+fQVvhh725K8Hrg0CItGouEJBUBDDQMPI/H+QwXUNfsKPsOP6hyA/Qbt45nCQOv6TCFEZUvmkw2A+/N6tKscmd+9WgU7BOqZGRxsbjOcUbBTPkzq7Vl08kaT9R7KTJZtTOiuzJ/lIVwxoG5COCrXct0bSoeUOcSmUYriUJIFB419b3ua1YnHdPU0df6/8RwPSh5+o6qykE2EsFZjio8leouvQ3aY4vSeEESRo9jLSzCDn8sVFK3GgPink6n2n4rluAUk2J1dHUsjAyRPm/j0lz3BOnoJItpLQzAHh6cEm79cwnOXth7d+Tbkmsw0JdRIKCh4UrQ3xUOuVPfPTONPZHXXgvhVcwYgDWMIke1Kv0i+POu0wNO9o3brK3WIAROt0iBvCdXs+WzCUWtwjVqeP0Qn8alxlExlZirznG5LTqhbo2j3fgXtv+pJ8GgsLJHTDv8kOFzWklM7qAgFkwy/r1FfJc3/ff88gyNK9wpU3DzHb11NL7pvDG3Cr5UeGpY/VNmMM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(8936002)(7416002)(31696002)(38100700002)(2906002)(5660300002)(6512007)(66476007)(316002)(6506007)(26005)(54906003)(6916009)(2616005)(186003)(36756003)(508600001)(6486002)(66946007)(66556008)(4326008)(8676002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alI3R2ZFMksyOCszdVJ5WEVpME4wek5iaFhubkErR1FUOXpVMlFqSVhybjB5?=
 =?utf-8?B?dHl1V3Z5NjdUQTJnV0pqYjg5T2N4WXkvY2dGQmxrRXVoN2hNSEtLOU1FYWFm?=
 =?utf-8?B?bUNCaFhlUjhLKzNydnhjOHBFN0l0bCs2Zk9ZSktaNW81Ui9QcjhJWUNscG82?=
 =?utf-8?B?dzNET2hHTDJPRVYvUVJJQmJVK3BmeHI3U0xTU1hmOVJiUzBuK0N6aUNPSnNj?=
 =?utf-8?B?TkNkSUR5c0hSV1IvaE9wcGFUcGJLbEhzVUFhcUdwYnhScXRod0x5eUROMjRx?=
 =?utf-8?B?OWJkeEI3YXNaeUtxamQvNFhWdUxCbzNWeTdxbXZaRW5mMGtWdmFkbzlDTER1?=
 =?utf-8?B?bmhURDJ6MGxtMFFKQjJudXVobHRheFpmS0dxNWFxUFB5T2NsSE8xZ0F0TkNt?=
 =?utf-8?B?WmRBV1BQZTdGbkFFaDJsU3hSUkhsbzRBTUpGUklpS2dYeHI0MTBJWGFJam55?=
 =?utf-8?B?elNjbmc0aDhoYTkrK1FHdE41K21XUDIzRXRpNGxvWm9jNWZBQVE0OHArZVhL?=
 =?utf-8?B?QmhjdmdGTEFlZkUzbG5uOTRUcUdYS0dXd0wwdjc0azU3NXhqOFowdXhEMDlV?=
 =?utf-8?B?YmxybWErWnplOHpxVFo1MGFCZkFpMCthUWVUNjNrcXZXN3BUeXp2emxJMmJr?=
 =?utf-8?B?MEo2Nmt0U2tjb1hMemxNbDRFU3BsYS9yWm1aS3VqanlVSDh6NldxbFNEdG4z?=
 =?utf-8?B?ZkZJdThGWEpZMFdoaGpyZFVqTkZJRkhTT1ZMY0dSVDJuaWp5VEcxQjVmZWh2?=
 =?utf-8?B?bEtzYUtWOUdKWDV6OGNYRld6T3N6K0ZjNGl2MUpBOWZjODBLM2hMUStlNWR3?=
 =?utf-8?B?RERLdWhUYXhnNjh4L3M5SzdaNTNlaXZ6eU9KVmNLN2RZOW01UCtCMTQxMjRT?=
 =?utf-8?B?aHBlUjVacVF6aTdtUWdheUt0ankyRjhSYlhxZVJGL3hyejgrbWtFbDh3Q3hw?=
 =?utf-8?B?aU4rckx5d0plOXlSY0ZVdkVoTUhRZXdjaWpKSDZwc2hzTDhYcU1PMm1qa2Yv?=
 =?utf-8?B?aHkvbkwrK1Vib1M1N1RIV01TeUZDZmJMZ1JtRnFmWWIzVlZTNVBkSFJYOWpL?=
 =?utf-8?B?cnd6SHhYNFVlZ252T0Qzd242OElwUjB5eXJ5ZEYzdmNzREd3dVdlM2FQWGJv?=
 =?utf-8?B?eml6T1pEMlpzbWZSbk0ycXZOdG9BTzA0MjhtNllLWUl3YlJsaUl2YUExQ0dF?=
 =?utf-8?B?ZjhBazZXeVc4RTZlVE5PaWdjVmdqVnUxNzFUNDRQS3N3T1duRjlIQUtPMTlr?=
 =?utf-8?B?eDcwbGhxNGJSLzNPNVRPdmMrMG1ZWUpmU3c2TnIyZHRXTXVPOVkvcGFXTkJa?=
 =?utf-8?B?bEt5VnVDUzczcXB6VzBZblZ5R1pDMERST2pENUdxaUE2bVRNVTlsUVQvLzUy?=
 =?utf-8?B?YzFianpsdG5aOUVpdittKzJtU0c0VUhINTFkTEs3aUxmQVZON2tQNTNTMVVm?=
 =?utf-8?B?VHpQd0U3dTJMVXFlL3BmZExtajl5cHRmdVF6OTFWZmR1S2ZHYXlmK29mQ3N4?=
 =?utf-8?B?RG95QWQxQTVja0cvb0dLK1prcEVsOEZYWTJ6bEswWTluUUs5cm1YU0x3OXl0?=
 =?utf-8?B?cnRWb1A0dWUwbERLMFRLZzQwcTBvdWhVcytUd2I2TER0dW56WEcxaHZsajBk?=
 =?utf-8?B?QjlLT1ZON3VZQ2lpUlhHWUJsUDcwa1RGNm8wc1NNODBkVDZGcnhEL2xQMHBm?=
 =?utf-8?B?RnpGQ256RXU1VWxXNHVLRFRjQnliYzRTOERIQ29OL3lhSVBBK253Z01sdmRw?=
 =?utf-8?B?UTJQTnhreEFNV1g2eXlETk1iakdSSGErdDNsWTVXcGF5Q09UTjV1ZHhRYjRy?=
 =?utf-8?B?empXNWJXS2tjMWZ3RUVVbWY2WmthVXl3SVRTSUxNcU1iZE1FMXpldE9HUGM3?=
 =?utf-8?B?QVd1QVBlUFN0c2JzQVk0cGhkRkdGWGNoZXpxUVJXTU13MnV2STVSK1JTSisy?=
 =?utf-8?B?TThNWEpLR0hrd296eUxuTmZOcGR3QjY3N3VSZnl4dVAxVC9uSm43NjIzN3Bt?=
 =?utf-8?B?R2QwRjlHenZDcWQ4MlF0QXhSenhMUCsvTzdrckhXMmNLUHg5ckRQT0R1NjY5?=
 =?utf-8?B?QUpTeDJWa2JOb1NrQ1JDd0FRUzNUS1FzV0Q2YXhJUkpyS3ExZEFRVmw1aXRT?=
 =?utf-8?B?SStiTUNvSVZyTjVaWnBYa2dNS1VTRlpyVDBNaGpJUjVscW1ab3JtNDlDUkFo?=
 =?utf-8?B?YWNLMEFPU3NFWTVLR1JhamROWUs5VlJ0bnQwMzNiR01hVnVqbXhVRnFOUFhk?=
 =?utf-8?B?U2VWSlJDSUN2SWJTejJtdVJiaVZvVmtKYnhlQlp2Zy9MMU5qV1I0WFFyTHlN?=
 =?utf-8?B?bHhuQVRnZWVvVW94Z3JQd1RoZ1NhbXJESXdwd2ZxUTNHdm5NV1BFZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 200dc4f4-e19b-4789-641f-08da1b9f4e89
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 09:40:25.8816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u9iOVVYnU3u5MogYqurO8HqxYoN6UhHKXvtwQEukx0Qv3tnbHdLIlU71b4d/qgTzLZEcnBobTKIGPH9vXrfm4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4255

There's no good reason to use these when we already have a pci_sbdf_t
type object available. This extends to the use of PCI_BUS() in
pci_ecam_map_bus() as well.

No change to generated code (with gcc11 at least, and I have to admit
that I didn't expect compilers to necessarily be able to spot the
optimization potential on the original code).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Note that the Arm changes are "blind": I haven't been able to spot a way
to at least compile test the changes there; the code looks to be
entirely dead.

--- a/xen/arch/arm/pci/ecam.c
+++ b/xen/arch/arm/pci/ecam.c
@@ -28,8 +28,7 @@ void __iomem *pci_ecam_map_bus(struct pc
         container_of(bridge->ops, const struct pci_ecam_ops, pci_ops);
     unsigned int devfn_shift = ops->bus_shift - 8;
     void __iomem *base;
-
-    unsigned int busn = PCI_BUS(sbdf.bdf);
+    unsigned int busn = sbdf.bus;
 
     if ( busn < cfg->busn_start || busn > cfg->busn_end )
         return NULL;
@@ -37,7 +36,7 @@ void __iomem *pci_ecam_map_bus(struct pc
     busn -= cfg->busn_start;
     base = cfg->win + (busn << ops->bus_shift);
 
-    return base + (PCI_DEVFN2(sbdf.bdf) << devfn_shift) + where;
+    return base + (sbdf.df << devfn_shift) + where;
 }
 
 bool __init pci_ecam_need_p2m_hwdom_mapping(struct domain *d,
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -839,7 +839,7 @@ static int msix_capability_init(struct p
             pbus = dev->info.physfn.bus;
             pslot = PCI_SLOT(dev->info.physfn.devfn);
             pfunc = PCI_FUNC(dev->info.physfn.devfn);
-            vf = PCI_BDF2(dev->bus, dev->devfn);
+            vf = dev->sbdf.bdf;
         }
 
         table_paddr = read_pci_mem_bar(seg, pbus, pslot, pfunc, bir, vf);
--- a/xen/drivers/passthrough/vtd/qinval.c
+++ b/xen/drivers/passthrough/vtd/qinval.c
@@ -267,7 +267,7 @@ int qinval_device_iotlb_sync(struct vtd_
     qinval_entry->q.dev_iotlb_inv_dsc.lo.res_1 = 0;
     qinval_entry->q.dev_iotlb_inv_dsc.lo.max_invs_pend = pdev->ats.queue_depth;
     qinval_entry->q.dev_iotlb_inv_dsc.lo.res_2 = 0;
-    qinval_entry->q.dev_iotlb_inv_dsc.lo.sid = PCI_BDF2(pdev->bus, pdev->devfn);
+    qinval_entry->q.dev_iotlb_inv_dsc.lo.sid = pdev->sbdf.bdf;
     qinval_entry->q.dev_iotlb_inv_dsc.lo.res_3 = 0;
 
     qinval_entry->q.dev_iotlb_inv_dsc.hi.size = size;


