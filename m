Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFE1A039D4
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 09:32:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866105.1277376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV50U-0002YQ-O3; Tue, 07 Jan 2025 08:32:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866105.1277376; Tue, 07 Jan 2025 08:32:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV50U-0002VU-Kf; Tue, 07 Jan 2025 08:32:10 +0000
Received: by outflank-mailman (input) for mailman id 866105;
 Tue, 07 Jan 2025 08:32:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tV50T-0002VO-LF
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 08:32:09 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e188ff24-ccd1-11ef-99a4-01e77a169b0f;
 Tue, 07 Jan 2025 09:32:07 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4361f796586so156835175e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 00:32:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b41904sm623362425e9.37.2025.01.07.00.32.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 00:32:06 -0800 (PST)
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
X-Inumbo-ID: e188ff24-ccd1-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736238727; x=1736843527; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Eo9whzbYs+xwvu152KCtyJBkghoKuUrucsSey4z13t8=;
        b=GYVZVZaRvgoqr2S4eyubG6CiJ1PLzGPAVzGlp21lKATpu7xrxP+mA+hLdzo0c3NQp2
         sjk8Fq0eNY/XnpfulPuA2jS+cReOdrhVN6ZS6J7jU4OqCo41DkTm2vKMI9PAPtWkzDPg
         8ozmSbrYe4M3uzhsjJGEUG7yRcvGIT9FToV8Djv1l7/4/SXitOE31uzhjZ0PoPFWxuUs
         los2Y+u4+soxL6u8kR6Af4KU88/6znBW0H/Ep376PB75Jc/gq3a0mmKUjwrrh2UIBfz1
         aI8xhm3Bb4DIqEu3u6bTtTkxBZKgRgh7jCEcZS2+m/qL05Scrf+p2snItLO8b8Fahl4D
         OutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736238727; x=1736843527;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eo9whzbYs+xwvu152KCtyJBkghoKuUrucsSey4z13t8=;
        b=rlaeojFsMH3JaTnq2LZenehQjEzu1HcsX0uJhkFYburiBwWYLZFMGBQwDRWxEkZbX5
         10Ma4nfKrkcEDaCFNbbmvX8xlXcAlUF40hsI+htCQWn2XE9jCv3ZE/TZrSD5KK/ISupE
         lF9alDAUBNuhpdoJFQ7akYGW8seBoUVCuDIl4moFAoQQOyxx8yMP6fU+wckxu72SG64U
         3YpwiB5eCc+P9m/tHK42KmYQQ+JL6cUA7z8RzXkZqBqYX7p8F8WApowlKWBh3VjuFBHj
         MSRCX6qRCgaZAtNNqKpJpch0gNlV/GWkuB4VUANZBxPRqqvPgW4Q1xbhDwllnHeFQW4t
         BODA==
X-Forwarded-Encrypted: i=1; AJvYcCU2bGyIQon3y7JqIlV1Ah7t9lOSy5xicpnFvoKzVLoSJfsnwie6jgPLmoj3tt7HiPvLIREExnANUfM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzWnMZg06idKTn2UFsPuwEFugIq4b/5Dw/YEfy/lxoIRepUSCm6
	6SdSHfiNcFY63fHIExHymotdHJaWupKcyhjArZWAEXTi344W+mj+mEQW1ck+9w==
X-Gm-Gg: ASbGnctywe9H6sKCb2RYfgT6c+HjwWbKSz6A1KFt3KMNzJlZcZMwL6aF+zGllyHzZC9
	seHZ/hmgxC6iClxfiP0kuHdBEdvrx/9PoT82kwv1fMxsnPRbZ+d9B5o37/bDozCVtcQGSzwKFOq
	AsRxKyOvZ/w2zTnwKF7qI5/xGfXtm71rC6Uu03jJ4iWaDeUdpNr4wLPbHU0aQV4OgSp+vQh5uZE
	MlnP8+ansDf90OoEpN4JQZNqln6obIH2PwFcIrnImN1vPzQNsOuUw4qzkFd2riTXxR8NKcFLFYY
	fjqe8e1rgu6UzRP6Q4iTCnFokHMUWslOobc1oI4L7A==
