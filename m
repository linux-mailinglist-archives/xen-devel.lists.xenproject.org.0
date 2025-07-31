Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B570EB1774A
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 22:44:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066408.1431630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uha82-0000fh-Qz; Thu, 31 Jul 2025 20:43:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066408.1431630; Thu, 31 Jul 2025 20:43:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uha82-0000cZ-Me; Thu, 31 Jul 2025 20:43:54 +0000
Received: by outflank-mailman (input) for mailman id 1066408;
 Thu, 31 Jul 2025 20:43:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GSHe=2M=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uha81-0000cR-ST
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 20:43:54 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 116c7aab-6e4f-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 22:43:52 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by PAXPR03MB8132.eurprd03.prod.outlook.com (2603:10a6:102:22a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Thu, 31 Jul
 2025 20:43:48 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8989.011; Thu, 31 Jul 2025
 20:43:48 +0000
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
X-Inumbo-ID: 116c7aab-6e4f-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lqEqHA5Gkx36HPzEilyHkThEFeJ5cX5bPY14s0/GNBFdGHtpBVZSRa2nDTE8C271C1iyeewCqUn1yM75dw8HGUqhD2XuvlPk1hiZfImsoWBaqWO1uifNRna4RRoITyLqeyKK36TEJF0wD/5TadIq41+r6r5L4HgWGx7GRLJSshmk+zVLyK+2kb48QxedwkYZAMLEq3UbJYZko2yqT1QuP8ITLBYgsaMg6q1BtFJ4xynuTB86f825+FWBsrzmCcC3/GKTtxwPTwXMBPQmTsLDREYVlP7ZM+luMUQ1FxuV8jm0XZnTNMvHwocVbkWAR8jxF4nmkFsxBlYIGS/nD6WT/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xt6YMEuYgITW84qj2/noeBeiIFUXUm1dDawfozSEF3g=;
 b=O6vtbvFRuVcq/sVbQfic8qxaYs51xsYqf96tLPYTtyuk4T1R2ll6XbFIf9lpfIEjyYRiPCQ8fDzxP0SJHAKfCTaZZZK8z59mz0mHxO64XG2S4U2eDxqFzsAIF+eZs60bk1fV9OREfeNUgx113xkf/vfUMdBRbhnna5OWbx/ZhOcbiaRO8kmZlDCOJJgyvOvgH9IRRoDuP7Q5Wh9koWNlEWjjTp5oUOZ3qMaFrg4rkxeQLXVMWqF/cSMlRNZ5dE0nY8i6JzsTsXqQ7+hVclT6Ps39Nps74utUXl92FGiM0Kv2uU+Lt0wubEw8GD5cfg/tLmjcrKSLsI7BdNm7LUrRCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xt6YMEuYgITW84qj2/noeBeiIFUXUm1dDawfozSEF3g=;
 b=gQXt+FPpcjftqZ2hUx7RTQSurvsb18hz65YtnRuFrALnJFGP2BMbXdZPbqPJ20SbUfEmZbplKwZQGOWMn5DUxukOpkdfULWIeSLI3phmJYXX4FdiGCK7+qcNts4RM2vius2+Zz8mbjjKLS2OpIHAPjoA4zpT2jO4R0L72cGAqkADBy6YVeFA2HiivIQ2oYNui2/vnxIzd05Qw+uBUZ2PbqjDOiGqBtcDCG9qkkxTgYCZoiTKkEtuyy4Bjzav6UIMjlSdHhm7ltrgb3tgIoyb7IuKUBU/St3u869nMUDHZSY0kZel4+MBhiVwzH6JMsIXKcEhSs+Kpw7DFC7w9enKdg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH v4] misra: add deviations of MISRA C Rule 5.5
Thread-Topic: [PATCH v4] misra: add deviations of MISRA C Rule 5.5
Thread-Index: AQHcAlvRPvsNJLdA4EKfF9mnriBuYQ==
Date: Thu, 31 Jul 2025 20:43:48 +0000
Message-ID:
 <afe942916b8a2408f575d2acda49699f74718161.1753991597.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|PAXPR03MB8132:EE_
