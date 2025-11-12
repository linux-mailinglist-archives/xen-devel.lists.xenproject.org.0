Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5281AC51C70
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 11:52:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159703.1488081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ8SG-0000BA-3k; Wed, 12 Nov 2025 10:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159703.1488081; Wed, 12 Nov 2025 10:52:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ8SF-00005Z-Mm; Wed, 12 Nov 2025 10:51:59 +0000
Received: by outflank-mailman (input) for mailman id 1159703;
 Wed, 12 Nov 2025 10:51:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ulhw=5U=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vJ8SD-0006fP-V0
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 10:51:57 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a3a9c2e-bfb5-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 11:51:54 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAWPR03MB9786.eurprd03.prod.outlook.com
 (2603:10a6:102:2e8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Wed, 12 Nov
 2025 10:51:49 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9298.015; Wed, 12 Nov 2025
 10:51:49 +0000
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
X-Inumbo-ID: 9a3a9c2e-bfb5-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZGa8XjVjnp2FzFUSBZ8QyJOOuBVhe0oD6NXEz9TrS0x+QEJ5ArGth4xhGfojKktN3PS+leW3dnAXbdsSvmWTZaSOiVh+L7wUQQiZDaPlILkZS311MyUGLkOP59QC0kQdQiAcBB24oCxMlbTaah7ivPTo07ixYG6vHIqOVK/e0BWm8hNshFwdSwg5c9g7FZuAvtr2pqA27JKeq5I83H5S7QW2S6nHmEnoDEqQAB09OP/Cnx8RzoYjDh9iicghk7o4Cz9OgYfRMk5tumV399DKUc3SVjkx4TATo3bMngqN9m6Ug5c4HNMtLTlkgwKYrgxRtdF41YDGvx+pV2ECsCIMYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8D5Acrs8dUv0P8H4kunal5LzEZVvHwHaF8eBKEKwHc=;
 b=gQZMiOibJzHMUO/AXruTFoClKBj68mMPD36LnS6Q3kZPwRnupYRqY9FSN2tG/p0A1/zSMtii+tXqnJpZtILfp7n2qgALnsDEdkGp0FT7HvUJwg3ckxswrDxC6MtFifL7ge5z+qhq5ermuMMvCQqJkYXeiR5EvJLZ9utVHO3Sv1kEaPKyeIT9fyJYxOGBJamBzPtgg44QPN/DNfbR0YQDL2/Mdu2TUCT+ruiNPcAyzg9K7ixE0h9quvVlgJRMnkd89mwRXuOqiNkoa/k0Giy/Nim7p0q0p5+B0fobWSZf2L2zxzPCxGm5SqYZ+MSXFniIw6VyJoAjJt6PXstLgOwTPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8D5Acrs8dUv0P8H4kunal5LzEZVvHwHaF8eBKEKwHc=;
 b=qTo0Rf3NUUr96anJg+MHAjV26kmocfECRoq050iSbfS4bsdZyhZBi2fIL22ytAisUoZ2/+AfaXtoBwraZrLX8PMGmMXwchF1HLMeK0Kd7wdhPeqDx8dQBdqPcM4UY3XNA91LfU2fSR4nnyQN7ZW9srjjQuD9mgLnYW5zXWtvcjkv72uV/oJX3sosjMHss5jW4wSUptnErzBh90K4DgyBQ4l7CLw3w2bU28ZGYbtLehyt82kxInn41EzsHEAX902AOXDkf/dpH466wTqSVJdE+8I1HtV9LStWezZIdTQFlOUmud3OL6x1qlcWLj9E6oDBpTdMhEeSM4Wb5rpom0httQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 8/8] docs: Document CPU hotplug
Thread-Topic: [PATCH v4 8/8] docs: Document CPU hotplug
Thread-Index: AQHcU8JZkVRIhtuRGUSqQZ7RQo1TrQ==
Date: Wed, 12 Nov 2025 10:51:49 +0000
Message-ID:
 <48bafdb8e6269a3d958065c6a1062ce2736632a0.1762939773.git.mykyta_poturai@epam.com>
