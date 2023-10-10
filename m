Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 199F47C024D
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 19:12:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615131.956354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqGGs-0000cZ-RE; Tue, 10 Oct 2023 17:11:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615131.956354; Tue, 10 Oct 2023 17:11:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqGGs-0000Zs-Mx; Tue, 10 Oct 2023 17:11:50 +0000
Received: by outflank-mailman (input) for mailman id 615131;
 Tue, 10 Oct 2023 17:11:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gt9L=FY=siemens.com=dan.driscoll@srs-se1.protection.inumbo.net>)
 id 1qqGGr-0000Zm-1Q
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 17:11:49 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20604.outbound.protection.outlook.com
 [2a01:111:f400:7eab::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 164ac3d7-6790-11ee-9b0d-b553b5be7939;
 Tue, 10 Oct 2023 19:11:45 +0200 (CEST)
Received: from DM6PR07MB4316.namprd07.prod.outlook.com (2603:10b6:5:c1::17) by
 CH0PR07MB8924.namprd07.prod.outlook.com (2603:10b6:610:109::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 17:11:42 +0000
Received: from DM6PR07MB4316.namprd07.prod.outlook.com
 ([fe80::df03:f5d6:9210:8dd4]) by DM6PR07MB4316.namprd07.prod.outlook.com
 ([fe80::df03:f5d6:9210:8dd4%6]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 17:11:42 +0000
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
X-Inumbo-ID: 164ac3d7-6790-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7brKgOCfIsGdUxL/97/dqh/84FPbj0Lxx0r3C5EVLZ5hYE+WOyyVBcnII5iK8BmwZcvcbwB0eeWrfcmAoK+RlA1zNB7sqIsvUGy9xyq63ZiTi8gAOhAWEJjPkDeHJnqLle16pC2tdFln7LQA3VHKfSJ/T+LrCw7GFcfI476YO5bHfS+wb4SJ6r2uS34GWb70X7bRWCq8RRRX+t08L6UyciZOVX7qLr3OKBhJlbiGG3youSRDFzFwUd+fQR5hwIIdMO3hjguuK1tGqRNvPqbhFk31TX71D8DePHCVlerhZUe3Rbb7PWQAeJ7OZVv2YCghTSNPQ79KkySxwECkGE5tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=betaDKU9pBkJ0XSaEJyJ/TwLMP5zHhxaWcNcUTf3Fp8=;
 b=RJZhpK35h8xNfMlKW/scCbgbR3KJvXyuWOoHVkOHmtDi3O4JSZ0bibiYt3A5zWIsldnDqG0tVZbj1yRjspxWd4z1AgjqvvpwN+E03fKnOEMsGrr1PjxxW1xmBM54VPaa8vF3kk66SQkyIgh47tUWKwgz8c9ylh3iUWkJQYR3AbT5lZ8IdqQ0MxcDv6+LcdVDaaG3/nsCAIltaVbh5KPHtwuHlwo2MzOGztcqt7D337mibacC5UnhFQscqHO3p6SWdLjIFcS12lYzDxjoT2UNzFEwLNsb/AR3xEwqaeoSUUR2wn1+DK8dv01l2umpB7sL1A2C5CAEgF0/cO23FYyoQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=betaDKU9pBkJ0XSaEJyJ/TwLMP5zHhxaWcNcUTf3Fp8=;
 b=nevKMiaoKoknRwgpXtOKq0BLxRk+354ninqCNwSaIqA1kyHzQpdox1Uc2JZR4Iu5mk+E52aFEpCmv+L4Oxu1TC4ivknFd01enSKYJUseq7wrJWY5ALo9Vrf2mxguwIZmJ9OCtJ1bTpmIc7qnT93CuOPFBgWc16649HPdaN9UVLKiBx27c0kRzg1yJsf5NsHHIb4fe5WEjtPSXAXcrabKiQwYMlZ5fPBqPapOkD/azm3OtdJdrGpx/NK3U13iXyT6V6zisqm9MpgIUQZfj2m68wDs9C+imnvqsnUzbSvVnKMse0zjKpSqTww+boowYbjxtExPLOBR7Agiv4hZaPpRdg==
From: "Driscoll, Dan" <dan.driscoll@siemens.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Henry.Wang@arm.com" <Henry.Wang@arm.com>, "arvind.raghuraman@siemens.com"
	<arvind.raghuraman@siemens.com>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH] xen/arm: vtimer: Don't read/use the secure physical timer
 interrupt for ACPI
Thread-Topic: [PATCH] xen/arm: vtimer: Don't read/use the secure physical
 timer interrupt for ACPI
Thread-Index: AQHZ96yxZ+gVlhB35EKAv+vh3PAOIrBDSgIA
Date: Tue, 10 Oct 2023 17:11:42 +0000
Message-ID:
 <DM6PR07MB4316E6C8F062F93E800AFD6A9ACDA@DM6PR07MB4316.namprd07.prod.outlook.com>
References: <20231005165454.18143-1-julien@xen.org>
In-Reply-To: <20231005165454.18143-1-julien@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-10-10T17:11:40Z;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=17634b2b-a011-465e-bc34-852e0e76806b;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0
document_confidentiality: Restricted
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR07MB4316:EE_|CH0PR07MB8924:EE_
x-ms-office365-filtering-correlation-id: 652b5f09-7f79-4185-eaef-08dbc9b3f93f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 du8m3eYsm+E6ZiIO/mp7bdo+6N4sdwr2P/4aUock5ht6J+2VWvJCvpCJlhPek2KVQ+OD7LK9YacMwQqtUUzmUiIRsTSEqr8nMH8u5+KIlbwfPK4hcSD9hsQJHLd6vLHAvktuE8NMlfSD+s+Uo/+qqJjJGzA/7fQyz6hTuJDDzgu+f+vQU7588DaHKSoY4Lc9YmMsbRVE1PMwXOWJyV5OW7GuOarrEfPsI7CjYJY5P7L2E8HuhyCYJm9KfE88U6r7JnXnEABiYUAkEQ2yHtQdRcmArN1AmiJy4Jmr2TEhEblYRjXuww5XPPpzX6UkAIg+hC3QJuJ+Djee2BsS14BqBYFQNnObmlmXhCQpc3N1MSZmV6aR4mrIMIm1XI6jzBPcGHCmu08VyVr0qUnliOen7TXHE8ZvQMn8gO4IXpv284cn1wCntBf5dTaatpXRALhoDOs717CKhUpmiA3eM3EmsZzyjsSmtB/7X2rBs948Kucr1HFdbhxklm6JLNzsxbUcDCSZK5fTRR8KTzPTlFFScpKncwiWmg1/y6UkLS1IBAkdx4/XJkrcaJSnU2cMs2GqWqTdPbgjXsT585Vcbg6QRCxy+KkuwyfdCqaUVaU1j13lMNit9XMCUxFEn37R2YYv
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR07MB4316.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(396003)(366004)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(55016003)(66946007)(53546011)(6506007)(83380400001)(110136005)(64756008)(26005)(66556008)(66476007)(66446008)(316002)(54906003)(76116006)(5660300002)(7696005)(52536014)(71200400001)(41300700001)(8676002)(2906002)(9686003)(478600001)(8936002)(4326008)(33656002)(38070700005)(38100700002)(86362001)(122000001)(82960400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8qDkpVvROQ0Ifj1MU6+IdJYBSWpmIOTUl+evzEdL49sPbvPTyl91JHKkQttm?=
 =?us-ascii?Q?t8JqjCs2vYiGfZUnw5nXyEsHL0e4QLDRhixpPIA9Cl5yi6HiRGfBt9f374nN?=
 =?us-ascii?Q?xaS0oC2hdp8JPGggQTdhRJ4n3iFUbMdyGCRy3vBtaKIRwTVqqF6klwlxq149?=
 =?us-ascii?Q?X2gKwKOfeSweIf3s9geSGheb+RX/My3MDpO1rwjArvyhG2YFM3CtcI6tpS4H?=
 =?us-ascii?Q?EI+d/yj8GD47w29q9W0FZ3XB4oQSVCXvszw/bi0JmRC38rZkhiDjvyOVVIgf?=
 =?us-ascii?Q?7XYFdFxl86O1HVNNp91lbf/bqWV7n0yulqg66Ix4dfEoFMI/T2sns81DqZlQ?=
 =?us-ascii?Q?kKneLXUrEr1kiknfmiRPFeZ2CqvKiCJbv/Mdjzup0lbHBVuLDb4WFosZekTH?=
 =?us-ascii?Q?3tP2N9koVzjVQTDRH5/HV3qCbpYUnD1SHdrSxs4VbZrbBb4d5E3KUPc3Y5sy?=
 =?us-ascii?Q?lxzHRLhurnf3BCQb35Sl1yXxPfo9mfPp3MdH7TpB1vy989LQ+9V8AxBxVils?=
 =?us-ascii?Q?ewm8QNqYtbUX/vMzwrMalxeftyiuTK6bfwSP6u2/Yjmibim4s0AC5TNPAkut?=
 =?us-ascii?Q?QYrlAVVWEgmUj9bZiX45qQ329T5eMnNS32F+ccCV43IMYPKIZLExR/WUUCrA?=
 =?us-ascii?Q?nxlEASr2w2dLDAllu0IfDQRU3ixxqls4KzhyGbu7H6L0/kS7JUsehDnc3Ms6?=
 =?us-ascii?Q?SV2TCgy/sZojK311fZCuVeGSFeSVkMRAezOFraeSTqkQAXN/PZ51Gl74DY23?=
 =?us-ascii?Q?2S98r4ZHrL69tLtoku/qSecG13zPUi18iHiCDPTMeT9+tnf4dXS6KwKZ4aWZ?=
 =?us-ascii?Q?sVBDlNmYRPblBsUS8d9Y5jaNliEINf1FkDyg2/wjUTYcEQE2aZ9HGtI5iHh6?=
 =?us-ascii?Q?CT4EMwmbDlgE19YHyns7pRUR9xIhIChmxl3CgivnA06VuqT7qv42wEkdS30V?=
 =?us-ascii?Q?vfl0w/znCAauxEczttvywWna5E5WhsjY27Xo0ZuznH/saIcACjxULVanfREC?=
 =?us-ascii?Q?HAH5Df5BohAj0Gvj7K2sQEdlmkfddu1R0Mx0Lpf+2ZyA0i9YpqvqP6yBWfi9?=
 =?us-ascii?Q?Z3HBeZnNoVn18exN12uNHM5m2sDyvfk1q7f1AR2XA8VIzBn9zLXhfwwUmM41?=
 =?us-ascii?Q?6mp18hakPOZQEk3d4cqQKxqo988lqyKC65i2UwrSmbPyrsdWppE0I/QL4259?=
 =?us-ascii?Q?ZPsGtcfMuKnHmuIwX98k9g4d5gKn8hDFyTXjsaKiPeOdny7BmK775hAD5cpi?=
 =?us-ascii?Q?JLSIC7anIbJ9J6IMEnOBaGZ2+AOxnAuQYuN7rQlNTLl5/qYaifFOYbQfq8Ue?=
 =?us-ascii?Q?1XMSJcBguwNN9ZKHRRK/OVyZcEc5UdxaCAzsjXC9GCKHQ4ZPYl9j/kQolk1c?=
 =?us-ascii?Q?LcoZbJHZ2s/+tBMprC70KudGO3vKOfoSJofF9Gihb/XuAu/YzUvRPM2oD5dk?=
 =?us-ascii?Q?mu/MeWTRFHg5xuw1fos1J37Es4M86t74RUhaiI9HUZsvU2Sd0Q+gbs0fTuAT?=
 =?us-ascii?Q?hZF/m1EeNDsfsu3ND2vJXn4zWEnwsLkWSXbFKVT/nqRl7dgFQ59pYTEJ2ZX3?=
 =?us-ascii?Q?1dJv1q30dPdJ9O1nIUN76auW5EKpfimWZZx6WYo0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR07MB4316.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 652b5f09-7f79-4185-eaef-08dbc9b3f93f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2023 17:11:42.0879
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UhmA324Fz8/QXNDAHLSfebSva8H51wkA+UQNcdvu0fnQXcx8pZPq1XZUpz4NRMN5Au0quxJnfgmHPeNodXywfTiMjIfiSVhg7VSyoNfvOd0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR07MB8924

Julien,

	Verified this patch works on Graviton 2... so looks good from this perspec=
tive.

Thanks,
Dan

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Sent: Thursday, October 5, 2023 11:55 AM
> To: xen-devel@lists.xenproject.org
> Cc: Henry.Wang@arm.com; Driscoll, Dan (DI SW CAS ES TO)
> <dan.driscoll@siemens.com>; Raghuraman, Arvind (DI SW CAS ES)
> <arvind.raghuraman@siemens.com>; michal.orzel@amd.com; Julien Grall
> <jgrall@amazon.com>; Stefano Stabellini <sstabellini@kernel.org>; Julien =
Grall
> <julien@xen.org>; Bertrand Marquis <bertrand.marquis@arm.com>; Volodymyr
> Babchuk <Volodymyr_Babchuk@epam.com>
> Subject: [PATCH] xen/arm: vtimer: Don't read/use the secure physical time=
r
> interrupt for ACPI
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Per ACPI 6.5 section 5.2.25 ("Generic Timer Description Table (GTDT)"), t=
he fields
> "Secure EL1 Timer GSIV/Flags" are optional and an OS running in non-secur=
e
> world is meant to ignore the values.
>=20
> However, Xen is trying to reserve the value. When booting on Graviton
> 2 metal instances, this would result to crash a boot because the value is=
 0 which is
> already reserved (I haven't checked for which device).
> While nothing prevent a PPI to be shared, the field should have been igno=
red by
> Xen.
>=20
> For the Device-Tree case, I couldn't find a statement suggesting that the=
 secure
> physical timer interrupt  is ignored. In fact, I have found some code in =
Linux using it
> as a fallback. That said, it should never be used.
>=20
> As I am not aware of any issue when booting using Device-Tree, the physic=
al timer
> interrupt is only ignored for ACPI.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
>=20
> ----
>=20
> This has not been tested on Graviton 2 because I can't seem to get the se=
rial
> console working properly. @Dan would you be able to try it?
>=20
> It would also be good to understand why 0 why already reserved. This may =
be a
> sign for other issues in the ACPI code.
> ---
>  xen/arch/arm/time.c   |  4 ----
>  xen/arch/arm/vtimer.c | 17 +++++++++++++++--
>  2 files changed, 15 insertions(+), 6 deletions(-)
>=20
> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c index
> 3535bd8ac7c7..8fc14cd3ff62 100644
> --- a/xen/arch/arm/time.c
> +++ b/xen/arch/arm/time.c
> @@ -78,10 +78,6 @@ static int __init arch_timer_acpi_init(struct
> acpi_table_header *header)
>      irq_set_type(gtdt->non_secure_el1_interrupt, irq_type);
>      timer_irq[TIMER_PHYS_NONSECURE_PPI] =3D gtdt->non_secure_el1_interru=
pt;
>=20
> -    irq_type =3D acpi_get_timer_irq_type(gtdt->secure_el1_flags);
> -    irq_set_type(gtdt->secure_el1_interrupt, irq_type);
> -    timer_irq[TIMER_PHYS_SECURE_PPI] =3D gtdt->secure_el1_interrupt;
> -
>      irq_type =3D acpi_get_timer_irq_type(gtdt->virtual_timer_flags);
>      irq_set_type(gtdt->virtual_timer_interrupt, irq_type);
>      timer_irq[TIMER_VIRT_PPI] =3D gtdt->virtual_timer_interrupt; diff --=
git
> a/xen/arch/arm/vtimer.c b/xen/arch/arm/vtimer.c index
> c54360e20266..e73ae33c1b58 100644
> --- a/xen/arch/arm/vtimer.c
> +++ b/xen/arch/arm/vtimer.c
> @@ -8,6 +8,7 @@
>   * Copyright (c) 2011 Citrix Systems.
>   */
>=20
> +#include <xen/acpi.h>
>  #include <xen/lib.h>
>  #include <xen/perfc.h>
>  #include <xen/sched.h>
> @@ -61,10 +62,22 @@ int domain_vtimer_init(struct domain *d, struct
> xen_arch_domainconfig *config)
>=20
>      config->clock_frequency =3D timer_dt_clock_frequency;
>=20
> -    /* At this stage vgic_reserve_virq can't fail */
> +    /*
> +     * Per the ACPI specification, providing a secure EL1 timer
> +     * interrupt is optional and will be ignored by non-secure OS.
> +     * Therefore don't reserve the interrupt number for the HW domain
> +     * and ACPI.
> +     *
> +     * Note that we should still reserve it when using the Device-Tree
> +     * because the interrupt is not optional. That said, we are not
> +     * expecting any OS to use it when running on top of Xen.
> +     *
> +     * At this stage vgic_reserve_virq() is not meant to fail.
> +    */
>      if ( is_hardware_domain(d) )
>      {
> -        if ( !vgic_reserve_virq(d, timer_get_irq(TIMER_PHYS_SECURE_PPI))=
 )
> +        if ( acpi_disabled &&
> +             !vgic_reserve_virq(d,
> + timer_get_irq(TIMER_PHYS_SECURE_PPI)) )
>              BUG();
>=20
>          if ( !vgic_reserve_virq(d, timer_get_irq(TIMER_PHYS_NONSECURE_PP=
I)) )
> --
> 2.40.1


