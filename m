Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 403875BED90
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 21:22:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409564.652545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaiow-0004TV-P8; Tue, 20 Sep 2022 19:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409564.652545; Tue, 20 Sep 2022 19:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaiow-0004QP-LU; Tue, 20 Sep 2022 19:22:14 +0000
Received: by outflank-mailman (input) for mailman id 409564;
 Tue, 20 Sep 2022 19:22:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cn41=ZX=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1oaiou-0004QJ-Nc
 for xen-devel@lists.xenproject.org; Tue, 20 Sep 2022 19:22:12 +0000
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [2607:f8b0:4864:20::102f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85a2c9aa-3919-11ed-9647-05401a9f4f97;
 Tue, 20 Sep 2022 21:22:10 +0200 (CEST)
Received: by mail-pj1-x102f.google.com with SMTP id fv3so4179847pjb.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Sep 2022 12:22:10 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 i62-20020a17090a3dc400b001facf455c91sm286910pjc.21.2022.09.20.12.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 12:22:08 -0700 (PDT)
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
X-Inumbo-ID: 85a2c9aa-3919-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=mRkb49hJ/o7sUzNJw/zHfFKhjBVcyGD1caVksculA00=;
        b=PCUI69eggGWeXyBeTxep9IHUaH7o4uqq9Tn6NaYKT/NYgVgrpRX6+8DhNeX3ewe9ey
         clzFXuBXIjdIDBwAb0H1OJggBDLLvppduw51miVUkus5CCOXfCg6GLFkPmuoAUvBdVwx
         pWo63368x3lb04WlSCci+u5M/slQQLEVz5BeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=mRkb49hJ/o7sUzNJw/zHfFKhjBVcyGD1caVksculA00=;
        b=axC7ZFY9vKrSTrfNiDnHbTnEI3iaLxdxmHn0rruPKNk9vq4WalW7JKTzGBpZbEhY9M
         kywPWHnOc37TxfeJuTHZLmeEM7QUtLwxmKGSLsJjOLO3wtuMeQ4Z8m3s4uCafwxJRRq2
         6gYcyxXAeWXT2agdhCnT+xM2n9MwMx9qhdB9ZOkBrzkSm9nXPs3bB3yAzkDzy3hUotFg
         Iigre5UEmtnxuimkxf+qxJlYMwVqPoPoCAp1jOmEUHIqSitpaMuJ2cnT+npROqiiZNJY
         viDbapFNXZXN4BxqsgOu0I0lpou1CuhAm5iHBtnFR3kVdlCA7aVD/qyHOQ9WL99Oa4mn
         kJDg==
X-Gm-Message-State: ACrzQf1gVDDfI0XAhwOZSzaNQZQ9eRN40PjzPiEYlbszRSGjkiQuLhir
	5ubcCAnOkqBCRzoiBXBMccN4KQ==
X-Google-Smtp-Source: AMsMyM761d7Fl9dtnwBzIqTJhW7NDE0KfYgW2Z3zOf5cFMrONbSUwHk2/D83vjqkbY1Tqo6olp+d4w==
X-Received: by 2002:a17:903:1248:b0:172:f3c7:97a6 with SMTP id u8-20020a170903124800b00172f3c797a6mr1097776plh.128.1663701729091;
        Tue, 20 Sep 2022 12:22:09 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	xen-devel@lists.xenproject.org,
	llvm@lists.linux.dev,
	Siddhesh Poyarekar <siddhesh@gotplt.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Tom Rix <trix@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] x86/entry: Work around Clang __bdos() bug
Date: Tue, 20 Sep 2022 12:21:59 -0700
Message-Id: <20220920192202.190793-2-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920192202.190793-1-keescook@chromium.org>
References: <20220920192202.190793-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1979; h=from:subject; bh=4MnVaPsx8mraEdez/1qUw/f+9P/3EjkrM/1wqdGlA2Y=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjKhLZE7kAhe/OxfUVwh8eyd4pKAVAQvW03irD5DAW qRCvxvmJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYyoS2QAKCRCJcvTf3G3AJuSWD/ 0YU5lJR6Qasvy4L3d9D2h5U5JWrfw5lBGb341IHXohJFP1UnzRH0CT/UnomvYDoLvjhR2joksvkjkn BNTSv7VoRq4RwprCdKG4kgHD8PGjx57z3qsj73lXyfUXt1MwvQB9y+YDpD/SE2IuUFQpf+4iZ2uEtn LvLw9kT0MNmAnaM2dSR5lA6wrcdt9dcqBf4C1O80RyWBKBnfJN2tT3TskZggBrAyk2Y4VxfAOg9UF2 vTENn7pVEn7EisxLJ6/wCFt835Ov9Op7ldWqez4GSVVxpyhYW3zjEzqFOZ1Jwto62iUKdM+V83O8ew rjJ/WRDJT6EN225b5IvYvTHVC742B3/OkrjefYwWsKruTy7sR4aGoXrx6gtHOCfsncloYhZnF1ayiE /BA9ncPIH958gJ01gz7eZndZ2kkOAFTm3BBIZ/Rm8ISXObKAWBd6rFb0MBYeVza2e4fbwvVJfgTG9H tv86FQuDi0OhoT1JbgJrNbf/GhLz8PegmQUKUoAhXk9LrWby/jti9NoGokj6bJKjjtuORb0ETDHUJU WM+b2N7anNSPw/Sovfcx5bkbvOrenXO1PW7ByUj5o5/nal3mnvLFtWS7g3Z17XB5ybO8nxngnjb9NG Fcmwv0P7fktHuuT0QNwTw4WG5vmaMeqDZTTYXOKsbqzpoOfwlI1qO6qXA0jQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

After expanding bounds checking to use __builtin_dynamic_object_size(),
Clang produces a false positive when building with CONFIG_FORTIFY_SOURCE=y
and CONFIG_UBSAN_BOUNDS=y when operating on an array with a dynamic
offset. Work around this by using a direct assignment of an empty
instance. Avoids this warning:

../include/linux/fortify-string.h:309:4: warning: call to __write_overflow_field declared with 'warn
ing' attribute: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Wat
tribute-warning]
                        __write_overflow_field(p_size_field, size);
                        ^

which was isolated to the memset() call in xen_load_idt().

Note that this looks very much like another bug that was worked around:
https://github.com/ClangBuiltLinux/linux/issues/1592

Cc: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: xen-devel@lists.xenproject.org
Cc: llvm@lists.linux.dev
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/xen/enlighten_pv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 0ed2e487a693..9b1a58dda935 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -765,6 +765,7 @@ static void xen_load_idt(const struct desc_ptr *desc)
 {
 	static DEFINE_SPINLOCK(lock);
 	static struct trap_info traps[257];
+	static const struct trap_info zero = { };
 	unsigned out;
 
 	trace_xen_cpu_load_idt(desc);
@@ -774,7 +775,7 @@ static void xen_load_idt(const struct desc_ptr *desc)
 	memcpy(this_cpu_ptr(&idt_desc), desc, sizeof(idt_desc));
 
 	out = xen_convert_trap_info(desc, traps, false);
-	memset(&traps[out], 0, sizeof(traps[0]));
+	traps[out] = zero;
 
 	xen_mc_flush();
 	if (HYPERVISOR_set_trap_table(traps))
-- 
2.34.1


