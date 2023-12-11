Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0C380CA0D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 13:43:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651763.1017578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCfd5-00051t-RW; Mon, 11 Dec 2023 12:43:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651763.1017578; Mon, 11 Dec 2023 12:43:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCfd5-0004zx-Oo; Mon, 11 Dec 2023 12:43:23 +0000
Received: by outflank-mailman (input) for mailman id 651763;
 Mon, 11 Dec 2023 12:43:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ojZ6=HW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rCfd4-0004zr-DM
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 12:43:22 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd2984ff-9822-11ee-9b0f-b553b5be7939;
 Mon, 11 Dec 2023 13:43:20 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40c2bb872e2so40705605e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 04:43:20 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 e16-20020adffd10000000b003346db01263sm8469465wrr.104.2023.12.11.04.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 04:43:19 -0800 (PST)
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
X-Inumbo-ID: dd2984ff-9822-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702298600; x=1702903400; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rUUU/K/HVXxpUc9thMCl7fVRiegyi2yXlLe4cs6Fy58=;
        b=Vpt2lQmfMAaTux/iZmIV9FXv9kZMnOkNqVD3dlileclFzCeJtRL33h/aLGdj+6uDup
         GlsJfSmv/xXJe2E0DIpf4nGc+LXZmLdd6wcv5maAMqg29NgFFQDqYwaYx/KWDg3br3K2
         4MV2X8av/9oAZNo7rQt/7qkhyKzdAfqu30tk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702298600; x=1702903400;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rUUU/K/HVXxpUc9thMCl7fVRiegyi2yXlLe4cs6Fy58=;
        b=qqZ9kAKl61WM/rAbp/BXvJNk3qeFat4PanV9whDgu16LLUQMhkuD3mp4qCtsXH229O
         8aynebXI0e42n5oyI88yMzU6Vgo1UybcPUTEzUYplr8fXdFdeHZHNdotOXsJPYJSDeli
         qqj9i+FGGWwmwYYYNLP1kwcTdUewaD5//MA5YVRdzLi2UGIy4fn8kSgjpd8gEFwzqbpR
         AJDCfUwBkiYNOuaJthV1dIMnfatH8Mg4DseFm1qhAFwBACUzTELp0QORkLpBnNuwPs28
         VQEDQgZ9cRHlE0+JkdG5sHNVeJTkJlRlzXbi3AhoyIGGEcCjAw98COWgFTnPKTOqTAS5
         vUiQ==
X-Gm-Message-State: AOJu0YyXOkGheQVX7LBbFN4SVEUHnx12cwcSY5bdoHXl0TS59eYp9Mvp
	9Uxn45gTwMsfPb5SjM1iYd+mcg==
X-Google-Smtp-Source: AGHT+IHy/HX979Dz+f4Ul5DAeasYsnUuj8FyJwRpmpSEyNYllj67bmZtQfotnabDG9HvZIeiFJ5bjw==
X-Received: by 2002:a05:600c:1705:b0:40c:7a7:9b08 with SMTP id c5-20020a05600c170500b0040c07a79b08mr1014599wmn.119.1702298599769;
        Mon, 11 Dec 2023 04:43:19 -0800 (PST)
Date: Mon, 11 Dec 2023 13:43:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 2/6] x86/HVM: split restore state checking from state
 loading
Message-ID: <ZXcD5lsCd6E_HBbe@macbook>
References: <49a17ffa-c873-4b0f-81ed-9587053ca159@suse.com>
 <dcc726f5-634e-4b48-aa8f-d477cdc8dea9@suse.com>
 <ZW4L5Q4SMprtmbK-@macbook>
 <5f7c43ca-dfc4-4929-8776-6985e610e154@suse.com>
 <ZW8zyXkUJDKVt-HX@macbook>
 <2ded19f7-2ba6-4b1c-8752-a73894dcdae0@suse.com>
 <ZW9H1uE_6k3d-uWn@macbook>
 <21cdb9ad-81f5-497a-bfd8-ef6aea5906e2@suse.com>
 <ZXbodK0CcT5U1i5V@macbook>
 <011bdf3f-6cbd-49e6-b1d8-10c77722664e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <011bdf3f-6cbd-49e6-b1d8-10c77722664e@suse.com>

