Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0A395F042
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2024 13:59:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783448.1192792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siYNP-0005Fa-TI; Mon, 26 Aug 2024 11:59:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783448.1192792; Mon, 26 Aug 2024 11:59:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siYNP-0005Cs-Qd; Mon, 26 Aug 2024 11:59:15 +0000
Received: by outflank-mailman (input) for mailman id 783448;
 Mon, 26 Aug 2024 11:59:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SW9P=PZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1siYNO-0005CD-Iz
 for xen-devel@lists.xenproject.org; Mon, 26 Aug 2024 11:59:14 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c9bdfe1-63a2-11ef-a50b-bb4a2ccca743;
 Mon, 26 Aug 2024 13:59:13 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a7aa086b077so364619566b.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Aug 2024 04:59:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f2202fdsm659285166b.13.2024.08.26.04.59.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Aug 2024 04:59:12 -0700 (PDT)
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
X-Inumbo-ID: 9c9bdfe1-63a2-11ef-a50b-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724673553; x=1725278353; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DtA9pcQSjP3ccQDJR9MjGjGBKy+LEPAenXNB5h2lMD8=;
        b=O1pT68MiWY2uc1fT0g77bH9GcroY6WKX4HMYDZP+C6h9y5BAul+ZAY5a+L1tCrGp6K
         vWNdfUA8Yh+gz259ZAWa5FasShfejBUmey7BtXyPtP5XFsVkfYVNS5ijGcHup0/2YxQF
         8q05sly/g7e3oYfRH6cYSrge4eXj5XijGQ+WAMoVDCa9Yjr4RJClqZqC/MFK7TpwSPAK
         Vx+28S6Wp3Ea9s4h11+qEHHs/9tLNf3VY4uJFFJlFE+zFaoJRRMOuF9HMmfl9K2yZ3mm
         CSHGSsUFdlL2bcba+N8gr1YGh/yBXUzB9hx7s4jbdyCogoDGDI4cJbu5WnKX4FtFB38F
         ZkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724673553; x=1725278353;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DtA9pcQSjP3ccQDJR9MjGjGBKy+LEPAenXNB5h2lMD8=;
        b=Co4L4CoB5AOEQMecuWGKk8pktqc8+dz7wxeujM2au5RkFAHFnRN6zEfRkkUIfTlm1e
         ChmYIokVhbrOfCDdOi5zmy7pxLb4A4kBLc+DiiBWb7BYqL5Rl7q65eCb5UOhcCSV+aKs
         GNcmTMTUJe2UdaZLHLVZay2gM19t8rrCf2qns/EzT1Sy2KbHzsdExGae0VMWz9t7bfCn
         LiyoXKV62Usobsvl9fp1d/fZpK7YIo7kfT4Z01gCJZiOoYC+I4DSOzFru53MguxhJdQ7
         T1M/aUhZUIKLkmqrdvBHEfzFMZosNr1nru8qgVA1KukiYOG1jUZw/2GGjvcAeGC/vJ/t
         Xv/w==
X-Forwarded-Encrypted: i=1; AJvYcCVfGhb0BawX8GS8T9qhXy4lVcQrYIieWQ6zhqqmSt0msC1K2Y/XET55qAyjMlvujsoWjfGgzcCHgu4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxaarsorgK6yY5f4y/kinu3yNhqI6LV8/RgcIkecUh6oyGiAefJ
	TXEOtLX2/qe2+k9l9ObdoEIeTk5cbvwLEC0cO1x+Ed3diwEuoD/og26eyZOF3w==
X-Google-Smtp-Source: AGHT+IFrjjnNnRggUPQif49pPhG+8ExmC7wrTDvVjcajug9B4YKJ1etsm41rUjBN0l/RlYP+Bj9RGw==
X-Received: by 2002:a17:907:1c84:b0:a86:6d39:cbfd with SMTP id a640c23a62f3a-a86a54ddc4dmr709567166b.57.1724673552945;
        Mon, 26 Aug 2024 04:59:12 -0700 (PDT)
Message-ID: <53d86a14-276d-4d2c-836f-4c3a78346dd1@suse.com>
Date: Mon, 26 Aug 2024 13:59:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] xen/bitops: Implement hweight32() in terms of
 hweightl()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240822230635.954557-1-andrew.cooper3@citrix.com>
 <20240822230635.954557-9-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240822230635.954557-9-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.08.2024 01:06, Andrew Cooper wrote:
> ... and drop generic_hweight32().
> 
> As noted previously, the only two users of hweight32() and they're both
> singleton callers in __init paths, so it's not interesting to have a sub-GPR
> optimised generic.

I think it's clear what is meant, but the part of the sentence ahead of
the comma is a little bumpy. As to not interesting: Perhaps indeed not
right now, but new uses may appear and generally the overly wide
operations may be (slightly) more expensive. Of course we can deal with
the need when it arises, so ...

> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



