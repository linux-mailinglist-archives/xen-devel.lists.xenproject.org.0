Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D068283F7
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 11:27:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664365.1034527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rN9JZ-0006Gc-5J; Tue, 09 Jan 2024 10:26:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664365.1034527; Tue, 09 Jan 2024 10:26:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rN9JZ-0006EA-1h; Tue, 09 Jan 2024 10:26:33 +0000
Received: by outflank-mailman (input) for mailman id 664365;
 Tue, 09 Jan 2024 10:26:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OpKn=IT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rN9JX-0006Di-T4
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 10:26:31 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d5dc6fe-aed9-11ee-98ef-6d05b1d4d9a1;
 Tue, 09 Jan 2024 11:26:30 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-55818b733f7so355339a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 02:26:29 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 f12-20020a170906138c00b00a27e4d34455sm866304ejc.183.2024.01.09.02.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 02:26:29 -0800 (PST)
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
X-Inumbo-ID: 8d5dc6fe-aed9-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1704795989; x=1705400789; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bVkQdXgz5vTknXzZGDC9RNkPGtEfzQV3mAWhEWD+NnA=;
        b=unaNwWJDqXmG+pDPBSDGsJR1Z5X9mu1xI9KHHjy9ejHL/VUe8GXhFi8d/F9KS2yOdD
         Fpr68NCVaW0yJ3lqJ2McPp+esriQV0YVU0LzalpMLqhf7AA3TMIRkxx1KXcICjLb5TTC
         QpKe/D+zK6PcAp6bTgwCjGgGmY/ZKQEq21LAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704795989; x=1705400789;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bVkQdXgz5vTknXzZGDC9RNkPGtEfzQV3mAWhEWD+NnA=;
        b=M8GYGQkciO3WhsHstK0D2YUk0qZ7JeLDIfQ+iNeUt6ICJxRbxjxeEfZw7azB1WkOk2
         R6cSM+dYTaMvmZZqrKjTiw6NPOrWp4RZyZLTzHGTqhtT0gz/DR7IsJzARQad5YWcC//g
         bZaZECZzSBIqY7D7U9zXzmie7XU4D5VztIlKZDdHH0ILmToToCJu6y5fsddw6iLwSAy5
         5Zj3H0glp5uRajmmF0LROS0z2B104kAAwGDOR/enIHQ6RfmokTAWDcDovDNNvZUwX6u/
         A3Bqkzhrfp/MVteTRlVv4maAqfhw6BGNEw48o0uVFekW5EV1hiR63gY00IJyXJ63s/8q
         mOAQ==
X-Gm-Message-State: AOJu0Yyv61dL6pHUyf7OXooAzEYziKpNB4AjVsYOwqfoFnjJFVV4wxJz
	p0kH7thZww48aB3Zf7ijNXL+XyJkAW+D6A==
X-Google-Smtp-Source: AGHT+IHEZGWKspL26LAlO8rUvFo9Qwj6vfvRQjEKKCa/V12sRkxKyzNDJ7PsOPYTdQGcaUju03NXMQ==
X-Received: by 2002:a17:906:68d2:b0:a28:d427:371a with SMTP id y18-20020a17090668d200b00a28d427371amr411306ejr.55.1704795989321;
        Tue, 09 Jan 2024 02:26:29 -0800 (PST)
Date: Tue, 9 Jan 2024 11:26:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 1/5] x86/HVM: split restore state checking from state
 loading
Message-ID: <ZZ0fVDLQb__IvgT3@macbook>
References: <1e855575-8c0f-4222-80ba-e64305ea714b@suse.com>
 <05e69eea-79cc-4b3c-861b-855fa67c878a@suse.com>
 <ZYGqbboWvjVOGZkb@macbook>
 <48b5a33e-19c8-49fd-9682-17056e0acb00@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <48b5a33e-19c8-49fd-9682-17056e0acb00@suse.com>

