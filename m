Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AB47DB8DE
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 12:20:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625053.973913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxQIQ-0004sG-GO; Mon, 30 Oct 2023 11:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625053.973913; Mon, 30 Oct 2023 11:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxQIQ-0004pM-DJ; Mon, 30 Oct 2023 11:19:02 +0000
Received: by outflank-mailman (input) for mailman id 625053;
 Mon, 30 Oct 2023 11:19:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3VkP=GM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qxQIP-0004pG-2V
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 11:19:01 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e1a1909-7716-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 12:18:57 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9c3aec5f326so1136611366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Oct 2023 04:18:57 -0700 (PDT)
Received: from localhost ([213.195.118.109]) by smtp.gmail.com with ESMTPSA id
 v13-20020a170906564d00b009c74c56d71dsm5872984ejr.13.2023.10.30.04.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 04:18:56 -0700 (PDT)
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
X-Inumbo-ID: 1e1a1909-7716-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698664737; x=1699269537; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SybUrgox0OOTfZ1F4P2W5W4O/sTJS3wRMW8kYIiI2Yk=;
        b=mOaig42pHh8qQGWVYYI+JCmBKyXsl+WQWlG4lxJrdIipBMhjmSQ9zb+vRm0ajJqTmK
         V3uNKsETsT+//Xp07u7ZROi/uWoqkRam5Rfb3gHAsmuCNZJEppSj0fCFBDmzK+0SNAX4
         9U0A0RDpV4GTIJfEQcB81KOjQ1KIHQ7wdhoE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698664737; x=1699269537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SybUrgox0OOTfZ1F4P2W5W4O/sTJS3wRMW8kYIiI2Yk=;
        b=UXQMeqb0OYbRBbnJVJ6z47TRYeI2pqPiGzjs9xKJi8Ioe1iUw4y2a+Ab7+62uu4B0V
         4IpPTQ1ehFmTH7k5ZZyFGwyEnHzSUQO+OJrztUESQuW7/O5PXxjNQcPDLKwpNsEV2jBT
         VKWQxToUUSXhMOoNPLH/zPkNzs7vbArxXJDrBRxRxvALoI1IqID5Dz6rnyUeG4UZ5wQS
         M2e1tnxAr4ghQwxCSRCcrmI9nahlxjov7XTev+JnNF+jw2/HWPMLImvKhe+JIWCGXyaB
         R4Tvo2ry8yOn1u2IxsqHmw1B01zxylunERXYUdjbuUTgQrFU2MLLT8TCnBr43UPePUgX
         y+RQ==
X-Gm-Message-State: AOJu0YxmU37AEhG25GtxfZUBZt/fhJAx5SEY0sS0QyRAXIxC2zyRN4sX
	V5VZBW4uHPWksqsyuvgJxDdnDw==
X-Google-Smtp-Source: AGHT+IHtSc/LwVPlA6SdDUDX0VRxxZJoP3bkubpja/W8+SsoopWTeBpjR26yuaYcYYyS8WW9eoghjg==
X-Received: by 2002:a17:907:97c8:b0:9c7:5186:de2a with SMTP id js8-20020a17090797c800b009c75186de2amr11854288ejc.6.1698664736816;
        Mon, 30 Oct 2023 04:18:56 -0700 (PDT)
Date: Mon, 30 Oct 2023 12:18:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/hvm/dom0: fix PVH initrd and metadata placement
Message-ID: <ZT-RH7plvXhDr5iP@macbook>
References: <c81a8275-ecfd-7598-c119-ed83b156c0e5@suse.com>
 <b5330686-82a0-4d47-9549-2d943ca68c7e@amd.com>
 <1cc98108-3328-94d3-5f8d-ff03c965087e@suse.com>
 <92ba94d2-9e57-4241-8626-33f06f88e726@amd.com>
 <a61926bc-e3e6-e381-45de-be3a4878b6af@suse.com>
 <217d9079-3072-441a-a4ba-4db28c565bc7@amd.com>
 <08ea1b7b-c85f-337a-42c4-520e40b75288@suse.com>
 <987b5b7d-57f8-4d63-bd13-fe662b6cb87f@amd.com>
 <486c778c-4a33-703f-2811-27101d10ea9b@suse.com>
 <b203d30f-1563-45b6-9469-b25dda8df9a4@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b203d30f-1563-45b6-9469-b25dda8df9a4@amd.com>

