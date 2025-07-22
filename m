Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18322B0D875
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 13:42:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052292.1420990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBNh-0005Fu-GL; Tue, 22 Jul 2025 11:42:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052292.1420990; Tue, 22 Jul 2025 11:42:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBNh-0005AJ-96; Tue, 22 Jul 2025 11:42:01 +0000
Received: by outflank-mailman (input) for mailman id 1052292;
 Tue, 22 Jul 2025 11:41:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ibko=2D=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1ueBNf-0004HB-9S
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 11:41:59 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df782aaa-66f0-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 13:41:57 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by VI2PR03MB10809.eurprd03.prod.outlook.com (2603:10a6:800:272::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Tue, 22 Jul
 2025 11:41:41 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.8943.025; Tue, 22 Jul 2025
 11:41:41 +0000
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
X-Inumbo-ID: df782aaa-66f0-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wnW1unPxhSq9nQjuqaGgQSbNWe8p8fhksQYW6E+y+ksAU58AO1tFwWyyl364dS2YmB0ZOG4LabH7eEYkZfcO1U1I+NXEtws2Zpmxht134jLlJfGhir6PMyW6B4iDWeeIXZQ+dMunZHRqiOTN7K+NpaRsOiI64sMhWa/R5h+HfVLhOzDi29ZxzSFpP51xO2tz5cQlcz0OGv/loHE0sGxf7K0wnm+wDJMRIyvqa99uUBgIGm3+vRMYHj9bNNGQSRBrvvVHDMIekdH16iAGYL14OsmE82vPW6vEnMFvgSdAJiQMtzCACBi8CPoMBxc8M42O2aCdPlr8QjHozRvzsin5XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfsqdlKrYuoyUtCJuzkRIZhR8rDGBhuWmWa6vmySCYI=;
 b=F6FSsIesaVvi66jvOwIqR5eyqZqFLHW1d0AfQvAyg4iGUk2+Lm1SIk9X/vBBdrLW7DeuGVtgy509tRnfRdlfnTT7qg5rANkPEDiPG7vVJ8+NcnmRcLQQf9Jg9xyCCkr9ogi8A3bgHp0JkKNq4KaC4YfGdqjmRaqjkb4CHtgtcWPxzVeLrvKbtdBncoHb+1RZK3OGdCymiS3S0h5YW3Tp4keIpHfixhVgQipARCovDEuDJiD39rzTdKLIVVawZ9itNWs9KpSv2gcIfmdFdld+zN0vwW3owmaQNiuC2l1M+PdB2SkKeeOtkuP5upaGvMISC9oR8kpasAVhvH83uQtuqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfsqdlKrYuoyUtCJuzkRIZhR8rDGBhuWmWa6vmySCYI=;
 b=F3FueASjlJ7rJNw1peHW8bUOKa3u6870m72C4vV703ljEYnaLXY0Bh3PYsDfAkvESW5IoGyxnQZUnz6xWpA+LrIOcs5Mn0mRgzvrw6sDwcporRs5ieOJw6gOAgNQCR3e9I/rD1ss+EO3x1ESL6VE4AYuvpMy7SAvr+3YQROxw7DECLjXiE9dwaDENrGep9rp7zG78OVRMC6lmfQw7rBlTcuWNEbLQRLNv/ceJDciiwT7nKnAaDkTXgJM0mlo9UbOWYE40IjXvO5yeJgAmOGQs2ObmIE1974EeFyMXLxoaqSGbs3AF97Y6ACRYr4L68mslaC4vK8+2/ZOSpTdwMT1TA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [RFC PATCH v5 04/10] docs: arm: add docs for SCMI over SMC calls
 forwarding driver
Thread-Topic: [RFC PATCH v5 04/10] docs: arm: add docs for SCMI over SMC calls
 forwarding driver
Thread-Index: AQHb+v2WERsbDNQi7E6G5xjDltU/pQ==
Date: Tue, 22 Jul 2025 11:41:39 +0000
Message-ID:
 <dcce8830102110e2edba022b0909d6fd85110880.1753184487.git.oleksii_moisieiev@epam.com>
References: <cover.1753184487.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1753184487.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|VI2PR03MB10809:EE_
x-ms-office365-filtering-correlation-id: 851d8857-459b-4890-27a3-08ddc914ba08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?19+k03Ei8lFSEbdqxRGMZgoLKKe7WzxWUKnScSb1eOTVyN9/scVMmLHOlE?=
 =?iso-8859-1?Q?cluhXgQsvXsfhn7L+aRBe6Ktlv3vFhA5qSCAH1IvvNSm0Nn5uDCokTXoDi?=
 =?iso-8859-1?Q?Wsm9UDLNylSFnVziiNlLiuE4knBaIEFF7gMMzS0fhabmgwFshhBqP19x6f?=
 =?iso-8859-1?Q?O/AfFEKqPAA6ihwuwjMe/3kcIQI91bzbQ3fxXglb3WDsaX5q9tsP8s2jvl?=
 =?iso-8859-1?Q?aEmifzO2Yjm08pvVkI5F/kbZk7ZMGVE0vJ+CIsezCd5Tme9+9vIZH9Us1W?=
 =?iso-8859-1?Q?XWg5Ved54q9dRNNakywq8XuDUZEYmztyrAIidFAFEHTaS+erT2r5VvxkCL?=
 =?iso-8859-1?Q?ONNJqJQQVzC5kdPAXHn+aTohPGAw+bYDxR/dnu3Ye1kKST/t3hgHDLa4aR?=
 =?iso-8859-1?Q?Qz7rYclrzhQn1RKvmUaCpj+uPfHLCoC2k7l7nSFhWZPEsojbWPVTsfkkpw?=
 =?iso-8859-1?Q?v8snaS9zPV633FlOBqLh432UnUCNVb1svASLfwjnLyaYyhHN1U2LwMjfDO?=
 =?iso-8859-1?Q?0voe+vsfrRM3xqDBydlEj1fqGMPaFeEFUEvZ/XendDm8ok5AkSrJmIGJFd?=
 =?iso-8859-1?Q?BxWu5t9EJ2AS8LAPLO+zjqxyVRgN/NwGiGGgCUJ1NsghIi4Oh66m7iu2Jd?=
 =?iso-8859-1?Q?zHq/KVm4pwrR5LaeUjV/c2oaXPdLooiKR4tWP9WkydVMGkiWvKvfBHgOlB?=
 =?iso-8859-1?Q?TwdlyopCiYx4KKj2rKllO+YMNJJwaJotwh4uMBGaeMlZ/s8ctxyAjf/bX8?=
 =?iso-8859-1?Q?e9svdqoAcMbf/jbxcBj4IHsByJfzeYP3d6rrRLy2xHb0wBpwoSypv3IcxK?=
 =?iso-8859-1?Q?R8CFISWKqleVQYLUZp8WyCc5LjpoJx8aRahLUGTsiuYKi1uTkzHwFvzSal?=
 =?iso-8859-1?Q?f+w50zWkildrZrTq1C8i4M3+I9lKW7ByCV7GyLvrtbsWAQFtHOVU8+czKk?=
 =?iso-8859-1?Q?vs/KXODG9yeJYdP5CxYSNJdzPPY6qUSE9F83e3XcMzDhOk3cRWBsYFTAtF?=
 =?iso-8859-1?Q?egHnYIVZgNvbzONl9VQjnwXcLqoy5ikWKgwGVxV9JsFouvVybT9vrToH1O?=
 =?iso-8859-1?Q?bZQ4N4ax2je9AeJvIClp933VilBp5OJHS6aPWGgkOgWAk75yPSD37XNm+p?=
 =?iso-8859-1?Q?hibIoz+hPHkh8i2F860j//oyj59wCjPtkchBY6uBGPUTxCDYPOyNu2tAUc?=
 =?iso-8859-1?Q?TZOssdVA9Pnbiy0l4rsZWENSUoAnqOJjNEW5apUkMciP6SsGu3WMuifTZi?=
 =?iso-8859-1?Q?HjzeEGgssC0HUR6ddTpT8dvvDcfX/2t0g3FZIOOtoPEquXl8sEiG2mhCKg?=
 =?iso-8859-1?Q?4Jq1P9KEbAPcfvtOCYO/X09iqCkfapxAW2b2MsqOVcaiNFdUTry4kspzrZ?=
 =?iso-8859-1?Q?5beiu3bSnurDA4dmGYoHcs/T53vcHD31x+DOlSIfxHrmL5sgq4SNwPz+1N?=
 =?iso-8859-1?Q?BPcXkg1eG24oGvRndxtAq9ICbLLMvfZX7i8PdH/IcFFOJ7bPetWSrEIMWc?=
 =?iso-8859-1?Q?hW4LaCgAeweuxZibqxs1HP00egvPWDxsYp3gTkf5POTYzfMPW22R6fjlOv?=
 =?iso-8859-1?Q?RD8qCpU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?K1XxnJdAmg+0sop98CsY3QfWqOI9OXLl849VIGl0Gp59mwDjpYAJmatCst?=
 =?iso-8859-1?Q?ETvTnj4SGl4NSBDEAoEiCE4DloA3hDMF3g+txdTd6yauJL5BEK+YsZDtsM?=
 =?iso-8859-1?Q?V40TlajjCRFK4BvNklI09aInAcHAbn+8m9Xa8r7CnWfqghjGll6jyTTboW?=
 =?iso-8859-1?Q?5SQbmI2RlNcM9Nt2/NOJoCBR5SDopUfxRn2WaJv9P8b0vRjveFg5PNiQ65?=
 =?iso-8859-1?Q?EOXMvQkgllUSemefLmy81Dhc9hqkafbJak5WjK3RMC4OE3iauVXRJVmg2S?=
 =?iso-8859-1?Q?gu7CoOlUvyYleXSrwhvDPHUsN+oWbVqnnJ1V1Y01KnkYkWNFe84KYf/eIJ?=
 =?iso-8859-1?Q?oUz0cotEtoJa8oOezbVtG6R6AMJNaOBk9jssUu0jokrXOyB1cHu4cJxxr2?=
 =?iso-8859-1?Q?pGG18ZxLjlulZT4iISq5ms187EbJojWqbUT8eu0dOrwQWW8P/u7N/EKorI?=
 =?iso-8859-1?Q?vJR3gBpjV8FCs6SIBwpCyKBQKugj59YW+oqnEyyPPsPGCaXAS0X4XVXje8?=
 =?iso-8859-1?Q?yFve/pz+r4YZudOWVX77xlNLt+1yVsBNZwcyFcj6n7eO/Zyc+dDqGmC48e?=
 =?iso-8859-1?Q?lj/9dv6SXf2E5VRi1ZWpzQJ0cud4sM3n7BFODZLoWUC6hlcEJzeHQ4xbQ9?=
 =?iso-8859-1?Q?k1WZPeyyWETZSREG6WQtkEry5OpleZsRWcZ1HTj1O0x2QFjXV/Na76yuU0?=
 =?iso-8859-1?Q?h6ArHIunwmFReB27mN6pK0GegLGN5f9AzkKajKFQK9Z29cm82ZJr8/Kd4g?=
 =?iso-8859-1?Q?tmoiFo15lv6dhV0wqwGk5WKP8Xt2YkVDucAyOu8yUiul39sdfcacyFrAJZ?=
 =?iso-8859-1?Q?yyK+PfdaBh5DW2SnrAhQrI7AbQ4WFRo+UJC2m2thI4qF1ciaXV5yI3QYms?=
 =?iso-8859-1?Q?9An6Q7fR+jf5AMi1nMKHMTgZ1+BQJUgXhVx+QZiILEFDzjpsB0l7rgCJJm?=
 =?iso-8859-1?Q?DWbEfuQq2rkGgMlcNUju3qnHFpopdkKvmKFNFjQRzfh5WdT+iSaCLhXe9+?=
 =?iso-8859-1?Q?507GxEaS9b7NXrmWojD6uSSmDoCkGbYdiR66SIrrY54DtUNL+JyRq4Z3aj?=
 =?iso-8859-1?Q?RRFrufa0X7ckS8r57JlpkYWpUlfSqQoPPB+WVJ7CppWQIIkHGxp72Groz0?=
 =?iso-8859-1?Q?ZgCb09m2MQ7cP+e4ubrjadvaTcnsbw6kXo2bDPsXxnsCvknI86Wf5ixIAv?=
 =?iso-8859-1?Q?tQ9Zi+LmweLcXP3tmnZy2IU4YCDPpeRyTBK3Bzg7nIhKdDa0avsoeJuE5R?=
 =?iso-8859-1?Q?DSl/LKANCtq5q5ddSHGRWSp/KXGFBCyW1105Hy7ubhbnOYf9GTK8WsJCaW?=
 =?iso-8859-1?Q?l2hKDTjhOB3ydcpYoECOSvk8qd8x5JaorzorLc9iK3YCPE6HUzddTrdOqm?=
 =?iso-8859-1?Q?toS0fugWod/snl9t6UEk0c/8PNyqTvP8z1bovrWhoDZxtt9UTbFkAHPrwI?=
 =?iso-8859-1?Q?ne0+nSBHdHJidahRVz+Gn9ik4eka99Yt6t0QCg+r4vFdCjfXpCVp4qZ1tC?=
 =?iso-8859-1?Q?pXp1fSqPnyxxA3inrM4hUMhPq6c7IKTvKpS5IGJub2GKB/tddVNCWv/EIs?=
 =?iso-8859-1?Q?NAgOGA96LpWhv+6bJxgQ/LzH72188tfX0IFSjZc0jFaAeQdu/aC5X24HRb?=
 =?iso-8859-1?Q?VEBNQDxl0DQY+Oq7/A4J25gBeGpfv2NJm3eGSZYs4sUN2mpgi/Dk4Syg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 851d8857-459b-4890-27a3-08ddc914ba08
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2025 11:41:39.6908
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +TbD0RpZ1aDLvP+A4HHHknS/fxCjztTQlSF8vgrgxJGss4vgmhDAD5mfLwGSbW5NYKQnBHAjPABtFgdblVtwZQvuOOZPGnzoZGs0TH+TwAY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10809

From: Grygorii Strashko <grygorii_strashko@epam.com>

Add documentation section for Simple Arm SCMI over SMC/HVC calls forwarding
driver (EL3).

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

Changes in v5:
- rename dom0_scmi_smc_passthrough in documentation

 .../arm/firmware/arm-scmi.rst                 | 177 ++++++++++++++++++
 docs/hypervisor-guide/arm/index.rst           |   9 +
 docs/hypervisor-guide/index.rst               |   1 +
 3 files changed, 187 insertions(+)
 create mode 100644 docs/hypervisor-guide/arm/firmware/arm-scmi.rst
 create mode 100644 docs/hypervisor-guide/arm/index.rst

diff --git a/docs/hypervisor-guide/arm/firmware/arm-scmi.rst b/docs/hypervi=
sor-guide/arm/firmware/arm-scmi.rst
new file mode 100644
index 0000000000..a084c0caa3
--- /dev/null
+++ b/docs/hypervisor-guide/arm/firmware/arm-scmi.rst
@@ -0,0 +1,177 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+ARM System Control and Management Interface (SCMI)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+
+The System Control and Management Interface (SCMI) [1], which is a set of =
operating
+system-independent software interfaces that are used in system management.=
 SCMI currently
+provides interfaces for:
+
+- Discovery and self-description of the interfaces it supports
+- Power domain management
+- Clock management
+- Reset domain management
+- Voltage domain management
+- Sensor management
+- Performance management
+- Power capping and monitoring
+- Pin control protocol.
+
+The SCMI compliant firmware could run:
+
+- as part of EL3 secure world software (like Trusted Firmware-A) with
+  ARM SMC/HVC shared-memory transport;
+- on dedicated System Control Processor (SCP) with HW mailbox shared-memor=
y transport
+
+The major purpose of enabling SCMI support in Xen is to enable guest domai=
ns access to the SCMI
+interfaces for performing management actions on passed-through devices (su=
ch as clocks/resets etc)
+without accessing directly to the System control HW (like clock controller=
s) which in most cases
+can't shared/split between domains. Or, at minimum, allow SCMI access for =
dom0/hwdom (or guest
+domain serving as Driver domain).
+
+The below sections describe SCMI support options available for Xen.
+
+[1] `Arm SCMI <https://developer.arm.com/documentation/den0056/latest/>`_
+
+Simple SCMI over SMC/HVC calls forwarding driver (EL3)
+------------------------------------------------------
+
+The EL3 SCMI firmware (TF-A) with a single SCMI OSPM agent support is pret=
ty generic case for
+the default vendors SDK and new platforms with SCMI support. Such EL3 SCMI=
 firmware supports only
+single SCMI OSPM transport (agent) with Shared memory based transport and =
SMC/HVC calls as doorbell.
+
+The SCMI over SMC/HVC calls forwarding driver solves major problem for thi=
s case by allowing
+SMC/HVC calls to be forwarded form guest to the EL3 SCMI firmware.
+
+By default, the SCMI over SMC/HVC calls forwarding is enabled for Dom0/hwd=
om.
+
+::
+
+    +--------------------------+
+    |                          |
+    | EL3 SCMI FW (TF-A)       |
+    ++-------+--^--------------+
+     |shmem  |  | smc-id
+     +----^--+  |
+          |     |
+     +----|-+---+---+----------+
+     |    | |  FWD  |      Xen |
+     |    | +---^---+          |
+     +----|-----|--------------+
+          |     | smc-id
+     +----v-----+--+ +---------+
+     |             | |         |
+     | Dom0/hwdom  | | DomU    |
+     |             | |         |
+     |             | |         |
+     +-------------+ +---------+
+
+
+The SCMI messages are passed directly through SCMI shared-memory (zero-cop=
y) and driver only
+forwards SMC/HVC calls.
+
+Compiling
+^^^^^^^^^
+
+To build with the SCMI over SMC/HVC calls forwarding enabled support, enab=
le Kconfig option
+
+::
+
+    CONFIG_SCMI_SMC
+
+The ``CONFIG_SCMI_SMC`` is enabled by default.
+
+Pass-through SCMI SMC to domain which serves as Driver domain
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+This section describes how to configure the SCMI over SMC/HVC calls forwar=
ding driver to handle use
+case "thin Dom0 with guest domain, which serves as Driver domain". In this=
 case HW need to be
+enabled in Driver domain and dom0 is performing only control functions (wi=
thout accessing FW) and so,
+the SCMI need to be enabled in Driver domain.
+
+::
+
+     +--------------------------+
+     |EL3 SCMI FW (TF-A)        |
+     |                          |
+     +-------------^--+-------+-+
+             smc-id|  |shmem0 |
+                   |  +----^--+
+    +-------------++------+|----+
+    |Xen          |  FWD  ||    |
+    |             +--^----+|    |
+    +----------------|-----|----+
+              smc-id |     |
+    +-----------+ +--+-----v-----+
+    |           | |              |
+    | Dom0      | |    Driver    |
+    | Control   | |    domain    |
+    |           | |              |
+    +-----------+ +--------------+
+
+The SCMI can be enabled for one and only one guest domain.
+
+First. configure Dom0 to enable SCMI pass-through using Xen Command Line
+**"scmi_smc_passthrough"** option. This will disable SCMI for Dom0/hwdom a=
nd SCMI nodes will
+be removed from Dom0/hwdom device tree.
+
+**Configure SCMI pass-through for guest domain with toolstack**
+
+* In domain's xl.cfg file add **"arm_sci"** option as below
+
+::
+
+    arm_sci =3D "type=3Dscmi_smc"
+
+* In domain's xl.cfg file enable access to the "arm,scmi-shmem"
+
+::
+
+    iomem =3D [
+        "47ff0,1@22001",
+    ]
+
+.. note:: It's up to the user to select guest IPA for mapping SCMI shared-=
memory.
+
+* Add SCMI nodes to the Driver domain partial device tree as in the below =
example:
+
+.. code::
+
+    passthrough {
+       scmi_shm_0: sram@22001000 {
+           compatible =3D "arm,scmi-shmem";
+           reg =3D <0x0 0x22001000 0x0 0x1000>;
+       };
+
+       firmware {
+            compatible =3D "simple-bus";
+                scmi: scmi {
+                    compatible =3D "arm,scmi-smc";
+                    shmem =3D <&scmi_shm_0>;
+                    ...
+                }
+        }
+    }
+
+In general, the configuration is similar to any other HW pass-through, exc=
ept explicitly
+enabling SCMI with "arm_sci" xl.cfg option.
+
+**Configure SCMI pass-through for predefined domain (dom0less)**
+
+* add "xen,sci_type" property for required DomU ("xen,domain") node
+
+::
+
+       xen,sci_type=3D"scmi_smc"
+
+* add scmi nodes to the Driver domain partial device tree the same way as =
above and enable access
+  to the "arm,scmi-shmem" according to  dom0less documentation. For exampl=
e:
+
+.. code::
+
+      scmi_shm_0: sram@22001000 {
+            compatible =3D "arm,scmi-shmem";
+            reg =3D <0x00 0x22001000 0x00 0x1000>;
+    ->        xen,reg =3D <0x0 0x47ff0000 0x0 0x1000 0x0 0x22001000>;
+    ->        xen,force-assign-without-iommu;
+      };
diff --git a/docs/hypervisor-guide/arm/index.rst b/docs/hypervisor-guide/ar=
m/index.rst
new file mode 100644
index 0000000000..7aae4a0a03
--- /dev/null
+++ b/docs/hypervisor-guide/arm/index.rst
@@ -0,0 +1,9 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+ARM
+=3D=3D=3D
+
+.. toctree::
+   :maxdepth: 2
+
+   firmware/arm-scmi
diff --git a/docs/hypervisor-guide/index.rst b/docs/hypervisor-guide/index.=
rst
index e4393b0697..520fe01554 100644
--- a/docs/hypervisor-guide/index.rst
+++ b/docs/hypervisor-guide/index.rst
@@ -9,3 +9,4 @@ Hypervisor documentation
    code-coverage
=20
    x86/index
+   arm/index
\ No newline at end of file
--=20
2.34.1