x-ms-office365-filtering-correlation-id: 02b1c2c0-d1f1-48d3-65ee-08ddd072f386
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|42112799006|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?j+una2z7d5G4IydWEwXbtSNqM1REiroU/+yhWZtw4ZBzXNrIayd7NPgbs6?=
 =?iso-8859-1?Q?/uT/8uNzDErvHl2Gydn8kxCLBYKaTVOAII0BYJ/oFsGiwgjR+1msQkaht/?=
 =?iso-8859-1?Q?l0uBs/DNbCMZxnD2JDJlNRt/s4O9ySH0ynH1SUHh4wVBfJtall5PHnp3j1?=
 =?iso-8859-1?Q?XmPYHn8Vo+I9H9mAbqYsMsPqqxPDzAkq6HKbY0kTKQ+Podo7BBkkU//Vdu?=
 =?iso-8859-1?Q?5re+hD9ygsrFKNC699OaIlxzV7mMwb54I+2cfOo/h0C+EzrjszcEKid7Xd?=
 =?iso-8859-1?Q?/1cDHn6Aa61ljfpje7XMMz05fLId+YOjHGbgva1glJK9oh6liLXn6nU9kw?=
 =?iso-8859-1?Q?hZVspftpAv63sA8hnv8JfWAdFQ6l6LzYcZ0H9UpNT4gHrgduFWQcEf3zEG?=
 =?iso-8859-1?Q?ZV69vdDE5l+fLR/ompbxuHgAnHPtocA5a9lCd5hd7PUIUfuaIytMOkPx94?=
 =?iso-8859-1?Q?RvKFq7SXXpNwHdBqTJEI+a17cHsjy4KsZv65dxtlw1v6xmR/wO753e4IOJ?=
 =?iso-8859-1?Q?HzAnO1CxBrrh/COuTiBbeOHhI3DgejhxZH5n8zMGfLzM+u3vZgc+Y2lYKq?=
 =?iso-8859-1?Q?tsxwuuCygPVhjDFCRTAUEJnC9wYHzhYBudw089w1a4zxMxFZAZVQ5P76+1?=
 =?iso-8859-1?Q?fiAk7TNqPWp8plfhXp+qan6TNl4fcH/tvb2vdqdNBToipe0kLUz8Pegx00?=
 =?iso-8859-1?Q?FDU3YPHaKm3dtVPcWYBXE9e/mVTqseMVLZQFAJSjgkL4kUmDG5dRM7sREV?=
 =?iso-8859-1?Q?I/V6O4R/wU6lvxW9P4DJp55oCW5I3tKBrzjwYB8/dVPz3tj5a6boef5XEu?=
 =?iso-8859-1?Q?6Uu1V/zCZX17D+wKqqYh1KcmzNzYsinfEx56A3uCoFcxu0AwYR4K6wPUYD?=
 =?iso-8859-1?Q?t82raQUHSDTKoa4AG+edEIl6tjheIWbyo7Ixqu6U9igFbJJ9InqDkPPFJ5?=
 =?iso-8859-1?Q?4p4Ird/ltU0gpxyqU+rGs8pp0uqHhJBC833EeCR1cA9SnmjgADsjDg6tPP?=
 =?iso-8859-1?Q?4uZBfQaEsOt8nKAenvLVJecw9SXH5hLy48IkyWnbJ0SC0CoYQ9iyaASa8T?=
 =?iso-8859-1?Q?iPwvOHB7aYnafXsU32r9EzO0lAHfmSxsyKvOLC+B7QWJca6ykOrIfuhORC?=
 =?iso-8859-1?Q?2kiGUZSYsVwFUzGuxhydZ/QfAVDOEgWz/8LmlNRb6E3Lzj8acvWlAfUQ0g?=
 =?iso-8859-1?Q?3vIoBJtNTOdm79rL8PH6LJx1YqeVkDpdDD1OFsKqpVhBTBuB2uunCchz5h?=
 =?iso-8859-1?Q?aNylcXrr1tOctUh8lsTwqunBJfqD21RzKU+nNJ+qTa/ALD/6jyJlPQS8jD?=
 =?iso-8859-1?Q?hq5yUSRNThqejEQn1L3bx/4eE0M/Kj8tcUGxqpCuBJe6MI+2lN4VpRN8LK?=
 =?iso-8859-1?Q?EHK+5l9FVaSdOlrqC/Q4Ol2nYj+IQCfTC5v7bL4K45fC01kt+6Kf0fVVXP?=
 =?iso-8859-1?Q?hhtHOZu2cgHs/uYenh33VHQiGlH70WMHnAuJVDF3tdI9ofi+DH5eQCJI/P?=
 =?iso-8859-1?Q?Y=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(42112799006)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?YtjupczIB30NdRfEJqS9fUD0U7IUrTNE6ejpyHc3zE94fRZatDWYqzZewg?=
 =?iso-8859-1?Q?4ePuWA9AXDufy45aPb98N27dJqHw2NUcJpwmf7xo6RI3XASymv88/ah9TB?=
 =?iso-8859-1?Q?RxkUpDRawqDKuL5S3FT+noMt28DwinZfV/LCHrfNBDPKKiq+fxQyPVJdlB?=
 =?iso-8859-1?Q?5jcfq+IceiWvsur3BD9dezpp0kX1T+GhSUG+mVNPFGIwHd0B+tsJKx4O5K?=
 =?iso-8859-1?Q?xJ45d374P72GKBky+YazMMIscHb9G/ENwvoQw+EcpZXrZk8ybnTk4ICAKw?=
 =?iso-8859-1?Q?jH8p/Obd1yQJGhW86Jl3cogKSSEtNspZpdO3A4a3d7choPZWXBhJJdbfFk?=
 =?iso-8859-1?Q?ADrFwa18rfE6BfwvzU4oKs9xMsjr7xOl5hqFGGYIRliSB1WIjwyuDXoXz2?=
 =?iso-8859-1?Q?Lriz/wl/PD/cwbC1+By+DN8uHiJgDNw1SI+LvPhNLzKSN2Rz14RY9EDbli?=
 =?iso-8859-1?Q?fR8qVspytiqaG8YLji/PjXh69ZkkTEUp/VY6duKAEjwbokz1iS/1rFYMDi?=
 =?iso-8859-1?Q?/xOYBXZO2fEkaNn9mvxXwtf4a8SnRS1HKW2Q9GQg94xvojVibCukwGjKSM?=
 =?iso-8859-1?Q?nNiGUBNVaQG/O6IxF5IHvQlhDxE8dpDdCV2FOgl3SCCADUiiPmrs6ggCgx?=
 =?iso-8859-1?Q?IRf/EoNJnE82TxheAQrAL4VS0KYEaWGrjCkIYLAB602YB78jOsxWFU/Nxu?=
 =?iso-8859-1?Q?+qHFcwwSyX8BgnJAPMks9Dwzwi5At7B0vnfKC18ktL8QNfDwJlHzR2OGNb?=
 =?iso-8859-1?Q?Z/Ug8WYNQF2Sjbm6XqSzJNeZf5dT6zQRQI6jdQSMo9xczDlEdw2HKL9u+3?=
 =?iso-8859-1?Q?8M6ODuUFOYvpRUAU7G5v1mu3cZnfkg36gAFADlFbzGf/w0r2KmvJJ7qi7e?=
 =?iso-8859-1?Q?/ZWQmMnFVLLa6pcJY3UCvwHg5eXUd67HffXqyoaldffzfSt/HjFxrcsJPc?=
 =?iso-8859-1?Q?Gp017i7/bv2uhG2b/enokMd2OQIrNOhYtnNXJQ6rS9bss6gYPzwZy2hgIZ?=
 =?iso-8859-1?Q?0McOL3Nmoah7GlstGJ+r2bHjjz44ZeBgYekMCzpkoe0n4VeN5SASu2exkY?=
 =?iso-8859-1?Q?IoSr8h7EDaie2HbBHg5vCMqr4gN5ti2r7wVQbJ0cGRX3VT6OBiq+Z3GTBF?=
 =?iso-8859-1?Q?/quRSATuEvgWjO9lGIm+FhZdPZoLtKMzIJCZISQVsiLK/5zRwlypTF5LHu?=
 =?iso-8859-1?Q?7p3KudpL6aGWeCMotLCdt513CG9RhapCCYx1xkGklAB6VYcTdhLcXbI798?=
 =?iso-8859-1?Q?2kLdC9MUvb+kGEn8WQ21CDDx8BkiFARKe+Bc/03KUUdH/ft/dOyYJgDBXv?=
 =?iso-8859-1?Q?QgcEPVyQq+HO6SvtnAHOfGLhac9H5u/lpCm2ftGXTmktwbeSUj1zSzuXEE?=
 =?iso-8859-1?Q?iLYdIJbyC9g8qiLYhIcqs0P7XTYYI48dPH0A4qt4jPWu/eb47zu2RgQ45H?=
 =?iso-8859-1?Q?D44GBZtH2zWUpKauST5/UBvnIY0IuFYca/P9I4fOYtgCsYe27IjzTD5FNp?=
 =?iso-8859-1?Q?ZJG3DAma7jMx77v6BjOrxgqi4nwQJJweuZfDrT/IZf0kYsBiZXL3uCfMIe?=
 =?iso-8859-1?Q?1vFlqXFnbRwLdp9DVdCzLtsXC+39VGz4aZjJGXXvkswM7BjWrfDmTwNpze?=
 =?iso-8859-1?Q?fo0HEdITvJ1zXBMiwVc7FB4e+NUtnt7B3hnixgzZQL5Y90tOaBsYNa8w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02b1c2c0-d1f1-48d3-65ee-08ddd072f386
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 20:43:48.6973
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qyBc3yn+Xwvqv6L6XP2s35ku1CONU6q9g/zpiO+rn/WqBzCq9bEXeKg+ftj3iWEnc2Rth1g7Q++3IseHMbrcu+Z73HpCN29BNIXndU+F+wQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8132

