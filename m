Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E35BFB3C345
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 21:47:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1102048.1454835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us53B-0005gK-7M; Fri, 29 Aug 2025 19:46:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1102048.1454835; Fri, 29 Aug 2025 19:46:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us53B-0005ed-4e; Fri, 29 Aug 2025 19:46:17 +0000
Received: by outflank-mailman (input) for mailman id 1102048;
 Fri, 29 Aug 2025 19:46:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sr3h=3J=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1us539-0005eX-Gq
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 19:46:15 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca9f88bc-8510-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 21:46:01 +0200 (CEST)
Received: from DU5PR03MB10441.eurprd03.prod.outlook.com (2603:10a6:10:516::14)
 by DU0PR03MB8912.eurprd03.prod.outlook.com (2603:10a6:10:476::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Fri, 29 Aug
 2025 19:45:58 +0000
Received: from DU5PR03MB10441.eurprd03.prod.outlook.com
 ([fe80::eeb8:470:6260:e5f4]) by DU5PR03MB10441.eurprd03.prod.outlook.com
 ([fe80::eeb8:470:6260:e5f4%7]) with mapi id 15.20.9073.021; Fri, 29 Aug 2025
 19:45:58 +0000
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
X-Inumbo-ID: ca9f88bc-8510-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZlyVId+WpKgGPw3NABFT3tJOgzkLXwllMwTefPir2TjewQ12wwZYby7zvWP+JbBVyYyWDhnuSYfMAsM7QWezRAxof4yhw5NOTd3bpw53T0V6GkBrbuMZpfNjhDUqv0f7dApq4t3v/5p8iGSQdlKwlR1JYPuzdEh0HQT8BimO9JCU89ROJxMjRkYXF6P/WB2ZQUcxf9332Guz0dUek/XYj+ZmcsevfShfbNUAasEwQ5X2SZ8UXEV1El9I+8/FY59IZBMpfMM8ZQ/9tEpagMGNPWXHwuK1uFVGAnH7WqY6CnTCYYl2xBuU0DEukH20/F+SIoK7DLfuVzinoG+LdYvhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXVcvq/fdoleBZbWJJJeSggo2ELFRXi7QGNwwQx7Www=;
 b=tsX30wRbK3h7WSYWDRg1vs23rjPZU0ruZedWUyFi3JWayJybujt0EuoGHOgDp4ACbERN5Hi+d2IDItjEjaFNETeyxsolsKTZTV64iArfhK0nOjmirwxX1zgSRGAXm9VMsmDGHcE8vK0ONEScBkCezJj+HYL6IX9AvljK/W3S1orPXVG4yOL2M2LUeG9g9D8KwCXOGO9xZe0l2LrmFTAbtC1KkgG0sICt+RuXNro8zpitFjoHioQU76hKFfRui1TqqgIPrh+5oknns0bO+6ut5BWSTjcxsCyhhfikDU0PcpcLGgbT6NWBYubdCztkf1eszl1SUdw48122BObrMVeb7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXVcvq/fdoleBZbWJJJeSggo2ELFRXi7QGNwwQx7Www=;
 b=qADOs72mrqc45O3gZ9Tasmsw5bMyuIrVyfVGE2WkO5jGejhrvPD8ZpiPd5KL2/c4FwTd0HP2TzzdVu0Zj0ip3rfauDLsK7TG7XNW7daBqFbep6+aSt60M1se+vK12ABRN4DZCYMQ6KlFd6fduX8yQTD7ZVMwsOEwss1Dc+DQfoSq3vp4UECYHL2jAD9oF7KcxwfuqF7cE0TiEEMYaFueqoNxAEGRu48vkLw54LCUDKAVQRMJycH+igCnBtCKXKaxhCDtOxWjdjXVBjDopO018w9IKyL+82c+Ie9RoHYI1yHxTaJzRXVagUrcC7mNyV+qJeFNm0pFy04EUpYguvREnw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v5 04/12] xen/arm/irq: add handling for IRQs in the eSPI
 range
