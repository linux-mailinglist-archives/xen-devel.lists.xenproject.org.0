Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 316D28C76CC
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 14:46:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723294.1128017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7aUG-0000AC-QT; Thu, 16 May 2024 12:45:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723294.1128017; Thu, 16 May 2024 12:45:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7aUG-00006l-Nd; Thu, 16 May 2024 12:45:32 +0000
Received: by outflank-mailman (input) for mailman id 723294;
 Thu, 16 May 2024 12:45:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h+4+=MT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s7aUF-00006f-8Y
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 12:45:31 +0000
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com
 [2607:f8b0:4864:20::932])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d1cf653-1382-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 14:45:30 +0200 (CEST)
Received: by mail-ua1-x932.google.com with SMTP id
 a1e0cc1a2514c-7f79ef6704eso2222600241.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 05:45:30 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f1d8e7dsm75303776d6.121.2024.05.16.05.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 05:45:27 -0700 (PDT)
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
X-Inumbo-ID: 2d1cf653-1382-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715863529; x=1716468329; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xJ6WrOoPMYCYkS5FRW7xUJVq0lN7VWF/Dq61F4trvd4=;
        b=LFvI9407nWhI3ZJAhfCwRpeiH2072NPRihNYtcr8HbiHZRxNBHD3WBv/xHLL0XjNSP
         JAz1+Vl610zghhwadxBFshH9DqrIAc0hiMttRX+c5Gv9/QAv1oUHkCHigSpXSxiIFqzL
         OqXTCsO74tF6NlD6Et9Cxsjb4DTsbxrgBK108=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715863529; x=1716468329;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xJ6WrOoPMYCYkS5FRW7xUJVq0lN7VWF/Dq61F4trvd4=;
        b=kZyDebSw7XLiaomZV2YI08V09N9t4HZzhD/cIOKWO9kYx7qBMtZsCFnHu1DtMFzKkC
         TwdPI8hqco2k8EwlS/Us9C4YtMhlGo3dZruLoLlxD+BvPQ47gJoqTeqQMWMu/Ffjrl5g
         znypil8rFO4DtRmfbjnS6yQoKaurkF90SzxORyt+X7OcBfOSf8dt9ntOresgn4Hc3T6C
         x0JZc6lXtE+mBSnvJ4A86R+N5QbVvvRkx+uEwkzdWJ7lIZIEwPHOBY04RrLk5OGjPXsY
         kvD1+rwFEGi3D3t9CsI0/W4bbaLRHJaLUyahZCvwJs+Z9K66C6/GuskpxEujWnNkWxb5
         72Ng==
X-Gm-Message-State: AOJu0YzxQRA7c8GmW3OlOijlW+wfxFXuZhBpBTHsHuVmoZ8Fmtanq3EB
	9FBc4xf+/jwBzB5fR3nYSiC8t/vEAaziMH4hMBzuW5CY+XCGWleMnV6u5bK4WOg=
X-Google-Smtp-Source: AGHT+IEt8MsvWBDLChCZDq1yp4DaJRjvXNKsK064s9UQXVewO8sJSoWFqWQQxDQB9ejDq+nXWOEMcA==
X-Received: by 2002:a05:6122:4595:b0:4ca:80c5:753d with SMTP id 71dfb90a1353d-4df8829f482mr17125759e0c.4.1715863527550;
        Thu, 16 May 2024 05:45:27 -0700 (PDT)
Date: Thu, 16 May 2024 14:45:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Fouad Hilly <fouad.hilly@cloud.com>
Subject: Re: [PATCH] x86/ucode: Further fixes to identify "ucode already up
 to date"
Message-ID: <ZkX_5W-b2J6eR7Py@macbook>
References: <20240516113103.3018940-1-andrew.cooper3@citrix.com>
 <ZkXzFwbYfFI6DeP8@macbook>
 <4bc4f2f5-6914-445a-a9a1-a609c0c3cf1f@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4bc4f2f5-6914-445a-a9a1-a609c0c3cf1f@citrix.com>

