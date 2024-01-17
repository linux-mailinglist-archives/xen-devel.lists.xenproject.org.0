Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B0A830356
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 11:14:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668357.1040487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ2vc-0003Lp-Ud; Wed, 17 Jan 2024 10:13:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668357.1040487; Wed, 17 Jan 2024 10:13:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ2vc-0003Im-Rd; Wed, 17 Jan 2024 10:13:48 +0000
Received: by outflank-mailman (input) for mailman id 668357;
 Wed, 17 Jan 2024 10:13:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nKNn=I3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rQ2vb-0003Ig-F4
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 10:13:47 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19918270-b521-11ee-98f2-6d05b1d4d9a1;
 Wed, 17 Jan 2024 11:13:46 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40e88012233so7560035e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jan 2024 02:13:46 -0800 (PST)
Received: from localhost ([213.195.127.68]) by smtp.gmail.com with ESMTPSA id
 t6-20020a05600c198600b0040e48abec33sm25832806wmq.45.2024.01.17.02.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 02:13:45 -0800 (PST)
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
X-Inumbo-ID: 19918270-b521-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705486426; x=1706091226; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cqODN6HsCQ4V/AYR2PUI1Wy+AgPS0bX/hXyt93QoHms=;
        b=aSkoqwcsvJ9xgTnMxhNpaeXpc+gxgeMisGyfH37YYAxq0NsiUFE947POgZBF5Dk+oJ
         McOv965cXS8iohaWqpZAuw/qrPbO6iwxMpEmnV3SQ6UHQPFEQAy5L5mBuPRqF7na32MB
         jnCurVrB1ehvj2Ptl5aH7TOo8EyuS6IX7ijh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705486426; x=1706091226;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cqODN6HsCQ4V/AYR2PUI1Wy+AgPS0bX/hXyt93QoHms=;
        b=eTWjmAkXWyLNTDvT0AArBPKyLrO+4Tnjo3xyZJm84jrtf/Nn83UTDr8sdjZptql6hr
         agd/PYJkIy7joU6lGIxw0NWFFvRXEn7nh8KxXtIysC0nGbdruznn8gY1v9N6y7k83cYY
         hnC9DT06kRTnc1wE9cXEbWp/p5w3IwH37nSCUlr6kDnJ3eTwEKtznd0h2+Kff/1FqCtY
         Fz2cItJt0F++bpLG98x9DLpS71NPv46MI0oL5MTbPP9aYhpAS36noPL1LfKhoRUt5aDW
         MHVKWuEIcmCtkfRvWkpQ2+QBwwioRZLliv6H/U2m5uZZoXP5HCYX0B7qtr1zEK2O3hen
         IqAg==
X-Gm-Message-State: AOJu0YygAi8KE9dzhGsxlErN7C5yrRjXiCUn3t+s4VvYsTP8Es3Jbe+C
	s7G69Ct/IJSU5L1aLJfZZmUNC7I/2IQLXA==
X-Google-Smtp-Source: AGHT+IGzw0uQrRpmTV3pus5VVF4anOHA+Y8sKfTXz+SL+atzdgiHSvfKO0bbGI3w9r1kEGJyDgDGqA==
X-Received: by 2002:a05:600c:91c:b0:40e:45c0:ad66 with SMTP id m28-20020a05600c091c00b0040e45c0ad66mr5077856wmp.175.1705486425812;
        Wed, 17 Jan 2024 02:13:45 -0800 (PST)
Date: Wed, 17 Jan 2024 11:13:44 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Patrick Plenefisch <simonpatp@gmail.com>,
	xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Subject: Re: E820 memory allocation issue on Threadripper platforms
Message-ID: <ZaeoWBV8IEZap2mr@macbook>
References: <CAOCpoWdOH=xGxiQSC1c5Ueb1THxAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com>
 <1708c3d7-662a-44bc-b9b3-4ab9f8642d7b@suse.com>
 <dcaf9d8d-ad5a-4714-936b-79ed0e587f9d@suse.com>
 <CAOCpoWeowZPuQTeBp9nu8p8CDtE=u++wN_UqRoABZtB57D50Qw@mail.gmail.com>
 <ac742d12-ec91-4215-bb42-82a145924b4f@suse.com>
 <CAOCpoWfQmkhN3hms1xuotSUZzVzR99i9cNGGU2r=yD5PjysMiQ@mail.gmail.com>
 <fa23a590-5869-4e11-8998-1d03742c5919@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa23a590-5869-4e11-8998-1d03742c5919@suse.com>

On Wed, Jan 17, 2024 at 09:46:27AM +0100, Jan Beulich wrote:
> On 17.01.2024 07:12, Patrick Plenefisch wrote:
> > On Tue, Jan 16, 2024 at 4:33 AM Jan Beulich <jbeulich@suse.com> wrote:
> >> On 16.01.2024 01:22, Patrick Plenefisch wrote:
> >> It remains to be seen in how far it is reasonably possible to work
> >> around this in the kernel. While (sadly) still unsupported, in the
> >> meantime you may want to consider running Dom0 in PVH mode.
> >>
> > 
> > I tried this by adding dom0=pvh, and instead got this boot error:
> > 
> > (XEN) xenoprof: Initialization failed. AMD processor family 25 is not
> > supported
> > (XEN) NX (Execute Disable) protection active
> > (XEN) Dom0 has maximum 1400 PIRQs
> > (XEN) *** Building a PVH Dom0 ***
> > (XEN) Failed to load kernel: -1
> > (XEN) Xen dom0 kernel broken ELF: <NULL>
> > (XEN) Failed to load Dom0 kernel
> > (XEN)
> > (XEN) ****************************************
> > (XEN) Panic on CPU 0:
> > (XEN) Could not construct domain 0
> > (XEN) ****************************************
> > (XEN)
> > (XEN) Reboot in five seconds...
> 
> Hmm, that's sad. The more that the error messages aren't really
> informative. You did check though that your kernel is PVH-capable?
> (With a debug build of Xen, and with suitably high logging level,
> various of the ELF properties would be logged. Such output may or
> may not give further hints towards what's actually wrong. Albeit
> you using 4.17 this would further require you to pull in commit
> ea3dabfb80d7 ["x86/PVH: allow Dom0 ELF parsing to be verbose"].)
> 
> But wait - aren't you running into the same collision there with
> that memory region? I think that explains the unhelpful output.

I think so, elf_memcpy() in elf_load_image() is failing to load on the
given destination address.  Error messages should be more helpful
there.

> Whereas I assume the native kernel can deal with that as long as
> it's built with CONFIG_RELOCATABLE=y. I don't think we want to
> get into the business of interpreting the kernel's internal
> representation of the relocations needed, so it's not really
> clear to me what we might do in such a case. Perhaps the only way
> is to signal to the kernel that it needs to apply relocations
> itself (which in turn would require the kernel to signal to us
> that it's capable of doing so). Cc-ing Roger in case he has any
> neat idea.

Hm, no, not really.

We could do like multiboot2: the kernel provides us with some
placement data (min/max addresses, alignment), and Xen let's the
kernel deal with relocations itself.

Additionally we could support the kernel providing a section with the
relocations and apply them from Xen, but that's likely hm, complicated
at best, as I don't even know which kinds of relocations we would have
to support.

I'm not sure how Linux deals with this in the bare metal case, are
relocations done after decompressing and before jumping into the entry
point?

I would also need to check FreeBSD at least to have an idea of how
it's done there.

Thanks, Roger.

