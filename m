Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F78DAF5B98
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 16:50:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031310.1405124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWymv-00058Q-RI; Wed, 02 Jul 2025 14:50:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031310.1405124; Wed, 02 Jul 2025 14:50:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWymv-00056A-Nu; Wed, 02 Jul 2025 14:50:17 +0000
Received: by outflank-mailman (input) for mailman id 1031310;
 Wed, 02 Jul 2025 14:50:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWymu-00055z-IE
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 14:50:16 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcb24f87-5753-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 16:50:14 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a6d1369d4eso3860912f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 07:50:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3642e9dcacsm1225221a12.12.2025.07.02.07.50.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 07:50:13 -0700 (PDT)
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
X-Inumbo-ID: dcb24f87-5753-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751467814; x=1752072614; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SIrGmeqdmHuDK4RnNUr2bJEzDpTjTb03+vFgjJwH/0M=;
        b=dQCX/xDpiA301BxAAOadxcOdGkBl6Svk1ue6vRXgqPDapx8+IM2Ixr7A87mfmw47Wr
         /eqopcicpP2lNvQNmlZjpIsFLVF5bYuiUP/f8QBwmYrMNsfZrkaw0ErTvYRgcjArf5pX
         6CPkj+n0vEqDLJsf4qWDqYYBofDHHzsd+7iOQFWbReFEtebrC0XTYcX6QA2ImxFTLz7J
         CTo91OpSKFVgMVhZnid/FaBiKjVTLIyR98xZVG7xqwon99azbnz++mYMymzaN7CeqXq8
         cWcSECmytg2nTGJ/0oSuJ4HKTdPhiOOrLOld/dw/1Z/s+i8o6NHhOwB22uKeda08h3aP
         d/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751467814; x=1752072614;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SIrGmeqdmHuDK4RnNUr2bJEzDpTjTb03+vFgjJwH/0M=;
        b=D693UF4vapUOAdNLZemBOWe7rK+wvNS8lupT6jYt4obcdc0yhMvtAvb6we3dIbaQYF
         2fWlns7G05iEYQxLsY2tlaf4UP+eRcHVUv/TkG+XjqfIjvRj/BueWI45wYrqPq1tdSJL
         NZGuxqi1wRB0O6udRE0lZOGHmlIjwC9GkWrWJKt1X4yhW3Tl/7RWMT4mmLdmo2JcSeDB
         oEJHCLJJ2y7JcJQFj/Spk9WNpdvfFv7AeeibPrZwyhcDKYt7OxVsDBvc6WGLdaIiIB8S
         uBWqg7gmNJbaw32nSX0YTfYydS1WKhrfP+QYcjJGyF2MnRWMvolMhpFgET7PvQBS2xme
         Zd+w==
X-Forwarded-Encrypted: i=1; AJvYcCXXmp81ET3LwkzwDEagRVxa2Ax6VBpdBoSHvaBMEtjAIP+wn+9INO5umFAXIQc4XpmnHYF47AsU8/o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyUZE9JQ8aMvFkZ1fMOPWM//kEUO4U2AIMBrgri+wBFcmPWVCnw
	Qp0BTpNj3LTe5FTKXsxRB5L5rWu2PcZ0OfyHiz6LdQIO8sJBUH81m7v0J66iSrfKhQ==
X-Gm-Gg: ASbGncvaVg4AsQ50jLgdH8S6FDmOh9bPdwshrmaLPugwXyTApOTHgUMmesQ4Gwhyk8y
	1UvI4lkeuKR4TvlZqw1pIo+5pKPti6iGdjZgXJbZMJDKAF4PJesH5CucaG2jJB+Clb7lrWWE5H0
	i367eT1OSXVzTOUvjzPiExD5bO72rdBJSk/12gn3yqrM5HDtEGnXM8ERXmVzpOpGFJVjtkqHD3p
	ofs0TmVunpHAPwHyR2zZHXwcYT3aIPaNIV20UGtII0Xf5nOBiW4nvYwqYxRAZRpQdM/MobcoTRf
	rmFnANDnsb4t91n4YB5sfOUMlymZI/7FvP8VImlueHQZ7coWR41qkQ3dw1V6E+KhnaRYITE5iLs
	nGnbb7ysu5eNeW6qUMSP7NIIeISYVY60xsdJtlPjsMT2ThC8=
X-Google-Smtp-Source: AGHT+IHNuslZ8sifL18vgvKe886EWTU1qYcgcQmt/XBdf5K02NnnnxmtV2IggiUxcvQiS+0v66/jrQ==
X-Received: by 2002:a05:6000:1887:b0:3a5:2d42:aa25 with SMTP id ffacd0b85a97d-3b20110b277mr2318975f8f.50.1751467814028;
        Wed, 02 Jul 2025 07:50:14 -0700 (PDT)
Message-ID: <22ff462d-11e7-42ea-806b-7a521ce67417@suse.com>
Date: Wed, 2 Jul 2025 16:50:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/22] x86/hvm: check for VMX in SMX if Slaunch is
 active
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <25de2a5ba43629cca33b96d20c77f19d64096242.1748611041.git.sergii.dmytruk@3mdeb.com>
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
In-Reply-To: <25de2a5ba43629cca33b96d20c77f19d64096242.1748611041.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.05.2025 15:17, Sergii Dmytruk wrote:
> From: Michał Żygowski <michal.zygowski@3mdeb.com>
> 
> Check whther IA32_FEATURE_CONTROL has the proper bits enabled to run
> VMX in SMX when slaunch is active.
> 
> Signed-off-by: Michał Żygowski <michal.zygowski@3mdeb.com>

Apart from this lacking your own S-o-b:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

