Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oL6dHM7RoWkfwgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Feb 2026 18:18:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9801BB52F
	for <lists+xen-devel@lfdr.de>; Fri, 27 Feb 2026 18:18:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1242978.1543070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw1CE-00055s-Tx; Fri, 27 Feb 2026 17:00:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1242978.1543070; Fri, 27 Feb 2026 17:00:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw1CE-00053F-RM; Fri, 27 Feb 2026 17:00:10 +0000
Received: by outflank-mailman (input) for mailman id 1242978;
 Fri, 27 Feb 2026 17:00:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/6pX=A7=bounce.vates.tech=bounce-md_30504962.69a1cd96.v1-f104bc196f53452b83029a520c335318@srs-se1.protection.inumbo.net>)
 id 1vw1CD-00042Z-0q
 for xen-devel@lists.xenproject.org; Fri, 27 Feb 2026 17:00:09 +0000
Received: from mail178-23.suw51.mandrillapp.com
 (mail178-23.suw51.mandrillapp.com [198.2.178.23])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c48b9449-13fd-11f1-b164-2bf370ae4941;
 Fri, 27 Feb 2026 18:00:07 +0100 (CET)
Received: from pmta13.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail178-23.suw51.mandrillapp.com (Mailchimp) with ESMTP id
 4fMvhQ5v1yz35hfJ8
 for <xen-devel@lists.xenproject.org>; Fri, 27 Feb 2026 17:00:06 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f104bc196f53452b83029a520c335318; Fri, 27 Feb 2026 17:00:06 +0000
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
X-Inumbo-ID: c48b9449-13fd-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1772211606; x=1772481606;
	bh=ahChLrMLIwGTkk7Ei8nA/Gjew8ewv7h2QyrhOulApCs=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=cfmFE9uKr9MkLo15hr2SFefN2OMEiV1lBEtxzOdbPAVEeGBADnjdZjje+qLyGrNil
	 EOpYXTXqe3ycTWeBess4aM9f0/+7+T+XvVwDxighHdflt1VsLjPr2oiUqFhM8Wr1FK
	 9ca+YdlEuT1fqADZl0NqUdzyyIqif3oUs4oJfFlLLd2W14zKPuKaWKQanIT2+avjdd
	 K7oIbCQsoli+S3KDp14KmxQSl7qPJ1MSZTs5O8H4HnTdzyHtVrhaPNjrS7MT9IQxMv
	 lamBY5EfeYOdnDRPlxs3fTptlT/AWmp8wndRPj9AWHRA4RAVEMb6C7n46kOeDMJby8
	 dW6UqCutbi5CA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1772211606; x=1772472106; i=teddy.astie@vates.tech;
	bh=ahChLrMLIwGTkk7Ei8nA/Gjew8ewv7h2QyrhOulApCs=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ZPLU303VNGy47vc+9aYZSefKjG8z3MxaELMwJFO4vah+M8qcZ9RNG3kq9XuxCq+Yh
	 cjGxrGV7EqXoAR6iNC5w9k3yr+o4FgGrQWBYZkox0o4V7g8IELx2x1VuxOpjpKCSLJ
	 dLz7AGE+x2tErET9wQjCPxA3HfUkynqa30ZtYzgdFX/BKZ5RneRJ64+E29uc7RvvcJ
	 fQnD1QGwvTyNtk3YjAFW/JbwQ7uvgd7zQ1BJwQKS6MAuE+K3VwmUIHuU7sjQl4VMVt
	 lEpnRQP+lQ+uUEZ7E5wwnCKdR2rFZtVNwFZv4MZX5hqsdi5ZvGqcTHKN9mgR2601K7
	 EM2b6JPc2SQWQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v8=202/2]=20xenpm:=20Add=20get-core-temp=20subcommand?=
X-Mailer: git-send-email 2.53.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1772211606094
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Community Manager" <community.manager@xenproject.org>, "Anthony PERARD" <anthony.perard@vates.tech>, "Jan Beulich" <jbeulich@suse.com>
Message-Id: <aadf2e78f91f442964cc4e93c028b6b31fceb9eb.1772211384.git.teddy.astie@vates.tech>
In-Reply-To: <ec92e54a493a16f5bc085738e943b3778c3a0231.1772211384.git.teddy.astie@vates.tech>
References: <ec92e54a493a16f5bc085738e943b3778c3a0231.1772211384.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f104bc196f53452b83029a520c335318?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260227:md
Date: Fri, 27 Feb 2026 17:00:06 +0000
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
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:mid,vates.tech:dkim,vates.tech:url,vates.tech:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,mandrillapp.com:dkim,changelog.md:url,keepachangelog.com:url,suse.com:email];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[vates.tech,gmail.com,xenproject.org,suse.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CB9801BB52F
X-Rspamd-Action: add header
X-Spam: Yes

get-core-temp allows querying the per-core CPU temperature and
per-package one on processors that supports Digital Temperature Sensors
(most Intel processors; as usual Dom0 drivers cannot work due to
misalignment between Dom0 vCPU and pCPUs).

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
CC: Jan Beulich <jbeulich@suse.com>

v4: https://lore.kernel.org/xen-devel/cover.1766158766.git.teddy.astie@vate=
s.tech/
v5: Removed trailing whitespace.
v6: Report errors through errno and use strerror() to display them
v7:
 - Rename get-intel-temp with get-dts-temp
 - handle properly errno
 - make process return a error code if no data
v8:
 - update Changelog
 - improve error handling
 - rename core-dts-temp with get-core-temp

 CHANGELOG.md       |   2 +
 tools/misc/xenpm.c | 127 ++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 128 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 18f3d10f20..ac2a0412e0 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -13,6 +13,8 @@ The format is based on [Keep a Changelog](https://keepach=
angelog.com/en/1.0.0/)
    - Support for Bus Lock Threshold on AMD Zen5 and later CPUs, used by Xe=
n to
      mitigate (by rate-limiting) the system wide impact of an HVM guest
      misusing atomic instructions.
+   - Introduce get-core-temp to xenpm to query CPU temperatures on Intel
+     platforms.
 
 ### Removed
  - On x86:
diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 682d092479..981d3ec519 100644
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
+            " get-core-temp          [cpuid]      get CPU temperature for =
<cpuid> or all (Intel only)\n"
             " start [seconds]                     start collect Cx/Px stat=
istics,\n"
             "                                     output after CTRL-C or S=
IGINT or several seconds.\n"
             " enable-turbo-mode     [cpuid]       enable Turbo Mode for pr=
ocessors that support it.\n"
@@ -1354,6 +1358,127 @@ void enable_turbo_mode(int argc, char *argv[])
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
+    case 0:
+        /* This CPU isn't online or can't query this MSR */
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
+            errno =3D EINVAL;
+        }
+        return -1;
+    }
+
+    *temp =3D tjmax - ((entries[0].val >> 16) & 0xff);
+    return 0;
+}
+
+static void get_core_temp(int argc, char *argv[])
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
+            exit(ENODATA);
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
+    {
+        printf("No data\n");
+        exit(ENODATA);
+    }
+}
+
 void disable_turbo_mode(int argc, char *argv[])
 {
     int cpuid =3D -1;
@@ -1618,12 +1743,12 @@ struct {
     { "set-max-cstate", set_max_cstate_func},
     { "enable-turbo-mode", enable_turbo_mode },
     { "disable-turbo-mode", disable_turbo_mode },
+    { "get-core-temp", get_core_temp },
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
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



