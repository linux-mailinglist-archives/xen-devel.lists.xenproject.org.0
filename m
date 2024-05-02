Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BEC8B9C59
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 16:33:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715849.1117793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2XU9-0001ov-T4; Thu, 02 May 2024 14:32:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715849.1117793; Thu, 02 May 2024 14:32:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2XU9-0001ml-QP; Thu, 02 May 2024 14:32:33 +0000
Received: by outflank-mailman (input) for mailman id 715849;
 Thu, 02 May 2024 14:32:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J/qc=MF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s2XU8-0001mf-Bg
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 14:32:32 +0000
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [2607:f8b0:4864:20::f36])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd496ba0-0890-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 16:32:29 +0200 (CEST)
Received: by mail-qv1-xf36.google.com with SMTP id
 6a1803df08f44-6a071595d22so41288096d6.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 07:32:29 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 z7-20020a0cfec7000000b006a0d2a52017sm382796qvs.146.2024.05.02.07.32.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 07:32:27 -0700 (PDT)
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
X-Inumbo-ID: cd496ba0-0890-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714660348; x=1715265148; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nWmuVZtzqrHtgUIOTc0CdZVJQG5k8cyxHYUZVt6RUXI=;
        b=qYzimQwf/KI7dD612OBSbe87u1xAjqIyhnmfyJFGWA0L62E0tn/+wTaJiyK+YbRHci
         tAy5rxIv67nWMVys08Vm3/mzhysjs7Z7mcp3PEuBPBfRllG7OuwHMKyQ8CU54kTohe3E
         WEBNvs+VT/D7/FeShqyKWFREi+5aLftMN5okw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714660348; x=1715265148;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWmuVZtzqrHtgUIOTc0CdZVJQG5k8cyxHYUZVt6RUXI=;
        b=gbDTjfs3gaJB3gUUwWCdZAhdrVlnSqKUSiMP4xfTI7kzEGPN1g4d+oLF/0CNPlS1LI
         UZxmDsk3sE+VIdyBAbOumxo62sPbnFpPWFbaFkS5ipk7tnJatCoZXuugXWtZvfbdr3wW
         B4tx/JzG5qoMLAdy5BkWP1w31G4RgU0WXrZuM7hWRp/Sf4fTz/YXFt4hGh5a+zB0MCnT
         PcSj3GaxlPCAGuaV+kZsbxIPf5tmSj5NuI/1gxQLsrBGEk6P211/Nb7Xf6CfxeO88C8w
         /XNJ34mScPv31Mvb6wvH3bVuhGtTnvY69Rq6941rZRsTRfb6KBjNJG+S7M9GMidTXHiS
         6zrA==
X-Forwarded-Encrypted: i=1; AJvYcCWVPmedYZNQ81bgWuP2VKYRzyCEWulwFBZxriXPEHNZyw/R2otq8nbgL9YoahlKRoGsbmqgwY8VB3Ug6AxLX7OmjmzPts0LH77dorw7Wis=
X-Gm-Message-State: AOJu0YxOnTB32saXdDd4aUENwT1BYXclCBrzLGwLjipbP2geRn5hzc8N
	2lIIDMNxZsYJuSLJgR7/xA9sUz7K0W2M/OlODvbf/3MUcs0fRl7Bp6LTYLI8ryA=
X-Google-Smtp-Source: AGHT+IHzYCmkq8hIAY2wDFDqxCGaEQMH+U6Z+/+KAzJ24/D552bXtXY8jx6SbO9qv00KGtuiVkwmRA==
X-Received: by 2002:a05:6214:27c5:b0:69b:5ecd:7c9a with SMTP id ge5-20020a05621427c500b0069b5ecd7c9amr5797751qvb.51.1714660347700;
        Thu, 02 May 2024 07:32:27 -0700 (PDT)
Message-ID: <f20dae24-02eb-4091-9ab5-816587eca43b@citrix.com>
Date: Thu, 2 May 2024 15:32:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] x86/cpuid: Fix handling of xsave dynamic leaves
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240429182823.1130436-1-andrew.cooper3@citrix.com>
 <20240429182823.1130436-5-andrew.cooper3@citrix.com>
 <d87b31be-6c52-4271-a61f-bf31043f507d@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d87b31be-6c52-4271-a61f-bf31043f507d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/05/2024 2:04 pm, Jan Beulich wrote:
