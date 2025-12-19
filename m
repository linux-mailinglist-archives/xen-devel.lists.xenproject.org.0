Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9F1CD08EA
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 16:42:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190777.1511050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWccZ-0006ro-SH; Fri, 19 Dec 2025 15:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190777.1511050; Fri, 19 Dec 2025 15:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWccZ-0006ne-L9; Fri, 19 Dec 2025 15:42:23 +0000
Received: by outflank-mailman (input) for mailman id 1190777;
 Fri, 19 Dec 2025 15:42:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gsl/=6Z=bounce.vates.tech=bounce-md_30504962.69457259.v1-07968038db074b37b76c7882678b4066@srs-se1.protection.inumbo.net>)
 id 1vWccY-0006gj-Hw
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 15:42:22 +0000
Received: from mail179-28.suw41.mandrillapp.com
 (mail179-28.suw41.mandrillapp.com [198.2.179.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e25ec14-dcf1-11f0-b15b-2bf370ae4941;
 Fri, 19 Dec 2025 16:42:21 +0100 (CET)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-28.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4dXsGx5JfCzMQxZxV
 for <xen-devel@lists.xenproject.org>; Fri, 19 Dec 2025 15:42:17 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 07968038db074b37b76c7882678b4066; Fri, 19 Dec 2025 15:42:17 +0000
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
X-Inumbo-ID: 4e25ec14-dcf1-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1766158937; x=1766428937;
	bh=7H1KdoH0m20ic7CKZFqkogefCwWlYCbcScz7KoDawEA=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=VjlRj3CJ7Nxt+Y6SOeR8Y8BTPsB2moGkgQJh6c0s0xb91dFD5bEt3VfGbyi+Dy7mY
	 BCYfu7x8SaNnKj8+wIy07jX37WNOUcCFJDznZqA20QTFKonxlXqEg03B1ALhXvQtiq
	 jdL1+1GXsvnVaUsBymSGEMLApMez8+lglQYB238rQ0kqjrpQlyQgFOsdh97YEocJHS
	 zKFRvzSCIAKu8Q44EuU6+ykonEiJXJdBYYXiiXs/vGuXd2SbvhCcPsK0sjj0TwgEPl
	 f9n9uSlHuWG9BSQnzJBZi2T5EGc02Bfx/7jnZ/rhnx7XK3Yr49KSMqOvByTypZVnIC
	 3nksHizGgZYFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1766158937; x=1766419437; i=teddy.astie@vates.tech;
	bh=7H1KdoH0m20ic7CKZFqkogefCwWlYCbcScz7KoDawEA=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=LM/zxdaAF5cTUJdQC7xqbOsqd8/7O2BIuwqIDRcoTXhVu5tNU/k5BNhcKQWdZ7FdI
	 G65b19Jd8LPw+VbSR3uI8aSMNCcB+csaeb0+O2+y0fzpAsHlW1cpgIHaFaAEYeeLfZ
	 Si8h8UkR7XLNZeh2O2EUDIY8IZ2iWW9iDocU9NZgbCtg1/rL/CUGquXDu+eB2LN25C
	 EfRAEYjj55+9S63qmzFY+/uvftel8J/BBnWNvW4Z0rCFm8wxDIZAh4i6qkleee+Q0j
	 tyqzWMlGBPiRamjt7jx1yDoTuL62WToX6DdG3jsYn9gEBUUqG22Vq3YuPwP6OT8IlD
	 jIRfomm0OS+2A==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v4=204/4]=20xenpm:=20Add=20get-intel-temp=20subcommand?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1766158937095
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Community Manager" <community.manager@xenproject.org>, "Anthony PERARD" <anthony.perard@vates.tech>
Message-Id: <417d27567b9ef00d10335de089eaabe8e8e76102.1766158766.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1766158766.git.teddy.astie@vates.tech>
References: <cover.1766158766.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.07968038db074b37b76c7882678b4066?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251219:md
Date: Fri, 19 Dec 2025 15:42:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

get-intel-temp allows querying the per-core CPU temperature and
per-package one on Intel processors (as usual Dom0 drivers cannot
work due to misalignment between Dom0 vCPU and pCPUs).

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 CHANGELOG.md       |   3 ++
 tools/misc/xenpm.c | 113 ++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 115 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 1fa58ce848..f55d77016c 100644
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
index 682d092479..5a411b5a30 100644
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
@@ -1354,6 +1358,113 @@ void enable_turbo_mode(int argc, char *argv[])
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
+    case 0:
+        /* This CPU isn't online or can't query this MSR */
+        return -ENODATA;
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
+    case 2:
+    {
+        tjmax =3D (entries[1].val >> 16) & 0xff;
+        break;
+    }
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
@@ -1618,12 +1729,12 @@ struct {
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
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



