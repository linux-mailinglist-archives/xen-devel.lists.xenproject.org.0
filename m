Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ZfNyOfAlommG0QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 28 Feb 2026 00:17:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D5A1BEEF0
	for <lists+xen-devel@lfdr.de>; Sat, 28 Feb 2026 00:17:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1243147.1543204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw74p-0002Uv-PQ; Fri, 27 Feb 2026 23:16:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1243147.1543204; Fri, 27 Feb 2026 23:16:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw74p-0002R4-Fu; Fri, 27 Feb 2026 23:16:55 +0000
Received: by outflank-mailman (input) for mailman id 1243147;
 Fri, 27 Feb 2026 23:16:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gz2F=A7=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vw74n-0001Do-0Y
 for xen-devel@lists.xenproject.org; Fri, 27 Feb 2026 23:16:53 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61d57dc2-1432-11f1-9ccf-f158ae23cfc8;
 Sat, 28 Feb 2026 00:16:44 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-4375d4fb4d4so1676483f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 27 Feb 2026 15:16:44 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c70e8e8sm9680306f8f.10.2026.02.27.15.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 15:16:41 -0800 (PST)
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
X-Inumbo-ID: 61d57dc2-1432-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1772234204; x=1772839004; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgdpzNU2ggPbFTgmu4VQz6T9b6r+7R4jXsnlPDE3Rcg=;
        b=NHLWGZQfYMaqUS/TGKOv5SxPxfjZXs9FFoH+q1SFnWgC+VSzNCtVY3yYo4DJkdeaEe
         2snzK35OXTjfKKkGbtlWZmM9oD9MugXYCiYwCbBXTo/U5gCXtli5LHVnADr8UnvNP9n5
         WfLp1NMIUDoNk/9ZcExzZo57GoZA3SaOsEIUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772234204; x=1772839004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XgdpzNU2ggPbFTgmu4VQz6T9b6r+7R4jXsnlPDE3Rcg=;
        b=Ru1sBgrIwWgS0SBT+bzWP0s/rlq3QpigeUxOUNx5Ss6rk8vEABOC/9H7vHqGAEqoeW
         6vCR/nK+BbEPCak8PmGWqvFhnSOYOn8Pcx3Z2I0qI5kMQ312Vu5xsrb6BKFKQUUCYUGL
         u6GGXWolKmvaLkTrFr76pqdSbyL+t10gMeSkfxFET53Om7ixD/OIgkkPpl955cG5ZXTd
         KzkNiwAVYUOB6fkeNz/HHETDCQGdXH14ZNQ6ie8vHwoLIedw2NZ+UHreMYaD2qEX6DPr
         lYZsxM6m9QOG1iDB+67GxRfp2JYLdQqIatp/SQhj5ugUSL6SFqec25iLaShyQMEIqmAI
         Fyzw==
X-Gm-Message-State: AOJu0Yyvw0A8CToqUVAGGeQSlQ9Ief5UBEUKW7LWZLtZi44eOXEDbEX7
	br8yQMmqN8AwgsBaWKMT4UXI1+dv0zvuSGcNYhaYrbLRGXn5i4GzQ+SuJ2LdAc3w8gRBoE76hkE
	KVnqB
X-Gm-Gg: ATEYQzwFJhY2pvvPWauC8sr1+iqhPKbXOp9/LiLG7q6P2bzQdo8g2kjSwV8RWK7zaUG
	ziuQM5w9FyVTNpKKzkr+Fgffzed3jJ3+MG7/SEiD7cZdxhH5x2wj6tFSgRrnPIzM3rU/AD0rjz3
	0wgyZzGbfcz+p9xc/h02/4uJ//eqVACbRgDDiBKQmMPOYwRga/OTjyNLd65JPoscsmfcuXqR6mm
	DnLp4cEMWuY8wH0i8RQuhlfxbrDe40ObarrMDtZl/TYbTcuIbfUe793/Ms4QURbx8UgEvu3O+ET
	xIyN4Ijd8SqdSOEXBYvrpaVeVloWtj6hROhVpu+YaKNasz2Z5924BpmTTnNiZM1mi3F6E8grVdX
	x2Fk2DHezKNjiv/VRklyBkpAGbHkIcXZYVi74cpEucftIMboO6V+c4LquWsMw1eiqizmzhMDlU0
	vZhojuy1rfg2nBD5g60yIFHigapjSLPD022QLLHbi1q5WR4YenbKU6vifv8DkDTgAfshyZ4p0=
