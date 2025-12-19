Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1732CD0399
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 15:17:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190701.1511019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWbI0-0003nL-47; Fri, 19 Dec 2025 14:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190701.1511019; Fri, 19 Dec 2025 14:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWbI0-0003kj-0f; Fri, 19 Dec 2025 14:17:04 +0000
Received: by outflank-mailman (input) for mailman id 1190701;
 Fri, 19 Dec 2025 14:17:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4Y5i=6Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vWbHy-0003hN-9G
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 14:17:02 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62b45071-dce5-11f0-b15b-2bf370ae4941;
 Fri, 19 Dec 2025 15:17:01 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47aa03d3326so11124855e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Dec 2025 06:17:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea1aef7sm5074395f8f.7.2025.12.19.06.17.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Dec 2025 06:17:00 -0800 (PST)
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
X-Inumbo-ID: 62b45071-dce5-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766153821; x=1766758621; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DXd3tYP7qWfuC+raRITatwO3wkHhdTkpkSAU3KL2bL4=;
        b=ORno2MJYU2mxKsLq7xife0SRsgJKSFbz+eZEJWBiOoL65PltR7lrDhTzCJ3XLLxOR0
         VPqokomvQBQ2BReXGE7dYBt6GBw8gBaTE3aE5e1agjtfrszI7dCFGRv6M0gmzGzfS8gJ
         +XN3u9Ilox06wjnV3kGW/k6RawWGctbux7tg4is/EUvn+bpc6LrFmeHVGedyTVU0U1Hv
         j7n8S7c7UB+5dpxru6p3aCdM0yL8EXXi8oYKnuXVAbdaO1IbM+cfi+evOEBi8UU3LSn5
         lpPxN+qXJ/p5OpM9yzsivZQ6F1anugYP8yfOu/qrEg197lhBz+VKxx8ZuPunBWIficy0
         6Rkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766153821; x=1766758621;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXd3tYP7qWfuC+raRITatwO3wkHhdTkpkSAU3KL2bL4=;
        b=TpYT8SwPSvGF/xMziJ0ZLGLissU6LIkP6vKAPZkM8pfQRKFlZGXevdAoFB6PwbVxe3
         cKn23nUQGszZuILFbCooeW2KiZOe5otvFlndsCTOwYCcjBCxgZGJgs2lKdWp/5WGMCYm
         qjJtrq+wpxWVBWPU2sNS7dlb+CC3PUt7Kj9ALLFTaPx3vR8SkbJNpLPe/hQX2+SveAzJ
         XDz2ysGpda46a+mHR+zTrK79wRGdsRUdYrXU5zEfW1DPBtdLd1ahM5Bx6H7gF+w1DaNa
         auRe7zhrHl4Kw+XWoEi3TaQuMb+FtMTQjkEzAEbXPnee2lkpPLXX9C+tOck8pOk0ttIg
         bVWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwZzsSfhYyZx4VP8Vg/GQptp+ara0LujrkorAhu8TiYLhGxZpOuos4zjzZVyx8z668UFNSmT4Kl/Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz9m5rufwy4mfUNz9WD73rpo3FvcjTtXKO+33dICVG0fVYwHpHK
	VCmp3TA0Bp51R9KCZSFZ7OuG3RM91fRxbV5SunspCkp2YFPi0HRm6NlVBUILQYS9pg==
X-Gm-Gg: AY/fxX4nEnn5ffDYQRMc6otXIxcZXmN2vFyefZcFmv1LHmiKegTO83ZHM+YXpmQl5D8
	OloDMJ+TnbxDad/P7QbnV0MhKAmET/UwfjjqZstueIyIFxLHy/Ef5Hna1b7twMjthY8th+Y+Rtw
	40ODgXuGDLK26kSxmNf2tIOnEKmGULE6gssceEDfbZhcZ46Uug4em3XBMoqvbqBvcyZPuk732up
	/zQuusLMajcN6n1T9PQhkmTVJ6/53LEt6iyCjx/Xw4q/OxUE6edDMCOEIzNpJesfDvU0GJ8Dwf0
	csebM626roaLsa9PJepLa8M+GLOa8s0DF0hJLTfm2izr1lokc6slSuS8PpijajkN/vPYCh5Tdgq
	+HXc9ju8cdcdzGS/qDJY63beT7FDZPalRsJ+cxpVhGAiPUGW2OLTkschYlFo7ac4BqfA3/DTVq/
	1WDnBAkpbngNL66K0FTHFaEqzaVkbSuiWUdrREK4T8oww363da3wzkGbZO5vNZXiSBxyJe3Nz9t
	6o=
X-Google-Smtp-Source: AGHT+IFWHP+PEZ3r2mp3Y3AFF0OfmTMpI3tOo5Nwf8DG2EKELxoeKEZnV86Gk4J/M0+BhItEGlWhlw==
X-Received: by 2002:a05:600c:524c:b0:476:d494:41d2 with SMTP id 5b1f17b1804b1-47d19586aebmr24933685e9.29.1766153820598;
        Fri, 19 Dec 2025 06:17:00 -0800 (PST)
Message-ID: <8b045139-10dc-4b07-9ef6-d3b9c8b1efbb@suse.com>
Date: Fri, 19 Dec 2025 15:16:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen/arm: optimize the size of struct vcpu
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1766053253.git.oleksii.kurochko@gmail.com>
 <946a1c2cfaf4157074470a653bba5baa8561ebbf.1766053253.git.oleksii.kurochko@gmail.com>
 <ea01af72-c94e-4203-90c4-eaf68174b576@citrix.com>
 <290b8d4d-f853-418a-ae01-aea2f62b4f56@gmail.com>
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
In-Reply-To: <290b8d4d-f853-418a-ae01-aea2f62b4f56@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.12.2025 14:32, Oleksii Kurochko wrote:
> 
> On 12/18/25 7:15 PM, Andrew Cooper wrote:
>>>   int vcpu_vgic_free(struct vcpu *v)
>>>   {
>>> -    xfree(v->arch.vgic.private_irqs);
>>> +    xfree(v->arch.vgic->private_irqs);
>>> +    xfree(v->arch.vgic);
>>> +
>>>       return 0;
>>>   }
>> Free functions should be idempotent.  This was buggy before, even moreso
>> now.
> 
> Was it really buggy before in terms of idempotent.
> 
> It seems like xfree() can handle the case when v->arch.vgic.private_irqs is NULL.
> Should I still have:
>   if ( v->arch.vgic->private_irqs )
>      XFREE(v->arch.vgic->private_irqs);
> ?

No, and iirc Andrew also didn't ask for this.

Jan

