Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A173B325BE
	for <lists+xen-devel@lfdr.de>; Sat, 23 Aug 2025 02:21:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090697.1447820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upc0D-0003kC-Ck; Sat, 23 Aug 2025 00:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090697.1447820; Sat, 23 Aug 2025 00:21:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upc0D-0003hd-9M; Sat, 23 Aug 2025 00:21:01 +0000
Received: by outflank-mailman (input) for mailman id 1090697;
 Sat, 23 Aug 2025 00:21:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yyzx=3D=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1upc0B-0003hX-R5
 for xen-devel@lists.xenproject.org; Sat, 23 Aug 2025 00:21:00 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a429c1b-7fb7-11f0-b898-0df219b8e170;
 Sat, 23 Aug 2025 02:20:57 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS2PR03MB10195.eurprd03.prod.outlook.com
 (2603:10a6:20b:5fe::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Sat, 23 Aug
 2025 00:20:55 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.014; Sat, 23 Aug 2025
 00:20:55 +0000
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
X-Inumbo-ID: 0a429c1b-7fb7-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DBdnGm5V8PnitTekWgtZ2WNDm37NMiV+ba1lKZg8h8/ZfuyrzfB7UvEaa6oqH0M/t6XJUn+nHXwUvDkmKSAXS3bios1zSCGlptFFjnxNtx8ctGjj5m6o4zv84yPS+8lrisc9eYCGAoBgvevgCNDtcS4dtFwDZFwAPkpMrAb5qjvxtstC719Ibi2WXJobJ1AoykDxy/WQHWkJBQpoLUroCwGMT7hmA4SsnpnOMrhc+7RVfN2LkMA0hHHgcNqX5ZJ4cXeInjluF3ho5jB+M9TWd9yVjQ77m179pwwOOzsORQCPTp5qZob6wdpKXPo4FHWW56qIgWzqKYpbH0o4G40Pug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJBOhOFbGYC+mYGet7s4uMY6errCH1Eqn22pXucZRvA=;
 b=K9E0qBp1hWtKzowAAL7KdsTz6Obu5zI9WrE6azJkgvS0ffDY+EJxGNvqDIyXMn398F89NSyfK/0RE/gUnlsSVTTVFdQXCq7sij9LTJb6Nd7QaW2lpxr8NCXCDJ1HQAas1SYmDz3yLAz8IHiU2E70uvNr4Dfc/T0GceV9HQEGt5FCGgbhN2/FCo8zKDGbNDe8WnuH0Q2xLPhiKRR9bupkv7rEt/Z6+CYRUxAzIIXAlUgDtWbT6+22zwVweWMo7eHTirjxYFOOmLB865K0l5ij0pV5K4aTI4hru9blPRX/u93d1yVENaUUVLy/uGW9qoLmd6xoRj78GdkB/XBdnGV1bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJBOhOFbGYC+mYGet7s4uMY6errCH1Eqn22pXucZRvA=;
 b=TKJut9v3+MUr8gDoZZ+xfktKeq3wu52vGnLwkwmgbnDo0jIcLpaXWR96UYZrf68PUizAbLaM46JkTSATypKsbHgwxX5xkCbm8Mi3fqCIuhmtV5NGWikNrhzNuzxGvRiJpMD40qRJBUg3VrdEePGBYXi20jdKn8vkwzMFmZpVJJI3esNgceECVJAi7lCfq6zxY9vb5xD5nDHMc717t7JCJREv94S5IISnmfAaVRSNIQrvOfxPbo+/7VvBVZFGK3wxAPdpe6fmFAuquoQSp5VSpuP0vf3veO2z3c9cUqKgkh4JKy4UChbuB3LrOTmMaOhiHP/zaFTLoN38BIxGUFgLZw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <Mykola_Kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v5 03/12] xen/arm: gic-v3: Implement GICv3 suspend/resume
 functions
Thread-Topic: [PATCH v5 03/12] xen/arm: gic-v3: Implement GICv3 suspend/resume
 functions
