Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 507768C757B
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 13:51:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723230.1127906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ZdO-00042W-76; Thu, 16 May 2024 11:50:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723230.1127906; Thu, 16 May 2024 11:50:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ZdO-00040a-4E; Thu, 16 May 2024 11:50:54 +0000
Received: by outflank-mailman (input) for mailman id 723230;
 Thu, 16 May 2024 11:50:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h+4+=MT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s7ZdM-0003z0-NO
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 11:50:52 +0000
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [2607:f8b0:4864:20::833])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8aaba0b9-137a-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 13:50:51 +0200 (CEST)
Received: by mail-qt1-x833.google.com with SMTP id
 d75a77b69052e-43df44ef3e3so31621331cf.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 04:50:51 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43df56b32c8sm95749471cf.77.2024.05.16.04.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 04:50:49 -0700 (PDT)
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
X-Inumbo-ID: 8aaba0b9-137a-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715860250; x=1716465050; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TmQDnGpTJoPIGtRonZuWFNkU/cBlfrWhnFK1NH1oGFc=;
        b=HTtx+A5by6VlyjSwIS68h6tPdGGBgLh1IjPUJAIVI8jgX2GMysi0A31ZFz2vrnoNiB
         9qAppv11UmZuwfIPKltpbK+kTcRz8AQW4J+qMkH5GtI7GZxvkSz1nfxZzJqsBOX4SGkn
         Up8eMKQF/hKNuuramAA+xEVuBYys6j1eL+dxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715860250; x=1716465050;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TmQDnGpTJoPIGtRonZuWFNkU/cBlfrWhnFK1NH1oGFc=;
        b=Kybu7vxhFGcRiG9MuJgHcdj5H9KDPG99jFpSK44kKLDm4mmhyu3l6fUWh854Z8+ST1
         ZurKGJYmUY50RG/5qWhCIz3mRpcm5n1AF+hROL0bGC53rDmuz41n4W+MZqVpUyOiabXw
         X9mVA/N2awuCuf6BsyxuSJcKOiCHn4TS5xv4Kl1FGUSuMf61BCkZkzB4UR0scrl0nNxM
         C9G90/WpKjbhM254aTwzKDkE7F0jjFwhARQiyy3LVPhOpkBT0xHRK0kiSmW/crf/Mw80
         TymmzBPr037jKpY8IIGVOEPFCQe8zj3n2MMkW2atb/cEa2tVlI4FoMVo+7r+KfBgtM9G
         jcPw==
X-Gm-Message-State: AOJu0YzEOoUtE+ulhUiMKhThgbeXjkBCIT4Q+4G4CdW4wiYs+z8Hgkfg
	MWNCqaHwB7073XM6A0ERfgG4SO9rThuu7QqOAhjRLcACIBWotRH02AYCKmBUy40=
X-Google-Smtp-Source: AGHT+IFZoYT+RdWncCaxy3+YEbZj7r549kxO+RLlRUpZQkbxFnfUbMqnMSR/SXGO5njo5lOg1FLhNg==
X-Received: by 2002:ac8:5dd0:0:b0:43e:3da7:b39e with SMTP id d75a77b69052e-43e3da7b40amr15101541cf.65.1715860250458;
        Thu, 16 May 2024 04:50:50 -0700 (PDT)
Date: Thu, 16 May 2024 13:50:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Fouad Hilly <fouad.hilly@cloud.com>
Subject: Re: [PATCH] x86/ucode: Further fixes to identify "ucode already up
 to date"
Message-ID: <ZkXzFwbYfFI6DeP8@macbook>
References: <20240516113103.3018940-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240516113103.3018940-1-andrew.cooper3@citrix.com>

On Thu, May 16, 2024 at 12:31:03PM +0100, Andrew Cooper wrote:
> When the revision in hardware is newer than anything Xen has to hand,
> 'microcode_cache' isn't set up.  Then, `xen-ucode` initiates the update
> because it doesn't know whether the revisions across the system are symmetric
> or not.  This involves the patch getting all the way into the
> apply_microcode() hooks before being found to be too old.
> 
> This is all a giant mess and needs an overhaul, but in the short term simply
> adjust the apply_microcode() to return -EEXIST.
> 
> Also, unconditionally print the preexisting microcode revision on boot.  It's
> relevant information which is otherwise unavailable if Xen doesn't find new
> microcode to use.
> 
> Fixes: 648db37a155a ("x86/ucode: Distinguish "ucode already up to date"")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Fouad Hilly <fouad.hilly@cloud.com>
> 
> Sorry Fouad, but this collides with your `--force` series once again.
> Hopefully it might make things fractionally easier.
> 
> Background: For 06-55-04 (Skylake server, stepping 4 specifically), there's a
> recent production firmware update which has a newer microcode revision than
> exists in the Intel public microcode repository.  It's causing a mess in our
> automated testing, although it is finding good bugs...
> ---
>  xen/arch/x86/cpu/microcode/amd.c   | 7 +++++--
>  xen/arch/x86/cpu/microcode/core.c  | 2 ++
>  xen/arch/x86/cpu/microcode/intel.c | 7 +++++--
>  3 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
> index 17e68697d5bf..f76a563c8b84 100644
> --- a/xen/arch/x86/cpu/microcode/amd.c
> +++ b/xen/arch/x86/cpu/microcode/amd.c
> @@ -222,12 +222,15 @@ static int cf_check apply_microcode(const struct microcode_patch *patch)
>      uint32_t rev, old_rev = sig->rev;
>      enum microcode_match_result result = microcode_fits(patch);
>  
> +    if ( result == MIS_UCODE )
> +        return -EINVAL;
> +
>      /*
>       * Allow application of the same revision to pick up SMT-specific changes
>       * even if the revision of the other SMT thread is already up-to-date.
>       */
> -    if ( result != NEW_UCODE && result != SAME_UCODE )
> -        return -EINVAL;
> +    if ( result == OLD_UCODE )
> +        return -EEXIST;

Won't it be simpler to just add this check ahead of the existing one,
so that you can leave the code as-is, iow:

    if ( result == OLD_UCODE )
        return -EEXIST;

    /*
     * Allow application of the same revision to pick up SMT-specific changes
     * even if the revision of the other SMT thread is already up-to-date.
     */
    if ( result != NEW_UCODE && result != SAME_UCODE )
        return -EINVAL;

Thanks, Roger.

