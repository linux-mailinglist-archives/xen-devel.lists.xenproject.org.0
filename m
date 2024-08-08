Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 966A094B6F9
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 08:55:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773726.1184163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbx2V-0006EG-Lz; Thu, 08 Aug 2024 06:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773726.1184163; Thu, 08 Aug 2024 06:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbx2V-0006BY-IX; Thu, 08 Aug 2024 06:54:23 +0000
Received: by outflank-mailman (input) for mailman id 773726;
 Thu, 08 Aug 2024 06:54:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sbx2U-0006BQ-F3
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 06:54:22 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09f0bd00-5553-11ef-bc04-fd08da9f4363;
 Thu, 08 Aug 2024 08:54:21 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5a3b866ebc9so657351a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2024 23:54:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bbb2e5e717sm326021a12.85.2024.08.07.23.54.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Aug 2024 23:54:20 -0700 (PDT)
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
X-Inumbo-ID: 09f0bd00-5553-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723100060; x=1723704860; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wjxPx5bBvGFmvmqASkZblaZ3W3BnBimY0US45zLzZFs=;
        b=DcOKvz4Ly2eeXarwtnNygiyisGLzCvPnj7hIwnEukj4OAmGuLeXFlD1vd6lM7OvJl/
         tL833CQcNs4f/oKIbcKAKPX2QAgDUi86YRYeTlWQQd5052o0cCJLwTNLubav5DJA3E3k
         NFlcryNbJR5o6hotctsQ0ZCLl8FoTyoz8aDbbapJ5h2AeElGaOFXEZVrNDcHeO+wPl54
         CNgDOKO3zN5hoTLgqI8VxYfEWO8NvTqvwRBY259qSdOXOJH6cAdTVcsefquifkbLq4FR
         vuwN1i2ev9PTcT0pCKD74eIWF7iccUAvFkmcW4GaTTyuQUdy/Xi9xXkxMaKb2QsLc4+E
         u13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723100060; x=1723704860;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wjxPx5bBvGFmvmqASkZblaZ3W3BnBimY0US45zLzZFs=;
        b=OakkkUtRJJm0BvS8xeB2K7pajAtMrQ+k8aUm/e3baduihaHmJUN3r3r0a1inh8CTHh
         uR6vb9jFX1NNdkVdDyb/yEERHJcybBZa03rO4YTIO6jTSKsV92a0bXAPTeS1hpfq5myj
         kGWjsbLkXvhYhc3xphs90dxJekpm/AWDfX9Fz/qkDqkTULEJX+VfL/yWq+v4mfvKroCB
         JPbwBmfAFnpHbzsGMWzGW0gUChITS9LguG2RvCeFREYJ9nZHZBRilh6BBvD/smRoxbQE
         m8tui+LUAU1q9YEuWDppH6iGQL29ebAw+zDJuG/+BBCP83GQ59YhNPp2dYY37ZjA9fei
         r8XA==
X-Forwarded-Encrypted: i=1; AJvYcCUNRaKC1ukOaiHrvj4gSNpwnfWBn0U324kLXUt+UVQj498KQ9t+l0Id2oOhWEJxlENvv6EY+1YEbfWbal7d3cBGNs90NGR+dmuZtDzW2fU=
X-Gm-Message-State: AOJu0YwML9V7gHpS+uZGviJKfZlg4EGUMkIHjxV9iBwLXAr42H0QS79d
	LLcdkQ8M5JTX3kqDAuvyCXQ0rCZ7echCC1EK7bWNBXxLfyfi+ZBiUscU2TTdtA==
X-Google-Smtp-Source: AGHT+IHlVfH3qZ3THZ8Y8RDriFS7qu69aGRzSmw46WQ54OdNbwfyqJmCPRdviYIApZANOWpXB19LtA==
X-Received: by 2002:a05:6402:274d:b0:58b:9561:650b with SMTP id 4fb4d7f45d1cf-5bbb23f6b24mr839205a12.25.1723100060438;
        Wed, 07 Aug 2024 23:54:20 -0700 (PDT)
Message-ID: <9ec8cee5-649d-4a7c-b1e2-0c6c83daee0b@suse.com>
Date: Thu, 8 Aug 2024 08:54:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] x86/emul: Fix misaligned IO breakpoint behaviour
 in PV guests
To: Matthew Barnes <matthew.barnes@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <4219d12fcd075635c8c2548c5d14471642af3038.1723045077.git.matthew.barnes@cloud.com>
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
In-Reply-To: <4219d12fcd075635c8c2548c5d14471642af3038.1723045077.git.matthew.barnes@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.08.2024 17:39, Matthew Barnes wrote:
> When hardware breakpoints are configured on misaligned IO ports, the
> hardware will mask the addresses based on the breakpoint width during
> comparison.
> 
> For PV guests, misaligned IO breakpoints do not behave the same way, and
> therefore yield different results.
> 
> This patch tweaks the emulation of IO breakpoints for PV guests such
> that they reproduce the same behaviour as hardware.
> 
> Fixes: bec9e3205018 ("x86: emulate I/O port access breakpoints")
> Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



