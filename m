Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EFF325F91
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 10:01:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90141.170553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFYzW-0007S9-70; Fri, 26 Feb 2021 09:00:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90141.170553; Fri, 26 Feb 2021 09:00:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFYzW-0007Rg-2u; Fri, 26 Feb 2021 09:00:54 +0000
Received: by outflank-mailman (input) for mailman id 90141;
 Fri, 26 Feb 2021 09:00:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zK4+=H4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lFYzU-0007RG-RL
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 09:00:52 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1a5ffe0-d036-4480-b216-b768df423c93;
 Fri, 26 Feb 2021 09:00:51 +0000 (UTC)
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
X-Inumbo-ID: e1a5ffe0-d036-4480-b216-b768df423c93
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614330051;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=5NtpMLJEx8ISDuyDwo32JNV2W/yTr2AO05voxqQUy2M=;
  b=SyLmLvTgqIUVyqtPR1o2VJiDh55Wnf3p4GuOEIM8leflfOcd2WBzhHlj
   KCoA4eLhOyj9PK204A4IMRUQ6JQFKVV5NNpvbc62MT0ZFUURmjWffedLr
   8S8965XnVhYEEtFIEy8h90xC94VXX1SFgVax0lnDEfZqBQ4nP22QU76g4
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: jLi68Waa/N8LQ0PKHVnvgKUNu9Nu5VuifzXXhWDLOMrHKF/0yz7PG6Kr4AoX3uODmuluIY5YL8
 jFwU6LF5wGJ2Vb2MEiYNYnZZBzfH0MJmxHimH7fY25j0TL0WIs2sWJCdkgfupN7cIstcO2F/CM
 1bPFeF4bKMqBwctLN6bWLjtjwJhIqcOz06TN/o2kXMqD7YgSbhHZP424VeAI8YF3+JAM9Xy1Ad
 PQWQIvnBfdIp5lkhwXatTSfISSCnotd0PW+jmLpXflpOz7JMdq9HscSB2UUMVXq913zLh2kW6+
 0T0=
X-SBRS: 5.2
X-MesageID: 38456681
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,208,1610427600"; 
   d="scan'208";a="38456681"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vlsow9uwpk4IXlP3nriwoSvcbEqRh5tEUOyUkRRwahuuMVJNyzT//PXm6LQtyBPkfi4OJQadgsA5YYBzxgsJlwXaT8alWIPthvMhYNJHk/7QKogK77XmFLnuP9b3LxDmXpPxt+p4d1YCfE/4GYGzUlzm9Bo1no7vK7yZk6anWZAFUzTSvrnsalwTG2K4ZnDc7N9qK3ReW8qIdU/pzzTWk0yh721tWZWRGSOYgDE0BmQGJD9LrkX6jujMrTYnJSkUKuRB8/0w7WqhU1y0E1EOBeitBv1f23DaOUbSURJYnIQWxW8h2ol5LHjvhG9/ZeWnBTHs5cvKdJM7NsgS5CkmoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RV5OFa57bqpUoSqK0ZdahTgCjVx4yyQ9MfBf1+OuoDs=;
 b=n5RfmP/+q8YmfbZ1gSJlqSxcxEmBkNtEwRohmyz5+/fowAnbinkrDY7gLe5V3bLu3qRtrj4j35I2R4MDYhjZAE5rWIKXQjDPqhcdU54H66n++t/loZvboubmYczctyLShiA60jyVRhiiIX7ZuAs0KiCTDuChzMTvLqjj+JtIZSBZ74M7tY4pZWwSIxE2seSIKaDPTnhYxvPuvH/jHhKM7X4HrY/A9cYDZC4Ijzjve8WrZlN3qL//mH1A7ytO1yo/SY28C1TUWlS4kEnGcfoHCJTAnVgwv7bptii+i7gep5GUcB1HoV+qWv137bVHq1k3ResferWt4NH98uDqLtcjCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RV5OFa57bqpUoSqK0ZdahTgCjVx4yyQ9MfBf1+OuoDs=;
 b=mFRJengj8YyQ2mGO6Z58ij9EI7TwBw/caUR9mwmWa2FIdbhdUmsXmhxa23NY/pecFZjiHWDLN0HjBF5myn30T3EF8A13erTGvxtT8U8eaOsPf5JeiB1w7tzNyaue6Eoi+TmOPy7YMbJNW3qpR1jQtbJ1s9rnEhN0r6Os1HuSk0c=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH for-4.15 2/3] firmware: provide a stand alone set of headers
