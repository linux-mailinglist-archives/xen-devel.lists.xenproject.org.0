Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FEBB3C3AA
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 22:12:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1102108.1454866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us5SM-0002i0-Lf; Fri, 29 Aug 2025 20:12:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1102108.1454866; Fri, 29 Aug 2025 20:12:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us5SM-0002gX-IU; Fri, 29 Aug 2025 20:12:18 +0000
Received: by outflank-mailman (input) for mailman id 1102108;
 Fri, 29 Aug 2025 20:12:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sr3h=3J=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1us5SL-0002gR-Bp
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 20:12:17 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7446d774-8514-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 22:12:14 +0200 (CEST)
Received: from DU5PR03MB10441.eurprd03.prod.outlook.com (2603:10a6:10:516::14)
 by DBAPR03MB6440.eurprd03.prod.outlook.com (2603:10a6:10:193::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.19; Fri, 29 Aug
 2025 20:12:12 +0000
Received: from DU5PR03MB10441.eurprd03.prod.outlook.com
 ([fe80::eeb8:470:6260:e5f4]) by DU5PR03MB10441.eurprd03.prod.outlook.com
 ([fe80::eeb8:470:6260:e5f4%7]) with mapi id 15.20.9073.021; Fri, 29 Aug 2025
 20:12:12 +0000
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
X-Inumbo-ID: 7446d774-8514-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qtxhkF+VmRJH0/CDqUIZQhFhWQUCjpi3vH5UYUZdhQsyL8RvOx3AetDiKM0z6r8to+WVhVOEsmzwZyEv1DaU4YFA+7/2kFFNxSPRMIx6zu9VFvE/fO2iqELmobgDrv753HKuOiHZYn/6jgHUJeZBV7/vOUfObeHkUlZiPl029jnwogPTukqBas/5/WHLGWOJY6TlRGYnYA3VcLontaBbLCXf3Ol/spgb4MFDsPEEqt/aGBiXqEhHEF1hO4UCTu+/d8B1ZH+WSlHKfjDgdFfNYnX1JqDc/4FseT3ejcapLawQU/iiiwANMmsIICkt2cdx0rIQx3Ty/mAjVui5JRhKnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8bI7d9DCiXGa+KpVlO3MVujbrSBuI8XBePRI+Fxqqs=;
 b=oDlK+FVpi5MmG9aK/6e9PFRaQyyb1E+2EGwX9jVH9pTjTp60Z0k/AbB7fGuH48I1wGX1lSimLNK2+IAdv66GqpCN3YfdhImQUqEDQK2dX3EXNzASSy0xzBMrB2kC9eOQAUr67D17W8Q2npRLQTAB4n6FmdzbxHmtTopsffxFCFutD7vVp7PGQ84dwEUuxkf1cyHGRuJ4qRqYGSpJulNv64ycUjeK3A6XUsIZR/qQvQb+GUJY+Ebd7CYdYnAi38y2VWpuZyp/QOI1TyQ71gkv4OW1xrib+NmzzIe6/Fa+PeSqg+55k3ufHCeEgOsUZeaWf43AeNb1wcmKxjpo1bx1jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8bI7d9DCiXGa+KpVlO3MVujbrSBuI8XBePRI+Fxqqs=;
 b=P8k3n9bS5OMVgf0KlzS9bNSWy98lmx3eDTj+NjsJSaQU4MYlGo6quSxgtkmvF8Rhp2+cJue9KrO9Qj+fldtNmJVOsoC2ltJj5sJPVrDsKQI/kxsjwfnQhSXJ3Zqax6nJ0zP8UDPw2faaWGTJCMlKJTjUku1FtK78T/SsYIWonTmg7cVEBx1L0VvfSn7uJnJeK734++m61d5m30Clspq2gjBaWEjblrkZS4jqWJurXZ8tVOtmA3UIMqlI9UR+9GsztKKRxPvyvJ3FYw92fuwvV592bQm0a37nETbBSBrTaKEGWuBFEHCV5jnzkTzvRJzROwbTWwotgGMFEK5q5mGjhA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v5 10/12] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Topic: [PATCH v5 10/12] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Index: AQHcGP7mpeV242hLM02UQE7oK85XeQ==
