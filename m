Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C3BA9E94B
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 09:29:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970193.1358939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Iv2-0005hv-Ge; Mon, 28 Apr 2025 07:28:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970193.1358939; Mon, 28 Apr 2025 07:28:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Iv2-0005ex-Do; Mon, 28 Apr 2025 07:28:48 +0000
Received: by outflank-mailman (input) for mailman id 970193;
 Mon, 28 Apr 2025 07:28:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5hYN=XO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9Iv0-0005er-Pd
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 07:28:46 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a49af6c-2402-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 09:28:44 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4394a823036so42613455e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 00:28:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-440a52f8915sm118921685e9.7.2025.04.28.00.28.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 00:28:43 -0700 (PDT)
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
X-Inumbo-ID: 6a49af6c-2402-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745825324; x=1746430124; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KhEl+XJTa/JPCYXT6wWNqTNVJcpDja2+mTjwpNh1YHQ=;
        b=AwjMySvJaKGVf2g4NPj1ysckG/rXOpZqWYx2aqW5T/QJBQX6iNyqIuG3A2sPjtNUzx
         xvqAubGnzX1d8bJalEsknfOiF87rc3rWgTbrrYQOVU9fmJzP4gSt7LifjIjL6oH1dtLQ
         g1GzLEe3Ii0VLgTMVpTWgixnHcwwoQ3h2GDxjPQ8N6ln6d1b1aO9BJ1axYvG7EySCLnY
         +M3+osvRvXbTaOu+myIGE1d5oA6A7tfl2o9OGv7RR9skGTlCFtqwugGg4B6fDSZYj9pM
         v1ahpnZJUoXq9ufBQNAF5PnorXMCAatJ9FTQxSHh2jCgJx4JHPEtf7BOsZ6e7pp4YjJp
         5Akg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745825324; x=1746430124;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KhEl+XJTa/JPCYXT6wWNqTNVJcpDja2+mTjwpNh1YHQ=;
        b=jCBH9MKoaqlvgO6SEjGKJoCzdyruBVK39YCRqm92AFViUYv3qkJToZA90RauHvyibG
         2ldN1If+k9toQ3DmimitQOOOTljiKxGlPUGGZIoEKevf6wh0AVFzHLBCASObPc+QZGh0
         1uB8SIjLVVXv3RPQMwT087mIbaLqHE75C8UXAnOXYXRRbdL628jCCJGShIrkjGb86ff+
         X6qEM1sk4BJsmO0jGZllooSUTSKw64omQ235G74O5x9WHSdDfzRZladNrqaXlTT2xzJq
         5HmfFIh7nCJo/3AISb+oXczB5IqyjzCjZWfv1V+3JrrKNdZK+0LXC6KK+NJeln6sIP2v
         PHZw==
X-Forwarded-Encrypted: i=1; AJvYcCW+hRg2YyqzkPyqI20I30+6dcleTAhiOjOKA3kz64wC23YA5lIiisP1jdGNnQSS94cErq+mLf0Jh14=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxX77pV1nFOOyCvKiMO4bpm5f/ipvdz40YXuNnskVOkeBwsG1Cw
	BU1T83J3mG/btDwpMB50aJXNZssRw/55HjyO0D2Y5UMGlUHo9CvBX0XyBYBV2A==
X-Gm-Gg: ASbGncvRbB7m0ralbfoorRVUSzkejCtX0eJvSXOnvU2yQd9Iiw1oFO3Le+fhdBFbFQw
	ybdiuhQE2ZY00xud/trX5906RGiqqJle9+fgR6PDq91zyDw0++Xmc/jSuUO5LFKUIil7caBGeyn
	gRkfskNwAjV7oEzuoafAn4VUb4bkjOA6/NG6Dgt2LbLPOLDZDGxE7z8jMTikklA3j0kJHgSlwtL
	4R7LxzOGKWHk5GIUkDdo78nRrsb0FZP7ulhhO/lF/NXrIVDYMfhJPuvsy8vjAAI+0fQvw7uAwaW
	IwLrMYcTDMjBzjsyb6eAActGXiSI5Z9Ay72oCCjttbo2957WYXvQHEmL5zYuYHRqzW1+8yZY49k
	1PeH80RXrmLn96ptSAqdHMTQCmpPfb/jtTeiX
X-Google-Smtp-Source: AGHT+IEzoOzK0yFoyMQ/vZmQYXkYG8Ebzr5ASv0tIGVVGG5C2kwnsTKI2dWwjUi97cgFn64ksqABkw==
X-Received: by 2002:a05:600c:a089:b0:43c:efed:733e with SMTP id 5b1f17b1804b1-440a65e3e7emr95498685e9.14.1745825324014;
        Mon, 28 Apr 2025 00:28:44 -0700 (PDT)
Message-ID: <cb1f8a8f-8834-4610-baab-c53bf5928b0c@suse.com>
Date: Mon, 28 Apr 2025 09:28:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] compat: address violations of MISRA C Rule 19.1
To: victorm.lira@amd.com, Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <c694069696dd428bc1719e36c378a573b03f74b9.1745624090.git.victorm.lira@amd.com>
 <74b0420ab20fc0204db14c0a1a4a68ed48b25a38.1745624090.git.victorm.lira@amd.com>
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
In-Reply-To: <74b0420ab20fc0204db14c0a1a4a68ed48b25a38.1745624090.git.victorm.lira@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.04.2025 01:42, victorm.lira@amd.com wrote:
> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Rule 19.1 states: "An object shall not be assigned or copied
> to an overlapping object". Since the "call" and "compat_call" are
> fields of the same union, reading from one member and writing to
> the other violates the rule, while not causing Undefined Behavior
> due to their relative sizes. However, a dummy variable is used to
> address the violation and prevent the future possibility of
> incurring in UB.

If there is such a concern, ...

> --- a/xen/common/compat/multicall.c
> +++ b/xen/common/compat/multicall.c
> @@ -15,8 +15,13 @@ typedef int ret_t;
>  static inline void xlat_multicall_entry(struct mc_state *mcs)
>  {
>      int i;
> +    xen_ulong_t arg;
> +
>      for (i=0; i<6; i++)
> -        mcs->compat_call.args[i] = mcs->call.args[i];
> +    {
> +        arg = mcs->call.args[i];
> +        mcs->compat_call.args[i] = arg;
> +    }
>  }

... wouldn't it be of concern as well that the alternating parts of
the union are still accessed in a flip-flop manner? IOW we continue to
rely on the relative placement properties of the individual array
elements. To eliminate such a concern, I think the resulting code would
also want to be correct if iteration was swapped to work downwards.

Also the scope of the temporary could certainly be the loop body rather
than the entire function. I also don't think it needs to be xen_ulong_t,
but maybe using unsigned int instead wouldn't make a difference in
generated code.

Jan

