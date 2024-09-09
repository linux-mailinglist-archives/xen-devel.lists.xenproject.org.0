Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9EE971BFF
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 16:01:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794560.1203558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snex0-0000QE-RK; Mon, 09 Sep 2024 14:01:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794560.1203558; Mon, 09 Sep 2024 14:01:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snex0-0000OA-Nh; Mon, 09 Sep 2024 14:01:06 +0000
Received: by outflank-mailman (input) for mailman id 794560;
 Mon, 09 Sep 2024 14:01:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snewz-0000O4-Ca
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 14:01:05 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f24bcd61-6eb3-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 16:01:01 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a8d6d0fe021so34564566b.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 07:01:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25d5dc74sm343896566b.208.2024.09.09.07.01.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 07:01:00 -0700 (PDT)
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
X-Inumbo-ID: f24bcd61-6eb3-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725890461; x=1726495261; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tt6cM5O4LZsZ9fgDEOsQ54FpQwDFhCSbvjRbFg7GsuU=;
        b=Sm9XAoHcffhTYk8U7Syz32I1kkZKFd7EdmE7tSOL1LbJ1+FH2G3bKtfBbJah7RU076
         3Rc00LQd2v2SYUBru743AnbXf5WLFuqoeOPEW8VR76IFIyjZ4S3EDWIpbxwafdUvuncc
         tgbAJ+EcobUwIwAvPtD52bwccZZ9+AcBKCKnV1SWWzaqLsGStYjhoIr8NuOJagBEwl9B
         sNvhnRVTMJTuEtv6/ejq2otcwA8noZxRY1I0G4GaCi04Xs4YitffLALvYi9LhdWFFVZU
         0KIH9nvoVLhS3U+OLxc9CC2uL0+ryLJRdgsvVKCS2VbRqYhiBgagZHH5FJuQlW6JOrIC
         ePow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725890461; x=1726495261;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tt6cM5O4LZsZ9fgDEOsQ54FpQwDFhCSbvjRbFg7GsuU=;
        b=Xv4b6RS9/Rl4y5rU/O5iEQ+uj2AS3LkGdJwJv66EfT98xrk6v6fgRL/xzLXaUlcBWu
         Dwbr6oSNNBkWR3AyAtEi6Qp5U8z8ahAUxAnzKRiZCBoAEiF47ii5ESs9yGuliJvkkQVl
         OL+ICpEQFEKa51sKU/nJf391B5jsy6M/sbgmmUwmLP3Mp9KmrnvH/Uen8B5FOoXiDkdC
         ZZ9WRyHLM8hBrh8KM37+j3Bd5RFOZ0g140n2igW4zzgYyIsCNM6NwvKR2DrSngHHPpqt
         fBUuoQqFQl+vXXfbUClSGoB1K0D/YUS8CD2AViAeXrK4iyahePeshddcymzmbTYqP4H/
         OXBw==
X-Forwarded-Encrypted: i=1; AJvYcCVpVFebAYL9VWBqn9FWKTOXv37Q3O0gA19RoDH4MDGI4hq/O4hefwpA0ZQYGspiS4TIyxKdQVGbJLg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxhJmUh46AyzxVFPFHv7dEfg2JoWpnx926PiIXIRngDOnlvcs/y
	QUL7vy/YidzXsNbrVmt0HO/LmLoQLpWT0XMBRf2BtJeSOxRum/lttDZmyd/SrQ==
X-Google-Smtp-Source: AGHT+IHidFbbHvJxsgs0y1D8C8qv44euaLmZ7iSqUgHJzSd7O/XTDgmF5nMwzmZ0+/93g+MSsjIc+A==
X-Received: by 2002:a17:907:3205:b0:a86:963f:ea8d with SMTP id a640c23a62f3a-a8a88870ec2mr969072466b.64.1725890460945;
        Mon, 09 Sep 2024 07:01:00 -0700 (PDT)
Message-ID: <d0e24fd5-ac11-4b51-b1f2-9a667cdf9761@suse.com>
Date: Mon, 9 Sep 2024 16:01:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm: Unify PRI_gfn and PRI_mfn macros
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
References: <20240909131419.127276-1-frediano.ziglio@cloud.com>
 <ef183e7c-7775-42fb-b826-20d97bb0a3ba@suse.com>
 <CACHz=Zji4MwpO+c7q-vPjU+Qm1nmLgbk3hoGk7dJiKkw6=gsqw@mail.gmail.com>
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
In-Reply-To: <CACHz=Zji4MwpO+c7q-vPjU+Qm1nmLgbk3hoGk7dJiKkw6=gsqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.09.2024 15:29, Frediano Ziglio wrote:
> On Mon, Sep 9, 2024 at 2:21 PM Jan Beulich <jbeulich@suse.com> wrote:
> 
>> On 09.09.2024 15:14, Frediano Ziglio wrote:
>>> @@ -4334,7 +4334,7 @@ static void gnttab_usage_print(struct domain *rd)
>>>          first = 0;
>>>
>>>          /*      [0xXXX]  ddddd 0xXXXXX 0xXXXXXXXX      ddddd 0xXXXXXX
>> 0xXX */
>>> -        printk("[0x%03x]  %5d 0x%"PRI_mfn" 0x%08x      %5d
>> 0x%06"PRIx64" 0x%02x\n",
>>> +        printk("[0x%03x]  %5d %"PRI_mfn" 0x%08x      %5d 0x%06"PRIx64"
>> 0x%02x\n",
>>>                 ref, act->domid, mfn_x(act->mfn), act->pin,
>>>                 sha->domid, frame, status);
>>
>> Sadly this is where things break: The columnar view will no longer be
>> retained
>> even on systems with memory only below 4Gb. I have to admit I'm not sure
>> in how
>> far we can deem this acceptable.
> 
> I suppose this line is more the exception to the rule.
> One option would be to define the macros to just take care of the type and
> base (like standards like PRIx64) and specify all in the strings (so having
> "%#"PRI_mfn or "0x%05"PRI_mfn).

Certainly an option, yes. Let's see what other maintainers think.

> Or define 2 macros, one for default format (I would go for PRI_mfn) and
> another for raw format (like PRIx_mfn).

Only if we really need to have such further specialization, I'd say.

Jan

