Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F3CAB96F7
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 09:57:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986430.1371990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFpwh-0002Ec-Fy; Fri, 16 May 2025 07:57:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986430.1371990; Fri, 16 May 2025 07:57:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFpwh-0002Cx-Cx; Fri, 16 May 2025 07:57:31 +0000
Received: by outflank-mailman (input) for mailman id 986430;
 Fri, 16 May 2025 07:57:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UFMR=YA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFpwf-0002Cr-HU
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 07:57:29 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69aa3b4c-322b-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 09:57:28 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-60179d8e65fso506488a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 00:57:28 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-6004d4f1f9esm990156a12.8.2025.05.16.00.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 00:57:27 -0700 (PDT)
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
X-Inumbo-ID: 69aa3b4c-322b-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747382248; x=1747987048; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BCdBsP8Tf8Vr+C2q+t0weisYFPxZF1r4GVOhoMizHrM=;
        b=l9b0gLdxUKNh80KUfH+xAUhNLSfhp/CB04qOfeINU5UEcNDguexLP/B6+wcBcY+UFv
         AVE+wxkqkz41NTzoSfiUhOzsG2oamHC5ucQxZTXPJ6t6+yLmscgEpaHbN1GcdfuWimwA
         lCBJC9+UzBVNUuUqDnX/ZZclF0JZlUrT3PjNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747382248; x=1747987048;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BCdBsP8Tf8Vr+C2q+t0weisYFPxZF1r4GVOhoMizHrM=;
        b=K3agDvC0553KhNxo6hLXNwBP/D3MKn5zruqsQYNnE0UjyHxcJaYkIwdslYGQn78xNA
         FArWp46yHe+auff4HIRuX7V+a9LQ183uulsAeIMo88epLdt8V7FBlwTt9eKMHvUHm0yU
         qn4xa+x78zHqT/IQkTfrIVvvNeRgSLbCNmUr05nOmRP/v0/mQiXpkQvyKaWvNIP851rl
         5h9NdXicgsdINE5Szwugkjy13IRdR85Jw00D4JXsWAMGerRilmrkI8sOsDZmnLqNHMq3
         qdJ6q9ewKyLgGUTjsVh4RkXB1DtqVwbsbotNJVa4KldCjJ+7mgBycKqNQ19ovWhjvr16
         rl7g==
X-Forwarded-Encrypted: i=1; AJvYcCXUekUEnIoAh6g+r/XGD4xHolOIf9BfGgI/lWy4hUMXiwmijZQQuxAj7f4VflLwJcMU6ka83ipUf+c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzh3+wriRgqtyRvJSmb7SAGrBTBjcQHotIxIPzoa5XsEwAg5Glo
	06TD0uixZFmoYGKY7K+oTdQ66qJBZGwauNx05z4P7Q4tgYfyqKJHJp5/nKx2eWrydCcNaaZHymE
	TU0SB
X-Gm-Gg: ASbGncsPwdKyfF8Z5KZi/vrXoxCHgS9hJLbRuAolYyHai5PfU+u/Tjpbm7FvXjPWr6W
	VZwoRj4RLynQblPMXD2nvqqnOFzwWo4xuEssDNhIo541Lmq0BA622AO1BOhfM70cyDZ4uN8A39B
	8LRWiJPxrtp/59rX6xcuSE0OSGQk8lTGNVjzWMxP+cHdaOSMhyLoM7e+/U6Gk8t7ZckqO6PcCNF
	9+Nck17Kxy6Od/JZQWfu0+xDSefDUtNIZC8qJqYMKY5VRvRhgJH/bRtxrkYkzrFCKMKTmIqiOcS
	hzEyO42ydeOltnPUn0O3F3gytLB0qSx7TqaHZ2APHMNb4WFcqFz3Yb5uMEefb+yiScVL03czNAN
	DX3llP+dLNMCZYiGS11IUOWEL15ctXg==
X-Google-Smtp-Source: AGHT+IFuFsMzFf/tPT0svIuVcdrfd6wo6pqaYbtMGDxBEmhgZCjmb0mI7Io7wO1h88xNeVyQQ9y70g==
X-Received: by 2002:a05:6402:50cb:b0:600:5a9e:2b52 with SMTP id 4fb4d7f45d1cf-6008a7a40camr1794132a12.8.1747382248107;
        Fri, 16 May 2025 00:57:28 -0700 (PDT)
Date: Fri, 16 May 2025 09:57:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 5/9] x86/mtrr: use memory_type_changed() in
 hvm_set_mem_pinned_cacheattr()
Message-ID: <aCbv5kybd3fhsEFc@macbook.lan>
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-6-roger.pau@citrix.com>
 <853ffc16-f14b-44fa-9e71-4fae8377fa95@suse.com>
 <aCXAanKycwXOiLJ0@macbook.lan>
 <91058f6f-0b87-4958-aa09-749df4de3a9f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91058f6f-0b87-4958-aa09-749df4de3a9f@suse.com>

On Fri, May 16, 2025 at 09:00:42AM +0200, Jan Beulich wrote:
> On 15.05.2025 12:22, Roger Pau Monné wrote:
> > On Mon, May 12, 2025 at 05:04:56PM +0200, Jan Beulich wrote:
> >> On 06.05.2025 10:31, Roger Pau Monne wrote:
> >>> The current logic partially open-codes memory_type_changed(), but doesn't
> >>> check whether the type change or the cache flush is actually needed.
> >>> Instead switch to using memory_type_changed(), at possibly a higher expense
> >>> cost of not exclusively issuing cache flushes when limiting cacheability.
> >>>
> >>> However using memory_type_changed() has the benefit of limiting
> >>> recalculations and cache flushes to strictly only when it's meaningful due
> >>> to the guest configuration, like having devices or IO regions assigned.
> >>>
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>
> >> Hmm, I'm not convinced this is a win. This operation isn't normally used on
> >> a running guest, aiui.
> >>
> >> What's more, this heavily conflicts with a patch posted (again) over 2 years
> >> ago [1]. Unless there's something severely wrong with that (and unless your
> >> patch would make that old one unnecessary), I'm again of the opinion that
> >> that one should go in first. It is becoming increasingly noticeable that it's
> >> unhelpful if posted patches aren't being looked at.
> > 
> > I'm happy for your change to go in first, but I think that
> > memory_type_changed() should be adjusted to contain the extra checks
> > that you add in your patch, and then hvm_set_mem_pinned_cacheattr()
> > should be switched to use memory_type_changed() rather than
> > open-coding it.
> 
> Maybe, but see my other reply to your patch.
> 
> >  For once it would miss the adjustment done to
> > memory_type_changed() to only flush the cache when there's a
> > meaningful change to the p2m (iow: p2m_memory_type_changed() is not a
> > no-op).
> 
> That could also be mirrored here, if there were (remaining) reasons to avoid
> use of memory_type_changed() for this function.

Indeed, but it's just more open-coding of memory_type_changed() in the
context of hvm_set_mem_pinned_cacheattr().  IMO I don't know exactly
the usage of this function, it seems like it should be mostly used at
domain build time, or maybe when doing hotplug of a device, so not
very often.

Given how complicated cache management is, I would prefer if the logic
is limited to few places (like memory_type_changed()), instead of
having open-coded implementations of the same logic in multiple
places.

Thanks, Roger.

