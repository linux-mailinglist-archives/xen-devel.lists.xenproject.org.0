Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B472350A22C
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 16:27:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310265.526990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhXll-0003as-Oz; Thu, 21 Apr 2022 14:26:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310265.526990; Thu, 21 Apr 2022 14:26:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhXll-0003XN-LR; Thu, 21 Apr 2022 14:26:53 +0000
Received: by outflank-mailman (input) for mailman id 310265;
 Thu, 21 Apr 2022 14:26:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lloE=U7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nhXlj-0003XF-O3
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 14:26:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15522564-c17f-11ec-a405-831a346695d4;
 Thu, 21 Apr 2022 16:26:50 +0200 (CEST)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2054.outbound.protection.outlook.com [104.47.5.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-l88B6IBfM-qEUgF6Xwld2g-1; Thu, 21 Apr 2022 16:26:45 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AS8PR04MB9011.eurprd04.prod.outlook.com (2603:10a6:20b:42f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Thu, 21 Apr
 2022 14:26:42 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 14:26:42 +0000
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
X-Inumbo-ID: 15522564-c17f-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650551210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zKt+9U9TMdD6IMPEO87THHRe/EIUI24N1ey7tQCQd1Q=;
	b=NkEXzc9UhrYvr7rLls8srzwPIKzGq1yQQhPlYf5gTzydJfaKGftZFffQ/DlKPsVg8ZeqPP
	tNA9VG+hqBe1/W6/+y6TngChFETbgjygJXdlYitZHGjC4GEr5b9lxkelgNTREUnLIhiq+M
	k4I8aErP7TssSuXmqpRp7HSf1eQvLuw=
X-MC-Unique: l88B6IBfM-qEUgF6Xwld2g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bfgrtMu7vucfNoE5R0D+yUMGEzlYgou8CHF0REgvGV/T9BtFfTTjkFrVzokjbuC0ay+Xz641p9VgR6OZoxAHjn8U4zzW+PQgT9Vmg1ejIcucTwBI3rvRyh5v2LbZlvUmBPqAjnk0Jh7z3lNG0VJjQyy49UN3Uhcg2HhdxdUdnBoDY4LA7MhPZqWtSASKylFQKn5pE6xRc9j0KPd2WLQVPHaT54AcvFqg14UTFpoKozbC1fijhhtSDfBQ6dcMRGGepfSeGE7yj8jGRe5XOODW6QatagkRr/5oW17wt2nLVjULvIoS5q0YGnj2Oq63fU46W48pTzKiKCXACAY6j47kTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AN86zNdiwUuZ0FofNlHH9FuXW8RS4szdVKQ84rU2at8=;
 b=AAuTai2GNYtAqo/FT/xAHL20mooKpcXv1Di2Q8zS1Mpp8ftIfyxo2+L+Fj+rPwdRcWpc+0o+IqtlwI9PqweBl2bJSy0/k1VkbH/DP8ebLGFlKku/zBd3QFeMswxF6GXzcdm7XQpPGxAipfRQB+F7jTuSM7fQfrLeU/x2n2rsffy/XKNLL2qpB8cgz7kUvcJFIxDnlEvjpDsaLnF110KeqDOGwbiR5yFk1tBxFwY2wF1cXrNPW7JC84oNyLMC8dB0lKALDR8yeBfVb3aS+36kBOknVp9qi+/M4lhthquMTWxFY9NvzajrvA1JfIeOt4AKU6VRwGhppFk07xy31NYj+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6dd6719f-a05d-3f90-95b5-0ce9b5b0a2da@suse.com>
Date: Thu, 21 Apr 2022 16:26:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: [PATCH v2 1/2] PCI: replace stray uses of PCI_{DEVFN,BDF}2()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <9a471a5f-497b-1015-8554-68117863f48a@suse.com>
In-Reply-To: <9a471a5f-497b-1015-8554-68117863f48a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0121.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::6) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d2da52e-452c-4915-fc76-08da23a2f4e8
X-MS-TrafficTypeDiagnostic: AS8PR04MB9011:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB901130FFF88202EEFB7E5805B3F49@AS8PR04MB9011.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2NviS+iZfSATkD9lou9rZerurOteLilkR2K9qlnNUpBHIsK/4XMndz1HpFpCAgTM//MCLy3sAGoLCJYATBdQjCsyLo3nJXmlGkF0+ltb8CdQRPzh+K6Bot7XJIl0FGDZPD5iM617nNOFy+xVyeVaPIkejPmQ3Emqb9JPoMcZHlAVHtHXJIV+VMUZ6tHV3wRlJywVt01mNeehhWuiqajcsqpdSR8Up6FX0HKV9AmkV/LrXo+o2tSKERE/3yLPHINwZxO8nU3NYnMaLpzbC+Lt/3YOxxkWwSkhmSaU3i26++7owsIR8GvO/e9sJZxbxUUKY27tgYVsWp3/n/4Ah8BrguUTKyxuZRozhRZmd9UHj7Q9Roekiuhi3KAjfGC1oX7ALKCXKIEMKdgm0xFqwBfDdDE4lXWCTkQ1ZzbmBqY541rtgQ729io9yYDyUrQMYpSbHG589figG2hpRyJJ9FvNTLCByIddXIsIEvmEt/kR91+rHzma+rmdgaVZsPUNZPHDNbyipIBJdOy8I6rSnzIusFiMoiNdHWFMANxUCqmnmtaRJuyJ8JUAffuLuucsEUoHp/fIghmH4dC6a6lG2Z/ByhOyLwr8CStPEzQPIqioQci9x7Kch4B8BiGA9IgA05ulchmNyZGmQmBR44Egz63gw6ZPYlj4NSWjn8kaxkg9BA/JXt8yfGGti2Fdk+5P4e3RIoLYSaI2MQMoah7rJRwvLW0ryE+QaJNqWNuWWxLDAXI+t+M8eFLFubLNpb7jf+LY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(2906002)(6486002)(66556008)(66476007)(66946007)(31696002)(26005)(2616005)(6512007)(8936002)(86362001)(4326008)(8676002)(186003)(7416002)(5660300002)(6506007)(38100700002)(6916009)(54906003)(36756003)(31686004)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ClTiCtRuo+jqCQBQTe9BnbSaY4Jg061xW6/KQiEwYZHYjvyCZ2lkZoETBYhK?=
 =?us-ascii?Q?sAxsigyg6m0W+fPoVsRXfYadwhM+bkc8IuT61csQ0QKPWJwslXWxEJecStgG?=
 =?us-ascii?Q?jXQGcjzN88ASGpCzpOImesQtMpekOZD2lxd5wvAtEiCxPGQhJoZFnfjF2yXX?=
 =?us-ascii?Q?38QkOnP0HpIk3P5mgsONHDMsGljRDWLAKEZXk6sHHfqZyg8M7v4w69Y2JaDW?=
 =?us-ascii?Q?EBKhdXjvEOkEv0swKAW6h59TJx6SGeTkQWjYTiTi5nMYXw4/SsKByaJrYVDO?=
 =?us-ascii?Q?ISP1MYKrc43R40qhYAXbAC8A4r+CVRdqin7rdVq2XrxcCBnjXPgJWVGMa+ly?=
 =?us-ascii?Q?pl+oajNyILelB6tQz3NTjTqHYAzG7QR8053koZ2FwrFFAHO9EknFpGBdEsw8?=
 =?us-ascii?Q?X9Yt3f7BcqLUy0FFVvDhryKlX1m724J+EKSzvlHWlnicoVWkPiBoBvvqQqsH?=
 =?us-ascii?Q?WQqwKo4+TI+YPJQ5D3yZl70rjUR51Kb+XUJyvRMlOYp3xVBzVgzhP5k3QsJW?=
 =?us-ascii?Q?qxUBlgP4H9uiDe5P2yOM4nUsy77ux1fxLTZpzXWVyHCVLouxhrTG8k5WBQ7a?=
 =?us-ascii?Q?mqM11UBTAYEtjpL1MEKhYDCCqEolUbN/qH/Fhp4ueIk5icmq90NjpkQ4Gaom?=
 =?us-ascii?Q?ZaYIaJZH3rgWvwJ2Fx7n83TlQSPzM5zRjii7QyC3mPDatZhoIGY/l87S4Dfd?=
 =?us-ascii?Q?XYk54y/co3nsFJMvPlvfyr4YQkSKHRelbEpKq1ksy/3X66PizNgpxHoMctia?=
 =?us-ascii?Q?74yMc326Q6t3tLJHPh5+q2H4wFgbpk8Xph8fKJq+1LOwnTkrX0+0rxGBsYsW?=
 =?us-ascii?Q?fd4BgB3+wiJa/pJ2wUEKvRxR2wVL/arnLjfdX7vMEBrzcZ3GUltMSfU6AnZk?=
 =?us-ascii?Q?lFGwtKG0Yk521ghYKsAbdvHXAdtk+JcLUBgLeLPhqwXj4yOgUv/zrZUp4GPL?=
 =?us-ascii?Q?IKIbtBPgpXVeNiV4Xd6V16PUrMc+CYtytkB1p0xJPDld4xaVRLHe1hF/dpEc?=
 =?us-ascii?Q?gGUT4PQV7uf+X+E3aOqjyPGF3aCm699yQAqdoSj0m5n63pOAzy1lh8gslCM1?=
 =?us-ascii?Q?noxj/2ogse61Se0+Dlc+9MfJlNs6Qidm/60k7iGXDqKNkTbaaAZ3InbhlfNK?=
 =?us-ascii?Q?VH85YGSsepl54OL6aCd+SovbVDMPkeloCa8MlBc4DX9mB5Ru9y37MJzCjZkN?=
 =?us-ascii?Q?LDfnRCbXbsamTP71ZEREHJnuGLOTfmNPNUZNCsO/sSohI/uuJfoTcWG5y87z?=
 =?us-ascii?Q?uKefKbt3XkprGP5+65pen3rg3Fd4g+i4vmNW/cbcjWo7+oNbKgSJqGTHB/kC?=
 =?us-ascii?Q?iX7/8YV1ahrGWvShbi6qKP1e/LIB0b8qCvuK9YT32BL5JKruwlcuehI6HfMw?=
 =?us-ascii?Q?uoJ5K86YYwP59LfI0k+SlzrVth9UpOa49BO7+5PJzu9Y4Ualky+570D9wqU5?=
 =?us-ascii?Q?0m/5jqJHNGu3H8zXxjl++M0p0owAqNKxr5uA3NGSg1pBh4Pa95lBwbXx5Gzl?=
 =?us-ascii?Q?PG2Qnj3SJ7gOe/Fn4snxtBSWalIpF86Zbo22ny9/dFLe5CdWuKnV/mqlbwn0?=
 =?us-ascii?Q?lh8AzHprEVLO1AtQIRF7CGmPtw8FKqlxDJTJr4BrpGA60Yf+/vtgEOw64Qgx?=
 =?us-ascii?Q?ckbQR9ilgVJ7t5HrBbk39BpahwzxhMJ/Mvoxlm/VmSNxgbF5Ico5OncxKQpD?=
 =?us-ascii?Q?zT34mvT2hZ0HykoqgdIr/IiH4ItB582FXG1QTbcOGzGlK4jo4XvIJfEix30o?=
 =?us-ascii?Q?7gt/0BAXUA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d2da52e-452c-4915-fc76-08da23a2f4e8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 14:26:42.7867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xoO8Wlk8zli+pifa0+Q/rOJqSv5GICaPaed3S1mZDNSsmSYkkjVIJkMinGNDpEsVxHJgqi6T7dq44ZlBzYVa2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9011

There's no good reason to use these when we already have a pci_sbdf_t
type object available. This extends to the use of PCI_BUS() in
pci_ecam_map_bus() as well.

No change to generated code (with gcc11 at least, and I have to admit
that I didn't expect compilers to necessarily be able to spot the
optimization potential on the original code).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
---
Note that the Arm changes are "blind": I haven't been able to spot a way
to at least compile test the changes there; the code looks to be
entirely dead.
---
v2: Arm build fix (for those who actually have ways to build the Arm
    code being changed here).

--- a/xen/arch/arm/pci/ecam.c
+++ b/xen/arch/arm/pci/ecam.c
@@ -28,8 +28,7 @@ void __iomem *pci_ecam_map_bus(struct pc
         container_of(bridge->ops, const struct pci_ecam_ops, pci_ops);
     unsigned int devfn_shift =3D ops->bus_shift - 8;
     void __iomem *base;
-
-    unsigned int busn =3D PCI_BUS(sbdf.bdf);
+    unsigned int busn =3D sbdf.bus;
=20
     if ( busn < cfg->busn_start || busn > cfg->busn_end )
         return NULL;
@@ -37,7 +36,7 @@ void __iomem *pci_ecam_map_bus(struct pc
     busn -=3D cfg->busn_start;
     base =3D cfg->win + (busn << ops->bus_shift);
=20
-    return base + (PCI_DEVFN2(sbdf.bdf) << devfn_shift) + where;
+    return base + (sbdf.devfn << devfn_shift) + where;
 }
=20
 bool __init pci_ecam_need_p2m_hwdom_mapping(struct domain *d,
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -839,7 +839,7 @@ static int msix_capability_init(struct p
             pbus =3D dev->info.physfn.bus;
             pslot =3D PCI_SLOT(dev->info.physfn.devfn);
             pfunc =3D PCI_FUNC(dev->info.physfn.devfn);
-            vf =3D PCI_BDF2(dev->bus, dev->devfn);
+            vf =3D dev->sbdf.bdf;
         }
=20
         table_paddr =3D read_pci_mem_bar(seg, pbus, pslot, pfunc, bir, vf)=
;
--- a/xen/drivers/passthrough/vtd/qinval.c
+++ b/xen/drivers/passthrough/vtd/qinval.c
@@ -267,7 +267,7 @@ int qinval_device_iotlb_sync(struct vtd_
     qinval_entry->q.dev_iotlb_inv_dsc.lo.res_1 =3D 0;
     qinval_entry->q.dev_iotlb_inv_dsc.lo.max_invs_pend =3D pdev->ats.queue=
_depth;
     qinval_entry->q.dev_iotlb_inv_dsc.lo.res_2 =3D 0;
-    qinval_entry->q.dev_iotlb_inv_dsc.lo.sid =3D PCI_BDF2(pdev->bus, pdev-=
>devfn);
+    qinval_entry->q.dev_iotlb_inv_dsc.lo.sid =3D pdev->sbdf.bdf;
     qinval_entry->q.dev_iotlb_inv_dsc.lo.res_3 =3D 0;
=20
     qinval_entry->q.dev_iotlb_inv_dsc.hi.size =3D size;


