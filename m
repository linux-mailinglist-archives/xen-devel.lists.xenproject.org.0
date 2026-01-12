Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98384D1426D
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 17:47:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200788.1516627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfL4T-0003VF-Id; Mon, 12 Jan 2026 16:47:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200788.1516627; Mon, 12 Jan 2026 16:47:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfL4T-0003St-Dn; Mon, 12 Jan 2026 16:47:13 +0000
Received: by outflank-mailman (input) for mailman id 1200788;
 Mon, 12 Jan 2026 16:47:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rl9V=7R=bounce.vates.tech=bounce-md_30504962.6965258b.v1-eb65e341abdf4b68ae7d17db6fc25cd3@srs-se1.protection.inumbo.net>)
 id 1vfL4R-0003Sn-KU
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 16:47:11 +0000
Received: from mail8.us4.mandrillapp.com (mail8.us4.mandrillapp.com
 [205.201.136.8]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5560393f-efd6-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 17:47:09 +0100 (CET)
Received: from pmta15.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail8.us4.mandrillapp.com (Mailchimp) with ESMTP id 4dqdZg4KB1z2K1rly
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 16:47:07 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 eb65e341abdf4b68ae7d17db6fc25cd3; Mon, 12 Jan 2026 16:47:07 +0000
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
X-Inumbo-ID: 5560393f-efd6-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1768236427; x=1768506427;
	bh=qI61iBlkqBdvAojoqvM3anqTtKbYE9EY4wLfqLBcqUE=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=PBO/AiuimQ1AcR62ne/P5CNEgDAE0g3PZ4AMBZw9R/JeW25PzUBlStFZrikCsCxNE
	 BMBV7yLnjxcQa4UcMyoCkYPnzRiTd9CTWZiKcLmnHwCgH9lWpkOrflkbyCFSIp/MqR
	 0QIkA49Uo0VNA3B+nrejHKY3K619FLY32taMjO0A6WP++bcX9oGy3tQmyXEHHFH5jm
	 u4o5Ck7DRsfmbrUbLIMYRsDcxnpQb6yQMMgPgxAZb/HMU7oDYpk917RPSSzuaS+nLg
	 1lUv5XBYeT7zFc1ENbJM/SHAVLLXW84JwnN1CHbhaATm8PbYBinjPCwF+PKJtTJO06
	 ZJC1x37tBUqYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1768236427; x=1768496927; i=teddy.astie@vates.tech;
	bh=qI61iBlkqBdvAojoqvM3anqTtKbYE9EY4wLfqLBcqUE=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=YiDRlMG3oXkG3sjmTYotmI+utaac9D5eo7cDZGSqH3L6eGVMAYKF4l5+3S3ehcP/C
	 SCj0LnAHbFtAVZe3zZfKs+HKWUYwoCIOIvoEcH4uKuRV6j55DgBxTkialD2wPlbgyx
	 mCViOb8Z3u9IBmxeRQ69j9jPMIltNSAcdR/s00JyZOE4Y6C7KM0V9gbiqdp28iUXJt
	 waqRHmuGarqhk+yZcfubN3fx05T4XRvENWYZDleO14SbJfKHyE2mx2iHZQXVX0yraH
	 iqVjS6omhGf4w9zTLxymsNZoifuwlLLfxyNk0naehOubAytACLeIfhlJ5tsAeLlYWv
	 cH+K5I1ac/Rzw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v5=202/2]=20xenpm:=20Add=20get-intel-temp=20subcommand?=
X-Mailer: git-send-email 2.52.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1768236426293
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Community Manager" <community.manager@xenproject.org>, "Anthony PERARD" <anthony.perard@vates.tech>, "Jan Beulich" <jbeulich@suse.com>
Message-Id: <7ae6ca6f93e81cb0b5a71db90913dc3f67e6b763.1768235932.git.teddy.astie@vates.tech>
In-Reply-To: <7dfa012b734f3c769da88f0f1c989d07b724bdaa.1768235932.git.teddy.astie@vates.tech>
References: <7dfa012b734f3c769da88f0f1c989d07b724bdaa.1768235932.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.eb65e341abdf4b68ae7d17db6fc25cd3?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260112:md
Date: Mon, 12 Jan 2026 16:47:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

get-intel-temp allows querying the per-core CPU temperature and
per-package one on Intel processors (as usual Dom0 drivers cannot
work due to misalignment between Dom0 vCPU and pCPUs).

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
Cc: Jan Beulich <jbeulich@suse.com>

v5: Applied Jan proposed changes (removed bracket in changes and added newl=
ines).

 CHANGELOG.md       |   3 ++
 tools/misc/xenpm.c | 115 ++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 117 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 7de34f64d1..568a8cebaa 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -9,6 +9,9 @@ The format is based on [Keep a Changelog](https://keepachan=
gelog.com/en/1.0.0/)
 ### Changed
 
 ### Added
+ - On x86:
+   - Introduce get-intel-temp to xenpm to query CPU temperatures on Intel
+     platforms.
 
 ### Removed
  - On x86:
diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 682d092479..d20a213c71 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -32,11 +32,14 @@
 
 #include <xen-tools/common-macros.h>
 
