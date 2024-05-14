Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 586508C4C8F
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 09:06:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721143.1124295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6mET-00086I-8f; Tue, 14 May 2024 07:05:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721143.1124295; Tue, 14 May 2024 07:05:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6mET-00084i-53; Tue, 14 May 2024 07:05:53 +0000
Received: by outflank-mailman (input) for mailman id 721143;
 Tue, 14 May 2024 07:05:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PE3g=MR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s6mEQ-00082u-Ub
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 07:05:51 +0000
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [2607:f8b0:4864:20::72f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 646b236b-11c0-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 09:05:49 +0200 (CEST)
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-792d65cd7a8so150371385a.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 00:05:49 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-792bf2a45b5sm536329285a.62.2024.05.14.00.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 00:05:47 -0700 (PDT)
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
X-Inumbo-ID: 646b236b-11c0-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715670348; x=1716275148; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X40dseCSmhwoma2yJHjVIyCXRybcqL2OUtOW+9ivWME=;
        b=k2ioDzCW8TFGNco5OwO+oStVlchC7gpvApMceJUV5wX0GgqUTWXn+LOmg27N/fqgp6
         wbT5e4y832ls/QuaN9iqEgei9IzTER63anrqUUlcRg1tHPFyBL7Srtm+fQkYTnU14Dvs
         pFJGm+RHIGYyOmqv+lPijbC/JZulzWRFtDZns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715670348; x=1716275148;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X40dseCSmhwoma2yJHjVIyCXRybcqL2OUtOW+9ivWME=;
        b=qqLN4faJuPX57VkPqF6u/bPUVmqyxpIKo2C/z/HVxgw37f98NPpYVwb9UCpdWgUObg
         cRVjvZVC/Ld85K/H7SAhwBj2K5DNFaxCWBajawrVLO1XHNuBaTIOv+gIGfOT02hgWm9k
         nTBhg3RP7TVyJ6yPcrKJRrnR9D+D7TvQb98t/r3X3V9tfBm3R9Y0XhEVtIbEhpAydndo
         vyaSMfP6cG/8D/T6M6Jtn3oMgKG2gozd51VPFG6s418bQPVkNjbxtWg17ly5U7HtzXUH
         4KFAKeqkeKvclnT2xQzLFLYM+/DPg5OESh8kjwMDQ6fKDSahPlcaiypjIL3CdnYZU5dx
         F1PA==
X-Gm-Message-State: AOJu0YxxagD7yLKieR5pfBYOcU4xBtbOL1W/BxA3hgdcslH164+7OaZs
	SJb1Adc7ExAg2eVo/BXr8h6Lmcv1sSW7W10eKJFYA5Ur7YC5i/cEYy+w2SFu0jWH6d7nSyvNZeV
	o
X-Google-Smtp-Source: AGHT+IG+j0uq98JnoZuVro5sSe8Tk8ar6MYifv+ydA3DMqQUXNAwwAKxRNLXZqBdyjxsMy8j49vqZw==
X-Received: by 2002:ae9:f819:0:b0:792:8d94:2bfa with SMTP id af79cd13be357-792c75ff9abmr1263266485a.71.1715670348026;
        Tue, 14 May 2024 00:05:48 -0700 (PDT)
Date: Tue, 14 May 2024 09:05:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH] x86/pv: Sanity check bytes_per_rep in rep_outs()
Message-ID: <ZkMNSbcB9S4YYcfy@macbook>
References: <20240511151642.2476555-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240511151642.2476555-1-andrew.cooper3@citrix.com>

