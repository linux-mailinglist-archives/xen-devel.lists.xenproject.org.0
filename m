Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 206AE84B0D5
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 10:16:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676680.1052886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXHYS-0008Q0-8j; Tue, 06 Feb 2024 09:15:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676680.1052886; Tue, 06 Feb 2024 09:15:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXHYS-0008OH-5q; Tue, 06 Feb 2024 09:15:48 +0000
Received: by outflank-mailman (input) for mailman id 676680;
 Tue, 06 Feb 2024 09:15:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gccX=JP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXHYQ-0008OB-Hz
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 09:15:46 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e3981c2-c4d0-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 10:15:44 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40fd2f7ef55so1786745e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 01:15:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s13-20020a05600c45cd00b0040e4733aecbsm1315832wmo.15.2024.02.06.01.15.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 01:15:43 -0800 (PST)
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
X-Inumbo-ID: 4e3981c2-c4d0-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707210943; x=1707815743; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hcgqavd5ViKDWn4ZTVmJrmTvxwn61LKHCoTm2YoE7hA=;
        b=fCfQnFGL58CZIHgjY5Uw6DwGDO2ethUIVrmW4SMv0gQjJ4J8uxnhMcP1coIsX4NnS5
         GqkXQBS6IRFMmxfz4+tjtlifnjozjVlZ3gXRWtVpLe9o3jug3YZ5aBCx6KBfijLQjQ1Y
         VOv4hrGE8QXJSpWudmyOS9mkNM8WF8pGoptqOq36TCKOaav9mSyUu8RfAXB/m4PXjZEs
         pjtdD/C3wb9io9sqf28dmaDwV/q/8wqNGVt7mJ/0Yj+iSi6ZHwIQcDkHmEQbxDBCy3IP
         MuAuFafn7/VmUGvmURPElygRXQ6L7vtD+FjApiyloREOVRO40UTizmVXjW8neYHCNZSM
         6Gwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707210943; x=1707815743;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hcgqavd5ViKDWn4ZTVmJrmTvxwn61LKHCoTm2YoE7hA=;
        b=qwtzEKVzrimJzg7fZTLJYO5yceypGrar7otIuTkrUYjImpoYWERPc0lTmXrDZ2IUi4
         7q2ver8MDWRw0D1qWYluGlOxY3jZYBv0Oed6iEXtC1Epo42OdmMIvysD7HPtbPzTR+oS
         uLkGvvSDxCGP+xeurlaM0vRzZJt8jS2H1zce1ejgYDcZ8sAhZWBWMiUHBc5fudV4g5d2
         oLLZAkII8WKn+RJbaBWIt5fDMAgGPNRUU10WgoK9s99yZEENUlXwDRgHAcUd7GDGvQjy
         q48XjK4k3n3sz1kcmt1GowVtbUJ5Sb6jxtODmZD5hfCn5yujpdhVzuADlZJ7maiegXt8
         FRSA==
X-Gm-Message-State: AOJu0YyGOj5A95AjHEC/mdhdPdMFS+xB1BDTDLxU/hUxvk9jQDQiBpHH
	pT077ohEPvOMiZHeBQUVdZv8j2rpNS4aB63KOVhTlyrCI1M07aE0WSDRXOiLIQ==
X-Google-Smtp-Source: AGHT+IGixe5/V/9tAra8sNR0z5Fhi8t7iskxkyEhgHeYdBCuKeSqZA310qZgVXel9JR/uG8R03ZqCQ==
X-Received: by 2002:a05:600c:474f:b0:40f:c234:2006 with SMTP id w15-20020a05600c474f00b0040fc2342006mr1652814wmo.8.1707210943592;
        Tue, 06 Feb 2024 01:15:43 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXZ39n2kynwBnXkyRX+VvxOY8DfbiGNZ6bvj34kJIzCycUOI/ghZYC+ANDPL71QeNrIx+MDMb8f2N8x1yHfHKCK0OW2nXK0gXyon8JbKSIDBMlP711ldzy2KL5cBuE2yXv0J0BZKaZD+pDqUWmn2Iv1eaDeLUEAEz+hfaoYwZwBqqxXt1sIK6O8PWi0qduNxjqPyJpbMxfrf55J6s37bh0=
Message-ID: <dfb48bce-378d-478d-b65e-ab8e27aedcf3@suse.com>
Date: Tue, 6 Feb 2024 10:15:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] Remove useless assignment
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
References: <20240205104637.14868-1-frediano.ziglio@cloud.com>
 <alpine.DEB.2.22.394.2402051241240.1925432@ubuntu-linux-20-04-desktop>
 <cbdf382c-a688-45f5-b834-9e3ab70ffc53@xen.org>
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
In-Reply-To: <cbdf382c-a688-45f5-b834-9e3ab70ffc53@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2024 22:21, Julien Grall wrote:
> The tag says '2/5' but I don't see a thread. Is the series meant to 
> contain more patches?
> 
> Also, the title is not very specific about where the assignment is 
> removed. I have committed with the following title:
> 
> xen/evtchn: Remove useful assignment in evtchn_alloc_unbound

Luckily in what you committed it is actually "useless" ;-)

Jan

