Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FC8AADBEC
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 11:54:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978481.1365281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCbTe-0002Iv-VE; Wed, 07 May 2025 09:54:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978481.1365281; Wed, 07 May 2025 09:54:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCbTe-0002H1-Rz; Wed, 07 May 2025 09:54:10 +0000
Received: by outflank-mailman (input) for mailman id 978481;
 Wed, 07 May 2025 09:54:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=owRi=XX=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1uCbTd-0001ot-NB
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 09:54:09 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 384c5fbe-2b29-11f0-9eb4-5ba50f476ded;
 Wed, 07 May 2025 11:54:08 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DB9PR03MB9758.eurprd03.prod.outlook.com
 (2603:10a6:10:453::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Wed, 7 May
 2025 09:54:03 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%6]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 09:54:03 +0000
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
X-Inumbo-ID: 384c5fbe-2b29-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QM2hhhnU0LWOpFKr82omAXXtWWkifdiqTl6UwLiQY3OZi8NUihAzGSvELvAGGMl4gXF1iU8Hsai1vofuxh7dskanmZwEPzd1VVTiEonaeBL6KdqxNoDGeExk16kkMxD1wg8tyMyukWdsVXdyUoSraoQERvBiWRV5w+SY737SdIHdt9qF0slkZ2AXfeSY4Tykr7IXaatgPS4Od+am4n9bz/0dqT+4dcHjuE3Nl0Jk6ZSHcx0w4hQ7NdCmt/pufGnb0sxfovQtvl88n+XNcSbJxBQd/I8+H4lUMpZdrmysJw1W1oF9gVUvgc4yoCDGJsAkJ4OAUk9YveKJTlkdMOBIog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r92ZDh65UNlU18AVSDhGnjWjZLGQfIAHc6+eCdWBjoA=;
 b=e6LUpNqSS85NdL3gAXdA2sZ0Lhr3c68nhF7kiTS+9YCwfYVVtiyFjrKPt6wObDQG3nuuXNB+apfI0OA3K2gy2UW2W0h9lOj1KjmI7WJQtTgcKAPSH3Bd3HzCv2NNK8qQcQVbMoRuypGeHPh4fGmubLM6mBJu5hAU7JYvgv1+1AWoL7YHP8wXi7HoTj1FcCAoW9e+zw0cynwcScSPSoHDDz5lsjnLDmWN+iVf/cWhAM2OTjxjYu6TM7nI4YdFC6yTbVuyKf8rn928ciABg5r4QV4CwCGdPj1BbBaAweSNhpf3/eZxAzIFcOSH717lB4vIPyBs5kcIatvDsxa2XSasVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r92ZDh65UNlU18AVSDhGnjWjZLGQfIAHc6+eCdWBjoA=;
 b=EcC8H067aLfxGV9Amv8e7CS+aau5kjBc1DMzZhku3DytCUEMMpR9Yo4ccszORm6YTGYM8QXmVJZeWTtVgzXjBxhuykAIEEDm/bxdwP5Nvg6ut8WPLjM5grnaGyH/7VrjR5Y1IABPFysYCo4pHOPb/aamlxYqCn5mYoKjubQZPKG7nYydY/rAdu/8km1I4zhsCDfOtxTUVEu+eIhxSVGsMqKrdFEFA4EBsZE2b5nsRd0johORk5vWCUzqlaV3PYxlxI63oy5EUGGKDVaCa6HJ5NbaB9NWo1YM9+JOZ1AS0R045j9x/ogHdUkdg8tWigkYGV2auz9q1kkhYlxca8p4OA==
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
Subject: [RFC PATCH v3 1/2] xen: add libafl-qemu fuzzer support
Thread-Topic: [RFC PATCH v3 1/2] xen: add libafl-qemu fuzzer support
Thread-Index: AQHbvzX0CPd+DUDhAUOdIQPEjXmDVg==
Date: Wed, 7 May 2025 09:53:59 +0000
Message-ID: <20250507095338.735228-2-volodymyr_babchuk@epam.com>
References: <20250507095338.735228-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250507095338.735228-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.48.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DB9PR03MB9758:EE_
x-ms-office365-filtering-correlation-id: 19f95e5d-cc55-4404-bc73-08dd8d4d198c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Zc/joKO0eZ7Nq6j1JNpltmbTENDbXTQS1Rue3SCMJ4B18MfBGKncdkOYxW?=
 =?iso-8859-1?Q?1cfHQueNOkucK026CEQhjPNWWJbfsGTyUhyOjcU+qdq48uB9nR/srdSAUA?=
 =?iso-8859-1?Q?MdJ2R6bdCAA68TEz4/xyzA28kWodmVdhe0EsG0xyzLQADRykiQs1TPqGTB?=
 =?iso-8859-1?Q?kFTdJpBSe1GG8r/cA1SEXc9CpLjT5cAWkc8aHoqu4wDro1TbnAJwAulf2S?=
 =?iso-8859-1?Q?0nRxRP0+NRPreY4zK2kaopoHmAKMRU5FqLaK2RlVhsR1y1wz32OsW6SO9I?=
 =?iso-8859-1?Q?WHOY9/4g5AVKyZcF5u0RG+OfCbjs8+cTAzFhw1MajpIKYk2ARWoUYgPaam?=
 =?iso-8859-1?Q?y66hSStJN6u2q63nMMSzHVD35XtEeA7tdNRzsEeUpQ0MCmDAIqxASLjmfc?=
 =?iso-8859-1?Q?+uKJ0m2fhSO5rFR8x6wz4Wq8X7VoUChuzb5SnQNDvkyJ508MBT9fXw5dI0?=
 =?iso-8859-1?Q?n5Q4fTmzODEI0nPz+WUHDqD+RL/rbtGQLb4O0WM7B0qQJs0wOefGpfe9fl?=
 =?iso-8859-1?Q?41f9qJjQdlQVhlnTiJnqQWofrfSo+ZT8/wm/LZMn6t/d8DHbAq6v1a+R6z?=
 =?iso-8859-1?Q?2hZsjshhDmgVl2mPoQz5b4+VevpFGBpcAd2qCHk81UCAo856Nc04cc2zNz?=
 =?iso-8859-1?Q?z+tgCHCNfR7/CeQkeUAJo1KnQM5+h9EESFsyQhYxpVi75xpjmNZfExVozq?=
 =?iso-8859-1?Q?ZgX2L21048ZaP0r7lLpVzM6dsnksOfeRJkD4mQMU/6LOhz+kUfClSok8FA?=
 =?iso-8859-1?Q?7D+nM1y7Gxcn9+UxvrY04TuWOAeWhC62wYbFv+yeTpVt8Xtp1I/mQE+Fg3?=
 =?iso-8859-1?Q?9e2+0b9EKOyOkhbL2+Ewc64lzZhVd0B6HNIBwZNTFGf0dWFaayTqQzwzwY?=
 =?iso-8859-1?Q?2w3IMORaXavOpsddIyMMtJfbhWU9nIeI/VDNwmd8Pbwmp/o9c1FOs5AWP/?=
 =?iso-8859-1?Q?2lhwnyHq2gBQkwRJ7wrPbbgl9XiKjXngrOVFesdKNbAXvuwzlU+jmGcJfO?=
 =?iso-8859-1?Q?T7MXdbrkwVJTEnNsDAIK1YoienFq+Q54zqq8d3fTYhF6wIpoDqm9EHpzZp?=
 =?iso-8859-1?Q?2CW91+74cg1Nxv/MWSvOXHjQs915h3rDH5C6yJVbodTcNP8KUjh80oQ5Lx?=
 =?iso-8859-1?Q?ENHakD4zwLdzXPBqFmpDV9/fVOfU80KgRWc09+ueGrpWLCkgV5C31RIZS+?=
 =?iso-8859-1?Q?PiFQbzzSGYRY61paSSf3owmUtAcdyG/EaC8ZFMjlK4Wcc/OCGoccC0JTGa?=
 =?iso-8859-1?Q?xz5Fb0SHkWJ7ssqorfluZVpAUMgm+W6BpzE3uoAS0tZeP9uEsx7trfBmsy?=
 =?iso-8859-1?Q?omHBu/NTl62NsTr6IEDvnMJF9zWizWib5bnl0kxcps3F9Z6Q4eVkjO9jg7?=
 =?iso-8859-1?Q?fCm4CXBDhBAUmi7c4nwZwMAWUC+o//w+IXdw9lvr+5yfVZFBbAk+4BaRIP?=
 =?iso-8859-1?Q?lkVh9vdjZvtgiEpa4WHu4jCp9a9cKiBJf5j42hD1oujnrVuUXiImc6ctep?=
 =?iso-8859-1?Q?e2MGjeW6ubnje0vmkXaDKT91ScxWKdprppmX3gO9w8QDyQuYZxCRJkq/5C?=
 =?iso-8859-1?Q?oEQGu3k=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?b+ppHc4/a02L7U1CR/TRCRu/4rrpWhqNYpn1/BfNInNhnXhbtEG3FsFC0N?=
 =?iso-8859-1?Q?k2D64R1r6YXlFiqPza8pg/73E9wFfHu0IFpbs69cqzb80L+JGrFmjMBcWQ?=
 =?iso-8859-1?Q?3Rs7GERIT3BvHT78TpKloebvD0QTmjv86fPq4Ah33RLz5VkbZP/9NfdUWr?=
 =?iso-8859-1?Q?ET4jh8yfXMlEiMONf+VKuNxf06h2T+Zpxs+661DdV92pQz1K/ITQdJ/UCr?=
 =?iso-8859-1?Q?QtI9eNYU1ZFIGGp+SkeSQyUludk87QqP2ACO+Tsc9MmxKipU2kaLc9TCy0?=
 =?iso-8859-1?Q?KOpXssXmOn6Y6G4d06Si1uc/CG55a833LHEF94XwftluzOQkBp9REfdlab?=
 =?iso-8859-1?Q?4gkbbQcG8DejjIWHLl0HJqfisyFJ7PH67Gy1q7prytpwxGsao4DkxG9103?=
 =?iso-8859-1?Q?M9UIap51Aa5b5sOuxdWp0tDyTKELpp0mTKDbHbbCKOypggigrqIV0Pw1PD?=
 =?iso-8859-1?Q?pdpYMka2+PiglgX01Lp2wPS/S6ZGpunJp0b0c4OQLtCqFegGYloYD+vS6G?=
 =?iso-8859-1?Q?UBlWQuOFOuxmb8JC7pf1k+5yGuOFXQqSXJEPkeagBt0PN24UnNmu+Szb1v?=
 =?iso-8859-1?Q?B3rIlibbYWjWsIzKxEtc6hr3POdliS2l7PppA6TO20vNyorWFvTIwzOJ+S?=
 =?iso-8859-1?Q?zJBx3fap8p4AgvRYgr6FYU44i6/KjpX4XulvU4W10P3l8xhu1Bo5dQi2V8?=
 =?iso-8859-1?Q?2ISkeSDL5slihR4zflcEgjXZikk9vqiCSESApCWig5hykIBuDa2HVdgHLz?=
 =?iso-8859-1?Q?fVR1rkQ3Pz0N5FJd88gaYYL/083yWBbPE/HzMZC8ivCzTC+LgVOzi7gZll?=
 =?iso-8859-1?Q?DSK7Vw12AylaOHi9YZgGz95GOR59Zuz6uyOdcdhc6WA9vIg1JPM8Vkb2o9?=
 =?iso-8859-1?Q?PFAAGJTTb7tzUA3e2+givSBS5BLQnMWD9NC/PRh4p90XjuhiQI5FFtIm/1?=
 =?iso-8859-1?Q?b5xJoNLn/KBm6bf4lhCya9UWzLzo7tJetksYhozVMDBPSeKjBgLOI97oi9?=
 =?iso-8859-1?Q?GhuWAEC0FERXnuZfyGGhiCrRMqHdni9/dvy2wOFE0fLVBswzIKcqBOc+Ka?=
 =?iso-8859-1?Q?agYl76MS0qXlPjDSv+/dCKkOlioklK7XMALPUnJFyV3vCBuGqz3ZdOpcM9?=
 =?iso-8859-1?Q?I0tTN7kaMNTsEjhBx5Fw/6WJfNCnPz9ZmmkN5S+Qur1lU9s25UeOCJdSHI?=
 =?iso-8859-1?Q?7641hWOfkP5JxQOlPwbOHQA4NSYbp3onIfBKHhYUaj+9shPqMcUPlhs8Ur?=
 =?iso-8859-1?Q?qCeamKTe6l3iEeSNelaSLDQ74cTxKJ8ZdA3BHUjS5zuarBEGPrEy9D+geq?=
 =?iso-8859-1?Q?mQFnDee8n9Z46Gr4Bp4bSwH1L4Sw1V0VY9eW2ZSJonklQAT7O8rMfkSS6l?=
 =?iso-8859-1?Q?X/YwdYqCmxJNPV6+cAYnf9RsbfGBEBPfOH1JE/k4LIBjW4l9LaqSIqqHJI?=
 =?iso-8859-1?Q?bPSOx4nGyiRP9M5Yw+ljWFs8JAi9kc7pthfludCNKDyo8pyLg6fwxqZNmB?=
 =?iso-8859-1?Q?/kzgyIyNu3ePaLYXUr3/c6epcd1kRDENqgF3ZW3CdvO1IqViPHyTghovsP?=
 =?iso-8859-1?Q?Wlgp3d/+F5gJkgyi3EuWbiCnudpVr5YODt9EAM/7BA0muT3oIBJOxxXyCN?=
 =?iso-8859-1?Q?uE7SqQijiNb/nlJzSODIu8P/IZ9xWKkmO2vMrj7WdNZ+/IsVwljTLoJw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19f95e5d-cc55-4404-bc73-08dd8d4d198c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 09:53:59.0708
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pagvCWWVGk+ZpTNQ1FM7l8nz+N4IKI6E9tPOOAvcvNvfgug5gnnTD8uSgxaX12QSPpS4hF8Q3z5CizJg1/j/E8QYBHPqai48Tb8ANqyyVkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB9758

