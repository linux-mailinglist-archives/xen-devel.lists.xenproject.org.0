Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C87B3261A
	for <lists+xen-devel@lfdr.de>; Sat, 23 Aug 2025 03:07:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090865.1447950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upciW-0007GD-QH; Sat, 23 Aug 2025 01:06:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090865.1447950; Sat, 23 Aug 2025 01:06:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upciW-0007El-N2; Sat, 23 Aug 2025 01:06:48 +0000
Received: by outflank-mailman (input) for mailman id 1090865;
 Sat, 23 Aug 2025 01:06:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yyzx=3D=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1upciV-0007Ef-VD
 for xen-devel@lists.xenproject.org; Sat, 23 Aug 2025 01:06:48 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6db7e384-7fbd-11f0-b898-0df219b8e170;
 Sat, 23 Aug 2025 03:06:41 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DB5PR03MB10169.eurprd03.prod.outlook.com
 (2603:10a6:10:4a0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Sat, 23 Aug
 2025 01:06:38 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.014; Sat, 23 Aug 2025
 01:06:38 +0000
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
X-Inumbo-ID: 6db7e384-7fbd-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BY2fDkfhFTCzcbdFUYrPkC6et5NTPTVUnWBZgMi85IkUsWTxkCjjtH57o5FQXGp9XQ4hKmvtKCHLf3tYr8D3NOCeeKXev/2QJ3SoXDfEGL4A/0F0E4wg2gYZZASlyEJVKr+WBro0xuZsZ0py42SPTMjgcEUiRzXartrrn0lXQyE9bTnf/vftwiN+UEZEI5B2eMIr9KXAxZEbK1WIT94yEwDypjtOOfeqwltSThqzdBxWZ5NZTm3unMynDHCGWg/fhiUWOK08A7phc3AdX4nnb78t325T7wPm+5Vko5iAiwBehcr+GV3xuyhaisUDS/bHAQ+Ym4e3WU1gAIPO+q7JpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+WnY7nwzPUXSXT0HkrIPAgazxZI2a5s0kkVzluMqLBk=;
 b=iwig7cA95faGHZqO6IU/YbiSI0OJfv9rpRADdw74phi35o50uTEkn/TR8HdDzH0m+q/MKX6e1eSzdSo70ezg0UrUuJ+xh09IatM2YbaHwrk+sdLDDbJ+kUMAWdPtFKoaRfn29vqg5eUmc2/vi+1ybM243htjgapizo1F2TMbzdo0Eu+6cujwU3Mcz79Yxl/ay4+dD0LaVikpYKOxsW+TcqFewkQUTAcZQip56G0hj4z4TlAbMB7AGK9+GtaxJr+i1ywIPmSjypMjqKRc4RUq+W3QYcCQp1CBYwATsBPMzdWZRADq0oXUi7OuyLQPVx9hpD2wlKbxutZzDTeDZ1q6eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WnY7nwzPUXSXT0HkrIPAgazxZI2a5s0kkVzluMqLBk=;
 b=HkevO7YtywJ+62Gl10E21hyzEDnVxL3rTczdrjv9yui8WPfA61uw/5S3bkruNPRkkTN3r1OyPdfxKsdhoBdkhJhLN1dOmmNnKhCrt0w0c4l3AZS0cU0G04Xbj2duDzUI/4Bl47YpoMiH3SvwDOQ1kzXt4Pkd9LNf1j9KMyTAEa3F+NIzx+KccbxN1tzdvJnUXmBN8GZ6OBCKOHHBNCdCRQbkQf5AFAs1ttHUmS3A1vnB38jxKM5KY6WzZLGhOLfu2fG6V0WKGAoUNY26MO6ts4+TDRQ3UY8bPxUvEq3k5+pKdYEnqKUbPFMQWncHSfQvWPNHzWDskzhQRD0e2WiEfA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mirela
 Simonovic <mirela.simonovic@aggios.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Saeed
 Nowshadi <saeed.nowshadi@xilinx.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Mykola Kvach <Mykola_Kvach@epam.com>
Subject: Re: [PATCH v5 08/12] xen/arm: Implement PSCI SYSTEM_SUSPEND call
 (host interface)
Thread-Topic: [PATCH v5 08/12] xen/arm: Implement PSCI SYSTEM_SUSPEND call
 (host interface)
Thread-Index: AQHcCwFjs9ljm00LWEeeve/MOeNYjg==
Date: Sat, 23 Aug 2025 01:06:38 +0000
Message-ID: <875xee978i.fsf@epam.com>
References: <cover.1754943874.git.mykola_kvach@epam.com>
	<c5d6e20ff49fd9367c46e63b96e8a9aa687ffbd3.1754943875.git.mykola_kvach@epam.com>
In-Reply-To:
 <c5d6e20ff49fd9367c46e63b96e8a9aa687ffbd3.1754943875.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Mon, 11 Aug 2025 23:48:04 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DB5PR03MB10169:EE_
x-ms-office365-filtering-correlation-id: d6abc485-7153-4bff-1929-08dde1e14ff0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?WxQpYcbHk8xnEPlD6wvMzSj3A0T/XbEn+cx1zGk+DcTHkejH/ED/baZdtp?=
 =?iso-8859-1?Q?JmI/uBfVFAw7HvUuNUM3/y7zazoyoG1tBUiZcd08MHsqldfQU1HeTi6fr6?=
 =?iso-8859-1?Q?IaquOqQnMB2thbBTYhoPsKSMvQ9fKzoHYUZC0elSyb6dUUlieaplJJkZt1?=
 =?iso-8859-1?Q?tB4ZvZ03XDwEgcz6gN/zRpA6Y0dBtLtY0mr5Cl3qxga+Aqn0exqcLyp/cl?=
 =?iso-8859-1?Q?Actli2tHGZqrnQXQWZMqCby3KsO0VVCq+imI4GnTeCV/Z1cMEn4Nf6VoKf?=
 =?iso-8859-1?Q?filwvilPJTAZvM/eU+hDCtN6WkCfOTMyRD+CFXI0jA+pEHB/Tpv36pKFLC?=
 =?iso-8859-1?Q?382UAdQTtxXNlW/H6Pq+6pecQD2W0jtdPeJkJAFX8nOH1kWbXERRTgCHKq?=
 =?iso-8859-1?Q?lN0zgfNb4qOHtzsiPK0akVAHRCQH+KY4yNBX9cIb1YzLDLFvBQJ/dO0rJO?=
 =?iso-8859-1?Q?l+CSpgqbtti6w4Efi7U6WHpH/kwstWSYGXmmJqn1lm9jci5f6Mz98Sticb?=
 =?iso-8859-1?Q?cOi5tryGdIcrYJvKDPLTTd5YiZJd66ZwrOvhDHzDmC3Ubm0MlcK/+CbqY+?=
 =?iso-8859-1?Q?wtlGnCYe/2MztPeZmYi7wdP+PWXnQceY0tzV4Ws0GtonxyMqYaVhpgX/V8?=
 =?iso-8859-1?Q?rRapzDNOG2Pj5kAGNBAvChuF6t4P0bq3Pu23eubsXw98Ng62Up6o0jA927?=
 =?iso-8859-1?Q?3gRyo9q/8IZRwkZFVJP5LV3HGAyQwquj0fIGv2MMNlORgsms1i7K0fTnRA?=
 =?iso-8859-1?Q?GmvtZtGJvgXKNktm88WLoZoqC/nCVbO3CukXsrKZrKA2W4QM7D6XNIoo5X?=
 =?iso-8859-1?Q?5+S161FCjQbClcQVw56VCPGN3kw6/XbjATtBKvz8bUriG6IAcK6+7VIlPo?=
 =?iso-8859-1?Q?iz9dTUYt4loo38TseJbMhYRnU1A+FRJ5eAEHUpol5nS/8KxtfikQ0F7hU+?=
 =?iso-8859-1?Q?/c2B7PWFjxTNKjfMTNXKhiWrXQfLbZGTW3OYv00+kD56FGEhvdv7H+Pvse?=
 =?iso-8859-1?Q?Z+R67e9a8hp+rqzV2JB5p8ZIq1qK0I45saZ55FPxWujtRFkrfAfJRZRpzf?=
 =?iso-8859-1?Q?j3FVJ+R3xPp/V+aMQE1sjwRV/2ISwCdH1/iRTl9J2vdCFru3zy6+0dgIit?=
 =?iso-8859-1?Q?mXafLbiBcnvcrjx/iaNaM8aLMOSQGQOwko1XRd5cMQfvryLjGKbud3wTWs?=
 =?iso-8859-1?Q?cFqGFg087/Bs9aGBENM/qONsqjPaVmXVrLbnK4AAipAJVC/D11z6eoDCcp?=
 =?iso-8859-1?Q?GyIZJ/gUmdPSlWz4+OpdoZVjRkNSPcd8/IW6u2wyu3wgmg+ChE+PysMnQz?=
 =?iso-8859-1?Q?Oyz8iFtbz+T8nbVXsxgbHxidvXvcKN9lsV6qwHgpsuFv8CQAPuUDiuy4lj?=
 =?iso-8859-1?Q?fXX1celfh4WMGfrVS8eC6eUWij6ze2/kff5JbtTp45DxNljRjq+trlrT9v?=
 =?iso-8859-1?Q?WGTOiHK1jtN3UAQ8RhKyCOxExForC8ZCaslWVzpsGc0STsvJmk+86ChNQe?=
 =?iso-8859-1?Q?CuCZEpWNo2EZZ0nWxwSWRkuEg2x5b+89HNPKAAL6Msyw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?qNvVTenASeHsgpUS65xgAmW5gJ4S9YY3lGqSVnRYWUWfEh6Fp+7QP0em+U?=
 =?iso-8859-1?Q?tYk5skQPfngN4zp3jpDA/KkjN1+B1mX+t/MYbCDYCs5dYu2Nq5wkVYrCTl?=
 =?iso-8859-1?Q?UPgSF+N9a8+uc7Gk9F25VjOS4QsAjbpBylLiv7yZjL5b1ikNESmKSIqcD/?=
 =?iso-8859-1?Q?7OMsAlNPCvrL3T8kr0XxITI5PfIwaKape/2M+LV73StJrDoVlA56BcReeQ?=
 =?iso-8859-1?Q?4IdUhyoEMSx42kF8zLGrCTmtokq+y/SWV4b6ki24ZpGKsX6AEIucf0lr+3?=
 =?iso-8859-1?Q?hsOpWbgcCDReK2YtRQtelldvCfxOfpKkzsiaNqGW7BmoECjLaj/uOfYHMN?=
 =?iso-8859-1?Q?5YvOT8A/q0FFvmUNz0h4O4/6WdICKCeCTYlLQfmkd6CCtnOJUiAhyJ+LgD?=
 =?iso-8859-1?Q?0CgC6M6MEI6Pihi5CpLzQmrXr+JrMc08SwF6VaXt3A+c3mFYcLr2sYOj4Z?=
 =?iso-8859-1?Q?u8wFhXHjFOThUYGtEpMVsy4qBpAsXlJ6ReNflxBA6UTiN4kWJUq9xf2qyv?=
 =?iso-8859-1?Q?wpdX38xJmt0DKakvzhoVywUEQh5g9H2knQbwsnaosFyHyIkuWPIaOOTS2h?=
 =?iso-8859-1?Q?vNaj6Dn7SOe0uK0dj4Pa480clOPJDR461TWGm4WGXx5CvBK/nsg60Dqo4k?=
 =?iso-8859-1?Q?AHfxee/tvEVU0/tSUZ9X7XQbUFZWeTFDlUtbsKOdBHfLQptyxz4hLySjjQ?=
 =?iso-8859-1?Q?zPp+U7BoiY8DMsqwNf/fQuzsvEOFGaao9zJKWJmraIr66SdeU0Lx4YywGg?=
 =?iso-8859-1?Q?y/VLJihnwOvzIuk0CZyWqfhBV4vWKik8TVHHUtNKHUkwFYzK0Atd3fyKUN?=
 =?iso-8859-1?Q?E87TdTRfDwEf/aZQu5K+EgRx2uZ4Iz1lyYg8cO6xBAB4avVGVu1f1j9a4a?=
 =?iso-8859-1?Q?ZTJOmKxEpufM1ZvXndXDM87W/F0jk4/Yc63pZwRkkqlAzJGp0vpL35XJII?=
 =?iso-8859-1?Q?TSOkB7ua9dj8mTcNaxd6FMbNqJ03r7Z3LjLETDIEBE+KwR21hRrlkvoAro?=
 =?iso-8859-1?Q?Uz3FV+Si0XXMLQHtGYqs8roPAS+35xWa0LD34EvVLCAOaF2aqwvXRZydZH?=
 =?iso-8859-1?Q?GCPervT/2ee7LCO7p6bd2EMciusl9v3diL01p/VqLajbi6uh36iLfSKU1C?=
 =?iso-8859-1?Q?SCcPTJ8rrjbBM8hkU12yLvdKwS4zWRUGqGhkrlONkGHH8gCKkiF8wdEkt5?=
 =?iso-8859-1?Q?KbhplFIk0y8igerjfQ4/64s/hm51hEvtOmuV1BJ7xhwvPZy5THtz7lI2mn?=
 =?iso-8859-1?Q?PsAkZqAU2V8mr0CJzmOxy3wfkROzfbXsd0v5UL9nY0MyBDeLuiZe6xIteq?=
 =?iso-8859-1?Q?yCeSjN9cgqvHDwyl/KG5/QbxfLb8/9Ja3vQ81y2rnAeEjSgCC/c0Yx7+Ap?=
 =?iso-8859-1?Q?6ZIsTqnDfA04E22ajzOjTMt89TIhB/gE8QVRdI9wOdgFjkpUZIBZRsAviK?=
 =?iso-8859-1?Q?6EYk44JossjH1qnLIU8ICTaZk6ZLzAR7gcAo6T4N0ujTnv234frXwxlanl?=
 =?iso-8859-1?Q?bAYZl6dwoHKxrMJhZ3zPeHueKcT7rF0riPrMVyU6PbwK0U9x2Jj9IhBK0F?=
 =?iso-8859-1?Q?oGb6qUfAHrWpySIv3aZmnaiRAMEITOBS+Ts1URDOpEsnxuNOr+nBM3nYmZ?=
 =?iso-8859-1?Q?h0dDByWx997Mv3p3xseIbdOgbwjxlMtPqm2FFVdNTgORg1eNSEIsc7xg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6abc485-7153-4bff-1929-08dde1e14ff0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2025 01:06:38.1219
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BEEVtsbLXH/4fV4oVpTKWL1SMGmJZTZ55AzGb0xiLJhTNB4NaBpeB4u7fQXVe+smvsOchfdangDEhgAbzoBbzbJHJSuMbvo4El73WtBjzyg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR03MB10169


Hi Mykola,

Sequence of next 3 patches (and previous one) really puzzles me. Can you
first implement hyp_resume() function, then add PSCI_SYSTEM_SUSPEND call
and only then implement system_suspend() function? Why do this backwards?

Mykola Kvach <xakep.amatop@gmail.com> writes:

> From: Mirela Simonovic <mirela.simonovic@aggios.com>
>
> Invoke PSCI SYSTEM_SUSPEND to finalize Xen's suspend sequence on ARM64 pl=
atforms.
> Pass the resume entry point (hyp_resume) as the first argument to EL3. Th=
e resume
> handler is currently a stub and will be implemented later in assembly. Ig=
nore the
> context ID argument, as is done in Linux.
>
> Only enable this path when CONFIG_SYSTEM_SUSPEND is set and
> PSCI version is >=3D 1.0.
>
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in v4:
>   - select the appropriate PSCI SYSTEM_SUSPEND function ID based on platf=
orm
>   - update comments and commit message to reflect recent changes
>
> Changes in v3:
>   - return PSCI_NOT_SUPPORTED instead of a hardcoded 1 on ARM32
>   - check PSCI version before invoking SYSTEM_SUSPEND in call_psci_system=
_suspend
> ---
>  xen/arch/arm/arm64/head.S          |  8 ++++++++
>  xen/arch/arm/include/asm/psci.h    |  1 +
>  xen/arch/arm/include/asm/suspend.h |  2 ++
>  xen/arch/arm/psci.c                | 23 ++++++++++++++++++++++-
>  xen/arch/arm/suspend.c             |  5 +++++
>  5 files changed, 38 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 72c7b24498..3522c497c5 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -561,6 +561,14 @@ END(efi_xen_start)
> =20
>  #endif /* CONFIG_ARM_EFI */
> =20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +FUNC(hyp_resume)
> +        b .
> +END(hyp_resume)
> +
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> +
>  /*
>   * Local variables:
>   * mode: ASM
> diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/p=
sci.h
> index 48a93e6b79..bb3c73496e 100644
> --- a/xen/arch/arm/include/asm/psci.h
> +++ b/xen/arch/arm/include/asm/psci.h
> @@ -23,6 +23,7 @@ int call_psci_cpu_on(int cpu);
>  void call_psci_cpu_off(void);
>  void call_psci_system_off(void);
>  void call_psci_system_reset(void);
> +int call_psci_system_suspend(void);
> =20
>  /* Range of allocated PSCI function numbers */
>  #define	PSCI_FNUM_MIN_VALUE                 _AC(0,U)
> diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/as=
m/suspend.h
> index 78d0e2383b..55041a5d06 100644
> --- a/xen/arch/arm/include/asm/suspend.h
> +++ b/xen/arch/arm/include/asm/suspend.h
> @@ -7,6 +7,8 @@
> =20
>  int host_system_suspend(void);
> =20
> +void hyp_resume(void);
> +
>  #endif /* CONFIG_SYSTEM_SUSPEND */
> =20
>  #endif /* __ASM_ARM_SUSPEND_H__ */
> diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
> index b6860a7760..c9d126b195 100644
> --- a/xen/arch/arm/psci.c
> +++ b/xen/arch/arm/psci.c
> @@ -17,17 +17,20 @@
>  #include <asm/cpufeature.h>
>  #include <asm/psci.h>
>  #include <asm/acpi.h>
> +#include <asm/suspend.h>
> =20
>  /*
>   * While a 64-bit OS can make calls with SMC32 calling conventions, for
>   * some calls it is necessary to use SMC64 to pass or return 64-bit valu=
es.
> - * For such calls PSCI_0_2_FN_NATIVE(x) will choose the appropriate
> + * For such calls PSCI_*_FN_NATIVE(x) will choose the appropriate
>   * (native-width) function ID.
>   */
>  #ifdef CONFIG_ARM_64
>  #define PSCI_0_2_FN_NATIVE(name)    PSCI_0_2_FN64_##name
> +#define PSCI_1_0_FN_NATIVE(name)    PSCI_1_0_FN64_##name
>  #else
>  #define PSCI_0_2_FN_NATIVE(name)    PSCI_0_2_FN32_##name
> +#define PSCI_1_0_FN_NATIVE(name)    PSCI_1_0_FN32_##name
>  #endif
> =20
>  uint32_t psci_ver;
> @@ -60,6 +63,24 @@ void call_psci_cpu_off(void)
>      }
>  }
> =20
> +int call_psci_system_suspend(void)
> +{
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    struct arm_smccc_res res;
> +
> +    if ( psci_ver < PSCI_VERSION(1, 0) )
> +        return PSCI_NOT_SUPPORTED;
> +
> +    /* 2nd argument (context ID) is not used */
> +    arm_smccc_smc(PSCI_1_0_FN_NATIVE(SYSTEM_SUSPEND), __pa(hyp_resume), =
&res);
> +    return PSCI_RET(res);
> +#else
> +    dprintk(XENLOG_WARNING,
> +            "SYSTEM_SUSPEND not supported (CONFIG_SYSTEM_SUSPEND disable=
d)\n");
> +    return PSCI_NOT_SUPPORTED;
> +#endif
> +}
> +
>  void call_psci_system_off(void)
>  {
>      if ( psci_ver > PSCI_VERSION(0, 1) )
> diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> index abf4b928ce..11e86b7f51 100644
> --- a/xen/arch/arm/suspend.c
> +++ b/xen/arch/arm/suspend.c
> @@ -1,5 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
> =20
> +#include <asm/psci.h>
>  #include <xen/console.h>
>  #include <xen/cpu.h>
>  #include <xen/llc-coloring.h>
> @@ -70,6 +71,10 @@ static long system_suspend(void *data)
>       */
>      update_boot_mapping(true);
> =20
> +    status =3D call_psci_system_suspend();
> +    if ( status )
> +        dprintk(XENLOG_WARNING, "PSCI system suspend failed, err=3D%d\n"=
, status);

So this is where missing call to PSCI_SYSTEM_SUSPEND is...=20

> +
>      system_state =3D SYS_STATE_resume;
>      update_boot_mapping(false);

--=20
WBR, Volodymyr=

