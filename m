Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71727B32606
	for <lists+xen-devel@lfdr.de>; Sat, 23 Aug 2025 02:46:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090830.1447920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upcON-0003Rd-Lq; Sat, 23 Aug 2025 00:45:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090830.1447920; Sat, 23 Aug 2025 00:45:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upcON-0003Pl-JE; Sat, 23 Aug 2025 00:45:59 +0000
Received: by outflank-mailman (input) for mailman id 1090830;
 Sat, 23 Aug 2025 00:45:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yyzx=3D=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1upcOM-0003Pf-5y
 for xen-devel@lists.xenproject.org; Sat, 23 Aug 2025 00:45:58 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87c97fee-7fba-11f0-a32b-13f23c93f187;
 Sat, 23 Aug 2025 02:45:57 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by GV2PR03MB9378.eurprd03.prod.outlook.com
 (2603:10a6:150:d5::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Sat, 23 Aug
 2025 00:45:51 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.014; Sat, 23 Aug 2025
 00:45:51 +0000
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
X-Inumbo-ID: 87c97fee-7fba-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XEVQ/Xuj9OlwhETjqyVeyEsNKLC68nSMcJtoP8DVxNecwQMrt/gB2C40EGZmi9k8RVyaIF8pbPM9HlxxDSqNU2Fa8QUchg78pkiid0JT8fo7aZv25iPrrsLzfJ/frcajsYY/gpP+lQp0TMUI7CCd39cZogBUmFi/JnBsCcDJhzwQwMq8FirVInuTjjnnTWlPFUkars8Nc8nV22Hr8U0k8Q1/Dd8Q9wBqgs+l0ef+5kgANmgNxghXuzygoIyv2++rXadnYHMDM28119gBIy9vP7qYnIohIkgnFUu9gHlEEok8z3nTikmAia7X5J/wnoX4N8oVVWwEhYZAKFE1UChQHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NpXgTHJXf4p5A4doAGZO36GRIMWXH9t2oGMcnNUWRd4=;
 b=H/YzxCngIQlPRNAZHkdXIh/tle9unXToSnSulhnEBgYJisTGzjWc85yycro05Oa8KHXsvxFXRjgrdO813hWN++hhZwUeu0gJf28wXfOtaMuQZZ7+7j7ye8YwW1oJSjEOfsq9y3llQZI98hj2cEpyUm59qZqz4Coy1krtESD3m4TGBI04g3ZMhrKB+NwwwZ+GaakN8Kk5XbXaRLw3o3rE4BiTcm+PCckf/sLrQDSg5vcjXPUOB36KcA5emjFSfUql9loiTbPxvLNZiKyUPVjIUXvTW178H5oAx9zQdd48XQEfT51mfzqvxiDsrTpttWpUL/UFcIV06OJKolkHwECnvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NpXgTHJXf4p5A4doAGZO36GRIMWXH9t2oGMcnNUWRd4=;
 b=Xorlkd4QtDxdC0lApUwOZpLxi6JtehdOLGpEqhe5Qx/UrLyFPTjBUfpEU8U3Jtj3d1zPsnc0+kr5KrqEEv4VTToy2lHuRC4nIeOrx7RfquTYk0PIyLZn6qlsZuxJAnYWgYfVz4uZwhbTlp7b8luMpTuFPUgdFmFq63f+/wKdK7SE9xzRkwvOqAg2OaHiOKNLw+QvqmWxmMDLQhhX8wfg1n/tV/yxiSDbUDHr9PnZ5WBfdI28Jotj/+hyz0Erwtg/d1yfxiDrotGjSenwCpihQmGcfI2cbjFqJa+W9kiSWT31rsVWTWY4qlqwxCw6m8+jDUujbWrjC9/ldnIk+mKmnQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <Mykola_Kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v5 06/12] xen/arm: irq: Restore state of local IRQs during
 system resume
Thread-Topic: [PATCH v5 06/12] xen/arm: irq: Restore state of local IRQs
 during system resume
Thread-Index: AQHcCwFdbnxcOkUsNEeOVZH7G9fkwg==
Date: Sat, 23 Aug 2025 00:45:50 +0000
Message-ID: <877byuamrm.fsf@epam.com>
References: <cover.1754943874.git.mykola_kvach@epam.com>
	<779a90853f249f8d8c4973874baeee1f787e92e0.1754943875.git.mykola_kvach@epam.com>
In-Reply-To:
 <779a90853f249f8d8c4973874baeee1f787e92e0.1754943875.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Mon, 11 Aug 2025 23:48:02 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|GV2PR03MB9378:EE_
