Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8BFC40841
	for <lists+xen-devel@lfdr.de>; Fri, 07 Nov 2025 16:05:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157666.1486391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHO1U-0008GN-I2; Fri, 07 Nov 2025 15:05:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157666.1486391; Fri, 07 Nov 2025 15:05:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHO1U-0008EO-E7; Fri, 07 Nov 2025 15:05:08 +0000
Received: by outflank-mailman (input) for mailman id 1157666;
 Fri, 07 Nov 2025 15:05:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qRNH=5P=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vHO1R-0007Wa-UM
 for xen-devel@lists.xenproject.org; Fri, 07 Nov 2025 15:05:06 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 238f2d42-bbeb-11f0-9d17-b5c5bf9af7f9;
 Fri, 07 Nov 2025 16:05:03 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AM9PR03MB7605.eurprd03.prod.outlook.com (2603:10a6:20b:419::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 15:05:01 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 15:05:01 +0000
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
X-Inumbo-ID: 238f2d42-bbeb-11f0-9d17-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zP2ELMR329gCGgI9wMOaFXtotby9FgtsYzAT14L+Fm3MNwJ4kx5jmqgoXszZjXyYw+b35gabecf9FiKYkyRPo4aP2n8+R3FJ0Ard4D+FuvBePb26huKby73/Xu771t2I6YRrtH+OxhZfKFJBFE0r2hru6z4uPD9QSGdTp1Z5u13yYJBMufuGRt5Dscog2wZcmSH9gqYLSP5e9AZAEIP+ZP5wQGu+iFzRMejp7WIqOCMJvT5j8N8FTxhwz0c4KV8kIvlQcKUk3FDAe2M+FDwVGE7TJMqHGUzTRwqpabOWLlsFUE32y1qqoPtZMBaP35mz/jOfORUy36bTq3iem9xGkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jgSg04VTwELxGBtpkailCzDMtsJ8p2BN93jiaDfig1c=;
 b=s1pe0qGsl61SKJII9UI9+ECWJKvH3BejBHLKIFZvxsSK+MArYW0Q3hMT+4qhVcolwdNksxsaek4AZe7zKcuFo9PoqRUUw5L9U//rNWt95gp+M/3HKvFzrW2ctAiWBbFmiU//Guja6Z7IKTNSwUIFBXHRwvvNtOdeTtXkX/gdiYgIbLyQpRW6n0h5ehxUtch78qq8+tUqGD8/06J9gkJtNFsS6qDMol7SIw4etG+/HNIKFnyFkuX8Ij/+M718Q8XX81CrXrP3Ml+MDTIKYJyd6hVPc7EQG4LfKDIBOhp9z442h4U7Wltkp/nxxlLuyYhMLnXkCk8nsYoHpHjXQ+ANnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jgSg04VTwELxGBtpkailCzDMtsJ8p2BN93jiaDfig1c=;
 b=I7djVyUos2vyi+uVB2CNaj6TUtfHEPbYwB8lgzjuzNxIknGXFy8czJqBZEXFbpr3qI3jY6682nglPulynzlI52TlwqSVXlcxlUSD7kneyuJ0TwiKX0IHrqWR3NYm8ynagkWMOOE+KPbIbG+zooO2ctW/Nlco+5k01mwOaafg+3QsNhk/lRXWJdqOLebg6KW/9R+jFXUs1CmhW5yZDgOMh2nU53UhgKlHmcSq5/3slEmKZsvoD40DvyrOndc0aRWT3LhcyoVlk3wr8kbF7ZHBfFfSYMCYXfu5BcHgqkD4M6XhxKn7rUbq+KUQZ7E8bHyjGPcSax6a2iyWf7mn9GEnaA==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Tim Deegan
	<tim@xen.org>, Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie
	<teddy.astie@vates.tech>
Subject: [XEN][PATCH v2 3/3] x86/hvm: vmx: refactor cache disable mode data
Thread-Topic: [XEN][PATCH v2 3/3] x86/hvm: vmx: refactor cache disable mode
 data
Thread-Index: AQHcT/fjyqxpZv5UYEyu+2eXf1BscA==
Date: Fri, 7 Nov 2025 15:05:01 +0000
Message-ID: <20251107150456.2965906-4-grygorii_strashko@epam.com>
References: <20251107150456.2965906-1-grygorii_strashko@epam.com>
In-Reply-To: <20251107150456.2965906-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|AM9PR03MB7605:EE_
x-ms-office365-filtering-correlation-id: 65eba2bf-3ba1-41c5-3649-08de1e0f065c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?tKR8MNU+GmIzg/b9r7CL9rWLipJ0qgFCf0WvoWSPF/GYAbYna5JEuFXa5c?=
 =?iso-8859-1?Q?pp1KvTaVacsPailDIvr+jp81h4eUMli1hUQErQu4v5zUGY6JHGPfNueXrU?=
 =?iso-8859-1?Q?LNUAMa6DmNsha6azzD+5pAujUvcKT8UF0SWrkg92lqQdIo/ns1EeRen0la?=
 =?iso-8859-1?Q?qEcBzGx1avXFtDTKw3CdMEPl9tLy961P8DGlGJsL1zFrRzZu0+cdOfd5LA?=
 =?iso-8859-1?Q?8gIytuMcDNqJKzZ5L3EGoenvmFD5jSVQdLm8A/xUO6s/CW2b5t1IFhLjFb?=
 =?iso-8859-1?Q?FyYHAZXasKKaCxgVo+P9BwBzRSkwGLsFfHmTtGhSuLPhKu1a4kXvW5xom0?=
 =?iso-8859-1?Q?6DN1GsZ6QIFxiipVbAYldbAswBpphNJAdZbJwbioObC5oYoVPWPfyhDbWt?=
 =?iso-8859-1?Q?hs5vgT29tIwrtP1WMdITVATesib4kRMqfgP0BJBsdkY4g0WaEEdG3u5TPf?=
 =?iso-8859-1?Q?5qQMpbAHdVyWyQock7v8aT99Sxp6NqS0IHsYR/npwt1XIz8WohhcqJMxrk?=
 =?iso-8859-1?Q?OCULOKywv+fAWSRhEzltUFcCb6iVahuyZeWaLucpyxu1856sgrfuj6R2B3?=
 =?iso-8859-1?Q?QfOjxK7n47wZcCNQvGmUDySk1L0F6T45h8bWC328tSTxgNbiw6wBosxHcw?=
 =?iso-8859-1?Q?v1aB4kox6VvPUMn9Hg6UpXj5EMxjEZbmy8/Bp9ORo0OHrq5M7pah/9deeC?=
 =?iso-8859-1?Q?jEK1CTRUZfzZX/aVJ3WGnN4SOOOqFQYqaZYNuISo5ZPtL1aMqF7gFdCRQr?=
 =?iso-8859-1?Q?wenQkPn86knb+Gqjhn96K6LcOeWsFiJ4rsvw06sjMom04PrUk6fvY0dVQP?=
 =?iso-8859-1?Q?wcKFvGon2/IuIk/wNSz0Y6EgtOJupfDyVpzetn8z9kIVrbJacyxqCKyjmN?=
 =?iso-8859-1?Q?uktgv0+DbYUkbZAgRrnrDPAx6kqtTdyu16exTSQQeB8kqiU0BdweZeg8Xs?=
 =?iso-8859-1?Q?M2/w9kfaBkF1tX49iqOFhdG2c6O1W2h3g29X2gVVUCbd9o6EnLQ7ATXXF2?=
 =?iso-8859-1?Q?tb0xCAQMTiU/HYTdrFxp3N5aA8y/ipr+yu6hzh3I80mnUZudp5i+/e8opZ?=
 =?iso-8859-1?Q?T0jB22lb8Lnr3tEB79LT/SN5jiIBGires/Chg368yNYuNXfmy/ZE/fFHcL?=
 =?iso-8859-1?Q?dJgZYevu9qTnX1Ezs6KKQYQ9KRajNc+WmbY3nPwJpE5vRIjtDE2UgtT8iG?=
 =?iso-8859-1?Q?xmHn8hjXjwF9TOzKeEMdLz4HAudfXdbFyrdk4jp14XN3Rw6I43DjeX11xb?=
 =?iso-8859-1?Q?K/fBdEm5cbZqKKCBxLP19dCq2keR4RXESyOiL+kDFcZ95uUEv5Wf7k5ilh?=
 =?iso-8859-1?Q?XFEplF80ze0DcCgBzw+3Mi780G+dHWYrV0xm+F9n+aWg/7HMTW7IU2V0w2?=
 =?iso-8859-1?Q?3HWFRjG1SW1kZHjBvshNF9YT3nj0KkNb19JdM5ZZgMzByVC+qmIJ+hdvMk?=
 =?iso-8859-1?Q?uZBkPIZhs46u3I+2D1uQKY+3+cdMNTodc+oRYPeF23B4j2sNCBjscKLhLc?=
 =?iso-8859-1?Q?DNy7bQUJJJAg6Jb+DHN47dvtRsklcL9FhT5rHDjSHPvXqCU1k8KO4QVVVf?=
 =?iso-8859-1?Q?tjQXujx3XTMjO6wnlJUIwRwXNkf6?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?thv7xRbkl1rb333ajwXCR6FAt9AVU8vjB5EleMYhHhFnEjEy3vEOLjfNEX?=
 =?iso-8859-1?Q?4w8QunFVmIlfPfHSveWKSVXspIsOXOsfoKY3A0uC2k2sh8S0nBFWNeeJaI?=
 =?iso-8859-1?Q?IpLhmDeprxyhWNuRrmTRxsgQgRSx5nCspZUbOlNX+MaUV1fZtE3My5cq0S?=
 =?iso-8859-1?Q?W0WZ/FbVUvQJyaCAct4aZA72i6bFvsefI9bRHEoCS70kcE7EnTpI4XjEta?=
 =?iso-8859-1?Q?4R+36LOMWq23LtHr7xvwHEcQGHkrcOCuUrvAJRKU4Y6DbU+dHCAHCrHbyi?=
 =?iso-8859-1?Q?sl9/YFEen6KOE7efzf+V1X4t6UIJXWjJxWs+RULxGivhAlGR+Dt9LH1ceA?=
 =?iso-8859-1?Q?usc/NyHIElC55Yd/p9JodLAh+ggdMZxtlrGMEtQdC4P5duDp5B6PHBUIGJ?=
 =?iso-8859-1?Q?Ti9V3a1vVJSFPRRskv9hqHXn0L5SK19nmqOESHEPneovGwc3Unt+uzSlaH?=
 =?iso-8859-1?Q?Gazckb6bv7L4cRY7Vpx+ChoHvB84Et57Z+QW2tWy1Z2cU7Gu+w86HN67ak?=
 =?iso-8859-1?Q?2kp8JKVt3H0hTchJbaNFJfO5SjR0vg8Tluax7YYwg4LG2VaaaH2vYMCU+C?=
 =?iso-8859-1?Q?nYxEMy7TL4IjAHPuKy8I6S9ZLrZRu4jWfeyJXV+lUMgGOxqg06HXgK4fh4?=
 =?iso-8859-1?Q?6+L40Fcs1HuaTQ5Q6G/Agbr9ehq1KBfXT5/WCUvwOeVK/RXiq7psQImNqo?=
 =?iso-8859-1?Q?PwquaCDMs4hwwC6VOCvHWmYmt+j3+DM/lX4DzmThgoDZ0Wfle5Pu0L3Vtb?=
 =?iso-8859-1?Q?NmND1g/F//p/fTVYPrTGCrVYAOdpiqifHuUaTzVx8ZWVB0X5N6gd9948fx?=
 =?iso-8859-1?Q?buXJg0dBn8IGQcM35iDZ3zbTUCyvBP1BUFEi3HCm4tCqvuD5yizzcybyLU?=
 =?iso-8859-1?Q?ESQxH2uF+l7LI+Y7CaWD1jRuIlVDnLLlqe7sY0i1TKYPMJEzJq+KiGdnLp?=
 =?iso-8859-1?Q?br6l1PZFFM6VLXPK2SmZ/ttnBjBTSPQPcCSSVVY4/tZIV6Bu393RKHZHAf?=
 =?iso-8859-1?Q?ZfZOvslEW6JseJx8pKm9se45rjNJ2fMxW+AdXOny+hPBGJu3dw7bAjFtb8?=
 =?iso-8859-1?Q?v8Nm/ht2HNEmn1Fee/IAqQ/GKIZNxAMvQ8pimJfPzzvnXHlDZlbbaO8nf6?=
 =?iso-8859-1?Q?a39QVvT1ri4+yoepQw1LKIO97P2FsH+z9S7AZXl0kt+mwiGkPM1EAbGStW?=
 =?iso-8859-1?Q?mLEJwybV06qjLEgU/yavh4gsHx+Fs32Gx8ztD3t+3tBIC8rP/O2it+ig76?=
 =?iso-8859-1?Q?yrrtjaM07piRyEAMwCnfzQo2bku+hxeWXJ3Z24Z1xvLSS6TuZs2XXggSuN?=
 =?iso-8859-1?Q?KZhtX5RWdNSpj15bFUjk+jZU62wbTn9Sp/qlCmYZ0epFTL9mma9pcwIYxy?=
 =?iso-8859-1?Q?7fqbxGsQLjm24/NCb8rGbMAQiLDR4hUnK2Q+PwCEtLuIMgLrACrdtRRykK?=
 =?iso-8859-1?Q?bp1eVMQcAKX7makvsUh6+B3pS5PonbvSkRURWB6SBHCwpNgUZvZc72lAsk?=
 =?iso-8859-1?Q?7R9FVVWMU/jQAIf7ODVti7xLP4TNRATEKLY+BR0BPLUVHJiCe+ERGk7lR1?=
 =?iso-8859-1?Q?7efcO7zSHoH1zX5QzdWGojm3Rn+CXDaKhD/nmSOu822U0L8E+0j21quERl?=
 =?iso-8859-1?Q?7v7EjF7NtioWKIpxCjiOha0mXanl9wYeMlgsQraUVLI2KGR+e+LDrv9Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65eba2bf-3ba1-41c5-3649-08de1e0f065c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 15:05:01.2991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5zOJILz+Uft6dk4Om4hBSUEUhOSF+9trmQnRLkJ0LLPxwccfH+qztW24ENbSnkuDnLdgw1foDeMWy2jJ3/3kEuWQS3oOO2pDNt3oSloIkzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7605

From: Grygorii Strashko <grygorii_strashko@epam.com>

The Cache Disable mode data is used only by VMX code, so move it from
common HVM structures into VMX specific structures:
- move "uc_lock", "is_in_uc_mode" fields from struct hvm_domain to struct
vmx_domain;
- move "cache_mode" field from struct hvm_vcpu to struct vmx_vcpu.

Hence, the "in_uc_mode" field is used directly in mm/shadow/multi.c
_sh_propagate(), introduce the hvm_is_in_uc_mode() macro to avoid direct
access to this field and account for INTEL_VMX configuration.

While here:
- rename "is_in_uc_mode" to "in_uc_mode"
- s/NORMAL_CACHE_MODE/CACHE_MODE_NORMAL
- s/NO_FILL_CACHE_MODE/CACHE_MODE_NO_FILL

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
changes in v2:
- s/is_in_uc_mode/in_uc_mode
- s/*_CACHE_MODE/CACHE_MODE_* and move them after "cache_mode"
- reorder uc_lock,in_uc_mode in struct vmx_domain
- move spin_lock_init()

 xen/arch/x86/hvm/hvm.c                  |  1 -
 xen/arch/x86/hvm/vmx/vmx.c              | 28 +++++++++++++------------
 xen/arch/x86/include/asm/hvm/domain.h   |  6 ------
 xen/arch/x86/include/asm/hvm/hvm.h      |  3 +++
 xen/arch/x86/include/asm/hvm/vcpu.h     |  3 ---
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h | 13 ++++++++++++
 xen/arch/x86/include/asm/mtrr.h         |  3 ---
 xen/arch/x86/mm/shadow/multi.c          |  2 +-
 8 files changed, 32 insertions(+), 27 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 9caca93e5f56..c09fb2ba6873 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -608,7 +608,6 @@ int hvm_domain_initialise(struct domain *d,
     }
=20
     spin_lock_init(&d->arch.hvm.irq_lock);
-    spin_lock_init(&d->arch.hvm.uc_lock);
     spin_lock_init(&d->arch.hvm.write_map.lock);
     rwlock_init(&d->arch.hvm.mmcfg_lock);
     INIT_LIST_HEAD(&d->arch.hvm.write_map.list);
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 67861bc8bccf..12748298c10c 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -590,6 +590,8 @@ static int cf_check vmx_domain_initialise(struct domain=
 *d)
      */
     d->arch.hvm.vmx.exec_sp =3D is_hardware_domain(d) || opt_ept_exec_sp;
=20
+    spin_lock_init(&d->arch.hvm.vmx.uc_lock);
+
     if ( (rc =3D vmx_alloc_vlapic_mapping(d)) !=3D 0 )
         return rc;
=20
@@ -1431,7 +1433,7 @@ static void cf_check vmx_set_segment_register(
 static int cf_check vmx_set_guest_pat(struct vcpu *v, u64 gpat)
 {
     if ( !paging_mode_hap(v->domain) ||
-         unlikely(v->arch.hvm.cache_mode =3D=3D NO_FILL_CACHE_MODE) )
+         unlikely(v->arch.hvm.vmx.cache_mode =3D=3D CACHE_MODE_NO_FILL) )
         return 0;
=20
     vmx_vmcs_enter(v);
@@ -1443,7 +1445,7 @@ static int cf_check vmx_set_guest_pat(struct vcpu *v,=
 u64 gpat)
 static int cf_check vmx_get_guest_pat(struct vcpu *v, u64 *gpat)
 {
     if ( !paging_mode_hap(v->domain) ||
-         unlikely(v->arch.hvm.cache_mode =3D=3D NO_FILL_CACHE_MODE) )
+         unlikely(v->arch.hvm.vmx.cache_mode =3D=3D CACHE_MODE_NO_FILL) )
         return 0;
=20
     vmx_vmcs_enter(v);
@@ -1462,7 +1464,7 @@ static bool domain_exit_uc_mode(struct vcpu *v)
     {
         if ( (vs =3D=3D v) || !vs->is_initialised )
             continue;
-        if ( (vs->arch.hvm.cache_mode =3D=3D NO_FILL_CACHE_MODE) ||
+        if ( (vs->arch.hvm.vmx.cache_mode =3D=3D CACHE_MODE_NO_FILL) ||
              mtrr_pat_not_equal(vs, v) )
             return false;
     }
@@ -1472,7 +1474,7 @@ static bool domain_exit_uc_mode(struct vcpu *v)
=20
 static void hvm_set_uc_mode(struct domain *d, bool is_in_uc_mode)
 {
-    d->arch.hvm.is_in_uc_mode =3D is_in_uc_mode;
+    d->arch.hvm.vmx.in_uc_mode =3D is_in_uc_mode;
     shadow_blow_tables_per_domain(d);
 }
=20
@@ -1483,10 +1485,10 @@ static void hvm_shadow_handle_cd(struct vcpu *v, un=
signed long value)
     if ( value & X86_CR0_CD )
     {
         /* Entering no fill cache mode. */
-        spin_lock(&d->arch.hvm.uc_lock);
-        v->arch.hvm.cache_mode =3D NO_FILL_CACHE_MODE;
+        spin_lock(&d->arch.hvm.vmx.uc_lock);
+        v->arch.hvm.vmx.cache_mode =3D CACHE_MODE_NO_FILL;
=20
-        if ( !d->arch.hvm.is_in_uc_mode )
+        if ( !d->arch.hvm.vmx.in_uc_mode )
         {
             domain_pause_nosync(d);
=20
@@ -1499,16 +1501,16 @@ static void hvm_shadow_handle_cd(struct vcpu *v, un=
signed long value)
         spin_unlock(&d->arch.hvm.uc_lock);
     }
     else if ( !(value & X86_CR0_CD) &&
-              (v->arch.hvm.cache_mode =3D=3D NO_FILL_CACHE_MODE) )
+              (v->arch.hvm.vmx.cache_mode =3D=3D CACHE_MODE_NO_FILL) )
     {
         /* Exit from no fill cache mode. */
-        spin_lock(&d->arch.hvm.uc_lock);
-        v->arch.hvm.cache_mode =3D NORMAL_CACHE_MODE;
+        spin_lock(&d->arch.hvm.vmx.uc_lock);
+        v->arch.hvm.vmx.cache_mode =3D CACHE_MODE_NORMAL;
=20
         if ( domain_exit_uc_mode(v) )
             hvm_set_uc_mode(d, false);
=20
-        spin_unlock(&d->arch.hvm.uc_lock);
+        spin_unlock(&d->arch.hvm.vmx.uc_lock);
     }
 }
=20
@@ -1549,11 +1551,11 @@ static void cf_check vmx_handle_cd(struct vcpu *v, =
unsigned long value)
=20
             wbinvd();               /* flush possibly polluted cache */
             hvm_asid_flush_vcpu(v); /* invalidate memory type cached in TL=
B */
-            v->arch.hvm.cache_mode =3D NO_FILL_CACHE_MODE;
+            v->arch.hvm.vmx.cache_mode =3D CACHE_MODE_NO_FILL;
         }
         else
         {
-            v->arch.hvm.cache_mode =3D NORMAL_CACHE_MODE;
+            v->arch.hvm.vmx.cache_mode =3D CACHE_MODE_NORMAL;
             vmx_set_guest_pat(v, *pat);
             if ( !is_iommu_enabled(v->domain) || iommu_snoop )
                 vmx_clear_msr_intercept(v, MSR_IA32_CR_PAT, VMX_MSR_RW);
diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/a=
sm/hvm/domain.h
index 95d9336a28f0..83be2bd1c29c 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -97,12 +97,6 @@ struct hvm_domain {
     /* VRAM dirty support.  Protect with the domain paging lock. */
     struct sh_dirty_vram *dirty_vram;
=20
-    /* If one of vcpus of this domain is in no_fill_mode or
-     * mtrr/pat between vcpus is not the same, set is_in_uc_mode
-     */
-    spinlock_t             uc_lock;
-    bool                   is_in_uc_mode;
-
     bool                   is_s3_suspended;
=20
     /* Compatibility setting for a bug in x2APIC LDR */
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/=
hvm/hvm.h
index 20b373cea6fb..728b9624522f 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -394,6 +394,9 @@ static inline bool using_svm(void)
     return IS_ENABLED(CONFIG_AMD_SVM) && cpu_has_svm;
 }
=20
+#define hvm_is_in_uc_mode(d) \
+    (using_vmx() && (d)->arch.hvm.vmx.in_uc_mode)
+
 #ifdef CONFIG_HVM
=20
 #define hvm_get_guest_tsc(v) hvm_get_guest_tsc_fixed(v, 0)
diff --git a/xen/arch/x86/include/asm/hvm/vcpu.h b/xen/arch/x86/include/asm=
/hvm/vcpu.h
index 9ed9eaff3bc5..eae9ac53767b 100644
--- a/xen/arch/x86/include/asm/hvm/vcpu.h
+++ b/xen/arch/x86/include/asm/hvm/vcpu.h
@@ -168,9 +168,6 @@ struct hvm_vcpu {
=20
     u8                  evtchn_upcall_vector;
=20
-    /* Which cache mode is this VCPU in (CR0:CD/NW)? */
-    u8                  cache_mode;
-
     struct hvm_vcpu_io  hvm_io;
=20
     /* Pending hw/sw interrupt (.vector =3D -1 means nothing pending). */
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include=
/asm/hvm/vmx/vmcs.h
index 53aa9e3556d3..d28a2682e9df 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -46,6 +46,7 @@ struct ept_data {
=20
 #define _VMX_DOMAIN_PML_ENABLED    0
 #define VMX_DOMAIN_PML_ENABLED     (1ul << _VMX_DOMAIN_PML_ENABLED)
+
 struct vmx_domain {
     mfn_t apic_access_mfn;
     /* VMX_DOMAIN_* */
@@ -56,6 +57,13 @@ struct vmx_domain {
      * around CVE-2018-12207 as appropriate.
      */
     bool exec_sp;
+    /*
+     * If one of vcpus of this domain is in no_fill_mode or
+     * mtrr/pat between vcpus is not the same, set in_uc_mode.
+     * Protected by uc_lock.
+     */
+    bool in_uc_mode;
+    spinlock_t uc_lock;
 };
=20
 /*
@@ -158,6 +166,11 @@ struct vmx_vcpu {
=20
     uint8_t              lbr_flags;
=20
+    /* Which cache mode is this VCPU in (CR0:CD/NW)? */
+    uint8_t              cache_mode;
+#define CACHE_MODE_NORMAL  0
+#define CACHE_MODE_NO_FILL 2
+
     /* Bitmask of segments that we can't safely use in virtual 8086 mode *=
/
     uint16_t             vm86_segment_mask;
     /* Shadow CS, SS, DS, ES, FS, GS, TR while in virtual 8086 mode */
diff --git a/xen/arch/x86/include/asm/mtrr.h b/xen/arch/x86/include/asm/mtr=
r.h
index 25d442659df2..3a5b4f5b6eec 100644
--- a/xen/arch/x86/include/asm/mtrr.h
+++ b/xen/arch/x86/include/asm/mtrr.h
@@ -7,9 +7,6 @@
 #define MEMORY_NUM_TYPES     MTRR_NUM_TYPES
 #define NO_HARDCODE_MEM_TYPE MTRR_NUM_TYPES
=20
-#define NORMAL_CACHE_MODE          0
-#define NO_FILL_CACHE_MODE         2
-
 #define INVALID_MEM_TYPE X86_NUM_MT
=20
 /* In the Intel processor's MTRR interface, the MTRR type is always held i=
n
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.=
c
index 7be9c180ec43..03be61e225c0 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -559,7 +559,7 @@ _sh_propagate(struct vcpu *v,
         if ( !mmio_mfn &&
              (type =3D hvm_get_mem_pinned_cacheattr(d, target_gfn, 0)) >=
=3D 0 )
             sflags |=3D pat_type_2_pte_flags(type);
-        else if ( d->arch.hvm.is_in_uc_mode )
+        else if ( hvm_is_in_uc_mode(d) )
             sflags |=3D pat_type_2_pte_flags(X86_MT_UC);
         else
             if ( iomem_access_permitted(d, mfn_x(target_mfn), mfn_x(target=
_mfn)) )
--=20
2.34.1