LibAFL, which is a part of AFL++ project is a instrument that allows
us to perform fuzzing on beremetal code (Xen hypervisor in this case)
using QEMU as an emulator. It employs QEMU's ability to create
snapshots to run many tests relatively quickly: system state is saved
right before executing a new test and restored after the test is
finished.

This patch adds all necessary plumbing to run aarch64 build of Xen
inside that LibAFL-QEMU fuzzer. While, most of the code is in common
section and can be used by any supported architecture, final calls to
LibAFL-QEMU are arch-specific and were tested only on aarch64 for
now. But LibAFL-QEMU itself supports many different architectures,
including x86_64 and riscv.

From the Xen perspective we need to do following things:

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
CONFIG_FUZZER_PASS_BLOCKING was added. It basically tells
fuzzer that test was completed successfully if Dom0 tries to shut
itself (or the whole machine) down.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---

Changes in v3:

 - Added fuzzer.h
 - Kconfig entries were reworked to be more generic and support
   other fuzzers in the future
 - Moved all the code into common area, as there is nothing
   arch-specific in it
 - Created arch-specific header file form ARM
 - Removed not used definitions in libafl-qemu.h
 - Removed not used functions from libafl-qemu.c
 - Folded libafl-qemu-defs.h into libafl-qemu.h as we don't
   need two separate headers
 - Aligned code with xen coding style
 - Added SPDX identifiers with MIT license to libafl-* files
