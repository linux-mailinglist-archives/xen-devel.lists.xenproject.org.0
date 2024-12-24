Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AB09FBA99
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2024 09:43:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863035.1274534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQ0VP-0004ZK-1W; Tue, 24 Dec 2024 08:43:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863035.1274534; Tue, 24 Dec 2024 08:43:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQ0VO-0004Xr-VA; Tue, 24 Dec 2024 08:43:06 +0000
Received: by outflank-mailman (input) for mailman id 863035;
 Tue, 24 Dec 2024 08:43:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mYL4=TR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tQ0VN-0004Xf-7t
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2024 08:43:05 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1718ee2c-c1d3-11ef-a0da-8be0dac302b0;
 Tue, 24 Dec 2024 09:43:04 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-aa6a92f863cso647554666b.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Dec 2024 00:43:04 -0800 (PST)
Received: from ?IPV6:2003:ca:b711:5c39:9cff:9fff:3d81:6f3c?
 (p200300cab7115c399cff9fff3d816f3c.dip0.t-ipconnect.de.
 [2003:ca:b711:5c39:9cff:9fff:3d81:6f3c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e89595fsm631741366b.66.2024.12.24.00.43.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Dec 2024 00:43:03 -0800 (PST)
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
X-Inumbo-ID: 1718ee2c-c1d3-11ef-a0da-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1735029784; x=1735634584; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NRsv3Pew46/5knXCm23QGnN+W3B7FIWICmjnciREfFs=;
        b=bs90Ke1kRZ+hpAXWI8Kzg7B5mUY63i/QCppRaq3sv/gExv0lw0YGcFmkWzgn2ZTkPE
         gwSHgmyJHMxXzasOaQQTB6SBagZfxPFAaZFK0jyqfB+MnFDn+EvKFv50wOyWOwrk9us/
         9UuvnLV4s2+QzK6Q6Hbyjd/+9D8zF5GpvonowKaClZqaKsLuKxTgOg+/or60e56280s1
         fMlvXiZk2ZqFJQi0WdqzH1AOZfUliSYQ42/XHY0FFYmLELxMK6KfFah3uNuJRDSg5K7p
         MoOWhXXQH01eqPoJ0UKbS9jJIBIVL6mvj0PRzC0Mm+3QoSIVpJxa5QUe7Xw3zd2QDskJ
         sewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735029784; x=1735634584;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRsv3Pew46/5knXCm23QGnN+W3B7FIWICmjnciREfFs=;
        b=sZ3px/0FG4+AQfGL2/VS1icMr7hojldgp++lxLZF0dNX4bB9tnLYfuOWw3PwSx3ZSD
         YZLJoxdd3ZiDoJjBoxfJDRI+QxdOrvJC+vCFI/p737TtXCTqbSt+Vc99g4oHV4B6pi4n
         tDzum7eXIyYOgS17ATCs2D7cg/qQkCm9hsq6EizFsSG8nN+AEZk6ytzWw5PSg7sniqsS
         nvYPUH2dUjhLYnbVElYL2s4pwStNxTHx3dVtHnD9ohCVvmh2nhqf+fej1zhyXz0htiYn
         0ZBCUtalMYzsD6Jev1/8mdD+shhdmx5dL6POkB8mwr1FfdcD54OR0y4bgrMBowb98Dpi
         9a9w==
X-Forwarded-Encrypted: i=1; AJvYcCUAP4xN/W2wqn93Xcy6efuTVsUM67K1fgVMH+V+QDyabOZd8tp4t+rsysFUSAFBUzBysEgkT6HJFJY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHPihwrl0KMZYBuoMS5OkAb9zH1fmAGjUWVwU8ebt/oNQtiyMs
	ciMTNXfjTgFqTgrY99b79tT+o41G1AD8TF8ICWChs2A3lTa6AuB298Jhvav9taFOvlSoV+yYzmo
	=
X-Gm-Gg: ASbGncuMqjewip2y1kWOZ4TEOUfe7a0w9QeYVSZOkA3yK2+OVjBnqVckzor/gDnaFov
	q/mGxPdKhqQ8B/YNb6qNvD7o+uQQwroqlYLDeD1GxewIxxsEGHEwNfPup7l83QPXQyr1t+HyMv5
	633B7GHLnqToLpKR73aQc0RRFA8KKNbIhK7g7yUgBT6/ubI8/z0gQx8dxwU1y+pDI7kYGGnQSsW
	EBgTNbU7LorsTdd3abnyQxIHezXe829OtKlMtVJgqmaqAqnq5ocrOeJ6hRz8WOX7P1kxOZk0Liz
	AuZ5bGZ35uo6qTXvq59RlDyxQXdVPZVL2ZsuMdOifJBPhDnVJvRxG1z8LUDtHOlOrMvzGh/VjnM
	DIXUIuL8jd9inoNw=
X-Google-Smtp-Source: AGHT+IGwV0VC/S8HtPY9g2kQXo/82KbmUQYoUrfGukndvNMNu3wTLeP0rEqGXCT8aXP2SePm3v07jg==
X-Received: by 2002:a17:907:3e90:b0:aa6:abb2:be12 with SMTP id a640c23a62f3a-aac3354ff4dmr1153566266b.37.1735029783718;
        Tue, 24 Dec 2024 00:43:03 -0800 (PST)
Message-ID: <c25666d7-f485-4cb3-9f30-d5f6ea58857a@suse.com>
Date: Tue, 24 Dec 2024 09:43:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/tools: remove dead code
To: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
Cc: Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
References: <20241220165837.937976-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241220165837.937976-3-Ariel.Otilibili-Anieli@eurecom.fr>
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
In-Reply-To: <20241220165837.937976-3-Ariel.Otilibili-Anieli@eurecom.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.12.2024 17:55, Ariel Otilibili wrote:
> Default switch case exits directly; these instructions are never reached.
> 
> The file was taken from Linux; the copies have diverged a lot since:
> 
> ```
> $ diff -u xen/xen/tools/kconfig/expr.c linux/scripts/kconfig/expr.c | wc -l
> 984
> ```
> 
> Therefore the change is only applied locally.
> 
> Coverity-ID: 1458052
> Fixes: 8c271b7584 ("build: import Kbuild/Kconfig from Linux 4.3")
> Signed-off-by: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>

As the title of the commit referenced already clarifies - this is once
again code we took from elsewhere, so imo wants updating at the origin
first. Then import that commit into Xen.

Jan

