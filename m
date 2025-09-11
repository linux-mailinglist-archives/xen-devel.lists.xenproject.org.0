Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D17B52B79
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 10:21:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119646.1464916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwcXu-0004aK-Q8; Thu, 11 Sep 2025 08:20:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119646.1464916; Thu, 11 Sep 2025 08:20:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwcXu-0004XH-MM; Thu, 11 Sep 2025 08:20:46 +0000
Received: by outflank-mailman (input) for mailman id 1119646;
 Thu, 11 Sep 2025 08:20:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ApBa=3W=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uwcXs-0004XB-VW
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 08:20:44 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 323dccd9-8ee8-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 10:20:37 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS2PR03MB9468.eurprd03.prod.outlook.com (2603:10a6:20b:59b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 08:20:35 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%5]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 08:20:35 +0000
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
X-Inumbo-ID: 323dccd9-8ee8-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DhgfujdFGKbgZNmB7wZtwA2+nBKxqdGVVtMR1ZPbhmhj6goPIjXfK+mXn/vLkjSU5xdhn/IPtFNXlsBk7EjLWhNDtFl62uI941b/hfCopmGpHXpgJ5w86JVNO/zb1pqZ7AjAgOzWxnU6jEpiWGrATAeYnZEXLTBaG0o6s0+aGJTrDDp6Yp9f/nAqu+lJM9EFhRvxb3I/XjF9m9HxmL4nzTow+1PUMCpp/lzVqlc2dIcTaAUYsgEsdjWnZWasl/Qq+Nnrbm9cQC95BxX+ohjtSfliY8ivw7eXHbA58Jz+9RweFgLzvmBD6i0CmNdFQIvnC86r1kgj0YAeMZipL5Wy0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ZP1/GNLyYNR7SY89GsUWKdIx7nrZHZbAe/tWpM58Vk=;
 b=Kbm40uKqQm9sIhOFFXyzFyVL3eRkmzkDe9gen1XHC3mTzItLro+RyS5efPtC9ldCILR/RvxMLDDRTIpFiYVai2kDtTmApIslRSUBTvR2DpEi9mVJujfUGzy4C+l35dBc2680uNqiK64feChsrlFvYdZpReIM7JS6mByDxerT7K31dWwzgmoR4mptFViPb0wJMJxF0tLRVfWMV2NDTT1F6V6FU5UespUatLdUcTKQ47JZVWeDI5Ozace8VFOFTc+9cGFJ3zgF3+LMaNE/aQHQEZ/DZ1qPiOSu1rN5HTPkTkAoGAbtZojKe4ou6AHIB4WDiSe/nSDKk03SrqzpdIOqdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ZP1/GNLyYNR7SY89GsUWKdIx7nrZHZbAe/tWpM58Vk=;
 b=DX7JOA8NnzBu/K4H/KneioV6F5FrYmQO+CpBNEBXHPqhOAE9HkrXxDrpviZ9Y1h6zS3s7gD9SOH/f9ds0Og4xX+mokqo1oKNcmHXXJdHA4lsWfzlzhBsM8vuf5jESISRekSOCQJlU2pJt+tr0YpKsaaekRt4oD4SDHaDz1zTEJ771MCILuvKpUIQmjLE379+r7/O1xcK/EU1Q6uSEZoCgAlj4fbuxP+ObPELcMAPzoVXPX6jx8WiSjKZuyQJimPtrm+wrpb9SMWkH9DjGiehV2ic9eO0US8+jAhDOOZMMLZgqDeWeVMJ2K1lF8A3oTLw1WGTB7kh5Qje2LjYK3ybpw==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH v3 0/4] xen/arm64: allow to make aarch32 el1 support optional
Thread-Topic: [PATCH v3 0/4] xen/arm64: allow to make aarch32 el1 support
 optional
