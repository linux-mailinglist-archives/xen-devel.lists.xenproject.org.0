Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC78A1B271
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 10:17:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876624.1286976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbFnr-0007RV-2P; Fri, 24 Jan 2025 09:16:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876624.1286976; Fri, 24 Jan 2025 09:16:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbFnq-0007Q2-Vl; Fri, 24 Jan 2025 09:16:38 +0000
Received: by outflank-mailman (input) for mailman id 876624;
 Fri, 24 Jan 2025 09:16:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AkuS=UQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tbFnp-0007Pw-Lq
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2025 09:16:37 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7a4ccb9-da33-11ef-a0e5-8be0dac302b0;
 Fri, 24 Jan 2025 10:16:33 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ab2b29dfc65so301669366b.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jan 2025 01:16:33 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab675e6790bsm97248166b.63.2025.01.24.01.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 01:16:32 -0800 (PST)
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
X-Inumbo-ID: e7a4ccb9-da33-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737710193; x=1738314993; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kbPtAH9ZMOxDBaDDxqcnEfFRDOrWtvleAjEuxXHtuuE=;
        b=RupBwn3ZLGnlGx0CeWMNACdg2h/8dl4HH2ZjHmYI7udI2GJ1Vb/6mwly2KRhU81h+y
         +KA1z3RcuVPeu+WOGFK+m9BfH+Q7h87SxJvbYHGkruVzBqg2gDyDKgTJ1fAAwgVy+ohz
         2wCH8d3uO962Eipll/y7kdqzHVzcsb8/3MdIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737710193; x=1738314993;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kbPtAH9ZMOxDBaDDxqcnEfFRDOrWtvleAjEuxXHtuuE=;
        b=XtpkJnOIMIJosvLhCkDNCMy4R9xA5nrCrrcsHFBEEa8ZVrlmf1fSRGpTKr43RgfvDY
         LZFEV3RPRKBzwuwiaJjUiSGiPwNd6P4rcKK8zJi3azLkslKfVhgStU2AGMyEFcWR64FR
         wjjPiplytzG3rL6yIfyMvsXSJsgM/DJ9mlpD3wdq4S6REnBhSEL/xJLn9sqKS9dv+2pI
         xVMJu0VDY6TjGllKJ14yauOeB5VD/l4HN5pgqycmtnOIoVeS0GbaJignAGeRjN8h8kzR
         RY6Y14+x35jiwPTz/Q786lbusDTqJ/g4arBaj+DZZtq2RfMEbonvjhELpkRpQx1fGL8x
         cKQA==
X-Gm-Message-State: AOJu0YyLXB615AReq9J6zN12QpRTI8Q0Lp2bzLKvMoVj7LT6wt+KOjv+
	oRkGNf4ZgvFvhedhFGjzt0JZ3dggLo5XIYQ+agOp2/2o+Z7Ne+PjytDygzp3eVM=
X-Gm-Gg: ASbGncs8JE/z4edd4fkHpLPPLNLBUI8AB45E/vq8NAPmPl/AqYx+UoUrW0O+hYKmo8D
	9zwZJNkZCXR+QixUp6ut95geRRIBltCRfcVI2ruIelpWaXAHBR8jf8o7fmyfn8stKTgJOw0mhFn
	4oEHmm9skaNg4MNuQjpipr5/je/7CL1Yqti74+7/qGstfP0Jum8E5Olp5CleIaEHWpNhPSNa08o
	KPBXQrxg//5OowEiuEmN88mJUCM9zzz1qH0kNINa4xSBBhJXFZfkmIyr9e6CABp2iA+SbWULuQV
	SfGM3tzr6BnFTSA=
X-Google-Smtp-Source: AGHT+IFX0PvntvqjF6O1EoqNi9G2SFAfcl0Ta2PMKTb7GWpvTN5WYdAeKB0HTF1OHh00sbE9AhRUuA==
X-Received: by 2002:a17:906:7956:b0:aae:fb7c:50df with SMTP id a640c23a62f3a-ab38b36be2bmr2891029166b.36.1737710193175;
        Fri, 24 Jan 2025 01:16:33 -0800 (PST)
