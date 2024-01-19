Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 947548327BD
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jan 2024 11:37:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669013.1041568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQmEY-0000hH-DJ; Fri, 19 Jan 2024 10:36:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669013.1041568; Fri, 19 Jan 2024 10:36:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQmEY-0000e9-AS; Fri, 19 Jan 2024 10:36:22 +0000
Received: by outflank-mailman (input) for mailman id 669013;
 Fri, 19 Jan 2024 10:36:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xVsr=I5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rQmEW-0000e3-FX
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2024 10:36:20 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93a7b922-b6b6-11ee-9b0f-b553b5be7939;
 Fri, 19 Jan 2024 11:36:17 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40e76626170so6616025e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jan 2024 02:36:17 -0800 (PST)
Received: from localhost ([213.195.127.68]) by smtp.gmail.com with ESMTPSA id
 l13-20020a05600c4f0d00b0040e85f86515sm10727027wmq.29.2024.01.19.02.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jan 2024 02:36:16 -0800 (PST)
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
X-Inumbo-ID: 93a7b922-b6b6-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705660577; x=1706265377; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OkNX3C0TN12r0U7CcA8mLbZGSp6Wpbhw+LSO24J1Tbk=;
        b=U0mBJnaWSnzasXjaDkIwK+j8cLKq4YKoge65b271dp8w6XdD3th9Zpb3+IaFLP8rpO
         sWHz8ojej/OvIy3E6nKwQ/EWZgBnlIiCVRy3slmlUjRLAOwj5DezmbD1LWC5sxFlsZpV
         KaZ+97tqSwBuJ7fw4pMT+Q124pBQubI/Jq94k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705660577; x=1706265377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OkNX3C0TN12r0U7CcA8mLbZGSp6Wpbhw+LSO24J1Tbk=;
        b=Yru1k6V4WWEd5vazsUWXdLwNv3v6vstcVRFNiW1tC8Po9EiqHWb4cRS1Ti+Q9VSA5s
         1wu15XhMfPYpE4A6sshK77YSK4nRWpn2JkmPDM5LyFYbDXgBcFDyWQKDcBB49U7szHuR
         DASPmH3emQtvsdVFutO8YyHgISDgcXvCnjewZOnhXmFbZ0eMSuYMcTk6l1qdsxlEaL4z
         uoRK+D8mmIiXkJy6j2yz22gNzpUB/j2JXiM4rbroJyMnY+9JfTCiWw/WhZ1MHeEEDSsr
         4GhYs+9f/928G6eFY5uLgUi8veaKHJ+fCqV2kf/effOlbYir0u0K0xez4VXkvzIUcBMY
         m76A==
X-Gm-Message-State: AOJu0YzM8ieYwGecqrP2H8rq5eLsosGqd4DfEY/nku/ojrhLyOE0j6tz
	h7QY+7Uh9UIZXr6JotYfbN2cIEB46u5fBEfiNIHSVLAHOeS1RqVzuwlfuujw6EY=
X-Google-Smtp-Source: AGHT+IHieupscha/52bP/1KWofRnJbrxxx2DMH8Hpf4xRUKOLgiS8i2iXzfCGviobgUowdu6XMhg3A==
X-Received: by 2002:a05:600c:2198:b0:40e:8789:a449 with SMTP id e24-20020a05600c219800b0040e8789a449mr1274330wme.121.1705660577174;
        Fri, 19 Jan 2024 02:36:17 -0800 (PST)
Date: Fri, 19 Jan 2024 11:36:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Bobby Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v5 8/8] common: honor CONFIG_CC_SPLIT_SECTIONS also for
 assembly functions
Message-ID: <ZapQoLSOKew5W-Tt@macbook>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <7a133ed9-9d13-4e2c-893a-00c083c8a35d@suse.com>
 <5df1d87d-8e54-4e15-b1fb-46b274cb66ef@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5df1d87d-8e54-4e15-b1fb-46b274cb66ef@suse.com>

On Mon, Jan 15, 2024 at 03:40:19PM +0100, Jan Beulich wrote:
> Leverage the new infrastructure in xen/linkage.h to also switch to per-
> function sections (when configured), deriving the specific name from the
> "base" section in use at the time FUNC() is invoked.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> TBD: Since we use .subsection in UNLIKELY_START(), a perhaps not really
>      wanted side effect of this change is that respective out-of-line
>      code now moves much closer to its original (invoking) code.

Hm, I'm afraid I don't have much useful suggestions here.

> TBD: Of course something with the same overall effect, but less
>      impactful might do in Config.mk. E.g. $(filter-out -D%,$(3))
>      instead of $(firstword (3)).

I don't have a strong opinion re those two options  My preference
however (see below for reasoning) would be to put this detection in
Kconfig.

> TBD: On top of Roger's respective patch (for livepatch), also respect
>      CONFIG_FUNCTION_ALIGNMENT.

I think you can drop that, as the series is blocked.

> Note that we'd need to split DATA() in order to separate r/w and r/o
> contributions. Further splitting might be needed to also support more
> advanced attributes (e.g. merge), hence why this isn't done right here.
> Sadly while a new section's name can be derived from the presently in
> use, its attributes cannot be. Perhaps the only thing we can do is give
> DATA() a 2nd mandatory parameter. Then again I guess most data
> definitions could be moved to C anyway.
> ---
> v5: Re-base over changes earlier in the series.
> v4: Re-base.
> v2: Make detection properly fail on old gas (by adjusting
>     cc-option-add-closure).
> 
> --- a/Config.mk
> +++ b/Config.mk
> @@ -102,7 +102,7 @@ cc-option = $(shell if $(1) $(2:-Wno-%=-
>  # Usage: $(call cc-option-add CFLAGS,CC,-march=winchip-c6)
>  cc-option-add = $(eval $(call cc-option-add-closure,$(1),$(2),$(3)))
>  define cc-option-add-closure
> -    ifneq ($$(call cc-option,$$($(2)),$(3),n),n)
> +    ifneq ($$(call cc-option,$$($(2)),$(firstword $(3)),n),n)
>          $(1) += $(3)
>      endif
>  endef
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -409,6 +409,9 @@ AFLAGS += -D__ASSEMBLY__
>  
>  $(call cc-option-add,AFLAGS,CC,-Wa$$(comma)--noexecstack)
>  
> +# Check to see whether the assmbler supports the --sectname-subst option.
> +$(call cc-option-add,AFLAGS,CC,-Wa$$(comma)--sectname-subst -DHAVE_AS_SECTNAME_SUBST)

I guess you already know what I'm going to comment on.  I think this
would be clearer if it was a Kconfig option.  For once because I think
we should gate livapatch support on the option being available, and
secondly it would avoid having to pass the extra -D around.

I think it's relevant to have a consistent set of build tool options
requirements for livepatch support, so that when enabled the support
is consistent across builds.  With this approach livepatch could be
enabled in Kconfig, but depending on the tools support the resulting
binary might or might not support live patching of assembly code.
Such behavior is IMO unhelpful from a user PoV, and can lead to
surprises down the road.

Thanks, Roger.

