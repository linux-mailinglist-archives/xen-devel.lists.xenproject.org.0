Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F2984CBB0
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 14:36:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677558.1054218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXi5o-0007iD-Ud; Wed, 07 Feb 2024 13:36:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677558.1054218; Wed, 07 Feb 2024 13:36:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXi5o-0007fi-Rp; Wed, 07 Feb 2024 13:36:00 +0000
Received: by outflank-mailman (input) for mailman id 677558;
 Wed, 07 Feb 2024 13:35:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXi5n-0007fa-2H
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 13:35:59 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2a1add9-c5bd-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 14:35:57 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4101fc00832so1611715e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 05:35:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z12-20020a056000110c00b0033b4ebc3c8fsm1328999wrw.2.2024.02.07.05.35.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 05:35:56 -0800 (PST)
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
X-Inumbo-ID: d2a1add9-c5bd-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707312956; x=1707917756; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6Ge7Se7yqBn7izxaE/vDZCmzRLyqnuhDzqa6J3Ad+rE=;
        b=auYVzOQCqjtSlhRP/NN8jqe5eJsWJqQybLoi9XtgxZQW17ZU1nxF8ppK6xyxCQTYVs
         4ZwoFceyhuH0djo9yDV+kjcgwuA8o8o0fy10Rns/2FXTJnC3eQhaDol37E43ipSEzDFP
         u/L29yQlAGUBs/2RRvJ9RFUwDRjbtBYdWYePinwEB3m1peX/ol1mtocQN/JZwcK+JiqY
         AW2qQ/PevsvgPx3a1cVhXx5gz5IYQ6rT3+FXWiwYG6N6w2/TKDsMuPsjil0wN4929cIW
         rZDzMGvRToNo4udW5tsbBLjJ4ir/iyyo3Wh+8EEvO/uJfLqLkFrw/IVpCqsb0l0tJV5N
         JPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707312956; x=1707917756;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Ge7Se7yqBn7izxaE/vDZCmzRLyqnuhDzqa6J3Ad+rE=;
        b=EXEPE6oUbOh/FA6rBDP79ZW5Qtl182ecMwWgkJ3g6qUxrvznv1B2KK2ERTnqwND4C8
         G7Bgl3PapIEz1Wlsu4mARzOGoj80noehbJmIXwyaLh/YN0xj2XbikyBjPFLxrPMcQ5V/
         WA0kYYuy65eBqSSah9aoA2T93PVzkaQlDExLAfsWlaCWgG+unO7J+yR5xVLuqWE8PrZz
         oZJpBWtxLy3IajBIo9r3a4q6VpTPQVzVMN+2PDcFP6Ystohl4AbQ6kAMZ10uzslTkMsn
         ssVa3MFZoH4zA/aybiDCIZzSIbV50/jJyWI1aoSs2pMt8sMdwGqg+/icg6QbL4T5j6V7
         3saA==
X-Gm-Message-State: AOJu0Yx6lgjGHrUqT9yHyrW1zLM0VCDpCACtz2Z6juCAKY7i6XszWzTL
	eoT+5ZdcSuvIzEzUyLQLitYFWEfYJxIab6IHY5XbtWpPtVPRShX9yTQLZ0QRvH1WFKN2HMISaQM
	=
X-Google-Smtp-Source: AGHT+IF4zhlpSrmemj+UxZjn5oYwYy1YVpD3BmS8329z2l7ta/Ap8kUijS0TEYXCD5sRz3t6lWlvyg==
X-Received: by 2002:a5d:5963:0:b0:33b:28e0:e09c with SMTP id e35-20020a5d5963000000b0033b28e0e09cmr3420394wri.61.1707312956517;
        Wed, 07 Feb 2024 05:35:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUORpMt9ryxusJTp2j1gkDjQErVyTJQLGNbSk9Nk6TZNcdSdBhnTzrqfFUJglTQiwFaqbCmRea2prYQDVzKagPQa73tc29Vbji1DoZEySzRkWpXbmDff14JbRx2d35PuZ2D62JFBB8s6u3D
Message-ID: <54e8944e-b22b-4134-862c-ab9c16ce18bb@suse.com>
Date: Wed, 7 Feb 2024 14:35:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] (mostly) x86: add/convert entry point annotations
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <3ba82c3a-ff95-43d0-8672-a63b23bc2cdc@suse.com>
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
In-Reply-To: <3ba82c3a-ff95-43d0-8672-a63b23bc2cdc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.02.2024 14:34, Jan Beulich wrote:
> 1: common: honor CONFIG_CC_SPLIT_SECTIONS also for assembly functions
> 2: SVM: convert entry point annotations
> 3: VMX: convert entry point annotations
> 4: x86/ACPI: annotate assembly functions with type and size
> 5: x86/kexec: convert entry point annotations
> 6: x86: convert misc assembly function annotations
> 7: x86: move ENTRY(), GLOBAL(), and ALIGN

Being the cover letter, the title was of course supposed to say 0/7.

Jan

