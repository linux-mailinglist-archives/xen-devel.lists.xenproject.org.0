Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 694F2B21359
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 19:37:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077895.1438918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulWSA-0007Qj-HN; Mon, 11 Aug 2025 17:36:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077895.1438918; Mon, 11 Aug 2025 17:36:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulWSA-0007Ok-El; Mon, 11 Aug 2025 17:36:58 +0000
Received: by outflank-mailman (input) for mailman id 1077895;
 Mon, 11 Aug 2025 17:36:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UdnH=2X=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ulWS9-0007Oe-K0
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 17:36:57 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6b3789e-76d9-11f0-a326-13f23c93f187;
 Mon, 11 Aug 2025 19:36:56 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AM9PR03MB7929.eurprd03.prod.outlook.com (2603:10a6:20b:438::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 17:36:53 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 17:36:52 +0000
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
X-Inumbo-ID: c6b3789e-76d9-11f0-a326-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MXEu3O7p4oHTEVS3aM701ZCZKUFt3Pr09nJwuFq0ru40kCULv5MW/KosTyGDjlqmFIo0xEv5YU+6ZmyOmkdJ+NydB/VuqdQF4j/LJasCtIKnA/Lp0F8J/ZFsvpAXK+FI4IcBXsA/AS35MfT8wgMVLqasaFySFzus8jyKuoDCJ40+kPYToiLEhoaiHKgtwwR5Vi69BnCUPNCqqTL6e96pilhgWe+iKb0wDLdbNr0QCoPwzTSTeN/8oQk+l+McM5BHH2+HCJsYtkmoRwbS8UcJ6mUFlSEw9DfHLZRA77dKWg/ps4Jxfy90AnAG/3uZejFrMYMriga2UPVUByAlTPWS2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNqFeLEcTWrPGlajBVbJB109KX7ojmBgbcImzAPEgN8=;
 b=GE+aN97IKFbd6L1EUtOQmqwuekOm4ny0jaCDnJoy/jC8ESQ4HEBRyM0iLpjRcDkE7DQsP7U3eO29/O9tP/CpqAedEAzA1ljdNUEA7ppMw63RE7mzg6ZNRAG2X4++kVqzClOgQEF8DC4uzLvtm73fXj0IlrXV2z3taJ2S7QKB6LyFTvL+n3FoUHhpxxJqu+fLmHmXMdRMpaADXSUfAi1wPVZ6HsSOR7hHA+XNBJ3j3j9LRDBF39nVl9X0GNKw7djkpwC368GkztkfFlcaYh95z+TLSZdDWv4ReT8KW0Zqu013gaygHFUQAWUgCd0/NALRxvOb4+u2GQr3Z8nK+B0oqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNqFeLEcTWrPGlajBVbJB109KX7ojmBgbcImzAPEgN8=;
 b=SXDdvOOZA7Ebi3baM85ZddP8d/TylKuW3vYgz6wpcjSGXFur/D+pPXi3vCGb4KYkx9RnSNkUIA0IfEDdq+m83SOiXg+NAs4LLQawoTTFmipdVyXtBthIhjCj+aMltXgyPF4ZhE+1dDYnH+QwaD2q+15IqwYzXQFlAezLDdCqlHxRzVwvKmKD1UM2tWYIaFUWFykvb3aiHOdmhWQzUWpzvqgMqLGLQJWfHRnooaAlzuOFWKtWs+rk45o/3Xj4SZdY5X9MyA/880dLW96xP7ZCtTGFg4o6h+egmZ+vJ+QD/2OrK99toHWCB0JYNF0psBcLIXpSrWF81baWPQROdcKcQg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: [PATCH] misra: comment default case in single-clause switch
Thread-Topic: [PATCH] misra: comment default case in single-clause switch
Thread-Index: AQHcCuaGmRofUvvSEEWe+78HEkEpWw==
Date: Mon, 11 Aug 2025 17:36:52 +0000
Message-ID:
 <1d3c5364b726e42a8c38c396f2e20efc52790f62.1754933752.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AM9PR03MB7929:EE_
x-ms-office365-filtering-correlation-id: 48cb2eda-3d19-433d-2b0b-08ddd8fda8de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|42112799006|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?/1FAVPXs4JT56sHkOC2BV+krUXaLnbdXZ0GrzOw4NMCRXM31n31cmndof6?=
 =?iso-8859-1?Q?QJsOXq3eNFtR+iwUUmkzjOvIPwTAHZwTdccTAyGsTrzvha3vNDjX/zH5Aq?=
 =?iso-8859-1?Q?R49nqrOkRPM1bmcH8xxkcCGTSVbCBYfAdWmmBmHbhOeGj/Nl4Ebg6Wb1vL?=
 =?iso-8859-1?Q?AUzPPeu/3DQGz5j0bweWv71Aie8z+yhaovRANhhVwDx2WjaiYS52eoLJUR?=
 =?iso-8859-1?Q?NF52iAzDg2dgDLjUxrQ7Zi4nYdfwS1clEKObEizuqJr5Hr7EAuODuAQ3HG?=
 =?iso-8859-1?Q?QSGRZlrJRoBrM6ZSmbw3LqSBkptOxlGHb9WW6PJmile0CcEYQrgkGoEwOI?=
 =?iso-8859-1?Q?e6NDRnbFqRN+a0wf0FbbVcEj5Sx32N0l/t2qRwR5HX5zxmDwZvlUvTKkQh?=
 =?iso-8859-1?Q?c6WX+e1MAcYpjQkCsZrkN1B6015hSHSr/2Pdja8eVsdakiHhcafEVM3PR0?=
 =?iso-8859-1?Q?SVvyHbBxVPSgDv4k1QHnWLuv5T2WVX1VLovE6qQXT0a3Ob36TowVGbYoPQ?=
 =?iso-8859-1?Q?xWkHsp+JxyghYiH09eJFzvjR2YKHcJBJ7oi/iqiJu3q8HqYu2kYgHpmIo4?=
 =?iso-8859-1?Q?sVGbgtCslw9/gA+yvi6b+Z4E7F+23zv2ORXk9eMepN8nkX5wsT9S2Jq5X2?=
 =?iso-8859-1?Q?Ff2Am4xZ3mpLmUOgG/ljwJ3mMUzWidHhLRFJFA66+wIFzkYZ3isdWoRuu+?=
 =?iso-8859-1?Q?KphUw4bNRrsGiZFPnMPYSG06HSfam6M7yaBOZ8jMZh0Z+uLmWp5NNSPv8m?=
 =?iso-8859-1?Q?JHUo5WWBfSejG/1lYTSL8b6jX+hGuMQo6QpQKkqOnHfR6zXgQ4A9aaWOT4?=
 =?iso-8859-1?Q?sF/kT8VlaUk1nnJ3BKrTV66yMPLYxa4xsDEVbeaJ+F53wRlKo85eOCdiQe?=
 =?iso-8859-1?Q?ptFSDCz7ZaQZX9EazF53fagJhJWASwFLCWuBkvHpqiyD1qAosVfTFMYTHd?=
 =?iso-8859-1?Q?DdCJnHjRP7dyMb75nlYD27VRAZTf/+e0fKyDyNhNe4XGnjUAmJToe0xNpb?=
 =?iso-8859-1?Q?H3tCBd0g5faKOKzhzP8/ghJFMJikNDnW5muBD0VOYcY1oUTar+NGuKRX+t?=
 =?iso-8859-1?Q?6gXPt595yYlx9G7NDNDebQmL9dNbib2DCiDr7prTUUO0jVc0WK29sE9L/w?=
 =?iso-8859-1?Q?/eW6lUAJdnoDczsOqM2RvWxVMFjuoRjx7loNHyiZR4+bNkHhJhR/ZNqvS9?=
 =?iso-8859-1?Q?NU5TIpGaKo8HoHwejgXOP2k+/1a3sjIYmfIJr823YRpILrXA08eyynSwoJ?=
 =?iso-8859-1?Q?HnCQKqc/+0hhkPH4zHwlYnYugz52/f6nE1vnr2L8l+UQwfKFZIQdrpp7tu?=
 =?iso-8859-1?Q?I/GI2fJawqguF1IWkNfrA0bT2xdKz4FYOcAcqkq0oj59YdafF06Cn85p13?=
 =?iso-8859-1?Q?2T3oHH4KOimLcknCMb7/jH4NjwZQJy8o2y7X8ICN+oWHTlHhXy75opKDV5?=
 =?iso-8859-1?Q?+1HGARtBuc4+vQwpHeVt/RpT+W8OXmrF8cYLuFYQRPk9uBcaQeUbtJQFk4?=
 =?iso-8859-1?Q?L3e6h/3g1aBeC8Vja7uNz6oUFsuOwLlyA1Nn7/SjoLJg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?n8N7qxDR2bUiO7uvaA1zFlnchPHzg64LCFA4gs78+HV6HFA+aKcVYcjGAa?=
 =?iso-8859-1?Q?zo5ZqKTULKnq4AhrIiYbSGCUbfwzxwidQ3CwWmgc9wJ10EWKIM4DCmU28I?=
 =?iso-8859-1?Q?1W+x2LtaJQYvuX8Rf44jUaZDhWD6dyShqRkw3VRdsGl0PKaPWxsceveDkZ?=
 =?iso-8859-1?Q?Ll1a+bXp5ooJQceF/1XoALIoz8Mlpw/Pg6T6tDotJ9nOwykCB3w+O2SnYd?=
 =?iso-8859-1?Q?wpqbTh7afhQDTwf/SOy09LYm7EfA0tYsbuQTARmANgnQLY2yxBrZovIw9L?=
 =?iso-8859-1?Q?oRmMmVrfwh9eorVwEFIFXakdXt3a/+x0lBrWIOsuxBv+GTPENXQKVFoNAJ?=
 =?iso-8859-1?Q?a5GJ6T2JAQL3/eBRFgatr6kzX28aMNSm0xN3h1mrdJRC+QFwfvWDw3WzR0?=
 =?iso-8859-1?Q?AANBXJ7ei6iXlfTY75UZM+nUSkFT//AnVq1nk4uZ9qL+vG1ow6o4cMvkoH?=
 =?iso-8859-1?Q?G9Q+vUgQw87ZHybNx0dxXhb8fvkUZyCcOB92F29Mj/nratExbej3Y/tuHC?=
 =?iso-8859-1?Q?WDCOmgl2ipUa5qXMJ9vYsEJSxp2TToiKbbxzYV47YJ1d7eyLEPeoBhDY+C?=
 =?iso-8859-1?Q?yUoTMznG0hj8vcQqNY+8DeVnaVo8KN4FsecAk34SUdScssdECkZTuYjaSr?=
 =?iso-8859-1?Q?5/7dqBY1SUhTJdeatbbhTLIrPApWnw2a01yn3ocWqK28H1fogGTUy34ckH?=
 =?iso-8859-1?Q?s7QlZppHlYhHPsB14mLJOUGIXKqs2wiLSLfLN9KUvjeYVAfUFlSgj++bY5?=
 =?iso-8859-1?Q?i5YVZ6dXNo0Oxdk49A87sFIy+DHkdl3Ziq6z/3Ii+OPBM4RwyaxzikDDDL?=
 =?iso-8859-1?Q?EZVyTZL54lpl+Hv9oA3hI2Rbk891ttrOymXZJmahs7f4l0y2NkS8SW4fp1?=
 =?iso-8859-1?Q?ysLZK4tU+YV1HDUNfVWfAV1RFv4xFYnLoC/7rWnJJh+B0gMJmJqyIov37X?=
 =?iso-8859-1?Q?0yPMKW9v/TDCZa2rJzPixCzeCs1/73aSeoTfu7T6z5UKLzM+o+4jMMFC3/?=
 =?iso-8859-1?Q?sfHykiptZnThnu8rG6DCR7XkbZdEa31vAAAZ7cbE6FLxiLvjUjwrcSL86d?=
 =?iso-8859-1?Q?9k6RtQaSWcjAwHmrBUoLvQVk75zsNjosunZzdMMDo9luZDQAkKlPYUp4HW?=
 =?iso-8859-1?Q?mOmRnfCI2HXzlhTUbFKPK3worTtEL5zulIMYAEUa0QjYBDvVJGI1lbJzxA?=
 =?iso-8859-1?Q?VzDus2aFTZ/ui0aWoGTzOoPf1uuOpsjl3d9J7UxiwgS9Yt+TC2YisLhs8C?=
 =?iso-8859-1?Q?aX6Q1wJ6TEKQu6kuaTtkQIAjboPpJ4kAkKnLeHXVBCVE3tYtt4O/Wy9q0O?=
 =?iso-8859-1?Q?fsBg9Q3BkjRVevZDM05AzhDc+H+WmL/7erAxOMT5BbR13vqhaCzVdPetFP?=
 =?iso-8859-1?Q?/YYcQiRzUaxZ5b+9mLfPaC4cpwTqBKVbY8BIfs3CkwiaWSUtNp0V+UkhMg?=
 =?iso-8859-1?Q?dTyY7v5dViWEKEOaIbVuEsrlH0Z1jdYfqcQ9m0hUXjIPKiu0o0Qvb/IBZs?=
 =?iso-8859-1?Q?q6HWo6Sn2TowGrRHgiERatr7hGk0yvhxX7SMldWvpOBR+jqVkrh6hPXpeQ?=
 =?iso-8859-1?Q?COPnkGGu8U2I+tR82p8DFlL5xgreKqajw7VUzxww/DFepIX8ni9R0YJyj1?=
 =?iso-8859-1?Q?JMo7ww8ep4DHLSLqy7wWYjecDuOUq/FOyM8I+CCcwwQCcnFDNITRgPYg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48cb2eda-3d19-433d-2b0b-08ddd8fda8de
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2025 17:36:52.7827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HjhVi49GVp2nAj+njKhhOWSJ6seBhGpppj/jKRuqimTSAyThMtdilRAbWMo0G66GqwWLFMIrEe2gImT/YSMoETZJtLuFD0EGcn5V6k803x0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7929

MISRA Rule 16.4: Every switch statement shall have a default label. The
default clause must contain either a statement or a comment prior to its
terminating break statement.

This change adds comments in default cases in single-clause switches to
avoid violations of the rule where the `default` clause lacks a suitable
comment or statement.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 xen/arch/arm/cpuerrata.c | 5 +++++
 xen/arch/arm/gic.c       | 6 ++++++
 xen/arch/arm/mmu/p2m.c   | 6 ++++++
 xen/arch/arm/time.c      | 6 ++++++
 xen/common/kexec.c       | 6 ++++++
 5 files changed, 29 insertions(+)

diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
index 17cf134f1b..e31c72694b 100644
--- a/xen/arch/arm/cpuerrata.c
+++ b/xen/arch/arm/cpuerrata.c
@@ -735,6 +735,11 @@ static int cpu_errata_callback(struct notifier_block *=
nfb,
         rc =3D enable_nonboot_cpu_caps(arm_errata);
         break;
     default:
+        /*
+         * Default case left empty as other notifier actions do not requir=
e handling here.
+         * The single CPU_STARTING action in the switch is sufficient beca=
use this function
+         * specifically handles enabling errata workarounds during CPU sta=
rtup.
+         */
         break;
     }
=20
diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index e80fe0ca24..dfbb0dfe08 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -436,6 +436,12 @@ static int cpu_gic_callback(struct notifier_block *nfb=
,
         release_irq(gic_hw_ops->info->maintenance_irq, NULL);
         break;
     default:
+        /*
+         * Default case left empty as other notifier actions do not requir=
e handling here.
+         * The CPU_DYING action specifically handles releasing resources a=
cquired by
+         * init_maintenance_interrupt(), when the CPU is being taken offli=
ne. Other CPU
+         * actions do not require GIC-specific handling.
+         */
         break;
     }
=20
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 51abf3504f..d1f0ae0226 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -1828,6 +1828,12 @@ static int cpu_virt_paging_callback(struct notifier_=
block *nfb,
         setup_virt_paging_one(NULL);
         break;
     default:
+        /*
+         * Default case left empty as other notifier actions do not requir=
e handling here.
+         * The CPU_STARTING action is specifically handled because this fu=
nction sets up
+         * virtual paging for CPUs, particularly for non-boot CPUs during =
hotplug. Other
+         * actions do not involve virtual paging setup.
+         */
         break;
     }
=20
diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index e74d30d258..4776110d97 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -382,6 +382,12 @@ static int cpu_time_callback(struct notifier_block *nf=
b,
         deinit_timer_interrupt();
         break;
     default:
+        /*
+         * Default case left empty as other notifier actions do not requir=
e handling here.
+         * The CPU_DYING action is specifically handled to revert actions =
done in
+         * init_timer_interrupt() and properly disable timer interrupts on=
 the CPU being
+         * taken offline. Other actions do not involve timer deinitializat=
ion.
+         */
         break;
     }
=20
diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index 84fe8c3597..0f78087a4a 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -549,6 +549,12 @@ static int cf_check cpu_callback(
         kexec_init_cpu_notes(cpu);
         break;
     default:
+        /*
+         * Default case left empty as other notifier actions do not requir=
e handling here.
+         * The CPU_UP_PREPARE action is specifically handled to allocate c=
rash note buffers
+         * for a newly onlined CPU. Other actions do not pertain to crash =
note allocation
+         * or memory preservation for kexec.
+         */
         break;
     }
     return NOTIFY_DONE;
--=20
2.43.0

