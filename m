Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3A3B0EF7C
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 12:13:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053706.1422499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueWT4-0003Vo-Gf; Wed, 23 Jul 2025 10:12:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053706.1422499; Wed, 23 Jul 2025 10:12:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueWT4-0003Sh-DK; Wed, 23 Jul 2025 10:12:58 +0000
Received: by outflank-mailman (input) for mailman id 1053706;
 Wed, 23 Jul 2025 10:12:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VoQP=2E=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ueWT2-0003Sb-5Y
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 10:12:56 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90ed514f-67ad-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 12:12:40 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AM7PR03MB6181.eurprd03.prod.outlook.com (2603:10a6:20b:142::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 10:12:37 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 10:12:37 +0000
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
X-Inumbo-ID: 90ed514f-67ad-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VbimDJb3idbmf1Dtf2oCUoehL/nSKZ+bfeEVrdgf05uqwGvFRtg2tod+I8/LrUvLUJGDXps90TIqRYJeTsOuA8p4lXm5ee45GREFKkccSO2M/aJNIgSGE02Vjrg6Sawe1ORupBlT9XUmikQRnidJTzabCCd0uv3j3Kbq7nxrVKxaXVJWTdPIAgQYlFxhXexPHpxjHs2u0cR2LlzCxY9X1MMoCLtFI4Hl3PRW6x7ZEI1yqj8RoV6EJWZUFKKvqH5t85GlyqCjilESQ3rHaErRY176m9dd9hI6qex2vZLoTNo3Wj2Qp3XESDCTRY2Qr1FfJHgeLlaayi1nnPIwd1uqRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q92v1pCm6S2Br2fMjiq7JPpN6k4H6NNaOknTMgJ6qc4=;
 b=CzmjwPKo5jdjxgPcOA/2TFaEkFzRgPd6iEzXEUwSubnZmB8OrS8baWJ2SfJQC0hHv2Ike49LRxOqx3Il9xC/CpP9jbM9YDWJLtQYz43dJZtx8P7YG4ezr3Nrh7hs33HQ1MGSrksRFxtEnc6T3CuLSFfMOWUFKxfK2jFqlf5CaGC+jeNrdiwvZXsLuA1dwhv5Dtq5gyGi1gqNUoxFWHuQxe7VdPJ5VZpieDf/Y9HjTH1wFUxYcPWcxrKaNgNbE06zZk0pbYqDlFIm41aek+bFeHQwauv5S6KJjytpPkq9P7qHx8rUBq2Dj+4g77IXgfUPEQh+8jST0s0I2xQnPI4CMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q92v1pCm6S2Br2fMjiq7JPpN6k4H6NNaOknTMgJ6qc4=;
 b=Y69HxpznYfMJ9utU44X8DCTNNUYct9aEGIGZf9fZicIRq3MUpsKr1ByclkWKdXK1wKhmbUlmNoh4N51hDgwSyknQhlhLL3+e0iUhvO0uES1wsSR9SPsMV/d8KLF/cB1BGPtIsRzUKd/sWUQuZc6QLiRQwBKfo58Q8JzA9ACg3hpM2d7NpJuOBa/xbSQz/kX1R5CyD+jxABF+Eqzbw8TK9w4a9T3iru5G7j50kMfE816icAjWmQbr+7W2+1z+HJSym5YUPgcvHTW0Vsn3VpVjthICDaZG7GWP19tOmI5gw4ZYn41PsquG+N9lX01Ak0ceq4oh1Od3wAR+d/h5aCVG9w==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>, Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>
Subject: [PATCH] misra: address MISRA C Rule 18.3 compliance
Thread-Topic: [PATCH] misra: address MISRA C Rule 18.3 compliance
Thread-Index: AQHb+7pQeGfsWWy0sUade1ju+9GDKg==
Date: Wed, 23 Jul 2025 10:12:37 +0000
Message-ID:
 <c9fb095c43edfedfd6174284bac404ec9ae5523d.1753263957.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AM7PR03MB6181:EE_
x-ms-office365-filtering-correlation-id: c1b53788-c8c6-4b92-5eef-08ddc9d17314
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?iPxQurHhqBU+220c8NKwhCZO1++01TS2aCKhkJQtKBo7d4u40ygb7C+BUv?=
 =?iso-8859-1?Q?mdk9pf/igm0SlTEkD7RZWQsk5PwDMv9W51P+xzDQIFfAXPZF088Q4WHSaw?=
 =?iso-8859-1?Q?AU3Q98h8GONwZ0hmrr+4jUS6d9oaOn5wtVCv41pU2pHm/PwcGT499Jbu7S?=
 =?iso-8859-1?Q?KfIS/HXLcy/FQMdk5gDAWlmgIBiqUDLq35k1m0D1ImN1+fWN6MesjUZcqQ?=
 =?iso-8859-1?Q?RLG21iqWwvfZQtjI/rhMeSu0i3Gs54q3KY/5oMVruGgvyAsfApxsyIpaxS?=
 =?iso-8859-1?Q?C7VC/N7vDV5krYAYH24jrSXpEvu9/JSnQY9kYl2+qJ9wDnYrLsevWcp4EW?=
 =?iso-8859-1?Q?npZuIkDgd+5qUlemtqbqOr61bW8KJsU0Gxmdp7241ZKI3bQyYWyv84diAJ?=
 =?iso-8859-1?Q?q02ufOO1yx6khjiIhiJx05L7ashaF8kyGxCjVO4pdhEbMQfMcPOxmp29S1?=
 =?iso-8859-1?Q?RbqZH6ssqDtk0aIEdzMPp66hUf8zNUGYFTN6WBdwG7qXotaAxvPa4mcaVg?=
 =?iso-8859-1?Q?9YbK9dRFN8ZEn4jcuKjsGZFGl+vVdHDv5/rk/8px4bDOuujNjW1aEyvtpL?=
 =?iso-8859-1?Q?r/y4l1mY2uB9Aft0Gj36iANdA0PIQjLDngSsu/Dn1Y28MI9/L2AMkgqwBz?=
 =?iso-8859-1?Q?DeIL+hsk32VcjdAAxIp3KXUXCZG60DvlvXzivbiTP3VW899jVVef4szIgU?=
 =?iso-8859-1?Q?6SXlSb4IJrwKnqUf6KOf8w2Kp9ZDImlCVDkW8YTj6u/o9aI3J2XO0D/L/N?=
 =?iso-8859-1?Q?H+RNyF+rp/SKWMzTxwVNPqgb1MjpHVW3Xc2zWXW4Vnr2aHGaOKHXNd/32G?=
 =?iso-8859-1?Q?sGYUHIDF5W3V537KdbehwWg2cS7/xgG+/Xq34dpbGvLnymu3VBHQdQWl/8?=
 =?iso-8859-1?Q?2wg8Cy4sIyblfMdIelbiePXJtJ3ck9qmLW1dOuUncLcwTTbWu1Ux4WsAjT?=
 =?iso-8859-1?Q?UJfF/6OnIlwxtWWOgEA3xo1327A2xzZEvM96j6opR17BSGx3XN3LbE7gw0?=
 =?iso-8859-1?Q?0l8skzPL4mfqptloSkRGvxqM5yrZrGv7AhNpdfeZma2C7RMuquWO1FshVF?=
 =?iso-8859-1?Q?9XvJMkdk4fiXDAbxzKzXHi/gDgKjt6Nn7RcXpUfKwwEMSTcqpychXf8aNE?=
 =?iso-8859-1?Q?dwwdtDWo9asCF9u86/mvxJCi0lfhbT3zu56Hita6cmCUPDITS8PmxWoqMf?=
 =?iso-8859-1?Q?R53gAOi4NftgYvecC7QnnCHlaG7Yq+udOmBN37lZZoh/LxNtKW+YYVLF23?=
 =?iso-8859-1?Q?AfJpb2wPXkVF/MC0x+rJc8zk+O5g8hlXbKwLbtENaBlDXm9ogA1H/GIhb5?=
 =?iso-8859-1?Q?yZmrPocRbRQw4UtI9Xjf0aWQPz1Sw+Qr9Cn5PoSMyJ7tH1Ii80RHaL1klm?=
 =?iso-8859-1?Q?2CC1XiFgoXC/QLLUYo8a7k+7TmY+jzg9I7sEwsi3tHcL6be2l+9NLmG2XY?=
 =?iso-8859-1?Q?eauQ9gobOkck1oGl+n9RAeL1/j7QCjESlTGLVEEIXiakG9SPPCoss7zoMl?=
 =?iso-8859-1?Q?eNd9Q9qJjCklssq+uRuEwfttCHWlEsJF0wTAS1HWjTXhv6T7zy0iAIwhq3?=
 =?iso-8859-1?Q?O/v0FIk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?XuzjB2gFjV6bblXVXDtscpPj+B6p74Ua1qLujva/LmOw4JvJEJNU2nijPb?=
 =?iso-8859-1?Q?iloSbNM8qS9aG5Zpp3U7FJj7JUMi4xxOTmbIIRcxYJ8RQ0nsFXOb8wCuct?=
 =?iso-8859-1?Q?fm3duLti6r4vcwhgK99IMEw49teBNEHLR551sL2ek4cSrRUwL6H6+fHUu7?=
 =?iso-8859-1?Q?boQ/+FE9llCxsYHgN8rrbA6vPAcKlUl8zkOMc0rCjiTStEUvOapmfh1cgm?=
 =?iso-8859-1?Q?gOmmYB+AEpyfjSjJpz0DU9rKKcrD3pPdF7KJ0GSi2P6chUF5ZDGUOhYVVx?=
 =?iso-8859-1?Q?jL+oOGEs3iqdUyqlHn4K6iruRR/froyUQKSExnYBPP1IoMQG41b5OS2ISZ?=
 =?iso-8859-1?Q?H/HMGfN5zb9Ya+0AYqWIOfaRvMJ4A3Jq4pBvr2gRcJE9HdBtC553mMV5EK?=
 =?iso-8859-1?Q?QwrwEYHwvDlae9+cQFoHBqt4ArUiRZNOoNf6BPnatCE8d+oRTcwMx+SK5v?=
 =?iso-8859-1?Q?7SmiuAUcI4b6MoHGNS/jmR3WaCb/nyUGkeWZHPROXM+qPdDDwblQ1dVbJ7?=
 =?iso-8859-1?Q?+UIZL9d8DJ5PU+lekUJXQ0DxDwuVgOWZzswrcniSZ824lKYCmQPL7+4d60?=
 =?iso-8859-1?Q?aHIEV6VdvfwhWeTPTirzcOJvF4KPhoCye9JN9QdN/szM63him9yPrsU2xr?=
 =?iso-8859-1?Q?WLCc+/6KATBdI6dSdihL1HVIlnnb1yJIAIh3F4uabjQFg8Gw/kP+fd9lwf?=
 =?iso-8859-1?Q?Mr57x/XfjC94UN1EnZCnM0XS/jvwsqV+E2FL9YuzoHaAqgX1B2ddp7YmuF?=
 =?iso-8859-1?Q?G4It5NkrUScgj5v5nPmlYi80nnTLIz1FAEFoC/BVMwF+bwq46DEYr56Aim?=
 =?iso-8859-1?Q?weumXLaD8VuvziETANy6X2daTUr9FxGbtj9SocYPo+pfLT8LkDRAUUfmjQ?=
 =?iso-8859-1?Q?2gw8djcmbCDNwVTaih4Bxw4AYk0gD7cTTUUPw9D90pfP2aD+eRly/a2sju?=
 =?iso-8859-1?Q?9efojQczWsVX7SlKpJpjpppR0+n908t58BfI4crJZaYhgRacRTrz+7VWpo?=
 =?iso-8859-1?Q?SNm5ijl5GdIjL2ZXuMVhvBo4P7QvoV9thWzZgRhbFblSULNiqoKVHR4wEr?=
 =?iso-8859-1?Q?gEo3tLEoaVrrsYEzlSqhhYtFnVcFsq4+/FXny2j5Lnthg5eKdQeRReARvC?=
 =?iso-8859-1?Q?z/lyBQa2/6kR71ApVMj8TH/yx47zY8fIIsok/c5mDfnlt+iST1FybcXbbz?=
 =?iso-8859-1?Q?JvQJwYRu4wB7xm3+ZGZx+RXB3HEhU6q4PAJ9UFx7GfebhZWXtfMwpaZ33L?=
 =?iso-8859-1?Q?/R354bYNpmX8QF0/8iz6coEILn3lBJ47CDgTrrsBUq9upajli44hqJYmVA?=
 =?iso-8859-1?Q?C7InUDrLF757kTxD3Cpuxj9I7FTXkbplhN/3imBe3sWwmfxdgrD8SD/I8B?=
 =?iso-8859-1?Q?xv4F0Z3kWYlKhvtwx4azVznnVdEFLBVj0Fl48LSBtlmajhLcllaK1waGsj?=
 =?iso-8859-1?Q?ikGK0XUZCrBq+4+S+UMZdBTJa4aXxExaXB7WkNY8Ubw2FV1W+bF6A7QIer?=
 =?iso-8859-1?Q?dcBvHfbuV8Iuly9B3ZIg+y5crFFWePY2WB6QXS0OrCkOozaJOA9c7VQEA1?=
 =?iso-8859-1?Q?vnSkQm8RdeGyonUu20sf2j1EZ1RxaPbI8U3smxMgBh5jygp5JpfgJ0nDUb?=
 =?iso-8859-1?Q?9tlB+UJyR86nq5j5JqLublyPk6l9SnPzMAbvNMeuzOP3E3T9Ii294Zfw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b53788-c8c6-4b92-5eef-08ddc9d17314
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 10:12:37.2390
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s505CM7FAC8CaoD2Y1i4FK0XPMiE7mDb/hstnZE90McW2UENZIy/+pDFfNu0liyZWMevxSXiUkm3z/ExWQotQQNC60W7enwc0DuLeWG+izY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6181

Rule 18.3: "The relational operators >, >=3D, < and <=3D
shall not be applied to objects of pointer type
except where they point into the same object".

Update relational comparison to cast `text_start`
(void pointer) to `unsigned long`. This ensures the
comparison occurs between two values of the same integral type.

Update relational comparison between `lock1` and `lock2` to cast
pointers to `uintptr_t`. This ensures MISRA C compliance and avoids
undefined behavior when comparing pointer values directly.

Update for-loop condition to cast pointers `p` and `params->checksum`
to `uintptr_t` for the relational `<` operator. This resolves a MISRA C 18.=
3
violation by ensuring that relational operations are not performed directly
on pointers of different objects (which is undefined behavior).

Add Rule 18.3 deviations.

Add Rule 18.3 to the monitored set.

No functional changes to program behavior.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
This patch eliminates MISRA C Rule 18.3 violations for both ARM and X86.

Test CI: https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/1=
943306650
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 8 ++++++++
 automation/eclair_analysis/ECLAIR/monitored.ecl  | 1 +
 xen/arch/x86/efi/efi-boot.h                      | 3 ++-
 xen/common/sched/core.c                          | 2 +-
 xen/common/virtual_region.c                      | 4 ++--
 5 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 483507e7b9..d89834a49b 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -568,6 +568,14 @@ C99 Undefined Behaviour 45: Pointers that do not point=
 into, or just beyond, the
 -config=3DMC3A2.R18.2,reports+=3D{safe, "any_area(any_loc(any_exp(macro(^p=
age_to_mfn$))))"}
 -doc_end
