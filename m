Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E04AC512DB8
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 10:06:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316126.534875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njzAM-0000SZ-Ly; Thu, 28 Apr 2022 08:06:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316126.534875; Thu, 28 Apr 2022 08:06:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njzAM-0000Pl-Iq; Thu, 28 Apr 2022 08:06:22 +0000
Received: by outflank-mailman (input) for mailman id 316126;
 Thu, 28 Apr 2022 08:06:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h8bM=VG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njzAK-0000Pc-DM
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 08:06:20 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 157e522b-c6ca-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 10:06:19 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-jdfFi5klO8aS2kWLLhfhXg-1; Thu, 28 Apr 2022 10:06:17 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB8PR04MB6363.eurprd04.prod.outlook.com (2603:10a6:10:3d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14; Thu, 28 Apr
 2022 08:06:15 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Thu, 28 Apr 2022
 08:06:14 +0000
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
X-Inumbo-ID: 157e522b-c6ca-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651133178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/gemsHyzHFReyX638pDAq2GYKoO7Sivl1KCn+3UiyKk=;
	b=mqxpSgh5hPxaEkq57ULuLj3C2vX8eA/wEfKahCP0Je3Nddv0DdCl/+fbl7eoqMwnRHbtZ2
	X0rcOCfO7gJ4Noz9GgT2sAjjyDcnZkl2mQwzR3p7F6brNDC4IiYoqCgZza30R1SAShtprR
	Jnus6oHtqygP9imLEFkgs5UGQopvwFQ=
X-MC-Unique: jdfFi5klO8aS2kWLLhfhXg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CSxZ+2gDgptJE6ceEafNQpGfts/bDAAVTeoDctJCxw0+17tRnaCbsuzFrKaHBpcu6OE24mB+MYQuSnaZDU2dOM1YlYLuKB7HTyyV8p986RyQrl+nAbLplEB3b5OhBQat2mzfLhpJwGqwKT+NXPL+5cFcWFAlLLj46WM206WthoI8MIJL1R8/fTdcC/+Wqq7wHUCG6Ak4f2efn9VAQTvTkNUpQQ2L2YfXCImPNybN6ufBs06twjsh2brZmaJVchvY+m8xKevv6sXlMPeHL9WyZwZNfgbZj/k+MyV/e20fmAza/YAtx8LIqkECwexq0mjK5p3g6nXKNPQl47J22n+nMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O3kd+zNhcVFHNHDnYQEavuLTfd5FFTM9re4SHFaXEYU=;
 b=FUwXdBf8iXtt4j3xrRKAskeJgUDv6wGKVoIJ6PjFpkNmNYoTKNgfUJeLMnXrzuQXY0VcjYr7iJwN1IHSv51NMf76TO5xsJvJTMK5n/NGmWV/VJC0V5ybF5F/umZjUC+SYJ7BmopP8GU9o2gbkRWROt9sCOBH5tilYrKVHEop9XZfq+DKBm/npW9IthlfiHtYsWowaR6tFADqRNTbsLn8/VgxKPoGjIB4sosafFxrRLdSw4MRkaUXs/tndB6lbwG/QF6eGjk0wddG0Gmo36i9dSPT/9/1+a6smgSKrUJfmGYiZFEIvVZZblPFAHmmmqgtTvt8EHRtWxueJ/8lzpkCOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <06e25ac5-dc84-5a31-100a-493d5f88fa9c@suse.com>
Date: Thu, 28 Apr 2022 10:06:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 1/2] PCI: replace stray uses of PCI_{DEVFN,BDF}2()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>
CC: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9a471a5f-497b-1015-8554-68117863f48a@suse.com>
 <6dd6719f-a05d-3f90-95b5-0ce9b5b0a2da@suse.com>
