Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 085E299536A
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 17:30:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813249.1226100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syCAf-000725-MB; Tue, 08 Oct 2024 15:30:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813249.1226100; Tue, 08 Oct 2024 15:30:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syCAf-0006z3-J7; Tue, 08 Oct 2024 15:30:45 +0000
Received: by outflank-mailman (input) for mailman id 813249;
 Tue, 08 Oct 2024 15:30:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vy9o=RE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syCAe-0006yx-OE
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 15:30:44 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47be9f46-858a-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 17:30:42 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c8967dd2c7so7194674a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 08:30:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a997ee645fbsm52013966b.133.2024.10.08.08.30.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 08:30:41 -0700 (PDT)
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
X-Inumbo-ID: 47be9f46-858a-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728401442; x=1729006242; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XjmyVc7FFOhdqrCKIZH8v8SqquIn999SeKsAYd5ocTM=;
        b=W4ao2MPffKtUqXkgRtg20pZqx4UdQT2D2rGvQIm1I8H1a80qVNeKpaUSITl1flK19b
         AhzH+trQ1RhajFMUPU7l6chCWPc5D04/k7X7n/imv47JIqUquTUw9C+h6IFuziU/41wf
         s+gENLmAd+TfY0KXe8G/LZ2lUMyz+7Zs9e/FH2kBEN8lvHOCnwh4WRsQXXvKLuenSpP4
         Vlueww408WdRiqJz03VNqm1KiALU+BhPxMz1j2tSSpUSuwN+LNez+Rrk7InEN8hlXnVG
         hPfZLhZXpVII9hxsEXNKGs3mmxdFyCg3C18z4ILVLnd3/7+smgn812+KfnLUh77Sih6U
         Sq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728401442; x=1729006242;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjmyVc7FFOhdqrCKIZH8v8SqquIn999SeKsAYd5ocTM=;
        b=qwk/ivW3wxjNyaUCgJK16+w1qmj1zy9k9GYnwLe6moJgSD5Aj117ZxTc+XjEGt7pqG
         IQm3Z2g8VjVHdb8BiXwLbtBWGn/XS9TnYUdrQrdzK5CxeLFumuN4uRkgKEf74LF/n1TO
         JJU1a3Z3Ll+AKOLxsIuKGBnR+1VRACzhd6LA1w/q+G8tTsfA7hmQOKKn4Ei04xj6d+Sq
         72pXtvRU6NwhyDSn0ZK/93vB9gMM4iC9H5H7jTrzvGLG6gGGLkFmbXXGAd/+nTEb6Bnj
         G4+Mf1yYmw2nd3z3r3mj3ioDSaOf8Geo1DbAMDD9AunVKKMOWbfBSuCn+/dRHiseqlHm
         5bXA==
X-Forwarded-Encrypted: i=1; AJvYcCXuBmqYaY7FTPuYMR1tZJIYH2Bgz7I9RUy8wAEMm4Pf5IPWGw2geUVJjlseseydLPjW/qC99Sx4g2M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyWrwdOa1fJHpohnE1TRiTlNm0ZEm5QqBqjzIHz26jIMrDw2U8W
	7W8exP2kTvTEkqDrIplur5JG549scB1B0VF7ICf2NjqOXHIjOclrMVve7YnB+Q==
X-Google-Smtp-Source: AGHT+IFQnKS9IZ+GblJWBlRCcWOnHPlmX2j477K5AB3MGTy5Yye6XxRYH+ebOZzSUN9BGA35xOZeXg==
X-Received: by 2002:a17:907:9281:b0:a7a:97ca:3056 with SMTP id a640c23a62f3a-a991bd0a833mr1507834966b.16.1728401442243;
        Tue, 08 Oct 2024 08:30:42 -0700 (PDT)
Message-ID: <0c3f6b3d-7040-43e2-823f-520dcbeec31d@suse.com>
Date: Tue, 8 Oct 2024 17:30:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/6] Move {acpi_}device_init() and device_get_class()
 to common code
To: oleksii.kurochko@gmail.com
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1727452451.git.oleksii.kurochko@gmail.com>
 <a2c4278891263ee8d3431321367a32246d7498c7.camel@gmail.com>
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
In-Reply-To: <a2c4278891263ee8d3431321367a32246d7498c7.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.10.2024 17:25, oleksii.kurochko@gmail.com wrote:
> Except the comments ( which Jan wrote could be adjusted while
> committing ) for patch 1 everything is properly Acked/Reviewed ( if I
> am not missing something ).

I didn't spot a PPC ack so far; did I miss it?

Jan

