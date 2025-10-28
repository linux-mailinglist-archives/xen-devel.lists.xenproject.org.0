Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B850C15789
	for <lists+xen-devel@lfdr.de>; Tue, 28 Oct 2025 16:33:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152218.1482734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDlgO-00083a-Rf; Tue, 28 Oct 2025 15:32:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152218.1482734; Tue, 28 Oct 2025 15:32:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDlgO-000818-OZ; Tue, 28 Oct 2025 15:32:24 +0000
Received: by outflank-mailman (input) for mailman id 1152218;
 Tue, 28 Oct 2025 15:32:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LPue=5F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vDlgN-000812-Ce
 for xen-devel@lists.xenproject.org; Tue, 28 Oct 2025 15:32:23 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ae0473a-b413-11f0-980a-7dc792cee155;
 Tue, 28 Oct 2025 16:32:20 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-471191ac79dso64688045e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Oct 2025 08:32:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd03585esm201593405e9.6.2025.10.28.08.32.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 08:32:18 -0700 (PDT)
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
X-Inumbo-ID: 4ae0473a-b413-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761665540; x=1762270340; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bUEXUS8f/CtUhZEF83/hQogPceIPkhRtyNCGz1YcQ/g=;
        b=dgmd/taezpAxKY+llA6nJuNXb2TqkWabYZ2QvliTWq7apSTJFr3pKKLa2URhogaG2O
         ejhIvrc1xUALMRKIFA+pzRVEWhpTJ+F8571EkUoQTth/prsHa8opkecu1QuyoXvHJDKY
         GpEreOoJu47t8pHT0n6stqoxsfbLQslyxbUkFDq4eLKHi0CqCFqdKXVk5rwdh+XD0W/F
         KnMaL+w6BcNNhAWs701kuDfDpj20WAJueuOtlB3X6h0A31j6PGctUeCqv43hL2SSVUU6
         AKHbTdnynjRYOGJohgGQ74k72ZS0leNHPwb/DekqwP1DSuqcnOFe4/GLnxiP+5DNjNnS
         j6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761665540; x=1762270340;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bUEXUS8f/CtUhZEF83/hQogPceIPkhRtyNCGz1YcQ/g=;
        b=Zlmx/BXqEGRe7K4Gpn2+9Zls5PBbbGen+onWYrt7tmzUFLdY+lhx1SqTgZdQt73V0E
         EUZvNIgxsK5x1UGvL8/T23a1HHO9Y3bMz1zW1gv8dRwIRlVu4DuLvSAxcvWly7Ci2Sy9
         3X5BtSWTCT7aPuB+bxg/eAlCED41hw98Q6snnrsMW2jHEyqj/QlwqbCucH4YqTkdCcO5
         mI/GAeC74/3mm5+xhNIuK2ZoccX7WTiITAZb1zYCPab2I+dY35SlnbV8eSvyl/5hgqvI
         a3DLggvyv300hfW8CsJkDUDmI6X6rtAuQ9hjpy4LBEjAJLibeO8cRsmPXIeLFHlmJfmG
         gD6w==
X-Gm-Message-State: AOJu0Ywzn42CArWF4vZ2PEVXG/GvbZm31Z9nrDd1dIHkY5jWBOg6T0Fi
	W+YSoG2gcEGzPXuasp0vD5Wo9MhSO9lhIO5XTjkYgQy4cpad1bOCM0NAOI22z17GangB3HdLCI+
	ATZM=
X-Gm-Gg: ASbGncthdmbrXTfgaeh2IMxgesqWJjCHol/yR6BEsh4gdjEpQceEeOYetQcq9l9dp/H
	Tm6tgXf6QHIRDmBFvkweoBSlNTWFXQ64mlXqia1VnFe0LKhUSyt+OPbGf1L4FJJ1Rc1Sj7DPlut
	kHd9gXPV21IQpYmiV5oXMTHgpJzwP7K39trMtY6XIcvYRL0xKPnUdV7+LyFuY1CGf4/2szv014V
	32P9pec8uM5yPSu29BRAuWIuP1clKwvu3hO2AnH/OYxA/lh++1c7RK9ntmaK9P3EbnjLEnWQCPk
	c5cvBUFr9qog3fkAJykOBwYzsF+Bv2BLirC9o9drdhHsbVE4mgQ5RM/0BBO72ZwbzOmR0SLQIqP
	G+HBLxwIB4Hwt2rdNgHaQ8WpTfXqip7CFfgMIHe6iqQIhZK8whzB7PndlecE6G3dlJv4H39WKH7
	/dH+DojFYB4CS0cNVmPLV5lyo9odGW9kCoJeVkE9xLZ1LeEmxsZdm4owF3rtll
X-Google-Smtp-Source: AGHT+IGoNMHgosAdDY4lYucD56q6gsCqeknxnc99YBxMltLebl9P6v8c3Dv0jUWGdyh6NeKSFoOB/g==
X-Received: by 2002:a05:600c:528a:b0:471:21:554a with SMTP id 5b1f17b1804b1-47717e03784mr28953065e9.13.1761665539736;
        Tue, 28 Oct 2025 08:32:19 -0700 (PDT)
Message-ID: <272093dc-c97c-434a-9977-ad1c26e7e229@suse.com>
Date: Tue, 28 Oct 2025 16:32:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 for-4.21 0/2] x86/AMD: deal with RDSEED issues
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

Both patches also want 'x86/CPU: extend is_forced_cpu_cap()'s "reach"' in
place.

1: disable RDSEED on Fam17 model 47 stepping 0
2: disable RDSEED on most of Zen5

Jan

