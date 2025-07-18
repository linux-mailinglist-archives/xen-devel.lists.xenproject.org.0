Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED514B0A413
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 14:22:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048642.1418867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uck66-00083w-7X; Fri, 18 Jul 2025 12:21:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048642.1418867; Fri, 18 Jul 2025 12:21:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uck66-000827-40; Fri, 18 Jul 2025 12:21:54 +0000
Received: by outflank-mailman (input) for mailman id 1048642;
 Fri, 18 Jul 2025 12:21:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tfz2=Z7=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1uck64-0007Zl-8H
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 12:21:52 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c80e1840-63d1-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 14:21:50 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PAWPR03MB10182.eurprd03.prod.outlook.com
 (2603:10a6:102:334::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Fri, 18 Jul
 2025 12:21:43 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 12:21:43 +0000
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
X-Inumbo-ID: c80e1840-63d1-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PFX91cO/U1MVwdEJ/2pLhjRY7W6yhDe4iZTafWhyEoDiJr/4bGdK/JorxknSDlOZGdZ0BfkqAEu/hm2kVWKoUwLyTe3f6AcBlS2uLQL+7Q3NblbjkIzLEdcKsM1zDv4UEyBBmgAuIrYn2fOCVTFNGWKzzuM2Sah97RPrOPF/BigTA/Rrk8kfXrj6aqP3jO0gCup9CzeDilaOFV+fsG4iQAKheEcjePwlwuyWy13hBY/myJKxNlbHD+gYOJ5X0Zgxjh5wQUayCbB/Ld5n+1saXfbhCA3DJgJ1P5iA3apNJZtxoo6z5GY5ZT132Fyn/KuNCuWRxJivIgdwpp/pEj/JXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRi9NWYdNSJ+HkfR+eMZhQWYrjEplkgIQwri77N3GOE=;
 b=UsRyFBNMG/UOFOEoFl7WcsjfHE7Q6A0XcFOKxvUYe0uYMJeZdTn8l1U3LjHHQczT2zxzvZyERcJigpP1VVItyMcgIk1qHdtUIikwVYnib7Iwxp9jF+zXYTjm8fHeqQq+m4KzsLDG1CpgDqCvpsODTq4bVeS1TZ9RT+pDHpl6D6TZzRjdOzy6PN3Cl7wV1MTVBxDo4P0Gnhk09i4hhlOz/bgPJKlYZx06xe2CkOTpAGifxIbXuWPbrEBgK3qZE2sHKbnsiNVidbtZHT3eC/WmmM2K910xmneiVPB+p7Fg17CvIxvfFPR3T01OF/ILSjf+nWZmfeQvqa+qTy/6IqzvBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRi9NWYdNSJ+HkfR+eMZhQWYrjEplkgIQwri77N3GOE=;
 b=Bqcll69soY6gfuevT4mwkfGtcuU2VKln8RtwXuz213DS52MTfBRuZfVNVTDEsghVccYBxkBg1z9Uepgj1toQkcWY6P00AMuKnW9P1QQVDfNq9WNT0K7BCnm8kXh7/VZwPPAd0dYuHaMULDZdJoWoFmKzeWeKeAsTF3OXnlam2iuBmg7fvfsi4RiFtLcNCp4DBttbUyYfmndDyS8Es9mUuN0j7XN19VjeJSkVFrp0AJYByXFiJDUkydbQeC4XofjRKT4GObniS2RZYVR50yHJkUltVfGL30zEfIo65MMOXAwkypgxg0cbfMlaDg81HKMscn2oyCj3sPTeXThpC08tLg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH v4 1/2] xen: add libafl-qemu fuzzer support
