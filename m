Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3812AAD3D03
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 17:28:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011061.1389365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP0tU-0008Gw-U4; Tue, 10 Jun 2025 15:28:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011061.1389365; Tue, 10 Jun 2025 15:28:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP0tU-0008Ex-RI; Tue, 10 Jun 2025 15:28:08 +0000
Received: by outflank-mailman (input) for mailman id 1011061;
 Tue, 10 Jun 2025 15:28:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uP0tT-0008Ep-UP
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 15:28:07 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81e1e13a-460f-11f0-a307-13f23c93f187;
 Tue, 10 Jun 2025 17:28:06 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-451d54214adso46144255e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 08:28:06 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45320562afbsm12568675e9.1.2025.06.10.08.27.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 08:27:59 -0700 (PDT)
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
X-Inumbo-ID: 81e1e13a-460f-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749569286; x=1750174086; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tqewLUe37tMoevGPwcE5luilrW8eHUYK8jhzkI1O3Fo=;
        b=Gpc0oJW3uM2tXKmpA6pgtyecNpRG74xNNrlao0Xl6/Tyuo7V1yMnsbP2aA1Ztnx/84
         dMkE+HbKzfSbMUOBGDB77bcGo5DXAufYih/TwB+mMaxwBG7TJln6df4aDA+UcUfyEcjb
         VMAoy9jfgHzb0eXavEubp/oSVS6rvRWo529y+SUfRX1c1SSCy90FStg9RGF9HycqW94r
         3iILapQOMyxSkVOe7zQFeHtLJMAfrkzlZhgWXqHh5q7lMsRUzdMPh0h9bt9p3ZwuukYZ
         lAdk3UyJUzz4knrqvfHJGv+PMR8yIGRQ9aTB253gJ63gE4VG4BqnTh4mLhZD9Tx3ZekH
         5Afw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749569286; x=1750174086;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqewLUe37tMoevGPwcE5luilrW8eHUYK8jhzkI1O3Fo=;
        b=eP32FjNBg3v4zvvwuuVevO47oBe42qwsvRsDGgMEnXtJoEsu9T3ytKjBYtqaD4crzc
         butuhPbSyeBG6V4hgsSZjbBnPswk8G9T/SvuRugnby0fVBc+5h+Xy/a9HRmXANHIqOay
         4vbYM0IWkipZjXVmMjwnW6rlA1rcVcrZQ7MbOEBWv7pyvAcBNZ9b87OUIqYE65+6UN4F
         gU4QRAy18r4x/YOJRfmx+o5TfPKmDilrVPaNmbtnKvJ7NMRx7PXIChOLM/+pCMfcqRfi
         l3fO5LL+Q3YBa7RJabxPpe3phtuTL3fGjbrsOmUiMCJJs8fiSWCFrntsoYwPbvad1h1x
         /rrA==
X-Forwarded-Encrypted: i=1; AJvYcCVUbslMg1/5G4Xg+yDavBGPc6n7FsxT2shs+MgPIdpcZKpH6nxOLl6szWjW9dcWDOdQ+ujwEsR9aeY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz15e8Pf2i/X8dbcvsO8/tjkUkecbmCjRz1OwmPv5pLctACe1ZE
	w5Ymk1Z4HAd1icqnrmHHM1K2blDS3YVO5x53nsAz/kowkul7Xp2j2CvvpthIY8YQ9w==
X-Gm-Gg: ASbGnctqsFwdclfR5vRaBk8tOSzCSs5ZU380qHEFVTqmEBquiQTmS5fPK+GFeBsReMN
	qJGZrb28j/6dhAsCRXyPVA89U8ZsK61EZt3Ho48E2LSwWYiVBRPYw9lUFik2aLztoAInj0Ljk/Y
	lSsrMRUBwCCZaoEPY35VBwfn1KMkYBKEvtj4yugJmNE/uHSntZXQSzbtgIyf0ABE9HJR4/WHR0d
	2hdl3PKurQWbjG2+26RPos/c2ZCw0nZ+LD7GWUB5RMH1fJS3ggMqRFK0Tpn14a4oN17wSQADoIC
	U5i2v6uyOFczyM7pIDB/H+UQ/9Skn4SG3qUO8hcntzIPQr2JxXQYYm7rbfzBj2iHj4+WlTY82N/
	WOxbaCi3N3szE6DiDpz6NMbcr4FQzqTcF6kASX65YBvx3qcOwuEqrnEcLQT/9hqoTIjBJvDLCJj
	gBcJy0I/a5VZ5/7kD0PwnRy4GDqNzgbkw=
X-Google-Smtp-Source: AGHT+IEvyOZ8IIrWwPKwqHpTUNUO2BXx9Y28dJiU7jIIBeBC5IHzVLsKF/l8Jr3+dy/CBRfPhZaq2A==
X-Received: by 2002:a05:600c:3493:b0:450:d386:1afb with SMTP id 5b1f17b1804b1-4531de060c7mr29299765e9.9.1749569279945;
        Tue, 10 Jun 2025 08:27:59 -0700 (PDT)
Message-ID: <5f9fa474-27b1-4628-8c38-bc3c779f96e8@suse.com>
Date: Tue, 10 Jun 2025 17:27:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/9] xen/riscv: implement setup_irq()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1749121437.git.oleksii.kurochko@gmail.com>
 <4f2c15a95b1fb2720ba0643f668f080e8b390613.1749121437.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <4f2c15a95b1fb2720ba0643f668f080e8b390613.1749121437.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.06.2025 17:59, Oleksii Kurochko wrote:
> Introduce support for IRQ setup on RISC-V by implementing setup_irq() and
> __setup_irq(), adapted and extended from an initial implementation by [1].
> 
> __setup_irq() does the following:
>   - Sets up an IRQ action.
>   - Validates that shared IRQs have non-NULL `dev_id` and are only used when
>     existing handlers allow sharing.
>   - Uses smp_wmb() to enforce memory ordering after assigning desc->action
>     to ensure visibility before enabling the IRQ.
>   - Supports multi-action setups via CONFIG_IRQ_HAS_MULTIPLE_ACTION.
> 
> setup_irq() does the following:
>   - Converts IRQ number to descriptor and acquires its lock.
>   - Rejects registration if the IRQ is already assigned to a guest domain,
>     printing an error.
>   - Delegates the core setup to __setup_irq().
>   - On first-time setup, disables the IRQ, routes it to Xen using
>     intc_route_irq_to_xen(), sets default CPU affinity (current CPU),
>     calls the handler’s startup routine, and finally enables the IRQ.
> 
> irq_set_affinity() invokes set_affinity() callback from the IRQ handler
> if present.
> 
> Defined IRQ_NO_PRIORITY as default priority used when routing IRQs to Xen.
> 
> [1] https://gitlab.com/xen-project/people/olkur/xen/-/commit/7390e2365828b83e27ead56b03114a56e3699dd5
> 
> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


