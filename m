Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8B7B154A0
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 23:24:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063072.1428865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugro3-0004rT-Ls; Tue, 29 Jul 2025 21:24:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063072.1428865; Tue, 29 Jul 2025 21:24:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugro3-0004ov-IU; Tue, 29 Jul 2025 21:24:19 +0000
Received: by outflank-mailman (input) for mailman id 1063072;
 Tue, 29 Jul 2025 21:24:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9NAX=2K=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ugro1-0004NS-Ot
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 21:24:17 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61730776-6cc2-11f0-a320-13f23c93f187;
 Tue, 29 Jul 2025 23:24:16 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by GVXPR03MB8452.eurprd03.prod.outlook.com (2603:10a6:150:2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 21:24:07 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 21:24:06 +0000
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
X-Inumbo-ID: 61730776-6cc2-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mC5Tf+8Kdo9HVsh18czCqUwiJwaa4JgHrBNI/Uu1i2kqDb0hEK7G9xShu4ZUcz0mela6bwd18+hR3E/97O/MlvzCZGhnw1Y1eKeihcLunzAKujG5WqW0gi4O5/S1YxTJtYiOlr6AsEFDU9OcyOspk6bBzY7cDvKdxPJ/Exf/TLbANtWjBudnHz2TFgDWvzSjIEwIZSDX/mXV6H3ucf5Fvjkd5vqO2Oqw7Url+lbNi7d6NEijBYLV5hs0K5zxGSjYLVcOD1tsIG87C8odn4ndRwEaZdBKQ5aBe30RRYTx2PctG2ty0KkbcGTBhjimVIP0pVHZGKK3kdXumlXPo11sfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqyzBP/7ECWWa5W+f4BT9E5/XazcdjOpv0nn2vXlBZc=;
 b=t1UfO/6foL5H1RDsjAn0yCVvftQlJMN2X1J5agfO0Oooo064xla1HuBKa+hq0JvFN8CXZcsFp7iZ/XgHdI1fbvPTZ9wfZDMIvRMpkd8FCW8nQYnMzMkw7e3X+Rs/nrm++C5VAnbUIVqMnTqZ8MxsI1xZtogVVjquoPUY5ikBnSlsLLq/XOADqQiLrEq0xPII4FZ93PnUTMMAiOrL1uGpj8QlIK7SZ4ofr+aIcc2aynxjGOR0oBx5B9bg4HVHQVmZJ4lpokiVfzURuDNYOPFLpiUhey+Qm5Rcf9OQQaZ9xU5HyxBiAt1/+QomtXOM490lpPQh7lIzaHQPZiGGawauJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqyzBP/7ECWWa5W+f4BT9E5/XazcdjOpv0nn2vXlBZc=;
 b=CRGtY7HNCfqz5eCLPdhrwYGU4UQJlxj0byBzS2U+BetBBsxr4VO+frIqILSgCCTIy7iHLthjc27iANVz0zUS+Qn3K1xNpwxMf89z7YOx2p8Or/Gf96MHgR4dHdJkFHCmGbRXR0z02Gcl9TWgkCPGuMeu3XrcaKVlJQf+VGwPpUc7l7WIOdt1Y8yFLbbfLIhh0nPrwALsvhOtY7oAOlnmI2X4xOLk+6kilYcllj6SPeCmFqYyvGZlyanK840NJ4D/5m8EZvK3FHT7unRZVwtkv2bXmmrA1H4ibIdjWI+ze8Xx0XCN6iyGO5ubqApG8Z15+RBY/6J9annHXHD8dH5iHQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Paul Durrant <paul@xen.org>,
	Tim Deegan <tim@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>, Alexandru
 Isaila <aisaila@bitdefender.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, =?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>, Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, Meng Xu
	<mengxu@cis.upenn.edu>
Subject: [RFC PATCH 0/3] misra: address MISRA C Rule 5.5 violations
Thread-Topic: [RFC PATCH 0/3] misra: address MISRA C Rule 5.5 violations
Thread-Index: AQHcAM8d7HI4srHd2k6ANCGVzZWM6w==
Date: Tue, 29 Jul 2025 21:24:06 +0000
Message-ID: <cover.1753822074.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|GVXPR03MB8452:EE_
x-ms-office365-filtering-correlation-id: cc825e5a-f094-4944-e6a0-08ddcee63fbc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?B+WGqfrkQI0w7Ba6Ku3Gw0hwHb8h1Rki0CPiGaKHHNuM44wXo2aqgJ3mMZ?=
 =?iso-8859-1?Q?AciJ3bmm+fG1cyvYvUP5OXFK1HmpdKf0ps2YFIQQ3dBjyU0WyOF/9Xgidx?=
 =?iso-8859-1?Q?xmwtknUvgc6H1/C5QaS5eNRi9we/u4XoSdiNd3qgrmYkBxGqObXotoEyPj?=
 =?iso-8859-1?Q?PLsQo0tEiBdaSTbUWB5/hTkoexV9Vl86ascrEPsOFu7WWWgzbW/938l1HX?=
 =?iso-8859-1?Q?MmyN5l6MtjO9SmLXE5vmtA+NAQguXbNoFGk86SB4+eLBX0P7760pbaJJX4?=
 =?iso-8859-1?Q?5EvP4X6H+WtV6U4cfQ+YU2++kveReGkO4ulC1q321UhGeVrUbzfcCOJSTn?=
 =?iso-8859-1?Q?TZbMNta4m2gRzYAI/jyFMx2zM35ZAkbqXFkP+L2Pq+7svxa/IgQikcR0mo?=
 =?iso-8859-1?Q?qAa9v3ycy8mKFPkqJO6cLRQvufdrpDdGkVowHHD8qfLxpRPzqh+ygg9WZ5?=
 =?iso-8859-1?Q?i500nKR7xQP1UPKiwvjyIZkfcmK0T9MKF1zGfN+F6LzDrnqEfThq6F9P95?=
 =?iso-8859-1?Q?99hK31Vl+uUZObqOeU5QcuEsmgy0PLxHOCa/6CzwMplozCwUjFd8uKS8uL?=
 =?iso-8859-1?Q?6PCcGNKj6F0bQR3ccRnt32/H9j82+vWT934WC90P5/vVMZ60nbCKRwMFtV?=
 =?iso-8859-1?Q?SdC3D/qHAHL53/08T5A1Ooa7m7VqZ54qV4aezDX1ef1W4UUnrNxSiyJQRU?=
 =?iso-8859-1?Q?QgtMhcYUp5IC6QhUI4foXbJi3eJO+I17QleX2cuwTJ33khc1pbkdn8ccRt?=
 =?iso-8859-1?Q?T6yjXvblQJtpmxZpR+vtQM4VnKO7dU/QuZYy8H73uqyke9NlruVTDazrxc?=
 =?iso-8859-1?Q?qPjkNEwJI5F1oX9JU4Q+TVregKdtA52mriYnbV6DVjvY/s9Uv524yKfn0n?=
 =?iso-8859-1?Q?z93GaZ8n+RUKkNW8PLDhntXmStT6ulBkdl1iOCulDqMMqa1uZylvKLSrak?=
 =?iso-8859-1?Q?1d5qr6hX/BCXQJc2ZvCxhZk8dmhOPtLzbJ4VDc0oXxb/ngmKC3FQ7Q3mEa?=
 =?iso-8859-1?Q?gN5NLGiYaIz+B3zA8CyDThn49HzkfQcsCXjSU3awhXx0X4To5A/xXXPDbB?=
 =?iso-8859-1?Q?I4rmm/nARll4fNKHExU/IZ3tQQ7T+h8e5W6hM1OJ7tDevd2gIw0DGihPDj?=
 =?iso-8859-1?Q?VlAYB5/dqvuOufLXL+jQcZ+55oP5tWvavMWDv/4+xfrwE/dJQahCZCfOMi?=
 =?iso-8859-1?Q?QsFE6MjnTgVL9PJB9G61V0wfLZJ0cOjbakIMnfD7Wp+W8WxPpR8d/mikYT?=
 =?iso-8859-1?Q?qu9yDlC4QuZxpaX7PbxizetXlOAD6/v03oJRr4l8ZI9mXhF/k1H2N/ZKZ7?=
 =?iso-8859-1?Q?dJDVh01aJ9BpdQoquB/nZ2vyG4hN22AjykssYvL0FTwg4ImB/FnZ7rJXg6?=
 =?iso-8859-1?Q?ILV5w0JR1rGHtwOGEHvI9LqyaywjFkiIWtfZLsboPb45Ayu0LVEOAqf+1v?=
 =?iso-8859-1?Q?bqtIlmh1FjHKEmzoFdJFNzMLLjS17KaidSCh0HE2zMRuUJK6i5iMm3t9Yb?=
 =?iso-8859-1?Q?4fUFFkkE5fbJSNzwZ/9zUY0Drn89Fp3T1Id61MijE9xw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?OyTbASzZFTG53x5WUE9cshUsjoCY+kD0gUuv/j4Fn+o/D5E2tY6JQhZGat?=
 =?iso-8859-1?Q?TjAZovUXU/it7JTpw+mJHEpLXah2Sfcs3vASgCBrOJoO2O+RflP+Ye7NjT?=
 =?iso-8859-1?Q?/yIvt+0ZhY/XC4pufxt+7xb0tdMeBoEg1Anx2j8u9HpEDYr99QLcsjKjFU?=
 =?iso-8859-1?Q?zsm77UF+dxFNdb/rvPixPYDs+uLQacC94sypJds3qFR2im1AkMni7p6MsI?=
 =?iso-8859-1?Q?IDfxPf+vgPEvaiO+CU0A1nm+bwZ5ZqCtLUWOOrg09tv7Mh4L3tZV98WeEQ?=
 =?iso-8859-1?Q?w6rlCbU+M5kEDtZfkI01epDc4xIBby4d7RnJJEN2023NDKNF+rdOH9+iFx?=
 =?iso-8859-1?Q?QzaUoqn6mYguJYip9L0qe0mqhX9uMhWfO5BByfyzT3KfyvYVaX/otl/v/x?=
 =?iso-8859-1?Q?nic2TSk/b/waqghOyM6Grw5vmD8wToYz6tvsCuc+WNFyCvOiHwLAb7ozDG?=
 =?iso-8859-1?Q?zKCBkfasaIa58AmLDokCMO+YMQKK4xxuuzavD1cGqhBYmtphuX/FbfOe/H?=
 =?iso-8859-1?Q?BebS4ri/d3xwaX339M5bXfzxTInUk9s7AKIcWZUx++J+Rblh2V7HrKSJX7?=
 =?iso-8859-1?Q?2FXs55E59qeVDPXa6zBV1f/Pp4ernvn0XZWjTZvx6Gd6Tej32yGwIP8G73?=
 =?iso-8859-1?Q?4t5BGTr7DCuGFaFndSuNySFFe/0fHa9iLUyJXTKjhAhpmai6xuDpJ91DVn?=
 =?iso-8859-1?Q?EuCGu0iZeQOrxyzdvZRg15LswpSX9P3CYLBGzmBA+MAuDVhsVe6qSOW9iN?=
 =?iso-8859-1?Q?q9tQtWoKrleAPKBYubCudARDy1KPimTyE/cTVXA4XHsRFxUpNtkha3kkwa?=
 =?iso-8859-1?Q?j3+6wgy//d7okEWVk/3zXf4+WWvFgh3SYHGOpz0zShuImrByvN8iXSp4T5?=
 =?iso-8859-1?Q?MOLvv1vHSkhNKfvZTVUySwY+/a++1SgcC5Kdtgn+YsF0oaOUMS46ePCeNj?=
 =?iso-8859-1?Q?EV4q0vjrDCVZQuq4MepPF6Vgp2mDt+C+BOzEbzP2ZbJVaBvTQfuCQ3B1Qe?=
 =?iso-8859-1?Q?nV9r4ySA+zA5IyQbARGpZokWCy38DDEzmLPwAwMQd97wEPmc1pvY1j+eU/?=
 =?iso-8859-1?Q?Yj9l68W4pq7+eR4mrw1Y3ZId6Vm8yH70LKesjP3DsCmyJJfvPMxYqt8b9o?=
 =?iso-8859-1?Q?IKlixhJQAGpD6NPvfqC2iDbyi3/0mRA4MBSjM6TwuP69Ibq+LMx84DEXDM?=
 =?iso-8859-1?Q?zSYAH/RSAb+QnTDvHkKsVRsIlj7rzaVwlbXCSaKqHjxiV0AQgRG7/GDdPp?=
 =?iso-8859-1?Q?+AdRZKecSKpYlT7t5TALhYjimJi6LyDh7EnOsFFHx2MnIh1FLm8eiOcYRf?=
 =?iso-8859-1?Q?0+rfcB18ZRhCoX9EGlmD5Kfb++xXBcP+yL2Ke1G1KzTUb/4o7bSEy3WRo9?=
 =?iso-8859-1?Q?gbw2iuDGI6dkXQFYajO/HNgqjQjqVgHmWbTtJpzCmPn7wlkBoadhQLsTfv?=
 =?iso-8859-1?Q?qqiB0HoGcMKWoalcQa798PTq+lDQRpOV/u6yV54KTJFbmRnYRTABT+KhdA?=
 =?iso-8859-1?Q?+kNLauVjAlIuVD++WKyhcCWby0PEgtC1sJTOnfZKneiBk9MWR/J/TRhUHk?=
 =?iso-8859-1?Q?eBiV4THprUNl/j7Ga1VpJrOHImvVz39au4Jz0Q4EnWIq3HUV5w6hAaZy9o?=
 =?iso-8859-1?Q?e3LqiXVHQQzlP/GZGdZpoMp1KVSb+2mLGoqplTOZOydDHRZDL4GiTAfw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc825e5a-f094-4944-e6a0-08ddcee63fbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2025 21:24:06.3109
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZqMadlCfWQyRRPotQknw4t+zJUS79vk157V9V3gQN1/CapdFKGI23xyy/JrIDgOVymhaBX1rE+F7xS+YUjFNnIJmlgwBtkbuS6K2hGAOnZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8452

Hello all!

The only purpose of this RFC is to receive comments from you on how to deal
with MISRA C Rule 5.5 violations in XEN.
The Rule states that: "Identifiers shall be distinct from macro names".
There are ~580 violations in ARM and ~3200 in x86 architectures.

The following macros violate this Rule:
__test_and_set_bit
__test_and_clear_bit
__test_and_change_bit
test_bit
set_bit
clear_bit
change_bit
test_and_set_bit
test_and_clear_bit
test_and_change_bit
get_fpu
do_multicall
virt_to_maddr

I would like to address these violations in XEN codebase.
Specifically to rename macros names with capital letters.
Like this:
-#define __test_and_change_bit(nr, addr) ({              \
+#define __TEST_AND_CHANGE_BIT(nr, addr) ({              \
      if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
      __test_and_change_bit(nr, addr);                    \
  })

