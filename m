Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D97AD3C0DF
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 08:50:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208446.1520602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi6VD-0003wj-51; Tue, 20 Jan 2026 07:50:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208446.1520602; Tue, 20 Jan 2026 07:50:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi6VD-0003ui-2K; Tue, 20 Jan 2026 07:50:15 +0000
Received: by outflank-mailman (input) for mailman id 1208446;
 Tue, 20 Jan 2026 07:50:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EVnc=7Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vi6VC-0003uc-Et
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 07:50:14 +0000
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [2a00:1450:4864:20::344])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6594d72-f5d4-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 08:50:12 +0100 (CET)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-4801eb2c0a5so31409125e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Jan 2026 23:50:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43569921da2sm27829302f8f.1.2026.01.19.23.50.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 23:50:11 -0800 (PST)
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
X-Inumbo-ID: a6594d72-f5d4-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768895412; x=1769500212; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Uo//KNX2NUE9m72eGstqyYNgDqAe3xJiyhPzdd7xWPw=;
        b=MwQOMMBEqeOz5r2778q9G/Gb9ve9EykhxCbNf4HsG5tSHQqCoQzeB0kj4l/XszUsvE
         tePXvFmzyPBtOKzBfp2rQ2RyhFq4jdI6T6STLGfQ9lHZSgwSZWK3gRhBUZs3iEJD7o7e
         VBmQ3w6xf3Z0DTtoNNWILzq91xVf3dCbWXSI8Cx3F4ZIUlk1fes7hnBSxB62h6jMfDa/
         tVzrbk+nIzvtHj24aPuR+8jBsb3mBEQve92Z/DvJXMND5bDj14dCMOG1mm/T8IlY1fel
         WbD9oAmkCU1bYtaxxk2vCrj/blk4bhaZpGN9wNHcH6wd0QjYqHmInoZk7CNO6KQy84aN
         TRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768895412; x=1769500212;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uo//KNX2NUE9m72eGstqyYNgDqAe3xJiyhPzdd7xWPw=;
        b=JAAsAT1A65QEYaLCImDiExorGvghgHtQfEO40ypOCG0Ju3I2qXTrLNnFHSP6j+W38Y
         d8uF5guLVijlnA3CORuNTl6JjDZN5+fidsPAZvKy5IVvth7BAAynj9P/LnFMAoyKiepI
         J7sxSrDgwoSONOx86PAVHz6xMWe1EjcxVo+F63YKFgT+DAfbjKOkRJhy3FsqT9aDq38J
         O0E73WJgDLgegC7gWRdIyQuzn/PtdtDQPtmcEnkULagypdCF1A1lRTtHOflyNvkgYGwp
         QTDt4r/0yUePY8FCGIJ2K+hp7R794DePl4uddQ4RmkNnBmVLBpoaM7q3q7NXFgTYQgiM
         FmSA==
X-Forwarded-Encrypted: i=1; AJvYcCVUopPmH6dmHg81g/k6qxcSfLKM3x3GDyCx1EmKcN5el4Oj4I3nWxpMkvgQQlsObkOhzpfKPoVslFs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwXjpdrUkldTzWJzBKAqE7USQXt+8N+FrSOXseX3ViCpbCWrEMr
	1XLUMGARMTYwzNH3cDpKtHABlNd/g3o/vxuhkEXmavKTcrYrMNeSVgBcFTfjoOOMXw==
X-Gm-Gg: AY/fxX73TjJDPLy6aC+yBzQ15u0mwCkIvCIyrbiqn8PCwekNyCHA3FoUJ9a26ZeR7EY
	D/3zc7gMguNv1DB6eY+t/I6K0CgeRnbR/79LiAkBNA9MlwXtxTKt66KcSkU5qW5XyChfnFB+QPo
	OF4UxxUSPkPuFgzncjidezeZm2nIbLu0UFEQ511V5KW9/QImIk8QL3lvaDjguh8ptnLDjiM2Eh9
	7+N/4J2j2jBD6L7Q1+1/Ffra65qg0Yc83rCVc8qpnk8XRXuSCgLtiwpAKhQqPfnUUvDu5CBu2Pv
	9VQRmOPIua2GiAji8X0+PyXJTVE+4PYBWhvE29XIlU7Dpw6GzHCDkbN2hv9w39mpiLzVuhGW68f
	m4qGEiN7XxqgQq1yARl1GoY+LPDv0OAdKkgXGSMwHOig3W2Ciu++jHc5eTRm7TpbLHGYrjDL5VT
	bHMFtIJ2LuWVtDGr62r6x4+sCZXk8uJLO1MusUPpgToLdOUni3AbUMQcoBGcDUJUVAAwCoG9MaG
	jY=
X-Received: by 2002:a05:600c:8b8c:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-4801e2efd61mr172869635e9.4.1768895411867;
        Mon, 19 Jan 2026 23:50:11 -0800 (PST)
Message-ID: <14a32e1f-c5ca-4d1c-b54b-c565184bd6e7@suse.com>
Date: Tue, 20 Jan 2026 08:50:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/intel: Drop more cpuid_mask_* infrastructure
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260119193901.1354905-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260119193901.1354905-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.01.2026 20:39, Andrew Cooper wrote:
> Despite removing references from the documentation, the Intel parts of CPUID
> Masking were accidentally left behind and still active.
> 
> Intel CPUID Masking is even more niche than AMD masking, as the MSRs only
> exist between Nehalem and SandyBridge, being fully replaced with CPUID
> Faulting from IvyBridge onwards.
> 
> Fixes: 317051c2f032 ("x86/amd: Drop the cpuid_mask_* command line options")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Yet I think you also want to edit the CHANGELOG.md entry the other commit put
in place, to not have that remain AMD-only?

Jan

