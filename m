Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE3F86115F
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 13:19:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684840.1065004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdUVt-00036q-OJ; Fri, 23 Feb 2024 12:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684840.1065004; Fri, 23 Feb 2024 12:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdUVt-00034T-Lb; Fri, 23 Feb 2024 12:18:49 +0000
Received: by outflank-mailman (input) for mailman id 684840;
 Fri, 23 Feb 2024 12:18:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lysb=KA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rdUVs-00034K-2v
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 12:18:48 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b19f03d3-d245-11ee-8a57-1f161083a0e0;
 Fri, 23 Feb 2024 13:18:47 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-512db550e3fso1019888e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2024 04:18:47 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 d11-20020a0ce44b000000b0068efc28e3d3sm8114801qvm.45.2024.02.23.04.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 04:18:46 -0800 (PST)
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
X-Inumbo-ID: b19f03d3-d245-11ee-8a57-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708690726; x=1709295526; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H3KsMeY6NbpcuY/BnLd20nttKnCgOMyXNwdS9PjQ60A=;
        b=tpaf3pO5O6tsnajOjO6rmQ4myoHwP5eXhNp2x6ki1QsB6RyfQAHGexPT3SU8mEJA/i
         l7xgaLOWtOLAMsVHfXTUFV8W68AJF8re8s6cVBSR0Epw1j25m8xcb2BqCCqjnGg7Ek/C
         7upWOYl22rP1pJlr3Drt8Y+53jf5MFJhppv1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708690726; x=1709295526;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H3KsMeY6NbpcuY/BnLd20nttKnCgOMyXNwdS9PjQ60A=;
        b=NMDl2eLTfVUOV3Hwy8kKLcAn/u4o0HrlEe497F67Gdb07zuc81HriKaaBIzCJOkL7X
         gYrYHGJnmZDxnEOFJJu3Mj0ZoM3n/H2F8jbZZsFU0okheVP2KhVch+zQHBe+ffGp4k+H
         y/xTdCaiMAHSewr4ZiiW6umc5VWolo9/3/MQzl1r/dv1FXsVhpmOwZ0vIOVEyY2NHcOu
         zvNO0z/iSQiiryB1IXWkNqyNQvPVaFlepnJvZLGmENOikJiXbAlrtmyQ/v1gqkxH8WWF
         VlClg3PBxPBy98becMczjwrF+YmS7Fti4RLlwDrFk1HG4AFjuc5acqVzbngueTtLdiBV
         8zDw==
X-Forwarded-Encrypted: i=1; AJvYcCXH17oQqXyc2385ArVdkVNSrO/EvhOooT8QM4Y4GxrxIohgozKUQya0jOqMWWti6CgoFUM50edfYHrsQKtT+OqzANgbhUAZZtM3juvLcLU=
X-Gm-Message-State: AOJu0YysAEGtKaoxjDWPhxJljAHHWEoXEik1D2Arv25nvdQGrINnY5hm
	NtRx6a6wmJjV8BjHZk0MPjSgU9IczIlcbDQAkhZYjWTCADgKwAKRtTBlccznB6o=
X-Google-Smtp-Source: AGHT+IF9V3tSRHOCwWW57WGz4nvQvTlPP7uv6Tw47RmHw6bhHcXHhXLaOTPxbtOmc1zlMp5cTaDmJQ==
X-Received: by 2002:a05:6512:1093:b0:512:e704:44bc with SMTP id j19-20020a056512109300b00512e70444bcmr1284861lfg.23.1708690726414;
        Fri, 23 Feb 2024 04:18:46 -0800 (PST)
Date: Fri, 23 Feb 2024 13:18:44 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Matthew Grooms <mgrooms@shrew.net>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/altcall: use an union as register type for
 function parameters
Message-ID: <ZdiNJHErP1V-3CIi@macbook>
References: <20240222164455.67248-1-roger.pau@citrix.com>
 <b1c96b93-fd75-4077-b622-4781b7811ee8@suse.com>
 <ZdhjDBlHRtO4MIhM@macbook>
 <b62f223d-8baa-4d5b-aeba-9890c101b28c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b62f223d-8baa-4d5b-aeba-9890c101b28c@suse.com>

On Fri, Feb 23, 2024 at 11:43:14AM +0100, Jan Beulich wrote:
> On 23.02.2024 10:19, Roger Pau Monné wrote:
> > On Thu, Feb 22, 2024 at 05:55:00PM +0100, Jan Beulich wrote:
> >> On 22.02.2024 17:44, Roger Pau Monne wrote:
> >>> --- a/xen/arch/x86/include/asm/alternative.h
> >>> +++ b/xen/arch/x86/include/asm/alternative.h
> >>> @@ -167,9 +167,25 @@ extern void alternative_branches(void);
> >>>  #define ALT_CALL_arg5 "r8"
> >>>  #define ALT_CALL_arg6 "r9"
> >>>  
> >>> +#ifdef CONFIG_CC_IS_CLANG
> >>> +/*
> >>> + * Use an union with an unsigned long in order to prevent clang from skipping a
> >>> + * possible truncation of the value.  By using the union any truncation is
> >>> + * carried before the call instruction.
> >>> + * https://github.com/llvm/llvm-project/issues/82598
> >>> + */
> >>
> >> I think it needs saying that this is relying on compiler behavior not
> >> mandated by the standard, thus explaining why it's restricted to
> >> Clang (down the road we may even want to restrict to old versions,
> >> assuming they fix the issue at some point). Plus also giving future
> >> readers a clear understanding that if something breaks with this, it's
> >> not really a surprise.
> > 
> > What about:
> > 
> > Use a union with an unsigned long in order to prevent clang from
> > skipping a possible truncation of the value.  By using the union any
> > truncation is carried before the call instruction.
> 
> ..., in turn covering for ABI-non-compliance in that the necessary
> clipping / extension of the value is supposed to be carried out in
> the callee.
> 
> >  Note this
> > behavior is not mandated by the standard, and hence could stop being
> > a viable workaround, or worse, could cause a different set of
> > code-generation issues in future clang versions.
> > 
> > This has been reported upstream at:
> > https://github.com/llvm/llvm-project/issues/82598
> > 
> >> Aiui this bug is only a special case of the other, much older one, so
> >> referencing that one here too would seem advisable.
> > 
> > My report has been resolved as a duplicate of:
> > 
> > https://github.com/llvm/llvm-project/issues/43573
> > 
> > FWIW, I think for the context the link is used in (altcall) my bug
> > report is more representative, and readers can always follow the trail
> > into the other inter-related bugs.
> 
> While true, the comment extension suggested above goes beyond that
> territory, and there the other bug is quite relevant directly. After all
> what your change does is papering over a knock-on effect of them not
> following the ABI. And that simply because it is pretty hard to see how
> we could work around the ABI non-conformance itself (which btw could
> bite us if we had any affected C function called from assembly).
> 
> 43537 looks to be a newer instance of 12579; funny they didn't close
> that as a duplicate then, too.

So would you be OK with the following:

Use a union with an unsigned long in order to prevent clang from
skipping a possible truncation of the value.  By using the union any
truncation is carried before the call instruction, in turn covering
for ABI-non-compliance in that the necessary clipping / extension of
the value is supposed to be carried out in the callee.

Note this behavior is not mandated by the standard, and hence could
stop being a viable workaround, or worse, could cause a different set
of code-generation issues in future clang versions.

This has been reported upstream at:
https://github.com/llvm/llvm-project/issues/12579

Thanks, Roger.

