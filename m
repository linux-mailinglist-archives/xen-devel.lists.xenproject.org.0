Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDD3B3738E
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 22:02:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095053.1450197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqzs9-0005nw-NJ; Tue, 26 Aug 2025 20:02:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095053.1450197; Tue, 26 Aug 2025 20:02:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqzs9-0005lQ-KT; Tue, 26 Aug 2025 20:02:25 +0000
Received: by outflank-mailman (input) for mailman id 1095053;
 Tue, 26 Aug 2025 20:02:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VNE8=3G=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1uqzs8-0005lK-FR
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 20:02:24 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93bd3be9-82b7-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 22:02:22 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DU4PR03MB10696.eurprd03.prod.outlook.com
 (2603:10a6:10:581::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Tue, 26 Aug
 2025 20:02:19 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 20:02:18 +0000
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
X-Inumbo-ID: 93bd3be9-82b7-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wEHk35Gu71XfVk1ichTraj7sv1QjPrIcTBwpKt5onxbkXF5cX3S2jtUu9D2uLhEJx1hFLYzhO2SPqxfHFnnkw2XlqeuzCe7GPL36lOZfu4GA6h450xtIrT704RlV8YYubdfT7qdEDaRzkVzrbtL6g1v5TaNJ1pnAASz96IjEIc3Uh4dPS9HlKlrP9m77aQkQQ9qG+brj74b6JUoDjZU81AmyPyomheBagSVJOT37SuXNMPY359dj5FuMlZRoXzrONudStV7ZztP6kY4Vk5ZtNqZBc8BF7oWs4nor6oZsGscA5eXe9Zy6sio50HiqpVKYNCf0clB09blW92arVDyraA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KToPOR/+LblEQ39N0noW8PDKQSVGbDSDI04CZwAFtcQ=;
 b=qgYwQuwMtZ/rNKLgS5GRtjgsetly7lw0YyKNfc9YW0Dfiq7lNTZVCvI4NNxLhhiuYm4stVMJjUJOmZDFPzGniTGUdH8sINW2dMsSPB6zM2Ng+iCzGUj7nR1WqEC08nE0EF7UajCfizsTI1H6mswK33pgXvMD+gsqWW5SZ8pKeQrlpaowSNp+bEltSyCRtV3ywagQPM9eMZi3gpKWh5XPomkjehp6R7zCuQLjZ9NwFyk8gFFE14KNFdD3AyMp2bLWufu0BL2YMNhmoKN2ceV7SZyEUBFtoHbgQD4H2aK3YKH/3YZpC3FqlSbHIIApr8XvFcnl4glNOz1ibv2tuaKPQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KToPOR/+LblEQ39N0noW8PDKQSVGbDSDI04CZwAFtcQ=;
 b=iv/5RZXazHArZTO6lGs0q6q6ESc8+kth2I20ZIPFqlYHk0JS3n84ilRbipGlfAiG0DIGYxgDGeDZjNnRFVQ/hdHx82baW9KsNi/A2oH+mvE+KWjIQisHN8HuGJnk7LFXTVLbkic4jfCtYos6ZQWETeOHjY3Szt5BiSXqnueuLl07yo6gobEMOKeUkuSvUtRXoraGO911G3ZLtazU0uX7EGFbOFXMk7FdjABnGHmj97QFNbmcdcWUhg0iE5GqQ6khrj2S93XPXWXeKay27Uedr8gv/uPIj0wkjB40h5DND8iT0rSoS1yWedJUkFfo3ZB3CvgvqkxvfRweABBbrSZEPA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v3 03/11] xen/arm: vgic: implement helper functions for
 virq checks
Thread-Topic: [PATCH v3 03/11] xen/arm: vgic: implement helper functions for
 virq checks
