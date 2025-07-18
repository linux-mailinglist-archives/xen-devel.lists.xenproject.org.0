Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87526B0A412
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 14:22:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048640.1418847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uck63-0007cX-LZ; Fri, 18 Jul 2025 12:21:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048640.1418847; Fri, 18 Jul 2025 12:21:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uck63-0007Zx-IS; Fri, 18 Jul 2025 12:21:51 +0000
Received: by outflank-mailman (input) for mailman id 1048640;
 Fri, 18 Jul 2025 12:21:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tfz2=Z7=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1uck61-0007Zl-GE
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 12:21:49 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c62207ce-63d1-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 14:21:47 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PAWPR03MB10182.eurprd03.prod.outlook.com
 (2603:10a6:102:334::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Fri, 18 Jul
 2025 12:21:42 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 12:21:41 +0000
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
X-Inumbo-ID: c62207ce-63d1-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CPOpYErp09kePOhvhU3iYmucVlqnOyIjDRoV+Q0aBIdHGHkgoiHSN6ASJYx3NPjQYBJ2eFJ35qDUH6WMSfF2KQNSuJi+bzIUB9DcjTUPGOXVqmA/rQmoWamcmX69f1EdUwn53eH81zPoLe/KmTa5XMMGxz2Fi46q/6EpvmWFP+y90cdB2/A2KwZpen6J5D8ckhdhg78aq+3G9TxSqMI+t14ciAfhjLktPmcBuU7rmaQk3Y0DdSI7cDCo8B6fMOzsEjvqVAU0OZOfzm6+a43mIDY4+aa0SwieH+ieYEfwTM5yZplu182VyhCz14x+Z9mJ8ZKT6bGxhBVPm1eEIvwcCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U90myqrvbGuu6/XrR8mksB90D+/i1tvuCLeIjRC5Psw=;
 b=FRDup+2TCRkVKGTfovYcks0xUDF+mT54oRDK8W79o1zZ5xgi50j3NoYRmxcqcIGa5xISvCjNfYp9MFQdv36sVMKcF94JqI7Ntnh7SbWc2GuBH4sVdXCI3mCFtm1P+UdGSIwX9Xib7YlviJTz6SBM9L85GZeesM0+4zwDCXPDCqpgx9YpjdD0kdG87HE7rTjbds2oJBFB798xrysZ8Keq53MNdxT/uqowMeCPp+1tSI5D5uawmD1Scy6IFS8FowtZrqUDRhbfMjFyk60dNMhMCSPfqFJ8VzsLlQpwXpG6R0glFPYGNMmGWjm9WCbBW50uGCJULe9jhCs3BJpCO6mwMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U90myqrvbGuu6/XrR8mksB90D+/i1tvuCLeIjRC5Psw=;
 b=sMbbQEfZLypxUdVXlnvNQ9SDnyVcgTcvJXVIljTDCIKtROp4IE+Kwr52VCJbXb5qeK7l1cTuC6NT5bEIc4CpNMi0yme5rvjSQri527kteOoru5/gvzbaUglTSD8RqommFW3zyk5Q80JOt7Qc/hqesfh1wbL27S07Tdyv0jKxuMBHGbycFtrgc5h10o8VClsYwIgF24+a0zUScJRWUuvry+Rug4Zychd1MnWOi6PIek/3iKOvISsPZi2W0CwALtG5yYHlMmIJ8m0V9I31PcRYyp1xnRzujv44firTljk+Uq6TBnOrcEoJB9vub2bIY8kARRY8CMvSvPfO8qlvqjJpfw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH v4 0/2] xen: add libalf fuzzing support