X-Google-Smtp-Source: AGHT+IGBJV+YNezSebK3u/pX0110Bvm734YnFG53U4mxY9m+GYT3OJuqi48IE1yYLLOi0d7BRp+ulQ==
X-Received: by 2002:a05:600c:1c25:b0:434:f4fa:83c4 with SMTP id 5b1f17b1804b1-43668b5f691mr498863395e9.29.1736238727124;
        Tue, 07 Jan 2025 00:32:07 -0800 (PST)
Message-ID: <9f1d070b-c135-454d-8022-12104e048458@suse.com>
Date: Tue, 7 Jan 2025 09:32:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] public/version: soften wording for deprecated
 sub-ops
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bf8cc342-52aa-44ee-8bce-ce2be6406904@suse.com>
 <0c8a13d0-04d7-4ed6-a8d8-a4423867fa3f@citrix.com>
 <8ca8ac20-a19f-49ef-9631-08cdcef854d2@suse.com>
 <alpine.DEB.2.22.394.2501061229300.133435@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2501061229300.133435@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.01.2025 23:01, Stefano Stabellini wrote:
> On Mon, 6 Jan 2025, Jan Beulich wrote:
>> On 06.01.2025 12:08, Andrew Cooper wrote:
>>> On 06/01/2025 11:04 am, Jan Beulich wrote:
>>>> These interfaces were - afaict - originally introduced this way on the
>>>> firm assumption that the used array sizes would be good virtually
>>>> forever.  While this assumption turned out to not be true for at least
>>>> some of them, this still doesn't really render them "broken": They still
>>>> fit their original purpose, and they are still usable for a fair subset
>>>> of environments.  Re-word the comments accordingly.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> No.
>>>
>>> The community voted and rejected this opinion.
>>
>> That's not my recollection of what was voted on, and with the vote results
>> not being available referring to them is unhelpful anyway.
>>
>> My (admittedly vague) recollection is that it was decided to leave enough
>> room for wording choice by submitters. That would cover your original
>> patch, and it would equally cover mine.
> 
> The community-wide survey indicated that it is acceptable to use the
> term "broken" in our documentation [1]. While the survey was not tied to
> a specific instance, it was undoubtedly influenced by the ongoing
> discussion at the time.

IOW this re-confirms (to me at least) that the vote in itself was ambiguous.
I have no issue at all with the use of the word "broken" in documentation or
code comments, provided this accurately describes the situation. Which it
doesn't here.

> If the purpose of this patch is to replace the term "broken", as it
> would seem from the commit message, I would recommend dropping the patch
> and leaving the wording as it is, given that the community has expressed
> approval of its use. Let us respect that decision.
> 
> However, if the goal is to improve clarity by specifying "due to its
> size limitations" and noting that the truncation occurs "silently", then
> I believe the patch could be reviewed with that objective in mind.
> 
> In other words, we should not replace "broken" simply for the sake of
> doing so. That discussion has already been settled. When reviewing this
> patch, our focus should be on its other merits, if any.
> 
> Based on the above, I would not take the patch in its current form. But
> if Jan is up for rewording the commit message, and focusing purely on
> the clarity of the in-code comments maybe a future version could be
> acceptable.

Assuming the above doesn't change your view, and assuming no-one else is
going to express views in favor of the wording change, I'll consider the
patch rejected. And I'll be once again left with the impression that
things are treated neither equally nor objectively in situations like this
one: To get one's perspective through unaltered one only needs to resist
hard enough to any attempt to find a middle ground. That's not a good
environment to work in, and not something I'd call a "community".

Jan

> [1] https://cryptpad.fr/form/#/2/form/view/7ByH95Vd7KiDOvN4wjV5iUGlMuZbkVdwk7cYpZdluWo/


