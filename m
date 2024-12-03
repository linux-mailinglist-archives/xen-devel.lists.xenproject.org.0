Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5884A9E1928
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 11:23:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847827.1262881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIQ4E-0007Yv-AI; Tue, 03 Dec 2024 10:23:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847827.1262881; Tue, 03 Dec 2024 10:23:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIQ4E-0007Wa-6U; Tue, 03 Dec 2024 10:23:42 +0000
Received: by outflank-mailman (input) for mailman id 847827;
 Tue, 03 Dec 2024 10:23:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D5Za=S4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tIQ4C-0007WU-FN
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 10:23:40 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9b5be80-b160-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 11:23:39 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-385e1721716so1969843f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2024 02:23:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385e2716cedsm10231480f8f.38.2024.12.03.02.23.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2024 02:23:38 -0800 (PST)
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
X-Inumbo-ID: a9b5be80-b160-11ef-a0d3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733221419; x=1733826219; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s9mJzrQ656d1QIixiQ7zVRy6sfzjK+3fk+YEJqEfkuo=;
        b=FIl4Mm/2gzVikVpkM41AM2vcIqChAciHOFw+0/e2UiDnCkiJVMHfafgNRm/FMigvED
         51FgWYwwNiqkSILZ3nTjfLYvqEp3nvjTHJV8l8NKtCVKK/k4/imcouFuc/IsabWl6vy4
         2zceMOEOrBKyI7858odq3BWu+v3vlsseflxmj24c/A1DnrNLQz2F+ly58fQzJ6xp/8z9
         Wtk0O+0okQAhU2Xt2L69inZAAVs6bkLr/flGVBZhmsPdU+o2CnoNtWzbBcE06/BP5Kxq
         p0pdqWN1IY2xyl7EH0feo57CY5G+U5nuEOM2htFTu7/0GijgDPRtK47FmmQwCTub5hjh
         YdKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733221419; x=1733826219;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9mJzrQ656d1QIixiQ7zVRy6sfzjK+3fk+YEJqEfkuo=;
        b=pp2kooe/bu3tDPRzNQEvuNpvN8uQmiqqTQljxN20qhOlKKHYaZjpRCrQJEUcLktQ/B
         3JwSGuzCrvLfETCKyo9ts3jLhOJeH/uMPyjLttMTf1gh0EJvyQP8MP7R6vqAMXGYVeiM
         m0tboNMDmi7YfLiNyXxKAtBSxE+fnhw6hbedb6IVL0yGcw9oT0VBMGUScp/bCFbUsjt0
         FW9bwTGbZ5gHn43b+bNQxi5g4Gpohft0c4XwAwJz1+2F+IO004TiKiAHcYPj2iUrzpn8
         OXfSVIjA/JRjUk4FRPAV1w+pEnQE/6v3CCjlgxneh/ZqXKcGzhMwMHNznxR3COyeHqY5
         wnXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTw8JHMSRsp/h3ozK3r7D8WsgEKoQ8kAruAoAx1PFbnIfl0baKPjPL/HKudNWLXxcfRTEe6kifjeA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz7Na+dn9hoy0taAAMeivjvzKNwVFfh4+YWtvn7zk/3buyNisPu
	KntVLKqflKy4hxmuULqLg19nryeY1dTO3RWri2L6NLESdcAImFaOOtw2aD2XZA==
X-Gm-Gg: ASbGncsuGHxbJ+86KpzCVHiUNNCkPeaKd9CLPMvvP46PFWvxWDfbnXrh0vl2QzKTUaM
	/tzCAlF6PBzU5fMVO7stnRjMZPaUbUeVlnltJrqAisZCTGAC8MUa4nV9rOW4OBIhhNDpn6jGtok
	07QcNaGyj8X2y96wpEPis+OvlZDj0YCubK8x/0ckP0v0Ldc/VktwHA/MDZ3GfTm87Lo76+gj3AK
	5riet3dAW/raqeCuxYtCOD9F5kKDqZ9hAu5cW+zBW7R3/QOvf9fGmqnZYzxD9s5iCJDNolqDOJT
	crCpCP07YzVPhQbfXJpDWKXN2Km9D6RqKp8=
X-Google-Smtp-Source: AGHT+IHFBWHFExpDYW3Ocxe/Ua0eJeCYaS5d0IvuRviGcImSUX6mfD4n7Vxb5NKU25d5PyU4gjxgZQ==
X-Received: by 2002:a05:6000:1fae:b0:385:fa3d:19c6 with SMTP id ffacd0b85a97d-385fd419e15mr1581448f8f.38.1733221419040;
        Tue, 03 Dec 2024 02:23:39 -0800 (PST)
Message-ID: <54ac1d03-3dc1-49a5-9cd8-da544a0139a6@suse.com>
Date: Tue, 3 Dec 2024 11:23:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] common/vmap: Fall back to simple allocator when
 !HAS_VMAP
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241203094811.427076-1-luca.fancellu@arm.com>
 <20241203094811.427076-2-luca.fancellu@arm.com>
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
In-Reply-To: <20241203094811.427076-2-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.12.2024 10:48, Luca Fancellu wrote:
> When HAS_VMAP is disabled, the xv{malloc,zalloc,...} functions
> should fall back to the simple x{malloc,zalloc,...} variant,
> implement that because MPU systems won't have virtual memory.
> 
> Additionally remove VMAP_VIRT_START from vmap.h guards since
> MPU systems won't have it defined.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



