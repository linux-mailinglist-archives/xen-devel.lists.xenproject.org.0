Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13363838A5D
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 10:33:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670311.1042978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSD99-0001uG-55; Tue, 23 Jan 2024 09:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670311.1042978; Tue, 23 Jan 2024 09:32:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSD99-0001sD-2K; Tue, 23 Jan 2024 09:32:43 +0000
Received: by outflank-mailman (input) for mailman id 670311;
 Tue, 23 Jan 2024 09:32:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gDjx=JB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rSD97-0001s7-6L
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 09:32:41 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59d5c971-b9d2-11ee-98f4-6d05b1d4d9a1;
 Tue, 23 Jan 2024 10:32:39 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40e86a9fc4bso52578075e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 01:32:39 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c4fc800b0040e549c77a1sm45706355wmq.32.2024.01.23.01.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 01:32:38 -0800 (PST)
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
X-Inumbo-ID: 59d5c971-b9d2-11ee-98f4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706002359; x=1706607159; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UF1eCSBbiTLms0paL4rk6c4QHmgFstwkgKnftKelqek=;
        b=s8N8xB55Oqc8rlbZvapaSrkb+pnHONhAYxPb0HVB6sQL8wQxdZzwXUxAlVJB+4nDb9
         ba6evKS2jE6kLyTcl8YrxLNcWQskSYTzCASr6EmfT2qJC05rnIzqqHsNFEz3S/PnFzqZ
         agdaooEECw0tW7tiNs47bVtID4FcRmlSzDwaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706002359; x=1706607159;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UF1eCSBbiTLms0paL4rk6c4QHmgFstwkgKnftKelqek=;
        b=bCtl3soVIZFmhpIdhVJYdxFu1/6+yLnqN8o8PQXWFtT92XRP2dgqdWBleT5QdsQM5T
         dq0gKC1kBJ8iB8QmN3TL5vWv8gD9Euy8S5v9/SjV2UH7K1LFxJejI2k1maTpSeu6bRPY
         flkALRX3XjTmPZinpZxitBjbnAEd3KE5g6DeqHRExnADyPx2FzfuiQdInY7ivwb929BI
         Djzw80iYYN7AZ1PrH1eD4+8dm8JA8SrfP+ufTJrhidTNAG3y5CdGV94Zv/UtpsCHvNDz
         NqFRf+PwRx0sAw/RPSLe57Qciaw+kEoyYvFzOrQ5fNkW+l9YqIV3nMsRjFpNXQUV1dhC
         TfIA==
X-Gm-Message-State: AOJu0YxSIqBQ3jHrHbMFvbQHvfYZFZY1q2xv+DvxWJzmB5JbJRqOIKWJ
	PSuzWuBHpqcWawdrOWs7SQgejZA4ZJrM6CFJYIT4AyS+TP/kFvlTPC4f9yGZZ9U=
X-Google-Smtp-Source: AGHT+IH84Segp5Ce9IZt+QG2aE3ldD0Y+PPYYa8n6/UDKwvkoicEIyrT5Xq6CRHFY8mgmTsh9UeJpQ==
X-Received: by 2002:a05:600c:5399:b0:40e:5a0c:21bf with SMTP id hg25-20020a05600c539900b0040e5a0c21bfmr376101wmb.95.1706002359205;
        Tue, 23 Jan 2024 01:32:39 -0800 (PST)
Date: Tue, 23 Jan 2024 10:32:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5] x86/livepatch: align functions to ensure minimal
 distance between entry points
Message-ID: <Za-HtRgSbO3kiK7u@macbook>
References: <20240122110244.14091-1-roger.pau@citrix.com>
 <013210fd-6ea3-4719-afcd-1da97d9cd17f@suse.com>
 <Za6laZtVdQtFP4F5@macbook>
 <ab34df2d-ba47-46c0-a0f2-9c051f640906@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ab34df2d-ba47-46c0-a0f2-9c051f640906@suse.com>

