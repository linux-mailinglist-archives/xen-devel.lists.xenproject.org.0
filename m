Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B1AC8769A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 00:02:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172211.1497307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vO21p-0002qt-MY; Tue, 25 Nov 2025 23:00:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172211.1497307; Tue, 25 Nov 2025 23:00:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vO21p-0002o2-Jb; Tue, 25 Nov 2025 23:00:57 +0000
Received: by outflank-mailman (input) for mailman id 1172211;
 Tue, 25 Nov 2025 23:00:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUk1=6B=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vO21o-0002nw-Q8
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 23:00:56 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97de6db6-ca52-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 00:00:53 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by PAVPR03MB9091.eurprd03.prod.outlook.com (2603:10a6:102:326::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.18; Tue, 25 Nov
 2025 23:00:43 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%4]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 23:00:43 +0000
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
X-Inumbo-ID: 97de6db6-ca52-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JahMOLuhSfSVRVRt7c+A5aWu1P0TFpVcUFnzcZmrCx4tuS7XS96IFKerLSrrQ+nCYl4GptzYevoGhat0a/J8yiiqwtSJWwV8E1YensTJFHqPU+nf/GCwbXHAy4UHdzM+Xa2ehhaX2pfqQmpVrelUtCWRC3Tr40eJBE+XgzYuIZsXfOYn2jwFW5OJeAoF/rszF3ZD0yfwa4f/ydMguHIJYZlw52ZfxYya0wrgBbYISn3YpX36gohI+dMb+t500G8t0nVWlHbVTznVKajDUgaMC4QhHwv/9WPRetRzPtkkkFJ8Ps3wN7iNNcyrd14bpx2GnjpOqATUODkKARDTH3npOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GyPsuAiwBo+slcaLeC8oF8/WpOXP7OhiMtsPr0iA3B8=;
 b=OM5/CtIcNMAcorww40Ww4G1gtVGmkNo8BDZ3UlG6dB93slzDc8Bg/HdmVSYPMlXtNlNVfLMCZa2Rg9ra8r8BbWbS06kc4lPPzkzfcKU1f412t8hfsUTHcDc3nW4HrTjJXWJeX3cfG8hcRZ5ci0W7YSpN7sCuhTAEl3ivf+x/zJizaDorpwi2i2QsgjYWQDJyyuOU1MTIN7PeGcOTFlJ4LoEhln1TeT60mmGPPAvYAt+UklBOLWfLSiw2pKsJ1ZH0yOMoMxaMyDy1eTtJ9i5Ybcb3x2f4USc7V2lG3r2/QbDXijKARUMf6RQB/NPRYtCKG/XsCKbPORsQSi0FuzhQqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GyPsuAiwBo+slcaLeC8oF8/WpOXP7OhiMtsPr0iA3B8=;
 b=e7Tmlmd85AdpEAb4hNT24Hn4VcQh8jdppbMTfoxZu22aFckfElVKAYFZHATHxysuPlX7DF2zLz1jhkKoB88YCuS/Whg59DVtgQZ1+wziyjCuCROA8BFnM4yYgN6kQtpG3qXBUXD64AaeAMlgEWSuYspJzmaT8/CuiZGHnEG3zVMU/w9m9tl9Q05p8YKk5cZyc3CUFRzNbHV0qZPTzY8CSAgElE8cNXX8TOnrt99xEyunp5k7BJASfWkSUbqySGUjJnRpAze1ok5EUiWhYL/1go8WUZ0ylP+G0x2tdTsQF76Edf9RqmaKap9nhKc5CUATsw2gkNpsLuYbU19cuOi3mQ==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Paul Durrant
	<paul@xen.org>
Subject: [XEN][PATCH] x86/hvm: move save/restore under HVM_SAVE_RESTORE config
Thread-Topic: [XEN][PATCH] x86/hvm: move save/restore under HVM_SAVE_RESTORE
 config