Thread-Topic: [RFC PATCH v4 0/2] xen: add libalf fuzzing support
Thread-Index: AQHb996EFRM+97CFOEubIr8GkcHOLQ==
Date: Fri, 18 Jul 2025 12:21:41 +0000
Message-ID: <20250718122115.2448874-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.50.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PAWPR03MB10182:EE_
x-ms-office365-filtering-correlation-id: a9cafd8e-0c3e-4293-1701-08ddc5f5a731
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?gnRqIb8cfAEWajmZESdA1uTtbfZYdp/EO8LU9jL/DmcOSeXVZBPQKNKx1c?=
 =?iso-8859-1?Q?RCkVzF5d+oKuzncbAB3ZW0NJJTpGj0Nd/9bp1ZxTN3vHvaBoVR43UIxl3V?=
 =?iso-8859-1?Q?50CGbq34OScv8RSwDj9unw2pSIxqMtbwXWcKvrVpaZiQAvDbfOUaT/UH33?=
 =?iso-8859-1?Q?UdEDAasBlh8wXAr4RpoXR06HfB6LJDGyFfh1T+nZGAQfoZ/TJtGvimx7h4?=
 =?iso-8859-1?Q?9MIjQMN03xoYMaAbxIWdQ2OxTiMZ+ZbS6Db4KextXZ88jYBdiI1D4fHQpN?=
 =?iso-8859-1?Q?lTlnH/sB3PfItTUgMZsAmstO+QCrbtkh0ud1juzdeuNonXbvUHtwTeU4FV?=
 =?iso-8859-1?Q?3t797lQMEoV9vyiOjI1PBBN9XB+xQnl0WOfv5I3DA9QkHmv+/ofooFpFch?=
 =?iso-8859-1?Q?0cZKTERWy6XQfb3/UOeCx+IGrvxym0uCuL30NSNuT2zY0pW+Cz6qRcz0LD?=
 =?iso-8859-1?Q?zRk/PYLn+EG9goWx+VkD0qBLIrIrNBPv+1M2X1UNABWyqJ6Fx2Tbs+5M1x?=
 =?iso-8859-1?Q?vkDQe/QXRtR0PBrx93Xx220TX9iFPT3Xwm5zxJj3RLPGyJew3gwUcCBlQK?=
 =?iso-8859-1?Q?VOWkHwcDp8bDHbZIoTn2jZUjtF1GCu+vBQzlyxYmN2ZhYLqz3BBZLB3sBg?=
 =?iso-8859-1?Q?F3FJkjgu4ge+0Wz6+fCOOUUjZdRRLNzGLf+B+A3ylGWC4TUGujlGz+UV4r?=
 =?iso-8859-1?Q?UHcje62Smq4GZtnvR5aoWYRdPcrQtDC0rB/0fFE4QrkOArgapWK8/Zo19M?=
 =?iso-8859-1?Q?jOqKt0swCX3/HBeAPrFnW+1bwXzbzn9TN7csUnwxQEvEdJlVGQ+YQuKg/w?=
 =?iso-8859-1?Q?J756DzCseZpPJDcYrVEjTCFq7HzEVUmpY9GwDIYw21UDdTiEM8E2MC8zR/?=
 =?iso-8859-1?Q?gOsLlejvltTKFq3ns5EYMFOVvhxcSB0+JAFt3tjdxzGNSgEpvPxc8Z5HM0?=
 =?iso-8859-1?Q?k7o8XpOWE33kR3ATA7rC/xLewae0EMCnfCod3HrJs0aMV9/XVtr4bmTwU5?=
 =?iso-8859-1?Q?XDXaGtXnVJZDao5rb327RPYrJPGAOzrYKkOkh2QrRSKRHc8ptB0XPLyJDh?=
 =?iso-8859-1?Q?DXOKJNjct91PMRUFCYQ6IWenG2FL9dB1j+uHqAHY073cEBbOFujdw2AZAc?=
 =?iso-8859-1?Q?D9avN6DxChCr6H2X82xsCIB2C4DIxd/AD1C7viagf652Ov61WCGKiOdQcM?=
 =?iso-8859-1?Q?basjdash0sGMy/AMhAUbO6y8QQaOQL/0Nmsimmg03xiZCmRhLI6mO+PMYF?=
 =?iso-8859-1?Q?lPsl6ptS8Q0RzcvJ1jKjeMhXebUMhxgKzF9IKTLOvhNmNo1y/JBmHqyNaG?=
 =?iso-8859-1?Q?yFL1UeS8ThepopUgPb9ysE/BnKUgEZWsyqo2vEcQ9LXZphvZ5OhUwM+azi?=
 =?iso-8859-1?Q?coy/6HzQ1ieKHbCTrZXgCoe+3hxK3lPGHwbL4xJTnZeXyebhq4VE+4y0+Q?=
 =?iso-8859-1?Q?2+Llrh9gF38onjKZVZUYH6uZnL55waRlRDiboSmLmJtPrmy+3wS2WOiwzc?=
 =?iso-8859-1?Q?gIslBh+VHaBCCjOQndx0LUph4lvQdn+a2GwCFlaY0RBQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?0UCeXxoILSPvjpWjDoMmryPztPBkeCKNEAQiUDj3PEA/SQCePEhS60E7Lm?=
 =?iso-8859-1?Q?ijkeqa2lUw9FzsOeSj6qc0GLDZAthrSLZEo4rZ+klZbSU/MI0tZYw3tlZj?=
 =?iso-8859-1?Q?acBz2NxlZPsGqpx/P4uN2bExs84B82kmMqI1Wnm6Y/pgwEnQP1U3SqMfGT?=
 =?iso-8859-1?Q?aLc6fLt2tJ4QJIZgh46RUZ/V9XwkU059OPVYxg/5rejjzwVqQA5IMkf1Jz?=
 =?iso-8859-1?Q?XInoqPTaGRxk5N/QXJX2SwqgFQ8/NDTaVDY3d799Ee+CpsPOh4+GBPkR13?=
 =?iso-8859-1?Q?BGfZOunY2IzpksOYzluFlzoFECqmO6h1EK90CrKWjcJ9OL3JDyCz9Ygskd?=
 =?iso-8859-1?Q?03IZqpDsyFfUsBEUHxvuJTdxgQUDwvyFHcBnkFXgzxMecyNzr0p2gyd8tB?=
 =?iso-8859-1?Q?PVzqWErKNho+VOm0yjCtKvZ7avJFWfV4+7OiHgUbo5LlxTudEtaS2t3Wc2?=
 =?iso-8859-1?Q?AYeQMZ/JqS5qkRF2TrzoCABO0jVwsfK5i6VUUjVt84YzbPwr+OzZ3A3fbU?=
 =?iso-8859-1?Q?k6UEo/YXmmndUQIn0LrflskRoCQqh0yJ7hgE9RIofpZf1BOJjPSIhXZTmf?=
 =?iso-8859-1?Q?+QV24cyi1K0Ha8beWPe9tZECCHWjKXxemwP65wcNWoyC8Sc2jV//SwurK8?=
 =?iso-8859-1?Q?yb3ATucP+UQLNGzUQn8Hd93GRNTGf74VysOSfEIVeH0nmjBhuHkYIZib/0?=
 =?iso-8859-1?Q?23LCQzXdqacpfmutwI7OQRlAx1OZL6OC1WuTy68xz4wrIEdPPiBkVcnaFl?=
 =?iso-8859-1?Q?sS70yOvfixVEYOQYXP9aWKkrjMH8klpS3ydS/luF9TQDQ5+iYJCZJ7H75v?=
 =?iso-8859-1?Q?TmvKtZ1+4QL7aeta8zDjkbDnmw/gezna0qkIsit0BmmSop8o0GiC68S/sO?=
 =?iso-8859-1?Q?z03KVZr4AZntKQF93aQq2sQ8YC/Kt2vmuDEPLGhLsT3Tral2ZSR53iYt+2?=
 =?iso-8859-1?Q?nZmQqRcVtHXftAvAvPuEMZbXQNdjhF0UX+PB09o1LtZHFNp1ytUNaNy9G6?=
 =?iso-8859-1?Q?JzPv6wm/S4SI7EzTEo72BmNWOVs9ipdZ6xUCHtH5bslfv/yALblAmEzdy6?=
 =?iso-8859-1?Q?kux2QILRQZG01a8a0ehl8YiYU8cm9+qGTxkJSa2Yel6s7c7W6gdON5Iho9?=
 =?iso-8859-1?Q?teEfIU1sAtSnBlWgLAqcVmRK86/kDbvev7UMnTdFES0jWUNFjWarVmqGXW?=
 =?iso-8859-1?Q?ZLci5Hv8GqKB6CEmoctL1GijGzgH62bg/Q4ZlbWblX7/oGiYmV1Ud8qoyV?=
 =?iso-8859-1?Q?/e0sTYC8+Yzs50JAXQIp3sOVOtGZEcMfcJWftZA2JLG33xB2RvfVKyIBio?=
 =?iso-8859-1?Q?nRwvGu7UnCn3OkEqNrDsjRMcDszjHbf0F5UhWqnQsm3eJLBXxvDh+Crmg+?=
 =?iso-8859-1?Q?lQnCXWTMawZDFNkZ3svTPc2ey8DI9a/tW2NXTMmZgg/fvlIzcHgbp7Gkpq?=
 =?iso-8859-1?Q?N7EUkmCdjrgYh3/O1gANSImVs8jvvDOLOShphkfgsy21565mp6jC8k555X?=
 =?iso-8859-1?Q?fvmTXa2TcF+9OMMgDM93gQQjMXaxDQO7UHmkMkXfcBx1f8fziYuKfuk8Ms?=
 =?iso-8859-1?Q?i0RDWGKAiuFlbFtntP5Urv/b/abuA5tRuYlcMUs6lbs+icGQjBwenIUTCP?=
 =?iso-8859-1?Q?L/hTvcaLdjGXciyvUlW8uGL5WA72cvDqZfXr8V9eYDFFjEmRk5cdzBJQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9cafd8e-0c3e-4293-1701-08ddc5f5a731
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2025 12:21:41.8676
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fH4VNDXqVgL7SxjS+NRmKzPLr/l1CiC4tvUlObTJCSkIWahLGu+o5o4XhneqvSsf6bCBStvH7/FgXY5V9WFV3lEqA6iAv+4HKInvWYqF4aM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB10182

