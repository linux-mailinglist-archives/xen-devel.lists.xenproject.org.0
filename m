Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CCC93F888
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 16:45:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766851.1177382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYRcF-0001HV-Oi; Mon, 29 Jul 2024 14:44:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766851.1177382; Mon, 29 Jul 2024 14:44:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYRcF-0001G0-Lt; Mon, 29 Jul 2024 14:44:47 +0000
Received: by outflank-mailman (input) for mailman id 766851;
 Mon, 29 Jul 2024 14:44:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYRcD-0001Fr-SO
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 14:44:45 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14190caa-4db9-11ef-8776-851b0ebba9a2;
 Mon, 29 Jul 2024 16:44:37 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a7a9a7af0d0so474289666b.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 07:44:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab4de7asm516353366b.66.2024.07.29.07.44.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 07:44:36 -0700 (PDT)
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
X-Inumbo-ID: 14190caa-4db9-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722264277; x=1722869077; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N6z+L8J4g/6gTtcX1rcZAOHLgCzHuGot2VvPUUI2fB8=;
        b=IrFMFzAqAxzMEmqrAbWpqV32BNn5WN45BAM6A7Wbgc+WYSHm6WuA+LlMn04lZ7NWBM
         IFhtu90eG6WKsGWA5JyiFROgg5vuRO/LxKuwJCSb61Gwsoq7TcMKbX34YXYfKCdVVxcP
         W0WjyqgBLs/P39ZtBXw1nLZ3iXrAp3iPzfTKRfyWS7mC+2WfIEt7WT9KUEI/0H86y9nn
         0qBzGQljA2tXxAlYt5MVLtpaZSzVL4g/viwg17I+WSis2KFUyPlBmJtNMMMJtkGgp/hQ
         TbW715ttjuDoYOnPHtBVOswLyljUtoWLbSx8nrDhG+0m5I7WyLa2tfg4OXJ0sEDkofdL
         v3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722264277; x=1722869077;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6z+L8J4g/6gTtcX1rcZAOHLgCzHuGot2VvPUUI2fB8=;
        b=Ul92nCi0U9RojJJGcSpBIh3/YFaQweZeHT6msWaAYJSOTo0WqJMwxkkPPsKjNjWsqm
         c7y9O4opdu9gECD2xAF6tQQGD/dLPX9Y0X1j8N0IjGsBGDbEYdLaBFekRf8SFoa0UcpP
         fDL/IXynw9TftLib6CAJRez4sjURedPVqQCGg5Ycx90jsCbHZAGqRJc3g7g8OSlXlOMZ
         5AVq440QLeceL2p5kKKhcIS8MinzOdZbkYg6uSWzXJAmdqIQCGWg0qIav+OSIjBJl5rv
         ErfCgSYkXSC77zjOHV+33pMN8IC5S/jKF85UjCfiklCKduR25uiu71YQfqwUsTfDUAl4
         Qk+w==
X-Forwarded-Encrypted: i=1; AJvYcCUIwOU68FwzgUUYYHkOxW0le+Al+WJdGMVvTdk8IDXc2f4k32ahAo+TowK6wz/onC6/nzZdirKa0H0JqwrXfhDPUECsKaL3MpDsMgUmmAc=
X-Gm-Message-State: AOJu0YzwbG+HQMO+6A3rRLINKAPWRehqhKoJuO4y9w293fxfyRpjwiTJ
	ytMiyiioyXzcxlRN9MDpE57a0FF+MaZaiMuNgPjqCz/h/TSboH3Uuc/4xxn6TA==
X-Google-Smtp-Source: AGHT+IFZ3+od9csvA1zxqfjuvpfa7iS4vqfl0hcoywcP9Z9lHMr60qtX0TDAbA2r0iC9WqpXh66D6A==
X-Received: by 2002:a17:907:7205:b0:a7a:9ca6:527 with SMTP id a640c23a62f3a-a7d3ff7cce8mr562413666b.8.1722264276797;
        Mon, 29 Jul 2024 07:44:36 -0700 (PDT)
Message-ID: <d62df418-ff89-4594-944f-e68513d1f672@suse.com>
Date: Mon, 29 Jul 2024 16:44:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v5] tools/lsevtchn: Use errno macro to handle
 hypercall error cases
To: Matthew Barnes <matthew.barnes@cloud.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <f7bc11cc63a7b8596eb7a7c17f1e5c910f0009e5.1722263364.git.matthew.barnes@cloud.com>
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
In-Reply-To: <f7bc11cc63a7b8596eb7a7c17f1e5c910f0009e5.1722263364.git.matthew.barnes@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.07.2024 16:34, Matthew Barnes wrote:
> @@ -58,7 +80,8 @@ int main(int argc, char **argv)
>          printf("\n");
>      }
>  
> +out:

Sorry didn't pay attention here (and can likely be taken care of when
committing, unless other comments arise): Labels want to be indented
by at least one blank. See ./CODING_STYLE.

Jan

