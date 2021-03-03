Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 811F132B5E8
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 09:26:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92737.174784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHMpd-0007sd-Ed; Wed, 03 Mar 2021 08:26:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92737.174784; Wed, 03 Mar 2021 08:26:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHMpd-0007sA-AO; Wed, 03 Mar 2021 08:26:09 +0000
Received: by outflank-mailman (input) for mailman id 92737;
 Wed, 03 Mar 2021 08:26:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7pqQ=IB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lHMpc-0007mZ-49
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 08:26:08 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63453bbd-cf41-463f-809b-e2fff7be1adf;
 Wed, 03 Mar 2021 08:26:04 +0000 (UTC)
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
X-Inumbo-ID: 63453bbd-cf41-463f-809b-e2fff7be1adf
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614759964;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=oHuHX38srv3wzfUid8WUr7eIG/2a8lp5JbRPysRJmKY=;
  b=UcVpDvQnH9SkD80JsefmKa2QSB6GNCSyRotJXE4x8wMGPW0COREYL6Xr
   oZnRMXwzegtqGj4Z71/vRY26binA1eV46RwdHCx7ziYz1QNTsShs7+BOb
   psnzEf5SLNHD6ix4MowLUCGLmJw0jNPpDN02DQ5nAliRW9WKLw0LQuCpp
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 8GlVVeZhJ/4VaCyz1PY+9c+Muf6qqennJIp7nK17P0EU8rdZuZ3CXCOyX4tyXOYfW79DGWhnBo
 T61VDnclTe3W/nU3uKoSF3VeuT/Rz5lU10uR4dlcppgmTpI2rQNErvdZuUdAjm02gf0jP1SpKg
 3WQuPorYtGmrq1Rd3JnZXtfU9q0ed22HmKplQUKdAtI5xkfkc+e13z5uisfXrPcnLmsYdMNHi7
 c6EXJcTRHVXv2YFfQtUYsDuYDQNzKwJvYSKEoHyRVUyDNC6oxwuGiQuxNsZxaILtFaPc/H8OFe
 6X8=
X-SBRS: 5.2
X-MesageID: 38600577
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,219,1610427600"; 
   d="scan'208";a="38600577"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a1hmgoqKnc5o4rL/H/UqcdYV2dYhf5csWLLW0XETiywdIrbDIrQZ9mNa1CkIn9EEM+/rdo7zBwltKgv9xKJG0xraIVorI5V+d8rnSyxQzgQKuf3od0S8oY9hdBcAPX65sE0CrsBRoo3Z8+lngPvkAzxmgVC9/EQZ25Gi6bt4zgGbDxr6aPrdRmZQpuV/ZxVMC3eCV8Cfr55NmKXzFe+SV0ZTOS/FE+5WhFWhIxknNRHZz7Y3+FSlbNGI1AcMQrwd/EmEjvP/vk/Lu8GOC2lSQafRJ4DMYo7nS7kCzEVXFX1BEQFNUApwFMUevyF4p9Z12pYfGmvO2uFed8LNc3bp3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UveaccZp06KTjCJudT2M/QZr/Z5EGmNpCdWGdUyGE0A=;
 b=G2lN/EzMz6hquI52tWZNhjbWYPh0G8jC0sRmVZm7G0ayNEScI5Bqu3GTH2Enx0qOe24+SVoyvPLL2/J1mApFXXEEz0XZNsfStpQhnjz0jeHN2/pUgGqD8Y6U5VBkGHAuZSIzbeIqO6mjW1WtOofWUexXkYApVB895owDgvLYhHjZq+KZSoF/jIwRe+PLf9a5iSO17SinzJbH6IuIzEKcfkZs2wX/CGIN44l00rCZQNXc1gkkyHhBo1q8bTNQOeGw9CQ1inMTks9wMMWty/vJ4vcPPALCWt3By5xOy5LU8r2a7YNW9Tx92zNPwAxSE7D10EnlhBpGXuxTcecbJensLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UveaccZp06KTjCJudT2M/QZr/Z5EGmNpCdWGdUyGE0A=;
 b=a4a7iZPgnNUDwBQsq/VXE2g0coUY+cccQqCjIS6TrPnOlUjZH/OZLQwA1QUhGGltMTkuopnNFlmpwUbkgcs5K4SOyf9x2uNzWtB1DUByJfqsXPatF/3oDKUqmFf3j6ejD98tDLOpxJNm9U5RXOmK6N7p3ZfGcaYn0kgbh7GytmI=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: [PATCH v2 for-4.15 1/2] firmware: provide a stand alone set of headers
