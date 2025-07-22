Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA804B0D960
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 14:22:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052569.1421294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueC0E-0000EB-He; Tue, 22 Jul 2025 12:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052569.1421294; Tue, 22 Jul 2025 12:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueC0E-0000Bc-Eq; Tue, 22 Jul 2025 12:21:50 +0000
Received: by outflank-mailman (input) for mailman id 1052569;
 Tue, 22 Jul 2025 12:21:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueC0C-0000BW-VZ
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 12:21:48 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7018043f-66f6-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 14:21:47 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a6cdc27438so4329547f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 05:21:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb678d8dsm7449623b3a.110.2025.07.22.05.21.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 05:21:46 -0700 (PDT)
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
X-Inumbo-ID: 7018043f-66f6-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753186907; x=1753791707; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Xhqsxy3IpWO2yqrgkfOOkrvGk7QNOjjgskjAMaGD5Jw=;
        b=g14+rxvmQF4vZBIGhgjY2ljosC/rNit+oCuEr7XIpwfkKC850jxmeXuPN32hOkV+UC
         HfvHG/ocpkJSFQBbev2PB4/eKwDYwjQgs0ga6xpc3LpXs1TQ5xc7up6KtrWSelxqx6WK
         JzIhUv8grpffT9xFCjvqcq1faqAlVA1RUXtgiZ1kQQh82+KwD0oUFoKW5V3gU7CnfTe5
         f2R/MHlYPWd28eM9aXyxGPDzbjexvrLE+QRgkOLe0ErEWQai4lyUhfyWbQR7mX+zd1LS
         M9mXi5ozRbxcppPE6YeS+tqsHModKBG+CsmkcQabjGCihuDLqoFreA/yoERJivc2q/Li
         p2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753186907; x=1753791707;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xhqsxy3IpWO2yqrgkfOOkrvGk7QNOjjgskjAMaGD5Jw=;
        b=bT1v2s+/un8XfyWPgWj3BKHuyhVgxA4gD4qAYMtWMSK9yWhMZpzN/8UbnK49gQrCMm
         35ASjTgFNDlmM2PZVUqmCcdD2xmvdYGzK2abOGYVZDhXkgwTACmdrNVHIg7BL6MsA5Vw
         VM/FG1YSefzjedRGAbShPsiWvpEKlRQvibw1pIFJg/FAFe8smy5F63AMsidkjZX8T32d
         1Ryke37+Ue7ypuuIH32/AyvX3gBRD5eQ8zAQHlcwibtxh4IGWHvsTniLciu10JfYgI4C
         I35Ley/ES+fbGB6VxyQiLyxiW82pSdMdplBYZ/MqwyMcUtAMyRS6z6vA5P59t83kKRKT
         P0mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRIk1+C2hPW7DNHsyukqX2sWy1EGNb1sbuR146G34IGWfm+OKIBmEt5NE5T/TaGXCF39198H7JobE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxvU26iOPwLkbke810LeujiybOTpQqDGvxbPKn1fuCvB7tM3nuP
	fz7rQ93fhoDHndOSXAqp6XS06AbIO/aEWwFkJYvNw4+eXokFPpeA3xWaEaBOUPXPPg==
X-Gm-Gg: ASbGncsyX1t9upOcgEa/uyIGWeFGk4oP1mgs5Pl7f99icIUriiQluef5gnIHekl/AS9
	kZ1r0WDOCwI5JVZRaaV0IyXhtuEpC8kpHY7yplLRYmVIsjBBSMJ2mPBfg2eJsSZWAWjOkItXznn
	pX6+vg+ONhK4QYbP7IpGEiG3PhaQHWdvNyxPnOZXsv3prCYnbkEYm3mP0hq7+jKYJtL96svq9Ek
	nX2IXCPMy2vtCCO/s83E2z518HqdCYtD+blq9YNV0XTIYrrLgUGi2de+ommYgz7u2jy4lsMhXKo
	MKTpT+TvjG2JfZyMggMhySf1NQEZvEwrNYJm0ocvdpMELzQs1LZa6Kac80hO6IkT2LYVYmogStw
	YMGwqhAqBNkuTn+PdX1DeUVwtSTC8tZ2/aA01BCGncrz7Bi7N9KKdAEMTrcDObN/nPQ10yl1Pxk
	lG6pJTxLk=
X-Google-Smtp-Source: AGHT+IE9gS4zItusUazwd9cf+Edq0CicAFGdYFoX7q21sWgB/9RaBkoA3Qw4V3IMzcJ73g9OzhoK6A==
X-Received: by 2002:a05:6000:430f:b0:3a5:2e84:cc7b with SMTP id ffacd0b85a97d-3b60e4c94b7mr18946653f8f.11.1753186907180;
        Tue, 22 Jul 2025 05:21:47 -0700 (PDT)
Message-ID: <472d150b-3ba0-4c89-b72c-75eb8783cf52@suse.com>
Date: Tue, 22 Jul 2025 14:21:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 03/10] xen/arm: scmi-smc: passthrough SCMI SMC to
 domain, single agent
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1753184487.git.oleksii_moisieiev@epam.com>
 <3c8b292b345d81cd20ce260d45d3d7aac6d98702.1753184487.git.oleksii_moisieiev@epam.com>
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
In-Reply-To: <3c8b292b345d81cd20ce260d45d3d7aac6d98702.1753184487.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.07.2025 13:41, Oleksii Moisieiev wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1096,6 +1096,15 @@ affinities to prefer but be not limited to the specified node(s).
>  
>  Pin dom0 vcpus to their respective pcpus
>  
> +### scmi_smc_passthrough (ARM)

May I ask that new command line options please use dashes in favor of
underscores?

Jan

