Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F01839C0A84
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 16:56:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832069.1247464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t94rm-0000JF-GK; Thu, 07 Nov 2024 15:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832069.1247464; Thu, 07 Nov 2024 15:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t94rm-0000Gg-CR; Thu, 07 Nov 2024 15:56:14 +0000
Received: by outflank-mailman (input) for mailman id 832069;
 Thu, 07 Nov 2024 15:56:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GEtt=SC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t94rl-0000GY-9m
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 15:56:13 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce23df45-9d20-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 16:56:09 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a93c1cc74fdso157570566b.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 07:56:09 -0800 (PST)
Received: from localhost ([213.195.124.162]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a18508sm109872366b.6.2024.11.07.07.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 07:56:08 -0800 (PST)
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
X-Inumbo-ID: ce23df45-9d20-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzQiLCJoZWxvIjoibWFpbC1lajEteDYzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImNlMjNkZjQ1LTlkMjAtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTk0OTY5LjY2MTM2OCwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730994969; x=1731599769; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uhLPmwMNl7CD4kKhHqD6vHYIFwnFoulavutnZCQ3ido=;
        b=jcvj5zBfL6AzexAuBS68MbVO3Chg+7xoRhjJNgqdtIwW8t4nZ1zo+LIGWMtNhwnRtm
         gaIuWAKFcpjiFWvdktkQ7Z1CfjOyCS8WfvR/64l95Q2pjf8cveRMwKTe0x9EvEgksZ0D
         K4xRBkfv05kOBcQ7Pkdg5D9ctv3GV/Wp/s20k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730994969; x=1731599769;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uhLPmwMNl7CD4kKhHqD6vHYIFwnFoulavutnZCQ3ido=;
        b=Cb6rw+c+KW18hm01RQSsKx6dq56ViSkxA9zUNVe44wLXOP+n/sniB0gQBwHTmdhGNE
         kS2k6reCxFslrIyCZuQX1C9O/coG6BUc0mC2eOVpfS0G/9h8CuhuNJmV3oyxwHhpCqA+
         beavEd1kgLS2dq+qYm0iBk50IIzNG2apdDbwK+Thpkl0neeADBs/uaswJ+g1RpTW8l0g
         rCp222coxxk1WrbbT2c0DyqnBV8VQgODJ1s6Zd7CTxGP2fstzkiv1zVFDONkAsfujryq
         rcXtlIEd60D0pjnJhaj/8rEz1laryisvqrwwlpgy5DwNij07Lj0Eoon4KAFtWcyHPv+E
         wWKg==
X-Forwarded-Encrypted: i=1; AJvYcCVJXzLXHd5D//qmfx8lDkqI5B0JA8Lp8ROM/bthkW8wBmMgSMMHqGyB5NsErIher1ykBddBdmI3naU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydTbtNLD4U+9pQCqg5Wys8CiWWGLD9kRMGy8qlH2lwKo1s+cOa
	hW3FwmNHpG7MwyYd3Dnah011VQlilfIoOncElW+IAhTJj/ct7HY9wdESRQ0ZqPfUkez3mBXVerv
	D
X-Google-Smtp-Source: AGHT+IHPLc309EpWj5d2yCndgDc0e1nHQkjj8EF4pfYfk2w3zDC//PTLLsgKnJc6uqTAv7w6ixV/Ew==
X-Received: by 2002:a17:907:3e08:b0:a9a:9df:5581 with SMTP id a640c23a62f3a-a9e655b9595mr2267078466b.38.1730994969045;
        Thu, 07 Nov 2024 07:56:09 -0800 (PST)
Date: Thu, 7 Nov 2024 16:56:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/x86: prevent addition of .note.gnu.property if
 livepatch is enabled
Message-ID: <ZyzjF9S0ZeWEAOWB@macbook>
References: <20241107145952.73403-1-roger.pau@citrix.com>
 <0cd98d20-9377-479a-8f24-ebfdbfceda8f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0cd98d20-9377-479a-8f24-ebfdbfceda8f@suse.com>

On Thu, Nov 07, 2024 at 04:14:20PM +0100, Jan Beulich wrote:
> On 07.11.2024 15:59, Roger Pau Monne wrote:
> > GNU assembly that supports such feature will unconditionally add a
> > .note.gnu.property section to object files.  The content of that section can
> > change depending on the generated instructions.  The current logic in
> > livepatch-build-tools doesn't know how to deal with such section changing
> > as a result of applying a patch and rebuilding.
> > 
> > Since .note.gnu.property is not consumed by the Xen build, suppress its
> > addition when livepatch support is enabled.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> Just one thing though:
> 
> > --- a/xen/arch/x86/arch.mk
> > +++ b/xen/arch/x86/arch.mk
> > @@ -26,6 +26,12 @@ $(call as-option-add,CFLAGS,CC,"invpcid (%rax)$(comma)%rax",-DHAVE_AS_INVPCID)
> >  $(call as-option-add,CFLAGS,CC,"movdiri %rax$(comma)(%rax)",-DHAVE_AS_MOVDIR)
> >  $(call as-option-add,CFLAGS,CC,"enqcmd (%rax)$(comma)%rax",-DHAVE_AS_ENQCMD)
> >  
> > +# Disable the addition of a .note.gnu.property section to object files when
> > +# livepatch support is enabled.  The contents of that section can change
> > +# depending on the instructions used, and livepatch-build-tools doesn't know
> > +# how to deal with such changes.
> > +$(call cc-option-add,CFLAGS-$(CONFIG_LIVEPATCH),CC,-Wa$$(comma)-mx86-used-note=no)
> > +
> >  # Check to see whether the assmbler supports the .nop directive.
> >  $(call as-option-add,CFLAGS,CC,\
> >      ".L1: .L2: .nops (.L2 - .L1)$(comma)9",-DHAVE_AS_NOPS_DIRECTIVE)
> 
> I don't really like this being squashed between two as-option-add invocations.
> Can this be moved down, e.g. before or after the XEN_IBT chunk? Happy to move
> while committing ...

Feel free to move it.

Roger.