Thread-Index: AQHcIvTyx9z2i0DJTUamNSgeNa0v/g==
Date: Thu, 11 Sep 2025 08:20:35 +0000
Message-ID: <20250911082034.1326377-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|AS2PR03MB9468:EE_
x-ms-office365-filtering-correlation-id: 830e03e5-1440-4770-6d50-08ddf10c14ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?vmTNMeoUB/BH8soVYGey1/OUhMt3JARGEjUudixBZYfrAQA8taRA2holf+?=
 =?iso-8859-1?Q?uLBWlAJLos29qVQRdfRjyrWQ4hC+zvURduMzPEu9s0SqpAdSJHjmb+O3O5?=
 =?iso-8859-1?Q?AO4cDX7NPQfjyiQcxmqqeGFLwUdqZ4nV+XUnS0ch40mczpj4A22Aheldu1?=
 =?iso-8859-1?Q?5um8o7dMjxPNpm2ZVLIQ1RGOhNDS5/lHhEldX883skWWIH8+6Fo3StDfa5?=
 =?iso-8859-1?Q?jAn6XhFbH6g9XIwLXhtwE/bWAt+AZPZvSh4LbwqLSu9KS8JFC292BQ4nq9?=
 =?iso-8859-1?Q?7tumzj5dK0Szi2EWkS2HlV/XDhAtCWs8ce+xs8D3iKMIqTDGqr0faLbjSv?=
 =?iso-8859-1?Q?uLX2oZIQ6C7ga0vhD+XAaCNPriJViD6Uz4/iH7/n/exq21bQmQmcQaq1KI?=
 =?iso-8859-1?Q?scJkwOFWCsKfQf66ExVQnpsLOvizxwIG+KAI8RFcfc8+jRXOqbMUgqInmc?=
 =?iso-8859-1?Q?ZP3j66MG5QJ59G6LU5rleDLe+NBCRQGQCV5/zTiprovA06PQYbW2ndTjpx?=
 =?iso-8859-1?Q?UQy1m4yL9gbGuWsY6A6Erxj91bGcFsun5ZHK1d29ocVrP+KdcKaQjxFzEi?=
 =?iso-8859-1?Q?8Crr6WrEBWmhzaX3vgmhDOXy2Yc8/IHfUD2bvjBGAi5cpEQMzqUlm2tbxx?=
 =?iso-8859-1?Q?fdIN7jO4fnvxs8OygDuyBvZcZDOg/mBkX59ig4xYMTYtGRhZFulWjWA8+x?=
 =?iso-8859-1?Q?JlEZAy7dslP6TmS0ZyHjlYudEDFCteRk/I4VoI9XVrZ79fGpfH+lrsS6Su?=
 =?iso-8859-1?Q?seBKlkc0MECqZ+P3b35PulCefqnyA8c8ZmBa57Lb258MHkmx+Z9BBfJ6Ah?=
 =?iso-8859-1?Q?k0bsUcJNjDcZrzLhyxC4neE1QmP6ZnxeVtaTSxw4OmifV5WHn6J5AizUSp?=
 =?iso-8859-1?Q?PESAxbIWXtfUmzdlACiQCKTbWxMNpAJUlwnNNXQhJwIqWkR+dsash2IcW2?=
 =?iso-8859-1?Q?LASQ9DIv8rwypHgES3VWAmn6N/aE88PwkKMihFIuS3m07n6k3dw7VbZ3fg?=
 =?iso-8859-1?Q?8SS0FEJXa7P0+fBSc3X61OiM/G+GAj1jJdFkuSy0zymrinFQHB3jeHkKpv?=
 =?iso-8859-1?Q?nEsNcYBrbjyq62cy0YHpLMaKiQJj6nawokKD+w1rXsJFozr/+8l80/c+0Q?=
 =?iso-8859-1?Q?ApKtYAYFVPZGigEes1Ns4vgi/MXiszPjj3EE/H/uHbyl/MgUFj+O+ByoId?=
 =?iso-8859-1?Q?pkv+ZDn7KbA1X0bKsT3w+AU8YQPGKc/QqkiSZVOz+I/0q6uaP1FM78A7vH?=
 =?iso-8859-1?Q?A3Ilflep28A/6kAKTT7il4WHoxkY9nQ+iDNMTTpp6meJgu/DRV1sGlOWuX?=
 =?iso-8859-1?Q?aN29z1nOdmxubbJjQTTSkb8Jl6a9IjwLrnS465jX1Vuc4FABaiKin1vP1q?=
 =?iso-8859-1?Q?WTpALptJycfomi6JAvRDBtMI8UCuBuDdR4FWY3PYou81tmEYxGBzhHtfxD?=
 =?iso-8859-1?Q?Ff3Hxo6d6aXLdpuziIhdRNSFrHk8jlBVmSmzigaZooG8qejqSkpEDfsc/x?=
 =?iso-8859-1?Q?8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Ejk/Anr+YAziaZ6Rx92j4PRrdQ77qfLpd2epfq11FLLGjVpRn5/CbcbGAB?=
 =?iso-8859-1?Q?zv5fzrGCpmtwu1bb1s2l4gErH4KGw+gtu1a865rg8jKg9yhoSiE4Uo4vGN?=
 =?iso-8859-1?Q?tjHGQBIkoDJypWvUSxgDNoLsqoDl0zmDrgybK+BKb5mWXLF8vWHAnycyPX?=
 =?iso-8859-1?Q?9ZJvRf9glAxgmq1xxOnshfGIahXwFVpT3W6xkAfBDWMZr+0Nkyjj4u9KKh?=
 =?iso-8859-1?Q?bfS7YHhHR3tDd9LMrl8Q0DFacUcCiE/59/Wmg76k7JCFwEADSJs/0ds7Lm?=
 =?iso-8859-1?Q?mudTjVehB7b9+aztKjdgGm72CmrbOuKaNLE0ewhRO2N6Pxh1nGo6dB/MaZ?=
 =?iso-8859-1?Q?oRV1B9XjOdYXbRTaX22UB0Pg9D6wAP8Ij8PO18Y26cWz9mLN3qn4Flc0xw?=
 =?iso-8859-1?Q?PBRnnUOwN+8d67S2hDq0dU4DEatBny49HL1m7PvFPbWbOQEsGcjPNR6EeE?=
 =?iso-8859-1?Q?hAhTlFQt3iVhCZOUWnj8VRo4JMPQT4Zka+Svrx9AGjM7AUrh9JHtJCMR7R?=
 =?iso-8859-1?Q?ueerRD9YOwvtioPv+RZmkixh24JUq3OmGMDSZQrMo+4GSk96C7uC0CD4i/?=
 =?iso-8859-1?Q?AfRE3joL9cMM5Gw/1FmV6l8UW9UfDx7CGWrx7EUazdEiCCVW6p68YAxZVz?=
 =?iso-8859-1?Q?ICSdszI4IC6ubkBPf78Muw0cRqtSASO5D+p9c7YXjO/F8XQggntobdQ2dX?=
 =?iso-8859-1?Q?dnMgyRzEycDgOUybf3XYBDy+a38VIQRrAawaks3UidpGEg6ixeTglMJPwh?=
 =?iso-8859-1?Q?85BYJhOee5VPLCC2VgxQSQ8wihl85nhw3ZZ3fcWGkv6oRul3Ew99vp5p7b?=
 =?iso-8859-1?Q?P1tHAWbNmlDKD8x5xxL6cfeD9kN+VxN5RoGzfy7NO2eosizoVy1DlINhXs?=
 =?iso-8859-1?Q?03vaPiVeBtVo+ZyaX4q7Au27/vlQ3YIeqLGHfxgpBYZkIODrGWkfclvQtD?=
 =?iso-8859-1?Q?pIpg6Isf1sQJ8b35oT1Cg3+evN8xkQb7emIZuCQljG7fyAkfmxWXaOr982?=
 =?iso-8859-1?Q?2GbI43LCcpajbeFZ9C9LbJ8EBq7pDKO9KomIgHJ7bZxKyQPKmiNK0Uk1dp?=
 =?iso-8859-1?Q?wFFyATy2/RoxFh8mU2tnP32biJxDHohSsDM5WCE0zg84rw42t4M9Sbo4EZ?=
 =?iso-8859-1?Q?s/ADY5gKyM+JB+mdfTuUxKw+UOfuVHuIi2GFt75ULddQiu+02btpqz069z?=
 =?iso-8859-1?Q?9AXNRhU+pdtzqZW0kje7aAKEvBe2z2S/wY6Fwxh+P6ZhLXaWx5Rnu8Diuz?=
 =?iso-8859-1?Q?tEhnAjicSAXU97LsSLPxssIZyWCfaOeVXc7cqnA2W/0FGfD+214zgFH3nN?=
 =?iso-8859-1?Q?30Qa5UrnqCeZfAlWMagIGYup8WhXJ3WBXu/1ZONwTAIioL5hvMd4yB3GS2?=
 =?iso-8859-1?Q?R8jskqkSXu7Mo/CKicdiYwW9QhBObdHG54H91LkT4aN2l0m9doy2BgtSwq?=
 =?iso-8859-1?Q?Ow5glYtTqwOhXNcUIyVvj4Ch/2ugDaKc2EyV/tLP6DCh4OQwTHwwY1x2da?=
 =?iso-8859-1?Q?nJoMhKZt7grisHrwDk0JCENuVWZeSABT/eKGVNvJqJm9xLUyt+H1lgsDBl?=
 =?iso-8859-1?Q?uukIhOQzhpqngwHVrRHpjIT+ECPLk7C4WOJOw8Iex8A57cQOw1zAiLYEE6?=
 =?iso-8859-1?Q?2+yhDXl4pHWWTUSmjaCpHB8hoCK16xgxI+yJLAB0ZoQ+biMSoqyxcroQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 830e03e5-1440-4770-6d50-08ddf10c14ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 08:20:35.0394
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JmixxRq9Qb4oVl7lxw7D5yNe8Zgf9yoSS1DnoBnNkZsRzSrImt9ftT7ROKFaLfG5tL0bHxpBNhnkIqzkZlMq16teKOD6hOXaoRSsZvsN8PU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9468

