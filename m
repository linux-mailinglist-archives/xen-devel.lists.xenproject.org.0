Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B008A942A
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 09:36:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708008.1106518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxMJa-0003eo-TD; Thu, 18 Apr 2024 07:36:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708008.1106518; Thu, 18 Apr 2024 07:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxMJa-0003c7-Pv; Thu, 18 Apr 2024 07:36:14 +0000
Received: by outflank-mailman (input) for mailman id 708008;
 Thu, 18 Apr 2024 07:36:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxMJZ-0003ai-Lk
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 07:36:13 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 539fed86-fd56-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 09:36:10 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-418c2bf2f90so2933625e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 00:36:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 jg23-20020a05600ca01700b004189cf6bd6esm5346396wmb.22.2024.04.18.00.36.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 00:36:10 -0700 (PDT)
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
X-Inumbo-ID: 539fed86-fd56-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713425771; x=1714030571; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jUrxXZbvUIPruDasrXksl6xnNFXLc4odWwRuKQp+7SQ=;
        b=CaIc/aPKaVzzy3r1ChLVuPcTEDeQV+RbgCeYPULR5O8GpR8ZoIuQI6ADH6g8OHwozq
         gDGyG/LfMaLR1YWwLOIS7kYq50AotiVo8Vm4hCuMX8j9c+F9YY+VNLhakwgn5dGLNn51
         PUFm33WAoAsbEGk3+ZdsMFdKLvxiEWDLuVa84mAa2fFgP6GS3WNr0dkt6u1tqHZkJyNk
         OXGr52SLrZBD1bEpo/0k5PZMqwUh5txrcx9HrUKRHe2CRMgsmgoKlWfLYKXYmYmx2MS4
         6p1EfGRWjUm6Dy+NXb3qsmoYJpsZWo66cqxO+9LqyDE9ZvJdPwIsMB1mFiaDs7dTr4j2
         t0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713425771; x=1714030571;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jUrxXZbvUIPruDasrXksl6xnNFXLc4odWwRuKQp+7SQ=;
        b=MWXg/Usp4oULbjNmppdhyVS3t5o44IDFP14xuIcYfhEGmud1BErhJNge85C0QklbjG
         uf0lXaG+OqFB34BFFtxJXwakznUu09FFdky0+6au3guo8l0dKV4fxSXRj7KoL8j7iCaZ
         1ydDcdvWDkr1DyOCdHBpRrP0LIxnC1d4Zl7CaKHvZ1EJG/4tI68p3/pTBjVg0ru8gonB
         +B/I9Hw2Y/baReIu2sXby5sZSWkdNKPmRciUOiJ1l7HGjfChQEwezFTQcbn0ILaF3ZXs
         CZ+8Yho5fqCvVV2Uy3snAvvNkVRludrl19W7DIZHRuVwoZ9bfeZd6VZEbGDTvPVUfu2k
         22gA==
X-Forwarded-Encrypted: i=1; AJvYcCXhkWOgsrhm/R72igXhexzQw6y08fE+Svl3LxQ7Evr1EM9DcZh+LmpRLx6znrWC8bWWWHvKYRjJow5OPd0ruU71OiX/kwjwGBZUkIFYzTo=
X-Gm-Message-State: AOJu0Yy/zU2oVY3xZG2Rvt9JR87+PglkMOxUin4l5AhCnK7EH0Asnkla
	eCya4KzWvFkeVfJ61hJYAiTDoRZrVAPMjUr2QAwLz4CGSW9MpQ88vfIkiA139Q==
X-Google-Smtp-Source: AGHT+IEYE/J0ukMUdzOJHaZ0IzVbDGsqQGfS7cpoBRJr3k8WeOzilEiMAsnHY0BnW3xkQrQSgqPu5g==
X-Received: by 2002:a05:600c:3b86:b0:418:9d4a:1ba5 with SMTP id n6-20020a05600c3b8600b004189d4a1ba5mr1040330wms.6.1713425770873;
        Thu, 18 Apr 2024 00:36:10 -0700 (PDT)
Message-ID: <efb44106-832b-409a-a810-7821e830ac81@suse.com>
Date: Thu, 18 Apr 2024 09:36:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] gzip: refactor state tracking
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20240411152518.2995-1-dpsmith@apertussolutions.com>
 <20240411152518.2995-4-dpsmith@apertussolutions.com>
 <360958a2-5b0d-4fbc-8637-2a33185bdd8d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <360958a2-5b0d-4fbc-8637-2a33185bdd8d@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.04.2024 21:24, Andrew Cooper wrote:
> On 11/04/2024 4:25 pm, Daniel P. Smith wrote:
>> diff --git a/xen/common/gzip/gunzip.c b/xen/common/gzip/gunzip.c
>> index 1bcb007395ba..9b4891731b8b 100644
>> --- a/xen/common/gzip/gunzip.c
>> +++ b/xen/common/gzip/gunzip.c
>> @@ -102,12 +109,13 @@ __init int gzip_check(char *image, unsigned long image_len)
>>  
>>  __init int perform_gunzip(char *output, char *image, unsigned long image_len)
>>  {
>> +    struct gzip_data gd;
>>      int rc;
> 
> By the end of this series,
> 
> Reading symbols from xen-syms...
> (gdb) p sizeof(struct gzip_data)
> $1 = 2120
> 
> x86 has an 8k stack and this takes 1/4 of it.  Other bits of state are
> dynamically allocated, even in inflate.c, so I'd highly recommend doing
> the same for this.
> 
> 
> Also, could I nitpick the name and request:
> 
> struct gzip_state *s;

Except: Why "gzip" when it's un-zipping state?

Jan