On Mon, Dec 11, 2023 at 12:31:11PM +0100, Jan Beulich wrote:
> On 11.12.2023 11:46, Roger Pau Monné wrote:
> > On Wed, Dec 06, 2023 at 08:27:59AM +0100, Jan Beulich wrote:
> >> On 05.12.2023 16:55, Roger Pau Monné wrote:
> >>> On Tue, Dec 05, 2023 at 03:59:13PM +0100, Jan Beulich wrote:
> >>>> On 05.12.2023 15:29, Roger Pau Monné wrote:
> >>>>> On Tue, Dec 05, 2023 at 09:52:31AM +0100, Jan Beulich wrote:
> >>>>>> On 04.12.2023 18:27, Roger Pau Monné wrote:
> >>>>>>> On Tue, Nov 28, 2023 at 11:34:04AM +0100, Jan Beulich wrote:
> >>>>>>>> ..., at least as reasonably feasible without making a check hook
> >>>>>>>> mandatory (in particular strict vs relaxed/zero-extend length checking
> >>>>>>>> can't be done early this way).
> >>>>>>>>
> >>>>>>>> Note that only one of the two uses of hvm_load() is accompanied with
> >>>>>>>> hvm_check(). The other directly consumes hvm_save() output, which ought
> >>>>>>>> to be well-formed. This means that while input data related checks don't
> >>>>>>>> need repeating in the "load" function when already done by the "check"
> >>>>>>>> one (albeit assertions to this effect may be desirable), domain state
> >>>>>>>> related checks (e.g. has_xyz(d)) will be required in both places.
> >>>>>>>>
> >>>>>>>> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> >>>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>>>>>> ---
> >>>>>>>> Do we really need all the copying involved in use of _hvm_read_entry()
> >>>>>>>> (backing hvm_load_entry()? Zero-extending loads are likely easier to
> >>>>>>>> handle that way, but for strict loads all we gain is a reduced risk of
> >>>>>>>> unaligned accesses (compared to simply pointing into h->data[]).
> >>>>>>>
> >>>>>>> See below, but I wonder whether the checks could be performed as part
> >>>>>>> of hvm_load() without having to introduce a separate handler and loop
> >>>>>>> over the context entries.
> >>>>>>
> >>>>>> Specifically not. State loading (in the longer run) would better not fail
> >>>>>> once started. (Imo it should have been this way from the beginning.) Only
> >>>>>> then will the vCPU still be in a predictable state even after a possible
> >>>>>> error.
> >>>>>
> >>>>> Looking at the callers, does such predictable state after failure
> >>>>> matter?
> >>>>>
> >>>>> One caller is an hypercall used by the toolstack at domain create,
> >>>>> failing can just lead to the domain being destroyed.  The other caller
> >>>>> is vm fork, which will also lead to the fork being destroyed if
> >>>>> context loading fails.
> >>>>>
> >>>>> Maybe I'm overlooking something.
> >>>>
> >>>> You don't (I think), but existing callers necessarily have to behave the
> >>>> way you describe. From an abstract perspective, though, failed state
> >>>> loading would better allow a retry. And really I thought that when you
> >>>> suggested to split checking from loading, you had exactly that in mind.
> >>>
> >>> Not really TBH, because I didn't think that much on a possible
> >>> implementation when proposing it.
> >>
> >> But what else did you think of then in terms of separating checking from
> >> loading?
> > 
> > Just calling the check and load functions inside of the same loop was
> > my initial thought.
> 
> Okay, I was meanwhile also guessing that this might have been what you
> thought of. I can go that route, but I wouldn't want to make it "and", but
> "or" then, depending on a new boolean parameter to be passed to hvm_load().
> IOW I'd still like to do all checking before all loading (in the longer
> run, that is i.e. after individual handlers have been adapted). Would that
> be okay with you?

Yes, that would be fine.  I assume you will introduce a 'dry run'
parameter then?

Thanks, Roger.