Thread-Index: AQHcFpJ/eek3/DqJlE2eNsEQLkbJqg==
Date: Tue, 26 Aug 2025 20:02:18 +0000
Message-ID: <875xe96ed2.fsf@epam.com>
References: <cover.1756216942.git.leonid_komarianskyi@epam.com>
	<a50e978b0442d737bb2621085e95aa6bee8c506b.1756216943.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <a50e978b0442d737bb2621085e95aa6bee8c506b.1756216943.git.leonid_komarianskyi@epam.com>
	(Leonid Komarianskyi's message of "Tue, 26 Aug 2025 14:05:37 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DU4PR03MB10696:EE_
x-ms-office365-filtering-correlation-id: 134cfd9c-25a0-458e-6732-08dde4db763b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?C5/pNSWZSb9mq3/0UPKvMG0BPQDmqrn5r02kP4VyAkKFV8DtUeDTfjQv9C?=
 =?iso-8859-1?Q?BLYt68gbwPPnqe5bsiHzDhx8mVJusZCcaCnFRjc8eO3NNLLh+GfcEMV7c7?=
 =?iso-8859-1?Q?hCx9BEyxPqCf3Scni2poK6XmCCVnE99SeCPQEC1QPLg2LwvdTI4fkdEv6Q?=
 =?iso-8859-1?Q?iIfdUgD8nxYyKQV60xwk2EXFtSmol23elZYIGN+EpclVhXznSowQr6OKhq?=
 =?iso-8859-1?Q?x9q7CloFqmw8PLXdy5NgCgs62qgr7xjK2CqZ/7R/j6EfJipaZxfWGIRScu?=
 =?iso-8859-1?Q?VfIW6Wx5cEilsLpjR5DpsBrtL+ckJksVzrLchdGfsBoVY3o2y0589IWm30?=
 =?iso-8859-1?Q?3FJP9N2rQvDblUk0uEGPdGI90nDAib+tmsVDn9wrJIS4NOQYBsNs1KSfL1?=
 =?iso-8859-1?Q?pRrhhrUGKB26+Xdao7V6wvdMR2KBMjbk9qE3VJchWubRtsZPTEqdh2NvFg?=
 =?iso-8859-1?Q?eQPXXmBGDHcUEF0Na6k26U00j8ESrCvnDd17jiIs31nxgq7v614LDheDXA?=
 =?iso-8859-1?Q?KP+IpsF87lL+rdz1SLYRfPFq2q7u8n6hTe9a+mZqstJZgCup5Owb7dq/xQ?=
 =?iso-8859-1?Q?/NYC8paz4+lD2G9M7a9LSmZ0j+YmEKyl1clO9/S0jUPFHYKnWx4p6hUBeF?=
 =?iso-8859-1?Q?d4wJNJRONDe9V9j2InrNOZz/MSI3NFiEXSExE3LmracVOb6RDzq0vVUima?=
 =?iso-8859-1?Q?xT6bKRT2l1MFbeXJiE8ghu4sVueVE/N2keZtfoHz3Mg0HJo2U60Y76SXtJ?=
 =?iso-8859-1?Q?GU9cdnRN7bs223+PzlHCne++CtdI0ptgT0yI4vu47jMt8zJJb/DJq0/y3M?=
 =?iso-8859-1?Q?bx2XfEG3UV4Axrb15ujEw18Rt/hPBB+ziWc/H4K3wwFimrNe9QTssiWjpq?=
 =?iso-8859-1?Q?wAAxuKkbR369ELWR1I3vLpc0kMKir9TTyN9Op4R746/9fIvMqoFsPMBx4B?=
 =?iso-8859-1?Q?jF4tARp6uXHyuEoEbt0LVaFfrPTqYuO1ZoyZ9QJ5k9icYXKTUcP2zLfHua?=
 =?iso-8859-1?Q?nWIYMr18m8JNCmdPS9/Z7R6slJDAz+Mj/s+BG3ag5/AG2vnZY8Mvmt2CJ0?=
 =?iso-8859-1?Q?yLUdoMWTQWVj+Gsd7WbU0grFZqfGOvEK6WW2QoRS7L8GeocKfJX/9gOkAz?=
 =?iso-8859-1?Q?rMhiwhZD9a7HC8z9Rbw7koo2MdSaKLlW/tTXrnI0+1itao3dEfsABiBsUw?=
 =?iso-8859-1?Q?FODutsbO+BC4nwEd7IkIfnCfhi473urlLc6iqKcsAznYUVnvH0G2dCimPT?=
 =?iso-8859-1?Q?CjI027r9Axso/ggH/CJyNy/fy/81w7Naj5K2PyqJeQrxSdqqk1hg/mMPEh?=
 =?iso-8859-1?Q?U6kI4IizOIYsRKYLvVMEUKuImQQW61WzS3ht8OhoyDXg/WpkqcwajFHGSA?=
 =?iso-8859-1?Q?mMNE9Xc6cqIjc5CnUcsdLtkgJNUjyM2JBZ2MGJ2vq7Ev0ocwT4GW536A9L?=
 =?iso-8859-1?Q?uSRpo8v/WQ5l2BLDen4SG9ES4FoI6hCo9HQrS8UgTiruwdZv5D+yvE4AF9?=
 =?iso-8859-1?Q?NKpgSNphQJPh+OhUg3C5EKnen621pHSJ+vmpPtb2KBrA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?g8kFrGIVZ3HfqD2ftZxUWzYAl8z5KyPAaxE3i6bdEclbTdNPSvbmvUsyoX?=
 =?iso-8859-1?Q?3WUMRjN8INWUmb0/f2jKHM8bJ+cXnlk+o2UjhUE8RSK+Iql5ED402UtW0M?=
 =?iso-8859-1?Q?JhAV/ERc2aFlmlVuZ3FIv30yccdjNg78qe/DOg026GasDJSD9O/B2p42iN?=
 =?iso-8859-1?Q?sHpuNkROoGbin56FQqhKpBYGLpmwrIu/r4a4N4YVFIQakhNGL0A9kV2Zms?=
 =?iso-8859-1?Q?fGdA4SQaQRMKfw04QzEDmJN0AKQq9x2SMNVL3NEPKpf7mqG9JnseR1593a?=
 =?iso-8859-1?Q?/SXaYLFaE1+lyouOiQQ6KBnRBipPvOPNFvZNw8hmckstNLc7NtqUvAXCsk?=
 =?iso-8859-1?Q?ZkQaheYZxsxFFK7Gre0TS1zdXqoZ1Jfz87agJtiTox+H037xnI/VgtLy0M?=
 =?iso-8859-1?Q?1IRroQo7xiSI7Dm9xJM/zvwNxUyfmFTs3uvD8GqJghqi4W9VxieYM/+7dE?=
 =?iso-8859-1?Q?I7OmRGfYASstl/5lUa88QJqJcD7eFaM1R7lLIngGzKlWoconNR8ItQaWPH?=
 =?iso-8859-1?Q?ri/kx2qKfgpmda0qbKjV6cYL6n+k5wxu1CnOmot0+hb3lZSPcAIbOzdnyF?=
 =?iso-8859-1?Q?K6e0I2aXwrmKUw+z9N7PkF2QFylDtQ6JlkqznYRdgMAAhMnEt+tlI7Qegu?=
 =?iso-8859-1?Q?IYzFPzhXiAzcFP+GgN04tzKRR8OUONTi9qjBW8nGkiaBM15xia4LVQCuv7?=
 =?iso-8859-1?Q?yrhIngrQYBHRiObCdpnj06b3ZUzTlKCaCTcVZUpiKFsTRos4N+dWJntNRy?=
 =?iso-8859-1?Q?1TebtAST1+2B9RpT0rqmeFpIITqqrA911ilmPJT9ChD2cmYHo4DkINNEE/?=
 =?iso-8859-1?Q?j3ZMSSCjzQOonE7kj/2vKuWEPpmI1OJYtl/ruorJjTMN+Dg7/K++0MY9pS?=
 =?iso-8859-1?Q?3bi1C7rQdsybb+Adsrt65NqS4qMVmCMluIJHeaHc86sYwVSIIAO2BAOOH5?=
 =?iso-8859-1?Q?d3/lrOOnTnKXh1aH/An83OjUjMPFOj0D0+67QQbA2whY1D6UwNeuijaYEo?=
 =?iso-8859-1?Q?Pfs30BWe2xkyXndMuaTtnCNIYi0K0Ph7mXCYFm5bKVIKsTfZVSAMUqAKKL?=
 =?iso-8859-1?Q?fBEOyUekPh3IojEZtMsc2CV+PJcsDeTmaSDrl3aBVmIKtoUHnhwwGmTN4Y?=
 =?iso-8859-1?Q?ld8IaRjZWyfpd1MxTWq0rpiykW5Men9S1Y6o6F5u+INaCGOOw5Nf7i7rxZ?=
 =?iso-8859-1?Q?iSxLzqQCg+ygb9vZ3SPw7soEbXmgKgBlCyg6ykDLI5KneLUDxvgy6cbJm4?=
 =?iso-8859-1?Q?tKqA2VgXE33UJdoXxbPyD9Md3LQsggGyGIUKFZS5SSQZ/saDAjX9buI3W9?=
 =?iso-8859-1?Q?oTnSDISjqWWM5p1qaxKq131SE1UKJQWVFG34l6Ix7kSVAS3psayzqO8TL6?=
 =?iso-8859-1?Q?6RV+apa10JjxgwE2xaH9eWAXl2GuTJ4LnBlllyKWKLiG8Nh7CMV45yunZf?=
 =?iso-8859-1?Q?NZDolGpjNaOMC09/ZL8jdQQflYieMj/CVRpIXjo8/frzfixwD3a389s1nM?=
 =?iso-8859-1?Q?kI3lRWvmCqozTxRR9Goa+uYACr8jt+WFuUz47II5pK00+ZQS5GKVnblxQR?=
 =?iso-8859-1?Q?QMP5yvU/zl6aOvTiLZLwu3sTpf3BG5YkUDFixIHlZgp12FROpcp5wy7AUd?=
 =?iso-8859-1?Q?UV0CWrFHltZv8fR3oc+Zb98tKev8xVt8uRk2K+Zd97pBAKEv4UZi0TJw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 134cfd9c-25a0-458e-6732-08dde4db763b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 20:02:18.8827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zg6WLSrPO987y5QdkzBK3aoWEsVrucTGUcCyUIdABmgU86mQdf+H8bvd/u19delk+WKEo1hyU7R4dLyqKLNp5kc9y/m6WphXW1XZDnyqB0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10696


Hi Leonid,


Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:

> Introduced two new helper functions for vGIC: vgic_is_valid_line and
> vgic_is_spi. The functions are similar to the newly introduced
> gic_is_valid_line and gic_is_spi, but they verify whether a vIRQ
> is available for a specific domain, while GIC-specific functions
> validate INTIDs for the real GIC hardware. For example, the GIC may
> support all 992 SPI lines, but the domain may use only some part of them
> (e.g., 640), depending on the highest IRQ number defined in the domain
> configuration. Therefore, for vGIC-related code and checks, the
> appropriate functions should be used. Also, updated the appropriate
> checks to use these new helper functions.
>
> The purpose of introducing new helper functions for vGIC is essentially
> the same as for GIC: to avoid potential confusion with GIC-related
> checks and to consolidate similar code into separate functions, which
> can be more easily extended by additional conditions, e.g., when
> implementing extended SPI interrupts.
>
> Only the validation change in vgic_inject_irq may affect existing
> functionality, as it currently checks whether the vIRQ is less than or
> equal to vgic_num_irqs. Since IRQ indexes start from 0 (where 32 is the
> first SPI), the check should behave consistently with similar logic in
> other places and should check if the vIRQ number is less than
> vgic_num_irqs. The remaining changes, which replace open-coded checks
> with the use of these new helper functions, do not introduce any
> functional changes, as the helper functions follow the current vIRQ
> index verification logic.
>
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
> ---
> Changes in V2:
> - introduced this patch
>
> Changes in V3:
> - renamed vgic_is_valid_irq to vgic_is_valid_line and vgic_is_shared_irq
>   to vgic_is_spi
> - added vgic_is_valid_line implementation for new-vgic, because
>   vgic_is_valid_line is called from generic code. It is necessary to fix
>   the build for new-vgic.
> - updated commit message
> ---
>  xen/arch/arm/gic.c              |  3 +--
>  xen/arch/arm/include/asm/vgic.h |  7 +++++++
>  xen/arch/arm/irq.c              |  4 ++--
>  xen/arch/arm/vgic.c             | 10 ++++++++--
>  xen/arch/arm/vgic/vgic.c        |  5 +++++
>  5 files changed, 23 insertions(+), 6 deletions(-)
>
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index 9220eef6ea..b88237ccda 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -133,8 +133,7 @@ int gic_route_irq_to_guest(struct domain *d, unsigned=
 int virq,
> =20
>      ASSERT(spin_is_locked(&desc->lock));
>      /* Caller has already checked that the IRQ is an SPI */
> -    ASSERT(virq >=3D 32);
> -    ASSERT(virq < vgic_num_irqs(d));
> +    ASSERT(vgic_is_spi(d, virq));
>      ASSERT(!is_lpi(virq));
> =20
>      ret =3D vgic_connect_hw_irq(d, NULL, virq, desc, true);
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/v=
gic.h
> index 35c0c6a8b0..9f437e9838 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -335,6 +335,13 @@ extern void vgic_check_inflight_irqs_pending(struct =
vcpu *v,
>  /* Default number of vGIC SPIs. 32 are substracted to cover local IRQs. =
*/
>  #define VGIC_DEF_NR_SPIS (min(gic_number_lines(), VGIC_MAX_IRQS) - 32)
> =20
> +extern bool vgic_is_valid_line(struct domain *d, unsigned int virq);

Why you can't have inline implementation for vgic_is_valid_line() right her=
e?

> +
> +static inline bool vgic_is_spi(struct domain *d, unsigned int virq)
> +{
> +    return (virq >=3D NR_LOCAL_IRQS && vgic_is_valid_line(d, virq));

You don't need parentheses here.

> +}
> +
>  /*
>   * Allocate a guest VIRQ
>   *  - spi =3D=3D 0 =3D> allocate a PPI. It will be the same on every vCP=
U
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 7dd5a2a453..b8eccfc924 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -442,7 +442,7 @@ int route_irq_to_guest(struct domain *d, unsigned int=
 virq,
>      unsigned long flags;
>      int retval =3D 0;
> =20
> -    if ( virq >=3D vgic_num_irqs(d) )
> +    if ( !vgic_is_valid_line(d, virq) )
>      {
>          printk(XENLOG_G_ERR
>                 "the vIRQ number %u is too high for domain %u (max =3D %u=
)\n",
> @@ -560,7 +560,7 @@ int release_guest_irq(struct domain *d, unsigned int =
virq)
>      int ret;
> =20
>      /* Only SPIs are supported */
> -    if ( virq < NR_LOCAL_IRQS || virq >=3D vgic_num_irqs(d) )
> +    if ( !vgic_is_spi(d, virq) )
>          return -EINVAL;
> =20
>      desc =3D vgic_get_hw_irq_desc(d, NULL, virq);
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index c563ba93af..2bbf4d99aa 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -24,6 +24,12 @@
>  #include <asm/gic.h>
>  #include <asm/vgic.h>
> =20
> +
> +bool vgic_is_valid_line(struct domain *d, unsigned int virq)

Implementation of this function here in for new vgic is basically the
same and depends only on vgic_num_irqs() which is macro defined in
vgic.h and used by both implementations.

> +{
> +    return virq < vgic_num_irqs(d);
> +}
> +
>  static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
>                                                    unsigned int rank)
>  {
> @@ -582,7 +588,7 @@ void vgic_inject_irq(struct domain *d, struct vcpu *v=
, unsigned int virq,
>      if ( !v )
>      {
>          /* The IRQ needs to be an SPI if no vCPU is specified. */
> -        ASSERT(virq >=3D 32 && virq <=3D vgic_num_irqs(d));
> +        ASSERT(vgic_is_spi(d, virq));
> =20
>          v =3D vgic_get_target_vcpu(d->vcpu[0], virq);
>      };
> @@ -659,7 +665,7 @@ bool vgic_emulate(struct cpu_user_regs *regs, union h=
sr hsr)
> =20
>  bool vgic_reserve_virq(struct domain *d, unsigned int virq)
>  {
> -    if ( virq >=3D vgic_num_irqs(d) )
> +    if ( !vgic_is_valid_line(d, virq) )
>          return false;
> =20
>      return !test_and_set_bit(virq, d->arch.vgic.allocated_irqs);
> diff --git a/xen/arch/arm/vgic/vgic.c b/xen/arch/arm/vgic/vgic.c
> index 6cabd0496d..b2c0e1873a 100644
> --- a/xen/arch/arm/vgic/vgic.c
> +++ b/xen/arch/arm/vgic/vgic.c
> @@ -718,6 +718,11 @@ bool vgic_reserve_virq(struct domain *d, unsigned in=
t virq)
>      return !test_and_set_bit(virq, d->arch.vgic.allocated_irqs);
>  }
> =20
> +bool vgic_is_valid_line(struct domain *d, unsigned int virq)
> +{
> +    return virq < vgic_num_irqs(d);
> +}

> +
>  int vgic_allocate_virq(struct domain *d, bool spi)
>  {
>      int first, end;

--=20
WBR, Volodymyr=

