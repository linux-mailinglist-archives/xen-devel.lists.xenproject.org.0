Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8442A80574E
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 15:29:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647955.1011772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAWQY-0000cT-KO; Tue, 05 Dec 2023 14:29:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647955.1011772; Tue, 05 Dec 2023 14:29:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAWQY-0000ao-HW; Tue, 05 Dec 2023 14:29:34 +0000
Received: by outflank-mailman (input) for mailman id 647955;
 Tue, 05 Dec 2023 14:29:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jRF5=HQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rAWQX-0000ZF-1f
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 14:29:33 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3d72764-937a-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 15:29:30 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40c09f4814eso32896985e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 06:29:30 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 i12-20020a5d584c000000b0033342f72bf8sm7011110wrf.9.2023.12.05.06.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 06:29:30 -0800 (PST)
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
X-Inumbo-ID: b3d72764-937a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701786570; x=1702391370; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3aQcICTQfuMd+zc46y6/S5a47Y9E7zeF7tjwTjquORc=;
        b=kjS0UHeyHKJxgXu+flRl21q8/CXzg2ap6nGSyB0B/T0Y1Y6zv2jC8EjdgzalD10hal
         dWEvHtqMRkJRslKs40UTfbXX5iOKYohSUWxzH3Zj4uPNek89jktWJIy1GUI2H3Fe8LlQ
         HyzqYZ9NHtE8hNf3YSZbBYj2GrBNC8RGpYck4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701786570; x=1702391370;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3aQcICTQfuMd+zc46y6/S5a47Y9E7zeF7tjwTjquORc=;
        b=qC+4gX1EFWA/+brkUzdTFVUjtDLbKE373fNRR8wlxGlwtwpbiGBUzUiIZApQeXuEX0
         RphBemNnbn7BO0jl28bksQqoqrEZn0TeoPqdN/U3oUDAHmbdqWrrYZyAyvME/TVmeLnk
         rQH3N/BjTqnIG9+OOHKb7aBW1ABY5j5zoQhgGTEHrwz3DGFLzKf1YhGLvaB3PpL1RyKW
         ch1A9JtMLqtXN32mEe3yu950+2j3WUXElIbwLIsJIyUBDqiFF1Ly6MsEd43AXhyDmGjL
         UfTanxH/iMKa4xyW9iv6YTUMRfBSn30o9h2AeoPYHgHZS1gbn0XxkV38vXkXNXtQjD89
         ENMQ==
X-Gm-Message-State: AOJu0YwvlUYeVwufSVzcpXHCkLS3/k6l9trOBdKrGg4Es/UORyyLTx9G
	UBqJMWXZ9zjm/BjVxB+/WjF/Kg==
X-Google-Smtp-Source: AGHT+IFKD6LHh7npRzTLcWYuOWpW+ln3EvzvN95Rh/9Fh5fvoERC7fnuHumdZsOL8x7I6wgagiSqtA==
X-Received: by 2002:a05:600c:4f42:b0:3fe:1232:93fa with SMTP id m2-20020a05600c4f4200b003fe123293famr557547wmq.22.1701786570268;
        Tue, 05 Dec 2023 06:29:30 -0800 (PST)
Date: Tue, 5 Dec 2023 15:29:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 2/6] x86/HVM: split restore state checking from state
 loading
Message-ID: <ZW8zyXkUJDKVt-HX@macbook>
References: <49a17ffa-c873-4b0f-81ed-9587053ca159@suse.com>
 <dcc726f5-634e-4b48-aa8f-d477cdc8dea9@suse.com>
 <ZW4L5Q4SMprtmbK-@macbook>
 <5f7c43ca-dfc4-4929-8776-6985e610e154@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f7c43ca-dfc4-4929-8776-6985e610e154@suse.com>

