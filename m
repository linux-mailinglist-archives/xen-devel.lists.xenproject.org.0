Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5347F8498CE
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 12:28:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675963.1051676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWx8l-0006rG-5G; Mon, 05 Feb 2024 11:27:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675963.1051676; Mon, 05 Feb 2024 11:27:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWx8l-0006pJ-1S; Mon, 05 Feb 2024 11:27:55 +0000
Received: by outflank-mailman (input) for mailman id 675963;
 Mon, 05 Feb 2024 11:27:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/S5=JO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rWx8i-0006nm-Vz
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 11:27:52 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9888831c-c419-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 12:27:50 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5112d5ab492so5690977e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 03:27:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f19-20020a05600c4e9300b0040d8ff79fd8sm8332123wmq.7.2024.02.05.03.27.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 03:27:49 -0800 (PST)
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
X-Inumbo-ID: 9888831c-c419-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707132470; x=1707737270; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fYnEBcBtbki/bFVmQXYCbZtWXujkOTMfuQztPIp1uOo=;
        b=U1Qrzn4BjvHfVUjDDTvTtBxcmXYpwhuLbyK1gtPsKUgNPDk9Rp+KOhza8IzgRLcsZL
         TincstJpyZgYl8mfPxqE3C15ASlSa+c1Qr9/rlAA+Q7nK9q5PchYlr+3H2KDOqxEL766
         rUhYR6kIITSfuvISAwq6kkY/T0MOS8fGJwlDBF8jAt8szg1bW5msLVEpdCzjQiWS+6c0
         SVhniXeLG6COJ2Z2abwMBpaBSpNd5F/m/oAvKxM52nVZTLmOI3U8lzDVpH5bH/TLEDCh
         EISwr1Fk2DPHIzaDma/LioVWsoU9gLSlu2witJNgu/qU0qJxnc9SrK3gvYyeKAuifh+I
         YV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707132470; x=1707737270;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fYnEBcBtbki/bFVmQXYCbZtWXujkOTMfuQztPIp1uOo=;
        b=FEQFeU7n9xFtJGHH6GGbq1mSzhuPxqjoz11VYewdi31nX1D6CZLExhR8FH9NtgLyLW
         7FhptusJFXVTVYb0kVtl8aVbZu/YLw56w+Re1rP5NZbnzK9mrpCh+5x6GK+BCyZfJQp8
         xflrQzJtotxbDM07re9Qzs04TB4XqzIZGoBounzkTmaVzolE5/B28PcggPN/UFi98mPu
         2vwUIy5yWwrafr2ZwnnkmjkHF3u2WSaef9jKghPRIrthOMHOhEZ6TIFVQgjKwGtnIBMZ
         HJayaUCFKcbn7QCOgx9WlwBOoUA9j5uWJKzPMdN+R9sa1xEuSd4vHKwz2V/thwycyXcl
         ONgw==
X-Gm-Message-State: AOJu0YyFJc5dYCVXn9aewue556RXf2hNJCcLCOmySqlPyR8FuImUp8/x
	k2bZ/hCQYzQ0KpfZh1IqrMSlEwCOddaUZYOkEJqMwj6yZjkR8V4b0LcIk7B+Ng==
X-Google-Smtp-Source: AGHT+IGDh3Y5Umv2OydBzg3FZ9m+QhkDcRk9f6GQj95jiqTPykKXhx1GVmTSHUq8ClL489xx2rcvVw==
X-Received: by 2002:a05:6512:1046:b0:510:1b51:e431 with SMTP id c6-20020a056512104600b005101b51e431mr10380360lfb.4.1707132470363;
        Mon, 05 Feb 2024 03:27:50 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVmI96vZoZDRlIMWt3+VKIN49BpCfWxW0ScQKNF3AO0X5+ekCZB4cNvEjwryzc4qjnYy+MZMKzHCWDHoMwbfMaR3d4wLxNZZ2WxxAxlsnBLcQzAahmvrJgCObBdRg+76EMhS1mAU7zMa2pzD6QKGJyPK6LchfAMLgY1B9UaLEj5nEEFNVcLZP7EjcJponO6TreZCL5+LJH+I3XHSOmoy0ySCbt8ww33hEbjUWUzChhlLuNtgQ6lNdM=
Message-ID: <d566e379-b339-44e9-8dd5-5f042e917409@suse.com>
Date: Mon, 5 Feb 2024 12:27:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] Constify some parameters
Content-Language: en-US
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20240205104504.14830-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20240205104504.14830-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2024 11:45, Frediano Ziglio wrote:
> Make clean they are not changed in the functions.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

For this and the other 4 patches - I didn't see a cover letter; was there
none? And then please follow patch submission guidelines: Patches are to
be sent To: the list, with individuals on Cc:.

Thanks, Jan


