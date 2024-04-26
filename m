Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8904D8B3A40
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 16:43:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712866.1113767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Mmy-0003QG-1d; Fri, 26 Apr 2024 14:43:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712866.1113767; Fri, 26 Apr 2024 14:43:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Mmx-0003No-Tw; Fri, 26 Apr 2024 14:42:59 +0000
Received: by outflank-mailman (input) for mailman id 712866;
 Fri, 26 Apr 2024 14:42:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=duI6=L7=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1s0Mmw-0002dZ-8z
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 14:42:58 +0000
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [2607:f8b0:4864:20::72e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44b6d903-03db-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 16:42:56 +0200 (CEST)
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-78edc3e80e6so150387885a.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 07:42:56 -0700 (PDT)
Received: from georged-x-u.xenrt.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 wx37-20020a05620a5a6500b0078eebee6a49sm6391956qkn.85.2024.04.26.07.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 07:42:54 -0700 (PDT)
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
X-Inumbo-ID: 44b6d903-03db-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714142575; x=1714747375; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8yn6T7IqQEgUAHalNDjkKfmuSaFoqQRiuEkZOIS95g=;
        b=N70R86irYQb6knMO0NpHp2/3HXcK8j6uMN4wxlIhPLUrZgoP9VJHCaJ+VjKKh2JRUt
         yHs87aAOdPuN6sUCAd8UR12Qnco+YN+lehAjz0m2YUUYtVzsFE+QZ55kWUeVT0qCOaHq
         KfkIiA579DMv38NnO3uU8FD/rq3ycswURmt7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714142575; x=1714747375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8yn6T7IqQEgUAHalNDjkKfmuSaFoqQRiuEkZOIS95g=;
        b=CicynZqnxUTH7OUvQ8p/BZHJcvhRgJ305fZbKR0TlT52G566hifJgau+0VaR9u23/6
         lfwBM4Ay6f2ti3kACFdLiG4rE3rvnaEPwkMROovzhJShkCFAY/2xkZ2b55VAkzJlBDMg
         pbLSIYs+v7RItkQTkETAz12QwAfSJ4R2P0epAylc73xQNOfQPXEaZlKhnfmc3UbY1viR
         ClvHfUnH7ML4RFu2bubTrySePoPQ8Fau1JDXvp3pTPDNm4pVg5IIBVbnpbvyvCpPYZgg
         wsZeATT+3JYDvcd9xjV++S08SKJmZbZAxMHsCmaYvl4XVHYyLjH4Hv4XH9gi3w99R5Lr
         Nj+A==
X-Gm-Message-State: AOJu0YyBzJRoSOlWSamnVYHZ5Fe2ZJQvvbT6N9YDuH29kpS6Pp8O65bv
	4SIVRoHyyL5C2/bXzHySMy6W6q3pB2R2gh4yfROmh+wgh7+CiPErETqFPIAP0Ggvxd2NoZJs5R1
	O
X-Google-Smtp-Source: AGHT+IFTOkjGoE/3qNYPx0N2ULtnSyh6LwT5cbhmi/jXnG10kYGNE5s7OblY+msDpdZLUKjMET1NEw==
X-Received: by 2002:a05:620a:562b:b0:78d:76f9:1790 with SMTP id vv11-20020a05620a562b00b0078d76f91790mr2873516qkn.77.1714142574709;
        Fri, 26 Apr 2024 07:42:54 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@cloud.com>,
	Anthony Perard <anthony.perard@cloud.com>,
	Olaf Hering <olaf@aepfle.de>
Subject: [PATCH 3/3] tools/xentrace: Remove xentrace_format
Date: Fri, 26 Apr 2024 15:32:31 +0100
Message-Id: <20240426143231.4007671-4-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240426143231.4007671-1-george.dunlap@cloud.com>
References: <20240426143231.4007671-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xentrace_format was always of limited utility, since trace records
across pcpus were processed out of order; it was superseded by xenalyze
over a decade ago.

But for several releases, the `formats` file it has depended on for
proper operation has not even been included in `make install` (which
generally means it doesn't get picked up by distros either); yet
nobody has seemed to complain.

Simple remove xentrace_format, and point people to xenalyze instead.

NB that there is no man page for xenalyze, so the "see also" on the
xentrace man page is simply removed for now.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@cloud.com>
CC: Anthony Perard <anthony.perard@cloud.com>
CC: Olaf Hering <olaf@aepfle.de>
---
 docs/man/xentrace.8.pod        |   5 +-
 docs/man/xentrace_format.1.pod |  46 ------
 tools/xentrace/Makefile        |   3 -
 tools/xentrace/formats         | 231 -----------------------------
 tools/xentrace/xentrace.c      |   2 +-
 tools/xentrace/xentrace_format | 264 ---------------------------------
 6 files changed, 2 insertions(+), 549 deletions(-)

diff --git a/docs/man/xentrace.8.pod b/docs/man/xentrace.8.pod
index 4c174a84c0..7c9f69c67f 100644
--- a/docs/man/xentrace.8.pod
+++ b/docs/man/xentrace.8.pod
@@ -20,7 +20,7 @@ D1...D5 are the trace data.
 Data is dumped onto the standard output (which must not be a TTY) or a
 I<FILE> specified on the command line.
 
-The output should be parsed using the tool xentrace_format, which can
+The output should be parsed using the tool xenalyze, which can
 produce human-readable output in ASCII format.
 
 
@@ -157,6 +157,3 @@ B<xentrace> collects the following events from the trace buffer:
 
 Mark A. Williamson <mark.a.williamson@intel.com>
 
-=head1 SEE ALSO
-
-xentrace_format(1)
diff --git a/docs/man/xentrace_format.1.pod b/docs/man/xentrace_format.1.pod
deleted file mode 100644
index e05479a83b..0000000000
--- a/docs/man/xentrace_format.1.pod
+++ /dev/null
@@ -1,46 +0,0 @@
-=head1 NAME
-
-xentrace_format - pretty-print Xen trace data
-
-=head1 SYNOPSIS
-
-B<xentrace_format> [ I<DEFS-FILE> ]
-
-=head1 DESCRIPTION
-
-B<xentrace_format> parses trace data in B<xentrace> binary format from
-standard input and reformats it according to the rules in a file of
-definitions (I<DEFS-FILE>), printing to standard output.
-
-The rules in I<DEFS-FILE> should have the format shown below:
-
-I<event_id> I<whitespace> I<format>
-
-Each rule should start on a new line.
-
-The format string may include format specifiers, such as:
-%(cpu)d, %(tsc)d, %(event)d, %(1)d, %(2)d, %(3)d, %(4)d, %(5)d
-
-[ the `d' format specifier output in decimal, alternatively `x'
-  will output in hexadecimal and `o' will output in octal ]
-
-These correspond to the CPU number, event ID, timestamp counter and
-the 5 data fields from the trace record.  There should be one such
-rule for each type of event to be pretty-printed (events which do not
-have formatting rules are ignored).
-
-A sample format file for Xen's predefined trace events is available
-in the file tools/xentrace/formats in the Xen source tree.
-
-Depending on your system and the rate at which trace data is produced,
-this script may not be able to keep up with the output of
-B<xentrace> if it is piped directly.  In these circumstances you
-should have B<xentrace> output to a file for processing off-line.
-
-=head1 AUTHOR
-
-Mark A. Williamson <mark.a.williamson@intel.com>
-
-=head1 SEE ALSO
-
-xentrace(8)
diff --git a/tools/xentrace/Makefile b/tools/xentrace/Makefile
index d50d400472..bf960c0867 100644
--- a/tools/xentrace/Makefile
+++ b/tools/xentrace/Makefile
@@ -10,7 +10,6 @@ LDLIBS += $(ARGP_LDFLAGS)
 BIN     := xenalyze
 SBIN    := xentrace xentrace_setsize
 LIBBIN  := xenctx
-SCRIPTS := xentrace_format
 
 TARGETS := $(BIN) $(SBIN) $(LIBBIN)
 
@@ -24,13 +23,11 @@ install: all
 	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
 	$(INSTALL_PROG) $(BIN) $(DESTDIR)$(bindir)
 	$(INSTALL_PROG) $(SBIN) $(DESTDIR)$(sbindir)
-	$(INSTALL_PYTHON_PROG) $(SCRIPTS) $(DESTDIR)$(bindir)
 	$(INSTALL_PROG) $(LIBBIN) $(DESTDIR)$(LIBEXEC_BIN)
 
 .PHONY: uninstall
 uninstall:
 	rm -f $(addprefix $(DESTDIR)$(LIBEXEC_BIN)/, $(LIBBIN))
-	rm -f $(addprefix $(DESTDIR)$(bindir)/, $(SCRIPTS))
 	rm -f $(addprefix $(DESTDIR)$(sbindir)/, $(SBIN))
 	rm -f $(addprefix $(DESTDIR)$(bindir)/, $(BIN))
 
diff --git a/tools/xentrace/formats b/tools/xentrace/formats
deleted file mode 100644
index 3381c1cda5..0000000000
--- a/tools/xentrace/formats
+++ /dev/null
@@ -1,231 +0,0 @@
-0x00000000  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  unknown (0x%(event)016x)  [ 0x%(1)08x 0x%(2)08x 0x%(3)08x 0x%(4)08x 0x%(5)08x 0x%(6)08x 0x%(7)08x ]
-
-0x0001f001  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  lost_records      0x%(1)08x
-0x0001f002  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  wrap_buffer       0x%(1)08x
-0x0001f003  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  cpu_change        0x%(1)08x
-0x0001f004  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  trace_irq    [ vector = %(1)d, count = %(2)d, tot_cycles = 0x%(3)08x, max_cycles = 0x%(4)08x ]
-
-0x00021002  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  continue_running    [ dom:vcpu = 0x%(1)08x ]
-0x00021011  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  running_to_runnable [ dom:vcpu = 0x%(1)08x ]
-0x00021021  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  running_to_blocked  [ dom:vcpu = 0x%(1)08x ]
-0x00021031  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  running_to_offline  [ dom:vcpu = 0x%(1)08x ]
-0x00021101  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  runnable_to_running [ dom:vcpu = 0x%(1)08x ]
-0x00021121  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  runnable_to_blocked [ dom:vcpu = 0x%(1)08x ]
-0x00021131  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  runnable_to_offline [ dom:vcpu = 0x%(1)08x ]
-0x00021201  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  blocked_to_running  [ dom:vcpu = 0x%(1)08x ]
-0x00021211  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  blocked_to_runnable [ dom:vcpu = 0x%(1)08x ]
-0x00021231  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  blocked_to_offline  [ dom:vcpu = 0x%(1)08x ]
-0x00021301  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  offline_to_running  [ dom:vcpu = 0x%(1)08x ]
-0x00021311  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  offline_to_runnable [ dom:vcpu = 0x%(1)08x ]
-0x00021321  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  offline_to_blocked  [ dom:vcpu = 0x%(1)08x ]
-
-0x00028001  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  sched_add_domain  [ domid = 0x%(1)08x ]
-0x00028002  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  sched_rem_domain  [ domid = 0x%(1)08x ]
-0x00028003  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  domain_sleep      [ dom:vcpu = 0x%(1)04x%(2)04x ]
-0x00028004  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  domain_wake       [ dom:vcpu = 0x%(1)04x%(2)04x ]
-0x00028005  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  do_yield          [ dom:vcpu = 0x%(1)04x%(2)04x ]
-0x00028006  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  do_block          [ dom:vcpu = 0x%(1)04x%(2)04x ]
-0x00028007  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  domain_shutdown	  [ dom:vcpu = 0x%(1)04x%(2)04x, reason = 0x%(3)08x ]
-0x00028008  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  sched_ctl
-0x00028009  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  sched_adjdom      [ domid = 0x%(1)08x ]
-0x0002800a  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  __enter_scheduler [ prev<dom:vcpu> = 0x%(1)04x%(2)04x, next<dom:vcpu> = 0x%(3)04x%(4)04x ]
-0x0002800b  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  s_timer_fn
-0x0002800c  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  t_timer_fn
-0x0002800d  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  dom_timer_fn
-0x0002800e  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  switch_infprev    [ dom:vcpu = 0x%(1)04x%(2)04x, runtime = %(3)d ]
-0x0002800f  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  switch_infnext    [ new_dom:vcpu = 0x%(1)04x%(2)04x, time = %(3)d, r_time = %(4)d ]
-0x00028010  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  domain_shutdown_code [ dom:vcpu = 0x%(1)04x%(2)04x, reason = 0x%(3)08x ]
-0x00028011  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  switch_infcont    [ dom:vcpu = 0x%(1)04x%(2)04x, runtime = %(3)d, r_time = %(4)d ]
-
-0x00022001  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  csched:sched_tasklet
-0x00022002  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  csched:account_start [ dom:vcpu = 0x%(1)04x%(2)04x, active = %(3)d ]
-0x00022003  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  csched:account_stop  [ dom:vcpu = 0x%(1)04x%(2)04x, active = %(3)d ]
-0x00022004  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  csched:stolen_vcpu   [ dom:vcpu = 0x%(2)04x%(3)04x, from = %(1)d ]
-0x00022005  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  csched:picked_cpu    [ dom:vcpu = 0x%(1)04x%(2)04x, cpu = %(3)d ]
-0x00022006  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  csched:tickle        [ cpu = %(1)d ]
-0x00022007  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  csched:boost         [ dom:vcpu = 0x%(1)04x%(2)04x ]
-0x00022008  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  csched:unboost       [ dom:vcpu = 0x%(1)04x%(2)04x ]
-0x00022009  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  csched:schedule      [ cpu[16]:tasklet[8]:idle[8] = %(1)08x ]
-0x0002200A  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  csched:ratelimit     [ dom:vcpu = 0x%(1)08x, runtime = %(2)d ]
-0x0002200B  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  csched:steal_check   [ peer_cpu = %(1)d, checked = %(2)d ]
-
-0x00022201  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  csched2:tick
-0x00022202  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  csched2:runq_pos       [ dom:vcpu = 0x%(1)08x, pos = %(2)d]
-0x00022203  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  csched2:credit burn    [ dom:vcpu = 0x%(1)08x, credit = %(2)d, budget = %(3)d, delta = %(4)d ]
-0x00022204  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  csched2:credit_add
-0x00022205  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  csched2:tickle_check   [ dom:vcpu = 0x%(1)08x, credit = %(2)d, score = %(3)d ]
-0x00022206  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  csched2:tickle         [ cpu = %(1)d ]
-0x00022207  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  csched2:credit_reset   [ dom:vcpu = 0x%(1)08x, cr_start = %(2)d, cr_end = %(3)d ]
-0x00022208  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  csched2:sched_tasklet
-0x00022209  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  csched2:update_load
-0x0002220a  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  csched2:runq_assign    [ dom:vcpu = 0x%(1)08x, rq_id = %(2)d ]
-0x0002220b  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  csched2:updt_vcpu_load [ dom:vcpu = 0x%(3)08x, vcpuload = 0x%(2)08x%(1)08x, wshift = %(4)d ]
-0x0002220c  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  csched2:updt_runq_load [ rq_load[16]:rq_id[8]:wshift[8] = 0x%(5)08x, rq_avgload = 0x%(2)08x%(1)08x, b_avgload = 0x%(4)08x%(3)08x ]
-0x0002220d  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  csched2:tickle_new     [ dom:vcpu = 0x%(1)08x, processor = %(2)d credit = %(3)d ]
-0x0002220e  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  csched2:runq_max_weight [ rq_id[16]:max_weight[16] = 0x%(1)08x ]
-0x0002220f  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  csched2:migrrate       [ dom:vcpu = 0x%(1)08x, rq_id[16]:trq_id[16] = 0x%(2)08x ]
-0x00022210  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  csched2:load_check     [ lrq_id[16]:orq_id[16] = 0x%(1)08x, delta = %(2)d ]
-0x00022211  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  csched2:load_balance   [ l_bavgload = 0x%(2)08x%(1)08x, o_bavgload = 0x%(4)08x%(3)08x, lrq_id[16]:orq_id[16] = 0x%(5)08x ]
-0x00022212  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  csched2:pick_cpu       [ b_avgload = 0x%(2)08x%(1)08x, dom:vcpu = 0x%(3)08x, rq_id[16]:new_cpu[16] = %(4)d ]
-0x00022213  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  csched2:runq_candidate [ dom:vcpu = 0x%(1)08x, credit = %(3)d, tickled_cpu = %(2)d ]
-0x00022214  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  csched2:schedule       [ rq:cpu = 0x%(1)08x, tasklet[8]:idle[8]:smt_idle[8]:tickled[8] = %(2)08x ]
-0x00022215  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  csched2:ratelimit      [ dom:vcpu = 0x%(1)08x, runtime = %(2)d ]
-0x00022216  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  csched2:runq_cand_chk  [ dom:vcpu = 0x%(1)08x ]
-
-0x00022801  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  rtds:tickle        [ cpu = %(1)d ]
-0x00022802  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  rtds:runq_pick     [ dom:vcpu = 0x%(1)08x, cur_deadline = 0x%(3)08x%(2)08x, cur_budget = 0x%(5)08x%(4)08x ]
-0x00022803  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  rtds:burn_budget   [ dom:vcpu = 0x%(1)08x, cur_budget = 0x%(3)08x%(2)08x, delta = %(4)d ]
-0x00022804  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  rtds:repl_budget   [ dom:vcpu = 0x%(1)08x, cur_deadline = 0x%(3)08x%(2)08x, cur_budget = 0x%(5)08x%(4)08x ]
-0x00022805  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  rtds:sched_tasklet
-0x00022806  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  rtds:schedule      [ cpu[16]:tasklet[8]:idle[4]:tickled[4] = %(1)08x ]
-
-0x00022A01  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  null:pick_cpu      [ dom:vcpu = 0x%(1)08x, new_cpu = %(2)d ]
-0x00022A02  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  null:assign        [ dom:vcpu = 0x%(1)08x, cpu = %(2)d ]
-0x00022A03  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  null:deassign      [ dom:vcpu = 0x%(1)08x, cpu = %(2)d ]
-0x00022A04  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  null:migrate       [ dom:vcpu = 0x%(1)08x, new_cpu:cpu = 0x%(2)08x ]
-0x00022A05  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  null:schedule      [ cpu[16]:tasklet[16] = %(1)08x, dom:vcpu = 0x%(2)08x ]
-0x00022A06  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  null:sched_tasklet
-
-0x00041001  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  domain_create   [ dom = 0x%(1)08x ]
-0x00041002  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  domain_destroy  [ dom = 0x%(1)08x ]
-
-0x00081001  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  VMENTRY
-0x00081002  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  VMX_EXIT     [ exitcode = 0x%(1)08x, rIP  = 0x%(2)08x ]
-0x00081102  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  VMX_EXIT     [ exitcode = 0x%(1)08x, rIP  = 0x%(3)08x%(2)08x ]
-0x00081003  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  SVM_EXIT     [ exitcode = 0x%(1)08x, rIP  = 0x%(2)08x ]
-0x00081103  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  SVM_EXIT     [ exitcode = 0x%(1)08x, rIP  = 0x%(3)08x%(2)08x ]
-0x00081401  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  nVMENTRY
-0x00081402  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  nVMEXIT     [ exitcode = 0x%(1)08x, rIP  = 0x%(2)08x ]
-0x00081502  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  nVMEXIT     [ exitcode = 0x%(1)08x, rIP  = 0x%(3)08x%(2)08x ]
-0x00082001  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  PF_XEN      [ errorcode = 0x%(2)02x, virt = 0x%(1)08x ]
-0x00082101  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  PF_XEN      [ errorcode = 0x%(3)02x, virt = 0x%(2)08x%(1)08x ]
-0x00082002  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  PF_INJECT   [ errorcode = 0x%(1)02x, virt = 0x%(2)08x ]
-0x00082102  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  PF_INJECT   [ errorcode = 0x%(1)02x, virt = 0x%(3)08x%(2)08x ]
-0x00082003  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  INJ_EXC     [ vector = 0x%(1)02x, errorcode = 0x%(2)04x ]
-0x00082004  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  INJ_VIRQ    [ vector = 0x%(1)02x, fake = %(2)d ]
-0x00082005  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  REINJ_VIRQ  [ vector = 0x%(1)02x ]
-0x00082006  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  IO_READ     [ port = 0x%(1)04x, size = %(2)d ]
-0x00082007  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  IO_WRITE    [ port = 0x%(1)04x, size = %(2)d ]
-0x00082008  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  CR_READ     [ CR# = %(1)d, value = 0x%(2)08x ]
-0x00082108  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  CR_READ     [ CR# = %(1)d, value = 0x%(3)08x%(2)08x ]
-0x00082009  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  CR_WRITE    [ CR# = %(1)d, value = 0x%(2)08x ]
-0x00082109  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  CR_WRITE    [ CR# = %(1)d, value = 0x%(3)08x%(2)08x ]
-0x0008200A  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  DR_READ    
-0x0008200B  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  DR_WRITE
-0x0008200C  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  MSR_READ    [ MSR# = 0x%(1)08x, value = 0x%(3)08x%(2)08x ]
-0x0008200D  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  MSR_WRITE   [ MSR# = 0x%(1)08x, value = 0x%(3)08x%(2)08x ]
-0x0008200E  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  CPUID       [ func = 0x%(1)08x, eax = 0x%(2)08x, ebx = 0x%(3)08x, ecx=0x%(4)08x, edx = 0x%(5)08x ]
-0x0008200F  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  INTR        [ vector = 0x%(1)02x ]
-0x00082010  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  NMI
-0x00082011  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  SMI
-0x00082012  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  VMMCALL     [ func = 0x%(1)08x ]
-0x00082013  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  HLT         [ intpending = %(1)d ]
-0x00082014  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  INVLPG      [ is invlpga? = %(1)d, virt = 0x%(2)08x ]
-0x00082114  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  INVLPG      [ is invlpga? = %(1)d, virt = 0x%(3)08x%(2)08x ]
-0x00082015  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  MCE
-0x00082016  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  IOPORT_READ [ port = 0x%(1)04x, data = 0x%(2)08x ]
-0x00082216  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  IOPORT_WRITE [ port = 0x%(1)04x, data = 0x%(2)08x ]
-0x00082017  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  MMIO_READ   [ port = 0x%(1)08x, data = 0x%(2)08x ]
-0x00082217  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  MMIO_WRITE  [ port = 0x%(1)08x, data = 0x%(2)08x ]
-0x00082018  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  CLTS
-0x00082019  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  LMSW        [ value = 0x%(1)08x ]
-0x00082119  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  LMSW        [ value = 0x%(2)08x%(1)08x ]
-0x0008201a  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  RDTSC       [ value = 0x%(2)08x%(1)08x ]
-0x00082020  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  INTR_WINDOW [ value = 0x%(1)08x ]
-0x00082021  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  NPF         [ gpa = 0x%(2)08x%(1)08x mfn = 0x%(4)08x%(3)08x qual = 0x%(5)04x p2mt = 0x%(6)04x ]
-0x00082023  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  TRAP        [ vector = 0x%(1)02x ]
-
-0x0010f001  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  page_grant_map      [ domid = %(1)d ]
-0x0010f002  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  page_grant_unmap    [ domid = %(1)d ]
-0x0010f003  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  page_grant_transfer [ domid = %(1)d ]
-0x0010f005  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  decrease_reservation   [ d%(3)d gfn 0x%(2)08x%(1)08x, order %(4)u ]
-0x0010f010  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  pod_populate           [ d%(5)d gfn 0x%(2)08x%(1)08x => mfn 0x%(4)08x%(3)08x, order %(6)u ]
-0x0010f011  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  pod_zero_reclaim       [ d%(5)d gfn 0x%(2)08x%(1)08x => mfn 0x%(4)08x%(3)08x, order %(6)u ]
-0x0010f012  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  pod_superpage_splinter [ d%(3)d gfn 0x%(2)08x%(1)08x, order %(4)u ]
-
-0x00201001  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  hypercall  [ eip = 0x%(1)08x, eax = 0x%(2)08x ]
-0x00201101  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  hypercall  [ rip = 0x%(2)08x%(1)08x, eax = 0x%(3)08x ]
-0x00201003  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  trap       [ eip = 0x%(1)08x, trapnr:error = 0x%(2)08x ]
-0x00201103  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  trap       [ rip = 0x%(2)08x%(1)08x, trapnr:error = 0x%(3)08x ]
-0x00201004  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  page_fault [ eip = 0x%(1)08x, addr = 0x%(2)08x, error = 0x%(3)08x ]
-0x00201104  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  page_fault [ rip = 0x%(2)08x%(1)08x, addr = 0x%(4)08x%(3)08x, error = 0x%(5)08x ]
-0x00201005  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  forced_invalid_op   [ eip = 0x%(1)08x ]
-0x00201105  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  forced_invalid_op   [ rip = 0x%(2)08x%(1)08x ]
-0x00201006  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  emulate_privop      [ eip = 0x%(1)08x ]
-0x00201106  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  emulate_privop      [ rip = 0x%(2)08x%(1)08x ]
-0x00201007  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  emulate_4G          [ eip = 0x%(1)08x ]
-0x00201107  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  emulate_4G          [ rip = 0x%(2)08x%(1)08x ]
-0x00201008  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  math_state_restore
-0x00201108  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  math_state_restore
-0x00201009  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  paging_fixup        [ eip = 0x%(1)08x, addr = 0x%(2)08x ]
-0x00201109  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  paging_fixup        [ rip = 0x%(2)08x%(1)08x, addr = 0x%(4)08x%(3)08x ]
-0x0020100a  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  gdt_ldt_mapping_fault  [ eip = 0x%(1)08x, offset = 0x%(2)08x ]
-0x0020110a  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  gdt_ldt_mapping_fault  [ rip = 0x%(2)08x%(1)08x, offset = 0x%(4)08x%(3)08x ]
-0x0020100b  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  ptwr_emulation      [ addr = 0x%(3)08x, eip = 0x%(4)08x, npte = 0x%(2)08x%(1)08x ]
-0x0020110b  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  ptwr_emulation      [ addr = 0x%(4)08x%(3)08x, rip = 0x%(6)08x%(5)08x, npte = 0x%(2)08x%(1)08x ]
-0x0020100c  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  ptwr_emulation_pae  [ addr = 0x%(3)08x, eip = 0x%(4)08x, npte = 0x%(2)08x%(1)08x ]
-0x0020110c  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  ptwr_emulation_pae  [ addr = 0x%(4)08x%(3)08x, rip = 0x%(6)08x%(5)08x, npte = 0x%(2)08x%(1)08x ]
-0x0020100d  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  hypercall  [ op = 0x%(1)08x ]
-0x0020200e  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)    hypercall  [ op = 0x%(1)08x ]
-
-0x0040f001  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  shadow_not_shadow                 [ gl1e = 0x%(2)08x%(1)08x, va = 0x%(3)08x, flags = 0x%(4)08x ]
-0x0040f101  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  shadow_not_shadow                 [ gl1e = 0x%(2)08x%(1)08x, va = 0x%(4)08x%(3)08x, flags = 0x%(5)08x ]
-0x0040f002  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  shadow_fast_propagate             [ va = 0x%(1)08x ]
-0x0040f102  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  shadow_fast_propagate             [ va = 0x%(2)08x%(1)08x ]
-0x0040f003  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  shadow_fast_mmio                  [ va = 0x%(1)08x ]
-0x0040f103  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  shadow_fast_mmio                  [ va = 0x%(2)08x%(1)08x ]
-0x0040f004  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  shadow_false_fast_path            [ va = 0x%(1)08x ]
-0x0040f104  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  shadow_false_fast_path            [ va = 0x%(2)08x%(1)08x ]
-0x0040f005  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  shadow_mmio                       [ va = 0x%(1)08x ]
-0x0040f105  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  shadow_mmio                       [ va = 0x%(2)08x%(1)08x ]
-0x0040f006  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  shadow_fixup                      [ gl1e = 0x%(1)08x, va = 0x%(2)08x, flags = 0x%(3)08x ]
-0x0040f106  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  shadow_fixup                      [ gl1e = 0x%(2)08x%(1)08x, va = 0x%(4)08x%(3)08x, flags = 0x%(3)08x ]
-0x0040f007  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  shadow_domf_dying                 [ va = 0x%(1)08x ]
-0x0040f107  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  shadow_domf_dying                 [ va = 0x%(2)08x%(1)08x ]
-0x0040f008  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  shadow_emulate                    [ gl1e = 0x%(1)08x, write_val = 0x%(2)08x, va = 0x%(3)08x, flags = 0x%(4)08x ]
-0x0040f108  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  shadow_emulate                    [ gl1e = 0x%(2)08x%(1)08x, write_val = 0x%(4)08x%(3)08x, va = 0x%(6)08x%(5)08x, flags = 0x%(7)08x ]
-0x0040f009  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  shadow_emulate_unshadow_user      [ va = 0x%(1)08x, gfn = 0x%(2)08x ]
-0x0040f109  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  shadow_emulate_unshadow_user      [ va = 0x%(2)08x%(1)08x, gfn = 0x%(4)08x%(3)08x ]
-0x0040f00a  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  shadow_emulate_unshadow_evtinj    [ va = 0x%(1)08x, gfn = 0x%(2)08x ]
-0x0040f10a  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  shadow_emulate_unshadow_evtinj    [ va = 0x%(2)08x%(1)08x, gfn = 0x%(4)08x%(3)08x ]
-0x0040f00b  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  shadow_emulate_unshadow_unhandled [ va = 0x%(1)08x, gfn = 0x%(2)08x ]
-0x0040f10b  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  shadow_emulate_unshadow_unhandled [ va = 0x%(2)08x%(1)08x, gfn = 0x%(4)08x%(3)08x ]
-0x0040f00c  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  shadow_emulate_wrmap_bf           [ gfn = 0x%(1)08x ]
-0x0040f10c  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  shadow_emulate_wrmap_bf           [ gfn = 0x%(2)08x%(1)08x ]
-0x0040f00d  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  shadow_emulate_prealloc_unpin     [ gfn = 0x%(1)08x ]
-0x0040f10d  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  shadow_emulate_prealloc_unpin     [ gfn = 0x%(2)08x%(1)08x ]
-0x0040f00e  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  shadow_emulate_resync_full        [ gfn = 0x%(1)08x ]
-0x0040f10e  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  shadow_emulate_resync_full        [ gfn = 0x%(2)08x%(1)08x ]
-0x0040f00f  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  shadow_emulate_resync_only        [ gfn = 0x%(1)08x ]
-0x0040f10f  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  shadow_emulate_resync_only        [ gfn = 0x%(2)08x%(1)08x ]
-
-0x00801001  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  cpu_freq_change [ %(1)dMHz -> %(2)dMHz ]
-0x00801002  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  cpu_idle_entry  [ C0 -> C%(1)d, acpi_pm_tick = %(2)d, expected = %(3)dus, predicted = %(4)dus ]
-0x00801003  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  cpu_idle_exit   [ C%(1)d -> C0, acpi_pm_tick = %(2)d, irq = %(3)d %(4)d %(5)d %(6)d ]
-
-0x00802001  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  cleanup_move_delayed [ irq = %(1)d, vector 0x%(2)x on CPU%(3)d ]
-0x00802002  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  cleanup_move [ irq = %(1)d, vector 0x%(2)x on CPU%(3)d ]
-0x00802003  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  bind_vector [ irq = %(1)d = vector 0x%(2)x, CPU mask: 0x%(3)08x ]
-0x00802004  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  clear_vector [ irq = %(1)d = vector 0x%(2)x, CPU mask: 0x%(3)08x ]
-0x00802005  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  move_vector [ irq = %(1)d had vector 0x%(2)x on CPU%(3)d ]
-0x00802006  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  assign_vector [ irq = %(1)d = vector 0x%(2)x, CPU mask: 0x%(3)08x ]
-0x00802007  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  bogus_vector [ 0x%(1)x ]
-0x00802008  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  do_irq [ irq = %(1)d, began = %(2)dus, ended = %(3)dus ]
-
-0x00084001  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  hpet create [ tn = %(1)d, irq = %(2)d, delta = 0x%(4)08x%(3)08x, period = 0x%(6)08x%(5)08x ]
-0x00084002  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  pit create [ delta = 0x%(1)08x, period = 0x%(2)08x ]
-0x00084003  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  rtc create [ delta = 0x%(1)08x, period = 0x%(2)08x ]
-0x00084004  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  vlapic create [ delta = 0x%(2)08x%(1)08x , period = 0x%(4)08x%(3)08x, irq = %(5)d ]
-0x00084005  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  hpet destroy [ tn = %(1)d ]
-0x00084006  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  pit destroy  [ ]
-0x00084007  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  rtc destroy [ ]
-0x00084008  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  vlapic destroy [ ]
-0x00084009  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  pit callback [ ]
-0x0008400a  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  vlapic callback [ ]
-0x0008400b  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  vpic_update_int_output [ int_output = %(1)d, is_master = %(2)d, irq = %(3)d ]
-0x0008400c  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  vpic vcpu_kick [ irq = %(1)d ]
-0x0008400d  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  __vpic_intack [ is_master = %(1)d, irq = %(2)d ]
-0x0008400e  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  vpic_irq_positive_edge [ irq = %(1)d ]
-0x0008400f  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  vpic_irq_negative_edge [ irq = %(1)d ]
-0x00084010  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  vpic_ack_pending_irq [ accept_pic_intr = %(1)d, int_output = %(2)d ]
-0x00084011  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  vlapic_accept_pic_intr [ i8259_target = %(1)d, accept_pic_int = %(2)d ]
diff --git a/tools/xentrace/xentrace.c b/tools/xentrace/xentrace.c
index be6226f088..63b29f8442 100644
--- a/tools/xentrace/xentrace.c
+++ b/tools/xentrace/xentrace.c
@@ -848,7 +848,7 @@ static void usage(int status)
 "\n" \
 "  CPU(uint) TSC(uint64_t) EVENT(uint32_t) D1 D2 D3 D4 D5 (all uint32_t)\n" \
 "\n" \
-"The output should be parsed using the tool xentrace_format,\n" \
+"The output should be parsed using the tool xenalyze,\n" \
 "which can produce human-readable output in ASCII format.\n" 
 
     printf(USAGE_STR);
diff --git a/tools/xentrace/xentrace_format b/tools/xentrace/xentrace_format
deleted file mode 100644
index 21be16b7e4..0000000000
--- a/tools/xentrace/xentrace_format
+++ /dev/null
@@ -1,264 +0,0 @@
-#!/usr/bin/env python
-
-# by Mark Williamson, (C) 2004 Intel Research Cambridge
-
-# Program for reformatting trace buffer output according to user-supplied rules
-
-from __future__ import division
-from __future__ import print_function
-from __future__ import unicode_literals
-from builtins import str
-import re, sys, string, signal, struct, os, getopt
-
-def usage():
-    print("Usage: " + sys.argv[0] + """ defs-file
-          Parses trace data in binary format, as output by Xentrace and
-          reformats it according to the rules in a file of definitions.  The
-          rules in this file should have the format ({ and } show grouping
-          and are not part of the syntax):
-
-          {event_id}{whitespace}{text format string}
-
-          The textual format string may include format specifiers, such as:
-            %(cpu)d, %(tsc)d, %(event)d, %(1)d, %(2)d, %(3)d, %(4)d, ... 
-          [ the 'd' format specifier outputs in decimal, alternatively 'x'
-            will output in hexadecimal and 'o' will output in octal ]
-
-          Which correspond to the CPU number, event ID, timestamp counter and
-          the 7 data fields from the trace record.  There should be one such
-          rule for each type of event.
-          
-          Depending on your system and the volume of trace buffer data,
-          this script may not be able to keep up with the output of xentrace
-          if it is piped directly.  In these circumstances you should have
-          xentrace output to a file for processing off-line.
-          """, file=sys.stderr)
-    sys.exit(1)
-
-def read_defs(defs_file):
-    defs = {}
-    
-    fd = open(defs_file)
-
-    reg = re.compile('(\S+)\s+(\S.*)')
-
-    while True:
-        line = fd.readline()
-        if not line:
-            break
-
-        if line[0] == '#' or line[0] == '\n':
-            continue
-
-        m = reg.match(line)
-
-        if not m: print("Bad format file", file=sys.stderr) ; sys.exit(1)
-
-        defs[str(eval(m.group(1)))] = m.group(2)
-
-    return defs
-
-def sighand(x,y):
-    global interrupted
-    interrupted = 1
-
-##### Main code
-
-mhz = 0
-
-if len(sys.argv) < 2:
-    usage()
-
-try:
-    opts, arg = getopt.getopt(sys.argv[1:], "c:" )
-
-    for opt in opts:
-        if opt[0] == '-c' : mhz = int(opt[1])
-
-except getopt.GetoptError:
-    usage()
-
-signal.signal(signal.SIGTERM, sighand)
-signal.signal(signal.SIGHUP,  sighand)
-signal.signal(signal.SIGINT,  sighand)
-
-interrupted = 0
-
-try:
-    defs = read_defs(arg[0])
-except IOError as exn:
-    print(exn)
-    sys.exit(1)
-
-# structure of trace record (as output by xentrace):
-# HDR(I) {TSC(Q)} D1(I) D2(I) D3(I) D4(I) D5(I) D6(I) D7(I)
-#
-# HDR consists of EVENT:28:, n_data:3:, tsc_in:1:
-# EVENT means Event ID
-# n_data means number of data (like D1, D2, ...)
-# tsc_in means TSC data exists(1) or not(0).
-# if tsc_in == 0, TSC(Q) does not exists.
-#
-# CPU ID exists on trace data of EVENT=0x0001f003
-#
-HDRREC = "I"
-TSCREC = "Q"
-D1REC  = "I"
-D2REC  = "II"
-D3REC  = "III"
-D4REC  = "IIII"
-D5REC  = "IIIII"
-D6REC  = "IIIIII"
-D7REC  = "IIIIIII"
-
-last_tsc = [0]
-
-TRC_TRACE_IRQ = 0x1f004
-TRC_PV_HYPERCALL_V2 = 0x20100d
-TRC_PV_HYPERCALL_SUBCALL = 0x20100e
-
-NR_VECTORS = 256
-irq_measure = [{'count':0, 'tot_cycles':0, 'max_cycles':0}] * NR_VECTORS
-
-if sys.version_info >= (3, 0):
-    stdin_bytes = sys.stdin.buffer
-else:
-    stdin_bytes = sys.stdin
-
-i=0
-
-while not interrupted:
-    try:
-        i=i+1
-        line = stdin_bytes.read(struct.calcsize(HDRREC))
-        if not line:
-            break
-        event = struct.unpack(HDRREC, line)[0]
-        n_data = event >> 28 & 0x7
-        tsc_in = event >> 31
-
-        d1 = 0
-        d2 = 0
-        d3 = 0
-        d4 = 0
-        d5 = 0
-        d6 = 0
-        d7 = 0
-
-        tsc = 0
-
-        if tsc_in == 1:
-            line = stdin_bytes.read(struct.calcsize(TSCREC))
-            if not line:
-                break
-            tsc = struct.unpack(TSCREC, line)[0]
-
-        if n_data == 1:
-            line = stdin_bytes.read(struct.calcsize(D1REC))
-            if not line:
-                break
-            d1 = struct.unpack(D1REC, line)[0]
-        if n_data == 2:
-            line = stdin_bytes.read(struct.calcsize(D2REC))
-            if not line:
-                break
-            (d1, d2) = struct.unpack(D2REC, line)
-        if n_data == 3:
-            line = stdin_bytes.read(struct.calcsize(D3REC))
-            if not line:
-                break
-            (d1, d2, d3) = struct.unpack(D3REC, line)
-        if n_data == 4:
-            line = stdin_bytes.read(struct.calcsize(D4REC))
-            if not line:
-                break
-            (d1, d2, d3, d4) = struct.unpack(D4REC, line)
-        if n_data == 5:
-            line = stdin_bytes.read(struct.calcsize(D5REC))
-            if not line:
-                break
-            (d1, d2, d3, d4, d5) = struct.unpack(D5REC, line)
-        if n_data == 6:
-            line = stdin_bytes.read(struct.calcsize(D6REC))
-            if not line:
-                break
-            (d1, d2, d3, d4, d5, d6) = struct.unpack(D6REC, line)
-        if n_data == 7:
-            line = stdin_bytes.read(struct.calcsize(D7REC))
-            if not line:
-                break
-            (d1, d2, d3, d4, d5, d6, d7) = struct.unpack(D7REC, line)
-
-        # Event field is 28bit of 'uint32_t' in header, not 'long'.
-        event &= 0x0fffffff
-        if event == 0x1f003:
-            cpu = d1
-
-        if event == TRC_TRACE_IRQ:
-            # IN - d1:vector, d2:tsc_in, d3:tsc_out
-            # OUT - d1:vector, d2:count, d3:tot_cycles, d4:max_cycles
-            tsc_diff = d3 - d2
-            if tsc_diff < 0:
-                break
-            irq_measure[d1]['count'] += 1
-            irq_measure[d1]['tot_cycles'] += tsc_diff
-            if irq_measure[d1]['max_cycles'] < tsc_diff:
-                irq_measure[d1]['max_cycles'] = tsc_diff
-            d2 = irq_measure[d1]['count']
-            d3 = irq_measure[d1]['tot_cycles']
-            d4 = irq_measure[d1]['max_cycles']
-
-        if event == TRC_PV_HYPERCALL_V2 or event == TRC_PV_HYPERCALL_SUBCALL:
-            # Mask off the argument present bits.
-            d1 &= 0x000fffff
-
-        #tsc = (tscH<<32) | tscL
-
-        #print i, tsc
-
-        if cpu >= len(last_tsc):
-            last_tsc += [0] * (cpu - len(last_tsc) + 1)
-        elif tsc < last_tsc[cpu] and tsc_in == 1:
-            print("TSC stepped backward cpu %d !  %d %d" % (cpu,tsc,last_tsc[cpu]))
-
-        # provide relative TSC
-        if last_tsc[cpu] > 0 and tsc_in == 1:
-            reltsc = tsc - last_tsc[cpu]
-        else:
-            reltsc = 0
-
-        if tsc_in == 1:
-            last_tsc[cpu] = tsc
-
-        if mhz:
-            tsc = tsc / (mhz*1000000.0)
-
-        args = {'cpu'   : cpu,
-                'tsc'   : tsc,
-                'event' : event,
-                'reltsc': reltsc,
-                '1'     : d1,
-                '2'     : d2,
-                '3'     : d3,
-                '4'     : d4,
-                '5'     : d5,
-                '6'     : d6,
-                '7'     : d7    }
-
-        try:
-
-            if str(event) in defs:
-                print(defs[str(event)] % args)
-            else:
-                if str(0) in defs: print(defs[str(0)] % args)
-        except TypeError:
-            if str(event) in defs:
-                print(defs[str(event)])
-                print(args)
-            else:
-                if str(0) in defs:
-                    print(defs[str(0)])
-                    print(args)
-
-
-    except (IOError, struct.error): sys.exit()
-- 
2.25.1


