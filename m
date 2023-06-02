Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACE771FFF8
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 13:05:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543085.847711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q52aM-0003yA-Mc; Fri, 02 Jun 2023 11:04:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543085.847711; Fri, 02 Jun 2023 11:04:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q52aM-0003wN-Jk; Fri, 02 Jun 2023 11:04:46 +0000
Received: by outflank-mailman (input) for mailman id 543085;
 Fri, 02 Jun 2023 11:04:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AB5B=BW=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q52aL-0003wH-Oi
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 11:04:45 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47c5473f-0135-11ee-b232-6b7b168915f2;
 Fri, 02 Jun 2023 13:04:44 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f70fc4682aso18128715e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 02 Jun 2023 04:04:44 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 p23-20020a1c7417000000b003f60eb72cf5sm5209914wmc.2.2023.06.02.04.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 04:04:43 -0700 (PDT)
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
X-Inumbo-ID: 47c5473f-0135-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1685703884; x=1688295884;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=23VBw2pgGMM0xSSYRikRwL4w2tdQBXv0vLVXQLmfo4g=;
        b=CknAHDqsDvtuhwIIt70esDpHklnU3J6bu5Yd9e4fyLaYqOQzKWjL8ZiWAG+cWJFrMb
         pgcWA+++7Q6FqWrJZtYRsjzca5YIYaD+mcj9SYmo3rzq71ZTIVFmJyd2YUBsWA1KFez+
         FwR6t137pF78I73sPZ934BP8im6y6tZoKEmq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685703884; x=1688295884;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23VBw2pgGMM0xSSYRikRwL4w2tdQBXv0vLVXQLmfo4g=;
        b=BtDohCM/vkQLQkUG8gpTYpQ++1NKYwUsLtamCK6loUobrrjSDTH1+uuHkuM3uNqTJI
         F5A4zfdf27KIxJF1hzgHuTS1ILapgZ2Mk89beoNMQA/t0AAWDQFB5zOBiXaC99IcSGKb
         x0LAw0GtEUYs8eJOjMtYXnqOUy1c0hMjoWukM4guAfX0Qu4NY2Ctrepq3cT3jrdDKG2X
         7fNwAM8kUhFkCtq5p+5O7qKK2X7+wmzvzOjUG+uY9v1trKvqVTpQQJiXg+CT6F/pB6AH
         c0m2yqd4/6UcOOXNTUfdNmU8m5/+T5VQQD6pGoFmyxLQnET5nm91kXB9TbFgTvoywuJX
         GF+A==
X-Gm-Message-State: AC+VfDxkH9epB8bfPaGnouDGuIM6akzZ8spQWD0ddLA15mnrb/bWTW35
	nzmy5h8bPoIr+fzSEdytHFYN+g==
X-Google-Smtp-Source: ACHHUZ64+hI2DBchewvrBT1ewPkL+4G+QVkPybVAPHWZTD/g83uh1f+ETp/FcuDVcj6Ky+KgpeGhvA==
X-Received: by 2002:a05:600c:228b:b0:3f5:1241:6cfa with SMTP id 11-20020a05600c228b00b003f512416cfamr1567680wmf.37.1685703884047;
        Fri, 02 Jun 2023 04:04:44 -0700 (PDT)
Message-ID: <6479cccb.1c0a0220.192fa.4944@mx.google.com>
X-Google-Original-Message-ID: <ZHnMyfarcROioZhE@EMEAENGAAD19049.>
Date: Fri, 2 Jun 2023 12:04:41 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86: Add Kconfig option to require NX bit support
References: <20230601174327.11401-1-alejandro.vallejo@cloud.com>
 <619ea01a-2058-c4ed-0f5c-394a82f838a5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <619ea01a-2058-c4ed-0f5c-394a82f838a5@suse.com>

Hi,

Sure to everything. A couple of notes:

On Fri, Jun 02, 2023 at 10:31:08AM +0200, Jan Beulich wrote:
> > +	def_bool n
> > +	prompt "Require NX bit support"
> 
> Just
> 
> 	bool "Require NX bit support"
> 
> please.
I didn't realize Kconfig defaulted to 'n'. That's neat, thanks.
> 
> > @@ -151,6 +152,11 @@ not_multiboot:
> >  .Lnot_aligned:
> >          add     $sym_offs(.Lbag_alg_msg),%esi   # Error message
> >          jmp     .Lget_vtb
> > +#if IS_ENABLED(CONFIG_REQUIRE_NX_BIT)
> > +no_nx_bit:
> 
> .Lno_nx_bit (no need for this to end up in the symbol table, just like
> most other labels around here).
There's a bunch of others in that general area with global symbols. I'll
modify bad_cpu -> .Lbad_cpu as well while dealing with the next suggestion
about reordering the NX and Long Mode checks.

Alejandro

