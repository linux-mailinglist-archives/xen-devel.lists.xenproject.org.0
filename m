Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37176CB0B26
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 18:19:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182038.1505006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT1Mo-0006JQ-IC; Tue, 09 Dec 2025 17:19:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182038.1505006; Tue, 09 Dec 2025 17:19:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT1Mo-0006He-EI; Tue, 09 Dec 2025 17:19:14 +0000
Received: by outflank-mailman (input) for mailman id 1182038;
 Tue, 09 Dec 2025 17:19:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hCwd=6P=bounce.vates.tech=bounce-md_30504962.69385a0b.v1-21d2e1777ca04a7091d0d35e25548d7b@srs-se1.protection.inumbo.net>)
 id 1vT1Mm-0005cC-Dc
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 17:19:12 +0000
Received: from mail132-20.atl131.mandrillapp.com
 (mail132-20.atl131.mandrillapp.com [198.2.132.20])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2bc38c9e-d523-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 18:19:09 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-20.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4dQlvH1CywzFCWZfk
 for <xen-devel@lists.xenproject.org>; Tue,  9 Dec 2025 17:19:07 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 21d2e1777ca04a7091d0d35e25548d7b; Tue, 09 Dec 2025 17:19:07 +0000
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
X-Inumbo-ID: 2bc38c9e-d523-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1765300747; x=1765570747;
	bh=zvMOjJbC3NJhvuZJArpCM9fymz4oseW7zzXMIWEo6DE=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=f42K+JBGBAh1On1+4KXoKqwd9f1LV089sGWOfN52Xo/zdkDSKE/A+IuGhoCett1LV
	 d8OMOPqoeVPeti9o44IcuhBX8MhOQZSaju7fsKsBs+L/+nlW9Jq/H6Ymy1s+hhfTlN
	 9CLOkSfN/XXdRfxCfBlDy8lS8CWWKBoxY2q1e//BftCkvwu99xbRL+CENcO7dBk9zu
	 L0rG+1/e/uacvxBmXCWqDS1KVvpwhXU91mNvXXFfnBVEQD+dW9HDGXW1gQuXrPM0Cf
	 5ZjbhYmAM+EEYoZ6MpYJl5u+2+Jg3U1UrKEHhMl8gQaw9NJhmwPp1DjVJFaQII7yoB
	 xuMX7AZXsTKGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1765300747; x=1765561247; i=teddy.astie@vates.tech;
	bh=zvMOjJbC3NJhvuZJArpCM9fymz4oseW7zzXMIWEo6DE=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=eQlqKyqHNdvdxSkCrI14GMPJprROGJWDff06mKwIVBL3LgDFCCXwo9Oh8DWd5SuFk
	 3AjE2FOpLh7zKjwiZqXiFvZF0usGrrWwn1keqLgCoMPjYkBBZhGACntPYVwknEGSi2
	 c3//bPOc1IoIkY0kxFUJbZ1iMrwyCHBZnwmjGYLqRmbSr7VbQQRF7KBC9s6suV8gHb
	 mHYvSs2MPao/o6XglU0XJ2rraeHOCFFRVyCDzDjbIq8+ATA2UM7K1IdFHkopkNzFB3
	 UW/ENX7cPNal1Nq8cUH8/SMHCAC7I+KYEuRBJWWJjBICwd6d2yM7zRoWMLuMr8Wrz7
	 PrCoTXy30vHHQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v3=203/3]=20xenpm:=20Add=20get-intel-temp=20subcommand?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1765300746610
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>
Message-Id: <6fcfea5d3f6be1bcf1d34ea5ccec40a477100472.1765300623.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1765300623.git.teddy.astie@vates.tech>
References: <cover.1765300623.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.21d2e1777ca04a7091d0d35e25548d7b?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251209:md
Date: Tue, 09 Dec 2025 17:19:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

get-intel-temp allows querying the per-core CPU temperature and
per-package one on Intel processors (as usual Dom0 drivers cannot
work due to misalignment between Dom0 vCPU and pCPUs).

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 tools/misc/xenpm.c | 91 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 90 insertions(+), 1 deletion(-)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 682d092479..1558f6c250 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -30,6 +30,7 @@
 #include <inttypes.h>
 #include <sys/time.h>
 
+#include <xen/asm/msr-index.h>
 #include <xen-tools/common-macros.h>
 
 #define MAX_PKG_RESIDENCIES 12
@@ -37,6 +38,7 @@
 
 static xc_interface *xc_handle;
 static unsigned int max_cpu_nr;
+static xc_physinfo_t physinfo;
 
 /* help message */
 void show_help(void)
@@ -93,6 +95,7 @@ void show_help(void)
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
@@ -1354,6 +1357,92 @@ void enable_turbo_mode(int argc, char *argv[])
                 errno, strerror(errno));
 }
 
+static int fetch_dts_temp(xc_interface *xch, uint32_t cpu, bool package, i=
nt *temp)
+{
+    xc_resource_entry_t entries[2] =3D {
+        (xc_resource_entry_t){
+            .idx =3D package ? MSR_PACKAGE_THERM_STATUS : MSR_IA32_THERM_S=
TATUS
+        },
+        (xc_resource_entry_t){ .idx =3D MSR_TEMPERATURE_TARGET },
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
+    int temp, cpu =3D -1;
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
@@ -1618,12 +1707,12 @@ struct {
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



