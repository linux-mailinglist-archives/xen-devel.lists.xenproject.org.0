Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E5CA62338
	for <lists+xen-devel@lfdr.de>; Sat, 15 Mar 2025 01:36:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915577.1321062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttFVp-0001gj-H9; Sat, 15 Mar 2025 00:36:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915577.1321062; Sat, 15 Mar 2025 00:36:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttFVp-0001e4-DU; Sat, 15 Mar 2025 00:36:25 +0000
Received: by outflank-mailman (input) for mailman id 915577;
 Sat, 15 Mar 2025 00:36:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XUhE=WC=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1ttFVo-0001dy-8v
 for xen-devel@lists.xenproject.org; Sat, 15 Mar 2025 00:36:24 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2614::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d8744d9-0135-11f0-9899-31a8f345e629;
 Sat, 15 Mar 2025 01:36:10 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PAXPR03MB8084.eurprd03.prod.outlook.com
 (2603:10a6:102:223::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Sat, 15 Mar
 2025 00:36:03 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8534.025; Sat, 15 Mar 2025
 00:36:03 +0000
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
X-Inumbo-ID: 7d8744d9-0135-11f0-9899-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=crM9kb2vtZv2PqQ9rf75VJHQkivwAdVOMjkV8Evytu89mOL4Q2UuibKzJbJYXREV10HISjTyVRCeqF4H/mQ4Sae8NegQZQuarccS7epkF2UZc7DLNk5Ol8sMmNnr6/BK+KNjs9ZOXOL32fsphqq3scgNqWJkrzUdsDTES58i1tGIGYpOLiwyqFV8BcQ5mwyKllQlMNSaRZp1rslfzMX2ien9TgjxABRmCHQfPdn0b7jrL4h6XqV4cVbHgtJpEfQhJfBUSqXLYECfJgNqr6tj/+OKMhIzP3fJ+zdsivOcAZrLxuLHzHZ8kvM6yrD5wwSJP0bHd8CpzogJimqlGc0y+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7hLikYm7Gf0pmZK51JtyJVpvW5JD83x4NiwuTv5rzk=;
 b=FA6VjZpFTKMhkSTQCJVayBefZN99MMhLQiilCbckWOvCU1qhzQAElJteaB4fdU0t6+d3b1s31iLIIrQvR5w9ypTZAElE1E3WY4T2VnFhGnEtE6xKzIZNzfo/RhFQBu9EfNDFasvq3SeKrB6xJlPOIBe/tcXS/ZqymLwGaIjNdqgbDVNHYJmN2vqRnj9PlPEwnyvMu08UBtuzbcKSPf3a2tOpfRG1b0GmYxu2CHtiXd3hDgGuyUKNuOshr0MQfq5xK7r8lgbBgiuDGR7Ks7T9Ei+jpTYQiwdzjqrG1fGa1UnQdTHL0iWC2K2+Ajmc3jYkMIWIRw/PXF0gyEiYwoY9qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7hLikYm7Gf0pmZK51JtyJVpvW5JD83x4NiwuTv5rzk=;
 b=YcRH53yNcNMY9fr0WT64x/3LPMjfhXO1LjCmKLli59zQNBoHTvBvKyI/VBtRShCjXI/hYKUG6JgmsDgts0CfTloARX3ZiFaBtCZB013915sqhkrGNx2AauHI5rdYkQxkIP97wlF+a1YEOaUZ4dDvW2Vrw67RGvxVAGddWVy1FWzQf/oIKgswiD3sv/DBSD+B7hk28GdT60TcSx1XXdWycpNN8fLSHN0G5LzJk1YunKgUftUAZGTgo4oXEJV/CBziajDQ48AdjhsKPxLE4RjsesLzLhQ7Kwq4kCpXCeaIQlBi9O+PLSFlCWKD1Y7i3EJHvaZFjixpjnLkhMhOAGuzAA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Dario Faggioli <dfaggioli@suse.com>, Juergen
 Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>
Subject: [RFC PATCH v2] xen: add libafl-qemu fuzzer support
Thread-Topic: [RFC PATCH v2] xen: add libafl-qemu fuzzer support
Thread-Index: AQHblUI7lWJ91U/YVk+TK2sT0KKY9g==
Date: Sat, 15 Mar 2025 00:36:03 +0000
Message-ID: <20250315003544.1101488-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.48.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PAXPR03MB8084:EE_
x-ms-office365-filtering-correlation-id: 9dd4bb93-5361-4cf4-6058-08dd63595db0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|13003099007|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?oQBdWiR5BxMT9qygQKQ0WznVH+zZkIbpmBekJ1NrLNd9MoxgwzZZMYsI6c?=
 =?iso-8859-1?Q?crolnWwYrjBmXOTewvOuaqdeJMrcaJ0iiQPwJefwCElYrn2qa3JzoRPYkW?=
 =?iso-8859-1?Q?00QgOaeenFT5/wqz92b+cwhPZvQn4+y5ym+wFyeoyjmpz2m0kvs00dDdoa?=
 =?iso-8859-1?Q?bGxVbt1hO/dEQYmvUZ4mn8KkdkGIJudFZl/2HHdgdZVStuk1TkC3sXGf0A?=
 =?iso-8859-1?Q?NjCOBxN3+0Z25+rO9bHv9ZXgjVZ7IKcizT1+lGw1HjCYCRo2gEVAlVuA5t?=
 =?iso-8859-1?Q?t7dswvxi1UzKqx9AQFUOhNamr6UDVwjkTTCJwPQvfKEaVkJsxnkmzi6mZl?=
 =?iso-8859-1?Q?tRzUPQ75A+L2lmgngMcZ6IzAkIjzS776qouExG9UeuExFJ7AVCW41+G8ki?=
 =?iso-8859-1?Q?TSZjENMqE4Kf9ec+v6O7NIVSczwTxA/AEC1c4SrUBLXoIA9F958M0foLrO?=
 =?iso-8859-1?Q?pDfcLCbpnOxqy61bMN0hR31Sl3jGqzqD/qOUHzku+2vFEl5eY7P3gZnPOR?=
 =?iso-8859-1?Q?90VGkmkOzDRLDjJbBccmsul2YWgm20d9VXULEDrbFZlswMWOFi3Woos2G7?=
 =?iso-8859-1?Q?DkhviEG0cDNkv2MYF/10qDlV/vcTYr9JL1Kmc7SzD9zn5p+ZgqTmjSABi7?=
 =?iso-8859-1?Q?m1NRXn3wkN7vmQduYytATTGiGGjf6XwQdRylS/HmCm0td7rQWDmI66cykv?=
 =?iso-8859-1?Q?VQ2ksT03iIx+krJi9mcFgCxClFHFX30x64Sbj+3GJrQ26nXHtvaUSyX2Dq?=
 =?iso-8859-1?Q?CFmG/L/f7AOF+o1tjYuAZ4tKztC/LMVFBlrO7yuEW9xWNcS1ypLEIcK0XX?=
 =?iso-8859-1?Q?t548wfPDzx6do8lE7YLdu/kwagDONpph1Hax+J1bq21++RpmdUWuf6BzNr?=
 =?iso-8859-1?Q?PxaORENkYI3NG4DLJgrshhTtLI0BM2BEUUbCZ+IapLfxnJxEwb7xorZFOP?=
 =?iso-8859-1?Q?nKmGuGb54lOysIATHBSgL1meCC5sbHz0VDicG5PNMO5CtyicqR9RyiJrOQ?=
 =?iso-8859-1?Q?hnSG016ZnQluKVKT22ybxc4h2+sVEuuDt0M7tknQCHNYLFZ1Qf+t8Z7jCu?=
 =?iso-8859-1?Q?GheFPPe0KV/7nz92gt5NRWong7zuURNwT3ddfhhCK92C95jHAULlhSR6Cx?=
 =?iso-8859-1?Q?U0w6E3kK8Am1p+yGAidA5Dw/x8TA4FED3cfhRQ8a1gg2wIcn0BKMfhTaYw?=
 =?iso-8859-1?Q?Um8OlXUpoObYRLewKMZtkGvIXAaYGdpfjRJKuK5/K8K8q4XlwYNBBfROYh?=
 =?iso-8859-1?Q?EwRZzX5sE1N0tWIGJsjCnKzeNmenC8IVIYyHPZ30dARQEt44HDEWOukbgJ?=
 =?iso-8859-1?Q?PfLktxGoY5appXbzcloRBzHgpSRUMUv5PmIGtec2NjhuIwyRxojUTvsVgT?=
 =?iso-8859-1?Q?Q76nGidB13s3jUNenctKzX0UlJaKELF/FN7RWBAwBVKPA1CwIb+uptFvGV?=
 =?iso-8859-1?Q?WeEhEVr75Yj2PAgHb3SdiOM0Qmp8M1Zi4iPsFw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?FwoxTxNVJ2UTMC0odEaknjwH5z3N+/6VP0MYLiW5gESefpRW0pX/6bObvL?=
 =?iso-8859-1?Q?ls+t5/G+RUiNg0gRH0iMOeEQkM7OUY3GRl7Cy5MD3CXm3Gt2LLpWV3tkSe?=
 =?iso-8859-1?Q?aLYUFCz5rxOLho8G1vcHMK2N1iKH4UxX7IxsEpz6e4SJgbl+RZAWVl5G0B?=
 =?iso-8859-1?Q?Givdz1POiqYe2V9ITEvjT53DBh2DjWF/yelmdq+KmuS+8X42JWXT5ROq1K?=
 =?iso-8859-1?Q?hfmyJQDar6qoRs2CDftq/DDcKIYw8vKC5uO++c2MrIQD4Kz3LC9gHzx6jI?=
 =?iso-8859-1?Q?3Z32E7tiUVT2CHJyL7eWRN55UJtrst8ZW20hl382vIyibiGwF/a5jiXn8/?=
 =?iso-8859-1?Q?fp135rsZT6zJCkKZipubE68X/UfLT1J4yDTG7wjbQs4rHCWwVHHxFncaj+?=
 =?iso-8859-1?Q?y0RKCpgj9wyuIcOHcJQTTxcY6cuHLjEj7xjzWpA2I/mawtOLtc+DsZaR+I?=
 =?iso-8859-1?Q?sb9yLZwru9+0t08glnDLfZL9myktz2vgvV8cFjqDIdjzBOQHiLnWd3A0Oi?=
 =?iso-8859-1?Q?D+8GGXy/8OYnrbIy2X9PYV9i6f2qlM30UEjGsX1h/zPnGYbaQ7sZUvTZip?=
 =?iso-8859-1?Q?lPgPgMcEqd2Uwvh4tk8F4MLyYWHpw8qPg5TA66emmjlgj5OAe5uktfzsBz?=
 =?iso-8859-1?Q?VVCcxboMPWJHsVXaHyw1sQyyz/aAJhz/rKXGbFPwsu4G7yUuRZlgDDDIbH?=
 =?iso-8859-1?Q?9CcCL9ftt62Aw33IjCaEUFIcf/SjgPR+DK0byYqCFziSyms1cVGHueYZQF?=
 =?iso-8859-1?Q?hKfI5DpU3ixf4dA+ATWyttluBONBcSDVLwYhQoxvE517fXmy7f8gBC5HX4?=
 =?iso-8859-1?Q?zrNGuPmolswmnqpeLRoQUg+29buWggI+mEi8DrHl7zrwSlwwweEClOdx09?=
 =?iso-8859-1?Q?yAJcnK3T1gyY9kB8SnGXL60AqUm4xVu2QCvUVglWluVs5p9XdKB6aCzGeg?=
 =?iso-8859-1?Q?zVfKx/F09p+DnszRcUMqS/uQxnbH1E8UCGhoFexRovHghx6sQbMgotTkQ8?=
 =?iso-8859-1?Q?1LuQ8K8DN7Ja2DE6E30IMh9Oky7hmt52F/FEPrfU8VDFfvOibROSNXFW27?=
 =?iso-8859-1?Q?/yNiSJQoTYkhgLUZ8WpshQsL8j+d9iP3tcnM8ST5lOI8m/n4ui2zeut68O?=
 =?iso-8859-1?Q?7MNJ66rjW1c2jA5vdtlvkWyNGleA4a6bWUNscbmDOKtl6H5XjI+S+al4Lo?=
 =?iso-8859-1?Q?r5igDNJE3UJ/UyQo1+KaXmFzl8rVupeRwzr04MGMCkoz1jP1NYMWxNQvj6?=
 =?iso-8859-1?Q?fxhBIn3VTlC6OCQID7V3M7ix38VcOYU4n0C18piycewLRdECkHZ9N4XgqZ?=
 =?iso-8859-1?Q?EV+gPe1kJEIgMcflMzGQQAewtO18lJwBHGyCpwiKptMxZigAPkD3frsctM?=
 =?iso-8859-1?Q?RjFTHeErnBAcD5imJpxt2RhLKkg4vNnRyoFRFkhww/3iOHiyFoHzYmNdnq?=
 =?iso-8859-1?Q?WSqp7q5kLTsI5Ag9NBPl6PGxUIz047rOH9WnaZVpW+EUkYtaVSVyicL/kl?=
 =?iso-8859-1?Q?Qq6YOxU6HpEmHuhMx8wpG4BPYyo52E2nqWryQFLmMm5/mCI78UnhIdBj5/?=
 =?iso-8859-1?Q?/uBJBiZKaBkXOe2MYgQ9IkdskZo5FGBRPCS94dQErosxKK4zWaTiAiKnr4?=
 =?iso-8859-1?Q?u66q/z2U/xJ55zsZ8k2/t8k+PP8/bBeSv1aXficWlDTKeyaeYrB60uSQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dd4bb93-5361-4cf4-6058-08dd63595db0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2025 00:36:03.1420
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q+juDReXX5SqOSP8nci0Z2/WgDa/ptz+xWQHn83Z1gxH6MKa80bPO/36Z5lqj2TP6Npokf3Z+ehA/pAoS9iEyKugYYy7rH8o0nB5qEoQXyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8084

LibAFL, which is a part of AFL++ project is a instrument that allows
us to perform fuzzing on beremetal code (Xen hypervisor in this case)
using QEMU as an emulator. It employs QEMU's ability to create
snapshots to run many tests relatively quickly: system state is saved
right before executing a new test and restored after the test is
finished.

This patch adds all necessary plumbing to run aarch64 build of Xen
inside that LibAFL-QEMU fuzzer. From the Xen perspective we need to
do following things:

1. Able to communicate with LibAFL-QEMU fuzzer. This is done by
executing special opcodes, that only LibAFL-QEMU can handle.

2. Use interface from p.1 to tell the fuzzer about code Xen section,
so fuzzer know which part of code to track and gather coverage data.

3. Report fuzzer about crash. This is done in panic() function.

4. Prevent test harness from shooting itself in knee.

Right now test harness is an external component, because we want to
test external Xen interfaces, but it is possible to fuzz internal code
if we want to.

Test harness is implemented XTF-based test-case(s). As test harness
can issue hypercall that shuts itself down, KConfig option
CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING was added. It basically tells
fuzzer that test was completed successfully if Dom0 tries to shut
itself (or the whole machine) down.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---

I tried to fuzz the vGIC emulator and hypercall interface. While vGIC
fuzzing didn't yield any interesting results, hypercall fuzzing found a
way to crash the hypervisor from Dom0 on aarch64, using
"XEN_SYSCTL_page_offline_op" with "sysctl_query_page_offline" sub-op,
because it leads to page_is_ram_type() call which is marked
UNREACHABLE on ARM.

In v2:

 - Moved to XTF-based test harness
 - Severely reworked the fuzzer itself. Now it has user-friendly
   command-line interface and is capable of running in CI, as it now
   returns an appropriate error code if any faults were found
 - Also I found, debugged and fixed a nasty bug in LibAFL-QEMU fork,
   which crashed the whole fuzzer.

Right now the fuzzer is lockated at Xen Troops repo:

https://github.com/xen-troops/xen-fuzzer-rs

But I believe that it is ready to be included into
gitlab.com/xen-project/

XTF-based harness is at

https://gitlab.com/vlad.babchuk/xtf/-/tree/mr_libafl

and there is corresponding MR for including it into

https://gitlab.com/xen-project/fusa/xtf/-/tree/xtf-arm

So, to sum up. All components are basically ready for initial
inclusion. There will be smaller, integration-related changes
later. For example - we will need to update URLs for various
components after they are moved to correct places.
---
 docs/hypervisor-guide/fuzzing.rst           |  90 ++++++++++++
 xen/arch/arm/Kconfig.debug                  |  26 ++++
 xen/arch/arm/Makefile                       |   1 +
 xen/arch/arm/include/asm/libafl_qemu.h      |  54 +++++++
 xen/arch/arm/include/asm/libafl_qemu_defs.h |  37 +++++
 xen/arch/arm/libafl_qemu.c                  | 152 ++++++++++++++++++++
 xen/arch/arm/psci.c                         |  13 ++
 xen/common/sched/core.c                     |  17 +++
 xen/common/shutdown.c                       |   7 +
 xen/drivers/char/console.c                  |   8 ++
 10 files changed, 405 insertions(+)
 create mode 100644 docs/hypervisor-guide/fuzzing.rst
 create mode 100644 xen/arch/arm/include/asm/libafl_qemu.h
 create mode 100644 xen/arch/arm/include/asm/libafl_qemu_defs.h
 create mode 100644 xen/arch/arm/libafl_qemu.c

diff --git a/docs/hypervisor-guide/fuzzing.rst b/docs/hypervisor-guide/fuzz=
ing.rst
new file mode 100644
index 0000000000..a5de71dd25
--- /dev/null
+++ b/docs/hypervisor-guide/fuzzing.rst
@@ -0,0 +1,90 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Fuzzing
+=3D=3D=3D=3D=3D=3D=3D
+
+It is possible to use LibAFL-QEMU for fuzzing hypervisor. Right now
+only aarch64 is supported and only hypercall fuzzing is enabled in the
+test harness, but there are plans to add vGIC interface fuzzing, PSCI
+fuzzing and vPL011 fuzzing as well.
+
+
+Principle of operation
+----------------------
+
+LibAFL-QEMU is a part of American Fuzzy lop plus plus (AKA AFL++)
+project. It uses special build of QEMU, that allows to fuzz baremetal
+software like Xen hypervisor or Linux kernel. Basic idea is that we
+have software under test (Xen hypervisor in our case) and a test
+harness application. Test harness uses special protocol to communicate
+with LibAFL outside of QEMU to get input data and report test
+result. LibAFL monitors which branches are taken by Xen and mutates
+input data in attempt to discover new code paths that eventually can
+lead to a crash or other unintended behavior.
+
+LibAFL uses QEMU's `snapshot` feature to run multiple test without
+restarting the whole system every time. This speeds up fuzzing process
+greatly.
+
+So, to try Xen fuzzing we need three components: LibAFL-based fuzzer,
+test harness and Xen itself.
+
+Building Xen for fuzzing
+------------------------
+
+Xen hypervisor should be built with these two options::
+
+ CONFIG_LIBAFL_QEMU_FUZZER=3Dy
+ CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING=3Dy
+
+Building LibAFL-QEMU based fuzzer
+---------------------------------
+
+Fuzzer is written in Rust, so you need Rust toolchain and `cargo` tool
+in your system. Please refer to your distro documentation on how to
+obtain them.
+
+Once Rust is ready, fetch and build the fuzzer::
+
+  # git clone https://github.com/xen-troops/xen-fuzzer-rs
+  # cd xen-fuzzer-rs
+  # cargo build
+
+Building test harness
+---------------------
+
+We need to make low-level actions, like issuing random hypercalls, so
+for test harness we use special build of Zephyr application. We use
+XTF as a test harness. You can build XTF manually, or let fuzzer to do thi=
s::
+
+  # cargo make build_xtf
+
+This fill download and build XTF for ARM.
+
+Running the fuzzer
+------------------
+
+Please refer to README.md that comes with the fuzzer, but the most
+versatile way is to run it like this::
+
+  # target/debug/xen_fuzzer -t 3600 /path/to/xen \
+      target/xtf/tests/arm-vgic-fuzzer/test-mmu64le-arm-vgic-fuzzer
+
+(assuming that you built XTF with `cargo make build_xtf`)
+
+Any inputs that led to crashes will be found in `crashes` directory.
+
+You can replay a crash with `-r` option::
+
+  # target/debug/xen_fuzzer -r crashes/0195e4fc65828c17 run \
+      /path/to/xen \
+      /path/to/harness
+
+
+Fuzzer will return non-zero error code if it encountered any crashes.
+
+TODOs
+-----
+
+ - Add x86 support.
+ - Implement fuzzing of other external hypervisor interfaces.
diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
index 5a03b220ac..3b00c77d3a 100644
--- a/xen/arch/arm/Kconfig.debug
+++ b/xen/arch/arm/Kconfig.debug
@@ -190,3 +190,29 @@ config EARLY_PRINTK_INC
 	default "debug-mvebu.inc" if EARLY_UART_MVEBU
 	default "debug-pl011.inc" if EARLY_UART_PL011
 	default "debug-scif.inc" if EARLY_UART_SCIF
+
+config LIBAFL_QEMU_FUZZER
+	bool "Enable LibAFL-QEMU calls"
+	help
+	  This option enables support for LibAFL-QEMU calls. Enable this
+	  only when you are going to run hypervisor inside LibAFL-QEMU.
+	  Xen will report code section to LibAFL and will report about
+	  crash when it panics.
+
+	  Do not try to run Xen built on this option on any real hardware
+	  or plain QEMU, because it will just crash during startup.
+
+config LIBAFL_QEMU_FUZZER_PASS_BLOCKING
+	depends on LIBAFL_QEMU_FUZZER
+	bool "LibAFL: Report any attempt to suspend/destroy a domain as a success=
"
+	help
+	  When fuzzing hypercalls, fuzzer sometimes will issue an hypercall that
+	  leads to a domain shutdown, or machine shutdown, or vCPU being
+	  blocked, or something similar. In this case test harness will not be
+	  able to report about successfully handled call to the fuzzer. Fuzzer
+	  will report timeout and mark this as a crash, which is not true. So,
+	  in such cases we need to report about successfully test case from the
+	  hypervisor itself.
+
+          Enable this option only if fuzzing attempt can lead to a correct
+	  stoppage, like when fuzzing hypercalls or PSCI.
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index fb0948f067..7b4eaab680 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_TEE) +=3D tee/
 obj-$(CONFIG_HAS_VPCI) +=3D vpci.o
