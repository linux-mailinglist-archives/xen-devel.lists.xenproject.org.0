Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A72E9C70AA
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 14:31:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835696.1251556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBDSo-00030i-0D; Wed, 13 Nov 2024 13:31:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835696.1251556; Wed, 13 Nov 2024 13:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBDSn-0002yX-TH; Wed, 13 Nov 2024 13:31:17 +0000
Received: by outflank-mailman (input) for mailman id 835696;
 Wed, 13 Nov 2024 13:31:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gr6F=SI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tBDSm-0002yR-SV
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 13:31:16 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bdf0d8b-a1c3-11ef-a0c7-8be0dac302b0;
 Wed, 13 Nov 2024 14:31:11 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2fb388e64b0so9734041fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 05:31:11 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03b7f2b8sm7197342a12.32.2024.11.13.05.31.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2024 05:31:09 -0800 (PST)
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
X-Inumbo-ID: 8bdf0d8b-a1c3-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMmEiLCJoZWxvIjoibWFpbC1sajEteDIyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjhiZGYwZDhiLWExYzMtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNTA0NjcxLjA4OTQ3MSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731504670; x=1732109470; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=znqsvYnmZXuxbS1+kig6vcMbmZAmN6n4lE22vnllifE=;
        b=AuPolQKLLkNFy9J1nA6eCqDth7q0HGhvI8r/rzm8eAqUWltv6bIrqY3AxpkRg8lDht
         uEcTNp4Myo4DbC2OdotnEcH3Kzn953Dzjeo+sPJRub2WqMgfg4ws3Blb5rvFwfXxDzMi
         WbZqFGk8WT6nqII6NnNr+5BgWUcFhhLfHu+vg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504670; x=1732109470;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=znqsvYnmZXuxbS1+kig6vcMbmZAmN6n4lE22vnllifE=;
        b=wIZUG/mQa191HGc3bYbJqoBpjToefFqBUBKiiKKHO26dlMs0CvxJowPBTKerp2o0fX
         nYIpKVdoNh/ARfVYIvAiF73QP2nSLpvQEXQ917bbamXS21uZUJrp3IO6njt1+8UYJcv1
         UddjiNr5IlL/fTQmwTPYqvfR11v3aqTvEewM3yloSkVsKXmZsitHcXGXwiojFd9c2e/4
         FeKME9QLT2kHtxZDEt09NZaCPocohw2bm1VJOM5ZgkBlo+QPsYVkd2QuUhy5QoEbMDfk
         QFIWHl4ND+lQGgXbejkO/rqZ9Qajf65ivUNfFSEraFTyyaWqmR1xyl8cs4pdr4Qh36OX
         tKKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHDTpntuu3vFbO/G47RY63fh3uTh1M7kdu3cBp2F8GqGhwxDBMjzKqyTCL8zfLckoc6litV2dsunk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxrnSfDHfyEofaFbCKHYkbZu/cyztZ/OWj7UckURdYFbIV7TKyF
	6eH2stt558NB/e3GIoUlmmOMgNy5L3rhanlYSbym0rR7KpZbTGrL8+fVP4TQUSk=
X-Google-Smtp-Source: AGHT+IF4whJ0B6qflyUzSkeDhGEfH/7cxaWJMpk726BRk7y4je476YrUXci9mh+tqtDwJNtXkFBXSA==
X-Received: by 2002:a2e:bd02:0:b0:2ef:20ae:d113 with SMTP id 38308e7fff4ca-2ff4271fec1mr36518441fa.40.1731504670243;
        Wed, 13 Nov 2024 05:31:10 -0800 (PST)
Message-ID: <876f727c-8929-4149-af72-c3344db06e31@citrix.com>
Date: Wed, 13 Nov 2024 13:31:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86emul: ignore VEX.W for BMI{1,2} insns in 32-bit
 mode
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <367ba117-f376-433b-bd70-586d7519d94c@suse.com>
 <39de64e1-c615-4ec3-ad05-ff99f27a8e30@suse.com>
 <6442a109-de9a-4b81-a283-2d72bbc3d284@citrix.com>
 <3788f564-7f02-4e2e-ac4c-b29214206e0d@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3788f564-7f02-4e2e-ac4c-b29214206e0d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/11/2024 8:01 am, Jan Beulich wrote:
> On 13.11.2024 01:24, Andrew Cooper wrote:
>> On 12/11/2024 3:00 pm, Jan Beulich wrote:
>>> While result values and other status flags are unaffected as long as we
>>> can ignore the case of registers having their upper 32 bits non-zero
>>> outside of 64-bit mode, EFLAGS.SF may obtain a wrong value when we
>>> mistakenly re-execute the original insn with VEX.W set.
>>>
>>> Note that the memory access, if any, is correctly carried out as 32-bit
>>> regardless of VEX.W.
>> I don't understand why this is true.
> This talks about the access to guest memory, which is op_bytes based.
> And op_bytes determination handles VEX.W correctly afaics. I've added
> "guest" near the start of the sentence for clarification.

Ah - that makes things much clearer.

I had neglected to consider the access to guest memory.

In addition to a "guest" earlier, I'd suggest having a new paragraph at
this point, and ...

>
>> If we write out a VEX.W=1 form of BEXTR/etc and emulate while in 64bit
>> mode, it will have an operand size of 64.
>>
>> I can believe that ...
>>
>>>  Internal state also isn't leaked, as the field the
>>> memory value is read into (which is then wrongly accessed as a 64-bit
>>> quantity when executing the stub) is pre-initialized to zero.

... this reading:

"The emulator-local memory operand will be accessed as a 64-bit
quantity, but it is pre-initialised to zero so no internal state an leak"

or similar.

~Andrew