From: Grygorii Strashko <grygorii_strashko@epam.com>

Hi,

During review of v1 [1] of this series Julien Grall raised concern that=20
"If the desire is to make 32-bit domain optional on Arm64.=20
Then I think it would be better to pass the domain type when the domain is
created (IOW add an extra flags to XEN_DOMCTL_createdomain)." for which
I've sent patches attempting to start solving the problem [2] and try to
probe guest kernels before creating domains. While proposed changes [2] is
under review and hence there are definitely more work is required I'd
appreciated if current series can be considered as it's Arm specific only
and working (and tested) with current Xen in its current state.

Now Arm64 AArch32 EL1 guest support is always enabled and built-in while no=
t
all Arm64 platforms supports AArch32 (for examaple on Armv9A) or this
support might not be needed (Arm64 AArch32 El1 is used quite rarely in embe=
dded
systems). More over, when focusing on safety certification, AArch32 related
code in Xen leaves a gap in terms of coverage that cannot really be
justified in words. This leaves two options: either support it (lots of
additional testing, requirements and documents would be needed) or compile
it out.

The series doesn't affect on Arm64 Guest's EL0 32-bit ARM execution state
support.

Patches 1-2 Prerequisite patches
Patch 3 - allows to make aarch32 support optional by introducing Kconfig op=
tion
          CONFIG_ARM64_AARCH32
