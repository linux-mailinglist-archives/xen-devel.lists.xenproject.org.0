Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9A99680E9
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 09:50:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787566.1196960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl1pc-0002tN-1S; Mon, 02 Sep 2024 07:50:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787566.1196960; Mon, 02 Sep 2024 07:50:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl1pb-0002qW-UA; Mon, 02 Sep 2024 07:50:35 +0000
Received: by outflank-mailman (input) for mailman id 787566;
 Mon, 02 Sep 2024 07:50:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E/cM=QA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sl1pa-0002qA-DW
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 07:50:34 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06a4ae93-6900-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 09:50:30 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42bbffe38e6so17054405e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 00:50:30 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ba642593asm163631215e9.39.2024.09.02.00.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 00:50:29 -0700 (PDT)
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
X-Inumbo-ID: 06a4ae93-6900-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725263430; x=1725868230; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8YM1ttr1XOuR/fsNtxkDNDHbL4aT7dZWykeft3A0mSo=;
        b=UwjzSF4ShUhnNU4UyT/GaxffS+Q4oS2SY5hnN6BNF5elQNjGwOTv6Ty9GgHuR5NBRE
         IZWptEC2eqc3dU701L/93o5IDfZ+Ejpk9eJEDpFBiI38TXnE8MqPbIeRYtREqkPYAg2Z
         wL99ZT7KaCe6xab3ye6JtnxabhxZfxx/tr0m8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725263430; x=1725868230;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8YM1ttr1XOuR/fsNtxkDNDHbL4aT7dZWykeft3A0mSo=;
        b=GMJMs7yDnMDxofS4RQ91knJHgwdQL8Up62XVbCZG02ZRPIDvYOUCdyG44IA7xYuDmn
         EnBQkduhYoqDkJddGYddEE54LAGuNpwe5tQ7AGFaGJc9IbtiaIrzN0plXKOBU4rkPZ2K
         g9NWw14cZhQJqC2O9/mHMYGQAejwT5CPSQ0/iHXxvFmK3/uP/y2AhVSpCYA2ElTmr5rN
         nE5X6ww9o891WY+kvPZFk2UMFxVqXh/3dc34r7UgJoFCtUfHfNahKljUJnVG5zNBGUYF
         6G1cnqPQoxrs8ALBiYqtCprffm8KCDFPrsHdRfZcoLWqeXIn09gmiSBhym+cufcLqwak
         KJKg==
X-Forwarded-Encrypted: i=1; AJvYcCVXAUI7D4Wba/0V0pW073alqpGZGo/lsWX2PHF+/nVDfdFBXZJxcqW+AFXAPzyd424/DNWeyX8BsAE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyPzo+B4+nLRw4TcKG+vjho61u5dM+hjT3IvR4OLQ/+WfNS36Im
	YG7jml535SaaqD7kp7JSGExhGlkXb90hYcCdEB6yr+ZsqKVUFq8nUhgZxy/7z9g=
X-Google-Smtp-Source: AGHT+IHdzINRD/PIwQpYA473W2qHOPxS99o9wQUex1NSH8G5XvhPYfQVvj0PYGzy9avq2UjS6UpeSQ==
X-Received: by 2002:a05:600c:a09:b0:428:1608:831e with SMTP id 5b1f17b1804b1-42bb0309910mr103708135e9.22.1725263429539;
        Mon, 02 Sep 2024 00:50:29 -0700 (PDT)
Date: Mon, 2 Sep 2024 09:50:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org,
	jbeulich@suse.com, Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Edwin =?utf-8?B?VMO2csO2aw==?= <edwin.torok@cloud.com>
Subject: Re: [XEN PATCH v2 1/3] libxl: Fix nul-termination of the return
 value of libxl_xen_console_read_line()
Message-ID: <ZtVuRHJbx_syQgdN@macbook.local>
References: <cover.1724430173.git.javi.merino@cloud.com>
 <b1c7eb226ce62f50d6a50baa3977830a31fa5c9b.1724430173.git.javi.merino@cloud.com>
 <ZtCZjJVG-7daxcxb@macbook.local>
 <dc7d8179-b2c9-4ec8-99e5-5a901b751832@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dc7d8179-b2c9-4ec8-99e5-5a901b751832@citrix.com>

On Fri, Aug 30, 2024 at 08:22:29PM +0100, Andrew Cooper wrote:
> On 29/08/2024 4:53 pm, Roger Pau Monné wrote:
> > On Fri, Aug 23, 2024 at 06:05:03PM +0100, Javi Merino wrote:
> >> When built with ASAN, "xl dmesg" crashes in the "printf("%s", line)"
> >> call in main_dmesg().  ASAN reports a heap buffer overflow: an
> >> off-by-one access to cr->buffer.
> >>
> >> The readconsole sysctl copies up to count characters into the buffer,
> >> but it does not add a null character at the end.  Despite the
> >> documentation of libxl_xen_console_read_line(), line_r is not
> >> nul-terminated if 16384 characters were copied to the buffer.
> >>
> >> Fix this by asking xc_readconsolering() to fill the buffer up to size
> >> - 1.  As the number of characters in the buffer is only needed in
> >> libxl_xen_console_read_line(), make it a local variable there instead
> >> of part of the libxl__xen_console_reader struct.
> > Instead of playing games with the buffer size in order to add an extra
> > NUL character, we could possibly use libxl_write_exactly(ctx,
> > STDOUT_FILENO,...) in main_dmesg(), using cr->count as the buffer
> > length?
> 
> Sadly no.
> 
> struct libxl__xen_console_reader (which has the count field) is a libxl
> private (opaque) type which `xl` can't access.

I was fooled by the libxl_xen_console_reader typedef.

> Otherwise this would be a oneline fix already...

Hm, maybe the easiest way is to introduce a new function that returns
the buffer and the number of characters?
(libxl_xen_console_dump_buffer() or similar?)

Thanks, Roger.

