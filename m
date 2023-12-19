Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1434818FB5
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 19:22:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657075.1025744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFejC-0007cr-Ke; Tue, 19 Dec 2023 18:22:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657075.1025744; Tue, 19 Dec 2023 18:22:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFejC-0007ab-H3; Tue, 19 Dec 2023 18:22:02 +0000
Received: by outflank-mailman (input) for mailman id 657075;
 Tue, 19 Dec 2023 18:21:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XNVD=H6=linuxfoundation.org=torvalds@srs-se1.protection.inumbo.net>)
 id 1rFeiW-0007Qs-Ea
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 18:21:20 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67240f62-9e9b-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 19:21:18 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5534dcfdd61so5406547a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 10:21:18 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 g6-20020a056402090600b0054c9211021csm11700034edz.69.2023.12.19.10.21.16
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 10:21:16 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-552ff8d681aso7034642a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 10:21:16 -0800 (PST)
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
X-Inumbo-ID: 67240f62-9e9b-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1703010078; x=1703614878; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MEyPrJfFY8wsnlnRqNTI0PF/m1A8xGUMS6bKe4vqiaM=;
        b=ch0SqNIsLR3LuNhBzaFC/jSfT7fctrYHPfgfAfuGz+WJR8ZKyCBQMV/GukN8CVIeQC
         PV+zt8X4peZuz8maMIGVqrSYOKj/nSPi9c5wh/D47gazLXZCQBo53MsCAxAvchhlykKA
         oK4FM4Mf/D1dPinGATs7Y9Qj9do/Abco4bNcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703010078; x=1703614878;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MEyPrJfFY8wsnlnRqNTI0PF/m1A8xGUMS6bKe4vqiaM=;
        b=WZbLx47waVexbxVXzraPRryd7dBsSpTOTslRApi8G3xtjiElpp9CMAgaVAG58jb2CL
         iYDA0ahy2KhkEt/ikHX6CaHHPGUTEGD3Fyw0VWWPmYA8wkIGpMR/T4kNT93wa0ST44hL
         wF/wBlR7g2vI3YdRiEA7yYaGEhOi18a4Do0L8zW5vdCSxFXgRJvMbbyfHkrWgdpV9oC+
         zI0DOmmMdWA5yaaNso2rCaPPxuOAamxsQqRrMUM2N3qgIbO7nwRo8Q0jHS/OTheV3KNj
         wdYTA07lZ8K8yPVGg8KOTqKtTyB+v8U6X/yUHWisdMsgpRJQuYfX7af9UicDF9pVSdGG
         V39g==
X-Gm-Message-State: AOJu0YzRiuJ67SqdCWllptTmkWBtwWp7sMGIK2gQewzgzUOCWpdv/mhe
	h1M+AG1I8Yq7PvNYIXJOe62s9+qYNgB1J+Ux74tvVSla
X-Google-Smtp-Source: AGHT+IHvYryxwr7PzuQHFHdlwYJa58t2PuhUS/x9Dws3Q+sO/+WSaHADlSewvvnK1zelWgxFFAZFKg==
X-Received: by 2002:a50:a6de:0:b0:552:f57d:ac8c with SMTP id f30-20020a50a6de000000b00552f57dac8cmr1660142edc.12.1703010077828;
        Tue, 19 Dec 2023 10:21:17 -0800 (PST)
X-Received: by 2002:a17:907:76f9:b0:a23:48d2:8314 with SMTP id
 kg25-20020a17090776f900b00a2348d28314mr1593362ejc.42.1703010076267; Tue, 19
 Dec 2023 10:21:16 -0800 (PST)
MIME-Version: 1.0
References: <202312191507.348721d2-oliver.sang@intel.com> <20231219095821.GAZYFpPUSKexZAcl05@fat_crate.local>
In-Reply-To: <20231219095821.GAZYFpPUSKexZAcl05@fat_crate.local>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Tue, 19 Dec 2023 10:20:58 -0800
X-Gmail-Original-Message-ID: <CAHk-=wimbX8UF6ECo53Hm4Vz0tCC7jjN9e3tEhZfoEtsxyfU-A@mail.gmail.com>
Message-ID: <CAHk-=wimbX8UF6ECo53Hm4Vz0tCC7jjN9e3tEhZfoEtsxyfU-A@mail.gmail.com>
Subject: Re: [linus:master] [x86/entry] be5341eb0d: WARNING:CPU:#PID:#at_int80_emulation
To: Borislav Petkov <bp@alien8.de>
Cc: kernel test robot <oliver.sang@intel.com>, Thomas Gleixner <tglx@linutronix.de>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Dec 2023 at 01:58, Borislav Petkov <bp@alien8.de> wrote:
>
> Looking at the dmesg, I think you missed the most important part - the
> preceding line:
>
> [   13.480504][   T48] CFI failure at int80_emulation+0x67/0xb0 (target: sys_ni_posix_timers+0x0/0x70; expected type: 0xb02b34d9)
>                         ^^^^^^^^^^^

So I think the issue here is that sys_ni_posix_timers is just linker
alias that is used for any non-implemented posix timer system call.

See:

  #define __SYS_NI(abi, name)                                             \
        SYSCALL_ALIAS(__##abi##_##name, sys_ni_posix_timers);

and this all worked fine when the actual call to this was done in
assembly code that happily just called that function directly and
didn't care about any argument types.

But commit be5341eb0d43 ("x86/entry: Convert INT 0x80 emulation to
IDTENTRY") moved that call from assembly into C, and in the process
ended up enabling CFI for it all, and now the compiler will check that
the function types match. Which they don't, because we use that dummy
function (I don't think they do in general).

I don't know what the best fix is. Either CFI should be turned off for
that call, or we should make sure to generate those NI system calls
with the proper types.

The asm didn't care - as long as the function put -ENOSYS in %rax, it
did the right thing - but the kCFI stuff means that the C code now
cares (and checks) that prototypes etc really match.

Maybe we should just get rid of SYS_NI() _entirely_.

I think the only user is the posix-timers stuff, and everything else
uses COND_SYSCALL(), which actually *generates* all the proper weak
functions with all the proper function signatures, instead of playing
around with linker aliases that don't have them.

Afaik, the only reason the posix timers do that odd alias is because
they want to have that

        pr_err_once("process %d (%s) attempted a POSIX timer syscall "
                    "while CONFIG_POSIX_TIMERS is not set\n",
                    current->pid, current->comm);

which I don't think is really worth it. It goes back to 2016 when the
posix timers subsystem became configurable, and I doubt it is worth it
any more (and it was probably of dubious use even at the time).

But I've not had anything to do with the low-level kCFI stuff, and
I'll leave it to Thomas whether that SYS_NI() mess should just be
removed.

I do like the notion of just removing SYS_NI entirely, replacing it
with the standard COND_SYSCALL() thing (and same for the COMPAT
variables, of course).

Thomas?

               Linus