=20
+-doc_begin=3D"Consider relational pointer comparisons in kernel-related se=
ctions as safe and compliant."
+-config=3DMC3R1.R18.3,reports+=3D{safe, "any_area(any_loc(any_exp(macro(na=
me(is_kernel||is_kernel_text||is_kernel_rodata||is_kernel_inittext)))))"}
+-doc_end
+
+-doc_begin=3D"Allow deviations for pointer comparisons in BUG_ON and ASSER=
T macros, treating them as safe for debugging and validation."
+-config=3DMC3R1.R18.3,reports+=3D{safe, "any_area(any_loc(any_exp(macro(na=
me(BUG_ON||ASSERT)))))"}
+-doc_end
+
 -doc_begin=3D"Flexible array members are deliberately used and XEN develop=
ers are aware of the dangers related to them:
 unexpected result when the structure is given as argument to a sizeof() op=
erator and the truncation in assignment between structures."
 -config=3DMC3A2.R18.7,reports+=3D{deliberate, "any()"}
diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl b/automation/e=
clair_analysis/ECLAIR/monitored.ecl
index 00bff9edbe..b8fb297e73 100644
--- a/automation/eclair_analysis/ECLAIR/monitored.ecl
+++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
@@ -68,6 +68,7 @@
 -enable=3DMC3A2.R17.6
 -enable=3DMC3A2.R18.1
 -enable=3DMC3A2.R18.2