Thread-Index: AQHcXl9TZm/es1jFW0qVSZfA8WEetQ==
Date: Tue, 25 Nov 2025 23:00:42 +0000
Message-ID: <20251125230040.3070954-1-grygorii_strashko@epam.com>
In-Reply-To: <20251121105801.1251262-20-Penny.Zheng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR03MB4594:EE_|PAVPR03MB9091:EE_
x-ms-office365-filtering-correlation-id: 4491a764-2a4d-443c-d8a3-08de2c7675f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?HC3HIG9Ai4KpEkwvuGDicU/m3bmY/UAKnmSk1p7jYD3rxEwh6qpz6dwghm?=
 =?iso-8859-1?Q?eROsNQlJ4LkKZcua/91FsLiqsD5MEXdoIC2ssLCPe/x3oNNnsXqHPp8IiH?=
 =?iso-8859-1?Q?IyeBQk/1ZnOXvpRgUplCZkjgxu/SxV6jRw30ZmxV4fwR2iWQZ2QdM+CWsJ?=
 =?iso-8859-1?Q?ksxXPLM3YpOxPLT7cnNVjDpyqqgE3DAl8jgJd6djOtpnIbHtOE4rd/wPtA?=
 =?iso-8859-1?Q?wXT8bA1EOUK+8X7HmJfz7s2Z5k7nI0Ghm7uqjrIyHIO2aJiVPRm3r4ZFUv?=
 =?iso-8859-1?Q?7hPZ4cJMy40hUx7CdkIeh5N6dN8XlB4rP9c2N2cqTXWdYKe2VZHyDcQTQw?=
 =?iso-8859-1?Q?/oy+1n5ywfSBMqV1gswk/02Yncp7QZYTorc/qfJOJMYjn2LFyEbVI9K1cw?=
 =?iso-8859-1?Q?rRQGgdXkk62l4gfnsiGwjxc/pagzGUpeWs5Htsprwh5tN0yozkh+BknaGP?=
 =?iso-8859-1?Q?5paJH4vPbroIdCSgDZ7MW00zkjmm4RdoGec/RgItCY5jxL8xy1JgrMm7/r?=
 =?iso-8859-1?Q?1xqTHDjRh6RNZYqZDcpT1onNPcab2ejiR72sGJEBbaMDGWj7sDBGt1RrIS?=
 =?iso-8859-1?Q?vS61SCZDnRwllFwwWs8EZSVjElZ23DH7meEa8uNwMsIan5UsVigBh0R8iP?=
 =?iso-8859-1?Q?0e0F0LGL4NF+Pb5TjfzU/X8kcVfnqCnOiaKGYbLK2QxljQHz2JEnourW1n?=
 =?iso-8859-1?Q?OS9Qr49xiYGcv+EhRWWZ7CkAqGQdGMG66o1hT6oLUBFTXbR4mE5e2hbH2I?=
 =?iso-8859-1?Q?eXtgpzaOfhTSFOizzZdQndWII4q9MNNclJyhwIVwzr9020fnYZLA8vPEEL?=
 =?iso-8859-1?Q?u7pC2jqMLZd/xRjTbB7QBiw/Q064Tme5v26GfvOjTfBUkRI4fHMdyUD34I?=
 =?iso-8859-1?Q?03LDttFnfqiTNciKaxsbVAAZa4/7trTnQe6n2TgdKu9dXjBviM4Dyqfvt9?=
 =?iso-8859-1?Q?mGX7E5yiQO41CzD9CrZVAAUY7OPYNxAgxbntoitwOtNzw9pYuN1ZILCIks?=
 =?iso-8859-1?Q?02g2RrgH12A/d3E2FINVUkBn3OnR3ld2LAyYT3bn4BevPkzHuWagT/cjlZ?=
 =?iso-8859-1?Q?LJjq3s6EBJs/siUWKkVnQzc5yWzjUK04Ho4xtaQU/guZSVz7b+UeNvtmou?=
 =?iso-8859-1?Q?JyqljIxYcpsg7fSaznB2y0n0Fs8S8wl82GrjHfKjQ8QOgjIYyPsMjitOfB?=
 =?iso-8859-1?Q?upk0jBrIcGVmJRwhXPs09bC5hr12Bv92ZuilOzDqgjVAJRoqQF6amMcuXY?=
 =?iso-8859-1?Q?dfB8PsSIuSYy5MNRmIskmt4NsOJ8cPhOs/5yUloihNn8VuWkxamow+4zER?=
 =?iso-8859-1?Q?3EPh1tgGKrkk9Kl9TyGlXlhoSOLSIviUjXjbtagb5BPBdyL9c2t/KT0xeW?=
 =?iso-8859-1?Q?JKIRBvKNQK4nODNW7yixnRenO9hThS2mycu7BgBrxNwUI+88DGpvzLnK1w?=
 =?iso-8859-1?Q?/GtpPq4Vs3i6X51ns/ni+SxUA0nyaaQae4g0/hLuNuJeSd291evS//jlo8?=
 =?iso-8859-1?Q?WpSvJMMfqoqvv3hyqWFaV/79H0kjv+ZVwdHd7UffsGwQVFfPGORRn37EsF?=
 =?iso-8859-1?Q?0q/hJZsqxvwICNNoAjk8b2Q24fgJ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?UCIwotVHeNRAH08Eb5ajdgsTjcXKhtzxuYYs3h5Gff6l1ZfFalMuV+raIB?=
 =?iso-8859-1?Q?lLuLGkTV0y2+EeF/U4NJWMfkq1DTp8vgWjZzC7GmOPY0AlzeoeRWzk9uye?=
 =?iso-8859-1?Q?68QrhKh7+VXfXp6BVWHjr5WQERYnMMteLxX1QxrrV7O8weNLxnp80b7vxG?=
 =?iso-8859-1?Q?DqG9Vn4vsIEmDb6UfFFpuJzDzg7xPbOqX2Ddg374QU9dtyz7LioMh/5c9k?=
 =?iso-8859-1?Q?n+RAJkeMMm8OtydfXsbzuN81pIONV8tPPIm6pC9hshKdVXcNdTEPq9ce7I?=
 =?iso-8859-1?Q?IoaYEgdwjRdJ3KULoZyAceucc/MlEiwYa+aUEGspAXrE+bemY49cxe2XjP?=
 =?iso-8859-1?Q?ZhunILXwjl5RcqcI+R+YlBwPzZOccqWOn4Iq6s/lGK3LStKiMgPUh1nu8n?=
 =?iso-8859-1?Q?P2nG/auJ7qNvAMWoPKymLsiLx+eHrhUmZwLRnu4LeRPN7ZA4SqUrooltWR?=
 =?iso-8859-1?Q?jJXK4omosLlUC+9cHF7RN0ets9FbGueUOY2G8+IW4abTORZva4eHnNQZtQ?=
 =?iso-8859-1?Q?OJUDjsMP3z0xsbdw8h9XIJxyfJMm0iqWiWaAZfj6l9S8v84Fyl85xf0DvY?=
 =?iso-8859-1?Q?RY5OIiu8gIoZgA3lSrhyIejLMjZ0RmXP858Va4q0QZhSYp7XAqX65M01C6?=
 =?iso-8859-1?Q?RBvh7fFHae6Vl5IOdnz/DbTWVianWks0SsYNui5dR8vP626XA2PiQPy2R5?=
 =?iso-8859-1?Q?vaYJ1XpLrivuvkoeA6PQkKce8KbhH5aPFavYC5gX4CZaiEFZaBB6lYRj58?=
 =?iso-8859-1?Q?90A6yjSykzBgKpA5Jf/HprNGiJeKOn/6USaCSEOObGBRHfEG1ADAYkVBx9?=
 =?iso-8859-1?Q?Px9eD3IFAGjypTDmliY2/xK6ycTxJFPecZPYWews3QUndG7FYjebMcWmY5?=
 =?iso-8859-1?Q?DfK5FkVaZyOCYPF5W4e3yYVwJDQDYC3eDtYgWwktXPhztsYe0QNS8Lsug2?=
 =?iso-8859-1?Q?EaKfps8IebCorglOKgb6W1KjtZ/jPeEiLXZz6mi0MdUCRM0W/MZSSg4/kI?=
 =?iso-8859-1?Q?nafoifqcrSfuJyctWYPygyecFQktS5Ed7dOho1jz+DSh1v8azluMOcZoSI?=
 =?iso-8859-1?Q?Uc3ufEQARWGcbw6OrWb89lczath63q6kR17ErPxdZS6W5gs3WOIUVhY7Bw?=
 =?iso-8859-1?Q?s70Tv1gKr0ZtrYRwO2+rfLLlLsk/r554II2sg9zf0EMMhmb+VHX6+8fnBw?=
 =?iso-8859-1?Q?kdBB+tot246w32DXA/NDaWyQx0IwoH0DnVj50dMcmTIsWFp2zP930z1Q/9?=
 =?iso-8859-1?Q?sbvlBT9Cr0BH8N8gi1QttFqS9mfelD6BB7Tc8iQIsA6nhsYBVX8UsXncD/?=
 =?iso-8859-1?Q?pjKZUykQQR63oaExflCrdZ6QJnKI4FHUWxJZJxCqUDV98J/psyMI3oAGiR?=
 =?iso-8859-1?Q?IK/ExzDDtJ1rWpF6cqfZgkEOdIfSFGIsf9GsQiVCJGBLR9l0tv1kYkRdj6?=
 =?iso-8859-1?Q?gDKAilgFqPwo3dd3NFuE16AvIycbNYujMDbrqu+AapwWGhnJxYuk+9lBAm?=
 =?iso-8859-1?Q?96q9sEje20PecHNFjht77moS233BcsLX6n5ea6jTq/Ae2wcunntwFmvI4g?=
 =?iso-8859-1?Q?zq8C8U+sGyuA7V3CB4EarHN1kXlb3JYmlt3zs9fDVopNVhxGngoLMTDxNa?=
 =?iso-8859-1?Q?rnk3qhZVF5su6IiRk7AfOAUkfXiaYRCApwsI4fAflzcKFVQo6T71G6BA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4491a764-2a4d-443c-d8a3-08de2c7675f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 23:00:42.9615
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TiFgJgIym4GYEQsZ2vp7vTG2EfeF3pN3Ppksc4xN/JCf+QJklChD0YmY3ERV12P/VA3WhY4I+J6K0bEO+eStpq08DDU+FujAiQsOFAeeQIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9091

