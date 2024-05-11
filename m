Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8613D8C3212
	for <lists+xen-devel@lfdr.de>; Sat, 11 May 2024 17:18:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720360.1123424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5oSv-0002I5-HI; Sat, 11 May 2024 15:16:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720360.1123424; Sat, 11 May 2024 15:16:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5oSv-0002FS-Dz; Sat, 11 May 2024 15:16:49 +0000
Received: by outflank-mailman (input) for mailman id 720360;
 Sat, 11 May 2024 15:16:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HmPl=MO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s5oSt-0002FM-TC
 for xen-devel@lists.xenproject.org; Sat, 11 May 2024 15:16:48 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a67c631-0fa9-11ef-909d-e314d9c70b13;
 Sat, 11 May 2024 17:16:45 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a59a5f81af4so743386166b.3
 for <xen-devel@lists.xenproject.org>; Sat, 11 May 2024 08:16:45 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b17d02sm339118966b.218.2024.05.11.08.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 May 2024 08:16:43 -0700 (PDT)
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
X-Inumbo-ID: 7a67c631-0fa9-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715440604; x=1716045404; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6+FCfeWQ07lM7xrLNFgOCKq9dA+XCwsh9U//qQFZcMQ=;
        b=mcuNhmSQUooHdiSCRTh9Ja+AqviraRnw9chP3/+z/3AWrq0bNv+3SlYoM1mlPiYZDk
         8V3uwMqPa+o5f6SW6y5X3ckVcJoPZqilpFpAADf2fJ5jHKj2dCvz9VEHnWeEi4HMn22k
         6Yd5JVC53lM7xLpVCKbe6/ghk/SbFxsCOsprs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715440604; x=1716045404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6+FCfeWQ07lM7xrLNFgOCKq9dA+XCwsh9U//qQFZcMQ=;
        b=YDsfprfLav55VBCmjrR9gqRfep/j5riTQR5ce4s5mmJPxrH7MDGdybxqo0Vbb5DsXZ
         fzY3dYMUKhwl/VojN8Ebu4LyYku/rAqXeu427V3CeJwPe9pbt8Kjn9nRw53AriluL3xp
         R54dV/gZkOH66gSX3Ksyr2Aog5Zy4o6PziTuhhsEmixYdhWy2vbQIxCJ+RnaRqKaYM0P
         3sfDfghaq3wV3fDZ2UxuIVWgK6H71IpCEEIgfH5i8+EG6tfzxoDBp0HB7wMHEjrrUsdt
         bV79A3DIJorRWl6aGVhKh7Q//j7tWi41B52CTZ7N/5zv/PE90+x8EOqFrtkJ9QMh+rr3
         mggw==
X-Gm-Message-State: AOJu0YwddhQVYHTJeC669LAgcDOZ5jUiuyI31PaENRUkwjgTkDi3nTqL
	l51MLJM7UTbvVi77glo1dTeqHN923Y4pVyeYS4YcWgRiMssFGHTMPXnBOpMNDn4W4Cex+9gF6SD
	P
X-Google-Smtp-Source: AGHT+IGx9DnLgKwuPXmVFOSL0hPxvOCxs/s47ciBuRQIn3mVlhytg8mLXWwUuTJfe+wIgrdwq73x4A==
X-Received: by 2002:a17:906:c285:b0:a59:cd18:92fc with SMTP id a640c23a62f3a-a5a2d672f17mr401276866b.62.1715440604184;
        Sat, 11 May 2024 08:16:44 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/pv: Sanity check bytes_per_rep in rep_outs()
