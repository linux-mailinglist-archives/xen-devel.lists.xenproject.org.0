Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFDE9A2070
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 13:01:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820513.1234007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1OG8-0000Cx-3v; Thu, 17 Oct 2024 11:01:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820513.1234007; Thu, 17 Oct 2024 11:01:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1OG8-00009m-0s; Thu, 17 Oct 2024 11:01:36 +0000
Received: by outflank-mailman (input) for mailman id 820513;
 Thu, 17 Oct 2024 11:01:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2/Py=RN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t1OG6-00009c-L7
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 11:01:34 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bd3b491-8c77-11ef-a0be-8be0dac302b0;
 Thu, 17 Oct 2024 13:01:33 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a9a2cdc6f0cso100907366b.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2024 04:01:33 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a2974c2e6sm283527866b.84.2024.10.17.04.01.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2024 04:01:32 -0700 (PDT)
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
X-Inumbo-ID: 2bd3b491-8c77-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729162893; x=1729767693; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=j9vLN+4YtPQVMPCxjEhIs8Q2SiFC/khBLaM0fCcvFcY=;
        b=fDUN1Dp4jlzHHTv9RGLwtf89aPvIi2Ldb4Q01gh1+fR9OrOCszmzcW7d100ursqUaX
         bg8SJgDF9ZWdkpmRH7+7wuOBPly5HhMjPhDaCCyItOGKI0HI+lpt1QDUtYlVNcBDM2fl
         C1RKabULqRS0mOHuLYHhmVnNSCwu/0sTqVRAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729162893; x=1729767693;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j9vLN+4YtPQVMPCxjEhIs8Q2SiFC/khBLaM0fCcvFcY=;
        b=mFI7XlRaw8du3FI6CNrDbVDSim8GMRLpC+rsJWqOV+fd39zSYR3JNPwlGT1QBimwmd
         2BRTb07piYgsbPRqgL6/E0zmFfGUZWn3bdTJrdRwIy/AYNQq6zK45kejEKaR2WAhH4RE
         EzhKmEfOP8tnDnV/qj51HKy1A4mCQ724HWxLWqQLVetBfzID34B0j1UhijPWj1jagLJ8
         BfbeA5gAtIfTz+ucXPtDKJ6Dv9ecDxSc4vOBSStMsE2RYffdN0yfG3asCCwdYzkMFSwx
         kZU/83Ui6Lw35BJJ7mAZEDg7xPK06sEvohQHydqewgZTpv76SbSjh9Ve65Q6UVSUHtNH
         6mjQ==
X-Gm-Message-State: AOJu0YzOld4yhi4Umo3yk7QaGyk/wOkWSigkT5WuehmjTU7IMJoaT7pU
	J76jIkLPi0LfJ1W0in6rr2uon535zuRpOo6EEjoJKXmE3yV8SKztJ1Fbwq27LVU=
X-Google-Smtp-Source: AGHT+IEU2XfQE4+JPNIuqiLIfnWOXDxNjdGIXRyZMtU7YiLyzNyrPYOJt20GC2WMqFb9YYk89uLuYg==
X-Received: by 2002:a17:906:4fd0:b0:a9a:6bd:95dc with SMTP id a640c23a62f3a-a9a06bd968dmr1375833766b.46.1729162893024;
        Thu, 17 Oct 2024 04:01:33 -0700 (PDT)
Message-ID: <bfab40e2-1663-430d-a22a-3b26d3171f37@citrix.com>
Date: Thu, 17 Oct 2024 12:01:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] x86/boot: create a C bundle for 32 bit boot code
 and use it
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20241014085332.3254546-1-frediano.ziglio@cloud.com>
 <20241014085332.3254546-3-frediano.ziglio@cloud.com> <Zw05Tb8UvCQAIo+n@l14>
 <CACHz=ZiaSyr_6y=tniF6Kq7JcFjeoVse-dAX7TF3bsvL-r3jRg@mail.gmail.com>
 <Zw5zSURbpInM5oBY@l14>
 <CACHz=ZgN9qNygJWuWovpiU+MCGcJu9qaxaRT1VkkiHsYwbEN4A@mail.gmail.com>
 <Zw+it8oVVTrS62wx@l14>
 <CACHz=ZgD-Zf7_R+RWWO1o8qkZbEC0uPjmz2kMJ83qQ8jXmd2JA@mail.gmail.com>
 <CACHz=ZghYq0Mzd8=QhhD5HKMqCVm1-0bRK3FRU-vyoE6mENnOQ@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CACHz=ZghYq0Mzd8=QhhD5HKMqCVm1-0bRK3FRU-vyoE6mENnOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/10/2024 11:58 am, Frediano Ziglio wrote:
> On Wed, Oct 16, 2024 at 4:05 PM Frediano Ziglio
> <frediano.ziglio@cloud.com> wrote:
>> On Wed, Oct 16, 2024 at 12:25 PM Anthony PERARD
>> <anthony.perard@vates.tech> wrote:
>>> On Wed, Oct 16, 2024 at 09:33:32AM +0100, Frediano Ziglio wrote:
>>>> On Tue, Oct 15, 2024 at 2:51 PM Anthony PERARD <anthony.perard@vates.tech> wrote:
>>>>> On Mon, Oct 14, 2024 at 05:32:26PM +0100, Frediano Ziglio wrote:
>>>>>> On Mon, Oct 14, 2024 at 4:31 PM Anthony PERARD <anthony.perard@vates.tech> wrote:
>>>>>>> On Mon, Oct 14, 2024 at 09:53:28AM +0100, Frediano Ziglio wrote:
>>>>>>>> +# generate final object file combining and checking above binaries
>>>>>>>> +$(obj)/built_in_32.S: $(obj)/built_in_32.other.bin $(obj)/built_in_32.final.bin
>>>>>>> So, "other" isn't part of "final", I don't really know what those two
>>>>>>> things contains so naming wise I can't suggest anything useful.
>>>>> Instead of "other", is "control" (like in science experiment where you
>>>>> have a control group), or "offseted" (which seems to be how this second
>>>>> binary is constructed) would be better names for this *.bin? It seems
>>>>> the script take both input and play the game of the 7 differences, to
>>>>> find clues about the location of some symbols, right?.
>>>>>
>>>> I don't know the game and I think people not familiar with it won't
>>>> find new names more readable but less.
>>> Sorry, the "game" as nothing to do with the name I've proposed. I was
>>> just asking if the script take both *.bin and was looking for
>>> differences.
>>>
>>> (The game of 7 differences is simple: there's two similar pictures and
>>> you just look for the 7 differences between them, that's it.)
>>>
>>>> Not saying that current names are good, they just need to be located
>>>> at different addresses with some "magic" in the middle.
>>> Well to me "other" evoke a binary that contains functions that are not
>>> in "final", but instead they both contain the sames functions with
>>> slight variation of placement in the file (with added offset, gap), as I
>>> understand. But if you don't like my proposal, so be it.
>>>
>> What about "base" and "offsetted" ? I don't know why "offsetted"
>> sounds weird to me but I didn't find anything better. I hope some
>> native English speaker could come with a better proposal.
>>
> What about "base" and "bias"/"biased" ?

A plain "offset" would be fine in this context.

"offsetted" is indeed wrong English.

~Andrew

