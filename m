Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D40C5836DE8
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 18:41:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670047.1042635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRyHl-0004sV-90; Mon, 22 Jan 2024 17:40:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670047.1042635; Mon, 22 Jan 2024 17:40:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRyHl-0004qT-5x; Mon, 22 Jan 2024 17:40:37 +0000
Received: by outflank-mailman (input) for mailman id 670047;
 Mon, 22 Jan 2024 17:40:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2apV=JA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rRyHk-0004e4-1r
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 17:40:36 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5906123f-b94d-11ee-98f2-6d05b1d4d9a1;
 Mon, 22 Jan 2024 18:40:35 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-337cc8e72f5so3167205f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 09:40:35 -0800 (PST)
Received: from localhost ([213.195.127.68]) by smtp.gmail.com with ESMTPSA id
 n4-20020adffe04000000b00339272c885csm7140634wrr.87.2024.01.22.09.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 09:40:34 -0800 (PST)
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
X-Inumbo-ID: 5906123f-b94d-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705945235; x=1706550035; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q+SrpK51QDdReu10ThtowKMJxCEsI/zF8+AdgSuIm0k=;
        b=YT0WlmeIoWeJ4BkGtDT8508Ck7wFNMbV6sr/yfQ3AtbqeNPvL6hp1uDR7b9KcWq0jF
         ssUALefqlVCB0GME1ZkargADyEhEksHMtPlUDofEbCjRPt5EkSZwfhvZz5yDjL40e5Lo
         iPVCwX18+ex3Fjs639rHk/rqaDdn7YZIfyLTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705945235; x=1706550035;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q+SrpK51QDdReu10ThtowKMJxCEsI/zF8+AdgSuIm0k=;
        b=vqkjhrD5lOOQy/PEqn8mYyj/5LLDYXpbRLDc5Z3QDJ2zqP8tipHkS82zZ1Xw1+qEgh
         86bYY70WUT26ZP+6vLMAufTojT2C5gctjolOAslnHjRzUc6mq4SIsT5YD1P7+YkUbH7V
         gxLo7Y8k/GP8TjfYeVPClYnDKJHBUQ/b5RSslakUJaRec6S+2HixUYLejlHSVVjJ+6Gb
         ud7DaCU4zaISp0x4X/BZxo9c1tWu/SlnLSHTFtVzOUq9WB7tPanOsDASgsexfDzh8qD9
         fALJP5ZHE56C8+ftvnI22T5+BYBtmTJYBjUYIb+q+duRI8ZQrpImwlyonjnKkjH6FWjG
         PQ0A==
X-Gm-Message-State: AOJu0YySRgK4n5MzF0XupoBTR8WvFEYzDNR6PlO/lmu7K9jnQf1kFRFW
	FavN616m6He/7f/c2m9a3rIvmk/zf87/LSqntwcZhqcfWZGaAOvIVRxRbFT2Xkk=
X-Google-Smtp-Source: AGHT+IGQeYk2Ak8Uvy2LGFsWHFRTG92FyPw3CFgRKzXpIzv84pS9P5uFPnV3I14MwAFIpTU0RHCFNQ==
X-Received: by 2002:a5d:698b:0:b0:339:3f40:ffd9 with SMTP id g11-20020a5d698b000000b003393f40ffd9mr495025wru.127.1705945234793;
        Mon, 22 Jan 2024 09:40:34 -0800 (PST)
Date: Mon, 22 Jan 2024 18:40:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Bobby Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v5 8/8] common: honor CONFIG_CC_SPLIT_SECTIONS also for
 assembly functions
Message-ID: <Za6okXTmLRDqEh_u@macbook>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <7a133ed9-9d13-4e2c-893a-00c083c8a35d@suse.com>
 <5df1d87d-8e54-4e15-b1fb-46b274cb66ef@suse.com>
 <ZapQoLSOKew5W-Tt@macbook>
 <81752c34-da03-45fc-9d57-9b91bdbfd833@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81752c34-da03-45fc-9d57-9b91bdbfd833@suse.com>

