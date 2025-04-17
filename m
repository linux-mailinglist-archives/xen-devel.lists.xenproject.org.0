Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A24A91770
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 11:14:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957248.1350413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5LK5-00021W-Fg; Thu, 17 Apr 2025 09:14:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957248.1350413; Thu, 17 Apr 2025 09:14:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5LK5-000202-Ca; Thu, 17 Apr 2025 09:14:17 +0000
Received: by outflank-mailman (input) for mailman id 957248;
 Thu, 17 Apr 2025 09:14:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nsoM=XD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u5LK3-0001Yj-Tq
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 09:14:15 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54c0d453-1b6c-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 11:14:14 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-39ee5a5bb66so311236f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 02:14:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bd21c388fsm12269942b3a.54.2025.04.17.02.14.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 02:14:13 -0700 (PDT)
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
X-Inumbo-ID: 54c0d453-1b6c-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744881254; x=1745486054; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A82kDhCvkQMq/U16sq8ixGZbU0/uhuP5m0cdpB8hT9k=;
        b=J79g3uxinDqcL+sQa40EPcomNuAwScGWKGD9wJi4lIa0lymIO7hQmDdpj8rAzV+q11
         o4JCz9bQXlx347dW9xbVcE/y21Z6jKnkRbCLqIs94DUe6FgBW0t/gP3Z6EPz+x4j5aAc
         p+4b4ZYvdpeJOQt53J0Sw0gLLkiewSrqTKerxBngjeX73JeYYm0Buy2+xLgjq9zmR7Lu
         mMiIOTD4rHIeuVI2Z4z5zpRdomJ6w9PYvXlKCQp7EOomalzIB8Wfs6AKlJ09H+DTF14+
         enYErIVm5EwO+ZJmoBWCswPfHRFCnTY+jc16jSLuhb07DTm0h5nyflxCFrPne2DZ9XmN
         T2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744881254; x=1745486054;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A82kDhCvkQMq/U16sq8ixGZbU0/uhuP5m0cdpB8hT9k=;
        b=Y0HASUlsRkT9gOruFt6u3aj3n+RZPaQ21bsjgj6TVuJ0SndG1Q4jtQE7bGQ9tZ/S+h
         kNTZkbIhvLgk/+vkm3r0WlNNevv9dOQIUFDJGLjekVW3bi6iN8nB6wU6wIkwRhSDwNUX
         ez3DBEm8YCVV/869W1V/0v0deejrc5qZst7ih6xnS7Jq454PhCSdGx4o5dbsvWti469g
         4n2v/E3pzm4cWo24nXFtv1HQZkGbnVj9wHSbeIZeWcV4Qii7RrX+aEEy6WvPRb/rWLZO
         VVIvZJHyaGmoPoLSHrOC4vqVCa+Z54nOVWJj19Zi+gr7tqr/bUidy2TWzDBlNul1OyRb
         Gi+Q==
X-Gm-Message-State: AOJu0YyGw4f9TRzM5p4oKqHOBkm4VskWuAmuzIW2vXSX4k+Je+FaTyqd
	id7aIZcuQ6RD+qku3hFZNDGcOAM+hh8afNrfQcXFGzFp6AL++Cu/rwy3Hgr90w==
X-Gm-Gg: ASbGncsYH4jnZczS316dqqQTjuvZY7w9Zw1I/L/iu2DVAOiwMbt3P82k9kbObZcoZmY
	lOjxSKWLDzjzeKMKXdfuIM7Xnaw7nIZdOLCmS77qUzEKKJeIaWc812kbqTVnYd9SDW7ySqtGlse
	EQcXIHwu3UNl6I7sELhxKhel7Vna8jFEBB+Q6C44rw/6YasFbCdx+zBz4vbbUQq8wNd/GJ5CP0f
	QomY854unaIi8qAQfpwdXmpTLwimd1yNy17xmnPZ6Sb59XN4p07WGN2PqiWFCdJCkzEdX+NoTvn
	m2L2mkg+cqycRO/NJPNH9zJ3PXMGE0ArgkQySBfHOBhDqxU5yY7rcqCdupl+M89laVtuBDT7HkM
	goVLWqV+5otXrjLtvm8whC7C4ErvJwg6kD4yM
X-Google-Smtp-Source: AGHT+IEzJQe+vj5QwELsvGHjG4Emymm9CSbWOoI2qjL+xx6vfsBeVas3wOLYwXU+AaOlsFqFZztdzw==
X-Received: by 2002:a5d:5886:0:b0:391:3f64:ed00 with SMTP id ffacd0b85a97d-39ee5b1c943mr4299017f8f.26.1744881253829;
        Thu, 17 Apr 2025 02:14:13 -0700 (PDT)
Message-ID: <c993be16-f269-4a69-bd0c-9998db3f4a42@suse.com>
Date: Thu, 17 Apr 2025 11:14:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Arm: rename smp_clear_cpu_maps()
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, consulting@bugseng.com
References: <b792df9c-9912-468b-87a8-bb5d81c14df6@suse.com>
 <01729ccaa66afcf046a861a565d26d41@bugseng.com>
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
In-Reply-To: <01729ccaa66afcf046a861a565d26d41@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.04.2025 10:48, Nicola Vetrini wrote:
> On 2025-04-17 10:36, Jan Beulich wrote:
>> The function has lost all clearing operations. Use the commonly
>> available name (declared in xen/smp.h), that x86 also uses.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I would have expected this to also address a Misra violation
>> (declaration without definition), but I can't spot any rule (having
>> looked through 8.x in particular) to this effect.
> 
> The rule you are looking for is 8.6: " An identifier with external 
> linkage shall have exactly one external definition", which is explicitly 
> deviated in Xen to allow declarations that have no definition, 
> especially in the case where definitions may be optimized out by the 
> compiler or are simply compiled out. I don't recall the specific 
> discussion that led to this deviation, but I can dug it up, if needed.

The respective deviation is imo bogus. Iirc if anything this is about
DCE, which isn't "definition is compiled-out or optimized-out by the
compiler" but "invocation is compiled-out or optimized-out by the
compiler": If the definition was optimized out, there necessarily _is_
a definition in source.

Jan

