Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GB3fDt8X1Wm30AcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 16:42:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9825C3B03B9
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 16:42:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275044.1561019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA78d-00037b-BX; Tue, 07 Apr 2026 14:10:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275044.1561019; Tue, 07 Apr 2026 14:10:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA78d-000350-8e; Tue, 07 Apr 2026 14:10:43 +0000
Received: by outflank-mailman (input) for mailman id 1275044;
 Tue, 07 Apr 2026 14:10:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69d5105d.v1-23bd0bc15e884cac9101909b7eb64678@bounce.vates.tech>)
 id 1wA78b-00034b-R9
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 14:10:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA78Z-00229E-JA
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 16:10:39 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69d5105d.v1-23bd0bc15e884cac9101909b7eb64678@bounce.vates.tech>)
 id 69d5105a-5cb7-0a2a0a5109dd-0a2a4502cd08-30
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 16:10:39 +0200
Received: from [198.2.136.16] (helo=mail136-16.atl41.mandrillapp.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69d5105d.v1-23bd0bc15e884cac9101909b7eb64678@bounce.vates.tech>)
 id 69d5105e-42fa-0a2a45020019-c6028810fdb6-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 16:10:39 +0200
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-16.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4fqp4t04sXz8XRqMW
 for <xen-devel@lists.xenproject.org>; Tue,  7 Apr 2026 14:10:38 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 23bd0bc15e884cac9101909b7eb64678; Tue, 07 Apr 2026 14:10:37 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="teddy.astie@vates.tech" header.h="From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1775571038; x=1775841038;
	bh=ijHox48zfwhifLBy2nWwxBWaZv3Ku8mFkgnfo6+c9Ik=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=TGrejU11l/v1fEBn9oYMugyxH4kjOsVplYjVVfJYaIKyhLblFzGuHd43P1yuN4mI1
	 3xJxr2NDlSnwWjY9n3sDR8BThCiRNJL4eMO8fu57xjiT+aJwJbPSmlraHCnwQSSZAt
	 6ta/KMsXawGTJWm+wf3LqLXYtVWXWmISOmII0dbHz0d2U7TBbDgHafysMUJgCrlR0d
	 +7CWwsWY+HHipblMuxIGLqSAQ2sZPy3nvdr2+ttbHDn+IN7LM9hiQyTauVFRs1e1KI
	 0lsDxBEXnp4xDDMQrWNk1wMudIsRLJzyY223+gs9NllU6Xg0975oNHH4qOZQ5VZqRU
	 4ayeVyhH4MsPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1775571038; x=1775831538; i=teddy.astie@vates.tech;
	bh=ijHox48zfwhifLBy2nWwxBWaZv3Ku8mFkgnfo6+c9Ik=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=U7TcAtP7ezIpKZRHjVWg8JcfNWodRmbmFKhoa8l+NqGkMc73chIB666TZn/RJO7gZ
	 0RxUARzotAKFh2JT0NYXFZBLSqFspGmfNOUK6Pjcnri2AK7V21EF4gXhQd4GmWjUpM
	 9nvqIUXhjGc4ywvGIHVpEPx62J9oNwWljlrNuY06Wx6xFoUhj8RFPLwI/2UZQ8N7gn
	 7lsw+l59Tb6H1no5NEOhx0g1Alx/poLaOmNE+yHyKdot83w7SSszO0lhk4X5uRl2pV
	 5PPXre25vpE6e1g9O4yDqj/g96yGVjtoqbVdkRjOHdeFpQrkPUs4jZ11c4T2GzKHKQ
	 iHlc/0ZG/4NCA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v10]=20xenpm:=20Add=20get-core-temp=20subcommand?=
X-Mailer: git-send-email 2.52.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1775571036889
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Community Manager" <community.manager@xenproject.org>, "Anthony PERARD" <anthony.perard@vates.tech>
Message-Id: <22bcde2914c0303b2c594485542af19d2952e782.1775570823.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.23bd0bc15e884cac9101909b7eb64678?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260407:md
Date: Tue, 07 Apr 2026 14:10:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1775571039-46F21CD1-A94C944A/0/0
X-purgate-type: clean
X-purgate-size: 6994
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:anthony.perard@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,keepachangelog.com:url,changelog.md:url];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[vates.tech,gmail.com,xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.999];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9825C3B03B9
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

get-core-temp allows querying the per-core CPU temperature and
per-package one on processors that supports Digital Temperature Sensors
(most Intel processors; as usual Dom0 drivers cannot work due to
misalignment between Dom0 vCPU and pCPUs).

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
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
v9:
 - exit with EXIT_{SUCCESS,FAILURE} instead of errno
v10:
 - make error handling more uniform
 - removed "No data" message
 - stop querying package temperature on failure

 CHANGELOG.md       |   2 +
 tools/misc/xenpm.c | 121 ++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 122 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 166df43c63..c8cb125fae 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -16,6 +16,8 @@ The format is based on [Keep a Changelog](https://keepach=
angelog.com/en/1.0.0/)
      mitigate (by rate-limiting) the system wide impact of an HVM guest
      misusing atomic instructions.
    - Support for CPIO microcode in discrete multiboot modules.
+   - Introduce get-core-temp to xenpm to query CPU temperatures on Intel
+     platforms.
 
  - On Arm:
    - Support for guest suspend and resume to/from RAM via vPSCI.
diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index e4902d2e82..3371bb5be7 100644
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
@@ -1354,6 +1358,121 @@ void enable_turbo_mode(int argc, char *argv[])
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
+        errno =3D ENODATA;
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
+        if ( fetch_dts_temp(xc_handle, cpu, false, &temp) )
+        {
+            fprintf(stderr, "Unable to fetch temperature (%d - %s)\n",
+                    errno, strerror(errno));
+            exit(EXIT_FAILURE);
+        }
+        else
+            printf("CPU%d: %d=C2=B0C\n", cpu, temp);
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
+            /* CPU may not support package temperatures, but still support=
 DTS */
+            break;
+        }
+
+        has_data =3D true;
+        printf("Package%u: %d=C2=B0C\n", socket, temp);
+    }
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
+        exit(EXIT_FAILURE);
+}
+
 void disable_turbo_mode(int argc, char *argv[])
 {
     int cpuid =3D -1;
@@ -1618,12 +1737,12 @@ struct {
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
2.52.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