Patch 4 - enables build-time optimization of AArch32 specific code by redef=
ining some
          is_32/64bit_domain() macro as constants

Tested (CONFIG_ARM64_AARCH32=3Dy/n):
- dom0 with AArch32/64 kernel
- toolstack create domain with AArch32/64 kernel
- dom0less domains with AArch32/64 kernel
- creating domain with AArch64 kernel and AArch32 EL0 rootfs

Changes in v3:
- Kconfig ARM64_AARCH32 use dependency from EXPERT instead of UNSUPPORTED
- drop code for "do not expose EL1 AArch32 support to guest in ID_AA64PFR0_=
EL1 reg"
- apply comments from Volodymyr Babchuk

Changes in v2:
- dropped patches
  - (licensing issue) "xen/arm: move vcpu_switch_to_aarch64_mode() in arch_=
vcpu_create()"
  - (problematic change) "xen/arm: move vcpu_switch_to_aarch64_mode() in ar=
m64"
  - constifying is_32/64bit_domain() macro gives most of results in terms o=
f coverage,
    drop regs changes for now (can be added latter):
    "xen/arm: regs.h split subarch definitions between arm64/arm32"
    "xen/arm64: constify regs_mode_is_32bit macro for CONFIG_ARM64_AARCH32=
=3Dn"
- use Arm64 "cpu_has_el1_32" in all places to check if HW has AArch32 suppo=
rt
- rework Arm64 XEN_DOMCTL_set_address_size hypercall handling to work with =
any initial domain type
  set (32bit or 64 bit)
- fix comments related to macro parameters evaluation issues
- do not expose EL1 AArch32 support to guest in ID_AA64PFR0_EL1 reg if
  AArch32 is disabled

Link on v1:
[1] https://lore.kernel.org/xen-devel/20250723075835.3993182-1-grygorii_str=
ashko@epam.com/

[2] https://patchwork.kernel.org/project/xen-devel/cover/20250731094234.996=
684-1-grygorii_strashko@epam.com/

Grygorii Strashko (4):
  xen/arm: split set_domain_type() between arm64/arm32
  xen/arm: split is_32bit/64bit_domain() between arm64/arm32
  xen/arm64: allow to make aarch32 support optional
  xen/arm64: constify is_32/64bit_domain() macro for
    CONFIG_ARM64_AARCH32=3Dn

 xen/arch/arm/Kconfig                    |  9 ++++
 xen/arch/arm/arm32/Makefile             |  1 +
 xen/arch/arm/arm32/domain-build.c       | 22 ++++++++
 xen/arch/arm/arm64/Makefile             |  1 +
 xen/arch/arm/arm64/domain-build.c       | 67 +++++++++++++++++++++++++
 xen/arch/arm/arm64/domctl.c             | 12 +++--
 xen/arch/arm/dom0less-build.c           | 14 ------
 xen/arch/arm/domain.c                   |  9 ++++
 xen/arch/arm/domain_build.c             | 21 ++------
 xen/arch/arm/include/asm/arm32/domain.h | 32 ++++++++++++
 xen/arch/arm/include/asm/arm64/domain.h | 54 ++++++++++++++++++++
 xen/arch/arm/include/asm/domain.h       |  7 ++-
 xen/arch/arm/setup.c                    |  2 +-
 xen/include/xen/dom0less-build.h        |  8 +++
 14 files changed, 220 insertions(+), 39 deletions(-)
 create mode 100644 xen/arch/arm/arm32/domain-build.c
 create mode 100644 xen/arch/arm/arm64/domain-build.c
 create mode 100644 xen/arch/arm/include/asm/arm32/domain.h
 create mode 100644 xen/arch/arm/include/asm/arm64/domain.h

--=20
2.34.1

