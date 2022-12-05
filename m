Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DF86429F2
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 14:55:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453688.711282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2BwY-00056r-BH; Mon, 05 Dec 2022 13:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453688.711282; Mon, 05 Dec 2022 13:55:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2BwY-00053N-83; Mon, 05 Dec 2022 13:55:38 +0000
Received: by outflank-mailman (input) for mailman id 453688;
 Mon, 05 Dec 2022 13:55:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vUwf=4D=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1p2BwW-00053C-Jl
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 13:55:36 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20602.outbound.protection.outlook.com
 [2a01:111:f400:7d00::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 787e28b5-74a4-11ed-8fd2-01056ac49cbb;
 Mon, 05 Dec 2022 14:55:26 +0100 (CET)
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AS2PR08MB8384.eurprd08.prod.outlook.com (2603:10a6:20b:55b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Mon, 5 Dec
 2022 13:55:32 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::b45:fa8a:caad:25c0]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::b45:fa8a:caad:25c0%4]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 13:55:31 +0000
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
X-Inumbo-ID: 787e28b5-74a4-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MfEK0Idms30SZYbjfkG7Lj7m6BVV5o/9jqAVPV/PcfflmuxsIQUc4oEyAWYooihFKY+P5UJiXVD8oVZfl6dfJLNnCXFRLr0lsy6sM5PWPu0oCnCqxp96cTvI/QvFYdlae7d151BlOSdfpf4FhzzbQ77/LzKBLg9ETaUCox5uss4UZHfXsdl6L315CG1fxspqS8Rce4ts+/RPdxMkqWAa+5XkXBXQUQRcZpM+e5kkoKtMio0hDjXmiZoQ3SF//7ZWKOqHuVTqUD4cO38riPF3VFQXkDVv9R6bBhwWM9Sd7nhoCq98qGy32iEz5ivHRIJnDcTpu3nQ2G/Un19mlhV/nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHwnFhqXeG9K3ehpM3sL9gSDgICEZP8DX2v+fVN9XQc=;
 b=ctDCZRbFD1ffr/IiEgvzBv7pcbv6yRdIVGFJAycFeNY/MAkyKAEc48lx+Su+baL6rM5aCmJg1ToxSr/hC7tWmYwBKGmaX6mG4CiRdAobR1vO+UZkhld/yFfDI1k0XxsjHfmDXUXXlK28BiWeXacvfnFEQmPisVCO1z9aKDTJnLuZuUhsWdlE0jfWfNTlwJmNONe34CdD5OzRXBAB7us5T6GWQ2Fd0iYFfN0xxo+0gvBW3ir+oz3GS/ki/Wp5lORhzNJUISIKhSCzr140isodHkG8vsHvosi/+V8QWaXfYZmCBxhMB4zAeDxsgsmyT6lzDVnj/GWZMlV740yhpXQqMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHwnFhqXeG9K3ehpM3sL9gSDgICEZP8DX2v+fVN9XQc=;
 b=USPif9XeKXp6BLdztRgFEaUFRuUWavXZD82VIk6wamGgtz0tCtZTrjBH9bDaXXeEznH6EQMWaxKXuWsQXxTlTG0ulV0mqexHtMt2LtIpxb/2Rqv1uAoiNDzxgc41Nvhfjd0AEPO/5f/FPStYVzjjrMI8wKoAERhOceQOcUjWvLM=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Paul Durrant
	<paul@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [RFC PATCH 05/21] xen/arm: vsmmuv3: Add dummy support for virtual
 SMMUv3 for guests
Thread-Topic: [RFC PATCH 05/21] xen/arm: vsmmuv3: Add dummy support for
 virtual SMMUv3 for guests
Thread-Index: AQHZBZ+jOmINPO0YK0q2/D3/eqDCs65e/VaAgABZ2IA=
Date: Mon, 5 Dec 2022 13:55:31 +0000
Message-ID: <8B553FEB-5DD1-4C01-903B-572E2BD8F1B2@arm.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
 <6d25bcb543190d78c26db15a0f07e9af79349884.1669888522.git.rahul.singh@arm.com>
 <b4cd1b34-3aa4-1f8c-b6f1-2ce4214fe2ed@amd.com>
