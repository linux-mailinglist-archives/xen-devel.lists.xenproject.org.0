Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2248E9C5247
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 10:43:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834281.1249900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAnPy-0007je-Ve; Tue, 12 Nov 2024 09:42:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834281.1249900; Tue, 12 Nov 2024 09:42:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAnPy-0007gU-SX; Tue, 12 Nov 2024 09:42:38 +0000
Received: by outflank-mailman (input) for mailman id 834281;
 Tue, 12 Nov 2024 09:42:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KiBs=SH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tAnPx-0007g1-Bs
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2024 09:42:37 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 719c6189-a0da-11ef-a0c6-8be0dac302b0;
 Tue, 12 Nov 2024 10:42:34 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4315c1c7392so47989315e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2024 01:42:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed998d00sm14789650f8f.56.2024.11.12.01.42.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 01:42:33 -0800 (PST)
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
X-Inumbo-ID: 719c6189-a0da-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmMiLCJoZWxvIjoibWFpbC13bTEteDMyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjcxOWM2MTg5LWEwZGEtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDA0NTU0Ljg2MjAzOSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731404554; x=1732009354; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SwE98HEfayJQUm+fQjTUOB+1/vBIdpccAZV4vEwT/SU=;
        b=IdELc9O1IF4r6VZqMuknDviCoSt94l6L00ya5S2KmcUhygJBM2ZELMyRlsRCKtkl24
         TWyqDo4yGlytEMV/Z/4ANdMYWjQ3W6pQYSIi9Lt7n/QRm3e02HaUvy1H2yrYW+jBUFB3
         fUEYt9/0mGnA//M/Nzfhsh6g9V+pscf0r8/lBVX2XVbm3CVjdH+YDr9PLjSxjGi1c7Z2
         xLbTpaB2aorMKVblmCGa0DVYIwGLO5DF39u5J5OBTS+bz8D9PWDdHYWr4kkSs+UuNR/1
         Y+od9++4EPGEK/DMMm4lAwRDq6O/n15zhHS53Q5AMdKOMbDduGe450S/bSKo+qQhN4Nr
         +iYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731404554; x=1732009354;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SwE98HEfayJQUm+fQjTUOB+1/vBIdpccAZV4vEwT/SU=;
        b=heo2DOIwgYR+/xfa/dHhXRdVeAtqNQpX/3jDeRr5KN8ZQwncTXAPXIp39arR+ZfJaB
         aRXBybpXg8yrYF/xt8UZIj4AYKYKahdG++p8wnDd9YMX5+fnNLtqNB1C/GWLrDNR2CpB
         RR1XKH0TCHDOblBXAAByi4szILLurNIpKcpC7vl8Urigh5phFOhVh2Zsmh/EPewpev+e
         XPO5e26ROQJSGO8TDakBIjJnU8GXaUiWKfC4093EGuB4PnzGIKYUGdyElGnoPNfX+2xx
         +WaCD+T4ggHaiY14o6VOjfDuq3oK57N3O46h32Arh2LMC0OpuMHwww/T+YQrFIK41oLE
         fyUg==
X-Gm-Message-State: AOJu0Yx2jq3onxExN5XJfjD+VhhEQkfn5ZdCbzhf3GK9qLpucYO07Dqw
	tXZhiPBFsb8lqNSk4xsalBGdw5jMb+zUkSXVHRBnUY8VpvvSXceuSTJRWbFfbQ==
X-Google-Smtp-Source: AGHT+IFv+qGrBki61OI+TJrSzG5KsZRbShLTq6zGBY4XkxT+iKtFlbuILE98B0YKKxBNXR+dtJl3ZQ==
X-Received: by 2002:a05:600c:3b9a:b0:431:52f5:f497 with SMTP id 5b1f17b1804b1-432b7502771mr137747055e9.9.1731404553708;
        Tue, 12 Nov 2024 01:42:33 -0800 (PST)
Message-ID: <bb06125e-766a-4b8e-a60e-281fa2053112@suse.com>
Date: Tue, 12 Nov 2024 10:42:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] xen/pci: introduce PF<->VF links
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241018203913.1162962-1-stewart.hildebrand@amd.com>
 <20241018203913.1162962-3-stewart.hildebrand@amd.com>
 <Zx_a57npsdRhLgYr@macbook> <b3f9a4a4-112b-4d58-afca-bc88ea2b1e11@amd.com>
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
In-Reply-To: <b3f9a4a4-112b-4d58-afca-bc88ea2b1e11@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.11.2024 21:07, Stewart Hildebrand wrote:
> On 10/28/24 14:41, Roger Pau Monné wrote:
>> I see previous code also catered for VFs being added without the PF
>> being present, so I assume there was some need for this.
> 
> This is exactly the source of the confusion on my part. In the removal
> path, the consensus seems to be that removing a PF with VFs still
> present indicates an error. Then shouldn't the opposite also be true?
> Adding a VF without a PF should also indicate an error.
> 
> I see the PF-adding logic was added in 942a6f1376d8 ("x86/PCI-MSI:
> properly determine VF BAR values"). Searching the mailing list archives
> didn't reveal much about it [0].
> 
> [0] https://lore.kernel.org/xen-devel/4E3FC6E102000078000501CA@nat28.tlf.novell.com/
> 
> The only time I've observed this path being taken is by manually
> calling PHYSDEVOP_pci_device_add. I've resorted to calling
> PHYSDEVOP_pci_device_{remove,add} from userspace in order to test this,
> because the Linux kernel doesn't behave this way.

The goal was to avoid returning an error when we don't strictly need to.
With the overall adjustment ...

> I can't think of a good rationale for catering to VFs being added
> without a PF, so I'll turn it into an error for the next rev.

... changing this may indeed result in better overall consistency.

Jan