+#include <xen/asm/msr-index.h>
+
 #define MAX_PKG_RESIDENCIES 12
 #define MAX_CORE_RESIDENCIES 8
 
 static xc_interface *xc_handle;
 static unsigned int max_cpu_nr;
+static xc_physinfo_t physinfo;
 
 /* help message */
 void show_help(void)
@@ -93,6 +96,7 @@ void show_help(void)
             "                                           units default to \=
"us\" if unspecified.\n"
             "                                           truncates un-repre=
sentable values.\n"
             "                                           0 lets the hardwar=
e decide.\n"
+            " get-intel-temp        [cpuid]       get Intel CPU temperatur=
e of <cpuid> or all\n"
             " start [seconds]                     start collect Cx/Px stat=
istics,\n"
             "                                     output after CTRL-C or S=
IGINT or several seconds.\n"
             " enable-turbo-mode     [cpuid]       enable Turbo Mode for pr=
ocessors that support it.\n"
@@ -1354,6 +1358,115 @@ void enable_turbo_mode(int argc, char *argv[])
                 errno, strerror(errno));
 }
 
+static int fetch_dts_temp(xc_interface *xch, uint32_t cpu, bool package, i=
nt *temp)
+{
+    xc_resource_entry_t entries[] =3D {
+        { .idx =3D package ? MSR_PACKAGE_THERM_STATUS : MSR_IA32_THERM_STA=
TUS },
+        { .idx =3D MSR_TEMPERATURE_TARGET },
+    };
+    struct xc_resource_op ops =3D {
+        .cpu =3D cpu,
+        .entries =3D entries,
+        .nr_entries =3D ARRAY_SIZE(entries),
+    };
+    int tjmax;
+
+    int ret =3D xc_resource_op(xch, 1, &ops);
+
+    switch ( ret )
+    {
+    case -1:
+        /* xc_resource_op returns -1 in out of memory scenarios */
+        return -ENOMEM;
+
+    case 0:
+        /* This CPU isn't online or can't query this MSR */
+        return -ENODATA;
+
+    case 1:
+    {
+        /*
+         * The CPU doesn't support MSR_TEMPERATURE_TARGET, we assume it's =
100
+         * which is correct aside a few selected Atom CPUs. Check Linux
+         * kernel's coretemp.c for more information.
+         */
+        static bool has_reported_once =3D false;
+
+        if ( !has_reported_once )
+        {
+            fprintf(stderr, "MSR_TEMPERATURE_TARGET is not supported, assu=
me "
+                            "tjmax =3D 100, readings may be incorrect.\n")=
;
+            has_reported_once =3D true;
+        }
+
+        tjmax =3D 100;
+        break;
+    }
+
+    case 2:
+        tjmax =3D (entries[1].val >> 16) & 0xff;
+        break;
+
+    default:
+        if ( ret > 0 )
+        {
+            fprintf(stderr, "Got unexpected xc_resource_op return value: %=
d",
+                    ret);
+            return -EINVAL;
+        }
+        return ret;
+    }
+
+    *temp =3D tjmax - ((entries[0].val >> 16) & 0xff);
+    return 0;
+}
+
+static void get_intel_temp(int argc, char *argv[])
+{
+    int temp =3D -1, cpu =3D -1;
+    unsigned int socket;
+    bool has_data =3D false;
+
+    if ( argc > 0 )
+        parse_cpuid(argv[0], &cpu);
+
+    if ( cpu !=3D -1 )
+    {
+        if ( !fetch_dts_temp(xc_handle, cpu, false, &temp) )
+            printf("CPU%d: %d=C2=B0C\n", cpu, temp);
+        else
+            printf("No data\n");
+        return;
+    }
+
+    /* Per socket measurement */
+    for ( socket =3D 0, cpu =3D 0; cpu < max_cpu_nr;
+          socket++, cpu +=3D physinfo.cores_per_socket * physinfo.threads_=
per_core )
+    {
+        if ( !fetch_dts_temp(xc_handle, cpu, true, &temp) )
+        {
+            has_data =3D true;
+            printf("Package%u: %d=C2=B0C\n", socket, temp);
+        }
+    }
+
+    if ( has_data )
+        /* Avoid inserting a trailing line if we have nothing */
+        printf("\n");
+
+    for ( cpu =3D 0; cpu < max_cpu_nr; cpu +=3D physinfo.threads_per_core =
)
+    {
+        if ( fetch_dts_temp(xc_handle, cpu, false, &temp) )
+            continue;
+
+        has_data =3D true;
+        printf("CPU%d: %d=C2=B0C\n", cpu, temp);
+    }
+
+    if ( !has_data )
+        printf("No data\n");
+}
+
 void disable_turbo_mode(int argc, char *argv[])
 {
     int cpuid =3D -1;
@@ -1618,12 +1731,12 @@ struct {
     { "set-max-cstate", set_max_cstate_func},
     { "enable-turbo-mode", enable_turbo_mode },
     { "disable-turbo-mode", disable_turbo_mode },
+    { "get-intel-temp", get_intel_temp },
 };
 
 int main(int argc, char *argv[])
 {
     int i, ret =3D 0;
-    xc_physinfo_t physinfo;
     int nr_matches =3D 0;
     int matches_main_options[ARRAY_SIZE(main_options)];
 
-- 
2.52.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



