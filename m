Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0278A379ED
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 03:49:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889653.1298720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjrCG-000204-KX; Mon, 17 Feb 2025 02:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889653.1298720; Mon, 17 Feb 2025 02:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjrCG-0001wM-Cl; Mon, 17 Feb 2025 02:49:24 +0000
Received: by outflank-mailman (input) for mailman id 889653;
 Mon, 17 Feb 2025 02:49:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eGlc=VI=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tjrCF-0001oi-7i
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 02:49:23 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061c.outbound.protection.outlook.com
 [2a01:111:f403:260e::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9dc3a31-ecd9-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 03:49:21 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS8PR03MB9534.eurprd03.prod.outlook.com
 (2603:10a6:20b:5a6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.15; Mon, 17 Feb
 2025 02:49:16 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 02:49:16 +0000
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
X-Inumbo-ID: c9dc3a31-ecd9-11ef-9aa6-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DOLbkcSoUti4E8QpBgElRUQytOxhtm/wLQMAT6FLP4u+xjGkdclKRez+8s1zvZAjv1zXo3tthANrKDR+ELrtMjh4NewidCAfQtrlcrkIXfer95BwFLhMCL/EGf56X13p3Ab6oU1eL/+gT24rVw+pWtDcJ/2x3UW9jY84ehy3q0BYGrpauErqxQKrKw1EQFz6fOIkC4yGuISTYx+3XmOAygjyooZ+ILpRroYVmqsSCAIeWC+p89ErdUjnbuiqmRKad4XLgLQv1KUaTAptItkx99kzH9mVtWSqTLaR90DeiG9VP6+JroqkPRlAIJKZIgr9O7eVk325OhlnZ02zUcjqkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdp/fdN2mzw2PgAFGJpi2VO/6a3gEOR8F57pE28Qr+E=;
 b=sfbunB+i12sWNQVq4xUU3uWRE/PK1lc46rn1IGJGYtAKpbpXxnHbgZl3LS3b7sOdw5APikY/GS0b/To1CZ0a0uvpL+5k+jgKnjUN1uE7BZWwSnxrPLkOEAwb+TrdsMBbjDr3ryAuwAhRxX3igOs0GZFJWzk4Js4EfQChERdccdex25wNnw6lNL/wHcHFcsL9SuBtYiIimrPkUQVhaYuISpeG8iNzzOeBh+GMYYYcI+eC7aZZdiwA6uczBf1Wy219DAef6NsUJ8/OHjRwN4P/1KE6qjiwZ655W5B3s2BOUgomVH/pWAZEJPbMYAx5uaPR5aKRH7JEuqy+Djj3oWZF1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdp/fdN2mzw2PgAFGJpi2VO/6a3gEOR8F57pE28Qr+E=;
 b=RUL4iW5IUoYtMP4bDOr68XIsazeuEm03ue17uf3azud/KD83+6o03RcwT3NrjjDu5O4m3img5uMO6/gots/ejPWsN58q+oWZEz5vCAUxQ2y8MnWb0hTRoNlNy+Xy+q4llxi5/gxYPb7bolmOK4fFHTKG2vW5lYzpATfiETw2hr58rttbU91W8n7zcmlteI7oCuVW4yPyeXgvIEijW/erEsqlowmTRC6FhCnG2bvgWY8zFyCCCXATjO0rwYugJtcm6oNQXOrIDUZsdr6NLPaOL0OJ0YQm2PvxcAhaeSB3IsfjUmjSuQ74bZBYvEnqHZBlMHdCFgX6BULazmXM54Pinw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Samuel
 Thibault <samuel.thibault@ens-lyon.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>
Subject: [PATCH v6 0/4] Add/enable stack protector
Thread-Topic: [PATCH v6 0/4] Add/enable stack protector
Thread-Index: AQHbgOaIAYB+EklrCUeAar0rpJRSow==
Date: Mon, 17 Feb 2025 02:49:16 +0000
Message-ID: <20250217024848.3059635-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.47.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS8PR03MB9534:EE_
x-ms-office365-filtering-correlation-id: 0c783838-b765-4426-ac6d-08dd4efdab52
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?l4TEFPfBFCBHZsjJngQMgKbTGVZPcPnvbqZdkKXMu6soD0VTZgiRI+3HN1?=
 =?iso-8859-1?Q?ZjqIFYF6tBmlVeyiKJ0sbeYI5S+K+PRZk4J4SzTQyVaLsaItYyXoC6aMYY?=
 =?iso-8859-1?Q?8ZYMtxRPN43xKL90RqU4XvI2t7aRfWFKMxY5+rb6CpjBFcOzPt2yYPE02h?=
 =?iso-8859-1?Q?WhfBGa81TVZxA+fG/TBj1wqttr4wxics8xPMGHXv60/vh+aEOgGxSf2jWq?=
 =?iso-8859-1?Q?+2Hw+C3wf4Lnu27WgV8gB3kpX1wEumJEDKeBYwW/Tfo0rtpOVdUD6Hhgi1?=
 =?iso-8859-1?Q?G/B2Nk6qX0U6TEKY/h1V8s6pUhn0mt50TY9WaIYguLvxF1L6rThtDUl9qq?=
 =?iso-8859-1?Q?tQseFJWtzoER2DYWXDTu1q4aFfYq7Y7h6kPs96E2dgrQNZ/ju8LS3SHHjF?=
 =?iso-8859-1?Q?R/b6mRgXY+M9BBLChXAJljPJCX+vvIaCqVJxQU+87ZF2gCeUWUyhsd0o/D?=
 =?iso-8859-1?Q?Somte7cPslkAaE4ErW5bGf5nNw+54dK4pNAfv681NBsP/RScwKdShdroTt?=
 =?iso-8859-1?Q?vprI9culWwkdbbl8FMO5Kwpf+ymGFxGDr9JMSAwxxOEPohD+7YWqvVMk6f?=
 =?iso-8859-1?Q?1Rr9YrZuaxFnkeDJVQt3vqAI1ISQvZezGqU7aTtI5QyyWJ5TEBpZCej9n2?=
 =?iso-8859-1?Q?J9gHXo2B70yEIVeUujTTNkVxv7JJXxncOgKOkd8E2mKsi4uSfp+hzWRu3Q?=
 =?iso-8859-1?Q?E3fuE6T3D0MxYGcgMoMm6Hmjp++cuUo4G7k6/WtgmqL3MihhqVvCnOZNJf?=
 =?iso-8859-1?Q?JYRavotYNjN0LTnEHN798ck9gIOwcCDjg7c6TKFx1+QNxWjBpLAGho0GOB?=
 =?iso-8859-1?Q?c+4cEMJSl5WH8UCujgUqZ6DM8mKGnZKzFwX6BwEk3mVPwap6TOV2nyBPKd?=
 =?iso-8859-1?Q?2T2+fvwYGBB8lIXkOIWOORkpHfEHl/1E4XMn2er8xKKZ6YrQ0PZaJH1GTg?=
 =?iso-8859-1?Q?Q1BMnUtIxLBLIxHolXaMPhV/TJrWugJzSqgwF1umBBvqQ+LKpH/IzuN3bG?=
 =?iso-8859-1?Q?DugQXqC0V0FhJhhBGbQ6fR2VgzThzK2/FyhlVkFIAY9Jz/fgYQjvQjrFh2?=
 =?iso-8859-1?Q?lzdMN0dNXInirsclha+wo0IAlyhwPSs31NcywrY55FCDfrAcL9f5QsTQAp?=
 =?iso-8859-1?Q?c1+cWjNuzquFmNQiPdASZYT158k+XLDtnvoNxLY+LLTOMtzvKVIXzrrqsa?=
 =?iso-8859-1?Q?ujf9ARrspqHSg9wJdD18Ttb8tq+K278VDARXoO+khOIwIDPwRD2wtxhQL/?=
 =?iso-8859-1?Q?OZcEXni/Y+2qszow3G2wdv9v4ZES1n6ljZVMh3Bhh0KEkOLCoEJ5crEV4C?=
 =?iso-8859-1?Q?W32wrhypa+NNYFc3w6ta2U2CneHva3Yt+hZUUDlFHrbDOh3ceEwgO+ZgCW?=
 =?iso-8859-1?Q?vK4vCblctr9e0Ogk6VDkGX6cH+dfATS1mbzGSr4lxLxyn9hUouOVDhrCSI?=
 =?iso-8859-1?Q?sAVz0HohCig/ze1DkfqbRnNKZ5Wi7IfT0ub0YRXyGAvI8Q696ADqrZqTFK?=
 =?iso-8859-1?Q?KIHJadh4pRLN6QufgPYGq1?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?8Uum7pVlRs/Z92o8z3miuDcvlwm9Yj8Bu1zlPotmYwWxguUQvyGRUOfT65?=
 =?iso-8859-1?Q?KM1d7khndsVZJIbG12DKTvrse42TRr1pgmiYXTz6cqXLT68Etb082xDO74?=
 =?iso-8859-1?Q?NXi43k4bgywuvfXd4u+zeF2n031oCGwViRm1+dxzMrmjNHVvXUAjz1KVbh?=
 =?iso-8859-1?Q?p2DeewBfe9HxN8zWOnC1BKd0AFXXD63A9JdEmG1aCfDNhwoV/b4+0P4PVe?=
 =?iso-8859-1?Q?fe9wmSzLqUxrURdr1JeUk+VjZ76jQOWQoU0d+vCKI66Wx2++d0XIAO41Az?=
 =?iso-8859-1?Q?Q6ZUpuAToGrfsqEvvWXGzBY6cwRpRcvbq0phC0N8zuam7wa7HvKn6k1jWo?=
 =?iso-8859-1?Q?UgFBGGzaPWjW5ESr1ygvvSYbroD/IRND/cD1wPr885nwHkKbr8bXQ6z00f?=
 =?iso-8859-1?Q?jwhBO5h4FyJD59gf3HT00g7eTg0BN10zFT/CCPzgZvK+h05SkHSrX9NEPx?=
 =?iso-8859-1?Q?TwrXsgYi7Z5KmANILnejdKRs1BV8Wtkn5ZTk3GVNnu4/ZC8TOE0RJ75KuV?=
 =?iso-8859-1?Q?Kuwo38HvgNs15eBUUgrfH7aqzBwdMn8J/sBBUKEGG7FBeAU867SG6BIdmv?=
 =?iso-8859-1?Q?VHj/zJ9QdQ/KS/VO0MZoRILAliKHuxgzPckeYA6kLIWBDl/HqgyPlkJBtq?=
 =?iso-8859-1?Q?oxbUSu1r6o41QD6PEA/O/RZ3HlxRh23Aqz0/pae6v/A4hUEo5hA6z8bLfs?=
 =?iso-8859-1?Q?TIjy7EiYxflJrFVfTfFFmJU2Cksuvq2p444geZxKsbHyNPilEASdTlBCBO?=
 =?iso-8859-1?Q?udoiSH8xC8BYIQev1p365ywNIgFcX37WxICKm71jDjasB4sxWi2koznnvk?=
 =?iso-8859-1?Q?RH9XZmcSchWV7IdUIZ03UjzsuA+9swo3D8KlntinqYi3dda0esZM8k4QMM?=
 =?iso-8859-1?Q?KopsVtrt7SuOhaGe6svM0qR+wCYytxDlByq4nayBzjUKp9N4wDANcIqVvX?=
 =?iso-8859-1?Q?c/L1B8AMEj4X0h8EvDlE46/AUurj0qbBpCSTthXhsHC11geyME5UnrtIUf?=
 =?iso-8859-1?Q?G0J5qXi5sb1CEFwop0FQdwRu2MRauuSOTndRrB8wfZjG1Pb8+Kd5T2tCBX?=
 =?iso-8859-1?Q?TTAaxfej961lkusnX/dD8WQdAeKrS1otNgA1/u2bbfaLnZeLTZt6yaic2/?=
 =?iso-8859-1?Q?6GS5Tlkx47ndnh32PpfXHswsX6VvBEuG4Qwww/BoryDgl4AOHLwnveHGJS?=
 =?iso-8859-1?Q?Bl0FEB9NDvdVaIZJ1sqm3Wc3DxYDmkC12TkYtYT3QULYggnYWZ/Jdwj4Zz?=
 =?iso-8859-1?Q?CHJjw02S3D9vngWH9km/k5cncPHIJjA41WYP8wp9Qe7sUNNevasuPbu1DX?=
 =?iso-8859-1?Q?DiYm6F/iTXFl3zSf7pfNhTVssfS6AXN1BiGmSpb18OseuJKR6naxk4uhFa?=
 =?iso-8859-1?Q?vkcPBBlVuTlDhfhrfGI0MNHeuoWLfLQR+IcR3v2udNOKM1JPViHA8hK2W6?=
 =?iso-8859-1?Q?MUVzWaHFt026Ky5qQKJ6MsBpy6vVwk1Bx1JgMiAXJakMWMtxHnkzWk5EeH?=
 =?iso-8859-1?Q?Pk504mLU30+VdQtwgtXyo+vHG1Y35wI39HVfl8ruVU9OPaVHni4QiAnFIM?=
 =?iso-8859-1?Q?NGQN+jQ7wG1BXhW0EjghOIDaCh1zx7tZHNJ0302bN3fpkbTTgloM7I5YjD?=
 =?iso-8859-1?Q?YhdaPYJqz0rzBD1AwlqtkDtr3SGiIU4BW0tbWmqmjRJnQMgrTdM1EAaA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c783838-b765-4426-ac6d-08dd4efdab52
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 02:49:16.4043
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0X3/bn4xYxtxZiThEDhTkYvM52RnDNA7VM3nAikxZCKHuZjWq1Vuk8mbktByk37xi0f+ckT2YpV8VlK2v2PETQ+KwV/hwmMmsT5dOdSBvFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9534

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

Previous version of the series was acked for 4.20 release.

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

Volodymyr Babchuk (4):
  common: remove -fno-stack-protector from EMBEDDED_EXTRA_CFLAGS
  xen: common: add ability to enable stack protector
  xen: arm: enable stack protector feature
  CHANGELOG.md: Mention stack-protector feature

 CHANGELOG.md                         |  1 +
 Config.mk                            |  2 +-
 stubdom/Makefile                     |  2 ++
 tools/firmware/Rules.mk              |  2 ++
 tools/tests/x86_emulator/testcase.mk |  2 +-
 xen/Makefile                         |  6 ++++
 xen/arch/arm/Kconfig                 |  1 +
 xen/arch/arm/setup.c                 |  3 ++
 xen/arch/x86/boot/Makefile           |  1 +
 xen/common/Kconfig                   | 15 ++++++++++
 xen/common/Makefile                  |  1 +
 xen/common/stack-protector.c         | 21 ++++++++++++++
 xen/include/xen/stack-protector.h    | 43 ++++++++++++++++++++++++++++
 13 files changed, 98 insertions(+), 2 deletions(-)
 create mode 100644 xen/common/stack-protector.c
 create mode 100644 xen/include/xen/stack-protector.h

--=20
2.47.1

