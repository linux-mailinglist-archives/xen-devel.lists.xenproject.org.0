Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F1887ECF6
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:06:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694866.1084057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFVN-0005IT-Tk; Mon, 18 Mar 2024 16:06:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694866.1084057; Mon, 18 Mar 2024 16:06:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFVN-0005GQ-Q7; Mon, 18 Mar 2024 16:06:29 +0000
Received: by outflank-mailman (input) for mailman id 694866;
 Mon, 18 Mar 2024 16:06:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rE6T=KY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rmFVL-0005G4-V2
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:06:27 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78f5d917-e541-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 17:06:26 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-563cb3ba9daso5151471a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:06:26 -0700 (PDT)
Received: from ?IPV6:2003:e5:873a:400:704b:6dbb:e7c0:786e?
 (p200300e5873a0400704b6dbbe7c0786e.dip0.t-ipconnect.de.
 [2003:e5:873a:400:704b:6dbb:e7c0:786e])
 by smtp.gmail.com with ESMTPSA id
 i22-20020a17090671d600b00a46d58fbc11sm81704ejk.118.2024.03.18.09.06.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 09:06:25 -0700 (PDT)
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
X-Inumbo-ID: 78f5d917-e541-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710777985; x=1711382785; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vX+fmbm5pzkcwBY5MBPxIvLynu/sq1ati2pR4LHakyE=;
        b=W4nLdxbUyOzq1DEVYAdsH3Dn5dnaqQbZXmKlFKaBiPffQzM7/Q0ygZRITaKuNDsNbz
         2rjq+vkyT+08Vo+MQzo2bnX219tTCh/d6vf+IlR+QuxsAeXRsOCE9XbYdWQMC4Owyt5Z
         h0/WEGTLORxlNm66Vy51M62iZG9hXFAOjEBxSNPWr4+dKtlmBwIKQUxxJynpKPTSX9aF
         RMjrKouw74VcRcOJhHlYdk4J+QGafvsviQHAA9ikFgA+KMYQ+g2bgjT3xZ+vIbps6yl1
         653Bc3Rv7UAyUQgYv+je+CNNFx8i/vovOw2mjNiN7pG+czVG2hJv03maIqN/YV+kOzeY
         YkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710777985; x=1711382785;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vX+fmbm5pzkcwBY5MBPxIvLynu/sq1ati2pR4LHakyE=;
        b=xRYzVzDFCkZIESWTadwC5ZNH2d17I5hbAXSQ68F/S3Ix0kxNsTtcKlF32xaP5MLPXG
         XUzhRCp3jmOmasslzPWodpAtYMJZc0mKGPD8JW7ziU/CWeFjBHGZyCpYIS4inFo55BYn
         4L+wK5uUNumRzhBmgy68r66/bFBi7loLlY+kGcj6uRB9sXANEaI+rkwk/YiVVpsLIusp
         UNc6DAR/sTTFij8/hXQRCsfMSe1HmxS6byhUgvZu9/0R+H6ML1Rv+bwQqfrnP+MsGa3d
         +nb4cXl5uHeggkAjIiVExSTQpZGNCdTETXV5mVj90DJHpMXlZGb/Lw1DpEimUWHUGiZl
         On8w==
X-Forwarded-Encrypted: i=1; AJvYcCXOevheuHAHHp7D7ayRoYDXvUenelvDV77ujqfyIWgdREoOmsSpHlwmno9xG8S3p4h2if2ZXztoGoDU+SfcsDEKIrWni3wPp7PIjvgcQj4=
X-Gm-Message-State: AOJu0Yzszu8xiZgY6ZLgzzVgloHg4Wl+jQ6fRqyXWdFIYQwnWx4z5VZC
	mN/P+viXI/NNgAKNXg7PiQ9oaat6FFmgDOGlRcNMOX+1RrNzpXHNKnex6R/q7CY=
X-Google-Smtp-Source: AGHT+IHnjDxsD0/Dq7Q+4UmbFpzAEeH7UbDldRmC5GnjI7sGR308bRx6HKAiFsh0iOleu8cLn86JPg==
X-Received: by 2002:a17:906:3199:b0:a43:fd9e:2d44 with SMTP id 25-20020a170906319900b00a43fd9e2d44mr8268491ejy.42.1710777985763;
        Mon, 18 Mar 2024 09:06:25 -0700 (PDT)
Message-ID: <cc1cccd0-3399-4313-88f4-85a09af56916@suse.com>
Date: Mon, 18 Mar 2024 17:06:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/13] xen/rwlock: raise the number of possible cpus
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240314072029.16937-1-jgross@suse.com>
 <20240314072029.16937-13-jgross@suse.com>
 <fc1b15e7-8ffc-4bc5-90dd-9f501a0e169d@suse.com>
 <4ee88d53-4b2f-4768-951c-7080680df337@suse.com>
 <f7dbd4e6-af89-4ede-86d7-55a696345f00@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <f7dbd4e6-af89-4ede-86d7-55a696345f00@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18.03.24 17:05, Jan Beulich wrote:
> On 18.03.2024 17:00, Jürgen Groß wrote:
>> On 18.03.24 16:39, Jan Beulich wrote:
>>> On 14.03.2024 08:20, Juergen Gross wrote:
>>>> @@ -36,14 +36,16 @@ void queue_write_lock_slowpath(rwlock_t *lock);
>>>>    
>>>>    static inline bool _is_write_locked_by_me(unsigned int cnts)
>>>>    {
>>>> -    BUILD_BUG_ON(_QW_CPUMASK < NR_CPUS);
>>>> +    BUILD_BUG_ON((_QW_CPUMASK + 1) < NR_CPUS);
>>>> +    BUILD_BUG_ON(NR_CPUS * _QR_BIAS > INT_MAX);
>>>>        return (cnts & _QW_WMASK) == _QW_LOCKED &&
>>>>               (cnts & _QW_CPUMASK) == smp_processor_id();
>>>>    }
>>>>    
>>>>    static inline bool _can_read_lock(unsigned int cnts)
>>>>    {
>>>> -    return !(cnts & _QW_WMASK) || _is_write_locked_by_me(cnts);
>>>> +    return cnts <= INT_MAX &&
>>>> +           (!(cnts & _QW_WMASK) || _is_write_locked_by_me(cnts));
>>>>    }
>>>
>>> I view this as problematic: Code knowing that a write lock is being held
>>> may invoke a function using read_trylock() and expect the lock to be
>>> available there.
>>
>> So you expect it to be fine that someone is using read_trylock() 32768 times
>> recursively while holding a lock as a writer? Sure, I can change the condition,
>> but OTOH ...
> 
> Hmm, yes, the reader count (leaving aside nested read_trylock()) is zero
> when the lock is held for writing. So yes, I agree the condition is fine,
> but may I ask for a brief comment to this effect, for blind people like
> me?

Yeah, fine with me. :-)


Juergen


