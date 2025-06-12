Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C068AD6939
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 09:37:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012445.1390889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPcUj-0004lT-RQ; Thu, 12 Jun 2025 07:37:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012445.1390889; Thu, 12 Jun 2025 07:37:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPcUj-0004k2-Nh; Thu, 12 Jun 2025 07:37:05 +0000
Received: by outflank-mailman (input) for mailman id 1012445;
 Thu, 12 Jun 2025 07:37:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPcUi-0004jw-IW
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 07:37:04 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07c7d0da-4760-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 09:37:02 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a4ef2c2ef3so584861f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 00:37:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2364e6fe4ffsm7522275ad.147.2025.06.12.00.36.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 00:37:00 -0700 (PDT)
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
X-Inumbo-ID: 07c7d0da-4760-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749713822; x=1750318622; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tKDXjh3y1KHATX2Lze2A5b6PHBxoCfqOzkkQrLCFP0k=;
        b=dRUBm9drLJ4mCjyTuPip/extZzMuwNtChERVoUOPxS9rydpCPIm843BLNvWiGHNqIk
         SHGwNY4smeJnOSxD8KZlThMOT6/QT9lXdyqsq1cZ/eFCymLk5bnlwYJCawms3bC5O+pE
         Im3cH6uAjL1IFl1+ThOPaNXtPQsB+HKOIOaalqqzrJ0B1LDbN7GYhA+BIDVaLNsPwwll
         axX41tv2mltxrWwsKUnuaqXsMtMqT9OoIk8LvLmXpSwx+iLv3u2QOxCvEepfXuE/u7/d
         +cUwfvxBoJeOUqNI/e1R6Pw1n3fLu5BXAKpq3fiEogt5AM3OU1IkdS6RKnPfmuY1iatd
         HdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749713822; x=1750318622;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tKDXjh3y1KHATX2Lze2A5b6PHBxoCfqOzkkQrLCFP0k=;
        b=ZGs5xRojkVVbrJbjRBihKj8MRsVaaThmmkcoatybJQe9NVHIVdTOxJqr05iliFVhuc
         /xLmMUHDQI2NzLAGIwjS0ttNIYMJ/CVQhnCu+vJpAbRjRE8/3bGt40GWY3hcptCn0QPV
         e+92U3/NlF3JS5Jp9QKsHuZ2SqI5Rl9DRZvxGSSDOMYsYvtPOcmlEq+vndlPPKS+wTTp
         zEpsf13NoIANKtDzqe0JOS0DAU/bRUnMjfLteB0iOqotcwuFSCHQXQYBtmbYORoktDob
         Mx/j2aiGKX/gEfrIwro+ofk1WKZ/Te97JsA94v6dVL4hYHGgk1gLxsEVe1m1H2OoRR3I
         1bAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVABCtL8GR7UTBtdQKCwFgBuGTZE1Vd3veN77rFyWSIl/VfyvfZVp/jBAYHKa69lt2L/efIZHF5JL0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzABSA7e1ZDFX0Bgy3p3h2Tna1I3G1wpKn2bqRKFTTJrdMpppkx
	CCMrt1Pw+wzIfrP5akey+qXKgiFQfk5dh/fTiJ4KJzqfK8dtvApmJhNd2y4JffGF+Q==
X-Gm-Gg: ASbGncvZ91KrvQ9eKAILCilt5+z6Gmnhzm42is5eGvpg1vi8OJdOumsx7VF1NzovQkd
	Ja56T/cHLQPiVGDN4rbNEKjxUcSRygKTMiWz8jBvIAqsGgXPppdbQ9OKLqn4XGoj749onXMmmRi
	PWmlW5RlK6YpTcQkvtKPkTd7ii3l04+lQuI2GeAjSCMSknPgkF/c6GJ1fo4gZXn2lr1gpP1aNZP
	hYTWP7FZDCV5p+4Z2q7hGBWk+8TevpBStVN8gpS5B+/VFv39WQbibvg2E+BnNwa5P8COOPSwrVn
	J+W1OD9zmv6hmoh1rGL5z0f3awF/BcBFI4NfJyvc6zxH3O9wdg7oRgdrtozplNzUa8O4RNx6dkt
	MuuerwzJzhUqreAsBJt5jT6izPRvjzCGW4DLdKrryoSTWRVw0AKYRNquZrA==
X-Google-Smtp-Source: AGHT+IFvtstEMZJvbyw4DpqNTirNHefkClEQ6PkVI+oc/Nxh+GipWw7XVCdfSZe7+tSvc0epoTrqBg==
X-Received: by 2002:a05:6000:2909:b0:3a5:287b:da02 with SMTP id ffacd0b85a97d-3a5614c1aacmr1440024f8f.40.1749713821588;
        Thu, 12 Jun 2025 00:37:01 -0700 (PDT)
Message-ID: <789e1d1d-bfd0-434f-b697-678ab5e6f912@suse.com>
Date: Thu, 12 Jun 2025 09:36:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] xen/xsm: Add XSM_HW_PRIV
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250610225737.469690-1-jason.andryuk@amd.com>
 <20250610225737.469690-2-jason.andryuk@amd.com>
 <43725e7d-cb4c-44b7-a3e5-59d8d597c805@suse.com>
 <12700a8a-a969-42ed-aba8-753ff9da9a44@amd.com>
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
In-Reply-To: <12700a8a-a969-42ed-aba8-753ff9da9a44@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.06.2025 05:13, Jason Andryuk wrote:
> On 2025-06-11 09:02, Jan Beulich wrote:
>> On 11.06.2025 00:57, Jason Andryuk wrote:
>>> Xen includes disctinct concepts of a control domain (privileged) and a
>>> hardware domain, but there is only a single XSM_PRIV check.  For dom0
>>> this is not an issue as they are one and the same.
>>>
>>> With hyperlaunch and its build capabilities, a non-privileged hwdom and a
>>> privileged control domain should be possible.  Today the hwdom fails the
>>> XSM_PRIV checks for hardware-related hooks which it should be allowed
>>> access to.
>>>
>>> Introduce XSM_HW_PRIV, and use it to mark many of the physdev_op and
>>> platform_op.  The hwdom is allowed access for XSM_HW_PRIV.
>>>
>>> Make XSM_HW_PRIV a new privilege level that is given to the hardware
>>> domain, but is not exclusive.  The control domain can still execute
>>> XSM_HW_PRIV commands.  This is a little questionable since it's unclear
>>> how the control domain can meaningfully execute them.  But this approach
>>> is chosen to maintain the increasing privileges and keep control domain
>>> fully privileged.
>>
>> I consider this conceptually wrong. "Control" aiui refers to software
>> (e.g. VMs or system-wide settings), but there ought to be a (pretty?)
>> clear boundary between control and hardware domains, imo. As to
>> "pretty" - should any overlap be necessary (xms_machine_memory_map()
>> comes to mind), such would need handling specially then, I think. At
>> the same time: The more of an overlap there is, the less clear it is
>> why the two want/need separating in the first place.
> 
> So you are in favor of splitting control and hardware into distinct 
> sets?  I am okay with this.  I implemented that originally, but I 
> started doubting it.  Mainly, should control be denied any permission?

Yes, imo: Fundamentally for anything the hardware domain is supposed to
be doing. Yet as indicated in other replies to this series - boundaries
aren't always as clear as they ought to be for a clean separation.

> We aren't using the toolstack to build domains - dom0less or Hyperlaunch 
> handles that.  This avoids issues that might arise from running the 
> toolstack.

IOW you don't have a control domain there in the first place?

Jan

