Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5209F682C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 15:21:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860450.1272469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNuvT-0002We-Hv; Wed, 18 Dec 2024 14:21:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860450.1272469; Wed, 18 Dec 2024 14:21:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNuvT-0002Tn-Ea; Wed, 18 Dec 2024 14:21:23 +0000
Received: by outflank-mailman (input) for mailman id 860450;
 Wed, 18 Dec 2024 14:21:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xglw=TL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tNuvS-0002Th-Bj
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 14:21:22 +0000
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [2a00:1450:4864:20::442])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59eccc90-bd4b-11ef-99a3-01e77a169b0f;
 Wed, 18 Dec 2024 15:21:20 +0100 (CET)
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-3863703258fso548758f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2024 06:21:20 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c80162ddsm14130504f8f.37.2024.12.18.06.21.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 06:21:19 -0800 (PST)
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
X-Inumbo-ID: 59eccc90-bd4b-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734531680; x=1735136480; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+JCJbP22T+5Ze5D++3EQHBYcNqmIdBZ+yjTivXT8QXc=;
        b=KEhKl6gN4X7iYxox+XK4LdBPrTFTemF34Rvmxw3v2SStdI0CegMtM8H+vg8kPO7AWu
         X/ufMaQ0VVoCDrmvVDlBusHFkOckNMbHGpNPDzrYFIM6BX/FuLD49Cmzr4Xcuzb1aY3C
         z1L3ubZZqGdvHDy+b0LsU2sSKY08xf6G/nqLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734531680; x=1735136480;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JCJbP22T+5Ze5D++3EQHBYcNqmIdBZ+yjTivXT8QXc=;
        b=hrS8t1bf55SQqk5z5FCFMFJoNxIRGyGXoKAGxiMD5/fXT6SPc4yKxA1xCuU5cslFO5
         rsEnkLeyB1xWdV3gVmMw54ttfUk4j6DanpDg1DnbPJmfnbzCtENpFOCugj0HmT+jXYrl
         JCF27d1z7opLdl8WSPjaRN+7vMKoJZjDhjb19ucrnMb9Ms/EakGYEUIMMzHoR3opnaCa
         9QFExCZsjQsWwnqTMz3NFp5TRqxbCHMiEeby+4gt3B8ZkSnOLRnAVkVh0JgSh05tNUy0
         ecRpHeKXWVu3RoaasPxyzDaVIdKZrfpYfmD85GFVz+YToArNH/gUbPFKyJiKytIGIB5U
         VawQ==
X-Gm-Message-State: AOJu0Yzs8WgHeDd/PV/7a/5xGzYU78+Cocy2AP9iCrRjyQmXdmcVmOUU
	GfWhdxa0iohhqDQDKMtpV6uDfohn3cZRtjSvjyWyk3zepHjK7qPAzzVdtroLlKI=
X-Gm-Gg: ASbGncs5EwS8yLjmg0HKNt2Fk/EU4kxGDngidWz7uDVzjUkjLlGgiZC+bKIgh18FkPs
	t4S7zBtUNr0+Joxc5qzvAc3f3MIl3FlB0mmprA9thLywFcK30pC2y1rupot9UN1qVxrWozHd6W0
	vCpnX0URxNESzrrbCAytGh/I3hXL5O7lRVLNrLiXef7RcbNifw8wNrtof1VzvxQQne666fx4w9z
	rUAmpbtqOqK0GbbLTwRhbUBz3V0kTuIk6lRpdbz7IzQT+D6+2gjI5daHpX56T6zGRNGABKknAIP
	3o7zr1GsX/Id0Oz/xvXM
X-Google-Smtp-Source: AGHT+IEmjv/CThFXYLbcra63lHMJXGXEZXM3wKP0ZKOC5XdhRbga8lAxTQRU3UPJAElO635LHLJVfQ==
X-Received: by 2002:a5d:59ae:0:b0:382:45db:6a1e with SMTP id ffacd0b85a97d-388e4e3cdc3mr2677343f8f.14.1734531679623;
        Wed, 18 Dec 2024 06:21:19 -0800 (PST)
