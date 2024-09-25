Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A770F9862A0
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 17:14:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804094.1215054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTit-00077k-Gl; Wed, 25 Sep 2024 15:14:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804094.1215054; Wed, 25 Sep 2024 15:14:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTit-0006s4-21; Wed, 25 Sep 2024 15:14:35 +0000
Received: by outflank-mailman (input) for mailman id 804094;
 Wed, 25 Sep 2024 15:02:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0B/g=QX=flex--ardb.bounces.google.com=37yX0ZggKCUom3pn+su5s00sxq.o0y9qz-pq7qxxu454.9qz130vqo5.03s@srs-se1.protection.inumbo.net>)
 id 1stTWr-0002k3-Tc
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 15:02:09 +0000
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [2607:f8b0:4864:20::114a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 221ec0b3-7b4f-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 17:02:08 +0200 (CEST)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-6e2261adfdeso8785267b3.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 08:02:08 -0700 (PDT)
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
X-Inumbo-ID: 221ec0b3-7b4f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276527; x=1727881327; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rTUv2yGZRT/iYzBSyilbN8CQ+H5OcaG9Xif73xCYTUU=;
        b=4m4j+ahI6SvYCTSpT2GmWd9iTy8/TXm/gAi0vILSqXQmnAo74NzGJcPSSO4EW0+MHG
         Q9XgpsnUKbnO+ouMbEJX0z45kicreIhN7OVs4TCsYaeky9KbLs5DVIjvf7dtCJ+T2DT0
         9P4fikI0UBWzccrgYeWiEDo3aYQvpG2TNuqcAzNqxCFTatKmxKdqsSMqe+ZOnWUbiBnR
         mHY+wYqqcd9/sKQdspWaggJJA7ZmxycLeHk+9cRutqbFK7vB8EUMsDAmpr/LTEq/QFeK
         thkVQgOqkgPyKQXMTli+RIRKU7u98NnVBIw6ShGrtlzg8rOjgHN+ff/m0/paXLbhQFgC
         4i+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276527; x=1727881327;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rTUv2yGZRT/iYzBSyilbN8CQ+H5OcaG9Xif73xCYTUU=;
        b=D8hopbCWIZYX84Ta016F7p68PuKQ+bYCjIm9a0j5IMUc+sRB5zImrUmCUVDtakQqWe
         pmO4bkomBcy0hc8qgtacHER6/0blit2cPn9ovw6D2CUVsrT1ENKkTYVqZaJunspK45WE
         Z2dSM6zpEItoKwRneImg07QOSqxUzX3BjJEOG4ab3oxly95tl4EG9oib/BVLFU+x5Meo
         RQQfQX5khkI7AbVn+C/INSKa1RTU7FbMSngAbQ0AnQjhoIPdDKAcxRY6bcY7HeIAhQca
         JSqLg84MLFAV5K23JelXt6aRpC0bttC2Pg3FErsUgno+k/Ldr62KecScRg8RBEGe/AqM
         +dHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjB0RGgDDIb82d1+yPmTyHyaIYsDsEEBhSmeXHM27NS1t8RKvJJ9vrKAje7NgjwwjQWtsoWLec7Mw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzC3X7fmEPxZta2eiEABxKdR4O99IEvCSyz5/Ep/87boETbV1Hh
	EPkOkyHaT6iors8kSfx2MAn8DK3sQtxeyVsnrtZd9NYSpabD/GLdbKdKMgWPkvofgiorug==
X-Google-Smtp-Source: AGHT+IGLT7yTqD1HRbp0g+dVaksf1xzveaZLP+yFkMN9Z3pXXXvCU4M/LA5dyeTTzQHsrcQFQ2z7Ogbs
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:690c:3583:b0:6b0:57ec:c5f9 with SMTP id
 00721157ae682-6e21d0dc0d2mr147787b3.0.1727276527085; Wed, 25 Sep 2024
 08:02:07 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:07 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=882; i=ardb@kernel.org;
 h=from:subject; bh=h9wNxRa08o4eoAqCSyYKOZyZKBTJUImThQPxe9qE/+Y=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6taH/xoldmidSK479WfKnGWr8jq4V3v+610hdCLdd
 HLxEtXHHaUsDGIcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiB3cwMjS+ttry3/KZyAZx
 s7TOmpSVs1htspZOu2OitnHlgdL1srsY/goaVByePZOfkbc43zeoadWW9TLmExXTXvxNfTl7XfX dejYA
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-37-ardb+git@google.com>
Subject: [RFC PATCH 07/28] scripts/kallsyms: Avoid 0x0 as the relative base
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

In some cases, LLVM's lld linker may emit the following symbol into the
symbol table

0000000000000000 ? _GLOBAL_OFFSET_TABLE_

and its presence throws off the relative base logic in kallsyms. Since
0x0 is never a valid relative base, just ignore it.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 scripts/kallsyms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 03852da3d249..09757d300a05 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -747,7 +747,7 @@ static void record_relative_base(void)
 	unsigned int i;
 
 	for (i = 0; i < table_cnt; i++)
-		if (!symbol_absolute(table[i])) {
+		if (table[i]->addr && !symbol_absolute(table[i])) {
 			/*
 			 * The table is sorted by address.
 			 * Take the first non-absolute symbol value.
-- 
2.46.0.792.g87dc391469-goog


