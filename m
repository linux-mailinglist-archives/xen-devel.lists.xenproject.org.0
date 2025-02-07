Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1CAA2BB9A
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 07:38:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883439.1293427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgHzd-0000uj-4p; Fri, 07 Feb 2025 06:37:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883439.1293427; Fri, 07 Feb 2025 06:37:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgHzd-0000sY-1R; Fri, 07 Feb 2025 06:37:37 +0000
Received: by outflank-mailman (input) for mailman id 883439;
 Fri, 07 Feb 2025 06:37:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tgHzb-0000sQ-8g
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 06:37:35 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02a80fc9-e51e-11ef-b3ef-695165c68f79;
 Fri, 07 Feb 2025 07:37:33 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43618283dedso16532995e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2025 22:37:33 -0800 (PST)
Received: from ?IPV6:2003:ca:b741:f1a5:2584:540d:4981:3502?
 (p200300cab741f1a52584540d49813502.dip0.t-ipconnect.de.
 [2003:ca:b741:f1a5:2584:540d:4981:3502])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbdd1c151sm3531218f8f.7.2025.02.06.22.37.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 22:37:32 -0800 (PST)
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
X-Inumbo-ID: 02a80fc9-e51e-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738910252; x=1739515052; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aKrake9KF9EEOVc04w9U5bJ+nnqN90SHqd6l4Vr8imE=;
        b=HdL822jUGi7bctseVHjacrqWJsEZJ4MHlq9fJ1T1b1RVxpknmrZA6BXwbPlC+0gJ5b
         T6XplHc8m4CZ+Bg/bTmVSWkvJjl/rPTU2sRXOBjM7Eiad/jpkca9i1pENJ0RyutdrjH8
         OINU+nHzpqdRXbYoorPi9lWny666DzR2u7KFBuNO/6P4rZfOD84uqk1HrsPaTmViU7kQ
         tSoRjCa1Go+CVxe5bR5J8IMp1VVT22He859JP0g421j0PrxZVFf1kPvLAWDMqDjXuv/T
         jgbyJpgkAwg7Av6nVhCyVf5fw37foaQeZosx9OSIgVvdJ4up9DDE01tzOOzzHn86nAYQ
         uOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738910252; x=1739515052;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKrake9KF9EEOVc04w9U5bJ+nnqN90SHqd6l4Vr8imE=;
        b=FlUnkUfm4ryCCudPrn/E3lnN3SJ2DOvL9o2ty2rMakUE0JFZtkR7nlCnqtgaqV9bxX
         a5wn8sN4nlN08HjDUeZTKTiYniuSrGwrlVJEPy8h1gMbxowvJ0J6nVj+Iq3qU2jWwEVb
         wSUsuFB+KKAKHjzfiV6Jbx19Nt0YuV2ygDop158V0F/aID4QHIOoq3i4o0xsN3BssdHW
         b+8NbIrJuVmU9c9WYRvaRtUS7X+4KmT0MuoZZHyQdj03FYmsVKqLtrtmaFcfzfCttmcF
         opxLLU8lzQLA5RsEyWS+ob8VHI/aqJ5nSnvXaEo/SXf2GEe6c/JNJl4lnesWLZfJEyD6
         XgJA==
X-Gm-Message-State: AOJu0YxH/t1xbJwu0jz1MQTpbrAb991ODTo0rUIaILVAD0bjhAxllNQY
	qpCRolMl44SefjjyFSnzY0dH6IMyqbTjYUEdrm7n3UJc7Xx9o0yjcsH8D8zJ1w==
X-Gm-Gg: ASbGncv1Nt8pYxEulWsuP7ONUjZjctSTcf9wHXHUiz3CmIteeubOfwn8LF6imIiax6Z
	vDtN7oAmIUdjKriKc4imu+C2BG16SuhgRcAymNZ9HVol9aIpDw2sCbH9/jGb8H4PdXm1vzqCXDw
	Mq4YeoSwiTTRrI1KxHhNUhhPXgywGdOFIEEzPKfllS3LE6q2g15Nxcm1WJlyTIVlA58TpDiRa9G
	xcM/39xSZYKlnn7YXGXsT4u4zuI1px2L5rzc2ddJpmTWXcAxxeWYTH34MgT/WzRyTyBhYK49Xgz
	GoAtdrYOUfBZuDaZucvD/XQ5L4VFKiiPiT5vayHP1KbV7fBz2+R3EvIO8p3AOc88XzR4+nYJLR9
	vu2vlsfiR1VmkynYUES0Q5/a8xnsGNUMzT0nVGdIorjMhYkMDAg==
X-Google-Smtp-Source: AGHT+IGoc4WagoY2XmtdsjNNl1mmui2QShlgDj2X9J3uPDWQi+N7Z85cSpKwczfM0KCssF5JKyyPCw==
X-Received: by 2002:a05:600c:2d86:b0:438:a20b:6a62 with SMTP id 5b1f17b1804b1-439249c0193mr13776725e9.28.1738910252557;
        Thu, 06 Feb 2025 22:37:32 -0800 (PST)
Message-ID: <5b88a558-f5e4-44f8-94c4-4d8f3423e857@suse.com>
Date: Fri, 7 Feb 2025 07:37:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] vpci: Add resizable bar support
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Huang Rui <ray.huang@amd.com>
References: <20250206093900.1410342-1-Jiqian.Chen@amd.com>
 <Z6TunU-OESSdTIMa@macbook.local>
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
In-Reply-To: <Z6TunU-OESSdTIMa@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.02.2025 18:17, Roger Pau Monné wrote:
> On Thu, Feb 06, 2025 at 05:39:00PM +0800, Jiqian Chen wrote:
>> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
>> +                               rebar_offset + PCI_REBAR_CTRL(i), 4, bar);
>> +        if ( rc )
>> +        {
>> +            printk(XENLOG_ERR "%pd %pp: BAR%u fail to add reg of REBAR_CTRL rc=%d\n",
>> +                   pdev->domain, &pdev->sbdf, index, rc);
>> +            /*
>> +             * Ideally we would hide the ReBar capability here, but code
>> +             * for doing so still needs to be written. And using continue
>> +             * can keep any possible hooks working, instead, returning
>> +             * failure would cause all vPCI hooks down and hardware domain
>> +             * has entirely unmediated access to the device, which is worse.
>> +             */
> 
> "Ideally we would hide the ReBar capability on error, but code for
> doing so still needs to be written. Use continue instead to keep any
> already setup register hooks, as returning an error will cause
> the hardware domain to get unmediated access to all device registers."
> 
> Seems slightly easier to parse IMO (again I'm not a native speaker, so
> your proposed comment might be better).

+1

Jan

