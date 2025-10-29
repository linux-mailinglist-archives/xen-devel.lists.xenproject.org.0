Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 812BFC1BE17
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 16:59:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152910.1483410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE8aI-0006ya-DO; Wed, 29 Oct 2025 15:59:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152910.1483410; Wed, 29 Oct 2025 15:59:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE8aI-0006vb-9o; Wed, 29 Oct 2025 15:59:38 +0000
Received: by outflank-mailman (input) for mailman id 1152910;
 Wed, 29 Oct 2025 15:59:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XySD=5G=bounce.vates.tech=bounce-md_30504962.690239e5.v1-9da9f172351b4e0ab8900f7b9d47b93d@srs-se1.protection.inumbo.net>)
 id 1vE8aG-0006vP-JN
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 15:59:36 +0000
Received: from mail132-22.atl131.mandrillapp.com
 (mail132-22.atl131.mandrillapp.com [198.2.132.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4310fa94-b4e0-11f0-9d16-b5c5bf9af7f9;
 Wed, 29 Oct 2025 16:59:34 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-22.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4cxX4P0WSPzGltNRQ
 for <xen-devel@lists.xenproject.org>; Wed, 29 Oct 2025 15:59:33 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 9da9f172351b4e0ab8900f7b9d47b93d; Wed, 29 Oct 2025 15:59:33 +0000
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
X-Inumbo-ID: 4310fa94-b4e0-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1761753573; x=1762023573;
	bh=/+87MGS6/9z1OA6URO3xty6mId//yWrDAR4kyFinMw8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Wuiok+TWvkhGPB5wuqlYKIi48hE2syAuR+xCoy2mwd257vSv5hMYuOPmJ9c2V8Wtj
	 j9/sSOi/bTeQ/0YDE6qFIPj8XEPhQOhkT8fSC0HiFrU0A+WF3A65PLKjyP1ns5Qd+i
	 sozvyUcNIaPHkIOTza7aaP9SqV78g2ZZ66sz9T89jXYjB8r65GvzRNVn904YALD/be
	 3txQEoMrPWR46Lk/pEymivCNUrAe7J5VcaA7OqHFS6TpxFMeN2cI8RMhNY3sOiryZ1
	 ByACMwLJ4FO9FTmoByAGyH6lG2nVaur/gy+Sh0hZbKw4qL37x49xiVW/EmnFqvZ9+T
	 aOIJ0p4G+apcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1761753573; x=1762014073; i=teddy.astie@vates.tech;
	bh=/+87MGS6/9z1OA6URO3xty6mId//yWrDAR4kyFinMw8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=oIiWfkQnc8SZ0m4y3C6MFtatuWhuFo2QvIM3F4SyI/IwlYUbIjjGDCPjLxWiU7MQf
	 YA53/NUGNvrhrJn1y9w+yEvRuyF7HU1i6/fp51xWwnL+XW0vkECt3/1kDbFUmPsi5K
	 lP+OdJUh3MWZpHJFQIpqdOANVEWX+ZKsO5Q1VvZ9s3l27D1XKZN/X0OWcJSFx3lWxL
	 WjH51LNAiHDAAd88ISijH+rnjuOdoRP4Agt0Ie0vy6Rm8PE8AaEWtee/wbVvlhTLos
	 naE13EXJhq+rnKgmnbCmRRmMIswtdYhbzbmcoBu20+JaFa2VrP2ZOqLndJGKTex/3w
	 We3UvhWcL1WVw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20for-4.22=20v2=203/3]=20xenpm:=20Add=20get-intel-temp=20subcommand?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1761753572604
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>
Message-Id: <6ed4d320ca4a69ca8b05b0af45d32ff4b330a779.1761752801.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1761752801.git.teddy.astie@vates.tech>
References: <cover.1761752801.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.9da9f172351b4e0ab8900f7b9d47b93d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251029:md
Date: Wed, 29 Oct 2025 15:59:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

get-intel-temp allows querying the per-core CPU temperature and
per-package one on Intel processors (as usual Dom0 drivers cannot
work due to misalignment between Dom0 vCPU and pCPUs).

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
v2: moved from a separate command to xenpm

 tools/misc/xenpm.c | 93 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 92 insertions(+), 1 deletion(-)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 682d092479..ef9abee48e 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -37,6 +37,7 @@
 
 static xc_interface *xc_handle;
 static unsigned int max_cpu_nr;
+static xc_physinfo_t physinfo;
 
 /* help message */
 void show_help(void)
@@ -93,6 +94,7 @@ void show_help(void)
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
@@ -1354,6 +1356,95 @@ void enable_turbo_mode(int argc, char *argv[])
                 errno, strerror(errno));
 }
 
+#define MSR_DTS_THERM_STATUS         0x0000019c
+#define MSR_DTS_TEMPERATURE_TARGET   0x000001a2
+#define MSR_DTS_PACKAGE_THERM_STATUS 0x000001b1
+
+static int fetch_dts_temp(xc_interface *xch, uint32_t cpu, bool package, i=
nt *temp)
+{
+    xc_resource_entry_t entries[2] =3D {
+        (xc_resource_entry_t){
+            .idx =3D package ? MSR_DTS_PACKAGE_THERM_STATUS : MSR_DTS_THER=
M_STATUS
+        },
+        (xc_resource_entry_t){ .idx =3D MSR_DTS_TEMPERATURE_TARGET },
+    };
+    struct xc_resource_op ops =3D {
+        .cpu =3D cpu,
+        .entries =3D entries,
+        .nr_entries =3D 2,
+    };
+    int tjmax;
+
+    int ret =3D xc_resource_op(xch, 1, &ops);
+
+    if ( ret <=3D 0 )
+        /* This CPU isn't online or can't query this MSR */
+        return ret ?: -EOPNOTSUPP;
+
+    if ( ret =3D=3D 2 )
+        tjmax =3D (entries[1].val >> 16) & 0xff;
+    else
+    {
+        /*
+         * The CPU doesn't support MSR_IA32_TEMPERATURE_TARGET, we assume =
it's 100 which
+         * is correct aside a few selected Atom CPUs. Check coretemp sourc=
e code for more
+         * information.
+         */
+        fprintf(stderr, "[CPU%d] MSR_IA32_TEMPERATURE_TARGET is not suppor=
ted, assume "
+                "tjmax=3D100=C2=B0C, readings may be incorrect\n", cpu);
+        tjmax =3D 100;
+    }
+    
+    *temp =3D tjmax - ((entries[0].val >> 16) & 0xff);
+    return 0;
+}
+
+
+void get_intel_temp(int argc, char *argv[])
+{
+    int temp, cpu =3D -1, socket;
+    bool has_data =3D false;
+
+    if (argc > 0)
+        parse_cpuid(argv[0], &cpu);
+
+    if (cpu !=3D -1)
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
+            printf("Package%d: %d=C2=B0C\n", socket, temp);
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
@@ -1618,12 +1709,12 @@ struct {
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