On Tue, Dec 19, 2023 at 04:24:02PM +0100, Jan Beulich wrote:
> On 19.12.2023 15:36, Roger Pau Monné wrote:
> > On Mon, Dec 18, 2023 at 03:39:55PM +0100, Jan Beulich wrote:
> >> ..., at least as reasonably feasible without making a check hook
> >> mandatory (in particular strict vs relaxed/zero-extend length checking
> >> can't be done early this way).
> >>
> >> Note that only one of the two uses of "real" hvm_load() is accompanied
> >> with a "checking" one. The other directly consumes hvm_save() output,
> >> which ought to be well-formed. This means that while input data related
> >> checks don't need repeating in the "load" function when already done by
> >> the "check" one (albeit assertions to this effect may be desirable),
> >> domain state related checks (e.g. has_xyz(d)) will be required in both
> >> places.
> >>
> >> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> Now that this re-arranges hvm_load() anyway, wouldn't it be better to
> >> down the vCPU-s ahead of calling arch_hvm_load() (which is now easy to
> >> arrange for)?
> > 
> > Seems OK to me.
> 
> As is, or with the suggested adjustment, or either way?

I'm fine either way if you don't want to do it as part of this
patch.

> >> --- a/xen/arch/x86/domctl.c
> >> +++ b/xen/arch/x86/domctl.c
> >> @@ -379,8 +379,12 @@ long arch_do_domctl(
> >>          if ( copy_from_guest(c.data, domctl->u.hvmcontext.buffer, c.size) != 0 )
> >>              goto sethvmcontext_out;
> >>  
> >> +        ret = hvm_load(d, false, &c);
> >> +        if ( ret )
> >> +            goto sethvmcontext_out;
> >> +
> >>          domain_pause(d);
> >> -        ret = hvm_load(d, &c);
> >> +        ret = hvm_load(d, true, &c);
> > 
> > Now that the check has been done ahead, do we want to somehow assert
> > that this cannot fail?  AIUI that's the expectation.
> 
> We certainly can't until all checking was moved out of the load handlers.
> And even then I think there are still cases where load might produce an
> error. (In fact I would have refused a little more strongly to folding
> the prior hvm_check() into hvm_load() if indeed a separate hvm_load()
> could have ended up returning void in the long run.)

I see, _load could fail even if all the data provided was correct, for
example because the hypervisor is OoM?

> >> @@ -275,12 +281,10 @@ int hvm_save(struct domain *d, hvm_domai
> >>      return 0;
> >>  }
> >>  
> >> -int hvm_load(struct domain *d, hvm_domain_context_t *h)
> >> +int hvm_load(struct domain *d, bool real, hvm_domain_context_t *h)
> > 
> > Maybe the 'real' parameter should instead be an enum:
> > 
> > enum hvm_load_action {
> >     CHECK,
> >     LOAD,
> > };
> > int hvm_load(struct domain *d, enum hvm_load_action action,
> >              hvm_domain_context_t *h);
> 
> Hmm, yes, it could. I'm not a fan of enums for boolean-like things,
> though.
> 
> > Otherwise a comment might be warranted about how 'real' affects the
> > logic in the function.
> 
> I can certainly add a comment immediately ahead of the function:
> 
> /*
>  * @real = false requests checking of the incoming state, while @real = true
>  * requests actual loading, which will then assume that checking was already
>  * done or is unnecessary.
>  */

Seems good to me.  I do think the usage of an action enum is clearer,
but I'm fine with the comment and the usage of a boolean.

> >> @@ -291,50 +295,91 @@ int hvm_load(struct domain *d, hvm_domai
> >>      if ( !hdr )
> >>          return -ENODATA;
> >>  
> >> -    rc = arch_hvm_load(d, hdr);
> >> -    if ( rc )
> >> -        return rc;
> >> +    rc = arch_hvm_check(d, hdr);
> > 
> > Shouldn't this _check function only be called when real == false?
> 
> Possibly. In v4 I directly transformed what I had in v3:
> 
>     ASSERT(!arch_hvm_check(d, hdr));
> 
> I.e. it is now the call above plus ...
> 
> >> +    if ( real )
> >> +    {
> >> +        struct vcpu *v;
> >> +
> >> +        ASSERT(!rc);
> 
> ... this assertion. Really the little brother of the call site assertion
> you're asking for (see above).
> 
> >> +        arch_hvm_load(d, hdr);
> >>  
> >> -    /* Down all the vcpus: we only re-enable the ones that had state saved. */
> >> -    for_each_vcpu(d, v)
> >> -        if ( !test_and_set_bit(_VPF_down, &v->pause_flags) )
> >> -            vcpu_sleep_nosync(v);
> >> +        /*
> >> +         * Down all the vcpus: we only re-enable the ones that had state
> >> +         * saved.
> >> +         */
> >> +        for_each_vcpu(d, v)
> >> +            if ( !test_and_set_bit(_VPF_down, &v->pause_flags) )
> >> +                vcpu_sleep_nosync(v);
> >> +    }
> >> +    else if ( rc )
> >> +        return rc;

The issue I see with this is that when built with debug=n the call to
arch_hvm_check() with real == true is useless, as the result is never
evaluated - IOW: would be clearer to just avoid the call altogether.

> >>      for ( ; ; )
> >>      {
> >> +        const char *name;
> >> +        hvm_load_handler load;
> >> +
> >>          if ( h->size - h->cur < sizeof(struct hvm_save_descriptor) )
> >>          {
> >>              /* Run out of data */
> >>              printk(XENLOG_G_ERR
> >>                     "HVM%d restore: save did not end with a null entry\n",
> >>                     d->domain_id);
> >> +            ASSERT(!real);
> >>              return -ENODATA;
> >>          }
> >>  
> >>          /* Read the typecode of the next entry  and check for the end-marker */
> >>          desc = (struct hvm_save_descriptor *)(&h->data[h->cur]);
> >> -        if ( desc->typecode == 0 )
> >> +        if ( desc->typecode == HVM_SAVE_CODE(END) )
> >> +        {
> >> +            /* Reset cursor for hvm_load(, true, ). */
> >> +            if ( !real )
> >> +                h->cur = 0;
> >>              return 0;
> >> +        }
> >>  
> >>          /* Find the handler for this entry */
> >> -        if ( (desc->typecode > HVM_SAVE_CODE_MAX) ||
> >> -             ((handler = hvm_sr_handlers[desc->typecode].load) == NULL) )
> >> +        if ( desc->typecode >= ARRAY_SIZE(hvm_sr_handlers) ||
> >> +             !(name = hvm_sr_handlers[desc->typecode].name) ||
> >> +             !(load = hvm_sr_handlers[desc->typecode].load) )
> >>          {
> >>              printk(XENLOG_G_ERR "HVM%d restore: unknown entry typecode %u\n",
> >>                     d->domain_id, desc->typecode);
> > 
> > The message is not very accurate here, it does fail when the typecode
> > is unknown, but also fails when such typecode has no name or load
> > function setup.
> 
> Yes and no, and it's not changing in this patch. Are you suggesting I should
> change it despite being unrelated? If so, there not being a name (which is
> the new check I'm adding) still suggests the code is unknown. There not being
> a load handler really indicates a bug in Xen (yet no reason to e.g. BUG() in
> that case, the failed loading will hopefully be noticeable enough).

Right, so not a lot of room for improvement anyway.  Let's leave as-is
then.

Thanks, Roger.

