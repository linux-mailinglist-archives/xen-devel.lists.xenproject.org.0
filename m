Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8B4A02407
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 12:13:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865690.1276952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUl3D-0003aI-LJ; Mon, 06 Jan 2025 11:13:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865690.1276952; Mon, 06 Jan 2025 11:13:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUl3D-0003Xi-I9; Mon, 06 Jan 2025 11:13:39 +0000
Received: by outflank-mailman (input) for mailman id 865690;
 Mon, 06 Jan 2025 11:13:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9khw=T6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tUl3C-0003Xc-MH
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 11:13:38 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 463f14ef-cc1f-11ef-99a4-01e77a169b0f;
 Mon, 06 Jan 2025 12:13:36 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-436249df846so98361935e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 03:13:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4366127c4fcsm572046255e9.29.2025.01.06.03.13.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 03:13:35 -0800 (PST)
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
X-Inumbo-ID: 463f14ef-cc1f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736162016; x=1736766816; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yxK4eK/LTPWWtZpfHaKPY+k8HLzEAnBAn7x/lb5fQGM=;
        b=LG4NzzZaqoc+Fz9thiPIsCMdsb0k9uYDi1DeIlAMHTIu12vLyr0wSt7pP13/f/srU/
         pXjqkJZDvly+3+7jIsuxGj0bspndhDt4o6SWsTSI1oJauNiFhlkKdX5bHvICXqHUoAi/
         nbVKASAzvoXJYgwfFGHgSfwrRcCyRJoY50yDpHpTFqOVIsV8yNsmzFU8F3SVhbJxKYk6
         hAqBOngrTcOZ2VpNoxvFLuoP3ZDpT2lEiOaQm5W1d4PfdE+QnWS9gRBYn4HEAVqcTQZI
         s2hAiTQjtAkos40eG9cXhCoe9NTs6Ijb+fvuTXJAI2u4UE6wuVG7Q6pwtOJpV+jRqyeV
         kToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736162016; x=1736766816;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxK4eK/LTPWWtZpfHaKPY+k8HLzEAnBAn7x/lb5fQGM=;
        b=cWFKjU6KR91tbWSvPYSU7h3TH09giVENqKDu8yB4h/iZs4VYOLJXDGV5TsAgksMWF6
         EdCGJm8TklOxxUchEU2pQrpIxBUMh7WOarQxrxwDwozjo6q16uOmd+mOrmEt3i3fiEv1
         H/mJL0fV6Ics7UG5ZGB2Ychp2zchyElW1I6w8kNCFx3+f4of3OoYNbmTFd0ZoDu9WuTA
         Lonfq7AHGqgsK+tDc/Jg0+XX3qjIvMsuY/VkfXGmExjC7jIIaUAUlAD8CVpd+gS3Np8e
         NlkwxB30PvHTP08CM48GDvQgUB8viLuOzwDKYSrnqKawMnLfQSzddYFs7uBafDGnTMHu
         r2pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVhfdODQurib780wIbDvmEzZHgz+PJ0bBwn3cvVi0kN4HbGwtmFqXAgdUbl/lXm/Ps6UlQl/yMCok=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6B/JZFzGppRy6ALzBjMT0obWC65iGVBIvx7eOybGS/MhxkhUQ
	wVVXveafhSst6BoC76R0NeCqVeCMA+9yJScWRy25A/qmQuRMYNGxhcq27HV+HQ==
X-Gm-Gg: ASbGncu2X2ogFBwsKm17rsX6TC4gaYWI/RvuLqho672U8ytnyrj655f8fBjXDoJlJW4
	GP0mQR/oiQm6rfuNsHq7HlkN+KWb/7Iu6vYUYGNXKXRwnfFHrxFZW+T7m/wnYr1darEZF5RQZIA
	5CFF2ODE6usn7FmEFx0XwsVsNkRKd9lMOMtcjrizW0xYZiW4kmpdjQ3nI1sXH7SNFdLYF++U3Ay
	/rWHrF/aIsmlZMTH0s5hLPYLXfGhOJ9HoYPvW7dZOQx80YjoySOghSCx+WaWr1nyhUszYhftJoV
	xNuraE06ldbP6uskKWn6KnXVbUDTtG1W41TDmDwkcQ==
X-Google-Smtp-Source: AGHT+IEVAaXKFcdJsNBb5se6jF7ScFLfcpH0wbMn1yUoPBHAGuDxKP4udoEYDL7UC2dN93hkRuTQXA==
X-Received: by 2002:a05:6000:3cd:b0:386:33e8:20f4 with SMTP id ffacd0b85a97d-38a2240f11fmr47812511f8f.59.1736162016195;
        Mon, 06 Jan 2025 03:13:36 -0800 (PST)
Message-ID: <8ca8ac20-a19f-49ef-9631-08cdcef854d2@suse.com>
Date: Mon, 6 Jan 2025 12:13:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] public/version: soften wording for deprecated
 sub-ops
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bf8cc342-52aa-44ee-8bce-ce2be6406904@suse.com>
 <0c8a13d0-04d7-4ed6-a8d8-a4423867fa3f@citrix.com>
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
In-Reply-To: <0c8a13d0-04d7-4ed6-a8d8-a4423867fa3f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.01.2025 12:08, Andrew Cooper wrote:
> On 06/01/2025 11:04 am, Jan Beulich wrote:
>> These interfaces were - afaict - originally introduced this way on the
>> firm assumption that the used array sizes would be good virtually
>> forever.  While this assumption turned out to not be true for at least
>> some of them, this still doesn't really render them "broken": They still
>> fit their original purpose, and they are still usable for a fair subset
>> of environments.  Re-word the comments accordingly.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> No.
> 
> The community voted and rejected this opinion.

That's not my recollection of what was voted on, and with the vote results
not being available referring to them is unhelpful anyway.

My (admittedly vague) recollection is that it was decided to leave enough
room for wording choice by submitters. That would cover your original
patch, and it would equally cover mine.

Jan