---
 docs/hypervisor-guide/fuzzing.rst      | 91 ++++++++++++++++++++++++++
 xen/arch/arm/Kconfig.debug             | 37 +++++++++++
 xen/arch/arm/include/asm/libafl-qemu.h | 48 ++++++++++++++
 xen/arch/arm/psci.c                    |  5 ++
 xen/common/Makefile                    |  1 +
 xen/common/domain.c                    |  3 +
 xen/common/libafl-qemu.c               | 80 ++++++++++++++++++++++
 xen/common/sched/core.c                |  6 ++
 xen/common/shutdown.c                  |  3 +
 xen/drivers/char/console.c             |  3 +
 xen/include/xen/fuzzer.h               | 52 +++++++++++++++
 xen/include/xen/libafl-qemu.h          | 63 ++++++++++++++++++
 12 files changed, 392 insertions(+)
 create mode 100644 docs/hypervisor-guide/fuzzing.rst
 create mode 100644 xen/arch/arm/include/asm/libafl-qemu.h
 create mode 100644 xen/common/libafl-qemu.c
 create mode 100644 xen/include/xen/fuzzer.h
 create mode 100644 xen/include/xen/libafl-qemu.h

diff --git a/docs/hypervisor-guide/fuzzing.rst b/docs/hypervisor-guide/fuzz=
ing.rst
new file mode 100644
index 0000000000..895d858edc
--- /dev/null
+++ b/docs/hypervisor-guide/fuzzing.rst
@@ -0,0 +1,91 @@
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
+Building Xen for fuzzing with LibAFL-QEMU
+-----------------------------------------
+
+Xen hypervisor should be built with these three options::
+
+  CONFIG_FUZZING=3Dy
+  CONFIG_FUZZER_LIBAFL_QEMU=3Dy
+  CONFIG_FUZZER_PASS_BLOCKING=3Dy
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
+for test harness we use special build of XTF (Xen Testing Framework).
+You can build XTF manually, or let fuzzer to do this::
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
index 5a03b220ac..1a51c5d221 100644
--- a/xen/arch/arm/Kconfig.debug
+++ b/xen/arch/arm/Kconfig.debug
@@ -190,3 +190,40 @@ config EARLY_PRINTK_INC
 	default "debug-mvebu.inc" if EARLY_UART_MVEBU
 	default "debug-pl011.inc" if EARLY_UART_PL011
 	default "debug-scif.inc" if EARLY_UART_SCIF
