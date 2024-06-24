Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B919152CA
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 17:45:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746808.1154009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLlsf-0007UK-Mh; Mon, 24 Jun 2024 15:45:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746808.1154009; Mon, 24 Jun 2024 15:45:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLlsf-0007SV-Ja; Mon, 24 Jun 2024 15:45:21 +0000
Received: by outflank-mailman (input) for mailman id 746808;
 Mon, 24 Jun 2024 15:45:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wsRE=N2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sLlse-0007SP-Hc
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 15:45:20 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1a742c8-3240-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 17:45:18 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3632a6437d7so2631151f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 08:45:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7065107c26esm6575439b3a.11.2024.06.24.08.45.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 08:45:17 -0700 (PDT)
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
X-Inumbo-ID: c1a742c8-3240-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719243917; x=1719848717; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u5KH9++zOKfbJeRxOUmJh9ZlSsZgBffU8EJXNLM3rI0=;
        b=Ai0wBG47FULQp0BPSZgeUENdA7XB0EtVUCW1px4TRviCTQBlKm6rePdL2JhQQ8xDy5
         NB07SK8hS/uxZtRirFN2Ot+wugHG2cAoITqBLBCxThaxxz4/sWeQ6+T2YEHd6aPJrOmJ
         cksTLmDyAMgEIx82PuTu3rMDR7UqS1SvCdUULbn9u2vx6m9qXggc/bMqzztryIovX90n
         xnGxR1js0RhIwZ0TGUgDpKSA778tBghn4b50HnaJOMv0T8wXNvkdazsIgrJtLH6tq1tu
         u1xUNSAhYAt4fCsOrOuZZxbz64+Y6kJelv40BKwnDTq7xihCZA4tRNhBRQNagOed0y4N
         935w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719243917; x=1719848717;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5KH9++zOKfbJeRxOUmJh9ZlSsZgBffU8EJXNLM3rI0=;
        b=LPIoR3aI7nJchdx1gdju2G/vVfxaZwRYd7ZG7Kek9Q572ZuLJfqv7ni1DOisDztkHm
         3JRziJL4t2TkTs4DZpkCnLEWyUFd0G30we8cfq05BmPM6JNF1EQcBltXj5zSoBGXuS1n
         OiWc5UzQZ0wPR3dZBGju6tzKn6n9h/Ht4iV0w9CZH2Ca6QyxTB7liTXfmRdCF4RWTzrv
         +rdR5hK/w6YuxmDaTV1REvH9yPo1QksNGXUCLyM2yN2xmBkTtGslLzFODgiNNIFAxXNE
         iZDdUFPBQTkdMgjFS4xz0BcuixuwzfBwLZszOfQPnYkJOMuiUchAf85KBtr3I/TT0wHh
         pHrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXl3wHXjigbmLNoeN/Tcyl3UQS2v9fR6b/4uD5ea7P9pU7I2v66Pez8QTFSN/V4pPEJGmpADXkfQzE3KUOhknd661I1OoptncS/vuddyc=
X-Gm-Message-State: AOJu0YxcHqKQoBFrUs6rNPQ+GrNyoeea+sSXehub+ODpFis1zPZRQUcN
	QP345+Fdy/mea3JrVMSIS4StG0hVScDWz3yUf0F1e4/ONurZx8kENcDyj1MlSg==
X-Google-Smtp-Source: AGHT+IEWBGZbW5Am7nBJEkvtg2ynScjJLopddCX1F0nvC6TQhFvIiNUC8zzUD7gVjJUeS+D9Qg5GcA==
X-Received: by 2002:a5d:474d:0:b0:362:e874:54e8 with SMTP id ffacd0b85a97d-366e332cfe0mr5112780f8f.30.1719243917604;
        Mon, 24 Jun 2024 08:45:17 -0700 (PDT)
Message-ID: <fcab478c-f6a7-46a2-87f8-005d24dfb307@suse.com>
Date: Mon, 24 Jun 2024 17:45:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 12/13] x86/vPIC: address a violation of MISRA C
 Rule 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1719218291.git.federico.serafini@bugseng.com>
 <bf0f2ac1c8e9443b2c4f8ae6f02659927d5f7dea.1719218291.git.federico.serafini@bugseng.com>
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
In-Reply-To: <bf0f2ac1c8e9443b2c4f8ae6f02659927d5f7dea.1719218291.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2024 11:04, Federico Serafini wrote:
> Add pseudokeyword fallthrough to meet the requirements to deviate
> a violation of MISRA C Rul 16.3: "An unconditional `break' statement
> shall terminate every switch-clause".
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