From: Grygorii Strashko <grygorii_strashko@epam.com>

Introduce separate HVM_SAVE_RESTORE config for HVM save/restore feature,
which is enabled by default for HVM and depends on MGMT_HYPERCALLS config.

This allows to make MGMT_HYPERCALLS specific changes more granular and, if
required, make HVM save/restore optional, selectable feature.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
I'd like to propose this patch as a replacement of Patch 19 [1]

[1] https://patchwork.kernel.org/project/xen-devel/patch/20251121105801.125=
1262-20-Penny.Zheng@amd.com/

 xen/arch/x86/cpu/mcheck/vmce.c       | 4 ++--
 xen/arch/x86/emul-i8254.c            | 4 +++-
 xen/arch/x86/hvm/Kconfig             | 6 ++++++
 xen/arch/x86/hvm/Makefile            | 2 +-
 xen/arch/x86/hvm/hpet.c              | 3 ++-
 xen/arch/x86/hvm/hvm.c               | 4 ++++
 xen/arch/x86/hvm/irq.c               | 2 ++
 xen/arch/x86/hvm/mtrr.c              | 2 ++
 xen/arch/x86/hvm/pmtimer.c           | 2 ++
 xen/arch/x86/hvm/rtc.c               | 2 ++
 xen/arch/x86/hvm/vioapic.c           | 2 ++
 xen/arch/x86/hvm/viridian/viridian.c | 2 ++
 xen/arch/x86/hvm/vlapic.c            | 3 ++-
 xen/arch/x86/hvm/vpic.c              | 2 ++
 xen/arch/x86/include/asm/hvm/save.h  | 5 ++++-
 15 files changed, 38 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/vmce.c b/xen/arch/x86/cpu/mcheck/vmce.=
