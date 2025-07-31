Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C96B173D4
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 17:17:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065771.1431085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhV1U-0007d0-AQ; Thu, 31 Jul 2025 15:16:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065771.1431085; Thu, 31 Jul 2025 15:16:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhV1U-0007ac-7C; Thu, 31 Jul 2025 15:16:48 +0000
Received: by outflank-mailman (input) for mailman id 1065771;
 Thu, 31 Jul 2025 15:16:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GSHe=2M=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uhV1T-0007a4-8h
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 15:16:47 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f4e7be5-6e21-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 17:16:46 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AM9PR03MB6803.eurprd03.prod.outlook.com (2603:10a6:20b:2d6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Thu, 31 Jul
 2025 15:16:43 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8989.011; Thu, 31 Jul 2025
 15:16:43 +0000
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
X-Inumbo-ID: 5f4e7be5-6e21-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dzVwx5v1cW7/o8YHoKuu86CikunsRWea5wYnoHQ9yY7OF46hyi93Yt6NIbLc8kpoM2646COcm4dJR3EY7vuAvb73xtE0ZrZUyQrle3G+PxkdMfZ5eTnHAMN96teqSiKN7Bh05RFa0PPM1hNGGGcxZZy9twFBEBrF3eHe4bW3+mgSGyHdD/HSLbuPOkSmrDbllQru1UY87/OEPI53xpolz+dV1r56TxTzp/xNaRapBUVp7JK1yEEHYT0TULzLL1UKRL8Dng5VRhukDV3QOrNvacuzUOX0l/V4OMJL6YLUN5wG/MLIfMs+xGiprF95x9u3RHpRKqwWemsy81BgErF+hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGmKzd6/cWzOw4CESJcBq80AdKXjZETBN2OATdcBuis=;
 b=V2SomASW2kFbfuIyq9mPIaZ83CUhvqSSfbiSHBmSrcrA0QjhpEfsloePTh14kl22Rvdh5DUHHRuy6kzDsiywz+HhnFAAXqw09SFUX3d+oYuFK+ZKozThdleRcqoW6AtzgLVhBJF0JqANLHE0tTOeAgncSTxIeMeY7YdRwUBPfmGOsumGMGiihEHiSf+H5BEQZur93BxuX9SYxJUzeYx5GCPdiAQ8dDDMCbKMTe4oXDc4KQL8IWlK1+8Kh7+I9OC/u9i+A0HIsqnJ1j1/o7GYge+uIjUn+qe0SAmqhp+EO1bQ3pIYiy+BDVgy6hs87/MBAkGP3f2y8y5ZrakqJLXowg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGmKzd6/cWzOw4CESJcBq80AdKXjZETBN2OATdcBuis=;
 b=iuisgca5cR54vLPGqeQ+EuK+JfgbynMzclXinJdQSXgFicZKHAaPQ1fASSnO0expjCnyAue+BtpYrtDLUSbBcqWuJkAC3vNTyP7deXm8Yj9W4TVQcwGuM82tC1AZ+Pok2I0k45XII0yxZQHwmzwHOeLucK6IgljTx8mSCKJMVlN1X+Mna8/gs0Ji+ybCcayek6eIsw+7Zecll6eDU47PXKkNIXpXLR1zNcJ4MiCGj880+sXq5eH9cXn3gN0Y9g9xuC+tl+jn6iWUUiT0AbGosCSed6r82vt3B49VRVfEBYIO+t9p99/P7JP1wQSYPT3hI4sSvSkMQJUMZ7dtOX+DzA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>
Subject: [PATCH] misra: fix violations in macros GVA_INFO, TRACE_TIME
Thread-Topic: [PATCH] misra: fix violations in macros GVA_INFO, TRACE_TIME
Thread-Index: AQHcAi4fqTKeJL6S4E6Pmu2ECW9SEw==
Date: Thu, 31 Jul 2025 15:16:43 +0000
Message-ID:
 <73cfc8a2d4d66042b49f44c69e672ce8ad0556ce.1753971749.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AM9PR03MB6803:EE_
x-ms-office365-filtering-correlation-id: 07b11f9c-0214-4ed0-f785-08ddd04541c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|42112799006|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?VG3r7IK/f37nbDYNzXukvCmooE4Pw+SZtoOLFHhHBkKJDREcwJFSarVeCp?=
 =?iso-8859-1?Q?WOI8yHLBNFPujTajFw6rUWE+cwCMGKA/7A1nisK4YmxHiSXkskBIVcHaoe?=
 =?iso-8859-1?Q?++Usi2mNevViyhnee6gPpn/iW6s7sDybcNWb2vzLKlo/2QbvMMuJARe3+g?=
 =?iso-8859-1?Q?VDbrGWekbBAxy9pO5jVpP5tM51GpqvGIGHdF3YK2rSQdjgIzNh0e8mdWOQ?=
 =?iso-8859-1?Q?Jt2iRLu5SptmIq3mcio7h7MS27DOC7EyCVJxAFrvRDWOJM6m0B0w/Bw32r?=
 =?iso-8859-1?Q?qL2Hkrunxku8S0UC4Ek9ikQ2yFUPCMf+NLjcqq9cRz5sYes26q8e3Vr8og?=
 =?iso-8859-1?Q?u4Vfl33c709mjYeEkFxtg3ZVPFlZpMnLluJnPot7Se8d/VyUEScbYvUK7a?=
 =?iso-8859-1?Q?hvApYQ+2M6czKCHCJ907tkDkhH6mrAmcuRrXT++S9oTfn4Ps5ZaxdT1CF/?=
 =?iso-8859-1?Q?unLmEzHBGVG/zcP3CLlZHWNPo19za2YOyUB1ptWLIEmX6BQjAK1MbYyesl?=
 =?iso-8859-1?Q?+6gJbVWJgKVDMyTtUMmO5fj98+WmJJn1YojzP9iPmQvD/cBBE7WYhPf41S?=
 =?iso-8859-1?Q?bCzD/HK+kOcP+Hw1e7huu8YF87Fqw3slbgd/V4lScKY0EKnsLc4lb9T0ZB?=
 =?iso-8859-1?Q?wCUpBwPzrpM3rERsNiBQXuPekCLvKpYGIPSE+Z814T4Qiphxn57VNVuUez?=
 =?iso-8859-1?Q?4Lhqbl/06mPGyPTsb4C0dtrohKsOFV/a3I/JZqBnmQZNr4HVaq/GJCFIuN?=
 =?iso-8859-1?Q?kRYaLVevapAO/yQ9dn5rO9UIDxssr4TJg6sfaXd8M92Z6LeB/zW0z170sZ?=
 =?iso-8859-1?Q?s8W35kvdkrGTLAnTGmP8JzadwfDy/NhdY4m3hFf6LvPBN+Ry7zf+wBHkR6?=
 =?iso-8859-1?Q?qcb1QW7LMyLbdPSW2PmMY8bhKB9JM9EE9o/4s/ifHRJpBkiyGyJmWQYdQD?=
 =?iso-8859-1?Q?Q3ZPwHzf52tk/oPElZXGQHTLMvbG3Lsi1LmyMq6JR/10g7twlk8K6A7D+B?=
 =?iso-8859-1?Q?W4qu+EgWORfZNZddLmOBXDc++CK60M/LRWG6wob0xXexETJ71GjFcCL2sh?=
 =?iso-8859-1?Q?26RrUlbqkYUYjBAMrQNe5x39cZx1Ix7pXagWQvtkCMwFmSv4sHS5xbKF+p?=
 =?iso-8859-1?Q?0QjWrgvFH16JdxzrKjEJlGElKSfJy5BujpilYgsnEFfNaXjv2rXQkZM754?=
 =?iso-8859-1?Q?phrES9rVLWZaq9CBiHm7niwAsoJOUS8VRn3HdgBQv9NKSper1MZNeBTioG?=
 =?iso-8859-1?Q?GAnFOTOUgqok14CB+mgflOxMDMajYjk9uKpgzl6I6YfXslcKD7dzEtMxAL?=
 =?iso-8859-1?Q?etdX37dExCd+fZ9LtcFZNm+bpOd+3ZAuI71bpX5vt5Uecz1KhjISNexvy+?=
 =?iso-8859-1?Q?B9BVLTrelfGr0uAmn2iyvu88pqtsAS2DUzxKVg/lD07a3hrqVuZMeZPR9t?=
 =?iso-8859-1?Q?UYhEDLxR90gLOInI2uEpZBL8kkin8KbWJak0Goiz+lROWtbStal0RQ4yTZ?=
 =?iso-8859-1?Q?WbbOegnPpkPg5XVZp6xlPYs6grtkKu1oQCg3qgySW6/w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(42112799006)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?TxAtHBxYXt1xwzfIeiNj70ixlTA7Y/tMFwVR9gwlK0c2n5w6iP0ehXxxOt?=
 =?iso-8859-1?Q?MKm5Ao9h3dGxYBrHgj1SS0BZtYgmSpnoBhf5MVhUPtBICjce4vO5K3eAMu?=
 =?iso-8859-1?Q?qotlbC7tWAcDtT4mNLaXJAdMWudI7zA3oU9L/2j5HEIlo8j1M2zKqJPSE7?=
 =?iso-8859-1?Q?dGKxcLQUxEFEbeL86qKkxnma1BoqIktguTCZuPUooer/EJt+z1W6GpS94U?=
 =?iso-8859-1?Q?KW2V2Kpdu8slwFeUNq+9NeW1K9vapH3N/paUmNsoKPGFDWTl0RmwS5L1CT?=
 =?iso-8859-1?Q?9Pyu2pObS2xJ3+9SWJWVPSIFmjrfLarj0VEktr+uVZiIbFkOLRG+iSLsxk?=
 =?iso-8859-1?Q?G3fs3YJExrN505ZcN3glE9GKNWRDghCz+V14KoWGV76ZEb07i4ea1Pm9yT?=
 =?iso-8859-1?Q?3znftkgMCeZCPOY/9gZaUQO8/E4lFbvKnlZ9oHisr63W619hu1GLAGKare?=
 =?iso-8859-1?Q?2fNPssPb9xmrSmbWjQ9MBR1kAH9FBk+3JeJmPpOrbmH+WWwsMbKyqnkjkO?=
 =?iso-8859-1?Q?VmQBthQpUWiuHDODxRZ+OPm+mP+WL+6UbvcwKY2Dw2wWM137QFf1GP+8qo?=
 =?iso-8859-1?Q?mZ9TkTyM1+xxGmAJYK/6+LY1vhkzgHTWu+qbXdogwn3jJyly17qlOuiSKc?=
 =?iso-8859-1?Q?FNMO0DXyZQt88mIOWptTTqUGmtADvtG0BndNalEB9BAUHyt10f71S/k3MX?=
 =?iso-8859-1?Q?1gWpfTTc81iwUqDldrroWJGRdVYhcRAkpD+XDOz2+amkdd5x506Nl5QpYj?=
 =?iso-8859-1?Q?v2OEG5SnyGhorElUSMnMS0TCTU967959VM9n3dUQV44oYc7JlSYaP/+eRo?=
 =?iso-8859-1?Q?dNwMJKIADfBF3XApgF9b/prJfffpV+EpSvcWGsqLF/3ZV2Q+x7ZBPwFM2q?=
 =?iso-8859-1?Q?tF+URIvpUNjyVcpqddZaAHnq6yx1tIytVTxPgVRsHZjd6TYQVzndZSiXce?=
 =?iso-8859-1?Q?SRF3TqfjvvMlDW+LJ88YlGyHaTHYf6TwLHdZw1fNvxAlU/vWJtocmybgpx?=
 =?iso-8859-1?Q?3wgw/omBrPEIqen8AChxd3JqoMKgBhBp2xYSH8w8GPNfJilUEO0Mre5jV0?=
 =?iso-8859-1?Q?1zZfgnpzrLq1F+jwN2y98UA7+SHdswGu8d11kQE0cKyHz1o+GheSqUV+oA?=
 =?iso-8859-1?Q?6xaOLbROvViW8XY8YHa0j/slgMDFi8XkWlpURyRklewCJ2giNsR52O9qDF?=
 =?iso-8859-1?Q?UTG0WVt6iWYSWhn09gCYFVQP/FMNeUiJvKZ/eYQG0N/SAKWo6Y/zK2l43T?=
 =?iso-8859-1?Q?gJ/f/BPYwe37ySlJq/39k4Pa19l6vN8N1S+9M0mAjTRN6RZH4bu6w4VJZ8?=
 =?iso-8859-1?Q?e9YC5GKzYNJO1Yp+mymwtMTOH0ZyDn05GlpFjF1LsTgBTiTuxJRtwURVNi?=
 =?iso-8859-1?Q?okfcdfQWgR1UaGcrDGNHvUV5bMNY2UCVEPY3bkdwkFX5x/0aRJqVD405/J?=
 =?iso-8859-1?Q?EWqwbSD1S91d1HY11ap0ySA4B/aynOvV4LuMn2JDMYBbk+UsiQoQhRxWEi?=
 =?iso-8859-1?Q?spMS3DYGo3ICbJ3DEwFSE0f1vecNfPhgEdhcDVnQ2Q4zsCQkVvfLI2JwVM?=
 =?iso-8859-1?Q?HWrJw0oDJfBY51zPvYppwJT03BUJ0owH7qD8stu5SCF0Wn2FBQgPuc0smG?=
 =?iso-8859-1?Q?6ju0h6dELi1L9WdWL+AV/4jl/qmxT6nvTdql8uzo7cjFcvHy0Ets4Mdw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07b11f9c-0214-4ed0-f785-08ddd04541c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 15:16:43.1078
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eQKTsNQrvuNHJ/o8hbTQYTSF86XnZJQbCq8DWgaZ2Uxi5orA10R02anOoWn6uiFiJnXT778vLRRwsJdNQswgL+vBxJlse/VZ5x95DTAB9To=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6803

MISRA Rule 13.1: Initializer lists shall not contain persistent side
effects.

The violations occur because both the `GVA_INFO` and `TRACE_TIME` macro
expansions include expressions with persistent side effects introduced
via inline assembly.

In the case of `GVA_INFO`, the issue stems from the initializer list
containing a direct call to `current`, which evaluates to
`this_cpu(curr_vcpu)` and involves persistent side effects via the
`asm` statement. To resolve this, the side-effect-producing expression
is computed in a separate statement prior to the macro initialization:

    struct vcpu *current_vcpu =3D current;

The computed value is passed into the `GVA_INFO(current_vcpu)` macro,
ensuring that the initializer is clean and free of such side effects.

Similarly, the `TRACE_TIME` macro violates this rule when accessing
expressions like `current->vcpu_id` and `current->domain->domain_id`,
which also depend on `current` and inline assembly. To fix this, the
value of `current` is assigned to a temporary variable:

    struct vcpu *v =3D current;

This temporary variable is then used to access `domain_id` and `vcpu_id`.
This ensures that the arguments passed to the `TRACE_TIME` macro are
simple expressions free of persistent side effects.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/1959339335
---
 xen/arch/arm/guestcopy.c | 12 ++++++++----
 xen/common/sched/core.c  | 11 ++++++-----
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/guestcopy.c b/xen/arch/arm/guestcopy.c
index 497e785ec4..f483908510 100644
--- a/xen/arch/arm/guestcopy.c
+++ b/xen/arch/arm/guestcopy.c
@@ -109,27 +109,31 @@ static unsigned long copy_guest(void *buf, uint64_t a=
ddr, unsigned int len,
=20
 unsigned long raw_copy_to_guest(void *to, const void *from, unsigned int l=
en)
 {
+    struct vcpu *current_vcpu =3D current;
     return copy_guest((void *)from, (vaddr_t)to, len,
-                      GVA_INFO(current), COPY_to_guest | COPY_linear);
+                      GVA_INFO(current_vcpu), COPY_to_guest | COPY_linear)=
;
 }
=20
 unsigned long raw_copy_to_guest_flush_dcache(void *to, const void *from,
                                              unsigned int len)
 {
-    return copy_guest((void *)from, (vaddr_t)to, len, GVA_INFO(current),
+    struct vcpu *current_vcpu =3D current;
+    return copy_guest((void *)from, (vaddr_t)to, len, GVA_INFO(current_vcp=
u),
                       COPY_to_guest | COPY_flush_dcache | COPY_linear);
 }
=20
 unsigned long raw_clear_guest(void *to, unsigned int len)
 {
-    return copy_guest(NULL, (vaddr_t)to, len, GVA_INFO(current),
+    struct vcpu *current_vcpu =3D current;
+    return copy_guest(NULL, (vaddr_t)to, len, GVA_INFO(current_vcpu),
                       COPY_to_guest | COPY_linear);
 }
=20
 unsigned long raw_copy_from_guest(void *to, const void __user *from,
                                   unsigned int len)
 {
-    return copy_guest(to, (vaddr_t)from, len, GVA_INFO(current),
+    struct vcpu *current_vcpu =3D current;
+    return copy_guest(to, (vaddr_t)from, len, GVA_INFO(current_vcpu),
                       COPY_from_guest | COPY_linear);
 }
=20
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 4c77ea4b8d..a2c53dca14 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1514,7 +1514,7 @@ static long do_poll(const struct sched_poll *sched_po=
ll)
 /* Voluntarily yield the processor for this allocation. */
 long vcpu_yield(void)
 {
-    struct vcpu * v=3Dcurrent;
+    struct vcpu *v =3D current;
     spinlock_t *lock;
=20
     rcu_read_lock(&sched_res_rculock);
@@ -1527,7 +1527,7 @@ long vcpu_yield(void)
=20
     SCHED_STAT_CRANK(vcpu_yield);
=20
-    TRACE_TIME(TRC_SCHED_YIELD, current->domain->domain_id, current->vcpu_=
id);
+    TRACE_TIME(TRC_SCHED_YIELD, v->domain->domain_id, v->vcpu_id);
     raise_softirq(SCHEDULE_SOFTIRQ);
     return 0;
 }
@@ -1899,6 +1899,7 @@ typedef long ret_t;
 ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     ret_t ret =3D 0;
+    struct vcpu *v =3D current;
=20
     switch ( cmd )
     {
@@ -1922,8 +1923,8 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(voi=
d) arg)
         if ( copy_from_guest(&sched_shutdown, arg, 1) )
             break;
=20
-        TRACE_TIME(TRC_SCHED_SHUTDOWN, current->domain->domain_id,
-                   current->vcpu_id, sched_shutdown.reason);
+        TRACE_TIME(TRC_SCHED_SHUTDOWN, v->domain->domain_id,
+                   v->vcpu_id, sched_shutdown.reason);
         ret =3D domain_shutdown(current->domain, (u8)sched_shutdown.reason=
);
=20
         break;
@@ -1938,7 +1939,7 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(voi=
d) arg)
         if ( copy_from_guest(&sched_shutdown, arg, 1) )
             break;
=20
-        TRACE_TIME(TRC_SCHED_SHUTDOWN_CODE, d->domain_id, current->vcpu_id=
,
+        TRACE_TIME(TRC_SCHED_SHUTDOWN_CODE, d->domain_id, v->vcpu_id,
                    sched_shutdown.reason);
=20
         spin_lock(&d->shutdown_lock);
--=20
2.43.0

