Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D368AD3726
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 14:49:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010743.1388921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyPT-0007fv-IO; Tue, 10 Jun 2025 12:48:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010743.1388921; Tue, 10 Jun 2025 12:48:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyPT-0007dn-Em; Tue, 10 Jun 2025 12:48:59 +0000
Received: by outflank-mailman (input) for mailman id 1010743;
 Tue, 10 Jun 2025 12:48:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uOyPR-0007dh-OV
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 12:48:57 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44f46322-45f9-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 14:48:55 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-451d7b50815so46819485e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 05:48:55 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a532435fbfsm12339136f8f.64.2025.06.10.05.48.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 05:48:54 -0700 (PDT)
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
X-Inumbo-ID: 44f46322-45f9-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749559735; x=1750164535; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QVkMHdz8eFSaowDjP2uT7Oh30l/l+37j7QGCC6KJLaA=;
        b=LomDaOIR4bb/Hk+WM/ZqMbyBFOK2EHlXbbPr8Y5trehjERpmwi2NFVvPjMSG0xT8tr
         ntJizuzHqEzVwXkzbFaD3RAXTQDKUmejsIhyzR2J8IY23UQfndiPZMw9gmdSf5UCI5Fv
         gJXhs+cvZ+OanM2SKTxjHXuNRaoW9d7OGNGvn+bUf/EAToQ6LZPlLZcK9oIYA8tqC4s7
         q2bCs4+Ol0/YQ2Q3t4N/So/f1hoxL1LphFySzLjmdKF+1Zq2KgtF1Ng3Pa9P+XDkDsP/
         Rlb++GrwD5eEi44sRAGCeDS2wL/EOzaN3zpkL+dNuVEPn+yb1Io4VdRkrek9iOIIg7Xx
         pT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559735; x=1750164535;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVkMHdz8eFSaowDjP2uT7Oh30l/l+37j7QGCC6KJLaA=;
        b=pUgE/BFcwUqpgF5Uz/201NnitNTgLRujZ+cpES0IivPdnKf5OinqVsb9lbi72jgvb6
         62JC7eeIvWiB25DU8IjCKIBx9a4Yl25dESCKpiVSlhb7SYC/3eU4evvBbAah3d9dkc9m
         YOkmd1Ym+unpkBwlKM1cSTRwr2ysEjm9O8BaYIfQewlIiihl+dKgUiJlioD/+DZxHB8S
         nU+aNQK+FSV4GXjZtJDMZzFpLCxH412tsEkOnNY2l6BizfGIggv1JdKCpkfNND1a8T2c
         eCNeaHH0A1TsXMwN5VBcqRCfHfhmm2y4rDWQs/YtgQEgD4wrUNl9ihiMWTVT73TSO1Lk
         MEQA==
X-Forwarded-Encrypted: i=1; AJvYcCV8NFt+L3CkHm6A/ceSBM0FWD+r6Pkk+yzlqcTSXZaZPy28INVqAizjLDZC8sClQlRzFkgUJD8GPps=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy0zbAYU5jxkhMPSBYBSK7YqLQbP5RrzVGkKlZAkMAVTUPwafz4
	LkvQkMLwUy4JUHuvcwvj4Uh4aU9oNW/scdwvn7uqiF1J27a8OVwj6M1kd1jj1Xcxcg==
X-Gm-Gg: ASbGncsf5J1Dcyto6w5SRQyLkXA2et1Bn7Ezg66rOrDzxVwiGoBOhvAlKHp4XIHuIiU
	LSixbBhogag1P+nu/Ogt3NhtbJoEcGVAF4M4s7Mt0LVW83Oy7ZVSyRhz99PqNN7rRZFqvMS5V5h
	2KubwBMhYqDYbUTAZs9pF9oAxpanM7IyQny1UrYqUdzCMycf9sAnZGUY9N0QvbYxlmt92I6w2hz
	L0e7HQfoYLTuQORdZuQk8FcMJ2Gblr+QX+047ov2eiFwY1DiYAaCZJAS5JasaTNWL1fRXGYVGV8
	H1/BmF5Yy8TaDW++SL1vTc/yjXrW080Y8sHOThzrykyeZH5oqP1ySRU/ojlDcSg/X9hMrYXyfGu
	T9MDzO8xawK83YNFpYDvxs0WheBIVk8FugkJNZU6J4Z7Nqi/yY27S1v/npQfmKzadib4DdpWQ4+
	aU4eI2deb1H7I4+hgBe0macyNGqMxAuB4=
X-Google-Smtp-Source: AGHT+IEzqQZSchYocEd0xEEcKn6TL9V0Iu7nePF4uBGv3HcEgZOa1vpLiUTvd5YdhkE+UdNjpLv6Xw==
X-Received: by 2002:a05:6000:381:b0:3a4:d6ed:8df7 with SMTP id ffacd0b85a97d-3a531cf55d5mr15300580f8f.59.1749559735053;
        Tue, 10 Jun 2025 05:48:55 -0700 (PDT)
Message-ID: <cc661b69-9260-405c-b421-a75bdc8166af@suse.com>
Date: Tue, 10 Jun 2025 14:48:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] console: support multiple serial console
 simultaneously
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.defc562b917978814c8359bbd04f1dadba33fb77.1748182535.git-series.marmarek@invisiblethingslab.com>
 <98ff383ff2ee3dc162b2d12afaea2b3f1406d99e.1748182535.git-series.marmarek@invisiblethingslab.com>
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
In-Reply-To: <98ff383ff2ee3dc162b2d12afaea2b3f1406d99e.1748182535.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.05.2025 16:15, Marek Marczykowski-Górecki wrote:
> Previously only one serial console was supported at the same time. Using
> console=com1,dbgp,vga silently ignored all but last serial console (in
> this case: only dbgp and vga were active).
> 
> Fix this by storing not a single sercon_handle, but an array of them, up
> to MAX_SERCONS entries. The value of MAX_SERCONS can be chosen in
> kconfig, the default (4) is arbitrary, inspired by the number of
> SERHND_IDX values.
> 
> Make console_steal() aware of multiple consoles too. It can now either
> steal output from specific console (for gdbstub), or from all of them at
> once (for console suspend).
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> This was posted before as part of initial xhci console submission, it
> reached v6 (but last changes were in v4), but wasn't considered useful
> enough to review/ack:
> https://lore.kernel.org/xen-devel/Yu0XHUhsebE+WG0g@mail-itl/
> 
> Since I needed this feature again, to debug xhci console issue, I'm
> including this patch again in the series.

Beyond this narrow aspect, has anything changed in the picture, compared
to what was said / discussed earlier on?

Jan