Date: Wed,  3 Mar 2021 09:25:13 +0100
Message-ID: <20210303082514.8859-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210303082514.8859-1-roger.pau@citrix.com>
References: <20210303082514.8859-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0058.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4aea52e6-7327-45ec-7fd2-08d8de1dea0d
X-MS-TrafficTypeDiagnostic: DM5PR03MB2971:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB297101659475C2B71F301E648F989@DM5PR03MB2971.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4UB93V/KFoq6gsAW/VDg3YO1kMAjOMxAiaUqen6EiCaIhJb4+cSR+pxXvAN1voe9TuxPCw19rniq9JZKOK0/EfLAVKB4J3HjiTv4shjU/WftUzvGn4VaX+PYXwkbHp3cD/r9u7xVpuheAImlHDvbQ+ph77XmE9+lZ/ZSZb64+BH4nC1C4wZgRGCoWyIoLDYM4pw8Wu2dF1kuAP/G6c3/zfniGB0Cpjs4ONq00xWy9Z9VjrqtbF6h1yEJT405QUKjAjffto+momSeJ213jLJnLln6pNkTJivVZasBGbMA/IXs7rnN3lEcOD9mTwrmIvq2/LH84X/xrdznhAq1/21hxZv2c4GcyfGYaU5VEQv+OEZTYs3bgX+sK3w9Lki+LxDWXKwoigQApHy4aAGSBPNyggAvgYFXeEipSglAto04htG9GB9/KlMWfOzVdJxksAXQCr+qQ+Arfp57yCuRSCgbSzZJAobrFT7massUfghl0n9aiB7913rP3EiMW2wglzUsntHOMHVedld+OiNYCx8hq5MFxbh01UgBJ2IgUoRKqQhjNnM15NOi99ztlyqGmExOWkCBQzdyRLiCLxA41alk+XMMAmlIONqqCTXKmwh1kEk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(39840400004)(396003)(136003)(83380400001)(316002)(16526019)(186003)(6486002)(4326008)(6916009)(966005)(107886003)(1076003)(54906003)(26005)(66946007)(36756003)(478600001)(86362001)(6666004)(956004)(8676002)(8936002)(2906002)(66556008)(2616005)(66476007)(6496006)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NCtMZE1oODJOVjlUVTJqL29mVFB6T01RVDNlTmt4YUJuMjJScUswYkFYN2xO?=
 =?utf-8?B?ZmNzTFFLaVJWOU9TeWt4OHdDdFdHeU42MXhCTlRWSGUzOTA5bTZYYkM0d3Qr?=
 =?utf-8?B?bXR6bkZYR3FXN3NuNlBVYkUxVTZNL2lEaDJKeE9MNzZQcTJJMWJ1ZituRDU4?=
 =?utf-8?B?OVlaMWZvM0x3dG5venR1cCttYTBrR0lwcG54NXVuT3Z4bHU4NUs3WjdSM3hT?=
 =?utf-8?B?TlNxVVc1ZVRXbXBRRDlNQ3BMR0g0U3VtT051ZWtJd1l0cld5QytEUmM5Mkph?=
 =?utf-8?B?WUxvRFE0d1NMNSsxSWk5b3hwclhFM3NmVnFuSFg2a05tSjIwMUdoZUNvczdp?=
 =?utf-8?B?bnAxdTQ3ZlpGek9BSHEzWWR5bU5UZUJPdXk1R0dCdjR4N1pZY2l0ay9DUEZL?=
 =?utf-8?B?NUthWVJKNGRkL1dKdFN4eFVubDNlWTIrck1kZDJlU1FrOW1Ib3BnazcwREE2?=
 =?utf-8?B?TTlCN2VTMVZoekY2dmFkOGRMdEdjdk5oSWRoek5BcThpTmRBQlIrR1REREJz?=
 =?utf-8?B?Z3g3Qk1KN2dWcEtodS9tNGVLODFOUXU5Y2dIRTlENUQ5U3FLbXc2ZXhNSXlv?=
 =?utf-8?B?cDBZZmZzeEhnWUdJd21HOForSEJZd2NmMEdaL0tzZmdvYjkvRzlVRE8rcStt?=
 =?utf-8?B?T0pQb3JmUGs0YXpyYjlNd0tLSVgzR2V5MXQ3OUNPWFZzUVc3am13eGZpcWNq?=
 =?utf-8?B?d1psWVZDQjczYVFzUW5FOUpYL0pNT0Nxb1BMQWE3SWNuUjYzUVNNZ0FJUWVu?=
 =?utf-8?B?ZW93YTFzRG9JK041eVZwcnlpNHRDdHpaRGlsQnUzaTBSdllLKzlBVUY1Q2J2?=
 =?utf-8?B?cE9Xd05GdEhTaTdXSXREMFpBd3VRVFhoZFRIeGpHM2t4WE1vbE5LWFN6YlFy?=
 =?utf-8?B?bDZoSDg3WC9JSXF2R2FnOW9iVVptMzNvOE1HN3Z0Z2prWTA2aWZlZllUQ1Nt?=
 =?utf-8?B?OW44QUIwUmtxWXM1U3AvYTZRQkxsTTlENmRsSDB0MmhMT3JOQ1JjOGMzdUc2?=
 =?utf-8?B?WERTK3FndW5jdUFoNTJ6MjVDZWJFbjJjWThWeFl2K3FFaDlwVVhma2h4WUZJ?=
 =?utf-8?B?UlRWMWcyVjV6UFRyWm1WSG5MTS9yR0IwVFExTXNtZDVGRGg5aFRVRkJnR1BD?=
 =?utf-8?B?NHBZZ0JhUEdqYUttVTM3YVIrTml4dmhEUWJraHJHb01QMXJTM2VDL1A1Rks3?=
 =?utf-8?B?YkJQWGM3SVFhVkk1MWM2aE1UaUNLRU4wTDZ2TmRScGhkd042RzZwdWxlS09G?=
 =?utf-8?B?TkZyTW92aXc1VDFtMGNxUWZPMDFhYTg0K282TXA3bUloL0x3eDh2S1FrSy9U?=
 =?utf-8?B?bm5Sd3lYSHFjTWJSaTdoRFBjcU1NNTF6ZlFiL2RkcUVtanM0NVJzREtuOUxY?=
 =?utf-8?B?bkZuVUMxUFBPSkcyUkNQV3JpRGRXWnc2QVZ4OFJxUVpFVHFsanhESXhLUzBL?=
 =?utf-8?B?M1FYS0J6Q091ODdENUliQVFQak5FbFIxYXBCYU8yYTN3aUM4SWRGeG4rWWVZ?=
 =?utf-8?B?ZnF0QkQvSGgvejVzK3cyRjhiVEg3VTgrRkZpYnNDNlBZaW10T3RnSjB0aHNy?=
 =?utf-8?B?L0NjWTgreHZWM1JMSDR3Y3JaUjFwNzJXc1V6dlM0N2VPbWNpVjVjdFdVclVR?=
 =?utf-8?B?c3lxbVFjc1hmZUlUbnprL1o3cm5JcWsrRE5jSGovdVF3a05wc1VCSU1DRmFy?=
 =?utf-8?B?Zzd2MHdOdjk2ZndqVFUydVdLTklzYTkrb0tpMTJ2eURFSDYxamVVVFJZVnpw?=
 =?utf-8?Q?uNlXCJ4pSvO1o6zOVbvDDd11iuJLeclc3+j35K7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aea52e6-7327-45ec-7fd2-08d8de1dea0d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2021 08:25:33.6450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: prbkIVCP0t5ZJeTmdpnNNylF3BSxr6fvM915FCYu7Eq470SdXNU1BoHWflUH8mjKCinxkYKwexV+Zp+wv3RMlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2971
