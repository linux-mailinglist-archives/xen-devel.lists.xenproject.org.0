Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3C29667C9
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 19:16:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786545.1196121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk5EI-0002AI-9U; Fri, 30 Aug 2024 17:16:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786545.1196121; Fri, 30 Aug 2024 17:16:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk5EI-000286-6f; Fri, 30 Aug 2024 17:16:10 +0000
Received: by outflank-mailman (input) for mailman id 786545;
 Fri, 30 Aug 2024 17:16:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YGfl=P5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sk5EG-000280-Ow
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 17:16:08 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a6f8d74-66f3-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 19:16:06 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a86a0b5513aso240937466b.1
 for <xen-devel@lists.xenproject.org>; Fri, 30 Aug 2024 10:16:06 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891d72c3sm237697366b.147.2024.08.30.10.16.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Aug 2024 10:16:04 -0700 (PDT)
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
X-Inumbo-ID: 8a6f8d74-66f3-11ef-a0b1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725038165; x=1725642965; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FX1+GsNHmsic0w/XiGgpLMmpBMNUBTOQA9yhKwSb0x4=;
        b=kL+k2u6HqZfPTcKghkjtuzBJZ42B1SunjPcy9XE7AI9lie8iFpvbGjdy7W1CD7+MUJ
         7zRkEGf51j8DH/XZCfmctRNHe23lKjenjp/YCfXB7hRPF+ciDLRuJUaey3kK4Msp2pmw
         d/e8bwh5gP1xvwWeC3JQ/+jKw3BCBI6yQmieE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725038165; x=1725642965;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FX1+GsNHmsic0w/XiGgpLMmpBMNUBTOQA9yhKwSb0x4=;
        b=FgOMRlYykNlWSQOz55W7XmmrmUFnVxM0Knhxk9Fpyj0xR+rrVR8arE/ksJmU1126tw
         PGkUTbQo2HfJNkJR6OFZPWgQXE5WXkyZFc4X29wrmt/6MMgB70lydJuMDqVwLJB4syIh
         weKRPWSnLBg9rt0BM+KEE81V8d8fr+05T6NQvlHf4Glm9Vq/Cz3duagjnd6bXbPSe8dy
         tRDbDt7oxHxae0oxXwHN2rXODLbyKK8cu1j7D1pQYj5chuy9sJctkqVqGVZBgr2xsqv9
         8WJutIrdjkZ1korD97dvHRkvi06Y2TPdlKLRBx/uIRS29h+0hswzixNmLdxgseg1LN9y
         O9BQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8ZxGYK9LH/OIYQK+If4rTCWTGwFvS+sbdnQBksgjn6phRHJwyYyMyaynUhWgBRPhjJ0EmMNoF9Z0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyXhDYuGVTykvPmwDN9iHedbFuvcGWUfrTPE21YPP9gxaiVQAQt
	uKFEvLM2cIfokA+8nnja9KWHYosfAc8i8AawnCzYQhyeHMNHXV9wAOxxSf6Clwg=
X-Google-Smtp-Source: AGHT+IFCoRqYDYWQ32ZC/XhlwAzkYSV04/SAHqwL5sNELFnaT5xariOeZXkW4AfbZIEM50hJVnq8FA==
X-Received: by 2002:a17:907:6d23:b0:a7a:aa35:408c with SMTP id a640c23a62f3a-a897f77fa9amr571429966b.8.1725038164657;
        Fri, 30 Aug 2024 10:16:04 -0700 (PDT)
Message-ID: <6292af41-00e6-4c06-8781-92830f6022ba@citrix.com>
Date: Fri, 30 Aug 2024 18:16:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 0/2] libxl: Implement QEMU command line probe
To: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>
References: <20240830094937.40476-1-anthony.perard@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240830094937.40476-1-anthony.perard@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/08/2024 10:49 am, Anthony PERARD wrote:
> Patch series available in this git branch:
> https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.libxl-qemu-cmdline-probe-v2
>
> v2:
> - removed commited patch
> - rename "qemu_cmdline" to "qemu_opts" in struct field and func parameters.
> - rename "struct libxl__qemu_available_cmd_line" to
>   "struct libxl__qemu_available_opts".
>
> Starting with QEMU 9.0, the option "-chroot", that we use for the
> "dmrestrict" feature, is removed. We need to find out which to use
> between "-chroot" and "-run-with chroot=dir".
>
> Also, "-runas" is deprecated in QEMU 9.1 and will be remove in a future
> release, it's replaced with "-run-with user=user".
>
> To find out which command line option we can use, we'll spawn QEMU, and run the
> QMP command "query-command-line-options".
>
> Some example of running these patches:
>     with qemu-xen (8.0):
>         http://logs.test-lab.xenproject.org/osstest/logs/187352/
>     with QEMU (upstream, 9.1-rc3):
>         http://logs.test-lab.xenproject.org/osstest/logs/187353/
>
> Anthony PERARD (2):
>   libxl: Probe QEMU for -run-with chroot=dir and use it
>   libxl: Probe QEMU for -run-with user=user and use it
>
>  tools/libs/light/libxl_dm.c       | 90 +++++++++++++++++++++++++------
>  tools/libs/light/libxl_internal.h |  6 +++
>  2 files changed, 80 insertions(+), 16 deletions(-)

I've committed these as they're fully reviewed, but I think this
warrants a CHANGELOG.md update as we're fixing libxl to work with newer
QEMU.

~Andrew

