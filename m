Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFEAB2B9CF
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 08:46:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086342.1444524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoG6P-00058e-2j; Tue, 19 Aug 2025 06:45:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086342.1444524; Tue, 19 Aug 2025 06:45:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoG6O-00056q-Vp; Tue, 19 Aug 2025 06:45:48 +0000
Received: by outflank-mailman (input) for mailman id 1086342;
 Tue, 19 Aug 2025 06:45:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm9j=27=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uoG6O-00056k-4Q
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 06:45:48 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22cbed28-7cc8-11f0-a32a-13f23c93f187;
 Tue, 19 Aug 2025 08:45:46 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6188b654241so8782206a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 23:45:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61a75794c43sm1154145a12.41.2025.08.18.23.45.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 23:45:45 -0700 (PDT)
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
X-Inumbo-ID: 22cbed28-7cc8-11f0-a32a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755585946; x=1756190746; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=C2aq9uMo50s2x7Xrw+cJw7jisf8TN/Q5YG5pZubXpVA=;
        b=Nda7EaEamk4WkmBVxl7Zf4rpGrhUrfOdm/RiY0Tks/sBjMgzy2/vQQrNqT5LGtG1X1
         qop/Ura4DeBLvZvjZnvydmQhPfTUb59Rv0Gz0GvojBF0+VLs10uXdIXwelerWz+QWSmf
         30qPTyjmTfdYwZiS50EQ7BvGofhunlnx2YocO06GAxGQCraZVPeffiFqWapc69Al2tDM
         yRBfrcMOHPuHFdxp0y8P/f8uEbrOZRUY/iW0WDnDVttvSAAZzFtaLP6Tv3a3lc1U1W7W
         nkKtBVtExuTKO1LBN/Sx80k3c61gKYU1X+ZrVQdSt6vzxwXDAaU1dWbWYvzMdw+bBSdW
         xplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755585946; x=1756190746;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2aq9uMo50s2x7Xrw+cJw7jisf8TN/Q5YG5pZubXpVA=;
        b=YEjyNBxTwjnpPqRkDPO++uys5+tL5wTvbTy6olN3ksX+S7VP0xtQCDKdgSscQ3ADEL
         ruQvDG8fQFPqHlaC4H218i3hNvlCtgNAAUZMN7BjoEJKg5lkrrGZIvz85QK8npzntcX/
         bPzxIe1ZEaQjIkhhzmwTQUjD1HO2E0lHrztp9dBmHC7wBc4cbZwSAiSaEuiJFX0OF7GB
         eaWtyMvH7WaZWr8GsVl2UdVlmUobQqNu0oIFR8BDnMgOTUMNL3b0pO1uc7mD6f5V5W/p
         mvF3XxBSqCCcIdRItKbblM9733J+yO/k5XuEvYgzJHB++hrNfx5xXLeUbs4IlgSEtliP
         X9sA==
X-Forwarded-Encrypted: i=1; AJvYcCW1aRYxl0pP+18qEC6KN8ddmmAxWCLj8QfsE6PFp0vc7HUKiK6Q5P418ekv9qPorEp5k+lRvubzNb4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxqyPLtoLXNya3tr8S7+BQMZPNr311OePU5EaXrYNZa+aXpgAyx
	Y1rVrZOabQgF/dyYtOqzKxFd3pneJ8/Rs20SBKjsxvyt290Dpk29mSG6jL2JLR3unA==
X-Gm-Gg: ASbGnctRUDnQsrIhW2zS+7qSHJdVlBYIh6rEkwvqPGJO6akiE6f9UZKUABfGcF3LKV+
	2m0hNrTh2x9rglKXpwMvawYWBKfrjAcnV9dxWo2/q7Ook/qGyDl3wLS0wP7kV7P3CpIgbn9Xpn4
	nriml9CuBcmE7fWlXeDIAQMwB9ap47zTMfw/6NPy69Q5ywEvvegGZMW+3gQNEjR7ipu6VOs44ul
	ZcWmB+McFla0EG4OpDUeV85aPIjc/VQVwdhNgWaIHYb1aDt6JHwQOefBSS5Km9KpMTvJ0QASufv
	C5Y54l3YHTCptRUFpYwSOBX8vfMMN3vdab0nkLH5OoGsxQrgaQttD03Qgwptu3riUe/u7c5b3BA
	NZT0lV2mzlCjjwTspmbnTUv1b8OmFVSKBL0TUIZiN3izUnE7mTYaSEmaSPoRpMuif1mipkFeZ26
	K/QrVj/qtK9b2Fe4xYZA==
X-Google-Smtp-Source: AGHT+IF4KSp6gE9NaYsmKLOVHCe0Oc0wjLmpDt6dtlJsm8nzt2pCdSEgbd/B8ZDgM8eNkLDhrLlgFA==
X-Received: by 2002:a05:6402:13d5:b0:618:1250:ac62 with SMTP id 4fb4d7f45d1cf-61a7e6fa42fmr1191950a12.10.1755585946314;
        Mon, 18 Aug 2025 23:45:46 -0700 (PDT)
Message-ID: <cdd28b4f-34fa-42d4-a4b2-602fab2416b9@suse.com>
Date: Tue, 19 Aug 2025 08:45:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] hvmloader: add new SMBIOS tables (7,8,9,26,27,28)
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1753869323.git.w1benny@gmail.com>
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
In-Reply-To: <cover.1753869323.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.07.2025 11:56, Petr Beneš wrote:
> Petr Beneš (3):
>   tools: add sizeof_field and offsetof_end macros
>   hvmloader: fix SMBIOS table length checks
>   hvmloader: add new SMBIOS tables (7, 8, 9, 26, 27, 28)
> 
>  tools/firmware/hvmloader/smbios.c       | 290 ++++++++++++++++++------
>  tools/firmware/hvmloader/smbios_types.h | 109 +++++++--
>  tools/include/xen-tools/common-macros.h |   5 +
>  3 files changed, 317 insertions(+), 87 deletions(-)

Just to mention, also affecting your MAX_ALTP2M series: It is on you to chase
missing acks. It would of course be nice for this work of yours to not go in
only at the last minute, or even miss 4.21.

Jan

