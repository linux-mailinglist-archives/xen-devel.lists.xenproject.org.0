Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18630903844
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 11:59:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738231.1144915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGyI3-0006AJ-HB; Tue, 11 Jun 2024 09:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738231.1144915; Tue, 11 Jun 2024 09:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGyI3-00068T-E5; Tue, 11 Jun 2024 09:59:43 +0000
Received: by outflank-mailman (input) for mailman id 738231;
 Tue, 11 Jun 2024 09:59:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WBrw=NN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGyI2-00068N-Jd
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 09:59:42 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51fe4a30-27d9-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 11:59:41 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a6f21ff4e6dso196933366b.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 02:59:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f19171cd0sm294426566b.61.2024.06.11.02.59.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 02:59:40 -0700 (PDT)
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
X-Inumbo-ID: 51fe4a30-27d9-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718099980; x=1718704780; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4JyI9QIbwAtP+nBSRYQBz9kJI7Jh3JRHrHptlZlbyTo=;
        b=dOH72qAugutv4amqYWZjApjQIhZ7CNi5u/D0XQAV7kKA8RQn9xvLETajh2crNYrWIL
         wz8RA6VQQdkUVpnr/datZYwppaJGH0EZHB5cNbBXjouq+2kHJWzZvpGLBCmNbJIeTSw2
         TdjwMP/7kf83B8dQ1UhYxn0TtAkjeRNJ6el5MsJYZ1v4pmJvWwXvOQ+6pkjFp1y8PXXi
         cKFHiIiMnjWDiUDwH+t5VDxJZA2xZr+9mas+NSX79IaiwW0dmhEAc4IFTNja9QDsxvFO
         YnArXYtBEPdamGtoP9coOzz+31nlmQ0C8XZrBMxZ5Z3wQ8T3J7MQLeP1x1s2TXW9IB3E
         LaMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718099980; x=1718704780;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4JyI9QIbwAtP+nBSRYQBz9kJI7Jh3JRHrHptlZlbyTo=;
        b=bs5xhMEBNJCh7KUfgE/my+CMIzVv2aU20yOdHZ5+GhiWrceaM0SNUi2On/rRWYZFpZ
         Qxw0AQr5CHqbSAagcXZEanCwzFJmkhEOCAwDcyyNUQaW0VTo5yOfppqRQCA8WxZshUrP
         a6/V3+EtYn5Kq0Q0mOvbrMhCw4uYMjkGzIaRLNMfdTkJfmDK5G57LZpIoz6lbxi2S76c
         U3UxLSxtvtOSVdbgfwn+xh0zm+bv6Ua837x2UTrRof40Utr+mbGvHU4oGcxp79cGBYw9
         yKcLWUEvq8et+xYB9ub6OmKbSbJntlEOsPnX8mLxq3qQ28MpdWWGN3K+6iNb2ZvjkMIC
         9HAw==
X-Forwarded-Encrypted: i=1; AJvYcCXN+sCSTgj1oYFzzOYFWVpSUapsOy8H9FwCFhu9lWR0pAqYv15H62PUWjsTvfGbYywqj/sJa0tLW6hi0F52Pg+R93iAzu/50AjLVIirRAE=
X-Gm-Message-State: AOJu0YwpA0OaiW627cTKeXZPNOqBDLx6wqxjMJMxBA7c4OOee97ugxW5
	UxQpN49szPFuRqe8zsYmpYCFmpLSuVjj0JOhxRyM2xSCqs6nbtyZgVVPx2bt4Q==
X-Google-Smtp-Source: AGHT+IHjE/BNHjSgeHQTsk9rOctS4IQFWy1K85WcYoxuQmqTYlpJA+LzY+KqSwG4TKJmCZMp1xHqEg==
X-Received: by 2002:a17:906:cc93:b0:a6e:88cc:bee9 with SMTP id a640c23a62f3a-a6e88ccbf2bmr618877866b.24.1718099980329;
        Tue, 11 Jun 2024 02:59:40 -0700 (PDT)
Message-ID: <5660db44-b169-44e3-9439-67d3b55bcac0@suse.com>
Date: Tue, 11 Jun 2024 11:59:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] x86/irq: limit interrupt movement done by
 fixup_irqs()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240610142043.11924-1-roger.pau@citrix.com>
 <20240610142043.11924-4-roger.pau@citrix.com>
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
In-Reply-To: <20240610142043.11924-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.06.2024 16:20, Roger Pau Monne wrote:
> The current check used in fixup_irqs() to decide whether to move around
> interrupts is based on the affinity mask, but such mask can have all bits set,
> and hence is unlikely to be a subset of the input mask.  For example if an
> interrupt has an affinity mask of all 1s, any input to fixup_irqs() that's not
> an all set CPU mask would cause that interrupt to be shuffled around
> unconditionally.
> 
> What fixup_irqs() care about is evacuating interrupts from CPUs not set on the
> input CPU mask, and for that purpose it should check whether the interrupt is
> assigned to a CPU not present in the input mask.  Assume that ->arch.cpu_mask
> is a subset of the ->affinity mask, and keep the current logic that resets the
> ->affinity mask if the interrupt has to be shuffled around.
> 
> Doing the affinity movement based on ->arch.cpu_mask requires removing the
> special handling to ->arch.cpu_mask done for high priority vectors, otherwise
> the adjustment done to cpu_mask makes them always skip the CPU interrupt
> movement.
> 
> While there also adjust the comment as to the purpose of fixup_irqs().
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Aiui this is independent of patch 1, so could go in while we still settle on
how to word things there?

Jan