x-ms-office365-filtering-correlation-id: b98138c6-a89a-472a-98d5-08dde1de6896
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|42112799006|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?AKvs6uV2tvOVyInPk2Ts/SVL79gS8Q7hLbEn6u50qkzJPRikboLWVzcMRo?=
 =?iso-8859-1?Q?BF/yCf5p7m+uRzrH23/Zb3y/b9G73rMO5ilWr+GGrklm+b7eeNRtjTZPbq?=
 =?iso-8859-1?Q?AxEaWbgWjvHsZbH1QI0/9owmBtWVtthZcj/oEM1KqlDNzlzkEYhE+gQpgm?=
 =?iso-8859-1?Q?q60w+VAmcXpA6zH6SqK5DUaWE/7bpRUf0dEt2QSQHJ17KoUH+f3zBhSMzE?=
 =?iso-8859-1?Q?QjOYc/TaivHT9P+2/YR4eU+csi1cPuYjsGz+7m2Ub7UFLeMIhnSTLlG6pl?=
 =?iso-8859-1?Q?DO1mN6CN0b3MGwUh9K6qfT6oTQQRbhsz1fm56f51u0O1iZJZAiLe2hZkMo?=
 =?iso-8859-1?Q?2TlOQ/JGUysrM/4yNzVY3f/tPcvnf9fFl46W25RjumPy9f1fLAoeL1tXWa?=
 =?iso-8859-1?Q?ahsGo4RtFi4a5YpasXjxPjs4O5Izmy7331O1H4czKAa68rnHjHEZKuCCHK?=
 =?iso-8859-1?Q?l40Z9pwQ++exiI//BqwaJZ+DmXp/Efj/J45da7G2hgOJXLt4DuGv+jylpD?=
 =?iso-8859-1?Q?lBZ9I0wUoOHTaYbOawGN5W6M27mvHEZuaoqgL80Ch+QDJw2lQKjEjIpjP9?=
 =?iso-8859-1?Q?LHZFD6zYbb57pmOiZruB3J59mbA50K585kiYEsq/4elzxHGRFrxGXDFTWx?=
 =?iso-8859-1?Q?gkOOnxxXjtBR8wg9JFWAMbbh8cnbcGdecRaEHkzbK3SWrICK4m3IRqilje?=
 =?iso-8859-1?Q?2QyKtDt1mEABWx7nQTuCojXyjVpqrc38ZRvI0bSXrYMrRWPIpZOpAOrSkk?=
 =?iso-8859-1?Q?OB9YZGEIza9h7ZMzP5OQw+oG2+/0tcCPnDjfocUoP28Uo/KZRtdJnlCiKJ?=
 =?iso-8859-1?Q?U4FZ0XcSrxc8tPIHHrQR8m1JdWZBVzbgAMr25z5TnWa60N6cnQbdfUf9VZ?=
 =?iso-8859-1?Q?iFGEShFcCn7Vo2DpElQX8C2Ku9A0a7HmWtly6DrejeXSGqr04xhknb1JW0?=
 =?iso-8859-1?Q?G2kGEShspmQlXxOfcWVNJlmRNHRRuG8cKfHXeJJ3FAnGcw1Ym+++ELCtt3?=
 =?iso-8859-1?Q?Ou1gho6y5u1Svp8WmOjfRkJBygzrWQ74dH3ifTUfEPBs2i6LQAi//eGrd0?=
 =?iso-8859-1?Q?uFL3Uch8Md+PluyQ6B4cWiBdngmLOWsu4Dar8Fm7cEzD/7OnUJujC/pXri?=
 =?iso-8859-1?Q?LCPpYkVC3MyI9NsoRHBpKM7wdKi+/BfGOVzpD7DOUFRFtHNXzsrUhNRvGO?=
 =?iso-8859-1?Q?9uE/U8I5Wy9kJ5c0mssW4dURDLc8Or0a9O8UCFfJxaag3+vNwPafh75ppa?=
 =?iso-8859-1?Q?zh7T4od6GMD7TjvLm0AIBAbghaRSZ1h0Rfj1tdhrICK0NcV11L2JEY0msB?=
 =?iso-8859-1?Q?i5LX/6RVZ2fnRDAQTnBp0KKKCBDbtOC5qxRfk1EvnB06m8cPvcoRuDSw6x?=
 =?iso-8859-1?Q?8kjUEQRiQqSHbBLQJO+WygWswB0oAu/jthKdrBVL51Rc4qa0qpRN0f7zRD?=
 =?iso-8859-1?Q?Rt74xOTAjScTPQ7P/dqtE4YGWmQpjiO5aU+hHcZ2vcxTM3jOd++C54QYox?=
 =?iso-8859-1?Q?T1MT2ew6zgS3jQoJ7p8SGf4G+38SUPdvMjgpZUMVpXCA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(42112799006)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?1mKd93aIh5tz46o34KwoVP7aWnmEVDNs4hT67/bd/Cs29ers8Hu3mdxjnB?=
 =?iso-8859-1?Q?nywH71nPG4nwmT8Mw9sBjmIxM3BS44yLmpncok7kigvZq8V6mVpRvamgIJ?=
 =?iso-8859-1?Q?QBlJfA8IzJigvm6CAkV6ytQGhaBeb31Q6l65vGrRpiArXSBHadz68reY4S?=
 =?iso-8859-1?Q?cADBR+tGkAH8rcjTKlakNM3SMY2rSMVa2uBkvla82jXbGRAZuK0MDROOGg?=
 =?iso-8859-1?Q?y/kIFb8Vawg9E76L1xUPlxvKTKxO9SwMrzZpAw+2g/PkQk8mpZlM8RXnqJ?=
 =?iso-8859-1?Q?nmNisXuvNKE4jHssMtt/nBw5k/Ds9NjarwNu1WWqccrv60WvoHKEDYQzjh?=
 =?iso-8859-1?Q?ZClqul1P5VuLDEsoz2BjBrArQYfgMQg5vMwkbtw/KozA2OG1kDhoTaEshT?=
 =?iso-8859-1?Q?QeeutMJUoYDkRu//ehrERICoeit7g0somOTd9kU3uEbd++9KjjolCROI4u?=
 =?iso-8859-1?Q?1eHy/tH3DPjdFdOsFRa1EFs9IQVd2FNg7MTMsgaitW9FaOiPHi/L88y9t3?=
 =?iso-8859-1?Q?JRfLmBoe7ItYqRX1I2rKyM/VuI/yAcccmo2FIQ7g1IT2MT6qLbgU++NAKO?=
 =?iso-8859-1?Q?WLcFeybkh+13GqqbVv2t3PvVRr4NQIa8guz5LyWykiWaE0nh9sbumWKhvf?=
 =?iso-8859-1?Q?u1HEI1qArZz6FafGwejHPa2A/t+rWHQLLCzBonIv65Gfta/M5jmoFjz6od?=
 =?iso-8859-1?Q?72Axvd0xgL9C7eKIpWDIEVMLDecD4sk3iHEt/SMyaQAzsc6I5GsLB6RF/P?=
 =?iso-8859-1?Q?i4I9ORpVP53dLuIyWAo8XqDPFshTMcqmHkgOOzvVLQlHaWpLA2N1lzmrGC?=
 =?iso-8859-1?Q?WuVjKB22Iy9xed2ZU1exEzu2rGtw5FUf6Hiu3H95EI/rncD2K7CdcTCtVq?=
 =?iso-8859-1?Q?M0gRosaI4GbWemWgfW4fscNNxtP9g6GKmstPLTqsNStumt1CAVrT9KR3zj?=
 =?iso-8859-1?Q?avGyeC/YnXJG6rL87R62cWikm7ej6RlyhSdqhnNF7XwOxUyCwtzpF/W0lu?=
 =?iso-8859-1?Q?DNstjoR0dHw+afNSijd8ai02WJZTt5fLjizjGIaMcrhaGohSmAc0EHvjR4?=
 =?iso-8859-1?Q?DH6dPYPNUZ5B+iSM5eMmjaRkgUbECeOu7eNQO5nO/hcazI4Kll5aEbxjxd?=
 =?iso-8859-1?Q?kNoLIkFufp56iWwWjSLe/AfXXTBUPPKN9wvNUfEFF28svO1fKEcx2FLvK8?=
 =?iso-8859-1?Q?f+jsYRL2WW3E4UhG1UYAwyviGEiW1B7bTTjtGgHYZtKBkyQoIjOuSI5KAH?=
 =?iso-8859-1?Q?oNWklaywFIi3eqMoVRfRT7bdjOBWwTnz3T6NJUadNGjmKyZcq03rctPxr8?=
 =?iso-8859-1?Q?RwIsgU1nlNMyr+3sZFtPTSttt/ECxeJkY96UYF7zh8OtJwSnNXGCGacdwK?=
 =?iso-8859-1?Q?SALS2Xb/UOddaJ1zh/rw9PcRfX4cqLMIa3uCAi1mt11nncBW1i01+OM+Us?=
 =?iso-8859-1?Q?rCB+urk6OW7hwst9qCw5oYAJFLdtYV+7/qdxroxHf4zcuODK/AZVbZ8/3X?=
 =?iso-8859-1?Q?I7rwyJN/HHfSUzd/4jchWKb6vZapqdmyQnlTPAhMqSMnmN4GM/57XJ43CA?=
 =?iso-8859-1?Q?pdc6ukHE1i3Pk5msPf0yOHSWydFXqv0E/nyO2S8e5S998qYV7OTgLG44Rm?=
 =?iso-8859-1?Q?kEjH9/0nFVZwK5815v2vEwTcom8OjbNJXsVpCJJByqzxF74iGkGk8QSg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b98138c6-a89a-472a-98d5-08dde1de6896
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2025 00:45:51.0109
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z6RfQ5H0vdEyundt6/iMXmGUEzyUG85p8nE3yhfi2Lrj8PmxXH/jJW5HKhEpZl951FSgTUMsgG6jZPzLrEfq5h30nvVPZqvIsQNvyIzvUIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB9378

