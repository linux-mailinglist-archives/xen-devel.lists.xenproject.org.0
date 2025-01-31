Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5558FA239D5
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2025 08:14:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879888.1290098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdlDi-0007CD-TN; Fri, 31 Jan 2025 07:13:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879888.1290098; Fri, 31 Jan 2025 07:13:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdlDi-00079o-QD; Fri, 31 Jan 2025 07:13:42 +0000
Received: by outflank-mailman (input) for mailman id 879888;
 Fri, 31 Jan 2025 07:13:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aogm=UX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tdlDi-00079i-67
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2025 07:13:42 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e55e3abc-dfa2-11ef-99a4-01e77a169b0f;
 Fri, 31 Jan 2025 08:13:39 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4363ae65100so18021275e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 23:13:39 -0800 (PST)
Received: from ?IPV6:2003:ca:b741:f1d0:3123:f9e9:b484:6874?
 (p200300cab741f1d03123f9e9b4846874.dip0.t-ipconnect.de.
 [2003:ca:b741:f1d0:3123:f9e9:b484:6874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc263f0sm81274495e9.9.2025.01.30.23.13.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 23:13:39 -0800 (PST)
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
X-Inumbo-ID: e55e3abc-dfa2-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738307619; x=1738912419; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ttm6v3FBTzieJ8SUVLl/gOL9EjbKAxhp9vbmf+0aYqQ=;
        b=D8oeB0EJSiKeqinfA9guplHjSNQM9Fc1aT2CV6LJHOSf6r+fpsaE78frpAWkuZNoV8
         IEBvHpSatNEkU3R65jK9WBTVfuIiqbwM5R4IRYKIDbWExvf+EaP9GnZknIrFXjumjQVF
         CW/4hfKLeKpJE9zLn9osY3Gun3H1hvJ086IGpR9VzxM7jmWNtgeFQcJLXG3EobWl5XNW
         uHcwMYOb+6dshMfaKHLGIg9mKOzuBpI9/KW+i+XiGrsTM47CGqL7kahq0T78ejyqLD5m
         GdvDdGbgAW4f+ai04Qbv9vf8/KzeQjtTgB4F7raqxAeXbqY8nMGqmPiwxnA8cf/j6J13
         TW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738307619; x=1738912419;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttm6v3FBTzieJ8SUVLl/gOL9EjbKAxhp9vbmf+0aYqQ=;
        b=o9sTdYZFp9tTdP2WbheinwKQ4qNDX4kKdyXVjLOhgXqpNrqQMPa1ACj5q+Hf1+MVq/
         siIoYJ3nRXPzF0mgJcGESDIdipVl+M7zg7v0eHRBVI3u30xQ8BPvBEWTu2sixVDrkJQ2
         7tsZgho44Xrz6e/GKyFFaK6WyZUXO5hQwte6KRMvydeHZGDY1rD8yTu2WL58yRLqC+pz
         M4taKizS7wGsuFbqZ03npPQCEuP0nEGPk2eMsoBjDkHWXXTLdtG3hokxf216A5Z8W6HO
         KaEwH/5xS1cxWOfUEYcV3/Sdtc1YTysmVeJzQpE32KKBs34Jmy68IPTTlsTR7uy686wP
         LyZg==
X-Forwarded-Encrypted: i=1; AJvYcCWYbdbqO/JnLhHPRuW2qHNEKfSPu6JOBsvY9a336s1FjsOv6E25/pVXbveOluovIvvuWKgUQaOc2HY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwsUKpEYECSpujajkBVfwmD9FlmnrydOhT1YNAhdzbp8GZ1eii5
	be6UVOCcgYncHrCCY+zlWvkxGn7PGGtg1KCVHUKZUd1vZ5BxTH2qa5JxKhEphg==
X-Gm-Gg: ASbGncsV0Bcyue+5k9vA4SYigWks2m//n6ncglAH5ke4nJLCBkA7DsrvqdTesZkmbMo
	AXOc7KSagK692DncExpiztpYZxgn5SPth1MGSjztQnvVb2BrbxcGx661ntfiwARP8lNb44PR9Kx
	e+zp1SYkHAxZXcWAm3L3QJ6y9Qg+JXL/suwt/9ZkKHjHrCdBopqOyiVtJoCztu3C1HFe3as77w6
	T/JBKgme7NoZAMWA2bT34dzRteO49eWkL4zh6qxYJUTPujvzSLiAY1VNpyL+hC/rrzzNMuNSwfu
	UZfT1gmCGYTxWhjSLRJDGez6jjpY/fbp1THF+fCMDH94/eCnwj5uj+0MnhiriZQBCrVZkqQqOZy
	SisnFhtERFbs1VmhZAmAz4HUNlPmjGXNy4Oy2uU6PtIwB5BEnCw==
X-Google-Smtp-Source: AGHT+IEoTJGWaLKWkydMGgIgEhmfdAzAaGkqn+yNFFfgssg8dqdbKs4HRrJ/OFxj8N4UVjVlH1OMEA==
X-Received: by 2002:a05:600c:1e21:b0:434:a781:f5d9 with SMTP id 5b1f17b1804b1-438dc3c31ccmr126782315e9.11.1738307619291;
        Thu, 30 Jan 2025 23:13:39 -0800 (PST)
Message-ID: <2d5b51e9-db32-4e46-97c8-2644081b7e33@suse.com>
Date: Fri, 31 Jan 2025 08:13:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Config space access to Mediatek MT7922 doesn't work after device
 reset in Xen PV dom0 (regression, Linux 6.12)
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel <xen-devel@lists.xenproject.org>, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>
References: <20250130213123.GA633869@bhelgaas>
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
In-Reply-To: <20250130213123.GA633869@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.01.2025 22:31, Bjorn Helgaas wrote:
> On Thu, Jan 30, 2025 at 10:30:33AM +0100, Jan Beulich wrote:
>> On 30.01.2025 05:55, Marek Marczykowski-Górecki wrote:
>>> (XEN) d0v1 conf read cf8 0x80010088 bytes 2 offset 2 data 0x9
> 
> PCIe Cap at 0x80, PCI_EXP_DEVCTL is 0x08, PCI_EXP_DEVSTA is 0x0a.
> 
> 0x80010088 would be PCI_EXP_DEVCTL (a 2-byte register), maybe offset 2
> gets us to PCI_EXP_DEVSTA?  Not sure.
> 
>   0x0001 PCI_EXP_DEVSTA_CED /* Correctable Error Detected */
>   0x0008 PCI_EXP_DEVSTA_URD /* Unsupported Request Detected */
> 
> Not impossible that these would be set.  Lots of URs happen during
> enumeration and we're not very good about cleaning these up.
> Correctable errors are common for some devices.  lspci -vv would
> decode the PCIe cap registers, including this.
> 
>>> (XEN) d0v1 conf read cf8 0x80010088 bytes 2 offset 0 data 0x2910
> 
> PCI_EXP_DEVCTL:
>   0x2000 PCI_EXP_DEVCTL_READRQ_512B
>   0x0800 PCI_EXP_DEVCTL_NOSNOOP_EN
>   0x0100 PCI_EXP_DEVCTL_EXT_TAG
>   0x0010 PCI_EXP_DEVCTL_RELAX_EN
> 
>>> (XEN) d0v1 conf write cf8 0x80010088 bytes 2 offset 0 data 0xa910
> 
> PCI_EXP_DEVCTL:
>   set 0x8000 PCI_EXP_DEVCTL_BCR_FLR
> 
> This looks like the actual FLR being initiated.
> 
>> This is the express capability's Link Control 2 Register afaict.
> 
> Unless I'm missing something this is actually Device Control.  So far
> I think this all looks OK.  The next part:

What you say is very plausible as far as the observed behavior goes,
but: According to the lspci output provided earlier the express
capability is at 58 (hex). Hence here we're 30 (hex) into the
capability, which according to the spec I'm looking at is Link
Control 2. Yet as said - with what you say being plausible, likely
I'm simply getting something very wrong.

Jan