+
+config FUZZING
+       bool "Build Xen for fuzzing"
+       help
+          Enable this option only if you are going to run the hypervisor
+	  inside a fuzzer. Do not try to run run Xen built with this option
+	  on any real hardware, because it will likely crash during boot.
+
+choice FUZZER
+       depends on FUZZING
+       prompt "Fuzzer"
+
+config FUZZER_LIBAFL_QEMU
+	depends on ARM_64
+	bool "LibAFL-QEMU"
+	help
+	  This option enables support for LibAFL-QEMU fuzzer. Choose this
+	  option only when you are going to run hypervisor inside LibAFL-QEMU.
+	  Xen will report code section to LibAFL and will report about
+	  crash when it panics.
+
+endchoice
+
+config FUZZER_PASS_BLOCKING
+	depends on FUZZING
+	bool "Fuzzing: Report any attempt to suspend/destroy a domain as a succes=
s"
+	help
+	  When fuzzing hypercalls, a fuzzer might make Xen to do something
+	  that prevents from returning to the caller: reboot or turn off the
+	  machine, block calling vCPU, crash a domain, etc. Depending on
+	  fuzzing goal this may be a valid behavior, but as control is not
+	  returned to the fuzzing harness, it can't tell the fuzzer about
+	  success. With this option enabled, Xen will do this by itself.
+
+          Enable this option only if fuzzing attempt can lead to a
+	  correct stop, like when fuzzing hypercalls or PSCI.
+
diff --git a/xen/arch/arm/include/asm/libafl-qemu.h b/xen/arch/arm/include/=
asm/libafl-qemu.h
new file mode 100644
index 0000000000..9b87eafca9
--- /dev/null
+++ b/xen/arch/arm/include/asm/libafl-qemu.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Arch-specific portions of LibAFL-QEMU interface
+ */
+#ifndef __ASM_ARM_LIBAFL_QEMU_H
+#define __ASM_ARM_LIBAFL_QEMU_H
+
+#define LIBAFL_DEFINE_FUNCTIONS(name, opcode)                           \
+    libafl_word _libafl_##name##_call0(                                 \
+        libafl_word action) {                                           \
+        register unsigned long r0 ASM_REG(0) =3D action;                  =
\
+        __asm__ volatile (                                              \
+            ".word " XSTRINGIFY(opcode) "\n"                            \
+            : "+r"(r0)                                                  \
+            :                                                           \
+            : "memory"                                                  \
+            );                                                          \
+        return r0;                                                      \
+    }                                                                   \
+                                                                        \
+    libafl_word _libafl_##name##_call1(                                 \
+        libafl_word action, libafl_word arg1) {                         \
+        register unsigned long r0 ASM_REG(0) =3D action;                  =
\
+        register unsigned long r1 ASM_REG(1) =3D arg1;                    =
\
+        __asm__ volatile (                                              \
+            ".word " XSTRINGIFY(opcode) "\n"                            \
+            : "+r"(r0)                                                  \
+            : "r"(r1)                                                   \
+            : "memory"                                                  \
+            );                                                          \
+        return r0;                                                      \
+    }                                                                   \
+                                                                        \
+    libafl_word _libafl_##name##_call2(                                 \
+        libafl_word action, libafl_word arg1, libafl_word arg2) {       \
+        register unsigned long r0 ASM_REG(0) =3D action;                  =
\
+        register unsigned long r1 ASM_REG(1) =3D arg1;                    =
\
+        register unsigned long r2 ASM_REG(2) =3D arg2;                    =
\
+        __asm__ volatile (                                              \
+            ".word " XSTRINGIFY(opcode) "\n"                            \
+            : "+r"(r0)                                                  \
+            : "r"(r1), "r"(r2)                                          \
+            : "memory"                                                  \
+            );                                                          \
+        return r0;                                                      \
+    }
+
+#endif
diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
index b6860a7760..43253b3f71 100644
--- a/xen/arch/arm/psci.c
+++ b/xen/arch/arm/psci.c
@@ -10,6 +10,7 @@
=20
=20
 #include <xen/acpi.h>