On Mon, Jan 22, 2024 at 11:50:08AM +0100, Jan Beulich wrote:
> On 19.01.2024 11:36, Roger Pau Monné wrote:
> > On Mon, Jan 15, 2024 at 03:40:19PM +0100, Jan Beulich wrote:
> >> Leverage the new infrastructure in xen/linkage.h to also switch to per-
> >> function sections (when configured), deriving the specific name from the
> >> "base" section in use at the time FUNC() is invoked.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> TBD: Since we use .subsection in UNLIKELY_START(), a perhaps not really
> >>      wanted side effect of this change is that respective out-of-line
> >>      code now moves much closer to its original (invoking) code.
> > 
> > Hm, I'm afraid I don't have much useful suggestions here.
> > 
> >> TBD: Of course something with the same overall effect, but less
> >>      impactful might do in Config.mk. E.g. $(filter-out -D%,$(3))
> >>      instead of $(firstword (3)).
> > 
> > I don't have a strong opinion re those two options  My preference
> > however (see below for reasoning) would be to put this detection in
> > Kconfig.
> > 
> >> TBD: On top of Roger's respective patch (for livepatch), also respect
> >>      CONFIG_FUNCTION_ALIGNMENT.
> > 
> > I think you can drop that, as the series is blocked.
> 
> Considering the series here has been pending for quite some time, too,
> I guess I'd like to keep it just in case that other functionality
> becomes unblocked or available by some other means, even if only to
> remind myself.

So as you have seen I've posted a new version of just the function
alignment patch, that I expected wasn't controversial.

> >> --- a/xen/Makefile
> >> +++ b/xen/Makefile
> >> @@ -409,6 +409,9 @@ AFLAGS += -D__ASSEMBLY__
> >>  
> >>  $(call cc-option-add,AFLAGS,CC,-Wa$$(comma)--noexecstack)
> >>  
> >> +# Check to see whether the assmbler supports the --sectname-subst option.
> >> +$(call cc-option-add,AFLAGS,CC,-Wa$$(comma)--sectname-subst -DHAVE_AS_SECTNAME_SUBST)
> > 
> > I guess you already know what I'm going to comment on.  I think this
> > would be clearer if it was a Kconfig option.  For once because I think
> > we should gate livapatch support on the option being available, and
> > secondly it would avoid having to pass the extra -D around.
> > 
> > I think it's relevant to have a consistent set of build tool options
> > requirements for livepatch support, so that when enabled the support
> > is consistent across builds.  With this approach livepatch could be
> > enabled in Kconfig, but depending on the tools support the resulting
> > binary might or might not support live patching of assembly code.
> > Such behavior is IMO unhelpful from a user PoV, and can lead to
> > surprises down the road.
> 
> I can see the desire to have LIVEPATCH grow such a dependency. Yet there
> is the bigger still open topic of the criteria towards what, if anything,
> to probe for in Kconfig, what, if anything, to probe for in Makefile, and
> which of the probing perhaps do in both places. I'm afraid my attempts to
> move us closer to a resolution (topic on summit, making proposals on
> list) have utterly failed. IOW I don't currently see how the existing
> disagreement there can be resolved, which will result in me to continue
> following the (traditional) Makefile approach unless I clearly view
> Kconfig superior in a particular case. I could perhaps be talked into
> following a "mixed Kconfig/Makefile model", along the lines of "x86:
> convert CET tool chain feature checks to mixed Kconfig/Makefile model",
> albeit I'm sure you're aware there are issues to sort out there, which I
> see no value in putting time into as long as I can't expect things to
> make progress subsequently.

I think there are more subtle cases where it's indeed arguable that
putting it in Kconfig or a Makefile makes no difference from a user
experience PoV, hence in the context here I do believe it wants to be
in Kconfig as LIVEPATCH can be make dependent on it.

> Dropping this patch, while an option, would seem undesirable to me, since
> even without Kconfig probing using new enough tool chains the splitting
> would yield reliable results, and provide - imo - an improvement over
> what we have right now.

I could send a followup afterwards to arrange for the check to be in
Kconfig, but it would feel a bit odd to me this is not done in the
first place.

I don't want to block the patch because I think it's useful, so worst
case I'm willing to give my Ack and provide an alternative Kconfig
based patch afterwards.

Thanks, Roger.