Date: Fri, 26 Feb 2021 09:59:07 +0100
Message-ID: <20210226085908.21254-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210226085908.21254-1-roger.pau@citrix.com>
References: <20210226085908.21254-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P195CA0015.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8b8e075-cbba-4edc-459d-08d8da35016d
X-MS-TrafficTypeDiagnostic: DM6PR03MB4394:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB43942219C73D866D936976478F9D9@DM6PR03MB4394.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mfNptK3dKlvz0qZGKYN5WnE5lcA+PXEITzjnhJx0pnmCI076LXMXL2/MugNHNPHsK1Y2MgPXPwHISUTuoqw69NR6a42kY0UGqv8sx+h8FfevWpIIhF2iQRq1HMeT5iRIcquuRhD7YGKRtFGVhx6tjM1j+4j0up3speF1ytIZO/xaobcGzjlAkSS39EJkQGp+CllV5VtFrqvDLKtTy6BOvL9+ypSYd4DnpTg7KBOf4Y1LqQFNcz2zdTcqoilSUJAPVz8FPwpfYqKKUS26igAefQRE2ujZDhVZI0zQWYHjWBJExZqFbhACW9X5h51ebgeyR9D6ICT6UojnzVB/y39CqaiDQbAQLiYpLJYHMRN8lp+Qj+RXcw3un7ZEZKflat/a6tTQL6/tpSHhEno9N8YIqJReIwwOz33mL0EnXRTZxQfhoek23a4YqjfwEc44dGWsVbdeQu3tJxvg6oVkWevOScDm1npvAPKYoAkNINFURqP0CwNix9YIMRMl0NJNxzjX0O+uWXyBpC6zwW3TKkygOP3lvu/FZif+lXTKEIpkXdXlmK8QA3lTpdx9WIhP0ciLCKR8lVY4WNLrBFH4/G+KidZI9WPg7EMP9nzd1FlzoY4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(136003)(366004)(396003)(6916009)(66556008)(66946007)(36756003)(316002)(478600001)(6496006)(6666004)(66476007)(86362001)(2616005)(26005)(4326008)(54906003)(186003)(1076003)(5660300002)(16526019)(966005)(2906002)(8936002)(956004)(83380400001)(8676002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WlBWK3FDUXdSeS9jNnVkL1JzSk5Ya1dUS056bDlqSEtiNlJUZ0Y1OTZvZ25F?=
 =?utf-8?B?Ym5NOHJ4S2tPTTE1TEI2SnR1THd4bFhreWkrMTZaRXVTdWpOSEJCY2lNQ3dJ?=
 =?utf-8?B?N0ZZTjdocnpjY3JJRHhEUTM1a0NibVFkRGlUY1gyMDZDdVYxdmwyR2hQemhC?=
 =?utf-8?B?QjRCRittVTQ4UFFtQ2o5emdyL2VHM1pxRjQrUWl5OHVZNWFZdWlDQ0ZMem8w?=
 =?utf-8?B?RmNBUFNhRVRsNDdLWmtGZEl2NVExVStjUlVSWWQxZ1hOZENEWG1BejNRZ1VD?=
 =?utf-8?B?SWY2TzRBbWN6Yk1rMUdKTXQ0d1A4bVdqeENSM3cvQzJET2RneVNyM2pVSFh6?=
 =?utf-8?B?R2d5c0lLTEwxamNXTGxPOXRKRGdMTmp0b2ZjUExuc2ZxVGN4M2dnSHRJREZi?=
 =?utf-8?B?OUdJUnJmR1hXZkVwVU5GbDA1MUk0Y0JDbTdVM0JUNUZVTWNzdU4relJzVzFT?=
 =?utf-8?B?dkgrQkh1MWMyS05JM1EzYnVoVkNGMW5RNWpUVEZ1cXBPdVJQZlR3WlVXYTVo?=
 =?utf-8?B?WUxRT1JkL09qNHlXdU1rcC9yb05LcEtJOW42WlNVTXFkUTZCQVJVQmtrSDdu?=
 =?utf-8?B?VmRkRzRLT1JLd2lqc2dheUplYVl6blAvMHFNeE9oWVpHRk5icU10Rk13NGZq?=
 =?utf-8?B?WFpzMGc1WVhGYVZjMWN1SEc2VFAyZWdPUWlXUHhpQnJOUzZ5Y05CeFpRWmlC?=
 =?utf-8?B?czRQeVNIWS9GKzdJQ2g0WEFXSGNIbzNHVkFWSU1lNHQ5SEdOa2xYYnkxdk1J?=
 =?utf-8?B?L1I4U1llR2ZZL0szcHkxWGRIbGRRN29nOFlCOXRuRi9Ub2thRnZacDBxaDZa?=
 =?utf-8?B?UTZ2emFZOGFLU1BJd0wvK2F0UzdsM1RENFUvcUZqUnJ6b3NZUTVDbEF4aER6?=
 =?utf-8?B?U0k2N2ZmRlJmQmgyY3ZDSzBBQWhtVHlOWWUvZjFWN3hlZG5jcDZzdE9FM09U?=
 =?utf-8?B?ZFlXcXNCOVFLVTZLT2F0RmpoamlGeXAxbGZHekpZUkJkNUZTVGFETmtMSHZC?=
 =?utf-8?B?b1NHcWpaUkxJelo0YjRTYnRxZlkxTGp5VlR2aVhBY2Fac2tFQnBhWXA4ZjRY?=
 =?utf-8?B?dTFXYUQ1TGlKZlNIamsrUHJMd0MyMEhnaGFydWQwUmRXZzRLcmJSckwxcjRn?=
 =?utf-8?B?RXgyNk9qeldhOUhrblhzcEQrOU5neUkwTytPSU5VbW1rNHUyaDVRSnA2Zk9V?=
 =?utf-8?B?YlhrcXZ5VUhRKzQ3dHIrVXRKTUl5b1phS3VNWmhiOE9qcUxsaHl4cUNkbEY4?=
 =?utf-8?B?NWJjZ01TT2pDK0kvZjdWbTRDUHpudWtPSzExdWtVbWIzUzJGa2NrK05YSDJZ?=
 =?utf-8?B?TjJpRGRLdDlqRXVOSWkzVElSZTZJS2owMGc1R3JoRVpNTlkydVB5aFdLQVMw?=
 =?utf-8?B?c240SHY0Q1I4N0FNU1FaMTZTdytMSGlzeHhVWTdWN0lQMmJSRkxJemR4UkFF?=
 =?utf-8?B?V0FjUEhiUUJxSjVlUWk5akJFTzVoYXAxZk5TRkVVS0c1NGYwRXM5VkZ5QUNP?=
 =?utf-8?B?SWZLc01jaytlb2wrdG1vS3MyL2pwSkpVZU5LanpwYmNMS1V6UU1IUzVzQlN0?=
 =?utf-8?B?aWFyN1VpWHBkRnJ6K0pQSDk2a3pPREsvQlA0WXVObGdBWUduOVVGTmtXcEJu?=
 =?utf-8?B?MlBHRWVTZnhCOXFIZzRCVHJrRzJTOWpiS3ZTN2RjRTlYeExyNXZzbVp1TUc3?=
 =?utf-8?B?bHV5eTkwZFpyZWl2YThIRHF0M1A5N2pIN3hEVkxmUHNsMTc3YllXbUU4U0Rs?=
 =?utf-8?Q?BPRxDhE5vm4VHnWTxC7319T/yZll8fpVyC7BkwN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8b8e075-cbba-4edc-459d-08d8da35016d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 09:00:46.6419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SDmOC1xhz686PaamtHRwgndd9eCuEW/a4JGYge28DZVxdkBN2nXGz8qU+nFtdFJaJ904kjelKf6Zl43b7TY/2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4394
X-OriginatorOrg: citrix.com

The current build of the firmware relies on having 32bit compatible
headers installed in order to build some of the 32bit firmware, but
that usually requires multilib support and installing a i386 libc when
building from an amd64 environment which is cumbersome just to get
some headers.

Usually this could be solved by using the -ffreestanding compiler
option which drops the usage of the system headers in favor of a
private set of freestanding headers provided by the compiler itself
that are not tied to libc. However such option is broken at least
in the gcc compiler provided in Alpine Linux, as the system include
path (ie: /usr/include) takes precedence over the gcc private include
path:

#include <...> search starts here:
 /usr/include
 /usr/lib/gcc/x86_64-alpine-linux-musl/10.2.1/include

Since -ffreestanding is currently broken on at least that distro, and
for resilience against future compilers also having the option broken
provide a set of stand alone 32bit headers required for the firmware
build.

This allows to drop the build time dependency on having a i386
compatible set of libc headers on amd64.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
There's the argument of fixing gcc in Alpine and instead just use
-ffreestanding. I think that's more fragile than providing our own set
of stand alone headers for the firmware bits. Having the include paths
wrongly sorted can easily make the system headers being picked up
instead of the gcc ones, and then building can randomly fail because
the system headers could be amd64 only (like the musl ones).

I've also seen clang-9 on Debian with the following include paths:

#include "..." search starts here:
#include <...> search starts here:
 /usr/local/include
 /usr/lib/llvm-9/lib/clang/9.0.1/include
 /usr/include/x86_64-linux-gnu
 /usr/include

Which also seems slightly dangerous as local comes before the compiler
private path.

IMO using our own set of stand alone headers is more resilient.

Regarding the release risks, the main one would be breaking the build
(as it's currently broken on Alpine). I think there's a very low risk
of this change successfully producing a binary image that's broken,
and hence with enough build testing it should be safe to merge.
---
 README                                        |  3 --
 tools/firmware/Rules.mk                       | 11 ++++++
 tools/firmware/include/stdarg.h               | 10 +++++
 tools/firmware/include/stdbool.h              |  9 +++++
 tools/firmware/include/stddef.h               | 10 +++++
 tools/firmware/include/stdint.h               | 39 +++++++++++++++++++
 tools/firmware/rombios/32bit/rombios_compat.h |  4 +-
 7 files changed, 80 insertions(+), 6 deletions(-)
 create mode 100644 tools/firmware/include/stdarg.h
 create mode 100644 tools/firmware/include/stdbool.h
 create mode 100644 tools/firmware/include/stddef.h
 create mode 100644 tools/firmware/include/stdint.h

diff --git a/README b/README
index 33cdf6b826..5167bb1708 100644
--- a/README
+++ b/README
@@ -62,9 +62,6 @@ provided by your OS distributor:
     * GNU bison and GNU flex
     * GNU gettext
     * ACPI ASL compiler (iasl)
-    * Libc multiarch package (e.g. libc6-dev-i386 / glibc-devel.i686).
-      Required when building on a 64-bit platform to build
-      32-bit components which are enabled on a default build.
 
 In addition to the above there are a number of optional build
 prerequisites. Omitting these will cause the related features to be
diff --git a/tools/firmware/Rules.mk b/tools/firmware/Rules.mk
index 26bbddccd4..5d09ab06df 100644
--- a/tools/firmware/Rules.mk
+++ b/tools/firmware/Rules.mk
@@ -17,3 +17,14 @@ $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 
 # Extra CFLAGS suitable for an embedded type of environment.
 CFLAGS += -fno-builtin -msoft-float
+
+# Use our own set of library headers to build firmware.
+#
+# Ideally we would instead use -ffreestanding, but that relies on the compiler
+# having the right order for include paths (ie: compiler private headers before
+# system ones). This is not the case in Alpine at least which searches system
+# headers before compiler ones, and has been reported upstream:
+# https://gitlab.alpinelinux.org/alpine/aports/-/issues/12477
+# In the meantime (and for resilience against broken compilers) use our own set
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
index 0000000000..7514096846
--- /dev/null
+++ b/tools/firmware/include/stdint.h
@@ -0,0 +1,39 @@
+#ifndef _STDINT_H_
+#define _STDINT_H_
+
+#ifdef __LP64__
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


