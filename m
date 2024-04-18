Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C0A8A9453
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 09:44:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708059.1106648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxMR8-0003UO-Au; Thu, 18 Apr 2024 07:44:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708059.1106648; Thu, 18 Apr 2024 07:44:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxMR8-0003Sd-7M; Thu, 18 Apr 2024 07:44:02 +0000
Received: by outflank-mailman (input) for mailman id 708059;
 Thu, 18 Apr 2024 07:44:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxMR7-0003SO-3Q
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 07:44:01 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b61b617-fd57-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 09:44:00 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-418ee2fcd6dso822045e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 00:44:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 t18-20020a05600c199200b00417ee784fcasm1699171wmq.45.2024.04.18.00.43.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 00:43:59 -0700 (PDT)
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
X-Inumbo-ID: 6b61b617-fd57-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713426239; x=1714031039; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J2fElO+/7tlBE4fdgVbNIPtlrSJBKAx8BVbvMsNGD8w=;
        b=U/V+vyLOgqxrT8Z5t8pTVaKwckeN4Pu14qwVanWScz5vxOmZNrxXMp2gl9p1ZOBaGU
         XTgGziPGPipKCeTwrvSq+X3fcmR1kymfgQryAJoO0PNGukIkEgs2GZLfICxxlK/FYpW2
         U6Ldhh8Cnp41chBIXeIyMJBSJc2CmjMTgg5a798ZGpnGD/p015FOuDlcXf4Xm2EDvsKh
         B+14LWI4fk2A0Nb6+K7dotjiFUBGdJhUDMkDQuez1faJ1157GwHmIxZH8N6Nz76+F99z
         /9Wp9JcEwoX1b0dyhgsCqCS0X5dNeK4qNrjNwGFOtXuwA51ZGrlewN4Z7ms3UqBYYEng
         m+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713426239; x=1714031039;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J2fElO+/7tlBE4fdgVbNIPtlrSJBKAx8BVbvMsNGD8w=;
        b=fvevNJYV/OFCuLHYA9bHC2wGqipedSY76E0iz4OIAZptePHid4Fgr1VhdLpL52OEFE
         Mo1FfgrSpnDr9mhxEV8YJUoolyjvZzv59DuDNsJXzJ9p4uZDq9M/mpmwfBuaPwL1ywgE
         34zXyy8SvRM/Bo8FATmy38DYQ7AT5Dv5x1gqgsbqy2BCDqvl70cslZFGUjk0eRB27gmj
         tG1Y42w4JmbO0l/kgqZPxDL8Qq4burNa+vj3BDf/4xSHuv74EwvK504Mjxs1BRJ9iLjj
         gA/C3iq8suWgKX/95ztfoW8RHI4c3uOgdq1eysisUlN70EK4UI8YwwdGC6vu36kP5T+J
         PVvA==
X-Forwarded-Encrypted: i=1; AJvYcCUclM/tvy/b1wQM1VXi4bAu260KuVgVp61XpESxGZkkRcFxR+z2g0jDpOXMT38kW/r08uaTXF5Dwy9ZOc//5tNNz1Lnr4cMkTJtD/4J3C8=
X-Gm-Message-State: AOJu0YwBxHILxw0PvaRFyAAgzqAHea4wQ5bfFSMCfVa3EqVPxkwAZjKi
	7UhfVljGLOr5qtlqUxIJHaRiWxJ91D+6RA2P42pNNe+c00KxGCqCoXAgKQY8bQ==
X-Google-Smtp-Source: AGHT+IHfWGRw7vHUZP7F+M2H4hunaczhO3IqzmyTDX4noHTePQW9D3IIbxjn7cGEXIRzS6O56cOSTg==
X-Received: by 2002:a05:600c:524a:b0:418:4ecb:fc80 with SMTP id fc10-20020a05600c524a00b004184ecbfc80mr1401554wmb.23.1713426239650;
        Thu, 18 Apr 2024 00:43:59 -0700 (PDT)
Message-ID: <503afd2c-e903-46d8-a192-04162dce106c@suse.com>
Date: Thu, 18 Apr 2024 09:43:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] Clean up of gzip decompressor
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240417143716.27189-1-dpsmith@apertussolutions.com>
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
In-Reply-To: <20240417143716.27189-1-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.04.2024 16:37, Daniel P. Smith wrote:
> An issue ran into by hyperlaunch was the need to use the gzip decompressor
> multiple times. The current implementation fails when reused due to tainting of
> decompressor state from a previous usage. This series seeks to colocate the
> gzip unit files under a single directory similar to the other decompression
> algorithms.  To enable the refactoring of the state tracking, the code is then
> cleaned up in line with Xen coding style.

I don't mind the content and style adjustments, but what I'm missing here and
in the patch descriptions is weighing of doing so versus ease of importing
changes to the original source.

Jan


