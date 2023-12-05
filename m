Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECF68058DE
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 16:37:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648046.1011973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAXTi-0003vo-JK; Tue, 05 Dec 2023 15:36:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648046.1011973; Tue, 05 Dec 2023 15:36:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAXTi-0003uA-G8; Tue, 05 Dec 2023 15:36:54 +0000
Received: by outflank-mailman (input) for mailman id 648046;
 Tue, 05 Dec 2023 15:36:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jRF5=HQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rAXTg-0003u3-P0
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 15:36:52 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c6b7ce7-9384-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 16:36:51 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40bda47c489so39722465e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 07:36:51 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 t20-20020a05600c199400b0040b36ad5413sm19067222wmq.46.2023.12.05.07.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 07:36:51 -0800 (PST)
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
X-Inumbo-ID: 1c6b7ce7-9384-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701790611; x=1702395411; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sf6UFn4hQmCUidzIu1RkJcmNBUYW3Y7dhR4WaIDgfbA=;
        b=g5PpHJ2ufXmkm4eO5qizQjB3kPCGvoIX5jNq4UHGPloVqpckSeMzSXlKOOWKZJvG4x
         PCZcAd0Rqseed4z04xfVm7OBGy96Vph9Gg60Z1FGCNVCLn1UdGQbDa96bM1psEmZth9W
         5WrPavkBPsjgVCGXGY8PzzpfGXASsmYuMbzrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701790611; x=1702395411;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sf6UFn4hQmCUidzIu1RkJcmNBUYW3Y7dhR4WaIDgfbA=;
        b=ZPX63wC3P7LSuwT9xZO28l+AT0AsGr1eSJe9cA+MlQd8I0a7vX6bBEBfcCo78YMKR7
         THwI1/xVNE6prINujUUtJxAQPINT8868S14S4FTRIVAqbE7ZclPPElGaTxVTcL5FNcmK
         dOgzofT2dSEDj94z/HW6Uw0BPSyChxArQnSpO4Z+oXEqoR4SYm58RP8TlSiTp03q2P5W
         rVICsvGxxopSRKUEF1kYKrbE75uXxJj5fJywGMojlZ26qgIwN430HIbSLGNQaIodzQWv
         76LY59orSJyUgjSQen7nZ1FM5SCfIbbvIO6oV8lHJRuQjhe2I1fPuIlemXpPV8z+M0yP
         A/YQ==
X-Gm-Message-State: AOJu0YwXM7gCW0kLeJk/TtUEUXoSfTWFBxit5km0+qw49To87PNURfm5
	qX2q60bl1gECT822JDLShHx58Q==
X-Google-Smtp-Source: AGHT+IFpx4Y/BhD7U+yrwtSw4bFDAWj1T0il697jRJ9j+HlzndQUXzarOvhRDEo4yD8Vxkm4J5/TiQ==
X-Received: by 2002:a05:600c:4fce:b0:408:3c10:ad47 with SMTP id o14-20020a05600c4fce00b004083c10ad47mr703397wmq.40.1701790611308;
        Tue, 05 Dec 2023 07:36:51 -0800 (PST)
Date: Tue, 5 Dec 2023 16:36:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/5] x86/livepatch: set function alignment to ensure
 minimal function size
Message-ID: <ZW9DkoiVHhlzM6yA@macbook>
References: <20231128100352.35430-1-roger.pau@citrix.com>
 <20231128100352.35430-2-roger.pau@citrix.com>
 <ddbf1fad-e0c1-4b7c-9734-71d4997b5aa0@citrix.com>
 <ZW87Qq3Hw4ql-ZFw@macbook>
 <29b2d864-2b3f-4a74-9d61-534523e842cd@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <29b2d864-2b3f-4a74-9d61-534523e842cd@suse.com>

On Tue, Dec 05, 2023 at 04:14:57PM +0100, Jan Beulich wrote:
> On 05.12.2023 16:01, Roger Pau Monné wrote:
> > On Tue, Dec 05, 2023 at 01:42:42PM +0000, Andrew Cooper wrote:
> >> On 28/11/2023 10:03 am, Roger Pau Monne wrote:
> >>> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> >>> index f3abdf9cd111..f629157086d0 100644
> >>> --- a/xen/arch/x86/Makefile
> >>> +++ b/xen/arch/x86/Makefile
> >>> @@ -82,6 +82,8 @@ obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
> >>>  obj-y += sysctl.o
> >>>  endif
> >>>  
> >>> +CFLAGS-$(CONFIG_LIVEPATCH) += -falign-functions=$(CONFIG_CC_FUNCTION_ALIGNMENT)
> >>
> >> I'd really prefer not to express it like this.  For one, a major reason
> >> for using an alignment of 16b or more is simply performance.
> >>
> >> Also, it isn't "CC" when we get the asm macros working.
> >>
> >> Copy Linux more closely.  Then, you have LIVEPATCH select
> >> FUNCTION_ALIGNMENT_{8,16}B as appropriate.  And PERFORMANCE selects
> >> FUNCTION_ALIGNMENT_16B or perhaps 32B depending on uarch.
> > 
> > So just use CONFIG_FUNCTION_ALIGNMENT and drop the CC part of it?
> > That would indeed be fine.  We will also need to adjust
> > CC_SPLIT_SECTIONS to drop the CC_ prefix when we start using it in
> > assembly code.
> 
> Could we prune the CC infixes once everything is settled asm-code-wise?

That would also be fine by me.

> >> If we ever get around to having KCFI, then we need 16B irrespective of
> >> anything else.
> >>
> >>
> >>
> >> As for the subject, it's not really about size; the function size is
> >> still going to be small irrespective of the alignment.
> > 
> > What about wording it like:
> > 
> > x86/livepatch: set function alignment to ensure minimal space between functions
> 
> This still wouldn't be right, as there may be no padding at all between
> functions (if they're just the right size).

But no padding would still be fine given the text above, as then the
minimal space requirement is already meet?

> Maybe "minimal distance
> between function entry points"? Getting long-ish, though ...

Oh, I see.  You want to explicitly mention the distance is between
function entry points, as otherwise one way to read the subject would
be distance between function end and next function entry point?

It's indeed a bit long for my taste, but I don't mind adjusting if you
think the current wording could cause confusion.

Thanks, Roger.

