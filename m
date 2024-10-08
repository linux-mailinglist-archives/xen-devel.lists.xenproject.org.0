Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C81EE9951E5
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 16:37:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813197.1226039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syBKX-0004UC-L2; Tue, 08 Oct 2024 14:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813197.1226039; Tue, 08 Oct 2024 14:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syBKX-0004SG-I4; Tue, 08 Oct 2024 14:36:53 +0000
Received: by outflank-mailman (input) for mailman id 813197;
 Tue, 08 Oct 2024 14:36:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vy9o=RE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syBKW-0004S5-EI
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 14:36:52 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c128e435-8582-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 16:36:50 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5398e33155fso7073954e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 07:36:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e664ed8sm519943366b.95.2024.10.08.07.36.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 07:36:48 -0700 (PDT)
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
X-Inumbo-ID: c128e435-8582-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728398210; x=1729003010; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pwqrwefo857erRw28hHbTwHYu6QKZysbaAEuf9hbHVE=;
        b=fEYEMmRscNI6R2wFdJgykM1c2ktWQPMgR45k6zt6bAkSlHwuSmGV5WM1fC8E2v0iYP
         yqCex/Hz2nB9vdXwJOZTrfJkC0ReQLqTFLaScvhjH9+gTVtRQKkpMwfZXfU9AOwpHVME
         u/Nl/ZvBjlrDs5CJRuJ3I5RX/SZDNVdO4Za3QGnhQStBbUH0CV30H91clKsTlgDE3yZV
         XeRgeTThpHLx3tpS3h4LVpQB40tu7wReMvLNwaXxCNbYK+HF/zsD3Voqt+T3bFDQGBuT
         yj8k4nD/HxrHK9nDlkcqlEw8EDjesa9luWzY0vU3hekZba5HV1lA6pucw50uJrHq89jN
         kXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728398210; x=1729003010;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwqrwefo857erRw28hHbTwHYu6QKZysbaAEuf9hbHVE=;
        b=huKzb8Q/NMhY2zRkVeHVKxUd+F45Qy1kUpM/e5cZMhMH6gzUwn5bbOIrSC4VGuwL35
         usfvUm/s+PrbijlpUlWhtW4PzG0tVf/azUmSthgklhGNGsZz73nSpyMbScQb4mLSttYt
         QhZO8wkQckZ9hg2b4/x5BUuzvA5N+u8UnICnsa+j5rsiL2ZH7qnEZZkslA+NHGS07NK3
         fnA6ttAElU9kAKA3F5TPXd7oowR7ri6ha9eeN6B3qaggz3scEgE5+cIXKNH0KlbYVfXQ
         vF32Dt7kqzwZJLqZnXlkj1wu3vIve3GTD57wRFIhR7/PX5D2WFgLzXovzaV719U0I0jm
         gLXg==
X-Forwarded-Encrypted: i=1; AJvYcCU0ZU8rfLXLxuiSX1LRo3en1BVQJ9EUKt6ztTcygj/UVDnakQEHXljJ/I9pZjK3bdigyisf61hZEoo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyFzh4qtKNnRBzhzNzROtPyPGfdfXTKmBr3i86dLSWmL+SpY6ne
	ADCPWDmDBMvqeMNqG9cJknMU7CNGAVU728LA7onDFq1yEg4aOrkPVt7HdAOf9A==
X-Google-Smtp-Source: AGHT+IEixP9AT5ftgua929so5Yje9NYxU3S2jxxKyQRdYkObt52CqWSrHlZY2JSZoZdQz4HnWP37GQ==
X-Received: by 2002:a05:6512:33d0:b0:539:a3eb:d000 with SMTP id 2adb3069b0e04-539ab9e16b8mr8201222e87.42.1728398209978;
        Tue, 08 Oct 2024 07:36:49 -0700 (PDT)
Message-ID: <91bf52b6-5e1f-4ce5-8eef-362efa55759e@suse.com>
Date: Tue, 8 Oct 2024 16:36:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/19] xen: Update header guards - I/O MMU
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241004081713.749031-1-frediano.ziglio@cloud.com>
 <20241004081713.749031-11-frediano.ziglio@cloud.com>
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
In-Reply-To: <20241004081713.749031-11-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.10.2024 10:17, Frediano Ziglio wrote:
> Updated headers related to I/O MMU.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