References: <cover.1762939773.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1762939773.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAWPR03MB9786:EE_
x-ms-office365-filtering-correlation-id: 6f16fa93-8259-49b6-2fc4-08de21d97b90
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?SDxfglLU2fuSoGQDU8fjKysBSgxbPf+cw4OP8SG9EOggT2qnozc0jQkEMM?=
 =?iso-8859-1?Q?nfpQJdEgDRUaqAO+GpzDwP8Mg+8bXEpY+xjeac4FNHSPoTNOehEoi6HmY0?=
 =?iso-8859-1?Q?X0Y650Me9rpnkcXuvyn70T+Jru2hccNXvHHZBVXdwUrBylzl7toEbPhM0L?=
 =?iso-8859-1?Q?xCEKvJjWB0K6IWkEYWkDOV1tvZQoh/d+DZL/B+8Ragren4tCRANPwM30hn?=
 =?iso-8859-1?Q?rISfVff3grMl10+S7RWHU23qr/d5zzfD6rpze1ulBI00+VWq9dJ5SUeMh/?=
 =?iso-8859-1?Q?i1sX8ovKJUxfeWNQmmU8WqcY0xsLQLNouhyFUd2/QB2+wZZI37RqA9PHgf?=
 =?iso-8859-1?Q?OgZvvUEEExu9RxgHkKOqsASPClsbZJ9O+WU0tmThhTvjWAiLa+gkoyg9xs?=
 =?iso-8859-1?Q?8+tKjpg/Q7SMDBHSgetEVAyewdi0E9AbRK4Aonjsoe3fvkmswzQ0vZKLfD?=
 =?iso-8859-1?Q?17SF6+eoq1uz2DxlnBlLGcrHfIVUjYJ487EY3SQJ1fRfmuCUvR3wPC0VHM?=
 =?iso-8859-1?Q?ft9HNglr0MzumkwIbV4J1e0MM8GbMfoeOPdxFfn+FDqODx32/WEgXW5+pk?=
 =?iso-8859-1?Q?1VDzuTuwJosmgCUKCry422eRwAZiK/Og2UK8Mb5v8TEEObZ0WkZVTe/I0K?=
 =?iso-8859-1?Q?eblsTmdpLzDbKiB/pSLwsi5p+jEeZreII4gIkj8/+3+BCZGa5CgAL4HXv0?=
 =?iso-8859-1?Q?lIUBQ7qMTPUKQROy5oXlMTFaGxMRGYy0sfwzqVHh5eiru2vFQQJXJYzeNu?=
 =?iso-8859-1?Q?lMyiYDkCHzlMI0pzPZNztpuVCF1hu5FoZUBFbBkrPBgfhfKnyeRcqKYrOY?=
 =?iso-8859-1?Q?R1n8odpYAZwhTJDKyPD6mpzQbSeZujMdPVTXgM9CfeEUYEA2lgIeOellhf?=
 =?iso-8859-1?Q?fED14Z/TLnzLrSHycCQCONna+eotAhIAXBoFmOG1/slE0CGiIz8shJe5PX?=
 =?iso-8859-1?Q?lh2d+rNbmVP9o7GSuTYaxRq63Xc8wTwRNhFVzIwFRnuIOurg3zPCXufAC5?=
 =?iso-8859-1?Q?FLPASQp3yylzjJXwm97guXalT9DyXMG7uiIMM0Q5QpO63x5uPtPXYGsyZx?=
 =?iso-8859-1?Q?eIgh9xRJYC1gfE3APWcaTR3+nu2DXK88upTRb+XpFCtF25JlKlrcFc6qpP?=
 =?iso-8859-1?Q?PoJP9Ao5eL5uE9mYJWJjGRMgKSl04ECv5LSFQafxYkZM/YustI3TvI89qu?=
 =?iso-8859-1?Q?5cnEVjrm5vrVik/XfEx1ZxLAkF1769fPuZ3l3j0SBH7k3bv4VbIEB7Wwv0?=
 =?iso-8859-1?Q?EIR9uhKeigFDRqjrVy5djPCAF9QJ78uhgVYhspsYMB1gRAftU+wAgmr6es?=
 =?iso-8859-1?Q?2uwAPkyGiPv25PkKNxxlX71DVAz5WkhLSlgqn7WHX8WAjRoV6a2gqLrvP3?=
 =?iso-8859-1?Q?5C33FUWLW/uj1fdYO1cXYCVCkB5/8nCC0aUZGDzE5YPA+LdGTXyfs5i0uA?=
 =?iso-8859-1?Q?w9UzkoyIzW53+xU2HrzgKLDZx64eCa12qRfhMRYQH8panbRfnervQ57bmG?=
 =?iso-8859-1?Q?upuOw3LoGRNcdCYL0ZEbye0yAPB/I9BNOruznZ83xDUNuEhX0pGByb3eHJ?=
 =?iso-8859-1?Q?L/ys1kGg8+XfgYcDHJDqhL4yFXat?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?8vqfqVDchHU6QjU2r88oyiNaQdhu1z99y205f/nXFGV8OMC1MimmWqixCi?=
 =?iso-8859-1?Q?Fb8LMm7eA2oMH+K5mNLHYwVghLpk3zLlmnOc54cebmB8R6IbAPp9k+P5ik?=
 =?iso-8859-1?Q?C5s7kFgKK+mG7y2H8z40T5Pjtv4Iy6qWkMI0sstwzycMWh6jfGHHGPGMXo?=
 =?iso-8859-1?Q?cUm1RHVnJxDEgLXA2ofoG6UEJ/Tue9Q7HIIMTflRzY67E2NlSuXDyKVR/3?=
 =?iso-8859-1?Q?eafth1Fv2JzdLsFY3v4nONiQLbtk3cl6fapGoXJw7cQDs8LF/OSaOhkxlk?=
 =?iso-8859-1?Q?48j2+3z0fqXZeD78F7ifWryBRAukWZJ4igIdte+NuTTGkMrn6gOVRKzdnk?=
 =?iso-8859-1?Q?Jm4HkMwn0LKFol9ZePqeXpXoQ7M7BuopDMCGvVsJp1oarATWSToSvTi9OP?=
 =?iso-8859-1?Q?xBcYGQddJjHHcf/atrhMlBAcpC5I+fPrc8u4xrJUj9SRitavIRoIZwu2wb?=
 =?iso-8859-1?Q?sFhvDRTqQdq1vGngjTkcZvqylfbF9g0qeAyoIFKcOj7mFIw89Zd6IUol1I?=
 =?iso-8859-1?Q?6z4chqArGAnT6tF8F0uXWK6U/gq4vQXTyVQlhThNWrCr4ujBU5BKgZv0JG?=
 =?iso-8859-1?Q?M/C4GB2YFqW5f/eCN3cRdVEUgEYroAoyNtPyFCVfJUqbkp1HL7lE40c/P7?=
 =?iso-8859-1?Q?POSxsbJmqSHO67pr5rvMYI/z3A4a86N3yuLTNf2Q6cdJ0ILhGN7wNgkryC?=
 =?iso-8859-1?Q?jCBD2OS/fpRtwDgzzz9GbgCFzS/0nBAoLKjArnXGmJ8Sl9JIJgqFZonDzK?=
 =?iso-8859-1?Q?5hrSJ5pseG7IqdujVER5RMAYfbX2T2PLT4MNNmMExDC0K6vACCLVjz0Y+4?=
 =?iso-8859-1?Q?BY1GVqanezmGZh2gPoLt9k9cHJp1+uH21pFb8AJDy7JlkiPQef09gajXM0?=
 =?iso-8859-1?Q?IdR8wmDsxFU/RZJz+CfEx39HgcrwaRYEzSKU/c1f3u2ONGR/gHpGM9LvfY?=
 =?iso-8859-1?Q?lIkZ018ciyjxmdyvg49fTm45KuQVCahPiJ0vbNFLzhwEVp/NX5VoR8yEWN?=
 =?iso-8859-1?Q?p4Ptt0rLn5a8RUmwR+m34myT/5XXMH1XI+fiR4eGKjLlVn8W2rZwXQj8am?=
 =?iso-8859-1?Q?JF7mLnzwZz8m5joMn64YIDPqmYWGkVRxH29Pl2pzN0sFRZOR379vdvheFJ?=
 =?iso-8859-1?Q?IkC5D3w2T+igu71fRXXqHvZPqEMy7AFFkt6WdvisFZe/wwuHjBhQhDeAN3?=
 =?iso-8859-1?Q?SjcCsmOfhrq2aJe9OxZ7xFoMg/gqtF5F1+GEYEYNro3B2dtBhkukSY+Ncq?=
 =?iso-8859-1?Q?gIp/DC8hg4so+LlQNhLjmQOiXpoLZujzWcVb7iLo42bApEs9cRYwmHGJgM?=
 =?iso-8859-1?Q?zqSusZVcJtjL6sne1zH2e3q9xinS01VfwvyfhMq4fQ1PqKlWDHPpSxMtHs?=
 =?iso-8859-1?Q?xbow3F+PJOr4hjvcDNO3m26ZNHvjaceFiMhCN5o5RTxeutIpK23lWkjurK?=
 =?iso-8859-1?Q?ARWb9//+J+JZphHmATsSsrR2PlEqlzJ1M1ZWPGaD3GvGNxjHFjjLq71e1e?=
 =?iso-8859-1?Q?g42Mj4RQKXJESeEnR6kwmOWixxqcmTX8ddj3c05FCCo3r2s5LC7+XG+gSU?=
 =?iso-8859-1?Q?jSiUYOfccITzgxhtau/oYmQDoLN0LVkqwlwf9DzI+L+p3m2d0uI7sBgJws?=
 =?iso-8859-1?Q?5SRhDNs8oMvrDaAuvZN/kl0oGi/L1ixvTwyoO2D7nTB/exISvyQ/oNGg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f16fa93-8259-49b6-2fc4-08de21d97b90
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 10:51:49.7721
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /fpYk6gqwWV6R89SzekAz0RqQ0lgjg4Lnz+h0uR89c1s3K7+VZebhgtjhKCC/RzGUHwmMDlWo/ALvv0Hq0GUGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9786

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

