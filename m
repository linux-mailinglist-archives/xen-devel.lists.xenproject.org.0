Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E4095D632
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 21:46:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782657.1192176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shaEv-0007Ys-A2; Fri, 23 Aug 2024 19:46:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782657.1192176; Fri, 23 Aug 2024 19:46:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shaEv-0007Wx-7H; Fri, 23 Aug 2024 19:46:29 +0000
Received: by outflank-mailman (input) for mailman id 782657;
 Fri, 23 Aug 2024 19:46:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=imIp=PW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1shaEt-0007Ul-MX
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 19:46:27 +0000
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [2607:f8b0:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 613e3b6b-6188-11ef-8776-851b0ebba9a2;
 Fri, 23 Aug 2024 21:46:25 +0200 (CEST)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-709340f1cb1so1448882a34.3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Aug 2024 12:46:25 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-454fdfc5968sm20387171cf.15.2024.08.23.12.46.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Aug 2024 12:46:23 -0700 (PDT)
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
X-Inumbo-ID: 613e3b6b-6188-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724442384; x=1725047184; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=63GxUiLX1+R40sAfn9XZYAikQyhhVfqQ+eA6iCCse3c=;
        b=UgKawMLnYtocwpGKTS2fHtlxsyXsQqfIW1GZidk3S7QUYXFzL2vtI4kjN1OSSeNsaF
         Gvs+i+TDcIKKmOoTS+vlvq6fYwyub7sSKgSvqBm50mMNBrS2SxQo402lUFbi05j5JmfH
         TPMawF4/QMpDIVMpmZedH8ayc9XAHt2BG1TCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724442384; x=1725047184;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63GxUiLX1+R40sAfn9XZYAikQyhhVfqQ+eA6iCCse3c=;
        b=uG0LDaST0cvBqDz20Q5E5+f+HiktjEGNkxpFjWBIiiPPkTVIxn2fmr0zu1k0b4d9+C
         FpZY+KrNPv+8q+mTmwmnnLQPblYUMg4CmMS2HALMMd2RySd714ccU4kbmyWMJijAmk+o
         vXR2VuolshngywQFDLWzdjXAZx6E6wKh1PEFcbhgy9/rxijKvtV2LA9Dbuj3dZclGFyN
         kaPay73rZirfxPbjY6PPRx/dqpwv8wQFosgOAWvt/mNFFfcmxNEKF+XUypp/nmYpT41s
         S+ODhD5/qEebv5daECII/IaXrCGKyE1QrBJ7hIU80BDsDX0PMnUXa3KOPesoQ2t62+sJ
         sReg==
X-Forwarded-Encrypted: i=1; AJvYcCWvvRANNudXpkAZRdD3qj/ros9j/YFk5To7u8h6EwBuZdpO+IyPkZxOZ8PWPLzNI9rl6qjv4cgzTh0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxefg1sI9YptyHv9zqVDh5ZogmGyvHL6WYLatPMMYVZpGG0939y
	aGYTnpbjmNHB5P9TMrbYKkSc/P1aVJHQ3X2yD94qtL3ppyycAYwUDNqYJzShDRJ3GiGQgOtNwMu
	k
X-Google-Smtp-Source: AGHT+IGwlJANI9moQjG2VO1oBf3g0iVtEr4PE2iWFdm6mtxwuu9ekj6l8IiwjL+nXbqASNsHpcrrfw==
X-Received: by 2002:a05:6830:90a:b0:708:b40a:fecc with SMTP id 46e09a7af769-70e0eb04dbfmr3861446a34.1.1724442384022;
        Fri, 23 Aug 2024 12:46:24 -0700 (PDT)
Message-ID: <34b5a144-41b9-4bb9-8f28-e4447b6a77b5@citrix.com>
Date: Fri, 23 Aug 2024 20:46:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] xen/bitops: Introduce for_each_set_bit()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240625190719.788643-1-andrew.cooper3@citrix.com>
 <20240625190719.788643-5-andrew.cooper3@citrix.com>
 <950da1fb-3df6-4962-b1fe-07e853507e37@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <950da1fb-3df6-4962-b1fe-07e853507e37@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/06/2024 11:17 am, Jan Beulich wrote:
> On 25.06.2024 21:07, Andrew Cooper wrote:
>> The prior version (renamed to bitmap_for_each()) was inefficeint when used
>> over a scalar, but this is the more common usage even before accounting for
>> the many opencoded forms.
>>
>> Introduce a new version which operates on scalars only and does so without
>> spilling them to memory.  This in turn requires the addition of a type-generic
>> form of ffs().
>>
>> Add testing for the new construct alongside the ffs/fls testing.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> with two remarks:
>
>> The naming of ffs_g() is taken from the new compiler builtins which are using
>> a g suffix to mean type-generic.
> As you say, a g suffix, not a _g one; gcc14 documents __builtin_ffsg().
> (Seeing it exists I wonder whether we wouldn't want to use it when
> available, and only fall back to the macro for older versions.) Any
> specific reason you use _g?

Legibility.  It's bad enough with the l() and ll() forms (which get
worse with the hweight() series, and I can't find a nice option).

The other option I considered was have ffs() be the generic one, and
have ffsi() for the int variant, but now we're in active contradiction
with the builtin scheme, rather than merely opting not to use it.

I don't expect this to get much use in practice.  Use of this in regular
code mixing ints and longs is almost certainly a bug on behalf of the
programmer.

~Andrew