Thread-Topic: [RFC PATCH v4 1/2] xen: add libafl-qemu fuzzer support
Thread-Index: AQHb996FU5MfiX1Hx024cZ+BqAQKpA==
Date: Fri, 18 Jul 2025 12:21:42 +0000
Message-ID: <20250718122115.2448874-2-volodymyr_babchuk@epam.com>
References: <20250718122115.2448874-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250718122115.2448874-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.50.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PAWPR03MB10182:EE_
x-ms-office365-filtering-correlation-id: daf63363-c3d9-47bd-84df-08ddc5f5a821
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?qBnR2MFj8x35/rPWRkhjRtB4Ifkn9Rk86pvDQyWM41ThicEiN54vVp2d5p?=
 =?iso-8859-1?Q?Zdso+Bfg5IB0jXvnY1HRp/C4TYnj2CBQ8/XzVBVzAeDOLA+D0qGpoufEWt?=
 =?iso-8859-1?Q?ExaTDnz/XHLXL0ThZPHbsMF8MQ18xILyDwmtZw2XYpdYRMjzEJuhOUVW6y?=
 =?iso-8859-1?Q?h/ZiPijk8mLVitdEXlAqCeCpR62PkBH4ghYkz8DFRwF40BV8CYfLQwIa9v?=
 =?iso-8859-1?Q?5yn1i6SSLuW406eACl89pPWKmgkYStGTB1SZ6jRV58Xn4FP+kBwzcZJSPg?=
 =?iso-8859-1?Q?nZjPXqJi5JsKPpzIBarQqiNRwj+Y6rtIDGY6AzYRTQKLMNS0qwkMe2KQzr?=
 =?iso-8859-1?Q?QHTHaRLgwY/sDa6pW2zO3UGRib8UnEQqJ8898LdMovw8CTUUv7rIPnCEdU?=
 =?iso-8859-1?Q?CRGjg5/SSJ6mVq1o8/FfqWZGGrSPvZFJ9xQvJ8tvW3tWKsXK7WXdKVdDVv?=
 =?iso-8859-1?Q?KFWGA01yKunq1u/4fyW20/m8XZTHxMre7vpD5qNE6RN72pUxCaVe/mq1a0?=
 =?iso-8859-1?Q?RhyYVZ9ZLji8ucyzKcwZFyEQ1wWyKItsYX+q14TykSwUlaChwtEcWdptYJ?=
 =?iso-8859-1?Q?bEHeDkH9xR9z3WzIuIehVFvpfsBtLT3iGgZCJRxnG0VoSYiv74Suf4J+Sk?=
 =?iso-8859-1?Q?iAm/AOXE+veQZ+SLOIhbHMtjnPWGlq43c3YpKrymDWjO4LPaq/XhbYFbwg?=
 =?iso-8859-1?Q?s/UguaMYyZjYQkhJfdxPva5b2g1cmD0Yjl1KZc26v0qprckS/VlmOPx8VJ?=
 =?iso-8859-1?Q?zZXmBzhujGBJTESZf4RQa4mqeXjC4pULA0A3lPE9ltCtDphPdTg/h0EIpe?=
 =?iso-8859-1?Q?0f4IJDUVPLX4Em7Ph6soP5P5aD8S+BSlZSSs7fZhwecwXuAJYe5u83IEJG?=
 =?iso-8859-1?Q?5dp3Te3Ap4jHT6vZhvyIaSv7FRfASLtZnsjBYso29loCfY3qdyD6Hv8TZz?=
 =?iso-8859-1?Q?3FH9wgsuUhVb0NZjpeZa09rZvmc0eUas08LTaWYX+bL4ZNePw/DVRnfhmb?=
 =?iso-8859-1?Q?Jbp3evbz6hzy1+ooKZewmtYLfA7Kl60aOCuLVQBAOFxoasECA9jFnTpO9n?=
 =?iso-8859-1?Q?C4M22Wvn5lF94DlfpayWLx3pQcmEmECnSiQs7WI2ow9FHJgSJcXIRgUCBh?=
 =?iso-8859-1?Q?xz9al3GZP6qXTUALFnt8yblUIOXWuRq1+BDNz401B8eP3HyUS4Say8ZtLJ?=
 =?iso-8859-1?Q?eBDYCSqvEGd2F8kBtDJiK9YkQc+FiSkOcnOYp9e/5u2JMA13ODLjgLm2j3?=
 =?iso-8859-1?Q?dbh/o7de+dPKkwwFrGWLxGF7lmfPyTZJpjBaIYCgpgwrq11YOVMMXfTyzR?=
 =?iso-8859-1?Q?I6pVRuJtVCGYzEmpBH0zYeARHdSaiMwaY1tYAEou9wNd294CoT9w0iKMSi?=
 =?iso-8859-1?Q?6qMQf9V5oYYkYN3Z1iFh/P+BEPOoj1kXVkKNIYnwggbtvymlY/6mTjo40f?=
 =?iso-8859-1?Q?ccw9/Sx4k06esC0Gqc6yOh+vrXAEwAZE/sC+or9MKbCSbud/7oMnomBY7z?=
 =?iso-8859-1?Q?mFQZ/icG59pcOQGmZskb1F+KPA/2ZqrCyI05QZEoh1NAuZ/G7CWQ2Fgg8W?=
 =?iso-8859-1?Q?0MXYPoo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?AnStj+wNUD8i7vsqmpGzDDTse3MR/mc26b0xQW2f/SZFd97yvzfkReBkGE?=
 =?iso-8859-1?Q?N/HRo3FGI/o2o6wiiWlOqKJ/PxilXm5aGJRYOUH9n1QnqNcC2tEBfByB1f?=
 =?iso-8859-1?Q?dxV4vxK+y8YzqEodGEslBrZKs74DJnHwE6QfCGHCoXeBzI0khdpEe36WMN?=
 =?iso-8859-1?Q?9Q4brbzCRxfCD9yaO2s09vqYZo/dGSFcGjJMgu/GamdIVh9VxQQnplokXC?=
 =?iso-8859-1?Q?FzLwvWUCGI2ZK9mGv/eCttoIgaUB9pn0UAh6j09ANLCeCEUMJMgwUI987O?=
 =?iso-8859-1?Q?4S0Jcj+SwfYhNUdjY7LTtRnWu1c4PjfZt2GoQhkCRMfzJFearddlKgFuXD?=
 =?iso-8859-1?Q?0n0PiVAl/n2o34vOZVWdxhN4ix2sfchXvztaqbV9dXT18K4JbPghTAr7XA?=
 =?iso-8859-1?Q?AtGKT7hZbYAFF5w0tTEddMeBHyi4jFtEA9A7/weGj5jty4dMJOKi/LqBUQ?=
 =?iso-8859-1?Q?Y0oQfxy1iOvaU5nBsMxv/O43ZXDU8f1HZsz1axcKIL0ZbjCA0yTDOKN6KW?=
 =?iso-8859-1?Q?OH1prbaB3UtpdqdfDSbIwR/0JLlDLyh3pKt9VuT0WcZ8OOHDdUWkOxGUAl?=
 =?iso-8859-1?Q?s99xcTwEAJr5V6xJAQbKrfDNHo2jG8q1teq3aZewN/8zknXDyKitQXFGYG?=
 =?iso-8859-1?Q?IN5W3QA3BDsRrYdj9rbwI5w3D6anGXwlybUXGTE+yxQPnWKoxtEqnzfkTe?=
 =?iso-8859-1?Q?3izVdAtGWVuIMPluB9/RW5mZ7rcF6SJzqZbpq1Wc/0VNDzzZznaGW6pxXR?=
 =?iso-8859-1?Q?QvKi3svnnHK0P/etots/VBNBQirGg8hZ0tBAqAfXVVuSo2aQhfrAAIY1ez?=
 =?iso-8859-1?Q?krlP/0y4/8u3bxnTJ/1sz5p++lKGu8MokZerayOPMSc95g1ozFIQuiyWzY?=
 =?iso-8859-1?Q?4k1pR02KSptxHzI6Zd0ZdI+GeARR3qn/WVfoMCTdyUXcqvV+OlzSM0Px5t?=
 =?iso-8859-1?Q?2079PGnDYeMyiBpzqHwVPKWn9TYB2hbZWtDLQ3ySOCAMctYpaOVUQuuGJT?=
 =?iso-8859-1?Q?3lWJuULRVcACT1zO4a8QsbtINxViEvRtAsP2V2OuwE6lbVDDGzJ3Z3hbSb?=
 =?iso-8859-1?Q?Ut0R8c8SVHK7nZ5Dgh1TO+XMqEV71+n/6vhkmqYW9Ei9CzdRTDt3yxXhTY?=
 =?iso-8859-1?Q?BhXjdan2mRFYbFe8P7mwn9OOC9fqLIoRjwB4EqzgH7L3RsSDCRkAZRGCXp?=
 =?iso-8859-1?Q?KYBYsnDj8tcoZ/8PtNqy/0h4c/VV/A7CJuCWvXI7RTtImQkBJFIjEMnO0j?=
 =?iso-8859-1?Q?amD7QjgFVMLziVw784KjrQbCfKPl9hl1QRtEkTpJq3MzsVg0JB31U++0iC?=
 =?iso-8859-1?Q?nl1/wQtIx5v99LHZ+2lw0zOic+UrA2QP118YvQgjYgLoWXCjR2gGW3rAzd?=
 =?iso-8859-1?Q?N6WMjXJD4kI4Ti4u6S9W27khHO848ZBIdygxEWjxcEnUptDIZLWS0WFDNO?=
 =?iso-8859-1?Q?fNTwtLUIi/q/zEbhP2T9J6cDft3tSiBd6T9STzDkPqSOP7VgOpcgwdUOZl?=
 =?iso-8859-1?Q?REX/LvnSFPGaFKhURZ2haFJgXxAUkxAs0OeEnFpvP5ErsftGmboXYYTiUG?=
 =?iso-8859-1?Q?InZ37ZA9wiyCW7IxwyoFRD8nZSKi06R1qkSkKDR6N5hO5vVlJYKO9Mvcpv?=
 =?iso-8859-1?Q?kf8PjZlui/XMfhXytz79gHTKg7EoKJQB12bx++aMrI+oraBAmh2AKhSg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daf63363-c3d9-47bd-84df-08ddc5f5a821
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2025 12:21:42.4224
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pDVA4/xTcRtb74EuRRZ17edV/ph2E1kt9Muts1XTv6ZD4Fcqr0xJKTmMdXEQ8jgYDDgADXjvvLepnDWaLdiK9108NNcvdByfIBYPwOiGeF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB10182

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

