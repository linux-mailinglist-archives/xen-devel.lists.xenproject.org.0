Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B44917DBD
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 12:25:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748706.1156508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMPp6-0007By-6A; Wed, 26 Jun 2024 10:24:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748706.1156508; Wed, 26 Jun 2024 10:24:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMPp6-0007AF-3O; Wed, 26 Jun 2024 10:24:20 +0000
Received: by outflank-mailman (input) for mailman id 748706;
 Wed, 26 Jun 2024 10:24:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sMPp4-0007A9-1U
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 10:24:18 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3dec991e-33a6-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 12:24:16 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ec61eeed8eso36073331fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 03:24:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb3c5ccasm96800675ad.171.2024.06.26.03.24.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 03:24:15 -0700 (PDT)
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
X-Inumbo-ID: 3dec991e-33a6-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719397456; x=1720002256; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uhoihlecdVahr094qoet3Yi040vaYgy+HQoQZQ+ajmM=;
        b=HZ99x/k0y9n4QvfDnTeWDWZlmm6tKHRBaO1PIYVdep5udiR/nM+UefYWiZZ5mDfkBC
         Soowf9+6cFq74nx6qoamstUHZINLpYg3vx2MbY8uNZe2SvuMng0ETys+hAx+tGeSlon/
         uGsSI0ZS1rXvJCXYsQPyy1eOWhmyy0vR2qE69mfM8o3EbT2gVVawfqC2JuIIoYlEUlno
         E92ec526Sag0RcKXppPmwDSDC8CJLsy9omMWIduzxdaZs25ZcdmghtZ+Jl50SdsKpgML
         YIJ7gDm5CoY5ez/tprbQuj1GgnclbEgh6g/pzKtGEN5I5nBOhI8buHv86hAyOZj5Z88K
         0FsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719397456; x=1720002256;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhoihlecdVahr094qoet3Yi040vaYgy+HQoQZQ+ajmM=;
        b=bvBInBdTJiDKkW1CN03mfSEcPVSTA/k71OFzHWY6ngpeNdy4GFIv0Z0HBHzMqCtrAW
         a6QdBvSY/T1JRxO29LT3pkH5dga7t4gQde5gyiqIOW9UQxZTF3kDP8shKhQttYO4hJFJ
         BO7+L93m3FDSJskhey9kqs/UfnWMPLkmY5BbspW1V7y2MeftN/QqJAQjti3UM6gUCeOj
         Ws0enIVoUEeC9E0+HzZb5ToN8UTH6Nh1uLt0+6a4/X/NsXUCVNSoLSVAYzBQhLPOuRvD
         LnAP7C1mUez51wy5kHrd9lQZ/BSzC1kf7wj6CjBw7eZiBuRJAoXkoA+DF9h06jhoBzDC
         zInQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk+ktiQ4fh1nLWJt1wIBFjZlWMcPNXtk3P7B9AEXXhxxRxupxabm6x/izlnjRbB+cU+egPyaeKgril76sQf1GXr+zvZWm+Ewa0gdwmnqo=
X-Gm-Message-State: AOJu0Yyp2x5459lQW0Dkc2OhrFwTJvrwmEtmtHK1Z84i5edLp3EHJViH
	AwTDOdk4ekm1T/lFoZGE+vUZKadCGf/G/aP5d7xJ5zbIvJ2Ef9PHEkF/ZdHbQQ==
X-Google-Smtp-Source: AGHT+IH+izyanq1Et8US/D22zeSqEYrSBod9f46ql9YGkiVoh5sF/u6GW0+eyiBNoLgQkLdoLzBduQ==
X-Received: by 2002:a2e:990a:0:b0:2ec:a024:a634 with SMTP id 38308e7fff4ca-2eca024ac25mr12271191fa.53.1719397456308;
        Wed, 26 Jun 2024 03:24:16 -0700 (PDT)
Message-ID: <59201cf5-9d86-4976-a331-2a7f8bb9635a@suse.com>
Date: Wed, 26 Jun 2024 12:24:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] x86/xstate: Switch back to for_each_set_bit()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240625190719.788643-1-andrew.cooper3@citrix.com>
 <20240625190719.788643-7-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240625190719.788643-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2024 21:07, Andrew Cooper wrote:
> In all 3 examples, we're iterating over a scaler.  No caller can pass the
> COMPRESSED flag in, so the upper bound of 63, as opposed to 64, doesn't
> matter.

Not sure, maybe more a language question (for my education): Is "can"
really appropriate here? In recalculate_xstate() we calculate the
value ourselves, but in the two other cases the value is incoming to
the functions. Architecturally those value should not have bit 63 set,
but that's weaker than "can" according to my understanding. I'd be
fine with "may", for example.

> This alone produces:
> 
>   add/remove: 0/0 grow/shrink: 0/4 up/down: 0/-161 (-161)
>   Function                                     old     new   delta
>   compress_xsave_states                         66      58      -8
>   xstate_uncompressed_size                     119      71     -48
>   xstate_compressed_size                       124      76     -48
>   recalculate_xstate                           347     290     -57
> 
> where xstate_{un,}compressed_size() have practically halved in size despite
> being small before.
> 
> The change in compress_xsave_states() is unexpected.  The function is almost
> entirely dead code, and within what remains there's a smaller stack frame.  I
> suspect it's leftovers that the optimiser couldn't fully discard.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Other than the above:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