X-Received: by 2002:a05:6000:420d:b0:439:8a4f:5250 with SMTP id ffacd0b85a97d-4399dde503fmr7936970f8f.17.1772234203211;
        Fri, 27 Feb 2026 15:16:43 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 02/14] docs/guest-guide: Describe the PV traps and entrypoints ABI
Date: Fri, 27 Feb 2026 23:16:24 +0000
Message-Id: <20260227231636.3955109-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
References: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:mid,citrix.com:dkim,citrix.com:email];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 67D5A1BEEF0
X-Rspamd-Action: no action

... seeing as I've had to thoroughly reverse engineer it for FRED and make
tweaks in places.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Obviously there's a lot more in need of doing, but this is at least a start.

v4:
 * New
---
 docs/glossary.rst                 |   3 +
 docs/guest-guide/x86/index.rst    |   1 +
 docs/guest-guide/x86/pv-traps.rst | 123 ++++++++++++++++++++++++++++++
 3 files changed, 127 insertions(+)
 create mode 100644 docs/guest-guide/x86/pv-traps.rst

diff --git a/docs/glossary.rst b/docs/glossary.rst
index 6adeec77e14c..c8ab2386bc6e 100644
--- a/docs/glossary.rst
+++ b/docs/glossary.rst
@@ -43,6 +43,9 @@ Glossary
      Sapphire Rapids (Server, 2023) CPUs.  AMD support only CET-SS, starting
      with Zen3 (Both client and server, 2020) CPUs.
 
+   event channel
+     A paravirtual facility for guests to send and recieve interrupts.
+
    guest
      The term 'guest' has two different meanings, depending on context, and
      should not be confused with :term:`domain`.
diff --git a/docs/guest-guide/x86/index.rst b/docs/guest-guide/x86/index.rst
index 502968490d9d..5b38ae397a9f 100644
--- a/docs/guest-guide/x86/index.rst
+++ b/docs/guest-guide/x86/index.rst
@@ -7,3 +7,4 @@ x86
    :maxdepth: 2
 
    hypercall-abi
