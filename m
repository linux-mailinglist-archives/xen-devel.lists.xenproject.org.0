Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC32C27007
	for <lists+xen-devel@lfdr.de>; Fri, 31 Oct 2025 22:21:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154532.1484482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEwXj-0000nM-TH; Fri, 31 Oct 2025 21:20:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154532.1484482; Fri, 31 Oct 2025 21:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEwXj-0000kf-QH; Fri, 31 Oct 2025 21:20:19 +0000
Received: by outflank-mailman (input) for mailman id 1154532;
 Fri, 31 Oct 2025 21:20:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r2XW=5I=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vEwXi-0000kZ-Qg
 for xen-devel@lists.xenproject.org; Fri, 31 Oct 2025 21:20:19 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62ace40c-b69f-11f0-980a-7dc792cee155;
 Fri, 31 Oct 2025 22:20:13 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by GVXPR03MB11113.eurprd03.prod.outlook.com (2603:10a6:150:2a9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 21:20:06 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 21:20:06 +0000
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
X-Inumbo-ID: 62ace40c-b69f-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bs2e3m9KZ6qJiE0MH0volGCGCWFK/iVbomXoac+RiNer5pQabOWOPw/5tfNtxhovj8sZwFo9fY2i97LESk8BiQT1bjVf8V9Fyyw/QSGIUzUHLfaj8gBm7zk69Tu6RpPPIeiMHN1+zXz8Tl2a12osOhEsq97x8ZoLo+753QwW7AvvG82aeSGdLyPlhCyA9bVr5szErRInyjbKkeTFdkmZtO86Fq4Sjrh3bhxrBOwMKCyaSDDM5vdGMfbF77XMfqHQDBrpsg/zXAkLcLAn5M9xNSb0gV160Ni6bAqbYe8DmnPo5OdUh6eUrIrlyOXr6MXYMmjszDYTEZG9/PyV3IELmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4+O1uPqbVv87cfYS6FF/l2EvUXSzHEpBUeZpT6ubcc=;
 b=hVAV//rkBm+6svPN0jQMyyFYhHsPN/hR1/l96Z6HNGi9dyEI/iZYT1pko5ygy4GiPkkRodPoeBrdiPAClYc8KsYiJc7Q+QQaz8zP16aBbiGuBRXlrxHS6htkZy93JJIMuE8mrnEchQsEGiWfhoNNBBzlmP749HDFQD2HYDiYTguMbPH2BmcVo+zVZ5OG6NZ9xZm3uXEzt8/k6fUTxpyzIdsS4hiXrOYtlSgaf7ntsmreKXOYz6rLr6XNPyOwMExn0Y3L7lYAeuXFiS2lGWz2acdKoQtyz2f7N90K4L/x6rLrWlJrZKDxJ66vayHP7JZco0Q9TCFZWFjhVr0KyANIeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4+O1uPqbVv87cfYS6FF/l2EvUXSzHEpBUeZpT6ubcc=;
 b=us9TSWSUt0wFUagkAGs1/n0WLQkXDdYdY643/j6vcarADVNZpmvh4efqfDKgjppKBetuyNqqYefuEAjfqnFJnoo+jwRcSdCzQ9cx7d+dDhRaC8eDWR+qOBdQtb7BuftQx8zEU4FVC+dYXAF487Vj3nwT3XSgg3hTLsT87klJsCuJz+P+5k+Zxc9p93IXxYgKKSumgfaxy2fkXj9NkQ41bjCxaMvpXZCQoDEmJ3WM8uJ9jCTSmppkGv+e0v4U3EizF9VKhb2RiGMGW6am/RjFlVg6EOgyR88eET4FFG8XyEzgT+oksm0WpPIaCSfnUY0sBuClgzQfXn1KBZbUcTdahw==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Tamas K
 Lengyel <tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>, Penny Zheng
	<Penny.Zheng@amd.com>
Subject: [XEN][PATCH] xen: make VMTRACE support optional
Thread-Topic: [XEN][PATCH] xen: make VMTRACE support optional
Thread-Index: AQHcSqwhtyHzg01iHka3JeM7CuPAbQ==
Date: Fri, 31 Oct 2025 21:20:06 +0000
Message-ID: <20251031212005.1338212-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|GVXPR03MB11113:EE_
x-ms-office365-filtering-correlation-id: ed0230ae-fa40-432b-54c4-08de18c343aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?fNjNZ/yxJegTIKsWw00ovYQ09YmReWy0BmH1xhuRwetckfEMD4osw4Goce?=
 =?iso-8859-1?Q?SbnUne5SYkuGO3mzF44vNZidu9BQmDNIV48m7zx1srHel25/p5fz/aCIsH?=
 =?iso-8859-1?Q?ILeAzWDhXxqKtZfG4H55UQavqq5sxmo9WtZ2b4CTx5GxQLuZPBYp88mNFS?=
 =?iso-8859-1?Q?cHUk7zVZX+eKhL6QBy6Q/S0zmqKp1xFO5Q7K7CBrOMiW6l6uyMxfNHy9uc?=
 =?iso-8859-1?Q?5hjKlvkddg2zcjLv8VkV9SB7joYbI+CFA1bMb69exXdqFSLz/biteRgbXu?=
 =?iso-8859-1?Q?an24G9nU1YCkK7SZMDtAIGMHcqj5qkt58dymcV56RQ6104ay7z3JSIVamU?=
 =?iso-8859-1?Q?flwMKZMncO4lPaLI5xFyGdUgJnJ1bfm8t+GnByniJm3z1AaCxNEPQCpW00?=
 =?iso-8859-1?Q?X+2t8J4Z3hZ+Bjtp6CySyKEL0OD6tkI547JpO3AZCdPMmWh1hqATNwkh5x?=
 =?iso-8859-1?Q?ruCDijfqotBY5XA9eteYCxfY3ptK6CQMS99fppWIKG0ltrjSYEcJw6tPCW?=
 =?iso-8859-1?Q?0GgiFlKh1JorCf9RPspURFi1BBGuX5cMDPHNttXv2uJ+PQVa3pnS62XtCZ?=
 =?iso-8859-1?Q?snqtVTBQ3vBXO0sKSnNojXegLn+iAn06CIvrqOJtmmLcuz/3OYbupINAAN?=
 =?iso-8859-1?Q?qRmaOL0+GI4JtmDK29XxDs7daqYXgKRF2kqGgr4Mr6SyT+vKTGpacZvkwo?=
 =?iso-8859-1?Q?FlGnq7tHnt1R6TyFuFfhfOOWSmxGq+JU+za/rb0/1FP39Iej4tTrRBbPh/?=
 =?iso-8859-1?Q?2EzdOzVP5vR5u62CZXlR7EnRwN3vw47OcNBQwOluH3wsIctoUBBFYF1oHp?=
 =?iso-8859-1?Q?e+YpIlXXg1ZRwf+rAS3UXI3vgjG0c3TT/qNANAVSYJ2N6Huvx4Fq0Ngzez?=
 =?iso-8859-1?Q?KSDApPpCIrm1p677E8TzHm4Y0KmGICs30gkqg2bTOJx1K24qOA90Fl/hbp?=
 =?iso-8859-1?Q?/pUQTn4BkR6AgVrUFiofHoL3U79gzQRcscwKiSE7UjFZIakB2rIA41FHz3?=
 =?iso-8859-1?Q?+XYjSg7WAlzY472wibbx4iLZjF1LQbG1/IfBufeTTS+KzIrH7QtVbmDiie?=
 =?iso-8859-1?Q?jFBXt0eaxhdsO7gfY5LWQH1tzMBFLIG2K1VNRb/YG2xeinRcs54nPPWEDL?=
 =?iso-8859-1?Q?DB4pvdglWm1wnVbMz8M9VTO7kBg5IW+B9eEzFX+p0DC9iENY8mYxPaNeFF?=
 =?iso-8859-1?Q?bFspgl4euc+9bUBmPgSL8/3FSzRId7PDkOWTgokdwO18RzKSFdRWB+57Jz?=
 =?iso-8859-1?Q?cbkMYdVZ4fxm0+B2tKiS4P5JNcOHTmne2VMUXAUZCkp8A0DbYdVfKyNYJm?=
 =?iso-8859-1?Q?5/XSwR4qKGYOCuhsoayNY5ovbJFGQZJvbBUeap9exbW36fSn05xyEC5v2D?=
 =?iso-8859-1?Q?eyULR5QfZ3a8bWp9w2k3X6LQHIYdxSF6j9sPL7PnOVQFQXYeIvyr/bxzqy?=
 =?iso-8859-1?Q?BZH5MDv2M0CgMQbTRHhNgOg1v9VvmNN9GViSdg9EPwM+xEIPLdph6ylK0z?=
 =?iso-8859-1?Q?LP5LLoK7D6FcqeALuG+WuT/aEcsH1i2KC0cKe1D1qYrub9eVfmXQEW7BIi?=
 =?iso-8859-1?Q?L0mZsUjyWOOYAXbLHeebcsANIaGH?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?BsRAMe9Dhh+XColNlVZiSRXumsiGFtMI5Xz06jXucM9vU3GDKALf2xZp/p?=
 =?iso-8859-1?Q?mQKzLorqWaJQ60gR7tQQ0C7tBEcLqYjpStVySORCyTkLNMuIV/F2sr0naP?=
 =?iso-8859-1?Q?s/d5C9BgqrybYSHn9wxH/cnG4G/APwhkul3N/3jteKrMnF1ks7J1z2kYtD?=
 =?iso-8859-1?Q?fw5Al+GW0bkjSWVJKKF+iCliWGPpSPTWFf2tcfsQ2HahP51veTW0sf4q9s?=
 =?iso-8859-1?Q?oDW/hgWxu3C8TjzOWq2dI6bxbs1iVq680I9z00eGj9mm0EQ9wWnnQiKD4I?=
 =?iso-8859-1?Q?G5QaKeVoRZnCAWoAoN5bRbTn6RKMxsD1fyNS0pRwRJGNMSdeGxA0tvR86h?=
 =?iso-8859-1?Q?mpB5ZL7exdZtJKU/ak3Z5WzbLq+040wiukFTQRUvYIj1Zk+VR+8D/k9dmh?=
 =?iso-8859-1?Q?TsCOsjVcucNKU8u/3Ogm6kX5fanXbFFX8S6IrSqLpUfWtkLzMmG2XA8kSe?=
 =?iso-8859-1?Q?rqXn27RgDAZgMU/7rZnYTRU4NCluS9IDzq1kgAjgNqrUwmWZ8QpuOYUtkY?=
 =?iso-8859-1?Q?v1dI7O09c2lnttPil5SW1uy2us8ErNtpUIt2H5ETwPMdCn2BBexnvnBHpt?=
 =?iso-8859-1?Q?uDURaRgl6OJ5XawNWNPmxs20chjjLbex/pSdID+7NskzF9x8584vgzEyr2?=
 =?iso-8859-1?Q?OnDzuO9u4DIZxUF1DFoYNBtWmO/C9qwmtptV6FozLPoYXhhui+aa+fmHuE?=
 =?iso-8859-1?Q?B7HjsgWdCv3HsG1d6dCbXQtsYCCzlL4nJlZCYr0madzoctdGlcZPq8XDHX?=
 =?iso-8859-1?Q?/wj0m9zCrYnrA7C4jLaJBB9sDGHCxRl80cUMsnbE3wWK4cfPga9pdiU67D?=
 =?iso-8859-1?Q?FDUNKa1gOtDmgA2jdOQKfIYvKv+dJTLtQ041OQpTb6dyH5/66TYIyFzEeN?=
 =?iso-8859-1?Q?04+ZHKCBNUtRZsDfaLCknytFi2/Z8sE3UQf+tFygXBvZK5InipSWIBh9d9?=
 =?iso-8859-1?Q?9qo5sLl/SfgCYd/c8D2Ih3QPAqMZk72SuRYu/kywSnwwAnbZ9D7xi2PF96?=
 =?iso-8859-1?Q?n1fLfeoBPUpOoRIP3PnYIRq9442Klfylh5DtulGFpiXxQzLs5SIdrD4BwE?=
 =?iso-8859-1?Q?LPKqyk23TsaQThLXQBE+ktBM4bxNiBKfulsmaac8u41T6kWIOGxg3NxJij?=
 =?iso-8859-1?Q?z3ks4lI1WpcWQxPRSGvC6ZrM1ephXqwjLbghXFx1yRFKIuqebUoKrYHxAJ?=
 =?iso-8859-1?Q?afDILMb7+/N1FGC+Hmj7td0El7sbAtKubvIJHp2vwgCimnbzJgfnAfQEOf?=
 =?iso-8859-1?Q?pVGfCmo9YwD6KrGXA4atG9Jboq94FGnmhGnjfiKaKGaPJrpd9vBVqBt1NT?=
 =?iso-8859-1?Q?Ppq3uzcNhDn6jLav1IMI8oWfUp2YFSbYr/MxnBvOhToCGiW27GIZ4+T5Tq?=
 =?iso-8859-1?Q?KeBZ0lRED+uRJ1OSjarAAJ9iPLTVchslbV97NIcrURwklOQfPwWAor1xqo?=
 =?iso-8859-1?Q?9lax4O/nLXsmRCZX++BHgw3TDVqtHGbY6iD4I/SzSiKhEHe95wP3JxHcPU?=
 =?iso-8859-1?Q?KNuQJWsmYhcJSMhuTGrCuSDSbjWZCw+zzcxMXAOYcmNkn3MyLjDhDhwRiK?=
 =?iso-8859-1?Q?AcUfK3U753vNkoC5XHB+16qaBZUjU0VOFmi5TuopJ6VKp4ZiK781/ggZQI?=
 =?iso-8859-1?Q?n/HEhduSQ54PQimXmylv9zOolJU/XSOD1jT6dKconorvcd6ocK/fmm6A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed0230ae-fa40-432b-54c4-08de18c343aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2025 21:20:06.6077
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NFqmsrdRz17hPGd0oXIcQAYj0Ipl03h9sH/MwkuEEvfg8dPmPwx9QM9DWIUjv7jTpg4MuN7Biz/IaOWqw7Vf2aA0dJvZEo4v8hgL0C7ipQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB11113

From: Grygorii Strashko <grygorii_strashko@epam.com>

The VMTRACE feature depends on Platform/Arch HW and code support and now
can be used only on x86 HVM with Intel VT-x (INTEL_VMX) enabled.
This makes VMTRACE support optional by introducing two Kconfig options:
- CONFIG_HAS_VMTRACE which allows Platform/Arch to advertise VMTRACE
support readiness
- CONFIG_VMTRACE to enable/disable the feature.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
Based on top of patch "domain: adjust soft-reset arch dependency" [1]

[1] https://patchwork.kernel.org/project/xen-devel/patch/c9c8c9c6-a155-4986=
-bf77-5766cdcd6024@suse.com/

 xen/Kconfig.debug                       | 15 +++++++++++++++
 xen/arch/x86/domctl.c                   |  4 ++++
 xen/arch/x86/hvm/Kconfig                |  1 +
 xen/arch/x86/hvm/vmx/vmcs.c             |  2 ++
 xen/arch/x86/hvm/vmx/vmx.c              | 10 ++++++++++
 xen/arch/x86/include/asm/guest-msr.h    |  2 ++
 xen/arch/x86/include/asm/hvm/hvm.h      |  9 +++++++++
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  2 ++
 xen/arch/x86/mm/mem_sharing.c           |  2 ++
 xen/arch/x86/vm_event.c                 |  6 ++++--
 xen/common/domain.c                     | 10 ++++++++++
 xen/common/memory.c                     |  6 ++++++
 xen/common/vm_event.c                   |  3 ++-
 xen/include/xen/domain.h                |  4 ++++
 xen/include/xen/sched.h                 |  4 ++++
 15 files changed, 77 insertions(+), 3 deletions(-)

diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index d900d926c555..70ec4f0d14a5 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -155,4 +155,19 @@ config DEBUG_INFO
 	  "make install-xen" for installing xen.efi, stripping needs to be
 	  done outside the Xen build environment).
