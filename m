Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 148B6ADC643
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 11:26:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018017.1394928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRSaY-0003AX-3G; Tue, 17 Jun 2025 09:26:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018017.1394928; Tue, 17 Jun 2025 09:26:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRSaY-00037h-0D; Tue, 17 Jun 2025 09:26:42 +0000
Received: by outflank-mailman (input) for mailman id 1018017;
 Tue, 17 Jun 2025 09:26:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PKBE=ZA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRSaW-00037b-NS
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 09:26:40 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b6a3a91-4b5d-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 11:26:38 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a5257748e1so3899935f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jun 2025 02:26:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2366e7c0560sm55830945ad.76.2025.06.17.02.26.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jun 2025 02:26:37 -0700 (PDT)
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
X-Inumbo-ID: 2b6a3a91-4b5d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750152398; x=1750757198; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NQBXs3S1f+lE4mMsp0/pWt6ljKkaFfV3Jq0c27jtglQ=;
        b=U7NjN/84YkRi2K19pV1BW6ljUsowMCEw3u1/gouOb9CQUZQzmZwrrc4kU8WKFDgUOV
         880Ui3EW63YmjuIVZ+pWMh2oMoVKJg3/ddCSahC7eGJ0NwXaGtklnXM0ysIZdctihV9A
         Xd2vgoXxDD4uAOuFI+mkymIxWN0aVqmFUA3BS42XM7Ic9cJ1fI6FegU+klNwqlgNHR6N
         B03bApuySxu+4opPv2n9ZvP6x5eEP9D3irxPxOHkukd0lF0kR2SJh4F8MHwYEsx85iY4
         bknf78i80Cf7+keFQCIj6Bel8jUVFmmZD3/+gxMyDy4uhX7Hci6p/vK0hdXE9C4nDL8C
         +i7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750152398; x=1750757198;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQBXs3S1f+lE4mMsp0/pWt6ljKkaFfV3Jq0c27jtglQ=;
        b=U7zwrTptUDUXfHH+5VbW+FrS+OQMoGCzWS0DSSwbLHA9iafvvQW1VWxs4E92H9J1V9
         l1v/asxYKf5mPRw4Hw0hVK3jERtgD4hQBYy/m8f2NbwNM7RLjUIUUrpJZEOBfgIP8Dwb
         076CZ0X4Jcn26eGz4RC9UMGU1GD9NNRG8bslnm9WNOUV4D1LSqcis6UTTBXFeNNIr8vc
         aJG7R/ZIbO8DNj0GfXnFrpkSCnaxSZe4uOfEVk9jLe3ZU9pfg2ylc+7ko3kXRuJ64a4m
         i769A5Xpsa1z1/pgiZMXFcjCDvIuL2Kj3069+FXZkjwqeUGwgGCVRL+WXKe/6aJhihqN
         jx/A==
X-Forwarded-Encrypted: i=1; AJvYcCVZ8xs+ThMTj4cJGbpnWW54EP69WCx+skt6UwbH+zTPz992wi8KUFGOc2iKSS36D8O229wbeL+kP/w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywki4+SH6ty3aN7p3WfubiG6FA9bJWmRF0NbmGGoy8cEbCiAjkn
	RicjN9F0DOBxpRgaPIZbnIHBZGuYpAcYc7O0RbzBPivA9gzHzayyCg93XwgyeOevEg==
X-Gm-Gg: ASbGncvM6aofo5OsSHMjfaVJtGa4m9lBTrvJQnqBhaqFkebSuTAB37OmuzO4ENlqdhk
	0Pm3eiSFb8UejxB0UJnnO+BHFRg/miYa7buZEUuAirbR+Y7GGfk2wPKNaxbqMZu6Xe5IrpROm8k
	4mgd5JmcS9eF101LTfR0LhJy3ZSUpRyq7/UGqs1OgHklqf+oKuN2G0OKGYeQEeyhbh0dB7hNMno
	asfqIVagx42q5gtStSLfvvh3OKJ2w0fmRPIOQZb8TZjfV5ZutHfO0JRj4HfyleQaREP8n//ZENn
	yEDy1+j8d2/u/f+MdvOXcllTsNExYrD38E/mPNoSlDJbaipup1YnvGi4Fd5P4FVv3rXivzQLBlM
	Rwjlk00TzlhmBfXVQrr2Vh/ZQt+vThySgKZWJz0ohEY0iC84=
X-Google-Smtp-Source: AGHT+IEpU4zreM2vo0JIBYlGSNuiZizgwBcR2dgu8ko4jNFR6cIsS/uTnHqzDN7PYOkkC2+M+m/wrA==
X-Received: by 2002:a05:6000:4021:b0:3a4:f5f6:b4ab with SMTP id ffacd0b85a97d-3a5723a2e2bmr9641434f8f.30.1750152397611;
        Tue, 17 Jun 2025 02:26:37 -0700 (PDT)
Message-ID: <d435e26f-74c3-4cec-a2a8-b128f299ec4c@suse.com>
Date: Tue, 17 Jun 2025 11:26:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] console: Do not duplicate early printk messages on
 conring flush
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250617071940.10445-1-michal.orzel@amd.com>
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
In-Reply-To: <20250617071940.10445-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.06.2025 09:19, Michal Orzel wrote:
> @@ -1084,8 +1085,15 @@ void __init console_init_preirq(void)
>      serial_set_rx_handler(sercon_handle, serial_rx);
>      pv_console_set_rx_handler(serial_rx);
>  
> -    /* NB: send conring contents to all enabled physical consoles, if any */
> -    conring_flush();
> +    /*
> +     * NB: send conring contents to all enabled physical consoles, if any.
> +     * Skip serial if CONFIG_EARLY_PRINTK is enabled, which means the early
> +     * messages have already been sent to serial.
> +     */
> +    if ( IS_ENABLED(CONFIG_EARLY_PRINTK) )
> +        flags &= ~CONSOLE_SERIAL;

Does EARLY_PRINTK=y alone guarantee everything was output? That is, is there
no chance that early-console init may have failed? (Sorry, I don't know much
about early-console in Xen, as that's Arm-only.)

Jan

