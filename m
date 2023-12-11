Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B44A80C6FD
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 11:46:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651646.1017425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCdnm-0005YF-AL; Mon, 11 Dec 2023 10:46:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651646.1017425; Mon, 11 Dec 2023 10:46:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCdnm-0005Vg-75; Mon, 11 Dec 2023 10:46:18 +0000
Received: by outflank-mailman (input) for mailman id 651646;
 Mon, 11 Dec 2023 10:46:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ojZ6=HW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rCdnk-0005Uo-PD
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 10:46:16 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 819dc5d1-9812-11ee-9b0f-b553b5be7939;
 Mon, 11 Dec 2023 11:46:14 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40b27726369so45944615e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 02:46:14 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 ay35-20020a05600c1e2300b0040b2b38a1fasm12621649wmb.4.2023.12.11.02.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 02:46:13 -0800 (PST)
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
X-Inumbo-ID: 819dc5d1-9812-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702291574; x=1702896374; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6kY1G0UYuo0Sln2JCppCjtL7Z6jveHyI9yioNk2/OZ4=;
        b=KpMmiHSg9Oc6zeao/L2Ih92mWDWiHF5NoKNCoRmhWQZjmrcbbwucEL1SsH4sdEJ0Lb
         bPUPPLvrTDVmGzGjHNyLgypEGj767lq3S5kFAqgZei+iDswSQbVUYuXMsQjAyff8cSRU
         WeW0Jxb7x92qQUBV/Ca7aOpXj7+LOKnDBMy5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702291574; x=1702896374;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6kY1G0UYuo0Sln2JCppCjtL7Z6jveHyI9yioNk2/OZ4=;
        b=VD8mim2dWs/nGhs2nnO25S8r21250B+CYKeFpoKNotiG7YWazHPB8rDqEzy77duLl6
         dUEMXfYp0n1wIzP9peaxJ3NFwW9sg9o4mZxr8Suz+ixJMvPrzLBko+J3iVI2A9oNdIKx
         mhjO8p7d6DaUo+MNwAclqrw5LCESuaCbdPQSsaaGfO/86sa0fcS1nHapGs0p/J5LTNFO
         FNimHtk0iAxIDnopMm2Raqp2xQKWf6lOA6qBB2biuJ7+bKWo8aXv8IKDFW9XgkdU6ayP
         hz7nZ8zZGyPIQkeHbnImBt8OvlvqQtH+lSUo3VpFGtyBk8HJetgw+9595LP3aSBhAMWs
         VFIQ==
X-Gm-Message-State: AOJu0YwLCyo+y9U6QxzDXRWpGjO2DeaPG07pmeIQG+o5XakBHvWLb6QV
	kzx0z1wKRH5dwC5K2rJXVlmKKg==
X-Google-Smtp-Source: AGHT+IEDo2gxs5YDFu8ldk07w7vKmQXLTB8IipVtNeDnGw3fUyRDbs6RtP1BYpA9RPCB3pu9jOAung==
X-Received: by 2002:a05:600c:2e42:b0:40c:314a:426 with SMTP id q2-20020a05600c2e4200b0040c314a0426mr2155657wmf.156.1702291574221;
        Mon, 11 Dec 2023 02:46:14 -0800 (PST)
Date: Mon, 11 Dec 2023 11:46:12 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 2/6] x86/HVM: split restore state checking from state
 loading
Message-ID: <ZXbodK0CcT5U1i5V@macbook>
References: <49a17ffa-c873-4b0f-81ed-9587053ca159@suse.com>
 <dcc726f5-634e-4b48-aa8f-d477cdc8dea9@suse.com>
 <ZW4L5Q4SMprtmbK-@macbook>
 <5f7c43ca-dfc4-4929-8776-6985e610e154@suse.com>
 <ZW8zyXkUJDKVt-HX@macbook>
 <2ded19f7-2ba6-4b1c-8752-a73894dcdae0@suse.com>
 <ZW9H1uE_6k3d-uWn@macbook>
 <21cdb9ad-81f5-497a-bfd8-ef6aea5906e2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <21cdb9ad-81f5-497a-bfd8-ef6aea5906e2@suse.com>

On Wed, Dec 06, 2023 at 08:27:59AM +0100, Jan Beulich wrote:
> On 05.12.2023 16:55, Roger Pau Monné wrote:
> > On Tue, Dec 05, 2023 at 03:59:13PM +0100, Jan Beulich wrote:
> >> On 05.12.2023 15:29, Roger Pau Monné wrote:
> >>> On Tue, Dec 05, 2023 at 09:52:31AM +0100, Jan Beulich wrote:
> >>>> On 04.12.2023 18:27, Roger Pau Monné wrote:
> >>>>> On Tue, Nov 28, 2023 at 11:34:04AM +0100, Jan Beulich wrote:
> >>>>>> ..., at least as reasonably feasible without making a check hook
> >>>>>> mandatory (in particular strict vs relaxed/zero-extend length checking
> >>>>>> can't be done early this way).
> >>>>>>
> >>>>>> Note that only one of the two uses of hvm_load() is accompanied with
> >>>>>> hvm_check(). The other directly consumes hvm_save() output, which ought
> >>>>>> to be well-formed. This means that while input data related checks don't
> >>>>>> need repeating in the "load" function when already done by the "check"
> >>>>>> one (albeit assertions to this effect may be desirable), domain state
> >>>>>> related checks (e.g. has_xyz(d)) will be required in both places.
> >>>>>>
> >>>>>> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> >>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>>>> ---
> >>>>>> Do we really need all the copying involved in use of _hvm_read_entry()
> >>>>>> (backing hvm_load_entry()? Zero-extending loads are likely easier to
> >>>>>> handle that way, but for strict loads all we gain is a reduced risk of
> >>>>>> unaligned accesses (compared to simply pointing into h->data[]).
> >>>>>
> >>>>> See below, but I wonder whether the checks could be performed as part
> >>>>> of hvm_load() without having to introduce a separate handler and loop
> >>>>> over the context entries.
> >>>>
> >>>> Specifically not. State loading (in the longer run) would better not fail
> >>>> once started. (Imo it should have been this way from the beginning.) Only
> >>>> then will the vCPU still be in a predictable state even after a possible
> >>>> error.
> >>>
> >>> Looking at the callers, does such predictable state after failure
> >>> matter?
> >>>
> >>> One caller is an hypercall used by the toolstack at domain create,
> >>> failing can just lead to the domain being destroyed.  The other caller
> >>> is vm fork, which will also lead to the fork being destroyed if
> >>> context loading fails.
> >>>
> >>> Maybe I'm overlooking something.
> >>
> >> You don't (I think), but existing callers necessarily have to behave the
> >> way you describe. From an abstract perspective, though, failed state
> >> loading would better allow a retry. And really I thought that when you
> >> suggested to split checking from loading, you had exactly that in mind.
> > 
> > Not really TBH, because I didn't think that much on a possible
> > implementation when proposing it.
> 
> But what else did you think of then in terms of separating checking from
> loading?

Just calling the check and load functions inside of the same loop was
my initial thought.

> > Maybe a suitable compromise would be to reset the state to the initial
> > (at domain build) one on failure?
> 
> That's an option, sure.
> 
> > I do dislike the duplicated loops, as it seems like a lot of duplicate
> > boilerplate code, and I have fears of it going out of sync.
> 
> There's a certain risk, yes, but that exists similarly with the save and
> load sides imo.

Hm, yes, albeit I have the feeling those are not as similar as the
proposed check and load loops.

Thanks, Roger.