As a result -> MISRA C compliance, clear and readable code.=20


PLEASE, NOTE!
I don't ask you to review this patch series.
Actually it isn't full and was created just to receive understanding how
changes would look like.
Yes, these changes are huge, that's why I created this RFC.

Please let me know your opinion.

Thank you in advance.

Dmytro Prokopchuk (3):
  misra: address 5.5 pirq_cleanup_check
  misra: address rule 5.5 gnttab
  misra: address rule 5.5 bitops

 xen/arch/arm/dm.c                          |  2 +-
 xen/arch/arm/domctl.c                      |  2 +-
 xen/arch/arm/gic-vgic.c                    | 26 ++++++++---------
 xen/arch/arm/gic.c                         |  8 ++---
 xen/arch/arm/include/asm/cpufeature.h      |  2 +-
 xen/arch/arm/include/asm/gic.h             |  2 +-
 xen/arch/arm/include/asm/guest_atomics.h   |  4 +--
 xen/arch/arm/irq.c                         | 16 +++++-----
 xen/arch/arm/tee/ffa_partinfo.c            |  2 +-
 xen/arch/arm/tee/ffa_private.h             |  2 +-
 xen/arch/arm/traps.c                       |  2 +-
 xen/arch/arm/vgic-v3-its.c                 |  6 ++--
 xen/arch/arm/vgic.c                        | 10 +++----
 xen/arch/arm/vgic/vgic-mmio.c              |  2 +-
 xen/arch/arm/vgic/vgic.c                   |  2 +-
 xen/arch/arm/vpsci.c                       |  4 +--
 xen/arch/riscv/cpufeature.c                |  2 +-
 xen/arch/riscv/include/asm/guest_atomics.h |  2 +-
 xen/arch/x86/cpu-policy.c                  | 14 ++++-----
 xen/arch/x86/cpu/amd.c                     |  2 +-
 xen/arch/x86/cpu/common.c                  | 14 ++++-----
 xen/arch/x86/cpu/mcheck/x86_mca.h          |  2 +-
 xen/arch/x86/domain.c                      |  2 +-
 xen/arch/x86/e820.c                        |  4 +--
 xen/arch/x86/guest/xen/xen.c               |  2 +-
 xen/arch/x86/hvm/emulate.c                 |  2 +-
 xen/arch/x86/hvm/hpet.c                    |  6 ++--
 xen/arch/x86/hvm/irq.c                     | 12 ++++----
 xen/arch/x86/hvm/svm/nestedsvm.c           | 10 +++----
 xen/arch/x86/hvm/svm/svm.c                 |  2 +-
 xen/arch/x86/hvm/viridian/time.c           |  4 +--
 xen/arch/x86/hvm/vlapic.c                  |  2 +-
 xen/arch/x86/hvm/vmx/vmcs.c                |  8 ++---
 xen/arch/x86/hvm/vmx/vmx.c                 |  4 +--
 xen/arch/x86/include/asm/guest_atomics.h   |  2 +-
 xen/arch/x86/include/asm/hvm/vlapic.h      |  2 +-
 xen/arch/x86/include/asm/hvm/vmx/vmx.h     |  2 +-
 xen/arch/x86/include/asm/mpspec.h          |  2 +-
 xen/arch/x86/irq.c                         | 34 +++++++++++-----------
 xen/arch/x86/mm.c                          |  8 ++---
 xen/arch/x86/mm/hap/hap.c                  |  2 +-
 xen/arch/x86/mm/paging.c                   |  4 +--
 xen/arch/x86/mm/shadow/common.c            |  2 +-
 xen/arch/x86/mm/shadow/hvm.c               |  4 +--
 xen/arch/x86/monitor.c                     |  4 +--
 xen/arch/x86/msi.c                         |  2 +-
 xen/arch/x86/psr.c                         |  2 +-
 xen/arch/x86/pv/dom0_build.c               |  4 +--
 xen/arch/x86/pv/emul-priv-op.c             |  2 +-
 xen/arch/x86/pv/shim.c                     |  2 +-
 xen/arch/x86/traps.c                       |  2 +-
 xen/arch/x86/x86_64/mm.c                   |  2 +-
 xen/arch/x86/x86_64/mmconfig_64.c          |  2 +-
 xen/arch/x86/xstate.c                      |  4 +--
 xen/common/domain.c                        |  4 +--
 xen/common/efi/runtime.c                   |  2 +-
 xen/common/event_2l.c                      |  2 +-
 xen/common/event_channel.c                 |  6 ++--
 xen/common/grant_table.c                   | 10 +++----
 xen/common/kexec.c                         | 16 +++++-----
 xen/common/keyhandler.c                    |  2 +-
 xen/common/multicall.c                     |  2 +-
 xen/common/numa.c                          |  4 +--
 xen/common/page_alloc.c                    |  4 +--
 xen/common/pdx.c                           |  2 +-
 xen/common/sched/core.c                    | 12 ++++----
 xen/common/sched/credit.c                  | 12 ++++----
 xen/common/sched/credit2.c                 |  6 ++--
 xen/common/sched/rt.c                      |  4 +--
 xen/common/vmap.c                          | 12 ++++----
 xen/drivers/passthrough/iommu.c            |  2 +-
 xen/drivers/passthrough/vtd/dmar.c         |  4 +--
 xen/drivers/passthrough/vtd/iommu.c        |  4 +--
 xen/drivers/passthrough/x86/hvm.c          | 10 +++----
 xen/drivers/passthrough/x86/iommu.c        |  2 +-
 xen/drivers/vpci/vpci.c                    |  4 +--
 xen/include/xen/bitops.h                   |  8 ++---
 xen/include/xen/cpumask.h                  |  6 ++--
 xen/include/xen/irq.h                      |  2 +-
 xen/include/xen/nodemask.h                 |  2 +-
 xen/include/xen/sched.h                    |  4 +--
 81 files changed, 211 insertions(+), 211 deletions(-)

--=20
2.43.0