c
index 1a7e92506ac8..ba27f6f8bd91 100644
--- a/xen/arch/x86/cpu/mcheck/vmce.c
+++ b/xen/arch/x86/cpu/mcheck/vmce.c
@@ -349,7 +349,7 @@ int vmce_wrmsr(uint32_t msr, uint64_t val)
     return ret;
 }
=20
-#if CONFIG_HVM
+#if defined(CONFIG_HVM_SAVE_RESTORE)
 static int cf_check vmce_save_vcpu_ctxt(struct vcpu *v, hvm_domain_context=
_t *h)
 {
     struct hvm_vmce_vcpu ctxt =3D {
@@ -380,10 +380,10 @@ static int cf_check vmce_load_vcpu_ctxt(struct domain=
 *d, hvm_domain_context_t *
=20
     return err ?: vmce_restore_vcpu(v, &ctxt);
 }
+#endif /* CONFIG_HVM_SAVE_RESTORE */
=20
 HVM_REGISTER_SAVE_RESTORE(VMCE_VCPU, vmce_save_vcpu_ctxt, NULL,
                           vmce_load_vcpu_ctxt, 1, HVMSR_PER_VCPU);
-#endif
=20
 /*
  * for Intel MCE, broadcast vMCE to all vcpus
diff --git a/xen/arch/x86/emul-i8254.c b/xen/arch/x86/emul-i8254.c
index f106ab794c4f..d33723fa32c6 100644
--- a/xen/arch/x86/emul-i8254.c
+++ b/xen/arch/x86/emul-i8254.c
@@ -409,7 +409,9 @@ void pit_stop_channel0_irq(PITState *pit)
     destroy_periodic_time(&pit->pt0);
     spin_unlock(&pit->lock);
 }
+#endif
=20
+#if defined(CONFIG_HVM_SAVE_RESTORE)
 static int cf_check pit_save(struct vcpu *v, hvm_domain_context_t *h)
 {
     struct domain *d =3D v->domain;
@@ -507,9 +509,9 @@ static int cf_check pit_load(struct domain *d, hvm_doma=
in_context_t *h)
=20
     return rc;
 }
+#endif /* CONFIG_HVM_SAVE_RESTORE */
=20
 HVM_REGISTER_SAVE_RESTORE(PIT, pit_save, pit_check, pit_load, 1, HVMSR_PER=
_DOM);
-#endif
=20
 /* The intercept action for PIT DM retval: 0--not handled; 1--handled. */
 static int cf_check handle_pit_io(
diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index 156deab29139..48c2e1e33469 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -93,4 +93,10 @@ config MEM_SHARING
 	depends on INTEL_VMX
 	depends on MGMT_HYPERCALLS
=20
+config HVM_SAVE_RESTORE
+	depends on MGMT_HYPERCALLS
+	def_bool y
+	help
+	  Enables HVM save/load functionality.
+
 endif
diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
index f34fb03934c0..f1602cc659ea 100644
--- a/xen/arch/x86/hvm/Makefile
+++ b/xen/arch/x86/hvm/Makefile
@@ -22,7 +22,7 @@ obj-y +=3D nestedhvm.o
 obj-y +=3D pmtimer.o
 obj-y +=3D quirks.o
 obj-y +=3D rtc.o
-obj-y +=3D save.o
+obj-$(CONFIG_HVM_SAVE_RESTORE) +=3D save.o
 obj-y +=3D stdvga.o
 obj-y +=3D vioapic.o
 obj-y +=3D vlapic.o
diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
index f0e5f877f4a1..7df8abfa348d 100644
--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -570,7 +570,7 @@ static const struct hvm_mmio_ops hpet_mmio_ops =3D {
     .write =3D hpet_write
 };
=20
-
+#if defined(CONFIG_HVM_SAVE_RESTORE)
 static int cf_check hpet_save(struct vcpu *v, hvm_domain_context_t *h)
 {
     const struct domain *d =3D v->domain;
@@ -691,6 +691,7 @@ static int cf_check hpet_load(struct domain *d, hvm_dom=
ain_context_t *h)
=20
     return 0;
 }
+#endif /* CONFIG_HVM_SAVE_RESTORE */
=20
 HVM_REGISTER_SAVE_RESTORE(HPET, hpet_save, NULL, hpet_load, 1, HVMSR_PER_D=
OM);
=20
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index b1e03bbb3bd3..832fca54f3a2 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -796,6 +796,7 @@ void hvm_domain_destroy(struct domain *d)
     destroy_vpci_mmcfg(d);
 }
=20
+#if defined(CONFIG_HVM_SAVE_RESTORE)
 static int cf_check hvm_save_tsc_adjust(struct vcpu *v, hvm_domain_context=
_t *h)
 {
     struct hvm_tsc_adjust ctxt =3D {
@@ -943,6 +944,7 @@ static int cf_check hvm_save_cpu_ctxt(struct vcpu *v, h=
vm_domain_context_t *h)
=20
     return hvm_save_entry(CPU, v->vcpu_id, h, &ctxt);
 }
+#endif /* CONFIG_HVM_SAVE_RESTORE */
=20
 /* Return a string indicating the error, or NULL for valid. */
 const char *hvm_efer_valid(const struct vcpu *v, uint64_t value,
@@ -1020,6 +1022,7 @@ unsigned long hvm_cr4_guest_valid_bits(const struct d=
omain *d)
             0);
 }
=20
+#if defined(CONFIG_HVM_SAVE_RESTORE)
 static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context=
_t *h)
 {
     const struct cpu_policy *p =3D d->arch.cpu_policy;
@@ -1602,6 +1605,7 @@ static int __init cf_check hvm_register_CPU_save_and_=
restore(void)
     return 0;
 }
 __initcall(hvm_register_CPU_save_and_restore);
+#endif /* CONFIG_HVM_SAVE_RESTORE */
=20
 static void cf_check hvm_assert_evtchn_irq_tasklet(void *v)
 {
diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index 5f643611130f..af5f2c83577e 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -649,6 +649,7 @@ static int __init cf_check dump_irq_info_key_init(void)
 }
 __initcall(dump_irq_info_key_init);
=20
+#if defined(CONFIG_HVM_SAVE_RESTORE)
 static int cf_check irq_save_pci(struct vcpu *v, hvm_domain_context_t *h)
 {
     struct domain *d =3D v->domain;
@@ -799,6 +800,7 @@ static int cf_check irq_load_link(struct domain *d, hvm=
_domain_context_t *h)
=20
     return 0;
 }
+#endif /* CONFIG_HVM_SAVE_RESTORE */
=20
 HVM_REGISTER_SAVE_RESTORE(PCI_IRQ, irq_save_pci, NULL, irq_load_pci,
                           1, HVMSR_PER_DOM);
diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
index e0bef8c82dc8..c5e83dd7a602 100644
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -695,6 +695,7 @@ int hvm_set_mem_pinned_cacheattr(struct domain *d, uint=
64_t gfn_start,
     return rc;
 }
=20
+#if defined(CONFIG_HVM_SAVE_RESTORE)
 static int cf_check hvm_save_mtrr_msr(struct vcpu *v, hvm_domain_context_t=
 *h)
 {
     const struct mtrr_state *m =3D &v->arch.hvm.mtrr;
@@ -782,6 +783,7 @@ static int cf_check hvm_load_mtrr_msr(struct domain *d,=
 hvm_domain_context_t *h)
=20
     return 0;
 }
+#endif /* CONFIG_HVM_SAVE_RESTORE */
=20
 HVM_REGISTER_SAVE_RESTORE(MTRR, hvm_save_mtrr_msr, NULL, hvm_load_mtrr_msr=
, 1,
                           HVMSR_PER_VCPU);
diff --git a/xen/arch/x86/hvm/pmtimer.c b/xen/arch/x86/hvm/pmtimer.c
index 87a7a01c9f52..86f85d381a20 100644
--- a/xen/arch/x86/hvm/pmtimer.c
+++ b/xen/arch/x86/hvm/pmtimer.c
@@ -240,6 +240,7 @@ static int cf_check handle_pmt_io(
     return X86EMUL_OKAY;
 }
=20
+#if defined(CONFIG_HVM_SAVE_RESTORE)
 static int cf_check acpi_save(struct vcpu *v, hvm_domain_context_t *h)
 {
     struct domain *d =3D v->domain;
@@ -300,6 +301,7 @@ static int cf_check acpi_load(struct domain *d, hvm_dom=
ain_context_t *h)
    =20
     return 0;
 }
+#endif /* CONFIG_HVM_SAVE_RESTORE */
=20
 HVM_REGISTER_SAVE_RESTORE(PMTIMER, acpi_save, NULL, acpi_load,
                           1, HVMSR_PER_DOM);
diff --git a/xen/arch/x86/hvm/rtc.c b/xen/arch/x86/hvm/rtc.c
index e33a8ec10821..a451cd2e6880 100644
--- a/xen/arch/x86/hvm/rtc.c
+++ b/xen/arch/x86/hvm/rtc.c
@@ -742,6 +742,7 @@ void rtc_migrate_timers(struct vcpu *v)
     }
 }
