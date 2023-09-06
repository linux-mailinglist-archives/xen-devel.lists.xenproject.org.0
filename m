Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5343793F3C
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 16:46:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596655.930626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdtmx-00077t-3h; Wed, 06 Sep 2023 14:45:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596655.930626; Wed, 06 Sep 2023 14:45:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdtmx-00075N-0N; Wed, 06 Sep 2023 14:45:51 +0000
Received: by outflank-mailman (input) for mailman id 596655;
 Wed, 06 Sep 2023 14:45:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z0AC=EW=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qdtmu-00075C-VM
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 14:45:49 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10a2a8d6-4cc4-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 16:45:47 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-401187f8071so7335175e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Sep 2023 07:45:47 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 m18-20020a7bca52000000b003fe601a7d46sm23277096wml.45.2023.09.06.07.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 07:45:46 -0700 (PDT)
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
X-Inumbo-ID: 10a2a8d6-4cc4-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694011547; x=1694616347; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T6llfyhCDD4IbQCUerVc2RwrEp3NCx7NRrJ4oPuteaM=;
        b=AUOZfUX2g38T8TuJIyb0SBE62ESJcs2kpGqBHA+njnn3HCCsGYc3VA0p5rwwZsPx9d
         UG7VeioltkJ6VNNzfa3rgwRMcUPfzBlZF/49FK3CuTPGh7H3wDpK8JzsszhSzOc0ELDW
         1ou/2Eu09eiYiDMDVoGk0jljDHluF7hTSMd+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694011547; x=1694616347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6llfyhCDD4IbQCUerVc2RwrEp3NCx7NRrJ4oPuteaM=;
        b=VNv2S5owgzs9FL8t5x3xZ+DoheoM2vItX0ig9yb/k260kufE7y6/Ko79mrd9eAor0d
         U3wKqRhkH8h66WAB632N+cNSga96XO2Q4tpiWuSnz2Y+wIcM+oHG9U5R5XOAPKNf6h4j
         0mF1x47e+lHoY1OJt6Sa/Oh5/NLEMGLycoSlN19FjU/Fxw5CAunxnIaBw9vYrSfqak2B
         GnCfxOToayHH8UYcUOgu+zc9wbIUfxXGgqUTj1HEgSDPwfw6SwjgluDLRFuI8CU2dK5J
         Q7GS5kh+4NvTvzl2uwN9DGJHWI5lynS5NpIOG/kWYNoT48UOpXqHA2I+TsvA/4Gcw6Rg
         tLcw==
X-Gm-Message-State: AOJu0YyEaBGOSVb4DIiHL7JJh/PNcXSC7y9wfXrwNqsU6FdqBdHmqWT8
	M0cmUFsrCaIvLLcquLhS+HXSzQ==
X-Google-Smtp-Source: AGHT+IFF5E2F78zZC7qU2ujdTEIZYR5JFu3/kIjMj9HBxhZzi6EdJfzmFxBjLqFPBl4cL9wyDato6Q==
X-Received: by 2002:a7b:ca4f:0:b0:400:5962:6aa9 with SMTP id m15-20020a7bca4f000000b0040059626aa9mr2837755wml.11.1694011546745;
        Wed, 06 Sep 2023 07:45:46 -0700 (PDT)
Date: Wed, 6 Sep 2023 15:45:45 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] MAINTAINERS: consolidate vm-event/monitor entry
Message-ID: <54be3f6e-3a54-4cbf-ae9a-9ceda5a0c5a0@perard>
References: <e3ccc381-1fd5-b99c-e37e-5870af401dd0@suse.com>
 <09a93c71-28ed-4593-b8b4-fbb4d2a240f7@perard>
 <9a42f222-7803-aab6-99c2-6919fb1cc4c3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a42f222-7803-aab6-99c2-6919fb1cc4c3@suse.com>

