Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FBB9320C0
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 08:51:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759312.1168971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTc2D-0002vI-OK; Tue, 16 Jul 2024 06:51:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759312.1168971; Tue, 16 Jul 2024 06:51:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTc2D-0002tn-Lb; Tue, 16 Jul 2024 06:51:37 +0000
Received: by outflank-mailman (input) for mailman id 759312;
 Tue, 16 Jul 2024 06:51:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I1NN=OQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sTc2C-0002th-GJ
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2024 06:51:36 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7a2b66c-433f-11ef-bbfb-fd08da9f4363;
 Tue, 16 Jul 2024 08:51:35 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2eea7e2b0e6so68834321fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2024 23:51:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bb9c426sm51254585ad.76.2024.07.15.23.51.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 23:51:34 -0700 (PDT)
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
X-Inumbo-ID: d7a2b66c-433f-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721112695; x=1721717495; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SmOMPqTUe+kLcJWOeDEFMaVgtMKs7125m+BLUwxtunI=;
        b=D2SXkkDxP3ptYaPw8wTPp0x4M7tNN1DhcM24AkjfgXvXIJAVnzK5RuLpgyRASqhb3i
         r1FGHnTPTyB96ZERUn+Er+JEF8ylCEBHAdLBobkOBAjVMAFfCP/jSeOViEwXBrQEZ2rZ
         O7+dGT0AaIwQL3Nj9pju2jf6EYXadTBFLNOrLFLrsx9bQ6tlW/ywpUqNQ4f+0rROCmyS
         GGTYe5MBxIQoQJLyRASrBEwv9Z+BeTEI3+0dGuPQks2vk+kO60GeHfavufK6Dq1MK4tN
         z/29JjT3DJhRZZA3OaAH9YRT+EB9YVmqOHkrymSIVFvLPuLevjAt9zeEIZkcQU+B+nxe
         G4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721112695; x=1721717495;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SmOMPqTUe+kLcJWOeDEFMaVgtMKs7125m+BLUwxtunI=;
        b=CBetkeKnVqkdbZ3FaI1b5FWQrGdz0eDSaddHF/mf/X9iwEHD3LJLQsuVxOA0ynyFz/
         gYCypK5d9xyfG0BsAa3OtU/k6h1hLUvyVYBmsxPIhhZBE/8Czjj+30NYT2elWxR4ghQE
         0b6w0lfF4PmpV0HB3iWppAPqmgpql+l8F3Il0VeyY6DSAPiLpxB1/7ZQ/ER4Iaj00GS4
         JyUg2tBA0sM9wOovKLJ50cQI2fYpS2XzICeVYRD6e5JC+Iwos+u/Jj0KHdT0SYUxXbPs
         WIIknPNK5mlpsrwoqZcv6bp2WAmDPE2rPtmi9E7LeNQkbVFSjFPVJcpFMSA7sAwcPmco
         i37g==
X-Forwarded-Encrypted: i=1; AJvYcCVssYtno8PV4bg8XOQAnx+2p+uJWUF6NUzpeoLxH6RxC48iDhaHbwz+WsAVk3Ptip7dxGrBEtixMXFwWx5+4sBKQ4Ln6+TMXqAVdJenO40=
X-Gm-Message-State: AOJu0YwqdkvDx4TR27xYC8+P56cZUq8bOHfpujvJe6ZuXLg2fH5IUWkg
	y5U0dEfkgD2Wm6n52VvFIoWi4oppKrFzs7+u8Ey5H6eFxBiolYpaJU6KAWP7mQ==
X-Google-Smtp-Source: AGHT+IFPyu0i7KG64fznDelsHFORBIOZ0H/h0c+phIWZT3GYWRg8+FynJdU4pUGiof3IEbsgz2qGMA==
X-Received: by 2002:a2e:7d0e:0:b0:2ec:5518:9550 with SMTP id 38308e7fff4ca-2eef415ffc0mr7966751fa.10.1721112694719;
        Mon, 15 Jul 2024 23:51:34 -0700 (PDT)
Message-ID: <62fffa18-b3b4-40e3-8273-83c4276ae549@suse.com>
Date: Tue, 16 Jul 2024 08:51:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] docs/checklist: Fix XEN_EXTRAVERSION
 inconsistency for release candidates
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240715155051.3375999-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240715155051.3375999-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.07.2024 17:50, Andrew Cooper wrote:
> An earlier part of the checklist states:
> 
>   * change xen-unstable README. The banner (generated using figlet) should say:
>       - "Xen 4.5" in releases and on stable branches
>       - "Xen 4.5-unstable" on unstable
>       - "Xen 4.5-rc" for release candidate
> 
> Update the notes about XEN_EXTRAVERSION to match.
> 
> Fixes: 15241c92677a ("process/release-technician-checklist: Explain how the banner in README is generated")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



