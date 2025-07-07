Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1702EAFAC3D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 08:55:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035230.1407442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYfky-0002hs-2h; Mon, 07 Jul 2025 06:55:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035230.1407442; Mon, 07 Jul 2025 06:55:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYfkx-0002gN-VX; Mon, 07 Jul 2025 06:55:15 +0000
Received: by outflank-mailman (input) for mailman id 1035230;
 Mon, 07 Jul 2025 06:55:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uYfkw-0002gD-1S
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 06:55:14 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53e53355-5aff-11f0-b894-0df219b8e170;
 Mon, 07 Jul 2025 08:55:12 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a528243636so1451054f8f.3
 for <xen-devel@lists.xenproject.org>; Sun, 06 Jul 2025 23:55:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce417de1bsm8331750b3a.83.2025.07.06.23.55.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jul 2025 23:55:11 -0700 (PDT)
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
X-Inumbo-ID: 53e53355-5aff-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751871311; x=1752476111; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G1G0dYwdW1J/eI21YrU1pJCOBgEK3P+rZ91LqduyH+U=;
        b=ATzIgtCJui8IV2G9WzMWB1dsYuVszQSqOXs/j+opTme5M2gXTHfqXEJLfjbZvC3dt4
         4dY/a514ZBdlUbZTo6nBO8sntLEVNmrHagDoOvybxvKp1bpUel+SYX7YRe+Btk3OsXph
         LlMW6kPTCvTiHOMHkA5+i/Ok+aqk9FF7kKAVAMOJUQQg27FXAS0QA+4HGaazPMwAe+ni
         FULvf999Dl66xDmKJd1hORAvvafslxymeEOOzLfEjyp0oMWT4uWkMfJmKSExqGyjbPqQ
         0za1hCiM9hVi4yJicL5c+aKbGrHjWwhPydo2kH/uVrn5OPeenEeUw7HsZM22L0lHu3c9
         6uSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751871311; x=1752476111;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1G0dYwdW1J/eI21YrU1pJCOBgEK3P+rZ91LqduyH+U=;
        b=VB/N0jQIsyL+iZXM3PdAM7EJVwGmZGPnET/GfyHB2VDxUn3GYgUOmJQQSrWnaVl7yL
         MaqgKuQXtN3AVVKd3QZYGv/K3OcdoF+o4uQ22u5J2RjezYLcscRV1hEgatRWpROrnxUm
         VL3cap7nYfhtB7ckXFUDtQxQYUCf3y0h37k25WjndD+d2B7vhrSihU7cMTjpfyNCaQdG
         iJy5Iuv2/2Xq8ZBI8s+k+/VN2pWnUOnyn4jaZwgiyjjFmlHiWT5nRAnKUMB+s0/Bs8pN
         6T9fSL+Fh/NXr8tdgBlCMnVOCydk6bIfwCpOUyJjLCYQlcdwIkIVeDYSKS6eklzeyvlg
         s6Gw==
X-Forwarded-Encrypted: i=1; AJvYcCV1y0QBaCnHm12IKkO5S905GRWeMIL56M/j6p6ciUe5o8jfDO3dKG+sbCMzfjrtprUkhTg57Afzlq0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKst47u/w6bQsgh9DcdtpbKP3ophe62J+5CYyr5mzXmYBmpzcV
	tncVFlKvcXWIXrJfwI1DfbFpQQrSEB9OCEsM72ktKUjbKwPe/v6wVXM9UNq4WdW9ORseAm41mvx
	lc9k=
X-Gm-Gg: ASbGncsGL6fOAcDfj/yclJgkNT3dbbQvv0NXiUAZ3yyi1OU3WZ/huRE3KGHPvVbqu0s
	SOs5cCoC1dTP8vpfgxVYnhjj/0jnm+qm4EiT1vDJ3rjzTloSutI/BKBGDGd3eN7rNlSXwsAJxGV
	jWxSPRphswpLtvPll1ysRh5W8UMXx/Fe1IibHltwDj+qQsLP7wFD4XBlmOGks06MpAFzl/1N72O
	h/HfQvxxkyPpHkyN9nrwkFa2h93qYIfy9ORROQ9JZMM0ZHrD3nvmTwIoXzrX7fXe9e0YVe5bbvp
	UgN8v5OA6wR7iYkJ2efFkcqTGmWlzKypWq7+JkuDdKjYlk2WLjSHz+ZIazeNAVOqt4XFQhFnxGr
	7KsBJC609wfBUEb1EezZbQYahbgpOEI8U/033Q6T/pa0ldpLwtpW+e7Pmuw==
X-Google-Smtp-Source: AGHT+IGCc1mIqjoxAFaEN7Bi43JriFhWzMUwmkb+ySkpsXdamKLbdeYrVGMKSoeibuGBsycqujAjxg==
X-Received: by 2002:a05:6000:400b:b0:3a5:1cc5:4a17 with SMTP id ffacd0b85a97d-3b49aa7d51dmr5339938f8f.42.1751871311427;
        Sun, 06 Jul 2025 23:55:11 -0700 (PDT)
Message-ID: <ef1e9e9c-1548-4e1f-a6ea-0bef344e9599@suse.com>
Date: Mon, 7 Jul 2025 08:55:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] hvmloader: add new SMBIOS tables (7,8,9,26,27,28)
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1751412735.git.w1benny@gmail.com>
 <694f7bc0-5846-49ae-946f-bfab47d2bd5a@suse.com>
 <CAKBKdXjcDJhXMmdtJZiAbTwC6sRJfS-eOnO4NJf8x4ZRgqvbEQ@mail.gmail.com>
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
In-Reply-To: <CAKBKdXjcDJhXMmdtJZiAbTwC6sRJfS-eOnO4NJf8x4ZRgqvbEQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.07.2025 23:15, Petr Beneš wrote:
> On Wed, Jul 2, 2025 at 8:47 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 02.07.2025 01:45, Petr Beneš wrote:
>>> From: Petr Beneš <w1benny@gmail.com>
>>>
>>> Resubmitting patch from Anton Belousov and addressing review comments
>>> from Jan: https://old-list-archives.xen.org/archives/html/xen-devel/2022-01/msg00725.html
>>
>> In which case shouldn't this submission have a version number, explicitly
>> larger than 1?
> 
> Fair. I wasn't sure, since I'm the one who's posting the patch now.
> What version number should I use next? Should I go with 2 or use
> something else?

Aiui this is effectively v2, so the next submission imo would want to be v3.

Jan