On Tue, Dec 05, 2023 at 09:52:31AM +0100, Jan Beulich wrote:
> On 04.12.2023 18:27, Roger Pau Monné wrote:
> > On Tue, Nov 28, 2023 at 11:34:04AM +0100, Jan Beulich wrote:
> >> ..., at least as reasonably feasible without making a check hook
> >> mandatory (in particular strict vs relaxed/zero-extend length checking
> >> can't be done early this way).
> >>
> >> Note that only one of the two uses of hvm_load() is accompanied with
> >> hvm_check(). The other directly consumes hvm_save() output, which ought
> >> to be well-formed. This means that while input data related checks don't
> >> need repeating in the "load" function when already done by the "check"
> >> one (albeit assertions to this effect may be desirable), domain state
> >> related checks (e.g. has_xyz(d)) will be required in both places.
> >>
> >> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> Do we really need all the copying involved in use of _hvm_read_entry()
> >> (backing hvm_load_entry()? Zero-extending loads are likely easier to
> >> handle that way, but for strict loads all we gain is a reduced risk of
> >> unaligned accesses (compared to simply pointing into h->data[]).
> > 
> > See below, but I wonder whether the checks could be performed as part
> > of hvm_load() without having to introduce a separate handler and loop
> > over the context entries.
> 
> Specifically not. State loading (in the longer run) would better not fail
> once started. (Imo it should have been this way from the beginning.) Only
> then will the vCPU still be in a predictable state even after a possible
> error.

Looking at the callers, does such predictable state after failure
matter?

One caller is an hypercall used by the toolstack at domain create,
failing can just lead to the domain being destroyed.  The other caller
is vm fork, which will also lead to the fork being destroyed if
context loading fails.

Maybe I'm overlooking something.

> >> Would the hvm_sr_handlers[] better use array_access_nospec()?
> > 
> > Maybe?  Given this is a domctl I do wonder whether a domain already
> > having access to such interface won't have easier ways to leak data
> > from Xen.  Maybe for a disaggregated setup.
> 
> Hmm, now we're in the middle - Andrew effectively said "no need to".

I'm certainly not an expert on whether array_access_nospec() should be
used, so if Andrew says no need, that's likely better advice.

Maybe the xsm check used in such desegregated setups would already
stop speculation?

> >> @@ -275,6 +281,78 @@ int hvm_save(struct domain *d, hvm_domai
> >>      return 0;
> >>  }
> >>  
> >> +int hvm_check(const struct domain *d, hvm_domain_context_t *h)
> >> +{
> >> +    const struct hvm_save_header *hdr;
> >> +    int rc;
> >> +
> >> +    if ( d->is_dying )
> >> +        return -EINVAL;
> >> +
> >> +    /* Get at the save header, which must be first. */
> >> +    hdr = hvm_get_entry(HEADER, h);
> >> +    if ( !hdr )
> >> +        return -ENODATA;
> >> +
> >> +    rc = arch_hvm_check(d, hdr);
> >> +    if ( rc )
> >> +        return rc;
> >> +
> >> +    for ( ; ; )
> >> +    {
> >> +        const struct hvm_save_descriptor *desc;
> >> +        hvm_check_handler handler;
> >> +
> >> +        if ( h->size - h->cur < sizeof(*desc) )
> >> +        {
> >> +            /* Run out of data */
> >> +            printk(XENLOG_G_ERR
> >> +                   "HVM restore %pd: save did not end with a null entry\n",
> >> +                   d);
> >> +            return -ENODATA;
> >> +        }
> >> +
> >> +        /* Read the typecode of the next entry and check for the end-marker. */
> >> +        desc = (const void *)&h->data[h->cur];
> >> +        if ( desc->typecode == HVM_SAVE_CODE(END) )
> >> +        {
> >> +            /* Reset cursor for hvm_load(). */
> >> +            h->cur = 0;
> >> +            return 0;
> >> +        }
> >> +
> >> +        /* Find the handler for this entry. */
> >> +        if ( desc->typecode >= ARRAY_SIZE(hvm_sr_handlers) ||
> >> +             !hvm_sr_handlers[desc->typecode].name ||
> >> +             !hvm_sr_handlers[desc->typecode].load )
> >> +        {
> >> +            printk(XENLOG_G_ERR "HVM restore %pd: unknown entry typecode %u\n",
> >> +                   d, desc->typecode);
> >> +            return -EINVAL;
> >> +        }
> >> +
> >> +        /* Check the entry. */
> >> +        handler = hvm_sr_handlers[desc->typecode].check;
> >> +        if ( !handler )
> >> +        {
> >> +            if ( desc->length > h->size - h->cur - sizeof(*desc) )
> >> +                return -ENODATA;
> >> +            h->cur += sizeof(*desc) + desc->length;
> >> +        }
> >> +        else if ( (rc = handler(d, h)) )
> >> +        {
> >> +            printk(XENLOG_G_ERR
> >> +                   "HVM restore %pd: failed to check %s:%u rc %d\n",
> >> +                   d, hvm_sr_handlers[desc->typecode].name, desc->instance, rc);
> >> +            return rc;
> >> +        }
> >> +
> >> +        process_pending_softirqs();
> > 
> > Looking at this, won't it be better to call the check() hooks inside
> > the hvm_load() function instead of duplicating the loop?
> > 
> > I realize that you only perform the checks when the state is loaded
> > from a domctl, but still seems quite a lot of code duplication for
> > little benefit.
> > 
> > hvm_load() could gain an extra parameter to select whether the input
> > must be checked or not, and that would avoid having to iterate twice
> > over the context.
> 
> Well, see above.
> 
> >> +    }
> >> +
> >> +    /* Not reached */
> > 
> > ASSERT_UNREACHABLE() maybe?
> 
> Hmm, I'd find it kind of odd to have such here. While hvm_load() doesn't
> have such either, perhaps that's not a meaningful reference. Adding this
> would make me fear introducing a Misra violation (adding dead code).

But isn't this the purpose of ASSERT_UNREACHABLE() exactly?  IOW:
Misra will need an exception for all usage of ASSERT_UNREACHABLE()
already.

I think ASSERT_UNREACHABLE() is much better than a Not reached
comment: conveys the same information to readers of the code and has
a run-time consequence on debug builds.

Thanks, Roger.

