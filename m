Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DE0C8D5F9
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 09:39:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173559.1498585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOXWz-0006ly-Kc; Thu, 27 Nov 2025 08:39:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173559.1498585; Thu, 27 Nov 2025 08:39:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOXWz-0006ji-HB; Thu, 27 Nov 2025 08:39:13 +0000
Received: by outflank-mailman (input) for mailman id 1173559;
 Thu, 27 Nov 2025 08:39:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mf1n=6D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOXWx-0006jc-IM
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 08:39:11 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b2fc004-cb6c-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 09:39:10 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-42b3108f41fso370150f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 00:39:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1ca1a310sm2177778f8f.26.2025.11.27.00.39.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 00:39:09 -0800 (PST)
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
X-Inumbo-ID: 8b2fc004-cb6c-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764232749; x=1764837549; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nIJhPejUmJl6FeSMThRXZdaUkkvqGD9IYal3rEHAko8=;
        b=Qj/xEyu82J20AbnJHrozPsF0D0gsmjjXzkRP6G/amjMFAbfPqnFOd7WJ2KPLZflpH2
         UQ5G1G+q3MbhupOvwvXKxxrDqlhwRY/0SWn6UvTsmGLtm8hRQsBZVl6ZbD4tmbLQ1PWJ
         +xTq9r3fDNT/TkzqsODYfXsT/qZiJE+5WTuIpOD0qJ7PP6KkUdd9cOZOrRzdk07HCI4X
         nS7e62Jx6WGZiOwFAK/zefNnVbCh+qCuYX5ZDgThKObMJhIf5KmDK3qHo4wzDRvA1jee
         pVQeMGJHqQaRuKUahhacJSHPXnKsRMPDmevnnP9TOcrAJ7+1XQkvxdFmebuweJUH/ntC
         mhIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764232749; x=1764837549;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIJhPejUmJl6FeSMThRXZdaUkkvqGD9IYal3rEHAko8=;
        b=NxUJ20jrkZNtjtI217U1QRIY9ajPoDtgL/mlzFZMRTtMzNK6ICu3C7x5QXFIn2IPKv
         71cLc3uT+Cv8YoeRuTJMdYip2d0kO/qcjM1r3WKLJzOb+5mTqUk+OaluVlNvG55weXGG
         zC/v5zbzStzffGmkC2XjbLtdFM6peTQ6/qCmW2hBDEDQCJaQ4KkrIlqTK0UIUmcunb5Q
         FptNmuV8Oy9TOVOsq/uTBX3Ssw7IOm1LrVVFWahoAfV9cou9YXp++YEJQEppDbvI91ox
         +KKhcOS2+DkOukd0aHKAHpofahBz0oBUXKi7QVDS7k/kPuOwzSAJDtSI9+4r6zVw2Con
         Rn8w==
X-Forwarded-Encrypted: i=1; AJvYcCXylQ9q7G+ylUA71NMlz/rA+KRKgTu6jmjZL73YHVbakMh1Ggu4Nl29UXB7JrWNymXFhs0wr6H2qc8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwMLOigWCTzksaWv2X4GALwKRif5sDMPgMEJSC1s68FaD6T9aqX
	8ofaKLFtRteIooJJHO3jzUYFimDGvpGsSnRAPbvrBYBDABnecZnHd83/p+1e3XUrcQ==
X-Gm-Gg: ASbGncsJ1t3vqiKzeBvQDNEa0T6UStMyd8NoCkc5LUXsmTqHhhlfiTlg455w8b53v5K
	mVSPpqGMmD3RHiLaIbeCsZtfmr+O3WPukTvQ04L0xDk1wDlBE63X/J2Kkbia0aTOx/uJ2BtXuAP
	Ub1hOEDKc1s+BWIejjyHV9nihNwlT6zh1XAsq3OPw0w1C2v+ZtsC/9rbI4fFjf73UAURmiZskla
	8d48/x9xLsP6Fpmu0ToUcEcUjt87j89BCKB1iAFS+7w1gRQoKyDvw2O8HY35Pi6YOBMiATjBXjf
	t0e7j52KPLObhqYUy96M6aITKjU/Sm/H5LqQ1fNuimaXM9V2cWGsFjtSZQVLE6zH51ylQGyPAKd
	in838XjQA+65yI81m7OXXNHFMaVJYetoDJiZiQDbzOou8pHhLlY1Muz/iOlNYyxnPzWjJywyVBe
	/IZFOKhoK8DmCSsPcYs1WqyZ4tjNL4hi8sur8jXggLNexjEMdDoyzXz6bhdwIQko/pU+UTtOu61
	Ok=
X-Google-Smtp-Source: AGHT+IEWqUyy9bm0t7n2lSbzD5Gv5AKVt8HN6QjYekH8Q+N2e0WZ4CxN9JENCoSZZ/s6pSVDDeAovg==
X-Received: by 2002:a05:6000:2084:b0:42b:3cc6:a4d7 with SMTP id ffacd0b85a97d-42cc1cf825bmr24473222f8f.37.1764232749529;
        Thu, 27 Nov 2025 00:39:09 -0800 (PST)
Message-ID: <0a20ed58-d257-454e-b3e2-207be616102f@suse.com>
Date: Thu, 27 Nov 2025 09:39:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/cpu: Sort headers
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251126171539.890253-1-andrew.cooper3@citrix.com>
 <20251126171539.890253-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251126171539.890253-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.11.2025 18:15, Andrew Cooper wrote:
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


