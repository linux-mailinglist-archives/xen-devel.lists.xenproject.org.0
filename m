Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 806E5A5D395
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 01:10:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909569.1316484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts9ew-0001AY-8d; Wed, 12 Mar 2025 00:09:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909569.1316484; Wed, 12 Mar 2025 00:09:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts9ew-000181-4w; Wed, 12 Mar 2025 00:09:18 +0000
Received: by outflank-mailman (input) for mailman id 909569;
 Wed, 12 Mar 2025 00:09:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5o35=V7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ts9ev-00017v-9V
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 00:09:17 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b5ee39e-fed6-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 01:09:15 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3914bc3e01aso1474078f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 17:09:14 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a75aa22sm4327685e9.19.2025.03.11.17.09.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 17:09:13 -0700 (PDT)
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
X-Inumbo-ID: 3b5ee39e-fed6-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741738154; x=1742342954; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=k5fCRA7OjOK2jCllStXp5TswRGXu8t0slsR5JE7Bhx8=;
        b=LHpoNQD8NC7m0Y2FQ+Um9H1F7ENmv17dYLXUSNXLZ0Bjg+uB2Fng9V4Ws32cM+BR/q
         bEHypTOIPrpSeOy2cKMGw0nbnbfekRXQ8eokplIAsR09biKgqD6D1r/JjRrdq023BoBM
         4ad5TZAHmwTXl5+wyHKI8nyLFQpw1PWsgN9F4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741738154; x=1742342954;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k5fCRA7OjOK2jCllStXp5TswRGXu8t0slsR5JE7Bhx8=;
        b=jd/M0Lx9fIHkrdutON4b81XVxYt1h4gOazyYWO1YHD/vGNxx6uDOx7G6FKcNmSzjq7
         lz2XpnCqs+Xm7apUSmsUk2GwklbBq+ijzWwrPtWAsUVa4NSqfoOtbFn0gGR0SlsLkKiq
         B3HrH58sTDVZCp0jQpe2Hp9I7wqdAgoCzVfSo4xBZoY0Y2TYFzgbO96nSJWa7IY5Gfcj
         wWbzIXyBYNQtIaZ9ci+Rdy015eY83hxZHnKmPSgGYClFzE8TSIVs+9VprwcCkR2rk2vX
         51fxWk0gh6utMDzVbqGIQiwXovYlRKwfd/RV4Cb0sFTEz6sNWzVIE8vSivFc56wOVdRU
         nuMw==
X-Gm-Message-State: AOJu0Yz/5nWvgvGM0dsd81Dx4VILFwJDP2/8cSoOXxC8QtE+nNsbCFJR
	2S/xVQoIWJ2K59XJDHFow3h1NBj7MWOWwctq7BIro79L813IbC6nbzp/LFLv3pJLKDs9930X278
	Z
X-Gm-Gg: ASbGncsYk1hnJYdHpqCs2Xz9BXc7fK9SLap1XcsLeN6svTWGM89qLvqprrbnT8eZLz7
	MEUKn8DjK2d8/M9U5+uc+dt33b+ls4lrjLid/Dv9pPMz/m87SP6KnKXPsjl2dkXS56QQ9vc5fXA
	dmhiYfKdV2hLB0muMxa5LDtM790zAX1KF5/5nfDj+LsOH9rnFkaJTO3Y2nb4IbOd/csc+SEaAem
	WPGj5GSCZ7eU5OukRJEykh8b3Xlf6o26IJCy5bKwBYFgjSQHeJw4bMUim4tIRN3k86hHA5Ib5nP
	Pugg3rq0xGqezSTShWFpgkbFwFz2JfdxESKiR2RUp/NKZRQm/RhgPFHpdLmGgYxKKSPLgMtB/xa
	vplrjVoYCbM4KURYkpKs=
X-Google-Smtp-Source: AGHT+IF1L/aSYwrz3iapiNiBu7y9OGqFHxBLpVRAT4ZJKsSu0RVkfgMvwFlkLappEwlfFfxtTfUrcQ==
X-Received: by 2002:a5d:5f45:0:b0:390:f832:383f with SMTP id ffacd0b85a97d-39132d05b37mr14721565f8f.2.1741738153815;
        Tue, 11 Mar 2025 17:09:13 -0700 (PDT)
Message-ID: <807487c5-6dbc-4fcd-a157-327335b3fd08@citrix.com>
Date: Wed, 12 Mar 2025 00:09:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/IDT: Fix IDT generation for INT $0x80
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Luca Fancellu <luca.fancellu@arm.com>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250311212248.3630583-1-andrew.cooper3@citrix.com>
 <cdae37d8-a01d-412c-a48b-f4e27d7d898e@citrix.com>
 <79b3e775-5996-4d31-80cf-0f29d56d9633@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <79b3e775-5996-4d31-80cf-0f29d56d9633@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/03/2025 11:36 pm, Andrew Cooper wrote:
> On 11/03/2025 9:27 pm, Andrew Cooper wrote:
>> On 11/03/2025 9:22 pm, Andrew Cooper wrote:
>>> When PV is enabled, entry_int80 needs to be DPL3, not DPL0.
>>>
>>> This causes the XSA-259 PoC to fail with:
>>>
>>>   --- Xen Test Framework ---
>>>   Environment: PV 64bit (Long mode 4 levels)
>>>   XSA-259 PoC
>>>   Error: Unexpected fault 0x800d0802, #GP[IDT[256]]
>>>   Test result: ERROR
>>>
>>> (Clearly I have a bug in XTF's rendering of the error code too.)
> Nope, it's a QEMU bug.  Under QEMU, we get:
>
> --- Xen Test Framework ---
> Environment: PV 64bit (Long mode 4 levels)
> XSA-259 PoC
> (XEN) [    3.982447] *** #GP/IDT ec 00000802
> (XEN) [    3.982668] *** #GP/IDT ec 00000802, not permitted
> (XEN) [    3.982849] *** #GP inject ec 00000802
> Error: Unexpected fault 0x800d0802, #GP[IDT[256]]
> Test result: ERROR
>
>
> On real hardware:
>
> (d1) --- Xen Test Framework ---
> (d1) Environment: PV 64bit (Long mode 4 levels)
> (d1) XSA-259 PoC
> (XEN) *** #GP/IDT ec 00000402
> (XEN) *** #GP/IDT ec 00000402, not permitted
> (XEN) *** #GP inject ec 00000402
> (d1) Success: Not vulnerable to XSA-259
> (d1) Test result: SUCCESS
>
> So it's by chance that Luca's testing even picked up this failure.  The
> XSA-259 PoC can't distinguish between the #GP INT emulation path and the
> INT80 fastpath's error path which injects #GP.

And a patch submitted.

https://lore.kernel.org/qemu-devel/20250312000603.3666083-1-andrew.cooper3@citrix.com/T/#u

~Andrew

