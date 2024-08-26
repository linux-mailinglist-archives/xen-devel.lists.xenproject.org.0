Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD7595EE9D
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2024 12:39:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783404.1192743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siX8F-0005wC-9D; Mon, 26 Aug 2024 10:39:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783404.1192743; Mon, 26 Aug 2024 10:39:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siX8F-0005tc-5q; Mon, 26 Aug 2024 10:39:31 +0000
Received: by outflank-mailman (input) for mailman id 783404;
 Mon, 26 Aug 2024 10:39:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SW9P=PZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1siX8D-0005tW-Lu
 for xen-devel@lists.xenproject.org; Mon, 26 Aug 2024 10:39:29 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7892b2ef-6397-11ef-a50b-bb4a2ccca743;
 Mon, 26 Aug 2024 12:39:28 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5bf006f37daso6849401a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Aug 2024 03:39:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c0515a9806sm5474428a12.87.2024.08.26.03.39.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Aug 2024 03:39:27 -0700 (PDT)
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
X-Inumbo-ID: 7892b2ef-6397-11ef-a50b-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724668768; x=1725273568; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mmMxUgxfSPYf6I9xFstGuEG5G/F8csIGqJgwMrkJ/ds=;
        b=MoHtUXwVCplg9fmMQS2/LevqSMBzXdiRS0EU6V8+usaTBkdALqPcjEIRTIuBmJqw0R
         Q6Oy+uojkNlLwzNObgaXfIS3RxFhk5EFc5jO7I7e6ZaH9NCTq3xYrLRFz829tjAPd9QH
         6Gtk9O5AN/XSver8BOvJ7KzkM3ztJjBlZosA4J6Iq+l1g2akU7q0u2jUvP9gMagRjZfs
         fsMDA9SDiwq8BKBZCwg8QhaN6vlZhgiZW+pvPl6B+BtKCgofFYYL8mFuFWbAyc8irSiG
         4rrUzYU1tFIjDV2sOql3Vf6wt0ZrjYvCc6OAOamKttbvhCCpgejjz+ON7nzvxQelEua0
         mFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724668768; x=1725273568;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmMxUgxfSPYf6I9xFstGuEG5G/F8csIGqJgwMrkJ/ds=;
        b=FdkzxwQ4kdWoJh3JCZ9C75KHZzHsdO7H0jpL1jTYXQN3+SLa9aAt1aZeYzSUhHCfLF
         RjLPN28+PmxcBpYAsE93mDHM1roihHgDCNQEfJzjBQMcTX/LeMb0Tz/9Jpoeru9znvZP
         +iA7lFu/LZmk3lnb48gyeBb5ijBCPbR0FTytu5JFgivgmI3CNDRBMKr4ii1bANR2eVZ/
         psUxHFaZacur4/uJvxuUI5q+c+kArqz9/PDcaK+nXMg4liW/v1MMrE4yvaY19ZpsxaHh
         Xbly4dGK4+6ozWDRjuR2UhgqTEjBhZdc30s8N2ygGGBWb97XyX2wrx3fJ6ipjN99OmAV
         uXnA==
X-Forwarded-Encrypted: i=1; AJvYcCWCX520STHg1r5jgUwsYARcY0PCUwkeAG4xHbmrWgI9h/igtSk9jI3xN4B8JTRAHk2SyOwQhplnIGg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQaswK/7rvyZFQXhiAzZdppR0P9r0YLtFi6kmTnPBjmHt/ka7X
	WJh3jK4Kfaj+eXfTUGNbVus4PrY+gd/7XooAqiAENZPWLgNO0QKPmy5fr24THPLGLPWfG5eQpnA
	=
X-Google-Smtp-Source: AGHT+IFuN+PZ9Dz2pSkaJiUNbyiWf5XTPhwKhNJet4wUqtiILTcHM0WXgNsmEqRrx/NShirVH5CE0Q==
X-Received: by 2002:a05:6402:2691:b0:5be:fa76:55b4 with SMTP id 4fb4d7f45d1cf-5bf2c069128mr15447591a12.16.1724668768134;
        Mon, 26 Aug 2024 03:39:28 -0700 (PDT)
Message-ID: <8c6599fa-22c0-455e-9d6a-51b3bf3d24b3@suse.com>
Date: Mon, 26 Aug 2024 12:39:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] xen/bitops: Drop the remnants of hweight{8,16}()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240822230635.954557-1-andrew.cooper3@citrix.com>
 <20240822230635.954557-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240822230635.954557-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.08.2024 01:06, Andrew Cooper wrote:
> They are no more, and won't be returning in this form.

And what's the plan? Use hweight32((uint8_t)...) in an open-coded manner?
Not overly nice I would say.

Jan

