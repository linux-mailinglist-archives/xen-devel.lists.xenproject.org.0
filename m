Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F0EA72A58
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 08:02:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928477.1331172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txhFW-0001Un-5A; Thu, 27 Mar 2025 07:01:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928477.1331172; Thu, 27 Mar 2025 07:01:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txhFW-0001Tc-2L; Thu, 27 Mar 2025 07:01:58 +0000
Received: by outflank-mailman (input) for mailman id 928477;
 Thu, 27 Mar 2025 07:01:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txhFU-0000uK-Qd
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 07:01:56 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5dfe9e54-0ad9-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 08:01:55 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3995ff6b066so248689f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 00:01:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39ad32bd464sm916121f8f.57.2025.03.27.00.01.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 00:01:54 -0700 (PDT)
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
X-Inumbo-ID: 5dfe9e54-0ad9-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743058914; x=1743663714; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bIG3WrDvWDaFqO7x8xG+psETZLUaXz4fbr+tPiIbRI8=;
        b=SktuPUYpRrtSKAF7N8TWxMT15meuEJRojupfOXLDDKvCHPlUpd+fnNDeOmyH3LD09Y
         lBQYkyZquDtqSzbKVTCFRBz2WK/6GnN1JxzMORsGdhSSUqQzU7vvp0AMb21unFB7DMXI
         EqoZ4uENvey+2rZQMlb16z87+x/mGEm+BNwbuWUksvXDyT+ox9p1jZOqxVa2t+R7AWRh
         yFb5aZkqcsdfupesqCoB4ZorOqth7MBWGSX6xK/i7Z5XKRBOChtzC0m8bOoOwsHTbVQv
         3q3yz8DgwpaDmSHRSYBlfFov5kqCb1CQbEZcQMZfGScVpCeZi3OOkmPTK351zZDAJCHd
         Lsmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743058914; x=1743663714;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bIG3WrDvWDaFqO7x8xG+psETZLUaXz4fbr+tPiIbRI8=;
        b=rmCrxXnmzlf0L0ZsoyCDikcRoUToZn08gXoHn58uVkN3vZ4nleN2PTu4zqKSJQd97m
         FhYP99/NdV6Ubn3huBOKfvj2u+QZNDH40pIvtnKXdEpF23W9CoSO89B2EyA/tqTp0Nch
         svEMHXwa+AtLgqnHbvAgJr++SrV9sUZRbI9F9cwke2SMqVJUfoJqLg0vIPFheVh5qLZI
         FxsCmeIMVgpNOF1VQPDBH1Vjtl8VuCtUufNmnbBw29F6jALT26ufhGWiW0GMlsh+y6Xc
         sV2Kix/mJ021klMGB/Y7fDtEnV12shNn/PVjhcp4OJd3R1GL5IthY5VMNLy8Pk1uyZXL
         uujg==
X-Forwarded-Encrypted: i=1; AJvYcCVW8BZvulJHMSV/NnAAWmqDvv/oxX/vtkGOfRjlWzvHhl9c667ABTYU5H2Lv6708klKpEMt1yGcakQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOzEbErLA4nNn54iinIP+8uy1/1mGWKAAR1dvhYRg8S83gAvWT
	+h2rDRFFyx8PzdFp7ryT6+hSflTuzvcO1bb0QcgcOir/V6r1Oo+Gmx1NlA1Pgg==
X-Gm-Gg: ASbGncuurDc0mwYnp4J5MnUwwGgvbGbFnH7zVnuMRZZLAHuv328nMZozLscigN9uEGI
	nRfG9e+gKfYq9Er0JVWg4D1KhZHGtfHvLJarWdg9wqs/kDEbfL6kOeJv5Gdw4Jf7GxDgV/c4u+n
	7fjXILsN4RzDZrv91+J/F4z2fV00mTeHP2iPBNjuW/J09f3AWv6pyxXgXuSBZ77dJ6DCUcTM8bJ
	ZHIZMn42mTtTZo8nkA3F+HUmujRXXYgFZuP3WFTYrwhXmMo5QcRryF8P4cKM1xBbtEGHP8DvuAX
	euenITZmSjm+x4c2DL6BtRMHDZPTCacFyXSQj97ar5TPNkuqg/QRCaCHvqvuD1Q8gEsT5DJJrfI
	2ZZY0kxArvzZ3sEum8iz7km7K7bMm/A==
X-Google-Smtp-Source: AGHT+IG8irPl857OkBnRo97bejPeCyVAgI8v+yv4K17LnvVdszivVrLxm7lxpRkAWzf6vJ8rdjCxdA==
X-Received: by 2002:a05:6000:184b:b0:391:47a7:299c with SMTP id ffacd0b85a97d-39ad176bb3cmr1873898f8f.40.1743058914473;
        Thu, 27 Mar 2025 00:01:54 -0700 (PDT)
Message-ID: <0edd7ffd-a1ec-4435-9505-6017a9afb65f@suse.com>
Date: Thu, 27 Mar 2025 08:01:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] remove qemu-traditional
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nick Rosbrook <rosbrookn@gmail.com>, George Dunlap <gwd@xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20250326160442.19706-1-jgross@suse.com>
 <2f59957f-743a-4c29-912a-3fdaf137cbd6@citrix.com>
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
In-Reply-To: <2f59957f-743a-4c29-912a-3fdaf137cbd6@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.03.2025 17:10, Andrew Cooper wrote:
> On 26/03/2025 4:04 pm, Juergen Gross wrote:
>> Remove the qemu-traditional support. This includes the Mini-OS
>> based ioemu-stubdom.
>>
>> I _think_ rombios support could be removed, too, but this can be
>> done in a second step.
> 
> XenServer is still using RomBIOS, because qemu-trad and qemu-xen were
> not inter-operable and we needed Windows not to go a shade of blue. 
> Therefore I'd prefer if this could stay in it's off-by-default form,
> rather than carrying a revert.

Oh, so qemuu can actually use it?

Jan

