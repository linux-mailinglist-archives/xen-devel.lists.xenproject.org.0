Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C693082ADD7
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 12:49:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666208.1036676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNtZ5-0008VJ-I0; Thu, 11 Jan 2024 11:49:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666208.1036676; Thu, 11 Jan 2024 11:49:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNtZ5-0008Tj-FO; Thu, 11 Jan 2024 11:49:39 +0000
Received: by outflank-mailman (input) for mailman id 666208;
 Thu, 11 Jan 2024 11:49:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YPRU=IV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rNtZ3-0008Td-V6
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 11:49:37 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d794b61-b077-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 12:49:35 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40e60e1373eso2211985e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 03:49:35 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 e16-20020a5d65d0000000b003365951cef9sm1033041wrw.55.2024.01.11.03.49.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 03:49:34 -0800 (PST)
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
X-Inumbo-ID: 7d794b61-b077-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1704973775; x=1705578575; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q26frLCjIvfc90fGU3aMkxMy5Ic1Vte7a0mEwIAaNq0=;
        b=ZyTSWQdiN32miG6RwRR/WOWHQZLTpN08uptSj29MloIizT8QBXJYMHKjwcOtu7VsCw
         OviV9qbMpZVns0lq9zzS8hxzP3hUkvB0EWiLD0RBlgYffp/kN6IRye6Qi1orQ059wS0u
         jhfie9ksZLL+RmGR+J+wKQm0DmerqtdTYj4KA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704973775; x=1705578575;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q26frLCjIvfc90fGU3aMkxMy5Ic1Vte7a0mEwIAaNq0=;
        b=uJC2LLEhccsf1M8qWavN8bWtbbBuBXjXmytsW2Sw3HQRIqnVEZ5tYdgLt70CRNei0e
         9Jthj18kewqhYZH3MudDs+7uK0krrIIjfsFQeQ0uY2H75Rxduesnep/8D1O8X52SzfaQ
         lUb3ncaAUrS/yprERtqStKyFXsXy55x8uFK9jK3VL3tbSL+Viyzv9f8Y4IBe7QbaC3Ow
         6WiQPcDq0pj2eOGXOp89VlXsH4SGVBJbUzJCFjF+wKEw79rGaBl8ZLTKX57LxD7w6l2w
         5ASjBtpfuKZtC6MxxWInd1b/Msq0sxWRsbwpTRIvIew0GIMqEcm5PBduwvj+YxMPnvjZ
         2DGw==
X-Gm-Message-State: AOJu0YyrneY2B4FJ7yBMwrvH1dgTEk4R+IUvHmVXYwqDhhKv+kCWFj/Y
	bCwBQbQ6w3KzAYG/V6xnlk0p9tdxAthUrQ==
X-Google-Smtp-Source: AGHT+IGi7fPe0BkEZjU4eKy25GmwHFT6R+jaDWDKTFGYghXeihIb0WFO4BcWHN2ojde667RAMZh7VA==
X-Received: by 2002:a05:600c:1e16:b0:40e:6252:9915 with SMTP id ay22-20020a05600c1e1600b0040e62529915mr115106wmb.29.1704973774771;
        Thu, 11 Jan 2024 03:49:34 -0800 (PST)
Message-ID: <7d21e38d-d1f8-46df-89ef-809dd9c5a38b@citrix.com>
Date: Thu, 11 Jan 2024 11:49:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] keyhandler: don't pass cpu_user_regs around
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <1ab231ec-5e3c-4662-8530-2213bc52bb7c@suse.com>
 <dd1c24ec-4054-43e1-b0c9-6c2044b84046@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <dd1c24ec-4054-43e1-b0c9-6c2044b84046@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/01/2024 7:31 am, Jan Beulich wrote:
> There are exactly two handlers which care about the registers.

Which two?  dump regs and trap to debugger?

[Edit, oh yes, this is clear in the patch, but IMO it would be helpful
to state them here.]

> Have
> handle_keypress() make the pointer available via a per-CPU variable,
> thus eliminating the need to pass it to all IRQ key handlers, making
> sure that a console-invoked key's handling can still nest inside a
> sysctl-invoked one's.

I know this is the current behaviour, and I'm not suggesting altering it
in this patch, but the sysctl was added so you had a way of using debug
keys without necessarily having a working serial connection.

It was never expected or intended for both mechanisms to work
concurrently, and I don't think we need to take any care to make/keep it
working.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com> with a few trivial
tweaks, but see below.

> ---
> Subsequently we may want to eliminate the fn/irq_fn union as well,
> along with dropping the now redundant irq_keyhandler_fn_t.

Yes - this simplification was one I was hoping to be able to make in due
course.  I suspect the split is only because some functionality wanted
regs and others not.

Trap to debugger is an x86-ism for gdbstub only.  I'm tempted to drop
all the gdbstub code.  I've never encountered it working in 13y, and the
number of build fixes I've done personally, I don't believe the code can
plausibly be in a non-bitrotten state.

Nevertheless, an explicit trap-to-debugger which isn't a manually
inserted debugger_trap_{immediate,fatal}() is a weird construct in the
first place, not least because an attached debugger can do this on its
own anyway.

The more I think about this, the more I think we should just remove 'D',
even if we don't go for dropping gdbstub.  It's the only place where
gdbstub really escapes out of x86 into common code.  (I see there's a
new one in bug.h but that is abstracted with a macro.)

Also, `xl debug-keys D` was clearly something that just got swept up
with "make all debug keys usable via sysctl", not because it was a
plausibly useful construct.


This just leaves dump regs, which I think can safely use get_irq_regs()
|| guest_cpu_user_regs().  All it wants is something to dump_execstate()
to, which just wants to be the start of the path which led here.

With both of those sorted (albeit it with patch 2 needing to move ahead
of 1), I don't think we need to keep keypress_regs.

> --- a/xen/common/keyhandler.c
> +++ b/xen/common/keyhandler.c
> @@ -80,6 +80,7 @@ static void cf_check keypress_action(voi
>  }
>  
>  static DECLARE_TASKLET(keypress_tasklet, keypress_action, NULL);
> +static DEFINE_PER_CPU(struct cpu_user_regs *, keypress_regs);
>  
>  void handle_keypress(unsigned char key, struct cpu_user_regs *regs)
>  {
> @@ -91,7 +92,16 @@ void handle_keypress(unsigned char key,
>      if ( !in_irq() || h->irq_callback )
>      {
>          console_start_log_everything();
> -        h->irq_callback ? h->irq_fn(key, regs) : h->fn(key);

This would read better with a blank line here, and ...

> +        if ( h->irq_callback )
> +        {
> +            struct cpu_user_regs *old = this_cpu(keypress_regs);
> +
> +            this_cpu(keypress_regs) = regs;
> +            h->irq_fn(key);
> +            this_cpu(keypress_regs) = old;
> +        }
> +        else
> +            h->fn(key);

... here.

~Andrew

