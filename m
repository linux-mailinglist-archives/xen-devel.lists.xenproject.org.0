Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3DC83904A
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 14:37:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670477.1043281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSGy4-0002JT-2I; Tue, 23 Jan 2024 13:37:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670477.1043281; Tue, 23 Jan 2024 13:37:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSGy3-0002Gu-VI; Tue, 23 Jan 2024 13:37:31 +0000
Received: by outflank-mailman (input) for mailman id 670477;
 Tue, 23 Jan 2024 13:37:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gDjx=JB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rSGy2-0002F8-GM
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 13:37:30 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d89fe61-b9f4-11ee-98f4-6d05b1d4d9a1;
 Tue, 23 Jan 2024 14:37:29 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40ebf373130so5390205e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 05:37:29 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 fl6-20020a05600c0b8600b0040ea9ba9d58sm9508115wmb.37.2024.01.23.05.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 05:37:28 -0800 (PST)
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
X-Inumbo-ID: 8d89fe61-b9f4-11ee-98f4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706017049; x=1706621849; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nJsaQUsn7L0dALlfRc4Oa9nxZ6l6MhVmm78MjTwBpCY=;
        b=WDa37uF6cI+N96fnBbR0MA+cDiI45rSKSgdjmNzXvvxYXSgZiMs6EIxZxV4UYs2YLC
         bTJY2DKirNUisMDbkedNjD9Da8LS5F2ya18E39/1zR9R6iNKIeTcfRVTRSx9Z+g+64FE
         BqQ/6J/nemcT0tcX7d5xQPKOVgId5PrWhLedY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706017049; x=1706621849;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJsaQUsn7L0dALlfRc4Oa9nxZ6l6MhVmm78MjTwBpCY=;
        b=V3nt+IpNG8RzDCBhS4d1f4P90+xVd1pKsUzfExYswoqbT9o5SKWbsqFpFryOlmVAK/
         BlOk16QSjG/sIng9GCk/qOLngz3PUpVxDNGNEjXLS9B+EFIoNeCnbKQJ8hicJRGUGvrA
         JPzTHrONUAon3+Pknu4+PVKCBAWN3H/xWd7L2BR23j9IhRGa7PZKL7m//nWeh5YZM6Mb
         BeXQz4kyUMB+FMNWr5TX23VHWK3HrnDc/yvqOR3aJWX6fNMz25mMeBuUzYZNPuPQTiaM
         tCEWoGxnruEqOdkS4oby7PbJsbaP4nw6NFzBRy2HCOHLuyx0qGAGIlBBCn/RBKu+aOOx
         jEGQ==
X-Gm-Message-State: AOJu0Yy6auWdTvVCJRKOVM8D9K5R5aRNeojdhTnmjNBHugSDxa86DHhp
	VTCNN6rNxfDkdNzQM0lFCbUOzPQSsQVJlYRpdubKvTiUuk+1yVzwZDpG7rhLpl0=
X-Google-Smtp-Source: AGHT+IEwQyGyIb9BzKxwiOuSogyKmcJ8NuBsfad4Wr6vr85oQfqERrWJ42V+rSN3rUg/k8E3K2vGqQ==
X-Received: by 2002:a7b:c7c6:0:b0:40e:5e29:cca2 with SMTP id z6-20020a7bc7c6000000b0040e5e29cca2mr532565wmk.44.1706017048806;
        Tue, 23 Jan 2024 05:37:28 -0800 (PST)
Date: Tue, 23 Jan 2024 14:37:27 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/3] x86/entry: Make #PF/NMI/INT0x82 more amenable to
 livepatching
Message-ID: <Za_BF_wr0qWH5eKC@macbook>
References: <20240122181714.1543738-1-andrew.cooper3@citrix.com>
 <20240122181714.1543738-3-andrew.cooper3@citrix.com>
 <0edeb969-6fef-46f4-b216-0858edbaefa6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0edeb969-6fef-46f4-b216-0858edbaefa6@suse.com>

On Tue, Jan 23, 2024 at 10:22:10AM +0100, Jan Beulich wrote:
> On 22.01.2024 19:17, Andrew Cooper wrote:
> > It is bad form to have inter-function fallthrough.  It only functions right
> > now because alignment padding bytes are NOPs.
> 
> But that's a requirement anyway in executable sections.

Really?  I was under the impression we wanted to replace the padding
nops with rets maybe, or even poison the padding with int3 or ud2.

> > --- a/xen/arch/x86/x86_64/compat/entry.S
> > +++ b/xen/arch/x86/x86_64/compat/entry.S
> > @@ -29,6 +29,7 @@ FUNC(entry_int82)
> >  
> >          mov   %rsp, %rdi
> >          call  do_entry_int82
> > +        jmp   compat_test_all_events
> >  END(entry_int82)
> >  
> >  /* %rbx: struct vcpu */
> > diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
> > index c3f6b667a72a..fc64ef1fd460 100644
> > --- a/xen/arch/x86/x86_64/entry.S
> > +++ b/xen/arch/x86/x86_64/entry.S
> > @@ -723,7 +723,9 @@ END(common_interrupt)
> >  FUNC(entry_PF)
> >          ENDBR64
> >          movl  $X86_EXC_PF, 4(%rsp)
> > +        jmp   handle_exception
> >  END(entry_PF)
> > +
> >  /* No special register assumptions. */
> >  FUNC(handle_exception, 0)
> >          ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
> > @@ -1023,6 +1025,7 @@ FUNC(entry_NMI)
> >          ENDBR64
> >          pushq $0
> >          movl  $X86_EXC_NMI, 4(%rsp)
> > +        jmp   handle_ist_exception
> >  END(entry_NMI)
> >  
> >  FUNC(handle_ist_exception)
> 
> Hmm, so here you (partly) do what I was meaning to do in the one patch
> left from the entry point annotations series, "common: honor
> CONFIG_CC_SPLIT_SECTIONS also for assembly functions". However, I'm
> wrapping the JMPs there in #ifdef CONFIG_CC_SPLIT_SECTIONS. Thoughts?
> I view the JMPs as pretty useless otherwise, even if there is a
> small risk of a future code change not respecting the ordering
> requirements. Yet such would be noticed pretty quickly, I suppose.

I think it's clearer with the jumps.

Thanks, Roger.

