Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F35B1A6A77D
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 14:46:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922053.1325942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvGCw-0004ON-Ek; Thu, 20 Mar 2025 13:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922053.1325942; Thu, 20 Mar 2025 13:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvGCw-0004MS-BB; Thu, 20 Mar 2025 13:45:14 +0000
Received: by outflank-mailman (input) for mailman id 922053;
 Thu, 20 Mar 2025 13:45:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvGCu-0004Ll-KK
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 13:45:12 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ae6f856-0591-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 14:45:11 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-39141ffa9fcso695945f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 06:45:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df339asm23558493f8f.3.2025.03.20.06.45.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 06:45:09 -0700 (PDT)
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
X-Inumbo-ID: 8ae6f856-0591-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742478310; x=1743083110; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FagdEAnJg8/2m5qmwT7Lhx+0rk880BCemP1xM7z1ZqU=;
        b=NWpUGYOKQ2Dl9I7xxDHdMhSoyV/A0tHwdJbe3u207Tcu2hJe0J7f0Ryg2tHjoJK2yT
         A5YAyejgIXmNmgf27LkKN/qR4pzu4pKiY42uZAYjmzDCe5BjYLK3YVOOnJg/65WupGNN
         60jgOMQwj6zc9SydfWckHhD+cK+ARfqbMrPInfdu0AlsF3qrpYmRgc31z5AE1Nnx8OjF
         SgNtSFCmnuOnMZ4m9R1AFOHw6ntexM2w8nRiTaC/Hr/nRLu6rwpG6rBCbnJZF1Kn06Ig
         1Hyub3t+hCFFF5Ddf+vBYiHjiZCvHwIdH40tHbtqL4Srvd7cky2DkOFrqxJdPCOd5EaI
         N9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742478310; x=1743083110;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FagdEAnJg8/2m5qmwT7Lhx+0rk880BCemP1xM7z1ZqU=;
        b=KSMGLZRgoK/MGgaQlLGL5EuR//knic7qEMyH+5L442hAzce05er6YajUtkO8ebx747
         wMH6VyG2gGiRqNAUmO9iNPxGOSTJRZX0hjbs5qI71Z8/DgKHsbOz4jurXhQC3pIiSqcQ
         fwtRaSBwW8on5UCJdmqSEdUd5FCoX+m0kig/skROFQ7OitdgveOYOEbtEjQTJqjYB/br
         Jz7ofYMjzcFmmyMPyEfrvafY8NSca40BhOB/9uJTHv9xptWP8T7ea/v5PsToKUwDkMDL
         GTgz27AIZs9rkghmdiCIqKmLZl+wiXQ0XLyazcVt/+PkD2NlHDWL9bRCTUjjHeUvIVUZ
         3BUA==
X-Forwarded-Encrypted: i=1; AJvYcCXzO9QF1M0D1Fkq0XkoWglDFMtsY8yXt8yPeI6mCiGnLLQs3mslR4gG+x2uGj+T7Z/yjrDUF5I1dYY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzktYNAG/T+zzya/xDQBcaWomb+VR61HHdXedT1/IxXXxzwjkDE
	QKe+vFvQjePkhhY0rIByCKHD9KRzCxoo89B05pHyKFLbDPAdYT+linXqJe2hqA==
X-Gm-Gg: ASbGncuRj2Cn1+RfLPuafaTQsgSRJ+0LSb08pAzrUafIZd2UuQInk1yVlc/LC/29ZMa
	H0o15bFtl7rb4i32M33qOylJxK/uV6wBDp+pkaMrPXbdDb6csoy7V3ExzlxQ0EwvKEyhTLCqNc5
	w6uAoMpdhSk19dbjsCVEVUQmQMGzll8kA+GqEJ5lKc/mmR3kIR/1J1c3DM6XB0feIukqA26wqRt
	Fz2ZTdlKY8UWdbB4cQdW3RJ6SWExrWEiQcsaiggBLnz1+ULHL3fD4uhGANIR6S16QGNS8QFhvvg
	fumB61iWXPkMo3RmU0Rl0+O8M23SHO69ehIeZXk8NigsdYIpcMT+oAO5zH8S6ZvOUas+CmeKI0+
	h3kZrKvUrnFWqrsBlhbVpui3/XPyovQ==
X-Google-Smtp-Source: AGHT+IHN7yQbpy1NcvZT4kMTNBnPWgqhX3c31EFkDZEx58rzmnT/eO8+T0DKjy4dSP4NIq60tGwkug==
X-Received: by 2002:a05:6000:1a8d:b0:391:23e6:f08c with SMTP id ffacd0b85a97d-39973b0576cmr6534539f8f.47.1742478310193;
        Thu, 20 Mar 2025 06:45:10 -0700 (PDT)
Message-ID: <36ab0870-52ad-476a-ae9c-20ea8ea46066@suse.com>
Date: Thu, 20 Mar 2025 14:45:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] process/release: mention MAINTAINER adjustments
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6cc3adc1-5d54-4880-b3f3-2f688c2f39fa@suse.com>
 <b11d8525-13b4-40a0-8e33-b37c7e0d85a2@citrix.com>
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
In-Reply-To: <b11d8525-13b4-40a0-8e33-b37c7e0d85a2@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.03.2025 13:47, Andrew Cooper wrote:
> On 20/03/2025 12:12 pm, Jan Beulich wrote:
>> For many major releases I've been updating ./MAINTAINERS _after_ the
>> respective branch was handed over to me. That update, however, is
>> relevant not only from the .1 minor release onwards, but right from the
>> .0 release. Hence it ought to be done as one of the last things before
>> tagging the tree for the new major release.
>>
>> See the seemingly unrelated parts (as far as the commit subject goes) of
>> e.g. 9d465658b405 ("update Xen version to 4.20.1-pre") for an example.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> As can also be seen from the referenced commit, the document already
>> saying "drop any references to the specific commits, e.g. date or title"
>> hasn't been honored in recent releases, at least as far as
>> QEMU_TRADITIONAL_REVISION goes.
> 
> Oh, lovely.  I wasn't even aware there was a necessary change like
> this.  Also, I haven't made as much progress rewriting the checklist as
> I would have liked, so it is probably best to insert into this doc for now.
> 
> The qemu-trad comments I think we can just strip out of staging.  We
> don't have equivalent comments for the other trees.

Right, I was wondering what else might be stale there. Yet then I wanted
to focus on just the one issue that ran into repeatedly.

> I'm not sure if it's useful to delete the check-in policy.  I think the
> note at the top listing the backport maintainers is good enough.

If everyone agrees it should stay there, so be it. So far no-one complained
that is got dropped from stable trees. Personally I find it too verbose for
stable; an abridged version would do. Yet it's pretty rare that stable-only
patches are submitted in the first place. Plus the entire contents of
MAINTAINERS is frequently stale on stable branches anyway, so one needs to
go to the master branch one anyway for up-to-date information.

Jan

