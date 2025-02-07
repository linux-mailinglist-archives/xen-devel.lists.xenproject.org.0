Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B76B1A2D146
	for <lists+xen-devel@lfdr.de>; Sat,  8 Feb 2025 00:07:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884120.1293921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgXRB-0000F2-Qt; Fri, 07 Feb 2025 23:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884120.1293921; Fri, 07 Feb 2025 23:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgXRB-0000DY-Np; Fri, 07 Feb 2025 23:07:05 +0000
Received: by outflank-mailman (input) for mailman id 884120;
 Fri, 07 Feb 2025 23:07:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iVmI=U6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tgXRA-0000DQ-EY
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 23:07:04 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d8fb3d0-e5a8-11ef-b3ef-695165c68f79;
 Sat, 08 Feb 2025 00:07:02 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-438a3216fc2so25509785e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 07 Feb 2025 15:07:02 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390d94d802sm108040915e9.12.2025.02.07.15.07.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 15:07:00 -0800 (PST)
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
X-Inumbo-ID: 3d8fb3d0-e5a8-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738969622; x=1739574422; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mXIZeIZBAhHe4hkIYsT3RVgXvoq4+sm3OZBkTehpHDg=;
        b=MYraDc8JxGaA26SmSs+mggw2f4W9cz4leVezrjUBaZnd6u9DBzxM0XUAN8dM/fa8l6
         KasD38IEKKVj97fzNFG1WBVvs9kXSwBauUEqjkPxIyxq02Nx3yFaHk+R4FZcqDXm9aUC
         JxkaU8c5eLjM8AYM505mmTHnmN32UB9qmbeBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738969622; x=1739574422;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXIZeIZBAhHe4hkIYsT3RVgXvoq4+sm3OZBkTehpHDg=;
        b=Mtq9GTyTD8in0EC7mo4ogM+DXH6496l35m+AekoFT/ppxC6+WiF98lh110Ij1jUR9A
         c5AC4Vi7uK8HTWNz3WzUT+CWfIHMPojf4G1jzCnBtDBf/Uzd6BLY5LqBltbLtuymG0/r
         fWMgGWiH/Z7aK4opkF5W3l/6CavgdDAgDK+hQdfCwwO5UV7/YZIzfXFsEQ4aXXspMzu5
         aZI1shbJshahnci7xqgoreaeSaoUi1c2kMU/wiPRG3QWYBDZOhTPBNcJSvRTjl4Qy5SZ
         YdwhepoDfugbejSwKEoVryaL5WcOXrm5JOJwH6TmiiGetf/mLeCB69DayFWjO4ZEhSxb
         Xfxw==
X-Gm-Message-State: AOJu0YxHLgvRcLG0QzDio22EvszdefFQdmASdJxUcwbT41Tf7bypYlX3
	RCZkGuj6E3Dtr3KouzlT4vs4eO6vQ85Kuaoa2inY5liEBXKzAnpqX8TkXbydSIg=
X-Gm-Gg: ASbGncvnJe0DDLopLZAME1coaODNqJITStvZcPN0wWcrJCo9CXfMX4YRUh5VYbUbylQ
	+WWu9rLofe3VrCWr0yKAstofgpk2tZeQR6HDVLMi8HFYAHueoGe/TDdRZIAHI4m9QG++6Eqzey4
	i0+DKdYl99RyfTfheA99D+1jfhrKYVuXGHsoOPKj1nk81f9Rmm2bK38V+4D7UYAWza/8n2JBisD
	E8VeJcCn0DBdjov0r8cyYiVjqnD4tqYUCQ7wNwGP9rCELn+fHoOw7TD9NXHAv8H8W05W4sD4W1f
	3qg6FYt2ER88dYc/QcKjvdkCcet4MTgNXMsTtJim9B3/SYEo1Hv9LNI=
X-Google-Smtp-Source: AGHT+IExEYgMu7g/n9Gr0ppj7B0muvrzjN/BndBCCfdbmgG5DbMQFU5ic8YWFN67j726ZDBU8Jp8NA==
X-Received: by 2002:a05:600c:354a:b0:436:e751:e445 with SMTP id 5b1f17b1804b1-43924980937mr50878855e9.5.1738969621623;
        Fri, 07 Feb 2025 15:07:01 -0800 (PST)
Message-ID: <cba242f0-d957-4701-9fd9-a59e4111be7a@citrix.com>
Date: Fri, 7 Feb 2025 23:06:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] automation: enable UBSAN for debug tests
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, cardoe@cardoe.com,
 alejandro.vallejo@cloud.com, anthony.perard@vates.tech,
 michal.orzel@amd.com, jbeulich@suse.com, julien@xen.org,
 roger.pau@citrix.com, bertrand.marquis@arm.com
References: <alpine.DEB.2.22.394.2502051756210.619090@ubuntu-linux-20-04-desktop>
 <3bb8a7dd-3b3c-43a4-9f50-37c4134eb204@citrix.com>
 <alpine.DEB.2.22.394.2502071459560.619090@ubuntu-linux-20-04-desktop>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <alpine.DEB.2.22.394.2502071459560.619090@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/02/2025 11:05 pm, Stefano Stabellini wrote:
> On Fri, 7 Feb 2025, Andrew Cooper wrote:
>> On 06/02/2025 2:37 am, Stefano Stabellini wrote:
>>> automation: enable UBSAN for debug tests
>>>
>>> Enable CONFIG_UBSAN and CONFIG_UBSAN_FATAL for the ARM64 and x86_64
>>> build jobs, with debug enabled, which are later used for Xen tests on
>>> QEMU and/or real hardware.
>>>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, but aren't you
>> missing two builds?
> Thanks Andrew.
>
> Looking at test.yaml in details, this is the list of debug Xen builds
> for ARM64 and x86_64 without UBSAN enabled:
>
> alpine-3.18-gcc-debug-arm64-staticmem
> alpine-3.18-gcc-debug-arm64-static-shared-mem
> alpine-3.18-gcc-debug-arm64-earlyprintk
> debian-12-x86_64-gcc-debug
> debian-12-x86_64-clang-debug
>
> Do you think we should enable UBSAN in all of them? I am fine with that.
> So far, I have only targeted the two that are used more widely.

I was referring to RISC-V and PPC.

I've done a series enabling UBSAN in RISC-V.   I'm currently fixing bugs
in ARM, and PPC is unknown because the console is broken for some reason
I can't fathom.

~Andrew

