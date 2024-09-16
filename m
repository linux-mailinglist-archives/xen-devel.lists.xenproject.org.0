Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E29397A013
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 13:12:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799397.1209389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq9dU-0003bA-NF; Mon, 16 Sep 2024 11:11:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799397.1209389; Mon, 16 Sep 2024 11:11:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq9dU-0003Zf-KM; Mon, 16 Sep 2024 11:11:16 +0000
Received: by outflank-mailman (input) for mailman id 799397;
 Mon, 16 Sep 2024 11:11:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W1kI=QO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sq9dT-0003ZZ-Kj
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 11:11:15 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61b1cd7a-741c-11ef-99a2-01e77a169b0f;
 Mon, 16 Sep 2024 13:11:12 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a8ce5db8668so754967566b.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 04:11:12 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f44fasm298502766b.79.2024.09.16.04.11.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Sep 2024 04:11:09 -0700 (PDT)
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
X-Inumbo-ID: 61b1cd7a-741c-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726485071; x=1727089871; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BxOE/tRlDGSgvKiVrf75dqk7Z1KaUuOCK2p6MAOQhBg=;
        b=LORUSJQCx8lcvY204f8wvZTbJ7U/tTzeI1cAz7SN0S7VNl6laAZtmPWfbwgi4cqLSD
         MiYpu0k2Q9bz3fO9fYCmIu+PwLyZw1bBX56qHoPgmKKH0LNK1roQFJ5NJIpUKe5cT0/Q
         27QIOHrWlJw5AXIOFPshrYzJWrztlPFJoQJ+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726485071; x=1727089871;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxOE/tRlDGSgvKiVrf75dqk7Z1KaUuOCK2p6MAOQhBg=;
        b=GV56PrpOiqs6ktZzu0NjJ2RYqPBLLRJ4dhllZlCkcuLyNwO+rXxtu9glI92DMGrX5o
         58bKK9xPWsjBcUEipmI63cKcvcZjKFOjqAUa+JAFazbyDLdPlajjk8QVNqaQNpKgR4ZS
         01OALXyvdTRlv2omjwIzdr/ogy3YvkajRfFGWH5N2uGX0/1mT8dTMXicYzf4XR2OW0s1
         kjuq+Nj8yOBq9C1HHbaf61thODti2CtEqpZtNVoWEKt5NL4vFyw2EGbGXdG/PQO/O0RD
         gzbq8+vYb2zotfHIxAUVRF9M34FPdScJM8reJ0SlDsGbCF0oHFDMawitCG/0+UA+DNWY
         TZeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvgghlr4DrRpnxrNL9HQc6uyXf7FNdtDmkvjU5kQVtF7J4QE2WH3Y+n2LC5gvjPv5c5+qfzH0bP+s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwggX3uUfOWuTUAjFwIUzSoWK4CWAZlSa+WvD0c5XpLWuyf95oE
	D22ouKPdid8ng4nlvUTzbIe4TcfGgbc0arG/oXnnbm/h1ki95oTAcWPlvwhsdJ8yxtrH1u3j0JN
	D
X-Google-Smtp-Source: AGHT+IG3WinhnRS6lmstm5M36tICctEWAyJCJp6kM1hYVkBTGh7YS1KEDnHfKbYzy3zMYvSBratVOA==
X-Received: by 2002:a17:907:e214:b0:a86:c1ff:c973 with SMTP id a640c23a62f3a-a902961ded5mr1523172766b.47.1726485070442;
        Mon, 16 Sep 2024 04:11:10 -0700 (PDT)
Message-ID: <833668bc-6a37-4cad-98bc-7754720b7606@citrix.com>
Date: Mon, 16 Sep 2024 12:11:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86: Put trampoline in separate .init.trampoline
 section
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Daniel Smith <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20240916094424.74002-1-frediano.ziglio@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240916094424.74002-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/09/2024 10:44 am, Frediano Ziglio wrote:
> This change put the trampoline in a separate, not executable section.
> The trampoline contains a mix of code and data (data which
> is modified from C code during early start so must be writable).
> This is in preparation for W^X patch in order to satisfy UEFI CA
> memory mitigation requirements.
> At the moment .init.text and .init.data in EFI mode are put together
> so they will be in the same final section as before this patch.
> Putting in a separate section (even in final executables) allows
> to easily disassembly that section. As we need to have a writable
> section and as we can't have code and data together to satisfy W^X
> requirement we need to have a data section. However tools like objdump
> by default do not disassemble data sections. Forcing disassembly of
> data sections would result in a very large output and possibly crash
> of tools. Putting in a separate section allows to selectively
> disassemble that part of code using a command like
>
>     objdump -m i386 -j .init.trampoline -d xen-syms
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Please can we take a pause and discuss all relevant aspects before
continuing?

We need W^X in xen.efi for UEFI SecureBoot.  Sections with differing
permissions must not share a page.

Right now, the trampoline fails this because it's marked X and written
in-to on the default EFI pagetables.


I've got no issue creating a .init.trampoline section.  Indeed, being
able to pull the section out in isolation is probably a good thing.

However, I would very much prefer the trampoline to remain being code
rather than data.  I spend enough time disassembling it and right now it
does separate code&data in the disassembly by virtue of proper type
annotations.


The problem, as far as I'm aware, is that the trampoline is relocated in
place within Xen (on the default EFI pagetable), then copied into low
memory.  As relocation requires knowing the end physical address, this
can be addressed by copying into low memory, then relocating, can it not?

The same could be done for the 32bit boot path, although that's running
in 32bit flat mode so doesn't have an issue with pagetables.


Independently, given the adjustment in this patch, we should just make
trampoline.o a proper object and take it out of head.S  That's one fewer
non-standard moving parts in the build.

~Andrew

