Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3BEC8EA58
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 14:57:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173936.1498924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOcVC-0005rW-9a; Thu, 27 Nov 2025 13:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173936.1498924; Thu, 27 Nov 2025 13:57:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOcVC-0005ps-70; Thu, 27 Nov 2025 13:57:42 +0000
Received: by outflank-mailman (input) for mailman id 1173936;
 Thu, 27 Nov 2025 13:57:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mf1n=6D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOcVA-0005pk-6S
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 13:57:40 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 068c80e1-cb99-11f0-980a-7dc792cee155;
 Thu, 27 Nov 2025 14:57:35 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-42b31507ed8so836844f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 05:57:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1c5c3016sm3895526f8f.1.2025.11.27.05.57.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 05:57:34 -0800 (PST)
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
X-Inumbo-ID: 068c80e1-cb99-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764251854; x=1764856654; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=d9YbivnNaLxUimlbDhUN4FRFdoKH3VoIwS6V6bM9kqI=;
        b=Cvkyp4n2RoZB3+yU4bO6ekvVHgL0gVj0S/CzkL3GxZzkDoQotocdwR9SxzaJlmcC76
         2YjAaKcDiAlBvB9FU36KNpSj/gvwl84P7+mfnDAeiz1oYflNeFktwHu7p45uPwoc40PJ
         8eU20/BmiBhSyoXNrpsmgc8UdAluBu4kOHlg+MwSkCTOem5/rD8wowOMF8fGOSgoW2Yl
         Yay0c4AH1NMsrSlvIITgKPjhqWv4Bwc6Xek296VH5pgUZVQZaeZgWai+8dNJnDuV9wki
         FK2HSnnSDHKGtTnIg6ATZ3wCfja/PYjSP78zH1HpzVwD8Ti3hdVzGZUw0CySuukfZLYi
         2hMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764251854; x=1764856654;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9YbivnNaLxUimlbDhUN4FRFdoKH3VoIwS6V6bM9kqI=;
        b=gBX+xxEcw91f3AjN9YuAHKa8wcl0Ycssvjnz7W02Wj+re4gumfQChTNaYCBULQETkT
         x5dDQOsQOP0l5K8JszsV+yZzq2drKjWSZdJtpX/A+85XjsNiOl37EY+DQJnlEN+nbkok
         ZzRsemqbkriyRuCJS7D44hDyuA/g8hvKs4EpxdFHa4dDBpwf3DNDRYM8tp4rBmtAADXi
         e/ckE62FvNTqr69vAl4Kk4kX6bYOONQHjxr5RU9TbjzGPtvFW4Ly5ZRWmbkE4wlP5Ph8
         QHYgl2Nqhr0XDMVEGn5LywaJN5t1++Jkv/q2SWyMrD53ouWGz+gnRx/DhlnYB6/dbnpY
         wZNA==
X-Forwarded-Encrypted: i=1; AJvYcCUJxOMuUjqa/yTVRpUxwmJoxEGk6GAJNSc5fE5hxuB9VQbSI9StI/oxnMV7JyB9byc1taSHPHzi6/A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzCYo9SxeqquvesREuK9q62EmewLpcwSTl8tPr5lkaIRRvaLgLI
	7aoODgkJ8WZHKsclTA2b/0HO/87y9ezvVBOIdtOoqEyA9cSqFoMvLXDr3ImFyTL5+g==
X-Gm-Gg: ASbGncv/Oyp8oG0fpKXiO5QUaj5+oIPIDkW7B8s600rl8dA0C4rVo5iWx1RFBNlRcaL
	2lxu+jw8sdrp/UHT3y/3YBPiMD3wrdBorD5g0gjBznpxiJOtkW8vKz91dMhyURdoaxM63VhzGU5
	pbuQ0Vlwr0uhL/8uibs9M0a72p39HJEBo7xMNF2+2PzpZrQWOum0aMwI71tl2B9dIDe4l34v5se
	knElelAWuaZlRnFUeh8x0qAiR140uSsvkQSj5r3vqGlMzA+nQOs3LTZCBJiolN1jc10MPsz62Qc
	4SqrS+k8yb4ApWTlfl6Tq7aPzLYfURREn/LK50ClaD8XRBjRDoNriHz1juvd3PLDsBXYo+bYgdm
	4tGjHnY/hMt7EeWZ3+tCYVd82LGl1Y9cor8FrBW3N5U419WYIbed7vlL8bXdIqMdDxS+dEjVYdi
	36pFuCFZgIwbVfheUU6WL2Uijv8eRcIg6PpcvMbadH5ZGB3qdy3VTj5eaEHinXR4DK2a8eyKVyz
	s8=
X-Google-Smtp-Source: AGHT+IE6Gq5kFEwabpMoeRAqgXQTKE7oLVY1w9hiUnApoZqoxBEoUgYXcT2wuDyBSVyi2PNcQB8XUA==
X-Received: by 2002:a05:6000:4308:b0:42b:5567:854b with SMTP id ffacd0b85a97d-42e0f356534mr10358836f8f.45.1764251854381;
        Thu, 27 Nov 2025 05:57:34 -0800 (PST)
Message-ID: <4d99d2bd-a495-48d7-82ba-bd7f5d9c2104@suse.com>
Date: Thu, 27 Nov 2025 14:57:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] x86/shadow: Replace guest_tlb_flush_mask with
 sh_flush_tlb_mask
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1764248710.git.teddy.astie@vates.tech>
 <0e8e2607de4f484e7eb37d64799bfc53a56d3fa9.1764248710.git.teddy.astie@vates.tech>
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
In-Reply-To: <0e8e2607de4f484e7eb37d64799bfc53a56d3fa9.1764248710.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.11.2025 14:39, Teddy Astie wrote:
> Introduce sh_flush_tlb_{mask,local} variants used to flush the
> tlb from within the shadow paging code. This is meant to decouple
> shadow code from the more general guest_tlb_flush_mask.

And why is this desirable? You now open-code guest_flush_tlb_mask() and
guest_flush_tlb_flags(). That's a step backwards, requiring a meaningful
win elsewhere to balance.

Jan