+-enable=3DMC3A2.R18.3
 -enable=3DMC3A2.R18.6
 -enable=3DMC3A2.R18.8
 -enable=3DMC3A2.R19.1
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 0194720003..170c569eb4 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -461,7 +461,8 @@ static void __init efi_arch_edd(void)
                 params->device_path_info_length =3D
                     sizeof(struct edd_device_params) -
                     offsetof(struct edd_device_params, key);
-                for ( p =3D (const u8 *)&params->key; p < &params->checksu=
m; ++p )
+                for ( p =3D (const u8 *)&params->key;
+                      (uintptr_t)p < (uintptr_t)&params->checksum; ++p )
                     params->checksum -=3D *p;
                 break;
             case MEDIA_DEVICE_PATH:
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index ea95dea65a..c3c101c142 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -360,7 +360,7 @@ static always_inline void sched_spin_lock_double(
     {
         *flags =3D _spin_lock_irqsave(lock1);
     }
-    else if ( lock1 < lock2 )
+    else if ( (uintptr_t)lock1 < (uintptr_t)lock2 )
     {
         *flags =3D _spin_lock_irqsave(lock1);
         _spin_lock(lock2);
diff --git a/xen/common/virtual_region.c b/xen/common/virtual_region.c
index 1dc2e9f592..515751b6c3 100644
--- a/xen/common/virtual_region.c
+++ b/xen/common/virtual_region.c
@@ -83,8 +83,8 @@ const struct virtual_region *find_text_region(unsigned lo=
ng addr)
     rcu_read_lock(&rcu_virtual_region_lock);
     list_for_each_entry_rcu ( iter, &virtual_region_list, list )
     {
-        if ( (void *)addr >=3D iter->text_start &&
-             (void *)addr <  iter->text_end )
+        if ( addr >=3D (unsigned long)iter->text_start &&
+             addr <  (unsigned long)iter->text_end )
         {
             region =3D iter;
             break;
--=20
2.43.0