v3->v4:
* update configuration section

v2->v3:
* patch introduced
---
 docs/misc/cpu-hotplug.txt | 51 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 docs/misc/cpu-hotplug.txt

diff --git a/docs/misc/cpu-hotplug.txt b/docs/misc/cpu-hotplug.txt
new file mode 100644
index 0000000000..1fbad0ecf7
--- /dev/null
+++ b/docs/misc/cpu-hotplug.txt
@@ -0,0 +1,51 @@
+CPU Hotplug
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+CPU hotplug is a feature that allows pCPU cores to be added to or removed =
from a
+running system without requiring a reboot. It is supported on x86 and Arm6=
4
+architectures.
+
+Implementation Details
+----------------------
+
+CPU hotplug is implemented through the `XEN_SYSCTL_CPU_HOTPLUG_*` sysctl c=
alls.
+The specific calls are:
+
+- `XEN_SYSCTL_CPU_HOTPLUG_ONLINE`: Brings a pCPU online
+- `XEN_SYSCTL_CPU_HOTPLUG_OFFLINE`: Takes a pCPU offline
+- `XEN_SYSCTL_CPU_HOTPLUG_SMT_ENABLE`: Enables SMT threads (x86 only)
+- `XEN_SYSCTL_CPU_HOTPLUG_SMT_DISABLE`: Disables SMT threads (x86 only)
+
+All cores can be disabled, assuming hardware support, except for core 0. S=
ysctl
+calls are routed to core 0 before doing any actual up/down operations on o=
ther
+cores.
+
+Configuration
+-------------
+
+Sysctl handlers are enabled unconditionally on x86 architecture. On Arm64,
+handlers are enabled by default when ITS, FFA, and TEE configs are disable=
d.
+Building of the userspace tool "hptool" is controlled by the "hptool" flag=
 in
+the configure script. It is enabled by default and can be disabled with
+--disable-hptool command line option.
+
+Usage
+-----
+
+Disable core:
+
+$ xen-hptool cpu-offline 2
+Prepare to offline CPU 2
+(XEN) Removing cpu 2 from runqueue 0
+CPU 2 offlined successfully
+
+Enable core:
+
+$ xen-hptool cpu-online 2
+Prepare to online CPU 2
+(XEN) Bringing up CPU2
+(XEN) GICv3: CPU2: Found redistributor in region 0 @00000a004005c000
+(XEN) CPU2: Guest atomics will try 1 times before pausing the domain
+(XEN) CPU 2 booted.
+(XEN) Adding cpu 2 to runqueue 0
+CPU 2 onlined successfully
--=20
2.51.2

