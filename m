Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B30DCB27989
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 09:01:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082826.1442540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umoQT-00050f-Ci; Fri, 15 Aug 2025 07:00:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082826.1442540; Fri, 15 Aug 2025 07:00:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umoQT-0004zH-9H; Fri, 15 Aug 2025 07:00:33 +0000
Received: by outflank-mailman (input) for mailman id 1082826;
 Fri, 15 Aug 2025 07:00:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9KPM=23=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1umoQR-0004z6-Tv
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 07:00:32 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 827ce42d-79a5-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 09:00:21 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by DU5PR03MB10444.eurprd03.prod.outlook.com (2603:10a6:10:528::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 07:00:18 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 07:00:18 +0000
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
X-Inumbo-ID: 827ce42d-79a5-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mrxp/5yDEzS9V9cTafEtqXeg2ZFLEC9VqTfkdMrEaaYQDQ5BkfHD9Y9v7NTmv7338dYWBdIkstrtYr1C6dLfStc3cQjKYpg+QruYsOR5oBm7so3VkJd0iG2V5t6HJasA+g0ybr48Sf3GuHbJFgHG9hmlAOI+aprmg4IC2/zOgCGlsrWUuf6T3FMMJxG8xZrzHCQR+p/pMrgxZvoRA8+uolgPipY40uWLpU0wuzisMCSY8kWvu/XXvbytCXj0s0dLOGXwrUtU3DtzxF+IYVrglN8BvUjfyBrGCIDcPpRpsZGabFBL4FsiNcbZSAaHq9KrJRshmSkg3xeXxC0n8/bb1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bE8XFLro+FXsYjpGK8BMb83wJUXpukyPio7i5EsPgc=;
 b=OU3fVnPmqfwWGxxM68Cv3DdBtG0wO8SO0ggKRwEzA8vcbD3JqgbqkjbjLF2pZYU/XoAZgRQ+a2CSw3vwZUcr+VJwfiBrnSySJdFotFLKBH4NolxCa9Ef8RRHK2roDPlVjfExgVXrlMlDk3TUuEvP0cvi0XfiPs17YlLCyHBeOzDQQB6vUAEB572yvwQdPRA/l2KGo2M7ttr97P2aFxJaWwkwXyORuQwi3naz1SNyM5FJU2KKt084bMTterGpvV5Jp+2stsJ2+y/FpHyeGDPxbD8A5Ut8Xuesx6DXvPbVFEqUdCAM2QeN4q65cnInnK921LtgvCuVt3bnQB4w0TxnzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bE8XFLro+FXsYjpGK8BMb83wJUXpukyPio7i5EsPgc=;
 b=Ll4gNRsuAKYdYWCLJliLDMEu0I/FdHbAnxuGyf1XQp/iF7twUR+gUYjhPWBSXGdQC6QDMyyXGOpDRnaeB+9jROLWTtQ5uUwMhXVM+XNN0ehzibAh7OIahRvZFPcN+7uDaKT/CHnEhqclz28LrvNYIeSd0uT43KmSKqwCti+HHkht51Su3GXzVRjbwjubwJvfeJpvVWSTmNBvBpWZK/uS3rXZmUgPYe1m89Zl5HuiZbjppRV26rxbSpqV6oYOEbKrdr1dBrdz0YLySMne5PZnEFS6bpS9B/tkNrp2VCMiM5BDAx+VZ2XV88CA9Rg7B6cPAaqZzGMgX+mrWTcR5UjoKQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] docs/misra: fix sphinx-build issues
Thread-Topic: [PATCH] docs/misra: fix sphinx-build issues
Thread-Index: AQHcDbJCdYlsiZdfl0mX5ViIXi0+6A==
Date: Fri, 15 Aug 2025 07:00:18 +0000
Message-ID:
 <fb809a94e8a50bd3a59aa47ee1832c61af8a9f40.1755241166.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|DU5PR03MB10444:EE_
