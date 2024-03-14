Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE27787B82A
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 07:59:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692879.1080482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkf46-0008PX-OM; Thu, 14 Mar 2024 06:59:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692879.1080482; Thu, 14 Mar 2024 06:59:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkf46-0008Nf-Kd; Thu, 14 Mar 2024 06:59:46 +0000
Received: by outflank-mailman (input) for mailman id 692879;
 Thu, 14 Mar 2024 06:59:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rkf45-0008NT-IW
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 06:59:45 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70238bc3-e1d0-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 07:59:44 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a466f6318e9so43556166b.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 23:59:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 rf22-20020a1709076a1600b00a450b817705sm390590ejc.154.2024.03.13.23.59.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 23:59:43 -0700 (PDT)
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
X-Inumbo-ID: 70238bc3-e1d0-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710399584; x=1711004384; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VV5YwNgoCT/B7J5r+Pq5V4OoUWpPdECRCv+fqrqNjto=;
        b=EGZkwMAbI200dG1sHuEeuOH2FqrK6S31jorJ9Kd9bYZyZOoTBLbKYtvk6s7SX6e4r9
         B8PT1WL+90Ajbuhn7v1rGPCuYFFTM19hSXJtTy77kBUU+yNu9NreHq05SQhSsK8btk6W
         MxLArVRvM5UT3fOGgstKMW9AAm6vUe7cfPVc0PqtKMqLspDVw1r7P+/xopRWYi8jR/ov
         gIAT5p6EhFCWD7u+KebomJLEVgrxH8/i5Fjwn3e0ndEGapDD1RIKVFuwSJRhJkPAZiDk
         ZXPBVuFrC23PYmNSRN/cybeILLggntY0XvMNBtYhj7DtccEDGHqjZnclx5xBNZlNJCFc
         WHdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710399584; x=1711004384;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VV5YwNgoCT/B7J5r+Pq5V4OoUWpPdECRCv+fqrqNjto=;
        b=CX9f8jPUoAAPKp+/oFvg4cqRxhL39SOgyPnw/rCSb3nO/qHS96kSxGFi+Z/mzPkLX0
         A2IMbAJ8y/W/dfk5ZvDoZwBAG+UlTYL+0c7psLdlpFponKkGdFPr1EPFh7kC2Z9nO9dk
         XtN8VQoKaopyQhITWg4biUSw17x22r4Nllg9tzCBcJKlEzAydZudo1z5ASF949Pl3VEP
         KA17o7RKXQ131lhprpd0SSxtNCxIhQFM4DO2xZblWIYpBb8Q3hmhWH2RwhzL5HXd+/13
         brJ3zavGyT5xNmrH304vixMI38w4CaKCekCB8ZnTpCQKAy/DQCsTFCReFHb0u0XeUINa
         f1Tg==
X-Gm-Message-State: AOJu0YwoV2yvJoW9MPxSEroqqqW1IZMJDh3UQgF6p5X0ZxvuMSI0OF42
	96rKy4aWqiiiboJYtipedJsIQCyUHjyi3m7TslnJl5rSoqzdIoTMWex0mUesmg==
X-Google-Smtp-Source: AGHT+IFQYCByxxlLskiIeN9Te63LVh6xABQ83MgYO96JNYY5akMaw0NUd8KfDL+uA2/NCw/5M1YJlw==
X-Received: by 2002:a17:906:24d6:b0:a46:58ac:8b55 with SMTP id f22-20020a17090624d600b00a4658ac8b55mr544904ejb.15.1710399584175;
        Wed, 13 Mar 2024 23:59:44 -0700 (PDT)
Message-ID: <40fd93be-f626-43d5-b239-6976665efe30@suse.com>
Date: Thu, 14 Mar 2024 07:59:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] x86/PoD: tie together P2M update and increment of
 entry count
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <ac46f25b-e669-f309-b36e-c4760e10479e@suse.com>
 <3daef84c-47dd-4a6b-9984-402e997598dc@suse.com>
 <CA+zSX=aQv3cx6BR9soqaN8LD_esUqkxnVQRA6p5RzzsAiLcHbQ@mail.gmail.com>
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
In-Reply-To: <CA+zSX=aQv3cx6BR9soqaN8LD_esUqkxnVQRA6p5RzzsAiLcHbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.03.2024 17:31, George Dunlap wrote:
> On Wed, Mar 13, 2024 at 2:00 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> When not holding the PoD lock across the entire region covering P2M
>> update and stats update, the entry count - if to be incorrect at all -
>> should indicate too large a value in preference to a too small one, to
>> avoid functions bailing early when they find the count is zero. However,
>> instead of moving the increment ahead (and adjust back upon failure),
>> extend the PoD-locked region.
>>
>> Fixes: 99af3cd40b6e ("x86/mm: Rework locking in the PoD layer")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Would you mind commenting on why you went with multiple unlocks,
> rather than multiple if statements?

Simply because what I did I view as more logical a code structure
than ...

> e.g.,
> 
> ```
> rc = p2m_set_entry(...);
> 
> /* Do the pod entry adjustment while holding the lock on success */
> if ( rc == 0 ) {
>  /* adjust pod entries */
> }
> 
> pod_unlock(p2m);
> 
> /* Do the rest of the clean-up and error handling */
> if (rc == 0 ) {

... this, ...

> Just right now the multiple unlocks makes me worry that we may forget
> one at some point.

... despite this possible concern. But well, if going the other route
is what it takes to finally get this in, so be it.

Jan