=20
+#if defined(CONFIG_HVM_SAVE_RESTORE)
 /* Save RTC hardware state */
 static int cf_check rtc_save(struct vcpu *v, hvm_domain_context_t *h)
 {
@@ -797,6 +798,7 @@ static int cf_check rtc_load(struct domain *d, hvm_doma=
in_context_t *h)
=20
     return 0;
 }
+#endif /* CONFIG_HVM_SAVE_RESTORE */
=20
 HVM_REGISTER_SAVE_RESTORE(RTC, rtc_save, NULL, rtc_load, 1, HVMSR_PER_DOM)=
;
=20
diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 7c725f9e471f..5fad31074288 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -594,6 +594,7 @@ int vioapic_get_trigger_mode(const struct domain *d, un=
signed int gsi)
     return vioapic->redirtbl[pin].fields.trig_mode;
 }
=20
+#if defined(CONFIG_HVM_SAVE_RESTORE)
 static int cf_check ioapic_save(struct vcpu *v, hvm_domain_context_t *h)
 {
     const struct domain *d =3D v->domain;
@@ -629,6 +630,7 @@ static int cf_check ioapic_load(struct domain *d, hvm_d=
omain_context_t *h)
=20
     return 0;
 }
+#endif /* CONFIG_HVM_SAVE_RESTORE */
=20
 HVM_REGISTER_SAVE_RESTORE(IOAPIC, ioapic_save, NULL, ioapic_load, 1,
                           HVMSR_PER_DOM);
diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridi=
an/viridian.c
index 90e749ceb581..ab2a7078515c 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -1092,6 +1092,7 @@ void viridian_unmap_guest_page(struct viridian_page *=
vp)
     put_page_and_type(page);
 }
=20
+#if defined(CONFIG_HVM_SAVE_RESTORE)
 static int cf_check viridian_save_domain_ctxt(
     struct vcpu *v, hvm_domain_context_t *h)
 {
@@ -1171,6 +1172,7 @@ static int cf_check viridian_load_vcpu_ctxt(
=20
     return 0;
 }
+#endif /* CONFIG_HVM_SAVE_RESTORE */
=20
 HVM_REGISTER_SAVE_RESTORE(VIRIDIAN_VCPU, viridian_save_vcpu_ctxt, NULL,
                           viridian_load_vcpu_ctxt, 1, HVMSR_PER_VCPU);
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 79697487ba90..ea7d186ff1ea 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1481,6 +1481,7 @@ void vlapic_reset(struct vlapic *vlapic)
     vlapic_do_init(vlapic);
 }
=20
+#if defined(CONFIG_HVM_SAVE_RESTORE)
 /* rearm the actimer if needed, after a HVM restore */
 static void lapic_rearm(struct vlapic *s)
 {
@@ -1578,7 +1579,6 @@ static void lapic_load_fixup(struct vlapic *vlapic)
                v, vlapic->loaded.id, vlapic->loaded.ldr, good_ldr);
 }
