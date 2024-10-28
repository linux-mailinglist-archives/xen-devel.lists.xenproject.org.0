Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 156B89B3642
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 17:17:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826820.1241231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5SQ4-00008d-OT; Mon, 28 Oct 2024 16:16:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826820.1241231; Mon, 28 Oct 2024 16:16:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5SQ4-00006Q-Lj; Mon, 28 Oct 2024 16:16:40 +0000
Received: by outflank-mailman (input) for mailman id 826820;
 Mon, 28 Oct 2024 16:16:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xGmR=RY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5SQ2-00004w-Te
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 16:16:38 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 018dd307-9548-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 17:16:36 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-539fe76e802so5360171e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 09:16:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b713fbsm9938267f8f.88.2024.10.28.09.16.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 09:16:36 -0700 (PDT)
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
X-Inumbo-ID: 018dd307-9548-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730132196; x=1730736996; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GRuGn3bWqYxr11z7tCKu4Ew1dofU0Ncq5K3UhI2Vf10=;
        b=XWCo1RWZlIlScqGqJzkNhlc9IVPogxi/tdSi6Esoi5BlZkaQkRDF5TqDLsHPdZqnu7
         TxfFcl5WigYWxFXt24VCkrQa3+ffq/QRRzHAW1rIXk4htVtXXZVOQ6mP371b2lvgOASo
         dv0VD96FEGVRyTY19+t7tj6gHJRIJWvN7m5HiJnwCFpnX///MXVgJQ3xaU30WzuZIGKo
         9LyAP3fOTXNSNn9IfKjl6LPvnxvlL3DUtGgZ8UX6vkj/7SonkD3LSAXcFI7bjH5XQyaY
         b3mzVNQ2YdN+pox6UYnqmo8cnwYxLtRNEwmK6XGc33VJhBDwrnBzT/3QtOBAReCnp9O/
         BiTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730132196; x=1730736996;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRuGn3bWqYxr11z7tCKu4Ew1dofU0Ncq5K3UhI2Vf10=;
        b=T6DfVL7vn+QBCQ0yV5RhrnTaa2KtAURPDzRiDlRjk+RCGMNSZQPVCOu7dtbTW9CNlQ
         DdtgmGIGD0iZtA8bLZfDb1b/Ab+3fcKqgyVJikuII9DA30sJq62ZWnCUFhHLukQxDGzj
         3e08WxtYyNJP8yhFMSAB7H/tjltDABOD/viiUhnfQ2RovMEQtC0gOYQ7a7s3pUipVFBp
         6iqQE7zY202iWHww6uaGEeupxxGnF6DZQFKJd7krEZbWbx+xO9WPoG0B6/mJlC4OxlVd
         5zwQ2nZsGGEiyK0nsetDnLL3VsuFvfF8zcl19lLnOyWYVuxPt/5xVEoa5APAa6mJD4W6
         f8Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXPJv+fdo88zCD9Vp7UGRWBReBL3yl0K8HnjuzlWdovbv1FJqmbiRqOV64kwDOkZMZnxv1JfZY1jKY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyT28EX4huSHFwA1ssRcpdPFeGh7GWcVXCCKbaA5jxseo4lfsQV
	HVb/wEQFmRhzxioXDQeVR6KbX+PpTgbQjK7dH9WZ5cYjTfBk+D8m7RH8eKn+wxR7jvBlbqegs0Y
	=
X-Google-Smtp-Source: AGHT+IE9heKQJmTtI2M83zrm9OPiztW6RCer1MIC5LgWUuvqCee7HtPRXFT9VT5jVRm39gZ2lSDS0w==
X-Received: by 2002:a05:6512:e95:b0:539:968a:91a8 with SMTP id 2adb3069b0e04-53b3491e092mr3168277e87.47.1730132196320;
        Mon, 28 Oct 2024 09:16:36 -0700 (PDT)
Message-ID: <8608ca8a-3938-4027-96e7-4f3cb3fbd5ca@suse.com>
Date: Mon, 28 Oct 2024 17:16:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] x86/ucode: Fold early_update_cache() into its
 single caller
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
 <20241028091856.2151603-11-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241028091856.2151603-11-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.10.2024 10:18, Andrew Cooper wrote:
> The data pointer is known good, so the -ENOMEM path is unnecessary.  However,
> if we find no patch, something's wrong seeing as early_microcode_init()
> indicated it was happy.
> 
> We are the entity initialising the cache, so we don't need the complexity of
> using microcode_update_cache().  Just assert the cache is empty, and populate
> it.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



