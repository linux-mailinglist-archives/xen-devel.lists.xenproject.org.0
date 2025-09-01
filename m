Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9012B3E25E
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 14:12:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104629.1455666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut3OC-0003Fl-DN; Mon, 01 Sep 2025 12:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104629.1455666; Mon, 01 Sep 2025 12:12:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut3OC-0003DF-AC; Mon, 01 Sep 2025 12:12:00 +0000
Received: by outflank-mailman (input) for mailman id 1104629;
 Mon, 01 Sep 2025 12:11:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Ete=3M=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1ut3OA-0003Cx-7p
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 12:11:58 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d338dd0a-872c-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 14:11:44 +0200 (CEST)
Received: from DU5PR03MB10441.eurprd03.prod.outlook.com (2603:10a6:10:516::14)
 by DU2PR03MB7975.eurprd03.prod.outlook.com (2603:10a6:10:2dc::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Mon, 1 Sep
 2025 12:11:41 +0000
Received: from DU5PR03MB10441.eurprd03.prod.outlook.com
 ([fe80::eeb8:470:6260:e5f4]) by DU5PR03MB10441.eurprd03.prod.outlook.com
 ([fe80::eeb8:470:6260:e5f4%7]) with mapi id 15.20.9073.026; Mon, 1 Sep 2025
 12:11:40 +0000
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
X-Inumbo-ID: d338dd0a-872c-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dFnHDe/yA6TtzA/19Ze99P5VltJixiTCsfP4Bu4UFA+8HXWScQvHrkWF9ipcWYO8kaD6BpeWAw1INxIIhXM8v+fhKJ7IfXUMSKF3o271xUvCIj9wmlAISo+BIpFL/NLm5VYHZK18N2PQ6iaRJmI03vt6EVhXXAAyYNqeLtjjScCCPeIuzgoXhU7h0+PddKg9HI68ooN4JtJp8i9GgnTnoURxGm91WUGHndRe17uhxzJh9dKzp14fPzjG01J7ZBXKYBltYplvtH63XwP+ZF04VMBB4N8SoIVh/+fkUhkBtId/Wlwoo/FvcZItjIRN7OylcTngsZ5GGRWo0GIh8Jo0bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qW+cw7U9MmbRqGza+0IxsuBpODCbeF/Y30etSfD5ICs=;
 b=vqvlAwLdgylE5U28xKd6kx6neowMymhE0RjH9jItGSFsYLBP/YzoNSgxO+fxLj2wBL36/aTn2mkiTgpl3PG2BWJ4MJEEUZl9nkybhBzHT910zivuw+rRIPs5Zm7VHf32dtHktumUjDdEyU1J6j0wz1Hz3/xfHnw420yhKBDAzGqrfnS0R9cjEsD5znz+d8rdPZuPtcTXGAyssTzQD+2ojZa0apm6fxfIdlcGBkdxfWsADrCA7bVrc9OHItb/HTpaQykgnfCms2g7XzAU4Ij0sA/wg6d9HmHCehjlR3VHNV2CnqeNxBUxUiwpH4UV0r/LAYe7Nlo7m9KTpDbwV/KJvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qW+cw7U9MmbRqGza+0IxsuBpODCbeF/Y30etSfD5ICs=;
 b=cTNM4XRiatFTsvCn16BtQkD33FJg1dNsyq23NRU/FEZpLntKiDu9Lfvfd1IfrZhSznyyHSPwWJE7IE7g3gQA8FMX0X1bJ+ya6GSbPAHJ2Ijq8x2+O9eH60Fs8AIhfsfLVfFPSw9nkl7vm2ZnHHMkrumu+SP9I05aJkIfNyq+exyD+2ACvWrDFKmc38UmEz9cd6tCAGgVHHOwwp0MRTmJA1BB6/xQW6pjKa2D8eewug/88gct4wpim3KNPDgTLzXC9xdgWnBKNA7szNZMwMeAoLD0gzCn5R0Ez4QxPoZPqYvZVzitlqToLxXNP2SL/rqdoekP7lamLTCabndi6X5MzA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <Mykola_Kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v12 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
Thread-Topic: [PATCH v12 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
Thread-Index: AQHcGfsZ6tgpa6Gn3ku7sSsKqfCAiA==
Date: Mon, 1 Sep 2025 12:11:40 +0000
Message-ID: <87seh6wex0.fsf@epam.com>
References: <cover.1756586648.git.mykola_kvach@epam.com>
	<244e5c2bcebad9563595ac7564ffa105d5f568d3.1756586648.git.mykola_kvach@epam.com>
In-Reply-To:
 <244e5c2bcebad9563595ac7564ffa105d5f568d3.1756586648.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Sun, 31 Aug 2025 01:10:28 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10441:EE_|DU2PR03MB7975:EE_
x-ms-office365-filtering-correlation-id: 15bfa4d9-427b-4f85-42b5-08dde950b55e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?1UNkaQn0T/RaiCXFwLtGw/PkeqKes7o1OwEEARFLeZ8apf7t5VHumHqLcu?=
 =?iso-8859-1?Q?0N8byIvfkozKggqwE9e7jVAiGKvltgSGa5EccW/v+Q5qb48HsamLx4Tmm3?=
 =?iso-8859-1?Q?+8qxhZZqd7iYIns3M2bxbUakszfKksgR/uIb/1DfT4SIfsuiVJQ5wCK/1a?=
 =?iso-8859-1?Q?4u1nVmumAJP6EvGB7xImVqFRAWoV08R5A2mneKhK2qqloUzX3+mqBHC2xM?=
 =?iso-8859-1?Q?3OnEgEDhzDuuquQ8WwVbSzU47tIb5Rj1Lfn0zl3S1N0bFE+wGl13XmkVPM?=
 =?iso-8859-1?Q?ktaNd+o60/VBL2kd4izezts4Fm603V9uv9ZGMbQipilM+x/yhsnI2w2f9q?=
 =?iso-8859-1?Q?KnxcJZDPlKZaN9XHbW9o4MHQa/qu57vhV5/Q8jjElGDaHesJnCnN/HDeMk?=
 =?iso-8859-1?Q?dOxXrP36hX5nKNogq29jinaBDgD68q0DhATgph44oDFKuZY4Vqyzqcs+g8?=
 =?iso-8859-1?Q?W1v8x7fvbCXZUcagaAkjOb3fOeGAhdli66DRCJRmm+zN/U/6dCIUW6QI46?=
 =?iso-8859-1?Q?jLsJJsl0Iik4o/nfiHkQijGROWt0Q0x971pfwo5VZhQ898W9yLGySACpjD?=
 =?iso-8859-1?Q?W66LsgmDI0EuVqD+QHgSDsKwYdYrOgU8CzaMb90p0RMGPAfhJGg4Tr4NPk?=
 =?iso-8859-1?Q?c8a65vnIZbQ8lhvxkbHNCQEyeqhzKNmJnx7oU8TElev/1H93b8xqT5bi1c?=
 =?iso-8859-1?Q?HqGiDGD1YlLK9lA1qmEm4dYA5fyc3/pD5G2rwGXeHo37KAjWZbgbaogFIV?=
 =?iso-8859-1?Q?W9WlUh++yATNZdVkxAiEy0A5gi/Fdi+JuvkE4NTLQ2Td2nWAva+6ld/Emf?=
 =?iso-8859-1?Q?zgDoVMzZKdw38kiaJv9s3maKwlkAi9yRWdLAURUFYJblDeeP6zLmYz7R/8?=
 =?iso-8859-1?Q?HkomRhRqAogmogHqc83xFF4u/Y2Yf1yR5mwqVQvInPfjz1COre5wZqhwSt?=
 =?iso-8859-1?Q?gYe4zDaHAOoapaumOBW4MEN/h/YIK68HHcOAltSiwyK5jBk2kP+LNj+z9Q?=
 =?iso-8859-1?Q?2ThVS2qtYjE9ELWe33hPC/KBrAjgzpyzjJViCz0CKVsDKhmS1hvS9XjiFw?=
 =?iso-8859-1?Q?bQdJ+2lJrMz8u+Ou1bTFbee2z0FDr9a7EES5/zUa4ODe6sYNvmpAReU6e4?=
 =?iso-8859-1?Q?l7FBRCLILJdh+8r3b4hwd3YfkessiyT+aW+wtYIL0qloW0cwcegpMWR9Y3?=
 =?iso-8859-1?Q?bg56zIxPAR4l7jp1K0CofVzRRCsq1haQq4VCUqcFSYzXJDe5tCHpXBUr05?=
 =?iso-8859-1?Q?SrSEiI32/E2q233dEqo8XZG0JHyFlLjGcmIsBwcx3VUjbSkfj9SztsM+sc?=
 =?iso-8859-1?Q?ihW0eMNz4U99YXhj6DzKpFMYWIU5RGzih3j36Vtool5IQt+VIgiINliUAt?=
 =?iso-8859-1?Q?MBv0/AzDzXLWZ/d3asPHo8b8Ace+4Gu+jdqiVXCztJUE0O3fh76bTikAe7?=
 =?iso-8859-1?Q?vJv9hnO7gSOc8lEt1Gsj6Fs4iMe9AqrM14I5pSFAQQ90OmwtYZndxomFV4?=
 =?iso-8859-1?Q?HQHdBHzczbeJRtv0TCucAfTBkvs0p0hbltbN+I+BF8vw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10441.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?pF8bMIseLZvZsZ5MsRAWWhwVWpBcoNM/zjHH5vSMEj8RFCpiamPwB3D4P5?=
 =?iso-8859-1?Q?s8uyWhyHZzuGcvr1B3GsBODoBuVd8TBESzjP1bCYie8r23zG6mAbBBOZC7?=
 =?iso-8859-1?Q?/2QRp4zbEjXbnbnLEDmzE9+AACLd792Xnj5G1lAyyjUQ7JAzd7d/8meMM+?=
 =?iso-8859-1?Q?AvX8ZpjlRmlxzK65fj28QJzjtxec42kUkuQQvJqayVa7INeZlAkeF807rA?=
 =?iso-8859-1?Q?i1MYMfhXJ6ACwDQj9wQ6ZfZ23LkKN0H21UM1ZhnO8YrMZ6Uyot9HFG2kNb?=
 =?iso-8859-1?Q?z0y/xkEE5EPGzKoY0WFgzRQRjWmcHExesrdZqsIsw8p11lzPT4kT2OsWNL?=
 =?iso-8859-1?Q?/tVNx+YKs85X5Wwjy8EtXZuAnq3SCOs7bnQuCCBS7SOBrtDVWAFDbPu+KW?=
 =?iso-8859-1?Q?N7dpp4ABnRzy2z10wpIzv7q2QrENoaOwk9tStUgavfcgaAX3MaV8EN5siI?=
 =?iso-8859-1?Q?ItR70MhAJ/9K1LWGwKixjTZMJX9zp0BiqYWNZ0Hyq5BWnP+qaKxPb7ulmj?=
 =?iso-8859-1?Q?ZHA1Mtuyvfhz02mlrgtJiBeHJi2cfbfHuH19wAQWlnqJ6rWoQZ5coX/3L9?=
 =?iso-8859-1?Q?OANbDqYNH48jFI9ypCcobTu+S4W+J3+KJ6yxcR0s04IlJbT/8GFKfem3i0?=
 =?iso-8859-1?Q?LrL4V4WDFS67Exgd+wcXoN7IOgNkWTIiovw7+4FlE7ZqQoQ7YNtT/avcaS?=
 =?iso-8859-1?Q?3IoBOVgy6cfbqt9ect1Bxs25RX+RW4T6gVH3CqYfhpp8MdMxanx7Uq4Kwe?=
 =?iso-8859-1?Q?Sh4DHocWWOJ8TZED32aQKvXbr/SDMEVNw348IlHdlLxnQIRepF54aQtEul?=
 =?iso-8859-1?Q?mGydhgf0BCeVJo2MF2UsGUH9OYdQ0/nZccXk/oOuYrYSrss6RkEcW2BXYE?=
 =?iso-8859-1?Q?wbs1klEyHNFPrI1OTWS3J3vQTF3ZqgT2GG99mXRFGF9OwyH2GqIjvP+4dQ?=
 =?iso-8859-1?Q?ctvUKnStV6xQDunDsz9lu4l4RGOB1z3HuJWSK8spAfHhFwYsfUyeJ5Xvif?=
 =?iso-8859-1?Q?Nldiel42ZvQjm93EbVf7gXGGFPooutwpCv6LvVCTlc+yVYtecrJCrber1H?=
 =?iso-8859-1?Q?0o64Bubgyapwd6Z7fn6QD2/SVVEdFLycVLmPlh6irlUvKy8LVGTB0OqNs+?=
 =?iso-8859-1?Q?44DKT27Nsua4LelqNkOkxJKcb21AzzVGZAgw8N1HNFtB355gd2hZEEm/hC?=
 =?iso-8859-1?Q?lI2+89kL103AXeM2dHQ33rFJNUM+Ws144MMhvXMtK7U3XSGf32E3j1TKzQ?=
 =?iso-8859-1?Q?GYsCFnkjw46JRMZ60/Poa1sXEmAjGHJHZgo3Q5/agU0de0WLDodvG+XICv?=
 =?iso-8859-1?Q?S0nowWbfPCG9x8gcHg6b3dSWgUMyWHT+z29z3VwtBEXP2Rvz6Xs+KmeNaX?=
 =?iso-8859-1?Q?FJLCsU9euVg2gzogXdDZXYx6//6F/6YdPbbXRwuI9Qk3HB/OhCOpkrMmCm?=
 =?iso-8859-1?Q?gX29RJ0wJ5vhFWsNbfGUNXRwTQMNVRL50fe2zXPyRmpyeHiSfPeLNZAOYr?=
 =?iso-8859-1?Q?M2bMnDV+4sKTzZsS1ivoMWrd3foRBpqoi93qn3mCgWmsijzxs/hKN68C3J?=
 =?iso-8859-1?Q?IB4VSfDSJFwkCghNX4tUJLDtCBtJyu9dQLC+oSN+GGIXXB/5t0PFQUpKET?=
 =?iso-8859-1?Q?XAxPIs4wZ4NgVDj6qnDcf4wJ2nkzNeJ6Ru7VVTWQvF8SJir4CrO5p3Ug?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10441.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15bfa4d9-427b-4f85-42b5-08dde950b55e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2025 12:11:40.5481
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s33s/G2x0EkfH+GnQ2xnKIyx06GCaqPkgM/Lnl/5WEXZhRlkD7yk69Dfu5mbmqQpLYrK2E6o/5qEvB/PsIZpuqoGSaxwIh8R4uy11zkaF80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB7975

Hi Mykola,

Mykola Kvach <xakep.amatop@gmail.com> writes:

> From: Mykola Kvach <mykola_kvach@epam.com>
>
> Add support for the PSCI SYSTEM_SUSPEND function in the vPSCI interface,
> allowing guests to request suspend via the PSCI v1.0 SYSTEM_SUSPEND call
> (both 32-bit and 64-bit variants).
>
> Implementation details:
> - Add SYSTEM_SUSPEND function IDs to PSCI definitions
> - Trap and handle SYSTEM_SUSPEND in vPSCI
> - Allow only non-hardware domains to invoke SYSTEM_SUSPEND; return
>   PSCI_NOT_SUPPORTED for the hardware domain to avoid halting the system
>   in hwdom_shutdown() via domain_shutdown
> - Require all secondary VCPUs of the calling domain to be offline before
>   suspend, as mandated by the PSCI specification
>
> The arch_domain_resume() function is an architecture-specific hook that i=
s
> invoked during domain resume to perform any necessary setup or restoratio=
n
> steps required by the platform.
>
> The new vpsci_vcpu_up_prepare() helper is called on the resume path to se=
t up
> the vCPU context (such as entry point, some system regs and context ID) b=
efore
> resuming a suspended guest. This keeps ARM/vPSCI-specific logic out of co=
mmon
> code and avoids intrusive changes to the generic resume flow.
>
> Usage:
>
> For Linux-based guests, suspend can be initiated with:
>     echo mem > /sys/power/state
> or via:
>     systemctl suspend
>
> Resuming the guest is performed from control domain using:
>       xl resume <domain>
>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

> ---
> Changes in v12:
> - Use the input vCPU from vpsci_vcpu_up_prepare function argument instead=
 of current.
> - Add a check for the wake_cpu pointer on resume.
> - Call arch_domain_resume() under shutdown_lock.
> - Drop redundant vgic_clear_pending_irqs() call from vpsci_vcpu_up_prepar=
e().
> - Cosmetic fixes.
>
> Changes in V11:
> - introduce arch_domain_resume() and vpsci_vcpu_up_prepare(), which are n=
ow
> called on the resume path to avoid extra modifications to common code.
> The vCPU context is now updated during domain resume.
>
> Changes in V10:
> - small changes to the commit message reflect updates introduced in this
>   version of the patch.
> - Comments are improved, clarified, and expanded, especially regarding PS=
CI
>   requirements and context handling.
> - An ARM-specific helper (domain_resume_nopause_helper)
> - gprintk() and PRIregister are used for logging in vPSCI code.
> - An isb() is added before p2m_save_state
> - The is_64bit_domain check is dropped when masking the upper part of ent=
ry
>   point and cid for SMC32 SYSTEM_SUSPEND PSCI calls
>
> Changes in V9:
> - no functional changes
> - cosmetic chnages after review
> - enhance commit message and add extra comment to the code after review
>
> Changes in V8:
> - GIC and virtual timer context must be saved when the domain suspends
> - rework locking
> - minor changes after code review
>
> Changes in V7:
> - add proper locking
> - minor changes after code review
>
> Changes in V6:
> - skip execution of ctxt_switch_from for vcpu that is in paused domain
> - add implementation of domain_resume without domain_pause
> - add helper function to determine if vcpu is suspended or not
> - ignore upper 32 bits of argument values when the domain is 64-bit
>   and calls the SMC32 SYSTEM_SUSPEND function
> - cosmetic changes after review
>
> Changes in V5:
> - don't use standby mode, restore execution in a provided by guest point
> - move checking that all CPUs, except current one, are offline to after
>   pausing the vCPUs
> - provide ret status from arch_domain_shutdown and handle it in
>   domain_shutdown
> - adjust VPSCI_NR_FUNCS to reflect the number of newly added PSCI functio=
ns
>
> Changes in V4:
> Dropped all changes related to watchdog, domain is marked as shutting
> down in domain_shutdown and watchdog timeout handler won't trigger
> because of it.
>
> Previous versions included code to manage Xen watchdog timers during susp=
end,
> but this was removed. When a guest OS starts the Xen watchdog (either via=
 the
> kernel driver or xenwatchdogd), it is responsible for managing that state
> across suspend/resume. On Linux, the Xen kernel driver properly stops the
> watchdog during suspend. However, when xenwatchdogd is used instead, susp=
end
> handling is incomplete, potentially leading to watchdog-triggered resets =
on
> resume. Xen leaves watchdog handling to the guest OS and its services.
>
> Dropped all changes related to VCPU context, because instead domain_shutd=
own
> is used, so we don't need any extra changes for suspending domain.
>
> Changes in V3:
> Dropped all domain flags and related code (which touched common functions=
 like
> vcpu_unblock), keeping only the necessary changes for Xen suspend/resume,=
 i.e.
> suspend/resume is now fully supported only for the hardware domain.
> Proper support for domU suspend/resume will be added in a future patch.
> This patch does not yet include VCPU context reset or domain context
> restoration in VCPU.
> ---
>  xen/arch/arm/domain.c                 |  37 ++++++++
>  xen/arch/arm/include/asm/domain.h     |   6 ++
>  xen/arch/arm/include/asm/perfc_defn.h |   1 +
>  xen/arch/arm/include/asm/psci.h       |   2 +
>  xen/arch/arm/include/asm/vpsci.h      |   5 +-
>  xen/arch/arm/vpsci.c                  | 116 +++++++++++++++++++++-----
>  xen/arch/ppc/stubs.c                  |   5 ++
>  xen/arch/riscv/stubs.c                |   5 ++
>  xen/arch/x86/domain.c                 |   5 ++
>  xen/common/domain.c                   |   9 ++
>  xen/include/xen/domain.h              |   2 +
>  11 files changed, 171 insertions(+), 22 deletions(-)
>
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 863ae18157..7d7358abe5 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -12,6 +12,8 @@
>  #include <xen/softirq.h>
>  #include <xen/wait.h>
> =20
> +#include <public/sched.h>
> +
>  #include <asm/arm64/sve.h>
>  #include <asm/cpuerrata.h>
>  #include <asm/cpufeature.h>
> @@ -27,6 +29,7 @@
>  #include <asm/tee/tee.h>
>  #include <asm/vfp.h>
>  #include <asm/vgic.h>
> +#include <asm/vpsci.h>
>  #include <asm/vtimer.h>
> =20
>  #include "vpci.h"
> @@ -880,6 +883,40 @@ void arch_domain_creation_finished(struct domain *d)
>      p2m_domain_creation_finished(d);
>  }
> =20
> +int arch_domain_resume(struct domain *d)
> +{
> +    int rc;
> +    typeof(d->arch.resume_ctx) *ctx =3D &d->arch.resume_ctx;
> +
> +    if ( !d->is_shutting_down || d->shutdown_code !=3D SHUTDOWN_suspend =
)
> +    {
> +        dprintk(XENLOG_WARNING,
> +                "%pd: Invalid domain state for resume: is_shutting_down=
=3D%d, shutdown_code=3D%d\n",
> +                d, d->is_shutting_down, d->shutdown_code);
> +        return -EINVAL;
> +    }
> +
> +    /*
> +     * It is still possible to call domain_shutdown() with a suspend rea=
son
> +     * via some hypercalls, such as SCHEDOP_shutdown or SCHEDOP_remote_s=
hutdown.
> +     * In these cases, the resume context will be empty.
> +     * This is not expected to cause any issues, so we just warn about t=
he
> +     * situation and return without error, allowing the existing logic t=
o
> +     * proceed as expected.
> +     */
> +    if ( !ctx->wake_cpu )
> +    {
> +        dprintk(XENLOG_WARNING, "%pd: Invalid wake CPU pointer for resum=
e\n",
> +                d);
> +        return 0;
> +    }
> +
> +    rc =3D vpsci_vcpu_up_prepare(ctx->wake_cpu , ctx->ep, ctx->cid);
> +    memset(ctx, 0, sizeof(*ctx));
> +
> +    return rc;
> +}
> +
>  static int is_guest_pv32_psr(uint32_t psr)
>  {
>      switch (psr & PSR_MODE_MASK)
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm=
/domain.h
> index a3487ca713..68185fc4d6 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -121,6 +121,12 @@ struct arch_domain
>      void *tee;
>  #endif
> =20
> +    struct resume_info {
> +        register_t ep;
> +        register_t cid;
> +        struct vcpu *wake_cpu;
> +    } resume_ctx;
> +
>  }  __cacheline_aligned;
> =20
>  struct arch_vcpu
> diff --git a/xen/arch/arm/include/asm/perfc_defn.h b/xen/arch/arm/include=
/asm/perfc_defn.h
> index effd25b69e..8dfcac7e3b 100644
> --- a/xen/arch/arm/include/asm/perfc_defn.h
> +++ b/xen/arch/arm/include/asm/perfc_defn.h
> @@ -33,6 +33,7 @@ PERFCOUNTER(vpsci_system_reset,        "vpsci: system_r=
eset")
>  PERFCOUNTER(vpsci_cpu_suspend,         "vpsci: cpu_suspend")
>  PERFCOUNTER(vpsci_cpu_affinity_info,   "vpsci: cpu_affinity_info")
>  PERFCOUNTER(vpsci_features,            "vpsci: features")
> +PERFCOUNTER(vpsci_system_suspend,      "vpsci: system_suspend")
> =20
>  PERFCOUNTER(vcpu_kick,                 "vcpu: notify other vcpu")
> =20
> diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/p=
sci.h
> index 4780972621..48a93e6b79 100644
> --- a/xen/arch/arm/include/asm/psci.h
> +++ b/xen/arch/arm/include/asm/psci.h
> @@ -47,10 +47,12 @@ void call_psci_system_reset(void);
>  #define PSCI_0_2_FN32_SYSTEM_OFF          PSCI_0_2_FN32(8)
>  #define PSCI_0_2_FN32_SYSTEM_RESET        PSCI_0_2_FN32(9)
>  #define PSCI_1_0_FN32_PSCI_FEATURES       PSCI_0_2_FN32(10)
> +#define PSCI_1_0_FN32_SYSTEM_SUSPEND      PSCI_0_2_FN32(14)
> =20
>  #define PSCI_0_2_FN64_CPU_SUSPEND         PSCI_0_2_FN64(1)
>  #define PSCI_0_2_FN64_CPU_ON              PSCI_0_2_FN64(3)
>  #define PSCI_0_2_FN64_AFFINITY_INFO       PSCI_0_2_FN64(4)
> +#define PSCI_1_0_FN64_SYSTEM_SUSPEND      PSCI_0_2_FN64(14)
> =20
>  /* PSCI v0.2 affinity level state returned by AFFINITY_INFO */
>  #define PSCI_0_2_AFFINITY_LEVEL_ON      0
> diff --git a/xen/arch/arm/include/asm/vpsci.h b/xen/arch/arm/include/asm/=
vpsci.h
> index 0cca5e6830..d790ab3715 100644
> --- a/xen/arch/arm/include/asm/vpsci.h
> +++ b/xen/arch/arm/include/asm/vpsci.h
> @@ -23,12 +23,15 @@
>  #include <asm/psci.h>
> =20
>  /* Number of function implemented by virtual PSCI (only 0.2 or later) */
> -#define VPSCI_NR_FUNCS  12
> +#define VPSCI_NR_FUNCS  14
> =20
>  /* Functions handle PSCI calls from the guests */
>  bool do_vpsci_0_1_call(struct cpu_user_regs *regs, uint32_t fid);
>  bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid);
> =20
> +int vpsci_vcpu_up_prepare(struct vcpu *v, register_t entry_point,
> +                          register_t context_id);
> +
>  #endif /* __ASM_VPSCI_H__ */
> =20
>  /*
> diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> index 7ba9ccd94b..22c3a5f544 100644
> --- a/xen/arch/arm/vpsci.c
> +++ b/xen/arch/arm/vpsci.c
> @@ -10,32 +10,16 @@
> =20
>  #include <public/sched.h>
> =20
> -static int do_common_cpu_on(register_t target_cpu, register_t entry_poin=
t,
> -                            register_t context_id)
> +int vpsci_vcpu_up_prepare(struct vcpu *v, register_t entry_point,
> +                   register_t context_id)
>  {
> -    struct vcpu *v;
> -    struct domain *d =3D current->domain;
> -    struct vcpu_guest_context *ctxt;
>      int rc;
> +    struct domain *d =3D v->domain;
>      bool is_thumb =3D entry_point & 1;
> -    register_t vcpuid;
> -
> -    vcpuid =3D vaffinity_to_vcpuid(target_cpu);
> -
> -    if ( (v =3D domain_vcpu(d, vcpuid)) =3D=3D NULL )
> -        return PSCI_INVALID_PARAMETERS;
> -
> -    /* THUMB set is not allowed with 64-bit domain */
> -    if ( is_64bit_domain(d) && is_thumb )
> -        return PSCI_INVALID_ADDRESS;
> -
> -    if ( !test_bit(_VPF_down, &v->pause_flags) )
> -        return PSCI_ALREADY_ON;
> +    struct vcpu_guest_context *ctxt;
> =20
>      if ( (ctxt =3D alloc_vcpu_guest_context()) =3D=3D NULL )
> -        return PSCI_DENIED;
> -
> -    vgic_clear_pending_irqs(v);
> +        return -ENOMEM;
> =20
>      memset(ctxt, 0, sizeof(*ctxt));
>      ctxt->user_regs.pc64 =3D (u64) entry_point;
> @@ -76,8 +60,37 @@ static int do_common_cpu_on(register_t target_cpu, reg=
ister_t entry_point,
>      free_vcpu_guest_context(ctxt);
> =20
>      if ( rc < 0 )
> +        return rc;
> +
> +    return 0;
> +}
> +
> +static int do_common_cpu_on(register_t target_cpu, register_t entry_poin=
t,
> +                            register_t context_id)
> +{
> +    struct vcpu *v;
> +    struct domain *d =3D current->domain;
> +    int rc;
> +    bool is_thumb =3D entry_point & 1;
> +    register_t vcpuid;
> +
> +    vcpuid =3D vaffinity_to_vcpuid(target_cpu);
> +
> +    if ( (v =3D domain_vcpu(d, vcpuid)) =3D=3D NULL )
> +        return PSCI_INVALID_PARAMETERS;
> +
> +    /* THUMB set is not allowed with 64-bit domain */
> +    if ( is_64bit_domain(d) && is_thumb )
> +        return PSCI_INVALID_ADDRESS;
> +
> +    if ( !test_bit(_VPF_down, &v->pause_flags) )
> +        return PSCI_ALREADY_ON;
> +
> +    rc =3D vpsci_vcpu_up_prepare(v, entry_point, context_id);
> +    if ( rc )
>          return PSCI_DENIED;
> =20
> +    vgic_clear_pending_irqs(v);
>      vcpu_wake(v);
> =20
>      return PSCI_SUCCESS;
> @@ -197,6 +210,48 @@ static void do_psci_0_2_system_reset(void)
>      domain_shutdown(d,SHUTDOWN_reboot);
>  }
> =20
> +static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t =
cid)
> +{
> +    int32_t rc;
> +    struct vcpu *v;
> +    struct domain *d =3D current->domain;
> +    bool is_thumb =3D epoint & 1;
> +
> +    /* THUMB set is not allowed with 64-bit domain */
> +    if ( is_64bit_domain(d) && is_thumb )
> +        return PSCI_INVALID_ADDRESS;
> +
> +    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
> +    if ( is_hardware_domain(d) )
> +        return PSCI_NOT_SUPPORTED;
> +
> +    /* Ensure that all CPUs other than the calling one are offline */
> +    domain_lock(d);
> +    for_each_vcpu ( d, v )
> +    {
> +        if ( v !=3D current && is_vcpu_online(v) )
> +        {
> +            domain_unlock(d);
> +            return PSCI_DENIED;
> +        }
> +    }
> +    domain_unlock(d);
> +
> +    rc =3D domain_shutdown(d, SHUTDOWN_suspend);
> +    if ( rc )
> +        return PSCI_DENIED;
> +
> +    d->arch.resume_ctx.ep =3D epoint;
> +    d->arch.resume_ctx.cid =3D cid;
> +    d->arch.resume_ctx.wake_cpu =3D current;
> +
> +    gprintk(XENLOG_DEBUG,
> +            "SYSTEM_SUSPEND requested, epoint=3D0x%"PRIregister", cid=3D=
0x%"PRIregister"\n",
> +            epoint, cid);
> +
> +    return rc;
> +}
> +
>  static int32_t do_psci_1_0_features(uint32_t psci_func_id)
>  {
>      /* /!\ Ordered by function ID and not name */
> @@ -214,6 +269,8 @@ static int32_t do_psci_1_0_features(uint32_t psci_fun=
c_id)
>      case PSCI_0_2_FN32_SYSTEM_OFF:
>      case PSCI_0_2_FN32_SYSTEM_RESET:
>      case PSCI_1_0_FN32_PSCI_FEATURES:
> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
>      case ARM_SMCCC_VERSION_FID:
>          return 0;
>      default:
> @@ -344,6 +401,23 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, u=
int32_t fid)
>          return true;
>      }
> =20
> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> +    {
> +        register_t epoint =3D PSCI_ARG(regs, 1);
> +        register_t cid =3D PSCI_ARG(regs, 2);
> +
> +        if ( fid =3D=3D PSCI_1_0_FN32_SYSTEM_SUSPEND )
> +        {
> +            epoint &=3D GENMASK(31, 0);
> +            cid &=3D GENMASK(31, 0);
> +        }
> +
> +        perfc_incr(vpsci_system_suspend);
> +        PSCI_SET_RESULT(regs, do_psci_1_0_system_suspend(epoint, cid));
> +        return true;
> +    }
> +
>      default:
>          return false;
>      }
> diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
> index bdaf474c5c..0db0627b5c 100644
> --- a/xen/arch/ppc/stubs.c
> +++ b/xen/arch/ppc/stubs.c
> @@ -224,6 +224,11 @@ void arch_domain_creation_finished(struct domain *d)
>      BUG_ON("unimplemented");
>  }
> =20
> +int arch_domain_resume(struct domain *d)
> +{
> +    return 0;
> +}
> +
>  int arch_set_info_guest(struct vcpu *v, vcpu_guest_context_u c)
>  {
>      BUG_ON("unimplemented");
> diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
> index 1a8c86cd8d..52532ae14d 100644
> --- a/xen/arch/riscv/stubs.c
> +++ b/xen/arch/riscv/stubs.c
> @@ -198,6 +198,11 @@ void arch_domain_creation_finished(struct domain *d)
>      BUG_ON("unimplemented");
>  }
> =20
> +int arch_domain_resume(struct domain *d)
> +{
> +    return 0;
> +}
> +
>  int arch_set_info_guest(struct vcpu *v, vcpu_guest_context_u c)
>  {
>      BUG_ON("unimplemented");
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 19fd86ce88..94a06bc697 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1138,6 +1138,11 @@ void arch_domain_creation_finished(struct domain *=
d)
>          hvm_domain_creation_finished(d);
>  }
> =20
> +int arch_domain_resume(struct domain *d)
> +{
> +    return 0;
> +}
> +
>  #ifdef CONFIG_COMPAT
>  #define xen_vcpu_guest_context vcpu_guest_context
>  #define fpu_ctxt fpu_ctxt.x
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 104e917f07..667017c5e1 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1352,6 +1352,7 @@ int domain_shutdown(struct domain *d, u8 reason)
>  void domain_resume(struct domain *d)
>  {
>      struct vcpu *v;
> +    int rc;
> =20
>      /*
>       * Some code paths assume that shutdown status does not get reset un=
der
> @@ -1361,6 +1362,13 @@ void domain_resume(struct domain *d)
> =20
>      spin_lock(&d->shutdown_lock);
> =20
> +    rc =3D arch_domain_resume(d);
> +    if ( rc )
> +    {
> +        printk("%pd: Failed to resume domain (ret %d)\n", d, rc);
> +        goto fail;
> +    }
> +
>      d->is_shutting_down =3D d->is_shut_down =3D 0;
>      d->shutdown_code =3D SHUTDOWN_CODE_INVALID;
> =20
> @@ -1371,6 +1379,7 @@ void domain_resume(struct domain *d)
>          v->paused_for_shutdown =3D 0;
>      }
> =20
> + fail:
>      spin_unlock(&d->shutdown_lock);
> =20
>      domain_unpause(d);
> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> index e10baf2615..5f77ffadf1 100644
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -109,6 +109,8 @@ int arch_domain_soft_reset(struct domain *d);
> =20
>  void arch_domain_creation_finished(struct domain *d);
> =20
> +int arch_domain_resume(struct domain *d);
> +
>  void arch_p2m_set_access_required(struct domain *d, bool access_required=
);
> =20
>  int arch_set_info_guest(struct vcpu *v, vcpu_guest_context_u c);

--=20
WBR, Volodymyr=

