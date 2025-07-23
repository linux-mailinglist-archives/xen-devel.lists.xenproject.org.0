Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5FCB0EC89
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 09:58:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053420.1422177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueUNA-0005Xy-Sw; Wed, 23 Jul 2025 07:58:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053420.1422177; Wed, 23 Jul 2025 07:58:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueUNA-0005WE-Pg; Wed, 23 Jul 2025 07:58:44 +0000
Received: by outflank-mailman (input) for mailman id 1053420;
 Wed, 23 Jul 2025 07:58:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3SBI=2E=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ueUN9-0005W3-Ad
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 07:58:43 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8ca3034-679a-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 09:58:42 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PAXPR03MB8082.eurprd03.prod.outlook.com (2603:10a6:102:231::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 07:58:38 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8922.037; Wed, 23 Jul 2025
 07:58:38 +0000
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
X-Inumbo-ID: d8ca3034-679a-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fVOyRCHozoHEv1JDTo2J5g7liTNA1Jhp4sp8l2yqrB4pMmgxLJ1fuqnp/3GRgPsgL7qQAjMYTDUfRWoV7rG89FCgkuKnSvcOZYevcR7UWn+RP3O0Qhq3KUGeCMXmesIDLb6CC4POlxdd4ILUaju0NuDBYlJthUv2U4kT7mf+Dk2lSxTve8m8xYo/koj7LeolkLK0SB6NEAloN2DeYoVpOKV5QBCPk2oT6cweYUGe8O4b1IaHrSmnH1p2UDJ642dIrZZFW7J+jK9Vcp98zG33nftxkZ2E5COjPVlMwOcsXy3pZz/EzmczIzTd3xRUGvvcsE2IM3NJoke9H7j+BB/uAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NnkgHZDA95iuw2TlQ4kHkXqSKfJLLFnu6aLF1WOiSpA=;
 b=cSKyYL0ZawfkpqK8JF3iOjA+7ss9cMdRPEcI7p/xTMLlpBhTL8owYZwRbupfX3zTdRqjKCKLQOJetuI+mVUcY3+tMg8tc58Mhx6FzppzKssctzVxHYn2t1FCIRMB9YUQ8sU2hU3/RiZOE3thdSUkH4bTAX8wK6+gBz42nXufOkXt0TNqG3mUd6izkm+b/xcoxpF12cjJkwP66ZUaHH/sSpvBxmipz2g54MGBkr3EwobaqS++r4PwrpS9uVFyQ2Lw13xUs9Ty5Kjz2DN+aT8uxftLqU1JMMnwDz54kIQvvOoHxYP+T9pho6CFD9HunJPq9ayLPteN0Bw4SDeIEYL8zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NnkgHZDA95iuw2TlQ4kHkXqSKfJLLFnu6aLF1WOiSpA=;
 b=ctrvuYdFPoF2yiym7CGwrPcQI9HzceOuGZs8764864/4Cek72S4/sLxIPbm0UQ4DhPrOhwHfYRXnGFMQL/f7mWojholnVKQFJtv10Ry9Q/eWTiGffX/e27nDGVIh3oSSHjAtQhhfKl3sW+g4RuzouqKyPN2RmSFQdYMqX6ITZ2Hd8YgGlUHaBaIjouIG7+WMEbWqmuorm81sJKmoVatsXMFTDN8eELqbtW4XHkMSKczz7F9UlDbgl/+2VV1VFnsjZJq74B+jvxXMmfh8sSzmnNjhDGvxxhOyiiSTw0q64C+M+PzfofrV6TMUQvw4zMGAOWJCg4E8y6RwZA/Mcwu8qA==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [XEN][PATCH 2/8] xen/arm: move vcpu_switch_to_aarch64_mode() in
 arch_vcpu_create()
Thread-Topic: [XEN][PATCH 2/8] xen/arm: move vcpu_switch_to_aarch64_mode() in
 arch_vcpu_create()
Thread-Index: AQHb+6eY7tK778r4fEOnvsrV6Tw39Q==
Date: Wed, 23 Jul 2025 07:58:37 +0000
Message-ID: <20250723075835.3993182-3-grygorii_strashko@epam.com>
References: <20250723075835.3993182-1-grygorii_strashko@epam.com>
In-Reply-To: <20250723075835.3993182-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|PAXPR03MB8082:EE_
x-ms-office365-filtering-correlation-id: 60213e19-113b-4241-d3fe-08ddc9bebb4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?aw6WF09vUu799lZHbOcBOu/6AVJoepgYCH6aG+4OUY4uTzkA+ef/iGtJT4?=
 =?iso-8859-1?Q?xUAqsc/7itRINhGnHpsbQKSIE7LQerfqamKHQxUONNO34mBXHb3HZEc0ch?=
 =?iso-8859-1?Q?V9oPEVmVXFHa363uQ45cUYwwGYiE9nCJBLxrojz6X+q1m3y3wetH6xX/cK?=
 =?iso-8859-1?Q?riEXxBAGR/J4XBGA8epahmq48T1q4NrCwCsirs1Z2kxqcq0mKCzsll2wBO?=
 =?iso-8859-1?Q?LScfhUfl1dLYxuiotVL+zHhEgG9NxP78S7fSbabETFdy69nGRJlk/1vCgF?=
 =?iso-8859-1?Q?iMT8HLNVwV4Va+MyEcN1HrcVoedOvj3hgvVrvkT2t7TQ0U7AIgMofwOvT+?=
 =?iso-8859-1?Q?KHNQL3uNGRgndiT99d83e7rE8KZ2wTRMV19RpT7nHSS0xId1YlVuemfN4e?=
 =?iso-8859-1?Q?4BVNVJW1EsMVljOnsWl0OV1HQZWMt2QhKCIYUynLM4qC9V9zPhHIP3ZOt9?=
 =?iso-8859-1?Q?M2iDaS7S4gOEu6BpB2+y2ZYqR4WySXGvUeR8AGWF27PLaLwicQxBMtE4pY?=
 =?iso-8859-1?Q?9zMdRqEA7hC3f4mNC4IDkQcVS+Zhl+RrPaCVZbIMPQgN75t/F7vYMBM+wI?=
 =?iso-8859-1?Q?qF6+OnNSRiGoY3u1YToOTBm7TrQwaxWKYamP0B5/6lxtDF0bPYQcLZFPv+?=
 =?iso-8859-1?Q?vXNWkbzKxCPcbruMybev1mksgB30BA9Wr8mx+QHxuo3PBYwnKIHzOuVWlP?=
 =?iso-8859-1?Q?O0bISBZh2F9Sr+nowjv+vl9hsx7V4JZOtJeBKVUPkMFrYYh/+lLGZN7f1g?=
 =?iso-8859-1?Q?d4OCaO27LM8SSRm4gYMd4OTtWMm5LPhbSpj84jHdZ9tr52ppSszTHPUESP?=
 =?iso-8859-1?Q?Fw+TYLjYX/b4pLBFVqjkQRQDGCRgJwKhbpqcdRgNdngVmQd2g4yzw7q/Xz?=
 =?iso-8859-1?Q?COyNPNOnyX4wlEOEsQKDAAI3zthdowtbn9TvRzgtOxfGYyrlChp/JDHQlD?=
 =?iso-8859-1?Q?332Wt8Z/NFIh/bWnBwyx3DioYMaqzzMeHJwVZANZXftIRPqu0qefFzrTyh?=
 =?iso-8859-1?Q?W/HQoLDICOOSVr5AcNO1x3FcsQ1ytlrtn9Nr3nPc8fQukotfNH4qWYDuH0?=
 =?iso-8859-1?Q?Sd4QKTJ61lbH4YsXBMf+8B2n4okiUm9tyhvnDbmYyH61/rF5OxZu28zlq1?=
 =?iso-8859-1?Q?cznmATys8YlcwXODJXUCEbTvRLyOpK7b6UIFzuujwdXiw2x5mojAk03oGy?=
 =?iso-8859-1?Q?C1ZQEgIXlLuPC0HB8lnuYm9z3MLoYL0Tt73Wp1lwnxoypB1PncBX9rqGQ3?=
 =?iso-8859-1?Q?KxQPWtlYI0sbEFJCp8/mxWh5XBU42Q9EyMSmamjYm7gf90VEdFKoQunlq2?=
 =?iso-8859-1?Q?yNuZlRy0rP4iHwb0KU8IOv/x5NdTwDJ0klMidkTraNJYSYh51Rw+gchD3M?=
 =?iso-8859-1?Q?M+xYv2k3BBp8YUqQw3JlM4Lzkcpal2FWVsFWviMEPdoMXqblqQDkZcWt0m?=
 =?iso-8859-1?Q?Exf1gfWxTAOqOwBk9kT02ZGbRZg/a1lWuyWgtr1E2h6ohL+1m7USF3xqg4?=
 =?iso-8859-1?Q?fKCTnhbdNmQurA9rJbAVbCFhZExegzkd6dz8+j1D9ceA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?6MGie70fp9eyVj2f8+dE/s4uE20Oo3WvBraF4YFjs+fqh34hCQD5dPHMJB?=
 =?iso-8859-1?Q?rEVYbtlIAxv/v2E025s58JQ86Kc/MuITuIh/zw8WXNwiCCM2krDRnKcQP/?=
 =?iso-8859-1?Q?yvAGqIsyy2Cg7SFITKpIagW8yOrXtHw84Ary5Tfh1lICYGiNxdh52Fl8O8?=
 =?iso-8859-1?Q?4St6fgzKVpMNfA6YEKnMNM+Kb6ws66xXZ958EsNvLaWCNYyLNCC+KQ4d1v?=
 =?iso-8859-1?Q?VVnGskIqK2wqI2aJ1fasRfXo0w//C1stNCSSJXLsK1YHCBOw0YF5fLBigq?=
 =?iso-8859-1?Q?9oPoBIQlsvX01unKRPYLi9OaA5/2Lb1JGUOWhRsRV3swI6yqoBrQssprUC?=
 =?iso-8859-1?Q?V1tADV3i/vmYLrgfuXK6gCxa7XN21ljSoYzcIUcfE6t2Fz/ZfpERQ1cGOV?=
 =?iso-8859-1?Q?/BODOnwwlRO7G3n96+4+0AsMQkoWhr9KXSJtfbU0LQuc20ui0XitCpwPq/?=
 =?iso-8859-1?Q?7b8sfTEr5KZ7O/DqEJJq8ZxaQSkCjdJ42ZLUleUJY+/th/3ji76NaYjT/u?=
 =?iso-8859-1?Q?wdKJ90opTPxGgK3F0BBVGlOIMNUsn8iBmCfAyaBOShZ8NxRvHE1/Oj/fkW?=
 =?iso-8859-1?Q?hh0/gU1Dhq7BKiDDVxE7k8Em1KzaqSJKU1y2FFhgZ3rLvFVVbBFA3Q3Uig?=
 =?iso-8859-1?Q?UTBcZlzDeiysz7oiMca1gjIiBD+oWJrQvOOFTMuA4cPM8Z1CmItr9hxM+t?=
 =?iso-8859-1?Q?PbrS1OABMEL0XJgbV0/RMc72fdCc0Lj47xEc7WjWFzE8YZPN7CQ2HfYVqF?=
 =?iso-8859-1?Q?uTNDy9egWTiBjz+K6s1kvrUyOAX97UJobDDKZlq8ry1TNT9P9Sq+eLlRve?=
 =?iso-8859-1?Q?m/ar3yYbFHYUvCKqlbg4MCc96x2mzzp1Rr7I4tulJjnsddtAjjbEcw+tnG?=
 =?iso-8859-1?Q?uhVjuH0VyH7fbVSebFcDWQMeTWiFgylNEiBuJq2P0tlsuSC2BIOjJo6Okr?=
 =?iso-8859-1?Q?rzVNE34C9Gybo2/7jUnbdfRVQTZJEItCMY7frzMJlyhDTrtIsSd9Xicwpu?=
 =?iso-8859-1?Q?c65i6VF4Sz6kBZWnE3H3DEirwZKsc/x+PmGPvp1gkKalJWvYRgcsNW++vf?=
 =?iso-8859-1?Q?P52QrzTqbq5249nI31D3y62oib/EmPwbrb/CuA9MnHHIVcb33lZW/u5G+a?=
 =?iso-8859-1?Q?iBoisBFhXZus+IzbI9RDnfaooNmC+zz2jFUrCdsXGD5lmewPIOVpX7+u7Q?=
 =?iso-8859-1?Q?KsY7of5SEIB7cZuXA0d3mGlbzktRzn5Nb53x2tsgQ4dtA84bJfQf+mTnHD?=
 =?iso-8859-1?Q?uKSkS5/NnbiAtrJoEam1W3rhO1edYHkIL1s3HEHr1322Mh53RTXaNWr83I?=
 =?iso-8859-1?Q?zlMfVhVxlPtsfYkg4DbNqrW2HE2YCuU7ym1hgPqcuyjb8/AguxgamXTIKt?=
 =?iso-8859-1?Q?FbV/mZA0ov5zhvqzUQ+VFrDfKQAIR8P2MRDQEhzlM6u11SiLUI0n+lCn1T?=
 =?iso-8859-1?Q?CnkMDewWG1vtUhS3RKi5TeTNbsj/geyN9g9f4EUqv79IhdJEo+bbsxH5Ju?=
 =?iso-8859-1?Q?zv3rupzpWdJuA4uPqGaq/zYca/KdgjQgebw+xOxFyaV5SAIAEEFdWkOlj0?=
 =?iso-8859-1?Q?jkFyMCfreT1RINYzIO9+UKnYR/jD0OgaeIwrA+gtSivB2CMEnPdzytHokW?=
 =?iso-8859-1?Q?zLJDONHoEWyjPW6xDHC+8GoB/4rjetYK/hKgreCQ2MGXhV2U7TUivg6g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60213e19-113b-4241-d3fe-08ddc9bebb4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 07:58:37.9139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AxGC0Y+xvjk8YscYFpkb29RF13imyIg2LW5+WxMRr3y3266jbqF8KMjFOyARSACnKP1QKnXpTah8F9dP4XW2JY4K41KJIiSPzzILXMMfLTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8082

From: Grygorii Strashko <grygorii_strashko@epam.com>

Move vcpu_switch_to_aarch64_mode() in arch_vcpu_create() callback instead
of calling it manually from few different places after vcpu_create().

Before doing above ensure vcpu0 is created after kernel_probe() is done and
domain's guest execution mode (32-bit/64-bit) is set for dom0 and dom0less
domains.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/arm/domain.c                    |  3 +++
 xen/arch/arm/domain_build.c              | 13 +++++--------
 xen/common/device-tree/dom0less-build.c  |  6 +++---
 xen/include/asm-generic/dom0less-build.h |  2 +-
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 79a144e61be9..bbd4a764c696 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -586,6 +586,9 @@ int arch_vcpu_create(struct vcpu *v)
     if ( get_ssbd_state() =3D=3D ARM_SSBD_RUNTIME )
         v->arch.cpu_info->flags |=3D CPUINFO_WORKAROUND_2_FLAG;
=20
+    if ( is_64bit_domain(v->domain) )
+        vcpu_switch_to_aarch64_mode(v);
+
     return rc;
=20
 fail:
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index d91a71acfd3b..af7e9d830ae1 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1885,10 +1885,6 @@ int __init construct_domain(struct domain *d, struct=
 kernel_info *kinfo)
         printk("SVE is not available for 32-bit domain\n");
         return -EINVAL;
     }
