Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF66A38005
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 11:26:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890159.1299167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyJt-0001Dl-1X; Mon, 17 Feb 2025 10:25:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890159.1299167; Mon, 17 Feb 2025 10:25:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyJs-0001CH-VB; Mon, 17 Feb 2025 10:25:44 +0000
Received: by outflank-mailman (input) for mailman id 890159;
 Mon, 17 Feb 2025 10:25:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xGAw=VI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tjyJr-0001CB-5B
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 10:25:43 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 896c5f84-ed19-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 11:25:40 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-439350f1a0bso24630945e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 02:25:40 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a06cf2fsm147401595e9.19.2025.02.17.02.25.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 02:25:39 -0800 (PST)
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
X-Inumbo-ID: 896c5f84-ed19-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739787940; x=1740392740; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mf9YOmNyP+ea9PsYsxyb1Td12/qQDYD2XU3//LBxaOg=;
        b=ariUXPURL2sxJJIONCyKpuLGl+dCtSfOM30/IKAD+7NuEZyHJmwHP1ApWxrUeJ/0sg
         9894nT+m+Y1LseyU9s7nPgRr5gNe8O+VkAGOjMujjiwF2/DlQonOktj9/wPK+VdyN04l
         YC+vIlKwGflIys1EtBaUyqR2sBKz+QR1QViIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739787940; x=1740392740;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mf9YOmNyP+ea9PsYsxyb1Td12/qQDYD2XU3//LBxaOg=;
        b=FKVK7Wb3AeIoEUuWE3Zg1iWDK4moi5uF2TIfZch5FqZ6ymiYHkoxcodZon/E4EeH3H
         ZR7YfqjZrNv3yGg/eNvFRLdrdGmjuYGUqx20vIn5GORpzjCU78+wUVfCA9+58hyDN0rK
         T+8bSph5eiJZl6W2Vjg9njx2b2EtVE0mDlIXrqOm5xZswk/zzBMpvRPawNXqajrpGKgu
         qSBF/p8yPAP94ChFpreP353czq2UVbT7FzMa1hCso0BOTPzQzkv5B5XOJqsdqO1w0o6s
         6oh82QCbnZnHHUHXKttdht+Ih1dza2ObBcGARZrBdoXnhFoieom3BHKAo+mIKpKwB0Q+
         OkJg==
X-Forwarded-Encrypted: i=1; AJvYcCUSLKRJEwTKL+tMMT9cLAmr0Z2ITI7kKq77mDZeobNeUWGoyK+sC47QUX0SXhEcAnB/YwA/crB7AhM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRPxCTVf+2wUBHZqvW45MXMrw+kmrqSs7ELikKXYwq2S1JPZyJ
	HgDNUDrenQD8QOZ/AjI++rZYQPYqQdPF7fQNzA2UyJ1L9uIZ2D9JA/p4Eag+jThyJ5BJTc0yNcp
	5
X-Gm-Gg: ASbGncvpMc5iKj+g6XdKjWIofIQIdOY2waPpgbOhc2/Bzi+Z956hlL5ao50XsTp5eeu
	SeUPyafJq9d8lof39nXWPwlmu7s4psuz2PaBf4mEwiITuooVRZzaduwbH21Z36jkWiklS/MlCBB
	3qk5r0B+dH2g8LTarE1GHONGUncGWkgMoWEMOjNiDUduSzr0WDdr2jDH+zS/cgKbVKzbdvzI+ML
	3pURPNxQ/sesVPH7jvtFMMZQ3hEFYW2zK9MxtAw6z3LTylVH55wNqd1ENMn4FsSyw4mUr2c2EkL
	mFKIKXomqWm+shaBblzSf8NVu2BFd/r6rDFMsvjHoRgNh683nkz/wL8=
X-Google-Smtp-Source: AGHT+IFgYwsk/KsamksKHX3wmRdKUl/CpmsUgs6Sxtac8YQiVsqM4zBrDSrh+kZOsWWlpLMQ4U6a8Q==
X-Received: by 2002:a05:600c:6c44:b0:435:edb0:5d27 with SMTP id 5b1f17b1804b1-43960bd7614mr193638395e9.9.1739787940253;
        Mon, 17 Feb 2025 02:25:40 -0800 (PST)
Message-ID: <25cdabbc-466b-42d2-a005-259bed0a1cf0@citrix.com>
Date: Mon, 17 Feb 2025 10:25:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: early crash while loading dom0 kernel between git:19730dbb3f and
 git:414dde38b0