+#include <xen/fuzzer.h>
 #include <xen/types.h>
 #include <xen/init.h>
 #include <xen/mm.h>
@@ -62,12 +63,16 @@ void call_psci_cpu_off(void)
=20
 void call_psci_system_off(void)
 {
+    fuzzer_on_block();
+
     if ( psci_ver > PSCI_VERSION(0, 1) )
         arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_OFF, NULL);
 }
=20
 void call_psci_system_reset(void)
 {
+    fuzzer_on_block();
+
     if ( psci_ver > PSCI_VERSION(0, 1) )
         arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_RESET, NULL);
 }
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 98f0873056..f2fbf54911 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -78,6 +78,7 @@ extra-y :=3D symbols-dummy.o
 obj-$(CONFIG_COVERAGE) +=3D coverage/
 obj-y +=3D sched/
 obj-$(CONFIG_UBSAN) +=3D ubsan/
+obj-$(CONFIG_FUZZER_LIBAFL_QEMU) +=3D libafl-qemu.o
=20
 obj-$(CONFIG_NEEDS_LIBELF) +=3D libelf/
 obj-$(CONFIG_LIBFDT) +=3D libfdt/
diff --git a/xen/common/domain.c b/xen/common/domain.c
index abf1969e60..e63a80c26e 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -5,6 +5,7 @@
  */
