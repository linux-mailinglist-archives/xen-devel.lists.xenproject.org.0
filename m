Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EB99A3F8E
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 15:28:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821909.1235882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1n0u-00007O-Ud; Fri, 18 Oct 2024 13:27:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821909.1235882; Fri, 18 Oct 2024 13:27:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1n0u-0008WN-RV; Fri, 18 Oct 2024 13:27:32 +0000
Received: by outflank-mailman (input) for mailman id 821909;
 Fri, 18 Oct 2024 13:27:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dzfJ=RO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t1n0u-0008Vz-2s
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 13:27:32 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba0ae83a-8d54-11ef-a0be-8be0dac302b0;
 Fri, 18 Oct 2024 15:27:31 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4314fa33a35so20969935e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 18 Oct 2024 06:27:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316067dbedsm27467215e9.7.2024.10.18.06.27.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Oct 2024 06:27:30 -0700 (PDT)
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
X-Inumbo-ID: ba0ae83a-8d54-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729258050; x=1729862850; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uXX4Yaad9ZLGqVuCLSseYn7johVlB/9w4iskjmBAIA4=;
        b=hA/QDj0yMoGToCsiHVKnoSLSxAyD1hadErLGO0vmj2Px9nVJc0jcweUG1/cjd7eha8
         SpabwJIuWwP/aKxD66yccPlrUiNkOvJDF+zujz7BAI5WsYJtoYR40W0JbiaHe2wj2R55
         L77LEJ3vgPYvZ6VsUJHwL8VkHI18mucTUmT2baWlbyTPySEUKH+97WgeCm3oQzg2fj+q
         F8e5P6rMkM1Tn6I+6ICx9BkKqVNAscSFidpP7ah5AKLmQAQ6gOXPbB9uAaFK7A1+SBkS
         PcZTCoZN2n2JZZbbWvLgjcFfyAYMhtj0myfwG3bJF0hCr7Pgd2zXfhyswV/n5ag/cLMD
         FkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729258050; x=1729862850;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXX4Yaad9ZLGqVuCLSseYn7johVlB/9w4iskjmBAIA4=;
        b=dDz8z0cwMHyDJsweHSeb34hwBs3k4tbYu7aL/e6ksD25jU6A+PbiOK/OSorUWzWmnG
         jXKPM/SzqZbMP04YBNHS3II+lMjVoIg4cHboGcvpuJFjP3/Qz0r6G40gKdhs0L854mI8
         pHFCTHHyc9zE6RfeWPwWSvVuEsLxFa2tB2MSAHPQAqAsGZLCeaUGeMVJjHK+MrmJIHKr
         mrOIy9TUIVe5+dRW0AfX9umAixbcGVZ/gvqsfodgpZCKk0sJSqv2im5ysWmVIcnNO60B
         Kgzvse/s0r4f+frL0+e/dq0mneGj2ZkXvZc4dWq95BTMixh6slTdFjFuH8TcrtpTUnzu
         A34g==
X-Forwarded-Encrypted: i=1; AJvYcCVWwuFxxDI9S/LXxn/KldZc/+JEtGtpCYK9UHpqUzhK1yAgH8AqzrkqD7An91pAwe+o6BWRNX+Fx/g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxsBaFjNRDYPhe7nlipLvst+itX1hSWJPqY/r6ID8t7NvsDkuFK
	MSQIglIkljCpqDrNUvYMK7We4eHGY9P1eQr1o0VPYuP7lS9lgrFC6NnFSbieaQ==
X-Google-Smtp-Source: AGHT+IG+vtFTHKekFGzx2JSjGYucri2NY5wu0OJjYzZUZFzX5eF1sSUN0Dsh/KT6QrPf8siwpEeQJQ==
X-Received: by 2002:a05:600c:c8a:b0:431:2b66:44f7 with SMTP id 5b1f17b1804b1-4316169737dmr18731965e9.31.1729258050542;
        Fri, 18 Oct 2024 06:27:30 -0700 (PDT)
Message-ID: <3f87a19f-c249-438a-ac1d-be9b8fd80c8e@suse.com>
Date: Fri, 18 Oct 2024 15:27:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] xen/riscv: add stub for
 share_xen_page_with_guest()
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1729068334.git.oleksii.kurochko@gmail.com>
 <3dfd4bdf6584e73ecdbff5a66fdbaec68e31cc3c.1729068334.git.oleksii.kurochko@gmail.com>
 <b8de7161-5d71-4ed7-a3cf-611f4a860926@suse.com>
 <df635c41cf530d08898d021adf92eb141624d07d.camel@gmail.com>
Content-Language: en-US
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
In-Reply-To: <df635c41cf530d08898d021adf92eb141624d07d.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.10.2024 15:10, oleksii.kurochko@gmail.com wrote:
> On Thu, 2024-10-17 at 16:51 +0200, Jan Beulich wrote:
>> On 16.10.2024 11:15, Oleksii Kurochko wrote:
>>> To avoid the following linkage fail the stub for
>>> share_xen_page_with_guest()
>>> is introduced:
>>
>> What do you intend to express with "is introduced"? Is there a
>> problem now?
>> Would there be a problem with subsequent changes? I'm entirely fine
>> with
>> adding that stub, but the description should make clear why /when
>> exactly
>> it's needed.
> I mentioned that in the cover letter:
> ```
>    Also, after patch 3 ("xen/riscv: introduce setup_mm()") of this
>    patch series,
>    the linkage error mentioned in patch 1 ("xen/riscv: add stub for
>    share_xen_page_with_guest()") began to occur, so patch 1 addresses
>    this issue.
> ```
> I thought it would be the better then just mention in the commit
> message that.

Mentioning in the cover letter is fine, but each patch needs to also
be self-contained.

> Will it be fine to mention instead:
> ```
>    Introduction of setup memory management function will require
>    share_xen_page_with_guest() defined, at least, as a stub otherwise
>    the following linkage error will occur...
> ```

Quoting the linker error is imo of limited use. What such an explanation
wants to say is why, all of the sudden, such an error occurs. After all
you don't change anything directly related to common/trace.c.

> Perhaps it would be better just to merge these changes with patch 3 and
> add an explanation in patch 3 commit message.

Perhaps, as you say.

Jan