Date: Fri, 24 Jan 2025 10:16:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>
Subject: Re: [PATCH v3 02/12] x86/HVM: improve CET-IBT pruning of ENDBR
Message-ID: <Z5Nab7X6l9McxFw2@macbook.local>
References: <293e5aef-8843-461c-bc96-709a605b2680@suse.com>
 <537b0d9c-1936-4cf5-a012-d50b1097a22d@suse.com>
 <Z5I5D_uVxijLF6sK@macbook.local>
 <f0e2a3f3-3081-414d-824c-bf940134aece@suse.com>
 <Z5JRGwA51lOs65t5@macbook.local>
 <8aa7c377-b664-4786-b671-deff1601ac5f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8aa7c377-b664-4786-b671-deff1601ac5f@suse.com>

On Thu, Jan 23, 2025 at 05:14:39PM +0100, Jan Beulich wrote:
> On 23.01.2025 15:24, Roger Pau Monné wrote:
> > On Thu, Jan 23, 2025 at 02:18:41PM +0100, Jan Beulich wrote:
> >> On 23.01.2025 13:41, Roger Pau Monné wrote:
> >>> On Mon, Feb 26, 2024 at 05:42:20PM +0100, Jan Beulich wrote:
> >>>> --- a/xen/arch/x86/hvm/hvm.c
> >>>> +++ b/xen/arch/x86/hvm/hvm.c
> >>>> @@ -161,10 +161,15 @@ static int __init cf_check hvm_enable(vo
> >>>>      else if ( cpu_has_svm )
> >>>>          fns = start_svm();
> >>>>  
> >>>> +    if ( fns )
> >>>> +        hvm_funcs = *fns;
> >>>> +
> >>>> +    prune_vmx();
> >>>> +    prune_svm();
> >>>
> >>> Isn't it actually the opposite of pruning.  What the helpers do is
> >>> fill all the pointers in the structure.
> >>
> >> With the goal of their ENDBR to then be pruned. I agree though that the
> >> functions don't do any pruning themselves. Yet
> >> {svm,vmx}_prepare_for_cet_ibt_pruning() is a little awkward for my taste
> >> (although it would properly document the purpose). Plus ...
> >>
> >>>  I would rather name them {vmx,svm}_fill_hvm_funcs() or similar.
> >>
> >> ... while I can use those names (perhaps without the "hvm" infix), the
> >> present names have the advantage that any other pruning that we may
> >> find desirable could also be put there. Hence also why the cpu_has_*
> >> checks live there.
> > 
> > Hm, I'm unsure.  What else do you see becoming part of those
> > functions?  It's hard for me to suggest a name when it's unclear what
> > future logic do you think they could contain.
> 
> Prior to IBT it wasn't foreseeable any pruning might be needed. We're
> in a similar position now: We simply can't know whether anything else
> is going to be needed there.
> 
> > Given the current code I still think something that contains 'fill' or
> > similar is way more appropriate, the more if the IBT check is pulled
> > out into the caller.
> 
> As indicated, I'd prefer the IBT check to remain in the function. But
> yes, I'll see about renaming. If ever other stuff wants adding there,
> we can surely rename another time.
> 
> >>>  And possibly pull the
> >>> cpu_has_xen_ibt check outside the functions:
> >>>
> >>> if ( cpu_has_xen_ibt )
> >>> {
> >>>     /*
> >>>      * Now that svm_function_table was copied, populate all function pointers
> >>>      * which may have been left at NULL, for __initdata_cf_clobber to have as
> >>>      * much of an effect as possible.
> >>>      */
> >>>     vmx_fill_hvm_funcs();
> >>>     svm_fill_hvm_funcs();
> >>> }
> >>
> >> Which would leave the SVM function entirely empty.
> > 
> > You could possible declare it as an static inline in the hvm.h header
> > for the time being?
> > 
> >> The intention was for
> >> that to not be the case, and also for the comment you have added above
> >> to also live in the per-vendor functions.
> > 
> > Isn't that a bit redundant?  I would prefer to not have duplicated
> > comments over the code, hence my suggestion to place part of the logic
> > in the caller.
> 
> In this case I view the redundancy as necessary. You want to know what
> to add to the functions when you look at them, irrespective of whether
> you also look at their caller.

OK, I won't oppose to it, but I do think function names need
adjusting.

Thanks, Roger.