MISRA C Rule 5.5 states: "Identifiers shall be distinct from macro names".

Update ECLAIR configuration to deviate clashes: specify the macros that
should be ignored. Update deviations.rst and rules.rst accordingly.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Changes in v4:
- fixed formatting (aligned length chars per line)
- set 'ignored_macros' as a regex expression
- set a deviation restriction on xen/common/grant_table.c
- s/ensures/to ensure/
- fixed grammar errors

Link to v3:
https://patchew.org/Xen/e681e0c083d945f48e6d0add1aee32af16be224e.1753911247=
.git.dmytro._5Fprokopchuk1@epam.com/

Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/1960066579
---
 .../eclair_analysis/ECLAIR/deviations.ecl     | 10 +++++++++
 docs/misra/deviations.rst                     | 22 +++++++++++++++++++
 docs/misra/rules.rst                          | 17 ++++++++++++++
 3 files changed, 49 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 483507e7b9..ab3400fc89 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -117,6 +117,16 @@ it defines would (in the common case) be already defin=
ed. Peer reviewed by the c
 -config=3DMC3A2.R5.5,reports+=3D{deliberate, "any_area(decl(kind(function)=
)||any_loc(macro(name(memcpy||memset||memmove))))&&any_area(any_loc(file(^x=
en/common/libelf/libelf-private\\.h$)))"}
 -doc_end
