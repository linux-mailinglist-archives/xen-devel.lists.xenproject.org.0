Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4C69E9AF8
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 16:56:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851565.1265616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKg7K-0003UX-UF; Mon, 09 Dec 2024 15:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851565.1265616; Mon, 09 Dec 2024 15:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKg7K-0003SY-RE; Mon, 09 Dec 2024 15:56:14 +0000
Received: by outflank-mailman (input) for mailman id 851565;
 Mon, 09 Dec 2024 15:56:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKg7J-0003SS-Lg
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 15:56:13 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1cc0afc5-b646-11ef-a0d5-8be0dac302b0;
 Mon, 09 Dec 2024 16:56:12 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-385f07cd1a4so3121445f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 07:56:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7fd1570ae4esm6615603a12.43.2024.12.09.07.56.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 07:56:10 -0800 (PST)
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
X-Inumbo-ID: 1cc0afc5-b646-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733759771; x=1734364571; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fJf0V9+Ju346hjZ87tma06reIxf/VkI1okYq5jwMPlA=;
        b=a7mT3D9TIJzAdtOJOdbVyfNMPiOl95SIruWxr57QEBjHYbvZUbA2mta0Vz0DA2krbg
         b/5X4N2aJlzx+fy+KXsWskz5gf6aXYtPmITSR6BY1gQIBMUKTrJVJrfu06OWfb5oUV89
         zMDICFncxLEKr0Bu05X2cK4kZbZDn5SJ+daEke8m+USlY8iFordkCRy6QSSJ8VLmqPMr
         hrmKMyiHnpzapxEhJ/CC7Y1OoORZd8xUbUqKCIzi8Q3DKUZ+HgyAaT9ZFDigsG8SEGkJ
         d0xpaFOpb69tYWBjcOdjeYDLpWCZwSd2hQ0ltSOu7s9odMyX2Jvgq1T1IM+TEEjETaOI
         zlgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733759771; x=1734364571;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJf0V9+Ju346hjZ87tma06reIxf/VkI1okYq5jwMPlA=;
        b=bA97tYrtPYc7Wr4/UcYgw0CZ6JGM8BWK5pQV1qNnj6+Rw/C5uV/8iRHkO2HPzVLfUL
         GLWMra0XRlMDb4cM8LPITE5V5kr0xibS3hxMf8MXalQrE2UFZGwdUpP1kexivI2oxl3P
         iUIsZYDwifqJqHK/Vi8aaf6S4Yz3JNOxnJuJRYVz71Tg60hA7mP2x36pOlgnIzWsKwaY
         MqhD1ipHkIX0Z4DsYJUQUyTeSk7LNjoKXXmoymbzjlhz4+dVCp7vklMHV46igRQ/hIhE
         PTryAONUSYR98Jk6MgUJZf5X6C0X0Jpdn2L5B9HiM3M1qQbrV6Yujk2emm0OmpL4RNQ2
         wlzg==
X-Forwarded-Encrypted: i=1; AJvYcCXW16mR8fSj4P7zkep8SqZQv4imMyLRzsiC3T93AQKMYxtX1IJloiWq38mLviE/n30tdYgvDK8VrLA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPlSAVnYVNXmMPPH0gB3oA8iwByBiz+tQAJDNdk/TxnncIp9y8
	+G2BNSMIe6NG+zDcwJIrTgS8B98v5kor9qBz23T8uYiPFbP71tQ1h524bFKB8Q==
X-Gm-Gg: ASbGncu0OoUwFaJHVaFpkq08Se/N0mdpfqGoh/i2jAdIqXp7n1I01mdOmxGPEpf80fW
	7+jCqecM6iCDo7+HQXDSTStxBm2MapH8KBaUo7gg++lw5SmDHGdYg3C1oJcB1cR+fwEUqmDHuLr
	/IKXbnhoU1CIjFRD44a+S5lMzy3leff8SeELGRxwv/Fk5CnaXTw4wwg88cFxzkfOgManZ5+8h9C
	o8BcYl5wd7dYmDD4bEwKcD/xicOlLv1KhP6VWPhXUtpclvt7ZU8qAlhgm6VJnTTeRcgeXUVrTcJ
	gp1ik/s94ztQInNTxu/fm5XmzR8fR/boNLE=
X-Google-Smtp-Source: AGHT+IHm4vYgr1ra2NZEQADIK7nrsLNhtwPlIqtmKQYwyjIT9i95aXHIonnPbJ7AuNkxg2hMThMIjw==
X-Received: by 2002:a05:6000:461a:b0:385:f07b:93da with SMTP id ffacd0b85a97d-3862b3e43b0mr9004234f8f.47.1733759771353;
        Mon, 09 Dec 2024 07:56:11 -0800 (PST)
Message-ID: <bcc38672-647c-4fd6-9f90-cf26641b83f7@suse.com>
Date: Mon, 9 Dec 2024 16:56:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/6] xen/riscv: relocating and unflattening host device
 tree
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1732709650.git.oleksii.kurochko@gmail.com>
 <f2b1b8b4d80d6b2ccc846ae7171a316a9b46ac56.1732709650.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <f2b1b8b4d80d6b2ccc846ae7171a316a9b46ac56.1732709650.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.11.2024 13:50, Oleksii Kurochko wrote:
> Relocate FDT to Xen heap instead of using early mapping as it is
> expected that discard_initial_modules() ( is supposed to call in
> the future ) discards the FDT boot module and remove_early_mappings()
> destroys the early mapping.
> 
> Unflatten a device tree, creating the tree of struct device_node.
> It also fills the "name" and "type" pointers of the nodes so the normal
> device-tree walking functions can be used.
> 
> Set device_tree_flattened to NULL in the case when acpi_disabled is
> equal to false.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Albeit ...

> @@ -71,6 +72,7 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>                                 paddr_t dtb_addr)
>  {
>      const char *cmdline;
> +    size_t fdt_size;
>  
>      remove_identity_mapping();
>  
> @@ -95,7 +97,7 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>                            _end - _start, false) )
>          panic("Failed to add BOOTMOD_XEN\n");
>  
> -    if ( !boot_fdt_info(device_tree_flattened, dtb_addr) )
> +    if ( !(fdt_size = boot_fdt_info(device_tree_flattened, dtb_addr)) )
>          BUG();

... perhaps better

    fdt_size = boot_fdt_info(device_tree_flattened, dtb_addr);
    BUG_ON(!fdt_size);

?

Jan

