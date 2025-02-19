Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F93A3BBB7
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 11:34:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892605.1301567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkhPC-0005f2-Cf; Wed, 19 Feb 2025 10:34:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892605.1301567; Wed, 19 Feb 2025 10:34:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkhPC-0005cd-9Z; Wed, 19 Feb 2025 10:34:14 +0000
Received: by outflank-mailman (input) for mailman id 892605;
 Wed, 19 Feb 2025 10:34:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EceQ=VK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkhPA-0005cX-9p
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 10:34:12 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0df913d6-eead-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 11:34:10 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-abbdc4a0b5aso65210366b.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 02:34:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb6c312637sm873298566b.45.2025.02.19.02.34.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 02:34:09 -0800 (PST)
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
X-Inumbo-ID: 0df913d6-eead-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739961250; x=1740566050; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tiFvo6BP7tq+zLOSoUWnYap+VQ7CqT+99pA7HqPO+Rc=;
        b=ML5S32GacCx/9LFTIqlGzyQjDvlJRXHUXu4X+IXh2D0K1JqTtax3+6QaJeQNR8/sk1
         bWYrHQ2f25jypdtXanQYw24W8AIlSQlpPlcTC0YnUxVgc/ko9PZGh2FPyo4cMOwwHpjT
         IeVWkSh5kPiGzjtYINR32zAyP4cd4zacel0W2SYhpdkrNJMh22x4zAfsIluqV16PWZ6K
         vDciSAA0U/wkNeQ/FwbQ2h/0BQQ3qJvrtH0mJ6zQyvbCeyBHxzpMFAxWSEr7NHCcjEOb
         jg8S6JyKW1I8hPatyVpcHBmGEMwNxjKgXM2B/gY84yejeqpeu4FQxpzn/Bwp2Dd+mgNV
         DWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739961250; x=1740566050;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tiFvo6BP7tq+zLOSoUWnYap+VQ7CqT+99pA7HqPO+Rc=;
        b=wUWEzxnNb9DtIUV4gLyPmoBHB/G6XEYCLMLasqk6WkkH9oOmegfy45jc/OrgDJ7jIn
         V7SWxQ5NPaW+xWXje0YTFLId3DaNUPlnFcTIxoVmWDHH9yul6mnAvvVOXdjCiATdlDQT
         jS5wda77XgCBSGy7XpEFI4ksC08g76hrQmKszAuRlDuJ8QFiBgKlL566cbI8dMHM/1Av
         EKG8DDZ3sTxZbEY317HEZ9pByaNFOtB75GLUuOwxD2cOLW1RDjXwYn0zFdxe4/shHhwR
         uqxzDVcPjj3aBhxaezTgsYxcb4d/0nruEhwF/WFhGjXBJs3VOSlXPT/caJzwO/FyZxKh
         RY8g==
X-Forwarded-Encrypted: i=1; AJvYcCW2fzJE8dpVMcOOQvHc98UgyyamqsKjmbWHMgp5QXU66gEkQG3hrV6i7JAW8R/m6R+zo6I0WMFZVUc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8rDbmygCbXDbEkv3JmPW4rr5KxbzgNcFXXgsM3bwda75xb7uw
	V93oq8qKEoVFFt9+WJYTKXczBTWEUOMVALdg3RYAYFoCd1SSWCeCotE/6eQ2hA==
X-Gm-Gg: ASbGnctGmveTUhNFnrNpJ2vpjxYRUAJ4YHENVV+T0goIfXEmMASIzKZQGQUG5kWXjt/
	NJG2JlfC9UVC8a3GJIT+HSIqpKRRs+x/gttvCnSWr3UnKDQydrKprqFyOyQ61d0TF6/qWsjJHFa
	wfxyaX/nF0WwWjqC+I5ezbltXRoa1JJHy3thkEVpw85dcoT6iEJjXMhjNw9U6hYLlcLoQPAiwWj
	q6t2RMF+TRgbVoN6oZ0wJKW1oJw2qqsFP5jOTR6XyXA+vkuXp3gDQQEe5ouiQ5DGjWUSlnG2n6e
	jv4+Po2YEfkLwHk4G26rnUdUkXbhO12+Os5LbDyVbx43a961cS9L9l4uX24eIySOsmss/jB1x9w
	6
X-Google-Smtp-Source: AGHT+IF+0WKu013y5SBC9gN4yQeKnbbarkd1t9ndBxLVEdI3zCcyg75CEymTIO+olsN+ohz3sav8iQ==
X-Received: by 2002:a17:907:3907:b0:abb:daa7:f769 with SMTP id a640c23a62f3a-abbdaa86e30mr137483066b.0.1739961249648;
        Wed, 19 Feb 2025 02:34:09 -0800 (PST)
Message-ID: <4e8aa6cc-022d-4924-bb83-a52b2e96ac82@suse.com>
Date: Wed, 19 Feb 2025 11:34:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/PV: don't half-open-code SIF_PM_MASK
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <42688c2b-9f11-4c52-b83a-607374a858fd@suse.com>
 <dc14cb80-29db-47ca-b03c-e8fa370279d3@citrix.com>
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
In-Reply-To: <dc14cb80-29db-47ca-b03c-e8fa370279d3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.02.2025 11:29, Andrew Cooper wrote:
> On 19/02/2025 10:02 am, Jan Beulich wrote:
>> Avoid using the same literal number (8) in two distinct places.
> 
> You say two places but this is only one hunk.  I presume you mean
> SIF_PM_MASK as the other place.

Indeed. Somewhere there needs to be a literal number. Just that it should
be only one place rather than two. Obviously that other place isn't
touched, and hence isn't visible in the patch itself.

> In which case I'd suggest that this would be clearer if phrased as "Use
> MASK_INTR() to avoid opencoding the literal 8."

I've appended this to the sentence there was, i.e "..., using MASK_INTR()
...". To be honest, given the simplicity of the code change, I didn't
think it would be necessary to also say this verbally.

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Preferably with some kind of adjustment to the commit message, Acked-by:
> Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

Jan

