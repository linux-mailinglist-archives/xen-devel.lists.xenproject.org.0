Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A53F9AB982F
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 10:56:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986597.1372130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFqrC-00021D-Rj; Fri, 16 May 2025 08:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986597.1372130; Fri, 16 May 2025 08:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFqrC-0001zH-P0; Fri, 16 May 2025 08:55:54 +0000
Received: by outflank-mailman (input) for mailman id 986597;
 Fri, 16 May 2025 08:55:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UFMR=YA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFqrB-0001zB-Ca
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 08:55:53 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 916ef7bb-3233-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 10:55:51 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ad238c68b35so340912266b.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 01:55:51 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ad534ad59dasm89071566b.31.2025.05.16.01.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 01:55:50 -0700 (PDT)
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
X-Inumbo-ID: 916ef7bb-3233-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747385751; x=1747990551; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sH/cErjnCXGpiOVt3Z/e5C0zRWf/h5mzBgpYkmJg8Lg=;
        b=t4Weu5XlmkALMbX0pOWkM5s/8XpDr1+CzQ/sCjZPRsmta/HCacY5Zco7/Io2TVhkyy
         bEjPXyKLFK+1dkaZpoDvGPiEGu5wwkpBivQReYD9wHMOO1AebAmBZakLUM/ejRxcoZGK
         62p8UR5PNHx/44UDDhwTKG1dn7jevj0EEDClQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747385751; x=1747990551;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sH/cErjnCXGpiOVt3Z/e5C0zRWf/h5mzBgpYkmJg8Lg=;
        b=sRPqKnIm61pr4TYlbcqm4XNZh7dHoThcJmwGWnjksMMsoqwYNEAFDsUrzUTrjdnQfY
         tEr7McvlYev60kgdW3mEkWoZyPH10lHGtG0rKFMEmrQVxCojKxLaS6+uBr+n1V0kSnZa
         C3B6TYawDcV0ieGGXbrh9vQ0r1O1fp9TplP6wksV79qLtcMaqlFBSiWwzau5aSzmb67f
         3i5IWv3OnihTwydX7XlgV7sApF/wii4TPlrkyY2XrNNL/qyD/2bSxODem6mEhoJKvAgl
         E9uRHXBpvRBpvxM5FOcsDGsmtZ8EfmdHMM4FNhK5QARWihcWvLCIlsQHARJwpeyC76vW
         xPyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDThAtHbfIFKIXwkFzUWD6mAyc6/6fnTKs/6/xkVuwivXM2lTvZOXfCYiBKwcGUZ94QWo1RbUPHzo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzdPT3lxMi4duG9zqxj4Hf9BQnnI2SAR41vIOoPmj/TJ5h4y0Zy
	WNf0obynfbeJIjXeNrBDU9iEQsGEcsj3uc+IQ5hI+s1NKk6J/smyukRfc20zWkgMh1c=
X-Gm-Gg: ASbGncvzhvpS+q7YLWjf6y6XDXrIa6E4TBQsEj6ZMDZzzv4jionCUvGLzxDmhOM6LML
	lwfZ+lDrviEnbl4VBwRczXRIbXCgKwfu6DPFq401W5Bo3Xq38PrIXaSIPMDJRo3f5FYA0P1zrzJ
	FEXcSbV4EZ/sYg1qjqXfK7xOQsP4+y0HKQc2kVwSYmdew4qLyJv3Oh+5fTWnqxBDjyPgyu1kUMt
	KTIv/bMdVXJVYYYSqjOgt3eexqPPIXQUmVXRbGr7b+RfOTioLtGEzYAlRSV9oxp4/KJlSJpBfjx
	adgicnyefoTLCDZA+GEpmLE/egsURwODw1OsJnT9ycbnvZov0SouCyVBJnyb18PNshhtrwfiylK
	nltVshJLdZ3/5qbsd+hk=
X-Google-Smtp-Source: AGHT+IFeNVr2GLqZgdFAH1bpWubhjEFWLNqpHSo7Ehv+G3Vm8kYQ9YIyC0wJkVdJ4CU9q9hnfMkHjQ==
X-Received: by 2002:a17:907:1c2a:b0:ad2:40f4:c251 with SMTP id a640c23a62f3a-ad536bdff0bmr137083466b.35.1747385750716;
        Fri, 16 May 2025 01:55:50 -0700 (PDT)
Date: Fri, 16 May 2025 10:55:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 7/9] xen/x86: rename cache_flush_permitted() to
 has_arch_io_resources()
