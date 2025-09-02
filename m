Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF6DB40E6A
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 22:15:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107385.1457821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utXP0-0001or-Du; Tue, 02 Sep 2025 20:14:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107385.1457821; Tue, 02 Sep 2025 20:14:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utXP0-0001li-Aq; Tue, 02 Sep 2025 20:14:50 +0000
Received: by outflank-mailman (input) for mailman id 1107385;
 Tue, 02 Sep 2025 20:14:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mdbA=3N=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1utXOy-0001lc-7F
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 20:14:48 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74882329-8839-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 22:14:40 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by VI0PR03MB10568.eurprd03.prod.outlook.com
 (2603:10a6:800:20a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 20:14:33 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 20:14:32 +0000
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
X-Inumbo-ID: 74882329-8839-11f0-8adc-4578a1afcccb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qVLAPWMkxaGZ5+NaDmQHclp7q6zELB4/hOflFY0b1hPN3ZJ8IyaQo2jwmkv/A3PiI6pTT7+b4XlVOq1ILXrSsyXudkgH/NjKxd6ZCvZh/ySOQCIlfDse97w4rYJWfr3d601zjSx738nRpNNnGh2iTgp1NOCV6KgBQ/XgQ7frAgGpZYr2fUDLMF6X09XJEg4wdHGMigzF5l4rBK2T+LS+cVJBe+g7/lFDQetcso8JbZTF1jrd+YGFbuKsxI/bJvWa3Y43ZXo0dDZNrsSijKIk+I7xBSuaWZY5lxv9jDOU0pDbLNRXnWlIxUZHpKqUxUr94AVpYzY4kfj21mYZbSZLKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfBzhqG3dKrQs+WAJJZl0fXxiYFWJkxq7Hsbg0uPEzw=;
 b=eAwAeQlgFq/hPW1GlMyBi0qaic0NmJA6oDx83STeY+VO3gkTiHci5I9LtjSGTntgMwLLBBFjA6zo9pwEFUXW98OAe6/RXoXpixXX2JCr41iB4hHuZdevIxCF8DP8EoAeSYHTEQaK8EyTYCgleUgXDzOBX5HESK1kwep7sig0B12CIqu8azHWiC8cfcr3znApd4lrQvhuV1GCQ9Q4J37GTTgqn9c4HZCfd/DmBrqXTV/4iecAjVbwIl7PikEOmLcixbTwevcwBljgI7VzAaqgHEfs64OVvprRctpJF59OFg7j2PzzQEww/TOi7kQAHg/ZX00AIxTBzvDxdFfmok8voA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfBzhqG3dKrQs+WAJJZl0fXxiYFWJkxq7Hsbg0uPEzw=;
 b=nIj0J3x5TedsdDflk8XQVHWF7OxCwupx1ZKck4PR+L6y+NG0gIhgFAAb7vnCmIO46r8xRm4eRw2qp1e8zviFN717Y8tQ09qzbieuf3pn8Q4DHU4CD548j28MQuqNkJROGD0t8rluzXtfMJ1GSwli5MExw4Jw873z4wxyNXFEBYZAoOpJ8pmgD6rpSkLyCrjtnjcrHeZSdzNQ1RRCQR7byEuddAaMXRN0UjTyLx7O6GG/7Ham0Tbi98Q6l3VopAZvu8KFdxVz/Jx6c350CmZeCq3czMKL7JGRRfwSO+U4NHg8XA28/jYRCE88cVkRd1wcCEUaULgFjJd+LtLGaicOOA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mirela
 Simonovic <mirela.simonovic@aggios.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Saeed
 Nowshadi <saeed.nowshadi@xilinx.com>, Mykola Kvach <Mykola_Kvach@epam.com>
Subject: Re: [PATCH v6 01/13] xen/arm: Add suspend and resume timer helpers
Thread-Topic: [PATCH v6 01/13] xen/arm: Add suspend and resume timer helpers
Thread-Index: AQHcG404ScLtR2ZKGku1UaXKdUHwsg==
Date: Tue, 2 Sep 2025 20:14:32 +0000
Message-ID: <87h5xkwr14.fsf@epam.com>
References: <cover.1756763487.git.mykola_kvach@epam.com>
	<781c8e1b3a4d9b269bfde125072a84baae3f9bb3.1756763487.git.mykola_kvach@epam.com>
In-Reply-To:
 <781c8e1b3a4d9b269bfde125072a84baae3f9bb3.1756763487.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Tue, 2 Sep 2025 01:10:05 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|VI0PR03MB10568:EE_
x-ms-office365-filtering-correlation-id: f254f2fe-31f3-42da-2bd3-08ddea5d5471
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|42112799006|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?fqgMcROvA6ZDXsKbxZRUPChzSVrQGdQtOSJNly1L8MPgvkHsezfO0tVdJk?=
 =?iso-8859-1?Q?e0uO+7R0FV13FQ93Z/ozYitdBQyZux8ey/VJxP1LvzHr9fTx9d5pYu+XTb?=
 =?iso-8859-1?Q?UbRz754xoZKoCNxQ4YnVfWY7QM+bfNXz2kMSkUZo/0JX3xIUgHdO5HtmHY?=
 =?iso-8859-1?Q?eMlCHMo3Go2IlbAaECcSDGXcz7N3ba7Liy+bcLxnCUj7ioMvPBeT6L0U42?=
 =?iso-8859-1?Q?ay69ReiOw3Gn/zcqzcF+faCEHLsU2wJYtsa7Ki6GZ2YEZ92klAZHAY2R+K?=
 =?iso-8859-1?Q?a+sMfq0fXUlhcUdw1LYjHPxdowZkWmu1aajc+6z/3hz7kPIfR0FjLC1eNq?=
 =?iso-8859-1?Q?JpsG7zmffDmJ4dRAwBUEsLjy96NHBxP1My+rcpGjGMe/J75FWkkhxypJ+0?=
 =?iso-8859-1?Q?PUXmfB+uXmeAQ8CiY6SA5doLdXRMW+VaE6U/zC4RRSN6BpFbnStWFao3fY?=
 =?iso-8859-1?Q?thBxngcvP5WhxE6nruvRcBFF9GdHszgvKuvoMey/2odh1rBDFeimU2tpTU?=
 =?iso-8859-1?Q?FsJ/zK6U2exxn5vk2eFJGWFcN54EnqpW9aev0AbhEX4+HmqhDCSx+X5h5e?=
 =?iso-8859-1?Q?xjOfTq3sRECEXwPc7HLeoKDiZyK8CzRcZh7VywrKI2rH27dSXlGy254WED?=
 =?iso-8859-1?Q?a2VNEyCgXGYZSJnzBE9fuc3T+zOSX20baYs5YjINSS2uxWGtUEdIyPTLrT?=
 =?iso-8859-1?Q?66IVft9UJhBOdoCBQdoom8A6e4Z2//+jh+J0cH6BeSbz4nL68bC58FVmtR?=
 =?iso-8859-1?Q?qLiiM9Mw3asOkRT9KbqiwLybua28RkNZI8NsKLEBmBCoNtQCOWhlbRCaSn?=
 =?iso-8859-1?Q?nWKVoGTuB1HdSa2E1bl7uKlq+9nnb0Htgl+tdqf/MfBLA0V+S6NwazppAh?=
 =?iso-8859-1?Q?i9VTVgdDgIdpCXj9apUQCdvKNsk7M9lJXe2VkEhz9knjPwkqM2oghgCLov?=
 =?iso-8859-1?Q?OnAcz2J/HK3CLnhcaWCITC/8eWduFv13WA8JP47cZkWrGaNqypqcUKNTZL?=
 =?iso-8859-1?Q?rlnoJq0p29HbUbqnDeANVCy7NQ/n6y1CHj+Y6dWELtV9pWRQsgdHWLkC0o?=
 =?iso-8859-1?Q?vHwzDiWw2RA4k188uOKLPSLPD3jUDPpx1TW4GmWWnDET3EAq5ZAtFzE3KD?=
 =?iso-8859-1?Q?8GbZAdUU/jkN9ffv5wjx7kxWKqBrQ+nvilibQNDxsYeYPcXEP5Kitx6N8P?=
 =?iso-8859-1?Q?QZNCLyyeAmgn6gyHs7/vuxakiQ2CCSYBTS6tdgLjRdz4ThQrqjbTIkfrxc?=
 =?iso-8859-1?Q?cpytHwnYtlxJdiUoCU/WD0hvspWCvaGvw8MYJ6VjgI9MVQuwPUIT911JxF?=
 =?iso-8859-1?Q?fn2UoXMFecV6mVFeQmHkxTWa13S/J1fIJQafDTem2fPTFVFknlIN1ddFUe?=
 =?iso-8859-1?Q?75A2qyjpwN7tOgxGS6IebMhKZhaiVvxLA0zBr2tNRv8SGPH6ozQ2ZCI4Tv?=
 =?iso-8859-1?Q?436ggu3r0Pi7mOzV4JL9t9ek2tpQ/TmNigDO5idyltpfe0DaX1YDzSvlMK?=
 =?iso-8859-1?Q?fk1+i3/092FGxysgHeLl1Tbozc3UDyCCKMVmqojxFH7A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?gIyJveTQ5riHfpMS0Jg4KmTAGZW+fthxVWNxW9tB73pnbM+EdrYL/t5itP?=
 =?iso-8859-1?Q?MSeGst7qblu0phxV2zbBA66ISUxRoyeBhQcbZj4H56v8rC+vMBhbEHzzQs?=
 =?iso-8859-1?Q?VO/gEuhGvwy0aIZ99Ez5abRbJohI8ZFWCYIehojO59PylwSqVWy8M9uR5w?=
 =?iso-8859-1?Q?ZVADj19bEcdleWZpkh6+H5BW2MBmBvNiB8AwOdNy/gRKU0QsEq4n85x5Zw?=
 =?iso-8859-1?Q?1EVYsv8TDpVOSBJzFsL3UkyFmS1s9gA6Sp44fxDPr+GaE5vEJ+QrzncHtQ?=
 =?iso-8859-1?Q?tEHxkQjqymDBqvDpB+NT0umDqpuGjMVEsNqvkgbpiNHTEONYDhlruOT7Oc?=
 =?iso-8859-1?Q?e3OGc8XKjrdgoXHkwmS/ciJbAW1CyBIHfmCfCSqjwZTrb2DvhFfqA/VKFD?=
 =?iso-8859-1?Q?NcewWVSm3kMmizEJDY1UycaaM7L7Kbz8p6zXFxvZ3PlCHVtOQmECZuv7ZF?=
 =?iso-8859-1?Q?zYUBfccgXJyNSRo6MwrdMywF/v/D8vBy3Vqlcrrnnig5TOzY0wD6OrQqTu?=
 =?iso-8859-1?Q?4dcEfWcg9Y3rwNUPSvHklChQZoZzLfsTcv7d3JqzFYmXn5VVeE5YZT5Raq?=
 =?iso-8859-1?Q?Mc0sYciDYHw2ik/KwdD7D6V5PF3aKNCVPw6yf9UnTUkl60vGivzQsXshMw?=
 =?iso-8859-1?Q?wif7zYly0x3FJ1lqrb7QCmOy553Nuvk+cW9pL3E1ci9Itcp/u1z3hY47bL?=
 =?iso-8859-1?Q?avH7gI72nD1Qer/+e+H7LFxvx8AYIt+wf8GE3Dx5OpYcj4RQnoQQ/D32Lh?=
 =?iso-8859-1?Q?f1bzeTALKSdzkXl/jHKpbcF23PhP/3pncoB+n159L1pdiW4q9nikFe9E/e?=
 =?iso-8859-1?Q?u71TNj+v6Oet/m/V7a0Y6XNmNOcMAmSBCwboVaGIMdvuVTPVpskCBZYZkT?=
 =?iso-8859-1?Q?9lGxK+k3CvmpOlCLu6DZwciqRLUzQQNr9SHp3OTsv7Ja/cuHQ/8+42oR06?=
 =?iso-8859-1?Q?ULI7sGVOqm6hs+1ABtpyXzeHGkJMuhgN3lbCdmiMlUQxQJgPCwuGbICQGT?=
 =?iso-8859-1?Q?z4VbTV0+Jn+07IzAXHI6sgLNLbMO0iwWh1ZS1wIvbtnJ8Bgd9PtwoOIwCi?=
 =?iso-8859-1?Q?RDhIVgK6wz9AX109AgyoHHy3Dq/VCROoq8Jsjs6TqfCJMTad5DJQnbN0AP?=
 =?iso-8859-1?Q?R7ivZ1Jgr8TYI1aI7vWrwL+3CrAB0AryHibVFdiMVrz9s0tm4Iemt9xLcl?=
 =?iso-8859-1?Q?In9TA2LQhJJsOF6dRcLiFXxVvFY7yEu71+43z+cYOJcNUjKS+QDP9EJFXL?=
 =?iso-8859-1?Q?C2d5Q7vLm5UhokxDhmHKyqrVn+B5hxSFz9citzuIkcvjY5riyTFjXdjMDz?=
 =?iso-8859-1?Q?ut9fLVOuqa9UxZZ1SoC0L+HVM1vAGcvXBDTC50BbebVXL8mCyk3gVdNjnQ?=
 =?iso-8859-1?Q?K5XJgxUi8YNhKjWgu+wW3nCsNeO73h6Juy+MbZLV8NPeAYfzBpPAPgLCBd?=
 =?iso-8859-1?Q?FLpGv8pCCeuHEMny4vkHH9WEK0SS1M7lN1hfvxXw89wGF5L6hGcprNqkRC?=
 =?iso-8859-1?Q?J5JhXz7MyWQUmPShW4vKv4uQoxbNorZKruayP8XPohXNCyvP+jWyJKnwR8?=
 =?iso-8859-1?Q?XWA26YI2QGduWrRvUqFZU1G7vd2wP5j0+GsYh+x4ZNY/AwLasSrScRtN1Q?=
 =?iso-8859-1?Q?QTWwy0CEbMLCm9OHzIWI8/x9IO6kdN1HE3DGFuanwGzt5LrLYrAu7c7w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f254f2fe-31f3-42da-2bd3-08ddea5d5471
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2025 20:14:32.5163
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XcLnUAQqbeLjODvysTiPlD95eP5PGdU/ObD9GOmHIeFlAhdkBEoJhLCGmqclxESLK7NXskYMKlDFywvUtSW/7d8iDis9bNozr3nitxARClE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10568

Hi,

Mykola Kvach <xakep.amatop@gmail.com> writes:

> From: Mirela Simonovic <mirela.simonovic@aggios.com>
>
> Timer interrupts must be disabled while the system is suspended to preven=
t
> spurious wake-ups. Suspending the timers involves disabling both the EL1
> physical timer and the EL2 hypervisor timer. Resuming consists of raising
> the TIMER_SOFTIRQ, which prompts the generic timer code to reprogram the
> EL2 timer as needed. Re-enabling of the EL1 timer is left to the entity
> that uses it.
>
> Introduce a new helper, disable_physical_timers, to encapsulate disabling
> of the physical timers.
>
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

> ---
> Changes in V4:
>   - Rephrased comment and commit message for better clarity
>   - Created separate function for disabling physical timers
>
> Changes in V3:
>   - time_suspend and time_resume are now conditionally compiled
>     under CONFIG_SYSTEM_SUSPEND
> ---
>  xen/arch/arm/include/asm/time.h |  5 +++++
>  xen/arch/arm/time.c             | 38 +++++++++++++++++++++++++++------
>  2 files changed, 37 insertions(+), 6 deletions(-)
>
> diff --git a/xen/arch/arm/include/asm/time.h b/xen/arch/arm/include/asm/t=
ime.h
> index 49ad8c1a6d..f4fd0c6af5 100644
> --- a/xen/arch/arm/include/asm/time.h
> +++ b/xen/arch/arm/include/asm/time.h
> @@ -108,6 +108,11 @@ void preinit_xen_time(void);
> =20
>  void force_update_vcpu_system_time(struct vcpu *v);
> =20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +void time_suspend(void);
> +void time_resume(void);
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> +
>  #endif /* __ARM_TIME_H__ */
>  /*
>   * Local variables:
> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
> index e74d30d258..ad984fdfdd 100644
> --- a/xen/arch/arm/time.c
> +++ b/xen/arch/arm/time.c
> @@ -303,6 +303,14 @@ static void check_timer_irq_cfg(unsigned int irq, co=
nst char *which)
>             "WARNING: %s-timer IRQ%u is not level triggered.\n", which, i=
rq);
>  }
> =20
> +/* Disable physical timers for EL1 and EL2 on the current CPU */
> +static inline void disable_physical_timers(void)
> +{
> +    WRITE_SYSREG(0, CNTP_CTL_EL0);    /* Physical timer disabled */
> +    WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Hypervisor's timer disabled */
> +    isb();
> +}
> +
>  /* Set up the timer interrupt on this CPU */
>  void init_timer_interrupt(void)
>  {
> @@ -310,9 +318,7 @@ void init_timer_interrupt(void)
>      WRITE_SYSREG64(0, CNTVOFF_EL2);     /* No VM-specific offset */
>      /* Do not let the VMs program the physical timer, only read the phys=
ical counter */
>      WRITE_SYSREG(CNTHCTL_EL2_EL1PCTEN, CNTHCTL_EL2);
> -    WRITE_SYSREG(0, CNTP_CTL_EL0);    /* Physical timer disabled */
> -    WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Hypervisor's timer disabled */
> -    isb();
> +    disable_physical_timers();
> =20
>      request_irq(timer_irq[TIMER_HYP_PPI], 0, htimer_interrupt,
>                  "hyptimer", NULL);
> @@ -330,9 +336,7 @@ void init_timer_interrupt(void)
>   */
>  static void deinit_timer_interrupt(void)
>  {
> -    WRITE_SYSREG(0, CNTP_CTL_EL0);    /* Disable physical timer */
> -    WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Disable hypervisor's timer */
> -    isb();
> +    disable_physical_timers();
> =20
>      release_irq(timer_irq[TIMER_HYP_PPI], NULL);
>      release_irq(timer_irq[TIMER_VIRT_PPI], NULL);
> @@ -372,6 +376,28 @@ void domain_set_time_offset(struct domain *d, int64_=
t time_offset_seconds)
>      /* XXX update guest visible wallclock time */
>  }
> =20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +void time_suspend(void)
> +{
> +    disable_physical_timers();
> +}
> +
> +void time_resume(void)
> +{
> +    /*
> +     * Raising the timer softirq triggers generic code to call reprogram=
_timer
> +     * with the correct timeout (not known here).
> +     *
> +     * No further action is needed to restore timekeeping after power do=
wn,
> +     * since the system counter is unaffected. See ARM DDI 0487 L.a, D12=
.1.2
> +     * "The system counter must be implemented in an always-on power dom=
ain."
> +     */
> +    raise_softirq(TIMER_SOFTIRQ);
> +}
> +
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> +
>  static int cpu_time_callback(struct notifier_block *nfb,
>                               unsigned long action,
>                               void *hcpu)

--=20
WBR, Volodymyr=