Thread-Index: AQHcCwFbPuGIvhJksU2gYmOTRYiYRQ==
Date: Sat, 23 Aug 2025 00:20:55 +0000
Message-ID: <87zfbqanx5.fsf@epam.com>
References: <cover.1754943874.git.mykola_kvach@epam.com>
	<451b8a0527a6193b6687e1c85bd254b4dfda142d.1754943874.git.mykola_kvach@epam.com>
In-Reply-To:
 <451b8a0527a6193b6687e1c85bd254b4dfda142d.1754943874.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Mon, 11 Aug 2025 23:47:59 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS2PR03MB10195:EE_
x-ms-office365-filtering-correlation-id: 73c28470-ff9d-478e-3ccf-08dde1daed2c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|42112799006|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?OCxkoDoWEt0RWdaW8VaBrIvSwqbd+VZIzmBTh0eJ2fG1U8F5TL7HU2TQci?=
 =?iso-8859-1?Q?ZzRzannQJfbIXaTJxgyUTIgOWjfkQKg66BBYzOT6soaWuCvxY2Xw8PDRoW?=
 =?iso-8859-1?Q?9Xgr4YYrL498pKu4ffxm46WWz9qtyJCHGGqTFuhcglmamOJ9pMHr/nBxyO?=
 =?iso-8859-1?Q?h52BuFum4b3KYoR9cDBVT42PbyP+elkOBH4XQpP3MpiqEtoPgv+xi9W6Wp?=
 =?iso-8859-1?Q?+Ozavli0YD4otc4/adUg1yaWkMw0XDd8bxXm1Lm4Vi38o/h2NbT8XhVS8R?=
 =?iso-8859-1?Q?Bu2SZt5+36nmiQwuSfaTP77ayLEiO16K+KFhlOljfroHCRo2sFTSm+iV7z?=
 =?iso-8859-1?Q?DBS9gDJOtWcCqs90GjF/1XnSyp7A0P9CAPFq2ln08bo5b3GuDiwN0Riuxa?=
 =?iso-8859-1?Q?kZxP3NzeupfRhLyi2YgMjr8uVAcDRI5/dfJ0sS6FS5fIK4g0czOD3i3Uq4?=
 =?iso-8859-1?Q?rCNs8EMZq6WKa60EwFs3REa3uCVk6tYlZfw0bAJe2QaagHf0MWwZ2ccPUt?=
 =?iso-8859-1?Q?EfTXN76VRfM/jIiOXp2Ps1gc9XDZhqNEJ+sUMfwkjMwMHDBFgg7o9VoEXX?=
 =?iso-8859-1?Q?541pmw3F+rOsNt0ZgVO/8c/EH7AmKZmZnEuNzC/WxqjGmz1TrKp1VchXKm?=
 =?iso-8859-1?Q?C/WBP1JPdguVGciqODaSNMFx4hkN8o/mcvuWHfBCAxrczMSqdDbiNSgBFw?=
 =?iso-8859-1?Q?KM1YOYIrGhGxHaJKzyQEHIEBWTC/YRWaZQhsm1gsqakg5GAxipmTmuw0iw?=
 =?iso-8859-1?Q?ej+U/A9t7ZemdjYSU0RwG3EGdsqM89vCDlTuDhIBZTjluwB+OQLn0di0TT?=
 =?iso-8859-1?Q?qnsIaGgooWf8AHnxMrdEDsMizF1fK8EsmKG95BD8L+HPzvooMJ+PKRUnFt?=
 =?iso-8859-1?Q?N+F3pMANgKjaoH7qXwix184VcdYeUZqBpC4awmcXvdrETZreVl+5qn6Syf?=
 =?iso-8859-1?Q?6R3sRWLlVpLhBpNBctBJQDr8SYYW9cS7QxuIR2t0+JHD+LqTOgHa6hMc9j?=
 =?iso-8859-1?Q?WwR+I+P32b/Uvw6qixNaOO0HIDhu4cMRRTAPOojv/CjRj2qsw0H7lsg/Xi?=
 =?iso-8859-1?Q?PegtmxOLuGC8qLtyuLVy+3K4K0pH7wlJkW8wHMwKejKweClXPpYKw/PrOk?=
 =?iso-8859-1?Q?FhF8xXqElcTviEvW+L9Ybv0QP2UBMrdj0ozuk5FkbcOy1ouGCcS7MDiQsQ?=
 =?iso-8859-1?Q?NE7PQQYVJViOKeBKMArcNIfJvVPEoAVjsMhgixX+2iJnq7MhThxB4ig272?=
 =?iso-8859-1?Q?la/r5TDpTXnCKE+ps1ON9PtiQUjRc71cXEvwpjb0F4OGW3hjxGFyG6r5OC?=
 =?iso-8859-1?Q?XBvBTX8RRrBVTsnro1qFOvVCTwZMIAgUAI5F21lU9hzUhP4Jd95XAfkXSN?=
 =?iso-8859-1?Q?de+NYeN7dRhk9SjMerGbjMgSP/TpbbCJsMgCxGBfscF3Ra9XP7jhTBtBev?=
 =?iso-8859-1?Q?svHGOLI3qySCxI8gzi1fQGD3NG1VOd0ItBsRy02HCvziqbld2wIhkMbfX2?=
 =?iso-8859-1?Q?Oku6ObwxRsI+Y+RYYGjXAzfG03PnjIIHyvoXkIajaYbg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(42112799006)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?hHK5+OEGJJlu0VYl7XUVu5aYLjM2KENL58ElaoS3OkbVH+SBXdoLxCH7ff?=
 =?iso-8859-1?Q?eQbGUgiSpU6ytcGOHREMtFWfQNSOE/XtDqKjq63KwHRhCFRfhhNgF0nMef?=
 =?iso-8859-1?Q?mRBC1Akyi4xqH8T0sEVPBFroowo19GYpPlMLftDN8HWRlIY1tflFhwQOHb?=
 =?iso-8859-1?Q?J8NWBwRsgn6jUKlOIFoeEW5Y2gKbikMKHqhALYT1uA8yLYHFlTQN/eCJsw?=
 =?iso-8859-1?Q?wppE3xiFAGTq0vjZEriP2/2SLJMk1mKcm3/mr/Ip5vf27rs3wRycQFObsz?=
 =?iso-8859-1?Q?LBgEWMAsLFn6eDjVTrakp9SzSJqpry7/87IVSynuOhb8OjEYeCH+VwkQwa?=
 =?iso-8859-1?Q?81hlA5kSflnGPW3eP3tkY7t5Ibieho7YGs0XO6+oU+UETX21znpMxAhOqQ?=
 =?iso-8859-1?Q?f0CKigIC16VpT+Rlw2ga3ma7ndPJi8xr3/TayO2k8PwfmRJViRQ99/SCsi?=
 =?iso-8859-1?Q?99eF7HJH7ff+IVr+f1JKO4MsfWrdSHSI979tWi4Y4gWY32b1bWN8NOCdB4?=
 =?iso-8859-1?Q?ypohbdAbOG5AyuL1elwA3/o5ibbhkU+GRD8jwKUXkxK6w7C4vBuVjQlQ/H?=
 =?iso-8859-1?Q?hVvJMQ+FyLS1doL0INSVtIG1/cHGgnRNudTdgHBcgpdHTTmF3skxopT8gP?=
 =?iso-8859-1?Q?98qHtusrXzRejMLhhjYzcCmEu6LQg14BbxrD3UZfIMNx+l2vGMYBYHXGd8?=
 =?iso-8859-1?Q?+B0J9p6NKWWfqIXeGmDjUyPQaC9wQw3Zw32v6Tf6YTpM+fh0jeX2XLnxKE?=
 =?iso-8859-1?Q?gURdK69VAg0KPVM8qrShYU0pyuXLM/uZeBQbIKGeTsmUBtqLg8++ydVcn1?=
 =?iso-8859-1?Q?c7eYoN30hrX4pwmmiCqYmWe71TJEYmvvJsTzo4JQYj40YX0Zjqixo/Mfr3?=
 =?iso-8859-1?Q?KbnQMZlaJwdJZ4mk7XaYXjSEU0p4kCCqVLy8CiCtqm3mzHU0SCxY1JzECm?=
 =?iso-8859-1?Q?5c2OS4QeTi5iqeZ1BJblrU+wU354vbnO4UV8S9udJB79iMM/hhRisc16sf?=
 =?iso-8859-1?Q?o+usiB/+ju8EvrtXuPCcAsLSunI4ILaiaTNGHUZai4vujVdtJD0wc6bM6H?=
 =?iso-8859-1?Q?67Qi5uUjMlcORUpb5ekJK7lpzZXwSK3clGd1hkk7y+me1J9HZVReuBL4gO?=
 =?iso-8859-1?Q?+R4czi418BmsdDWUAf/tYCDCVEVN9e1/k+Ondx2j8YxUneNZEADBmvN3aB?=
 =?iso-8859-1?Q?IgY68RwkIOAcvyqNhvAvGsZjFP9sADNs/hcz3Y9BRXH5Vw2MeycGMjh2LH?=
 =?iso-8859-1?Q?+MVM43vbdrmWbtbUJ4O2w5NlN8yDs+fB9BAs+auAbZkUtT0SZiUyR1tN/u?=
 =?iso-8859-1?Q?it4ScuWEmBc619NoWvV3jKH29f4O5OGWX/gWwxHzHivO09WQ4MmOawCZ6/?=
 =?iso-8859-1?Q?pOgIlW8rudGOyPNURVOi276tR9ZmArL2DD39Eh7FgPRB9ksO2WsoxFfXVK?=
 =?iso-8859-1?Q?Gi8o7vDkw9ixYu9F3DCuidjWol81eRfKPcQQII9vchMUlE7hOcb4M7pIJv?=
 =?iso-8859-1?Q?AHpMxoB0PmwmJBDbdiPuvtxblQcPoXBfT7iS+7xoTgFuicbLvrf2ix0139?=
 =?iso-8859-1?Q?Y9BOjoWBYH89MfKJoWe++kcC8DCVtKlM7c3NTz5xUyMvUWz4WIbDl9VRr1?=
 =?iso-8859-1?Q?KjsfLsnfDc3j9hyKWR+2PEzz1j52mh/J1+MAeIq3rqWcOkxzJ3+CFl4g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c28470-ff9d-478e-3ccf-08dde1daed2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2025 00:20:55.4519
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fjLsuaQ1JGK6tZgGSY56krdTT6s8gFQmFjNqpHzBg+apolq4aRAknk2tLFHbkOesKON226Nffe+caOV9/CTyMXLfUCFn7tKJJ0wqsNsSKws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB10195