=20
+config HAS_VMTRACE
+    bool
+
+config VMTRACE
+    bool "HW VM tracing support"
+    depends on HAS_VMTRACE
+    default y
+    help
+      Enables HW VM tracing support which allows to configure HW processor
+      features (vmtrace_op) to enable capturing information about software
+      execution using dedicated hardware facilities with minimal interfere=
nce
+      to the software being traced. The trace date can be retrieved using =
buffer
+      shared between Xen and domain
+      (see XENMEM_acquire_resource(XENMEM_resource_vmtrace_buf)).
+
 endmenu
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 6153e3c07e2d..d9521808dcba 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -154,6 +154,7 @@ void arch_get_domain_info(const struct domain *d,
 static int do_vmtrace_op(struct domain *d, struct xen_domctl_vmtrace_op *o=
p,
                          XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 {
+#ifdef CONFIG_VMTRACE
     struct vcpu *v;
     int rc;
=20
@@ -198,6 +199,9 @@ static int do_vmtrace_op(struct domain *d, struct xen_d=
omctl_vmtrace_op *op,
     vcpu_unpause(v);
=20
     return rc;
+#else
+    return -EOPNOTSUPP;
+#endif
 }
=20
 #define MAX_IOPORTS 0x10000
diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index c1a131d1851a..c017a77fffe0 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -29,6 +29,7 @@ config INTEL_VMX
 	bool "Intel VT-x" if EXPERT
 	default INTEL
 	select ARCH_VCPU_IOREQ_COMPLETION
+	select HAS_VMTRACE
 	help
 	  Enables virtual machine extensions on platforms that implement the
 	  Intel Virtualization Technology (Intel VT-x).
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index ab8b1c87ec0f..3728a9140223 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -300,6 +300,7 @@ static int vmx_init_vmcs_config(bool bsp)
     rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
=20
     /* Check whether IPT is supported in VMX operation. */
+#ifdef CONFIG_VMTRACE
     if ( bsp )
         vmtrace_available =3D cpu_has_proc_trace &&
                             (_vmx_misc_cap & VMX_MISC_PROC_TRACE);
@@ -310,6 +311,7 @@ static int vmx_init_vmcs_config(bool bsp)
                smp_processor_id());
         return -EINVAL;
     }
+#endif
=20
     if ( caps.cpu_based_exec_control & CPU_BASED_ACTIVATE_SECONDARY_CONTRO=
LS )
     {
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index b65981077295..f1588cd90b2d 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -622,6 +622,7 @@ static void cf_check domain_creation_finished(struct do=
main *d)
=20
 static void vmx_init_ipt(struct vcpu *v)
 {
+#ifdef CONFIG_VMTRACE
     unsigned int size =3D v->domain->vmtrace_size;
=20
     if ( !size )
@@ -632,6 +633,7 @@ static void vmx_init_ipt(struct vcpu *v)
     ASSERT(size >=3D PAGE_SIZE && (size & (size - 1)) =3D=3D 0);
=20
     v->arch.msrs->rtit.output_limit =3D size - 1;
+#endif
 }
=20
 static int cf_check vmx_vcpu_initialise(struct vcpu *v)
@@ -724,11 +726,13 @@ static void vmx_save_guest_msrs(struct vcpu *v)
      */
     v->arch.hvm.vmx.shadow_gs =3D read_gs_shadow();
=20
+#ifdef CONFIG_VMTRACE
     if ( v->arch.hvm.vmx.ipt_active )
     {
         rdmsrl(MSR_RTIT_OUTPUT_MASK, msrs->rtit.output_mask);
         rdmsrl(MSR_RTIT_STATUS, msrs->rtit.status);
     }
+#endif
=20
     if ( cp->feat.pks )
         msrs->pkrs =3D rdpkrs_and_cache();
@@ -747,12 +751,14 @@ static void vmx_restore_guest_msrs(struct vcpu *v)
     if ( cpu_has_msr_tsc_aux )
         wrmsr_tsc_aux(msrs->tsc_aux);
=20
+#ifdef CONFIG_VMTRACE
     if ( v->arch.hvm.vmx.ipt_active )
     {
         wrmsrl(MSR_RTIT_OUTPUT_BASE, page_to_maddr(v->vmtrace.pg));
         wrmsrl(MSR_RTIT_OUTPUT_MASK, msrs->rtit.output_mask);
         wrmsrl(MSR_RTIT_STATUS, msrs->rtit.status);
     }
+#endif
=20
     if ( cp->feat.pks )
         wrpkrs(msrs->pkrs);
@@ -2626,6 +2632,7 @@ static bool cf_check vmx_get_pending_event(
     return true;
 }
=20
+#ifdef CONFIG_VMTRACE
 /*
  * We only let vmtrace agents see and modify a subset of bits in MSR_RTIT_=
CTL.
  * These all pertain to data-emitted into the trace buffer(s).  Must not
@@ -2768,6 +2775,7 @@ static int cf_check vmtrace_reset(struct vcpu *v)
     v->arch.msrs->rtit.status =3D 0;
     return 0;
 }
+#endif
=20
 static uint64_t cf_check vmx_get_reg(struct vcpu *v, unsigned int reg)
 {
@@ -2940,11 +2948,13 @@ static struct hvm_function_table __initdata_cf_clob=
ber vmx_function_table =3D {
     .altp2m_vcpu_emulate_ve =3D vmx_vcpu_emulate_ve,
     .altp2m_vcpu_emulate_vmfunc =3D vmx_vcpu_emulate_vmfunc,
 #endif
+#ifdef CONFIG_VMTRACE
     .vmtrace_control =3D vmtrace_control,
     .vmtrace_output_position =3D vmtrace_output_position,
     .vmtrace_set_option =3D vmtrace_set_option,
     .vmtrace_get_option =3D vmtrace_get_option,
     .vmtrace_reset =3D vmtrace_reset,
+#endif
=20
     .get_reg =3D vmx_get_reg,
     .set_reg =3D vmx_set_reg,
diff --git a/xen/arch/x86/include/asm/guest-msr.h b/xen/arch/x86/include/as=
m/guest-msr.h
index 5f0cb0a93995..702f47fe1e16 100644
--- a/xen/arch/x86/include/asm/guest-msr.h
+++ b/xen/arch/x86/include/asm/guest-msr.h
@@ -50,6 +50,7 @@ struct vcpu_msrs
         };
     } misc_features_enables;
=20
+#ifdef CONFIG_VMTRACE
     /*
      * 0x00000560 ... 57x - MSR_RTIT_*
      *
@@ -81,6 +82,7 @@ struct vcpu_msrs
             };
         };
     } rtit;
+#endif
=20
     /*
      * 0x000006e1 - MSR_PKRS - Protection Key Supervisor.
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/=
hvm/hvm.h
index 7412256a2dab..728b9624522f 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -234,12 +234,14 @@ struct hvm_function_table {
     int (*altp2m_vcpu_emulate_vmfunc)(const struct cpu_user_regs *regs);
 #endif
=20
+#ifdef CONFIG_VMTRACE
     /* vmtrace */
     int (*vmtrace_control)(struct vcpu *v, bool enable, bool reset);
     int (*vmtrace_output_position)(struct vcpu *v, uint64_t *pos);
     int (*vmtrace_set_option)(struct vcpu *v, uint64_t key, uint64_t value=
);
     int (*vmtrace_get_option)(struct vcpu *v, uint64_t key, uint64_t *valu=
e);
     int (*vmtrace_reset)(struct vcpu *v);
+#endif
=20
     uint64_t (*get_reg)(struct vcpu *v, unsigned int reg);
     void (*set_reg)(struct vcpu *v, unsigned int reg, uint64_t val);
@@ -738,6 +740,7 @@ static inline bool altp2m_vcpu_emulate_ve(struct vcpu *=
v)
 bool altp2m_vcpu_emulate_ve(struct vcpu *v);
 #endif /* CONFIG_ALTP2M */
=20
+#ifdef CONFIG_VMTRACE
 static inline int hvm_vmtrace_control(struct vcpu *v, bool enable, bool re=
set)
 {
     if ( hvm_funcs.vmtrace_control )
@@ -780,6 +783,12 @@ static inline int hvm_vmtrace_reset(struct vcpu *v)
=20
     return -EOPNOTSUPP;
 }
+#else
+static inline int hvm_vmtrace_reset(struct vcpu *v)
+{
+    return 0;
+}
+#endif
=20
 /*
  * Accessors for registers which have per-guest-type or per-vendor locatio=
ns
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include=
/asm/hvm/vmx/vmcs.h
index 8ff7c8045fc6..d28a2682e9df 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -155,7 +155,9 @@ struct vmx_vcpu {
     bool                 ept_spurious_misconfig;
=20
     /* Processor Trace configured and enabled for the vcpu. */
+#ifdef CONFIG_VMTRACE
     bool                 ipt_active;
+#endif
=20
     /* Is the guest in real mode? */
     uint8_t              vmx_realmode;
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 4787b2796479..074f1b2562b3 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1888,7 +1888,9 @@ static int fork(struct domain *cd, struct domain *d)
         domain_pause(d);
         cd->max_pages =3D d->max_pages;
         *cd->arch.cpu_policy =3D *d->arch.cpu_policy;
+#ifdef CONFIG_VMTRACE
         cd->vmtrace_size =3D d->vmtrace_size;
+#endif
         cd->parent =3D d;
     }
=20
diff --git a/xen/arch/x86/vm_event.c b/xen/arch/x86/vm_event.c
index fc349270b9c5..f4c8696ce54e 100644
--- a/xen/arch/x86/vm_event.c
+++ b/xen/arch/x86/vm_event.c
@@ -253,7 +253,9 @@ void vm_event_fill_regs(vm_event_request_t *req)
     req->data.regs.x86.shadow_gs =3D ctxt.shadow_gs;
     req->data.regs.x86.dr6 =3D ctxt.dr6;
=20
+#ifdef CONFIG_VMTRACE
     if ( hvm_vmtrace_output_position(curr, &req->data.regs.x86.vmtrace_pos=
) !=3D 1 )
+#endif
         req->data.regs.x86.vmtrace_pos =3D ~0;
 #endif
 }
