Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D93817591
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 16:40:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656177.1024231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFFiz-0005V4-P5; Mon, 18 Dec 2023 15:40:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656177.1024231; Mon, 18 Dec 2023 15:40:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFFiz-0005R8-MR; Mon, 18 Dec 2023 15:40:09 +0000
Received: by outflank-mailman (input) for mailman id 656177;
 Mon, 18 Dec 2023 15:40:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W5ff=H5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rFFiy-0005Qz-R1
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 15:40:08 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b89e97d1-9dbb-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 16:40:07 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40c339d2b88so35431475e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 07:40:07 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 p3-20020a05600c1d8300b0040d1450ca7esm8574913wms.7.2023.12.18.07.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 07:40:06 -0800 (PST)
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
X-Inumbo-ID: b89e97d1-9dbb-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702914007; x=1703518807; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NmHPd+tai59XXrMio5amhviGiwqVEKpnXfd4MyFocSU=;
        b=PsV00VppNX++sLqRV95u/TAOwYbE0Xrac61jIqlSL5EPnxQSlzEZpk0sygqzooViSe
         1GzHsTlWQrF9orrRaWtS7NnByj8l2r8HOTj3H2tRueHhBRehvsXA7puD4X9eEfDUkver
         kl9+9nIa2sFtVlDcygMIaQTZKzfKV80+UKfzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702914007; x=1703518807;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NmHPd+tai59XXrMio5amhviGiwqVEKpnXfd4MyFocSU=;
        b=w8U9hAPw4ct0Lj58QjiMvN9uK9LK5AWO0krl+4l7GkS/fSMoymJfoZfsIIr6yvvYUv
         3zbmBCjyJrWdoRbWvFtpLcQGtM/lyVpaqssjAdYF6/2UNAohYOrrHBYExS0n3auOXJ+w
         QYGDQ4xgkH1D2hhR0kIQiWR3k1dbStrv41qqf3EY3xfu0dqZH6av0QZjPeNTgd1SEcO/
         +06P8ESZabAv2mtG347YyDEK1pZMb0f+ZR+RUVooR3iMHMoaA9guQ5I6r7bQeVHWNM0m
         fLxJzfR/HEUnF0yMeByqSpF9UIxKHCRGvMISaS8wGkXQ/fzWaCGeM9ieJjJn6yMoV68k
         vJow==
X-Gm-Message-State: AOJu0Yx3Nz4mJ4RomouM3HG25uCKpb7wKs2OO2mL2zgMtERPqvesMy4k
	eY7cO1cMb/rJe56JQSSCvBVzvQ==
X-Google-Smtp-Source: AGHT+IFyWtDq7geiU3M+yUNRhJH3i1yqL1jIMPXh4w9LNIWhObo1neWIguICihjSem1OTOafQpDQ1Q==
X-Received: by 2002:a05:600c:3556:b0:40b:5e1c:af2f with SMTP id i22-20020a05600c355600b0040b5e1caf2fmr8568853wmq.53.1702914007186;
        Mon, 18 Dec 2023 07:40:07 -0800 (PST)
Date: Mon, 18 Dec 2023 16:40:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 1/4] x86/spec-ctrl: add logic to issue IBPB on exit to
 guest
Message-ID: <ZYBn1XW0nbyqQoxq@macbook>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <31da79de-bd6b-af95-793a-c16516992bc7@suse.com>
 <ZYA3Db53Z3fvBlwn@macbook>
 <1c00c3ba-4d10-4cdc-ae2e-ca2fb2157be6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1c00c3ba-4d10-4cdc-ae2e-ca2fb2157be6@suse.com>

On Mon, Dec 18, 2023 at 02:46:37PM +0100, Jan Beulich wrote:
> On 18.12.2023 13:11, Roger Pau Monné wrote:
> > Hello,
> > 
> > I'm not as expert as Andrew in all the speculation stuff, but I will
> > try to provide some feedback.
> > 
> > On Tue, Feb 14, 2023 at 05:10:42PM +0100, Jan Beulich wrote:
> >> In order to be able to defer the context switch IBPB to the last
> >> possible point, add logic to the exit-to-guest paths to issue the
> >> barrier there, including the "IBPB doesn't flush the RSB/RAS"
> >> workaround. Since alternatives, for now at least, can't nest, emit JMP
> >> to skip past both constructs where both are needed. This may be more
> >> efficient anyway, as the sequence of NOPs is pretty long.
> > 
> > Could you elaborate on the reason why deferring the IBPB to the exit
> > to guest path is helpful?  So far it just seem to make the logic more
> > complex without nay justification (at least in the changelog).
> 
> I've added "(to leave behind as little as possible)" ahead of the 1st
> comma - is that sufficient, do you think?

Please bear with me, but I'm still uncertain.

Even if IBRS is not enabled, and such indirect branch predictions are
at the same predictor mode, how would that be of any use to a guest?
My understanding was that the attacker is the one that has to control
the indirect branch predictor contents in order to attack the
hypervisor or other guests.

> >> ---
> >> I have to admit that I'm not really certain about the placement of the
> >> IBPB wrt the MSR_SPEC_CTRL writes. For now I've simply used "opposite of
> >> entry".
> > 
> > Maybe it would easier to just add the MSR_PRED_CMD PRED_CMD_IBPB write
> > to the vmcs MSR load list?
> > 
> > It's a one-time only AFAICT, as you would only want to do this for
> > context-switch AFAICT.
> 
> That would be a back and forth of adding and removing the MSR to/from
> that list then, which I'm not convinced is helpful. With these special
> MSRs I would further be uncertain as to their effect when used via one
> of these lists.

Hm, we do seem to already use MSR_PRED_CMD with such lists, so I would
assume they work just fine.

Anyway, was mostly a recommendation towards clarity, because I think
the return to guest context assembly is getting rather convoluted, and
it's IMO critical for it to be easy to follow.

Thanks, Roger.