Hi,

Mykola Kvach <xakep.amatop@gmail.com> writes:

> From: Mykola Kvach <mykola_kvach@epam.com>
>
> System suspend may lead to a state where GIC would be powered down.
> Therefore, Xen should save/restore the context of GIC on suspend/resume.
>
> Note that the context consists of states of registers which are
> controlled by the hypervisor. Other GIC registers which are accessible
> by guests are saved/restored on context switch.
>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
>  xen/arch/arm/gic-v3.c | 233 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 233 insertions(+)
>
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index cd3e1acf79..a9b65ff5d4 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -1776,6 +1776,231 @@ static bool gic_dist_supports_lpis(void)
>      return (readl_relaxed(GICD + GICD_TYPER) & GICD_TYPE_LPIS);
>  }
> =20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +/* GICv3 registers to be saved/restored on system suspend/resume */
> +struct gicv3_ctx {
> +    struct dist_ctx {
> +        uint32_t ctlr;
> +        /*
> +         * This struct represent block of 32 IRQs
> +         * TODO: store extended SPI configuration (GICv3.1+)
> +         */
> +        struct irq_regs {
> +            uint32_t icfgr[2];
> +            uint32_t ipriorityr[8];
> +            uint64_t irouter[32];
> +            uint32_t isactiver;
> +            uint32_t isenabler;
> +        } *irqs;
> +    } dist;
> +
> +    /* have only one rdist structure for last running CPU during suspend=
 */
> +    struct redist_ctx {
> +        uint32_t ctlr;
> +        /* TODO: handle case when we have more than 16 PPIs (GICv3.1+) *=
/
> +        uint32_t icfgr[2];
> +        uint32_t igroupr;
> +        uint32_t ipriorityr[8];
> +        uint32_t isactiver;
> +        uint32_t isenabler;
> +    } rdist;
> +
> +    struct cpu_ctx {
> +        uint32_t ctlr;
> +        uint32_t pmr;
> +        uint32_t bpr;
> +        uint32_t sre_el2;
> +        uint32_t grpen;
> +    } cpu;
> +};
> +
> +static struct gicv3_ctx gicv3_ctx;
> +
> +static void __init gicv3_alloc_context(void)
> +{
> +    uint32_t blocks =3D DIV_ROUND_UP(gicv3_info.nr_lines, 32);
> +
> +    if ( gicv3_its_host_has_its() )
> +        return;

I think this needs a comment at least. And/or printk() message. Because
for it is unclear why we are doing nothing if host has ITS

> +
> +    /* according to spec it is possible don't have SPIs */
> +    if ( blocks =3D=3D 1 )
> +        return;
> +
> +    gicv3_ctx.dist.irqs =3D xzalloc_array(typeof(*gicv3_ctx.dist.irqs), =
blocks - 1);
> +    if ( !gicv3_ctx.dist.irqs )
> +        dprintk(XENLOG_ERR,
> +                "%s:%d: failed to allocate memory for GICv3 suspend cont=
ext\n",
> +                __func__, __LINE__);

dprintk() already prints function and line. Here and everywhere in this
patch.

> +}
> +
> +static void gicv3_disable_redist(void)
> +{
> +    void __iomem* waker =3D GICD_RDIST_BASE + GICR_WAKER;
> +
> +    writel_relaxed(readl_relaxed(waker) | GICR_WAKER_ProcessorSleep, wak=
er);
> +    while ( (readl_relaxed(waker) & GICR_WAKER_ChildrenAsleep) =3D=3D 0 =
);
> +}
> +
> +static int gicv3_suspend(void)
> +{
> +    unsigned int i;
> +    void __iomem *base;
> +    typeof(gicv3_ctx.rdist)* rdist =3D &gicv3_ctx.rdist;
> +
> +    /* TODO: implement support for ITS */
> +    if ( gicv3_its_host_has_its() )
> +        return -EOPNOTSUPP;
> +
> +    if ( !gicv3_ctx.dist.irqs && gicv3_info.nr_lines > NR_GIC_LOCAL_IRQS=
 )
> +    {
> +        dprintk(XENLOG_WARNING,
> +                "%s:%d: GICv3 suspend context is not allocated!\n",
> +                __func__, __LINE__);
> +        return -ENOMEM;
> +    }
> +
> +    gicv3_save_state(current);
> +
> +    /* Save GICC configuration */
> +    gicv3_ctx.cpu.ctlr     =3D READ_SYSREG(ICC_CTLR_EL1);
> +    gicv3_ctx.cpu.pmr      =3D READ_SYSREG(ICC_PMR_EL1);
> +    gicv3_ctx.cpu.bpr      =3D READ_SYSREG(ICC_BPR1_EL1);
> +    gicv3_ctx.cpu.sre_el2  =3D READ_SYSREG(ICC_SRE_EL2);
> +    gicv3_ctx.cpu.grpen    =3D READ_SYSREG(ICC_IGRPEN1_EL1);
> +
> +    gicv3_disable_interface();
> +    gicv3_disable_redist();
> +
> +    /* Save GICR configuration */
> +    gicv3_redist_wait_for_rwp();
> +
> +    base =3D GICD_RDIST_SGI_BASE;
> +
> +    rdist->ctlr =3D readl_relaxed(base + GICR_CTLR);
> +
> +    /* Set priority on PPI and SGI interrupts */

Probably you wanted to say "Save priority..."

> +    for (i =3D 0; i < NR_GIC_LOCAL_IRQS / 4; i +=3D 4)
> +        rdist->ipriorityr[i] =3D readl_relaxed(base + GICR_IPRIORITYR0 +=
 4 * i);

Is this correct? You are writing to every 4th rdist->ipriorityr and
reading every 4th GICR_IPRIORITYR<n>

> +
> +    rdist->isactiver =3D readl_relaxed(base + GICR_ISACTIVER0);
> +    rdist->isenabler =3D readl_relaxed(base + GICR_ISENABLER0);
> +    rdist->igroupr   =3D readl_relaxed(base + GICR_IGROUPR0);
> +    rdist->icfgr[0]  =3D readl_relaxed(base + GICR_ICFGR0);
> +    rdist->icfgr[1]  =3D readl_relaxed(base + GICR_ICFGR1);
> +
> +    /* Save GICD configuration */
> +    gicv3_dist_wait_for_rwp();
> +    gicv3_ctx.dist.ctlr =3D readl_relaxed(GICD + GICD_CTLR);
> +
> +    for ( i =3D 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
> +    {
> +        typeof(gicv3_ctx.dist.irqs) irqs =3D gicv3_ctx.dist.irqs + i - 1=
;
> +        unsigned int irq;
> +
> +        base =3D GICD + GICD_ICFGR + 8 * i;
> +        irqs->icfgr[0] =3D readl_relaxed(base);
> +        irqs->icfgr[1] =3D readl_relaxed(base + 4);
> +
> +        base =3D GICD + GICD_IPRIORITYR + 32 * i;
> +        for ( irq =3D 0; irq < 8; irq++ )
> +            irqs->ipriorityr[irq] =3D readl_relaxed(base + 4 * irq);
> +
> +        base =3D GICD + GICD_IROUTER + 32 * i;
> +        for ( irq =3D 0; irq < 32; irq++ )
> +            irqs->irouter[irq] =3D readq_relaxed_non_atomic(base + 8 * i=
rq);
> +
> +        irqs->isactiver =3D readl_relaxed(GICD + GICD_ISACTIVER + 4 * i)=
;
> +        irqs->isenabler =3D readl_relaxed(GICD + GICD_ISENABLER + 4 * i)=
;
> +    }
> +
> +    return 0;
> +}
> +
> +static void gicv3_resume(void)
> +{
> +    unsigned int i;
> +    void __iomem *base;
> +    typeof(gicv3_ctx.rdist)* rdist =3D &gicv3_ctx.rdist;
> +
> +    if ( !gicv3_ctx.dist.irqs && gicv3_info.nr_lines > NR_GIC_LOCAL_IRQS=
 )
> +    {
> +        dprintk(XENLOG_WARNING, "%s:%d: GICv3 suspend context not alloca=
ted!\n",
> +            __func__, __LINE__);
> +        return;
> +    }
> +
> +    writel_relaxed(0, GICD + GICD_CTLR);
> +
> +    for ( i =3D NR_GIC_LOCAL_IRQS; i < gicv3_info.nr_lines; i +=3D 32 )
> +        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPR + (i / 32) * =
4);
> +
> +    for ( i =3D 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
> +    {
> +        typeof(gicv3_ctx.dist.irqs) irqs =3D gicv3_ctx.dist.irqs + i - 1=
;
> +        unsigned int irq;
> +
> +        base =3D GICD + GICD_ICFGR + 8 * i;
> +        writel_relaxed(irqs->icfgr[0], base);
> +        writel_relaxed(irqs->icfgr[1], base + 4);
> +
> +        base =3D GICD + GICD_IPRIORITYR + 32 * i;
> +        for ( irq =3D 0; irq < 8; irq++ )
> +            writel_relaxed(irqs->ipriorityr[irq], base + 4 * irq );

style: space before )

> +
> +        base =3D GICD + GICD_IROUTER + 32 * i;
> +        for ( irq =3D 0; irq < 32; irq++ )
> +            writeq_relaxed_non_atomic(irqs->irouter[irq], base + 8 * irq=
);
> +
> +        writel_relaxed(irqs->isenabler, GICD + GICD_ISENABLER + i * 4);
> +        writel_relaxed(irqs->isactiver, GICD + GICD_ISACTIVER + i * 4);
> +    }
> +
> +    writel_relaxed(gicv3_ctx.dist.ctlr, GICD + GICD_CTLR);
> +    gicv3_dist_wait_for_rwp();
> +
> +    /* Restore GICR (Redistributor) configuration */
> +    gicv3_enable_redist();
> +
> +    base =3D GICD_RDIST_SGI_BASE;
> +
> +    writel_relaxed(0xffffffff, base + GICR_ICENABLER0);
> +    gicv3_redist_wait_for_rwp();
> +
> +    for (i =3D 0; i < NR_GIC_LOCAL_IRQS / 4; i +=3D 4)
> +        writel_relaxed(rdist->ipriorityr[i], base + GICR_IPRIORITYR0 + i=
 * 4);

Is this correct? You are writing to every 4th GICR_IPRIORITYR<n>

> +
> +    writel_relaxed(rdist->isactiver, base + GICR_ISACTIVER0);
> +
> +    writel_relaxed(rdist->igroupr,  base + GICR_IGROUPR0);
> +    writel_relaxed(rdist->icfgr[0], base + GICR_ICFGR0);
> +    writel_relaxed(rdist->icfgr[1], base + GICR_ICFGR1);
> +
> +    gicv3_redist_wait_for_rwp();
> +
> +    writel_relaxed(rdist->isenabler, base + GICR_ISENABLER0);
> +    writel_relaxed(rdist->ctlr, GICD_RDIST_BASE + GICR_CTLR);
> +
> +    gicv3_redist_wait_for_rwp();
> +
> +    WRITE_SYSREG(gicv3_ctx.cpu.sre_el2, ICC_SRE_EL2);
> +    isb();
> +
> +    /* Restore CPU interface (System registers) */
> +    WRITE_SYSREG(gicv3_ctx.cpu.pmr,   ICC_PMR_EL1);
> +    WRITE_SYSREG(gicv3_ctx.cpu.bpr,   ICC_BPR1_EL1);
> +    WRITE_SYSREG(gicv3_ctx.cpu.ctlr,  ICC_CTLR_EL1);
> +    WRITE_SYSREG(gicv3_ctx.cpu.grpen, ICC_IGRPEN1_EL1);
> +    isb();
> +
> +    gicv3_hyp_init();
> +
> +    gicv3_restore_state(current);
> +}
> +
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> +
>  /* Set up the GIC */
>  static int __init gicv3_init(void)
>  {
> @@ -1850,6 +2075,10 @@ static int __init gicv3_init(void)
> =20
>      gicv3_hyp_init();
> =20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    gicv3_alloc_context();
> +#endif
> +
>  out:
>      spin_unlock(&gicv3.lock);
> =20
> @@ -1889,6 +2118,10 @@ static const struct gic_hw_operations gicv3_ops =
=3D {
>  #endif
>      .iomem_deny_access   =3D gicv3_iomem_deny_access,
>      .do_LPI              =3D gicv3_do_LPI,
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    .suspend             =3D gicv3_suspend,
> +    .resume              =3D gicv3_resume,
> +#endif
>  };
> =20
>  static int __init gicv3_dt_preinit(struct dt_device_node *node, const vo=
id *data)

--=20
WBR, Volodymyr=

