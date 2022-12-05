Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D626429ED
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 14:53:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453680.711270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2BuW-0004SG-RQ; Mon, 05 Dec 2022 13:53:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453680.711270; Mon, 05 Dec 2022 13:53:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2BuW-0004PB-O1; Mon, 05 Dec 2022 13:53:32 +0000
Received: by outflank-mailman (input) for mailman id 453680;
 Mon, 05 Dec 2022 13:53:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vUwf=4D=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1p2BuV-0004P5-7A
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 13:53:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20624.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d45bb17-74a4-11ed-8fd2-01056ac49cbb;
 Mon, 05 Dec 2022 14:53:20 +0100 (CET)
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AS8PR08MB7992.eurprd08.prod.outlook.com (2603:10a6:20b:571::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Mon, 5 Dec
 2022 13:53:27 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::b45:fa8a:caad:25c0]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::b45:fa8a:caad:25c0%4]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 13:53:27 +0000
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
X-Inumbo-ID: 2d45bb17-74a4-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=db7dlU4qoH2YQMF3Xl6/aKbDuHfk9OSR0oELCy8v/hRCGdKRbs78RkhUgtkbyJLvwGKhKkS/aufK6p/HVUSlTgEdG6U8tvYwQAuVLIW7gV1oWNcORjRU8JqyfsjXydOzMEx+YSLoWl8z0MoqYwTud8rmTfWjvtExtychGb/a2cPL47o8rBcq0JKSU0RAoPyWTIBnOBKSO29VVqm1aqapG3ZVodNHmXi/sjq3sLoHqIkqOlm6DYqmPYhcoHl4zaYiHdKloHDv1ofqObnfK7T8G/75If5aho6pnxaRrVy10ixGRrkmRsoDClNirdvjUlhkU8bg8EgH6ro2xxnkpiycpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOB1hVu11kHCktX8BhmH719TJWvlYfDab4pnHWnZ5Ko=;
 b=YZaCcTRM9EoSRLPdfVwI1sz4B3YnpRe0WFfS/HNM0pR14bMWDxswdBsPxc2OVperkjLbd8IpNJGGBkPjoDPGmsOxhmOtHuPGWTRlFywSgdfrLfleQyk8DgeewAF/e5t2Xurd/OHBAQrYD0qZPFQ522pVvHAgzU8SKy1ja49OdMdbhmne3A/ipF9zMW9pmlNVq2qgOytVYJ8r/3lYi6jD7uMPOMhZyPu9gVEPjGlSh1yieBCTyxpR9+LAD6BLBHZq9KQCcBy4DSUZ91yj6K28nv2l5w5AelWCPnQgZ+wn9qCGA97KZuWeb7k8wdD61FeI7cvBOs6cX1PTcrviUUWnJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOB1hVu11kHCktX8BhmH719TJWvlYfDab4pnHWnZ5Ko=;
 b=Yab1urkEUIHDQ6lYo4pRl59KCGdK0tTV8cUQP8S+mQubXwHQvsSRbmaFvX2XgecyXI2a+wSV26AYqYFSr88uHqIGnKvTJspzOwctcD4C4+C0cBxf+Blx5fRPNtPKDM0w94vHpaNwqr42C4FctiL9GrVFAq1syktETcfXCunEndI=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Paul Durrant
	<paul@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [RFC PATCH 04/21] xen/arm: vIOMMU: add generic vIOMMU framework
Thread-Topic: [RFC PATCH 04/21] xen/arm: vIOMMU: add generic vIOMMU framework
Thread-Index: AQHZBZ7dBYCbekoSiE+Vqn2CZKLLUK5e+1eAgABbRAA=
Date: Mon, 5 Dec 2022 13:53:26 +0000
Message-ID: <4D9FBC4E-CF83-4D45-B657-A58041EAFCAB@arm.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
 <505b4566579b65afa0696c3a8772416a4c7cf59f.1669888522.git.rahul.singh@arm.com>
 <345d7d3c-e090-356b-1b4e-a9b491a146b5@amd.com>
