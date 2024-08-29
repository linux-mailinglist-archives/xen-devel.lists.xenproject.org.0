Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4FA96479D
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 16:08:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785911.1195445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjfor-0006vI-7P; Thu, 29 Aug 2024 14:08:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785911.1195445; Thu, 29 Aug 2024 14:08:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjfor-0006tA-3U; Thu, 29 Aug 2024 14:08:13 +0000
Received: by outflank-mailman (input) for mailman id 785911;
 Thu, 29 Aug 2024 14:08:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ImPG=P4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjfop-0006t4-BI
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 14:08:11 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1eaef7b1-6610-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 16:08:09 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5bec4fc82b0so3130101a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 07:08:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989021973sm83115466b.82.2024.08.29.07.07.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 07:07:57 -0700 (PDT)
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
X-Inumbo-ID: 1eaef7b1-6610-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724940489; x=1725545289; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OucCFpg53QMwr2D4n6uKH73osXrEEX/NwpoqVurCiSE=;
        b=UdRTS+htDfml2JFOwXSpvLpHJ4fOwEzALKfSU+YOP8vt6pQOrHotR4XR/AEJQyacc+
         OUOenqxGR9qX39mbIc7i2xJ9lnMqpRD+V2OEWxiXQYEykHSC2HWRjMH4JyzvRdpzUUF+
         UmrzeTis3z0zPYN0bMkc8DTzbx4e1xtt1Ya9Bz4hY5JX8ph44pvciwA1yXe+Bb6huKkv
         WSfyybOMkYF1n80RysitU+56zcp1K8IFd9yHyCtcWgXy/9+awlwwtF8NyZo2sPOr5Yc5
         r+I3fkzUUSIT/RjKwitxeuVXQkxD4LFVrEF2p23pg/ztQWNXXYbtjb7Arx+rhlH/D8Yg
         s14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724940489; x=1725545289;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OucCFpg53QMwr2D4n6uKH73osXrEEX/NwpoqVurCiSE=;
        b=FkRjW5ntsBZHx9F7nRZXLvmGMHGJTauBF4rK1hKJLVstcL3kO/C5qQgSdaPUeyW8fY
         ujInNRo47UPvwKq21Syl1X04O539+BYp0la3BCSVEvMsZhaZSjHDvjCvLCfqe2W4TsUM
         NRXQkcr0iarEXkBrReMSgyV2+FRQVDZX83Y9tLqlvK8AfYZokxt79VrsO4TRnHD1zxud
         J13t3ZqGQloRSQ1RJVtBrTJS3e5AZV/16PWhx0Tx4LFTeOesGnYrvhjiQL+r6gZU7EQu
         YVyXWgcZrBwjw1oxqjD0xBx7sZ8G/OOcCR5ji12zsdMkXEYg/ss0UQmdKyu4AWbRXVul
         glsg==
X-Forwarded-Encrypted: i=1; AJvYcCU/tfMsprMz9+Z+z9Yu8+5MFymH2l+B0B4DxR7Nj43VP8hFExhFJmCYJgjA7k8UH9rlmz2jHYXfaeY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAF5dN1PAk8O5R4sJZD6Qx2joaYuKokcmBLct9bh/w64VdVTHH
	flVDdhSxTs8kRMRCPVP6ZpRsiTkoTiklLk/PbPo6Px1AeK4bR70ILdrBOakhHqCyra9MnTfXpXM
	=
X-Google-Smtp-Source: AGHT+IE5ndOWrAVJvXNQDhnidKrJlOlYtaroRNDFuietyVHVW9mBLgSBoipdfR54mfA/Pnye/2Qwiw==
X-Received: by 2002:a05:6402:42cb:b0:5be:ecd9:c73e with SMTP id 4fb4d7f45d1cf-5c2200f17b6mr4104535a12.2.1724940477903;
        Thu, 29 Aug 2024 07:07:57 -0700 (PDT)
Message-ID: <116eba82-9075-4d38-86b7-6ee0001b4a87@suse.com>
Date: Thu, 29 Aug 2024 16:07:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] xen/bitops: Switch from __pure to attr_const
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240828220351.2686408-1-andrew.cooper3@citrix.com>
 <20240828220351.2686408-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240828220351.2686408-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.08.2024 00:03, Andrew Cooper wrote:
> All of the ffs()/fls() infrastructure is in fact (attr) const, because it
> doesn't even read global state.  This allows the compiler even more
> flexibility to optimise.
> 
> No functional change.
> 
> Reported-by: Jan Beulich <JBeulich@suse.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> 
> v2:
>  * New
> ---
>  xen/include/xen/bitops.h | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

The various arch_* forms didn't have __pure and hence also don't gain
attr_const presumably because we deem these attributes ineffectual for
always-inline functions? On that basis
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