> On 29.04.2024 20:28, Andrew Cooper wrote:
>> If max leaf is greater than 0xd but xsave not available to the guest, then the
>> current XSAVE size should not be filled in.  This is a latent bug for now as
>> the guest max leaf is 0xd, but will become problematic in the future.
> Why would this not be an issue when .max_leaf == 0xd, but .xsave == 0?

Hmm, true.  I'll adjust the description.

>
>> The comment concerning XSS state is wrong.  VT-x doesn't manage host/guest
>> state automatically, but there is provision for "host only" bits to be set, so
>> the implications are still accurate.
>>
>> Introduce {xstate,hw}_compressed_size() helpers to mirror the uncompressed
>> ones.
>>
>> This in turn higlights a bug in xstate_init().  Defaulting this_cpu(xss) to ~0
>> requires a forced write to clear it back out.  This in turn highlights that
>> it's only a safe default on systems with XSAVES.
> Well, yes, such an explicit write was expected to appear when some xsaves-
> based component would actually be enabled. Much like the set_xcr0() there.

I stumbled over this because the debug logic ended up trying to restore
0xffffffff (the thing it read out as the "last" value) back into XSS. 
This works about as well as you'd expect.
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> The more I think about it, the more I think that cross-checking with hardware
>> is a bad move.  It's horribly expensive, and for supervisor states in
>> particular, liable to interfere with functionality.
> I agree, but I'd also like to see the cross checking not dropped entirely.
> Can't we arrange for such to happen during boot, before we enable any such
> functionality? After all even in debug builds it's not overly useful to do
> the same cross-checking (i.e. for identical inputs) over and over again.
> Of course doing in an exhaustive manner may be okay for the uncompressed
> values, but might be a little too much for all possible combinations in
> order to check compressed values, too.

Given the observation of patch 2 being buggy and my final sanity test
before posting didn't notice, I think doing this all at boot would be a
much better idea.

I think I'm going to do a new patch early in the series as an adjustment
to xstate_init().

We can't feasibly test every combination, but what ought to do is
linearly accumulate the xstates Xen knows about and checking that in
each case the size(s) increase as appropriate.

This will have a substantial impact on the remainder of the series, but
I think the end result will be all the better for it.
>> --- a/xen/arch/x86/xstate.c
>> +++ b/xen/arch/x86/xstate.c
>> @@ -614,6 +614,65 @@ unsigned int xstate_uncompressed_size(uint64_t xcr0)
>>      return size;
>>  }
>>  
>> +static unsigned int hw_compressed_size(uint64_t xstates)
>> +{
>> +    uint64_t curr_xcr0 = get_xcr0(), curr_xss = get_msr_xss();
>> +    unsigned int size;
>> +    bool ok;
>> +
>> +    ok = set_xcr0(xstates & ~XSTATE_XSAVES_ONLY);
>> +    ASSERT(ok);
>> +    set_msr_xss(xstates & XSTATE_XSAVES_ONLY);
>> +
>> +    size = cpuid_count_ebx(XSTATE_CPUID, 1);
>> +
>> +    ok = set_xcr0(curr_xcr0);
>> +    ASSERT(ok);
>> +    set_msr_xss(curr_xss);
>> +
>> +    return size;
>> +}
>> +
>> +unsigned int xstate_compressed_size(uint64_t xstates)
>> +{
>> +    unsigned int i, size = XSTATE_AREA_MIN_SIZE;
>> +
>> +    if ( xstates == 0 ) /* TODO: clean up paths passing 0 in here. */
>> +        return 0;
>> +
>> +    if ( xstates <= (X86_XCR0_SSE | X86_XCR0_FP) )
> Same comment as on the earlier change regarding the (lack of) use of ....
>
>> +        return size;
>> +
>> +    /*
>> +     * For the compressed size, every component matters.  Some are
>> +     * automatically rounded up to 64 first.
>> +     */
>> +    xstates &= ~XSTATE_FP_SSE;
> ... this constant up there.
>
>> +    for_each_set_bit ( i, &xstates, 63 )
>> +    {
>> +        if ( test_bit(i, &xstate_align) )
>> +            size = ROUNDUP(size, 64);
>> +
>> +        size += xstate_sizes[i];
>> +    }
> The comment is a little misleading: As you have it in code, it is not the
> component's size that is rounded up, but its position. Maybe "Some have
> their start automatically rounded up to 64 first"?

Size in that sentence referees to the compressed size of everything, not
the size of the component.

But I'll try to make it clearer.

~Andrew