=20
 obj-$(CONFIG_HAS_ALTERNATIVE) +=3D alternative.o
+obj-${CONFIG_LIBAFL_QEMU_FUZZER} +=3D libafl_qemu.o
 obj-y +=3D cpuerrata.o
 obj-y +=3D cpufeature.o
 obj-y +=3D decode.o
diff --git a/xen/arch/arm/include/asm/libafl_qemu.h b/xen/arch/arm/include/=
asm/libafl_qemu.h
new file mode 100644
index 0000000000..b90cf48b9a
--- /dev/null
+++ b/xen/arch/arm/include/asm/libafl_qemu.h
@@ -0,0 +1,54 @@
+#ifndef LIBAFL_QEMU_H
+#define LIBAFL_QEMU_H
+
+#include <xen/stdint.h>
+#include "libafl_qemu_defs.h"
+#define LIBAFL_QEMU_PRINTF_MAX_SIZE 4096
+
+typedef uint64_t libafl_word;
+
+/**
+ * LibAFL QEMU header file.
+ *
+ * This file is a portable header file used to build target harnesses more
+ * conveniently. Its main purpose is to generate ready-to-use calls to
+ * communicate with the fuzzer. The list of commands is available at the b=
ottom
+ * of this file. The rest mostly consists of macros generating the code us=
ed by
+ * the commands.
+ */
+
+enum LibaflQemuEndStatus {
+  LIBAFL_QEMU_END_UNKNOWN =3D 0,
+  LIBAFL_QEMU_END_OK =3D 1,
+  LIBAFL_QEMU_END_CRASH =3D 2,
+};
+
+libafl_word libafl_qemu_start_virt(void *buf_vaddr, libafl_word max_len);
+
+libafl_word libafl_qemu_start_phys(void *buf_paddr, libafl_word max_len);
+
+libafl_word libafl_qemu_input_virt(void *buf_vaddr, libafl_word max_len);
+
+libafl_word libafl_qemu_input_phys(void *buf_paddr, libafl_word max_len);
+
+void libafl_qemu_end(enum LibaflQemuEndStatus status);
+
+void libafl_qemu_save(void);
+
+void libafl_qemu_load(void);
+
+libafl_word libafl_qemu_version(void);
+
+void libafl_qemu_page_current_allow(void);
+
+void libafl_qemu_internal_error(void);
+
+void __attribute__((format(printf, 1, 2))) lqprintf(const char *fmt, ...);
+
+void libafl_qemu_test(void);
+
+void libafl_qemu_trace_vaddr_range(libafl_word start, libafl_word end);
+
+void libafl_qemu_trace_vaddr_size(libafl_word start, libafl_word size);
+
+#endif
diff --git a/xen/arch/arm/include/asm/libafl_qemu_defs.h b/xen/arch/arm/inc=
lude/asm/libafl_qemu_defs.h
new file mode 100644
index 0000000000..2866cadaac
--- /dev/null
+++ b/xen/arch/arm/include/asm/libafl_qemu_defs.h
@@ -0,0 +1,37 @@
+#ifndef LIBAFL_QEMU_DEFS
+#define LIBAFL_QEMU_DEFS
+
+#define LIBAFL_STRINGIFY(s) #s
+#define XSTRINGIFY(s) LIBAFL_STRINGIFY(s)
+
+#if __STDC_VERSION__ >=3D 201112L
+  #define STATIC_CHECKS                                   \
+    _Static_assert(sizeof(void *) <=3D sizeof(libafl_word), \
+                   "pointer type should not be larger and libafl_word");
+#else
+  #define STATIC_CHECKS
+#endif
+
+#define LIBAFL_SYNC_EXIT_OPCODE 0x66f23a0f
+#define LIBAFL_BACKDOOR_OPCODE 0x44f23a0f
+
+#define LIBAFL_QEMU_TEST_VALUE 0xcafebabe
+
+#define LIBAFL_QEMU_HDR_VERSION_NUMBER 0111  // TODO: find a nice way to s=
et it.
+
+typedef enum LibaflQemuCommand {
+  LIBAFL_QEMU_COMMAND_START_VIRT =3D 0,
+  LIBAFL_QEMU_COMMAND_START_PHYS =3D 1,
+  LIBAFL_QEMU_COMMAND_INPUT_VIRT =3D 2,
+  LIBAFL_QEMU_COMMAND_INPUT_PHYS =3D 3,
+  LIBAFL_QEMU_COMMAND_END =3D 4,
+  LIBAFL_QEMU_COMMAND_SAVE =3D 5,
+  LIBAFL_QEMU_COMMAND_LOAD =3D 6,
+  LIBAFL_QEMU_COMMAND_VERSION =3D 7,
+  LIBAFL_QEMU_COMMAND_VADDR_FILTER_ALLOW =3D 8,
+  LIBAFL_QEMU_COMMAND_INTERNAL_ERROR =3D 9,
+  LIBAFL_QEMU_COMMAND_LQPRINTF =3D 10,
+  LIBAFL_QEMU_COMMAND_TEST =3D 11,
+} LibaflExit;
+
+#endif
diff --git a/xen/arch/arm/libafl_qemu.c b/xen/arch/arm/libafl_qemu.c
new file mode 100644
index 0000000000..58924ce6c6
--- /dev/null
+++ b/xen/arch/arm/libafl_qemu.c
@@ -0,0 +1,152 @@
+/* SPDX-License-Identifier: Apache-2.0 */
+/*
+   This file is based on libafl_qemu_impl.h and libafl_qemu_qemu_arch.h
+   from LibAFL project.
+*/
+#include <xen/lib.h>
+#include <xen/init.h>
+#include <xen/kernel.h>
+#include <asm/libafl_qemu.h>
+
+#define LIBAFL_DEFINE_FUNCTIONS(name, opcode)				\
+	libafl_word _libafl_##name##_call0(	\
+		libafl_word action) {					\
+		libafl_word ret;					\
+		__asm__ volatile (					\
+			"mov x0, %1\n"					\
+			".word " XSTRINGIFY(opcode) "\n"		\
+			"mov %0, x0\n"					\
+			: "=3Dr"(ret)					\
+			: "r"(action)					\
+			: "x0"						\
+			);						\
+		return ret;						\
+	}								\
+									\
+	libafl_word _libafl_##name##_call1(	\
+		libafl_word action, libafl_word arg1) {			\
+		libafl_word ret;					\
+		__asm__ volatile (					\
+			"mov x0, %1\n"					\
+			"mov x1, %2\n"					\
+			".word " XSTRINGIFY(opcode) "\n"		\
+			"mov %0, x0\n"					\
+			: "=3Dr"(ret)					\
+			: "r"(action), "r"(arg1)			\
+			: "x0", "x1"					\
+			);						\
+		return ret;						\
+	}								\
+									\
+	libafl_word _libafl_##name##_call2(	\
+		libafl_word action, libafl_word arg1, libafl_word arg2) { \
+		libafl_word ret;					\
+		__asm__ volatile (					\
+			"mov x0, %1\n"					\
+			"mov x1, %2\n"					\
+			"mov x2, %3\n"					\
+			".word " XSTRINGIFY(opcode) "\n"		\
+			"mov %0, x0\n"					\
+			: "=3Dr"(ret)					\
+			: "r"(action), "r"(arg1), "r"(arg2)		\
+			: "x0", "x1", "x2"				\
+			);						\
+		return ret;						\
+	}
+
+// Generates sync exit functions
+LIBAFL_DEFINE_FUNCTIONS(sync_exit, LIBAFL_SYNC_EXIT_OPCODE)
+
+// Generates backdoor functions
+LIBAFL_DEFINE_FUNCTIONS(backdoor, LIBAFL_BACKDOOR_OPCODE)
+
+static char _lqprintf_buffer[LIBAFL_QEMU_PRINTF_MAX_SIZE] =3D {0};
+
+libafl_word libafl_qemu_start_virt(void       *buf_vaddr,
+                                            libafl_word max_len) {
+  return _libafl_sync_exit_call2(LIBAFL_QEMU_COMMAND_START_VIRT,
+                                 (libafl_word)buf_vaddr, max_len);
+}
+
+libafl_word libafl_qemu_start_phys(void       *buf_paddr,
+                                            libafl_word max_len) {
+  return _libafl_sync_exit_call2(LIBAFL_QEMU_COMMAND_START_PHYS,
+                                 (libafl_word)buf_paddr, max_len);
+}
+
+libafl_word libafl_qemu_input_virt(void       *buf_vaddr,
+                                            libafl_word max_len) {
+  return _libafl_sync_exit_call2(LIBAFL_QEMU_COMMAND_INPUT_VIRT,
+                                 (libafl_word)buf_vaddr, max_len);
+}
+
+libafl_word libafl_qemu_input_phys(void       *buf_paddr,
+                                            libafl_word max_len) {
+  return _libafl_sync_exit_call2(LIBAFL_QEMU_COMMAND_INPUT_PHYS,
+                                 (libafl_word)buf_paddr, max_len);
+}
+
+void libafl_qemu_end(enum LibaflQemuEndStatus status) {
+  _libafl_sync_exit_call1(LIBAFL_QEMU_COMMAND_END, status);
+}
+
+void libafl_qemu_save(void) {
+  _libafl_sync_exit_call0(LIBAFL_QEMU_COMMAND_SAVE);
+}
+
+void libafl_qemu_load(void) {
+  _libafl_sync_exit_call0(LIBAFL_QEMU_COMMAND_LOAD);
+}
+
+libafl_word libafl_qemu_version(void) {
+  return _libafl_sync_exit_call0(LIBAFL_QEMU_COMMAND_VERSION);
+}
+
+void libafl_qemu_internal_error(void) {
+  _libafl_sync_exit_call0(LIBAFL_QEMU_COMMAND_INTERNAL_ERROR);
+}
+
+void lqprintf(const char *fmt, ...) {
+  va_list args;
+  int res;
+  va_start(args, fmt);
+  res =3D vsnprintf(_lqprintf_buffer, LIBAFL_QEMU_PRINTF_MAX_SIZE, fmt, ar=
gs);
+  va_end(args);
+
+  if (res >=3D LIBAFL_QEMU_PRINTF_MAX_SIZE) {
+    // buffer is not big enough, either recompile the target with more
+    // space or print less things
+    libafl_qemu_internal_error();
+  }
+
+  _libafl_sync_exit_call2(LIBAFL_QEMU_COMMAND_LQPRINTF,
+                          (libafl_word)_lqprintf_buffer, res);
+}
+
+void libafl_qemu_test(void) {
+  _libafl_sync_exit_call1(LIBAFL_QEMU_COMMAND_TEST, LIBAFL_QEMU_TEST_VALUE=
);
+}
+
+void libafl_qemu_trace_vaddr_range(libafl_word start,
+                                            libafl_word end) {
+  _libafl_sync_exit_call2(LIBAFL_QEMU_COMMAND_VADDR_FILTER_ALLOW, start, e=
nd);
+}
+
+void libafl_qemu_trace_vaddr_size(libafl_word start,
+                                           libafl_word size) {
+  libafl_qemu_trace_vaddr_range(start, start + size);
+}
+
+static int init_afl(void)
+{
+	vaddr_t xen_text_start =3D (vaddr_t)_stext;
+	vaddr_t xen_text_end =3D (vaddr_t)_etext;
+
+	lqprintf("Telling AFL about code section: %lx - %lx\n", xen_text_start, x=
en_text_end);
+
+	libafl_qemu_trace_vaddr_range(xen_text_start, xen_text_end);
+
+	return 0;
+}
+
+__initcall(init_afl);
diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
index b6860a7760..c7a51a1144 100644
--- a/xen/arch/arm/psci.c
+++ b/xen/arch/arm/psci.c
@@ -17,6 +17,7 @@
 #include <asm/cpufeature.h>
 #include <asm/psci.h>
 #include <asm/acpi.h>
