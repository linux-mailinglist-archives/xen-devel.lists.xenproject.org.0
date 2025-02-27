Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AB2A47288
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 03:26:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897479.1306215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTaz-0007b8-BR; Thu, 27 Feb 2025 02:25:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897479.1306215; Thu, 27 Feb 2025 02:25:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTaz-0007O3-0S; Thu, 27 Feb 2025 02:25:53 +0000
Received: by outflank-mailman (input) for mailman id 897479;
 Thu, 27 Feb 2025 02:25:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=89K9=VS=flex--seanjc.bounces.google.com=3s8u_ZwYKCY4Aws51uy66y3w.u64Fw5-vwDw330ABA.Fw57961wuB.69y@srs-se1.protection.inumbo.net>)
 id 1tnTUv-0005qU-Ea
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 02:19:37 +0000
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [2607:f8b0:4864:20::1049])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47695b87-f4b1-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 03:19:32 +0100 (CET)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2f83e54432dso1545883a91.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 18:19:32 -0800 (PST)
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
X-Inumbo-ID: 47695b87-f4b1-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622771; x=1741227571; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Cdk6AVEMbYJ/6Avsp+2Egdk5E71fbrI/hFT7BN4L+X8=;
        b=G8u70gZaPECovz6o4nyxJ1rz3iX3M5lp0QvQrtQC0eQ/14Zp9tuACIv3X5H56crdha
         OyHTOHhzCXOFvy6Wc4/O3k9sbqmAPn5GoeuIPKZp0HVdSnWhk8nyVjxfGokW2Jis142P
         FMNZMqqm/WAsVTALccrz4+QAnr/t8PGm3uN65itcyu4WPNv7NfOfIWf2iEdAnfrEBN/+
         2eo/AjDrwFvjfunxC3djxb0nhKPpZKkxabmmHdf9UBpbumXuggVmqM5X9iuwkvHwTRGL
         3SCnJuIQVx1eWKvtd/Nks4pxu2UNOGkZds/oB+yDGnmIrMP4ZHcH7sFEYt2pe6FDm2gM
         S55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622771; x=1741227571;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cdk6AVEMbYJ/6Avsp+2Egdk5E71fbrI/hFT7BN4L+X8=;
        b=lDQ1ShDdngC2b7vajFdls7gpkzEfV19yyyEYNko0hGLJTSOy28F5gupNBuOXQqTWL4
         5eQ1tM9RujYsQf8Fc5a2rG2opAPvknoDTe4OBfDNT5z/8499ux6AwMfadw4PWdDCecQA
         4RXbtqx0vyt/ON4Sglkw8im/Gxw3BeZ/K97dKlHwOUQwWWRPZLjuRqR4jl1K0lzLFCcu
         lxAZTxYI9cguB8ZTqW1YRXbpfS8xA8U1BnK5mRfpYZeNXQOKiyxw6GqBL2IkzjSkCQXs
         JqMB4P1l0G/+RdocKKCJAUG75JGq8welI/zE/jRlsGia7H+UQeT0QexOZINsu3KCqYG2
         sT2w==
X-Forwarded-Encrypted: i=1; AJvYcCUCU1FbuqPt7I8u+K0dHWBfp/ia4jxPUJhiXY4NlfVbhlwGWOou+iEBoZEgJHXoyoiu1DKOqwR8/+U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzoYLrIN/4AcZ+rTlyjnj2YGyrvJm9OsioMI0JClRr8Z4X0b8RQ
	gvohLLfcGEArITKlsAQ8JCjIBqHFh2LTBpE1qN+A6r3OrGxboDfyCNh8GFPTS+/gx4+H952CaKt
	d8w==
X-Google-Smtp-Source: AGHT+IGFILkiLdlR4RAAXuJxcaVfe/0bxh03RUlKL7+1zFXEwiB1qD3NnSdVhpPB8u60HxzWl62A5c233Wg=
X-Received: from pjbdb4.prod.google.com ([2002:a17:90a:d644:b0:2fc:2ee0:d385])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5688:b0:2ee:a4f2:b307
 with SMTP id 98e67ed59e1d1-2fe7e2eaca6mr8295061a91.4.1740622771119; Wed, 26
 Feb 2025 18:19:31 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:32 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-17-seanjc@google.com>
Subject: [PATCH v2 16/38] x86/vmware: Nullify save/restore hooks when using
 VMware's sched_clock
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	John Stultz <jstultz@google.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>
Content-Type: text/plain; charset="UTF-8"

Nullify the sched_clock save/restore hooks when using VMware's version of
sched_clock.  This will allow extending paravirt_set_sched_clock() to set
the save/restore hooks, without having to simultaneously change the
behavior of VMware guests.

Note, it's not at all obvious that it's safe/correct for VMware guests to
do nothing on suspend/resume, but that's a pre-existing problem.  Leave it
for a VMware expert to sort out.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/cpu/vmware.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index d6f079a75f05..d6eadb5b37fd 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -344,8 +344,11 @@ static void __init vmware_paravirt_ops_setup(void)
 
 	vmware_cyc2ns_setup();
 
-	if (vmw_sched_clock)
+	if (vmw_sched_clock) {
 		paravirt_set_sched_clock(vmware_sched_clock);
+		x86_platform.save_sched_clock_state = NULL;
+		x86_platform.restore_sched_clock_state = NULL;
+	}
 
 	if (vmware_is_stealclock_available()) {
 		has_steal_clock = true;
-- 
2.48.1.711.g2feabab25a-goog


