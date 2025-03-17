Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EECC9A657F2
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 17:25:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917464.1322379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuDHM-0000gA-Gc; Mon, 17 Mar 2025 16:25:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917464.1322379; Mon, 17 Mar 2025 16:25:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuDHM-0000ed-Bw; Mon, 17 Mar 2025 16:25:28 +0000
Received: by outflank-mailman (input) for mailman id 917464;
 Mon, 17 Mar 2025 16:25:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuDHL-0000eS-2Z
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 16:25:27 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ec3c3c2-034c-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 17:25:26 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so24153495e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 09:25:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1ffbcef5sm108510625e9.9.2025.03.17.09.25.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 09:25:25 -0700 (PDT)
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
X-Inumbo-ID: 6ec3c3c2-034c-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742228725; x=1742833525; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e3U+Gwajy3gbFJlLeomnzcVheV4svf2YItnasUFghbA=;
        b=LkcrlduvG30wqCi2KQkNXUvcjC/ri4V+5uXqiqcp45mxSF4iPMlxegoKp0Fko4hnSz
         n59cAPnKrk8s+0als9n7wc+MuArt/ywvbS1wbqTUfa/xQNS7nAXMbBhHRX/jjOZWPb72
         7uHQXKbsT3ta0RunQqcO+ISv3UQJxyd3ITo4vHZx7WcxbathkP7464EeFEt3C7Mc8KLS
         5T897d3dJrHAGR9Nl/s1XDGSmUoYpZe6UAskclS8QajrtTGLFzGLp3/06sXlB/ucAU8W
         DGqKytL0xIm96HHFJFZM04VpryPChnvJ0vZjKkvmKFozNbTwXONuXZixDW70DKwRkqrU
         QvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742228725; x=1742833525;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e3U+Gwajy3gbFJlLeomnzcVheV4svf2YItnasUFghbA=;
        b=Mj55tztnTCyUF6CP9/8/eeXUeblaPOkvm03+EzoUmBHRF3dckw1QtBZwxPyoe1C+h4
         tF4S7Fxv4RZ15bDcmuptmA+MGh1Ftq7+uLDvZIBXAqPNl4OMGP0uHM3jMDLmsWmYSlk/
         hfEpIA93C0P9YsLeyplL+mLMEBtCwbaJWNRtj7J3JzaVmz3a5m2JrZp/vlkiKYG65TOf
         Cy3/uRlk74fgWmw6SpdGVPHk9FpMWPaXZ7d35rYctOqnp6/4hMIY615RcMqbPzDNj+ZR
         S+EcAzmUtkeGtwokGzxWeHSbAFGMxzzJvTEUYWKfnJbOgjmFFwyM8VAPNVmN20+op5Ds
         l8mA==
X-Forwarded-Encrypted: i=1; AJvYcCWIe3Q/FmZBrryiu/9sUX9uNX7Tz1QjiLPGWzg0iuy/KRN/T2unKIXROnHQju8A1Ral/raelxIZCm4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRpVQlM8L7VSZKhzRrp0SCCSyiaG+gfXJ88sScZnQfIX0cXNBC
	1z1dza7AMaGc+ym9E8fI+MuES+36zVOwTUGUbVu/eN3i5avtT0hhO/WXldmEWw==
X-Gm-Gg: ASbGncs7oLXrnzsijIVYosp1Nv8oa1nFRE5lKiGneMU/HLSZRc/AhcfDbyvLwrjhRRA
	7LLBp86ui97L4iQG0ons4TllbbtuA2YCaX7qXc0zTfVp4WoJIaPYhzQOOWtKzYuIOjZWSMrvclk
	cVHDLnrW7aufQeHbmi5Xo8wgc6gRMT5W6d9BEDzKSbuqerWOMn8o2tdSQMhwyPuZEx+J6UwrblL
	1wJPmzA2TEwmBCpc9FMCijCSVLFIYaojyoOhaH8LwBrwA/IXEQGOJYsY0US9sLqZEumg55pDKSI
	+Gq4Z3UPQdBZoZEr7q9+BCmnLj0GrCjRqm8BCzAXW3I7/1Qnyi43M26sGg/KoRQ52nfJbycjYJg
	1YzaGX1FH1U5qTzZ6CUXMqDnpVgGbkQT5RdRpnQUt
X-Google-Smtp-Source: AGHT+IFPj3CQcN5agumCot86iiVTrsoAT/TfSJFjv2ImBF8BsC8nhCxoJEIwW7pPsv985MiGK5pVCA==
X-Received: by 2002:a05:600c:a21b:b0:43c:fcbc:968c with SMTP id 5b1f17b1804b1-43d1ef4b09amr139858095e9.7.1742228725407;
        Mon, 17 Mar 2025 09:25:25 -0700 (PDT)
Message-ID: <fd28943f-33c4-424c-b05f-f383acb30ea4@suse.com>
Date: Mon, 17 Mar 2025 17:25:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/23] xsm/dummy: Allow hwdom more - except targeting
 control
From: Jan Beulich <jbeulich@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-18-jason.andryuk@amd.com>
 <66291536-a164-48a6-ab3e-304dc6035ed6@suse.com>
 <a89753a3-c8e4-49fa-bb4d-744ba16581d6@amd.com>
 <94a6e5d4-4491-4fb9-b3b0-067164acb973@suse.com>
Content-Language: en-US
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
In-Reply-To: <94a6e5d4-4491-4fb9-b3b0-067164acb973@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.03.2025 17:23, Jan Beulich wrote:
> On 17.03.2025 17:17, Jason Andryuk wrote:
>> On 2025-03-17 10:28, Jan Beulich wrote:
>>> On 06.03.2025 23:03, Jason Andryuk wrote:
>>>> Allow hwdom all perms, except XSM_PRIV, and except commands where the
>>>> target is the control domain.  This protects the control domain from
>>>> hwdom while allowing the hardware domain to serve as the backend and
>>>> device model for other domUs.
>>>
>>> I can see why backends may need to live there. But device models don't
>>> belong in the hardware domain, do they?
>>
>> One of my tests was on x86 with hardware domain running QEMU providing 
>> virtio-gpu to a domU.  QEMU needs to access the GPU for virtio-gpu. 
>> Also HVM/QEMU PCI passthrough would need to run from hardware domain. 
>> for the config space access.
>>
>> I viewed the hardware domain as the place to run the device model - sort 
>> of like a stubdom moving out of dom0.
> 
> Hmm, yes, when dealing with hardware made accessible to a guest, the DM
> would need to live in hwdom (in the absence of stubdom-s). For non-pass-
> through guests that's less clear though.

So perhaps I'm in (conceptual) trouble with this kind of dis-aggregation:
To split ctrldom from hwdom without moving DMs to stubdom-s feels a little
"incomplete" to me.

Jan

