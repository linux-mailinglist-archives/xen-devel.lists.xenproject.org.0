Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF4D857A73
	for <lists+xen-devel@lfdr.de>; Fri, 16 Feb 2024 11:38:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682114.1061151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ravbP-000391-Qd; Fri, 16 Feb 2024 10:37:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682114.1061151; Fri, 16 Feb 2024 10:37:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ravbP-00037F-NF; Fri, 16 Feb 2024 10:37:55 +0000
Received: by outflank-mailman (input) for mailman id 682114;
 Fri, 16 Feb 2024 10:37:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LvWc=JZ=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ravbO-000374-EH
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2024 10:37:54 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fd6458d-ccb7-11ee-98f5-efadbce2ee36;
 Fri, 16 Feb 2024 11:37:52 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33d066f8239so815865f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 Feb 2024 02:37:52 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 p6-20020adfe606000000b0033cdbe335bcsm1822314wrm.71.2024.02.16.02.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 02:37:51 -0800 (PST)
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
X-Inumbo-ID: 6fd6458d-ccb7-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708079872; x=1708684672; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dUwJklCk/DnUs+PMaFd7ukwTODbVHMp2YhTBDgA0UUY=;
        b=aOL/SQT0W0dW9hss/bDcMLjm06bkI+p4farZ0gF8l7UC3S0O4D/MIlwL/R0/FifgXw
         L0sCQ7NXc9+/fYBvUKMpUSlmGclAoeWexr24npzJeYEzsLWNCrXFQ3qd/1w+hMBMhwk0
         fD/3644im9G2LUBcXmrrZDh+/GKgaimrX3RCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708079872; x=1708684672;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dUwJklCk/DnUs+PMaFd7ukwTODbVHMp2YhTBDgA0UUY=;
        b=N6lEfa8x2noiRo3i41uN8FrGmdaX4KjUWlWFl+8mLPjP1jrffV0F6L4Bf28itpbYGT
         eQkGtBaZ5EqPBWoJj1LV/R3wSYXEPt26AOaDSGgjoFrdzp64qRkonDU+2B+eVT8kMj/5
         sfWksjTkGpA7LhIdIkt059R2Q73kOwANkZbRGD0TnBSxMd82OkbrgjvLiyVBqkmijqUP
         AhE4lP2Wy6FDZxTzlTJ1C5r8crBwcFOjlS9oOTwrCrKRlQ+TqMqT4CwCtKqj2uCm3e71
         ZJ6Tyoc8BLP4f4NSSRo7LLBqTRgdWlTU1Sz6Cp7Veb/N3Dbtg5luSMdVTy12CcYvH2+o
         WXEA==
X-Gm-Message-State: AOJu0YyKs37jrU7vcB5ibrMSkByoqB/xSU8++S7KbMc0KhC/xtSLvxwU
	pPojYgEiwfbE0gmojNLQEReLf+bOyri+iDBWuhZWnvC1vhqjFRooQy17RQsNfYY=
X-Google-Smtp-Source: AGHT+IHx1dEAt4yVoJ3kvhj07qaYBSgURra5x50sWKmOOlZcFltTChjoixSw6qWv4/UZErJqGJjgug==
X-Received: by 2002:a5d:4708:0:b0:33c:d1c4:4c3b with SMTP id y8-20020a5d4708000000b0033cd1c44c3bmr3062372wrq.23.1708079871798;
        Fri, 16 Feb 2024 02:37:51 -0800 (PST)
Date: Fri, 16 Feb 2024 10:37:51 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v2] build: Replace `which` with `command -v`
Message-ID: <a5be85cf-2aba-43d9-9e76-dc5527660d2a@perard>
References: <20240214180039.57527-1-anthony.perard@citrix.com>
 <dca166f1-6b94-46bb-b576-411ef9cce127@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dca166f1-6b94-46bb-b576-411ef9cce127@citrix.com>

On Wed, Feb 14, 2024 at 06:06:38PM +0000, Andrew Cooper wrote:
> On 14/02/2024 6:00 pm, Anthony PERARD wrote:
> > The `which` command is not standard, may not exist on the build host,
> > or may not behave as expected by the build system. It is recommended
> > to use `command -v` to find out if a command exist and have its path,
> > and it's part of a POSIX shell standard (at least, it seems to be
> > mandatory since IEEE Std 1003.1-2008, but was optional before).
> >
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> > Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> I expect we want fixes tags for c8a8645f1ef (python) and 3b47bcdb6d383
> (figlet).  Both my fault it turns out...

Sounds good. I saw this patch as an improvement rather than a bug fix so
I didn't think about fixes tags. It's one less build dependency, so I
guess it's nice to have and backport.

It's common to use `which` to find a path to a binary, and unfortunately
not well known that `command -v` is a more portable alternative. So not
exactly your fault.

It's looks like there's a nice write up about this here:
https://unix.stackexchange.com/questions/85249/why-not-use-which-what-to-use-then/85250#85250

Cheers,

-- 
Anthony PERARD