+   pv-traps
diff --git a/docs/guest-guide/x86/pv-traps.rst b/docs/guest-guide/x86/pv-traps.rst
new file mode 100644
index 000000000000..2ff18e2f9454
--- /dev/null
+++ b/docs/guest-guide/x86/pv-traps.rst
@@ -0,0 +1,123 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+PV Traps and Entrypoints
+========================
+
+.. note::
+
+   The details here are specific to 64bit builds of Xen.  Details for 32bit
+   builds of Xen, are different and not discussed further.
+
+PV guests are subject to Xen's linkage setup for events (interrupts,
+exceptions and system calls).  x86's IDT architecture and limitations are the
+majority influence on the PV ABI.
+
+All external interrupts are routed to PV guests via the :term:`Event Channel`
+interface, and not discussed further here.
+
+What remain are exceptions, and the instructions which cause a control
+transfers.  In the x86 architecture, the instructions relevant for PV guests
+are:
+
+ * ``INT3``, which generates ``#BP``.
+
+ * ``INTO``, which generates ``#OF`` only if the overflow flag is set.  It is
+   only usable in compatibility mode, and will ``#UD`` in 64bit mode.
+
+ * ``CALL (far)`` referencing a gate in the GDT.
+
+ * ``INT $N``, which invokes an arbitrary IDT gate.  These four instructions
+   so far all check the gate DPL and will ``#GP`` otherwise.
+
+ * ``INT1``, also known as ``ICEBP``, which generates ``#DB``.  This
+   instruction does *not* check DPL, and can be used unconditionally by
+   userspace.
+
+ * ``SYSCALL``, which enters CPL0 as configured by the ``{C,L,}STAR`` MSRs.
+   It is usable if enabled by ``MSR_EFER.SCE``, and will ``#UD`` otherwise.
+   On Intel parts, ``SYSCALL`` is unusable outside of 64bit mode.
+
+ * ``SYSENTER``, which enters CPL0 as configured by the ``SEP`` MSRs.  It is
+   usable if enabled by ``MSR_SYSENTER_CS`` having a non-NUL selector, and
+   will ``#GP`` otherwise.  On AMD parts, ``SYSENTER`` is unusable in Long
+   mode.
+
+
+Xen's configuration
+-------------------
+
+Xen maintains a complete IDT, with most gates configured with DPL0.  This
+causes most ``INT $N`` instructions to ``#GP``.  This allows Xen to emulate
+the instruction, referring to the guest kernels vDPL choice.
+
+ * Vectors 3 ``#BP`` and 4 ``#OF`` are DPL3, in order to allow the ``INT3``
+   and ``INTO`` instructions to function in userspace.
+
+ * Vector 0x80 is DPL3 in order to implement the legacy system call fastpath
+   commonly found in UNIXes.
+
+ * Vector 0x82 is DPL1 when PV32 is enabled, allowing the guest kernel to make
+   hypercalls to Xen.  All other cases (PV32 guest userspace, and both PV64
+   modes) operate in CPL3 and this vector behaves like all others to ``INT
+   $N`` instructions.
+
+A range of the GDT is guest-owned, allowing for call gates.  During audit, Xen
+forces all call gates to DPL0, causing their use to ``#GP`` allowing for
+emulation.
+
+Xen enables ``SYSCALL`` in all cases as it is mandatory in 64bit mode, and
+enables ``SYSENTER`` when available in 64bit mode.
+
+When Xen is using FRED delivery the hardware configuration is substantially
+different, but the behaviour for guests remains as unchanged as possible.
+
+
+PV Guest's configuration
+------------------------
+
+The PV ABI contains the "trap table", modelled very closely on the IDT.  It is
+manipulated by ``HYPERCALL_set_trap_table``, has 256 entries, each containing
+a code segment selector, an address, and flags.  A guest is expected to
+configure handlers for all exceptions; failure to do so is terminal similar to
+a Triple Fault.
+
+Part of the GDT is guest owned with descriptors audited by Xen.  This range
+can be manipulated with ``HYPERVISOR_set_gdt`` and
+``HYPERVISOR_update_descriptor``.
+
+Other entrypoints are configured via ``HYPERVISOR_callback_op``.  Of note here
+are the callback types ``syscall``, ``syscall32`` (relevant for AMD parts) and
+``sysenter`` (relevant for Intel parts).
+
+.. warning::
+
+   Prior to Xen 4.15, there was no check that the ``syscall`` or ``syscall32``
+   callbacks had been registered before attempting to deliver via them.
+   Guests are strongly advised to ensure the entrypoints are registered before
+   running userspace.
+
+
+Notes
+-----
+
+``INT3`` vs ``INT $3`` and ``INTO`` vs ``INT $4`` are hard to distinguish
+architecturally as both forms have a DPL check and use the same IDT vectors.
+Because Xen configures both as DPL3, the ``INT $`` forms do not fault for
+emulation, and are treated as if they were exceptions.  This means the guest
+can't block these instruction by trying to configure them with vDPL0.
+
+The instructions which trap into Xen (``INT $0x80``, ``SYSCALL``,
+``SYSENTER``) but can be disabled by guest configuration need turning back
+into faults for the guest kernel to process.
+
+ * When using IDT delivery, instruction lengths are not provided by hardware
+   and Xen does not account for possible prefixes.  ``%rip`` only gets rewound
+   by the length of the unprefixed instruction.  This is observable, but not
+   expected to be an issue in practice.
+
+ * When Xen is using FRED delivery, the full instruction length is provided by
+   hardware, and ``%rip`` is rewound fully.
+
+While both PV32 and PV64 guests are permitted to write Call Gates into the
+GDT, emulation is only wired up for PV32.  At the time of writing, the x86
+maintainers feel no specific need to fix this omission.
-- 
2.39.5