On Thu, May 16, 2024 at 01:30:21PM +0100, Andrew Cooper wrote:
> On 16/05/2024 12:50 pm, Roger Pau Monné wrote:
> > On Thu, May 16, 2024 at 12:31:03PM +0100, Andrew Cooper wrote:
> >> When the revision in hardware is newer than anything Xen has to hand,
> >> 'microcode_cache' isn't set up.  Then, `xen-ucode` initiates the update
> >> because it doesn't know whether the revisions across the system are symmetric
> >> or not.  This involves the patch getting all the way into the
> >> apply_microcode() hooks before being found to be too old.
> >>
> >> This is all a giant mess and needs an overhaul, but in the short term simply
> >> adjust the apply_microcode() to return -EEXIST.
> >>
> >> Also, unconditionally print the preexisting microcode revision on boot.  It's
> >> relevant information which is otherwise unavailable if Xen doesn't find new
> >> microcode to use.
> >>
> >> Fixes: 648db37a155a ("x86/ucode: Distinguish "ucode already up to date"")
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> ---
> >> CC: Jan Beulich <JBeulich@suse.com>
> >> CC: Roger Pau Monné <roger.pau@citrix.com>
> >> CC: Fouad Hilly <fouad.hilly@cloud.com>
> >>
> >> Sorry Fouad, but this collides with your `--force` series once again.
> >> Hopefully it might make things fractionally easier.
> >>
> >> Background: For 06-55-04 (Skylake server, stepping 4 specifically), there's a
> >> recent production firmware update which has a newer microcode revision than
> >> exists in the Intel public microcode repository.  It's causing a mess in our
> >> automated testing, although it is finding good bugs...
> >> ---
> >>  xen/arch/x86/cpu/microcode/amd.c   | 7 +++++--
> >>  xen/arch/x86/cpu/microcode/core.c  | 2 ++
> >>  xen/arch/x86/cpu/microcode/intel.c | 7 +++++--
> >>  3 files changed, 12 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
> >> index 17e68697d5bf..f76a563c8b84 100644
> >> --- a/xen/arch/x86/cpu/microcode/amd.c
> >> +++ b/xen/arch/x86/cpu/microcode/amd.c
> >> @@ -222,12 +222,15 @@ static int cf_check apply_microcode(const struct microcode_patch *patch)
> >>      uint32_t rev, old_rev = sig->rev;
> >>      enum microcode_match_result result = microcode_fits(patch);
> >>  
> >> +    if ( result == MIS_UCODE )
> >> +        return -EINVAL;
> >> +
> >>      /*
> >>       * Allow application of the same revision to pick up SMT-specific changes
> >>       * even if the revision of the other SMT thread is already up-to-date.
> >>       */
> >> -    if ( result != NEW_UCODE && result != SAME_UCODE )
> >> -        return -EINVAL;
> >> +    if ( result == OLD_UCODE )
> >> +        return -EEXIST;
> > Won't it be simpler to just add this check ahead of the existing one,
> > so that you can leave the code as-is, iow:
> >
> >     if ( result == OLD_UCODE )
> >         return -EEXIST;
> >
> >     /*
> >      * Allow application of the same revision to pick up SMT-specific changes
> >      * even if the revision of the other SMT thread is already up-to-date.
> >      */
> >     if ( result != NEW_UCODE && result != SAME_UCODE )
> >         return -EINVAL;
> >
> > Thanks, Roger.
> 
> Not really, no.  That still leaves this piece of logic which is
> misleading IMO.
> 
> MIS_UCODE is the only -EINVAL worthy case.
> 
> Every other *_UCODE constant needs to be 0 or -EEXIST, depending on
> allow-same/--force.

OK, my main concern was the previous logic wouldn't allow a newly
introduced state to get past the return -EINVAL, while the new logic
could possibly allow it to pass through.

I don't think adding states is that common, and if you prefer it that
way it's fine.

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