It is possible to use LibAFL with LibAFL-QEMU to fuzz different
baremetal programs, including Xen hypervisor. This small series
tries to add minimal (but extenable) support for fuzzing.

changes in v4:
 - No global changes, only minor changes in patches, see local
   changelog.

changes in v3:
 - Added patch with experimental CI integration
 - Severely reworked the main patch (see notes in the patch itself)

Volodymyr Babchuk (2):
  xen: add libafl-qemu fuzzer support
  ci: enable fuzzing for arm64

 automation/gitlab-ci/build.yaml        |  9 +++
 automation/gitlab-ci/test.yaml         | 33 ++++++++++
 docs/hypervisor-guide/fuzzing.rst      | 91 ++++++++++++++++++++++++++
 xen/arch/arm/Kconfig.debug             | 36 ++++++++++
 xen/arch/arm/include/asm/libafl-qemu.h | 50 ++++++++++++++
 xen/arch/arm/psci.c                    |  5 ++
 xen/common/Makefile                    |  1 +
 xen/common/domain.c                    |  3 +
 xen/common/libafl-qemu.c               | 79 ++++++++++++++++++++++
 xen/common/sched/core.c                |  5 ++
 xen/common/shutdown.c                  |  3 +
 xen/drivers/char/console.c             |  3 +
 xen/include/xen/fuzzer.h               | 52 +++++++++++++++
 xen/include/xen/libafl-qemu.h          | 58 ++++++++++++++++
 14 files changed, 428 insertions(+)
 create mode 100644 docs/hypervisor-guide/fuzzing.rst
 create mode 100644 xen/arch/arm/include/asm/libafl-qemu.h
 create mode 100644 xen/common/libafl-qemu.c
 create mode 100644 xen/include/xen/fuzzer.h
 create mode 100644 xen/include/xen/libafl-qemu.h

--=20
2.50.0

