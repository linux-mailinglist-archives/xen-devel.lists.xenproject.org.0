Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39431A984D1
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 11:08:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964282.1355124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7W56-0006lJ-9x; Wed, 23 Apr 2025 09:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964282.1355124; Wed, 23 Apr 2025 09:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7W56-0006iP-73; Wed, 23 Apr 2025 09:07:48 +0000
Received: by outflank-mailman (input) for mailman id 964282;
 Wed, 23 Apr 2025 09:07:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s+1X=XJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u7W55-0006iJ-HR
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 09:07:47 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c2d202b-2022-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 11:07:46 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso39936185e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 02:07:46 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-44092d35672sm18180075e9.25.2025.04.23.02.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 02:07:45 -0700 (PDT)
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
X-Inumbo-ID: 6c2d202b-2022-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745399266; x=1746004066; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dyba/r8Hq/bFmhw85vbT1PGniFUm6V3l4UnHwxolVho=;
        b=mo/1KPkHrfWrvVPzCBhn20IeJNmUlootWIVSHyFPqlZfGgmAiPcvzoKxZlhP9a3cqx
         ZGU0kOtxYyF5XxdpzADXZIoPqlHMFnWyE3giWWU0M0wh/9cxiFWIT/H9hiaUJtJ8f/kp
         Xy32HKABYMmIyS6a8aRNnK+TkgvADM1UqrbTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745399266; x=1746004066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dyba/r8Hq/bFmhw85vbT1PGniFUm6V3l4UnHwxolVho=;
        b=c36wWVtexMc/xGfuFKvmODZ7ZNnUYO1OKIkRLv23+1AlkbOsmsg16i/COiLp/aUJIr
         tfnmxENQvrJcgvjpNhxMeKco5zr5NvBA46irNuzojF1E94ctClZt2QilfbGsKU/ZAQFo
         jjiUGfrg/RTcFLZmum5jGrhUgLgkye3QyNvYMq6UOVOyjHDZ+mOFIbime0Kg+4ytbyRO
         95Hw70gTRx0edahfDhk7OTF8gVQnyhgtnGid+J9usvPuTjWdOUiJXAgaj9dEa7dSWD16
         iOxpI7/uBxRFhxtX3begZhaaCQj3C2jH+FzWrA65ZO/hqg2KByAxH2d6p762XIssFQeX
         NDww==
X-Gm-Message-State: AOJu0YzxIJcEjLggYu8td2FpkCKxAOW7qnimvVBDtH3wucu2ExWeZB3X
	nwf+QlCeLzFkxD+r7nA7x6tb3eYTdxKZAlmDGH7rM6AGV3lblGgWmFJ19VrqASM=
X-Gm-Gg: ASbGncsb1Sx1sX2KrL0O73JyqINC0+M2T/HaiXK02wydAAUKJKM1mY/q6BxMMlU84ZA
	VIX677T5LMOUckv76/aTXMwGDm2JC83TKZnDKeknBI/+t5je7qQONz2Zj/jqicHnKmGBhvfNYPO
	4IW584ZeI/GOXg/5i66B6WJcGgtFYPZLo3b3ohWkonfyI36kbOt3iO5Yb9ZJLnV6aXnHiVUiqE+
	y+Xcmt7BHw0tOWmjg4iUUrAXxXe6383xzbg9yBECk/+qCvzybrmjcwCH00uxzp7V4DIPpsxNZM4
	Hl31FBy1lHVc+FgDXgpa9l/+rRHlyHJtAqkDPB/GlAhxWA==
X-Google-Smtp-Source: AGHT+IFXXOSdBjiLnHMgavBi//E9Sa4ZdVqxgoFdJX7tJHsJgMpsWesNHBSQZy9hrMow3MLpVFAf8g==
X-Received: by 2002:a05:600c:548e:b0:43d:a90:9f1 with SMTP id 5b1f17b1804b1-4406ab67708mr140844325e9.6.1745399265956;
        Wed, 23 Apr 2025 02:07:45 -0700 (PDT)
Date: Wed, 23 Apr 2025 11:07:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] x86: constrain sub-page access length in
 mmio_ro_emulated_write()
Message-ID: <aAit4IPZju60KEUz@macbook.lan>
References: <570ad3f2-7f3b-4579-a000-c85d27e8bf77@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <570ad3f2-7f3b-4579-a000-c85d27e8bf77@suse.com>

On Wed, Apr 23, 2025 at 10:43:56AM +0200, Jan Beulich wrote:
> Without doing so we could trigger the ASSERT_UNREACHABLE() in
> subpage_mmio_write_emulate(). A comment there actually says this
> validation would already have been done ...
> 
> Fixes: 8847d6e23f97 ("x86/mm: add API for marking only part of a MMIO page read only")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Alternatively we could drop comment and assertion from
> subpage_mmio_write_emulate().

I think I prefer this as it fits better with my patch to unify the
open-coded MMIO accessors, which does have an ASSERT_UNREACHABLE() for
unhandled sizes.  The return there is anyway too late IMO, as we have
possibly already mapped the page when there's no need for it.

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -5195,8 +5195,9 @@ int cf_check mmio_ro_emulated_write(
>          return X86EMUL_UNHANDLEABLE;
>      }
>  
> -    subpage_mmio_write_emulate(mmio_ro_ctxt->mfn, PAGE_OFFSET(offset),
> -                               p_data, bytes);
> +    if ( bytes <= 8 )
> +        subpage_mmio_write_emulate(mmio_ro_ctxt->mfn, PAGE_OFFSET(offset),
> +                                   p_data, bytes);

Should we print a debug message here saying the write is possibly
unhandled due to the access size if subpage r/o is enabled?

You might want to re-use the subpage_ro_active() I introduce to limit
the printing of the message.

Thanks, Roger.