+#include <asm/libafl_qemu.h>
=20
 /*
  * While a 64-bit OS can make calls with SMC32 calling conventions, for
@@ -49,6 +50,10 @@ int call_psci_cpu_on(int cpu)
=20
 void call_psci_cpu_off(void)
 {
+#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
+    libafl_qemu_end(LIBAFL_QEMU_END_OK);
+#endif
+
     if ( psci_ver > PSCI_VERSION(0, 1) )
     {
         struct arm_smccc_res res;
@@ -62,12 +67,20 @@ void call_psci_cpu_off(void)
=20
 void call_psci_system_off(void)
 {
+#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
+    libafl_qemu_end(LIBAFL_QEMU_END_OK);
+#endif
+
     if ( psci_ver > PSCI_VERSION(0, 1) )
         arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_OFF, NULL);
 }
=20
 void call_psci_system_reset(void)
 {
+#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
+    libafl_qemu_end(LIBAFL_QEMU_END_OK);
+#endif
+
     if ( psci_ver > PSCI_VERSION(0, 1) )
         arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_RESET, NULL);
 }
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 9043414290..55eb132568 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -47,6 +47,10 @@
 #define pv_shim false
 #endif
=20
+#ifdef CONFIG_LIBAFL_QEMU_FUZZER
+#include <asm/libafl_qemu.h>
+#endif
+
 /* opt_sched: scheduler - default to configured value */
 static char __initdata opt_sched[10] =3D CONFIG_SCHED_DEFAULT;
 string_param("sched", opt_sched);
