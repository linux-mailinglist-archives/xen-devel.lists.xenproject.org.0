Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF84B8B0333
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 09:28:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711188.1110977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzX31-0004Jd-TR; Wed, 24 Apr 2024 07:28:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711188.1110977; Wed, 24 Apr 2024 07:28:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzX31-0004Gg-QO; Wed, 24 Apr 2024 07:28:07 +0000
Received: by outflank-mailman (input) for mailman id 711188;
 Wed, 24 Apr 2024 07:28:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzX30-0004GW-72
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 07:28:06 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 300816c1-020c-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 09:28:04 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-41aa21b06b3so22928205e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 00:28:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o12-20020a05600c4fcc00b00418a6d62ad0sm26604454wmq.34.2024.04.24.00.28.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 00:28:03 -0700 (PDT)
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
X-Inumbo-ID: 300816c1-020c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713943684; x=1714548484; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M5X0Zdmp/5vAXHNnlark0kMUOgAR7ijjsaVoa8nppOY=;
        b=g5SCgP88k2/ITboE0XoRfrWC6XYUOQWGtHYSmz5IKwFhNF4czsZ35jVnQLNR+coZJ9
         DD8eh6JeGq2S5gz9eksGB0i/9/iuQ4864A0j9oK2rU0ut4AAABtmqb/lZ4ucq0Tps0/b
         Hc+l65FAxj9aC77Oy3jWGJTK7b9N0TEcRTZeyI5BQSoGIM5sHsAg96ASAXyPeZpT9BvA
         3GbyhxnwBsQz8qVfIoQ8Vu22tpvn3NJwf2ue3vdPPVLUkDFq/RAasSeAzNU6LghSeqYG
         Lqa78R8bt0NlmjlYbISSC2S4qdbrs5/MkvlY3k0B2J9GtxojL9By4V6s2d/sBjjxxvqP
         CWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713943684; x=1714548484;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M5X0Zdmp/5vAXHNnlark0kMUOgAR7ijjsaVoa8nppOY=;
        b=eMp8YXHPgVjksWM/X30VhfNSEYBBwTZuujYzJXd4rnDVp11RuW0rTcpc2oCkS0Xlxj
         gPukLp5t6b+6JdQm4nq7Fv3jEyYVjdN6sCkVgm/j5t4Cv6HWYLjy7/921or1mc37Tcai
         vsx3GUVZy81fNnaAIdJdghTHUjN3suesdBRJcJm+Ay+BIHUaKJok02GXA44CrjGl3JGh
         fO3K7jUOKM/J44JUnUW9DRfiEv35RyxaRAsw9WcheTgY0TNFKSC5katcgsLGHOlNd5zu
         haIxfJlDjoVXJmOTXcYdTM6YRIoMqxQUFEKwWNpkN53xO3Udym2VDDl/xDUawovE1fOB
         frpg==
X-Forwarded-Encrypted: i=1; AJvYcCVVvOEadC1nKgcm8xvH0tWxhD55caD44TmhusILHQBjftorzGR3IjT143y8AUmW0DwZaz6kxEaTZV6u/N7OcwmhYewdZL3WciJ/y6Mml3A=
X-Gm-Message-State: AOJu0YyOnxzA/eFyz0zyMoss8ghlw79KM8AsFiZz3wxzowg0NyNOU4ZF
	Pai9zniqyUOL2n5yof5CReXW3BTdryVYWexhkLTnS1BIw5qR6++6d7pjqh7Ckg==
X-Google-Smtp-Source: AGHT+IE98H7ts4Ue23GqBbdTHmQ/Do7o3cOlYQJOol5X2qNHWgj2P6haINPZt/nJFyxK9l3DNcLmJQ==
X-Received: by 2002:a05:600c:4f8a:b0:419:f911:680a with SMTP id n10-20020a05600c4f8a00b00419f911680amr1491962wmq.1.1713943683721;
        Wed, 24 Apr 2024 00:28:03 -0700 (PDT)
Message-ID: <b62ffd78-62a9-47f0-aab7-2123f6110c76@suse.com>
Date: Wed, 24 Apr 2024 09:28:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 08/10] x86/hvm: hpet: address violations of MISRA C
 Rule 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1713885065.git.nicola.vetrini@bugseng.com>
 <063ad5abee7765a921fd7f68372a4d7fe0e04e54.1713885065.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <063ad5abee7765a921fd7f68372a4d7fe0e04e54.1713885065.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.04.2024 17:12, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



