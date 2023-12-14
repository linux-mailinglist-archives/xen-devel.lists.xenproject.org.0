Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AD6812CC5
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 11:19:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654420.1021333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDioJ-0000ct-OQ; Thu, 14 Dec 2023 10:19:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654420.1021333; Thu, 14 Dec 2023 10:19:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDioJ-0000bD-LN; Thu, 14 Dec 2023 10:19:19 +0000
Received: by outflank-mailman (input) for mailman id 654420;
 Thu, 14 Dec 2023 10:19:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDioI-0000b5-Tl
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 10:19:18 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c8b0fa3-9a6a-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 11:19:16 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a1d93da3eb7so916779366b.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 02:19:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v20-20020a170906489400b00a1de512fa24sm9109838ejq.191.2023.12.14.02.19.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 02:19:16 -0800 (PST)
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
X-Inumbo-ID: 3c8b0fa3-9a6a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702549156; x=1703153956; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SiyksQcBmQT3PvLWawxm5b6xgs4BZhJSJynakMVd7oM=;
        b=UNxMeQhseR/Myr2t7jJArRwE9Sc9LVilwjezT9VkQ4J15/kjcpl6h4hpNvKSH9ApsG
         gXklMU9o0O9UsRF+AeDCRTgoIiY+/3UUVPwvmMBYhGenzl8w3SYsevxogghOpiwkX5am
         4Botn3ttJXAIbej67xXxR1O+DcF9K2VRYRqfIn9k3SPbm8k0aUe/TmAMZA0oufm2foaT
         RzCfVA5LeOoir9lcPzzKzNh1ovsDE9ptYtekmRId0r01L3FKtnfceDjzQ7UH9UBE9rYB
         SCXP5e3yxxuhrNxVq2njv3Uz5EppWP3x6f7ERu97uyA7h9bP5awTZ48f39OIXIDeC6fa
         jO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702549156; x=1703153956;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SiyksQcBmQT3PvLWawxm5b6xgs4BZhJSJynakMVd7oM=;
        b=IKpTssusyuFZXVVd/NnG8/Uh0AWMY03j58pojeinhuQFxz2D8JlEGGPub/dr9UmS8G
         WjMov/+pQN4ozOUez+lZcg5nn/tLX12uz7oXmQaznRRqzvaIBxN+tJ8FirfgNNP+oB2c
         PGMFb0faFqSvGbk+op1//o42V3gA8NumeMlEd3ckk3QPN0jAR+7JOUf5RK6WrJgJsr9W
         8lA4aIPxek+KmPFtu5fRybA35tsNhWQiwpHAchdZyWROfUGygAaZMMmXohGaojMwj4ja
         zIHMwbUVYwH5BWxRrjNpol8s5xHIabEmFmVRV0expp3XNPLcIcIKOb+Rw7WTE1IiComD
         brXA==
X-Gm-Message-State: AOJu0YzMECsFliVwHuwfmufO9Tob41VcqKd3zKW075azIoXYtzlyArqp
	ULYI65OuNm7u+CgCEq0Oa0Vd
X-Google-Smtp-Source: AGHT+IGcPEtFBvkvBXtT/ngoNkAPiY8aoehAzLF2M1r/D2Ir1FD+mAZE9IplwbU7GVTcXv5u1gTTZA==
X-Received: by 2002:a17:906:1787:b0:a19:a1ba:8cd6 with SMTP id t7-20020a170906178700b00a19a1ba8cd6mr4991638eje.116.1702549156430;
        Thu, 14 Dec 2023 02:19:16 -0800 (PST)
Message-ID: <6c5fd48d-a417-4731-8611-4f5f97865d91@suse.com>
Date: Thu, 14 Dec 2023 11:19:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/x86: ioapic: Bail out from timer_irq_works()
 as soon as possible
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20231211122322.15815-1-julien@xen.org>
 <20231211122322.15815-3-julien@xen.org>
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
In-Reply-To: <20231211122322.15815-3-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2023 13:23, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Currently timer_irq_works() will wait the full 100ms before checking
> that pit0_ticks has been incremented at least 4 times.
> 
> However, the bulk of the BIOS/platform should not have a buggy timer.
> So waiting for the full 100ms is a bit harsh.
> 
> Rework the logic to only wait until 100ms passed or we saw more than
> 4 ticks. So now, in the good case, this will reduce the wait time
> to ~50ms.

Isn't this more like 40ms (4 ticks 10ms apart)? And really somewhere
between 30 and 40, because the first tick has already partly elapsed?

> Take the opportunity to change the prototype of timer_irq_works() to
> return a bool rather than int (which was already acting as a bool because
> only 0/1 could be returned).
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

