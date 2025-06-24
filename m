Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C66DAE5BD8
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 07:26:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023055.1398947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTwA4-0005Sj-RG; Tue, 24 Jun 2025 05:25:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023055.1398947; Tue, 24 Jun 2025 05:25:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTwA4-0005Pf-ND; Tue, 24 Jun 2025 05:25:36 +0000
Received: by outflank-mailman (input) for mailman id 1023055;
 Tue, 24 Jun 2025 05:25:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTwA3-0005PZ-2T
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 05:25:35 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e547465-50bb-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 07:25:19 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a548a73ff2so3616f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 22:25:19 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f2f9:d2d:164b:59bd:2475?
 (p200300cab711f2f90d2d164b59bd2475.dip0.t-ipconnect.de.
 [2003:ca:b711:f2f9:d2d:164b:59bd:2475])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4535eac92c6sm164145305e9.22.2025.06.23.22.25.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 22:25:18 -0700 (PDT)
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
X-Inumbo-ID: 9e547465-50bb-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750742719; x=1751347519; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JjJf1d0Da1yRQ7o0Lc9Soesx+IV28z3Sgzaq6Fkcm2Q=;
        b=M20mF8QpDq+HjpdmaunUJ4F91V5vvnWyvb+RPM7rodsLP3BTYjy225CkSXlyWnsQx4
         taXrNH+kKBeNIdnjOiUkrA55BQvrfLIUfmJ8+GNtiUVhEivhTLXb05oeZnmBeoLU0U7m
         KxqxMIemeuc+Uz5jHN0whL1PerqxPjjcgcxMBKm8LdBGZYHjj0vFqZFZAE9Xi7/0sSbC
         VBGSHwQxB4ornPgi5SjDr3mNSRbWhNVpcG68yn/8IHwbQJ80ZvnwT1OYZ/8+XPCVT01o
         YVhji0ERHAQgHJ4TZxIoglcOJI+aFzccx705JmU06k/wkBrSqcbATGfcutVMtgyfPjTx
         Xrsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750742719; x=1751347519;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjJf1d0Da1yRQ7o0Lc9Soesx+IV28z3Sgzaq6Fkcm2Q=;
        b=s5qQAJIWukX2pMfIbg0ssOVAd+Bb7flrOrnYxsEKKChBkljHtVFJplHWIOSRmfrfvc
         erv5PzN/irYXlD5LVeIyhSSypveYn/m2IV4js/zWgddmc9MJ9liv07pMmdftu4MdJVnO
         U9ND3Vf5vvrJvd4MCKssp+sog/ciJGCX4UYDDnXswe6ZDq51oD6gqKGf4FF5Wimw+XWr
         2STBcqFkTec1YJgrlyCy06bmzC0LdeTaPdQF0l8OMVJMDc3347xDJOZNSlC6RuhiFAnh
         n/WaqAgzvkkMFE6XlvlK/6QAViD/fBEM4Mh3xJZ8qLwTSIzpjshPn0/StZwNFdgUl4Nv
         GNSg==
X-Forwarded-Encrypted: i=1; AJvYcCVxEDU+hme2aojY+WPAlCwJ/OuDPcnlZq5iZbndmkC47meQW5pFXxGJ4RXqvaY8iZfJvlux6njT9Kw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyIDRRFhQ6qMU3cdYY1BlL2dU7l65IpgqLLqYYKhdrzQBxkRkgP
	X2vYTl0cJyOkXbn3KqESFw4u5d3FzrbJuzZRxE3gz3cdEsOLI4xnukDO/b/C9UfFhw==
X-Gm-Gg: ASbGnctZtWoh1KdCCXLv+fT65svbdajAKDVwwleBNvN5ZBVwtl88Qe4ZvnPWT7ETGOZ
	8wIG2svWJQnmSwXLWhzTmjwIen87VO6HuZBmPzBbPiq6nZb43F6fpZwLMdDGHjCK3fRJTSJLLOV
	doXnODuUvkw4Mi6lRHzUgX9mBDcdvQqWiQJqPx4iDxcTa6pBjNP8eOopY9Ck8XCd/jRXw1toF8D
	74hkRCv19QIDqx6bD/7uygcR2MCBPmFoawTT0WeEyVJWAlZxsKFjbmT+1f6/QS0TbS/AlYToA/l
	llsDeRuNKnFM1CQOwMScV1S/Zee3l2faLfi+9PVr+vfhqKX00A0pwiCN6HsDchZgLhOGGq9Obwe
	w1PfRKP1FJ6BfO99545gfKh0z3nbbuTmvmFuNMGRT1WeFl9qifv91mWfvGw7aMwnmB39O+fdxri
	7SAM9772ShESvXxyJgkg==
X-Google-Smtp-Source: AGHT+IFGTtl98d3mU4ACsFuXa5aFZObWzRC56aiPgkmpS2yxfTvfGZpZUIhZ0Cz+4N7r3Pds/662LA==
X-Received: by 2002:a05:6000:4188:b0:3a4:dbac:2dc1 with SMTP id ffacd0b85a97d-3a6d1313c09mr8875477f8f.54.1750742718880;
        Mon, 23 Jun 2025 22:25:18 -0700 (PDT)
Message-ID: <381dba84-3108-42c8-a4e5-7bc74d5e1075@suse.com>
Date: Tue, 24 Jun 2025 07:25:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hardware domain and control domain separation
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: jason.andryuk@amd.com, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, ayankuma@amd.com,
 xen-devel@lists.xenproject.org, demiobenour@gmail.com
References: <alpine.DEB.2.22.394.2506181757282.1780597@ubuntu-linux-20-04-desktop>
 <942a6178-0fe7-468e-8e45-ea255fd20680@suse.com>
 <bc36d2c0-3b25-4735-92c7-6a37c47978aa@gmail.com>
 <alpine.DEB.2.22.394.2506231448430.862517@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2506231448430.862517@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2025 00:51, Stefano Stabellini wrote:
> On Mon, 23 Jun 2025, Demi Marie Obenour wrote:
>> On 6/23/25 11:44, Jan Beulich wrote:
>>> On 21.06.2025 02:41, Stefano Stabellini wrote:
>>> Also a more fundamental question I was wondering about: If Control had
>>> full privilege, nothing else in the system ought to be able to interfere
>>> with it. Yet then how does that domain communicate with the outside
>>> world? It can't have PV or Virtio drivers after all. And even if its
>>> sole communication channel was a UART, Hardware would likely be able to
>>> interfere.
> 
> There are well-established methods for implementing domain-to-domain
> communication that are free from interference, such as using carefully
> defined rings on static shared memory. I believe one of these techniques
> involves placing the indexes on separate pages and mapping them
> read-only from one of the two domains.

How's that going to help with the backend refusing service, which I view
as one "method" of interference? Or else, what exactly does "interference"
mean in this context? (More generally, I think it is necessary to very
clearly define terminology used. Without such, words can easily mean
different things to different people.)

Jan

