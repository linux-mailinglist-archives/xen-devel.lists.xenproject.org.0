Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C68628D5A88
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 08:27:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733280.1139421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCvj7-0005mN-U3; Fri, 31 May 2024 06:26:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733280.1139421; Fri, 31 May 2024 06:26:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCvj7-0005kR-RM; Fri, 31 May 2024 06:26:57 +0000
Received: by outflank-mailman (input) for mailman id 733280;
 Fri, 31 May 2024 06:26:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjOV=NC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sCvj5-0005kL-UW
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 06:26:55 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5aa587e-1f16-11ef-b4bb-af5377834399;
 Fri, 31 May 2024 08:26:53 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a673a60f544so84480066b.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 23:26:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a67eb3444bfsm51371266b.201.2024.05.30.23.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 May 2024 23:26:53 -0700 (PDT)
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
X-Inumbo-ID: c5aa587e-1f16-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717136813; x=1717741613; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/BnfkwZulJdfDdkH/BzNnva6jmSvd1VIYFrx5/7OMk4=;
        b=cxEUTE9Wegl1ytxZbCGRclNSy5dVzYFxkuMo1O9vIsFcryfhqb4o4UxZR3xp4Gs3ZR
         b0rdPJm83fHmTbrtTSCHBanYLGd9M2N0Wq3fGhhd/+jRgNdfHnKgaY3dA7TfbHdCWYok
         wHyz2Mc4oTcxOsDasiuL5PZqzGpK3UlOJuM8Oo1j+3hkurrZtyvcL5NhIFN0lyDg0lZu
         IrxSYcOytxs2TeI3rMXGbkwMLDSPh2EktwVbq9hn6/tBKJhuF1uhu5cHvaZxf5GV1dk3
         CYA/0IS7K7WF2vrQNrSWNavAKX0BAW7IfBrKc3fm+zeq5DfEieHqOIw78QU6BbTvDKe5
         tHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717136813; x=1717741613;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/BnfkwZulJdfDdkH/BzNnva6jmSvd1VIYFrx5/7OMk4=;
        b=tV3CQqHTXjXxKM9ujhXtg/my1KvK6+/upq7Q5PYbulsgfaRo8fWq0+w82efTdcXNVd
         I2nS/N2zJjJeXqDSqCC+W3QZNJZ2tD+Xu31IyLVMWa52Y+Rg3YBIrCIUCSIRdI8vFYs/
         ZZZvjW69ydF/2crIun9Zk+tuQp1CAoeo4Qpj94yDyZkvl/3a3jsSsLj8IxRC98nRrqpJ
         b5x7AVsuv9lta1GqeflC+fuDkr+Dk9iEcqLIJW8Sk9d4IKPswHS0mjnz3gGyms++9WUK
         /WXfX+QiBkXt7MGYnbss4SOHjm/gQ0dZ4VBgDhOjtPjcGQs/u3BX0/lkREtzhctKECrg
         Di7g==
X-Forwarded-Encrypted: i=1; AJvYcCV+7NsPPb17pR986JGUCwzUrBohggFqgMMyXxnkruK3VsVoB2Rr4hvl/cudLu1E0ssPfr6bVWXf/XjlT+4WgkhUlzHBiv14zB1qsy5NzhE=
X-Gm-Message-State: AOJu0Yz0RjsRz8w6VVwGFO5ZpAUnoUrL+hx6kTzjWNLxsysnDOv8as+X
	/+ldR7Go8MOoWe5syRhHAnu5xRCVITC+u8jg1bhUXwgPV53YYQt2oVLdyF7JcA==
X-Google-Smtp-Source: AGHT+IGk6XJ2jrMyGYDevOOAdcERz8ZVEpgahSbolsE3uYVFhVD+bapaGGYNrlQvhmT9jTAx5Bwbow==
X-Received: by 2002:a17:906:43c7:b0:a59:bacc:b082 with SMTP id a640c23a62f3a-a6821d646a5mr52337966b.60.1717136813296;
        Thu, 30 May 2024 23:26:53 -0700 (PDT)
Message-ID: <b24681c6-fbd3-4b01-beb4-560eabf3ad49@suse.com>
Date: Fri, 31 May 2024 08:26:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 5/8] xen/riscv: add minimal stuff to mm.h to build
 full Xen
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1717008161.git.oleksii.kurochko@gmail.com>
 <d00b86f41ef2c7d928a28dadd8c34fb845f23d0a.1717008161.git.oleksii.kurochko@gmail.com>
 <70128dba-498f-4d85-8507-bb1621182754@citrix.com>
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
In-Reply-To: <70128dba-498f-4d85-8507-bb1621182754@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.05.2024 19:23, Andrew Cooper wrote:
> On 29/05/2024 8:55 pm, Oleksii Kurochko wrote:
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> This patch looks like it can go in independently?  Or does it depend on
> having bitops.h working in practice?

The latter, iirc. In fact I had already tried at least twice to pull this ahead.

Jan

