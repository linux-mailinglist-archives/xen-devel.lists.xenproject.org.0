Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 865226429D2
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 14:49:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453671.711259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Bq5-0002VK-94; Mon, 05 Dec 2022 13:48:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453671.711259; Mon, 05 Dec 2022 13:48:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Bq5-0002Sw-5c; Mon, 05 Dec 2022 13:48:57 +0000
Received: by outflank-mailman (input) for mailman id 453671;
 Mon, 05 Dec 2022 13:48:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vUwf=4D=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1p2Bq4-0002Sp-8N
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 13:48:56 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060b.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ec36f08-74a3-11ed-91b6-6bf2151ebd3b;
 Mon, 05 Dec 2022 14:48:54 +0100 (CET)
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by DB9PR08MB8228.eurprd08.prod.outlook.com (2603:10a6:10:39d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Mon, 5 Dec
 2022 13:48:52 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::b45:fa8a:caad:25c0]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::b45:fa8a:caad:25c0%4]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 13:48:52 +0000
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
X-Inumbo-ID: 8ec36f08-74a3-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VnoK0BilEUx9KMv3fqIm0D+0897KB1HDhKHQoKB6+nnV4ZGq72Qbw2ZqX/h/k9MkLX5AfB2OWgzb3N7vrBb4zzGI7mF3vhwG86yiZp2Zd/Xj2rqPPAUuElzbUX67kjN/uFy58qLVjsGaSE0sqgtq02Ns4wjKDoL1jVQG6TbeZLk7yGycLum5xKYYC3+wMdfX7eN3OtUyh1SmuJG3VDHLmSFI6LdTJeTF68yy0tILfHA5iAwxB4epS4Gc4NqTZ3CKGPlWohbYc8TvL1IJ8ngXyru2Nw3aekC4InV4ksE7OmHfl5zo5wfO82swTjWc/VCWOMDVgulkUhsBD29KuMwVsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vt0Dh9x/gESUCEJ/ulRO78Bjfd/BSiGrYUpdk531oCM=;
 b=kwRrSfWNNLPy8C/k56lIIP6rerHVYl0gqBPFnWzYz2TiHMsMFq3RWuw0bkS1ESpJS2JZGvHyuugNAsLFgSeKPx7ZeJXjnVDHwOFX4VdxxiIrU1EgwHUqgjpvGljoiZ8ZsFoXrajPlbFjg2dUd4wVjtrQqAixI9jEpJYIuL1VAlrHFfjjBlwc2b4xXDFKKVdpzAlm77rmHGIe6o4JIeDQJIHPhYhz3foWm0WGNfb9NCVDqgunGeKS1MZYZE2JedqVtM49qhXCtWy2teOe2Ko7ID2+jpYc/8U+h0T+MhNlr1EgujSOSJgdYdbj7EGb45jXP7TRoTbtN+0Fr2ghPz1LGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vt0Dh9x/gESUCEJ/ulRO78Bjfd/BSiGrYUpdk531oCM=;
 b=9PTZZCu5ZAlSxtnlaxH4DIxNe44UMsASgnko4xrpWMnAZICsjKu+cydol86Up2ZEg4OCXNhYt39qn5Alz4S//JQbFD1wNOUzhFqUVQFsGG//Oi0bjybUUuEJzpNN2HGP7UxiQKAPS9TBu9OujASJ6qPNSnT7qR42elwww0ClBec=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [RFC PATCH 04/21] xen/arm: vIOMMU: add generic vIOMMU framework
Thread-Topic: [RFC PATCH 04/21] xen/arm: vIOMMU: add generic vIOMMU framework
Thread-Index: AQHZBZ7dBYCbekoSiE+Vqn2CZKLLUK5cuH4AgAKc1gA=
Date: Mon, 5 Dec 2022 13:48:52 +0000
Message-ID: <6E96FD3A-9CA8-4158-9041-EEAAAD7F7F7D@arm.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
 <505b4566579b65afa0696c3a8772416a4c7cf59f.1669888522.git.rahul.singh@arm.com>
 <e4e25940-9637-2046-18e0-82a863c2737e@xen.org>