To: "Greg A. Woods" <woods.greg.a@gmail.com>, xen-devel@lists.xenproject.org
References: <6CBF18F6-8AF8-4A22-A4EC-0D7F382FA815@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <6CBF18F6-8AF8-4A22-A4EC-0D7F382FA815@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/02/2025 11:09 pm, Greg A. Woods wrote:
> I had been testing 4.20-rc (at git:19730dbb3f) relatively successfully
> on a older Dell PE-2950 server.
>
> Today I tried upgrading to git:414dde38b0 and I encountered the
> following highly repeatable crash on first boot.  (note the git commit
> shown in the log is from my(robohack) local NetBSD patches on GitHub,
> none of which are in the Xen kernel itself -- just tools)
>
> Note the dom0 kernel is NetBSD (-current as of about a year ago).
>
> I'm not on the xen-devel list, so please email me directly (also see
> alternate addresses in my signature below).  Note I can't even send
> from my normal email because inumbo.net <http://inumbo.net/> don't understand the rules of
> the DNS and have botched the MX records for xenproject.org <http://xenproject.org/>.
>
>
> The offending address ([<ffff82d040201015>] R _stextentry+0x15/0x165)
> seems to be found here (according to "objdump -S xen-syms"):
>
> ffff82d040201000 <restore_all_guest>:
>
>         .section .text.entry, "ax", @progbits
>
> /* %rbx: struct vcpu, interrupts disabled */
> FUNC_LOCAL(restore_all_guest)
>         ASSERT_INTERRUPTS_DISABLED
> ffff82d040201000:       9c                      pushfq
> ffff82d040201001:       f6 44 24 01 02          testb  $0x2,0x1(%rsp)
> ffff82d040201006:       74 02                   je     ffff82d04020100a <restore_all_guest+
> 0xa>
> ffff82d040201008:       0f 0b                   ud2
> ffff82d04020100a:       48 83 c4 08             add    $0x8,%rsp
>
>         /* Stash guest SPEC_CTRL value while we can read struct vcpu. */
>         mov VCPU_arch_msrs(%rbx), %rdx
> ffff82d04020100e:       48 8b 93 68 0d 00 00    mov    0xd68(%rbx),%rdx
>         mov VCPUMSR_spec_ctrl_raw(%rdx), %r15d
> ffff82d040201015:       44 8b 3a                mov    (%rdx),%r15d
>
>
> If I'm not mistaken this is from xen/arch/x86/x86_64/entry.S.  I don't
> see any recent changes there though, so I'm not sure where to go from
> here.  Did something deeper in struct vcpu change?

We see things like this very occasionally when doing `git pull &&
make`.  There's something that seems to not regenerate asm-offsets
properly on an incremental build, but I've never been able to reproduce
enough to debug.

There are definitely changes in struct domain in the range you give. 
There's not obviously changes to struct vcpu.

Nevertheless, can you try a clean build to start with, and see if that
changes things?

> Start @ 0x200000 [1=0x619000-0x6190ec]...
> Xen 4.20-rc
> (XEN) [000000341c1f78e9] Xen version 4.20-rc (woods@.local) (gcc (nb1 20200907) 9.3.0) debug=y Sun Feb 16 13:33:02 PST 2025
> (XEN) [000000341e299905] Latest ChangeSet: Wed Jan 29 13:29:16 2025 -0800 git:72eea1d3cb-dirty
> (XEN) [000000341fba9b9d] build-id: 0e6a2491c4ad94bdf27ff33fcefc31b5a8b61784
> (XEN) [0000003420fc47e1] CPU Vendor: Intel, Family 6 (0x6), Model 23 (0x17), Stepping 6 (raw 00010676)
> (XEN) [0000003422aea44d] BSP microcode revision: 0x0000060f
> (XEN) [0000003423ad77fc] Bootloader: NetBSD/x86 BIOS Boot, Revision 5.11 (Sun Dec  8 23:54:34 UTC 2024) (from NetBSD 9.99.81)
> (XEN) [0000003425c00815] Command line: loglvl=all bootscrub=false dom0=pv,verbose=1 dom0_mem=20G console=com1,vga console_timestamps=datems dom0_max_vcpus=8 dom0_vcpus_pin=true guest_loglvl=all pv-l1tf=off,domu=off cpuid=rdrand vpmu=on,ipc spec-ctrl=no

A couple of unrelated notes.  Boolean options can be written without
suffixes, so `dom0=pv,verbose` suffices, as does `dom0_vcpus_pin`.

You really want to use dom0_max_vcpus=1-8 instead of just plain 8.

Also, spec-ctrl=no also disables pv-l1tf (both parts) so you don't need
to specify that separately.

~Andrew

