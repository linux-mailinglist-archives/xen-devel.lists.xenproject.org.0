Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C886A8AA91F
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 09:26:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708811.1107960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxid5-0005sZ-2q; Fri, 19 Apr 2024 07:25:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708811.1107960; Fri, 19 Apr 2024 07:25:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxid5-0005qB-07; Fri, 19 Apr 2024 07:25:51 +0000
Received: by outflank-mailman (input) for mailman id 708811;
 Fri, 19 Apr 2024 07:25:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o3Bi=LY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rxid3-0005q5-M8
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 07:25:49 +0000
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [2607:f8b0:4864:20::72b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a5a27da-fe1e-11ee-94a3-07e782e9044d;
 Fri, 19 Apr 2024 09:25:47 +0200 (CEST)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-78f0593f45dso115004485a.2
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 00:25:47 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 m2-20020ae9f202000000b0078d5d9cdc9esm1375821qkg.21.2024.04.19.00.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 00:25:46 -0700 (PDT)
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
X-Inumbo-ID: 0a5a27da-fe1e-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713511546; x=1714116346; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p219J85QtVCKpbJViwzFHa3A0XI0Y8RkJv1mCEPFp48=;
        b=RPsR4JlSt+zHDqcoxGv3GBpVFh8r1ckVAlpSU0UR81YyZ3WtNSadKSlcWX6+bGkadG
         fijep8nnxckeb7idgAVi7TEL4HmsOy3mAHrJZlqnCzw8UBjCbZUyDueO1uDMPtdqXiT0
         CgpN8GAgzJ+AOK6XYAtG64MVmygr7LpK8YmVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713511546; x=1714116346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p219J85QtVCKpbJViwzFHa3A0XI0Y8RkJv1mCEPFp48=;
        b=WhW53MgcjLuBkaqnJWwRh+tpCtVmMqU35fcsNCFKdlftT1em8TH+GMcFXCgCuSYT3I
         Rh6cxHvyrlEoZ6/ZP1ZEAVHrjLnEN+bh+LnhNxB4Zk1wp/fZ9cryCJOJNmCUAZRow6c/
         715g2SZ7744xF/A47Lm/mP0OSCFiSiYKnDXjh5HcPZCOn3XYavLb7/wZa1TiCZJfb2kk
         4+EAEkcuKw7MxAKBeHDl3gPujNstHOwQNDNbqGojItm9YiGDStNrk8tC0YredyiORUJ+
         ZPWntT+kQxzBRb3H07P/XN7Fs8JSTR2saKcjYom0BrFgQ0eYkRVQayIgX4N9FUnLl6tm
         f2sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzJMfNIAcdo7Xp6SL07GYiZmNyCZOy2YxjaFBce6dtZRVcpWgPcxyemQypiWU+U+VuFgr77hwQD2hxbArjEgR1m0BDcWq0zwWSsfUDvjY=
X-Gm-Message-State: AOJu0Yz1FyYgol7GsLT3gPtcpDkbr834q3Zi9oo1A5ncZsGBhIhx7aA7
	LaiMhSPL9A7zD8LOVFKjG9PHyIV/Ja3sh/ulp91EkrgXO3kNGDyx6qN8K2Ww260=
X-Google-Smtp-Source: AGHT+IGB1BUc2ENtNcD0w+5LIm6Sc72FAzpIyIf7/s2OKEWLYPcvSLJBGkAkAn0LHQoSx2CG+zdabw==
X-Received: by 2002:a05:620a:361f:b0:78f:1b0a:c052 with SMTP id da31-20020a05620a361f00b0078f1b0ac052mr683209qkb.14.1713511546577;
        Fri, 19 Apr 2024 00:25:46 -0700 (PDT)
Date: Fri, 19 Apr 2024 09:25:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] x86/video: add boot_video_info offset generation to
 asm-offsets
Message-ID: <ZiIcdzOXPlpFvkOn@macbook>
References: <20240328153523.4155-1-roger.pau@citrix.com>
 <20240328153523.4155-2-roger.pau@citrix.com>
 <473870c9-1134-4f17-b063-68ac93ad28e0@suse.com>
 <02d072e2-6bf4-4024-b7b6-d5aa0ec13bc1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <02d072e2-6bf4-4024-b7b6-d5aa0ec13bc1@suse.com>

On Tue, Apr 02, 2024 at 11:43:49AM +0200, Jan Beulich wrote:
> On 02.04.2024 11:38, Jan Beulich wrote:
> > On 28.03.2024 16:35, Roger Pau Monne wrote:
> >> Currently the offsets into the boot_video_info struct are manually encoded in
> >> video.S, which is fragile.  Generate them in asm-offsets.c and switch the
> >> current code to use those instead.
> > 
> > Just to mention it (without asking for immediate action): Defining boot_vid_info
> > in assembly code then is as fragile. Moving to C would likely be problematic
> > because it needs to be in the trampoline range. But at least its size should (at
> > some point) perhaps better be tied to the C struct's sizeof().
> 
> Actually I overlooked that you partly do this. The use of BVI_capabilities there
> looks odd to me, though. Why not
> 
>         .space  BVI_size - (. - boot_vid_info)
> 
> ? I realize it becomes just BVI_size in patch 2, but I have some question there,
> too.

I didn't think much about this because it was going away in the next
patch, but let me adjust.  In fact I was tempted to just use BVI_size
and allocate more than required.

Thanks, Roger.

