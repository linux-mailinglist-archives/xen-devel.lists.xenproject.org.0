Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOL1Mqu9iWneBQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 11:57:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3940A10E6F1
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 11:57:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225171.1531652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpOYV-0004DI-0Y; Mon, 09 Feb 2026 10:31:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225171.1531652; Mon, 09 Feb 2026 10:31:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpOYU-0004AO-TF; Mon, 09 Feb 2026 10:31:46 +0000
Received: by outflank-mailman (input) for mailman id 1225171;
 Mon, 09 Feb 2026 10:31:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PW1f=AN=bounce.vates.tech=bounce-md_30504962.6989b78d.v1-7a9873fa657341e6a0418bb5867dd057@srs-se1.protection.inumbo.net>)
 id 1vpOYU-0004AI-06
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 10:31:46 +0000
Received: from mail177-22.suw61.mandrillapp.com (unknown [198.2.177.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8639f82c-05a2-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 11:31:44 +0100 (CET)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-22.suw61.mandrillapp.com (Mailchimp) with ESMTP id
 4f8gwY23ylzGlspCH
 for <xen-devel@lists.xenproject.org>; Mon,  9 Feb 2026 10:31:41 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 7a9873fa657341e6a0418bb5867dd057; Mon, 09 Feb 2026 10:31:41 +0000
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
X-Inumbo-ID: 8639f82c-05a2-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1770633101; x=1770903101;
	bh=Q+QF0oPxFfiCTygOaUN36BYB9qNIhQFyHxEA4lBnZXc=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=wUJC4LKKllCm00wyWejCRzbBv0sT8de/rMxXNSsne1jhBl7qMqInwrybrjA7P5V/R
	 pShxCqPP9/QsA0/C9ESHpBZ9i1DQzA1gcrS13MntZXzvO7goS3mEPaNP75fmC720jc
	 XGpWHCLGuMxAERC0Ya8XgG0KI88ffzQ4h4G/DQih83IozMK71ZuYRUGf6T26hTeq5F
	 N7fLTs3sfX0hluBILcKBqwPR0JZjyEgUIPo0ENQCbhj6QBAsElo4wPoB4SJOagbfjz
	 Ztyv8P9Tol4VnknTR0h/2XQK0uXoowlh0hXhZFflCu3FVUWZD9WKU/8BOqE1iKlsX5
	 9uPZ02zCZr8ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1770633101; x=1770893601; i=teddy.astie@vates.tech;
	bh=Q+QF0oPxFfiCTygOaUN36BYB9qNIhQFyHxEA4lBnZXc=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=MjTV6GNEzHQNdPYEp5U2pI+bV5n5dNcXbCfbK6SO0le3a5nbTuMe5I6uRZO37xhlz
	 LOZwexF38MZT5YGwm5jJJ0GuuS2JnPBU3pqsg1qeqA6wuEJ/Gh7nraDkd/JPe+iLQK
	 9/Wh1acN96X4u8hEsWQDfwcpNOoe9ev/lte6DD4pOZmOwfKC+b2MEMxWVH9DyuHfP/
	 30QxMjTo9oGh0EOnZpOQzl9Aj8Su/PKytywq9eJQmqEFcSx2irR+kGCzt9+dXZMrhr
	 QPbk176OYb6r+GXP+V3toAY+VLrqhfmcjQWQYW586VCNcWKWJL2nwWY+p+ORTDtjRn
	 3H4EPEwnCLTlQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v6]=20xenpm:=20Add=20get-intel-temp=20subcommand?=
X-Mailer: git-send-email 2.53.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1770633100428
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Community Manager" <community.manager@xenproject.org>, "Anthony PERARD" <anthony.perard@vates.tech>, "Jan Beulich" <jbeulich@suse.com>
Message-Id: <489a4decf4367a9983a63fb4987d8c5f6267ed9f.1770632848.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.7a9873fa657341e6a0418bb5867dd057?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260209:md
Date: Mon, 09 Feb 2026 10:31:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.01 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUSPICIOUS_RECIPS(1.50)[];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,keepachangelog.com:url,changelog.md:url,mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[vates.tech,gmail.com,xenproject.org,suse.com];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.963];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3940A10E6F1
X-Rspamd-Action: add header
X-Spam: Yes

get-intel-temp allows querying the per-core CPU temperature and
per-package one on Intel processors (as usual Dom0 drivers cannot
work due to misalignment between Dom0 vCPU and pCPUs).

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
CC: Jan Beulich <jbeulich@suse.com>

v4: https://lore.kernel.org/xen-devel/cover.1766158766.git.teddy.astie@vate=
s.tech/
v5: Removed trailing whitespace.
v6: Report errors through errno and use strerror() to display them
---

 CHANGELOG.md       |   2 +
 tools/misc/xenpm.c | 131 ++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 132 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 18f3d10f20..d7fac4a8d0 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -13,6 +13,8 @@ The format is based on [Keep a Changelog](https://keepach=
angelog.com/en/1.0.0/)
    - Support for Bus Lock Threshold on AMD Zen5 and later CPUs, used by Xe=
n to
      mitigate (by rate-limiting) the system wide impact of an HVM guest
      misusing atomic instructions.
+   - Introduce get-intel-temp to xenpm to query CPU temperatures on Intel
+     platforms.
 
 ### Removed
  - On x86:
diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 682d092479..de490b6507 100644
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
@@ -1354,6 +1358,131 @@ void enable_turbo_mode(int argc, char *argv[])
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
+        errno =3D -ENOMEM;
+        return -1;
+
+    case 0:
+        /* This CPU isn't online or can't query this MSR */
+        errno =3D -ENODATA;
+        return -1;
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
d", ret);
+            errno =3D -EINVAL;
+        }
+        else
+            errno =3D ret;
+        return -1;
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
+        {
+            fprintf(stderr, "Unable to fetch temperature (%d - %s)\n",
+                    errno, strerror(errno));
+            printf("No data\n");
+        }
+        return;
+    }
+
+    /* Per socket measurement */
+    for ( socket =3D 0, cpu =3D 0; cpu < max_cpu_nr;
+          socket++, cpu +=3D physinfo.cores_per_socket * physinfo.threads_=
per_core )
+    {
+        if ( fetch_dts_temp(xc_handle, cpu, true, &temp) )
+        {
+            fprintf(stderr,
+                    "[Package%u] Unable to fetch temperature (%d - %s)\n",
+                    cpu, errno, strerror(errno));
+            continue;
+        }
+
+        has_data =3D true;
+        printf("Package%u: %d=C2=B0C\n", socket, temp);
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
+        {
+            fprintf(stderr, "[CPU%d] Unable to fetch temperature (%d - %s)=
\n",
+                    cpu, errno, strerror(errno));
+            continue;
+        }
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
@@ -1618,12 +1747,12 @@ struct {
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
2.53.0



--
 | Vates

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



