Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC688C728C
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 10:12:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722871.1127225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7WDn-0000wt-5N; Thu, 16 May 2024 08:12:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722871.1127225; Thu, 16 May 2024 08:12:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7WDn-0000uh-2U; Thu, 16 May 2024 08:12:15 +0000
Received: by outflank-mailman (input) for mailman id 722871;
 Thu, 16 May 2024 08:12:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7WDl-0000ub-N9
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 08:12:13 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fefd52f9-135b-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 10:12:11 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5709cb80b03so3204515a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 01:12:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574ed753a6dsm2720087a12.77.2024.05.16.01.12.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 01:12:10 -0700 (PDT)
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
X-Inumbo-ID: fefd52f9-135b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715847131; x=1716451931; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cQI8KB3NBiKLrVA543O5ijA8MSOfQOypRYx1X/hQDOw=;
        b=Tf+YdUMjYIN6f790xc1JUDZQfagwO03aYmc4z56tNrjGwINHRksLaAOceV9amP5O+p
         P5qdoLtoAalAacIdB7B2A5wLG3pUWzphKDGb4npZ2ezlzIt73aMUADbAKGaqrznR15aw
         HfAZaoE/S+IMWXVwetMzanCBzzDVmIuWGCooW2nrW9moaYQ6webDqIE6OKqxlXQyVuXo
         nn9kdYcHjp6QWXoZecl6RW9zZ/FSIY9DSnWh7JaKc1nQDgxL2eoLhqdcPGqVnmqw/lOV
         M17ZEy7OHj+lms3nSgVAv8NO36pe3wkiE9BBRWI4RykczdDBTiIdS+4B5WNH+ACGFzTn
         Z4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715847131; x=1716451931;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cQI8KB3NBiKLrVA543O5ijA8MSOfQOypRYx1X/hQDOw=;
        b=U8yO2RXFnjd7fJSniBEs2Vlw0UzicPqhb586bVxM2J160QL0N+1C8cemo1BYc2F6QI
         Y0rwocsBKSgCzXopqQ+NvXDc1Uc+axaMx6/OmuCJWgfuCcBaVsXIRagiCtTFLmsFi25C
         MWtbcoWSYqX9j5WgUbOLb+AEaiQZN2odLA+Nh/+hNhSL6VFesvrD62A94/ZsFfM2FqY/
         wk87eBDw2XzcDPfZBvJyZ7S6l7fzKmf0Lp0Jh/GuImDkFu+lnggLyB2SnFwhMY1+rfVa
         i8IWMNnu9dsQR41BWD1bzoaVZemcWA3wFPan8nCLYvKle9xR51iP0Mcy6l0HrxaFjiX/
         KAfA==
X-Forwarded-Encrypted: i=1; AJvYcCUui/7X3xJHX/0/fSkQ2MINXm/2K6I3sBsCcdiLiaBqgHFHjNWUNTAYWn3sfkX3o4yTz1avII/0ttW4PL/f4WS6NJ3fWUR4WU3ISMS+zvc=
X-Gm-Message-State: AOJu0YxPvib1i0xRRC5QaKBg5F0z4oViiVplN1vz3Dho9JmtB0v9YBxO
	0SqehAmS5gyaPF+9Dg733is857qnONTZo2iZU3ahDkIRUrvmZiYXGu6f7asSHg==
X-Google-Smtp-Source: AGHT+IFUEAT2Un9IUPbpLOVq2Z4f+3YXh6qVoe6kvgW8YHG8txZ7v4UnkYXJiGy7wh2K19FIOrBDyg==
X-Received: by 2002:a50:9505:0:b0:572:6846:b899 with SMTP id 4fb4d7f45d1cf-5734d6b407dmr11630908a12.41.1715847130898;
        Thu, 16 May 2024 01:12:10 -0700 (PDT)
Message-ID: <e32accc2-1391-471e-afd1-e67dc681105b@suse.com>
Date: Thu, 16 May 2024 10:12:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] include/ctype.h: fix MISRA R10.2 violation
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 nicola.vetrini@bugseng.com, consulting@bugseng.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2405151549020.2544314@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2405151549020.2544314@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2024 00:52, Stefano Stabellini wrote:
> The value returned by __toupper is used in arithmetic operations causing
> MISRA C 10.2 violations. Cast to plain char in the toupper macro. Also
> do the same in tolower for consistency.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



