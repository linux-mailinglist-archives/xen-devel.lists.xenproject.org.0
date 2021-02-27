Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10264326EB4
	for <lists+xen-devel@lfdr.de>; Sat, 27 Feb 2021 20:00:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90958.172062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lG4oM-0008FT-2W; Sat, 27 Feb 2021 18:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90958.172062; Sat, 27 Feb 2021 18:59:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lG4oL-0008F4-Vj; Sat, 27 Feb 2021 18:59:29 +0000
Received: by outflank-mailman (input) for mailman id 90958;
 Sat, 27 Feb 2021 18:59:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0r77=H5=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1lG4oK-0008Ez-Lx
 for xen-devel@lists.xenproject.org; Sat, 27 Feb 2021 18:59:28 +0000
Received: from mail-pg1-x532.google.com (unknown [2607:f8b0:4864:20::532])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54b816fd-de20-40f4-8595-098e4636384d;
 Sat, 27 Feb 2021 18:59:27 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id l2so8396757pgb.1
 for <xen-devel@lists.xenproject.org>; Sat, 27 Feb 2021 10:59:27 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id ep17sm12598344pjb.19.2021.02.27.10.59.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Feb 2021 10:59:26 -0800 (PST)
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
X-Inumbo-ID: 54b816fd-de20-40f4-8595-098e4636384d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fumoWEvufGUqXz2ydHpb2ku6RD/nJbXOXTgn0QKGw0Q=;
        b=g+OO9dYyoUUDorYRWQcecLLNqn1EH9CMFDUSg9rWCmsSjN7whn1x/YYFnPUVuUcccw
         aFoSqQTPcxqfF/wS4QxmXSFY+I9wUISRu9v2viM2z/b0z9tQ0mrKCo889rOAj755Chxm
         kO5mIxf4xKKPiUPW5mEQTQHKHwSRPrpDQLU9Wrf9by1TJcKaOhtdMcjMve8mUKUcTApQ
         40ClLostH5b6XwAYkzB2BGaZA9vzQ0bp6r17sxn7PgzfYVg72XWn4M6DjYfwIOtiY4EB
         Uav1r6mozVCwK2+2TC3S42BHj407YPn4H0agNNKMDI1mhhQ/uu72W+APDayF04cl1BER
         hinw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fumoWEvufGUqXz2ydHpb2ku6RD/nJbXOXTgn0QKGw0Q=;
        b=fbUO+chL0HJ9e3XQOcemVC8GkSypzkpohmXvRoyLxcE0WqP368aPG7pkayXkmS4M0h
         qTvtQUeLMMpFgBtb6r4idSAx2ybMzDvwAyXHtWjNWO7WyAQ9glaqAC0lgGGfflyxuB0G
         ez3yZ2jz8btscGcpyMsRRdZiAdst232m2NC484R0k7MDAIPjXOFPOxnv0MSPNVmrgsGF
         e6EhEKeThLcigWjx951PsN8rMD0o5RW0RoQSBoWhit6G87GokusFCIWFlKn6ypkEeeDa
         27Xpnm4x42Eyt+g3uoU35ad0nR96psi64VCVuQMDXXZZHXog7Tn4UnSyPemfrYgL/qYA
         NeHQ==
X-Gm-Message-State: AOAM532gtNo5husAyHdSpUQWqJNbILZOmAHjgoHY/um11OV3tHNz8DO9
	NtFaaOZWPqAvTBIZC0Wd8aUMWw==
X-Google-Smtp-Source: ABdhPJyvNaVNSe53kCk5uJ0s3m4BeDlq7EKMbKPXl7BDoZl3wIfbtUKusGynjVh8y+Mh4G/sxUd31w==
X-Received: by 2002:a63:4e4c:: with SMTP id o12mr7711298pgl.143.1614452366715;
        Sat, 27 Feb 2021 10:59:26 -0800 (PST)
Subject: Re: [RFC PATCH] cpu: system_ops: move to cpu-system-ops.h, keep a
 pointer in CPUClass
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paul Durrant
 <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, xen-devel@lists.xenproject.org,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210226164001.4102868-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <516603e7-d3ba-6958-41ec-ebcc52530d37@linaro.org>
Date: Sat, 27 Feb 2021 10:59:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210226164001.4102868-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2/26/21 8:40 AM, Philippe Mathieu-Daudé wrote:
> +++ b/include/hw/core/cpu-system-ops.h
> @@ -0,0 +1,89 @@
> +/*
> + * CPU operations specific to system emulation
> + *
> + * Copyright (c) 2012 SUSE LINUX Products GmbH
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef CPU_SYSTEM_OPS_H
> +#define CPU_SYSTEM_OPS_H

I think you should create this header from the start, so that you don't have to
move the structure later.

> +/* see cpu-system-ops.h */
> +struct CPUSystemOperations;

In the beginning, you'd actually #include the new header here, and in this
final patch you'd remove the include and insert the declaration.

>      /* when system emulation is not available, this pointer is NULL */
> -    struct CPUSystemOperations system_ops;
> +    struct CPUSystemOperations *system_ops;

Insert the comment here, since the structure can't be null.  ;-)
Also, const.

>      /* when TCG is not available, this pointer is NULL */
>      struct TCGCPUOps *tcg_ops;

The only reason this one isn't const is hw/mips/jazz.  And I'm very tempted to
hack around that one.

> +static struct CPUSystemOperations arm_sysemu_ops = {
> +    .vmsd = &vmstate_arm_cpu,
> +    .get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug,
> +    .asidx_from_attrs = arm_asidx_from_attrs,
> +    .virtio_is_big_endian = arm_cpu_virtio_is_big_endian,
> +    .write_elf64_note = arm_cpu_write_elf64_note,
> +    .write_elf32_note = arm_cpu_write_elf32_note,
> +};

const.


r~

