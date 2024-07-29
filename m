Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 425F293F06A
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 10:57:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766458.1176932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYMBV-0006zI-5O; Mon, 29 Jul 2024 08:56:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766458.1176932; Mon, 29 Jul 2024 08:56:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYMBV-0006xk-2k; Mon, 29 Jul 2024 08:56:49 +0000
Received: by outflank-mailman (input) for mailman id 766458;
 Mon, 29 Jul 2024 08:56:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QfTU=O5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sYMBT-0006wE-AA
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 08:56:47 +0000
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [2607:f8b0:4864:20::1129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ae16678-4d88-11ef-8776-851b0ebba9a2;
 Mon, 29 Jul 2024 10:56:45 +0200 (CEST)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-66493332ebfso16914247b3.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 01:56:45 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3fa982a2sm49673076d6.77.2024.07.29.01.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 01:56:43 -0700 (PDT)
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
X-Inumbo-ID: 7ae16678-4d88-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722243404; x=1722848204; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ea1wsv49NI9/Jm56F0saeDBINm1+Jzagx7L96a0mfww=;
        b=PdOirAXF7+80ywcIcY6RRk/kL39k1dVVyQnGulmsQGkrW5Xlh5ZmLuT0+6W+f64w8+
         bON2TebKVjdgiGfi1nDsDhUzltPwGAHFqm1VFAunBsVnkegwqgEc7sryvot8rqF1izsO
         FyHl+wf8b3S5tK4y25MwfwXoshPyj7OpXZaiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722243404; x=1722848204;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ea1wsv49NI9/Jm56F0saeDBINm1+Jzagx7L96a0mfww=;
        b=Vnx+itnCieNkWq2OVrdcKRECrAHisgQoTp7uKeirzVoA24HA3ufLTVlK44nyCxfo2i
         fuc//geY0rY7acZbnGsdd2RVLr1gWCZusaQVt1jmBPMfrWOz50Ci8LHNvitTs1O//VxE
         C2DTTHlhZNH6d/BzcTXq9rHVN+p/Bv9CtLxdzCQdp2u2kJca4/d6QK35QIXjnDakqv84
         GJgQjY+iIpf68osn06rYct8kMJXPvXQxaxUpslek/a7eKS9fDXEmYe3xaxu1yWrFgZQm
         EbDGv5KGolrbzj2E1QFr03VdrNTpoXaB+/Q6QUshN2XzfuVTnu0v2EhzZyRI/jHCtsGb
         bX7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWM9tTqZ1FEJG+hOS48k0WbrOjvTwMStR6j9s77dfI+BriZoQwpNEZbAPmXTfcfJD/ZMIFpFFzU28IkbsrAIwY55h48vuWlOoVkGxsaaDY=
X-Gm-Message-State: AOJu0YwCxV7RGEyIDdBSgdbnV4W0VSQuMbmjRbT0hx/eaXnEC6aWKp2K
	1q0HmhKtWeu/yWVC+WcY8Flvj0ut/2G/mrWMpfUhQ4iTsADydXb7XUwZBysBAZE=
X-Google-Smtp-Source: AGHT+IFraanFk0XhCEkZg7h1L6dx/Cdly/gwrcmw8knQNJYLvh85IL7UH5hHUE+GF+56IrgN1Pdy7g==
X-Received: by 2002:a0d:f444:0:b0:653:ffe7:d641 with SMTP id 00721157ae682-67a0afb6583mr78299197b3.45.1722243403695;
        Mon, 29 Jul 2024 01:56:43 -0700 (PDT)
Date: Mon, 29 Jul 2024 10:56:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.20] hvmloader: Rework hypercall infrastructure
Message-ID: <ZqdZSdBZJxf57jsx@macbook>
References: <20240717111231.3517605-1-andrew.cooper3@citrix.com>
 <ec6f3d2b-d5be-4ff5-9bf1-79eb5a3a85e1@suse.com>
 <4f24cc9a-3eb8-4c6f-bcb4-a9e04a50cd9e@citrix.com>
 <d1abd5ef-745c-49bb-b392-3ca5159e4cb4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d1abd5ef-745c-49bb-b392-3ca5159e4cb4@suse.com>