=20
 #include <xen/compat.h>
+#include <xen/fuzzer.h>
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/ctype.h>
@@ -1317,6 +1318,8 @@ int domain_shutdown(struct domain *d, u8 reason)
=20
     spin_unlock(&d->shutdown_lock);
=20
+    fuzzer_on_block();
+
     return 0;
 }
=20
diff --git a/xen/common/libafl-qemu.c b/xen/common/libafl-qemu.c
new file mode 100644
index 0000000000..a09a2931c6
--- /dev/null
+++ b/xen/common/libafl-qemu.c
@@ -0,0 +1,80 @@
+/* SPDX-License-Identifier: MIT */
+/*
+  This file is based on libafl_qemu_impl.h, libafl_qemu_qemu_arch.h
+  and libafl_qemu_defs.h from LibAFL project.
+*/
+#include <xen/lib.h>
+#include <xen/init.h>
+#include <xen/kernel.h>
+#include <xen/spinlock.h>
+#include <xen/libafl-qemu.h>
+#include <asm/libafl-qemu.h>
+
+/* Generates sync exit functions */
+LIBAFL_DEFINE_FUNCTIONS(sync_exit, LIBAFL_SYNC_EXIT_OPCODE)
+
+    void libafl_qemu_end(enum LibaflQemuEndStatus status)
+{
+    _libafl_sync_exit_call1(LIBAFL_QEMU_COMMAND_END, status);
+}
+
+void libafl_qemu_internal_error(void)
+{
+    _libafl_sync_exit_call0(LIBAFL_QEMU_COMMAND_INTERNAL_ERROR);
+}
+
+void lqprintf(const char *fmt, ...)
+{
+    static DEFINE_SPINLOCK(lock);
+    static char buffer[LIBAFL_QEMU_PRINTF_MAX_SIZE] =3D {0};
+    va_list args;
+    int res;
+
+    spin_lock(&lock);
+
+    va_start(args, fmt);
+    res =3D vsnprintf(buffer, LIBAFL_QEMU_PRINTF_MAX_SIZE, fmt, args);
+    va_end(args);
+
+    if ( res >=3D LIBAFL_QEMU_PRINTF_MAX_SIZE )
+    {
+        /* buffer is not big enough, either recompile the target with more=
 */
+        /* space or print less things */
+        libafl_qemu_internal_error();
+    }
+
+    _libafl_sync_exit_call2(LIBAFL_QEMU_COMMAND_LQPRINTF,
+                            (libafl_word)buffer, res);
+    spin_unlock(&lock);
+}
+
+void libafl_qemu_trace_vaddr_range(libafl_word start,
+                                   libafl_word end)
+{
+    _libafl_sync_exit_call2(LIBAFL_QEMU_COMMAND_VADDR_FILTER_ALLOW, start,=
 end);
+}
+
+static int init_afl(void)
+{
+    vaddr_t xen_text_start =3D (vaddr_t)_stext;
+    vaddr_t xen_text_end =3D (vaddr_t)_etext;
+
+    lqprintf("Telling AFL about code section: %lx - %lx\n", xen_text_start=
,
+             xen_text_end);
+
+    libafl_qemu_trace_vaddr_range(xen_text_start, xen_text_end);
+
+    return 0;
+}
+
+__initcall(init_afl);
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
+
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 9043414290..b109a8de44 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -16,6 +16,7 @@
 #ifndef COMPAT
 #include <xen/init.h>
 #include <xen/lib.h>