In-Reply-To: <e4e25940-9637-2046-18e0-82a863c2737e@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR08MB7158:EE_|DB9PR08MB8228:EE_
x-ms-office365-filtering-correlation-id: 2439612f-0673-48de-a65f-08dad6c771fa
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 92LqdFSL69nXCG8fm8qaUvsiJr+kFtBC1nNgeuNo6FmqxAzlavjXJyopr4IaHzGeb9K5YAL2CuXUXhWn7WO2UGko9F0Ak0mpoJGTIPUHYqfoY+Od0lJN+AAGYvOKERWdlXUKYN9mJ5DJ2SrgMutiKho6u2MdWnsIx12QQTks855w4HIw5M0xZv8AASFi1PsHRw6Jl+Ep6SP2nKeW2do9HlClR77Kxvk5ohn/ox12gSeUulq2EBBZO07+piyDFnEpDRa7IUmvG/roLbuZJx6Y94KwzOWU3NDwHG9zvVzeaddAa2FeVs8PjsF5VU3M/i/xbbOEUaCgbRJHW8KQPvB2UfzQMUNp7YUsv2zHeR/Gr28fUDSKbQtHMi2bAPMTnZdXhIA7z+E1bwf3K4O6j1DvDNnVb8fEmGEJOewAMI8ZyUpsRZYvtbg3/FwAN518fDdK6S+izZQEG4in/+tPn+qKkr7Ty9idWh1ymB7efXaNYPKfxEnSN7gngIXcPBchnfFpWL6H23jbFfgbLanBkff1dEEWPgFotlK7JuZA48x9iDFSZSux4ohbxRthGwa8LAUJJvJLmnXPVFwYOF/4t2aFp93M3BLeOuunkydcv3k/KaNuZCNQbyddlR6wN4Rii2cMO5SS3Xt4gj4lcodyJrCH6Y3T3FTlT7zMg94Az8yQwAziK/V3hrWhEwn77JS4h723WVD9jhHQQGJgplzqTWkQBwu72bGIivpDOFpGmqw20jAHDGjheUFJIpXM1TY3AQ/8vbJ6h7Ui5ASlPAwgJLN5O+Wvzv4P0UhNuFgOse9VKf8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(451199015)(2906002)(478600001)(8676002)(4326008)(66946007)(66476007)(66446008)(66556008)(76116006)(186003)(64756008)(8936002)(122000001)(38070700005)(71200400001)(2616005)(36756003)(6486002)(41300700001)(86362001)(316002)(5660300002)(53546011)(26005)(6512007)(83380400001)(91956017)(54906003)(6916009)(33656002)(6506007)(38100700002)(41533002)(21314003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?fwbGPNpUrVtzv55vTHDBvGftHEe8zDAoubBsDWfPwCABgHHJ7uOr3dcqeX?=
 =?iso-8859-1?Q?ay4KD/ju84cjSd5zL6fPFKnOq4oUrVtgHUNS9aBJuj7ZfIssxTs4ONlJEz?=
 =?iso-8859-1?Q?MkNYbxbCLCkRYmZiBMY4aeB2exNPy0JRr/o8/M3QF4GaFcQ9KrDvHd/v+Y?=
 =?iso-8859-1?Q?4R81jPBFhi7mFN8Hfe/+r9qu2Gl1G+u8jah2eLNCR0tAXUtwpITXbIxo0S?=
 =?iso-8859-1?Q?Uexz5xBpfvBtLb5n/OVK11dXMi9k8/kMva4r1EFDZFqfIer3MgE74KIH6g?=
 =?iso-8859-1?Q?sFMxjAYcAHPbA7I2/ohOlSeS/V7UDsm/7kjCES9R02qTVuE4UCwcnRtA93?=
 =?iso-8859-1?Q?Gt9MKQSBAsFZud6IPnZ6l0s4GppY81wMK/1m9yYiH1h4sqLTbeakXbFZOc?=
 =?iso-8859-1?Q?s7WOp4XgewDv1lPw4eGMwgLwOQYxL2Y6BUr4Y4acVEf73aP0h7FfZFj65K?=
 =?iso-8859-1?Q?fLuJSXicVMBoHukXIcO4pmLDfMBTM966EdwnZnPw81p5UDTA8NAwRSnpYe?=
 =?iso-8859-1?Q?8C0trWpCeJFXdHCqBqTVCs112VpdnZIN7oQHfgH59X3B31CUEKHV4aKdmd?=
 =?iso-8859-1?Q?aZBA2JRibsKsgOm+8eBxiI8B/IiRm5RLOcgxUylYHgF9CjGgaS6Z7nYFsL?=
 =?iso-8859-1?Q?uDghIkwMKtbVzyTmKWaX5TrxcNW2cVpxamAqISC5O/66vXjwd7zpcIwYed?=
 =?iso-8859-1?Q?o/ZKTQ/pi7lYcl+gNbWxuaZf/1idxSfIZfub7vYXUR1yj2W4hIVi7yAMII?=
 =?iso-8859-1?Q?uKrQn60sV2UJEBjjJXy3GSOG3VPeCYslPsrhEmpEZHfty7xvHFAu3gHH5B?=
 =?iso-8859-1?Q?b0r0AP+2/16fF5DRRzAvXTdffQnz8v2UcVp8lGbBM6lSq2bCRisyIAKIaV?=
 =?iso-8859-1?Q?69u59/6t3iDDJ1KRCZZzrPCd3z3hYSh5CyPOEq3pK+7QQgIEDzfRZXPSPD?=
 =?iso-8859-1?Q?v1yBeVPRSu6ZXjr8HBQPnneQPcdAbNdBoRYH46wys/2VJU1x8d+E/wvzbp?=
 =?iso-8859-1?Q?8AJbovRdPGGb+db04gjFj9L7Rfg7nRJ5pLf5oLAkciFpT2XpXIbnJQyhmC?=
 =?iso-8859-1?Q?B1d0MTBrwFaMKd7lIrKp3Pu5vEaw5H4SIBCiwIIM4t1OfhdmPDCXQjnwmu?=
 =?iso-8859-1?Q?I4RJRR2M0+OmiNF1hGo9uD5Y/3EuSksvnrIUMwVBkM6isaRPS+RqWlUJzU?=
 =?iso-8859-1?Q?rFiTkpVfGHkInBw+/8s8j7uBmJVmEBk5zr28MlXR4arWZxKmRFfTxAkLZY?=
 =?iso-8859-1?Q?CkUu+hHt28nuiYAIyzM9/e7PUvLostjVaavCwKU5Qf3V2a6PxA7YM8k991?=
 =?iso-8859-1?Q?bThj8xQHALY4ykEE4GkwCEhty56bHjnkv/HW1YHp7F+ct8HrNLrEQrvLNX?=
 =?iso-8859-1?Q?5T97RcvOcORU3liuVnovnYPLMhmKBf7oXBFW+WOiTQdwoWTI4Puf2YRkZt?=
 =?iso-8859-1?Q?v6wmjqtGEkiIou4nG6KkQiuVUXJrBRpwyjAh95wGMFXWsOjl37l6KlYsXg?=
 =?iso-8859-1?Q?6zZP4uHpHqZERh2Is30jgfHhC1+dwTgryhB+punJTc8ClFWTrmGQI6mSqs?=
 =?iso-8859-1?Q?Lre+QO+y1lSzsh9yUzC/hgOkoKHfhGRIosMF+e3YwHjREzqylOQCa3L8SG?=
 =?iso-8859-1?Q?49jTLPtLlB6ofjYRtX6eSqh01l+76tdQ4F?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <430076BBE9AF5646BFD950536E881E9D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7158.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2439612f-0673-48de-a65f-08dad6c771fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2022 13:48:52.5278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5av5zKo5U9FPEU3W7XxbOlrse7+6pRN/mNLC0P7mKwjj20v4ZkOW0oyHIS3JUxMs2FCGbGs7yBgtB06/QIPvig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8228

Hi Julien,

> On 3 Dec 2022, at 9:54 pm, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Rahul,
>=20
> On 01/12/2022 16:02, Rahul Singh wrote:
>> This patch adds basic framework for vIOMMU.
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>>  xen/arch/arm/domain.c                | 17 +++++++
>>  xen/arch/arm/domain_build.c          |  3 ++
>>  xen/arch/arm/include/asm/viommu.h    | 70 ++++++++++++++++++++++++++++
>>  xen/drivers/passthrough/Kconfig      |  6 +++
>>  xen/drivers/passthrough/arm/Makefile |  1 +
>>  xen/drivers/passthrough/arm/viommu.c | 48 +++++++++++++++++++
>>  xen/include/public/arch-arm.h        |  4 ++
>>  7 files changed, 149 insertions(+)
>>  create mode 100644 xen/arch/arm/include/asm/viommu.h
>>  create mode 100644 xen/drivers/passthrough/arm/viommu.c
>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>> index 38e22f12af..2a85209736 100644
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -37,6 +37,7 @@
>>  #include <asm/tee/tee.h>
>>  #include <asm/vfp.h>
>>  #include <asm/vgic.h>
>> +#include <asm/viommu.h>
>>  #include <asm/vtimer.h>
>>    #include "vpci.h"
>> @@ -691,6 +692,13 @@ int arch_sanitise_domain_config(struct xen_domctl_c=
reatedomain *config)
>>          return -EINVAL;
>>      }
>>  +    if ( config->arch.viommu_type !=3D XEN_DOMCTL_CONFIG_VIOMMU_NONE )
>> +    {
>> +        dprintk(XENLOG_INFO,
>> +                "vIOMMU type requested not supported by the platform or=
 Xen\n");
>> +        return -EINVAL;
>> +    }
>> +
>>      return 0;
>>  }
>>  @@ -783,6 +791,9 @@ int arch_domain_create(struct domain *d,
>>      if ( (rc =3D domain_vpci_init(d)) !=3D 0 )
>>          goto fail;
>>  +    if ( (rc =3D domain_viommu_init(d, config->arch.viommu_type)) !=3D=
 0 )
>> +        goto fail;
>> +
>>      return 0;
>>    fail:
>> @@ -998,6 +1009,7 @@ static int relinquish_memory(struct domain *d, stru=
ct page_list_head *list)
>>  enum {
>>      PROG_pci =3D 1,
>>      PROG_tee,
>> +    PROG_viommu,
>>      PROG_xen,
>>      PROG_page,
>>      PROG_mapping,
>> @@ -1048,6 +1060,11 @@ int domain_relinquish_resources(struct domain *d)
>>          if (ret )
>>              return ret;
>>  +    PROGRESS(viommu):
>> +        ret =3D viommu_relinquish_resources(d);
>> +        if (ret )
>> +            return ret;
>=20
> I would have expected us to relinquish the vIOMMU resources *before* we d=
etach the devices. So can you explain the ordering?

I think first we need to detach the device that will set the S1 and S2 stag=
e translation to bypass/abort then we
need to remove the vIOMMU. Do you have anything that you feel if we relinqu=
ish the vIOMMU after detach is not right.

>=20
>> +
>>      PROGRESS(xen):
>>          ret =3D relinquish_memory(d, &d->xenpage_list);
>>          if ( ret )
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index bd30d3798c..abbaf37a2e 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -27,6 +27,7 @@
>>  #include <asm/setup.h>
>>  #include <asm/cpufeature.h>
>>  #include <asm/domain_build.h>
>> +#include <asm/viommu.h>
>>  #include <xen/event.h>
>>    #include <xen/irq.h>
>> @@ -3858,6 +3859,7 @@ void __init create_domUs(void)
>>          struct domain *d;
>>          struct xen_domctl_createdomain d_cfg =3D {
>>              .arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE,
>> +            .arch.viommu_type =3D viommu_get_type(),
>=20
> I don't think the vIOMMU should be enabled to dom0less domU by default.

I am not enabling the vIOMMU by default. If vIOMMU is disabled via the comm=
and line or config option
then viommu_get_type() will return XEN_DOMCTL_CONFIG_VIOMMU_NONE and in tha=
t case
domain_viommu_init() will return 0 without doing anything.=20

>=20
>>              .flags =3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
>>              /*
>>               * The default of 1023 should be sufficient for guests beca=
use
>> @@ -4052,6 +4054,7 @@ void __init create_dom0(void)
>>          printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n"=
);
>>      dom0_cfg.arch.tee_type =3D tee_get_type();
>>      dom0_cfg.max_vcpus =3D dom0_max_vcpus();
>> +    dom0_cfg.arch.viommu_type =3D viommu_get_type();
>=20
> Same here.
>=20
>>        if ( iommu_enabled )
>>          dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
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
>=20
> Did you mean ID rather than type?

I mean here type of physical IOMMU on the host available SMMUv3, SMMUv1 or =
IPMMU.
If you think ID is the right name here I will change it.

>=20
>> +     * Should be one of XEN_DOMCTL_CONFIG_VIOMMU_xxx
>> +     */
>> +    uint16_t viommu_type;
>=20
> The domctl is uint8_t.

Ack. I will fix that.
=20
Regards,
Rahul


