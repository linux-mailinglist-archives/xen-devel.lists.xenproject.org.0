Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBA63F6006
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 16:18:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171431.312832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXFI-0004IO-IB; Tue, 24 Aug 2021 14:17:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171431.312832; Tue, 24 Aug 2021 14:17:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXFI-0004Gb-DJ; Tue, 24 Aug 2021 14:17:44 +0000
Received: by outflank-mailman (input) for mailman id 171431;
 Tue, 24 Aug 2021 14:17:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIXFH-0004GS-G5
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 14:17:43 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f0bd4b8-3fcd-4e5f-bffe-b175b5416be0;
 Tue, 24 Aug 2021 14:17:42 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2059.outbound.protection.outlook.com [104.47.6.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-MfshqG-DPXO7VbwtrUVzRw-1; Tue, 24 Aug 2021 16:17:40 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB4609.eurprd04.prod.outlook.com (2603:10a6:208:6b::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 14:17:38 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 14:17:38 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0045.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Tue, 24 Aug 2021 14:17:38 +0000
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
X-Inumbo-ID: 2f0bd4b8-3fcd-4e5f-bffe-b175b5416be0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629814661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yzXYKglQ/bpvobkPyhRsuEn/vZoH5xfWeELRjaeoInI=;
	b=ektAozKg2Lqi3vwaes/IDWZ4femcNzjTbpgALjDL4ZpaKjMVV8fnV5pwjNZauaAWAyJeP0
	Kboox2vyNhvOdm3qhv6qSfx/aVpe3yjIZY8eeAbQueylBoUERACW0pXEAmR6a3pybgRbOj
	jYiPTV/OkYjYEZjoxf3+u94eq0IUqso=
X-MC-Unique: MfshqG-DPXO7VbwtrUVzRw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eciHFL/I4HJEetF18JJwbD/fWCtNuMpbAe1AnrKZZSJjKjbCRBlI5/4aLpH54POEpAF6oDDq/9uEQ8hC9rFnva45Gcnq4xAlxw79aIjbiwmd7NwbNq8kH3aWei9hL7h7FQDs/toPdoQFGMgiqrjdRx+A5vI5y1tgQOQTBBH733r7JYJcplwevV56REs3krXz1xcVf6dMsfv7WnzwXYF3Ut5Bf5FIUFWQzESpAxTp51BXtNNuCCvvwp5fp9ed75HZ0890GhEO/ap0gl3t9gpZ41NTLtlioGuVUvoduE5Yc1UMmazvGYTCkJNmVd+ya4bSpQyp1wnBhCrhOlDA697Gmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzXYKglQ/bpvobkPyhRsuEn/vZoH5xfWeELRjaeoInI=;
 b=VxmHQDoCt25kiFkLoWX1AP2hZe/m6KOxGHjWbodGsuN3pnJyTuYgkuruRFlV0Aus9d31BMNtjtqp6qPXM6D2UzTW8vT4SjHr1dNJRQanB5IluLDveNIz6nqCK1dMixHCeUNoheju8w1OhFJ/NYo8jINFidYtne8gH/QOmAmsGRueAUxpkj0AA7CRFdE4a+OQqmWmFYne6uMHO9kSOJ4yoV7wn8bcjCBAFfYGJuLiQ1jE3Wr7wOsafQFTi3dG0giHXQLSY4gsbQkRKn2eMp+y44JFm/LiXldyclpJ7hQuQN3D3uYY/UZbzSd04mAtnOl9q7KAKImvJEyWRm4FfQAlxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 04/17] IOMMU: have vendor code announce supported page sizes
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Message-ID: <53c5e1b5-b363-d2c0-edbc-f9fae1e6e2c1@suse.com>
Date: Tue, 24 Aug 2021 16:17:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2P264CA0045.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::33) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29d264da-261b-4c45-4c22-08d96709ed79
X-MS-TrafficTypeDiagnostic: AM0PR04MB4609:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB4609DB5F025346C29F1930CEB3C59@AM0PR04MB4609.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nW6v5Fgsm5oBEnth2JV8rSYA4iU/GVqt5ztAgs8SNkVtZNiX7QnTsDd87mK7nKwsfcqitO2C/8Zn+36LJz0HbxTefBo74H00iZHHLhOIqDS2vhpdbNpZZg1+zhAMjBucUzucDLiYOryL9MW818ZyeGjhzvbdvODzRYGOaLRltbwrtJhOpE3zotJXlJwrnbShrZGPf4Nm84Ny2pLkUouamb3wi+5TuJtrM3+RphlcBX8GIvVoGyWGsyik6FakFbJ+ymSt934Da1sRve4u1jYeoKhk/nKNTaYTWb32irkKdwG3ee9bZR2qjkyJPfW6hWFPQHBrjaKFTvm1a6LBW1YHQyNo9BueAlUQ5qRbIWE0+VKlC+5mkgZycMjFwgU2Ryy5oOJBEWDvQG5MIb2RpantSjiuiDwmtaAeZPnBHQ4lHta4dhguXmvBB7C6zMSidbkZteUmJtfFrNwnHpAzjHkt1XiE1AbKy8QoCT4vPWaJScD5KHf8BfUuplIaKpejiOHixWAsqZFsBz2HerKs460z73QCs+fVNUU/1HK5V09/fKrvfNqyad0FJQCsK+zj4COCweb+RWxYXqTk4GYYaN+KK1dVjQBAqT2hn1uPrrclwjxlbh4DjePpyVO8MG6vjBJo2Yn6MTqn/qaMC+cmtAyaALSEXvwAxwgl79gFjwtPiMEEGP9SCw3uvywPZEG1JuA2UA/Pheo7zu2YnV937ON1IVoIRIE8Sz02GBX3ojojLts=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(346002)(136003)(376002)(396003)(2616005)(186003)(83380400001)(16576012)(6486002)(956004)(38100700002)(66946007)(6916009)(54906003)(26005)(478600001)(66476007)(66556008)(5660300002)(316002)(8676002)(86362001)(4326008)(36756003)(31686004)(2906002)(31696002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVNDNkl4cWs0blpxcTZ2SEh4TEpKZ1FoOUNRVDhrS2hTUER5Z2RDL0FDbng5?=
 =?utf-8?B?Ty9pZEZRczdGV055aDY3eWdNSXg5ZDJLVlZhbVQ5TUZEZDZwRkR6YWozQWtU?=
 =?utf-8?B?RFU5eE4rNndrV0RiRFg4WHp1TENIdHUyYjlvaStmbXk0WWhualNnSmoxOGhN?=
 =?utf-8?B?MW1QSjJicXlRcmtzVFlvWmh5KzB3S20vL1FHSHpBdzVmTUQ0U1BBdVhiNjgr?=
 =?utf-8?B?WHE4bG9BTnVxNnJlQzRNSklZQUQxV05ORlR5K2prUHI1amduZmpNNzdIWW1C?=
 =?utf-8?B?ZjFGSkt2VWdFZWd1c0lmczk2bndjTzRnSkl5SWtSUkF1TFEyL1dOcEFOV01U?=
 =?utf-8?B?aThOWHM3emVYMEh5YXdUazlobGRLMmJ2YmVlbk4wYTlXZHVhM20vQ3pNeG5v?=
 =?utf-8?B?NThibDF3OGdQT1pKOEswV2VrM0c4Z0JMc0VwVnBFbkRQNE50dE9va0FtUHpl?=
 =?utf-8?B?QytpRWJPcUxOOWliRWtScDBWVGVHbTVCdmVyb2VvZ09lRldZZ3hCWkRtcTll?=
 =?utf-8?B?SjdaZ3UyemxJM2VaeEdMKzEzRG5jWjZnRUJLUDB2bkw4YXJYS3p1YkFrSVFH?=
 =?utf-8?B?eGNWR0JtMHo5Nkc5QW9NTEJZRm53YXkxQUhvaUNsNVA3Ri9sZkQwaWdtdlg0?=
 =?utf-8?B?cHNrdjFUdTlJUzR5RHNqSnFBL0tCUjFkOElXQWt0NkVWdVRZZTUrVjc4cUJy?=
 =?utf-8?B?ODBaQ25peWpFRGZpT1dyR0xrZVQ5L0YrdlpmWE96bGwvdDQ4MXFvSERUdVBU?=
 =?utf-8?B?S1M1SmY4a0puZVhlNStBb2R6T05sVWdzK0oyYmRoell3OXpXek1YSDNiS3VH?=
 =?utf-8?B?TGc3MXRSM1Vzenk3cmpKOG93bjlHYW9DcUFXL3R3SlZPS0o4cFMvTXF0YW1R?=
 =?utf-8?B?WTBHakZjUFZuZjFBbDFiZlhFbDlZU0FvWHEyc2dmNlpleWU1UnNsMlc2ck1Z?=
 =?utf-8?B?NXpQRk9PcnI2NVRQQWh0anVDQlVRbnBla3d3SGFPdEJVb3pzakdsMzlwWE5G?=
 =?utf-8?B?SitoS3FmR0J2NUQ2TExISzV5b2xFVlgyQVQyRWdUR3BzTkNZTnZubkV6VUZI?=
 =?utf-8?B?VzhMK1pSMjhZL0FmMytBY3Znc2RwNjdUQSt3aSsyME1IME91VEFKei9GZ1Q5?=
 =?utf-8?B?OUpJZjdwcVU5RlRKcEk1cjJ1V1FES2xEWlAzVk5vVEtBcWgraEIvbm1uRzhi?=
 =?utf-8?B?V0J5c1p4bkJIUnpjYmEvQVZSS0NJUGRjWmt0NHIwVEx2Y0ZkZ2ZTR29QNWtC?=
 =?utf-8?B?VWljK0QxeFh2MUI0Qm8ydnp0d0doMnhBR0IyUWFjb0FVdk05T3NLeDJraTdL?=
 =?utf-8?B?ZXBIWlEzTHp5Zk1uRTA0VTRwWEdIbUV3cERzWk9GRjdoY1J2cG84ZXVyRmUv?=
 =?utf-8?B?WC9qVG9NMktwWDNJUXE1dEhoTDBCcCthNEMrL2dOYzhZbmhhek10MEVjNXVJ?=
 =?utf-8?B?NWJNQ080TnJsNTVhN0VQVkd1dHlkM2lzcTJLTTFaWE43RTBSVk1Qb254b1Fi?=
 =?utf-8?B?Z1N3cUhUVjBXYWQxSmV1eTdiR3dHdHpLYlZtNVVuSWdXZFhWaW1EUU1DckVM?=
 =?utf-8?B?Q0svZ3V0bUNUSi9IbXFQSUJQcHlWdkY5QU5BUk9LcGhmaDQ3ZWlxRFVoeUND?=
 =?utf-8?B?WExjelNqK0w3TS9nbGNvZ1ZMQ0FRTW9vSEVBcFhBb2pOUDFiNUw4dFFEODd1?=
 =?utf-8?B?OVhnMTRXQ2VjNFFLNTlpTVl4YUVHMm9oTUl5NXhjVmg1dUdwZ1kxYkhsZ0xV?=
 =?utf-8?Q?aIdcCkVicP3Htna5rCRBdNve676xYuq1wnbWagp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d264da-261b-4c45-4c22-08d96709ed79
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 14:17:38.7301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uCQMlMXPDj0FZBTT+GF6oDoufAOXR9scX6wMEEiVgIYtJ/rBgwbdAkn7Q3RQ5tJNek+xc3yoglLwydwVr5w8Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4609

Generic code will use this information to determine what order values
can legitimately be passed to the ->{,un}map_page() hooks. For now all
ops structures simply get to announce 4k mappings (as base page size),
and there is (and always has been) an assumption that this matches the
CPU's MMU base page size (eventually we will want to permit IOMMUs with
a base page size smaller than the CPU MMU's).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -583,6 +583,7 @@ static void amd_dump_page_tables(struct
 }
 
 static const struct iommu_ops __initconstrel _iommu_ops = {
+    .page_sizes = PAGE_SIZE_4K,
     .init = amd_iommu_domain_init,
     .hwdom_init = amd_iommu_hwdom_init,
     .quarantine_init = amd_iommu_quarantine_init,
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -1298,6 +1298,7 @@ static void ipmmu_iommu_domain_teardown(
 
 static const struct iommu_ops ipmmu_iommu_ops =
 {
+    .page_sizes      = PAGE_SIZE_4K,
     .init            = ipmmu_iommu_domain_init,
     .hwdom_init      = ipmmu_iommu_hwdom_init,
     .teardown        = ipmmu_iommu_domain_teardown,
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -2873,6 +2873,7 @@ static void arm_smmu_iommu_domain_teardo
 }
 
 static const struct iommu_ops arm_smmu_iommu_ops = {
+    .page_sizes = PAGE_SIZE_4K,
     .init = arm_smmu_iommu_domain_init,
     .hwdom_init = arm_smmu_iommu_hwdom_init,
     .add_device = arm_smmu_dt_add_device_generic,
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -3426,7 +3426,8 @@ static void arm_smmu_iommu_xen_domain_te
 }
 
 static const struct iommu_ops arm_smmu_iommu_ops = {
-	.init		= arm_smmu_iommu_xen_domain_init,
+	.page_sizes		= PAGE_SIZE_4K,
+	.init			= arm_smmu_iommu_xen_domain_init,
 	.hwdom_init		= arm_smmu_iommu_hwdom_init,
 	.teardown		= arm_smmu_iommu_xen_domain_teardown,
 	.iotlb_flush		= arm_smmu_iotlb_flush,
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -470,7 +470,17 @@ int __init iommu_setup(void)
 
     if ( iommu_enable )
     {
+        const struct iommu_ops *ops = NULL;
+
         rc = iommu_hardware_setup();
+        if ( !rc )
+            ops = iommu_get_ops();
+        if ( ops && (ops->page_sizes & -ops->page_sizes) != PAGE_SIZE )
+        {
+            printk(XENLOG_ERR "IOMMU: page size mask %lx unsupported\n",
+                   ops->page_sizes);
+            rc = ops->page_sizes ? -EPERM : -ENODATA;
+        }
         iommu_enabled = (rc == 0);
     }
 
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2875,6 +2875,7 @@ static int __init intel_iommu_quarantine
 }
 
 static struct iommu_ops __initdata vtd_ops = {
+    .page_sizes = PAGE_SIZE_4K,
     .init = intel_iommu_domain_init,
     .hwdom_init = intel_iommu_hwdom_init,
     .quarantine_init = intel_iommu_quarantine_init,
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -231,6 +231,7 @@ struct page_info;
 typedef int iommu_grdm_t(xen_pfn_t start, xen_ulong_t nr, u32 id, void *ctxt);
 
 struct iommu_ops {
+    unsigned long page_sizes;
     int (*init)(struct domain *d);
     void (*hwdom_init)(struct domain *d);
     int (*quarantine_init)(struct domain *d);


