Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA516A1A04F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2025 10:02:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876098.1286453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tat5W-0003G8-Lg; Thu, 23 Jan 2025 09:01:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876098.1286453; Thu, 23 Jan 2025 09:01:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tat5W-0003Dv-IJ; Thu, 23 Jan 2025 09:01:22 +0000
Received: by outflank-mailman (input) for mailman id 876098;
 Thu, 23 Jan 2025 09:01:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lw3w=UP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tat5V-0003Dp-AO
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 09:01:21 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b218580-d968-11ef-99a4-01e77a169b0f;
 Thu, 23 Jan 2025 10:01:17 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5d3f57582a2so3824202a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 01:01:17 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5db73edce5csm9789295a12.75.2025.01.23.01.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 01:01:15 -0800 (PST)
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
X-Inumbo-ID: 9b218580-d968-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737622877; x=1738227677; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XB00nACidL2dpJz4IlvCpGEqsXYyoGUAUemDPBhT2Co=;
        b=Bb4NgSu6qzmwEluKb6CL9FTI06VeOHjMNQafkiMhABF4NR7MKZWsDlu3GK3iGgsuym
         sWrmvgjuxDA9OIIJpn0oed/cyEi1FcuiAyzP7yz7yaFW1fPseDd8MCMgySpemtNmDF8f
         +ufPb3qWwZCT9WkRXQzVSo0I5x15kmAkSDhPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737622877; x=1738227677;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XB00nACidL2dpJz4IlvCpGEqsXYyoGUAUemDPBhT2Co=;
        b=ACaZQuj22j9yzu/wQQmKuerGk1VujlOuh3nGdTZ4oDt1CszCFxrxsJr9HzcUrTF6Gb
         OdPXu7otY+MehmmeHVERlIh7xg3NuKScMT73TVNTJ6GVBfHxOlBaTlbsFny7EllfhuyC
         KSewZfN2xLBTB2V/4dNFpZmfxwwT+DqpAg2HVJig7410Dmywl+oNkXjpQMrywUQc83tE
         m0Gii1jDONTJu5UoXCKoO7OzgtOMuyn41thTh0QSHmqmwgJ7qF5dpTwS2NSOdoXzfrG7
         XjpPP1MfpD79RC2n0Zuoj6y1y59Lzi2CPv49ugVexvWOboF+sOHbhYUglH+Byix/jlYk
         q0mg==
X-Gm-Message-State: AOJu0YwMGbhxxkWvs/KSF7lFhE9BLvTbh8B5ecFon4Wz8ONXB38affL6
	Xy7gxPxxATYdXPqgSgFaLwylZpCYbW7gWH71ZO+PLnq69dntWSyHpP/c647Z1DiA/LhIzYPvBQ/
	+
X-Gm-Gg: ASbGncsjCPV5nNQnhZZ+x8TFZzEa/C0dtBfA0o5g2jDkxWtlF6wilVJxZq2VarMUfL8
	RWBgLpYGDxTWHu7N778W/DAY4htQLANmCvKCPWPoc5K6/zrEeBdDOEGbz0kdk/PLMwdNang89RF
	TBV+8v9rXPw4pK1rG0GGNVUmann63svhfJWk4hLdH4P3glj/CdvqvDbew8yslbDY0k08vrKZds3
	oyGkgbcPSJbqSzkNZOReWepHJ3bOiQzPNMSnGdDwkygyONckRyUN+aOw6rhFrKNBFxj32Ra+6UH
	VOZIXlQZoQ==
X-Google-Smtp-Source: AGHT+IEly179ZaUSyz8Nfztfxuu1Cq6grlYUNtG9rotB7W/odsTFfibIemalY8EgsHCiWn9glQbo1g==
X-Received: by 2002:a05:6402:5211:b0:5d3:d79a:6d6d with SMTP id 4fb4d7f45d1cf-5dc07c07084mr2093354a12.0.1737622876927;
        Thu, 23 Jan 2025 01:01:16 -0800 (PST)
Date: Thu, 23 Jan 2025 10:01:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 5/5] x86/HVM: drop redundant access splitting
Message-ID: <Z5IFWQLbhCBk4XxY@macbook.local>
References: <3294f629-f91f-4b5d-9eb0-40a34aa2ec3e@suse.com>
 <7d73f0c5-3d16-4cf3-b8de-e45f539e8916@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d73f0c5-3d16-4cf3-b8de-e45f539e8916@suse.com>

On Tue, Oct 01, 2024 at 10:50:25AM +0200, Jan Beulich wrote:
> With all paths into hvmemul_linear_mmio_access() coming through
> linear_{read,write}(), there's no need anymore to split accesses at
> page boundaries there. Leave an assertion, though.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Replace ASSERT() by more safe construct.
> 
> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -1084,7 +1084,7 @@ static int hvmemul_linear_mmio_access(
>  {
>      struct hvm_vcpu_io *hvio = &current->arch.hvm.hvm_io;
>      unsigned long offset = gla & ~PAGE_MASK;
> -    unsigned int chunk, buffer_offset = gla - start;
> +    unsigned int buffer_offset = gla - start;
>      struct hvm_mmio_cache *cache = hvmemul_find_mmio_cache(hvio, start, dir,
>                                                             buffer_offset);
>      paddr_t gpa;
> @@ -1094,13 +1094,17 @@ static int hvmemul_linear_mmio_access(
>      if ( cache == NULL )
>          return X86EMUL_UNHANDLEABLE;
>  
> -    chunk = min_t(unsigned int, size, PAGE_SIZE - offset);
> +    if ( size > PAGE_SIZE - offset )

FWIW, I find this easier to read as `size + offset > PAGE_SIZE` (which
is the same condition used in linear_{read,write}().

Preferably with that adjusted:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

