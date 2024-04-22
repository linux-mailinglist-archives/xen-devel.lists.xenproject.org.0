Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D05F8AD39B
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 19:58:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710185.1109283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryxvM-0005E3-Ns; Mon, 22 Apr 2024 17:57:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710185.1109283; Mon, 22 Apr 2024 17:57:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryxvM-0005BB-L7; Mon, 22 Apr 2024 17:57:52 +0000
Received: by outflank-mailman (input) for mailman id 710185;
 Mon, 22 Apr 2024 17:57:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B2T4=L3=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ryxvL-0005B3-EX
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 17:57:51 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4826f05-00d1-11ef-909a-e314d9c70b13;
 Mon, 22 Apr 2024 19:57:48 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-346406a5fb9so3790009f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 10:57:48 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 u17-20020adfeb51000000b00347321735a6sm12603498wrn.66.2024.04.22.10.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 10:57:47 -0700 (PDT)
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
X-Inumbo-ID: d4826f05-00d1-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713808668; x=1714413468; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JSnBH49T3OqaJvnPFW1gr50cYh18DpiRIBpR8edsy0A=;
        b=AsdYZq74vB1RA4IvhWrCmW8gvg3Rk7tFIMKtAJSb6mRf98BlkQxPpB4rjzxXy2LmJ0
         zi8Z6MZj9JCTcmo0L8ezoK3/6Sq0uGGc9GFDKiikrlRGrng7NmqKflsn48g5S/7RK47O
         s43DUdecYgFstzgAi3KoQmgf59+q+jpweB+NM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713808668; x=1714413468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSnBH49T3OqaJvnPFW1gr50cYh18DpiRIBpR8edsy0A=;
        b=oCK+HDM+QEjU+DRMN8/PcdM15t+wCsBaMxThIYGGuE1BFxQiMZHHEeqiE/fjt3J6RV
         KCRDy6f6NhPIx+iKQ0tA1fiz15fusUQDYWuYVEtGATyVfJ+tL0TAB5al6RmcS6eQkYv/
         2HkKd+JkZBnQuBS3FPEFl6Afa6OSX5UR4LZKMnUuXhWEtJA/JhEhzrJNzXQuw/eD6X0Q
         B+YFlhAr4Uk+FG63xMT5gqFYaYDjLhnEXVqX/uZf1lowIb8EADVjm52+aFVdHNGQ6LxC
         DnwAZ6KKBY0zB4OP9UINKXLBk1kVqvTsPXDWpVFrvlgokiutG0Gd6RXZfC0QrURmP8uH
         1h0w==
X-Gm-Message-State: AOJu0Ywc3gYv5+raMjGbV8HS9WJ6EPz4NS9SP07EIEgIUvklWdUW6pqz
	ozyKV2lYkvv8dPoinf7y6HgrJeeSJ9/NArOYBDNzJQPm8zkh9Nn1QyZfB/X0/Fg=
X-Google-Smtp-Source: AGHT+IG8B0xmSb0gtR/F7CrUNqTWjPfm+d1jWXI4hkeiCkFNHAxWooMmuCiyZ7Rft2PMh1zF5bUz1A==
X-Received: by 2002:adf:e80a:0:b0:345:b238:534d with SMTP id o10-20020adfe80a000000b00345b238534dmr5851771wrm.28.1713808668038;
        Mon, 22 Apr 2024 10:57:48 -0700 (PDT)
Date: Mon, 22 Apr 2024 18:57:46 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 5/5] x86: Add --force option to xen-ucode to override
 microcode version check
Message-ID: <35e382d7-0f65-4dbe-bc80-ddbf9d649e24@perard>
References: <20240416091546.11622-1-fouad.hilly@cloud.com>
 <20240416091546.11622-6-fouad.hilly@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240416091546.11622-6-fouad.hilly@cloud.com>

On Tue, Apr 16, 2024 at 10:15:46AM +0100, Fouad Hilly wrote:
> Introduce --force option to xen-ucode to force skipping microcode version
> check, which allows the user to update x86 microcode even if both versions
> are the same.
> 
> [v2]
> 1- Changed data type from uint32_t to unsigned int.
> 2- Corrected line length.
> 3- Removed XENPF_UCODE_FLAG_FORCE_NOT_SET.
> 4- Corrected indentations.
> 5- Changed command line options to have the file name as first argument when applicable.
> 6- --force option doesn't require an argument anymore.
> 7- Used optint to access filename in argv.
> 
> Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
> ---
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>

You might want to move that tag before the '---' separation otherwise it
wont be part of the commit message. `git am` discard every thing after
the '---' line. Also add the tag before your SOB.

> ---
>  tools/include/xenctrl.h   |  3 ++-
>  tools/libs/ctrl/xc_misc.c | 13 +++++++++++--
>  tools/misc/xen-ucode.c    | 18 +++++++++++++-----
>  3 files changed, 26 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
> index e3c1943e3633..4178fd2221ea 100644
> --- a/tools/misc/xen-ucode.c
> +++ b/tools/misc/xen-ucode.c
> @@ -24,7 +26,8 @@ static void usage(const char *name)
>             "Usage: %s [microcode file] [options]\n"

Now, that usage line is wrong. The options needs to go before the file.
That could be fix on the previous patch. With that usage line, we would
want to run `./xen-ucode ucode.bin --force`, but I don't think that
would work.

>             "Options:\n"
>             "  -h, --help            display this help and exit\n"
> -           "  -s, --show-cpu-info   show CPU information and exit\n",
> +           "  -s, --show-cpu-info   show CPU information and exit\n"
> +           "  -f, --force           force to skip micorocde version check\n",
>             name, name);
>  }
>  

Thanks,

-- 
Anthony PERARD

