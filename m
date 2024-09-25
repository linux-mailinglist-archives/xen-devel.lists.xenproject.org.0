Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B64D498629D
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 17:14:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804104.1215097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTix-0008Eh-BD; Wed, 25 Sep 2024 15:14:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804104.1215097; Wed, 25 Sep 2024 15:14:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTiw-00086G-UU; Wed, 25 Sep 2024 15:14:38 +0000
Received: by outflank-mailman (input) for mailman id 804104;
 Wed, 25 Sep 2024 15:02:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G4Vb=QX=flex--ardb.bounces.google.com=3-yX0ZggKCVYyF1z+46H4CC492.0CAL2B-12J2996GHG.L2BDFC720H.CF4@srs-se1.protection.inumbo.net>)
 id 1stTX4-0002k3-IN
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 15:02:22 +0000
Received: from mail-ed1-x54a.google.com (mail-ed1-x54a.google.com
 [2a00:1450:4864:20::54a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29f85010-7b4f-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 17:02:21 +0200 (CEST)
Received: by mail-ed1-x54a.google.com with SMTP id
 4fb4d7f45d1cf-5c4230b10a0so5599187a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 08:02:21 -0700 (PDT)
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
X-Inumbo-ID: 29f85010-7b4f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276540; x=1727881340; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sMLI1adUSxUIp8UXfDcqdD38QxXI+e+F/+Ag4yCxL7E=;
        b=RYbNlnXxxFLiRAJ9AyvJiPiOVrWfadEIV8YL8vDT8QzEr6RTf9W5EEXLvOktBt1xLF
         CzyI1+XSoIZ1OW1jB6P1WO8MVQe6O9Sx0Q6HZWOWJMprZLUL5pDuHVCeKllX+1ayNhxR
         95va/IzgXJQzIGqJDXFpueajato1uc+N8toEJNcRwFqOig8PoN1XbKd7U3ZK6iYO9WR+
         W1NoWbjkCy2cFY8+I3ZLwYwFeA1B+ePUySj5RS3lVmu82HSdynYZFU35a+7+1KptNAG2
         pIe3nFMOCTn+rtfJ5ow+WzTFOVtbGaSg3M/PDJHQHvc9vS0WXSgcJiiEjN2GKmJ0DcZD
         t0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276540; x=1727881340;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sMLI1adUSxUIp8UXfDcqdD38QxXI+e+F/+Ag4yCxL7E=;
        b=rgnQ/fCU9I26rgZkb1bZMiqIi0z+r2/LEtnak/r4uASA98juxmU/e3GSepZi/bHekP
         e0Q1Z7PFOAd0VqOPxcttj7k8clZGFqnInvfp0az2I89Df0Bv7cxLfyB12GOJUhmQZGQV
         /pOyQMPsdSe6oiDl6Nv/tV+1y4BvwXmWxFpFxUIt48mUgWwQkq2BhLCv+kK+E1vWt7JX
         wLTjC2PzKSoTAOXV6qk5ZMRhPB1TbRtfLz4svvKole9zvbUIusSaukt3KS6n91CQqyHF
         XCzP0ZGU8X+jHVSZgDaMrFDvGj/UBLiBnkIHTw/AcG8GXoFRbbotsKjbM+YrHaL6uqw/
         DS5A==
X-Forwarded-Encrypted: i=1; AJvYcCVraKT35Ric9qHKi9xddAn6FXWUw7WQmoyCg1o8YEmHSyvGF+CbWuPE5/KPs4KWx+yy0kR3hnShuKo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwiWexBmNdcvb4VbCY8Y1LN3YQ9SHOybxvz4wZzWFu70mAndJwS
	e0QVstos7ApOTPiEJCAAZ0MHqiLkM/+6hF1ObjyWZEqnPLW+mTNfb/Dwz5JO+rK1xI01mg==
X-Google-Smtp-Source: AGHT+IHqdrbnTURYSpf/5afh17e1i3rk5opqYbKAlLurQBauppiTWqSh5+YV6ICpl369+Ha35/G5jy3r
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a17:906:6d8:b0:a8a:76fd:ae67 with SMTP id
 a640c23a62f3a-a93a061ba72mr129666b.10.1727276539991; Wed, 25 Sep 2024
 08:02:19 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:12 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2056; i=ardb@kernel.org;
 h=from:subject; bh=VKZKKQxE7f774DDxhaNjhf6gM8y+4CHtkhz4ITFKHVU=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6l6HjphM91K+tMbfPlum+q87xXbcaBq/plqB6J0rH
 Clz7dQ6SlkYxDgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwESez2L4w3XU9mNkQveSSXqf
 bkfpTfktlPbu753X3m4//t4RvX456gUjw9ItwQrWWxY9aPiwtX3xVeeW5YpKNdGO1l4qU7KmnF4 VzwoA
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-42-ardb+git@google.com>
Subject: [RFC PATCH 12/28] x86/pm-trace: Use RIP-relative accesses for .tracedata
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Uros Bizjak <ubizjak@gmail.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Use RIP-relative accesses and 32-bit offsets for .tracedata, to avoid
the need for relocation fixups at boot time.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/include/asm/pm-trace.h | 4 ++--
 drivers/base/power/trace.c      | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/pm-trace.h b/arch/x86/include/asm/pm-trace.h
index bfa32aa428e5..123faf978473 100644
--- a/arch/x86/include/asm/pm-trace.h
+++ b/arch/x86/include/asm/pm-trace.h
@@ -8,10 +8,10 @@
 do {								\
 	if (pm_trace_enabled) {					\
 		const void *tracedata;				\
-		asm volatile(_ASM_MOV " $1f,%0\n"		\
+		asm volatile("lea " _ASM_RIP(1f) ", %0\n"	\
 			     ".section .tracedata,\"a\"\n"	\
 			     "1:\t.word %c1\n\t"		\
-			     _ASM_PTR " %c2\n"			\
+			     ".long %c2 - .\n"			\
 			     ".previous"			\
 			     :"=r" (tracedata)			\
 			     : "i" (__LINE__), "i" (__FILE__));	\
diff --git a/drivers/base/power/trace.c b/drivers/base/power/trace.c
index cd6e559648b2..686a0276ccfc 100644
--- a/drivers/base/power/trace.c
+++ b/drivers/base/power/trace.c
@@ -167,7 +167,7 @@ EXPORT_SYMBOL(set_trace_device);
 void generate_pm_trace(const void *tracedata, unsigned int user)
 {
 	unsigned short lineno = *(unsigned short *)tracedata;
-	const char *file = *(const char **)(tracedata + 2);
+	const char *file = offset_to_ptr((int *)(tracedata + 2));
 	unsigned int user_hash_value, file_hash_value;
 
 	if (!x86_platform.legacy.rtc)
@@ -187,9 +187,9 @@ static int show_file_hash(unsigned int value)
 
 	match = 0;
 	for (tracedata = __tracedata_start ; tracedata < __tracedata_end ;
-			tracedata += 2 + sizeof(unsigned long)) {
+			tracedata += 2 + sizeof(int)) {
 		unsigned short lineno = *(unsigned short *)tracedata;
-		const char *file = *(const char **)(tracedata + 2);
+		const char *file = offset_to_ptr((int *)(tracedata + 2));
 		unsigned int hash = hash_string(lineno, file, FILEHASH);
 		if (hash != value)
 			continue;
-- 
2.46.0.792.g87dc391469-goog