=20
+-doc_begin=3D"Clashes between bitops functions and macro names are deliber=
ate.
+These macros are needed for input validation and error handling."
+-config=3DMC3A2.R5.5,ignored_macros+=3D"^(__)?(test|set|clear|change|test_=
and_(set|clear|change))_bit$"
+-doc_end
+
+-doc_begin=3D"Clashes between grant table functions and macro names in 'xe=
n/common/grant_table.c' are deliberate.
+These macros address differences in argument count during compile-time, ef=
fectively discarding unused parameters to avoid warnings or errors related =
to them."
+-config=3DMC3A2.R5.5,ignored_macros+=3D"name(update_gnttab_par||parse_gntt=
ab_limit)&&loc(file(^xen/common/grant_table\\.c$))"
+-doc_end
+
 -doc_begin=3D"The type \"ret_t\" is deliberately defined multiple times,
 depending on the guest."
 -config=3DMC3A2.R5.6,reports+=3D{deliberate,"any_area(any_loc(text(^.*ret_=
t.*$)))"}
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index e78179fcb8..4c64a8be62 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -142,6 +142,28 @@ Deviations related to MISRA C:2012 Rules:
        memmove.
      - Tagged as `deliberate` for ECLAIR.
=20
+   * - R5.5
+     - Clashes between bitops ('__test_and_set_bit', '__test_and_clear_bit=
',
+       '__test_and_change_bit', 'test_bit', 'set_bit', 'clear_bit', 'chang=
e_bit',
+       'test_and_set_bit', 'test_and_clear_bit', 'test_and_change_bit')
+       functions and macro names are intentional. These are necessary for =
error
+       handling and input validation to ensure that the size of the object=
 being
+       referenced by the memory address (passed as an argument to the macr=
o)
+       meets the minimum requirements for the bit operation. This prevents=
 unsafe
+       operations on improperly sized data types that could lead to undefi=
ned
+       behavior or memory corruption. The macros encapsulate this conditio=
nal
+       logic into a single, reusable form, simplifying the code and avoidi=
ng
+       function call overhead. Also this bit operations API was inherited =
from
+       Linux and should be kept for familiarity.
+     - ECLAIR has been configured to ignore these macros.
+
+   * - R5.5
+     - Clashes between grant table ('update_gnttab_par', 'parse_gnttab_lim=
it')
+       functions and macro names are intentional. These macros address
+       differences in argument count during compile-time, effectively disc=
arding
+       unused 2nd and 3rd parameters to avoid warnings or errors related t=
o them.
+     - ECLAIR has been configured to ignore these macros.
+
    * - R5.6
      - The type ret_t is deliberately defined multiple times depending on =
the
        type of guest to service.
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 3e014a6298..cba15933fe 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -196,6 +196,23 @@ maintainers if you want to suggest a change.
            #define f(x, y) f(x, y)
            void f(int x, int y);
=20
+       Clashes between bitops functions and macro names are allowed
+       because they are used for input validation and error handling.
+       Example::
+
+           static inline void set_bit(int nr, volatile void *addr)
+           {
+               asm volatile ( "lock btsl %1,%0"
+                              : "+m" (ADDR) : "Ir" (nr) : "memory");
+           }
+           #define set_bit(nr, addr) ({                            \
+               if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
+               set_bit(nr, addr);                                  \
+           })
+
+       Clashes between grant table functions and macro names are allowed
+       because they are used for discarding unused parameters.
+
    * - `Rule 5.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Su=
ite/-/blob/master/R_05_06.c>`_
      - Required
      - A typedef name shall be a unique identifier
--=20
2.43.0