=20
-
 static int lapic_check_common(const struct domain *d, unsigned int vcpuid)
 {
     if ( !has_vlapic(d) )
@@ -1675,6 +1675,7 @@ static int cf_check lapic_load_regs(struct domain *d,=
 hvm_domain_context_t *h)
     lapic_rearm(s);
     return 0;
 }
+#endif /* CONFIG_HVM_SAVE_RESTORE */
=20
 HVM_REGISTER_SAVE_RESTORE(LAPIC, lapic_save_hidden, lapic_check_hidden,
                           lapic_load_hidden, 1, HVMSR_PER_VCPU);
diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
index 30ce367c082d..af49c372f502 100644
--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -402,6 +402,7 @@ static int cf_check vpic_intercept_elcr_io(
     return X86EMUL_OKAY;
 }
=20
+#if defined(CONFIG_HVM_SAVE_RESTORE)
 static int cf_check vpic_save(struct vcpu *v, hvm_domain_context_t *h)
 {
     struct domain *d =3D v->domain;
@@ -475,6 +476,7 @@ static int cf_check vpic_load(struct domain *d, hvm_dom=
ain_context_t *h)
=20
     return 0;
 }
+#endif /* CONFIG_HVM_SAVE_RESTORE */
=20
 HVM_REGISTER_SAVE_RESTORE(PIC, vpic_save, vpic_check, vpic_load, 2,
                           HVMSR_PER_DOM);
