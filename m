Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5865595C952
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 11:35:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782217.1191697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shQgN-0006ke-Iw; Fri, 23 Aug 2024 09:34:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782217.1191697; Fri, 23 Aug 2024 09:34:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shQgN-0006hc-Fk; Fri, 23 Aug 2024 09:34:11 +0000
Received: by outflank-mailman (input) for mailman id 782217;
 Fri, 23 Aug 2024 09:34:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=imIp=PW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1shQgM-0006hW-AW
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 09:34:10 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8d69193-6132-11ef-a50a-bb4a2ccca743;
 Fri, 23 Aug 2024 11:34:08 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a8684c31c60so225106866b.3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Aug 2024 02:34:08 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f48a5d0sm232751866b.159.2024.08.23.02.34.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Aug 2024 02:34:07 -0700 (PDT)
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
X-Inumbo-ID: d8d69193-6132-11ef-a50a-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724405648; x=1725010448; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2uvmszkIkUKTYN+Fk0dr+kTtQ12mzMtCsXW/XctRIbY=;
        b=vkW9ubTT0yHl31BcGku+8uDxZ/J5wpEzW1oYQptRTXDMi8vfKCHWHIY1tJ5pTYkcbC
         2A7oUFtvc3Qmkb8o61y44yCtl/a8bGbWEei+JmfAY5pShD+QJNYXS26CGHnefxi9Uz8G
         I2r7T2U+EgXU9ZzQZIKNpidKUjkkzjuHgnk2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724405648; x=1725010448;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2uvmszkIkUKTYN+Fk0dr+kTtQ12mzMtCsXW/XctRIbY=;
        b=XAIWlqEuFZgztv5ST3nUqaOYliEsQmnmWvAsitck7gPv5oatqMuMUx0B9LHIndXLS8
         pWqkZbswCJzFkgfUX2mxuVtS1FBnhTQTkiN2TcQMEfCPo77jRfPNWYz798h1orguzBRz
         sr8PbdpeU3djPe4sNiu1XYcIx/MAGwgMpM2mfWjUh6bNanzPi1fwamC8WydpdZuLBwyy
         HtuIccisw7ww3I97PYh1nmloVhA+HFrrtGCU5HVbljy/TJHXR3UG+vm2TZ4L4BGNBxas
         oBHuUME79Z1iF2dQMPpPtVbT1u3vEHZDEYZ+VA/3+a6OIpfjy+zXkt4iK3q0oz321nG7
         DOAA==
X-Forwarded-Encrypted: i=1; AJvYcCVRN8G6mqTUBJgOJAK8W8pVeX//dy5zNCH+8h7NDFB83DtA3ZUrLWvyIdP8uGzDN5p63o2Z8aDsIJM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywdz8o/kjSc2JJhGKfMjDZFs+OSgTGvYXBvAixMHN6VhLHAx/Jn
	WoBbniZwmSN87gb7YyFjlxk3BXOOANOTiwRV3A2pAcOAn4fKBVdFZb5SsW75d8M=
X-Google-Smtp-Source: AGHT+IH3s0hBQA+c8tD2t0TG69Ui1NzDgwqlFACuhnU7yFFFalbkzV8EOaN7oIoZSf0pjiddsN85JQ==
X-Received: by 2002:a17:907:3f9c:b0:a86:a2b6:fc42 with SMTP id a640c23a62f3a-a86a52b643dmr86520466b.24.1724405647659;
        Fri, 23 Aug 2024 02:34:07 -0700 (PDT)
Message-ID: <925ae2fb-6f6f-4825-8469-c410b7bb89fc@citrix.com>
Date: Fri, 23 Aug 2024 10:34:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v1] libxl: Fix nul-termination of the return value of
 libxl_xen_console_read_line()
To: Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, =?UTF-8?B?RWR3aW4gVMO2csO2aw==?=
 <edwin.torok@cloud.com>
References: <ad7c89bbae34155566ae7c9ca2cb501f21c7d585.1724330921.git.javi.merino@cloud.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ad7c89bbae34155566ae7c9ca2cb501f21c7d585.1724330921.git.javi.merino@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/08/2024 2:13 pm, Javi Merino wrote:
> When built with ASAN, "xl dmesg" crashes in the "printf("%s", line)"
> call in main_dmesg().  ASAN reports a heap buffer overflow: an
> off-by-one access to cr->buffer.
>
> The readconsole sysctl copies up to count characters into the buffer,
> but it does not add a null character at the end.  Despite the
> documentation of libxl_xen_console_read_line(), line_r is not
> nul-terminated if 16384 characters were copied to the buffer.
>
> Fix this by making count one less that the size of the allocated
> buffer so that the last byte is always null.
>
> Reported-by: Edwin Török <edwin.torok@cloud.com>
> Signed-off-by: Javi Merino <javi.merino@cloud.com>
> ---
>  tools/libs/light/libxl_console.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/libs/light/libxl_console.c b/tools/libs/light/libxl_console.c
> index a563c9d3c7f9..fa28e2139453 100644
> --- a/tools/libs/light/libxl_console.c
> +++ b/tools/libs/light/libxl_console.c
> @@ -779,7 +779,7 @@ libxl_xen_console_reader *
>      cr = libxl__zalloc(NOGC, sizeof(libxl_xen_console_reader));
>      cr->buffer = libxl__zalloc(NOGC, size);
>      cr->size = size;
> -    cr->count = size;
> +    cr->count = size - 1;
>      cr->clear = clear;
>      cr->incremental = 1;
>  

This looks like it will fix the ASAN issue, but I think a better fix
would be:

-        printf("%s", line);
+       printf("%.*s", cr->count, line);

because otherwise there's a world of sharp corners once Xen has wrapped
the buffer for the first time.


Which brings us a lot of other WTFs in this code...

First, libxl_console.c describes it's functionality in terms of lines,
and line_reader() in the API.  Yet it's not lines, it's a 16k buffer
with generally multi-line content.  It's too late to fix the naming, but
we could at least rewrite the comments not to be blatant lies.


Just out of context above the hunk is:

    unsigned int size = 16384;

which isn't accurate.  The size of Xen's console ring can be changed at
compile time (like XenServer does), and/or by command line variable.

Because the dmesg ring is never full (it just keeps producing and
overwriting tail data), it's impossible to get a clean copy except in a
single hypercall; the incremental/offset parameters are an illusion, and
do not function correctly if a new printk() has occurred between
adjacent hypercalls.

And that is why setting count to size - 1 probably isn't wise.  It means
that, even in the ideal case where Xen's ringbuffer is 16k, you've still
got to make 2 hypercalls to get the content.

~Andrew

