Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6620CA41BC2
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 11:55:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895100.1303702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmW7R-0007QD-MI; Mon, 24 Feb 2025 10:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895100.1303702; Mon, 24 Feb 2025 10:55:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmW7R-0007Or-HP; Mon, 24 Feb 2025 10:55:25 +0000
Received: by outflank-mailman (input) for mailman id 895100;
 Mon, 24 Feb 2025 10:55:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e8X9=VP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tmW7Q-0007Ol-IB
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 10:55:24 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8236d96-f29d-11ef-9897-31a8f345e629;
 Mon, 24 Feb 2025 11:55:22 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-abb9709b5b5so786091166b.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2025 02:55:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbbbc95288sm1264794966b.158.2025.02.24.02.55.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2025 02:55:21 -0800 (PST)
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
X-Inumbo-ID: d8236d96-f29d-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740394522; x=1740999322; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H/zz1/2o0lKwq52keYUT+lim9DK1vtheJc0F88jQkZk=;
        b=Z96g7RLGnZGiJixUND2nC6A+VdjnT+U/69hIEELXnJdylgOLwjcwfgOO6lvNnEFzs5
         d6MhuBg/kcR/SEDMu7gHhEw9qGYAz+z8FmoEU0hsvcJ++YU4XhXlr/55G1jlWSIkqG1L
         +D3RwqmW2APPgLl35u0BAfdsaKOG4vWV/zcbkQtlP2tAyRXJq2Dyyzo8uDeHrD/2ReTO
         RUUBhOFnovbtftPXaWesE5OTrsW3YW3FfPUwNM1QgOI3kirqv10oWbnPA19XG74ilPfk
         Sk7jpVCropzj0RIxNETPh5KvN/rXp/3ZRxwqsDeCmnhNiG6+aF20F1p2HQFmFdvBX9D6
         jBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740394522; x=1740999322;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/zz1/2o0lKwq52keYUT+lim9DK1vtheJc0F88jQkZk=;
        b=kYL6Dl5B5bwK5YGAuCVY++4P2NK0QgdjOzJQhyuDk+qjDKssidAFNxcImE2R7Cl/dm
         F1hauEVV53ubdcPcKdlv4NcrEkpbgwmo4Pfj1zUy5NKCkFYHZ2Qf4z+NxyAXVz+x1e9e
         mN/S8RuR6yMHKaKLUok7/vdBcvlWDYzVFtLrvNmK8wKugGR0gPBfh4JR+zJ6UVRX4cRF
         e4vTlWZIJfxz7EykMfgka6UxGEu2f3j4F9FlxNANdonTTZV4bU4FwbTERtN51W9WB6SZ
         flGSD1F9gVBdNY1iSHgJpiHbfroFMTqI/VAuhC+XOrpp/8qqdQvhN+m30gREaCVqZo9a
         Q+CA==
X-Forwarded-Encrypted: i=1; AJvYcCWJt/UQFW4Wt5FjZNAmx3491ZoNWXcHLTswpxnFNOp9nUzeCkGo1HIPq+FSTL5rrmBqtPOVlRtxtSs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyettCDGnEOMISY+ekhL5/4lQbL6u//e+0uwvT435voXuE2GjKJ
	0u7h++coj4FEjyglJi5x1+68DaB1CzlaNSdBvZGR3Moe33qmAMo9KvKufa7+xg==
X-Gm-Gg: ASbGncusAilItcLF3ckDCPmLChX1cf5M+0Ek3Kqy9pPrYoi6nAYxelZ7i8eTdtw9hrb
	au7Ri+QuyOla2GoJjsFswg6Wkd+cgSE0CfVnGCSanme6HED7Wd7AZIeWzP+cOE2bXu10NHOqEfW
	rHHMT6Es45DrYf6YkbzBn7d1eBkWBHGda8lYThzkcXzFnZNkxwTZkW9ArLnJ/xQMcvjj+aaaolC
	xeGyekgYcVoATnSkikJqPnR7YrpvZUx0zIraK63Is1aNhfJ6ciHNoL05kp2IezijuP0FL2ZsE6y
	0Inw6QXV/0BB99TMKZPgX1XDSc0J/OlcD0pcgEWnES1Y44FnHSo2cAnLVYL6QUoW8FYx8BfAxLw
	bBSt4hVKJ3Ko=
