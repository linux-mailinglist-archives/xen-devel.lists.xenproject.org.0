Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C68D3C0BC
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 08:42:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208419.1520582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi6NF-0001e1-3w; Tue, 20 Jan 2026 07:42:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208419.1520582; Tue, 20 Jan 2026 07:42:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi6NF-0001bs-0P; Tue, 20 Jan 2026 07:42:01 +0000
Received: by outflank-mailman (input) for mailman id 1208419;
 Tue, 20 Jan 2026 07:41:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EVnc=7Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vi6ND-0001bm-Df
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 07:41:59 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d11f784-f5d3-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 08:41:53 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47ee9817a35so27805625e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Jan 2026 23:41:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43569998240sm27228205f8f.43.2026.01.19.23.41.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 23:41:52 -0800 (PST)
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
X-Inumbo-ID: 7d11f784-f5d3-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768894913; x=1769499713; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qpGZ4Zl02J19k/6EyNTEK+2X721BxWTLFU42awna7YE=;
        b=JH8F52JwqQsWgINXobJ78cPe+46Td/FVP3Shy2zCRc4rzrUQo9DDabCmQkR8GlI+/L
         QkzQpwFtup9keIE73k4ADhWlfWTm5GqFqrAJ52P9v/kX67KGS+c04DybLzYJUsRXsa6q
         jyJw+jMIXRZCCcLWrpWvKELKDie41I1fgnGxwqF0hIJ13JjuyGxmV6WB7NAyCWYWXaEO
         HT0+tFpqnP5VP90soIRxsTRItaZ2g7seXDs81dQfdNJS+yOkXMH12rvON5Tuj3/+yEyA
         5w+wLH5bA0ZSqq+IPU4djOx3b4xRBaObicLJDKqYvISRCJq/KeZDB0xRCN0QL8wjw4iB
         bzKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768894913; x=1769499713;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpGZ4Zl02J19k/6EyNTEK+2X721BxWTLFU42awna7YE=;
        b=WAW8vukOcx2yvs/y+TRr5rdz+e39g4VJu5GmNJ2D+xhahVwxCako0BLfssr/4Ay3Ng
         6mgHzF+7/uXGX9URYCztu8Oy/ncM18c3/dK0JnsxRv6KnBHELpZB0DFyvumQ+54Vw+55
         JflHALM0SV5ExwVeBIOsXlSfQuLaAl8xNhbzbHSoQczHEUcAXWKVdU56fJ/VqMuTvXmY
         G8awRapcanmgFDFbvwCk2P2LSrT6Mgy6aPpAq5z0zhJjuQyzI9q1dauSa4u9T5ZnWRAH
         p6VUDsY9K9qsoXNWEXmncSP1uYNGWP9SfF+bQRfHT0zQ98m+QP+JNx7ptiU/ya0Ye8Ov
         cQ9w==
X-Forwarded-Encrypted: i=1; AJvYcCWCuQo+5KvjTqonHVk/cIBY6zOCZpoka8qieoxMrfzCB9Nb0pMju+pUXo7vtFgPOYb0xUJMICzitn0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyn/fzlB6ba/2XwEjb8CBn5W15I2G9NLy2LZ9QETvDC4oMAhLXM
	nJtNwksCXemEChw918OqT4JDE0W4OckK2zPhPfI+Q0oCSUo5jqaCY6PNX3W3kWQDHA==
X-Gm-Gg: AY/fxX64iRsZWEvVThnlkXZ88ylFLRoY+nQyWTyZ78/LL9q70hxqVueJs7RpWFipdDu
	bBTLNtCMY7tbLhJ0p/RPHXA6YqYd7W9rxGn/f6FKMiLaEoM7IgcguAz+tZrE1OPpa7KTHRW5bCz
	AJYjWGVz2IfpktQncLzNPJiuhN15TuMqstQj1yMOu6+FLXsXs52jhEwFXY5/PFE8jmnqgEMNgvI
	ivIXoymKqa/vLvs7YfagHiTpcWENmTA97Q6yDBS8vNkqKArQsIUiBON59eTcvCklJGG14ybz7x2
	A5M1PLhqpbG5CS7QZdj2GHZsBgajbywJkabexVqP5U7aFzIJPvKQzV+LZpK+/Y8DGES4CSwMaIO
	sRmv9kkrVBuFeFYvvpP529RHLG8KYPC9SzwnwDbScQ0cMU3sqFOBHKJiZRSkZdIcq8Bw2PJ8hZK
	R9kxU8kZ8Id5NSW/ETVRS+r6+tuBMjjzhBFFK0TTa4YQhMBSV3S0WIvZY3uc9NSPIdpMr4bokkq
	UE=
X-Received: by 2002:a05:600c:6388:b0:477:9a28:b0a4 with SMTP id 5b1f17b1804b1-4803e713cc2mr12693765e9.0.1768894912997;
        Mon, 19 Jan 2026 23:41:52 -0800 (PST)
Message-ID: <32d0a9a2-89df-4e20-8f7a-0f069cbff11f@suse.com>
Date: Tue, 20 Jan 2026 08:41:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/console: handle multiple domains using console_io
 hypercalls
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: grygorii_strashko@epam.com, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>,
 andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2601131638350.6279@ubuntu-linux-20-04-desktop>
 <63c35c5e-577b-4346-b600-03808306177f@suse.com>
 <alpine.DEB.2.22.394.2601191522450.7192@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2601191522450.7192@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.01.2026 00:23, Stefano Stabellini wrote:
> On Mon, 19 Jan 2026, Jan Beulich wrote:
>> On 14.01.2026 01:39, Stefano Stabellini wrote:
>>> @@ -815,6 +831,11 @@ long do_console_io(
>>>          if ( count > INT_MAX )
>>>              break;
>>>  
>>> +        d = console_get_domain();
>>> +        console_put_domain(d);
>>> +        if ( d != current->domain )
>>> +            return 0;
>>
>> This isn't atomic (as in: in a suitably locked region) with ...
>>
>>> @@ -830,7 +851,10 @@ long do_console_io(
>>>                  break;
>>>              }
>>>              rc += len;
>>> -            serial_rx_cons += len;
>>> +            nrspin_lock_irq(&console_lock);
>>> +            if ( serial_rx_cons != serial_rx_prod )
>>> +                serial_rx_cons += len;
>>> +            nrspin_unlock_irq(&console_lock);
>>>          }
>>>          break;
>>
>> ... this. If the focus domain changes after the check in the earlier hunk,
>> I think you need to also return with no input here. Or you need to acquire
>> the lock earlier (and then similarly in console_switch_input()), albeit
>> that would then mean holding it across a copy-to-guest. Which technically
>> is perhaps not a problem, but it leaves an uneasy feeling.
> 
> I thought about it when writing this patch and I had the same feeling as
> you. However, especially considering the other feedback, I don't see
> another viable solution.

Taking just the logic here, an option might be to re-check the focus domain
once holding the lock, and discard the most recent chunk of input from what
would go back to the caller if the focus changed. But that would come with
its own new complexities.

Jan