In-Reply-To: <6dd6719f-a05d-3f90-95b5-0ce9b5b0a2da@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::20) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7ec5bb8-8c6b-4a1b-9b0c-08da28edf743
X-MS-TrafficTypeDiagnostic: DB8PR04MB6363:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB6363BCF6B0A0F9B313B68043B3FD9@DB8PR04MB6363.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D1/waTDSFsQskVS7H0OQ5FI2k+eYTKy9P1jtJ+2Ii8zv9Ga6aW1xVypsRLpZAK5Lh9qRZjm2hkKlb/bCI/2rrmZz0GCCdeS9hNeBdijKcsK08E5mVNKZG/Q2jtP16nZiBtpyT+sJsqfNupyool1V7QJiC80vuDqvX+GcbecemHEv21X9AaIvtctg8Feo6Q1ZjHwB03bMZ9NxlDaZF4Cii7Nr+Sx6nkRTQ4wD9P/+DudYfuGdowAkgX/9pPHs3NZ0dJWMy6G00jwIhmDPFDHhj5c9BWrT46lqAXtYvzd+1tLPmjqq6lngRZWl+QYHPx93UNjlgdZ+ocCt0G3Hts+mbJhKwHbGtESsM1VAN6TWj6c0ZrYnvXuLA+JoVql2tdF0xI52UbCRfrYhqrYKi11XVA06lu/qdph69rXyA4Nyaa/SBA5OKuod/bPUx/7saWphdsSZxREgNl6V74Eau4jI59N3Uq4pwVHXFtLAsUatVaJJY5C2Yth4TgXbgB71ZBP220n9oOX0xYSGNoc4EnwaERQABxDq4Xy25fi1Zmk70yuiVctq3Vral4eTHhFXFLRpUnHAQPPferRynwrvVgwpapKE1wYwj6YXX7N7KwSKo4fRI9kpHbPCPLxQHT/mSjZYGf/ptZVBN1NFMmjgRtaq7RbOCT5vNwkMagVZN/G9wBDbTr7wck+w0nRwOwd+nOenOQCZJk9d2wX77TngkfKBJuxwoN3FArX8DPhBukpw5PY0TfHmWRTyrGgCEpBfcwLW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(8936002)(36756003)(6486002)(31696002)(2906002)(508600001)(7416002)(38100700002)(83380400001)(186003)(8676002)(66946007)(66476007)(66556008)(316002)(4326008)(6506007)(53546011)(54906003)(110136005)(2616005)(6512007)(26005)(31686004)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W6Dpb1b3QlvtbmL8O2q++2czhH4lTZut+QMxGhXkJ4V0qDdtPCfEkjM1aqwo?=
 =?us-ascii?Q?k9TmgI+uBucAv4zHvbCUOTsXRAmhVP7aHlPJvgGhizmz3BGkXcLDVErhPwWV?=
 =?us-ascii?Q?usUA5nL84gHpy3/LJ7fBe3emXk5wjEduyvTCrdYbcBAsukqNpkR16WmTdDLu?=
 =?us-ascii?Q?Qsg+mru1z1O06I5rDJFJDfhfnmPwHmIMmzOf50A2MfkmR6CoIneaTr+RpjY1?=
 =?us-ascii?Q?NTTlsjNlcWEKEOj1Y9mlwcVmflFWR7hQkl3t5DA9LY3Uq+NxW+3LwWZVKaXW?=
 =?us-ascii?Q?UCndtrCvF282YfJ540IfAT82gjCj4m707chwxZ2p8Iz5Rad9DXtyKunmW7Bc?=
 =?us-ascii?Q?ei5K0XFEcJsJpB8hxhsNmq+L/3B0FqERF8ihA2hsdqxhZPXnja9Y7q0UlvME?=
 =?us-ascii?Q?m1TLchLzRnwA0cZdGfibVtKXrMRvvxIzBUIIlaC1jFgTGgl8Z6bTKGVNEcIu?=
 =?us-ascii?Q?ip+BmulS7Z7RK7oXnwVmQIcoJ6clqbHsl6oiCgBGa4IzVhkhTzop8QdmJpAd?=
 =?us-ascii?Q?X9zyN8MyP5Jzxzhv5kRd/RPjv9V9hcvo7plNjqXezV1nIdjqHMoZvPsOABZQ?=
 =?us-ascii?Q?KaZaII+OVjjWIugSFFfaHFzmsyuChgi+U5BzmrdNNvGbjAwAcpslOdW6N2xu?=
 =?us-ascii?Q?NJ3hB1dZ28A9toeEmqEn/gXOA9DEKrkj0Rij9whyGpPqj5AQmf90xEoRQkef?=
 =?us-ascii?Q?2iFgWvEsFPwjqMu5w0in5Jt+gP0Zg7++ODkLqLhQde5ZZm9m/qPKynU5PGt9?=
 =?us-ascii?Q?pt2/k56HVjzTGoqE3Yu2x8G+7+9CjtpvWffIaJ0x6CYer3wup0mG423eBZla?=
 =?us-ascii?Q?26TpTyxydv6Kj+LxS1ELL2dmM3HNgK0S5ZQCUEst3bwxWIMlutVGmbC3Tscm?=
 =?us-ascii?Q?3j5gRQr1ebkFN5rTW9YN1RtEDwVCBX4fNhMyhS1pEELZ5nz8VIovtuK3mXbR?=
 =?us-ascii?Q?GweOHZdSUsLII9Kn7NxNAJBbLhznwhxBzpcw0poxlrC3fGWnEIhSXlPz1nVM?=
 =?us-ascii?Q?8JrmdcxImsjMrXdzXUQUFjXJEysYw57xvhI3Cl8iDXPpmB/8WTAXXI+jfP/q?=
 =?us-ascii?Q?7SQjZmuQauya2fBnkqWJS0xRWWyesZ8kqtk2UPk/CpqQo3g75z2AVYoXxqS0?=
 =?us-ascii?Q?tFt4rfw+TnR4cb7G3OZ9QJ0YTsU7z5N99AGjFKydhNug05Yqe0q0SuRM+U5P?=
 =?us-ascii?Q?PfrvHdtjZ2kD5uIKE6sXg7COf/mQDtVzfg0cGkfn7l3JxUS2AI0y+1QyzHvK?=
 =?us-ascii?Q?WxRJ53pb2wmBbFUiihd6ppJArf5ACSZtaRw03E0hI4FebMeHoynKH7ylpTb9?=
 =?us-ascii?Q?YEzr6rnfyS5MAWwYt8YBjluLZz3MKisrqL0VTxzLpjKu0jRUm4aNH53BhGw0?=
 =?us-ascii?Q?WH0/m8bJI/GVlvSrARDZQ2vHWlaAZ1/d00OqKkdPNhwWtLWS1AoH3/sFLe4d?=
 =?us-ascii?Q?5Bg+8CZWeEax7girbbCFTpxRWHfuhvfvuAaKzTscCoAhOIKSPwtsWADihgiC?=
 =?us-ascii?Q?pFXqxQ5H6rfc5KWawxrwfGPM5NQSOf8B7JI0+RLxe+brF5Wgv60oFIEGvIwi?=
 =?us-ascii?Q?OIbPgek8hQD3byS4wVBZOt0iAsGOH/pe6T6wCuTJr22hKI6TwRgOHlV/nhvI?=
 =?us-ascii?Q?aQkoFyyYpKobsVdZL7WwnpbFOn+JcBmHA+CpQ2lbd24Mqg7KpTnwiq+cY9Ys?=
 =?us-ascii?Q?ycvyRsTGBHiYXkZAzPIySWi6LStkpx5uzHiBQbQUQQesuff9d3vxEgwR3FsX?=
 =?us-ascii?Q?tzymp82yBw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7ec5bb8-8c6b-4a1b-9b0c-08da28edf743
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 08:06:14.9296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DQ+d8ceLso6fPSw1+wERqnIgRRIiMTzqf/78Xwt2rHd0u9Q4jblN5bb13rS+gvLi0sJgmkcr2F6HQhnAWNDo2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6363