x-ms-office365-filtering-correlation-id: 3781a9d2-0464-4b02-6aef-08dddbc96504
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?InnQCGK1LgjTxv4tIgUDoSVYbxv6DqqzAZ6NTQmjVilMfGjOqoKvCPOiHe?=
 =?iso-8859-1?Q?4jnpEI8CzQReLhlEhkfErUTwIT9fMhLcVxeLmCVnqvzyEQzDdBYzXxMlHT?=
 =?iso-8859-1?Q?n97vKW7IniQtlWJRZsEf1iabJjZNEBN4Ol7KN3lc/9KcPGBG4gbNSHgLZq?=
 =?iso-8859-1?Q?Tu3lW1JGJtQFvxCoc4wCOhcBIf9jZOYVeGWDVwNQtnQV7ijeco+iomLiAA?=
 =?iso-8859-1?Q?HSRpGdb7DSKTe7YtO8EsNOFrltQ6BzQRazlc4g1CkmIhXXiy2KNow/lLeg?=
 =?iso-8859-1?Q?fFT56R4m4H08s85o7vbWMywAdYZsOtTat7Nx+HA/RgETrQQvlUA/axKICT?=
 =?iso-8859-1?Q?H6Adf7H8ng/LiYQ0itvuL2AZh4ZO1POPqfQ6WAi7ukDxEI8s+MGrHFd+Nn?=
 =?iso-8859-1?Q?/f/67iaeUr2FlAbamSPHRPCrKODkvJc991xMXEJRazcxEYgBRswE0vlo+C?=
 =?iso-8859-1?Q?pMmmbI2n/acFkSqazAizWIexogFy3rJr0T58ufXymx6wWR3OqKXwId7+jK?=
 =?iso-8859-1?Q?f2kct+6pdetSvEazVvhHLjq0b1b4nGsQLHCuT+oHwDMMMh5x1NWOoU8boQ?=
 =?iso-8859-1?Q?QrrkBqKYX6HMhYX4i+eq/sJpA66PsyX1jafc+lgnS4w4lYLoiXO7LFolSl?=
 =?iso-8859-1?Q?E2Fv2LX3eLjkJS9eV2+9zEJhfip4CSPLJKXLMq85D0ixRR3QBj5LeUrTuH?=
 =?iso-8859-1?Q?LtfwZiYq2F7WRq79vhx0Mst+meB661cTUFxl7tPNm2oxPZEqEF85aBiWyo?=
 =?iso-8859-1?Q?9U7cSoCuoESWfKrzTqu9KQboQ5bz8RGJQWfSYo9sh3lOf1ciVFKcKFTclP?=
 =?iso-8859-1?Q?zUlNvxt5+P45X/RHaie6dyvO35/mCtVqUkn07QzvxHSkna1u3lk7at0GYm?=
 =?iso-8859-1?Q?YiWpcf6SmuqH4eaOusknyRetV4R7AAk8FSdBC/eM0iY6YWDRokNuK0iIfO?=
 =?iso-8859-1?Q?K4Y301Mfjos7VgH6Ou9SRW3V9JT2AL1mxrS+iQ2HXNoQGUKfilUsiA/opu?=
 =?iso-8859-1?Q?oC31REBDLwv8vXCS/A0EZybNrmOH672ncmjrnCJFUbJLsOtEGHIXICGVE6?=
 =?iso-8859-1?Q?G5Wstovz1fVBQi1WpYTbvqB32ctPfjUU7Q2D7KH4C0z5K3xwKfOOpULcw5?=
 =?iso-8859-1?Q?6o+Jf+Gx5aYhoaixX4aU40MC97Ge9lHvdq0zz31VUjUBTvJV/bLP4442OO?=
 =?iso-8859-1?Q?x5JHJqltczH3JcLM2818AgJpsHqj5SLtJaVT4zcIZcVHbd9Vqk/sT8ywTJ?=
 =?iso-8859-1?Q?TwYKqRnR13UVjZQtoEqS8593M6y2/7i9fRY95K/FYAFOkMWmJ1am9tJrmE?=
 =?iso-8859-1?Q?VEGh9RjFhSt+bltoWf48UEtSiBiO1C3a7VYEV5fGWXG6BspMct9skjsFiW?=
 =?iso-8859-1?Q?0oAaNp82p49Bk1VVOe2yMwhfL9kzk2LSeK13HtjVTkJremEUKFCgPfpNfk?=
 =?iso-8859-1?Q?UJaxlOASckGnJgL3L6VXf6WCH9UekIOdNd2l65H6qwLTefxzHWOC+gSyeQ?=
 =?iso-8859-1?Q?uv/6pM7o+q2hBeqXJxRZPl9HwwXXDNppLrurIcquIyUA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?1Q8fa4eSW9hMCKibSdxGBV/3mxvkn5Cxi/M7+2phF4bVWQ6zB4TPyK9Gh+?=
 =?iso-8859-1?Q?sREyCKNx/MgtQmc1qpVRD+9vv0wKoPvfoAVxvSi9hpVKjhNZVMUx10CPXn?=
 =?iso-8859-1?Q?dbU8rJ7mOR8X4eQV2P0cX4VV3XuD6y1uE3dvl/sDKbl2uLS8mgq62R5sJ6?=
 =?iso-8859-1?Q?g+QU1mEfcUQPS5350mOw+3XeTXc5n0xxFZTdPu0e7r42Gn84e3WkGjKTVS?=
 =?iso-8859-1?Q?svVD6VEeGXjwLRVdXvmjeipug8Ry2I3SktVEotItwYDYYenmdjRXNnOVPK?=
 =?iso-8859-1?Q?XoqwgSlZXOQEf98Jq7hEuieTRHGDuMW1aPRnx9ClXTqVTSaGbP8AYnL0BM?=
 =?iso-8859-1?Q?ylUyqculGeU9ib7GN8Gkuvgr4Y+6zRcNV/QTJX8mYnpB6ZKR51mS2aITHU?=
 =?iso-8859-1?Q?HUsG+vqW6oeAOA9+d1liqVQp5au9leFxriD3MLWsVAVMn6uD6OumnlfBAI?=
 =?iso-8859-1?Q?HFg7eQlmcJSK3PhfFnDqe6BKYoPZMpkDa+twGGIvGJbTYkQtXPRteJJtmX?=
 =?iso-8859-1?Q?zUTh3DUBJF+f0CZX+r8R/QsBsIsil79u4TfnhziCp3zk2SrL4+SqXx7wXH?=
 =?iso-8859-1?Q?dX46Lx9aLKiYU7LfSnZrLjOna5cssaELsbNN0ok597C2fGuYirFz//DbkA?=
 =?iso-8859-1?Q?vYNOAymTl5R91CPZbbcjrFIe5PupctRNNYBFI8zHA3fO+kExAnzn0yj9Iy?=
 =?iso-8859-1?Q?HtZue8ve7eeFNGnNcD+3tCYclrbKs4WZgmospJz+wdtTJkLED4FVd4cbpU?=
 =?iso-8859-1?Q?REfBSASkx48VcqiW6pdqczdzT3ulGz0eVEgDbGd1EdWMys2xoXzxc17r/t?=
 =?iso-8859-1?Q?Jzu7S0SzMIztTLMYWopYDaZRx4T6x+asG2BHVAaJKE0dBu0e4FDtMDTJZV?=
 =?iso-8859-1?Q?EXvGLbdLfdTjbRDWo3ZFYs6SwdtWhtzA31wLbe0Lv9dkMMptCyDRJnhmvO?=
 =?iso-8859-1?Q?1vkcnIDTvkYKVbu3FUfr8Lj898YDVYgyPDSaEbhLmoSoop7ohRvIeoeATG?=
 =?iso-8859-1?Q?3cuosy34ToH+cwFetWxASmm59ex2YFkDUCK+JOe8gGp4NywXDIvQjUAzX2?=
 =?iso-8859-1?Q?UuXEc1VYx+P8oQFxDJsTMD6hzrqYSK2rnrmBdxKuwTl/DwsDhCQRlekTYl?=
 =?iso-8859-1?Q?RA/HBPqalHCWHCqoa8c4Z6aFs4J2RRf8WPTBr7p4yjUyXsGXeabTS0Fwfw?=
 =?iso-8859-1?Q?HovAgB/3/Y99NTlbycl7oUR989XpELM7ze4PfA/gxtWXtsCmkayzJOwOnK?=
 =?iso-8859-1?Q?+EGIDvF9p6/j0M8SXp3CJn8wB4k6uZdzpFqQ8rcCPGCZuHcl/0E1pob5xP?=
 =?iso-8859-1?Q?JqYg1cqAEHVkylo3xfjm1kzLqQbBEK2OKlXbYG37k5U6Tbr2BXk3350IW0?=
 =?iso-8859-1?Q?ktUHB1vtZQXveBru/U+1YlCEL+Wl0aoeA7d7JNNAGGZpJNIkk+fDpajSrO?=
 =?iso-8859-1?Q?klCPkWp5eFknqedgk96VbpXr+i91n9XpZ/XqvajtsiKuzY2lNgQ5dcretX?=
 =?iso-8859-1?Q?neoL9j9k4rxAC1QKGkwE3h/yT9SzQPBEj6gCqKvjoWilrdOSmvqbTSko3y?=
 =?iso-8859-1?Q?qe00oUz3afvrs3ZcahEO+rNk8cCddAHP5hlvxNKAlsZZSIn5AEgwlPMTx6?=
 =?iso-8859-1?Q?rpeZgmfc30D7HkuwqpML9BkdMXWimjKcGeT8VROPMhpaa8tXMLWlZHmA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3781a9d2-0464-4b02-6aef-08dddbc96504
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 07:00:18.5917
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cqw7T/sgHHkkHXaxpAquSYmGKoXjcEek2/PJJBQ/zjcSK1/8ZGqoZMcq+jwaCRlr7YBaCQAOJNAQ4DaUafQyF6UDXGvm0Qa+d4+W85BC1vw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10444

