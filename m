Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DAE805926
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 16:53:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648092.1012074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAXk5-0007zj-GH; Tue, 05 Dec 2023 15:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648092.1012074; Tue, 05 Dec 2023 15:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAXk5-0007wL-Ci; Tue, 05 Dec 2023 15:53:49 +0000
Received: by outflank-mailman (input) for mailman id 648092;
 Tue, 05 Dec 2023 15:53:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kfJ1=HQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAXk4-0007l8-0T
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 15:53:48 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79ba42aa-9386-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 16:53:47 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-332c0c32d19so5546676f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 07:53:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r13-20020a056000014d00b003333fc2cb92sm8277421wrx.58.2023.12.05.07.53.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 07:53:46 -0800 (PST)
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
X-Inumbo-ID: 79ba42aa-9386-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701791627; x=1702396427; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IlsBuXrdrUY13Ll0FrcTZ09U5KvbDKYxEXqZDMbOQK0=;
        b=Ez3B7KyAcyeLS7VKnOr1+OnyMWryLFIUds6pmHQ7chzLPZnACGYDXKAhtbXdktZub/
         +SNcTSWQi38P7HsnkwnOKoxorXxwJSgQYc12CGRyDCGQ92nvJ0Op7+ZGSORGPqm5LIo9
         Sju/JN5hRF0kcIs3jv7J4l0NHHGIZwvZkRwdI8kEUcmhfdGLUWZS1/tqbg98DFdhYhjG
         2dL66ySHL1a8aY1dcNTQIHNGL2ADcIFI1MW5r02BU1ja1cww2yNL+TKN7hkvQZunwVsD
         4w6X1BlOk14idjtIViAAv06yck8JMk+UM4rtsKN6aZQHdKGQjbFpeAkw6Bzvk78g/Zts
         rVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701791627; x=1702396427;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IlsBuXrdrUY13Ll0FrcTZ09U5KvbDKYxEXqZDMbOQK0=;
        b=wyUUgTKtHvXlXEn78MaLUli+iL85vgR2d+ZUO/BzHfvVo/TL9Y/PW3dMyCMWLNSsSP
         zZsyR3JGjumfbhEdFL41T3YQ3Ozr53wdqFfTfP8srMZccVDcrmB8WO12nKVDOBkKwwp2
         mS2bN6pJDYNTVYClfHFqtBNLyFd9yAtBJdWDstcjoZfpMWoifU2grHdBhjL4yGYx4iZo
         w23v7Go93x2ZaT8fYO7XXK0P4oH2n0eVZ8xEC9WrDBxHnnxDtSj8/ew0/Q0jeO8H+HIB
         uoJHcOmstvKjvg402DhueAVOT0AfyHN5QobkZH/ZHHTB4vm1CFFixg9XHQB33Ij1jiYc
         fIjQ==
X-Gm-Message-State: AOJu0YxtHfsFSgoKSa2W0g5VzIzxIUORcO6Ucxwz9wRAlVjuReeVa8/5
	f7wMj9VHG28iBE3mW9SLPboK9s+IjTYtLrZcfwfm
X-Google-Smtp-Source: AGHT+IEvwvy1BebEPlCOeFi6o++oVfD6DWA81zenqarbfzH44qFSiV8XUjpeCOB2/ikRiQ01zc9E4w==
X-Received: by 2002:adf:e482:0:b0:333:2fd2:2f03 with SMTP id i2-20020adfe482000000b003332fd22f03mr4676268wrm.124.1701791626833;
        Tue, 05 Dec 2023 07:53:46 -0800 (PST)
Message-ID: <b1ea01d5-f3d5-4103-a4d3-c0a71328de1c@suse.com>
Date: Tue, 5 Dec 2023 16:53:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/39] xen/riscv: introduce spinlock.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <342e330232db63454ca368aa7b5bd100c944b1e8.1700761381.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <342e330232db63454ca368aa7b5bd100c944b1e8.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



