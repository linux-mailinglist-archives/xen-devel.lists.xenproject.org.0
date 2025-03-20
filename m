Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FDFA6A3DC
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 11:39:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921726.1325498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvDJD-00046X-Lr; Thu, 20 Mar 2025 10:39:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921726.1325498; Thu, 20 Mar 2025 10:39:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvDJD-00043a-I2; Thu, 20 Mar 2025 10:39:31 +0000
Received: by outflank-mailman (input) for mailman id 921726;
 Thu, 20 Mar 2025 10:39:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vaXX=WH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tvDJC-0003oU-Ht
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 10:39:30 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99d5e451-0577-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 11:39:29 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso3794145e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 03:39:29 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f6bf09sm44640845e9.26.2025.03.20.03.39.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 03:39:27 -0700 (PDT)
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
X-Inumbo-ID: 99d5e451-0577-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742467168; x=1743071968; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kEQibdfx57irddpcsnyXU4WxyFvZtkyG06d+LDZQ/5k=;
        b=iqimM/VUsZ1uYr+867RBXSQMIg3bIx11edi35zSm58AHZzl6yt/K+T/7a1dbXn3hX5
         Ne/LK0jKSeJ190DK+rgvhILygXQILJlyGb8fGrHgjiWF0UDvu5f5AFZkd998FbZ99pac
         BlnLS9QHyn1LZ8yu+PZKwLqpDIC7fcarJmpJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742467168; x=1743071968;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kEQibdfx57irddpcsnyXU4WxyFvZtkyG06d+LDZQ/5k=;
        b=FThsALcoURv7kzWTvu3H183Q3uVKKfjwRPoLK6M7v8QS7c6lhIlZxOyRHeLojLaHtU
         OvnTzpWQuN7YEZN9CGH3cpgPUn5Fg3WQgAOePDTlaS/Dh4mmQT+9vF5roMoLYVvJ2UEr
         RolL3/xSsrMPtsIiHHUKMtH7AROPyPT8wcIvBg+ASS/5gDKjmNv5MtyOUYupzz5EyyKw
         5dE0x7S71uTJNunmjs7fWBbn7rVwP1+d4dGKpM4LX17RlzazuTDijK46YLsxy5NnplXG
         VsYJYC0dZiIBc5EKGYFtHtRa+gYXzzQFcVscktJNJVqzg8yMojkhvK9BN9Dfdz+aqgY4
         aXIw==
X-Forwarded-Encrypted: i=1; AJvYcCWaF/UefmSfTc3WvoI9jOuvMKEmtfDCzO+vAaYxtgs9qM7ZS/fmRYzFYebaTSedVz4SPgtc1jz4K+k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxLwORuZ7Ne/w834pdk6PrOjO11qwBynB0MrB3o8/7uRtQfYs2c
	JQFzyns8LQpbca2QiYfClcXUQ8ecYtlIvQUCLkqoupAqnvNy9t2raCEsFk598BM=
X-Gm-Gg: ASbGncsC/3BKGljtzKOU4/ro6FDHYAhIMWMUsZozGyZH7Hmb36pimOE3BZL7F/5C0qH
	5NXxtt31jmURYNseUZmO+cU47zJ+5U7MQwP3clEdGpYi27KMHinwL/HNqWPqlOzfaLiM7h5nisE
	ga5P4yk4yWtGVlxBRdIa8Oaq+an5K2w+zY6omptDyQC5cniEfsqa/3xYlqux179KlBYkkCKtTj/
	ONZm+9KpCqGtReEX7oB+FhvFtFqdKzaqCNt1cDZWVVHTe2hzlnBdfYf3Z8hN1dOXroTw+FvVMsE
	IX6GNcMh8clwQGgRzH84T4Q8zmp49lbTutmRsOVUPHVQhYFUGM+0H7SxLG5yZWhe9vARAafkUxf
	8GT5W/MqOTw==
