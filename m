Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4573414608
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 12:18:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192441.342881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSzKi-0006es-9C; Wed, 22 Sep 2021 10:18:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192441.342881; Wed, 22 Sep 2021 10:18:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSzKi-0006cV-4H; Wed, 22 Sep 2021 10:18:32 +0000
Received: by outflank-mailman (input) for mailman id 192441;
 Wed, 22 Sep 2021 10:18:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cZP0=OM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSzKh-0006cJ-FB
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 10:18:31 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e99877e-1b8e-11ec-b96a-12813bfff9fa;
 Wed, 22 Sep 2021 10:18:30 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-4xuDO56rM0qlH9jh8_4EFA-2; Wed, 22 Sep 2021 12:18:28 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4190.eurprd04.prod.outlook.com (2603:10a6:803:4b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.15; Wed, 22 Sep
 2021 10:18:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 10:18:26 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR06CA0132.eurprd06.prod.outlook.com (2603:10a6:208:ab::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 10:18:25 +0000
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
X-Inumbo-ID: 6e99877e-1b8e-11ec-b96a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632305909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mKNtSH+m7Ctv8L/JFGkCYRCWB0Q8bcvCLMU0buPXpMY=;
	b=FdPbRCnNparaOijdU1QBj3W4YpoJnoaBNmo5zA3Mshu5LlowSD5oa4D97EH8RqrxRIoGb9
	I9JhfxpiY75EiCSgy4jV1G9zqNtTWx87WzaIVou1I1wOmNm9f6ayK0c8FWXkO/XfvW02jR
	oNa5fw8Mx61y8BFNodtVFNxwU6uek2c=
X-MC-Unique: 4xuDO56rM0qlH9jh8_4EFA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CjNCycKGV86L/ODvBIkFk1QMP8CJdyHhMCiR3RMebb3eb5WGurjawSgLjjwg7bbj1zIyrAbKkFU2bZN6Z/lnPjxSnmucDdoJ6BZifdPx7GqLTKiycQnWydGxBDQXcwHnXT4hpR3zecS8ArXiJwVoM6MnLSsEEuMQQwwEH/R6VWyUAW/+y0xlfcxsP2GUnaZ2cWZzfp9D0f7jRMyam2HZzxZrs1qIvwpDLLBukD///tGOWCp/buR/qNCsRuHZijVJ9miBcDTTZZtDvsiXiqtm2srIXAPS/qIeKw+3JNurc5eKWV/DtYtEshmjxw+reewsAe5MnjZkVr0IGOFiI2H85A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=mKNtSH+m7Ctv8L/JFGkCYRCWB0Q8bcvCLMU0buPXpMY=;
 b=SbeNcyePJ6wZtaGaJMb2cXRq1Useh6PufGpSoDvHCUX7x8iA6OrGGrLdfse6AJz93pdGXAH1ddyKQKAHWgPbrA4AH99ur+l76Y1Fa/VXF1vY7Q1cd8Liy62kq9tyzs8yEDhTbVsH+po2swU7WA782HKlx3uk1EiC9PwII05Vp+bc7nSbHzXmhfQrvIeOtBM9wraaQdTyBgEL5pATVEPe5EhH0BNZMg8wNGmml6vvzpBt2TX4RbCufa0qcHh5Kje15/XvI9+7sUhymthiCbHHJ8qQq07ri9CHWraPcyNim5U719TXB2T3if/XmLotqtO0UNXkF0kbZ4MRGdg/6GN1Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 3/3] xen/privcmd: drop "pages" parameter from xen_remap_pfn()
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 lkml <linux-kernel@vger.kernel.org>
References: <0f0db6fa-2604-9a0d-1138-0063b5a39a87@suse.com>
Message-ID: <036ad8a2-46f9-ac3d-6219-bdc93ab9e10b@suse.com>
Date: Wed, 22 Sep 2021 12:18:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <0f0db6fa-2604-9a0d-1138-0063b5a39a87@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR06CA0132.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::37) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa92bbca-4f8f-4de0-4489-08d97db250a6
X-MS-TrafficTypeDiagnostic: VI1PR04MB4190:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB41900F73443597CCBCD4F93FB3A29@VI1PR04MB4190.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x/dREiUX63gOXj3JmwHyqFFVDYH6WmNYUbQe4/Xkte5PjMylVy4+bokdrN8qgG0ZaOKcko29gxjkEbXSPLvH1FOpaMwq5b157Maz6RXDB2OPPJniuthixKFR+Vr7mw3pl+R2jIUzZM8oyzEwfYXwE5qQFPkIuyd5j80XGtYSvCShPrnq/CIKLaLr1WQgzBYU5/5oVYpyrcegXtmAljeh20gUzk/qB4yFZzyqTkfuyyQ6sP44nDfBinK08fsT5+bcgvwLKtbpoR/CzgBKVPeFroC2euluY0i33G84q12o3K5Ma+RnTXrN/y4l/Gah5Sfo1lPcOr1BTGuI65wq+mokMYnq3ImvSyE+XvBP8F5lMBb+R0i3fnnWATjcY+3prx93MUA9GjHscx8vDZNNbHLPobzGWMmPlESb/SAk1S+JyztJEPZK20mfw2HBd6dYvDNvQsrTXIHExbFz0QkhduiWsDL1iWuJQgJx/ywRpvMg1DSanPW364+2G6KsMxtoFj4Qs2UjYfl/XXIQtQC/Q1vDJoitUf6fK2XGs4XN3MpFaEnFP5X+kTx12SesEz96LBfJigvqnF7gT7xVmboPdCQbtVWIXchY1N0I/YVErzDMv+g3fAcwYHtOORsIV1HHfvrdtmA4JamagiQVjN/8yBIxEs60K+X9W0dsJIiTX8eV13WzdxptJZ54DDjcWrtiHIzfsMWCYdU05eYBMqpOQs6e6YmAsSqWzzGXi6DAQ9GSchY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(83380400001)(508600001)(31686004)(5660300002)(66476007)(2906002)(66556008)(956004)(2616005)(36756003)(38100700002)(66946007)(86362001)(8936002)(316002)(26005)(4326008)(110136005)(8676002)(16576012)(186003)(6486002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXZGbFlML3R1c0xPU2o0cFYwb1llWE51RGlmRkxPNEpiRHhteUppRE14TWND?=
 =?utf-8?B?VS9iQm5UMnBraThkZ0tyS1N2VTNKemRQWVBTVitRVENYMDFEZG1meTlpempF?=
 =?utf-8?B?VnNhWEthT0FVdDI1QnlUcG5SYWdYZGFTZ05NNE1XKzRCUFQ5d3JwWVpiTHNQ?=
 =?utf-8?B?dXlnNTF0MENCMm5tY3V3M3A1UEtPelJsakhrdW9iaGxsOFNzTktnbHc3bDVK?=
 =?utf-8?B?QjR6UXRaNHd3NjRYNGlpT3BlYjB4bjByalo1RkNJc1p5bjhkRDJ1ZjZHZXFh?=
 =?utf-8?B?LzljYndBSUxRTWVrcnhZell1aTZ1bEJGL3dYUHNma1l5SElsbXR6YTlITVlF?=
 =?utf-8?B?U0ZOZVFqTk03RnltbWk4bE5oUHlMTVovQnBsUjZMcFVLNXd3TjZCL2d0cmtM?=
 =?utf-8?B?d0w3STNnNDdoL2FPYys0akJYLzBkdWFlZEdRRU01T2M0RGdBU0xTYXM1OVVx?=
 =?utf-8?B?S3owTWRmT1FJNDdWdWkvdWlFY2hrUkl3ZlJjNVdTcTBSNytYOElIRmJ0OFdp?=
 =?utf-8?B?aDJUY3Zjclg1My9oZzVvY3p2UGRYSmdRQXFZZnVwd1JheDZSdjdzcXVkTUdC?=
 =?utf-8?B?enJYcER2VmlKcXAzb29mUU8reVFpaVlHbkxTZitLTjBjcWpxR283MVl0WWlM?=
 =?utf-8?B?akNiVnpPRHkwRFJYWnFSOWIwZjd4bDg4azRmVisyMnJTME5HTjVLbGRIOGFD?=
 =?utf-8?B?SnMzbzZMbTlHaEtGTGhLdXI3b1BKV2h0M2w2azRNdlAzNE5acWRvM3V2bGV6?=
 =?utf-8?B?RnZMWDRWQjdwOUE5Y1lNcG4wN0RCblFSZjkyVFpXaFovY1pTNVgxY21qV3Vk?=
 =?utf-8?B?S3dSMm42M01jU3BhQ080bHhocGJldkNjSURjblN1M1N0NitjSDlXNE1lVHBI?=
 =?utf-8?B?ZkFFZndwTUgyeVJnc2RxbXc5THdZd1ZwbWU4ZkxNZHlqWTkzbmF3MHVyYUZR?=
 =?utf-8?B?OFNPakJjK3NkZWMxYjUvcVdYQ2lueEwrU2NDL0xQRk82Qm5PT2lBdkFXOWhm?=
 =?utf-8?B?ejgzV3V1TzVOVERrK01VWEJ2Mm5jMVlXc0tmWHNXZENFSGpmeHIzRDh4cEZF?=
 =?utf-8?B?N2QrTnZwdGZPKzRiVnBGcmlWZHRDbVRRSzB3NUpjaEtxMWh5M0tqMVZJZkZS?=
 =?utf-8?B?SE51ZUM5R2RidHpVRnBGYituQ05LZnI1QU8xMVY4ZDZwS3JweThEcGg0SnNC?=
 =?utf-8?B?R2Ftc1dTODVjbTZXV2NtREVXUUErOW5YN3ZBalpBemhBRTVhNVQxbjNqbmxu?=
 =?utf-8?B?K0xBZWI1VTI2bVdua2VGVDMzc3loSHlYOCtCZ2tYT291UjIzcnRvSzJNN3FV?=
 =?utf-8?B?aXF5c2tEK1RvY0QwNHk2MlVyRnY3Wmg0bnZoelViVnpPNVhyZGZzcldqM3Vy?=
 =?utf-8?B?L1BtZXlDcnR4eE1hSis0bFJFQXlhczN5eVc5UHBSVVp0djh5emhWT0tVTUZF?=
 =?utf-8?B?N3UzdmxIV0VFMlc4WVZ4YjJVUWM4S3V2MTB1RStkd3hzZHZPTE9LS3ZyUEQ4?=
 =?utf-8?B?QW43L2NrcVVYNzRyUDZZTTRJWTJqbDRZUzNTVEJ1djdYRStpSEs4czdmOG9l?=
 =?utf-8?B?LzNyM3h2dWNSM2pFb1hickttamRrMWdSMGsvSE5UYjRLa3ZyMGQ4UnRkczYy?=
 =?utf-8?B?SjFFc1lYZnNTeGFRN1ZVKytndktqQThaYlpnTm9kSVhsWU4xdXRvRG1TV1Jo?=
 =?utf-8?B?aHY0aExlQ0hjcVRqSXBlUVFlYTY2OWdUTGNudDNHeXVzQUE3eFlEZ1lFeVlq?=
 =?utf-8?Q?A/DKQNSH/EUA/TjxtX1kC01peWDaKxX0+vf6YHT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa92bbca-4f8f-4de0-4489-08d97db250a6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 10:18:26.1589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZX2I0VRntI1n/gqXn52Bnj1vW6lxkkAvmC7BCjfiQ2q+2qsEnebZ+1Fi1MmgH0JcNYvJKVGrE9vnsWvBRnncXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4190

The function doesn't use it and all of its callers say in a comment that
their respective arguments are to be non-NULL only in auto-translated
mode. Since xen_remap_domain_mfn_array() isn't supposed to be used by
non-PV, drop the parameter there as well. It was bogusly passed as non-
NULL (PRIV_VMA_LOCKED) by its only caller anyway. For
xen_remap_domain_gfn_range(), otoh, it's not clear at all why this
wouldn't want / might not need to gain auto-translated support down the
road, so the parameter is retained there despite now remaining unused
(and the only caller passing NULL); correct a respective comment as
well.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -2398,7 +2398,7 @@ static int remap_area_pfn_pte_fn(pte_t *
 
 int xen_remap_pfn(struct vm_area_struct *vma, unsigned long addr,
 		  xen_pfn_t *pfn, int nr, int *err_ptr, pgprot_t prot,
-		  unsigned int domid, bool no_translate, struct page **pages)
+		  unsigned int domid, bool no_translate)
 {
 	int err = 0;
 	struct remap_data rmd;
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -257,7 +257,7 @@ static long privcmd_ioctl_mmap(struct fi
 	LIST_HEAD(pagelist);
 	struct mmap_gfn_state state;
 
-	/* We only support privcmd_ioctl_mmap_batch for auto translated. */
+	/* We only support privcmd_ioctl_mmap_batch for non-auto-translated. */
 	if (xen_feature(XENFEAT_auto_translated_physmap))
 		return -ENOSYS;
 
@@ -810,8 +810,7 @@ static long privcmd_ioctl_mmap_resource(
 						 kdata.addr & PAGE_MASK,
 						 pfns, kdata.num, errs,
 						 vma->vm_page_prot,
-						 domid,
-						 vma->vm_private_data);
+						 domid);
 		if (num < 0)
 			rc = num;
 		else if (num != kdata.num) {
--- a/include/xen/xen-ops.h
+++ b/include/xen/xen-ops.h
@@ -64,12 +64,12 @@ static inline void xen_destroy_contiguou
 #if defined(CONFIG_XEN_PV)
 int xen_remap_pfn(struct vm_area_struct *vma, unsigned long addr,
 		  xen_pfn_t *pfn, int nr, int *err_ptr, pgprot_t prot,
-		  unsigned int domid, bool no_translate, struct page **pages);
+		  unsigned int domid, bool no_translate);
 #else
 static inline int xen_remap_pfn(struct vm_area_struct *vma, unsigned long addr,
 				xen_pfn_t *pfn, int nr, int *err_ptr,
 				pgprot_t prot,  unsigned int domid,
-				bool no_translate, struct page **pages)
+				bool no_translate)
 {
 	BUG();
 	return 0;
@@ -146,7 +146,7 @@ static inline int xen_remap_domain_gfn_a
 	 */
 	BUG_ON(err_ptr == NULL);
 	return xen_remap_pfn(vma, addr, gfn, nr, err_ptr, prot, domid,
-			     false, pages);
+			     false);
 }
 
 /*
@@ -158,7 +158,6 @@ static inline int xen_remap_domain_gfn_a
  * @err_ptr: Returns per-MFN error status.
  * @prot:    page protection mask
  * @domid:   Domain owning the pages
- * @pages:   Array of pages if this domain has an auto-translated physmap
  *
  * @mfn and @err_ptr may point to the same buffer, the MFNs will be
  * overwritten by the error codes after they are mapped.
@@ -169,14 +168,13 @@ static inline int xen_remap_domain_gfn_a
 static inline int xen_remap_domain_mfn_array(struct vm_area_struct *vma,
 					     unsigned long addr, xen_pfn_t *mfn,
 					     int nr, int *err_ptr,
-					     pgprot_t prot, unsigned int domid,
-					     struct page **pages)
+					     pgprot_t prot, unsigned int domid)
 {
 	if (xen_feature(XENFEAT_auto_translated_physmap))
 		return -EOPNOTSUPP;
 
 	return xen_remap_pfn(vma, addr, mfn, nr, err_ptr, prot, domid,
-			     true, pages);
+			     true);
 }
 
 /* xen_remap_domain_gfn_range() - map a range of foreign frames
@@ -200,8 +198,7 @@ static inline int xen_remap_domain_gfn_r
 	if (xen_feature(XENFEAT_auto_translated_physmap))
 		return -EOPNOTSUPP;
 
-	return xen_remap_pfn(vma, addr, &gfn, nr, NULL, prot, domid, false,
-			     pages);
+	return xen_remap_pfn(vma, addr, &gfn, nr, NULL, prot, domid, false);
 }
 
 int xen_unmap_domain_gfn_range(struct vm_area_struct *vma,


