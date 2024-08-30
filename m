Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8942396696D
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 21:18:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786589.1196176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk77y-0000CM-Lf; Fri, 30 Aug 2024 19:17:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786589.1196176; Fri, 30 Aug 2024 19:17:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk77y-0000AW-J2; Fri, 30 Aug 2024 19:17:46 +0000
Received: by outflank-mailman (input) for mailman id 786589;
 Fri, 30 Aug 2024 19:17:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YGfl=P5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sk77x-0000AO-Ca
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 19:17:45 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8883e518-6704-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 21:17:44 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a86883231b4so248016266b.3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Aug 2024 12:17:44 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891d86cesm248608466b.171.2024.08.30.12.17.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Aug 2024 12:17:42 -0700 (PDT)
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
X-Inumbo-ID: 8883e518-6704-11ef-a0b1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725045463; x=1725650263; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eO8ZjtEt7FVT4/B3qnuF54I6LroN/wGF9mWRE2zybd0=;
        b=biSE8wco4Jh/wASWsPPY/57IJXVSCVNW2iaHS3y17xtfhSfNYcKag41M8sV0X7lXWW
         +RLnUB2B7MD+4XF3n0Ri+L55LT9vU/2bwl/Zs501a0a8RwkS7C5MsFlckDyRZjqs2hyr
         7R8YdBXxpk2Su5G5deTfCqJS7kDuOTJAji1fk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725045463; x=1725650263;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eO8ZjtEt7FVT4/B3qnuF54I6LroN/wGF9mWRE2zybd0=;
        b=rlnApMfALhvL0PaEUc/UvEKMng0Cp+Q+arpNEqR+6yO0Pxq2I4GCUaWRcavdkHBOZl
         bXtw2JdyPARZos3LDL1cPklwKeqG8IIlR+HT7xP9ZHqNgQsrUa5cT4CnDsBfUBAfwtLS
         nDfuKfUzXzq54e0WfVMlmYX8psAgFd0lxJrmRpLjZM4LFWU556Qx3H7b6j/vM0kyGvuD
         x6VfJyGALvE/W92+qOt1zBN/O6AdpZLnuuBbLvRhjVidEBgrtsKk/WkbCtEAwvGw33pr
         hv7dyfaftUsxOvJibWYrwbSEK3i2kC1ht9pUkacLLYsWubILqqMz9mWFQHSLNDeFfCWj
         RD2w==
X-Forwarded-Encrypted: i=1; AJvYcCVOF6XOnJIVDZUn4WXmuFz+nv1w25lYopbZrznPt0ReFcEXTU4myh9kElkG6yJ0nGfJvUplF2whMok=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyoyhA/SdwOPw5nPSQ8Ollz8LL1Tl7CNmuRnXQDOItzmHcE7Vnt
	KkrKqp5Xug58AMZCY84io/DvhTjRzuGhvlQ/yzuhpmE5v0/u9UQF8dOYC2Std/M=
X-Google-Smtp-Source: AGHT+IFk9hgH0RW+arGfWxloBxZws9ePC3bBZvtzDLMNlBWOygCd51NPEgan3/NreQPGSAwzaMfTeA==
X-Received: by 2002:a17:907:1c27:b0:a86:8197:8df9 with SMTP id a640c23a62f3a-a897fad5066mr622007666b.66.1725045463013;
        Fri, 30 Aug 2024 12:17:43 -0700 (PDT)
Message-ID: <9ac39818-2259-4aa2-8bc6-17809fe62368@citrix.com>
Date: Fri, 30 Aug 2024 20:17:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v5 7/8] x86/mm: add defensive return
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org, consulting@bugseng.com
References: <cover.1722239813.git.federico.serafini@bugseng.com>
 <24501d2e7f5d82d8e5a483a80b35e04ce765a7cf.1722239813.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2407291512280.4857@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2408281735020.53815@ubuntu-linux-20-04-desktop>
 <da5d2ccc-6a21-4bcc-8ceb-75b930dcdabe@suse.com>
 <ZtGOWAnqGu-XNCgy@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZtGOWAnqGu-XNCgy@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/08/2024 10:18 am, Roger Pau Monné wrote:
> On Thu, Aug 29, 2024 at 09:04:37AM +0200, Jan Beulich wrote:
>> On 29.08.2024 02:35, Stefano Stabellini wrote:
>>> On Mon, 29 Jul 2024, Stefano Stabellini wrote:
>>>> On Mon, 29 Jul 2024, Federico Serafini wrote:
>>>>> Add defensive return statement at the end of an unreachable
>>>>> default case. Other than improve safety, this meets the requirements
>>>>> to deviate a violation of MISRA C Rule 16.3: "An unconditional `break'
>>>>> statement shall terminate every switch-clause".
>>>>>
>>>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>>>
>>>>> ---
>>>>> No changes from v3 and v4, further feedback on this thread would be appreciated:
>>>>> https://lists.xenproject.org/archives/html/xen-devel/2024-07/msg00474.html
>>> Looking at the older threads, I looks like Jan suggested EACCES, I also
>>> think it is marginally better. My R-b stands also for EACCES. Jan, I
>>> think you should go ahead and fix on commit
>> No, I very definitely want a 2nd x86 maintainer opinion here. Or a better
>> suggestion for the error code to use by anyone. After all, as you confirm,
>> EACCES is only marginally better.
> Hm, the only alternative I could suggest is using ERANGE, to signal
> the value of opt_mmio_relax is out of the expected range, however that
> could be confusing for the callers?
>
> One benefit of using ERANGE is that there's currently no return path
> in get_page_from_l1e() with that error code, so it would be very easy
> to spot when an unexpected value of opt_mmio_relax is found.  However
> there are no guarantees that further error paths might use that error
> code.

EPERM and EACCES are both very wrong here.  They imply something that is
simply not appropriate in this context.

We use EILSEQ elsewhere for believed-impossible conditions where we need
an errno of some kind.  I suggest we use it here too.

~Andrew