+#include <xen/fuzzer.h>
 #include <xen/param.h>
 #include <xen/sched.h>
 #include <xen/sections.h>
@@ -1429,6 +1430,8 @@ void vcpu_block(void)
         TRACE_TIME(TRC_SCHED_BLOCK, v->domain->domain_id, v->vcpu_id);
         raise_softirq(SCHEDULE_SOFTIRQ);
     }
+
+    fuzzer_on_block();
 }
=20
 static void vcpu_block_enable_events(void)
@@ -1502,6 +1505,8 @@ static long do_poll(const struct sched_poll *sched_po=
ll)
     TRACE_TIME(TRC_SCHED_BLOCK, d->domain_id, v->vcpu_id);
     raise_softirq(SCHEDULE_SOFTIRQ);
=20
+    fuzzer_on_block();
+
     return 0;
=20
  out:
@@ -1529,6 +1534,7 @@ long vcpu_yield(void)
=20
     TRACE_TIME(TRC_SCHED_YIELD, current->domain->domain_id, current->vcpu_=
id);
     raise_softirq(SCHEDULE_SOFTIRQ);
+
     return 0;
 }
=20
diff --git a/xen/common/shutdown.c b/xen/common/shutdown.c
index c47341b977..8e82678626 100644
--- a/xen/common/shutdown.c
+++ b/xen/common/shutdown.c
@@ -1,5 +1,6 @@
 #include <xen/init.h>
 #include <xen/lib.h>
