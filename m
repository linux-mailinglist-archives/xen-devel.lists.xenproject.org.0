Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1312AB3310B
	for <lists+xen-devel@lfdr.de>; Sun, 24 Aug 2025 16:57:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1092080.1448145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqC8p-0007rx-Pr; Sun, 24 Aug 2025 14:56:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1092080.1448145; Sun, 24 Aug 2025 14:56:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqC8p-0007po-Jv; Sun, 24 Aug 2025 14:56:19 +0000
Received: by outflank-mailman (input) for mailman id 1092080;
 Sun, 24 Aug 2025 14:56:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=epLo=3E=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uqC8n-0007pR-Qq
 for xen-devel@lists.xenproject.org; Sun, 24 Aug 2025 14:56:18 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c830f54-80fa-11f0-a32c-13f23c93f187;
 Sun, 24 Aug 2025 16:56:16 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by DBBPR03MB7129.eurprd03.prod.outlook.com (2603:10a6:10:206::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Sun, 24 Aug
 2025 14:56:13 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9052.019; Sun, 24 Aug 2025
 14:56:13 +0000
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
X-Inumbo-ID: 7c830f54-80fa-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=grUTdrHuHkQJM7MkLbLw0vof8x4GxzM9K813KtknkkgRng/tBNOB+wb2dTT51jL0bR//WwlZso3p6151gSfkrbUP5b2jcIJAJr5CEQoPc6bVPm1m1Q4gP2bZvc/ekTn6jaa3SX4OJ6Mpn1QccK7xv7N0R5wBz0OUD8wtU1x+6J8yGT4U/lT4ljsOv+eWkqXMhT++LxvUurdhU0mTUEb7tGcBr7iWX7TaMETgCG/phV/jPpBktww5rw6Xuc2OtwbV/BmKdOvMcQu4V+UeBvr0i87J1pcmICTMvIrRDFKgf/Z8XnKGY5Glz9nQiYaolS2kkOJ8+7cq6fZFxjbLhOOuzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RYqMlulOmq2nt5G3ZsDWgSowqxIvFczl7k3DFX8P8Ao=;
 b=EOACfc8mWc8Ax3WikVeuGRQ7wuw8YOdG2nCmICNuSg6C7uax+5etfXcusJXLP2xuz/lAtxZ6t/FQuxYNqlv0wsix2xIeRpP5Qv+QvTP5fNb2sfI0AzD25aGsPBCo+2Ns3wm2m9oUk9oAjqS1rChTKJbVdVQtZHwY9XoGb+fKchigS3UYRhRsCoyhEMNV39YlpXaLErEDyqiHvF2mkHmwy1s0xYwb9Q2T8cWN5aR4YzorqJRuK/3+G9VdWYz+bRkmD9VVdGuFhltRkYhm8beFmt90dK2iIzWL0YLG4NKs3pIXthaTgQw1obZGFTIcUYBsFtTYyumXZlYQp6IFApbsbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYqMlulOmq2nt5G3ZsDWgSowqxIvFczl7k3DFX8P8Ao=;
 b=dggjMZ0XhNIiOWZaR0M86tDLDWXRU1Qx1YmNDEqNne1Dw8uZ7P0Hhhsyov3oOf4PnFC8emXd2HSlF7bqmxDU79jV9iANR5UAKKRddo0lcyyxzGids6dEbZAtM//xcnJJb1QPm45qdO83t7T66Ic9Z2aHr7YOrflKZ7ySvfhhMLeuh9KmgYnzaNYSAhrwbnJgYTYtfvNolpefPiNWT8WBUmawSWDdeeBfWbDWcAuNSjMQieMEBxUXO6Gr25UyNkIPAw5d4Z+bOGLs9wrvf907q8wgPrHytffqXAsqm64K04aZnV/J0BdtkvAQMUPqvoO3zu+uev1odvd5FKdV+c1szQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH] misra: add deviation of Rule 2.1 for BUG() macro
Thread-Topic: [PATCH] misra: add deviation of Rule 2.1 for BUG() macro
Thread-Index: AQHcFQc77bBOPokbA0m9oV6J6fEgkA==
Date: Sun, 24 Aug 2025 14:56:12 +0000
Message-ID:
 <f7b4112aad84162c25f96a9d6db43a0c2ba85daa.1756046023.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|DBBPR03MB7129:EE_
x-ms-office365-filtering-correlation-id: 3d42f09e-ad68-4ddd-6b3b-08dde31e5e89
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|42112799006|13003099007|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?0h95LBYrk08Jxjuq6NKXKEaCP9R3c/16Q7hK+P5O8/AhLNc8/R9fsmsfCF?=
 =?iso-8859-1?Q?ilEU4a9vEG8zHTxtsQhubd66mzGpT96eNMJoz5ujqhFExzjUR9PVPiaaZr?=
 =?iso-8859-1?Q?jBxKz4j1Nb1FV06VRW1q1lhOVoAvfFjXEZPhcUUOwo4AVNOVGgJK3TrbEu?=
 =?iso-8859-1?Q?SKvMUcobFJHgxF0YYa991DEIUZx3LytZjUYYXyvur3FqSKLZ4eSkhUf70/?=
 =?iso-8859-1?Q?ubU+sUsNtaUsMSkYxHKJYhJGDG904BLVDRAFgb/vN30H0d9rRNEDXcTI0N?=
 =?iso-8859-1?Q?HiV3+dj/rZHKbHXjNK7qLAOics+CEbAeR2PXxGpv48ZCfwRWifNLxLyjk1?=
 =?iso-8859-1?Q?cTHD+rm0LnkW4Q2SuQNgZGczNW1YGKA3S8UWjexESbDgxq4hFUVbFVAd7T?=
 =?iso-8859-1?Q?aR0awm1s3V8Vh5O5izwP7LsBzrhAi/i0sYYa3J9RB7tjzyzu1HF2FjmHJ/?=
 =?iso-8859-1?Q?MVSe25hsKsqf+i/+Bus+ZeXNcYHtsyAOsMeZqKXEXt0oEPbHf7uXNGfuQt?=
 =?iso-8859-1?Q?O1iSGLHt9ehfPeK8CjhZkET/NWW+bKIIA8CJm74XAAmB6LJ2SeEx0RHyJg?=
 =?iso-8859-1?Q?SyS8LCJNW8hHgde3aaIcX9Nu6xCR1cAik2MC/CStriK0NfHvH4iOqAAKOw?=
 =?iso-8859-1?Q?6rXoB1GvugMiJ0TrRHaX778FvOkg6nsGs0OWu1/d7o1Pga1RfXzS4ryrGV?=
 =?iso-8859-1?Q?mhwwoCQCRKIhJooaL3c2SMvuSQCtDmnrOzr0RX2qutiZmM8pDcGd1Xu1iI?=
 =?iso-8859-1?Q?DayzwRxV7vHa99mSPeN6IBq/iH4DCxJvjkeAGFh9ZsfJ9hznYEu8Zwiaz7?=
 =?iso-8859-1?Q?an4XXaPG62DZoIqKxpURdfoB8i6PoOXAEpEJ8CzTQD5AwU93VqYK4A/uP2?=
 =?iso-8859-1?Q?IAGcObvKMNRv1rcNxh0sQZoyUrj1CEaCw26Qez0f9MyBYcKKVWU+zMpPFS?=
 =?iso-8859-1?Q?ncHqj+4kBUjNLPECQ0uazW0HB92SDMvR9M839CrGrnflQ9CJsdme9cN07V?=
 =?iso-8859-1?Q?dz7Yz5+TZxPF62MHDk1a7UF81HWOdN9M5NHyWHOdNbvHbPfM3IgsNoFQaV?=
 =?iso-8859-1?Q?AZ/94eySTH7HAgxbdQObhqtmQ7UVSc7q0EcGRhfVaAv8U5cQJeoyomMQ+Q?=
 =?iso-8859-1?Q?js0PAtnIiiWUla3qoqK48IbLJpJVUdpaU4eDvaXBPa3T5jY4wg70u0wH0F?=
 =?iso-8859-1?Q?0ShNV1YizEu11AxEt0xWr8AYQvcuGQrt86mmXGAvUWDR4legBb1nNu7Ycw?=
 =?iso-8859-1?Q?LyNJ0/sVCxKE3HiCa536GcKlxcPzRhqnDjnj2bp/rAc0heGk1HTgZIhP7H?=
 =?iso-8859-1?Q?vtkBZkynMsrTWFCo6m0P10Jro/jgqM2Wh2mrqpgFcAjp5ELjeH1Vjk4HNp?=
 =?iso-8859-1?Q?tdEbIxAcK8ZeklqUXaFdv36od3ztm8NS3Qn64kLC96C71U4kfU4RKC/BH3?=
 =?iso-8859-1?Q?+PzeeQOcnMrw46ztENRDiT3F1PMZYVyl/mSA2WjQqcYKs4ZMg6UboqsTB3?=
 =?iso-8859-1?Q?chTuCLl0Aqpw/WyynRrEpFLY4Tg6b4BO4t/WpjXYWsvht718F5eUDEICNY?=
 =?iso-8859-1?Q?BUYgEQM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(42112799006)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?51cEqJ0qCbHgLEWBSwDbSml7YuEiStQQyBl9j2Xugab8WVT9aq/JKhvPi6?=
 =?iso-8859-1?Q?Zf4JkOc4L3rP/yEZLMig4fV6Zr3hz3Cye14p8LbkAvAJjpjWLjTobJ11SL?=
 =?iso-8859-1?Q?hQzuH2nd/nIM3y/bPaTK1obfXNeNWA0V7U6IBfLwExgb1aauiW1mXV/QVs?=
 =?iso-8859-1?Q?zzZt+YESVa/Hu+/jGgzI8+hJoZHOpf6c/k7OyNy30/HMsxmNjtTvDk5K09?=
 =?iso-8859-1?Q?2/NRg53jVbKZK8TGvvVCodL0IICe69xGnELk06GBC2zAcKL33mLberPBov?=
 =?iso-8859-1?Q?TFeMcTodoT7wBfiDXvusDF6R8RgbAVhRfftmnFChJm6svc5NFhJW6EsoaI?=
 =?iso-8859-1?Q?fCijmzMSGnwdPAcp3OW2JF+dd0pspyGIW/++hd8sveiElE84X5YOOtq1WG?=
 =?iso-8859-1?Q?Sw67Fi8/Bz7+J1U7cBfwFi+h1h0o+ohHDJRIlH45soCLmSCeRQHrxYcl/y?=
 =?iso-8859-1?Q?yOqFZ2FJU9u36lq3Cf4AN/L4aXncGLbnB9D+gGPzsiJsWJH32tgEuyPbdl?=
 =?iso-8859-1?Q?nBo3pt/q7MaJiot6RkG8ndRXTf3ENdQ3pXT4AeMSur/dFYHsOjNUZIr5iB?=
 =?iso-8859-1?Q?DpeTWn59HBXxzJugSOcxxRnr3o0RUtlhEi5ZND47WJv9iduMPT80x41/su?=
 =?iso-8859-1?Q?n0Vnpb0PYAJ/PldZCu7QGZuQxTHzcDvDunbQV0uKwSBqiJyEIj3ZZGIGZW?=
 =?iso-8859-1?Q?sY5NxXJ1I/yJR4MDeuG8c9ZT2/dSb3DSK6k9lnkzfOJBAfpJHo8c90ACre?=
 =?iso-8859-1?Q?YWvO33vZUq+vjr1TGOeQFkZESM9SFHrYLkAXr9YoTVp+nX8/fchfSUmro/?=
 =?iso-8859-1?Q?EA7e0gz7naTZM0t2M3fTBQOEft2V6SDhX/+OVZMwILfCAzR6xDYjUhR7NK?=
 =?iso-8859-1?Q?kUwNLO08yUSsL+Oxk4FnAff/dddg59WrEPqHkXXGFycb6SVVyYyXUNMFkx?=
 =?iso-8859-1?Q?STGje1+iY8K9RZJRrgrhvbHV26bp0UilifI3RoXWbQSMCeyAdVrQSO2+9l?=
 =?iso-8859-1?Q?Zu/0JenYRg0pOJR5lcNySU2WJ0rsbOyR+RR2R/lv5EMLrDaEu1hpFZHYx3?=
 =?iso-8859-1?Q?PMXC9hXD1QR4CPAHydymPpy8vLy0jYx2QVg/FCNtDnGA3OatxunkO78zWT?=
 =?iso-8859-1?Q?3CoY1WDS+AmENFdtYioaB/MYFGKKl4zcJn5/FgCWXzAfxg94KzXV4Gc0bR?=
 =?iso-8859-1?Q?P7ts4EbZs9am4nMrAKLcjQrtWZnGNR7UgpXtmhFyhVk6+O6SVQLXHIJoIX?=
 =?iso-8859-1?Q?vwQ5/PuzV3G8q/Q5coXf0TKGzi2cpymmE1efTR0lh8QMaGGYzCuxWcA/Lm?=
 =?iso-8859-1?Q?Lhcet+nw1Gge+ndFjQHksGUH3FeByY4YplnOT4L9ywS/DM/ODAQMafUxPT?=
 =?iso-8859-1?Q?NPkOHGeh4lHw/k5s7nU1nJXcDoC3AYyzP+W4wBgZNF/dQCGagaDUEQ5hJF?=
 =?iso-8859-1?Q?occtesqxOHkzOWU4Wq8T2ClbNQK0JFgzeMGyT4Spaout4S3AqyezTIyTiK?=
 =?iso-8859-1?Q?71DkNwCh4fwT+odLvvW00WZo0NVNHA9Cs/7yNU86ySdElhCtwx+hkGsi+A?=
 =?iso-8859-1?Q?yWvgeXOb8eVKeFUHwrckEU8JhBwaot1BDiac4y6CXuEusQmZbD3uJ4vaLc?=
 =?iso-8859-1?Q?gHGfZYOX8wYu4MfkiEKgv6tjlImxOLq4SIBN2qjXwsAfigSp5qDoYFow?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d42f09e-ad68-4ddd-6b3b-08dde31e5e89
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2025 14:56:13.0736
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xaAoO/nwNVmkOtixn4IjHZsOxwcOSxHnzd0MrULJ2jcvofpm18Mz0Cmely8EBXsivnuoHU3++OaQa5QHU/qQhdDRTIY7FH5ZhErvXtvhyMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB7129

MISRA C Rule 2.1 states: "A project shall not contain unreachable code".
Functions that are non-returning and are not explicitly annotated with
the 'noreturn' attribute are considered a violation of this rule.

In certain cases, some functions might be non-returning in specific build
configurations due to call to '__builtin_unreachable()' in the expansion
of the macro 'BUG()':
 - functions 'gicv3_do_LPI()' and 'gicv3_its_setup_collection()' when the
config CONFIG_HAS_ITS is not defined, it is intentionally used to catch
and prevent any unintended execution of code that should only run when
ITS is available;
 - function 'prepare_acpi()' when the config CONFIG_ACPI is not defined,
to trigger an error if ACPI-related features are used incorrectly.

To account for that in specific builds, update the ECLAIR configuration
to deviate these violations. Update deviations.rst file accordingly.
No functional changes.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2000738682
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 11 +++++++++++
 docs/misra/deviations.rst                        | 13 +++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 7f3fd35a33..336aec58c2 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -41,6 +41,17 @@ not executable, and therefore it is safe for them to be =
unreachable."
 -call_properties+=3D{"name(__builtin_unreachable)&&stmt(begin(any_exp(macr=
o(name(ASSERT_UNREACHABLE)))))", {"noreturn(false)"}}
 -doc_end