-
-    if ( is_64bit_domain(d) )
-        vcpu_switch_to_aarch64_mode(v);
-
 #endif
=20
     /*
@@ -1941,9 +1937,6 @@ int __init construct_domain(struct domain *d, struct =
kernel_info *kinfo)
             printk("Failed to allocate d%dv%d\n", d->domain_id, i);
             break;
         }
-
-        if ( is_64bit_domain(d) )
-            vcpu_switch_to_aarch64_mode(d->vcpu[i]);
     }
=20
     domain_update_node_affinity(d);
@@ -1995,9 +1988,13 @@ int __init construct_hwdom(struct kernel_info *kinfo=
,
     iommu_hwdom_init(d);
=20
 #ifdef CONFIG_ARM_64
-    /* type must be set before allocate_memory */
+    /* type must be set before allocate_memory or create cpu */
     d->arch.type =3D kinfo->arch.type;
 #endif
+
+    if ( vcpu_create(d, 0) =3D=3D NULL )
+        panic("Error creating domain 0 vcpu0\n");
+
     find_gnttab_region(d, kinfo);
     if ( is_domain_direct_mapped(d) )
         allocate_memory_11(d, kinfo);
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tr=
ee/dom0less-build.c
index efa846da2a55..f02ce6c776de 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -771,9 +771,6 @@ static int __init construct_domU(struct domain *d,
     else if ( rc =3D=3D 0 && !strcmp(dom0less_enhanced, "no-xenstore") )
         kinfo.dom0less_feature =3D DOM0LESS_ENHANCED_NO_XS;
=20
-    if ( vcpu_create(d, 0) =3D=3D NULL )
-        return -ENOMEM;
-
     d->max_pages =3D ((paddr_t)mem * SZ_1K) >> PAGE_SHIFT;
=20
     kinfo.bd.d =3D d;
@@ -792,6 +789,9 @@ static int __init construct_domU(struct domain *d,
     }
     else
     {
+        if ( vcpu_create(d, 0) =3D=3D NULL )
+            return -ENOMEM;
+
         if ( !dt_find_property(node, "xen,static-mem", NULL) )
             allocate_memory(d, &kinfo);
         else if ( !is_domain_direct_mapped(d) )
diff --git a/xen/include/asm-generic/dom0less-build.h b/xen/include/asm-gen=
eric/dom0less-build.h
index 6b80ffbd8679..13616975b3ca 100644
--- a/xen/include/asm-generic/dom0less-build.h
+++ b/xen/include/asm-generic/dom0less-build.h
@@ -59,7 +59,7 @@ int make_arch_nodes(struct kernel_info *kinfo);
 /*
  * Set domain type from struct kernel_info which defines guest Execution
  * State 32-bit/64-bit (for Arm AArch32/AArch64).
- * The domain type must be set before allocate_memory.
+ * The domain type must be set before allocate_memory or create vcpus.
  *
  * @d: pointer to the domain structure.
  * @kinfo: pointer to the kinfo structure.
--=20
2.34.1

