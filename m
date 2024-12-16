Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF259F3342
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 15:32:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858172.1270430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNC8Z-00068F-Ir; Mon, 16 Dec 2024 14:31:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858172.1270430; Mon, 16 Dec 2024 14:31:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNC8Z-00066m-FO; Mon, 16 Dec 2024 14:31:55 +0000
Received: by outflank-mailman (input) for mailman id 858172;
 Mon, 16 Dec 2024 14:31:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tNC8Y-00066g-4w
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 14:31:54 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e65c5c1-bbba-11ef-a0d6-8be0dac302b0;
 Mon, 16 Dec 2024 15:31:53 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43622267b2eso44557595e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 06:31:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4363606ece8sm86481905e9.25.2024.12.16.06.31.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 06:31:51 -0800 (PST)
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
X-Inumbo-ID: 7e65c5c1-bbba-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734359513; x=1734964313; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0i4WgwIpdOCqNVhvmx9kuKMmSbzAESTfDxPATpP+aW0=;
        b=WZSawMcfKEw9Uye6iJLijuZoBduS4wLtKmw6B6XapbZS7H7+WxULCnTpAsvSIro9q4
         7xkgX0CtRkAoEtctUt1ixrmY453TwaOeFuoII9njUGHui/IACislONQTY1+AMViEuKZe
         ts4MCiy7AYmfoS6K4/YL6vfWNw33mLpYEhkpIhRqkGC0+zObSSb7JDdODqg8X9vgKuk1
         /ABu+x+3zRtST0+WKeT7UgMwdgvb2EAaszuLpG2wnKVDZ6fMjTWu5m5tFi/ZQOnbQVKb
         a+ESpqllUukko3qz7LPlIgRiyOIO/4KdYIDwmRfD9tf7HW5Ge8Yp2QMqKL1557M7P8Er
         IkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734359513; x=1734964313;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0i4WgwIpdOCqNVhvmx9kuKMmSbzAESTfDxPATpP+aW0=;
        b=T5kL4UpbSiFzPzDQvPnnj4QIGfISlNynm6Cm0IiVqGzrcrsfFA5x0QfBTfPIYK1sF9
         FysYCIFW0828kpBrAkwniRzGf7Uo4B7uH5LDcAdrOd2MF4K1lmO/sUXPHgN8k6d3fVRV
         EEAnN1KLQSw4YMKdr/dt+FcBlK1YILdUTL81PxLxKh9AlsDYVzk9wCAHvykjT86mq9OG
         GnlgvYYN1GA1Q1N7VOYLSJBGHjrRQGqJEWndWpLh6bR+C6JOM2XccOND+fuYzQIoiqDZ
         zFOLa5gFmictAHwsrjLFxEqSK59lmVBLj4HmhrB6lndjv8L86AyWIqtfWkkArXDNlX+b
         hoAg==
X-Forwarded-Encrypted: i=1; AJvYcCWDegf5N7frGa9eM9QIgFV6Lj6dqBLEzdFzY9jrsfj3C8CADKJZeygIrqdF1MNZqSdvzM26zwvwVOs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxO1kY3pzu3U6a9En8oF3Ow/DSLVv3SQRIA6vklfpYCNb3plDUc
	BGaT5Dr+7d5Se2v55FJJR/GRm3z+sl/qcDPRxY+DVBYF7h4Yh66XprlgHmXupQ==
X-Gm-Gg: ASbGncsmLZ0D8/G4uLauwlelmCVgk8tRcRSijHQLJiYy/xKL2uiZO55AFOxrPv7K9Np
	3CMFKjdSRKGwpzj47mKuWVeM0fszclk36OkMcno0/0h9TiZyKBu4NfmNQAxMQIqOOVqB1n3Io4l
	7MsHl4bIhytar3cniilqTUmNacvmDpSzkLssjYxnvgG0eeshqOcjjc1o8HKmeithLYS+FeAlsV8
	l9wzHLSgd4XYT2Hl68OLE2pc6eRljmYA62labQ19NqjELBC1vB4jOvJKmH1miHguejxJWg5CcJw
	Oc5OyRaHoUGCLp/NHmT6Cr4PFcvXsQLhlRS+MOe9Ew==
X-Google-Smtp-Source: AGHT+IGeLUKSC0f8xOSf58rSUzPrDanl6uGH22LWlQxBJ6wcIcVupu2VwLT1e0ndI5FRVw73hqqBpw==
X-Received: by 2002:a05:600c:510c:b0:434:a19a:5965 with SMTP id 5b1f17b1804b1-4362aa157afmr113929655e9.6.1734359511596;
        Mon, 16 Dec 2024 06:31:51 -0800 (PST)
Message-ID: <2d5c234a-2a2a-4739-9ff5-828788286dcc@suse.com>
Date: Mon, 16 Dec 2024 15:31:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] xen/riscv: relocating and unflattening host device
 tree
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1733937787.git.oleksii.kurochko@gmail.com>
 <8906108d2e29637a42d5e127e393337d6b259b30.1733937787.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <8906108d2e29637a42d5e127e393337d6b259b30.1733937787.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2024 18:27, Oleksii Kurochko wrote:
> Introduce relocate_fdt() and call it to relocate FDT to Xen heap
> instead of using early mapping as it is expected that discard_initial_modules()
> ( is supposed to call in the future ) discards the FDT boot module and
> remove_early_mappings() destroys the early mapping.
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



