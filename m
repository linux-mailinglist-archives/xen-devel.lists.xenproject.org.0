Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D541A783DD3
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 12:26:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588384.919896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYOaX-0003WU-UW; Tue, 22 Aug 2023 10:26:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588384.919896; Tue, 22 Aug 2023 10:26:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYOaX-0003U6-RD; Tue, 22 Aug 2023 10:26:17 +0000
Received: by outflank-mailman (input) for mailman id 588384;
 Tue, 22 Aug 2023 10:26:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0QVw=EH=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qYOaW-0003U0-Nk
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 10:26:16 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5269c09b-40d6-11ee-9b0c-b553b5be7939;
 Tue, 22 Aug 2023 12:26:14 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-31977ace1c8so3923664f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Aug 2023 03:26:14 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l13-20020a5d410d000000b003142e438e8csm15449156wrp.26.2023.08.22.03.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 03:26:13 -0700 (PDT)
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
X-Inumbo-ID: 5269c09b-40d6-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1692699974; x=1693304774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SKYeOORBZ1RJnca57QBYDVsctt9Qy/3uL0qeoMx/vcc=;
        b=StdNGFd4pVG/Pa8dL13kTxIP97eKDIIOhVgsmUv0mr4ky1HCg7/J/k7DtLZIHheTWW
         25SQYJ9HcoiJlb/TzgJDqY5MXlsqZw1D5Vsg/Ijmy44RqdvkN8ypyympChqMxNsQvNLz
         +T20OCG4u2tWj3lEfcC1j8ypmZZQ7He6Y54Wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692699974; x=1693304774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKYeOORBZ1RJnca57QBYDVsctt9Qy/3uL0qeoMx/vcc=;
        b=WzXfyQR1drjp8YuUxYPPmA1xw3QTUMmdiX0E8X28V3873FxIe7XKD86lw0zLeykIZV
         aDo0XZU1o/fpLexzJs9+OT1mI42ST/2UU9uWj97u5zoYhB75BclR5dJEQ+s6rUjyFEBw
         KsMjuPOgsqHZJO6qmxQpEPNWhWxry/RPMk+fNHE2yMgSEaVQ2aLMu9vtAwmQWVoPKgbm
         CDjsQwv9tQJgJto5MSjcak/dKq1DjKjb+3w3b3VBGHjZN5qcr4HezyynS70B7uYjxk3y
         e7AtV4FPxFLM0czUmoDcxP3O8KnZ1B1IMvEs889ND35sX9Fa3eDBK9zIanyXcEPtvICg
         dBAg==
X-Gm-Message-State: AOJu0Ywlkba2erMKqp6eOlFh7zi8D4nDJtYA2L0zHn1FndZjihmzH8ue
	/Y+1PgC4i5MPtbafatLH6lCwNnkHGeJkIhucmhjVVg==
X-Google-Smtp-Source: AGHT+IFLswrSj3VDOqj78mvZi5n4OncOfAJbxrKZ+Ej09Ub1HdNycPHI/Dl+40twUz7iSdYMu1JG0A==
X-Received: by 2002:adf:f6cc:0:b0:313:fbd0:9813 with SMTP id y12-20020adff6cc000000b00313fbd09813mr5868160wrp.28.1692699973995;
        Tue, 22 Aug 2023 03:26:13 -0700 (PDT)
Date: Tue, 22 Aug 2023 11:26:13 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 1/5] build: make cc-option properly deal with
 unrecognized sub-options
Message-ID: <917c0f5f-f664-4631-9464-29f22d61a05c@perard>
References: <10ce72fb-4fb7-67de-41ec-7291dbac0038@suse.com>
 <60da37cf-abec-be58-d433-e98eec0c59bd@suse.com>
 <9dd1134b-8bc8-4fea-a2d7-dd20bd6af9c5@perard>
 <7aa1ecac-6978-ef52-ccad-a71ff878e42a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7aa1ecac-6978-ef52-ccad-a71ff878e42a@suse.com>

On Wed, Aug 16, 2023 at 08:06:52AM +0200, Jan Beulich wrote:
> On 11.08.2023 15:48, Anthony PERARD wrote:
> > But isn't it doing doing pattern matching on an error message going to
> > lead sometime to false positive? Linux's build system seems to works
> > fine by just using the exit value. They've got a few trick to deal with
> > -Wno-* and with clang.
> > 
> > For -Wno-$(warning), they test -W$(warning) instead. For clang, they've
> > enable additional warnings:
> >     -Werror=unknown-warning-option
> >     -Werror=ignored-optimization-argument
> >     -Werror=option-ignored
> >     -Werror=unused-command-line-argument
> 
> I think using just -Werror is going to be enough. The completely changed

Yes, looks like -Werror is enough. I'm not sure why Linux has them
because they tests flags with -Werror in most cases.

> patch below appears to be doing fine, but of course requires me to drop
> ...
> 
> > In any case, the patch is fine.
> > Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> ... this.
> 
> Jan
> 
> --- a/Config.mk
> +++ b/Config.mk
> @@ -81,17 +81,17 @@ PYTHON_PREFIX_ARG ?= --prefix="$(prefix)
>  
>  # cc-option: Check if compiler supports first option, else fall back to second.
>  #
> -# This is complicated by the fact that unrecognised -Wno-* options:
> +# This is complicated by the fact that with most gcc versions unrecognised
> +# -Wno-* options:
>  #   (a) are ignored unless the compilation emits a warning; and
>  #   (b) even then produce a warning rather than an error
> -# To handle this we do a test compile, passing the option-under-test, on a code
> -# fragment that will always produce a warning (integer assigned to pointer).
> -# We then grep for the option-under-test in the compiler's output, the presence
> -# of which would indicate an "unrecognized command-line option" warning/error.
> +# Further Clang also only warns for unrecognised -W* options.  To handle this
> +# we do a test compile, substituting -Wno-* by -W* and adding -Werror.  This
> +# way all unrecognised options are diagnosed uniformly, allowing us to merely
> +# check exit status.
>  #
>  # Usage: cflags-y += $(call cc-option,$(CC),-march=winchip-c6,-march=i586)
> -cc-option = $(shell if test -z "`echo 'void*p=1;' | \
> -              $(1) $(2) -c -o /dev/null -x c - 2>&1 | grep -- $(2:-Wa$(comma)%=%) -`"; \
> +cc-option = $(shell if $(1) $(2:-Wno-%=-W%) -Werror -c -o /dev/null -x c /dev/null >/dev/null 2>&1; \
>                then echo "$(2)"; else echo "$(3)"; fi ;)

I've try to compare the result of cc-option with and without this change
in the gitlab CI, and it seems that the result is the same for the flags
we tests. So this change looks fine:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