On Wed, Sep 06, 2023 at 02:50:22PM +0200, Jan Beulich wrote:
> On 06.09.2023 14:40, Anthony PERARD wrote:
> > On Thu, Aug 31, 2023 at 08:15:13AM +0200, Jan Beulich wrote:
> >> If the F: description is to be trusted, the two xen/arch/x86/hvm/
> >> lines were fully redundant with the earlier wildcard ones. Arch header
> >> files, otoh, were no longer covered by anything as of the move from
> >> include/asm-*/ to arch/*/include/asm/. Further also generalize (by
> >> folding) the x86- and Arm-specific mem_access.c entries.
> >>
> >> Finally, again assuming the F: description can be trusted, there's no
> >> point listing arch/, common/, and include/ entries separately. Fold
> >> them all.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> -F:	xen/arch/*/monitor.c
> >> -F:	xen/arch/*/vm_event.c
> >> -F:	xen/arch/arm/mem_access.c
> >> -F:	xen/arch/x86/include/asm/hvm/monitor.h
> >> -F:	xen/arch/x86/include/asm/hvm/vm_event.h
> >> -F:	xen/arch/x86/mm/mem_access.c
> >> -F:	xen/arch/x86/hvm/monitor.c
> >> -F:	xen/arch/x86/hvm/vm_event.c
> >> -F:	xen/common/mem_access.c
> >> -F:	xen/common/monitor.c
> >> -F:	xen/common/vm_event.c
> >> -F:	xen/include/*/mem_access.h
> >> -F:	xen/include/*/monitor.h
> >> -F:	xen/include/*/vm_event.h
> >> +F:	xen/*/mem_access.[ch]
> >> +F:	xen/*/monitor.[ch]
> >> +F:	xen/*/vm_event.[ch]
> > 
> > 
> > Hi,
> > 
> > Did you mean to for example change the maintainer ship of
> > "xen/arch/x86/mm/mem_access.c"? Before it was:
> >     - VM EVENT, MEM ACCESS and MONITOR
> >     - X86 MEMORY MANAGEMENT
> >     - X86 ARCHITECTURE
> > And now, it's just:
> >     - X86 MEMORY MANAGEMENT
> >     - X86 ARCHITECTURE
> > 
> > (see ./scripts/get_maintainer.pl --sections -f xen/arch/x86/mm/mem_access.c)
> > 
> > Also, now "xen/include/xen/monitor.h" is only "THE REST".
> 
> No, no change of maintainership was intended. But there was an uncertainty,
> which is why I said "assuming the F: description can be trusted". So ...
> 
> > On the other hand, there's no change for "xen/common/monitor.c", so the
> > pattern works for this particular file.
> 
> ... together with this observation, I take it that
> 
> 	   F:	*/net/*		all files in "any top level directory"/net
> 
> is actually at best misleading / ambiguous - I read it as not just a single
> level of directories, but it may well be that that's what is meant. At

I guess the ambiguity would lie in the word "files". Here, "files" is a
single file and not a directory, unlike the shell globing which would
include directories with a '*'.

The first '*' is described at "any top level directory", but it is also
"only top level directory". This kind of tells me that there is only a
single level of directories that is match by '*'.

> which point the question is how "any number of directories" could be
> expressed. Would **/ or .../**/... work here? I'm afraid my Perl is far
> from sufficient to actually spot where (and hence how) this is handled in
> the script.

I think you could write a regexp with the "N:" type instead of "F:".
This is described Linux's MAINTAINERS file, but not ours, yet our
get_maintainer.pl script has the functionality. It might be nice to be
able to write just '**' but until someone implement that, we could go
for a regex, which is more complicated and more prone to mistake.

So I think in the short-term, you want:

N:	^xen/.*/mem_access\.[ch]$
N:	^xen/.*/monitor\.[ch]$
N:	^xen/.*/vm_event\.[ch]$

As for adding "**", there's maybe something to do with
"file_match_pattern()" in get_maintainer.pl, this function compare the
number of '/' in both the pattern and the filepath to find out if a '*'
only match one level of directory or more.

Cheers,

-- 
Anthony PERARD

