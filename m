Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4761D1DC8F2
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 10:45:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbgou-0008GF-5h; Thu, 21 May 2020 08:44:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V6/I=7D=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jbgot-0008GA-7N
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 08:44:51 +0000
X-Inumbo-ID: 548e61b8-9b3f-11ea-aae5-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 548e61b8-9b3f-11ea-aae5-12813bfff9fa;
 Thu, 21 May 2020 08:44:49 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: KyszrD7WlIUOasSueQmkZfh8h/tadSY9ereIbPAzS+VeucWBulawpXZzmfLe6K3h2YwN8SMEsR
 dGD7q4gCOItboomsr8HFzHVm0wm75dDKpM0kMwVC2IF0Ml68KxjxYBEo026p59xk+vJskw5H8J
 83mSnCplcuL00UM0xWyTA8IxdR/ANHhEPqwzXPswJ3F8+8YiA/sXneY88wt3KiM9NIRahzwnyi
 +Ibu8n2G34NnEH6AWc2a7zbXzP8pGfmI8kZk1JgWCj2HH11eCfXp8wWk7e1sta0Y9gwDMigLih
 f9o=
X-SBRS: 2.7
X-MesageID: 18327743
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,417,1583211600"; d="scan'208";a="18327743"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] xen/trace: Don't dump offline CPUs in debugtrace_dump_worker()
Date: Thu, 21 May 2020 09:44:22 +0100
Message-ID: <20200521084422.24073-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The 'T' debugkey reliably wedges on one of my systems, which has a sparse
APIC_ID layout due to a non power-of-2 number of cores per socket.  The
per_cpu(dt_cpu_data, cpu) calcution falls over the deliberately non-canonical
poison value.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Julien Grall <julien@xen.org>
CC: Juergen Gross <jgross@suse.com>

What is however weird is that instead of a crash, Xen wedges without printing
a clean backtrace.  Usually it blocks after just a few characters.  The best I
managed to get (and can't reproduce) is:

88 cpupool_rm_domain(dom=1,pool=0) n_dom 1
(XEN) wrap: 0
(XEN) debugtrace_dump() global buffer finished
(XEN) ----[ Xen-4.14-unstable  x86_64  debug=y   Not tainted ]----
(XEN) CPU:    3
(XEN) RIP:    e008:[<ffff82d040207b51>] common/debugtrace.c#debugtrace_dump_worker+0x6c/0xa1
(XEN) RFLAGS: 0000000000010006   CONTEXT: hypervisor (d0v13)
(XEN) rax: 80007d2fbf6d1000   rbx: 0000000000000030   rcx: 00000000fffffffa
(XEN) rdx: ffff82d040473c04   rsi: ffff83103ff0fc48   rdi: ffff83103ff0fc3e
(XEN) rbp: ffff83103ff0fc78   rsp: ffff83103ff0fc38   r8:  0000000000000001
(XEN) r9:  0000000000000038   r10: 0000000000000030   r11: 0000000000000002
(XEN) r12: ffff82d0409535a0   r13: ffff83103ff0fc38   r14: ffff82d040930000
(XEN) r15: ffff82d040473bfe   cr0: 0000000080050033   cr4: 0000000000362660
(XEN) cr3: 0000001dd0f74000   cr2: 000000000041e5b0
(XEN) fsb: 00007f5bb0f15780   gsb: ffff88827ad40000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
(XEN) Xen code around <ffff82d040207b51> (common/debugtrace.c#debugtrace_dump_worker+0x6c/0xa1):
(XEN)  5e 2d 03 00 49 8b 04 24 <4a> 8b 3c 30 4c 89 ee e8 e6 fe ff ff 83 c3 01 49
(XEN) Xen stack trace from rsp=ffff83103ff0fc38:
(XEN)    ff00383420757063 ffff83103ff0fc48 0000000000000292 0000000000000292
(XEN)    ffff83103ff0fef8 ffff83103ff0ffff ffff83103ff0fd28 ffff83103ff0fef8
(XEN)    ffff83103ff0fc98 ffff82d040207c05 ffff83103ff0fc98 0000000000000054
(XEN)    ffff83103ff0fcb8 ffff82d04021d04a 0000000000000000 0000000000000000
(XEN)    ffff83103ff0fe48 ffff82d0402329f6 ffff831033cd9000 0000000000000000
(XEN)    ffff831000800027 0000000000000001 000000003ff0fcf8 0000000000000286
(XEN)    ffff83103ff0fd28 0000000000000000 00007f5bb0f27010 0000000000000000
(XEN)    0000000000000000 ffff82004009c938 ffff83103ff0fe54 ffff82d04035b055
(XEN)    ffff831033cd9000 ffff82c000000000 ffff83103ff0fd68 ffff82d040234612
(XEN)    ffff831033c8e068 0000000000000003 0000000000823679 ffff83103ff0fdf8
(XEN)    ffff83103ff0fd88 ffff82d040350f14 ffff83103ff0fdb8 0000001300000007
(XEN)    00007f5bb0f28010 0000000000000001 00007f5bafeb02c4 000000000000001c
(XEN)    00007f5bb01f02a0 0000000000000001 00007ffd208ae538 0000000000637a70
(XEN)    0000000000637a30 0000000000424e59 00007f5baff0d88b 00007f5bb01f33c0
(XEN)    0000000000000000 0000000000000002 00007f5baff0d913 0000000000000000
(XEN)    ffff82d0403b33d4 ffff83103ff0fef8 0000000000000230 ffff831033c8e000
(XEN)    0000000000000001 deadbeefdeadf00d ffff83103ff0fee8 ffff82d04032f0e0
(XEN)    ffff82d0403b33d4 00007f5bb0f27010 deadbeefdeadf00d deadbeefdeadf00d
(XEN)    deadbeefdeadf00d deadbeefdeadf00d ffff82d0403b33d4 ffff82d0403b33c8
(XEN)    ffff82d0403b33d4 ffff82d0403b33c8 ffff82d0403b33d4 ffff82d0403b33c8
(XEN) Xen call trace:
(XEN)    [<ffff82d040207b51>] R common/debugtrace.c#debugtrace_dump_worker+0x6c/0xa1
(XEN)    [<ffff82d040207c05>] F common/debugtrace.c#debugtrace_key+0x7f/0x81
(XEN)    [<ffff82d04021d04a>] F handle_keypress+0xb2/0xc9
(XEN)    [<ffff82d0402329f6>] F do_sysctl+0x6bc/0x148b
(XEN)    [<ffff82d04032f0e0>] F pv_hypercall+0x2fd/0x578
(XEN)    [<ffff82d0403b3432>] F lstar_enter+0x112/0x120
(XEN)

which is lacking the remainder of the #GP output from the non-canonical memory
reference in mov (%rax,%r14,1), %rdi.  The wedge also doesn't suffer a
watchdog timeout, which is even more concerning.
---
 xen/common/debugtrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/debugtrace.c b/xen/common/debugtrace.c
index c21ec99ee0..f3794b9453 100644
--- a/xen/common/debugtrace.c
+++ b/xen/common/debugtrace.c
@@ -95,7 +95,7 @@ static void debugtrace_dump_worker(void)
 
     debugtrace_dump_buffer(dt_data, "global");
 
-    for ( cpu = 0; cpu < nr_cpu_ids; cpu++ )
+    for_each_online_cpu ( cpu )
     {
         char buf[16];
 
-- 
2.11.0