Message-ID: <e4f30083-67f0-4eab-92a8-bab717a4ba16@citrix.com>
Date: Wed, 18 Dec 2024 14:21:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] tools, xen/scripts: clear out Python syntax
 warnings
To: Ariel Otilibili-Anieli <Ariel.Otilibili-Anieli@eurecom.fr>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <20241214161350.70515-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241216231128.211648-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241216231128.211648-2-Ariel.Otilibili-Anieli@eurecom.fr>
 <fe201e59-beb0-4134-abbb-13a55a4ec987@citrix.com>
 <2f7a8a-6761b180-9a89-1d1363a0@43143421>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2f7a8a-6761b180-9a89-1d1363a0@43143421>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/12/2024 5:13 pm, Ariel Otilibili-Anieli wrote:
> On Tuesday, December 17, 2024 17:26 CET, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
>> On 16/12/2024 11:07 pm, Ariel Otilibili wrote:
>>> * since 3.12 invalid escape sequences generate SyntaxWarning
>>> * in the future, these invalid sequences will generate SyntaxError
>>> * therefore changed syntax to raw string notation.
>>>
>>> Link: https://docs.python.org/3/whatsnew/3.12.html#other-language-changes
>>> Fixes: d8f3a67bf98 ("pygrub: further improve grub2 support")
>>> Fixes: dd03048708a ("xen/pygrub: grub2/grub.cfg from RHEL 7 has new commands in menuentry")
>>> Fixes: d1b93ea2615 ("tools/pygrub: Make pygrub understand default entry in string format")
>>> Fixes: 622e368758b ("Add ZFS libfsimage support patch")
>>> Fixes: 02b26c02c7c ("xen/scripts: add cppcheck tool to the xen-analysis.py script")
>>> Fixes: 56c0063f4e7 ("xen/misra: xen-analysis.py: Improve the cppcheck version check")
>>>
>>> Cc: Anthony PERARD <anthony.perard@vates.tech>
>>> Cc: Luca Fancellu <luca.fancellu@arm.com>
>>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
>> Having poked about a bit more, this is all a big mess, but these do now
>> work with Py3.12.
>>
>> leading \ for non-special characters are ignored in [], which is why ...
>>
>>> ---
>>>  tools/pygrub/src/GrubConf.py                  | 4 ++--
>>>  tools/pygrub/src/pygrub                       | 6 +++---
>>>  xen/scripts/xen_analysis/cppcheck_analysis.py | 4 ++--
>>>  3 files changed, 7 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/tools/pygrub/src/GrubConf.py b/tools/pygrub/src/GrubConf.py
>>> index 580c9628ca..904e7d5567 100644
>>> --- a/tools/pygrub/src/GrubConf.py
>>> +++ b/tools/pygrub/src/GrubConf.py
>>> @@ -320,7 +320,7 @@ class GrubConfigFile(_GrubConfigFile):
>>>  def grub2_handle_set(arg):
>>>      (com,arg) = grub_split(arg,2)
>>>      com="set:" + com
>>> -    m = re.match("([\"\'])(.*)\\1", arg)
>>> +    m = re.match(r"([\"\'])(.*)\1", arg)
>> ... the \' works here.
>>
>> Anyway, I've checked the others and they seem to work, so I suggest
>> taking this roughly this form.
>>
>> Some notes about the commit message.  The subject ought to be:
>>
>> tools: Fix syntax warnings with Python 3.12
>>
>> The text should be a regular paragraph, rather than bullet points like this.
>>
>> I can fix this all on commit if you're happy.
> Thanks for the feedback, Andrew; I'm happy with your changes.

And committed.

https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=826a9eb072d449cb777d71f52923e6f5f20cefbe

Thankyou for your patch.

~Andrew