X-OriginatorOrg: citrix.com

The current build of the firmware relies on having 32bit compatible
headers installed in order to build some of the 32bit firmware.
Usually this can be solved by using the -ffreestanding compiler option
which drops the usage of the system headers in favor of a private set
of freestanding headers provided by the compiler itself that are not
tied to libc.

However such option is broken at least in the gcc compiler provided in
Alpine Linux, as the system include path (ie: /usr/include) takes
precedence over the gcc private include path:

#include <...> search starts here:
 /usr/include
 /usr/lib/gcc/x86_64-alpine-linux-musl/10.2.1/include

And the headers in /usr/include are exclusively 64bit.

Since -ffreestanding is currently broken on at least that distro, and
for resilience against future compilers also having the option broken
provide a set of stand alone 32bit headers required for the firmware
build.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>
---
Using -ffreestanding alone seems fragile, as it's broken on some
distros. Compensate for this by providing our own set of stand alone
headers for the firmware bits. Having the include paths wrongly sorted
can easily make the system headers being picked up instead of the gcc
ones, and then building can randomly fail because the system headers
could be amd64 only (like the musl ones).

I've also seen clang-9 on Debian with the following include paths:

#include "..." search starts here:
#include <...> search starts here:
 /usr/local/include
 /usr/lib/llvm-9/lib/clang/9.0.1/include
 /usr/include/x86_64-linux-gnu
 /usr/include