On Thu, Jul 25, 2024 at 08:18:27AM +0200, Jan Beulich wrote:
> On 24.07.2024 19:24, Andrew Cooper wrote:
> > On 17/07/2024 1:37 pm, Jan Beulich wrote:
> >> On 17.07.2024 13:12, Andrew Cooper wrote:
> >>>  static inline int
> >>>  hypercall_sched_op(
> >>>      int cmd, void *arg)
> >>>  {
> >>> -    return _hypercall2(int, sched_op, cmd, arg);
> >>> +    return _hypercall2(int, __HYPERVISOR_sched_op, cmd, arg);
> >>>  }
> >> I know you don't really like token concatenation in cases like these ones,
> >> but these adjustments all don't look as if they were necessary right here.
> >> The new macros use the macro parameter only in ways where token pasting
> >> would continue to work, afaics. And in the new assembly file you use very
> >> similar token pasting anyway.
> > 
> > That's because my judgement is not about simply tokenisation (or not). 
> > It's about not using ## when it is likely to interfere with
> > grep/cscope/tags/etc.
> > 
> > The assembly file both isn't really interesting to find this way, and
> > needs ## in order to work the way it does (differing prefixes in the
> > hypercall names).
> 
> The "not interesting" part is very subjective. If one really wanted to find
> everything, this still would get in the way. And there being differing
> prefixes in the other case would then simply require passing two arguments
> to the macro instead of just one (which imo is undesirable, but that is
> along with considering the change above undesirable as well).
> 
> I'm not bothered enough to request to undo this altogether, or to split
> this into a separate change, but I wonder whether in the opposite case you
> wouldn't demand either or even both.
> 
> >>> +        .align 4096
> >> PAGE_SIZE? And then again ...
> >>
> >>> +        .globl hypercall_page
> >>> +hypercall_page:
> >>> +         /* Poisoned with `ret` for safety before hypercalls are set up. */
> >>> +        .fill 4096, 1, 0xc3
> >>> +        .type hypercall_page, STT_OBJECT
> >>> +        .size hypercall_page, 4096
> >> ... here?
> > 
> > HVMLoader doesn't have a suitable constant, and doesn't have _AC().
> > 
> > Although we probably can just get away with (1 << PAGE_SHIFT) and drop
> > the ul.
> 
> Oh, right, we still mean to be compatible with gas not ignoring the ul
> suffix on numbers.
> 
> >> As to the "poisoning" - how does RET provide any safety? If a call happened
> >> early, the uncertainty of what %eax is set to would make it unpredictable
> >> how such a caller would further behave. Imo better to crash / hang in such
> >> a case, perhaps by using INT3 instead.
> >>
> >> I notice that matches earlier behavior, but there the comment at least
> >> validly said "rendering them no-ops" (yet still without considering
> >> possible problems resulting from doing so).
> > 
> > That's a complicated one.  I can't remember why I chose that exact
> > phraseology, but it's not really about accidentally-too-early case, it's
> > about error handling.
> > 
> > HVMLoader doesn't have an IDT, so any exception is fatal.  But that's
> > also something that ideally wants fixing (if it weren't for the fact
> > that it's more likely that I'll complete plans to remove hvmloader
> > completely before having time to do an IDT).
> > 
> > But for code which does have a panic() function, there's console_io
> > (logging) and sched_op (SHUTDOWN_crash) which you want to use just in
> > case they do work, before moving onto other methods of terminating.
> 
> All fine, but that still leaves this RET filling yielding random behavior
> at possible early call sites. At the very least the pre-fill should result
> in errors to be observed by too-early callers. For this to at least vaguely
> resemble something valid to call "poisoned", that is.

FWIW, I've not long ago [0] switched FreeBSD hypercall page to be
poisoned with int3, as it was previously filled with nops which
resulted in very funny traces when the hypercall page was used prior
to being initialized.

I also considered filling with ret, but I think that's likely to
mask or make uninitialized usages harder to spot.  It's IMO better to
get a triple-fault than silence attempts to use the hypercall page too
early.

Thanks, Roger.

[0] https://cgit.freebsd.org/src/commit/?id=e283c994ab270706142ef5dde9092950000af901