+#include <xen/fuzzer.h>
 #include <xen/param.h>
 #include <xen/sched.h>
 #include <xen/sections.h>
@@ -32,6 +33,8 @@ static void noreturn reboot_or_halt(void)
=20
 void hwdom_shutdown(unsigned char reason)
 {
+    fuzzer_on_block();
+
     switch ( reason )
     {
     case SHUTDOWN_poweroff:
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index c3150fbdb7..45048351d5 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -16,6 +16,7 @@
 #include <xen/event.h>
 #include <xen/console.h>
 #include <xen/param.h>
+#include <xen/fuzzer.h>
 #include <xen/serial.h>
 #include <xen/softirq.h>
 #include <xen/keyhandler.h>
@@ -1289,6 +1290,8 @@ void panic(const char *fmt, ...)
=20
     kexec_crash(CRASHREASON_PANIC);
=20
+    fuzzer_crash();
+
     if ( opt_noreboot )
         machine_halt();
     else
diff --git a/xen/include/xen/fuzzer.h b/xen/include/xen/fuzzer.h
new file mode 100644
index 0000000000..852917fe50
--- /dev/null
+++ b/xen/include/xen/fuzzer.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef XEN__FUZZER_H
+#define XEN__FUZZER_H
+
+#include <xen/compiler.h>
+
+#ifdef CONFIG_FUZZER_LIBAFL_QEMU
+#include <xen/libafl-qemu.h>
+#endif
+
+/* Unconditional failure */
+static always_inline void fuzzer_crash(void)
+{
+#ifdef CONFIG_FUZZER_LIBAFL_QEMU
+    libafl_qemu_end(LIBAFL_QEMU_END_CRASH);
+#endif
+}
+
+/* Unconditional success */
+static always_inline void fuzzer_success(void)
+{
+#ifdef CONFIG_FUZZER_LIBAFL_QEMU
+    libafl_qemu_end(LIBAFL_QEMU_END_OK);
+#endif
+}
+
+/*
+ * Conditional success
+ *
+ * Sometimes a fuzzer might make Xen to do something that prevents
+ * from returning to the caller: reboot or turn off the machine, block
+ * calling vCPU, crash a domain, etc. Depending on fuzzing goal this
+ * may be a valid behavior, but as control is not returned to the
+ * fuzzing harness, it can't tell the fuzzer about success, so we need
+ * to do this ourselves.
+ */
+static always_inline void fuzzer_on_block(void)
+{
+#ifdef CONFIG_FUZZER_PASS_BLOCKING
+    fuzzer_success();
+#endif
+}
+
+#endif
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/xen/libafl-qemu.h b/xen/include/xen/libafl-qemu.h
new file mode 100644
index 0000000000..f3b32adeca
--- /dev/null
+++ b/xen/include/xen/libafl-qemu.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __XEN_LIBAFL_QEMU_H
+#define __XEN_LIBAFL_QEMU_H
+
+#include <xen/stdint.h>
+#define LIBAFL_QEMU_PRINTF_MAX_SIZE 4096
+
+#define LIBAFL_STRINGIFY(s) #s
+#define XSTRINGIFY(s) LIBAFL_STRINGIFY(s)
+
+#define LIBAFL_SYNC_EXIT_OPCODE 0x66f23a0f
+
+typedef enum LibaflQemuCommand
+{
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
+enum LibaflQemuEndStatus
+{
+  LIBAFL_QEMU_END_UNKNOWN =3D 0,
+  LIBAFL_QEMU_END_OK =3D 1,
+  LIBAFL_QEMU_END_CRASH =3D 2,
+};
+
+void libafl_qemu_end(enum LibaflQemuEndStatus status);
+
+void libafl_qemu_internal_error(void);
+
+void __attribute__((format(printf, 1, 2))) lqprintf(const char *fmt, ...);
+
+void libafl_qemu_trace_vaddr_range(libafl_word start, libafl_word end);
+
+static always_inline void libafl_qemu_success_on_block(void)
+{
+#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
+    libafl_qemu_end(LIBAFL_QEMU_END_OK);
+#endif
+}
+
+#endif
--=20
2.48.1