@@ -303,12 +305,12 @@ void vm_event_emulate_check(struct vcpu *v, vm_event_=
response_t *rsp)
 #endif
 }
=20
+#ifdef CONFIG_VMTRACE
 void vm_event_reset_vmtrace(struct vcpu *v)
 {
-#ifdef CONFIG_HVM
     hvm_vmtrace_reset(v);
-#endif
 }
+#endif
=20
 /*
  * Local variables:
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 7dcd466e5a12..2be6ee03d004 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -136,7 +136,9 @@ struct vcpu *idle_vcpu[NR_CPUS] __read_mostly;
=20
 vcpu_info_t dummy_vcpu_info;
=20
+#ifdef CONFIG_VMTRACE
 bool __read_mostly vmtrace_available;
+#endif
=20
 bool __read_mostly vpmu_is_available;
=20
@@ -318,6 +320,7 @@ static void vcpu_info_reset(struct vcpu *v)
=20
 static void vmtrace_free_buffer(struct vcpu *v)
 {
+#ifdef CONFIG_VMTRACE
     const struct domain *d =3D v->domain;
     struct page_info *pg =3D v->vmtrace.pg;
     unsigned int i;
@@ -332,10 +335,12 @@ static void vmtrace_free_buffer(struct vcpu *v)
         put_page_alloc_ref(&pg[i]);
         put_page_and_type(&pg[i]);
     }
+#endif
 }
=20
 static int vmtrace_alloc_buffer(struct vcpu *v)
 {
+#ifdef CONFIG_VMTRACE
     struct domain *d =3D v->domain;
     struct page_info *pg;
     unsigned int i;
@@ -377,6 +382,9 @@ static int vmtrace_alloc_buffer(struct vcpu *v)
     }
=20
     return -ENODATA;
+#else
+    return 0;
+#endif
 }
=20
 /*
@@ -825,7 +833,9 @@ struct domain *domain_create(domid_t domid,
         ASSERT(!config->altp2m.nr);
 #endif
=20
+#ifdef CONFIG_VMTRACE
         d->vmtrace_size =3D config->vmtrace_size;
+#endif
     }
=20
     /* Sort out our idea of is_control_domain(). */
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 3688e6dd5032..66dc7f7a0a41 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1155,8 +1155,10 @@ static unsigned int resource_max_frames(const struct=
 domain *d,
     case XENMEM_resource_ioreq_server:
         return ioreq_server_max_frames(d);
=20
+#ifdef CONFIG_VMTRACE
     case XENMEM_resource_vmtrace_buf:
         return d->vmtrace_size >> PAGE_SHIFT;
+#endif
=20
     default:
         return 0;
@@ -1198,6 +1200,7 @@ static int acquire_ioreq_server(struct domain *d,
 #endif
 }
=20
+#ifdef CONFIG_VMTRACE
 static int acquire_vmtrace_buf(
     struct domain *d, unsigned int id, unsigned int frame,
     unsigned int nr_frames, xen_pfn_t mfn_list[])
@@ -1220,6 +1223,7 @@ static int acquire_vmtrace_buf(
=20
     return nr_frames;
 }
+#endif
=20
 /*
  * Returns -errno on error, or positive in the range [1, nr_frames] on
@@ -1238,8 +1242,10 @@ static int _acquire_resource(
     case XENMEM_resource_ioreq_server:
         return acquire_ioreq_server(d, id, frame, nr_frames, mfn_list);
=20
+#ifdef CONFIG_VMTRACE
     case XENMEM_resource_vmtrace_buf:
         return acquire_vmtrace_buf(d, id, frame, nr_frames, mfn_list);
+#endif
=20
     default:
         ASSERT_UNREACHABLE();
diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
index b2787c010890..cf0258223f50 100644
--- a/xen/common/vm_event.c
+++ b/xen/common/vm_event.c
@@ -441,7 +441,8 @@ static int vm_event_resume(struct domain *d, struct vm_=
event_domain *ved)
             if ( rsp.flags & VM_EVENT_FLAG_GET_NEXT_INTERRUPT )
                 vm_event_monitor_next_interrupt(v);
=20
-            if ( rsp.flags & VM_EVENT_FLAG_RESET_VMTRACE )
+            if ( IS_ENABLED(CONFIG_VMTRACE) &&
+                 (rsp.flags & VM_EVENT_FLAG_RESET_VMTRACE) )
                 vm_event_reset_vmtrace(v);
=20
             if ( rsp.flags & VM_EVENT_FLAG_VCPU_PAUSED )
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 8aab05ae93c8..aa86a9f46022 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -191,7 +191,11 @@ void vnuma_destroy(struct vnuma_info *vnuma);
 static inline void vnuma_destroy(struct vnuma_info *vnuma) { ASSERT(!vnuma=
); }
 #endif
=20
+#ifdef CONFIG_VMTRACE
 extern bool vmtrace_available;
+#else
+#define vmtrace_available false
+#endif
=20
 extern bool vpmu_is_available;
=20
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 02bdc256ce37..dcd8647e0d36 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -300,9 +300,11 @@ struct vcpu
     /* vPCI per-vCPU area, used to store data for long running operations.=
 */
     struct vpci_vcpu vpci;
=20
+#ifdef CONFIG_VMTRACE
     struct {
         struct page_info *pg; /* One contiguous allocation of d->vmtrace_s=
ize */
     } vmtrace;
+#endif
=20
     struct arch_vcpu arch;
=20
@@ -623,7 +625,9 @@ struct domain
     unsigned int nr_altp2m;    /* Number of altp2m tables. */
 #endif
=20
+#ifdef CONFIG_VMTRACE
     unsigned int vmtrace_size; /* Buffer size in bytes, or 0 to disable. *=
/
+#endif
=20
 #ifdef CONFIG_ARGO
     /* Argo interdomain communication support */
--=20
2.34.1

