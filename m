Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE150C1ED20
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 08:43:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153342.1483705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vENJL-0005mw-7t; Thu, 30 Oct 2025 07:43:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153342.1483705; Thu, 30 Oct 2025 07:43:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vENJL-0005ks-51; Thu, 30 Oct 2025 07:43:07 +0000
Received: by outflank-mailman (input) for mailman id 1153342;
 Thu, 30 Oct 2025 07:43:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vENJI-0005kk-UV
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 07:43:04 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10ae30fe-b564-11f0-980a-7dc792cee155;
 Thu, 30 Oct 2025 08:43:03 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4710022571cso8220245e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Oct 2025 00:43:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477289998f3sm24941075e9.4.2025.10.30.00.43.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 00:43:02 -0700 (PDT)
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
X-Inumbo-ID: 10ae30fe-b564-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761810182; x=1762414982; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ap9w7Iu7AlwJu3WYUKKN2SBlwMP3COki4sk7suezN4o=;
        b=S3M9/elwipbpKO8TpQFGKTsn1PFIHRi9VZGww+w5M4ZcudRHP3SxIhkVgITp/XLFdk
         NlpIn5QCcpvBH6mgJv94xzDtY44kbCtOOYLnwmBztSW0CImKy08P1Sg90Q8WMHQerVtq
         MV55geKUyRD1T8u9kBU7MSoNDN/gXYkElTeVT/vvoi+zOzRXNLnbGgz4oyAwqFEIxKmO
         +1jkPh4mfAD6FX7mVbGphQVtSU8SdzYkb2VRXbJi299ZQugpM1VRNoFQh7WX+tcMW/Zb
         5eNw+UGff9WVp8mAx4LiAVrVQwY1PGczr2G4LqzRcI8OPeOdW8MHzoRIH/F7fdmF5bTr
         7w/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761810182; x=1762414982;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ap9w7Iu7AlwJu3WYUKKN2SBlwMP3COki4sk7suezN4o=;
        b=L9/I5+XYnYZodcz5GCr5O0ruSZOk9L+wZcOA4CM2JERzbXZ3uNaQHe/AnDnRtGcq7S
         Yhtm733+4Q+EkFqhQUWHot/PAEFRe3LUy8jolG/JkSmX7xkd3TDkGAxX0AD2xvhVw6o/
         ckzcMuC3pq3LICKXC2yGV32bZSo+j/AS6XOTgPKho6o89wgomakQqBjwsm/IJx/2KtFj
         bGGGjsT2uWqNZraZCU2lzNydADONJ2lI9mmISrBT9m5brOrNj6dPhudy6LqeqOe2dyMv
         WaJMcq+CdGW0+YQm7hjOREeSDN2r/aciMzS+Omi7rirPj7B4nmp7KmHpxrLyRBYIocdi
         lk+g==
X-Gm-Message-State: AOJu0Yz6xFmLlYKoBnFpcC/aPERtQaLzxe2+ewwfzpoOE83apZxibXAG
	xoMv2HirwbPP0UrxNVZOydUADb4fBS0Vgvi9nx+BhRyItDYxSKQxRJ7nfz+hVj1yeQ==
X-Gm-Gg: ASbGnctCxpL74acoqo/HZVxsP4tcLOUVz9hmyRvuuj37DtjFq/GLUUEJWRcJrmt0OAq
	gwuoJnloce15k4pZfG5emWBWnhs6oGXVOUVt7YM4+8nBBAeBvyRkKu3sLLmGs6Wcc4jzgnaDX4U
	jRdqfUbnqkCZ+nNXyWYFQmTInAxB2+7KEMj4McJs45aMWQBrQ/IuUQd1sXJrt4FCthAdDwfGTo4
	Onuk1Fw7UiEJAXxRRaYj7IdY80Lv6JEvbJID4wAut4zHNsqx/f5Atlb/tUPz1GDLdcqRJTuusi3
	IReJpyl41t+iyYhWuebdtaCZEjX0cU2omprdrd6vo/5xvaj3Kpzj6A2mIPwmVJflV6y5hH28rTO
	XnN94I+750u4hszaAL6HlcGkx455/Ltf/j0AMKbaA72D+hKwx093JZ6pkBCiZGc6ImIZtqaxK5K
	P9E85sz8mOcdC8M7DTaDQIbUyNwDLs8Q9A3A8Za3p+SxZINV1jcOfNw58+i/oAD9C1abG3u0E=
X-Google-Smtp-Source: AGHT+IE1SlBGBbSKp0VSJASQb4/2nu+vsbONY+0eaRGt2JU/b8lvC2UP/imAVEAnfkG+/V0qAoRkBg==
X-Received: by 2002:a05:600c:1c9f:b0:477:f2c:2923 with SMTP id 5b1f17b1804b1-47726821c13mr21684015e9.30.1761810182522;
        Thu, 30 Oct 2025 00:43:02 -0700 (PDT)
Message-ID: <6744abf0-3326-4de2-a14b-70faf56e91e6@suse.com>
Date: Thu, 30 Oct 2025 08:43:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/ppc: Fix tooling FTBFS due to missing definitions
 in public header
To: Timothy Pearson <tpearson@raptorengineering.com>
References: <1066630274.4872.1761755029561.JavaMail.zimbra@raptorengineeringinc.com>
Content-Language: en-US
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
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
In-Reply-To: <1066630274.4872.1761755029561.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.10.2025 17:23, Timothy Pearson wrote:
> int64_aligned_t and uint64_aligned_t need to be exposed when the GNU C compiler
> is in use.
> 
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>

Thanks. However, you've lost my R-b, and the Cc list was again entirely empty.

Jan

