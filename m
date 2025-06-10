Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A18BCAD3D26
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 17:31:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011066.1389375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP0wI-0001UZ-B9; Tue, 10 Jun 2025 15:31:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011066.1389375; Tue, 10 Jun 2025 15:31:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP0wI-0001Rl-81; Tue, 10 Jun 2025 15:31:02 +0000
Received: by outflank-mailman (input) for mailman id 1011066;
 Tue, 10 Jun 2025 15:31:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uP0wG-0001Rf-VC
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 15:31:00 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e940d162-460f-11f0-a307-13f23c93f187;
 Tue, 10 Jun 2025 17:31:00 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a54700a46eso1889203f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 08:31:00 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a532461211sm12370299f8f.86.2025.06.10.08.30.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 08:30:50 -0700 (PDT)
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
X-Inumbo-ID: e940d162-460f-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749569459; x=1750174259; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DbBSNw/aB5/M+fUL9gpTOZkK6sxxbPb2HOp2jJ79Q1I=;
        b=GDStk3A+xXDk5C+7glYoqAk+u92+EY5sI+RPjR4F+GvuZNkSDDY/8EuoeKDcY2G+XD
         oiy2QpkOl5q30oSKagZG+uYRoLr+Z0YZuOTWu+tkaSzE15n94tG28ACjyzKm6cqnoMT9
         klsN1KfpOI2qvdH+4vUOpXWHFieX0m4cNhDYbnLqeNauUvuxVyO7spCWMnYE8bGnq1vn
         UQLlJMreZ1D/mQg6u2S+LBHvagYAYloNJmrjTDnxFvMuyg9FWKyZJjH9dLUeg8JqhO1P
         7019w3wLfcF0n9t8XjgG8ZfGevwE627WN39cVGNsTl5xMkX+p9eT3pTUHdnXQvIwAUDM
         TLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749569459; x=1750174259;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DbBSNw/aB5/M+fUL9gpTOZkK6sxxbPb2HOp2jJ79Q1I=;
        b=NAlF+dE3WTGBIT434xpOHxyjd6WwEM33ctEpmEqm5jPX9nTNGnQCVqxtXzVGkJsDJc
         2zzq29sNeD7JJDpQxZ5ZnvHGxsslDpF7Y15zlfqT+XIhmdmPfb5ohr5Bn7VOM66OLVuu
         UN3DAGw1FFcCvwLnr/UqazfHC+KguWwqSreEW6oAizRtqLACRBMtsBSrn1JYfJvRXCzs
         CoP6lUeqqvqDrE2F5geV+iIvSAbj+QZWHzOMnZOS19cN+FeJ/QEd+vHQamOk9PKwwZE7
         8Gc9D1XRlqsKqD7kGP980ElizUb7XJ+RsaEJgxNr7s4GKlMUI2Mq8qLbhgUlqgh9eEy0
         Y3bg==
X-Forwarded-Encrypted: i=1; AJvYcCVE+0nDSMYMxlphsUHaDWqOI9k1MlgrGjJHZ71ZzjPXHEVcAiEFe0/rFDxq83OeFe3UQHbXP1b0Fis=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyAiGYa0/qMin4jiXWzLi5JY8uaZ02vAhq/TWra85zItK5MVhgX
	/wGK5tTJr37a2WA/2agrSV4Jlsq5reAYxIirtVVj4Omhte1BmNbr7sggTgNHMJx61Q==
X-Gm-Gg: ASbGncv0zD/MN/dmtT6ncnqYbwDsfeqsQrnedEimqp7aFioWymrx5rTWZVV9bnug63A
	+cJX7XWCz/eJQ7KRsmsXiY2Vj1hczrWFPH5fHnnCD1PTNOwtk8URAwB/MvWMra/xreRgJR9h/JT
	P9sKPkiXATzi7wmV9lwkPpgIYgr75iRh2mpo5hjwjOfJNrcydkhx4T+/RQWWX4rdSiBy4Lxe2eI
	nYy5UzP743qDyU5p1lDh96y091O+oQ1zQRSKgUoxuDn7ESo9XgxhMuBD5Mp+XSfQia626KYf5rz
	OK551mZdvZq51AnXVb2zWF0YSKoH0bPgRvsegOFZfNrNrbVvvu4I2EAppX4zrwrmr2i77pBLmIo
	pR8sOsP7Faz1ScCKXanQ5VMuxN6TYlF95UNMLpKcle8k/PwvsclGBgpucfOkTWDjILoVrDCFDaQ
	8qJNFw41sic1XHndop32Uc6K7nZZjiUQE=
X-Google-Smtp-Source: AGHT+IFeVuxE1icaRSKASKLMU6rRQiPlwMbk+bzvRcXkY99ADHiB7/SXZvN43aIUiDz68fbRuIo4Lg==
X-Received: by 2002:a05:6000:22c6:b0:3a4:d939:62f8 with SMTP id ffacd0b85a97d-3a55229bc3cmr2320014f8f.32.1749569450315;
        Tue, 10 Jun 2025 08:30:50 -0700 (PDT)
Message-ID: <31ee1063-f377-4ca4-ba58-241a16272e7a@suse.com>
Date: Tue, 10 Jun 2025 17:30:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] xen: Introduce system suspend config option
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykyta Poturai <mykyta_poturai@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org
References: <cover.1749204282.git.mykola_kvach@epam.com>
 <412d2b68741182fe0528cb85c0af2a29a2ebec3a.1749204282.git.mykola_kvach@epam.com>
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
In-Reply-To: <412d2b68741182fe0528cb85c0af2a29a2ebec3a.1749204282.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.06.2025 12:11, Mykola Kvach wrote:
> From: Mykyta Poturai <mykyta_poturai@epam.com>
> 
> This option enables the system suspend support. This is the mechanism that
> allows the system to be suspended to RAM and later resumed.
> 
> The patch introduces three options:
> - HAS_SYSTEM_SUSPEND: indicates suspend support is available on the platform.
> - SYSTEM_SUSPEND_ALWAYS_ON: used for architectures where suspend must always
>   be enabled.
> - SYSTEM_SUSPEND: user-facing option to enable/disable suspend if supported.
>   Defaults to enabled if SYSTEM_SUSPEND_ALWAYS_ON is set and depends on
>   HAS_SYSTEM_SUSPEND.
> 
> On x86, both HAS_SYSTEM_SUSPEND and SYSTEM_SUSPEND_ALWAYS_ON are selected by
> default, making suspend support always enabled. The options are designed to
> be easily extensible to other architectures (e.g., PPC, RISC-V) as future
> support is added.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


