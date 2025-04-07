Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A71ACA7F069
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 00:41:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941214.1340750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1v8u-00073z-Ew; Mon, 07 Apr 2025 22:40:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941214.1340750; Mon, 07 Apr 2025 22:40:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1v8u-00070M-As; Mon, 07 Apr 2025 22:40:36 +0000
Received: by outflank-mailman (input) for mailman id 941214;
 Mon, 07 Apr 2025 22:40:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=taXB=WZ=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1u1v8s-0006OT-NM
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 22:40:34 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20605.outbound.protection.outlook.com
 [2a01:111:f403:2607::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4faa0187-1401-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 00:40:31 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PA1PR03MB10914.eurprd03.prod.outlook.com
 (2603:10a6:102:48a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 22:40:26 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 22:40:26 +0000
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
X-Inumbo-ID: 4faa0187-1401-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jJUznvMJ1KTrn5Ou3q1ACETKC14quAKouBhkKhpzZw6SvQoZJs3mMlg4N1EjSkpWOWUzIe896Q5JbjQQs+xQqpQv3pH6ivy1JIjbSW3deTZ0sBOLOrOSYX7nGydUWADz/5UpMSoYRr6GSWqx6yUjf/vVg4zxoYIV+diCrB8y+TIuV5+wbkpplGWRrTUosZxacFKM3sLW7/cG0KDHsxL1kDz0MGVxQrBQPxuAHkVGjNbsT9OJTkRkn567FC26mZaLFGaR7q5V5zlVChIzUxXBDn7bs+dgidUGatST2Z7UXv/T4p40v5fIwFF0BUx+RRhMx8L6FHYddNexjy2blodG5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJZ1VK1dH0aQT5LROQf9UQqgdUMpjf/S9LRF/mvQYd0=;
 b=JUbaPYZcMG1gLQCHt3uI20iNS12v1vt5uMxtVgEDpVPeEnK5YIrNP0MTR/vH9p3opIMnZcblvuZ0P14XKVX/qQvt7cogFMN12wPyG7J1FIXV5jq2x/TnzYQNQTk1tDfPHRa2qzNkF0mOZdl4jfhY6ZvBnXF4ZzB0SKlA4DqfQaN5e3V1Alp/qCn0EijR0H9er/MXUAC0vEzeIsKdehrb8h/2qtpGOPWj9bPlWJvNXAsZHwor0AidNUyrHyGYl+rodbXohN5k+YQmW8Vwd1j0Um6VIn7TTYn2xLIU1fD5WjSU4a07b7yEfQugeRF3uUFK31Soww44NCT1bbby+f7E6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJZ1VK1dH0aQT5LROQf9UQqgdUMpjf/S9LRF/mvQYd0=;
 b=Av7K7tFZwEtrY+1Imx9eaofO/dVdsxOzocxhPsqvGettxE6/r6y+jb35uF47GZp2rb0FX5BQibLE3HqGOSg0XmjJVf0DUVVtqepM3fRKgwceNL5YKrsYhm/XjGxXyGGe2E8E1nLp+6+wTJX/Q2UT52sPtMdfm/VrVN96VqOBGKabYwuYta6HG4nXu6qbdJyi5XTDTQG0eIEMO9j1ABsYDpj00BaZMO+clq57Oreg3OgKOjvqgZHuRbDBN/Mja5vYme41WBcd5hY7/cY+nmlZwRP0gAcxX9CsQN2VL7H+pSuAkQXdYo6BusqRbfVuECNxUFCzTpKRwVnbkJkOPTxeXA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v8 0/3] Add/enable stack protector
Thread-Topic: [PATCH v8 0/3] Add/enable stack protector
Thread-Index: AQHbqA4O1S8K2RG8Nk6rnhLaMaN4aQ==
Date: Mon, 7 Apr 2025 22:40:25 +0000
Message-ID: <20250407224009.2577560-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.48.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PA1PR03MB10914:EE_
x-ms-office365-filtering-correlation-id: 19572e48-e3fb-4ce8-1f7b-08dd762530ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?rTO1Pvwte705+MilLk6RM5LMvnVShmAphxIkmmBj9F+C+V9mkzbu1fV2wL?=
 =?iso-8859-1?Q?GrAypcsv8JNd/TUhedorTO161gXhFn0/Y+QDLaaWaVbck1wBdRtomCWh4m?=
 =?iso-8859-1?Q?GTptqR3lruPNV0q2nIvtqBhtJEucujG72vHsco+dCTi4mn25c1tdo3m9CX?=
 =?iso-8859-1?Q?mJWLa41sKnx7XWxdU8z34llfN3ONgsoNwpFEZsYFM7Tv2Se0OPLwz2+JXD?=
 =?iso-8859-1?Q?Yvu80oT2Y8DpSZG5/IbfRRABYPOhSBW4lfu4ZlfLx+AymQuZIe6+g5NXXd?=
 =?iso-8859-1?Q?BvKwmNOvxQNhuQrMe4IZ7tVrmQ+HPkXRYLI8MLBWA1H2rYrlGjHmEI3bCo?=
 =?iso-8859-1?Q?7VffA/BhTJmW8WCKggpaJZ0BH6MbmxGw/DsS3r4tsN07pD5aq3x0SHh1qk?=
 =?iso-8859-1?Q?HuR96gSy9S+LX14M6mOFmfcgaxitaqnRUZ73MiqsSXhw5bMoHMi5GoucxB?=
 =?iso-8859-1?Q?TAKDi7B7TKGlJqSeQS6oV7Pv5/X73jlmHAJJmcROPefMuUe1b8KVTAlGCA?=
 =?iso-8859-1?Q?tPH7lAw1SlyAFWJS94oBnOUyXoZF8W88RZl70GzbBrrlvKNtdzGpIvHGMn?=
 =?iso-8859-1?Q?7JQWBWKp19h/Fz645KMzSJGQqi9bJCrtIRdDRTQf05c++g3lnj/UWZnaWt?=
 =?iso-8859-1?Q?hda/HKB6Qr4bPUl2ziUP4fJEZkQsEmRdLQMA7sUpKUBAin86tXRaSBjA07?=
 =?iso-8859-1?Q?FrjSM3oVgNYzlZNbsgf9Kn3T/cKSvMQTiWzvWymRe2MGEo9CnL8N6uN5xG?=
 =?iso-8859-1?Q?Y+uPKcwFTMxknp8YNR5dhzm9clcQcKOpMdFehyeFYbSqrVSaJGJiUbppuG?=
 =?iso-8859-1?Q?XNo1UnLxAUGabeBUwh1zekO1FOZPZb869vAVZSI/Ma4+0OPAv82PIOnbVc?=
 =?iso-8859-1?Q?dpA7iTGvq+4xEcz+FwgAQyvRu/nUB9GQw8BnA85AJ8EfVFWrOCLejgNQpt?=
 =?iso-8859-1?Q?ShDMH3H5kUZ41uCIYK5uOyKemQK1ksFhl3z9RHVDGkQEs2M8rc9XKtv85m?=
 =?iso-8859-1?Q?B18eOCXKwEyguLMFlYBKtCaHsD9Yetgys2y4ENb+OHdH6+upd3iik/wBai?=
 =?iso-8859-1?Q?SXXXoWsqIrJ7d49gDnS48UzgpPXsS/NurEmTz7owoDg7idDgKF+aZNVfYs?=
 =?iso-8859-1?Q?6izw547UNupER0nVniPFLvfGAqDHl9HwLOHvJ/UsLRWhHlPF5Lh9CRbrfX?=
 =?iso-8859-1?Q?VRfAn/6T6d5sbnHG0CxIpVP7fLfj0vn08DRlDZmg3p+ZGaRP70yAtpfIAP?=
 =?iso-8859-1?Q?wzH7GHttkuQT8b4L4ieOgQ22f+a8UWiqP4Fdm+NSdmtNA9lfQ8Aa2XS/9u?=
 =?iso-8859-1?Q?JoiBJcsiVs7+NsXRvdLkCnzJcb4a5nlzrWsxyxb0BBzsuF3ZzZgSoftR73?=
 =?iso-8859-1?Q?BpAkpMRJdaAFwk4JnTpM3Dw4mJ0CzIfk9VFnaHE6WDsOya3sYoS7CrR+1o?=
 =?iso-8859-1?Q?sNPkIzdo0NKF6c7taz8gyugAisBciQK3XHbfMGtRX1yZnd89zJ95kPngof?=
 =?iso-8859-1?Q?OFKut27MmBjigiTtiPxHSN?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?jhH4ASZCQvhDurQn83d+0Avg1/BtCQ4KciFTCU3WKqFzusOCyXqb7AgbDm?=
 =?iso-8859-1?Q?vZvRHh49By6AlIxgwZ2qaGQlO+pW0IOgRL1G15potTY7Fg2TFskXRZnWTC?=
 =?iso-8859-1?Q?Ct/jSZUlKsRQqTXKnzU8S/fpqZ56XqvFGXdeC6CZB0dURxVJJbBRWGnLjf?=
 =?iso-8859-1?Q?X/JGefyevtYjTEEizHaEWuNQQJmmK9aycmj6BuBOUuuxZ8qxmjFv5YUd09?=
 =?iso-8859-1?Q?P2yCc3CiBC0agrl8nIkoWSfwQ0feQZLAO5hmpLhJ8WYjtqk7gemxvN+QMa?=
 =?iso-8859-1?Q?IOv19blPz6XLh6JOtLLWJiDbKaelWMmjuvuDG74Qe0yQQoc4XtEQr0Nxbx?=
 =?iso-8859-1?Q?IPWcuGOOhr/ZUTb/9wxvXGJXdSsAcWP45TeUIOoibYgc6MtTnGhrYPzYWS?=
 =?iso-8859-1?Q?vyESZyE+Q+6PnOzSCac9i0hEY8weNbXb38NwMi6Mrrll3rdfkUOxk1jnUo?=
 =?iso-8859-1?Q?lJvcA83W59STGSO1akivEYgbMv0KgO/aHi5sr4m7GdOGswwr0WWPhCX2sv?=
 =?iso-8859-1?Q?bEodV6opyVwXpARv4WW9e8KJ6ma1qrfv09Xx+193uaiuSY34gInkfZkrFV?=
 =?iso-8859-1?Q?aXYGm0dmdKr8PvGrs0aaVACl8CIQNhHnytB403I4CciIajiNapkEjvCq/o?=
 =?iso-8859-1?Q?MPz/x2hJPmpXn+8eo4Ovk1YwAp4MNhvnOEsD7ppqsZjVTii6sL6pgBBWXO?=
 =?iso-8859-1?Q?fhL6vhszX8LjoiEXQ54HQs3BfwrO7P14stjNHT1O9eW/W85dppJHbuBOSS?=
 =?iso-8859-1?Q?y3DLP0V3i8CxEr95yQeht4XVdumnap/qFIUuN9stIMv5FbQ+rmaEpxRU/J?=
 =?iso-8859-1?Q?5C6LkORQfbHX3FgbBFeY7ZSSPgJTk+fpU9Me+kww6ERpxdOpxtB1k/s8ac?=
 =?iso-8859-1?Q?jpBJnDtV3J91Ej4aH3pPvXu26SAmgb6eveKmuOtJdZiQIzCa7twH0NKmaN?=
 =?iso-8859-1?Q?0QCXPYTZ4yCWZvdPM0thybd2V6Q1atjmIVauvcy3YqxzU66DZpcEXMW7Ft?=
 =?iso-8859-1?Q?5SUk5JO/ROaf6QPO2sksBH5lookfSukL6fyv0m2ggrz+mFVqu0ItN8gd3e?=
 =?iso-8859-1?Q?p98mbiVcYuUpU60Zz2Xys++6HAFFcyT9YggQuvCjdbKW8zlXN9vF3duYy2?=
 =?iso-8859-1?Q?YaMrZaq71ghFogMtRC6SSOjziQCoh2LP4Yod0CM2goj9W+spwOsZhMNzBr?=
 =?iso-8859-1?Q?Nf70o31AyZ84bSrtI3NOe+sLEnqCtp0I+QBdQ1p5x86GbV/N59FS2UGGAq?=
 =?iso-8859-1?Q?OK61fMNwwJ6kBOOk1vL2p3jfFJ3SHfCQpC1uJa+GWwEL47LNNV0KK26umO?=
 =?iso-8859-1?Q?cOkg2JipDeLmoekxAxfUn5Dl3N6+9tLrY71WxlANIwzGZS9qm64on3s5Pb?=
 =?iso-8859-1?Q?RCJjleBBkGCRok9YUsPPz8VRTNLoPDbPdkwI8SKby7+d3AAOYo24ZgD/kE?=
 =?iso-8859-1?Q?Q6uroUU+09A684bJOEePlByFjiitBomd2xHTnHwCUMIaRIODZbXDHbn+2Q?=
 =?iso-8859-1?Q?XsgCRAc7ua0YOiiGCpVjD/VVykyqUngZo3tlO0Iu+Z1kCdhJlLu8RJvkxW?=
 =?iso-8859-1?Q?LqhQNF0t0Q/7F2x8lIP55VK/PvhwapaHj3aLCnQdnLvcsSDGaPOFq1wwyz?=
 =?iso-8859-1?Q?jhO78zfm9Nk99D6MFbZCfojjU8FnGuMIJigudbrPa/FXuqgNhvDS9OdA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19572e48-e3fb-4ce8-1f7b-08dd762530ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 22:40:26.3124
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C51nFj6fcYTXepVkWVe5q35IswfItOLxhLGU9rHqShjE8gwDl5d3SFqngZmwqIRankisHXbMLvoHi5Yfw/VVEDqwbF5+UD7BMSoIyOOK8vg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR03MB10914


Both GCC and Clang support -fstack-protector feature, which add stack
canaries to functions where stack corruption is possible. This series
makes possible to use this feature in Xen. I tested this on ARM64 and
it is working as intended. Tested both with GCC and Clang. Also tested
with "-fstack-protector-all" compilation option to ensure that
initialization code works as expected.

It is hard to enable this feature on x86, as GCC stores stack canary
in %fs:40 by default, but Xen can't use %fs for various reasons. It is
possibly to change stack canary location new newer GCC versions, but
attempt to do this uncovered a whole host problems with GNU ld.
So, this series focus mostly on ARM.

Changes in v8:
 - Added MISRA deviation for __stack_chk_fail()

Changes in v7:
 - Patch "common: remove -fno-stack-protector from EMBEDDED_EXTRA_CFLAGS"
   is taken into mainline
 - Updated CHANGELOG for v4.21
 - Updated stack-protector.h as per Jan's comments

Changes in v6:

 - Moved stack guard initialization code to the header file
 - Expanded commit message for "[PATCH v6 3/4] xen: arm:
   enable stack protector feature"
 - Dropped couple of R-b tags
 - Added comment to "PATCH v6 4/4] CHANGELOG.md: Mention
   stack-protector feature", mentioning that it should be reworked
   if (almost certainly) it will not get into 4.20.
 - Tested with "-fstack-protector-all"


Changes in v5:

 - ARM code calls boot_stack_chk_guard_setup() from early C code
 - Bringed back stack-protector.h because C code needs to call
   boot_stack_chk_guard_setup()
 - Fixed formatting
 - Added Andrew's R-b tag

Changes in v4:

 - Added patch to CHANGELOG.md
 - Removed stack-protector.h because we dropped support for
   Xen's built-in RNG code and rely only on own implementation
 - Changes in individual patches are covered in their respect commit
 messages

Changes in v3:

 - Removed patch for riscv
 - Changes in individual patches are covered in their respect commit
 messages

Changes in v2:

 - Patch "xen: common: add ability to enable stack protector" was
   divided into two patches.
 - Rebase onto Andrew's patch that removes -fno-stack-protector-all
 - Tested on RISC-V thanks to Oleksii Kurochko
 - Changes in individual patches covered in their respect commit
 messages


Volodymyr Babchuk (3):
  xen: common: add ability to enable stack protector
  xen: arm: enable stack protector feature
  CHANGELOG.md: Mention stack-protector feature

 CHANGELOG.md                      |  3 +++
 docs/misra/safe.json              |  8 +++++++
 xen/Makefile                      |  4 ++++
 xen/arch/arm/Kconfig              |  1 +
 xen/arch/arm/setup.c              |  3 +++
 xen/common/Kconfig                | 15 ++++++++++++
 xen/common/Makefile               |  1 +
 xen/common/stack-protector.c      | 22 +++++++++++++++++
 xen/include/xen/stack-protector.h | 39 +++++++++++++++++++++++++++++++
 9 files changed, 96 insertions(+)
 create mode 100644 xen/common/stack-protector.c
 create mode 100644 xen/include/xen/stack-protector.h

--=20
2.48.1