X-Google-Smtp-Source: AGHT+IFfl6lyFo7X/sM6q0w06ql/sb6m5OJdQblYR1UsSrTA302dFFx3lD9dSwnrU+Xdx2Fcqg8ePg==
X-Received: by 2002:a17:907:72c1:b0:ab7:b356:62e0 with SMTP id a640c23a62f3a-abc09d3615bmr1311430466b.53.1740394521593;
        Mon, 24 Feb 2025 02:55:21 -0800 (PST)
Message-ID: <62498ba8-dbbb-48ab-8bc1-9833909c90b4@suse.com>
Date: Mon, 24 Feb 2025 11:55:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] code style exercise: Drivers folder samples
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: Artem_Mygaiev@epam.com, Luca.Fancellu@arm.com, roger.pau@citrix.com,
 marmarek@invisiblethingslab.com, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250216102108.2665222-1-andr2000@gmail.com>
 <4f1fcad5-dd6c-471f-9496-023973fa8857@suse.com>
 <alpine.DEB.2.22.394.2502171833370.1085376@ubuntu-linux-20-04-desktop>
 <f6db4e23-8c6e-43a5-a90a-ea3526f88b23@suse.com>
 <26cfd51b-123f-48e7-9911-2c96b48abdfe@gmail.com>
 <f0a4af56-016f-4ea7-92a8-6f6f4a62809a@suse.com>
 <924753a2-8abc-4d49-84f9-6f4677bf76f1@gmail.com>
 <alpine.DEB.2.22.394.2502191725300.1791669@ubuntu-linux-20-04-desktop>
 <020f1294-cd11-4733-a518-f4a42f146a83@gmail.com>
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
In-Reply-To: <020f1294-cd11-4733-a518-f4a42f146a83@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.02.2025 08:42, Oleksandr Andrushchenko wrote:
> On 20.02.25 03:34, Stefano Stabellini wrote:
>> On Wed, 19 Feb 2025, Oleksandr Andrushchenko wrote:
>>> Yes, I do agree. But only if we talk about having an automated
>>> code style check now (which is definitely the goal at some time).
>>> Before that we could still use the tool to take all that good that
>>> it does and manually prepare a set of patches to fix those
>>> code style issues which we like.
>> Let's explore this option a bit more. Let's say that we write down our
>> coding style in plain English by enhancing CODING_STYLE. This newer
>> CODING_STYLE has also a corresponding clang-format configuration.
>>
>> Now, we cannot use clang-format to reformat everything because, as we
>> are discovering with this example, clang-format is overzealous and
>> changes too many things. Instead, we take "inspiration" from
>> clang-format's output but we manually prepare a patch series to apply
>> code style changes to Xen as the coding style today is not uniform
>> across the code base and also not always conforming to CODING_STYLE.
>>
>> At this point, we have already made an improvement to CODING_STYLEe, and
>> made the Xen coding style more uniform across the codebase.
>>
>> But do we also have an automated coding style checker that we can use?
> It really depends on what that coding style would look like and
> if the rules we impose are supported by clang-format and if we ready
> to change ourselves if they are not.
> Again, here we are trying to do what we already did, but in the opposite
> direction: "diff -p" didn't work as expected(?) and we have changed
> *our* coding style to *fit that tool*. So, are we ready to do the same for
> another?

With a small but relevant difference: "diff" is a tool that people have been
using forever.

>> Can we use clang-format to check new patches coming in?
> Yes, we can use git-clang-format for that. clang-format is flexible enough
> in its configuration. So, it can be used for checking patches with different
> coding styles by providing .clang-format files at any folder level, e.g. we may
> have something like (just to show an example):
> - xen/drivers: Linux style .clang-format
> - xen (rest): Xen style .clang-format
> - libxl: its own .clang-format
> - etc.
> We can also disable formatting for the entire folder if need be by putting
> a .clang-format with "DisableFormat: true" option in it.
> clang-format respects the nested configuration files

Folder granularity is likely far too coarse.

> So, to answer your question: I think we can use the tool to check incoming
> patches.

I think the question was more aiming at: Can we have the tool check a patch
for it to only introduce well-formed code, even if elsewhere in a file being
touched there are instances of what the tool would re-format?

Jan

