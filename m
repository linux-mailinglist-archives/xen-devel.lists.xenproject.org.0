Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F3BCC187E
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 09:25:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187657.1508997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVQNB-0001YA-B2; Tue, 16 Dec 2025 08:25:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187657.1508997; Tue, 16 Dec 2025 08:25:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVQNB-0001WL-87; Tue, 16 Dec 2025 08:25:33 +0000
Received: by outflank-mailman (input) for mailman id 1187657;
 Tue, 16 Dec 2025 08:25:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t3Kb=6W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vVQN9-0001WD-Oy
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 08:25:31 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3982ae7-da58-11f0-b15b-2bf370ae4941;
 Tue, 16 Dec 2025 09:25:22 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4779ce2a624so47385725e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 00:25:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f4a3e9fsm228021635e9.6.2025.12.16.00.25.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Dec 2025 00:25:21 -0800 (PST)
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
X-Inumbo-ID: c3982ae7-da58-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765873522; x=1766478322; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zTOoM9o/HE5483B7mrP5RncqiAifKbRJpXOBMlfbm+U=;
        b=BRDk5d4qHjba4voPsWGTVd5EYl0oN8ELCgoqL9FND3TLr4YvhHIVsjhvBQWnR9B8El
         ZRp8xM3TC5AcA0jahzApZc7E8wpDsbOhAut1CaaV8ufT/hHwd0XfL+SI9i9HA6/t3z60
         nGXNdAIDv/tYPeVW9YhtW1rMev78SK9eDpXXAZ0UKuoUKqzjiI/Xtn18yXIyUDd60Gna
         HToVOFisbsEx1F4qqvDl8Ve2blJukf/Cy44cgr8cWQCNRHg+mohCYWNysOuXJoiyOpLF
         NZvyyTdIjWNkU9oXmzip4zc2nWNayj5UucZXBUex5ZsNsxCuzqCij2qzoew0zYCWKg3+
         8hNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765873522; x=1766478322;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTOoM9o/HE5483B7mrP5RncqiAifKbRJpXOBMlfbm+U=;
        b=lmJ3THlIzGVteNGjr5EitStUamWcQaLa7fiRBJNCkTQMYwIe69VXkfQHrdCyjPSYNb
         eALob3pFgqYFBt3nslwsOcJqcYTCuk8Ly7WxLJ0pClhpoD316Lq3+/9mTzNzM+/RNueI
         /BIQ149SEv3555r+wG2br0/sEl6WhPwEH4paqUSiae3wrNQyZKfv3OtYM5nO9/rqEpUq
         xy+oF6a54fzGXpXMqFLO8fJTtV9PrSfUggO65qVzG9HXWrXtlgHCtqHmYMMyIypCjc0D
         OxMJMPWx1xFs0feMGw9CNV6VjxC9WlstxgEoCZWxPJwIX/7oz1e7dicDZ/cLjy72/vg3
         crBA==
X-Forwarded-Encrypted: i=1; AJvYcCXdPQufmOnQIMAX25N5EAIlHE4nEmbSWCfZuAd9rhZSwx0oyZIhgfTECzYOvlDQ5AOD5SwTmVe5v4o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTExuQD0PmCkIH3sGVzIJ+ljPLbz8dVQiY68fLQwoGZmBnAeIb
	NSjXap9ydvdsp39wTZHtIjuii5qGCZUPxFzfPPcNeDTvNmAP4fOCblmFjEb8XIInNw==
X-Gm-Gg: AY/fxX4KcezGnwGyP9a3Wu2u9FStcNbZmwOojQYF2SPdIu4XF2ejQvuXGv9WWnOkU/g
	F3rFnImKJtBwuwrRbphaLJJLQDvYJv/yNOyN9Q1dRHyd3Rbzu/1/rbmh6ykhHnOZZUAk+E7htOt
	rhxExornOH2HBRAmiZ3yM/ew0Ctbo0AW6CKIIQwoj4lPJHrl8MqKv0BlXb7xOAkLproBs9uhIcu
	uEsjQtI0Hn4HQ4sQWdHe5j+cnM1xpPqigpSKCcZfRqqQucjziZozVTbXv+BEDX/m2alcieIg0Kp
	fIgLW2bLUu4azoXIydp+dR0VcjNtTlZgd2+XvcDWnj8CMticn70dPd43V2Z3LKoSBXC18c4yKPm
	WpgOm+SzhH2Wjyml9bVXZJbd8b+sAxRkR0TEQf+6sVkZ6EQ/vn9UGyOai3+gSPvTqeMP5xPaQxB
	iYBejB0Qf05gtsRC6evKcfAJid5z2I6zzuZVNFegIBwQtj8qCGupMn3ck7cbvzSdqxUQD1ZbFFJ
	ss=
X-Google-Smtp-Source: AGHT+IEwa4Hae501B8Tm73STwUjOp3n2DrA4tXKCDk5ynJnGFhsb1Hj4dlOuZ6Mi53OF8Q+T2iywhw==
X-Received: by 2002:a05:600c:3104:b0:477:fcb:2256 with SMTP id 5b1f17b1804b1-47a8f906dd3mr141019145e9.17.1765873521739;
        Tue, 16 Dec 2025 00:25:21 -0800 (PST)
Message-ID: <33b7f29a-c699-4b2e-86b5-92c6fbb1caf3@suse.com>
Date: Tue, 16 Dec 2025 09:25:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] misra: add deviation of Rule 5.6 for shadow paging
 code
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: sstabellini@kernel.org, consulting@bugseng.com,
 Doug Goldstein <cardoe@cardoe.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <e408b8bb6e64e7fbe709ae8a26efa7c247a3f999.1765843801.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <e408b8bb6e64e7fbe709ae8a26efa7c247a3f999.1765843801.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.12.2025 01:11, Nicola Vetrini wrote:
> The rule headline states: "A typedef name shall be a unique identifier".
> 
> in x86/mm/shadow/multi.c the typedef names for `guest_va_t` and `guest_pa_t`
> are deliberately reused multiple times due to the file being included with
> different GUEST_PAGING_LEVELS. As a result, a deviation for the rule is
> introduced.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Looks plausible, yet I wonder if we wouldn't better do away with guest_pa_t.
It has one single use (the per-CPU trace_emulate_write_val), and judging
from the involved logic as well as other naming (e.g. the .write_val.l1 field
used in sh_trace_emulate()) it's really guest_l1e_t that's meant there.

Jan

