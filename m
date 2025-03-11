Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2DEA5C8BF
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 16:49:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908420.1315538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts1qd-0002j0-RU; Tue, 11 Mar 2025 15:48:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908420.1315538; Tue, 11 Mar 2025 15:48:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts1qd-0002gy-Oh; Tue, 11 Mar 2025 15:48:51 +0000
Received: by outflank-mailman (input) for mailman id 908420;
 Tue, 11 Mar 2025 15:48:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmiY=V6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ts1qd-0002gs-7G
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 15:48:51 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5381b1fe-fe90-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 16:48:50 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso35401485e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 08:48:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43cf7c8249bsm77116165e9.7.2025.03.11.08.48.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 08:48:49 -0700 (PDT)
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
X-Inumbo-ID: 5381b1fe-fe90-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741708130; x=1742312930; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UvO1sa82d386QVY0qd2WzXLwoNNxAuzBSDkgUD42rAU=;
        b=VHBG2LzMjh1o7An8Svq181f0TFlavH91yRGJURqAgDa33rAucEgQA6GcIquQupv6Hg
         xMqKuRSXQxWAKjxmzZGJ2MHp5Q57eHaIUt721peW0+hSrWKMtBdpPnWeLgZ4CQup9DSg
         PF8LFCSh1pvNaohGFR9JElarEP1FZ2Aidko/I4ZAorvHznGKB8VUGUs8JDPihYhXIysw
         Swb0I8hcWjNYsXW2q6VwTC4H1EsVQPQ0aVAAw5TkWW3W82091K77ycSSF+dvCm84taxw
         6c6OejUK1Q83IFWnNzcn3Iiexkrg8mORMRYqForrCCZ+4ujR2HMX6uQwck7IV5T8Xfr7
         tOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741708130; x=1742312930;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UvO1sa82d386QVY0qd2WzXLwoNNxAuzBSDkgUD42rAU=;
        b=S4NAaAj6mTYw671aEh5BufWI5NKTPMv0YVfDfA7iISBj0xNju+ySRaXR66I/MbMs30
         7xlE04+T6opJqa4t+R6QR/j3RmQHRUmnkcg8XZsSqKGb1V/OJx32P7nOH4AOSC0qnnIz
         qKh9tFYbwBYA4wdiwApUyzuM8q0BrfqaLqIT/uIrHT0E/OEAzDPZPbZRtEfO+MT+/mfE
         GthcAb/mm/ojw2oxvJw+Qu62KOKnAu1ceJFjbxXaDBzEh1fk2RSC5LmmdL6H6KXNPmTA
         YDGbviPjvYaZODyO4lhrptahSDObOzHesNh9sp2jGnZlksvgL3FHQPjfBZOTQ4KtsI1J
         e8oQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmfuIIxfb6ESFIWubBDkfIj/HH82lWCyVO6ISad3naCVlkRPpq2G65T7zYlmpuObVmQ2mhnLThCWQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJzasx/YwEAbe3AYFh5t2QnLZpcHF9p17zLZN1ThLtacKLKTDz
	9QF7DVms0VnnMz88lVa1IRZJbRq4Qq5Ge1xIYm+bm9zwqz8ocZavGmS+ZTSk6g==
X-Gm-Gg: ASbGncsFkI1GL709KtX2FuazjLa8r4AfB3z51bVhu2c0bpG3uQrgx3wPcDfAKiWZzLj
	XzNu0PxWnWuy493pfD5ZRUt6wVVylEt1G61sJFH54UpnCj5F6PqJu99y+Prj8GxS65w0V+ZlXn7
	n5TQl8ApKMZyDm1SvX/y4KIEIu+X2m3+m96Ca1U8vavJfHoXQjdZOhxWSFzJFViIVNsyktN+4fZ
	ocyaqN2DyD+W+EnuWxcu9Z2zlMT6MVchzQl1v/4ji7fukGy/3ha+Ff0hBWcBkCVFapcigQGYd9d
	JWJCXC1eqCi+U3UriQ/KWzZMh11BD5y8/TnCgtUNXt5DMb09XvUrqRKb2d8wk2agkgJQPdNiGgR
	InrC1mfgByQrVhTI/edkJ2WcjxYgDgg==
X-Google-Smtp-Source: AGHT+IG4nedJ82Rb5HHp2eUfSIYkEmewD95b707XTQ/6C8brXpejVs5aPf+5IcLRJqKsCeRtUz/UwA==
X-Received: by 2002:a05:600c:511b:b0:43c:f61e:6ea8 with SMTP id 5b1f17b1804b1-43cf61e702fmr94082345e9.2.1741708129644;
        Tue, 11 Mar 2025 08:48:49 -0700 (PDT)
Message-ID: <c55c4f19-21e2-4115-b7f6-ba4752cc2e56@suse.com>
Date: Tue, 11 Mar 2025 16:48:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/riscv: add H extenstion to -march
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Milan Djokic <milandjokic1995@gmail.com>,
 Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>, xen-devel@lists.xenproject.org
References: <32ebe4032b7968157d5cadbc2f6aa1d9f2d363c9.1741707803.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <32ebe4032b7968157d5cadbc2f6aa1d9f2d363c9.1741707803.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2025 16:45, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/arch.mk
> +++ b/xen/arch/riscv/arch.mk
> @@ -9,7 +9,8 @@ riscv-abi-$(CONFIG_RISCV_64) := -mabi=lp64
>  riscv-march-$(CONFIG_RISCV_64) := rv64
>  riscv-march-y += ima
>  riscv-march-$(CONFIG_RISCV_ISA_C) += c
> -riscv-march-y += _zicsr_zifencei_zbb
> +h-extension-name := $(call cc-ifversion,-lt,1301, hh, h)

Instead of a version check, did you consider probing the compiler? With the
hard-coded version, how are things going to work with Clang?

Jan

