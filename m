Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3BDB12098
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 17:07:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058064.1425802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufK14-0004QC-QI; Fri, 25 Jul 2025 15:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058064.1425802; Fri, 25 Jul 2025 15:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufK14-0004J2-KI; Fri, 25 Jul 2025 15:07:22 +0000
Received: by outflank-mailman (input) for mailman id 1058064;
 Fri, 25 Jul 2025 15:07:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJoT=2G=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1ufK12-0002MW-IN
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 15:07:20 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f76e888-6969-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 17:07:20 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-60bfcada295so3616927a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 08:07:20 -0700 (PDT)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-614cd0f730fsm2194208a12.22.2025.07.25.08.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 08:07:19 -0700 (PDT)
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
X-Inumbo-ID: 0f76e888-6969-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1753456040; x=1754060840; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vInKQUDym/V0LtSN5zjRIc7mW05wzM+9RxF82LfYmjw=;
        b=BMJsbxxQFYlyCl0IirpPW2WAPBsOeOWK24MLsJZCrRRsVD0ulQyf780JQGykKwUw97
         a48aaOz+qd8i+THY3+P84GXV/CAPUiyhPo4y/s5VnJXg544CL3NBeq2eU3tmzxAGEzgn
         OeJmhv43ZqBG7LgOH202S1zwwHoNgD3A+PD1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753456040; x=1754060840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vInKQUDym/V0LtSN5zjRIc7mW05wzM+9RxF82LfYmjw=;
        b=gZICQEXOUPx8Eb53kyX5OPW8bEGiobw6iMT81LQ0K8MXb/0/+YsykaUqlSn10myb/t
         jwZeTDdYXAaKEm3v/4IkEmf+QNBqj9B8PG+4JXG0wr1YUipHkX6tzaOWYnK+C3ZetKmw
         jn48GgU+ctDStB+wlOQ1Pij9wkQjhT7ShonD897HbUuEf10lZq73L7YPi0/YAu9bxMzi
         nFJpO7X+iE7N+Oc68dwx/h9GbTIb5RmKG2gvx/5q7YflbtAHbi1Q4leqAjSUVCQu6jIp
         XL9WlD5eDLMUMyj8YSuTcWevbbTcHVVkTpd/kuRvy8hqTo5fS6SD9kpn7KwC1u0B+f4d
         87Ew==
X-Gm-Message-State: AOJu0YzSoqScmWd9R/0vZiSh0asjmH1IAuYO+xb/MqwjCgjeri3+ACvd
	qR0lHrd2huGPxf+noDYaVrXMzcowvHtlIx/x5SHLAanwM8j2/xYut9b6GZiJVcq0MVJH0cVaILE
	RyyMOfkI=
X-Gm-Gg: ASbGnctjmApeSIcFEJ0YX8F8o6nzchePtzBAKOZyVeDNfIpnrJLqMoF2H5c+GIUqRb/
	nd2hBOhc+wI0YRrN9m5v/iJDDS8t49IQ+1ze2uO+ACDzrWcrRS8IqBvpI9HSJ+m90WiId0OXgyk
	ISOUcsarTSckeZPzIy/jj5R1dn3fQz1T08lK6zmnrBIqir524vWOW1WW16pfpOxCNBBlUTxAi3/
	mmSvvlhWrt4COiD3YrIGkNNOyYQ9Fys11Zgw74VJzCnLQ1tQTcK2DpAY3Y8EGkGvcokxcV9w8wS
	MFAo/HeBqItCooZBbh0JujRlnSbtqKULFU9KLmz8IZhXtiQtceWVAxvqNoJko8/4EKlbRKJEByJ
	hA2NimH8vGW3HxnsQnOvkEo7yYZIle5jAgMoY
X-Google-Smtp-Source: AGHT+IFVNKsEQIGegS9fag3H4TJHSLllipGdqgNb69TweprTYiCTydPYPubRbaeQMd1VQlHtchNYRg==
X-Received: by 2002:a50:baaa:0:b0:608:493a:cccf with SMTP id 4fb4d7f45d1cf-614f1dfa8d5mr1774213a12.30.1753456039518;
        Fri, 25 Jul 2025 08:07:19 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	andriy.sultanov@vates.tech,
	boris.ostrovsky@oracle.com
