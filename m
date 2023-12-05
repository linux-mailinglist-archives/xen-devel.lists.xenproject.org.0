Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD0980592E
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 16:55:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648094.1012083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAXlJ-0000SC-R3; Tue, 05 Dec 2023 15:55:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648094.1012083; Tue, 05 Dec 2023 15:55:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAXlJ-0000Pt-NU; Tue, 05 Dec 2023 15:55:05 +0000
Received: by outflank-mailman (input) for mailman id 648094;
 Tue, 05 Dec 2023 15:55:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jRF5=HQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rAXlI-0000Ob-Vu
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 15:55:04 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a75ff46f-9386-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 16:55:04 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-332c46d5988so4639530f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 07:55:03 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 ba18-20020a0560001c1200b00333479734a7sm6767749wrb.99.2023.12.05.07.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 07:55:03 -0800 (PST)
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
X-Inumbo-ID: a75ff46f-9386-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701791703; x=1702396503; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QfTZj3hOENHVTOrjjgp95pZzbYssLf0qzi+Fj8t2phI=;
        b=q3D0OeWEkTYv1f19iIZkKHuTxMB2Yyco1EZTlTMNQFBrm86wOEfehY253fW1u8HImi
         JLgjhLp7jPvMsb1PDVZ7pU78BLh3UC53epokZq0bFQ+aOrxBk4oCOvAHMJ3lTVw7ynsq
         IL14DnD/TwJdTGBvN2QyIBb4kd1QtychNUdy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701791703; x=1702396503;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QfTZj3hOENHVTOrjjgp95pZzbYssLf0qzi+Fj8t2phI=;
        b=AzAEn85ySAA7yhMra37XKpy81zXgjCOSBRsC8hLtFQ8pKVOuJa5/DpTGBRJsO3uFsj
         rnZm3lQwFEgSnMdvyRViPW1FEduEEZnUViUwxZx1G9NES8DQ3z5zO3ZaY5Y+3pHWRYZS
         UwJQtb5rQKAnTpfElelJETvqHJwu+nL6KI+bJcu95x+XXMfDHwAkvSXta+62eaJJuY7Y
         W3oV07RL3EJGgwwqeMpEKtdDT8lyYCiF3jBIKg2BJ5lyxQK82wIZF8thhAZ2v3Ivncud
         Fj5Z2iJdr9qjjkhu7swikQrXmgOQpMNRUPMVRnWFVcf4gfteXyqudAeHhUy0NY6zAPPT
         y8Mw==
X-Gm-Message-State: AOJu0YwmJv5H0MgDtxgkg4MYdkhNEASeB9KHHH03S8TAimILnsfrvkDZ
	UrAXsQHMd0Kcx0Ry8JvF9gfbwQ==
X-Google-Smtp-Source: AGHT+IF8L7UEC5LJNhxUPqJhFwhh6z6u7jlGOqtfuaOifg4hcX6yfme5b3HHqAW9s8vrxu9+Sh1//Q==
X-Received: by 2002:adf:faca:0:b0:333:3518:c6a5 with SMTP id a10-20020adffaca000000b003333518c6a5mr3787860wrs.40.1701791703398;
        Tue, 05 Dec 2023 07:55:03 -0800 (PST)
Date: Tue, 5 Dec 2023 16:55:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 2/6] x86/HVM: split restore state checking from state
 loading
Message-ID: <ZW9H1uE_6k3d-uWn@macbook>
References: <49a17ffa-c873-4b0f-81ed-9587053ca159@suse.com>
 <dcc726f5-634e-4b48-aa8f-d477cdc8dea9@suse.com>
 <ZW4L5Q4SMprtmbK-@macbook>
 <5f7c43ca-dfc4-4929-8776-6985e610e154@suse.com>
 <ZW8zyXkUJDKVt-HX@macbook>
 <2ded19f7-2ba6-4b1c-8752-a73894dcdae0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ded19f7-2ba6-4b1c-8752-a73894dcdae0@suse.com>

