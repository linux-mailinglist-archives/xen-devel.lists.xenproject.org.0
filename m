Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC35A15248
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2025 15:58:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.874123.1284963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYnnL-0001mg-M2; Fri, 17 Jan 2025 14:57:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 874123.1284963; Fri, 17 Jan 2025 14:57:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYnnL-0001jo-JD; Fri, 17 Jan 2025 14:57:59 +0000
Received: by outflank-mailman (input) for mailman id 874123;
 Fri, 17 Jan 2025 14:57:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wado=UJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tYnnK-0001ji-5R
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2025 14:57:58 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fbac4fd-d4e3-11ef-a0e2-8be0dac302b0;
 Fri, 17 Jan 2025 15:57:57 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4362bae4d7dso15046065e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jan 2025 06:57:57 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf322aab8sm2754541f8f.57.2025.01.17.06.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 06:57:55 -0800 (PST)
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
X-Inumbo-ID: 6fbac4fd-d4e3-11ef-a0e2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737125876; x=1737730676; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eaF3E/s+Qolsus2xx+kGrUlsIIEtO+GcgybAtuy88M4=;
        b=go8ENQ7+MzGg8utxxsZhkxLj6l4wCZGg16Oipe9RmKItr4ZbPheEO1Q1zHd13fPmJF
         hhA/yHbsqrxlXZhAZq6bo4stncDSvGvygo1ZbI5h2gpldAe1259c1YkKKW2xZx8c2Aeu
         04zZTmgRtnkEcADGva/sskrz10zd9++cLtBlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737125876; x=1737730676;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eaF3E/s+Qolsus2xx+kGrUlsIIEtO+GcgybAtuy88M4=;
        b=W2Feah4sGTPvS+lQGWfGx7qizPwShpp0IHyzoVtUPLPBWdW4cObzsvopSV4ayFc0Rg
         PlKfY3QN3zXCHQI4S0+5RvUE00hxYNPkAqJT0ZG1TrSUoZqphSzN1cXNMwc8VnKxPVzZ
         ual02mGsqY0C0F7l7hdv3gW2SZmvOt7/p1BUBP3XwwHju18zsHwSRZkX8IxnfO7P93+t
         3dFRtY5ikU4urVVv4bwLEdVUPsNBcNyCMVuBafpahD5q09CqT64Nw/Nlp+Zi8LFJYYE6
         iezkiNBEf5ItSEwzlXGLypLo3W+aaadaTmOdsRtjeoYDchKe5CEiaRMSNYaVRAV6QEqa
         KypA==
X-Forwarded-Encrypted: i=1; AJvYcCU2qaooqxVd/ayWyEA7PgI73rNrmdXAZVk7mTwRNAo6/q2SJc3G/P8USNsFn9Ew5HCGptrKLU49rPA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxrEownzxVhghOA1Nn+/rMmEz0f1gOUZSa4EJYXUjrAk1HfuLP4
	Lzk4mA3kMXqqFGFLJy703bt86UoVbjf+0/Rz0RzyJ+M8cmUzLjkA4/5w5RRA20MLbsedhdS2502
	t
X-Gm-Gg: ASbGncuTbLwWJ8ajdMEyXJFvrAylQYQwkRFCpLx9f3y43IZ7+Ts4DxSOHxNtfRAjBJB
	bP2sgFQ5VUTy14tZuT6M43yZ05vahPKjiWcPWi3W7wwSBT1kVvDyLeKxd3nQaCfNP8/9LDCWyAG
	+kN4QORZ5N+zzLSpJrLUp1x+vmaXcdynNAd5GjaNYl/vqbGqpt8WXrbZvu7DG+lx+6JOuUszfI4
	5LIJbjLk7d2ecW89ZJ4mant3+mS3u3fLEdcJ4kLdc0J4+zmgUDc5d+S/1OyIQ==
X-Google-Smtp-Source: AGHT+IGTahAVHPN0bmB6Gq7tuu5eBFTRJEzEDPSc+Vuf0TAwxboe3/fL5bz84Pkv9YK0SxGkkTcpoA==
X-Received: by 2002:a5d:588e:0:b0:385:faec:d94d with SMTP id ffacd0b85a97d-38bf57bd65bmr2776920f8f.51.1737125876420;
        Fri, 17 Jan 2025 06:57:56 -0800 (PST)
Date: Fri, 17 Jan 2025 15:57:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 02/18] x86/domain: limit window where curr_vcpu !=
 current on context switch
Message-ID: <Z4pv87ngrHD64Prm@macbook.local>
References: <20250108142659.99490-1-roger.pau@citrix.com>
 <20250108142659.99490-3-roger.pau@citrix.com>
 <46cb0ee0-ea9f-4515-abac-058a9aa846e4@suse.com>
 <Z4AIdlx7uWcS3cOP@macbook.local>
 <153425e6-a17d-48d2-a1d7-a9b0bf3167dd@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <153425e6-a17d-48d2-a1d7-a9b0bf3167dd@suse.com>

