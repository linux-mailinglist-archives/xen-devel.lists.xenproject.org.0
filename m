Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DA37A07DD
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 16:50:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602336.938845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnex-00070E-MQ; Thu, 14 Sep 2023 14:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602336.938845; Thu, 14 Sep 2023 14:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnex-0006x6-JS; Thu, 14 Sep 2023 14:49:35 +0000
Received: by outflank-mailman (input) for mailman id 602336;
 Thu, 14 Sep 2023 14:49:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uqVP=E6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qgnev-0006x0-M6
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:49:33 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e98c4d3a-530d-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 16:49:31 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-401b0d97850so10748665e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 07:49:31 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 z8-20020a056000110800b0031f3ad17b2csm1950578wrw.52.2023.09.14.07.49.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 07:49:30 -0700 (PDT)
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
X-Inumbo-ID: e98c4d3a-530d-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694702971; x=1695307771; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zne1OX1oDPam0QWlrxGvVRukK39lTInpkTsnThBGQlQ=;
        b=t7BSIzdT9ypqjxz5zvOrhq/iRIeNL8rlRjtdOKZp5oRDkLathGorc/RrHhJaZ1XnOg
         ZgBHaAhbwka202ZwOpHX20s/APTANRSozJbuDDPS2hufNz5oIu/Ej8rVnF+72X9tNcEm
         Xz1i/7g2wWNHC6a+UoaVHCkYLSzuhxEt8lbJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694702971; x=1695307771;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zne1OX1oDPam0QWlrxGvVRukK39lTInpkTsnThBGQlQ=;
        b=bl+7YaWBphcigWdSygsykiSzXqoQ5umCoJ9bqnhTF4otBj/BYfHagqCLmBwZs9vYpN
         rFkFiYoLkPX1Tu3ub0aCHPXr942xZjGCMFEzsgnov54ROZHO1KR53SVJoml9NGO9CySW
         vS3LNrnb3zkLmuF4LSho27Alb4lPwMcKVxUs/UkI3HUyK5RNI6QVidIFkigqwrbsSSEK
         S/NY/dpuN1053ST6/ZLSp3UyHch4uLZFBuUlWvZ8/r8MwlkzRxWKjsSW0Yap0NxWgIcl
         YGiS1bcSHf/Nkl453r4ycVSN8dRg05gJ9OjRbor8CWjy+cX7piUKc7cfpSaKVOkQEMKx
         5wUQ==
X-Gm-Message-State: AOJu0YwipjfGqoYj+Vq8bKobZOkd1gsOv49uoMIK5LQZb6UhkkEFclaN
	QfEH9g6JDKecHuhcEjANkB6Azw==
X-Google-Smtp-Source: AGHT+IEFaX/5Wy1MXoj1BVx54egJZItwM9C+1G6JXnc2ro7OKSnZpQWH+/8yDPenwQDJybRd8f4WQQ==
X-Received: by 2002:a5d:518f:0:b0:31f:a9db:b838 with SMTP id k15-20020a5d518f000000b0031fa9dbb838mr5316861wrv.15.1694702970802;
        Thu, 14 Sep 2023 07:49:30 -0700 (PDT)
Message-ID: <bc8eaf44-b93a-c6fc-01cf-4f39835d0e99@citrix.com>
Date: Thu, 14 Sep 2023 15:49:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/5] x86/pv: Fix the determiniation of whether to inject
 #DB
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230912232113.402347-1-andrew.cooper3@citrix.com>
 <20230912232113.402347-2-andrew.cooper3@citrix.com>
 <d7c3d67d-cd5d-d2c8-34a4-2e0c99ebe92b@suse.com>
In-Reply-To: <d7c3d67d-cd5d-d2c8-34a4-2e0c99ebe92b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/09/2023 3:40 pm, Jan Beulich wrote:
> On 13.09.2023 01:21, Andrew Cooper wrote:
>> We long ago fixed the emulator to not inject exceptions behind our back.
>> Therefore, assert that that a PV event (including interrupts, because that
>> would be buggy too) isn't pending, rather than skipping the #DB injection if
>> one is.
>>
>> On the other hand, the io_emul() stubs which use X86EMUL_DONE rather than
>> X86EMUL_OKAY may have pending breakpoints to inject after the IO access is
>> complete, not to mention a pending singlestep.
> If you look at the uses of X86EMUL_DONE you'll see that this error code is
> not intended to ever come back from the emulator. It's solely used to
> communicate between hooks and the core emulator. Therefore I think this
> part of the description and the added case label are wrong here. With them
> dropped again ...

Oh.  I see that now you've pointed it out, but it's far from clear.

I'd suggest that we extend the the debug wrapper for x86_emulate() with
an assertion to this effect.  It also has a knock-on effect in later
patches.

With the DONE part dropped, this probably wants merging into patch 4. 
Thoughts?

~Andrew

