Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2DF19472E
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 20:10:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHXpM-00015U-RH; Thu, 26 Mar 2020 19:06:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dmc7=5L=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jHXpL-00015P-IS
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 19:06:03 +0000
X-Inumbo-ID: d5c2c980-6f94-11ea-884c-12813bfff9fa
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d5c2c980-6f94-11ea-884c-12813bfff9fa;
 Thu, 26 Mar 2020 19:06:02 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id a20so8246182edj.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2020 12:06:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E/TY+R1pjmBWqliizZn0mgNugrYQPf1LenS0fO7eMYw=;
 b=YYAKNr+3B+4c517vSlPWSiC40D3v0hY1H6xXk/Hw1FpypfJ7eefgbngCJfFUFuCNPP
 2Y5zSg9r2yS8Vdc1K7f0eHYhDxsq2xZvCUVSSyrIO0+g7+0eZTpIZhxV3FgE+kmtdPAc
 Gd0xoQSA4b12IVhX68NAX2CKvJ1lUz2pwnGaNVlE22NoFTLNdUVlhFnYKmTMnoWXiPnI
 bo7geYLMXFcfc2CF86HvURyqg9Yjj81W4+6lCwnDYraCgQCAMr7M2mwpor8KnIKFsEXV
 w53pdk4TVkva6+2ph+sE5U5blYYpnbF53hTEwsjYYUoLAi8O3xAgvpYll7Lt6pi/nzk0
 BMlw==
X-Gm-Message-State: ANhLgQ2wCi+PLZFRHxXYCMzkwK5NRa8cphdtqlMfmE+IfUOwi264Fjt0
 BHJ9cHulthC0mGSS2RwV2RQ=
X-Google-Smtp-Source: ADFU+vuUiKMeGi5+Wu3a8Wf/KiMWwplW0f7VvvWF7En/8XhtezGHJSiKe5497dGTO0OPZZthE2/o3A==
X-Received: by 2002:a17:906:5591:: with SMTP id
 y17mr9391221ejp.155.1585249561600; 
 Thu, 26 Mar 2020 12:06:01 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-227.amazon.com.
 [54.240.197.227])
 by smtp.gmail.com with ESMTPSA id u2sm470820edj.21.2020.03.26.12.06.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2020 12:06:01 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien.grall.oss@gmail.com>
References: <20200320212453.21685-1-andrew.cooper3@citrix.com>
 <20200320212453.21685-5-andrew.cooper3@citrix.com>
 <CAJ=z9a2OX=YKNz8KapaQdSbBRcGw-gS3H=fKXaNgaah0h+r3ZQ@mail.gmail.com>
 <842e22cd-fcde-86bf-d671-c14133488e33@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6d8fa5b2-3dcb-4673-50d5-10ffe1beeb02@xen.org>
Date: Thu, 26 Mar 2020 19:05:59 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <842e22cd-fcde-86bf-d671-c14133488e33@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Subject: Re: [Xen-devel] [PATCH 4/4] xen: Introduce a xmemdup_bytes() helper
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Andrew,

On 26/03/2020 14:53, Andrew Cooper wrote:
> On 21/03/2020 22:19, Julien Grall wrote:
>>> diff --git a/xen/include/xen/xmalloc.h b/xen/include/xen/xmalloc.h
>>> index f515ceee2a..16979a117c 100644
>>> --- a/xen/include/xen/xmalloc.h
>>> +++ b/xen/include/xen/xmalloc.h
>>> @@ -51,6 +51,17 @@
>>>   #define xmalloc_bytes(_bytes) _xmalloc(_bytes, SMP_CACHE_BYTES)
>>>   #define xzalloc_bytes(_bytes) _xzalloc(_bytes, SMP_CACHE_BYTES)
>>>
>>> +/* Allocate untyped storage and copying an existing instance. */
>>> +#define xmemdup_bytes(_src, _nr)                \
>>> +    ({                                          \
>>> +        unsigned long nr_ = (_nr);              \
>>> +        void *dst_ = xmalloc_bytes(nr_);        \
>> The nr_ vs _nr is really confusing to read. Could you re-implement the
>> function as a static inline?
> 
> I'd really prefer to, but sadly not.
> 
> That requires untangling headers sufficiently so we can include
> string.h, to be able to use memcpy.  I don't have time at the moment to
> sort that out.

Ok :(. We will have to live with the macro for the time being then.

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