Which also seems slightly dangerous as local comes before the compiler
private path.

IMO using -ffreestanding and our own set of stand alone headers is
more resilient.

Regarding the release risks, the main one would be breaking the build
(as it's currently broken on Alpine). I think there's a very low risk
of this change successfully producing a binary image that's broken,
and hence with enough build testing it should be safe to merge.
---
Changes since v2:
 - Add a __P64__ check to stdint.h.
 - Reword the comment in Rules.mk.
---
 tools/firmware/Rules.mk                       | 13 +++++++
 tools/firmware/include/stdarg.h               | 10 +++++
 tools/firmware/include/stdbool.h              |  9 +++++
 tools/firmware/include/stddef.h               | 10 +++++
 tools/firmware/include/stdint.h               | 39 +++++++++++++++++++
 tools/firmware/rombios/32bit/rombios_compat.h |  4 +-
 6 files changed, 82 insertions(+), 3 deletions(-)
 create mode 100644 tools/firmware/include/stdarg.h
 create mode 100644 tools/firmware/include/stdbool.h
 create mode 100644 tools/firmware/include/stddef.h
 create mode 100644 tools/firmware/include/stdint.h

diff --git a/tools/firmware/Rules.mk b/tools/firmware/Rules.mk
index dc372a86d8..9f78a7dec9 100644
--- a/tools/firmware/Rules.mk
+++ b/tools/firmware/Rules.mk
@@ -17,3 +17,16 @@ $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 
 # Extra CFLAGS suitable for an embedded type of environment.
 CFLAGS += -ffreestanding -msoft-float
+
+# Use our own set of stand alone headers to build firmware.
+#
+# Ideally using -ffreestanding should be enough, but that relies on the
+# compiler having the right order for include paths (ie: compiler private
+# headers before system ones) or the libc headers having proper arch-agnostic
+# freestanding support. This is not the case in Alpine at least which searches
+# system headers before compiler ones and has arch-specific libc headers. This
+# has been reported upstream:
+# https://gitlab.alpinelinux.org/alpine/aports/-/issues/12477
+# In the meantime (and for resilience against broken systems) use our own set
+# of headers that provide what's needed for the firmware build.
+CFLAGS += -nostdinc -I$(XEN_ROOT)/tools/firmware/include
diff --git a/tools/firmware/include/stdarg.h b/tools/firmware/include/stdarg.h
new file mode 100644
index 0000000000..c5e3761cd2
--- /dev/null
+++ b/tools/firmware/include/stdarg.h
@@ -0,0 +1,10 @@
+#ifndef _STDARG_H_
+#define _STDARG_H_
+
+typedef __builtin_va_list va_list;
+#define va_copy(dest, src) __builtin_va_copy(dest, src)
+#define va_start(ap, last) __builtin_va_start(ap, last)
+#define va_end(ap) __builtin_va_end(ap)
+#define va_arg __builtin_va_arg
+
+#endif
diff --git a/tools/firmware/include/stdbool.h b/tools/firmware/include/stdbool.h
new file mode 100644
index 0000000000..0cf76b106c
--- /dev/null
+++ b/tools/firmware/include/stdbool.h
@@ -0,0 +1,9 @@
+#ifndef _STDBOOL_H_
+#define _STDBOOL_H_
+
+#define bool _Bool
+#define true 1
+#define false 0
+#define __bool_true_false_are_defined 1
+
+#endif
diff --git a/tools/firmware/include/stddef.h b/tools/firmware/include/stddef.h
new file mode 100644
index 0000000000..c7f974608a
--- /dev/null
+++ b/tools/firmware/include/stddef.h
@@ -0,0 +1,10 @@
+#ifndef _STDDEF_H_
+#define _STDDEF_H_
+
+typedef __SIZE_TYPE__ size_t;
+
+#define NULL ((void*)0)
+
+#define offsetof(t, m) __builtin_offsetof(t, m)
+
+#endif
diff --git a/tools/firmware/include/stdint.h b/tools/firmware/include/stdint.h
new file mode 100644
index 0000000000..16a0b6de19
--- /dev/null
+++ b/tools/firmware/include/stdint.h
@@ -0,0 +1,39 @@
+#ifndef _STDINT_H_
+#define _STDINT_H_
+
+#if defined(__LP64__) || defined(__P64__)
+#error "32bit only header"
+#endif
+
+typedef unsigned char uint8_t;
+typedef signed char int8_t;
+
+typedef unsigned short uint16_t;
+typedef signed short int16_t;
+
+typedef unsigned int uint32_t;
+typedef signed int int32_t;
+
+typedef unsigned long long uint64_t;
+typedef signed long long int64_t;
+
+#define INT8_MIN        (-0x7f-1)
+#define INT16_MIN       (-0x7fff-1)
+#define INT32_MIN       (-0x7fffffff-1)
+#define INT64_MIN       (-0x7fffffffffffffffll-1)
+
+#define INT8_MAX        0x7f
+#define INT16_MAX       0x7fff
+#define INT32_MAX       0x7fffffff
+#define INT64_MAX       0x7fffffffffffffffll
+
+#define UINT8_MAX       0xff
+#define UINT16_MAX      0xffff
+#define UINT32_MAX      0xffffffffu
+#define UINT64_MAX      0xffffffffffffffffull
+
+typedef uint32_t uintptr_t;
+
+#define UINTPTR_MAX     UINT32_MAX
+
+#endif
diff --git a/tools/firmware/rombios/32bit/rombios_compat.h b/tools/firmware/rombios/32bit/rombios_compat.h
index 3fe7d67721..8ba4c17ffd 100644
--- a/tools/firmware/rombios/32bit/rombios_compat.h
+++ b/tools/firmware/rombios/32bit/rombios_compat.h
@@ -8,9 +8,7 @@
 
 #define ADDR_FROM_SEG_OFF(seg, off)  (void *)((((uint32_t)(seg)) << 4) + (off))
 
-typedef unsigned char uint8_t;
-typedef unsigned short int uint16_t;
-typedef unsigned int uint32_t;
+#include <stdint.h>
 
 typedef uint8_t  Bit8u;
 typedef uint16_t Bit16u;
-- 
2.30.1