On Tue, Jan 23, 2024 at 08:53:15AM +0100, Jan Beulich wrote:
> On 22.01.2024 18:27, Roger Pau Monné wrote:
> > On Mon, Jan 22, 2024 at 12:21:47PM +0100, Jan Beulich wrote:
> >> On 22.01.2024 12:02, Roger Pau Monne wrote:
> >>> --- a/xen/arch/x86/xen.lds.S
> >>> +++ b/xen/arch/x86/xen.lds.S
> >>> @@ -99,6 +99,10 @@ SECTIONS
> >>>         *(.text)
> >>>  #ifdef CONFIG_CC_SPLIT_SECTIONS
> >>>         *(.text.*)
> >>> +#endif
> >>> +#ifdef CONFIG_FUNCTION_ALIGNMENT
> >>> +       /* Ensure enough distance with the next placed section. */
> >>> +       . = ALIGN(CONFIG_FUNCTION_ALIGNMENT);
> >>>  #endif
> >>>         *(.text.__x86_indirect_thunk_*)
> >>
> >> I continue to fail to see how an alignment directive can guarantee minimum
> >> distance. In the worst case such a directive inserts nothing at all.
> > 
> > I'm confused, you did provide a RB for this in v4:
> > 
> > https://lore.kernel.org/xen-devel/4cad003f-dda0-4e22-a770-5a5ff56f4d35@suse.com/
> > 
> > Which is basically the same code with a few comments and wording
> > adjustments.
> 
> Hmm, yes. I think the aspect above was raised before, but then (perhaps)
> kind of addressed. (I'm puzzled then too: Why did you drop the R-b, when
> nothing substantially changed?)

The RB was given quite some time ago, so I felt it was probably best
to drop it in case you wanted to re-asses the patch.  Specially given
you have now done the work to also add support for this feature to
assembly annotated functions.

> Yet re-reading the description, there's
> nothing said to this effect. Specifically ...
> 
> >> IOW
> >> at the very least there's a non-spelled-out assumption here about the last
> >> item in the earlier section having suitable alignment and thus, if small
> >> in size, being suitably padded.
> > 
> > Please bear with me, but I'm afraid I don't understand your concerns.
> > 
> > For livepatch build tools (which is the only consumer of such
> > alignments) we already have the requirement that a function in order
> > to be suitable for being live patched must reside in it's own
> > section.
> > 
> > We do want to aim for functions (even assembly ones) to live in their
> > own sections in order to be live patched, and to be properly aligned.
> > However it's also fine for functions to use a different (smaller)
> > alignment, the livepatch build tools will detect this and use the
> > alignment reported.
> 
> ... I don't think this and ...
> 
> > While we want to get to a point where everything that we care to patch
> > lives in it's own section, and is properly padded to ensure minimal
> > required space, I don't see why the proposed approach here should be
> > blocked, as it's a step in the right direction of achieving the
> > goal.
> > 
> > Granted, there's still assembly code that won't be suitably padded,
> > but the livepatch build tools won't assume it to be padded.
> 
> ... this is being pointed out. Which I think is relevant to make
> explicit not the least because the build tools aren't part of the main
> Xen tree. Plus many (like me) may not be overly familiar with how they
> work.

OK, I can integrate some of this wording in the commit message.

> >  After
> > your series to enable assembly annotations we can also make sure the
> > assembly annotated functions live in separate sections and are
> > suitably aligned.
> > 
> >> Personally I don't think merely spelling
> >> out such a requirement would help - it would end up being a trap for
> >> someone to fall into.
> > 
> >> I'm further curious why .text.__x86_indirect_thunk_* is left past the
> >> inserted alignment. While pretty unlikely, isn't it in principle possible
> >> for the thunks there to also need patching? Aren't we instead requiring
> >> then that assembly functions (and thunks) all be suitably aligned as well?
> > 
> > Those are defined in assembly, so requires CONFIG_FUNCTION_ALIGNMENT
> > to also be applied to the function entry points in assembly files.
> 
> I see. Yet the question then remains: Why is the alignment not inserted
> after them? Or will the insertion need to move later on (which would feel
> odd)?

The thunk sections will currently be consumed by *(.text.*) when using
split sections.  Looking at the assembly for them I think they are
suitable annotated to create the right symbols for livepatch tools to
pick.  They won't however have the right alignment just yet, as I
expect that will get solved with your follow up patch to respect
CONFIG_FUNCTION_ALIGNMENT in assembly annotated functions also.

Thanks, Roger.