@@ -1452,6 +1456,10 @@ static long do_poll(const struct sched_poll *sched_p=
oll)
     if ( !guest_handle_okay(sched_poll->ports, sched_poll->nr_ports) )
         return -EFAULT;
=20
+#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
+    libafl_qemu_end(LIBAFL_QEMU_END_OK);
+#endif
+
     set_bit(_VPF_blocked, &v->pause_flags);
     v->poll_evtchn =3D -1;
     set_bit(v->vcpu_id, d->poll_mask);
@@ -1904,12 +1912,18 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(v=
oid) arg)
     {
     case SCHEDOP_yield:
     {
+#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
+        libafl_qemu_end(LIBAFL_QEMU_END_OK);
+#endif
         ret =3D vcpu_yield();
         break;
     }
=20
     case SCHEDOP_block:
     {
+#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
+        libafl_qemu_end(LIBAFL_QEMU_END_OK);
+#endif
         vcpu_block_enable_events();
         break;
     }
@@ -1924,6 +1938,9 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(voi=
d) arg)
=20
         TRACE_TIME(TRC_SCHED_SHUTDOWN, current->domain->domain_id,
                    current->vcpu_id, sched_shutdown.reason);
+#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
+        libafl_qemu_end(LIBAFL_QEMU_END_OK);
+#endif
         ret =3D domain_shutdown(current->domain, (u8)sched_shutdown.reason=
);
=20
         break;
