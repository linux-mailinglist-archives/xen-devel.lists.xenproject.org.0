Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3587618D4
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 14:51:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569664.890551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOHVC-0002Lv-RJ; Tue, 25 Jul 2023 12:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569664.890551; Tue, 25 Jul 2023 12:50:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOHVC-0002Jk-Oa; Tue, 25 Jul 2023 12:50:58 +0000
Received: by outflank-mailman (input) for mailman id 569664;
 Tue, 25 Jul 2023 12:50:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rtsi=DL=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qOHVB-0002Jc-1h
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 12:50:57 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e51fe143-2ae9-11ee-b23f-6b7b168915f2;
 Tue, 25 Jul 2023 14:50:55 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3fd2f298712so23255745e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jul 2023 05:50:55 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 9-20020a05600c024900b003fd32074e74sm7694474wmj.31.2023.07.25.05.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 05:50:54 -0700 (PDT)
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
X-Inumbo-ID: e51fe143-2ae9-11ee-b23f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1690289455; x=1690894255;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LciJMUcwPRYY1S1ZzSFiCg3n9xRe7tdT7XuMqyl2U8w=;
        b=B/03xREzwQOX2zptyHTF28L0hjijBgX++KW1ZjB2lWpU4OfjNiPT7KCNSPvqa3Hxq8
         66KGD+UitebZvqGu1vQOfoAGl7kKmx+34vCOEV5meZO0OzvUL239uGcIQNfoFJCWvw7k
         6hmB7PMOP17icLtNYEC0OjNXv4Fkw5n4zLR9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690289455; x=1690894255;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LciJMUcwPRYY1S1ZzSFiCg3n9xRe7tdT7XuMqyl2U8w=;
        b=LLPXj2lXUKOrwDocwJCwbtKi0ToFKwIgzTQk5OgRYPaKSutMqNpNnvCiGkrzeb6Bq3
         ckUd8dXpa9CaJAsGwTsmlOj+4PpES24YIy6UQuw6nVLIl4YfGXIAYPib9OLCuG5eoyxM
         Y777Qtn4ZGMdK8lORflMOopHheI7OtL1TI0eK8pXo0O+5S7AHwtrnHksH7eaws83VVM0
         3Pq2OBMTdHC6vYMuLyXnC15SA171G5MLAGguVUa6GVPDN3moKfXpsnnBWhJbFEwu17s/
         nplo5TvkH9tAOOCEbpTCXnjrEpTxF7rQ6AISpjx8WHbbO9TOHOvOXREUC1jkl65SOhib
         QNmA==
X-Gm-Message-State: ABy/qLYip2MA6Ed8R4SOCc3WqZ2PD0SMMwMQOhWPZGrB7yf8zIeHLIr3
	KAN5yI/nYlzE2bjj5bKRcG6zEg==
X-Google-Smtp-Source: APBJJlFKT8X7Du38LcD7Ra1BT302ADtZiC1g1Wlj1ib5EXZWZQ/t6YxEQRKZ8s8NfvnQxhkY6PB8ow==
X-Received: by 2002:a05:600c:20d1:b0:3fd:1daf:abd8 with SMTP id y17-20020a05600c20d100b003fd1dafabd8mr7294549wmm.40.1690289455066;
        Tue, 25 Jul 2023 05:50:55 -0700 (PDT)
Message-ID: <64bfc52e.050a0220.14646.cb0d@mx.google.com>
X-Google-Original-Message-ID: <ZL/FBj69kTqyCXYz@EMEAENGAAD19049.>
Date: Tue, 25 Jul 2023 13:50:52 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 1/3] x86/microcode: Ignore microcode loading interface
 for revision = -1
References: <20230724165235.25262-1-alejandro.vallejo@cloud.com>
 <20230724165235.25262-2-alejandro.vallejo@cloud.com>
 <4a31893d-a784-ed33-bd47-5db85b3c02b6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a31893d-a784-ed33-bd47-5db85b3c02b6@suse.com>

On Tue, Jul 25, 2023 at 08:40:31AM +0200, Jan Beulich wrote:
> On 24.07.2023 18:52, Alejandro Vallejo wrote:
> > Some hypervisors report ~0 as the microcode revision to mean "don't issue
> > microcode updates". Ignore the microcode loading interface in that case.
> > 
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> > Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Hmm.
> 
> > --- a/xen/arch/x86/cpu/microcode/core.c
> > +++ b/xen/arch/x86/cpu/microcode/core.c
> > @@ -867,10 +867,23 @@ int __init early_microcode_init(unsigned long *module_map,
> >          return -ENODEV;
> >      }
> >  
> > -    microcode_grab_module(module_map, mbi);
> > -
> >      ucode_ops.collect_cpu_info();
> >  
> > +    /*
> > +     * Some hypervisors deliberately report a microcode revision of -1 to
> > +     * mean that they will not accept microcode updates. We take the hint
> > +     * and ignore the microcode interface in that case.
> > +     */
> > +    if ( this_cpu(cpu_sig).rev == ~0 )
> > +    {
> > +        printk(XENLOG_INFO "Microcode loading disabled due to: %s",
> 
> While we have tentatively agreed to adjust what _will_ be emitted by
> default (subject to suitable justification in that change's
> description), such a patch is yet to be sent.
Ugh, that was indeed mistagged. Sorry about that. I touched several parts
of this patch shortly before sending it and it crept in by mistake.

> As it stands this message
> will be invisible by default.
Arguably, that's not necessarily a bad thing. The fact that microcode
cannot be updated is expected behaviour and it makes little sense to warn
about it. If only because they should already be aware of it through their
agreement with their provider.

The case I can think of where a warning would be sensible is where the
system has a microcode blob more recent than the currently installed
revision. This is something the admin may want to be aware of in order to
pester their provider for updates. In the common case the machine won't
even need such an update, so sending unconditional warnings per boot seems
unwarranted.

> 
> > +                           "HW toggle");
> 
> With the comment talking about hypervisors, what is this string supposed
> to tell an observer of the message in a log file?
> 
> Jan
Nothing good. As you noticed later, that's the wrong substring off the last
patch and should've been "rev = ~0"

Thanks,
Alejandro

