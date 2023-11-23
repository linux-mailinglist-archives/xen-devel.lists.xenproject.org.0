Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCC37F5F00
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 13:26:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639694.997333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r68mM-00078z-Rl; Thu, 23 Nov 2023 12:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639694.997333; Thu, 23 Nov 2023 12:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r68mM-00077H-NX; Thu, 23 Nov 2023 12:25:58 +0000
Received: by outflank-mailman (input) for mailman id 639694;
 Thu, 23 Nov 2023 12:25:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RRmN=HE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r68mL-00077B-NS
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 12:25:57 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7315e04c-89fb-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 13:25:55 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40839652b97so5028955e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 04:25:55 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 c13-20020adfe70d000000b003316aeb280esm1492076wrm.104.2023.11.23.04.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 04:25:54 -0800 (PST)
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
X-Inumbo-ID: 7315e04c-89fb-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700742355; x=1701347155; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/HFJpuys/3C0iueHY40knEFy2BG8O360o9QtqcgX8nk=;
        b=oxnRSKphqhCAxEMMP42e+6GDE2D3Y74gzlUPlg+RSKZ967rgDIOcjejWT5LKlLxrh0
         lFg77EezoiGHH6RCYxHa7Y+eZpw4zju7gOO/9Y++TuL9sj5mdL12D1/gW5HNyhRhyXjD
         YuxURhUJWKESYhjWqoOldduHV+bhzghVOo2Ns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700742355; x=1701347155;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/HFJpuys/3C0iueHY40knEFy2BG8O360o9QtqcgX8nk=;
        b=k+fuNATOESPVDAGwxQmCGttTr8S0RnPRlapD5SD0Eu3dyM75U26pA5lPlkQDoJK47T
         3FJaj2n/KaqksPT8JIUxYVT7ZhcmqBc46TzPNUXB7rJwocrfvKYGtHF5BZMpQ8AiOD1X
         82TcukSHnuXVH7TZfV7s4kzR3/qkQGpkzBUFHlGuLSxs6jeEPmgMXPFhsamT1+z/pY8M
         SagjyFpLpzRnT2x411Ii5jKss7uTygNChzCKhHslLePbDq1ufgvWOQLFRloo9zo0AEp0
         Ea+4FKJkHp5+atZQ7v7tw2zQBPHRTlw05dTT+h+U3SGGXCHGJO+XXJq0rMsIxoBQx2Sn
         mHPQ==
X-Gm-Message-State: AOJu0YwwDP/8vmk1FnjgjrMay+MpVCSsxSKFwQYunDCW8vAzVHf3fO0X
	5INVwI9phoATBVquZ8Q3cfnvJg==
X-Google-Smtp-Source: AGHT+IE4uOJukdoW4ggmJjJ+gn8neCDCSoYapGuiCY1apY+EjzaP9LVKdM63vphb+MLcDYaeKGUtVw==
X-Received: by 2002:a05:600c:4f8f:b0:408:37aa:4766 with SMTP id n15-20020a05600c4f8f00b0040837aa4766mr4158290wmq.5.1700742355018;
        Thu, 23 Nov 2023 04:25:55 -0800 (PST)
Date: Thu, 23 Nov 2023 13:25:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/3] automation/alpine: add elfutils-dev and coreutils
 for livepatch-build-tools
Message-ID: <ZV9E0WQV2eQtkdzU@macbook>
References: <20231123112338.14477-1-roger.pau@citrix.com>
 <20231123112338.14477-2-roger.pau@citrix.com>
 <a55bd27f-a8e1-4ea8-9da7-b80bd424315d@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a55bd27f-a8e1-4ea8-9da7-b80bd424315d@citrix.com>

On Thu, Nov 23, 2023 at 11:51:33AM +0000, Andrew Cooper wrote:
> On 23/11/2023 11:23 am, Roger Pau Monne wrote:
> > In preparation for adding some livepatch-build-tools test update the Alpine
> > container to also install elfutils-dev, coreutils and GNU awk.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > I don't very much like to add coreutils and gawk, as it's also good to test
> > that we can build Xen with Busybox, but I also got tired of adjusting
> > livepatch-build-tools.
> 
> Right now, the alpine environment is the main one which spots violations
> of Xen's requirement for simply a POSIX-compliant awk, which I think
> this would break?

Likely, we also test on Cirrus using FreeBSD, so we would at least
spot instances where the extensions are not implemented by BSD sed.

> How much effort would it be fix livepatch-build-tools?  I think that
> would be preferable, and could be persuaded to do some simple busywork...

I can give it a try.

> What about coreutils?  Presumably that's down to some differences from
> busybox ?

Yeah, it's for the usage of `readlink -m` by livepatch-build-tools.

We will have to switch to using `readlink -f`, as that's the only
canonicalize option supported by BusyBox readlink.  Note that anyway
`readlink` is not part of POSIX.

Thanks, Roger.

