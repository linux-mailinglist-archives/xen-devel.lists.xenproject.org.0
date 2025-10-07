Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1CABC1AA1
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 16:12:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138888.1474464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v68QD-0001rv-PH; Tue, 07 Oct 2025 14:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138888.1474464; Tue, 07 Oct 2025 14:12:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v68QD-0001qQ-MO; Tue, 07 Oct 2025 14:12:09 +0000
Received: by outflank-mailman (input) for mailman id 1138888;
 Tue, 07 Oct 2025 14:12:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v68QC-0001qK-Hh
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 14:12:08 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ac7774f-a387-11f0-9809-7dc792cee155;
 Tue, 07 Oct 2025 16:12:06 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-637dbabdb32so12555237a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Oct 2025 07:12:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63788112bbdsm12451877a12.41.2025.10.07.07.12.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 07:12:05 -0700 (PDT)
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
X-Inumbo-ID: 9ac7774f-a387-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759846326; x=1760451126; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1aGu/YyTImMy0zu4CheQpC6gs4fpmNm4dyjA0U4I9MQ=;
        b=cPROKpHlxSLUF51gfTcRN9rGE/w0eSC7shmv4A0AqqWTAxgkzJS3ugVXK9lNXDPlU6
         hqWYxfEipu3dO++yP/Xb6/P4YT8KAPHhag6X7+HNpuLcfgBztWmEXjhgAEvTXGBvqIro
         /25t8qhDYK/KUuL/8GS82GInzK4paTpCkC+KIXIR2CNUctInnFu7kbQbw281ff/dPI9f
         dDcQqPVdV0gmfMmYnw3bpQrb17PUhv+TemI56LxDbsbmOtCZUp5G0vIN75lX6zbtPwOv
         60Jgf4yLqrtdMVJYr0KhU90Y/qb07tonANTkEnFwN5R3uvYNmIMkl5bjApU8QMxb29Rm
         DSug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759846326; x=1760451126;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1aGu/YyTImMy0zu4CheQpC6gs4fpmNm4dyjA0U4I9MQ=;
        b=ADqyn4etFDwSCWx00eEtuao5f3qx3EmTeRhK5pUxtzulW24rOjuMUOuIb3FX9eZVpg
         nYC9+Wl6XXBpEbKMAvT7P5fdNFVp++DVbQDeHa0eUqzu+eI9YqcIa7S43Zu2TJQNMzQ1
         1RaQMxscjZkgywDPIaJkICBco9VcdIHTqGh3tLMgyCMyMpxHVaveQ5S019G2piKcwIfa
         4HaRA1Y9cIJ0O8l+zVj0/OgQxURltbL0IgSpQSNbxUoZOdwjGLwTwhlUs14yuiZlbjDV
         +Nf0t80m33FaXT1nShm7zuWDB5+JFm7BqXv2/Gsm5Xrn6rFbq6z0ugEUpQgADiAcHNKE
         LQdg==
X-Forwarded-Encrypted: i=1; AJvYcCUFnb5cjIHYpaECDQSlXls8U6u89QC7dFGBzyPABxgW1DmC8eejZ5tVIgqz45i/p/fGAX6yRU7p+OQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxN/XiDUUnlKfthCIj4zN33iE1k0Z+Tb9HfmKI/2PJZmNeERIat
	UuZIeBOzhX9/nKv15NL3KCp6v4BeaMXdumcjCAWMS0fy4g8DB4Bkl7RivxYhYzwEAQ==
X-Gm-Gg: ASbGncuhHnMuscAYqnr6/1a7bdDUhNo1chZaGj4vKglcbAM5ckLXwOxXyzYZVKdvb1w
	ui6bfvmPkGRBQys/6Pf3aPqM9RFYGh1IHXqLQQM9hRHsRS4IlKh1cbGfUfUJ35PaQ8tFfY0mHy9
	0DIUtjYrk/Z3Wn2L7hi0pDVYubY1PqnCcvX59b3YLreiNuR1yN5O8SjFfSMucqBGMJr09BYINlf
	nB2JNwPhcFdu7Qofnlpd43Y6s5IxvT+1B5NAVox2o3Ti+3F5PNyKCcVgnsSAXb8o3xAYdni+FOx
	vaptvqN/uvdfANrRNu7cov65hyf2HqgCaPAeWDLwyyjD4I2TIzvEteVkvJ/znjaUVSbdQhWsSL1
	tH6OFOuypMyss44rFM8o5zHUqHxl1oCRAmI6Ni+D2+QCqN10poVrftIjbJwKatmLKJHT2qgXxqG
	65khBDtlovcvFr7uDvzBftZZvW1ECmInc=
X-Google-Smtp-Source: AGHT+IHh1EpSOniBEroth34hyIywXVsEGL4kxnoaI0wFa28exWDyd3qbT5XRND2uXke7sjfir/KmgQ==
X-Received: by 2002:a05:6402:35c2:b0:634:5791:605f with SMTP id 4fb4d7f45d1cf-639346b7df4mr16453898a12.4.1759846325556;
        Tue, 07 Oct 2025 07:12:05 -0700 (PDT)
Message-ID: <1708c939-4b06-4d09-acb8-6965383d91f4@suse.com>
Date: Tue, 7 Oct 2025 16:12:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: Strip xen.efi by default
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 "michal.zygowski@3mdeb.com" <michal.zygowski@3mdeb.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250612100705.21988-1-frediano.ziglio@cloud.com>
 <586a66e5-4b11-485e-955a-da5fc3183737@citrix.com> <aN6H8dOlea2Um8y8@mail-itl>
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
In-Reply-To: <aN6H8dOlea2Um8y8@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.10.2025 16:10, Marek Marczykowski-Górecki wrote:
> On Thu, Oct 02, 2025 at 02:05:56PM +0100, Andrew Cooper wrote:
>> On 12/06/2025 11:07 am, Frediano Ziglio wrote:
>>> For xen.gz file we strip all symbols and have an additional
>>> xen-syms file version with all symbols.
>>> Make xen.efi more coherent stripping all symbols too.
>>> xen.efi.elf can be used for debugging.
>>>
>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> 
> Generally,
> Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Just to double check: You offer this after having read (and discarded) my
comments on v1, which v2 left largely unaddressed? IOW I continue to
consider this a wrong move, and Andrew's remark towards "bootable vs not
bootable" isn't quite relevant, seeing that prior to this patch we already
had a way to strip the binary put onto the EFI partition (i.e. the one to
be used for actual booting).

Jan