Thread-Topic: [PATCH v5 04/12] xen/arm/irq: add handling for IRQs in the eSPI
 range
Thread-Index: AQHcGP7cvDFEqdT0B0atuMEMYN3Piw==
Date: Fri, 29 Aug 2025 19:45:58 +0000
Message-ID: <87tt1pykqz.fsf@epam.com>
References: <cover.1756481577.git.leonid_komarianskyi@epam.com>
	<e0f76a1533332cef68bfaacbdf57fd05f27764a6.1756481577.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <e0f76a1533332cef68bfaacbdf57fd05f27764a6.1756481577.git.leonid_komarianskyi@epam.com>
	(Leonid Komarianskyi's message of "Fri, 29 Aug 2025 16:06:19 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10441:EE_|DU0PR03MB8912:EE_
x-ms-office365-filtering-correlation-id: 47348f8d-cf24-4b61-c861-08dde734ace4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?UIG3EpAeaRXJHWQgLL4PUiQr6QB0PhePkQvK6wEkq/5Q4iIGxhy05IW7p+?=
 =?iso-8859-1?Q?D4m+45SZ/7/s8gtbmAQzLYJ4IJghCZhsDjWngIK1Vy24hOyV3hV+1DI0jJ?=
 =?iso-8859-1?Q?9Ln8soSbM557AkWqbQnudUDhZ9n211MrRnE4rppLlDXegNgUmmJD2Tig6N?=
 =?iso-8859-1?Q?lXuE8IoP44N3fVZIltX2y/d+opuz08luuvjpkvtlxQliXw/lgbYgOt9L9r?=
 =?iso-8859-1?Q?mNsPjBP5UwnlJPE0v8ZfKNeFDTo3cOWNb9sZ1FTHupH/ZaPgllqmyx7GXk?=
 =?iso-8859-1?Q?4Z7IjcmDhf/at5xuaIGgO/CKmiJ0Eova126SXib4S6gR9+zfn9FECI1Vb6?=
 =?iso-8859-1?Q?z4ZSk1TmecASm8JqR8y25pfQ+lOdcPR29K6NqIVOABMyf8cidDhLs+Sw0X?=
 =?iso-8859-1?Q?Fn5nPi/Wt8d/CcMXnJz1FKXXrVDBC6rsie6frXmKYDWorQ0K+qEoesXnqN?=
 =?iso-8859-1?Q?Wp6eGR2BEytLGzGG7iRqcIXVNRQx0UcLND9pDZo686dJkc7GSeISi8n8JX?=
 =?iso-8859-1?Q?cOO7zSUsoR6WFYXtOMKi4khd8BPX5HjgFGdNWU/9FuzOaI8nF+M4wZ3lMD?=
 =?iso-8859-1?Q?zExj320IgTKPCZVFND0tSvODRT40/9xSVkJsukdT5hzlkUdcPnLQVbyCEP?=
 =?iso-8859-1?Q?HG0/yCOgOiJdzbZtCbLfQT7s9dD+rPx93ONjCBWIJ1Vic13HCnSm98kQhA?=
 =?iso-8859-1?Q?rzNx2TAyt7W4AE93kXc/bybXucg0kjewJsXEqeJztbHWi/+HDxez6SQKP7?=
 =?iso-8859-1?Q?LVhPBfWHnaxIG4hKbYx774mxsJ0UXNmEBQiYcnCuQdZmDPtGXdXZwtE9+V?=
 =?iso-8859-1?Q?aV+7W3xEYq4ErI4CNnY3M9A9G/hFtH99E1QzIdALrd8QusyO5lU4hSEAu4?=
 =?iso-8859-1?Q?tT0nYy1Y2kVrvuoHTQypB0fAqPX5NSB14pkUvlHdsErsC6pxZzvRtcWv1o?=
 =?iso-8859-1?Q?9dzpAI9X+S/RU+75Hjm/XnW1TugFUBM2CP1Ki5IkyFQCWnMM+O0FSAMMyu?=
 =?iso-8859-1?Q?1yMZPMAVuxZMKhmFQ9kgYbgSMQ1UrEfv+7JS5wRVBRl1YoDVeg4ecJZmje?=
 =?iso-8859-1?Q?ib1DC69BFr8+dITNiugbb7L8wUo5At9SU3vyWxctZrW9IKvRlPVmp1lhiW?=
 =?iso-8859-1?Q?UX3jktN/VPupBUtZxq3VjrL5xUrBevfwMVn3i4pLHnrIS1CiipKmz99j++?=
 =?iso-8859-1?Q?6nNMpUOZv+urphOfhRRRy78KDX+/E/RBfuurnP7YHs1g0zG94On6bXOnnj?=
 =?iso-8859-1?Q?0TJpAwBUTMUpR5hmLrp7DQi8qzMetJh55DsSarLW+e2I4KJF8sspT5Mlbf?=
 =?iso-8859-1?Q?OeUW2vueEoFxd7eS62+PQA+vvWuvBydwVgetdKbC12Fu+hWMkZfAJf40ax?=
 =?iso-8859-1?Q?LeZZHWQgUcWSfGEFi6oRr84u9mETeMk7I8UFkx9z5H51h4AzvGiaR5JO7Q?=
 =?iso-8859-1?Q?7tVIsp+bAqpZl3qpprSljv9JbD4S7qMwwuq8XkEuD9KRkBJkg68YttX5CI?=
 =?iso-8859-1?Q?BP9VGi0NrbS/kswchCW280kBT+MI9WZNIpCWFDHoUX2Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10441.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?SiuZ7ltKaURQgalraQSqfrqliCNq97AB5HGNySIGF5E9We/CFkiHY+RHJ5?=
 =?iso-8859-1?Q?9alb97QIJnyMK698BKrqGPTMkaWBBP4pDH3UjkzWJL5vdnM2MqIMc6KA4W?=
 =?iso-8859-1?Q?S2zHMnW39QdpWsDs8w9ctRy02ognAg4McjaAsv4E7JMpqP180eh9ERBsJD?=
 =?iso-8859-1?Q?XlsNJ9UR/oYVXA3/xKZbc45oDUZCfGKvgS4tGHt/b6D3Z/lXzPg3f3miFz?=
 =?iso-8859-1?Q?15HW+Eyv9u9yB2sLEL1Wdyoc42vCDHB8ZA4NdvLXgTBam5R67NPSxRf5Oh?=
 =?iso-8859-1?Q?TESFGX2sI0D7jZ2MP8K9nU7PVLWTs8/G2mNrFykEwfmXjtx1f2MjK3qLyo?=
 =?iso-8859-1?Q?+sNaIeOe7bK01Cjxh+gdj+8kGFNMzeCEzIZgyVnqvzg/VUzKEAHyt0XNoh?=
 =?iso-8859-1?Q?4I6PFIwZ3uMWmi/3mS5hAL1L4eTWpsu7Ob3ldegCr77mI7uFIRS44SeJCK?=
 =?iso-8859-1?Q?i6xGky9ZekmPQ6Zm5lW0NTs3Ux4zTv5A9aw12Tjo/1JQnWyVwUsQWKiWDt?=
 =?iso-8859-1?Q?40+Bjw/OC+slN6/m0rZYx8zVzmN0fWpgyHqvfMRb8gakR7iLdwJakIiTNk?=
 =?iso-8859-1?Q?xKAZtiD3jE1w2dowBlCkPHHtPIuu6OIyKOVHsnK2dUZWUF2FkamifzazGt?=
 =?iso-8859-1?Q?MlRFHGGx7aS1/ms2xTVdxf8M0rxGx3YMVSmtIOj2EJhxE11r/7b6Bd2EHE?=
 =?iso-8859-1?Q?P/KuI7f5UNItO4GwL/exnRDvvUOSvjMzEFqsnj785YfGw8tdxwcUiYeThQ?=
 =?iso-8859-1?Q?NXvNKMp+duC6mr3Qps8Uf8I8MBLZw61qh2Wn6ddEJRcpvR/K3J2h3U9EE1?=
 =?iso-8859-1?Q?Wh+q0+2fJURbhFmRXGqwdgRI7nKgVIZBk3vQNNU7Yd5JXDgGkQzBJJamh+?=
 =?iso-8859-1?Q?JpaC480E+1ErYGEoye5XOst1PfENEdZaCDyrZlM0XzskMxWJ52NYjPtrj3?=
 =?iso-8859-1?Q?bGbGBtm/T1SGb7MuYzKY1rn1SQkN9G/+dEvOGC54Ip0FmHM1udFiRYuFlw?=
 =?iso-8859-1?Q?uteFBpPT69SfcN+Sep7NHzTVGG+kal/C9AF2QCuy3kkMtUlA27EYBw301+?=
 =?iso-8859-1?Q?BWEY7Eih+Br0L04F+ayhVmyidu1xQ858xZnHrB5feG9bG6vWsHts1KxyQ1?=
 =?iso-8859-1?Q?81jDm1Nnz1s4IFGY+xrAk6Wj0sB2f/nO9f3os8skaDccK1XHhGy7sp8YaG?=
 =?iso-8859-1?Q?XRK+rhRDHDrupz+eJTs6ONgXIAqjA9s43sxeYro3yIXeVYaA3MIoCEThSc?=
 =?iso-8859-1?Q?OxZBurnB6Ig6Weu83TkWpsfXmEy9An12eXdT9N7RbZnhBK41GldT7bsr5U?=
 =?iso-8859-1?Q?LPc6i1ZTypG4YUwkerrG0ajd3cOYDDutN6hyp5d6b7dnfY6K3BA0HqqgJa?=
 =?iso-8859-1?Q?iHAAfQkxcBO9wzmAI9IajUHynvQ/ym+Ca87Hw40WahJjcx7XM3uo0RPbSM?=
 =?iso-8859-1?Q?b4K3psUF/49IEVU9zYrF5Cwd4Chww4m8c45WoMLf5MAfGhy8dFZf+Tem2x?=
 =?iso-8859-1?Q?GTRFvv5i2/91N9MLitq6tuP3z32jsdtzCGay+j/qktbkkbn4cY5z1DU7k1?=
 =?iso-8859-1?Q?phHK8WRDdceVZ6mkUAdnLx1PTD/ZOEn9mELT0W+5oc4ovf7Q5CT/6xcH01?=
 =?iso-8859-1?Q?jvEEIec+4gyN//2sPRQA2ek0qrwRTnQSFoil0d7IRthhxGbOCWFMFdwg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10441.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47348f8d-cf24-4b61-c861-08dde734ace4
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 19:45:58.1397
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JnPRmz7MgzNJHAE41Zt5lITXJttQZnbcV6HI2c9w3rakjMK93VdddbTXODzTPc9POFyC0QlD7qhilrc7/PqUZup0Cbu13iejC/78QmZzkfU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8912


Hi Leonid,

Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:

> Currently, Xen does not support eSPI interrupts, leading
> to a data abort when such interrupts are defined in the DTS.
>
> This patch introduces a separate array to initialize up to
> 1024 interrupt descriptors in the eSPI range and adds the
> necessary defines and helper function. These changes lay the
> groundwork for future implementation of full eSPI interrupt
> support. As this GICv3.1 feature is not required by all vendors,
> all changes are guarded by ifdefs, depending on the corresponding
> Kconfig option.
>
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
>
> ---
> Changes in V5:
> - no functional changes introduced by this version compared with V4, only
>   minor fixes and removal of ifdefs for macroses
> - added TODO comment, suggested by Oleksandr Tyshchenko
> - changed int to unsigned int for irqs
> - removed ifdefs for eSPI-specific defines and macros to reduce the
>   number of ifdefs and code duplication in further changes
> - removed reviewed-by as moving defines from ifdefs requires additional
>   confirmation from reviewers
>
> Changes in V4:
> - removed redundant line with 'default n' in Kconfig, as it is disabled
>   by default, without explicit specification
> - added reviewed-by from Volodymyr Babchuk
>
> Changes in V3:
> - introduced a new define NR_ESPI_IRQS to avoid confusion, like in the
>   case of using NR_IRQS for espi_desc array
> - implemented helper functions espi_to_desc and init_espi_data to make
>   it possible to add stubs with the same name, and as a result, reduce
>   the number of #ifdefs
> - disable CONFIG_GICV3_ESPI default value to n
>
> Changes in V2:
> - use (ESPI_MAX_INTID + 1) instead of (ESPI_BASE_INTID + NR_IRQS)
> - remove unnecessary comment for nr_irqs initialization
> ---
>  xen/arch/arm/Kconfig           |  8 +++++
>  xen/arch/arm/include/asm/irq.h | 24 +++++++++++++++
>  xen/arch/arm/irq.c             | 56 +++++++++++++++++++++++++++++++++-
>  3 files changed, 87 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 17df147b25..43b05533b1 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -135,6 +135,14 @@ config GICV3
>  	  Driver for the ARM Generic Interrupt Controller v3.
>  	  If unsure, use the default setting.
> =20
> +config GICV3_ESPI
> +	bool "Extended SPI range support"
> +	depends on GICV3 && !NEW_VGIC
> +	help
> +	  Allow Xen and domains to use interrupt numbers from the extended SPI
> +	  range, from 4096 to 5119. This feature is introduced in GICv3.1
> +	  architecture.
> +
>  config HAS_ITS
>          bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPO=
RTED
>          depends on GICV3 && !NEW_VGIC && !ARM_32
> diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/ir=
q.h
> index 5bc6475eb4..4443799648 100644
> --- a/xen/arch/arm/include/asm/irq.h
> +++ b/xen/arch/arm/include/asm/irq.h
> @@ -32,6 +32,13 @@ struct arch_irq_desc {
>  #define SPI_MAX_INTID   1019
>  #define LPI_OFFSET      8192
> =20
> +#define ESPI_BASE_INTID 4096
> +#define ESPI_MAX_INTID  5119
> +#define NR_ESPI_IRQS    1024
> +
> +#define ESPI_INTID2IDX(intid) ((intid) - ESPI_BASE_INTID)
> +#define ESPI_IDX2INTID(idx)   ((idx) + ESPI_BASE_INTID)
> +
>  /* LPIs are always numbered starting at 8192, so 0 is a good invalid cas=
e. */
>  #define INVALID_LPI     0
> =20
> @@ -39,7 +46,15 @@ struct arch_irq_desc {
>  #define INVALID_IRQ     1023
> =20
>  extern const unsigned int nr_irqs;
> +#ifdef CONFIG_GICV3_ESPI
> +/*
> + * This will also cover the eSPI range, as some critical devices
> + * for booting Xen (e.g., serial) may use this type of interrupts.
> + */
> +#define nr_static_irqs (ESPI_MAX_INTID + 1)
> +#else
>  #define nr_static_irqs NR_IRQS
> +#endif
> =20
>  struct irq_desc;
>  struct irqaction;
> @@ -55,6 +70,15 @@ static inline bool is_lpi(unsigned int irq)
>      return irq >=3D LPI_OFFSET;
>  }
> =20
> +static inline bool is_espi(unsigned int irq)
> +{
> +#ifdef CONFIG_GICV3_ESPI

Taking into account that with CONFIG_GICV3_ESPI=3Dn we should never have
"irq" in eSPI range, do you really need this #ifdef? I think that
ASSERT_UNREACHABLE in espi_to_desc() is sufficient guard.

Also, IRQ line number belongs to eSPI range regardless of CONFIG_GICV3_ESPI=
,
value, so in my opinion is_espi() should always return correct value for
a given "irq".

> +    return (irq >=3D ESPI_BASE_INTID && irq <=3D ESPI_MAX_INTID);

Also, you don't need parentheses here.

> +#else
> +    return false;
> +#endif
> +}
> +
>  #define domain_pirq_to_irq(d, pirq) (pirq)
> =20
>  bool is_assignable_irq(unsigned int irq);
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index b8eccfc924..61c915c3f9 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -19,7 +19,11 @@
>  #include <asm/gic.h>
>  #include <asm/vgic.h>
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +const unsigned int nr_irqs =3D ESPI_MAX_INTID + 1;
> +#else
>  const unsigned int nr_irqs =3D NR_IRQS;
> +#endif
> =20
>  static unsigned int local_irqs_type[NR_LOCAL_IRQS];
>  static DEFINE_SPINLOCK(local_irqs_type_lock);
> @@ -46,6 +50,53 @@ void irq_end_none(struct irq_desc *irq)
>  }
> =20
>  static irq_desc_t irq_desc[NR_IRQS - NR_LOCAL_IRQS];
> +#ifdef CONFIG_GICV3_ESPI
> +/*
> + * TODO: Consider allocating an array dynamically if
> + * there is a need to enable GICV3_ESPI by default.
> + */
> +static irq_desc_t espi_desc[NR_ESPI_IRQS];
> +
> +static struct irq_desc *espi_to_desc(unsigned int irq)
> +{
> +    return &espi_desc[ESPI_INTID2IDX(irq)];
> +}
> +
> +static int __init init_espi_data(void)
> +{
> +    unsigned int irq;
> +
> +    for ( irq =3D ESPI_BASE_INTID; irq <=3D ESPI_MAX_INTID; irq++ )
> +    {
> +        struct irq_desc *desc =3D irq_to_desc(irq);
> +        int rc =3D init_one_irq_desc(desc);
> +
> +        if ( rc )
> +            return rc;
> +
> +        desc->irq =3D irq;
> +        desc->action  =3D NULL;
> +    }
> +
> +    return 0;
> +}
> +#else
> +/*
> + * This function is stub and will not be called if CONFIG_GICV3_ESPI=3Dn=
,
> + * because in this case, is_espi will always return false.
> + */
> +static struct irq_desc *espi_to_desc(unsigned int irq)
> +{
> +    ASSERT_UNREACHABLE();
> +    return NULL;
> +}
> +
> +static int __init init_espi_data(void)
> +{
> +    return 0;
> +}
> +#endif
> +
>  static DEFINE_PER_CPU(irq_desc_t[NR_LOCAL_IRQS], local_irq_desc);
> =20
>  struct irq_desc *__irq_to_desc(unsigned int irq)
> @@ -53,6 +104,9 @@ struct irq_desc *__irq_to_desc(unsigned int irq)
>      if ( irq < NR_LOCAL_IRQS )
>          return &this_cpu(local_irq_desc)[irq];
> =20
> +    if ( is_espi(irq) )
> +        return espi_to_desc(irq);
> +
>      return &irq_desc[irq-NR_LOCAL_IRQS];
>  }
> =20
> @@ -79,7 +133,7 @@ static int __init init_irq_data(void)
>          desc->action  =3D NULL;
>      }
> =20
> -    return 0;
> +    return init_espi_data();
>  }
> =20
>  static int init_local_irq_data(unsigned int cpu)

--=20
WBR, Volodymyr=

