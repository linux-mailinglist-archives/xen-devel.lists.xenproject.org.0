Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F152D8CC264
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 15:47:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727681.1132289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9mJD-0003CV-Jr; Wed, 22 May 2024 13:47:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727681.1132289; Wed, 22 May 2024 13:47:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9mJD-00038k-G5; Wed, 22 May 2024 13:47:11 +0000
Received: by outflank-mailman (input) for mailman id 727681;
 Wed, 22 May 2024 13:47:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vsR+=MZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s9mJB-00036q-Mr
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 13:47:09 +0000
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [2607:f8b0:4864:20::e2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c82451df-1841-11ef-90a0-e314d9c70b13;
 Wed, 22 May 2024 15:47:08 +0200 (CEST)
Received: by mail-vs1-xe2b.google.com with SMTP id
 ada2fe7eead31-47ef7e85cf0so1554675137.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 06:47:08 -0700 (PDT)
Received: from [10.80.67.140] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43e2c8d3d45sm106303711cf.47.2024.05.22.06.47.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 06:47:07 -0700 (PDT)
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
X-Inumbo-ID: c82451df-1841-11ef-90a0-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716385627; x=1716990427; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mrpfkd+3vqtkVZQuW0YaayVQGhiM1Dn/yVCYsI8ziV8=;
        b=l3cxJzwSnsWpniJEpWvBNI6T7HjeWHQhS5p0c4srlIG+5g9DAZvGJbsltxNp93lRmG
         SGj/3fJ/dhKw20UGbn/UjHAHsPn9BgLg5w9OZ+DB4UOi8nicvuMV3qxuCvRn5gXeaLnK
         1SBknSLRRqWR6FXcPsjbLPAu0EjZjAxEb2XY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716385627; x=1716990427;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrpfkd+3vqtkVZQuW0YaayVQGhiM1Dn/yVCYsI8ziV8=;
        b=Pu6QL9neWASN7eT8/4JgLzYpnqe0q/lfn0CuFyVKQFUNFinqmGmbGIzNeXfIM8uwtm
         6bFLC4mNax9fguudUbLMwBYhRyDA/NMy/7Xh5ScMMV/DAgp/m/5JuLppFekVU+BdEOPw
         k5JJvvrZoovrSss5fa0+pxmVXSs0bo5Y3ijh3YL+f7Xe3X7BXh1tF/RrtizTm9H+jmhE
         XTWBl51OQQ2G6zZWBBEjkIhDgogeNrrimk9l8U/XaDrx0phVGU5QJjHaCl7bdQuOPsH/
         D+at3eGZwltisV5Qhc6xvNwk/K1D/gvl7eqdlujQzuKV88nbcGa0RjRlWCINlR8dILPl
         jeBg==
X-Forwarded-Encrypted: i=1; AJvYcCXjfkjFgYbWhJEUQwIkwelY+4Qv2QtNNagjY6kMj11gqNhUgvVeh9svuzWG2CFVNRfI2TaWMUY38LH5TsxyNF53TTh9KMp1Jt+0wlcaLCs=
X-Gm-Message-State: AOJu0Ywe/0LOMngcaZuiwsf9UEdK+Q3gmg1P32KKXQWH9FjrF03+akIx
	6Vk+y57okMT7HqcfkX+RaxjNJlfoASuOHgEWc5lnsNfjnzzU+JdJerngKaZDGTA=
X-Google-Smtp-Source: AGHT+IHVjDiuiZbV8LCzVyuB36HFHCptEEBcHvRt7SvxdwwEu1oDKgNoKsmlzv2BMFEvv5u9NTbTKg==
X-Received: by 2002:a05:6102:3f0f:b0:47e:f1f1:d052 with SMTP id ada2fe7eead31-4890a2c6ab7mr2119170137.33.1716385627688;
        Wed, 22 May 2024 06:47:07 -0700 (PDT)
Message-ID: <b3b4f2d0-fb42-44be-bb24-a22c8c237f13@citrix.com>
Date: Wed, 22 May 2024 14:47:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] x86/shadow: Rework trace_shadow_gen() into
 sh_trace_va()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240522131703.30839-1-andrew.cooper3@citrix.com>
 <20240522131703.30839-2-andrew.cooper3@citrix.com>
 <1140d40f-2f5c-402d-a0fc-1c6598a7a424@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1140d40f-2f5c-402d-a0fc-1c6598a7a424@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/05/2024 2:40 pm, Jan Beulich wrote:
> On 22.05.2024 15:17, Andrew Cooper wrote:
>> --- a/xen/arch/x86/mm/shadow/multi.c
>> +++ b/xen/arch/x86/mm/shadow/multi.c
>> @@ -1974,13 +1974,17 @@ typedef u32 guest_va_t;
>>  typedef u32 guest_pa_t;
>>  #endif
>>  
>> -static inline void trace_shadow_gen(u32 event, guest_va_t va)
>> +/* Shadow trace event with GUEST_PAGING_LEVELS folded into the event field. */
>> +static void sh_trace(uint32_t event, unsigned int extra, const void *extra_data)
>> +{
>> +    trace(event | ((GUEST_PAGING_LEVELS - 2) << 8), extra, extra_data);
>> +}
>> +
>> +/* Shadow trace event with the guest's linear address. */
>> +static void sh_trace_va(uint32_t event, guest_va_t va)
>>  {
>>      if ( tb_init_done )
>> -    {
>> -        event |= (GUEST_PAGING_LEVELS-2)<<8;
>> -        trace(event, sizeof(va), &va);
>> -    }
>> +        sh_trace(event, sizeof(va), &va);
>>  }
> If any tb_init_done check, then perhaps rather in sh_trace()? With that
> (and provided you agree)
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Sadly not.  That leads to double reads of tb_init_done when tracing is
compiled in.

When GCC can't fully inline the structure initialisation, it can't prove
that a function call modified tb_init_done.  This is why I arranged all
the trace cleanup in this way.

~Andrew

