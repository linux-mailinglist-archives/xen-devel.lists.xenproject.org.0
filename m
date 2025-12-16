Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C1FCC1B57
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 10:16:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187721.1509057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVRAI-0002Fd-Dj; Tue, 16 Dec 2025 09:16:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187721.1509057; Tue, 16 Dec 2025 09:16:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVRAI-0002Cx-B2; Tue, 16 Dec 2025 09:16:18 +0000
Received: by outflank-mailman (input) for mailman id 1187721;
 Tue, 16 Dec 2025 09:16:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t3Kb=6W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vVRAH-0001hm-3B
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 09:16:17 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfb899af-da5f-11f0-b15b-2bf370ae4941;
 Tue, 16 Dec 2025 10:16:16 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47789cd2083so22689415e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 01:16:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f38a4b7sm234170925e9.3.2025.12.16.01.16.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Dec 2025 01:16:15 -0800 (PST)
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
X-Inumbo-ID: dfb899af-da5f-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765876575; x=1766481375; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s5hCMzenBF5ebVm3dyMjQFGef3YOiYb+traO6lD0OEQ=;
        b=V4dCM5X+ch6VhW742ItBKEyIvaXrt0BOLfxiLXUTOEt5EeWshYeND+F+BbQ6K6HOHu
         SkZH/oKiEIa34fBWE+Pp7dLwh6daHCB6QRRaxlzYlYqM//lJ4JquWaRilCDNFFA/TnzK
         VEmCzCGLcH1KbZEIBCsDDnDTnFtWNMUUxgVd2zZOfXQYBULjZi++Z55+fGpPBQperkyn
         R0O6F5hZoxu4AbIUOR9WrbF1LvHta6ji/6wV/jQ5zdIHbapbCtPjME2fm8xA4CD8jyhE
         tedT1L4XShdZdfwoe9xhw+XzPWzs0OOD1l636cYnTIvGfUPc1D2PpDMeQGdeMDGp+a42
         zJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765876575; x=1766481375;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s5hCMzenBF5ebVm3dyMjQFGef3YOiYb+traO6lD0OEQ=;
        b=myI9rPZtuV6pgL4ibMtAUSqCEkGqfWq4/56W3+vpqGisyV6ZWwyizOY7PJIKPy6GbD
         PvWKn6atM+zQ05zmmqOIf1Bv0a94pyZcZtVyMgJdFkthqmkrg5S0XfplpFnOj8SqEDEn
         7kivqrTx+x7Kzj4m9OEKuH0dlUTP/fTEfZSYpci3VMYyVZR4lNqDpC46gRIGskQJoAQs
         i7ikCrWpg1dZvbQqbRsfrAq5x4AemwtDivzN+5KPoSAlvU574OJ9zVYoH713e1I/lHij
         dS6lk7BJiQvrsONKkftKobdkSyKqUWXqDQMnX5F6OCUtU3EXXZ7FjcLhRdlYTETYWYD7
         3vPg==
X-Gm-Message-State: AOJu0YwGTwh5nGM6NpD6Y8y8irhoYW/jWxSqnaPakosoUoEi0Vgew4tf
	g7Q3mBcgEXOaz5+O+4LbDzmPEQX9tL5eyDZrn+q0r9zvlKlTgdhs8tWAHFxzd/f9iUlm2n+NB04
	J/UQ=
X-Gm-Gg: AY/fxX7qT7C/3yi1fDy9H3SRmjupiZPLJ3H/E7KzzlZqhzb9WTq0CImp48DGu0961by
	X3h4DrYmCPEqYw/mp2MbPyUOnxHoa7JOfpo/GAr2KNr1m97zzZGdg+z2cmpqywS2WA4zWdqoW4X
	YhsO+ISmcpTK2cvP3JpDk6xiJx6iJtKeCiF2otiR7bgfk1ZKJGYW1Hhp1eLt03vmdCqkmPo1Y7I
	0/G5iFMZZ51hLmNeg+xvBkHNn+5OdFL72MkQNC3r2nESkaVZYWP8hYviBmJGetWldkFL0JxbGaM
	JA/oq02zSVf+tGNbjno/4RRHImYSbzQeYhBLGoTCxYOb8QAwVQj8MaP2aQk2F9Y+TSX/RDkiVja
	fV94VF5mIAvLduKzPGpngpWuWlhQ6nmlt1t8DLElDeLCLTemwXghe1nfZzOLJrCUN13hakZQpyK
	COJCSMKUwBoYBvEdyVU5mHv99nG7MAootFLJCUd9ViWyFfg2fRGx1yvR0HrFGXOzmiy86RO+jfq
	xw=
X-Google-Smtp-Source: AGHT+IGrUMqyj65tthSJPw0901Leq0emVkxJFLRqu3t8KkTflM+tulub1xHC6t3ai/XTATMW5K+Mnw==
X-Received: by 2002:a05:600c:46cf:b0:475:dd8d:2f52 with SMTP id 5b1f17b1804b1-47a8f9155bamr133211325e9.32.1765876575430;
        Tue, 16 Dec 2025 01:16:15 -0800 (PST)
Message-ID: <f73aa7e9-c176-40c3-b5f5-81c69cb219ac@suse.com>
Date: Tue, 16 Dec 2025 10:16:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/3] x86: move more stuff to lib/
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Language: en-US
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

1: move / split usercopy.c to / into arch-specific library
2: move mem{cpy,set}.S to arch-specific library
3: move {clear_,copy_,scrub-}page.S to arch-specific library

Jan