Message-ID: <aCb9lex2bE1hJf9j@macbook.lan>
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-8-roger.pau@citrix.com>
 <e2396e92-79b6-487a-88d6-725cd9e173a9@suse.com>
 <aCXB5zpqGfBrPTZy@macbook.lan>
 <205a65d3-92bd-4281-8605-758ca03fcac5@suse.com>
 <aCbxMF9Uj4eBPMAf@macbook.lan>
 <9db4a2ce-ba06-42a1-b6e6-7d0c2b59c0c3@suse.com>
 <aCb2-6hIlYQ8V0NG@macbook.lan>
 <00594224-7a33-4c5f-812e-7160bfecb5c4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00594224-7a33-4c5f-812e-7160bfecb5c4@suse.com>

On Fri, May 16, 2025 at 10:36:19AM +0200, Jan Beulich wrote:
> On 16.05.2025 10:27, Roger Pau Monné wrote:
> > On Fri, May 16, 2025 at 10:08:35AM +0200, Jan Beulich wrote:
> >> On 16.05.2025 10:02, Roger Pau Monné wrote:
> >>> On Fri, May 16, 2025 at 09:07:43AM +0200, Jan Beulich wrote:
> >>>> On 15.05.2025 12:28, Roger Pau Monné wrote:
> >>>>> On Mon, May 12, 2025 at 05:16:02PM +0200, Jan Beulich wrote:
> >>>>>> On 06.05.2025 10:31, Roger Pau Monne wrote:
> >>>>>>> To better describe the underlying implementation.  Define
> >>>>>>> cache_flush_permitted() as an alias of has_arch_io_resources(), so that
> >>>>>>> current users of cache_flush_permitted() are not effectively modified.
> >>>>>>>
> >>>>>>> With the introduction of the new handler, change some of the call sites of
> >>>>>>> cache_flush_permitted() to instead use has_arch_io_resources() as such
> >>>>>>> callers are not after whether cache flush is enabled, but rather whether
> >>>>>>> the domain has any IO resources assigned.
> >>>>>>>
> >>>>>>> Take the opportunity to adjust l1_disallow_mask() to use the newly
> >>>>>>> introduced has_arch_io_resources() macro.
> >>>>>>
> >>>>>> While I'm happy with everything else here, to me it's at least on the
> >>>>>> edge whether cache_flush_permitted() wouldn't be the better predicate
> >>>>>> to use there, for this being about ...
> >>>>>>
> >>>>>>> --- a/xen/arch/x86/mm.c
> >>>>>>> +++ b/xen/arch/x86/mm.c
> >>>>>>> @@ -172,8 +172,7 @@ static DEFINE_SPINLOCK(subpage_ro_lock);
> >>>>>>>  
> >>>>>>>  #define l1_disallow_mask(d)                                     \
> >>>>>>>      (((d) != dom_io) &&                                         \
> >>>>>>> -     (rangeset_is_empty((d)->iomem_caps) &&                     \
> >>>>>>> -      rangeset_is_empty((d)->arch.ioport_caps) &&               \
> >>>>>>> +     (!has_arch_io_resources(d) &&                              \
> >>>>>>>        !has_arch_pdevs(d) &&                                     \
> >>>>>>>        is_pv_domain(d)) ?                                        \
> >>>>>>>       L1_DISALLOW_MASK : (L1_DISALLOW_MASK & ~PAGE_CACHE_ATTRS))
> >>>>>>
> >>>>>> ... cachability, which goes hand in hand with the ability to also
> >>>>>> flush cache contents.
> >>>>>
> >>>>> Hm, I was on the edge here, in fact I've previously coded this using
> >>>>> cache_flush_permitted(), just to the change back to
> >>>>> has_arch_io_resources().  If you think cache_flush_permitted() is
> >>>>> better I'm fine with that.
> >>>>
> >>>> I think that would be better here, yet as you say - it's not entirely
> >>>> clear cut either way.
> >>>
> >>> I've reverted this chunk of the change and left the code as-is for the
> >>> time being.
> >>
> >> Didn't we agree to use cache_flush_permitted() here instead?
> > 
> > I think it would be a bit weird, if we want this to be a
> > non-functional change we would need to keep the has_arch_pdevs()
> > condition because cache_flush_permitted() doesn't take that into
> > account.  Or we need to adjust cache_flush_permitted() to also take
> > has_arch_pdevs() into consideration.
> 
> Which is what you suggested elsewhere, or did I misunderstand that?

Yes, I missed that you agreed to that then, sorry.  To many messages
on the thread I'm afraid.

Thanks, Roger.

