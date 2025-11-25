Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF50C83797
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 07:30:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171674.1496682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNmYq-0006r5-3G; Tue, 25 Nov 2025 06:30:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171674.1496682; Tue, 25 Nov 2025 06:30:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNmYq-0006oc-07; Tue, 25 Nov 2025 06:30:00 +0000
Received: by outflank-mailman (input) for mailman id 1171674;
 Tue, 25 Nov 2025 06:29:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8HM=6B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNmYo-0006oT-HR
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 06:29:58 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28b1b862-c9c8-11f0-980a-7dc792cee155;
 Tue, 25 Nov 2025 07:29:56 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47790b080e4so26641885e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 22:29:56 -0800 (PST)
Received: from ?IPV6:2003:ca:b70c:6a8e:d5b9:723c:3555:44bc?
 (p200300cab70c6a8ed5b9723c355544bc.dip0.t-ipconnect.de.
 [2003:ca:b70c:6a8e:d5b9:723c:3555:44bc])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479040cfe17sm11191395e9.5.2025.11.24.22.29.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 22:29:55 -0800 (PST)
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
X-Inumbo-ID: 28b1b862-c9c8-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764052196; x=1764656996; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pAsTto8XbWmgZCXr4SW0X1UuxlXBlsvyoTLz2hRYixo=;
        b=ROSBFi811jV537UeWSxR+wk11Y3qKMxK3o53FWG3G1PN58mx45xupqJodwFB3JW2Ez
         MeQYN8D0W779d1aPphZ4Xgswa6Z8ZAK50JnqYzFdicAw5ajZ9fF3rWzNNangpRPS1vQc
         jdDdOr644V4crSanngxbX4BLT1iOqkWyEUX1dOtXOk2UjAnwpdoKGgOfKbU9lkHaCLqh
         oQjVDkIuTDTjup2YzpkeVyemBL5cOSaKtx88RbGr/4MfbXgX9ukR9K6F/6B4/NfMkpx4
         AhqcRbKhJyShSkOHtocC7yxUI0WqWVq+GtLwPm5UvvGAeChwmmVPi2A1heEZUhcWiSLT
         YTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764052196; x=1764656996;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pAsTto8XbWmgZCXr4SW0X1UuxlXBlsvyoTLz2hRYixo=;
        b=gmIy9G+Cs9hPBhjlYDfFrlxrVvSrNtDwB9cmbvsKC11rUSXLiwU4SPmdCSGh3FJcUc
         mVyHKz2+ceDaPeWU4jiBcCtBfur8H1HPNEKHpzslSrP2tHGe4zSHDdZjieMdgpJ1BtZT
         3AKDUvMgSKkP5+JAwllb1RVhF8aqIN2r3zlABVf7q8zQAkjPwjLQun0lwGxfSmzxk1F8
         y6/PRA2qAZBy5UlLmtXbxGJIM9MGUaAIC3cQPRQGZuuW3zq3u0fUzFg2rh4aSIPbL2cI
         OOsl8Y9QIsIvphpXE/gNtOXT4et7W67XOS0k962h5jML0rdJkc3YzRaYD/S3X/HNYbHg
         TkBw==
X-Forwarded-Encrypted: i=1; AJvYcCVkAXDbf/9tqj1PyGd3BZUh+Fv72zFmrFkcmXVhm5GKkCMUF9tVQNzWRzWvLK0Btlid7XAJZo8nvZw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxkdjE0/FP36H86WSOUbutbiI5j1ipH9jGOFiW5t7pxOU419SDP
	T46AR9OI8XE5AIovb/daQZzEUc7qaR6chkasvVBA58xeF97SQp729UPUEUBHSn5CHg==
X-Gm-Gg: ASbGncuuXaPmXgQLrEBEu5TW/o8wUn3wVibrJ0bYMo/gugsMe/zINTSiUFMKE2pfjBA
	o+VU4/GNg5YkJDHvgVPxBXblL9f2lGddbG74+8VTDbYhevkcnxr2jWDjnCuDH6+/kNHnuJgwCR8
	2qeJ2gtY6V0i3QA2a6eT/4Nrqr9msva0JC2nnBgvNxz8qs9rJuZR/N8v1lIQDPPqAjl0jv6rMmk
	dqiJYxdREYAGlpYaF8SdlmnOcN/USkwLxa9V0a0i7/7UzJqg2P24WHjHEzPM1JVaqNcOS7HC0r8
	Xq6Y/4lDIt1W3RHeVKsXLpSoEYPeFetx0NYIXQX+pGBnVfaoTnQQ/0Lt0mGAS/5MnKt+fa/EIfJ
	6l7DLO2t+HRq85lJADu/VhmMmimbTjshRHPjlJaN+LDGW3JsdInYi4WKJqyZqrBJq6LFbLkORiI
	O7gGOJ55PmLC/+anSTvhHYyAHpvro9tGxu8j+4JNAP/j1GRl99CIIITLrvxoJuzHQC9cQnAs/Hs
	J6RbMHALC3AEOVLaTaf77S8HZMFocL38ykYp4qhPUvCP7PW
X-Google-Smtp-Source: AGHT+IHjWYu5VKDzbhDaGyIusFyT1VKaU7H8hDZHhzRCJQ7PP8pUuJZNrUVmkkPVEpiek+m8FgFeVQ==
X-Received: by 2002:a05:600c:1909:b0:477:7b16:5f9f with SMTP id 5b1f17b1804b1-477c11337e0mr147783805e9.31.1764052195663;
        Mon, 24 Nov 2025 22:29:55 -0800 (PST)
Message-ID: <9fc71bad-f836-4dbf-b076-fbcc446ef298@suse.com>
Date: Tue, 25 Nov 2025 07:29:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 1/2] xenstored: Default priv_domid to store_domid
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20251124223533.31613-1-jason.andryuk@amd.com>
 <20251124223533.31613-2-jason.andryuk@amd.com>
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
In-Reply-To: <20251124223533.31613-2-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2025 23:35, Jason Andryuk wrote:
> On a system without a control domain, a hardware|xenstore domain
> starting xenstored shows:
> common/grant_table.c:1041:d2v0 Could not find domain 32756
> gnttab: error: mmap failed: Invalid argument
> Could not initialize dom32756
> 
> setup_structure() does not get called without priv_domid.  Subsequent
> introduce_domain() calls will fault when calling fire_special_watches().
> 
> Default priv_domid to store_domid when there is no control domain.
> 
> Fixes: e5b0a9405571 ("tools/xenstored: Auto-introduce domains")
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Just to mention - unless told otherwise, the Fixes: tag here won't make
me take this change for backport, as I don't think a "system without
control domain" was deemed as thing back at the time.

Jan

