Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D557290CD1D
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 15:06:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743063.1149949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJYXM-0006N9-3D; Tue, 18 Jun 2024 13:06:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743063.1149949; Tue, 18 Jun 2024 13:06:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJYXM-0006L4-0S; Tue, 18 Jun 2024 13:06:12 +0000
Received: by outflank-mailman (input) for mailman id 743063;
 Tue, 18 Jun 2024 13:06:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MUlf=NU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJYXK-0006Ky-Qt
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 13:06:10 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86d122be-2d73-11ef-b4bb-af5377834399;
 Tue, 18 Jun 2024 15:06:07 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-57c60b13a56so6465838a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 06:06:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cbdfe1428sm6639758a12.27.2024.06.18.06.06.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 06:06:07 -0700 (PDT)
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
X-Inumbo-ID: 86d122be-2d73-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718715967; x=1719320767; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sgJyzSQXGbKHDq4saDfIHt0tUyvz/5gPNImLn2CE/rQ=;
        b=b3FL3S3EczRdlY8OiX5QrgHmhrDmurqk1JTtqRKdBqD8kawyn0CuJP1Tk6Ri3uAmQ7
         GO2f6/W4X2qtswU1DsB4KSpO0MK5s1EJ31WYylEseKKAzH+/tQwEIb1AEt4Ni+wZlRHj
         VqLmOkCV7SF1JNLtWQ+0r55AJJhioD/qmePJNmW9Ayv/z/Fv8A3ZduCLJ0fjvv7k2ZhU
         LSbm/TDLsmfJ38GnbhWBKV4YBzM5Z5RogsYaMlJ5YVXscaAIds5TCMYUZyJgjNw+rx7I
         zWKcF5rViNIUHnR4RdPHLIeyv5r53AIaGSULuaNEIae43wNTnT6L82j8FQRfEo6rv3cE
         adoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718715967; x=1719320767;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgJyzSQXGbKHDq4saDfIHt0tUyvz/5gPNImLn2CE/rQ=;
        b=J7GsjCpLAJr3lTEj3s+ZpcMInSDKt9I+PdDFmXwx4iKJAgUUvfAicnI/2dVoBGTyKz
         AkcBvQaaq3oAqZsi7zMkAxbA7aI81jkCh34NLrkbY59AkCBqUW6Kac70pYUgpMG+AAcN
         HMm8o6o4FyF4p0+WUdXKWMifK3fcqF4hLvP0i2JHXDsC8cNpZ8AOhD76XLNX2/avqSBd
         Bf90MM/TqRvgTYDGIRK18BcGmaJeOQauYihwnWDfDRIKpUV5IufCAO6VGMZk9v3a24gJ
         0+AvuLAj7ZztoTMi9BrM1tq6CvCXlWrRWSVCi8KjyNOg66KFxCxYmKPekrumk7TTF599
         MeSw==
X-Forwarded-Encrypted: i=1; AJvYcCWDdU+U5cShWi5gXsojUpild+1ZLHUKC2HgLRbX2PPJuPunU84hy7SavaftwaueP+olCZjWBf4aT46dFISn261mRX5ymCu6eyMbJnm0JMA=
X-Gm-Message-State: AOJu0YxW/sh8ZMlhgvrr865tPllx0ioFFjI8RyUcLgjvCFmHtB4fOV9u
	47GM1ovnX8dthGuHg1zkO0gHuocPujn8X8RldixO9CzijEhIcYbh1gce/5GDMw==
X-Google-Smtp-Source: AGHT+IGA8Ry1ScgoxdyLV52Q75jeK69dhaTRNJxZvTTAECJYuRH7WZDv8j+iy0uWCxk9Fqj1QJWWUQ==
X-Received: by 2002:a50:d65a:0:b0:572:1589:eb98 with SMTP id 4fb4d7f45d1cf-57cbd6641dfmr7808584a12.12.1718715967302;
        Tue, 18 Jun 2024 06:06:07 -0700 (PDT)
Message-ID: <06ce4039-9a03-415b-83b0-9df8dfe8bded@suse.com>
Date: Tue, 18 Jun 2024 15:06:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] xen/irq: Address MISRA Rule 8.3 violation
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240618130048.1768639-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240618130048.1768639-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.06.2024 15:00, Andrew Cooper wrote:
> When centralising irq_ack_none(), different architectures had different names
> for the parameter of irq_ack_none().  As it's type is struct irq_desc *, it
> should be named desc.  Make this consistent.
> 
> No functional change.
> 
> Fixes: 8aeda4a241ab ("arch/irq: Make irq_ack_none() mandatory")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