=20
+-doc_begin=3D"The 'BUG()' macro is intentionally used in the 'prepare_acpi=
()' function in specific build configuration
+(when the config CONFIG_ACPI is not defined) to trigger an error if ACPI-r=
elated features are used incorrectly."
+-config=3DMC3A2.R2.1,reports+=3D{deliberate, "any_area(any_loc(file(^xen/a=
rch/arm/include/asm/domain_build\\.h$))&&context(name(prepare_acpi)))"}
+-doc_end
+
+-doc_begin=3D"The 'BUG()' macro is intentionally used in 'gicv3_do_LPI'() =
and 'gicv3_its_setup_collection()' functions
+in specific build configuration (when the config CONFIG_HAS_ITS is not def=
ined) to catch and prevent any unintended
+execution of code that should only run when ITS is available."
+-config=3DMC3A2.R2.1,reports+=3D{deliberate, "any_area(any_loc(file(^xen/a=
rch/arm/include/asm/gic_v3_its\\.h$))&&context(name(gicv3_do_LPI||gicv3_its=
_setup_collection)))"}
+-doc_end
+
 -doc_begin=3D"Proving compliance with respect to Rule 2.2 is generally imp=
ossible:
 see https://arxiv.org/abs/2212.13933 for details. Moreover, peer review gi=