Date: Sat, 11 May 2024 16:16:42 +0100
Message-Id: <20240511151642.2476555-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I was playing with GCC-14, and gave the new static analyser (-fanalyze) a
try.  One of the more serious things it came back with was this:

  In file included from ./arch/x86/include/asm/mm.h:10,
                   from ./include/xen/mm.h:233,
                   from ./include/xen/domain_page.h:12,
                   from arch/x86/pv/emul-priv-op.c:10:
  In function '__copy_from_guest_pv',
      inlined from 'rep_outs' at arch/x86/pv/emul-priv-op.c:718:20:
  ./arch/x86/include/asm/uaccess.h:174:9: warning: stack-based buffer overflow [CWE-121] [-Wanalyzer-out-of-bounds]
    174 |         __asm__ __volatile__(                                           \
        |         ^~~~~~~
  ./arch/x86/include/asm/uaccess.h:229:13: note: in expansion of macro 'get_unsafe_asm'
    229 |     case 8: get_unsafe_asm(x, ptr, grd, retval,  "", "=r", errret); break; \
        |             ^~~~~~~~~~~~~~
  ./arch/x86/include/asm/uaccess.h:236:5: note: in expansion of macro 'get_unsafe_size'
    236 |     get_unsafe_size(x, ptr, size, UA_KEEP, retval, errret)
        |     ^~~~~~~~~~~~~~~
  ./arch/x86/include/asm/uaccess.h:308:13: note: in expansion of macro 'get_guest_size'
    308 |             get_guest_size(*(uint64_t *)to, from, 8, ret, 8);
        |             ^~~~~~~~~~~~~~
    'rep_outs': events 1-3
      |
      |arch/x86/pv/emul-priv-op.c:674:21:
      |  674 | static int cf_check rep_outs(
      |      |                     ^~~~~~~~
      |      |                     |
      |      |                     (1) entry to 'rep_outs'
      |......
      |  688 |     if ( !guest_io_okay(port, bytes_per_rep, curr, ctxt->regs) )
      |      |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |      |           |
      |      |           (3) calling 'guest_io_okay' from 'rep_outs'
      |......
      |  710 |         unsigned int data = 0;
      |      |                      ~~~~
      |      |                      |
      |      |                      (2) capacity: 4 bytes
      |
      +--> 'guest_io_okay': events 4-5
             |
             |  159 | static bool guest_io_okay(unsigned int port, unsigned int bytes,
             |      |             ^~~~~~~~~~~~~
             |      |             |
             |      |             (4) entry to 'guest_io_okay'
             |......
             |  165 |     if ( iopl_ok(v, regs) )
             |      |          ~~~~~~~~~~~~~~~~
             |      |          |
             |      |          (5) calling 'iopl_ok' from 'guest_io_okay'
             |
             +--> 'iopl_ok': event 6
                    |
                    |  148 | static bool iopl_ok(const struct vcpu *v, const struct cpu_user_regs *regs)
                    |      |             ^~~~~~~
                    |      |             |
                    |      |             (6) entry to 'iopl_ok'
                    |
                  'iopl_ok': event 7
                    |
                    |./include/xen/bug.h:141:13:
                    |  141 |     do { if ( unlikely(!(p)) ) assert_failed(#p); } while (0)
                    |      |             ^
                    |      |             |
                    |      |             (7) following 'false' branch...
  arch/x86/pv/emul-priv-op.c:153:5: note: in expansion of macro 'ASSERT'
                    |  153 |     ASSERT((v->arch.pv.iopl & ~X86_EFLAGS_IOPL) == 0);
                    |      |     ^~~~~~
                    |
                  'iopl_ok': event 8
                    |
                    |./include/xen/bug.h:124:31:
                    |  124 | #define assert_failed(msg) do {                                 \
                    |      |                               ^
                    |      |                               |
                    |      |                               (8) ...to here
  ./include/xen/bug.h:141:32: note: in expansion of macro 'assert_failed'
                    |  141 |     do { if ( unlikely(!(p)) ) assert_failed(#p); } while (0)
                    |      |                                ^~~~~~~~~~~~~
  arch/x86/pv/emul-priv-op.c:153:5: note: in expansion of macro 'ASSERT'
                    |  153 |     ASSERT((v->arch.pv.iopl & ~X86_EFLAGS_IOPL) == 0);
                    |      |     ^~~~~~
                    |
             <------+
             |
           'guest_io_okay': event 9
             |
             |  165 |     if ( iopl_ok(v, regs) )
             |      |          ^~~~~~~~~~~~~~~~
             |      |          |
             |      |          (9) returning to 'guest_io_okay' from 'iopl_ok'
             |
      <------+
      |
    'rep_outs': events 10-13
      |
      |  688 |     if ( !guest_io_okay(port, bytes_per_rep, curr, ctxt->regs) )
      |      |        ~  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |      |        |  |
      |      |        |  (10) returning to 'rep_outs' from 'guest_io_okay'
      |      |        (11) following 'true' branch...
      |......
      |  691 |     rc = read_segment(seg, &sreg, ctxt);
      |      |     ~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |      |     |    |
      |      |     |    (13) calling 'read_segment' from 'rep_outs'
      |      |     (12) ...to here
      |
      +--> 'read_segment': events 14-18
             |
             |  493 | static int cf_check read_segment(
             |      |                     ^~~~~~~~~~~~
             |      |                     |
             |      |                     (14) entry to 'read_segment'
             |......
             |  510 |     if ( ctxt->addr_size < 64 )
             |      |        ~
             |      |        |
             |      |        (15) following 'false' branch...
             |......
             |  535 |         switch ( seg )
             |      |         ~~~~~~
             |      |         |
             |      |         (16) ...to here
             |......
             |  538 |             if ( !is_x86_user_segment(seg) )
             |      |                ~
             |      |                |
             |      |                (17) following 'false' branch (when 'seg <= 5')...
             |  539 |                 return X86EMUL_UNHANDLEABLE;
             |  540 |             reg->base = 0;
             |      |             ~~~
             |      |             |
             |      |             (18) ...to here
             |
      <------+
      |
    'rep_outs': events 19-30
      |
      |  691 |     rc = read_segment(seg, &sreg, ctxt);
      |      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |      |          |
      |      |          (19) returning to 'rep_outs' from 'read_segment'
      |  692 |     if ( rc != X86EMUL_OKAY )
      |      |        ~
      |      |        |
      |      |        (20) following 'false' branch (when 'rc == 0')...
      |......
      |  695 |     if ( !sreg.p )
      |      |     ~~ ~
      |      |     |  |
      |      |     |  (22) following 'false' branch...
      |      |     (21) ...to here
      |  696 |         return X86EMUL_UNHANDLEABLE;
      |  697 |     if ( !sreg.s ||
      |      |     ~~ ~ ~~~~~~~~~~
      |      |     |  |         |
      |      |     |  |         (26) following 'false' branch...
      |      |     |  (24) following 'false' branch...
      |      |     (23) ...to here
      |  698 |          ((sreg.type & (_SEGMENT_CODE >> 8)) &&
      |      |          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |      |                |
      |      |                (25) ...to here
      |  699 |           !(sreg.type & (_SEGMENT_WR >> 8))) )
      |      |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |......
      |  706 |     poc->bpmatch = check_guest_io_breakpoint(curr, port, bytes_per_rep);
      |      |     ~~~
      |      |     |
      |      |     (27) ...to here
      |  707 |
      |  708 |     while ( *reps < goal )
      |      |             ~~~~~~~~~~~~
      |      |                   |
      |      |                   (28) following 'true' branch...
      |  709 |     {
      |  710 |         unsigned int data = 0;
      |      |         ~~~~~~~~
      |      |         |
      |      |         (29) ...to here
      |......
      |  713 |         rc = pv_emul_virt_to_linear(sreg.base, offset, bytes_per_rep,
      |      |              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |      |              |
      |      |              (30) calling 'pv_emul_virt_to_linear' from 'rep_outs'
      |  714 |                                     sreg.limit, seg, ctxt, &addr);
      |      |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |
      +--> 'pv_emul_virt_to_linear': events 31-33
             |
             |  580 | static int pv_emul_virt_to_linear(unsigned long base, unsigned long offset,
             |      |            ^~~~~~~~~~~~~~~~~~~~~~
             |      |            |
             |      |            (31) entry to 'pv_emul_virt_to_linear'
             |......
             |  596 |     else if ( !__addr_ok(*addr) )
             |      |             ~
             |      |             |
             |      |             (32) following 'false' branch...
             |......
             |  603 |     return rc;
             |      |     ~~~~~~
             |      |     |
             |      |     (33) ...to here
             |
      <------+
      |
    'rep_outs': events 34-37
      |
      |  713 |         rc = pv_emul_virt_to_linear(sreg.base, offset, bytes_per_rep,
      |      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |      |              |
      |      |              (34) returning to 'rep_outs' from 'pv_emul_virt_to_linear'
      |  714 |                                     sreg.limit, seg, ctxt, &addr);
      |      |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |  715 |         if ( rc != X86EMUL_OKAY )
      |      |            ~
      |      |            |
      |      |            (35) following 'false' branch (when 'rc == 0')...
      |......
      |  718 |         if ( (rc = __copy_from_guest_pv(&data, (void __user *)addr,
      |      |         ~~         ~
      |      |         |          |
      |      |         |          (37) inlined call to '__copy_from_guest_pv' from 'rep_outs'
      |      |         (36) ...to here
      |
      +--> '__copy_from_guest_pv': events 38-41
             |
             |./arch/x86/include/asm/uaccess.h:294:8:
             |  294 |     if (__builtin_constant_p(n)) {
             |      |        ^
             |      |        |
             |      |        (38) following 'true' branch...
             |  295 |         unsigned long ret;
             |      |         ~~~~~~~~
             |      |         |
             |      |         (39) ...to here
             |  296 |
             |  297 |         switch (n) {
             |      |         ~~~~~~
             |      |         |
             |      |         (40) following 'case 8:' branch...
             |......
             |  307 |         case 8:
             |      |         ~~~~
             |      |         |
             |      |         (41) ...to here
             |
           '__copy_from_guest_pv': event 42
             |
             |  174 |         __asm__ __volatile__(                                           \
             |      |         ^~~~~~~
             |      |         |
             |      |         (42) out-of-bounds write from byte 4 till byte 7 but 'data' ends at byte 4
  ./arch/x86/include/asm/uaccess.h:229:13: note: in expansion of macro 'get_unsafe_asm'
             |  229 |     case 8: get_unsafe_asm(x, ptr, grd, retval,  "", "=r", errret); break; \
             |      |             ^~~~~~~~~~~~~~
  ./arch/x86/include/asm/uaccess.h:236:5: note: in expansion of macro 'get_unsafe_size'
             |  236 |     get_unsafe_size(x, ptr, size, UA_KEEP, retval, errret)
             |      |     ^~~~~~~~~~~~~~~
  ./arch/x86/include/asm/uaccess.h:308:13: note: in expansion of macro 'get_guest_size'
             |  308 |             get_guest_size(*(uint64_t *)to, from, 8, ret, 8);
             |      |             ^~~~~~~~~~~~~~
             |
  ./arch/x86/include/asm/uaccess.h:174:9: note: write of 4 bytes to beyond the end of 'data'
    174 |         __asm__ __volatile__(                                           \
        |         ^~~~~~~
  ./arch/x86/include/asm/uaccess.h:229:13: note: in expansion of macro 'get_unsafe_asm'
    229 |     case 8: get_unsafe_asm(x, ptr, grd, retval,  "", "=r", errret); break; \
        |             ^~~~~~~~~~~~~~
  ./arch/x86/include/asm/uaccess.h:236:5: note: in expansion of macro 'get_unsafe_size'
    236 |     get_unsafe_size(x, ptr, size, UA_KEEP, retval, errret)
        |     ^~~~~~~~~~~~~~~
  ./arch/x86/include/asm/uaccess.h:308:13: note: in expansion of macro 'get_guest_size'
    308 |             get_guest_size(*(uint64_t *)to, from, 8, ret, 8);
        |             ^~~~~~~~~~~~~~

    ┌──────────────────────────────────────────────────────────────────────┐
    │                    write of 'uint64_t' (8 bytes)                     │
    └──────────────────────────────────────────────────────────────────────┘
                     │                                   │
                     │                                   │
                     v                                   v
    ┌──────────────────────────────────┐┌──────────────────────────────────┐
    │  'data' (type: 'unsigned int')   ││        after valid range         │
    └──────────────────────────────────┘└──────────────────────────────────┘
    ├────────────────┬─────────────────┤├────────────────┬─────────────────┤
                     │                                   │
            ╭────────┴────────╮              ╭───────────┴──────────╮
            │capacity: 4 bytes│              │⚠️  overflow of 4 bytes│
            ╰─────────────────╯              ╰──────────────────────╯

What is happening is that it's seen that __copy_from_guest_pv() has a case for
8, and it doesn't have any information about bytes_per_rep which is an input
to the function.

Architecturally, there's no 64-bit variant of OUTS in x86.  Leaving an
assertion to this effect is enough to satisfy the analyser.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

A little RFC, but the analyser is right - if rep_outs() were to be called with
anything more than 4, the stack would be clobbered, and no developer is
finding that bug the easy way...
---
 xen/arch/x86/pv/emul-priv-op.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index f101510a1bab..1460ecc187be 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -685,6 +685,8 @@ static int cf_check rep_outs(
 
     *reps = 0;
 
+    ASSERT(bytes_per_rep <= 4); /* i.e. 'data' being 4 bytes is fine. */
+
     if ( !guest_io_okay(port, bytes_per_rep, curr, ctxt->regs) )
         return X86EMUL_UNHANDLEABLE;
 
-- 
2.30.2


