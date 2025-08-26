Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB7AB37363
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 21:48:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095007.1450157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqzdq-0001Da-Jz; Tue, 26 Aug 2025 19:47:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095007.1450157; Tue, 26 Aug 2025 19:47:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqzdq-0001BK-Gz; Tue, 26 Aug 2025 19:47:38 +0000
Received: by outflank-mailman (input) for mailman id 1095007;
 Tue, 26 Aug 2025 19:47:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VNE8=3G=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1uqzdo-0001BD-Dp
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 19:47:36 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 830f38d8-82b5-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 21:47:34 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DB9PR03MB9783.eurprd03.prod.outlook.com
 (2603:10a6:10:451::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 19:47:30 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 19:47:30 +0000
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
X-Inumbo-ID: 830f38d8-82b5-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CcGDKxJcEWIu6QC24qut92s637dnFKequxli2aJnKfMeMW+/whhCiFtOvJUun2EBqC1Ev3d25oZT6rqCyC2YNJDGJeo8TdasNtcfpZREFqrpVPMoXgyl01+wV0HgCzQfLNW3Apwj/E9bi0Hj035BWB8I7QyVRBXxOmGE7NL1UwvPoSynXMd+5/MkIQzOUQeXnNreuvIT8agjwjzJvv9lFnMgXTQNP8VOuItBN9r2NRIhWMxptmZ/J+9K1JDsoC4oTf8UTJyi+3LWh8T8L+5Q9hXFhPrypsogy4puiVmpUAQAZ4++BK/q1rkLbzqw06Lr7431r5d+YtCC054an6dMIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lBuik3REm1kIrl3mwLjyS+EgbmLWrX76o3NRjBTSMsM=;
 b=Kdl7YYog1B2v1qI4yLOcTnIIYx9bWHi4pUEbMo1gUQDCsm63MxbHCBSrWv9o0Ec7hkXq7OLG20Ra7Y/sTlEMWgKb11NC9QNpboB9T/JhkLkXsLSWgw0A20V3hpIV3la7JhNJozkdVNxyu0pIsYV7bu/7olot+FW7sFZc3bnBkOCYIQdEJiq65KI+hemVvQ4ViihWvGUydQtSvXjkrSFr6gcaG6O5+6di4mSzqT+6EGbsydroI3Z/Ez3H/oh6PNzL1ZDWxQrcfe+4vaEUMluLlY66i+PUw4OcTtUKsjt5VBEmnkbaLl831TlX2QOLscFyYVQCuhRYfEX5PDqcxyil/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lBuik3REm1kIrl3mwLjyS+EgbmLWrX76o3NRjBTSMsM=;
 b=bXqYFJSfaHQ3lGV4P7Rt3wt6lR4b5yBswDH4wlcd1es6okb3zJOMRETaAaE61DYX9uNhg5MNDhIQzkIpL/QDczBd08baLjaHDvjF+L47YSMfsG6UxflJVOZ0/v16xvJ01jjBMg18Tpv4D9rU6Whd27oZ2I46f3Hnf2iVXoE9c8Z+t1b0WqdsbiURkkDOf1+DLCRQtS+rN/4gknJvCvPW2Je4tsy/HTLq1pYABj4pLGt06iRK4COB1EPfeTul5IW/R/3X/VasgF8B3SxIWMWSxu/FtIyJeSKB0PENhQ6iLE88P5S3/D2KldqKvJGLABjALnDGE1JktE5ccwBeP3U0CQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v3 01/11] xen/arm: gicv3: refactor obtaining GIC addresses
 for common operations
Thread-Topic: [PATCH v3 01/11] xen/arm: gicv3: refactor obtaining GIC
 addresses for common operations