In-Reply-To: <345d7d3c-e090-356b-1b4e-a9b491a146b5@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR08MB7158:EE_|AS8PR08MB7992:EE_
x-ms-office365-filtering-correlation-id: 4ecb94d4-f10f-4a3a-4ee6-08dad6c8159a
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 4k6pNLHQ4gLGFrxqc55JYUKp82Xgfj/xi4BLODRMx/XRkcQlLpE0eY68pprKJT77zdk8G2nmJ/Wub89gJ0GUGbzI2m1TRj1P3/mOKx6PpcFYBAr3ui0qAcTCUEJbRD5drL20NpaVJcuZxuLxYTMnOxRX/oprZBELmgXSib47DJlkkJFuHo7jp+kF4I5ZHfV1SYY9XZlZ1VQ6ivfWUK46biCJdhi+fpy1FWyyX6QTiKf67ZqJmZgDNmvgJrpWQUSJqbAE4qf1VkjXX7Zt2UbY1HUc/qnRDUWdTmXpCW5RX2DGAKKPy1OCuf6XEkLlQvWKKNXlRQVltuzqKC8XAokbgYjP9b+sacoo7eIK4lTLM5pTNxBCqd2LmQhwx0ilNOVmb9GiQlta2rwpMxbIVgiwxRvQs5lsifPMPct/3t6n8EQTAmq/8YRarTOeWeE+hglKsyBNKhi5eOsj5Q95mGPM0ZOZOff6kvU4z/AhZwW3wagvNn/WhKKlz5wrUa+1zl/UaL9bBrgN6n/6aaHetU/EK0FV5mj1iwZHRLqVJN4lENctpXpkcl9Fu0gUf8Ajev68yE+7iqRt9JQLLThhZYnuTRhf6gVXn967+/YMSLkp/AP497jRfm2Kw8fSh6ehXovyXVyTtPN2cuKLHmPT6VeXed6mgJ85Nkkl+zx0OGTB/MkU/PqBAfc3T0kTiLJXk3M5clLXBMr4rZE5b9Jyn6fFxdm0fKhSGq6pMz+mKkoN0oi4L39P/v2+BP4YPSG9iLRpYhOViD9W2YdjyvmYEjK8DiHQ14e+5OLS5vTQGbgye3k=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199015)(478600001)(71200400001)(53546011)(6486002)(6506007)(4326008)(64756008)(38070700005)(8676002)(36756003)(2906002)(26005)(5660300002)(83380400001)(2616005)(186003)(6512007)(8936002)(41300700001)(33656002)(54906003)(38100700002)(6916009)(316002)(91956017)(122000001)(66556008)(76116006)(66946007)(66446008)(86362001)(66476007)(41533002)(21314003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?gMm2FmlGDNwdCbVjAOGzNMo7QOsywubWuzui51AmbsTEKkl2NoCs7ffqiE?=
 =?iso-8859-1?Q?W+xUrcs59+tq5GkAkJv907UycWnhuzJHHPVw31bNTxJ8CRf90zdirZme3f?=
 =?iso-8859-1?Q?6REHDUuioiuycIqu1t1oiuS0gRXflYCTo7/QABNgCs421JSl+ck9Li8+dy?=
 =?iso-8859-1?Q?vdIDhAFg17yWJ7QMf8ij9kl5yDbOPAv4u7PGdOOcOxnZhGHbE/Rnv7qyDK?=
 =?iso-8859-1?Q?aG8S8IVGWIgyPW7SQBFh1knON4vJs3eCZudDqwYsKKd8CqOJZSrh97gJPN?=
 =?iso-8859-1?Q?T5k7+thApoYeYBLbluzn4fcjiOOhvLih/BfxXfxN8hlrl9t5X8x+B956lX?=
 =?iso-8859-1?Q?vAeYhZzTrGnTRsF+yNAppT3pbDYZP2w36IOBwyOzFs86S+VLb7Qy4lQDr9?=
 =?iso-8859-1?Q?CthWuHHdoK/yQHo6UOGNSIHoEOYcxf8Y3ufPipgywAg6473X9fzZFIXZpi?=
 =?iso-8859-1?Q?vSHSySNNBYBx7hI+zeooHpQtG+km2lsxr+5hVZfhF5FfnZS6i6pT1fVgAu?=
 =?iso-8859-1?Q?ParQS5nnJuFz/58Z2nRshipbG3zjVNEYYyYK7k0nUhtO7H+CuHTYRVuRCX?=
 =?iso-8859-1?Q?xCmpqwHwZUbGgVtiGhVwx2Tf0jBP7IwN6qcZweTwt+zTRl8uQ4oGmNcTsz?=
 =?iso-8859-1?Q?01LaCdJ6ehn7UHD9Ya+1hdFZhVx2i62+DG5T8FHZslNKNxbjUS/4sTs93O?=
 =?iso-8859-1?Q?9zXPQ/m/Y0jfbMi7YYxI+1t0ndLfUc688kP3trGO49b0GSvTyc9SGV33ln?=
 =?iso-8859-1?Q?IpmESbie4RVcRTvRlN1hfi0P+2O0vk+XuDMWWbi5o11lSBjyw5DGF0YZi1?=
 =?iso-8859-1?Q?hXXVS0PCGYdbxEGrjun/tDtlmj2jjQMTu4za4tmiyXOhbte21/SrWVwSgO?=
 =?iso-8859-1?Q?UgM5EWhA5XobiDleERPnXJ6baYRZnufUdD5QndIRN7QCrxN0bUbduArjB8?=
 =?iso-8859-1?Q?olFnDeiOiKaYNozc9TxKck/3Piki7naozDkp2W8biBJnIf264fBmJl/5ao?=
 =?iso-8859-1?Q?gSUfBf2tosnOzz9FF8yiafx/hEnGtXZXhA7Vj8aDvhXt2LWQzlkC6PaMHV?=
 =?iso-8859-1?Q?kxzJX/rMCfIZmGypJlviJxbC6HUXUO0MBh8yJPnwe9uH0bkRleGtqbMfVd?=
 =?iso-8859-1?Q?YMG08viM2+Dc2GO56JQ4F5EDV55qjnvMtNhewoVrZM/PDYiMmnxwyjCf2z?=
 =?iso-8859-1?Q?VkFYcQ9dsNS1Yei9z3bmssSylAiXYtMv1x/pwqP8dV4Zoo5XgCdgrZV5T9?=
 =?iso-8859-1?Q?S7rw/NVMsbbl23jCorhiuKsqeFhrF8Gl9e9k0pkmFpnfAazWfwhD0EPUAP?=
 =?iso-8859-1?Q?grOYALLNXgqiyKLS2z0YbElmNODxOy1rWwni+CA6YCBiIootjuhue7vG2N?=
 =?iso-8859-1?Q?IP1DdhLYivTxMhTKxZWcOQUOWk6szuNrVqVp1u8sXPMiAlCQld1jv6nzr/?=
 =?iso-8859-1?Q?jSx+UxchWAzDShoyT+ZO1jFBMqy8a2PVg7wRnXUjpKNuJqt4zWY7erwM9n?=
 =?iso-8859-1?Q?Hz/8kh+1p/vkeG7yvMatJclYSvxCGK4sS+GbxQpZGqmzcNDWnRSeMJxAfZ?=
 =?iso-8859-1?Q?9jSplMQRnKZk/ta92ijvdi1a+fVSyIxDaaeWR56EHJw3zDeTOtCf5kTlgc?=
 =?iso-8859-1?Q?Cnit97C3d7EiVadDRJcWy146vvThFyFjWp?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <7394A72AEFC10343889A204DC65D5874@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7158.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ecb94d4-f10f-4a3a-4ee6-08dad6c8159a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2022 13:53:26.9959
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M7oEl37ybIXoLdZuXnU9t0LwBA2BlMM/9oRJihkyJ/o201AKS9ZrdD3vPXQTAcfsnIMiWmqKPrjvzsK+3QKAmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7992

Hi Michal,

> On 5 Dec 2022, at 8:26 am, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Hi Rahul,
>=20
> On 01/12/2022 17:02, Rahul Singh wrote:
>>=20
>>=20
>> This patch adds basic framework for vIOMMU.
>>=20
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> xen/arch/arm/domain.c                | 17 +++++++
>> xen/arch/arm/domain_build.c          |  3 ++
>> xen/arch/arm/include/asm/viommu.h    | 70 ++++++++++++++++++++++++++++
>> xen/drivers/passthrough/Kconfig      |  6 +++
>> xen/drivers/passthrough/arm/Makefile |  1 +
>> xen/drivers/passthrough/arm/viommu.c | 48 +++++++++++++++++++
>> xen/include/public/arch-arm.h        |  4 ++
>> 7 files changed, 149 insertions(+)
>> create mode 100644 xen/arch/arm/include/asm/viommu.h
>> create mode 100644 xen/drivers/passthrough/arm/viommu.c
>>=20
>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>> index 38e22f12af..2a85209736 100644
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -37,6 +37,7 @@
>> #include <asm/tee/tee.h>
>> #include <asm/vfp.h>
>> #include <asm/vgic.h>
>> +#include <asm/viommu.h>
>> #include <asm/vtimer.h>
>>=20
>> #include "vpci.h"
>> @@ -691,6 +692,13 @@ int arch_sanitise_domain_config(struct xen_domctl_c=
reatedomain *config)
>>         return -EINVAL;
>>     }
>>=20
>> +    if ( config->arch.viommu_type !=3D XEN_DOMCTL_CONFIG_VIOMMU_NONE )
>> +    {
>> +        dprintk(XENLOG_INFO,
>> +                "vIOMMU type requested not supported by the platform or=
 Xen\n");
> Maybe a simpler message like for TEE would be better: "Unsupported vIOMMU=
 type"

Ack.=20
>=20
>> +        return -EINVAL;
>> +    }
>> +
>>     return 0;
>> }
>>=20
>> @@ -783,6 +791,9 @@ int arch_domain_create(struct domain *d,
>>     if ( (rc =3D domain_vpci_init(d)) !=3D 0 )
>>         goto fail;
>>=20
>> +    if ( (rc =3D domain_viommu_init(d, config->arch.viommu_type)) !=3D =
0 )
>> +        goto fail;
>> +
>>     return 0;
>>=20
>> fail:
>> @@ -998,6 +1009,7 @@ static int relinquish_memory(struct domain *d, stru=
ct page_list_head *list)
>> enum {
>>     PROG_pci =3D 1,
>>     PROG_tee,
>> +    PROG_viommu,
>>     PROG_xen,
>>     PROG_page,
>>     PROG_mapping,
>> @@ -1048,6 +1060,11 @@ int domain_relinquish_resources(struct domain *d)
>>         if (ret )
>>             return ret;
>>=20
>> +    PROGRESS(viommu):
>> +        ret =3D viommu_relinquish_resources(d);
>> +        if (ret )
>> +            return ret;
>> +
>>     PROGRESS(xen):
>>         ret =3D relinquish_memory(d, &d->xenpage_list);
>>         if ( ret )
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index bd30d3798c..abbaf37a2e 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -27,6 +27,7 @@
>> #include <asm/setup.h>
>> #include <asm/cpufeature.h>
>> #include <asm/domain_build.h>
>> +#include <asm/viommu.h>
>> #include <xen/event.h>
>>=20
>> #include <xen/irq.h>
>> @@ -3858,6 +3859,7 @@ void __init create_domUs(void)
>>         struct domain *d;
>>         struct xen_domctl_createdomain d_cfg =3D {
>>             .arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE,
>> +            .arch.viommu_type =3D viommu_get_type(),
>>             .flags =3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
>>             /*
>>              * The default of 1023 should be sufficient for guests becau=
se
>> @@ -4052,6 +4054,7 @@ void __init create_dom0(void)
>>         printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n")=
;
>>     dom0_cfg.arch.tee_type =3D tee_get_type();
>>     dom0_cfg.max_vcpus =3D dom0_max_vcpus();
>> +    dom0_cfg.arch.viommu_type =3D viommu_get_type();
>>=20
>>     if ( iommu_enabled )
>>         dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
>> diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/as=
m/viommu.h
>> new file mode 100644
>> index 0000000000..7cd3818a12
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/viommu.h
>> @@ -0,0 +1,70 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
>> +#ifndef __ARCH_ARM_VIOMMU_H__
>> +#define __ARCH_ARM_VIOMMU_H__
>> +
>> +#ifdef CONFIG_VIRTUAL_IOMMU
>> +
>> +#include <xen/lib.h>
>> +#include <xen/types.h>
>> +#include <public/xen.h>
>> +
>> +struct viommu_ops {
>> +    /*
>> +     * Called during domain construction if toolstack requests to enabl=
e
>> +     * vIOMMU support.
>> +     */
>> +    int (*domain_init)(struct domain *d);
>> +
>> +    /*
>> +     * Called during domain destruction to free resources used by vIOMM=
U.
>> +     */
>> +    int (*relinquish_resources)(struct domain *d);
>> +};
>> +
>> +struct viommu_desc {
>> +    /* vIOMMU domains init/free operations described above. */
>> +    const struct viommu_ops *ops;
>> +
>> +    /*
>> +     * ID of vIOMMU. Corresponds to xen_arch_domainconfig.viommu_type.
>> +     * Should be one of XEN_DOMCTL_CONFIG_VIOMMU_xxx
>> +     */
>> +    uint16_t viommu_type;
> Here the viommu_type is uint16_t ...
>=20
>> +};
>> +
>> +int domain_viommu_init(struct domain *d, uint16_t viommu_type);
>> +int viommu_relinquish_resources(struct domain *d);
>> +uint16_t viommu_get_type(void);
>> +
>> +#else
>> +
>> +static inline uint8_t viommu_get_type(void)
> Here you are returning uint8_t ...
>=20
>> +{
>> +    return XEN_DOMCTL_CONFIG_VIOMMU_NONE;
>> +}
>> +
>> +static inline int domain_viommu_init(struct domain *d, uint16_t viommu_=
type)
> Here you are taking uint16_t. So it looks like that ...
>=20
>> +{
>> +    if ( likely(viommu_type =3D=3D XEN_DOMCTL_CONFIG_VIOMMU_NONE) )
>> +        return 0;
>> +
>> +    return -ENODEV;
>> +}
>> +
>> +static inline int viommu_relinquish_resources(struct domain *d)
>> +{
>> +    return 0;
>> +}
>> +
>> +#endif /* CONFIG_VIRTUAL_IOMMU */
>> +
>> +#endif /* __ARCH_ARM_VIOMMU_H__ */
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/K=
config
>> index 479d7de57a..19924fa2de 100644
>> --- a/xen/drivers/passthrough/Kconfig
>> +++ b/xen/drivers/passthrough/Kconfig
>> @@ -35,6 +35,12 @@ config IPMMU_VMSA
>>          (H3 ES3.0, M3-W+, etc) or Gen4 SoCs which IPMMU hardware suppor=
ts stage 2
>>          translation table format and is able to use CPU's P2M table as =
is.
>>=20
>> +config VIRTUAL_IOMMU
>> +       bool "Virtual IOMMU Support (UNSUPPORTED)" if UNSUPPORTED
>> +       default n
>> +       help
>> +        Support virtual IOMMU infrastructure to implement vIOMMU.
>> +
>> endif
>>=20
>> config IOMMU_FORCE_PT_SHARE
>> diff --git a/xen/drivers/passthrough/arm/Makefile b/xen/drivers/passthro=
ugh/arm/Makefile
>> index c5fb3b58a5..4cc54f3f4d 100644
>> --- a/xen/drivers/passthrough/arm/Makefile
>> +++ b/xen/drivers/passthrough/arm/Makefile
>> @@ -2,3 +2,4 @@ obj-y +=3D iommu.o iommu_helpers.o iommu_fwspec.o
>> obj-$(CONFIG_ARM_SMMU) +=3D smmu.o
>> obj-$(CONFIG_IPMMU_VMSA) +=3D ipmmu-vmsa.o
>> obj-$(CONFIG_ARM_SMMU_V3) +=3D smmu-v3.o
>> +obj-$(CONFIG_VIRTUAL_IOMMU) +=3D viommu.o
>> diff --git a/xen/drivers/passthrough/arm/viommu.c b/xen/drivers/passthro=
ugh/arm/viommu.c
>> new file mode 100644
>> index 0000000000..7ab6061e34
>> --- /dev/null
>> +++ b/xen/drivers/passthrough/arm/viommu.c
>> @@ -0,0 +1,48 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
>> +
>> +#include <xen/errno.h>
>> +#include <xen/init.h>
>> +#include <xen/types.h>
>> +
>> +#include <asm/viommu.h>
>> +
>> +const struct viommu_desc __read_mostly *cur_viommu;
>> +
>> +int domain_viommu_init(struct domain *d, uint16_t viommu_type)
>> +{
>> +    if ( viommu_type =3D=3D XEN_DOMCTL_CONFIG_VIOMMU_NONE )
>> +        return 0;
>> +
>> +    if ( !cur_viommu )
>> +        return -ENODEV;
>> +
>> +    if ( cur_viommu->viommu_type !=3D viommu_type )
>> +        return -EINVAL;
>> +
>> +    return cur_viommu->ops->domain_init(d);
>> +}
>> +
>> +int viommu_relinquish_resources(struct domain *d)
>> +{
>> +    if ( !cur_viommu )
>> +        return 0;
>> +
>> +    return cur_viommu->ops->relinquish_resources(d);
>> +}
>> +
>> +uint16_t viommu_get_type(void)
>> +{
>> +    if ( !cur_viommu )
>> +        return XEN_DOMCTL_CONFIG_VIOMMU_NONE;
>> +
>> +    return cur_viommu->viommu_type;
>> +}
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm=
.h
>> index 1528ced509..33d32835e7 100644
>> --- a/xen/include/public/arch-arm.h
>> +++ b/xen/include/public/arch-arm.h
>> @@ -297,10 +297,14 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>> #define XEN_DOMCTL_CONFIG_TEE_NONE      0
>> #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
>>=20
>> +#define XEN_DOMCTL_CONFIG_VIOMMU_NONE   0
>> +
>> struct xen_arch_domainconfig {
>>     /* IN/OUT */
>>     uint8_t gic_version;
>>     /* IN */
>> +    uint8_t viommu_type;
> this should be uint16_t and not uint8_t=20

I will modify the in viommu_type to uint8_t in "arch/arm/include/asm/viommu=
.h" and will
also fix  everywhere the viommu_type to uint8_t.=20

Regards,
Rahul



