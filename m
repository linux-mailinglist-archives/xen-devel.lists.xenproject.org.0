Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74272D1D5E3
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 10:07:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202704.1518152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfwqr-0005E6-Tz; Wed, 14 Jan 2026 09:07:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202704.1518152; Wed, 14 Jan 2026 09:07:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfwqr-0005Bj-Qm; Wed, 14 Jan 2026 09:07:41 +0000
Received: by outflank-mailman (input) for mailman id 1202704;
 Wed, 14 Jan 2026 09:07:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81wl=7T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfwqp-0005Bd-VB
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 09:07:39 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 762af735-f128-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 10:07:33 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47ee807a4c5so640365e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 01:07:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee563ce3csm17095275e9.14.2026.01.14.01.07.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 01:07:32 -0800 (PST)
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
X-Inumbo-ID: 762af735-f128-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768381653; x=1768986453; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SoSh1mihD7JKrbP5TTbUqHPy+briKFo4CJwVUJOJJSs=;
        b=ESWZ2Q2i5wiw7d1uLbJzJxSF2sukZX1cacTUI3IbGj24/E3yAozOa7lwPmlJzYlZeQ
         Fw7WvbowOJFZEYVs9NjwIM3AOISytiL6K8fVVKlYZlpzaAYc9hsCc+xyUpYbdbkedTaI
         OcR7zeUa0WTs0CuJfmbPiWT42ukDhEQEJ9mA46BLEo67iBA0YIyOaTCX9W4sg1k2kLjM
         f6mugrpJonZnpf5wpq09/+hT9B0QpgWn+neujE8ga/NgzMqvVuDVOPgKu4lnC1rsBf1e
         zbgIA+Vn4JKhiKeX6jyGey/3GUp2bI70yRj60Lavd/F3hjHEpHZBhjnrYSyLYucmV4C3
         PClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768381653; x=1768986453;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SoSh1mihD7JKrbP5TTbUqHPy+briKFo4CJwVUJOJJSs=;
        b=j5PMdx2qy1dk3jtDnMnWKdQHAGXh83LSQmh+kLeJXwLfup0zSMKDUwyq/t8/6WAMOD
         Bs4nQGV2tVM64HXd02rMt7JYONjFALxgNSWRWK5WIrk85CMIsT/hdilTsjB76+P2h8jt
         /lRaARPWHD44R1qsFUAfnmptSckCcUJIiSJd7fzWypmf+VhUrFmK4xoQDtZevBuyelP1
         7sCK6R7l7c04NsPE1bPY8D5jbUnODI6NBkvirfbMudMExuSJ59x9GfwIG19EJ1rXxQYF
         3vz9dh4bF9idMSK8FUMjcpzMz9/FTD10gpYDbg5oQ21bkOcUVZX8sYl2IywmfuQ7wYJK
         78AQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlUo8gkI8/VRkv2JhAPtEBrj6vBTivM0SaVMz611hOfw454SvTIOrOKeRATaMt+wcSyy/w0jRS1Go=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZfEaInnr9YLpWDr9g4dcYlFKIuVxtDJ2QFdYnKRaWjLchntKj
	mqE/p+ujXbQ91yKbzVt8PCXfW8fi3aXXt3FS/5kuowP2pXuXLniUpS3pn99xgdGeIA==
X-Gm-Gg: AY/fxX5gvj7pNEkjRTemXmwKtBOVL43+ERMmyM3bpZW3MeZweP/mVPGIbDB+XgjkbWC
	Z0PRGMtEzEUQl7NS4jiuLqNm2TKf7E4cy9Vsn0aD5HYmUQqvyNjADV4AC/TCJxBKx2py+MH+cll
	zaKEh7PMn9G1oLKAi8lf06xzu+ULC1XxGxrjjaCS5K2IaKBTzYrbd5bcpOum7Ub9nduZLEk0yqi
	r9Pu45stKryBJZAEKB9/KBgn2lkt7huBcRDcMVjE10f2yqeYvepfWTBdQy6MxyNzKyfMM1xd811
	AMqGR8bFMzu8q4TZXKVX4zKxnn/KeDygWAL5sqsLT6PskuyWFXsBY5MRKIMRFmuWbqyjuaElKrH
	l73Lvr6iEGEUcuv5vW+SYP+KHF4nDkDSmFNEgs2PlXhVxc0hbPeiIIlZiC0+vU4N/ybXN8dqeSi
	55PbDDd3eJuD+RrJEZSgEGfmS3xE9kpiNnwizS+suS/BJQ/nfcNPsosEtj3q99M7hrEGexsEJu7
	a4=
X-Received: by 2002:a05:600c:a46:b0:47a:975b:e3e6 with SMTP id 5b1f17b1804b1-47ee3371a0amr22137465e9.18.1768381652752;
        Wed, 14 Jan 2026 01:07:32 -0800 (PST)
Message-ID: <d0f8a1eb-6aaf-482e-8e86-4435265764fa@suse.com>
Date: Wed, 14 Jan 2026 10:07:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/15] xen/riscv: introduce sbi_set_timer()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <84cf8fb2331614c6d0cc6e9030571f42bfc6d928.1766595589.git.oleksii.kurochko@gmail.com>
 <de975e5d-4df7-4dee-9edf-400e5287cc82@suse.com>
 <5f658f5b-1c22-4bd7-9f25-f89576d5003e@gmail.com>
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
In-Reply-To: <5f658f5b-1c22-4bd7-9f25-f89576d5003e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.01.2026 17:33, Oleksii Kurochko wrote:
> On 1/12/26 4:12 PM, Jan Beulich wrote:
>> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>>> Introduce pointer to function which points to a specific sbi_set_timer()
>>> implementation. It is done in this way as different OpenSBI version can
>>> have different Extenion ID and/or funcion ID for TIME extension.
>>>
>>> sbi_set_time() programs the clock for next event after stime_value
>>> time. This function also clears the pending timer interrupt bit.
>>>
>>> Introduce extension ID and SBI function ID for TIME extension.
>>>
>>> Implement only sbi_set_timer_v02() as there is not to much sense
>>> to support earlier version and, at the moment, Xen supports only v02.
>> Besides this somewhat contradicting the use of a function pointer: What
>> about the legacy extension's equivalent?
> 
> I think this is not really needed, and the same implementation can be used for
> both the Legacy and TIME extensions, since the API is identical and the only
> difference is that|sbi_set_timer()| was moved into a separate extension.
> 
> Since Xen reports to the guest that it supports SBI v0.2, it is up to the guest
> implementation to decide why it is still using|sbi_set_timer()| from the
> Legacy extension instead of the TIME extension.
> 
> I think that I can add Legacy extension equivalent but considering that we are
> using OpenSBI v0.2 for which Time extension is available it seems for me it is
> enough to define sbi_set_timer to sbi_set_timer_v02() for now.

Feels like here you're negating what just before you wrote in reply to 10/15.
IOW - I'm now sufficiently confused. (Just consider if you ran Xen itself as
a guest of the very same Xen. From what you said for 10/15, it would end up
not seeing the TIME extension as available, hence would need a fallback to
the Legacy one.)

Jan