On Sat, May 11, 2024 at 04:16:42PM +0100, Andrew Cooper wrote:
> I was playing with GCC-14, and gave the new static analyser (-fanalyze) a
> try.  One of the more serious things it came back with was this:
> 
>   In file included from ./arch/x86/include/asm/mm.h:10,
>                    from ./include/xen/mm.h:233,
>                    from ./include/xen/domain_page.h:12,
>                    from arch/x86/pv/emul-priv-op.c:10:
>   In function '__copy_from_guest_pv',
>       inlined from 'rep_outs' at arch/x86/pv/emul-priv-op.c:718:20:
>   ./arch/x86/include/asm/uaccess.h:174:9: warning: stack-based buffer overflow [CWE-121] [-Wanalyzer-out-of-bounds]
>     174 |         __asm__ __volatile__(                                           \
>         |         ^~~~~~~
>   ./arch/x86/include/asm/uaccess.h:229:13: note: in expansion of macro 'get_unsafe_asm'
>     229 |     case 8: get_unsafe_asm(x, ptr, grd, retval,  "", "=r", errret); break; \
>         |             ^~~~~~~~~~~~~~
>   ./arch/x86/include/asm/uaccess.h:236:5: note: in expansion of macro 'get_unsafe_size'
>     236 |     get_unsafe_size(x, ptr, size, UA_KEEP, retval, errret)
>         |     ^~~~~~~~~~~~~~~
>   ./arch/x86/include/asm/uaccess.h:308:13: note: in expansion of macro 'get_guest_size'
>     308 |             get_guest_size(*(uint64_t *)to, from, 8, ret, 8);
>         |             ^~~~~~~~~~~~~~
>     'rep_outs': events 1-3
>       |
>       |arch/x86/pv/emul-priv-op.c:674:21:
>       |  674 | static int cf_check rep_outs(
>       |      |                     ^~~~~~~~
>       |      |                     |
>       |      |                     (1) entry to 'rep_outs'
>       |......
>       |  688 |     if ( !guest_io_okay(port, bytes_per_rep, curr, ctxt->regs) )
>       |      |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |      |           |
>       |      |           (3) calling 'guest_io_okay' from 'rep_outs'
>       |......
>       |  710 |         unsigned int data = 0;
>       |      |                      ~~~~
>       |      |                      |
>       |      |                      (2) capacity: 4 bytes
>       |
>       +--> 'guest_io_okay': events 4-5
>              |
>              |  159 | static bool guest_io_okay(unsigned int port, unsigned int bytes,
>              |      |             ^~~~~~~~~~~~~
>              |      |             |
>              |      |             (4) entry to 'guest_io_okay'
>              |......
>              |  165 |     if ( iopl_ok(v, regs) )
>              |      |          ~~~~~~~~~~~~~~~~
>              |      |          |
>              |      |          (5) calling 'iopl_ok' from 'guest_io_okay'
>              |
>              +--> 'iopl_ok': event 6
>                     |
>                     |  148 | static bool iopl_ok(const struct vcpu *v, const struct cpu_user_regs *regs)
>                     |      |             ^~~~~~~
>                     |      |             |
>                     |      |             (6) entry to 'iopl_ok'
>                     |
>                   'iopl_ok': event 7
>                     |
>                     |./include/xen/bug.h:141:13:
>                     |  141 |     do { if ( unlikely(!(p)) ) assert_failed(#p); } while (0)
>                     |      |             ^
>                     |      |             |
>                     |      |             (7) following 'false' branch...
>   arch/x86/pv/emul-priv-op.c:153:5: note: in expansion of macro 'ASSERT'
>                     |  153 |     ASSERT((v->arch.pv.iopl & ~X86_EFLAGS_IOPL) == 0);
>                     |      |     ^~~~~~
>                     |
>                   'iopl_ok': event 8
>                     |
>                     |./include/xen/bug.h:124:31:
>                     |  124 | #define assert_failed(msg) do {                                 \
>                     |      |                               ^
>                     |      |                               |
>                     |      |                               (8) ...to here
>   ./include/xen/bug.h:141:32: note: in expansion of macro 'assert_failed'
>                     |  141 |     do { if ( unlikely(!(p)) ) assert_failed(#p); } while (0)
>                     |      |                                ^~~~~~~~~~~~~
>   arch/x86/pv/emul-priv-op.c:153:5: note: in expansion of macro 'ASSERT'
>                     |  153 |     ASSERT((v->arch.pv.iopl & ~X86_EFLAGS_IOPL) == 0);
>                     |      |     ^~~~~~
>                     |
>              <------+
>              |
>            'guest_io_okay': event 9
>              |
>              |  165 |     if ( iopl_ok(v, regs) )
>              |      |          ^~~~~~~~~~~~~~~~
>              |      |          |
>              |      |          (9) returning to 'guest_io_okay' from 'iopl_ok'
>              |
>       <------+
>       |
>     'rep_outs': events 10-13
>       |
>       |  688 |     if ( !guest_io_okay(port, bytes_per_rep, curr, ctxt->regs) )
>       |      |        ~  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |      |        |  |
>       |      |        |  (10) returning to 'rep_outs' from 'guest_io_okay'
>       |      |        (11) following 'true' branch...
>       |......
>       |  691 |     rc = read_segment(seg, &sreg, ctxt);
>       |      |     ~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |      |     |    |
>       |      |     |    (13) calling 'read_segment' from 'rep_outs'
>       |      |     (12) ...to here
>       |
>       +--> 'read_segment': events 14-18
>              |
>              |  493 | static int cf_check read_segment(
>              |      |                     ^~~~~~~~~~~~
>              |      |                     |
>              |      |                     (14) entry to 'read_segment'
>              |......
>              |  510 |     if ( ctxt->addr_size < 64 )
>              |      |        ~
>              |      |        |
>              |      |        (15) following 'false' branch...
>              |......
>              |  535 |         switch ( seg )
>              |      |         ~~~~~~
>              |      |         |
>              |      |         (16) ...to here
>              |......
>              |  538 |             if ( !is_x86_user_segment(seg) )
>              |      |                ~
>              |      |                |
>              |      |                (17) following 'false' branch (when 'seg <= 5')...
>              |  539 |                 return X86EMUL_UNHANDLEABLE;
>              |  540 |             reg->base = 0;
>              |      |             ~~~
>              |      |             |
>              |      |             (18) ...to here
>              |
>       <------+
>       |
>     'rep_outs': events 19-30
>       |
>       |  691 |     rc = read_segment(seg, &sreg, ctxt);
>       |      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |      |          |
>       |      |          (19) returning to 'rep_outs' from 'read_segment'
>       |  692 |     if ( rc != X86EMUL_OKAY )
>       |      |        ~
>       |      |        |
>       |      |        (20) following 'false' branch (when 'rc == 0')...
>       |......
>       |  695 |     if ( !sreg.p )
>       |      |     ~~ ~
>       |      |     |  |
>       |      |     |  (22) following 'false' branch...
>       |      |     (21) ...to here
>       |  696 |         return X86EMUL_UNHANDLEABLE;
>       |  697 |     if ( !sreg.s ||
>       |      |     ~~ ~ ~~~~~~~~~~
>       |      |     |  |         |
>       |      |     |  |         (26) following 'false' branch...
>       |      |     |  (24) following 'false' branch...
>       |      |     (23) ...to here
>       |  698 |          ((sreg.type & (_SEGMENT_CODE >> 8)) &&
>       |      |          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |      |                |
>       |      |                (25) ...to here
>       |  699 |           !(sreg.type & (_SEGMENT_WR >> 8))) )
>       |      |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |......
>       |  706 |     poc->bpmatch = check_guest_io_breakpoint(curr, port, bytes_per_rep);
>       |      |     ~~~
>       |      |     |
>       |      |     (27) ...to here
>       |  707 |
>       |  708 |     while ( *reps < goal )
>       |      |             ~~~~~~~~~~~~
>       |      |                   |
>       |      |                   (28) following 'true' branch...
>       |  709 |     {
>       |  710 |         unsigned int data = 0;
>       |      |         ~~~~~~~~
>       |      |         |
>       |      |         (29) ...to here
>       |......
>       |  713 |         rc = pv_emul_virt_to_linear(sreg.base, offset, bytes_per_rep,
>       |      |              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |      |              |
>       |      |              (30) calling 'pv_emul_virt_to_linear' from 'rep_outs'
>       |  714 |                                     sreg.limit, seg, ctxt, &addr);
>       |      |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |
>       +--> 'pv_emul_virt_to_linear': events 31-33
>              |
>              |  580 | static int pv_emul_virt_to_linear(unsigned long base, unsigned long offset,
>              |      |            ^~~~~~~~~~~~~~~~~~~~~~
>              |      |            |
>              |      |            (31) entry to 'pv_emul_virt_to_linear'
>              |......
>              |  596 |     else if ( !__addr_ok(*addr) )
>              |      |             ~
>              |      |             |
>              |      |             (32) following 'false' branch...
>              |......
>              |  603 |     return rc;
>              |      |     ~~~~~~
>              |      |     |
>              |      |     (33) ...to here
>              |
>       <------+
>       |
>     'rep_outs': events 34-37
>       |
>       |  713 |         rc = pv_emul_virt_to_linear(sreg.base, offset, bytes_per_rep,
>       |      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |      |              |
>       |      |              (34) returning to 'rep_outs' from 'pv_emul_virt_to_linear'
>       |  714 |                                     sreg.limit, seg, ctxt, &addr);
>       |      |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |  715 |         if ( rc != X86EMUL_OKAY )
>       |      |            ~
>       |      |            |
>       |      |            (35) following 'false' branch (when 'rc == 0')...
>       |......
>       |  718 |         if ( (rc = __copy_from_guest_pv(&data, (void __user *)addr,
>       |      |         ~~         ~
>       |      |         |          |
>       |      |         |          (37) inlined call to '__copy_from_guest_pv' from 'rep_outs'
>       |      |         (36) ...to here
>       |
>       +--> '__copy_from_guest_pv': events 38-41
>              |
>              |./arch/x86/include/asm/uaccess.h:294:8:
>              |  294 |     if (__builtin_constant_p(n)) {
>              |      |        ^
>              |      |        |
>              |      |        (38) following 'true' branch...
>              |  295 |         unsigned long ret;
>              |      |         ~~~~~~~~
>              |      |         |
>              |      |         (39) ...to here
>              |  296 |
>              |  297 |         switch (n) {
>              |      |         ~~~~~~
>              |      |         |
>              |      |         (40) following 'case 8:' branch...
>              |......
>              |  307 |         case 8:
>              |      |         ~~~~
>              |      |         |
>              |      |         (41) ...to here
>              |
>            '__copy_from_guest_pv': event 42
>              |
>              |  174 |         __asm__ __volatile__(                                           \
>              |      |         ^~~~~~~
>              |      |         |
>              |      |         (42) out-of-bounds write from byte 4 till byte 7 but 'data' ends at byte 4
>   ./arch/x86/include/asm/uaccess.h:229:13: note: in expansion of macro 'get_unsafe_asm'
>              |  229 |     case 8: get_unsafe_asm(x, ptr, grd, retval,  "", "=r", errret); break; \
>              |      |             ^~~~~~~~~~~~~~
>   ./arch/x86/include/asm/uaccess.h:236:5: note: in expansion of macro 'get_unsafe_size'
>              |  236 |     get_unsafe_size(x, ptr, size, UA_KEEP, retval, errret)
>              |      |     ^~~~~~~~~~~~~~~
>   ./arch/x86/include/asm/uaccess.h:308:13: note: in expansion of macro 'get_guest_size'
>              |  308 |             get_guest_size(*(uint64_t *)to, from, 8, ret, 8);
>              |      |             ^~~~~~~~~~~~~~
>              |
>   ./arch/x86/include/asm/uaccess.h:174:9: note: write of 4 bytes to beyond the end of 'data'
>     174 |         __asm__ __volatile__(                                           \
>         |         ^~~~~~~
>   ./arch/x86/include/asm/uaccess.h:229:13: note: in expansion of macro 'get_unsafe_asm'
>     229 |     case 8: get_unsafe_asm(x, ptr, grd, retval,  "", "=r", errret); break; \
>         |             ^~~~~~~~~~~~~~
>   ./arch/x86/include/asm/uaccess.h:236:5: note: in expansion of macro 'get_unsafe_size'
>     236 |     get_unsafe_size(x, ptr, size, UA_KEEP, retval, errret)
>         |     ^~~~~~~~~~~~~~~
>   ./arch/x86/include/asm/uaccess.h:308:13: note: in expansion of macro 'get_guest_size'
>     308 |             get_guest_size(*(uint64_t *)to, from, 8, ret, 8);
>         |             ^~~~~~~~~~~~~~
> 
>     ┌──────────────────────────────────────────────────────────────────────┐
>     │                    write of 'uint64_t' (8 bytes)                     │
>     └──────────────────────────────────────────────────────────────────────┘
>                      │                                   │
>                      │                                   │
>                      v                                   v
>     ┌──────────────────────────────────┐┌──────────────────────────────────┐
>     │  'data' (type: 'unsigned int')   ││        after valid range         │
>     └──────────────────────────────────┘└──────────────────────────────────┘
>     ├────────────────┬─────────────────┤├────────────────┬─────────────────┤
>                      │                                   │
>             ╭────────┴────────╮              ╭───────────┴──────────╮
>             │capacity: 4 bytes│              │⚠️  overflow of 4 bytes│
>             ╰─────────────────╯              ╰──────────────────────╯
> 
> What is happening is that it's seen that __copy_from_guest_pv() has a case for
> 8, and it doesn't have any information about bytes_per_rep which is an input
> to the function.
> 
> Architecturally, there's no 64-bit variant of OUTS in x86.  Leaving an
> assertion to this effect is enough to satisfy the analyser.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> A little RFC, but the analyser is right - if rep_outs() were to be called with
> anything more than 4, the stack would be clobbered, and no developer is
> finding that bug the easy way...
> ---
>  xen/arch/x86/pv/emul-priv-op.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
> index f101510a1bab..1460ecc187be 100644
> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -685,6 +685,8 @@ static int cf_check rep_outs(
>  
>      *reps = 0;
>  
> +    ASSERT(bytes_per_rep <= 4); /* i.e. 'data' being 4 bytes is fine. */

Don't we need this to be a BUG_ON() to satisfy the compiler also on
non-debug builds?

Or maybe:

if ( bytes_per_rep > 4 )
{
    ASSERT_UNREACHABLE();
    return X86EMUL_UNHANDLEABLE;
}

Would it be possible to add the check to guest_io_okay() itself?

Thanks, Roger.