On Tue, Dec 05, 2023 at 03:59:13PM +0100, Jan Beulich wrote:
> On 05.12.2023 15:29, Roger Pau Monné wrote:
> > On Tue, Dec 05, 2023 at 09:52:31AM +0100, Jan Beulich wrote:
> >> On 04.12.2023 18:27, Roger Pau Monné wrote:
> >>> On Tue, Nov 28, 2023 at 11:34:04AM +0100, Jan Beulich wrote:
> >>>> ..., at least as reasonably feasible without making a check hook
> >>>> mandatory (in particular strict vs relaxed/zero-extend length checking
> >>>> can't be done early this way).
> >>>>
> >>>> Note that only one of the two uses of hvm_load() is accompanied with
> >>>> hvm_check(). The other directly consumes hvm_save() output, which ought
> >>>> to be well-formed. This means that while input data related checks don't
> >>>> need repeating in the "load" function when already done by the "check"
> >>>> one (albeit assertions to this effect may be desirable), domain state
> >>>> related checks (e.g. has_xyz(d)) will be required in both places.
> >>>>
> >>>> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> >>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>> ---
> >>>> Do we really need all the copying involved in use of _hvm_read_entry()
> >>>> (backing hvm_load_entry()? Zero-extending loads are likely easier to
> >>>> handle that way, but for strict loads all we gain is a reduced risk of
> >>>> unaligned accesses (compared to simply pointing into h->data[]).
> >>>
> >>> See below, but I wonder whether the checks could be performed as part
> >>> of hvm_load() without having to introduce a separate handler and loop
> >>> over the context entries.
> >>
> >> Specifically not. State loading (in the longer run) would better not fail
> >> once started. (Imo it should have been this way from the beginning.) Only
> >> then will the vCPU still be in a predictable state even after a possible
> >> error.
> > 
> > Looking at the callers, does such predictable state after failure
> > matter?
> > 
> > One caller is an hypercall used by the toolstack at domain create,
> > failing can just lead to the domain being destroyed.  The other caller
> > is vm fork, which will also lead to the fork being destroyed if
> > context loading fails.
> > 
> > Maybe I'm overlooking something.
> 
> You don't (I think), but existing callers necessarily have to behave the
> way you describe. From an abstract perspective, though, failed state
> loading would better allow a retry. And really I thought that when you
> suggested to split checking from loading, you had exactly that in mind.

Not really TBH, because I didn't think that much on a possible
implementation when proposing it.

Maybe a suitable compromise would be to reset the state to the initial
(at domain build) one on failure?

I do dislike the duplicated loops, as it seems like a lot of duplicate
boilerplate code, and I have fears of it going out of sync.

> >>>> Would the hvm_sr_handlers[] better use array_access_nospec()?
> >>>
> >>> Maybe?  Given this is a domctl I do wonder whether a domain already
> >>> having access to such interface won't have easier ways to leak data
> >>> from Xen.  Maybe for a disaggregated setup.
> >>
> >> Hmm, now we're in the middle - Andrew effectively said "no need to".
> > 
> > I'm certainly not an expert on whether array_access_nospec() should be
> > used, so if Andrew says no need, that's likely better advice.
> > 
> > Maybe the xsm check used in such desegregated setups would already
> > stop speculation?
> 
> There's no XSM check anywhere near, and even if there was I don't see
> how it would stop mis-speculation on those array accesses.

This being a slow path anyway, I don't think the extra
array_access_nospec() would make much of an impact, but again I have
to admit it's unclear to me when those are actually required, so I
might suggest adding them out of precaution.

> >>>> @@ -275,6 +281,78 @@ int hvm_save(struct domain *d, hvm_domai
> >>>>      return 0;
> >>>>  }
> >>>>  
> >>>> +int hvm_check(const struct domain *d, hvm_domain_context_t *h)
> >>>> +{
> >>>> +    const struct hvm_save_header *hdr;
> >>>> +    int rc;
> >>>> +
> >>>> +    if ( d->is_dying )
> >>>> +        return -EINVAL;
> >>>> +
> >>>> +    /* Get at the save header, which must be first. */
> >>>> +    hdr = hvm_get_entry(HEADER, h);
> >>>> +    if ( !hdr )
> >>>> +        return -ENODATA;
> >>>> +
> >>>> +    rc = arch_hvm_check(d, hdr);
> >>>> +    if ( rc )
> >>>> +        return rc;
> >>>> +
> >>>> +    for ( ; ; )
> >>>> +    {
> >>>> +        const struct hvm_save_descriptor *desc;
> >>>> +        hvm_check_handler handler;
> >>>> +
> >>>> +        if ( h->size - h->cur < sizeof(*desc) )
> >>>> +        {
> >>>> +            /* Run out of data */
> >>>> +            printk(XENLOG_G_ERR
> >>>> +                   "HVM restore %pd: save did not end with a null entry\n",
> >>>> +                   d);
> >>>> +            return -ENODATA;
> >>>> +        }
> >>>> +
> >>>> +        /* Read the typecode of the next entry and check for the end-marker. */
> >>>> +        desc = (const void *)&h->data[h->cur];
> >>>> +        if ( desc->typecode == HVM_SAVE_CODE(END) )
> >>>> +        {
> >>>> +            /* Reset cursor for hvm_load(). */
> >>>> +            h->cur = 0;
> >>>> +            return 0;
> >>>> +        }
> >>>> +
> >>>> +        /* Find the handler for this entry. */
> >>>> +        if ( desc->typecode >= ARRAY_SIZE(hvm_sr_handlers) ||
> >>>> +             !hvm_sr_handlers[desc->typecode].name ||
> >>>> +             !hvm_sr_handlers[desc->typecode].load )
> >>>> +        {
> >>>> +            printk(XENLOG_G_ERR "HVM restore %pd: unknown entry typecode %u\n",
> >>>> +                   d, desc->typecode);
> >>>> +            return -EINVAL;
> >>>> +        }
> >>>> +
> >>>> +        /* Check the entry. */
> >>>> +        handler = hvm_sr_handlers[desc->typecode].check;
> >>>> +        if ( !handler )
> >>>> +        {
> >>>> +            if ( desc->length > h->size - h->cur - sizeof(*desc) )
> >>>> +                return -ENODATA;
> >>>> +            h->cur += sizeof(*desc) + desc->length;
> >>>> +        }
> >>>> +        else if ( (rc = handler(d, h)) )
> >>>> +        {
> >>>> +            printk(XENLOG_G_ERR
> >>>> +                   "HVM restore %pd: failed to check %s:%u rc %d\n",
> >>>> +                   d, hvm_sr_handlers[desc->typecode].name, desc->instance, rc);
> >>>> +            return rc;
> >>>> +        }
> >>>> +
> >>>> +        process_pending_softirqs();
> >>>
> >>> Looking at this, won't it be better to call the check() hooks inside
> >>> the hvm_load() function instead of duplicating the loop?
> >>>
> >>> I realize that you only perform the checks when the state is loaded
> >>> from a domctl, but still seems quite a lot of code duplication for
> >>> little benefit.
> >>>
> >>> hvm_load() could gain an extra parameter to select whether the input
> >>> must be checked or not, and that would avoid having to iterate twice
> >>> over the context.
> >>
> >> Well, see above.
> >>
> >>>> +    }
> >>>> +
> >>>> +    /* Not reached */
> >>>
> >>> ASSERT_UNREACHABLE() maybe?
> >>
> >> Hmm, I'd find it kind of odd to have such here. While hvm_load() doesn't
> >> have such either, perhaps that's not a meaningful reference. Adding this
> >> would make me fear introducing a Misra violation (adding dead code).
> > 
> > But isn't this the purpose of ASSERT_UNREACHABLE() exactly?  IOW:
> > Misra will need an exception for all usage of ASSERT_UNREACHABLE()
> > already.
> > 
> > I think ASSERT_UNREACHABLE() is much better than a Not reached
> > comment: conveys the same information to readers of the code and has
> > a run-time consequence on debug builds.
> 
> I see a difference between uses on paths were we assert that a certain
> state cannot be reached (if all our logic is right) vs a case like the
> one here where the compiler (or another tool) can actually prove that
> the loop can't be exited the "normal" way.

Can't be exited with the current code, but the purpose of
ASSERT_UNREACHABLE() is also to guarantee that further changes might
not break this condition.

Thanks, Roger.