Subject: [RFC PATCH v1 10/10] xen/tools/pyperf.py: example script to parse perf output
Date: Fri, 25 Jul 2025 16:06:46 +0100
Message-ID: <570fac654441fd0700a2a322d71c68f2e7b4e27d.1753372928.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1753372928.git.edwin.torok@cloud.com>
References: <cover.1753372928.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Looks up symbols by parsing the output of 'perf script -i
perf.data.kvm'.

Note that addr2line is very slow, and invoking it for each symbol would
results in the script taking several minutes to process a trace that
only lasts a few seconds.
Processing only unique addresses, and processing multiple addresses in
one go reduces this to acceptable running times.

Based on an earlier script by Andriy Sultanov for parsing 'perf kvm report
--stdio' output.

This doesn't have to be added to the tree, eventually perf itself should
be capable of performing this lookup, but meanwhile it is useful to have
some way for automatically converting stacktraces.

Signed-off-by: Edwin Török <edwin.torok@cloud.com>
---
 xen/tools/pyperf.py | 146 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 146 insertions(+)
 create mode 100644 xen/tools/pyperf.py

diff --git a/xen/tools/pyperf.py b/xen/tools/pyperf.py
new file mode 100644
index 0000000000..881e6e1e0b
--- /dev/null
+++ b/xen/tools/pyperf.py
@@ -0,0 +1,146 @@
+#!/usr/bin/env python3
+## run after 'perf kvm --host --guest record -a -F 99 -- xe vm-list'
+# wraps the call to 'perf script' to get xen symbols instead of just addresses, like:
+#
+# perf  236848 [000] 67971.504330:          1 cycles:P:
+#        ffff82d04029fc73 [unknown] ([unknown])
+#        ffff82d04029ebc2 [unknown] ([unknown])
+#        ffff82d04029ef1f [unknown] ([unknown])
+#        ffff82d0403081df [unknown] ([unknown])
+#        ffff82d0402012d3 [unknown] ([unknown])
+#            7f2ea410469d __GI___ioctl+0x3d (/usr/lib64/libc.so.6)
+#            55f9b3a8df5c perf_evsel__run_ioctl+0x6c (/usr/bin/perf)
+#            55f9b397b152 __evlist__enable.constprop.0+0x112 (/usr/bin/perf)
+#            55f9b38c2643 __cmd_record.constprop.0+0x2833 (/usr/bin/perf)
+#            55f9b38c3e1c cmd_record+0xeec (/usr/bin/perf)
+#            55f9b38e3ed0 cmd_kvm+0x7d0 (/usr/bin/perf)
+#            55f9b3961ff1 run_builtin+0x71 (/usr/bin/perf)
+#            55f9b38adbeb main+0x68b (/usr/bin/perf)
+#            7f2ea403314a __libc_start_call_main+0x7a (/usr/lib64/libc.so.6)
+#            7f2ea403320b __libc_start_main@@GLIBC_2.34+0x8b (/usr/lib64/libc.so.6)
+#            55f9b38ade55 _start+0x25 (/usr/bin/perf)
+# 
+# Or with perf script -F+srcline:
+# perf  236848 [000] 67971.504330:          1 cycles:P:
+#        ffff82d04029fc73 [unknown] ([unknown])
+#        ffff82d04029ebc2 [unknown] ([unknown])
+#        ffff82d04029ef1f [unknown] ([unknown])
+#        ffff82d0403081df [unknown] ([unknown])
+#        ffff82d0402012d3 [unknown] ([unknown])
+#            7f2ea410469d __GI___ioctl+0x3d (/usr/lib64/libc.so.6)
+#  libc.so.6[d569d]
+#            55f9b3a8df5c perf_evsel__run_ioctl+0x6c (/usr/bin/perf)
+#  evsel.c:435
+#            55f9b397b152 __evlist__enable.constprop.0+0x112 (/usr/bin/perf)
+# evlist.c:573
+#            55f9b38c2643 __cmd_record.constprop.0+0x2833 (/usr/bin/perf)
+#  builtin-record.c:2524
+#            55f9b38c3e1c cmd_record+0xeec (/usr/bin/perf)
+#  builtin-record.c:4215
+#            55f9b38e3ed0 cmd_kvm+0x7d0 (/usr/bin/perf)
+#  builtin-kvm.c:2081
+#            55f9b3961ff1 run_builtin+0x71 (/usr/bin/perf)
+#  perf.c:322
+#            55f9b38adbeb main+0x68b (/usr/bin/perf)
+#  perf.c:375
+#            7f2ea403314a __libc_start_call_main+0x7a (/usr/lib64/libc.so.6)
+#  libc.so.6[414a]
+#            7f2ea403320b __libc_start_main@@GLIBC_2.34+0x8b (/usr/lib64/libc.so.6)
+#  libc.so.6[420b]
+#            55f9b38ade55 _start+0x25 (/usr/bin/perf)
+#  ??:0
+# 
+# TODO: BUG when we have only 1 unknown and not from hypervisor we print 2 bogus values
+# and claim it was hypervisor
+# This is useful for FlameGraphs
+
+from collections import defaultdict
+from typing import Optional
+import subprocess
+import tempfile
+
+with open('/sys/hypervisor/version/major', 'r') as f:
+    major = f.read().rstrip()
+with open('/sys/hypervisor/version/minor', 'r') as f:
+    minor = f.read().rstrip()
+with open('/sys/hypervisor/version/extra', 'r') as f:
+    extra = f.read().rstrip()
+
+xen_version = f'{major}.{minor}{extra}'
+xen_symbols = f'/boot/xen-syms-{xen_version}'
+# TODO: srcline transform as we do for ours
+report: bytes = subprocess.check_output(['perf', 'script', '-i', 'perf.data.kvm'])
+
+# invoking addr2line for each symbol is very slow
+# (takes several minutes to process a trace that way)
+# Instead collect all addresses, and invoke addr2line once
+# (this way we can also query it only for unique addresses)
+maybe_in_hypervisor = False
+
+addresses = set()
+lines = []
+
+for rawline in report.splitlines():
+    line = rawline.decode()
+    columns = line.split()
+    if line and line[0] != ' ':
+        # beginning of new stacktrace, could start in hypervisor
+        maybe_in_hypervisor = True
+    if len(columns) == 3 and maybe_in_hypervisor and columns[1] == '[unknown]' and columns[2] == '([unknown])':
+        addr = columns[0]
+        addresses.add(addr)
+        lines.append((line, columns))
+    else:
+        maybe_in_hypervisor = False
+        lines.append((line, []))
+
+addr2loc: defaultdict[str, list[str]] = defaultdict(list)
+with tempfile.NamedTemporaryFile() as tmp:
+    # TODO: add back -i, but sharing needs to be fixed
+    tmp.write(f"-asfe {xen_symbols}\n".encode("utf-8"))
+    for addr in addresses:
+        tmp.write((addr + "\n").encode("utf-8"))
+    tmp.flush()
+    cmd = ['addr2line', '@' + tmp.name]
+    symbols = subprocess.check_output(cmd).decode().splitlines()
+    # output format:
+    #  address
+    #  function_name
+    #  source_file:line_number
+    #  inlined by function_name
+    #  inlined by source_file:line_number
+    # we keep each of these separate, but change the order,
+    # so that it works for a flamegraph (from callees to callers)
+    #  source_file:line_number
+    #  function_name
+    #  inlined by source_file:line_number
+    #  inlined by function_name
+
+    # sometimes we get extra info in parenthesis, drop it:
+    # /builddir/build/BUILD/xen-4.21.0/xen/build-xen-debug/../arch/x86/pv/emul-priv-op.c:1349 (discriminator 8)
+    addr = ""
+    prev: Optional[str] = None
+    for symline in symbols:
+        if symline.startswith("0x"):
+            addr = symline[2:]
+            addr2loc[addr] = []
+            prev = None
+        else:
+            if prev:
+                for line in [symline, prev]:
+                    addr2loc[addr].append("%024s %s_[h] ([%s])" %
+                                          (addr, line.split()[0], xen_symbols))
+            prev = symline
+
+    for (line, columns) in lines:
+        if len(columns) == 3:
+            addr = columns[0]
+            loc = addr2loc.get(addr)
+            if loc:
+                # TODO: stacktrace needs to be shared when inlined functions have common parent
+                for out in loc:
+                    print(out)
+            else:
+                print(line)
+        else:
+            print(line)
-- 
2.47.1