On Tue, Jan 14, 2025 at 04:02:01PM +0100, Jan Beulich wrote:
> On 09.01.2025 18:33, Roger Pau Monné wrote:
> > On Thu, Jan 09, 2025 at 09:59:58AM +0100, Jan Beulich wrote:
> >> On 08.01.2025 15:26, Roger Pau Monne wrote:
> >>>      }
> >>>      else
> >>>      {
> >>> -        __context_switch();
> >>> +        /*
> >>> +         * curr_vcpu will always point to the currently loaded vCPU context, as
> >>> +         * it's not updated when doing a lazy switch to the idle vCPU.
> >>> +         */
> >>> +        struct vcpu *prev_ctx = per_cpu(curr_vcpu, cpu);
> >>> +
> >>> +        if ( prev_ctx != current )
> >>> +        {
> >>> +            /*
> >>> +             * Doing a full context switch to a non-idle vCPU from a lazy
> >>> +             * context switched state.  Adjust current to point to the
> >>> +             * currently loaded vCPU context.
> >>> +             */
> >>> +            ASSERT(current == idle_vcpu[cpu]);
> >>> +            ASSERT(!is_idle_vcpu(next));
> >>> +            set_current(prev_ctx);
> >>
> >> This feels wrong, as in "current" then not representing what it should represent,
> >> for a certain time window. I may be dense, but neither comment not description
> >> clarify to me why this might be needed. I can see that it's needed to please the
> >> ASSERT() you add to __context_switch(), yet then I might ask why that assertion
> >> is put there.
> > 
> > This is done so that when calling __context_switch() current ==
> > curr_vcpu, and map_domain_page() can be used without getting into an
> > infinite sync_local_execstate() recursion loop.
> 
> Yet it's the purpose of __context_switch() to bring curr_vcpu in sync
> with current. IOW both matching up is supposed to be an exit condition
> of the function, not an entry one.
> 
> Plus, as indicated when we were talking this through yesterday, the
> set_current() here make "current" no longer point at what - from the
> scheduler's perspective - is (supposed to be) the current vCPU.

I understand this, and I will look into alternative ways to workaround
the issues I'm facing that prompted the changes proposed on this
patch.

I've been thinking about what we spoke of disabling lazy idle context
switch when ASI was enabled, and I'm afraid that won't be enough.  The
{populate,destroy}_perdomain_mapping() functions added later in the
series will be used in the context switch path regardless of whether
ASI is enabled, and those functions require map_domain_page() to be
usable.  Hence map_domain_page() needs to be usable in the context
switch path.

I will see whether I can allow the usage of map_domain_page() at
context switch in a different way.

I understand the main concern is the window where current and the
scheduler notion of current diverge right?

Arguably this is already happening in context_switch(), as
set_current() gets called almost at the beggining of the function,
while the call to sched_context_switched() only happens at the tail of
the function.  So for the whole call to  __context_switch() current is
not in-sync with the scheduler currently running vCPU.  And I'm not
saying this is a model to follow, but the context switch code is
already fairly special, hence I don't see the change here as that much
different from the current logic.

That said, I will still try to figure an alternative way to deal with
the usage of map_domain_page() in the context switch path.

> Aiui this adjustment is the reason for ...
> 
> >>> --- a/xen/arch/x86/traps.c
> >>> +++ b/xen/arch/x86/traps.c
> >>> @@ -2232,8 +2232,6 @@ void __init trap_init(void)
> >>>  
> >>>  void activate_debugregs(const struct vcpu *curr)
> >>>  {
> >>> -    ASSERT(curr == current);
> >>> -
> >>>      write_debugreg(0, curr->arch.dr[0]);
> >>>      write_debugreg(1, curr->arch.dr[1]);
> >>>      write_debugreg(2, curr->arch.dr[2]);
> >>
> >> Why would this assertion go away? If it suddenly triggers, the parameter name
> >> would now end up being wrong.
> > 
> > Well, at the point where activate_debugregs() gets called (in
> > paravirt_ctxt_switch_to()), current == previous as a result of this
> > change, so the assert is no longer true on purpose on that call
> > path.
> 
> ... this behavior. Which, as said, feels wrong the latest when "curr" was
> renamed to no longer suggest it actually is cached "current". At that point
> it'll be dubious whose ->arch.dr[] are actually written into the CPU
> registers.
> 
> Also let's not forget that there's a 2nd call here, where I very much hope
> it continues to be "current" that's being passed in.

Indeed, for the other call the assert would still be valid, that
context is not changed.

Thanks, Roger.

