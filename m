Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C6FB0A3E1
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 14:12:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048626.1418827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucjwx-0004yd-FG; Fri, 18 Jul 2025 12:12:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048626.1418827; Fri, 18 Jul 2025 12:12:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucjwx-0004wj-C4; Fri, 18 Jul 2025 12:12:27 +0000
Received: by outflank-mailman (input) for mailman id 1048626;
 Fri, 18 Jul 2025 12:12:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00bL=Z7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ucjwv-0004wX-VM
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 12:12:26 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 764a2a00-63d0-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 14:12:23 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a4ef2c2ef3so1431580f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 05:12:23 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4563b5c8b3bsm18231185e9.15.2025.07.18.05.12.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 05:12:22 -0700 (PDT)
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
X-Inumbo-ID: 764a2a00-63d0-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752840743; x=1753445543; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hynVrxH1GAb5tQZ7MkRn7EWMBT9anrvno+zlDJ3s+4o=;
        b=l/nc5lFhrDYzPXUgxHUZv+kFSKR53AdeyTo/ouLXtY1NBx75tegDvEvyUKOluCBZZ8
         cHOXWhSEJIq3Llt6HWhhAqpNjeNULP64+t+JYyhxUAhn3q5rxBGJOOZObTOcwAW0V7KM
         D36/CXqjxOZDQ6e1LioCki0Smj90ov+GMaF1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752840743; x=1753445543;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hynVrxH1GAb5tQZ7MkRn7EWMBT9anrvno+zlDJ3s+4o=;
        b=sRd/Ci/vFqNAESgF35sytzXbUoWZE/9R+jWOuZ1Vd+D1XSfw1ZxsWGWfEx8aSQ8W57
         5ajFX2doOHQnvloZF52fbEb+8T9jTyv0gJo2lWLAJ+fmKFbkr+MOmPvFd4Wi+RxvQfCQ
         9f8X+2XUhsTsulZjmI6zZarY6mWAdqgYvjaWDLj1ZQcIYQr2V69yumrJuLxxEbm739iY
         gEB595LlXocFsdQ44rUd/9itqlgH/ELMrso7fXw2WRa2Kp0JKUnnzA7xAvIA7Pzw9grh
         AqP2uka0e/XY/swmxYtVDEY5zPLeCKbGq8nbQQCmyjghYDKY5uusEFgwQvREUy94591w
         61kA==
X-Gm-Message-State: AOJu0YwzzeuF2F2QkJFdAgIhLjwPC12woL4+9HvLvzqCg5ith7Nh2Pyd
	SZdkHfCJoOsurZToIvD9jbwLuheVTdxB8kduS02w1uF2esftqqHNFy940jSiyBKS3eM=
X-Gm-Gg: ASbGncux+uyLJUIX5fkSqZKzWX8J0xNRdi5nWJYB9YnfM+7Fqj0CAiPPzMDgo2pIkYC
	isdxIY7bw2J2dEmt/4XLqRclbiJJwp+pKQ1q9faTVnGqKn8qz69k2RloKuBAziw7euIkkPyFyYx
	tvPbUnZmmdaiQ4jXDWyY8SICu0f40fNrRYA5ZykIGOjXHK1E90SNeoh7HMBZyMT8uk9mbXL1iiw
	nUwCFPw2hrDv2O4bhb+p9scBUYWACgjPEkD2k6y5EmquZMNoTJfh6Gd2zK8UbKd/0xrs5Toui1O
	3j/6ku/FoLns//0QSBzsKxFYrZ9OmL5JwTZud0fp5WP8ngI8KgbMzeZWdnQ4RwitwB9t8FAaNXg
	MjhMihYqNg+ndEbgO5UfZl3c9R2GAQxHCVPVfO+bPuowaWXpWRWgAKT/V+OxIZt5X08X8
X-Google-Smtp-Source: AGHT+IGdOUo8J43OxOSMpgETRCqL3Y0Qen4XmwflOIev5GHqAK5LJJ3/XQ7tX+SlsKhiVGLlg62LAA==
X-Received: by 2002:a05:6000:26ce:b0:3a4:fb7e:5fa6 with SMTP id ffacd0b85a97d-3b60e4b82a7mr9245025f8f.1.1752840743188;
        Fri, 18 Jul 2025 05:12:23 -0700 (PDT)
Message-ID: <83ddb75f-945b-4e22-8d4f-88e22de97820@citrix.com>
Date: Fri, 18 Jul 2025 13:12:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/efi: Reuse PrintMessage function
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250718094139.19351-1-frediano.ziglio@cloud.com>
 <a0e250fe-8b88-4c54-8554-1e488bd58c28@citrix.com>
 <CACHz=ZhUCWK2jjyfw2PLUV5D0-o3HQEGEBWgDa_b3fL5K8jmwA@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CACHz=ZhUCWK2jjyfw2PLUV5D0-o3HQEGEBWgDa_b3fL5K8jmwA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/07/2025 1:00 pm, Frediano Ziglio wrote:
> On Fri, Jul 18, 2025 at 12:12 PM Andrew Cooper
> <andrew.cooper3@citrix.com> wrote:
>> On 18/07/2025 10:41 am, Frediano Ziglio wrote:
>>> PrintMessage function print a message string followed by a
>>> new line.
>>> Move the function from ARM specific code to common code.
>>> Reuse it in EFI code.
>>> No functional changes.
>>>
>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>> Please no.
>>
>> Hiding \n (or \r\n) in strings is an antipattern and a source of
>> confusion that we do not want in Xen.
>>
> I didn't realize it was not a Xen pattern.

We went through a phase where it was inconsistent and we kept on having
problems on the console.  Missing a newline causes the next message to
be appended with <0> and it's very confusion to read.

>  I found the thing not that
> coherent between x86 and arm and attempted to fix it.

Sure, and making things consistent is very welcome.

>
>> Instead, delete PrintMessage() and convert ARM to use PrintStr().  That
>> looks like it was premature anti-optimisation.  You save 4 bytes per
>> string, but it costs 12 byte minimum in .text to set up the function
>> call, let alone the function call itself.
>>
> To be honest I didn't consider this aspect and I don't feel it matters much.
> Looking at other languages printing an implicit newline is pretty
> common, Pascal has "Wtite" and "WtiteLn", Ocaml has "print_string" and
> "print_endline",

Right, and in both cases these are clear from context (i.e. the function
name) that there's a newline.

PrintStr() and PrintMessage() do not have the same kind of clarity.

>  Python has an "end" parameter which by default is the
> newline, Basic (if I remember) has the possibility of an implicit
> empty field. In C is not so common although there's "puts" and some
> functions (like "syslog") have some kind of implicit newline.
> But obviously Xen is not any of them.
>
> As I said above however my main reason is coherency so I'll post your
> suggestion.

Thankyou.  I'm sure ARM will be better off as a result.

~Andrew