diff --git a/xen/common/shutdown.c b/xen/common/shutdown.c
index c47341b977..1340f4b606 100644
--- a/xen/common/shutdown.c
+++ b/xen/common/shutdown.c
@@ -11,6 +11,10 @@
 #include <xen/kexec.h>
 #include <public/sched.h>
=20
+#ifdef CONFIG_LIBAFL_QEMU_FUZZER
+#include <asm/libafl_qemu.h>
+#endif
+
 /* opt_noreboot: If true, machine will need manual reset on error. */
 bool __ro_after_init opt_noreboot;
 boolean_param("noreboot", opt_noreboot);
@@ -32,6 +36,9 @@ static void noreturn reboot_or_halt(void)
=20
 void hwdom_shutdown(unsigned char reason)
 {
+#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
+    libafl_qemu_end(LIBAFL_QEMU_END_OK);
+#endif
     switch ( reason )
     {
     case SHUTDOWN_poweroff:
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index ba428199d2..55d33fa744 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -40,6 +40,9 @@
 #ifdef CONFIG_SBSA_VUART_CONSOLE
 #include <asm/vpl011.h>
 #endif
+#ifdef CONFIG_LIBAFL_QEMU_FUZZER
+#include <asm/libafl_qemu.h>
+#endif
=20
 /* console: comma-separated list of console outputs. */
 static char __initdata opt_console[30] =3D OPT_CONSOLE_STR;
@@ -1289,6 +1292,11 @@ void panic(const char *fmt, ...)
=20
     kexec_crash(CRASHREASON_PANIC);
=20
+    #ifdef CONFIG_LIBAFL_QEMU_FUZZER
+    /* Tell the fuzzer that we crashed */
+    libafl_qemu_end(LIBAFL_QEMU_END_CRASH);
+    #endif
+
     if ( opt_noreboot )
         machine_halt();
     else
--=20
2.48.1

