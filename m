Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10474964AAF
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 17:54:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785995.1195560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjhT9-0005zc-03; Thu, 29 Aug 2024 15:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785995.1195560; Thu, 29 Aug 2024 15:53:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjhT8-0005xV-TE; Thu, 29 Aug 2024 15:53:54 +0000
Received: by outflank-mailman (input) for mailman id 785995;
 Thu, 29 Aug 2024 15:53:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h9f7=P4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sjhT7-0005xP-4C
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 15:53:53 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2b69816-661e-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 17:53:51 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a7aa086b077so81126266b.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 08:53:51 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891968desm93645266b.130.2024.08.29.08.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 08:53:49 -0700 (PDT)
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
X-Inumbo-ID: e2b69816-661e-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724946830; x=1725551630; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1PsMmeUOjiISMrqGqz+8vRrkX+IgVLNR6ZLFF7YcSnc=;
        b=YCzhI/3VztRFsCGaQAGQmnWUaL9XNzg8UHGGGpHduKLIjvcLVWmNcDc4UtZEB9vbqo
         YUwfWO+DeW8bd5pteFJugCbI9qFH8ktmHHtHcD1xfP04BSKNn0H636Y8cvIpgqGN6All
         fKMe26nyAhUcOND3teEO//3oaGGNV9BBUSrH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724946830; x=1725551630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PsMmeUOjiISMrqGqz+8vRrkX+IgVLNR6ZLFF7YcSnc=;
        b=bktnJ/d9Lm0Cwk/rbZ+5xl5A5TDl75ejkIKUKu2YIVTVh1bwjRJ3/wccMZYHZSFo8+
         9wzMMhCblcLCp907jCjKC+YzHvJRys+yqqiznt3918b3Rq1TWXJdmBYFgZZuG/vlysYR
         7Kha1TFeI2D8ghKcwaedGHLhSYD5uZZ+WaKyZYqYi2EPf8A7QM5FHBHNU3IdHADq+e/Z
         YyEsUM0itfKJWFIxF2aCyhUs+6xW6w+YDO5p9QjwG3+RjJDw+E3YN7eOJ+AlkRZnoAZK
         GptC6V6wLB1F98GyI8Dloet0VW1xf/OBl8pwq9zRFbYfgtlVDh0WnKK7X4kWZseDmxSa
         jJgQ==
X-Gm-Message-State: AOJu0Yz4oKE/lRFB3/9updIs9CuFc3rmxUVR2o+MiRVvS67yRjIyjto/
	RmKHoIlSNp4Fdakkk9dvRo0weltR24grGK7PSgtgaEwfKkjU5gMtFM4xRElD+SQ=
X-Google-Smtp-Source: AGHT+IEfGxiTZDLvwlkDgjw7QOlBrbfljEug5FqXGSIGAxWhCJPtOz36w3tJ3TFnU5VPWfrVCgQ6ug==
X-Received: by 2002:a17:907:1c17:b0:a86:963f:ea8d with SMTP id a640c23a62f3a-a897fab7e38mr250867866b.64.1724946829974;
        Thu, 29 Aug 2024 08:53:49 -0700 (PDT)
Date: Thu, 29 Aug 2024 17:53:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Javi Merino <javi.merino@cloud.com>
Cc: xen-devel@lists.xenproject.org, jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Edwin =?utf-8?B?VMO2csO2aw==?= <edwin.torok@cloud.com>
Subject: Re: [XEN PATCH v2 1/3] libxl: Fix nul-termination of the return
 value of libxl_xen_console_read_line()
Message-ID: <ZtCZjJVG-7daxcxb@macbook.local>
References: <cover.1724430173.git.javi.merino@cloud.com>
 <b1c7eb226ce62f50d6a50baa3977830a31fa5c9b.1724430173.git.javi.merino@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b1c7eb226ce62f50d6a50baa3977830a31fa5c9b.1724430173.git.javi.merino@cloud.com>

On Fri, Aug 23, 2024 at 06:05:03PM +0100, Javi Merino wrote:
> When built with ASAN, "xl dmesg" crashes in the "printf("%s", line)"
> call in main_dmesg().  ASAN reports a heap buffer overflow: an
> off-by-one access to cr->buffer.
> 
> The readconsole sysctl copies up to count characters into the buffer,
> but it does not add a null character at the end.  Despite the
> documentation of libxl_xen_console_read_line(), line_r is not
> nul-terminated if 16384 characters were copied to the buffer.
> 
> Fix this by asking xc_readconsolering() to fill the buffer up to size
> - 1.  As the number of characters in the buffer is only needed in
> libxl_xen_console_read_line(), make it a local variable there instead
> of part of the libxl__xen_console_reader struct.

Instead of playing games with the buffer size in order to add an extra
NUL character, we could possibly use libxl_write_exactly(ctx,
STDOUT_FILENO,...) in main_dmesg(), using cr->count as the buffer
length?

Regards, Roger.