On Mon, Oct 30, 2023 at 09:37:24AM +0200, Xenia Ragiadakou wrote:
> 
> On 27/10/23 15:01, Jan Beulich wrote:
> > On 27.10.2023 13:18, Xenia Ragiadakou wrote:
> > > 
> > > On 27/10/23 09:37, Jan Beulich wrote:
> > > > On 26.10.2023 18:55, Xenia Ragiadakou wrote:
> > > > > 
> > > > > 
> > > > > On 26/10/23 17:55, Jan Beulich wrote:
> > > > > > On 26.10.2023 15:58, Xenia Ragiadakou wrote:
> > > > > > > 
> > > > > > > On 26/10/23 15:37, Jan Beulich wrote:
> > > > > > > > On 26.10.2023 14:35, Xenia Ragiadakou wrote:
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > On 26/10/23 14:51, Jan Beulich wrote:
> > > > > > > > > > On 26.10.2023 11:46, Xenia Ragiadakou wrote:
> > > > > > > > > > > On 26/10/23 11:45, Jan Beulich wrote:
> > > > > > > > > > > > On 26.10.2023 10:34, Xenia Ragiadakou wrote:
> > > > > > > > > > > > > On 26/10/23 10:35, Jan Beulich wrote:
> > > > > > > > > > > > > > On 26.10.2023 08:45, Xenia Ragiadakou wrote:
> > > > > > > > > > > > > > > --- a/xen/arch/x86/hvm/dom0_build.c
> > > > > > > > > > > > > > > +++ b/xen/arch/x86/hvm/dom0_build.c
> > > > > > > > > > > > > > > @@ -518,7 +518,7 @@ static paddr_t __init find_memory(
> > > > > > > > > > > > > > >                 if ( end <= kernel_start || start >= kernel_end )
> > > > > > > > > > > > > > >                     ; /* No overlap, nothing to do. */
> > > > > > > > > > > > > > >                 /* Deal with the kernel already being loaded in the region. */
> > > > > > > > > > > > > > > -        else if ( kernel_start - start > end - kernel_end )
> > > > > > > > > > > > > > > +        else if ( kernel_start + kernel_end > start + end )
> > > > > > > > > > > > > > What meaning has the sum of the start and end of either range? I can't
> > > > > > > > > > > > > > figure how comparing those two values will be generally correct / useful.
> > > > > > > > > > > > > > If the partial-overlap case needs handling in the first place, I think
> > > > > > > > > > > > > > new conditionals need adding (and the existing one needs constraining to
> > > > > > > > > > > > > > "kernel range fully contained") to use
> > > > > > > > > > > > > > - as before, the larger of the non-overlapping ranges at start and end
> > > > > > > > > > > > > >          if the kernel range is fully contained,
> > > > > > > > > > > > > > - the tail of the range when the overlap is at the start,
> > > > > > > > > > > > > > - the head of the range when the overlap is at the end.
> > > > > > > > > > > > > Yes it is not quite straight forward to understand and is based on the
> > > > > > > > > > > > > assumption that end > kernel_start and start < kernel_end, due to
> > > > > > > > > > > > > the first condition failing.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Both cases:
> > > > > > > > > > > > > (start < kernel_start && end < kernel_end) and
> > > > > > > > > > > > > (kernel_start - start > end - kernel_end)
> > > > > > > > > > > > > fall into the condition ( kernel_start + kernel_end > start + end )
> > > > > > > > > > > > > 
> > > > > > > > > > > > > And both the cases:
> > > > > > > > > > > > > (start > kernel_start && end > kernel_end) and
> > > > > > > > > > > > > (end - kernel_end > kernel_start - start)
> > > > > > > > > > > > > fall into the condition ( kernel_start + kernel_end < start + end )
> > > > > > > > > > > > > 
> > > > > > > > > > > > > ... unless of course I miss a case
> > > > > > > > > > > > Well, mathematically (i.e. ignoring the potential for overflow) the
> > > > > > > > > > > > original expression and your replacement are identical anyway. But
> > > > > > > > > > > > overflow needs to be taken into consideration, and hence there is a
> > > > > > > > > > > > (theoretical only at this point) risk with the replacement expression
> > > > > > > > > > > > as well. As a result I still think that ...
> > > > > > > > > > > > 
> > > > > > > > > > > > > > That said, in the "kernel range fully contained" case it may want
> > > > > > > > > > > > > > considering to use the tail range if it is large enough, rather than
> > > > > > > > > > > > > > the larger of the two ranges. In fact when switching to that model, we
> > > > > > > > > > > > > > ought to be able to get away with one less conditional, as then the
> > > > > > > > > > > > > > "kernel range fully contained" case doesn't need treating specially.
> > > > > > > > > > > > ... this alternative approach may want considering (provided we need
> > > > > > > > > > > > to make a change in the first place, which I continue to be
> > > > > > > > > > > > unconvinced of).
> > > > > > > > > > > Hmm, I see your point regarding the overflow.
> > > > > > > > > > > Given that start < kernel_end and end > kernel_start, this could
> > > > > > > > > > > be resolved by changing the above condition into:
> > > > > > > > > > > if ( kernel_end - start > end - kernel_start )
> > > > > > > > > > > 
> > > > > > > > > > > Would that work for you?
> > > > > > > > > > 
> > > > > > > > > > That would look quite a bit more natural, yes. But I don't think it covers
> > > > > > > > > > all cases: What if the E820 range is a proper sub-range of the kernel one?
> > > > > > > > > > If we consider kernel range crossing E820 region boundaries, we also need
> > > > > > > > > > to take that possibility into account, I think.
> > > > > > > > > 
> > > > > > > > > You are right, this case is not handled and can lead to either of the
> > > > > > > > > issues mentioned in commit message.
> > > > > > > > > Maybe we should check whether end > start before proceeding with
> > > > > > > > > checking the size.
> > > > > > > > 
> > > > > > > > It looks like it all boils down to the alternative I did sketch out.
> > > > > > > 
> > > > > > > I 'm not sure I fully understood the alternative.
> > > > > > > Do you mean sth in the lines below?
> > > > > > > 
> > > > > > >              if ( end <= kernel_start || start >= kernel_end )
> > > > > > >                  ; /* No overlap, nothing to do. */
> > > > > > >              /* Deal with the kernel already being loaded in the region. */
> > > > > > > -        else if ( kernel_start - start > end - kernel_end )
> > > > > > > +        else if ( start < kernel_start && end > kernel_end ) {
> > > > > > > +            if ( kernel_start - start > end - kernel_end )
> > > > > > > +                end = kernel_start;
> > > > > > > +            else
> > > > > > > +                start = kernel_end;
> > > > > > > +        }
> > > > > > > +        else if ( start < kernel_start )
> > > > > > >                  end = kernel_start;
> > > > > > > -        else
> > > > > > > +        else if ( end > kernel_end )
> > > > > > >                  start = kernel_end;
> > > > > > > +        else
> > > > > > > +            continue;
> > > > > > > 
> > > > > > >              if ( end - start >= size )
> > > > > > >                  return start;
> > > > > > 
> > > > > > Not exactly, no, because this still takes the size into account only
> > > > > > in this final if().
> > > > > > 
> > > > > > > You wouldn't like to consider this approach?
> > > > > > 
> > > > > > I'm happy to consider any other approach. Just that ...
> > > > > > 
> > > > > > >              if ( end <= kernel_start || start >= kernel_end )
> > > > > > >                  ; /* No overlap, nothing to do. */
> > > > > > >              /* Deal with the kernel already being loaded in the region. */
> > > > > > > -        else if ( kernel_start - start > end - kernel_end )
> > > > > > > +        else if ( kernel_end - start > end - kernel_start )
> > > > > > >                  end = kernel_start;
> > > > > > >              else
> > > > > > >                  start = kernel_end;
> > > > > > > 
> > > > > > > -        if ( end - start >= size )
> > > > > > > +        if ( end > start && end - start >= size )
> > > > > > >                  return start;
> > > > > > >          }
> > > > > > 
> > > > > > ... I'm afraid this doesn't deal well with the specific case I was
> > > > > > mentioning: If the E820 region is fully contained in the kernel range,
> > > > > > it looks to me as if this approach would ignore the E820 altogether,
> > > > > > since you either move end ahead of start or start past end then. Both
> > > > > > head and tail regions may be large enough in this case, and if this
> > > > > > was the only region above 1M, there'd be no other space to fall back
> > > > > > to.
> > > > > 
> > > > > Yes, in which case it will fail. This is legitimate.
> > > > 
> > > > Not really, if there is space available (but just not properly used).
> > > 
> > > I said so because I noticed that, if, for instance, the loading address
> > > conflicts with a reserved memory region, xen won't attempt to relocate
> > > the kernel (assuming that it is relocatable). It will fail.
> > 
> > Hmm, if so, perhaps yet something else to deal with.
> > 
> > > > > Currently, the code proceeds with the dom0 kernel being corrupted.
> > > > 
> > > > And we agree that this wants fixing.
> > > 
> > > Ok, and IIUC, using rangeset as per Roger's suggestion, right?
> > 
> > Going that route would be optimal of course, but I for one wouldn't
> > insist.
> 
> Roger what's your opinion on this? Would it be ok for now to send a v2 with
> just the change above (i.e. that might fail if the image extends over a
> really large memory area containing all usable memory regions) and implement
> later your suggested solution (probably taking into account in the
> implementation also image relocation aspect in case of conflicts)?
> 
> Jan would it be possible to sketch a patch of your suggested solution
> because I 'm afraid I have not fully understood it yet and I won't be able
> to implement it properly for a v2?

I think something like the fully untested patch below:

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index c7d47d0d4ce6..64ec8835d53e 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -517,8 +517,12 @@ static paddr_t __init find_memory(

         if ( end <= kernel_start || start >= kernel_end )
             ; /* No overlap, nothing to do. */
+        else if ( kernel_start <= start && kernel_end >= end )
+            /* Kernel is using the full region, skip it. */
+            continue;
         /* Deal with the kernel already being loaded in the region. */
-        else if ( kernel_start - start > end - kernel_end )
+        else if ( max(kernel_start, start) - start >
+                  end - min(kernel_end, end) )
             end = kernel_start;
         else
             start = kernel_end;

Should be enough to solve the issue with a kernel consuming several
e820 RAM regions entirely?

Could you also add a note to the commit message that the current code
assumes that all kernel loaded segments are mostly contiguous and
loaded in a single RAM region, but that's not suitable for Zephyr that
has segments scattered across possibly several different RAM regions.

A TODO in the code describing that it would be best to use a rangeset
for more fine grained accounting of memory used by the loaded kernel
segments would also be helpful IMO in order to remember that we
might want to fix this in the future.

Thanks, Roger.