ves us
 confidence that no evidence of errors in the program's logic has been miss=
ed due
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 2119066531..96eb202502 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -97,6 +97,19 @@ Deviations related to MISRA C:2012 Rules:
        Xen expects developers to ensure code remains safe and reliable in =
builds,
        even when debug-only assertions like `ASSERT_UNREACHABLE() are remo=
ved.
=20
+   * - R2.1
+     - The 'BUG()' macro is intentionally used in the 'prepare_acpi()' fun=
ction
+       in specific build configuration (when the config CONFIG_ACPI is not
+       defined) to trigger an error if ACPI-related features are used inco=
rrectly.
+     - Tagged as `deliberate` for ECLAIR.
+
+   * - R2.1
+     - The 'BUG()' macro is intentionally used in 'gicv3_do_LPI'() and
+       'gicv3_its_setup_collection()' functions in specific build configur=
ation
+       (when the config CONFIG_HAS_ITS is not defined) to catch and preven=
t any
+       unintended execution of code that should only run when ITS is avail=
able.
+     - Tagged as `deliberate` for ECLAIR.
+
    * - R2.2
      - Proving compliance with respect to Rule 2.2 is generally impossible=
:
        see `<https://arxiv.org/abs/2212.13933>`_ for details. Moreover, pe=
er
--=20
2.43.0