Hi Mykola,

Mykola Kvach <xakep.amatop@gmail.com> writes:

> From: Mykola Kvach <mykola_kvach@epam.com>
>
> On ARM, the first 32 interrupts (SGIs and PPIs) are banked per-CPU
> and not restored by gic_resume (for secondary cpus).
>
> This patch introduces restore_local_irqs_on_resume, a function that
> restores the state of local interrupts on the target CPU during
> system resume.
>
> It iterates over all local IRQs and re-enables those that were not
> disabled, reprogramming their routing and affinity accordingly.
>
> The function is invoked from start_secondary, ensuring that local IRQ
> state is restored early during CPU bring-up after suspend.
>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
>  xen/arch/arm/irq.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 148f184f8b..b3ff38dc27 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -113,6 +113,47 @@ static int init_local_irq_data(unsigned int cpu)
>      return 0;
>  }
> =20
> +/*
> + * The first 32 interrupts (PPIs and SGIs) are per-CPU,
> + * so call this function on the target CPU to restore them.
> + *
> + * SPIs are restored via gic_resume.
> + */
> +static void restore_local_irqs_on_resume(void)
> +{
> +    int irq;
> +
> +    if ( system_state !=3D SYS_STATE_resume )
> +        return;

Maybe it is better to move this check to restore_local_irqs_on_resume()
caller? You can put ASSERT(system_state =3D=3D SYS_STATE_resume) there
instead.

I am saying this because name of restore_local_irqs_on_resume() implies tha=
t it
should be called only on resume.

> +
> +    spin_lock(&local_irqs_type_lock);
> +
> +    for ( irq =3D 0; irq < NR_LOCAL_IRQS; irq++ )
> +    {
> +        struct irq_desc *desc =3D irq_to_desc(irq);
> +
> +        spin_lock(&desc->lock);
> +
> +        if ( test_bit(_IRQ_DISABLED, &desc->status) )
> +        {
> +            spin_unlock(&desc->lock);
> +            continue;
> +        }
> +
> +        /* it is needed to avoid asserts in below calls */
> +        set_bit(_IRQ_DISABLED, &desc->status);

Assert in the call below isn't just because. You need to either call
desc->handler->disable() to properly disable the IRQ or justify why it
is fine to just set the bit.

> +
> +        gic_route_irq_to_xen(desc, GIC_PRI_IRQ);
> +
> +        /* _IRQ_DISABLED is cleared by below call */
> +        desc->handler->startup(desc);
> +
> +        spin_unlock(&desc->lock);
> +    }
> +
> +    spin_unlock(&local_irqs_type_lock);
> +}
> +
>  static int cpu_callback(struct notifier_block *nfb, unsigned long action=
,
>                          void *hcpu)
>  {
> @@ -131,6 +172,9 @@ static int cpu_callback(struct notifier_block *nfb, u=
nsigned long action,
>              printk(XENLOG_ERR "Unable to allocate local IRQ for CPU%u\n"=
,
>                     cpu);
>          break;
> +    case CPU_STARTING:
> +        restore_local_irqs_on_resume();
> +        break;
>      }
> =20
>      return notifier_from_errno(rc);

--=20
WBR, Volodymyr=