In-Reply-To: <b4cd1b34-3aa4-1f8c-b6f1-2ce4214fe2ed@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR08MB7158:EE_|AS2PR08MB8384:EE_
x-ms-office365-filtering-correlation-id: afe1fcb0-8f89-498d-6dda-08dad6c85fec
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 NgEGIDH4i3q15znNBjxtc43tlhATRYhvNZvijWoTRR852LmDpqlq3yqq7xvx/SI9LaSv9E7y3sEI5pSlKhoaBFuzmsgkI93/S9WaWCWkvMpTghvDOK1mEDzm/od+xzqRTIJGKkB2idvNmf4hT126426V/HPTbDXJZ+wCLAiaZemHNnJNPlbhbIJsq+jkyZmgqY80lMrf+x5YusDXZcYi6umdmtf+Sew7fw/pNfYbChqaug3HPWpoLCuuwjN7cexT7HHh/rzr7oyQfYQd3uLW96CLrfTOYQVFMJlEr4L6F2+1XnFPs7SImxIWiF26IXw6PMnlKaLh9eVH9C5l0P4VmadCYnIgKhIAcqQ1HcnLBfj6LOt0kSNf10bWZh/GJeVKbrEYRFv4/2Iij36tYDBD+x2/BVmW/ywRLW061B5lChvN+eoEz2rcn2VCQjSfaeYVKfeLH5cFO7SPb9ZhI5DzD64fODTSf/WIEopSweJNh/dyRg5/voZmZbxL+R15sYVm+M/4Iv4ie6dn4DfPSBpU/yFNjFgnO2vamj1h/HY5XHpbMKfj2FhK7yaQQfJKWK9U+MOdMAI9Lghc+TITK6VT1O3s6WwT4I1+sF7Xl1B9arL/izOa4dfEl7YhzLzt+yVILpVW7XxobjbkgrN6PrBPgeBaVbDS0cYThtpzqSQfIuJDKAtKBbRCMNytykCfJsluVbLgoBRh9YzaEYJPwaZIVEP5sfQ6opgSCbFMQdXIdIM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(376002)(136003)(396003)(346002)(366004)(451199015)(36756003)(71200400001)(83380400001)(316002)(6506007)(186003)(6486002)(6916009)(54906003)(6512007)(26005)(53546011)(2906002)(33656002)(86362001)(66556008)(66476007)(64756008)(76116006)(66446008)(66946007)(4326008)(122000001)(38100700002)(8676002)(478600001)(2616005)(38070700005)(41300700001)(8936002)(91956017)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?LZmbtF6vfpHGC9GsOw/k/mJ1aS5b3ghrrrPyRESA2rta3G8GzyfDRsEw4E?=
 =?iso-8859-1?Q?t1vvMbS2bccMHV4GCyYiiDvSxt1fvwN5LPD0sHMOuAggp0BN5UMlw3vHIE?=
 =?iso-8859-1?Q?Tb1kH1i26zEH/uKFCaU9BH3xXf+ULXYnQs4YG79yw2ASOo5HW5sq2FAiD4?=
 =?iso-8859-1?Q?o0FxqZuOQBDGLoNsyJVNSabvhEqiv7Z2XLdPO4CYAYZsIoJhWrAqyXC6Ng?=
 =?iso-8859-1?Q?OYbDWSs5sdhtF6eXVEb4mC0MOcPsZ5wKt27/9lMUElzRxwyHS8z+3LPn/b?=
 =?iso-8859-1?Q?X2xCAIp9FYp/HL+zfa8/eTthW3NlpcQ0H4xpTvzhtpd4UlMtz0TrW8Tt1v?=
 =?iso-8859-1?Q?ggeokbR2FOzX8V7hHZPDIGDDdql/S3TXbx77yv9laEur4Xi0uCy9j4ukuB?=
 =?iso-8859-1?Q?80Tv9tmCjC1zAoQzQQjvCC67NPW1DAgvJVx4oosclH4jcYOJpiWcFPg9c/?=
 =?iso-8859-1?Q?ebRhHDn3KURJQ06K5VLHE34Tlt0QGm0sy4j/jhrr6661OML5mKQkwtlza9?=
 =?iso-8859-1?Q?YLWPm5XP7mwIcVejSdgOhrl6eN2TqnLMz5khGrzx0anAjIP94GkSD1lnmJ?=
 =?iso-8859-1?Q?NFzX0CUk3Ae87WJkCMhchI2tCQMRw7A1Y/4Z+MJJOSBAOxvSd4NeDwVcik?=
 =?iso-8859-1?Q?IsPDPlHhbPV1yvR5FMzSX3tABH5HS2jZi3cPLRV3p3TsIvfq8k0Px5dVNX?=
 =?iso-8859-1?Q?JBCW42CemT94VGHJBhxREvy162BpDxisCElWzO+hgGdAj1A9SL8b9J39ot?=
 =?iso-8859-1?Q?xIOjDGIQQKnKml22eU2Is0eBD4O83mDFZ6BpprhAvFKHZ+xQY0SK0l3Q4P?=
 =?iso-8859-1?Q?HN224NYHYxI9yGJJ7576xLMv70EJs5pmOeRaRBYtlt91EFovo64NKVcWBv?=
 =?iso-8859-1?Q?iuqKS0wsEQlaqHvdO1BBOsLTmlsrxk9UAJSpWAGZVYdB6ptXSBZicsl5yl?=
 =?iso-8859-1?Q?R5lkrEg8Cs/AnY2QDmtWWYdxfDc9l5DYSwaGqpZLiIGiyR6a6rgOotE8fg?=
 =?iso-8859-1?Q?27tcg9nFBwRW5eavpOELveXSI3ZGk9ZSseR9tk6GHAuBCKS3Iysn+RE/NI?=
 =?iso-8859-1?Q?7SPE+XwQaq2/n/vB5ynPWulFdi78YMfwpTOajCrtdW0d3XsP+UYdLyyqnv?=
 =?iso-8859-1?Q?Sq9Q0Af6cGhxp6cFcMAM1ljjODOCMeEtD7U7Idiva/buUkmdsfRycN5sDT?=
 =?iso-8859-1?Q?WtG+1Q0rCZSdx96pTiaBdweXMzT+Anv0awiW4OwNFT7E+vNOYQFNKTZBya?=
 =?iso-8859-1?Q?BzHvUWxg30Tk9Te4DWSkxDui//OmXdzlz5dpIkOHL/rwrlDD1J4T+h4dH/?=
 =?iso-8859-1?Q?KMbKaGGal9O82UTHX8SwW4m0z24NkmqlpMghTa12vG1RGpreV+bSVe7Uqi?=
 =?iso-8859-1?Q?7QkKdxgiJ9/uAW6iPboNOEIdZjPCgtMFSjPUkQh6n1UtjkFAzQJOxnbQ+x?=
 =?iso-8859-1?Q?hcC/p1bAwbyAE6N70AeC+kEtwVC/IVm4lafH42bHmdsob9HaAsIJKXuPcw?=
 =?iso-8859-1?Q?39E0BmLM/t2M0Nhs/x2kv+E97mMDJ3xy+mTe1GFW7xdqWQ72RLyBbJpIhp?=
 =?iso-8859-1?Q?7mJgJhaw2/QTi7HzBma1qjdbrHRnGdYdwFdmoKJoR6SIjUIuDP8214rHcD?=
 =?iso-8859-1?Q?UguNmj3qoUR0977BLPnkdLgco7BzO1+id6?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <96D03BAE1289F24C9BB9DE72A73864D0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7158.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afe1fcb0-8f89-498d-6dda-08dad6c85fec
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2022 13:55:31.7011
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HTc19WGMP62Cfc6a0yb0F0ZWXksmtAznk4hDlIQcBzi8t7jtyg1saPmKmH64OWxJ/Pdo5QEF580lRvxtAq2dVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8384

