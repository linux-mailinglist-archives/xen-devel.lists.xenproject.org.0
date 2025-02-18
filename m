Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF2EA39DCF
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 14:45:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891422.1300460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkNu5-0002NJ-O7; Tue, 18 Feb 2025 13:44:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891422.1300460; Tue, 18 Feb 2025 13:44:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkNu5-0002Kp-LQ; Tue, 18 Feb 2025 13:44:49 +0000
Received: by outflank-mailman (input) for mailman id 891422;
 Tue, 18 Feb 2025 13:44:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X4Dy=VJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkNu3-0002Kj-TZ
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 13:44:47 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 841f3c64-edfe-11ef-9aa7-95dc52dad729;
 Tue, 18 Feb 2025 14:44:46 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-aba868c6e88so631850666b.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 05:44:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb9de73d1csm356626366b.140.2025.02.18.05.44.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 05:44:45 -0800 (PST)
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
X-Inumbo-ID: 841f3c64-edfe-11ef-9aa7-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739886286; x=1740491086; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a6lkndWmlTqOYtjwmAomI5r7H1IbesB69ghHcPWMbFk=;
        b=SF9JK4yDyfQNwGc+Y0Su8lqEJOs1CIm5U5rUads1S0p645SJUBFijTwtqms7V1wsiM
         FwVGShCVljN5tkOYbdsQ9GnXImf4dTkYBtZhQBg+eMHPEgDqsMqOByFOxgAGQ71rIOEu
         vbnYcO8pUs53wyEr67sFlzi5B0mDFPH9qhYu3hHlXGblqf0cXl0gs1rVT+n1bKXfItnd
         opv0w7dN6mNv20lt81lyKDE0mkVmczMHGEeUKMK3o3Ci+1TRlU+1OzeQHvBT/B8PmlFy
         9gkOWsJazZZoDjibidPzyuMTyMGgbLdPjOKUuD8k2quneI3YcIkB7XG2cDNBVrxheBnQ
         xnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739886286; x=1740491086;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6lkndWmlTqOYtjwmAomI5r7H1IbesB69ghHcPWMbFk=;
        b=e4Qi1AcQrpaIiSUQML06bVBkRCiqvp1HOSHx8BzTMXtC2ZsxclKb2iVB7LSN6g10JH
         PVW7Iur2xihS3rDvmF3cr7pGhSbllYrrqqfJnLyJ/gXNMexxKFNxjPVt8KqsIHv6NAyo
         jc6vNwyJ1+AYYXOScgI7ABb4tf6wmVA+Hfu4QqC1R3AVoDtj2uRKV0AEjDK9vhwoCd/t
         8j3AVAD/QIH5O4/EDkx12tFB/ssgg3Trh01MuxpzWrbVM3dlMqDt9c2ESluZ75Xq2VJB
         bkTpmoe0fGndqgwd+G4uj2T8tj06ZOnAncNqTcVzam+7b8zjc3ZmAaAwvg1R35y9Z7Te
         OGHA==
X-Forwarded-Encrypted: i=1; AJvYcCUndoNR2M1Y/XZyVcwHmHz0gb6jQ78H4QG8ryTCOTW3TnC1nJMki/lZJdAqUJYJ+Vjk2Y3/LeQhmhY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxqVJ0jGTdZz5+D920z9BnVeJFNzyUMXY7C6JNqZQ7PeHNsYtBW
	pRwbMjfLq6P1yvuw7S0EvJi7vjo7HYeq6JB3UpzewyF8Fl3C2dusc7lnJbkIiQ==
X-Gm-Gg: ASbGncsNyusKZusUQnfp47u0aTxkbCDul/I7oWNxYeR6GyZBQ6kl1H9LBAvCnduIA1o
	M61zGso6vppTGM5uz3JKDqZylJz0VjzMJKdnqzjCcLcktsIz1+EcTGoCFneIdldaUa6rNKHGj4H
	hiv9KV4HjkP/G83UtSZHdNuDeTjFlmXigIRIkz5B1+DvM/1zyQGvIW9Fph84I9XIXSuSHy4HKuH
	XIfdpNJWNfLVRfRfjdg1DqLXrpBtP15Ky0OwTMkVj6LJohbdW1jvhKlxbN63xJ0mV0ELSr4KUJc
	F5pd4iGiyhNQzqhwC55sOJcrBr0AJvByjnqWwe11g20pS/H5m5ivKDtc5Xveqj8sgY+tYeHRlSg
	K
X-Google-Smtp-Source: AGHT+IGNfQ9O0MQwTPicIuC8AFtqjTFgm7S+pmKMKGZGyHRnQ6IYuimlh4nwWK3IOisvlgLx7EEcWA==
X-Received: by 2002:a17:906:c154:b0:aaf:74dc:5dbc with SMTP id a640c23a62f3a-abb70bbe128mr1564509666b.29.1739886286082;
        Tue, 18 Feb 2025 05:44:46 -0800 (PST)
Message-ID: <eeb91fb4-ef2e-4f07-a1b8-1812f0371113@suse.com>
Date: Tue, 18 Feb 2025 14:44:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] xen/arm: Restrict Kconfig configuration for LLC
 coloring
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20250218095130.2666580-1-luca.fancellu@arm.com>
 <20250218095130.2666580-3-luca.fancellu@arm.com>
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
In-Reply-To: <20250218095130.2666580-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.02.2025 10:51, Luca Fancellu wrote:
> LLC coloring can be used only on MMU system,

Just for my own education: Why is this?

Jan

