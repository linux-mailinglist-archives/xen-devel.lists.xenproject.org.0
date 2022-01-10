Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A15E489D79
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 17:25:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255411.437650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xUE-00046q-Td; Mon, 10 Jan 2022 16:25:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255411.437650; Mon, 10 Jan 2022 16:25:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xUE-00044A-QY; Mon, 10 Jan 2022 16:25:34 +0000
Received: by outflank-mailman (input) for mailman id 255411;
 Mon, 10 Jan 2022 16:25:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n6xUD-000444-B0
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 16:25:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee7772dc-7231-11ec-81c1-a30af7de8005;
 Mon, 10 Jan 2022 17:25:32 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2057.outbound.protection.outlook.com [104.47.1.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-D_kf8NK-OCqp2lTDk0p0Yg-1; Mon, 10 Jan 2022 17:25:31 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3392.eurprd04.prod.outlook.com (2603:10a6:803:7::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 16:25:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 16:25:29 +0000
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
X-Inumbo-ID: ee7772dc-7231-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641831932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bZDLkEqTer3O17aBOCHdhQ8xeDX9ptV5RIek8aDqpCI=;
	b=IrFiJhyTHGoKOz6P75OelATBvo2Ev5Of+7mwYlgBc0ofBLwh48Qj2716gQeMvQshV+K3GH
	L/HoMWQGdk0cDiBuTx6vpakwlaoGsYc3M/bDKjEv9HtCBfOWdslx1JbnwctmQfq3WcwmIY
	/uU0drBQ6ROkX2GVX769hpQGz39GidE=
X-MC-Unique: D_kf8NK-OCqp2lTDk0p0Yg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OsKngWXwq3HlJ+nCuXgfco1HTxiIWz1hu9Yt2npknBvZb14w0pFELvozv1sZZyq9fhFHccVXDFIxdWCF+EkRYRC5PbF8kSeifA6ZGsJZ+lcCtDzCsJ6T/JJLwEuT1CAZUlc9Qv8X0mOXftBcCNa7O674ZH621u8EV5KUPWyh4wEsaPdICbK5lX/NdJSjHDskgJR0mYc0rVQQnBI6su3W8bX3/XyXnJyZvhzJP4VrXvFOS+lfPPE9NlMetzQmV0CN39wr4+s6MCYfGtf8v4oFu5eBuGbfwkfNJ3THRKlRIhD9Exf3KuXnDMUWbZLwxwt7YGWOerRhXUQmMyYhyPaNvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWxKtl2bnXWnDaf7ZhGSGx4BTSmBYb3ptYMsyNa3h1o=;
 b=C/JTkjBwIZI72zQF0CnxWBMsgeR3vCpyrfeynsFdpf9ndjEnpVq2T/DmOU+iUgdfBrpWui7+ihgm1JU/FdG+fU9HLdf/qqhSU5/dLFb0OgzN+kZFgtjSehNSWbemfVEY8mT+sPeIXCxSCqndkuU79EIm22S/QuWdTkaicGvzZozcCfkRzGJk0WdwW1dAEbXc3Npt3S1OTbQ5Hxasz6Puy4uD5721AZdiT+4B4SLcDaD7R5F2EAmmIWX6zzrQr7Q9ZXJGW8w8fkIysTWdowJOg9WQysPy6x5ugoQXbl6mh/zuk1rQwO6Bw8GvO00fNRqwnxXQDm+7XuWiyjuySRu+jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cb46d2c9-d735-4be8-cce0-ae37bd59cfa0@suse.com>
Date: Mon, 10 Jan 2022 17:25:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: [PATCH v3 04/23] IOMMU: have vendor code announce supported page
 sizes
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Rahul Singh <Rahul.Singh@arm.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
In-Reply-To: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0301CA0032.eurprd03.prod.outlook.com
 (2603:10a6:206:14::45) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2faa2da-e1b6-4ecf-78f0-08d9d455d0bb
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3392:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3392CD17A72348748DFA0F37B3509@VI1PR0402MB3392.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aZrei+NG9oS0T1oIG9HOCh0ND7jgu6oGoYjkLCpslztiN4368e/G9Clo1sVtvRM7z9pXbHWWvCctoOhyESnCg8ZPgvqAkDsDB/x7OAOds4TyOsNpG5HozA28iXBhjNelIO1b1h0zY0XRaeY+szsAu+VBsowoQ6dztOdAj8c4VkKrtzIqK/dAV55m6om21zakhvEf/n764p+JGF0e70+nxNEyaD2dWIwwzyOJgv6QUZb9ZOHCpMLSLG9zsyyGM0ooH7S+EImil1GAq//6ngG6+lOA1+2cbzg/YM+En5gEFVIpBHx2AbPAy8J+Vi/m0QTXWxV7LFeEnuFnG+waYJRtfZX5fPZzBeT56M3YhUvoMyD3451hgWRTbCgakG9H9I4nFad3TUGeaIf2oAHJyBYsA12A5cZnikx2kthfVHNddUDXPr77193R5JOZv37ClrDoLHrvpYFCRiXscn+zYeb5x+CHvo2Nc2qEVLC9Xzut+GtYRYc4SZfT4I7upXxl3Qm7/4xRFaOBNYdeXEmj4BKfhpIkn57Hv1CyFWivAW7otKFuUzODCMNpwgj52G/tSuWJBCF4ClHDSAvY67QQUmu5rrpKyJ4hiqIIGMGhLlu6uyrBvrMeNoTOWKzo46NiZNQ6zK9lUKjmYbQgbTkNXgnKHubH5UTrS7ec5f0VSY2IOdNGRse9xm2nD7TPl5E/aeZOcD4Inv4uiR4GqInFF4HDqKqXtuW+gdXWnRhn+s4eCTf2tSy6H0STtcCbs5k8WwAZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(6512007)(66476007)(66556008)(66946007)(86362001)(8936002)(2616005)(316002)(5660300002)(508600001)(31686004)(26005)(31696002)(186003)(6916009)(38100700002)(36756003)(6506007)(8676002)(6486002)(2906002)(4326008)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E4Jtw7WFATYM6tldy9SEdGACQDl7iXn7y7sMa9/CO9aZakeZd86Nu5XQrkFs?=
 =?us-ascii?Q?9hrX7pNIUQztMOiXSM53XScLJ96dCbZC1P7oFKnn47IEz6C615BBuf77OOvH?=
 =?us-ascii?Q?Uj9NSUsQkKYxyFx+iFEdl3WHK4v09uGaEQpmBRo2mZEmE2X9u0fidciBDkGe?=
 =?us-ascii?Q?6QLjXHJCGme1oiozn+/wfUZLH2q2qN7Y/3v7gYAOS38NsEzPPSbxh0Tks2jP?=
 =?us-ascii?Q?c6P1OK0ShwE516NoLIKUIYQGbXeELPgX9uH0D9qs+vS9Rrhw9TCe3daQPFcX?=
 =?us-ascii?Q?ClxLdF2GAPp/JukpQms5d2WJP66VZdqTDbAbLK6UCTZJKIjPvYEMbJnjBeTJ?=
 =?us-ascii?Q?ztalA9D+H8ohtt2an0dXB+2Jd31MPIEiWHruUyMHpqaO7N/e+DVUO13OlDb6?=
 =?us-ascii?Q?BnkdspqyKwqoiRherpEvyVm2UFL8ctbgg7b6gPYNw16HTTiCx0w4bv8PJzGy?=
 =?us-ascii?Q?WgRSmCsbMSrlCdSwEI35V+rF0ufBnChwkZfpmPGhdmiuL/tZlKs9Hvn5pOfL?=
 =?us-ascii?Q?+nPQMMxB3uRoYjzScUi+VhI2htvl13KiO+njAnM9Q7gpAmBhpeE77WqgHW61?=
 =?us-ascii?Q?eW6Sp9zFKIOdMBXczMfZts1ywTcLQC244Gsj7AdKdtt1OUOQeO9lVlVALmWj?=
 =?us-ascii?Q?IwGJv02IgWAdrNuSIXkx8WQuWgAolU0FWpkLL36PbKUZKFxFu+0CtqO4iWuP?=
 =?us-ascii?Q?9TkaT3sdJIQvxVMGWw0ZH36OMo31/Pt2i1TNrcoy5KptFiSzpe10pOlP/XKa?=
 =?us-ascii?Q?OP1VjQD0IHxmubVSWpOazQcEcnfDxbsHDNDcBmtE13CB5ggIw1tLqXk9zzAG?=
 =?us-ascii?Q?ttB6SNbwj+sNyBGu5QI5rw3YaBYYhL/lcSNKXLXiKWh4bZGPfjQATwTA/LUG?=
 =?us-ascii?Q?bF97dzr4FllJiPkLCr4w883OdonG7YNx1nSArnnboD5cNFgd6E/3rq3pi5J2?=
 =?us-ascii?Q?EIvOQMGZxXW6KgCBa4/DZAgyCqd6+0HViLU/tRsimt5QV/qZgRckLAN7V1vU?=
 =?us-ascii?Q?tBfKhQPJPCvlVhjqt8kBYEvCbHcXai0o0vNQOf9Y2KJVtjFTCezxa5hOlevQ?=
 =?us-ascii?Q?B611+mVaYChytwOInR5ngX/Q+7w3avjJpvIO+zuCH8wbCBXvcQTHUVQyTj2w?=
 =?us-ascii?Q?8zwSgClM8LM8dL/V4vHtdjIriFdQixId53T5Z0ZE8yIyNYWU9p5d3eLw8rTt?=
 =?us-ascii?Q?S+OGh7G69f3N10IaXNJGYBteL/o/WLmj/DBnOcLGR3Tfldlw9TPw7RW+G1R0?=
 =?us-ascii?Q?63XT9FW33cCJIh6v4xpS3h2YplCm2y+VxCOTMDygVAC9C9LjYXnf7p/2+tJL?=
 =?us-ascii?Q?rq/3qT0sba0eg5KO4fwSAfLEg0Mml2ljOAbXzZ/SovMBZnybTgUOQBAwlUyC?=
 =?us-ascii?Q?wwQgSQjru+jNdCTTLDymqlnlQ66LMcIBH4cDRFSLSAOqYQ5u1VM6Uo/Z6YzU?=
 =?us-ascii?Q?p8BL7lCsI8+Wuv8cCp5y4auRsjkyRxIecihxVCYItwmtJjvRiGVamSiyQstt?=
 =?us-ascii?Q?7l3x9w5qUw5DJgw6pG41YmP+COfK6sMI7ENm+ufBPs+m917lLSIqbGDvd3Ix?=
 =?us-ascii?Q?nmZvjiSLkWVhdVOhJoej5vXzrx4xkNryiidv0mo4dRg2HgDEMyrxhM3nvbj8?=
 =?us-ascii?Q?cDWUPo42PY6z5f9CYZg3cHo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2faa2da-e1b6-4ecf-78f0-08d9d455d0bb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 16:25:28.9971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H/Uihs4ccGLLIl65xuPt3a+ZejilkpHNKkm4XvGrbOPY8xFr5NqY6ce0V0dhFFT049P3d5EEsQAubCcn6WMY/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3392

Generic code will use this information to determine what order values
can legitimately be passed to the ->{,un}map_page() hooks. For now all
ops structures simply get to announce 4k mappings (as base page size),
and there is (and always has been) an assumption that this matches the
CPU's MMU base page size (eventually we will want to permit IOMMUs with
a base page size smaller than the CPU MMU's).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
Acked-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Rahul Singh <rahul.singh@arm.com>

--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -629,6 +629,7 @@ static void amd_dump_page_tables(struct
 }
=20
 static const struct iommu_ops __initconstrel _iommu_ops =3D {
+    .page_sizes =3D PAGE_SIZE_4K,
     .init =3D amd_iommu_domain_init,
     .hwdom_init =3D amd_iommu_hwdom_init,
     .quarantine_init =3D amd_iommu_quarantine_init,
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -1298,6 +1298,7 @@ static void ipmmu_iommu_domain_teardown(
=20
 static const struct iommu_ops ipmmu_iommu_ops =3D
 {
+    .page_sizes      =3D PAGE_SIZE_4K,
     .init            =3D ipmmu_iommu_domain_init,
     .hwdom_init      =3D ipmmu_iommu_hwdom_init,
     .teardown        =3D ipmmu_iommu_domain_teardown,
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -2873,6 +2873,7 @@ static void arm_smmu_iommu_domain_teardo
 }
=20
 static const struct iommu_ops arm_smmu_iommu_ops =3D {
+    .page_sizes =3D PAGE_SIZE_4K,
     .init =3D arm_smmu_iommu_domain_init,
     .hwdom_init =3D arm_smmu_iommu_hwdom_init,
     .add_device =3D arm_smmu_dt_add_device_generic,
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -3426,7 +3426,8 @@ static void arm_smmu_iommu_xen_domain_te
 }
=20
 static const struct iommu_ops arm_smmu_iommu_ops =3D {
-	.init		=3D arm_smmu_iommu_xen_domain_init,
+	.page_sizes		=3D PAGE_SIZE_4K,
+	.init			=3D arm_smmu_iommu_xen_domain_init,
 	.hwdom_init		=3D arm_smmu_iommu_hwdom_init,
 	.teardown		=3D arm_smmu_iommu_xen_domain_teardown,
 	.iotlb_flush		=3D arm_smmu_iotlb_flush,
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -470,7 +470,17 @@ int __init iommu_setup(void)
=20
     if ( iommu_enable )
     {
+        const struct iommu_ops *ops =3D NULL;
+
         rc =3D iommu_hardware_setup();
+        if ( !rc )
+            ops =3D iommu_get_ops();
+        if ( ops && (ops->page_sizes & -ops->page_sizes) !=3D PAGE_SIZE )
+        {
+            printk(XENLOG_ERR "IOMMU: page size mask %lx unsupported\n",
+                   ops->page_sizes);
+            rc =3D ops->page_sizes ? -EPERM : -ENODATA;
+        }
         iommu_enabled =3D (rc =3D=3D 0);
     }
=20
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2891,6 +2891,7 @@ static int __init intel_iommu_quarantine
 }
=20
 static struct iommu_ops __initdata vtd_ops =3D {
+    .page_sizes =3D PAGE_SIZE_4K,
     .init =3D intel_iommu_domain_init,
     .hwdom_init =3D intel_iommu_hwdom_init,
     .quarantine_init =3D intel_iommu_quarantine_init,
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -231,6 +231,7 @@ struct page_info;
 typedef int iommu_grdm_t(xen_pfn_t start, xen_ulong_t nr, u32 id, void *ct=
xt);
=20
 struct iommu_ops {
+    unsigned long page_sizes;
     int (*init)(struct domain *d);
     void (*hwdom_init)(struct domain *d);
     int (*quarantine_init)(struct domain *d);


