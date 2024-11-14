Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB289C8715
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 11:12:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836217.1252102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBWpb-0003SP-Em; Thu, 14 Nov 2024 10:12:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836217.1252102; Thu, 14 Nov 2024 10:12:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBWpb-0003QB-BR; Thu, 14 Nov 2024 10:12:07 +0000
Received: by outflank-mailman (input) for mailman id 836217;
 Thu, 14 Nov 2024 10:12:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81on=SJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBWpZ-0003Pw-O5
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 10:12:05 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e45a15ad-a270-11ef-99a3-01e77a169b0f;
 Thu, 14 Nov 2024 11:12:02 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4314f38d274so5455305e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 02:12:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432dab807d4sm14875855e9.21.2024.11.14.02.12.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 02:12:01 -0800 (PST)
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
X-Inumbo-ID: e45a15ad-a270-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzEiLCJoZWxvIjoibWFpbC13bTEteDMzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImU0NWExNWFkLWEyNzAtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTc5MTIyLjQ4OTM0Miwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731579122; x=1732183922; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vcsSmPvMdJ0uNmijo/pn3QQ0CCgWXmm1K16ND34RdR8=;
        b=LryFk7xIW14l2+5ZI+jCZ/U+/P8sMyHIzP8r0ROb/D/uhOhULcCxH8tjjb3doNF+yF
         0didq3memkSIEeyPswpolS+KnhGyk/tKkadlnnIKsEQ6sJ8tNbZ1hin6AcHv9p3Bnhcw
         tkgfBfX7ICdVezMAECi8/T/rl179esrz8kj6VGZRMOXCEZHF0pNC8wVEP9QVlw3j0ezD
         CgIfqZ7d6ZePA0pFjm70p6Kd3fyVG7a+Gpi3X6+tTGlbsLFgOAYQ0tscI2fTx1hs4998
         HFT3779RjrZTbtq+4pbhdLk0eTBdVzVn9pBBHgtEB3I8lJgpT7DhnE8SMMV3a3N/BMLO
         ghcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731579122; x=1732183922;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vcsSmPvMdJ0uNmijo/pn3QQ0CCgWXmm1K16ND34RdR8=;
        b=fiHrAbqu5wmhxOeuhOt9BOKifHgvP4ysnRPeYpo+JgsQA/9J1U6NGxC7ZrMRma6haS
         wr8S1KHjhOCkmTUebtBLVCPv0dNGIScNDiUA6zoerQTyfKgduzbTLbEisbASL3J0p/sD
         3q5cFKvZ/1eNY4EA1dAjtMZWB0DVU5ZiCViqmdjctXzHCWxhpPUm+6VJHCZRq7hdB3GS
         /lTvcB5Zgp8mC09WSBjGuDfegxDBzaPBCcGByk+RPCYC/qXR7z9ea/U4VpEsXPTzqDXF
         MQQUOM+K1ULJRWY9jnUggS+6PndmkqzBEmHc/X9zEKv1gg0AKqGGnCYtLhkkKgi5Aseh
         aYCA==
X-Forwarded-Encrypted: i=1; AJvYcCUqsV5G7k3ic/WCbWuxMXmH7HGiKcnTr/4yrtWHIN0LddrAr3kIb4jO+NWTg72T6MRWr8M3Q/dQTDI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxa5hFacGTfRWcl7rN2uQ4WbpOBTA8HYPQflxAhzaZgNJ0mlpYC
	AYAUataElhVdB4zWno4AG1jjMPCNX7XZIxBEV8EIiWxqvZuLSkucrrxUjQNd5Q==
X-Google-Smtp-Source: AGHT+IHpgRHLZsQFh7tm55wZaqbbE3TD++RaRWhuaNTRZ9qRcZsmV1ZWH56PFueGuVkXv+7m+bGazg==
X-Received: by 2002:a05:600c:1e18:b0:431:6083:cd30 with SMTP id 5b1f17b1804b1-432da76ec60mr16613755e9.6.1731579121896;
        Thu, 14 Nov 2024 02:12:01 -0800 (PST)
Message-ID: <e758bdd6-57b4-4a73-b2fc-e6c506d75e1b@suse.com>
Date: Thu, 14 Nov 2024 11:12:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] x86/trampoline: Document how the trampoline is
 laid out
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241114090810.1961175-1-andrew.cooper3@citrix.com>
 <20241114090810.1961175-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241114090810.1961175-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.11.2024 10:08, Andrew Cooper wrote:
> This is, to the best of my knowledge, accurate.  I am providing no comment on
> how sane I believe it to be.
> 
> At the time of writing, the sizes of the regions are:
> 
>           offset  size
>   AP:     0x0000  0x00b0
>   S3:     0x00b0  0x0229
>   Boot:   0x02d9  0x1697
>   Heap:   0x1970  0xe690
>   Stack:  0xf000  0x1000
> 
> and wakeup_stack overlays boot_edd_info.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



