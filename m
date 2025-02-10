Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E244A2E86B
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 11:01:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884512.1294220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thQbK-0005u1-Nm; Mon, 10 Feb 2025 10:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884512.1294220; Mon, 10 Feb 2025 10:01:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thQbK-0005rY-L6; Mon, 10 Feb 2025 10:01:14 +0000
Received: by outflank-mailman (input) for mailman id 884512;
 Mon, 10 Feb 2025 10:01:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SvFn=VB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1thQbJ-0005rS-Kl
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 10:01:13 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efc7473f-e795-11ef-b3ef-695165c68f79;
 Mon, 10 Feb 2025 11:01:03 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5de6c70832bso2326474a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 02:01:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dcf9f6c1d6sm7489665a12.65.2025.02.10.02.01.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 02:01:02 -0800 (PST)
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
X-Inumbo-ID: efc7473f-e795-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739181663; x=1739786463; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AFeaaLw82aP/RpwnG8BuNWwVwlKUr3MQKQwI9cJrh6k=;
        b=QLpf0V3lDiYaOMOeVH3ChHDbZQFwUQHwSp3FuMdKuUNExebiF528gJjyCKrIRcM1eM
         yJseJsTT5BjMOGJqvGnM6JERdLC2JkrMfNwkvl6Jkaq6pgFMaVUCO/k+piYV7Q0CjXUG
         4lv0zHIIf/ZBA0fjDFlI1PEkmEyZQ/cM8gRUDVpOBtL6275XUDZB6wBVNgC1N7wY3tCi
         XjbioGawZWKD4U+XdMfH5a3DO/QfVaUogvCsQ0QvyGwcME21GMBuFsViXKID0UWlNNL3
         D1jM3iih88cIfjfnbA34zSq6FnMy/nIUtEFeLcH97u2ssMKqXLUXO400Q7hYIa8w0Y5k
         CEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739181663; x=1739786463;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFeaaLw82aP/RpwnG8BuNWwVwlKUr3MQKQwI9cJrh6k=;
        b=MvjfS/L5Wt8+4Hj4xMFoqRQh6LZb/sbb7yUaMG37lY3Zjggqe4rGvwkzIWlcxtVa9r
         LepsldhoXJU/PI3pTfdWcfmjkqZrrwXcfobpDOWWhRZqwy+8QF19+Qe9mEAuABlcsgN8
         9EHSjIdrqSvovgInoAC1MubKmltlDLuxowrFLxx8Q8iwc9ngIBUaxNV3XvK9JbKQxr5d
         sGhOUacpbO7M+FF1GxJm8/CEeC/05KCSgJR4a8avjyS9KudhwsWfg3QXzmnF0XXaW5aM
         NX2QuXDSESf06/XpNYt7uAQY25RgM5nmVlwhA37mieFpE512TS4zkfg4Sm5gV9xL6Fdw
         8lCQ==
X-Gm-Message-State: AOJu0YxtAUepxZ3nKv7MAhxcA58J/4U2lAIAR9ke9krsDwq99aHH7/a/
	fdLxVRixwCc4C/1ort5gSr3TcE87SEsaTVrp6+es0HcLMnMTVswlj2mB/EF83Q==
X-Gm-Gg: ASbGncsF2jtOi786tFZytip6hg9Ko5UKilQ9q6Xfet5JK3mrSsIG4XfgRqgrX0DwqEJ
	8UwBVLKdLTqEaC0CRPGDcr1vlefkZyb+xraJq+ryOWp0WFyD4xBCKTyLbAIb+42znImI1/sfURI
	d+K4PuD9SChRhctnf6X0nAzfqFjohngvT/Q73SGwMGqN8vVTRpnq+xOZoLrwjvDrS75cYJ2HZsz
	6gM3Sr93ufYE03esM2VpM6WfKsKHdAJA6MEn1mz4jc3Pmz9Wf9P+1XHaTuNKcpXigqRLdpQoxvx
	awCGRFw41xxP6ImbvS8miUnR/NldtOqhfXPwQvJKHtx5RaysfVkNZWpJk8KqAlNvI+zrYa2vkOB
	2
X-Google-Smtp-Source: AGHT+IFjztWyCtXrgN4Ffwyl70XiI4RFpBgufGbtPEjYXZZkcRV4MM4OEi2ogROgIeo3Rg+6iR38Ww==
X-Received: by 2002:a05:6402:26cd:b0:5de:50b4:b71f with SMTP id 4fb4d7f45d1cf-5de50b4b863mr11661075a12.12.1739181662770;
        Mon, 10 Feb 2025 02:01:02 -0800 (PST)
Message-ID: <6fb62cba-0f02-4692-b9b1-5b6d3bc00dc1@suse.com>
Date: Mon, 10 Feb 2025 11:01:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 for-4.21 4/4] PCI: drop pci_segments_init()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <0a006732-2b6e-46f0-a706-f432abd45d2c@suse.com>
 <b7b148fc-ee74-4f02-9dab-f80b1707e44e@suse.com>
 <Z6TQiP7142UON90W@macbook.local>
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
In-Reply-To: <Z6TQiP7142UON90W@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.02.2025 16:08, Roger Pau Monné wrote:
> On Tue, Feb 04, 2025 at 02:04:35PM +0100, Jan Beulich wrote:
>> Have callers invoke pci_add_segment() directly instead: With radix tree
>> initialization moved out of the function, its name isn't quite
>> describing anymore what it actually does.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> IMO I would rather not add the segment here, and just make sure that
> all callers that add segments have proper error reporting when it
> fails.

Maybe. Yet then things may (on x86) work fine with secondary segments not
properly working. A log from one of the few multi-segment systems that I
had seen data from suggested that none of the devices on the secondary
segment were actually used by anything. This was, if I'm not mistaken,
the underlying reason why (on x86) we demand segment 0 to have proper
representation, but do things best effort only for other segments. Which
isn't to say that we can't change things and do better.

>  Maybe alloc_pseg() should gain a printk on failure?

Not sure that would buy us much, especially if (on x86) it's seg 0 which
is affected.

For the patch at hand - do you then suggest to simply drop it? The plan
here wasn't to re-work what we do, just tidy slightly how we do things.

Jan