Fix the following issues:
1. xen/docs/misra/deviations.rst:90: WARNING: Inline interpreted text or
phrase reference start-string without end-string. [docutils]
2. xen/docs/misra/deviations.rst:54: ERROR: Error parsing content block
for the "list-table" directive: uniform two-level bullet list expected,
but row 6 does not contain the same number of items as row 1 (2 vs 3).
* - R2.1
  - Calls to the `__builtin_unreachable()` function inside the expansion of
    the `ASSERT_UNREACHABLE()` macro may cause a function to be marked as
    non-returning. This behavior occurs only in configurations where
    assertions are enabled. To address this, the `noreturn` property for
    `__builtin_unreachable()` is overridden in these contexts, resulting in
    the absence of reports that do not have an impact on safety, despite
    being true positives.
    Xen expects developers to ensure code remains safe and reliable in buil=
ds,
    even when debug-only assertions like `ASSERT_UNREACHABLE() are removed.
3. xen/docs/misra/rules.rst:127: WARNING: Inline interpreted text or phrase
reference start-string without end-string. [docutils]

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 docs/misra/deviations.rst | 3 ++-
 docs/misra/rules.rst      | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 3c46a1e47a..2be49076e1 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -95,7 +95,8 @@ Deviations related to MISRA C:2012 Rules:
        the absence of reports that do not have an impact on safety, despit=
e
        being true positives.
        Xen expects developers to ensure code remains safe and reliable in =
builds,
-       even when debug-only assertions like `ASSERT_UNREACHABLE() are remo=
ved.
+       even when debug-only assertions like `ASSERT_UNREACHABLE()` are rem=
oved.
+     - ECLAIR has been configured to ignore those statements.
=20
    * - R2.2
      - Proving compliance with respect to Rule 2.2 is generally impossible=
:
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 6812eb7e8a..382331447e 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -124,7 +124,7 @@ maintainers if you want to suggest a change.
            they are used to generate definitions for asm modules
          - Declarations without initializer are safe, as they are not
            executed
-         - Functions that are no-return due to calls to the `ASSERT_UNREAC=
HABLE()'
+         - Functions that are no-return due to calls to the 'ASSERT_UNREAC=
HABLE()'
            macro in debug build configurations are not considered violatio=
ns::
=20
               static inline bool
--=20
2.43.0