Date: Fri, 29 Aug 2025 20:12:12 +0000
Message-ID: <87cy8dyjj8.fsf@epam.com>
References: <cover.1756481577.git.leonid_komarianskyi@epam.com>
	<6fda233a1a2f0362062ff9a6e80ee223d33815cf.1756481577.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <6fda233a1a2f0362062ff9a6e80ee223d33815cf.1756481577.git.leonid_komarianskyi@epam.com>
	(Leonid Komarianskyi's message of "Fri, 29 Aug 2025 16:06:36 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10441:EE_|DBAPR03MB6440:EE_
x-ms-office365-filtering-correlation-id: 357be96e-f90d-4642-8bd5-08dde738573b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?7NRrKXMz7ZqsXZOb2Nm0vixnPqZrOlaboQP6vNGOBMB9cIck1ZZuZ+8WbO?=
 =?iso-8859-1?Q?wJbGZDAxQxuy0uu0M0Y0CXVbQlz0PlljPoGXu+7uYuAQ1p0o+DywbXpE5D?=
 =?iso-8859-1?Q?XdUWHtDsBfwZsxkPWLvCzWD1crwWwQ72/CresyjyxBpq/dv4QW6xAZ2fRC?=
 =?iso-8859-1?Q?7tbLvJXzGVGFBqNElCQwBKgoYbibDXv8C8XhJQldzfmf4VBomcxdtL/ywC?=
 =?iso-8859-1?Q?/ZRoNoR95uGsLBTslptQ+5+EL2P/VCLBkNbrVZQspN131ZOSK4EC3ivMSK?=
 =?iso-8859-1?Q?xsKJFXJndIFUdtXpRrtmOGeJwmWiKa2MupTfBT/S4KdHZ22x1ndbYMLr4w?=
 =?iso-8859-1?Q?8vPFkfUPCLec8SI0AYvZdSs5eRAUqFcj7TJuZiHW4AV+R7TVctBcwXVwit?=
 =?iso-8859-1?Q?QiaytyHE6z8kO9oIDHUAvqu239VxgWCcqumz7I7PEvf23a4hj6JQ+gxiyX?=
 =?iso-8859-1?Q?gRFt5xzvhNxP27uGxghhw/UX0Flbuf9K/h/u22Xfo3UscUdRFSj3gnrHbb?=
 =?iso-8859-1?Q?HKoRcaH3FgYhkKWOpqOxt4si32bIfBTg9Scl0JVBb8HH+C089v3p9ZoUmp?=
 =?iso-8859-1?Q?V4W029cslaHbdSMs5Re0/QlK828YbMr3p3y1eYHki8a8LkaTkXEetewU5I?=
 =?iso-8859-1?Q?HUHHhg/lWSKBqVJHznijErAiLlCAZZjunt9e225MFvJXeMsT9UlavjxBdV?=
 =?iso-8859-1?Q?PAbMhIbTDMkEUcfElsBF4oR48gqKDlV3o4xttF46V695S6QuuDizV+3eNk?=
 =?iso-8859-1?Q?u/thXnuxo0jTnr/cibmgL8KrzN4HQhJ/PHVxFklBaU1b7daNXEFDMy6ZF6?=
 =?iso-8859-1?Q?dX0bpcSOyPFFb5/Uzx6xItcF0zQg6JocgzrqA5Fpp1Ay0lgDA6Fe7iyTVE?=
 =?iso-8859-1?Q?DJ7iJi/54HWBfGcAr3Vu5RehbHXGk2zHv0+tM3XwwiPFgOflPwobHNYe/P?=
 =?iso-8859-1?Q?qluVJI+jMq0Ng9oKrVuA+srSW+ZsoL+ZbFkbF23AlM6l86D4xxO2saB6OZ?=
 =?iso-8859-1?Q?h3SXboEH+61f1zH/oyKFm9smzE5r4swdqHEIwkw/8LvEkKUexqkJE3fpI8?=
 =?iso-8859-1?Q?Wck3UM0jbIRA6c9dM06BjutRbuTu9lT7Da9oJtRFh6wjbaR9FkPXCx0N5F?=
 =?iso-8859-1?Q?Gn5vIU1wVJ7eD+BlOGm+UtDYwQ4mDbRc+OrUl3uu02AKRALtnjfIvy7pd3?=
 =?iso-8859-1?Q?V2KfvA798Q7NGsRx7Lh1JixxGE+YKw4pvK8EQVqcfV7U5QK1BK6C2t2gv+?=
 =?iso-8859-1?Q?pwNO90xr99wP7j1utsFjsKe+pWNaohI4wBp7b5ZSKeHDjdJrO2za1mmGC3?=
 =?iso-8859-1?Q?SZROGgVlf/4nhD7lmxK8ctXyXw7qxcJFyhhbpp689O8IJhuMYzwoVjFAU3?=
 =?iso-8859-1?Q?NoFTPDxaqiD0A+YwetYjaPZ+MXtgQQsFLFNJqINFwe/mcB4zuFw5qAUAyT?=
 =?iso-8859-1?Q?Ux2ixlQetWlN8WXoIW9WUf+hULnsrymM3jCNfO4M+cO0AgCbEiBbuQbeHZ?=
 =?iso-8859-1?Q?+I/OCNKY5robf4ajhAZX4vlxV3jKLkxafSfp4DEb0cVw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10441.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?aB3eSo3uyevDCb37f5q/c/mzH1NOy0biGyfkC8YGqJm78UDFD5ObP84Orc?=
 =?iso-8859-1?Q?oH/tOpvIo8kC+mMoknyAtGvuyAGKKPxosHbj0RugSGAbiYufY06bmB9PX0?=
 =?iso-8859-1?Q?xyl90myzqjpMFwB4QVkcFwugP/P5ldtC+HEqWVYG7CTBA4MDx6ivswLpu5?=
 =?iso-8859-1?Q?r7Db5GhODGOYd/suSEkhqeuweifzW3qSS9wAG38xdWl8vA6bHHaFJK1CSU?=
 =?iso-8859-1?Q?0RLhe8LgKu9Ep7lk60CMT0Nx3WHfZLtRs9SIEox6OuKtaLid2YvPkt77aK?=
 =?iso-8859-1?Q?hlmTjc44y4jCwlY8U2UrsqgfID8T6Kdyr5Ph0c6JXeTcX48XxYhB3YDTvA?=
 =?iso-8859-1?Q?dyhQ5eOvwMJfOEUilMYQh1QGPb1Zo4oGvgBqibALj6JXk1JUOOZTAGY21/?=
 =?iso-8859-1?Q?0R0nEYuOXsuFhmr/+Tj/rh1g2MNmdfUIe9Pi/NFL877L26c9lY7jRNtwPz?=
 =?iso-8859-1?Q?H4jzEGrjbnWdNsC6Gv4riZoU6hCa0z/hkkoiPI9Epkf0sZ3dsCddmNbnYw?=
 =?iso-8859-1?Q?4tMe/YFJa6Xd9I+XUt13+43Abi1xOFwQNCeB7oIHn8li/bY7MFzlz2TqGo?=
 =?iso-8859-1?Q?4pH7P7X/yPlf8OO62OelPrExrJ8RAQJTAvM1SSuIqkLxQ9q8YDvz46qSQe?=
 =?iso-8859-1?Q?TzN8oe4nd60jjjdb1Q4oVdRaF3SEodl+59SJ9Q1xDcpUAX4SZWiprDTaeX?=
 =?iso-8859-1?Q?MvZDdgBPY4UzMjumhtPacRgGBjRpURVIdcOFJuMYLldFvY9/HGLKts6/rt?=
 =?iso-8859-1?Q?STOGGgSIQ5UQkEVeU+ATkCXz7fpkE6nO4iCXMGQuk98Fmt/HbggzjAptbF?=
 =?iso-8859-1?Q?DoNwbA2CBNwROsEobSaxZEuuVWpubncawhMOGId8IdB/X1HKwO8tXyizfq?=
 =?iso-8859-1?Q?BjAoqtfao97ULP51qxvsatdPGn5kBlk4cyw655y+MZQlFadLojM4omTxRC?=
 =?iso-8859-1?Q?+5cDVPaZYsGnpY1Pkp+dxh02Z+yjkF0WQy+VMt5f7o1wIyMDNNzTpihX4F?=
 =?iso-8859-1?Q?28ZpaJEMzJ06igAyAq1pllUYB46CXbjNZZaXERug9nDjkpsKfQkPCjmAAZ?=
 =?iso-8859-1?Q?b73BU8kED4D7QwEzAPJi3mrz9j4KYVCRqYlB66inw5eUhDUWlyxXfLNmG4?=
 =?iso-8859-1?Q?7YMmu/UAl2A9iu3hWC8smQkNMWOI16TW9EYCfSbAlUEJ95lViANWBVUOc/?=
 =?iso-8859-1?Q?MoJZFD0b30MOohQqV2KYBD+7e2WOad90Au3tOBwn+64SY+XjWEvCORc6vb?=
 =?iso-8859-1?Q?+0Opklzxjql7P6eMxt4GvH06ijEHSmx3y0IZABzXkb3UOHeCTKc4kcSXnF?=
 =?iso-8859-1?Q?TA50kQiZTsCEiBbBgWnqu8EYjVtQ+wWxFBoLwjqlUe62qqDnjbfwax2Q1r?=
 =?iso-8859-1?Q?v5pqoDKpbFzF+VxbWu8N9jCqCaziG1vWZXnimswjzWiVxsREnrG3DiemJg?=
 =?iso-8859-1?Q?GG3Df/HAgJN0I94E0Y3LKLzXxUB2Ix+JQt6JqZqXzFV3Q/FOFJVgEOB/fP?=
 =?iso-8859-1?Q?SrZ7gK5uabY3bj+1mU7wUTLce/lRB7PwudsA6cNn2FASo9OaDNUs4f9YQg?=
 =?iso-8859-1?Q?vNigbHQ7vOZ/IHAi5gZh4fCYd0W0JMsfRjHh4aumxFjEcJSa1uhP7A5uNY?=
 =?iso-8859-1?Q?uztskh2wbDme8HkutLQ10RXMDJZPJGkeBHTP7712hg0/+wAig9rbzu9g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10441.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 357be96e-f90d-4642-8bd5-08dde738573b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 20:12:12.3641
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Qv4ZhNxRkcuW2edhE7ro+5FmYr2XePZtcUy//qvNUrhm38NZm+/GZ/8vj2VkeGJCJE7HB5TnaBLtHc/1CSuwbDwEWLb27cG3CcM19kdTLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6440

Hi Leonid,

Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:

> Implemented support for GICv3.1 extended SPI registers for vGICv3,
> allowing the emulation of eSPI-specific behavior for guest domains.
> The implementation includes read and write emulation for eSPI-related
> registers (e.g., GICD_ISENABLERnE, GICD_IROUTERnE, and others),
> following a similar approach to the handling of regular SPIs.
>
> The eSPI registers, previously located in reserved address ranges,
> are now adjusted to support MMIO read and write operations correctly
> when CONFIG_GICV3_ESPI is enabled.
>
> The availability of eSPIs and the number of emulated extended SPIs
> for guest domains is reported by setting the appropriate bits in the
> GICD_TYPER register, based on the number of eSPIs requested by the
> domain and supported by the hardware. In cases where the configuration
> option is disabled, the hardware does not support eSPIs, or the domain
> does not request such interrupts, the functionality remains unchanged.
>
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

I have a couple of comments about coding style, but apart from that it
looks really good. With these issues fixed:

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

>
> ---
> Changes in V5:
> - since eSPI-specific defines and macros are now available even when the
>   appropriate config is disabled, this allows us to remove many
>   #ifdef guards and reuse the existing code for regular SPIs for eSPIs as
>   well, as eSPIs are processed similarly. This improves code readability
>   and consolidates the register ranges for SPIs and eSPIs in a single
>   place, simplifying future changes or fixes for SPIs and their
>   counterparts from the extended range
> - moved vgic_ext_rank_offset() from
>   [08/12] xen/arm: vgic: add resource management for extended SPIs
>   as the function was unused before this patch
> - added stub implementation of vgic_ext_rank_offset() when CONFIG_GICV3_E=
SPI=3Dn
> - removed unnecessary defines for reserved ranges, which were introduced =
in
>   V4 to reduce the number of #ifdefs. The issue is now resolved by
>   allowing the use of SPI-specific offsets and reworking the logic
>
> Changes in V4:
> - added missing RAZ and write ignore eSPI-specific registers ranges:
>   GICD_NSACRnE and GICD_IGRPMODRnE
> - changed previously reserved range to cover GICD_NSACRnE and
>   GICD_IGRPMODRnE
> - introduced GICD_RESERVED_RANGE<n>_START/END defines to remove
>   hardcoded values and reduce the number of ifdefs
> - fixed reserved ranges with eSPI option enabled: added missing range
>   0x0F30-0x0F7C
> - updated the logic for domains that do not support eSPI, but Xen is
>   compiled with the eSPI option. Now, prior to other MMIO checks, we
>   verify whether eSPI is available for the domain or not. If not, it
>   behaves as it does currently - RAZ and WI
> - fixed print for GICD_ICACTIVERnE
> - fixed new lines formatting for switch-case
>
> Changes in V3:
> - changed vgic_store_irouter parameters - instead of offset virq is
>   used, to remove the additional bool espi parameter and simplify
>   checks. Also, adjusted parameters for regular SPI. Since the offset
>   parameter was used only for calculating virq number and then reused for
>   finding rank offset, it will not affect functionality.
> - fixed formatting for goto lables - added newlines after condition
> - fixed logs for GICD_ISACTIVERnE and GICD_ICACTIVERnE handlers
> - removed #ifdefs in 2 places where they were adjacent and could be merge=
d
>
> Changes in V2:
> - add missing rank index conversion for pending and inflight irqs
> ---
>  xen/arch/arm/include/asm/vgic.h |   4 +
>  xen/arch/arm/vgic-v3.c          | 198 ++++++++++++++++++++++++++------
>  xen/arch/arm/vgic.c             |  23 ++++
>  3 files changed, 192 insertions(+), 33 deletions(-)
>
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/v=
gic.h
> index 3aa22114ba..103bc3c74b 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -314,6 +314,10 @@ extern struct vgic_irq_rank *vgic_rank_offset(struct=
 vcpu *v,
>                                                unsigned int b,
>                                                unsigned int n,
>                                                unsigned int s);
> +extern struct vgic_irq_rank *vgic_ext_rank_offset(struct vcpu *v,
> +                                                  unsigned int b,
> +                                                  unsigned int n,
> +                                                  unsigned int s);
>  extern struct vgic_irq_rank *vgic_rank_irq(struct vcpu *v, unsigned int =
irq);
>  extern void vgic_disable_irqs(struct vcpu *v, uint32_t r, unsigned int n=
);
>  extern void vgic_enable_irqs(struct vcpu *v, uint32_t r, unsigned int n)=
;
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index 4369c55177..b5d766c98f 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -111,13 +111,10 @@ static uint64_t vgic_fetch_irouter(struct vgic_irq_=
rank *rank,
>   * Note the offset will be aligned to the appropriate boundary.
>   */
>  static void vgic_store_irouter(struct domain *d, struct vgic_irq_rank *r=
ank,
> -                               unsigned int offset, uint64_t irouter)
> +                               unsigned int virq, uint64_t irouter)
>  {
>      struct vcpu *new_vcpu, *old_vcpu;
> -    unsigned int virq;
> -
> -    /* There is 1 vIRQ per IROUTER */
> -    virq =3D offset / NR_BYTES_PER_IROUTER;
> +    unsigned int offset;
> =20
>      /*
>       * The IROUTER0-31, used for SGIs/PPIs, are reserved and should
> @@ -685,13 +682,20 @@ static int __vgic_v3_distr_common_mmio_read(const c=
har *name, struct vcpu *v,
>      {
>      case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
>      case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
> +    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
> +    case VRANGE32(GICD_IGRPMODRnE, GICD_IGRPMODRnEN):
>          /* We do not implement security extensions for guests, read zero=
 */
>          if ( dabt.size !=3D DABT_WORD ) goto bad_width;
>          goto read_as_zero;
> =20
>      case VRANGE32(GICD_ISENABLER, GICD_ISENABLERN):
> +    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
>          if ( dabt.size !=3D DABT_WORD ) goto bad_width;
> -        rank =3D vgic_rank_offset(v, 1, reg - GICD_ISENABLER, DABT_WORD)=
;
> +        if ( reg >=3D GICD_ISENABLERnE )
> +            rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ISENABLERnE,
> +                                        DABT_WORD);
> +        else
> +            rank =3D vgic_rank_offset(v, 1, reg - GICD_ISENABLER, DABT_W=
ORD);
>          if ( rank =3D=3D NULL ) goto read_as_zero;
>          vgic_lock_rank(v, rank, flags);
>          *r =3D vreg_reg32_extract(rank->ienable, info);
> @@ -699,8 +703,13 @@ static int __vgic_v3_distr_common_mmio_read(const ch=
ar *name, struct vcpu *v,
>          return 1;
> =20
>      case VRANGE32(GICD_ICENABLER, GICD_ICENABLERN):
> +    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
>          if ( dabt.size !=3D DABT_WORD ) goto bad_width;
> -        rank =3D vgic_rank_offset(v, 1, reg - GICD_ICENABLER, DABT_WORD)=
;
> +        if ( reg >=3D GICD_ICENABLERnE )
> +            rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ICENABLERnE,
> +                                        DABT_WORD);
> +        else
> +            rank =3D vgic_rank_offset(v, 1, reg - GICD_ICENABLER, DABT_W=
ORD);
>          if ( rank =3D=3D NULL ) goto read_as_zero;
>          vgic_lock_rank(v, rank, flags);
>          *r =3D vreg_reg32_extract(rank->ienable, info);
> @@ -710,20 +719,29 @@ static int __vgic_v3_distr_common_mmio_read(const c=
har *name, struct vcpu *v,
>      /* Read the pending status of an IRQ via GICD/GICR is not supported =
*/
>      case VRANGE32(GICD_ISPENDR, GICD_ISPENDRN):
>      case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
> +    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
> +    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
>          goto read_as_zero;
> =20
>      /* Read the active status of an IRQ via GICD/GICR is not supported *=
/
>      case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
>      case VRANGE32(GICD_ICACTIVER, GICD_ICACTIVERN):
> +    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
> +    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
>          goto read_as_zero;
> =20
>      case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
> +    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
>      {
>          uint32_t ipriorityr;
>          uint8_t rank_index;
> =20
>          if ( dabt.size !=3D DABT_BYTE && dabt.size !=3D DABT_WORD ) goto=
 bad_width;
> -        rank =3D vgic_rank_offset(v, 8, reg - GICD_IPRIORITYR, DABT_WORD=
);
> +        if ( reg >=3D GICD_IPRIORITYRnE )
> +            rank =3D vgic_ext_rank_offset(v, 8, reg - GICD_IPRIORITYRnE,
> +                                        DABT_WORD);
> +        else
> +            rank =3D vgic_rank_offset(v, 8, reg - GICD_IPRIORITYR, DABT_=
WORD);
>          if ( rank =3D=3D NULL ) goto read_as_zero;
>          rank_index =3D REG_RANK_INDEX(8, reg - GICD_IPRIORITYR, DABT_WOR=
D);
> =20
> @@ -737,11 +755,15 @@ static int __vgic_v3_distr_common_mmio_read(const c=
har *name, struct vcpu *v,
>      }
> =20
>      case VRANGE32(GICD_ICFGR, GICD_ICFGRN):
> +    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
>      {
>          uint32_t icfgr;
> =20
>          if ( dabt.size !=3D DABT_WORD ) goto bad_width;
> -        rank =3D vgic_rank_offset(v, 2, reg - GICD_ICFGR, DABT_WORD);
> +        if ( reg >=3D GICD_ICFGRnE )
> +            rank =3D vgic_ext_rank_offset(v, 2, reg - GICD_ICFGRnE, DABT=
_WORD);
> +        else
> +            rank =3D vgic_rank_offset(v, 2, reg - GICD_ICFGR, DABT_WORD)=
;
>          if ( rank =3D=3D NULL ) goto read_as_zero;
>          vgic_lock_rank(v, rank, flags);
>          icfgr =3D rank->icfg[REG_RANK_INDEX(2, reg - GICD_ICFGR, DABT_WO=
RD)];
> @@ -782,46 +804,81 @@ static int __vgic_v3_distr_common_mmio_write(const =
char *name, struct vcpu *v,
>      {
>      case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
>      case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
> +    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
> +    case VRANGE32(GICD_IGRPMODRnE, GICD_IGRPMODRnEN):
>          /* We do not implement security extensions for guests, write ign=
ore */
>          goto write_ignore_32;
> =20
>      case VRANGE32(GICD_ISENABLER, GICD_ISENABLERN):
> +    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
>          if ( dabt.size !=3D DABT_WORD ) goto bad_width;
> -        rank =3D vgic_rank_offset(v, 1, reg - GICD_ISENABLER, DABT_WORD)=
;
> +        if ( reg >=3D GICD_ISENABLERnE )
> +            rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ISENABLERnE,
> +                                        DABT_WORD);
> +        else
> +            rank =3D vgic_rank_offset(v, 1, reg - GICD_ISENABLER, DABT_W=
ORD);
>          if ( rank =3D=3D NULL ) goto write_ignore;
>          vgic_lock_rank(v, rank, flags);
>          tr =3D rank->ienable;
>          vreg_reg32_setbits(&rank->ienable, r, info);
> -        vgic_enable_irqs(v, (rank->ienable) & (~tr), rank->index);
> +        if ( reg >=3D GICD_ISENABLERnE )
> +            vgic_enable_irqs(v, (rank->ienable) & (~tr),
> +                             EXT_RANK_IDX2NUM(rank->index));
> +        else
> +            vgic_enable_irqs(v, (rank->ienable) & (~tr), rank->index);
>          vgic_unlock_rank(v, rank, flags);
>          return 1;
> =20
>      case VRANGE32(GICD_ICENABLER, GICD_ICENABLERN):
> +    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
>          if ( dabt.size !=3D DABT_WORD ) goto bad_width;
> -        rank =3D vgic_rank_offset(v, 1, reg - GICD_ICENABLER, DABT_WORD)=
;
> +        if ( reg >=3D GICD_ICENABLERnE )
> +            rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ICENABLERnE,
> +                                        DABT_WORD);
> +        else
> +            rank =3D vgic_rank_offset(v, 1, reg - GICD_ICENABLER, DABT_W=
ORD);
>          if ( rank =3D=3D NULL ) goto write_ignore;
>          vgic_lock_rank(v, rank, flags);
>          tr =3D rank->ienable;
>          vreg_reg32_clearbits(&rank->ienable, r, info);
> -        vgic_disable_irqs(v, (~rank->ienable) & tr, rank->index);
> +        if ( reg >=3D GICD_ICENABLERnE )
> +            vgic_disable_irqs(v, (~rank->ienable) & tr,
> +                              EXT_RANK_IDX2NUM(rank->index));
> +        else
> +            vgic_disable_irqs(v, (~rank->ienable) & tr, rank->index);
>          vgic_unlock_rank(v, rank, flags);
>          return 1;
> =20
>      case VRANGE32(GICD_ISPENDR, GICD_ISPENDRN):
> +    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
>          if ( dabt.size !=3D DABT_WORD ) goto bad_width;
> -        rank =3D vgic_rank_offset(v, 1, reg - GICD_ISPENDR, DABT_WORD);
> +        if ( reg >=3D GICD_ISPENDRnE )
> +            rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ISPENDRnE, DA=
BT_WORD);
> +        else
> +            rank =3D vgic_rank_offset(v, 1, reg - GICD_ISPENDR, DABT_WOR=
D);
>          if ( rank =3D=3D NULL ) goto write_ignore;
> =20
> -        vgic_set_irqs_pending(v, r, rank->index);
> +        if ( reg >=3D GICD_ISPENDRnE )
> +            vgic_set_irqs_pending(v, r, EXT_RANK_IDX2NUM(rank->index));
> +        else
> +            vgic_set_irqs_pending(v, r, rank->index);
> =20
>          return 1;
> =20
>      case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
> +    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
>          if ( dabt.size !=3D DABT_WORD ) goto bad_width;
> -        rank =3D vgic_rank_offset(v, 1, reg - GICD_ICPENDR, DABT_WORD);
> +        if ( reg >=3D GICD_ICPENDRnE )
> +            rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ICPENDRnE, DA=
BT_WORD);
> +        else
> +            rank =3D vgic_rank_offset(v, 1, reg - GICD_ICPENDR, DABT_WOR=
D);
>          if ( rank =3D=3D NULL ) goto write_ignore;
> =20
> -        vgic_check_inflight_irqs_pending(v, rank->index, r);
> +        if ( reg >=3D GICD_ICPENDRnE )
> +            vgic_check_inflight_irqs_pending(v,
> +                                             EXT_RANK_IDX2NUM(rank->inde=
x), r);
> +        else
> +            vgic_check_inflight_irqs_pending(v, rank->index, r);
> =20
>          goto write_ignore;
> =20
> @@ -838,16 +895,38 @@ static int __vgic_v3_distr_common_mmio_write(const =
char *name, struct vcpu *v,
>                 v, name, r, reg - GICD_ICACTIVER);
>          goto write_ignore_32;
> =20
> +    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
> +        if ( dabt.size !=3D DABT_WORD )
> +            goto bad_width;
> +        printk(XENLOG_G_ERR
> +               "%pv: %s: unhandled word write %#"PRIregister" to ISACTIV=
ER%dE\n",
> +               v, name, r, reg - GICD_ISACTIVERnE);
> +        return 0;
> +
> +    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
> +        printk(XENLOG_G_ERR
> +               "%pv: %s: unhandled word write %#"PRIregister" to ICACTIV=
ER%dE\n",
> +               v, name, r, reg - GICD_ICACTIVERnE);
> +        goto write_ignore_32;
> +
>      case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
> +    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
>      {
> -        uint32_t *ipriorityr, priority;
> +        uint32_t *ipriorityr, priority, offset;
> =20
>          if ( dabt.size !=3D DABT_BYTE && dabt.size !=3D DABT_WORD ) goto=
 bad_width;
> -        rank =3D vgic_rank_offset(v, 8, reg - GICD_IPRIORITYR, DABT_WORD=
);
> +        if ( reg >=3D GICD_IPRIORITYRnE ) {

Brace should go on new line

> +            offset =3D reg - GICD_IPRIORITYRnE;
> +            rank =3D vgic_ext_rank_offset(v, 8, offset, DABT_WORD);
> +        }
> +        else
> +        {
> +            offset =3D reg - GICD_IPRIORITYR;
> +            rank =3D vgic_rank_offset(v, 8, offset, DABT_WORD);
> +        }
>          if ( rank =3D=3D NULL ) goto write_ignore;
>          vgic_lock_rank(v, rank, flags);
> -        ipriorityr =3D &rank->ipriorityr[REG_RANK_INDEX(8, reg - GICD_IP=
RIORITYR,
> -                                                      DABT_WORD)];
> +        ipriorityr =3D &rank->ipriorityr[REG_RANK_INDEX(8, offset, DABT_=
WORD)];
>          priority =3D ACCESS_ONCE(*ipriorityr);
>          vreg_reg32_update(&priority, r, info);
>          ACCESS_ONCE(*ipriorityr) =3D priority;
> @@ -859,10 +938,14 @@ static int __vgic_v3_distr_common_mmio_write(const =
char *name, struct vcpu *v,
>          goto write_ignore_32;
> =20
>      case VRANGE32(GICD_ICFGR + 4, GICD_ICFGRN): /* PPI + SPIs */
> +    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
>          /* ICFGR1 for PPI's, which is implementation defined
>             if ICFGR1 is programmable or not. We chose to program */
>          if ( dabt.size !=3D DABT_WORD ) goto bad_width;
> -        rank =3D vgic_rank_offset(v, 2, reg - GICD_ICFGR, DABT_WORD);
> +        if ( reg >=3D GICD_ICFGRnE )
> +            rank =3D vgic_ext_rank_offset(v, 2, reg - GICD_ICFGRnE, DABT=
_WORD);
> +        else
> +            rank =3D vgic_rank_offset(v, 2, reg - GICD_ICFGR, DABT_WORD)=
;
>          if ( rank =3D=3D NULL ) goto write_ignore;
>          vgic_lock_rank(v, rank, flags);
>          vreg_reg32_update(&rank->icfg[REG_RANK_INDEX(2, reg - GICD_ICFGR=
,
> @@ -1129,6 +1212,16 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v,=
 mmio_info_t *info,
>              typer |=3D GICD_TYPE_LPIS;
> =20
>          typer |=3D (v->domain->arch.vgic.intid_bits - 1) << GICD_TYPE_ID=
_BITS_SHIFT;
> +#ifdef CONFIG_GICV3_ESPI
> +        if ( v->domain->arch.vgic.nr_espis > 0 )
> +        {
> +            /* Set eSPI support bit for the domain */
> +            typer |=3D GICD_TYPER_ESPI;
> +            /* Set ESPI range bits */
> +            typer |=3D (DIV_ROUND_UP(v->domain->arch.vgic.nr_espis, 32) =
- 1)
> +                       << GICD_TYPER_ESPI_RANGE_SHIFT;
> +        }
> +#endif
> =20
>          *r =3D vreg_reg32_extract(typer, info);
> =20
> @@ -1194,6 +1287,16 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v,=
 mmio_info_t *info,
>      case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
>      case VRANGE32(GICD_ICFGR, GICD_ICFGRN):
>      case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
> +    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
> +    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
> +    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
> +    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
> +    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
> +    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
> +    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
> +    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
> +    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
> +    case VRANGE32(GICD_IGRPMODRnE, GICD_IGRPMODRnEN):
>          /*
>           * Above all register are common with GICR and GICD
>           * Manage in common
> @@ -1201,6 +1304,7 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, =
mmio_info_t *info,
>          return __vgic_v3_distr_common_mmio_read("vGICD", v, info, gicd_r=
eg, r);
> =20
>      case VRANGE32(GICD_NSACR, GICD_NSACRN):
> +    case VRANGE32(GICD_NSACRnE, GICD_NSACRnEN):
>          /* We do not implement security extensions for guests, read zero=
 */
>          goto read_as_zero_32;
> =20
> @@ -1216,16 +1320,21 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v=
, mmio_info_t *info,
>          /* Replaced with GICR_ISPENDR0. So ignore write */
>          goto read_as_zero_32;
> =20
> -    case VRANGE32(0x0F30, 0x60FC):
> +    case VRANGE32(0x0F30, 0x0FFC):
>          goto read_reserved;
> =20
>      case VRANGE64(GICD_IROUTER32, GICD_IROUTER1019):
> +    case VRANGE64(GICD_IROUTERnE, GICD_IROUTERnEN):
>      {
>          uint64_t irouter;
> =20
>          if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
> -        rank =3D vgic_rank_offset(v, 64, gicd_reg - GICD_IROUTER,
> -                                DABT_DOUBLE_WORD);
> +        if ( gicd_reg >=3D GICD_IROUTERnE )
> +            rank =3D vgic_ext_rank_offset(v, 64, gicd_reg - GICD_IROUTER=
nE,
> +                                        DABT_DOUBLE_WORD);
> +        else
> +            rank =3D vgic_rank_offset(v, 64, gicd_reg - GICD_IROUTER,
> +                                    DABT_DOUBLE_WORD);
>          if ( rank =3D=3D NULL ) goto read_as_zero;
>          vgic_lock_rank(v, rank, flags);
>          irouter =3D vgic_fetch_irouter(rank, gicd_reg - GICD_IROUTER);
> @@ -1235,8 +1344,8 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, =
mmio_info_t *info,
> =20
>          return 1;
>      }
> -
> -    case VRANGE32(0x7FE0, 0xBFFC):
> +    case VRANGE32(0x3700, 0x60FC):
> +    case VRANGE32(0xA004, 0xBFFC):
>          goto read_reserved;
> =20
>      case VRANGE32(0xC000, 0xFFCC):
> @@ -1382,12 +1491,23 @@ static int vgic_v3_distr_mmio_write(struct vcpu *=
v, mmio_info_t *info,
>      case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
>      case VRANGE32(GICD_ICFGR, GICD_ICFGRN):
>      case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
> +    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
> +    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
> +    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
> +    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
> +    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
> +    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
> +    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
> +    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
> +    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
> +    case VRANGE32(GICD_IGRPMODRnE, GICD_IGRPMODRnEN):
>          /* Above registers are common with GICR and GICD
>           * Manage in common */
>          return __vgic_v3_distr_common_mmio_write("vGICD", v, info,
>                                                   gicd_reg, r);
> =20
>      case VRANGE32(GICD_NSACR, GICD_NSACRN):
> +    case VRANGE32(GICD_NSACRnE, GICD_NSACRnEN):
>          /* We do not implement security extensions for guests, write ign=
ore */
>          goto write_ignore_32;
> =20
> @@ -1405,26 +1525,38 @@ static int vgic_v3_distr_mmio_write(struct vcpu *=
v, mmio_info_t *info,
>          if ( dabt.size !=3D DABT_WORD ) goto bad_width;
>          return 0;
> =20
> -    case VRANGE32(0x0F30, 0x60FC):
> +    case VRANGE32(0x0F30, 0x0FFC):
>          goto write_reserved;
> =20
>      case VRANGE64(GICD_IROUTER32, GICD_IROUTER1019):
> +    case VRANGE64(GICD_IROUTERnE, GICD_IROUTERnEN):
>      {
>          uint64_t irouter;
> +        unsigned int offset, virq;
> =20
>          if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
> -        rank =3D vgic_rank_offset(v, 64, gicd_reg - GICD_IROUTER,
> -                                DABT_DOUBLE_WORD);
> +        if ( gicd_reg >=3D GICD_IROUTERnE ) {

Braces should go into separate line

> +            offset =3D gicd_reg - GICD_IROUTERnE;
> +            rank =3D vgic_ext_rank_offset(v, 64, offset, DABT_DOUBLE_WOR=
D);
> +        } else {

... so "else" also should be on a separate line

> +            offset =3D gicd_reg - GICD_IROUTER;
> +            rank =3D vgic_rank_offset(v, 64, offset, DABT_DOUBLE_WORD);
> +        }
>          if ( rank =3D=3D NULL ) goto write_ignore;
>          vgic_lock_rank(v, rank, flags);
> -        irouter =3D vgic_fetch_irouter(rank, gicd_reg - GICD_IROUTER);
> +        irouter =3D vgic_fetch_irouter(rank, offset);
>          vreg_reg64_update(&irouter, r, info);
> -        vgic_store_irouter(v->domain, rank, gicd_reg - GICD_IROUTER, iro=
uter);
> +        if ( gicd_reg >=3D GICD_IROUTERnE )
> +            virq =3D ESPI_IDX2INTID(offset / NR_BYTES_PER_IROUTER);
> +        else
> +            virq =3D offset / NR_BYTES_PER_IROUTER;
> +        vgic_store_irouter(v->domain, rank, virq, irouter);
>          vgic_unlock_rank(v, rank, flags);
>          return 1;
>      }
> =20
> -    case VRANGE32(0x7FE0, 0xBFFC):
> +    case VRANGE32(0x3700, 0x60FC):
> +    case VRANGE32(0xA004, 0xBFFC):
>          goto write_reserved;
> =20
>      case VRANGE32(0xC000, 0xFFCC):
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index c9b9528c66..27ffdf316c 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -193,6 +193,18 @@ int domain_vgic_register(struct domain *d, unsigned =
int *mmio_count)
>  }
> =20
>  #ifdef CONFIG_GICV3_ESPI
> +/*
> + * The function behavior is the same as for regular SPIs (vgic_rank_offs=
et),
> + * but it operates with extended SPI ranks.
> + */
> +struct vgic_irq_rank *vgic_ext_rank_offset(struct vcpu *v, unsigned int =
b,
> +                                           unsigned int n, unsigned int =
s)
> +{
> +    unsigned int rank =3D REG_RANK_NR(b, (n >> s));
> +
> +    return vgic_get_rank(v, rank + EXT_RANK_MIN);
> +}
> +
>  static unsigned int vgic_num_spi_lines(struct domain *d)
>  {
>      return d->arch.vgic.nr_spis + d->arch.vgic.nr_espis;
> @@ -241,6 +253,17 @@ struct pending_irq *espi_to_pending(struct domain *d=
, unsigned int irq)
>  {
>      return NULL;
>  }
> +
> +/*
> + * It is expected that, in the case of CONFIG_GICV3_ESPI=3Dn, the functi=
on will
> + * return NULL. In this scenario, mmio_read/mmio_write will be treated a=
s
> + * RAZ/WI, as expected.
> + */
> +struct vgic_irq_rank *vgic_ext_rank_offset(struct vcpu *v, unsigned int =
b,
> +                                           unsigned int n, unsigned int =
s)
> +{
> +    return NULL;
> +}
>  #endif
> =20
>  static unsigned int vgic_num_alloc_irqs(struct domain *d)

--=20
WBR, Volodymyr=