diff --git a/xen/arch/x86/include/asm/hvm/save.h b/xen/arch/x86/include/asm=
/hvm/save.h
index ec8de029319d..501a6cfb214a 100644
--- a/xen/arch/x86/include/asm/hvm/save.h
+++ b/xen/arch/x86/include/asm/hvm/save.h
@@ -123,6 +123,7 @@ void hvm_register_savevm(uint16_t typecode,
=20
 /* Syntactic sugar around that function: specify the max number of
  * saves, and this calculates the size of buffer needed */
+#ifdef CONFIG_HVM_SAVE_RESTORE
 #define HVM_REGISTER_SAVE_RESTORE(_x, _save, check, _load, _num, _k)      =
\
 static int __init cf_check __hvm_register_##_x##_save_and_restore(void)   =
\
 {                                                                         =
\
@@ -137,7 +138,9 @@ static int __init cf_check __hvm_register_##_x##_save_a=
nd_restore(void)   \
     return 0;                                                             =
\
 }                                                                         =
\
 __initcall(__hvm_register_##_x##_save_and_restore);
-
+#else
+#define HVM_REGISTER_SAVE_RESTORE(_x, _save, check, _load, _num, _k)
+#endif
=20
 /* Entry points for saving and restoring HVM domain state */
 size_t hvm_save_size(struct domain *d);
--=20
2.34.1