On 21.04.2022 16:26, Jan Beulich wrote:
> There's no good reason to use these when we already have a pci_sbdf_t
> type object available. This extends to the use of PCI_BUS() in
> pci_ecam_map_bus() as well.
>=20
> No change to generated code (with gcc11 at least, and I have to admit
> that I didn't expect compilers to necessarily be able to spot the
> optimization potential on the original code).
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> ---
> Note that the Arm changes are "blind": I haven't been able to spot a way
> to at least compile test the changes there; the code looks to be
> entirely dead.
> ---
> v2: Arm build fix (for those who actually have ways to build the Arm
>     code being changed here).

May I please get an Arm side ack (or otherwise) here? Especially the
2nd, dependent patch better wouldn't remain pending for too long, or
else there's a fair risk for it to go stale.

Thanks, Jan

> --- a/xen/arch/arm/pci/ecam.c
> +++ b/xen/arch/arm/pci/ecam.c
> @@ -28,8 +28,7 @@ void __iomem *pci_ecam_map_bus(struct pc
>          container_of(bridge->ops, const struct pci_ecam_ops, pci_ops);
>      unsigned int devfn_shift =3D ops->bus_shift - 8;
>      void __iomem *base;
> -
> -    unsigned int busn =3D PCI_BUS(sbdf.bdf);
> +    unsigned int busn =3D sbdf.bus;
> =20
>      if ( busn < cfg->busn_start || busn > cfg->busn_end )
>          return NULL;
> @@ -37,7 +36,7 @@ void __iomem *pci_ecam_map_bus(struct pc
>      busn -=3D cfg->busn_start;
>      base =3D cfg->win + (busn << ops->bus_shift);
> =20
> -    return base + (PCI_DEVFN2(sbdf.bdf) << devfn_shift) + where;
> +    return base + (sbdf.devfn << devfn_shift) + where;
>  }
> =20
>  bool __init pci_ecam_need_p2m_hwdom_mapping(struct domain *d,
> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -839,7 +839,7 @@ static int msix_capability_init(struct p
>              pbus =3D dev->info.physfn.bus;
>              pslot =3D PCI_SLOT(dev->info.physfn.devfn);
>              pfunc =3D PCI_FUNC(dev->info.physfn.devfn);
> -            vf =3D PCI_BDF2(dev->bus, dev->devfn);
> +            vf =3D dev->sbdf.bdf;
>          }
> =20
>          table_paddr =3D read_pci_mem_bar(seg, pbus, pslot, pfunc, bir, v=
f);
> --- a/xen/drivers/passthrough/vtd/qinval.c
> +++ b/xen/drivers/passthrough/vtd/qinval.c
> @@ -267,7 +267,7 @@ int qinval_device_iotlb_sync(struct vtd_
>      qinval_entry->q.dev_iotlb_inv_dsc.lo.res_1 =3D 0;
>      qinval_entry->q.dev_iotlb_inv_dsc.lo.max_invs_pend =3D pdev->ats.que=
ue_depth;
>      qinval_entry->q.dev_iotlb_inv_dsc.lo.res_2 =3D 0;
> -    qinval_entry->q.dev_iotlb_inv_dsc.lo.sid =3D PCI_BDF2(pdev->bus, pde=
v->devfn);
> +    qinval_entry->q.dev_iotlb_inv_dsc.lo.sid =3D pdev->sbdf.bdf;
>      qinval_entry->q.dev_iotlb_inv_dsc.lo.res_3 =3D 0;
> =20
>      qinval_entry->q.dev_iotlb_inv_dsc.hi.size =3D size;
>=20
>=20


