Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7F0AEB078
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jun 2025 09:49:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1027347.1402014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV3oc-00008V-JU; Fri, 27 Jun 2025 07:48:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1027347.1402014; Fri, 27 Jun 2025 07:48:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV3oc-00006W-GT; Fri, 27 Jun 2025 07:48:06 +0000
Received: by outflank-mailman (input) for mailman id 1027347;
 Fri, 27 Jun 2025 07:48:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2ywg=ZK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uV3ob-00006Q-0L
 for xen-devel@lists.xenproject.org; Fri, 27 Jun 2025 07:48:05 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d797d51-532b-11f0-b894-0df219b8e170;
 Fri, 27 Jun 2025 09:48:02 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a51481a598so974627f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jun 2025 00:48:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af57dda03sm1627830b3a.147.2025.06.27.00.47.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jun 2025 00:48:00 -0700 (PDT)
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
X-Inumbo-ID: 0d797d51-532b-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751010482; x=1751615282; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SvoiEDz3uqGSRFDvJoLdBNSj3wkXJ/6jRGTzHM5+WyM=;
        b=DrW/gM0QQ2xQcYyEXZCEXTOxDZ/HIV9wLMsiYjacAPHYfmUYsyqscs4ZZ+xTgHxFc2
         h8efy9T5w4iewqoJOU+q5bIxj9chkW/VO4uTdJ4kSJi5KVTqKf9itEmMjvefq71EB1oA
         q0M1OpEHvyvF3CPpZZZ9dCuPzQI+9MIUpmOVFyWSJcumFXeUEWcKkckFGI7rvCs3RnoS
         /gd3JsIdvS00mtjHJge+baF2afuvndap6GiKjwC6oL/hcJ1/UUjx0R4cn+9l0JQX2Kyb
         8BM2x4OiWW+CZgTmCe4u/2XEjCHKelt2SVWahbdb1tSu/piQ62RqoCZqScoH3eunjzw9
         n5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751010482; x=1751615282;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SvoiEDz3uqGSRFDvJoLdBNSj3wkXJ/6jRGTzHM5+WyM=;
        b=NMZZ/DIxha/oQ/YGxrCZooeJPKNcEIr6K9s+yoAE28d3KIB4Au6gH24R46Kq9VA9y5
         h+MexpCS4v6eq0pijHGh6rbcPmeesBuUNL935gGbmYV1bH9oKcu0916oRG444l+i3Szx
         cYbTHmzTWpMbdF6yN3slVD8hn2NP/+z8W3fVMK5EtObkcgmFcaj20OsC9pEMvYSAQgLR
         H2mb7HndfZrM+yYc53dEh8a4e/3rTwHWyundpaBmYdoIUJNcrFLXg1ohaB5fp3nolpxr
         b+DGpVQfwwgoDMBRgUPQIV/qTHR1/WSg1rTKIwm6Nz5XlmzZK6usyru8looelWyPouFr
         368A==
X-Forwarded-Encrypted: i=1; AJvYcCUBi8XpAKZA7wIfRK+Lv8V5Kg3dHGTRhitv+nzPOb9r2MOBzOSwwtoJPdrjZrcezmg9udRuDtp2dL0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxvkxQYa0A0r3Jr1n9eIklXsb1+VoBZkDJKngYrRZwfDt7vWIB2
	QiN1oWilFe8NJoVzsmu7aDhVmfo7wrOXhaDygqnILicfz2Xf/tmbh2IlNpqZU1Fgag==
X-Gm-Gg: ASbGncsFL4hfLJDPtqG5oKZszjaOzOT5P/mkoJ2yZ0K+XeC6sD52IIpSmxejcFEftHX
	KKx+R3wC1a0PLqWT+ETjHWtftaBpe9igwHZeVj+0IMa3YiW7R1tIpDUaHP3oXAbwcDMXq9ej4zB
	+5PWSQsAV5w/vPtA+gdUcF4k3L1X9BPDKp4ZCf8K1olTKzfe7B05dA7kEMxiWPjA3xYYq48B84C
	14pHKiHlhQRufJhhVc/UsmFPiSgUH4VVVUMyTD/NVfhiefgqxwzvU7+VtTaZnxVQKqOtvM5wYlg
	FiuAavMA8rRpdLWGWr46cSodykMGYr6z3h2F2rz62LFG6QcyHPjqQFYgSvnDfGZmeKOUmmPofpo
	pbjwFyp8BtX2NN4egamW3DUMWACUrnN96KN5V8WLQ4Nphi3s=
X-Google-Smtp-Source: AGHT+IFucaUMleARgauCHPupf374+ojevGldWOs7MmA8d1IcaIK5cyoDSaiSkoxr5xoMC/zgdmJmRQ==
X-Received: by 2002:adf:ed83:0:b0:3a5:3a03:79c1 with SMTP id ffacd0b85a97d-3a9001a1778mr1547820f8f.48.1751010481800;
        Fri, 27 Jun 2025 00:48:01 -0700 (PDT)
Message-ID: <7c9d39b0-8bef-4535-b8a0-e548eda9365b@suse.com>
Date: Fri, 27 Jun 2025 09:47:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: cmdline: Update serial_tx_buffer default value
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250627070604.6580-1-michal.orzel@amd.com>
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
In-Reply-To: <20250627070604.6580-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.06.2025 09:06, Michal Orzel wrote:
> After commit 4df2e99d7314 ("console/serial: set the default transmit
> buffer size in Kconfig"), the default value is set by Kconfig option
> CONFIG_SERIAL_TX_BUFSIZE. Moreover it was bumped to 32KB by commit
> d09e44e5d8fd ("console/serial: bump buffer from 16K to 32K").
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


