Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E73929F01
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 11:26:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755240.1163553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQkdE-0004K2-Sm; Mon, 08 Jul 2024 09:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755240.1163553; Mon, 08 Jul 2024 09:26:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQkdE-0004IY-Pv; Mon, 08 Jul 2024 09:26:00 +0000
Received: by outflank-mailman (input) for mailman id 755240;
 Mon, 08 Jul 2024 09:25:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xFgZ=OI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sQkdC-0004IS-Vh
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 09:25:58 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 154d52e7-3d0c-11ef-bbfb-fd08da9f4363;
 Mon, 08 Jul 2024 11:25:57 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-426602e8050so10860565e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 02:25:57 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1d6d22sm156286695e9.20.2024.07.08.02.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 02:25:56 -0700 (PDT)
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
X-Inumbo-ID: 154d52e7-3d0c-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720430757; x=1721035557; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dKpc0ssgEF1V/rF5N8+UfHi6IMT7n5OJswh7gYygKA0=;
        b=MeQJYU/j0NAGn2Rk0kkATxRHFPHgiksfJvZg9RQPccZI3WdwmSLqiSqHGXZlHvZZ+R
         6QoXaZ+lGpgSUmTnKYEol09xH9LNI4qTvXIrCz8DcK93NBhCqvxgY24L7AzBUmz2rt17
         1bokbTgS9Ln9b+5FT0EW1DVTF+K4pb5IOkFOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720430757; x=1721035557;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dKpc0ssgEF1V/rF5N8+UfHi6IMT7n5OJswh7gYygKA0=;
        b=tbwKovhiXrcqmYIKwCK5adpzTkwD7FmbWcxG6FH0a7meWGPoTFssjBAFnxWN1pixFS
         r7XIa8xKDlyy8Pzl66Xr0KlgRryoARsWjUW3oDRAjqJL+9iHVXK3edSOOMbieDbO1hBy
         2nRrnssnVN5nA1w9TCbE4JhAhIXYwiQHFKkNasTEk51aNNH4F7SYG95D2m7Tl6e45cAy
         yED9TqYbJvdbk3e3hs+vqKEQDIo2r2/XDAVcayUFMYW5pm4RASOgLuJ+bIwKQegshddd
         +zAUJ/jpJAoyXTDX9sm6xc3OK1x1He7gzvJFLSsy+FgKAf2kAV/vG8GGx5quCvvnZaR3
         RPgw==
X-Gm-Message-State: AOJu0YxAPJ6OetjKwk8wV1EeDdCdJvFUMy1TF+pzvbee3bPYT5/4POs/
	aiKl1DNDqThgk8om8tJP4W70jR5cQOoFOaED9KVcVP+mJ5uynCudR8R9AH71Bkk=
X-Google-Smtp-Source: AGHT+IHOFIGPVu5tSLPGQMuwfzfYglJpwRErMN/5HTDdkbUmD2AZEetLBBIRwdSd3DUQtSjLmZJjnQ==
X-Received: by 2002:a05:600c:4f95:b0:426:6416:aa7a with SMTP id 5b1f17b1804b1-4266416acbcmr31572545e9.34.1720430757230;
        Mon, 08 Jul 2024 02:25:57 -0700 (PDT)
Date: Mon, 8 Jul 2024 11:25:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.19 6/6] build: Drop xorg-x11 as a build dependency
Message-ID: <ZouwpBfS713joyCn@macbook.local>
References: <20240705152037.1920276-1-andrew.cooper3@citrix.com>
 <20240705152037.1920276-7-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240705152037.1920276-7-andrew.cooper3@citrix.com>

On Fri, Jul 05, 2024 at 04:20:37PM +0100, Andrew Cooper wrote:
> The history on this one is complicated.  The note to README was added in
> commit 1f95747a4f16 ("Add openssl-dev and xorg-x11-dev to README") in 2007.
> 
> At the time, there was a vendered version of Qemu in xen.git with a local
> modification using <X11/keysymdef.h> to access the monitor console over VNC.
> 
> The final reference to keysymdef.h was dropped in commit 85896a7c4dc7 ("build:
> add autoconf to replace custom checks in tools/check") in 2012.  The next
> prior mention was in 2009 with commit a8ccb671c377 ("tools: fix x11 check")
> noting that x11 was not a direct dependcy of Xen; it was transitive through
> SDL for Qemu for source-based distros.
> 
> These days its only the Debian based dockerfiles which install xorg-x11, and
> Qemu builds fine in these and others without x11.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

