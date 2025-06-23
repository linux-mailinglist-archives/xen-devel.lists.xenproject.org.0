Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 223B7AE490E
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 17:45:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022592.1398417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTjLg-0003dZ-I8; Mon, 23 Jun 2025 15:44:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022592.1398417; Mon, 23 Jun 2025 15:44:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTjLg-0003bM-EZ; Mon, 23 Jun 2025 15:44:44 +0000
Received: by outflank-mailman (input) for mailman id 1022592;
 Mon, 23 Jun 2025 15:44:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H8L6=ZG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTjLf-0003bG-KP
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 15:44:43 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8666439-5048-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 17:44:38 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a6d77b43c9so1966533f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 08:44:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d83d5c97sm88299045ad.70.2025.06.23.08.44.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 08:44:37 -0700 (PDT)
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
X-Inumbo-ID: f8666439-5048-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750693478; x=1751298278; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PzmKB9FqvuYJAQpxWWb5Ye8EaU8SnNUPVvnPtQNZGGw=;
        b=TAyn7pFQCEH9XKftFRQODds0FtQZsmFWZNpy6gAbZJTDvt1naBt/+owaMx54bPISV4
         E1a/A+auUrrRtJCE6dhcFlGoBKMvDistxJaMIDSdyJDtRf+9U/jv/mYCUJEejdveP6RQ
         2H+GsQYXZazub7l8j162JemwL3fOEvEgTdojZavGqM3j4oPC+Tx0dhMQ903ZbPriHBDX
         XRvAnwL/lUinpjmOeTr9CAymWgkWwZk+eZ9RgARrPKYgFlOxy8O0Ik3yjid7K9LC8RcG
         yKxOXHOKjqERuCYWcSghxUEtyqj4sDnaqPfBVc4pJLYmJnIN6KkVSEe+htNItegEL810
         CVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750693478; x=1751298278;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PzmKB9FqvuYJAQpxWWb5Ye8EaU8SnNUPVvnPtQNZGGw=;
        b=nylH2Zm6MQiK0GKWbqL6BRgNXpYHzardv2s07PgioEfIO2Np1fPxoBLqHw7bT82Wgp
         G87XgIVQaLsAnaaHY72ujtepLugdaWg5EmOvyMypOkuMrB/Lm5Z+Y7t6hbaDaydVkm5+
         emo3eIWMR0zYCnEPtNMKwZq1XL+lMPNLe/XOEUuzEmPeGzAqTUmKgs2t533QgIaFkRal
         8uitAiAwzdnFJ6nfu/OSAbkhTK3G+7AW8kNWBIcIpZbc5lebMZLgyX7O4UsPSZGlD5+T
         dhuvxcGaqAtxyQZxnKGzmVe3YwU3qRwkG0+6p5dRcBBYWeQFYDzwAeNtd2dAQLXfwZrO
         G+SQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9jIjixs+EYzZ/UtMTXMwSVhL9TbEXci2WATA1V+WfshkBdjeEWABMFtBZB93om844oa3A4C6Aovs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyfDhRvDswdUSBP5M+PR/w/MwdyT7jyE/U4x7d31wpFh5u6kB+o
	pYExDaLNIrkTAuGw5SmLZc5N1tthtniQ3KToInlNYmTTQq/YoTCcMK4+WOjHDZq6Hw==
X-Gm-Gg: ASbGnctLb4ITohLcm8mKOsTpd3dOpZPYCyWVHwCmSz/OtddoZ24T5AOoCBWaQb1W+Nr
	+cQeXI058AjFF+emzBzXmT7qj9ELwW9Jh5/da3tNOJnA8y9yjgz8e7JdIVDa+I3ESl0ZEkHgbSq
	wvKq/1hru+q47rawsmASCVYULIKV4I/noqgB9eU5NLGUR1Br1lIhFBDXmm/HQD1VCCem9z2rV35
	mRXSEwhRpExABtjEaBV1GtBSKaFmslmQnQt29MNd5WT3mb1A5lWu2FZ6pTvgA1OC8mPLcDy1Y5Z
	5TUfrukhXKzSz0yd/YFbRP9mu7Ji2NRULlRp+42g8rIr1Gm7p3lhu53omeACBOi62sJU0wbj9S5
	ubqkfzg/ENE1wThd0jcdvdXVEdmvN/BR4+t8Zld3CB3Wph4c=
X-Google-Smtp-Source: AGHT+IFo4RUFA9ErJGxCuOwMUNf0MmoWw0FwFQIKmY5zIRTegZiPA89HlPDzTmSyTXFKF3BC7XZstQ==
X-Received: by 2002:a05:6000:41c5:b0:3a0:a0d1:1131 with SMTP id ffacd0b85a97d-3a6d12c4483mr10535674f8f.7.1750693477888;
        Mon, 23 Jun 2025 08:44:37 -0700 (PDT)
Message-ID: <942a6178-0fe7-468e-8e45-ea255fd20680@suse.com>
Date: Mon, 23 Jun 2025 17:44:28 +0200
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
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2506181757282.1780597@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2506181757282.1780597@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.06.2025 02:41, Stefano Stabellini wrote:
> Regarding hardware domain and control domain separation, Ayan sent to
> xen-devel an architecture specification (a design document) that I wrote
> previously about the topic. This is written as safety document so it is
> using a language and structure specific for that. However, it contains
> much of the explanation needed on the topic:
> 
> https://lore.kernel.org/xen-devel/20250304183115.2509666-1-ayan.kumar.halder@amd.com/

Yet even there the line between Hardware and Control is already blurred
imo. Take "Reboot and shutdown the platform", for example. It seems
pretty likely that Hardware has ways to achieve that without involving
a hypercall. You can also see that (kind of) connection in the
hypervisor itself: The special handling of a domain shutting down is
in hwdom_shutdown(), with the call to it keyed to is_hardware_domain()
(as is to be expected from the function's name).

Furthermore there it is (again) assumed that Control has full privileges.
I did mention before that I'm not convinced any domain, in a
disaggregated setup, would need to have (nor should have) full privilege.

Also a more fundamental question I was wondering about: If Control had
full privilege, nothing else in the system ought to be able to interfere
with it. Yet then how does that domain communicate with the outside
world? It can't have PV or Virtio drivers after all. And even if its
sole communication channel was a UART, Hardware would likely be able to
interfere.

Jan