Hi Michal,

> On 5 Dec 2022, at 8:33 am, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Hi Rahul,
>=20
> On 01/12/2022 17:02, Rahul Singh wrote:
>>=20
>>=20
>> domain_viommu_init() will be called during domain creation and will add
>> the dummy trap handler for virtual IOMMUs for guests.
>>=20
>> A host IOMMU list will be created when host IOMMU devices are probed
>> and this list will be used to create the IOMMU device tree node for
>> dom0. For dom0, 1-1 mapping will be established between vIOMMU in dom0
>> and physical IOMMU.
>>=20
>> For domUs, the 1-N mapping will be established between domU and physical
>> IOMMUs. A new area has been reserved in the arm guest physical map at
>> which the emulated vIOMMU node is created in the device tree.
>>=20
>> Also set the vIOMMU type to vSMMUv3 to enable vIOMMU framework to call
>> vSMMUv3 domain creation/destroy functions.
>>=20
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> xen/arch/arm/domain.c                  |   3 +-
>> xen/arch/arm/include/asm/domain.h      |   4 +
>> xen/arch/arm/include/asm/viommu.h      |  20 ++++
>> xen/drivers/passthrough/Kconfig        |   8 ++
>> xen/drivers/passthrough/arm/Makefile   |   1 +
>> xen/drivers/passthrough/arm/smmu-v3.c  |   7 ++
>> xen/drivers/passthrough/arm/viommu.c   |  30 ++++++
>> xen/drivers/passthrough/arm/vsmmu-v3.c | 124 +++++++++++++++++++++++++
>> xen/drivers/passthrough/arm/vsmmu-v3.h |  20 ++++
>> xen/include/public/arch-arm.h          |   7 +-
>> 10 files changed, 222 insertions(+), 2 deletions(-)
>> create mode 100644 xen/drivers/passthrough/arm/vsmmu-v3.c
>> create mode 100644 xen/drivers/passthrough/arm/vsmmu-v3.h
>>=20
>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>> index 2a85209736..9a2b613500 100644
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -692,7 +692,8 @@ int arch_sanitise_domain_config(struct xen_domctl_cr=
eatedomain *config)
>>         return -EINVAL;
>>     }
>>=20
>> -    if ( config->arch.viommu_type !=3D XEN_DOMCTL_CONFIG_VIOMMU_NONE )
>> +    if ( config->arch.viommu_type !=3D XEN_DOMCTL_CONFIG_VIOMMU_NONE &&
>> +         config->arch.viommu_type !=3D viommu_get_type() )
>>     {
>>         dprintk(XENLOG_INFO,
>>                 "vIOMMU type requested not supported by the platform or =
Xen\n");
>> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/as=
m/domain.h
>> index 2ce6764322..8eb4eb5fd6 100644
>> --- a/xen/arch/arm/include/asm/domain.h
>> +++ b/xen/arch/arm/include/asm/domain.h
>> @@ -114,6 +114,10 @@ struct arch_domain
>>     void *tee;
>> #endif
>>=20
>> +#ifdef CONFIG_VIRTUAL_IOMMU
>> +    struct list_head viommu_list;     /* List of virtual IOMMUs */
>> +#endif
>> +
>> }  __cacheline_aligned;
>>=20
>> struct arch_vcpu
>> diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/as=
m/viommu.h
>> index 7cd3818a12..4785877e2a 100644
>> --- a/xen/arch/arm/include/asm/viommu.h
>> +++ b/xen/arch/arm/include/asm/viommu.h
>> @@ -5,9 +5,21 @@
>> #ifdef CONFIG_VIRTUAL_IOMMU
>>=20
>> #include <xen/lib.h>
>> +#include <xen/list.h>
>> #include <xen/types.h>
>> #include <public/xen.h>
>>=20
>> +extern struct list_head host_iommu_list;
>> +
>> +/* data structure for each hardware IOMMU */
>> +struct host_iommu {
>> +    struct list_head entry;
>> +    const struct dt_device_node *dt_node;
>> +    paddr_t addr;
>> +    paddr_t size;
>> +    uint32_t irq;
> You want this to be int and not unsigned. The reason is ...
>=20
>> +};
>> +
>> struct viommu_ops {
>>     /*
>>      * Called during domain construction if toolstack requests to enable
>> @@ -35,6 +47,8 @@ struct viommu_desc {
>> int domain_viommu_init(struct domain *d, uint16_t viommu_type);
>> int viommu_relinquish_resources(struct domain *d);
>> uint16_t viommu_get_type(void);
>> +void add_to_host_iommu_list(paddr_t addr, paddr_t size,
>> +                            const struct dt_device_node *node);
>>=20
>> #else
>>=20
>> @@ -56,6 +70,12 @@ static inline int viommu_relinquish_resources(struct =
domain *d)
>>     return 0;
>> }
>>=20
>> +static inline void add_to_host_iommu_list(paddr_t addr, paddr_t size,
>> +                                          const struct dt_device_node *=
node)
>> +{
>> +    return;
>> +}
>> +
>> #endif /* CONFIG_VIRTUAL_IOMMU */
>>=20
>> #endif /* __ARCH_ARM_VIOMMU_H__ */
>> diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/K=
config
>> index 19924fa2de..4c725f5f67 100644
>> --- a/xen/drivers/passthrough/Kconfig
>> +++ b/xen/drivers/passthrough/Kconfig
>> @@ -41,6 +41,14 @@ config VIRTUAL_IOMMU
>>        help
>>         Support virtual IOMMU infrastructure to implement vIOMMU.
>>=20
>> +config VIRTUAL_ARM_SMMU_V3
>> +       bool "ARM Ltd. Virtual SMMUv3 Support (UNSUPPORTED)" if UNSUPPOR=
TED
>> +       depends on ARM_SMMU_V3 && VIRTUAL_IOMMU
>> +       help
>> +        Support for implementations of the virtual ARM System MMU archi=
tecture
>> +        version 3. Virtual SMMUv3 is unsupported feature and should not=
 be used
>> +        in production.
>> +
>> endif
>>=20
>> config IOMMU_FORCE_PT_SHARE
>> diff --git a/xen/drivers/passthrough/arm/Makefile b/xen/drivers/passthro=
ugh/arm/Makefile
>> index 4cc54f3f4d..e758a9d6aa 100644
>> --- a/xen/drivers/passthrough/arm/Makefile
>> +++ b/xen/drivers/passthrough/arm/Makefile
>> @@ -3,3 +3,4 @@ obj-$(CONFIG_ARM_SMMU) +=3D smmu.o
>> obj-$(CONFIG_IPMMU_VMSA) +=3D ipmmu-vmsa.o
>> obj-$(CONFIG_ARM_SMMU_V3) +=3D smmu-v3.o
>> obj-$(CONFIG_VIRTUAL_IOMMU) +=3D viommu.o
>> +obj-$(CONFIG_VIRTUAL_ARM_SMMU_V3) +=3D vsmmu-v3.o
>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthr=
ough/arm/smmu-v3.c
>> index 9174d2dedd..4f96fdb92f 100644
>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>> @@ -91,6 +91,7 @@
>> #include <asm/platform.h>
>>=20
>> #include "smmu-v3.h"
>> +#include "vsmmu-v3.h"
>>=20
>> #define ARM_SMMU_VTCR_SH_IS            3
>> #define ARM_SMMU_VTCR_RGN_WBWA         1
>> @@ -2680,6 +2681,9 @@ static int arm_smmu_device_probe(struct platform_d=
evice *pdev)
>>        list_add(&smmu->devices, &arm_smmu_devices);
>>        spin_unlock(&arm_smmu_devices_lock);
>>=20
>> +    /* Add to host IOMMU list to initialize vIOMMU for dom0 */
>> +       add_to_host_iommu_list(ioaddr, iosize, dev_to_dt(pdev));
>> +
>>        return 0;
>>=20
>>=20
>> @@ -2936,6 +2940,9 @@ static __init int arm_smmu_dt_init(struct dt_devic=
e_node *dev,
>>=20
>>        iommu_set_ops(&arm_smmu_iommu_ops);
>>=20
>> +       /* Set vIOMMU type to SMMUv3 */
>> +       vsmmuv3_set_type();
>> +
>>        return 0;
>> }
>>=20
>> diff --git a/xen/drivers/passthrough/arm/viommu.c b/xen/drivers/passthro=
ugh/arm/viommu.c
>> index 7ab6061e34..53ae46349a 100644
>> --- a/xen/drivers/passthrough/arm/viommu.c
>> +++ b/xen/drivers/passthrough/arm/viommu.c
>> @@ -2,12 +2,42 @@
>>=20
>> #include <xen/errno.h>
>> #include <xen/init.h>
>> +#include <xen/irq.h>
>> #include <xen/types.h>
>>=20
>> #include <asm/viommu.h>
>>=20
>> +/* List of all host IOMMUs */
>> +LIST_HEAD(host_iommu_list);
>> +
>> const struct viommu_desc __read_mostly *cur_viommu;
>>=20
>> +/* Common function for adding to host_iommu_list */
>> +void add_to_host_iommu_list(paddr_t addr, paddr_t size,
>> +                            const struct dt_device_node *node)
>> +{
>> +    struct host_iommu *iommu_data;
>> +
>> +    iommu_data =3D xzalloc(struct host_iommu);
>> +    if ( !iommu_data )
>> +        panic("vIOMMU: Cannot allocate memory for host IOMMU data\n");
>> +
>> +    iommu_data->addr =3D addr;
>> +    iommu_data->size =3D size;
>> +    iommu_data->dt_node =3D node;
>> +    iommu_data->irq =3D platform_get_irq(node, 0);
> you are assigning platform_get_irq to it which can return a negative numb=
er in case of failure.
> In your current implementation, the following check does not make sense a=
s unsigned can never be negative.

Ack. I will fix that in next version.
=20
Regards,
Rahul=