X-Google-Smtp-Source: AGHT+IHlIGjbg4G/APzTVfmO8z+9M/ejau88dtN5Wa/Glzk8PawATExDNuSv1c5kC+U1y2MrzOwqPg==
X-Received: by 2002:a05:600c:81b:b0:439:873a:1114 with SMTP id 5b1f17b1804b1-43d49171dfamr15575255e9.6.1742467168348;
        Thu, 20 Mar 2025 03:39:28 -0700 (PDT)
Message-ID: <545dcd10-2cff-4f31-be7d-004ad36eeb34@citrix.com>
Date: Thu, 20 Mar 2025 10:39:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/PVH: account for module command line length
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <577ddc98-fdbb-48af-9c7e-1a411383516b@suse.com>
 <9bdc10ba-8572-46b3-a39e-e011e97d1e85@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9bdc10ba-8572-46b3-a39e-e011e97d1e85@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/03/2025 9:28 am, Jan Beulich wrote:
> As per observation in practice, initrd->cmdline_pa is not normally zero.
> Hence so far we always appended at least one byte. That alone may
> already render insufficient the "allocation" made by find_memory().
> Things would be worse when there's actually a (perhaps long) command
> line.
>
> Skip setup when the command line is empty. Amend the "allocation" size
> by padding and actual size of module command line. Along these lines
> also skip initrd setup when the initrd is zero size.
>
> Fixes: 0ecb8eb09f9f ("x86/pvh: pass module command line to dom0")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Use elf_round_up(). Introduce initrd_cmdline local. Re-base.
>
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -652,9 +652,10 @@ static int __init pvh_load_kernel(
>      unsigned long image_len = image->size;
>      unsigned long initrd_len = initrd ? initrd->size : 0;
>      const char *cmdline = image->cmdline_pa ? __va(image->cmdline_pa) : NULL;
> +    const char *initrd_cmdline = NULL;
>      struct elf_binary elf;
>      struct elf_dom_parms parms;
> -    size_t extra_space;
> +    size_t extra_space = 0;
>      paddr_t last_addr;
>      struct hvm_start_info start_info = { 0 };
>      struct hvm_modlist_entry mod = { 0 };
> @@ -712,10 +713,23 @@ static int __init pvh_load_kernel(
>       * split into smaller allocations, done as a single region in order to
>       * simplify it.
>       */
> -    extra_space = sizeof(start_info);
> +    if ( initrd_len )
> +    {
> +        extra_space = elf_round_up(&elf, initrd_len);
> +
> +        if ( initrd->cmdline_pa )
> +        {
> +            initrd_cmdline = __va(initrd->cmdline_pa);
> +            if ( !*initrd_cmdline )
> +                initrd_cmdline = NULL;
> +        }
> +        if ( initrd_cmdline )
> +            extra_space += strlen(initrd_cmdline) + 1;
> +
> +        extra_space = ROUNDUP(extra_space, PAGE_SIZE) + sizeof(mod);
> +    }
>  
> -    if ( initrd )
> -        extra_space += sizeof(mod) + ROUNDUP(initrd_len, PAGE_SIZE);
> +    extra_space += sizeof(start_info);
>  

This is rather ugly.  I could rearrange the original patch, but the main
issue is "extra_space = elf_round_up(&elf, initrd_len);" and that trick
works exactly once in the function, seeing as it clobbers the running total.

IMO it would be better to have a local initrd_space variable, with an
"extra_space += ROUNDUP(initrd_space ...)", at which point the logic
(and therefore the diff) becomes rather more simple.


There is a change in behaviour.  You mention empty initrds in the commit
message, but it is possible to have an empty initrd with a non-empty
cmdline.  Previously we would have passed that on, whereas now we dont.

I suspect we probably don't care.  cmdlines on secondary modules are
rare to begin with, but I just want to make sure we've considered the
possibility.

~Andrew