Changes in v4:
 - Fixed formatting in Kconfig.debug
 - Removed spurious change
 - Moved libfal-qemu.o in Makefile to the upper position to preserve
   sorting
 - lqprintf() made static
 - minor formatting changes in libfal-qemu.c
 - Removed LibAFL's XSTRINGIFY() macro in favor of STR()
 - Changes typedef for libafl_word to "unsigned long"

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
 12 files changed, 386 insertions(+)
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
index 5a03b220ac..0a5498afd5 100644
--- a/xen/arch/arm/Kconfig.debug
+++ b/xen/arch/arm/Kconfig.debug
@@ -190,3 +190,39 @@ config EARLY_PRINTK_INC
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
+	  Enable this option only if fuzzing attempt can lead to a
+	  correct stop, like when fuzzing hypercalls or PSCI.
diff --git a/xen/arch/arm/include/asm/libafl-qemu.h b/xen/arch/arm/include/=
asm/libafl-qemu.h
new file mode 100644
index 0000000000..99ac52085c
--- /dev/null
+++ b/xen/arch/arm/include/asm/libafl-qemu.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Arch-specific portions of LibAFL-QEMU interface
+ */
+#ifndef __ASM_ARM_LIBAFL_QEMU_H
+#define __ASM_ARM_LIBAFL_QEMU_H
+
+#include <xen/macros.h>
+
+#define LIBAFL_DEFINE_FUNCTIONS(name, opcode)                           \
+    libafl_word _libafl_##name##_call0(                                 \
+        libafl_word action) {                                           \
+        register unsigned long r0 ASM_REG(0) =3D action;                  =
\
+        __asm__ volatile (                                              \
+            ".word " STR(opcode) "\n"                                   \
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
+            ".word " STR(opcode) "\n"                                   \
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
+            ".word " STR(opcode) "\n"                                   \
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
index 98f0873056..fc8b8c4fb4 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -24,6 +24,7 @@ obj-y +=3D kernel.o
 obj-y +=3D keyhandler.o
 obj-$(CONFIG_KEXEC) +=3D kexec.o
 obj-$(CONFIG_KEXEC) +=3D kimage.o
+obj-$(CONFIG_FUZZER_LIBAFL_QEMU) +=3D libafl-qemu.o
 obj-$(CONFIG_LIVEPATCH) +=3D livepatch.o livepatch_elf.o
 obj-$(CONFIG_LLC_COLORING) +=3D llc-coloring.o
 obj-$(CONFIG_VM_EVENT) +=3D mem_access.o
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 303c338ef2..fd0e993aed 100644
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
@@ -1323,6 +1324,8 @@ int domain_shutdown(struct domain *d, u8 reason)
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
index 0000000000..f58b830c6e
--- /dev/null
+++ b/xen/common/libafl-qemu.c
@@ -0,0 +1,79 @@
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
+static void lqprintf(const char *fmt, ...)
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
index 13fdf57e57..f97a2d1908 100644
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
index ba5a809a99..ad737e35cb 100644
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
@@ -1359,6 +1360,8 @@ void panic(const char *fmt, ...)
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
index 0000000000..b922072e35
--- /dev/null
+++ b/xen/include/xen/libafl-qemu.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __XEN_LIBAFL_QEMU_H
+#define __XEN_LIBAFL_QEMU_H
+
+#include <xen/stdint.h>
+#define LIBAFL_QEMU_PRINTF_MAX_SIZE 4096
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
+typedef unsigned long libafl_word;
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
2.50.0

