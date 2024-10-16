Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0F39A0B75
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 15:30:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820060.1233560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t146N-00052U-TK; Wed, 16 Oct 2024 13:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820060.1233560; Wed, 16 Oct 2024 13:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t146N-0004zQ-Qh; Wed, 16 Oct 2024 13:30:11 +0000
Received: by outflank-mailman (input) for mailman id 820060;
 Wed, 16 Oct 2024 13:30:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uUxT=RM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t146M-0004zK-H2
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 13:30:10 +0000
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [2a00:1450:4864:20::242])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c30d430e-8bc2-11ef-a0be-8be0dac302b0;
 Wed, 16 Oct 2024 15:30:08 +0200 (CEST)
Received: by mail-lj1-x242.google.com with SMTP id
 38308e7fff4ca-2fb599aac99so27467041fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2024 06:30:08 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c98d4f9519sm1717637a12.30.2024.10.16.06.30.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Oct 2024 06:30:06 -0700 (PDT)
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
X-Inumbo-ID: c30d430e-8bc2-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729085408; x=1729690208; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Clhcj4XFM6+MzdJRguyszE8sxxdJKjoGSaU8XHco5Xc=;
        b=fRd6d37K4/xPxXtSBAxcY00FypS8Elxp7h6fbSWHwWNFkK+Vpbiu6C/X7wQP4ruXn+
         ieEcrCSr92OS3EpBTr+4Lp1BR/bgXC4ou7bQZsjyws2JGa0I8y+wmrpozMu6dX5EICkZ
         7VbNl85cf97l0BWklE0dDxmUqcrlJMRXPIo38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729085408; x=1729690208;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Clhcj4XFM6+MzdJRguyszE8sxxdJKjoGSaU8XHco5Xc=;
        b=RrMM0ShwtPXFXCeq4dElIsFm9e2+hCerYQS+nIXvXLGJhNHCspCMClhQ0VsVyx3aWt
         qbTEavA/rw5m2VDq9crtwmJTAu+LuoU6JLKEgCI6V2DoHujmfp82iCbIHCXk5D4rQWPZ
         cfpfeh5mNyxCkH+Ru2ecKnfMD2ZqeB48westkUL8T37Gmb1oMlKgusOzFoxWSRqO1dFc
         ER+Cs6pNEtPPqPWUmNuAkndwqj6jfHd04PiGQ0ql+GwnJq2liQhcoN9/LpZkSPrGNOq7
         xiFcGTQY5+xEVCFBOUKqCHUk3Wu7+wpyS5tVrmBSB65L4MgQoC+qF5UqeG/x26caIgt4
         kT8w==
X-Forwarded-Encrypted: i=1; AJvYcCVehNTR6PSqFxIW+pZOcmu8EMETZmFWTHGzuo3r7YAWzsUgda2zXbArRJPMX63UpSJ8L8IYfoJ3So8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxyjWVFfcGwgnsHhXjn8ftJ3g5moxWGvWk8NSjE7gFdomfaqtc9
	WRDeUw6xjXGa30Mrw44BjUDv7+O9E7vecsTLN0DxXbszKODhNJKJKmfxcbitcUU=
X-Google-Smtp-Source: AGHT+IE4undybD7imzbJD2lVR7F+H5hqDTfOtmGDovUv7ZkFBn8kUwculiPqUcTFzweU2pGy6amrZA==
X-Received: by 2002:a05:651c:1545:b0:2f7:543a:3b1a with SMTP id 38308e7fff4ca-2fb63f52b2amr17653211fa.7.1729085407702;
        Wed, 16 Oct 2024 06:30:07 -0700 (PDT)
Message-ID: <821ac8cc-a0ac-412b-8069-73c52541b70b@citrix.com>
Date: Wed, 16 Oct 2024 14:30:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: lib32 followup (visibility issue and/or toolchain bug?)
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20241016092154.1493035-1-frediano.ziglio@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241016092154.1493035-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Preempting some future work I'm expecting to arrive, I had a go at using
__builtin_*() in obj32.

This is formed of 2 patches on top of this series:
https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=shortlog;h=refs/heads/xen-lib32

Patch 1 introduces lib32 beside obj32, with strlen() being the first
broken-out function, and patch 2 swaps to __builtin_strlen().

Both compile, but the difference that patch 2 introduces was unexpected.

With just lib32, and taking strsubcmp() as an example, we get:

00000000 <strsubcmp>:
   0:        83 ec 0c                 sub    $0xc,%esp
   3:        89 5c 24 04              mov    %ebx,0x4(%esp)
   7:        89 74 24 08              mov    %esi,0x8(%esp)
   b:        89 c6                    mov    %eax,%esi
   d:        89 d3                    mov    %edx,%ebx
   f:        89 d0                    mov    %edx,%eax
  11:    /-- e8 fc ff ff ff           call   12 <strsubcmp+0x12>
            12: R_386_PC32    strlen
  16:        89 c1                    mov    %eax,%ecx
  18:        89 da                    mov    %ebx,%edx
  1a:        89 f0                    mov    %esi,%eax
  1c:    /-- e8 fc ff ff ff           call   1d <strsubcmp+0x1d>
            1d: R_386_PC32    .text.strncmp
  21:        8b 5c 24 04              mov    0x4(%esp),%ebx
  25:        8b 74 24 08              mov    0x8(%esp),%esi
  29:        83 c4 0c                 add    $0xc,%esp
  2c:        c3                       ret

which all seems fine.  We get a plain PC32 relocation to strlen (which
is now in the separate library).

However, with patch 2 in place (simply swapping the plain extern for
__builtin_strlen(), we now get:

00000000 <strsubcmp>:
   0:        83 ec 0c                 sub    $0xc,%esp
   3:        89 1c 24                 mov    %ebx,(%esp)
   6:        89 74 24 04              mov    %esi,0x4(%esp)
   a:        89 7c 24 08              mov    %edi,0x8(%esp)
   e:    /-- e8 fc ff ff ff           call   f <strsubcmp+0xf>
            f: R_386_PC32    __x86.get_pc_thunk.bx
  13:        81 c3 02 00 00 00        add    $0x2,%ebx
            15: R_386_GOTPC    _GLOBAL_OFFSET_TABLE_
  19:        89 c7                    mov    %eax,%edi
  1b:        89 d6                    mov    %edx,%esi
  1d:        89 d0                    mov    %edx,%eax
  1f:    /-- e8 fc ff ff ff           call   20 <strsubcmp+0x20>
            20: R_386_PLT32    strlen
  24:        89 c1                    mov    %eax,%ecx
  26:        89 f2                    mov    %esi,%edx
  28:        89 f8                    mov    %edi,%eax
  2a:    /-- e8 fc ff ff ff           call   2b <strsubcmp+0x2b>
            2b: R_386_PC32    .text.strncmp
  2f:        8b 1c 24                 mov    (%esp),%ebx
  32:        8b 74 24 04              mov    0x4(%esp),%esi
  36:        8b 7c 24 08              mov    0x8(%esp),%edi
  3a:        83 c4 0c                 add    $0xc,%esp
  3d:        c3                       ret


The builtin hasn't managed to optimise away the call to strlen (that's
fine).  But, we've ended up spilling %ebx to the stack, calculating the
location of the GOT and not using it.

So, as it stands, trying to use __builtin_strlen() results in worse code
generation.  One thing I noticed was that we're not passing
-fvisibility=hidden into CFLAGS_x86_32, but fixing that doesn't help
either.  We do have the pragma from compiler.h, so I'm out of visibility
ideas.

Anything else I've missed?

~Andrew