Thread-Index: AQHcFpJ+etlgg3EWd0CB0IzwgFrWeQ==
Date: Tue, 26 Aug 2025 19:47:30 +0000
Message-ID: <87sehd6f1q.fsf@epam.com>
References: <cover.1756216942.git.leonid_komarianskyi@epam.com>
	<6ba26f0db6575795f8dfcb80862f5537c3dc7a8c.1756216942.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <6ba26f0db6575795f8dfcb80862f5537c3dc7a8c.1756216942.git.leonid_komarianskyi@epam.com>
	(Leonid Komarianskyi's message of "Tue, 26 Aug 2025 14:05:36 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DB9PR03MB9783:EE_
x-ms-office365-filtering-correlation-id: 1bcee7c2-49e8-4561-69b2-08dde4d9649e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|42112799006|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?7MPtiBIR4XC4dQa4mjjMA8yQptlmNBJpZEz4Qi/QxhfnKQskqYQJL4Kgnr?=
 =?iso-8859-1?Q?SJbPuEVIH6O7A3AAQMulesdE1r5x6sqEgpKR7jViCg2qi3Ow3SxvuOD4GG?=
 =?iso-8859-1?Q?bWZcEypbxEsRgfQxgZ6JLu7kjVP53ImULxviWrKLyxJ2Hww01L0Zfph07Z?=
 =?iso-8859-1?Q?GICmvmbVhh14pmhSH2gNHzEvZV2YUYu7c1dJ6UGbIODmeugQ59OcfJFM/R?=
 =?iso-8859-1?Q?ajIOkQbpKTuKOjYHwHPOK2xmE8PXR7rQ7BxKNSY8/AEKNB48fz+o1bfA/k?=
 =?iso-8859-1?Q?dY4BQgEdGsCn3SNo//w3cXMPMBTnMXtuY8r57cTvf1mZVKoUAl0iTF0qhf?=
 =?iso-8859-1?Q?gszADXA7V9AHAoVuVnZW20tf00H+GaMk0yorc8D6CYtDwuVp8kzi4aRR0G?=
 =?iso-8859-1?Q?uvWzq7WR1sTn3aNLELMJFktU63z/sFiwuXikglvkZyZRKIIhLnuXEcuppy?=
 =?iso-8859-1?Q?KTsSQDNIVFQW3cUF+9K83C5lGRR5sLOdGZSYetOALgWhs1t/8De+qk1+24?=
 =?iso-8859-1?Q?/2RdfRq/S0zeXCPESooRKlFAM1N++AdazIL9265dDhXXkf1GPsCa7mr7eG?=
 =?iso-8859-1?Q?JHY5ZqrsFJzXw5OR/rodIiiFV7bDleGWT201vVq1mM9oKZoEwG317Z1FBe?=
 =?iso-8859-1?Q?6G2lLJaIXM1CiVbDfQxZvtox97OkypL1rYDuo0urH3kCc1M/29+oO00Fp1?=
 =?iso-8859-1?Q?bmhB0qjBxw7oy2wLzK9LR4MlZb8Lg6sqUOGhCIHIdp07+kO5TnWsBkU9Za?=
 =?iso-8859-1?Q?5TLjXApghfOTon8Pe+9EO0nJfp4PdqYZ786MZa/FiGyhyDF3AiVRRRgKgR?=
 =?iso-8859-1?Q?73WVJHPMswEvDJFXMCmableIwzKyoYeH6Q0Iy9b03QZfe92t2553AaxS/N?=
 =?iso-8859-1?Q?WxAQ7iCgzPN8cao7RyzcoxN+22i1VIPbARsGPD6gPbwWM3gNGlb98wik6X?=
 =?iso-8859-1?Q?hhaYrG09ChJKKCVIkaqnWUF8Z2CZR29QZNqmR9GpZa6SsXIZM0OlKPhvV1?=
 =?iso-8859-1?Q?VZ0x4VtnC3VfDwgJlNRonYK/jynwpb2o84wRmb2mqFsvp77LeBTuZ7iHfw?=
 =?iso-8859-1?Q?kdUILJgEITeDWVRPbi7IktnG5z939G4emY7vK33b4MOr/P9JYKWlcih4My?=
 =?iso-8859-1?Q?6dO/vs2cHLyjWwBfUUhLwwE7Y+vGq6NrIMaKGV+9zkKyaeV45xeY4MVNk7?=
 =?iso-8859-1?Q?VKO+am1kRdoUiwGnO3KRyguLJDexagul7vOF8nJlo8zwt1rzTHcMUSLkp2?=
 =?iso-8859-1?Q?OTJNw/xYs/+s79LlTeRfPtjeOmtOM86Zo/mMoYg0/RlBSa6fKMjT1gCGak?=
 =?iso-8859-1?Q?tzfnYP6+iziLIqKR2fqKIgQP9lmY+X8bzdGYvZxgAMYf6oKS9egzr50YFr?=
 =?iso-8859-1?Q?wqvIavUlLH4d8RcL3x05V9K3HELndLtjcntilszg+UPrvRKX5oMkSuUpVG?=
 =?iso-8859-1?Q?k1i15GsfbCUBIZaLmRdNCJQ25U0y5y7xFqEdB3f5GHpER/KVKqHhZaPyZc?=
 =?iso-8859-1?Q?oe5/Qv+htyJNQkPoMUIy0oI72JqTsvl9usBb8bfNw/8A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(42112799006)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Gft84xA6esNIUUP0DhB0qdDahXFsD0tQpxc7cMDCz3+mQGuf0LecPLyTNF?=
 =?iso-8859-1?Q?7yvDa/ZUVrjSmAHHnGdrsFErclrhY9iXP5m6OvIsxHl9ReKYJ+UH6zFBW7?=
 =?iso-8859-1?Q?pmvt85YB+QgNMLi6S2PYiNRo2IpFBMYhbsBYA/2/HQuk92dG624mjdKB+j?=
 =?iso-8859-1?Q?ppQmh1ELzSnNrmWSd1Bd4p2fQC0OIlkBQOFPA5ruvb5HL0kHQed50Bn9kV?=
 =?iso-8859-1?Q?pljaBXIsnPW6U1ALzsAXbD8hsVmpxSV6uYXh5i/FquYh6TGAuC69QcBEoF?=
 =?iso-8859-1?Q?Tc6nnDWZunILBndZFmSLJTHhA5LEYcKaNRgM5f9k3fJVQwiS/H/Ms5D774?=
 =?iso-8859-1?Q?sPWeex6cJb1XQ0ygIHupMpSB1AJyHMshrvqh8Pc5+/zz2Zh+BqrKDb8YJ8?=
 =?iso-8859-1?Q?n2v5xNSqMwzhb0LPD2L5LkC8RB6VtKrVN74xj1aSUbI1RilP4UMXyyr5ri?=
 =?iso-8859-1?Q?Qi9MQBEpggvUiFy4yMNhfXdTGUtbvVkwJ9gGQgvuhFmle1UbWgQkOvRfe+?=
 =?iso-8859-1?Q?F5gJeyNCdZgrgFekW8rBPYKZPCg1EKJ1CBLvGyy9CySSSPsuH9+UWJc/1H?=
 =?iso-8859-1?Q?FtW/lI/gDyIXSuNGjcllXKPImzKIfOLiSvhr172FOoBmvEuG6NfAfy06Kt?=
 =?iso-8859-1?Q?nRcXFWk5e+U1T0Z6htRCrqLP2Dvz6zLxtSwXmiLgDG4VfPNQfLwt9ICSTU?=
 =?iso-8859-1?Q?fQhs94MVVUIWEyvGxu7HVCdv8HAp3oyelATJy7FmG9cbYqNUbx2vIKmOcR?=
 =?iso-8859-1?Q?SHSzm9Ns1wZ55I+ImEjTPL6fg01zIFPY0KN6iFPaR9+SlOUCUyvMpxT0Im?=
 =?iso-8859-1?Q?U5aoDO8DnwAFdPlweK2JyQev1WbiZGlXhveC4OyheIPILvCA8F0X7TTTOy?=
 =?iso-8859-1?Q?C+dQIAwJjcjmLJ1OjbhVytodTcBG4Eei4x0XaroKQSri0YCEPqU8cKbqIK?=
 =?iso-8859-1?Q?Tba15O+5QKPyVBXAig6CbktWzprLfz0f4qR49rLv23FlIb+EsmMIPuzh99?=
 =?iso-8859-1?Q?awpDeepieBsNwUnzXvUmgBZarQxQqstvePAS+53HPY+RvgVGlMszKmeljh?=
 =?iso-8859-1?Q?QuZHDbksJrR/6d3qjCSKaS+NjCyS50Lka8LmZZ48TqYTaMe7yGRVRPLxEg?=
 =?iso-8859-1?Q?kDbVqNcp0bE9k5J/o1eqkFqBR++bgJbiuCWXNj/e9HCG1axzRjZI8MErHX?=
 =?iso-8859-1?Q?Pw5XnICqdszRz0jDnLg9Fr/+OtahQF/AumYMETc1xBBHo0lqqJAeiFp+Gf?=
 =?iso-8859-1?Q?IKugvCGLeTR7oRWFDLHR+2HampVSYZDdiThEE0WAB8KdL9ijSiY84sL2WY?=
 =?iso-8859-1?Q?MoMES0rYm3L6G/vPfEk0cvGgvmPzRFBjFCsuZgJCXsQPwAc1ZvAaTbUqm+?=
 =?iso-8859-1?Q?arJ6/yh5XGj1e8j840goEQuu44qF1XPJnhsMWwtF6yllDJYVKV06wivcf7?=
 =?iso-8859-1?Q?gp2cH5+Y9jWzTQpUhY+oNIPuTgTfMhia9HdNtVda6iW1HqC+zkD1nHEn3Q?=
 =?iso-8859-1?Q?l8Ln4TGYq3udHjEvpoQ8J+xerH9prN+voV0ohwqM3+Zu39HmKNegR9hcME?=
 =?iso-8859-1?Q?fPbf0c2xb4yDm8XwixXHmKuT9tDRXR8joq+lH94xcEH+G7xRbqqHZ+zFmg?=
 =?iso-8859-1?Q?ebSTmxWeRMQGJSDL2lgPiw9os8SMkP1T0F+okgVbxQQd7XQwEwI2Wglw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bcee7c2-49e8-4561-69b2-08dde4d9649e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 19:47:30.3593
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mc//x9iHBGGvg3WskzGuIJZsto1nW4O9qcAHNNp2W1nMFrAF6u7J0kfrV/g68xQ5b3pnK6BcpZmsp54Ng3CUEsGCh5SNo/LDmHNd8D7/P5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB9783

Hi Leonid,

Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:

> Currently, many common functions perform the same operations to calculate
> GIC register addresses. This patch consolidates the similar code into
> a separate helper function to improve maintainability and reduce duplicat=
ion.
> This refactoring also simplifies the implementation of eSPI support in fu=
ture
> changes.
>
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>
> ---
> Changes in V2:
> - no changes
>
> Changes in V3:
> - changed panic() in get_addr_by_offset() to printing warning and
>   ASSERT_UNREACHABLE()
> - added verification of return pointer from get_addr_by_offset() in the
>   callers
> - moved invocation of get_addr_by_offset() from spinlock guards, since
>   it is not necessarry

... with these changes, still:

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>


> - added RB from Volodymyr Babchuk
> ---
>  xen/arch/arm/gic-v3.c          | 114 +++++++++++++++++++++++----------
>  xen/arch/arm/include/asm/irq.h |   1 +
>  2 files changed, 81 insertions(+), 34 deletions(-)
>
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index cd3e1acf79..a959fefebe 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -445,17 +445,67 @@ static void gicv3_dump_state(const struct vcpu *v)
>      }
>  }
> =20
> +static void __iomem *get_addr_by_offset(struct irq_desc *irqd, u32 offse=
t)
> +{
> +    switch ( irqd->irq )
> +    {
> +    case 0 ... (NR_GIC_LOCAL_IRQS - 1):
> +        switch ( offset )
> +        {
> +        case GICD_ISENABLER:
> +        case GICD_ICENABLER:
> +        case GICD_ISPENDR:
> +        case GICD_ICPENDR:
> +        case GICD_ISACTIVER:
> +        case GICD_ICACTIVER:
> +            return (GICD_RDIST_SGI_BASE + offset);
> +        case GICD_ICFGR:
> +            return (GICD_RDIST_SGI_BASE + GICR_ICFGR1);
> +        case GICD_IPRIORITYR:
> +            return (GICD_RDIST_SGI_BASE + GICR_IPRIORITYR0 + irqd->irq);
> +        default:
> +            break;
> +        }
> +    case NR_GIC_LOCAL_IRQS ... SPI_MAX_INTID:
> +        switch ( offset )
> +        {
> +        case GICD_ISENABLER:
> +        case GICD_ICENABLER:
> +        case GICD_ISPENDR:
> +        case GICD_ICPENDR:
> +        case GICD_ISACTIVER:
> +        case GICD_ICACTIVER:
> +            return (GICD + offset + (irqd->irq / 32) * 4);
> +        case GICD_ICFGR:
> +            return (GICD + GICD_ICFGR + (irqd->irq / 16) * 4);
> +        case GICD_IROUTER:
> +            return (GICD + GICD_IROUTER + irqd->irq * 8);
> +        case GICD_IPRIORITYR:
> +            return (GICD + GICD_IPRIORITYR + irqd->irq);
> +        default:
> +            break;
> +        }
> +    default:
> +        break;
> +    }
> +
> +    /* Something went wrong, we shouldn't be able to reach here */
> +    printk(XENLOG_WARNING "GICv3: WARNING: Invalid offset 0x%x for IRQ#%=
d",
> +           offset, irqd->irq);
> +    ASSERT_UNREACHABLE();
> +
> +    return NULL;
> +}
> +
>  static void gicv3_poke_irq(struct irq_desc *irqd, u32 offset, bool wait_=
for_rwp)
>  {
>      u32 mask =3D 1U << (irqd->irq % 32);
> -    void __iomem *base;
> +    void __iomem *addr =3D get_addr_by_offset(irqd, offset);
> =20
> -    if ( irqd->irq < NR_GIC_LOCAL_IRQS )
> -        base =3D GICD_RDIST_SGI_BASE;
> -    else
> -        base =3D GICD;
> +    if ( addr =3D=3D NULL )
> +        return;
> =20
> -    writel_relaxed(mask, base + offset + (irqd->irq / 32) * 4);
> +    writel_relaxed(mask, addr);
> =20
>      if ( wait_for_rwp )
>          gicv3_wait_for_rwp(irqd->irq);
> @@ -463,15 +513,12 @@ static void gicv3_poke_irq(struct irq_desc *irqd, u=
32 offset, bool wait_for_rwp)
> =20
>  static bool gicv3_peek_irq(struct irq_desc *irqd, u32 offset)
>  {
> -    void __iomem *base;
> -    unsigned int irq =3D irqd->irq;
> +    void __iomem *addr =3D get_addr_by_offset(irqd, offset);
> =20
> -    if ( irq >=3D NR_GIC_LOCAL_IRQS)
> -        base =3D GICD + (irq / 32) * 4;
> -    else
> -        base =3D GICD_RDIST_SGI_BASE;
> +    if ( addr =3D=3D NULL )
> +        return false;
> =20
> -    return !!(readl(base + offset) & (1U << (irq % 32)));
> +    return !!(readl(addr) & (1U << (irqd->irq % 32)));
>  }
> =20
>  static void gicv3_unmask_irq(struct irq_desc *irqd)
> @@ -558,30 +605,28 @@ static inline uint64_t gicv3_mpidr_to_affinity(int =
cpu)
>  static void gicv3_set_irq_type(struct irq_desc *desc, unsigned int type)
>  {
>      uint32_t cfg, actual, edgebit;
> -    void __iomem *base;
> -    unsigned int irq =3D desc->irq;
> +    void __iomem *addr;
> =20
>      /* SGI's are always edge-triggered not need to call GICD_ICFGR0 */
> -    ASSERT(irq >=3D NR_GIC_SGI);
> +    ASSERT(desc->irq >=3D NR_GIC_SGI);
> =20
> -    spin_lock(&gicv3.lock);
> +    addr =3D get_addr_by_offset(desc, GICD_ICFGR);
> +    if ( addr =3D=3D NULL )
> +        return;
> =20
> -    if ( irq >=3D NR_GIC_LOCAL_IRQS)
> -        base =3D GICD + GICD_ICFGR + (irq / 16) * 4;
> -    else
> -        base =3D GICD_RDIST_SGI_BASE + GICR_ICFGR1;
> +    spin_lock(&gicv3.lock);
> =20
> -    cfg =3D readl_relaxed(base);
> +    cfg =3D readl_relaxed(addr);
> =20
> -    edgebit =3D 2u << (2 * (irq % 16));
> +    edgebit =3D 2u << (2 * (desc->irq % 16));
>      if ( type & IRQ_TYPE_LEVEL_MASK )
>          cfg &=3D ~edgebit;
>      else if ( type & IRQ_TYPE_EDGE_BOTH )
>          cfg |=3D edgebit;
> =20
> -    writel_relaxed(cfg, base);
> +    writel_relaxed(cfg, addr);
> =20
> -    actual =3D readl_relaxed(base);
> +    actual =3D readl_relaxed(addr);
>      if ( ( cfg & edgebit ) ^ ( actual & edgebit ) )
>      {
>          printk(XENLOG_WARNING "GICv3: WARNING: "
> @@ -600,16 +645,13 @@ static void gicv3_set_irq_type(struct irq_desc *des=
c, unsigned int type)
>  static void gicv3_set_irq_priority(struct irq_desc *desc,
>                                     unsigned int priority)
>  {
> -    unsigned int irq =3D desc->irq;
> +    void __iomem *addr =3D get_addr_by_offset(desc, GICD_IPRIORITYR);
> =20
> -    spin_lock(&gicv3.lock);
> -
> -    /* Set priority */
> -    if ( irq < NR_GIC_LOCAL_IRQS )
> -        writeb_relaxed(priority, GICD_RDIST_SGI_BASE + GICR_IPRIORITYR0 =
+ irq);
> -    else
> -        writeb_relaxed(priority, GICD + GICD_IPRIORITYR + irq);
> +    if ( addr =3D=3D NULL )
> +        return;
> =20
> +    spin_lock(&gicv3.lock);
> +    writeb_relaxed(priority, addr);
>      spin_unlock(&gicv3.lock);
>  }
> =20
> @@ -1273,6 +1315,10 @@ static void gicv3_irq_set_affinity(struct irq_desc=
 *desc, const cpumask_t *mask)
>  {
>      unsigned int cpu;
>      uint64_t affinity;
> +    void __iomem *addr =3D get_addr_by_offset(desc, GICD_IROUTER);
> +
> +    if ( addr =3D=3D NULL )
> +        return;
> =20
>      ASSERT(!cpumask_empty(mask));
> =20
> @@ -1284,7 +1330,7 @@ static void gicv3_irq_set_affinity(struct irq_desc =
*desc, const cpumask_t *mask)
>      affinity &=3D ~GICD_IROUTER_SPI_MODE_ANY;
> =20
>      if ( desc->irq >=3D NR_GIC_LOCAL_IRQS )
> -        writeq_relaxed_non_atomic(affinity, (GICD + GICD_IROUTER + desc-=
>irq * 8));
> +        writeq_relaxed_non_atomic(affinity, addr);
> =20
>      spin_unlock(&gicv3.lock);
>  }
> diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/ir=
q.h
> index fce7e42a33..5bc6475eb4 100644
> --- a/xen/arch/arm/include/asm/irq.h
> +++ b/xen/arch/arm/include/asm/irq.h
> @@ -29,6 +29,7 @@ struct arch_irq_desc {
>   */
>  #define NR_IRQS		1024
> =20
> +#define SPI_MAX_INTID   1019
>  #define LPI_OFFSET      8192
> =20
>  /* LPIs are always numbered starting at 8192, so 0 is a good invalid cas=
e. */

--=20
WBR, Volodymyr=

