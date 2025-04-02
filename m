Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8784DA78B8D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 11:53:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935491.1336886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzumJ-0006dU-1h; Wed, 02 Apr 2025 09:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935491.1336886; Wed, 02 Apr 2025 09:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzumI-0006aX-US; Wed, 02 Apr 2025 09:52:58 +0000
Received: by outflank-mailman (input) for mailman id 935491;
 Wed, 02 Apr 2025 09:52:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qYE3=WU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tzumH-0005z2-Nu
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 09:52:57 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4124cceb-0fa8-11f0-9ea8-5ba50f476ded;
 Wed, 02 Apr 2025 11:52:57 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3914a5def6bso3711846f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 02:52:57 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43eb5fcfa0esm15520405e9.13.2025.04.02.02.52.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 02:52:56 -0700 (PDT)
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
X-Inumbo-ID: 4124cceb-0fa8-11f0-9ea8-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743587576; x=1744192376; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=En/bICaPihI7jstGsUOESsxe0abo1T73f7rgPlM2d/g=;
        b=lheR0xdwbayd9Pb2ZK+h7kMVai4BdISPvph3D4ug3ZUNmBimDRIrxv+emyLDydLqEU
         xQJmGR9TqftzeWy2s8d+fcN3ci3cnYHk8abNalfqcvh0kfl/rcjz8CKIsenoC3X2YGDe
         NsjReqKh2zmk3dz3yiJ1A+tTv6WD5qMPVdJ0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743587576; x=1744192376;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=En/bICaPihI7jstGsUOESsxe0abo1T73f7rgPlM2d/g=;
        b=Iu6y9DN0tQpWvimrTKcUyfQDVYhD740ck0v6L9ZgEKLIg64fyQDE1k0fUOTqljyd3D
         Fx9ee9yfeosuhBOZDqVrxxqIqaAZonYDRkYS5xvkuRCxPWHUQvqTJ7hKyzZ8s5r/0BI5
         uwQDg/35Sb8PlKwse1bv0HgyXrwIiUeNnvC0KFgUTGM3I0N0/TNeH4jnHlPA9rbCBoud
         +oRnN9ub/3iXmnE+RpBZ+WilC5N1ZjqYBmHpZtkxcfN3PuCYsZ2LL8X5SqEtAN9F/Bu9
         Ra5MMDLcpsVqwLdOIu6yEcSYpk0LXvyNwEUF0VyI4JWRW+K5tW0SemkWg3wOyG3sRvGu
         sAsA==
X-Forwarded-Encrypted: i=1; AJvYcCXN/kE1u/tz1FGkk6OxDVRwvn4YC22DAdzSNlFpp070lyqyjajclSln8pKcEIODGyIzMQtoYx5pKTk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+SJ25cG6heRAifvgxB3q+g4wgU55XFliEWAfMPgyoQ9F/ZGsk
	4YUEwDgeN0W0+bOUNqn5agivp00jj8NMEhXv8RiP7a/4tVc767i67gB1XCtWAdM=
X-Gm-Gg: ASbGnct+nyFGdum09T16UD/4KWNr9KY+QFi2+jr7q7y4CYticlMXdRNhBoI5asofbBK
	RFtCNxZbzhC8IivP8omgy1nqNhyvRtEo+Da0IQ5J4eFVF4JZQE8BFX/2mYpkDbHFvNvUdmetfAb
	0n8CZ8bYM4MIC5hw/5w5owhc30l2SMOZW8UVYabAQprlcKnx0DNW74V//w8jYHLoexqNYWxTBCh
	V34QYJ1JldzV10w2eOFApe8X4OKKI1+H0UzdHsbb47lu+4JC4W6uNIcKVRJS7hBrAfbmwpEblB9
	1ppPZdQLUijneN+TQRuKSDajbHEGtnGAkzUfYAWGgIloqm0a5rQ2/LoU1EezM9A2wACMBmri/qk
	HjLiZ5FidBBbOX2VI44in
X-Google-Smtp-Source: AGHT+IHVefCQccuI8MK9OZ+mR+wfwQBHMayZb2SFRn94nlQAgxD7jsdV+imgtPLOxh7ViH36yabI+g==
X-Received: by 2002:a5d:5f52:0:b0:391:253b:4046 with SMTP id ffacd0b85a97d-39c120de297mr13417474f8f.16.1743587576572;
        Wed, 02 Apr 2025 02:52:56 -0700 (PDT)
Message-ID: <093d7c80-b013-4f33-8fb5-29d6133f85c3@citrix.com>
Date: Wed, 2 Apr 2025 10:52:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] x86/vmx: Use asm goto() in _vmx_cpu_up()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, dmkhn@proton.me,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250401233444.1181076-1-andrew.cooper3@citrix.com>
 <c84ee77b-2a5b-49d9-ac4e-018ce359f67c@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c84ee77b-2a5b-49d9-ac4e-018ce359f67c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/04/2025 10:40 am, Jan Beulich wrote:
> On 02.04.2025 01:34, Andrew Cooper wrote:
>> With the new toolchain baseline, we can make use of asm goto() in certain
>> places, and the VMXON invocation is one example.
>>
>> This removes the logic to set up rc (including a fixup section where bactraces
>> have no connection to the invoking function), the logic to decode it, and the
>> default case which was dead but in a way the compiler couldn't prove
>> previously.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: dmkhn@proton.me
>>
>> RFC.  To be rebased over Denis' general cleanup.
> LGTM. Can't this actually replace some of his cleanup? Judging from
> base-commit: at the bottom this isn't based on his work. In which case:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Oh.  I was expecting there to be far more debate on this.

In which case I expect it will be easiest for this patch to go in first,
and supersede Denis' cleanup to __vmxon(), so as not to rework it twice
in quick succession.  (Sorry.)

>
>> In principle, we can split fail into fail_valid and fail_invalid, allowing us
>> to spot the VMfail("VMXON executed in VMX root operation") case from the
>> pseduocode.  However, getting that involves a VMREAD of VM_INSTRUCTION_ERROR,
>> and error handling in case there isn't a loaded VMCS, so I think the
>> complexity is unwarranted in this case.
> +1
>
>> Bloat-o-meter:
>>   add/remove: 0/0 grow/shrink: 1/1 up/down: 13/-32 (-19)
>>   Function                                     old     new   delta
>>   _vmx_cpu_up.cold                            2460    2473     +13
>>   _vmx_cpu_up                                 1803    1771     -32
>>
>> The if ( 0 ) isn't terribly nice, but it's the least bad option I could come
>> up with.  It does allow the structure of the switch() to remain largely
>> intact.
> For the purpose of the diff here I agree. In a subsequent change we could then
> still move the whole blob to the end of the function. Especially if some of
> the static analysis tools didn't like the "if ( 0 )".

Actually, doing that is still a nice diff to read.  I think I'll take
this approach.  I'll send out a v2 in just a moment.

~Andrew

