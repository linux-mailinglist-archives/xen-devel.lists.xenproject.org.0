Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C68A76736
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 15:58:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932552.1334656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzFeq-0007mK-Dm; Mon, 31 Mar 2025 13:58:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932552.1334656; Mon, 31 Mar 2025 13:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzFeq-0007jj-B2; Mon, 31 Mar 2025 13:58:32 +0000
Received: by outflank-mailman (input) for mailman id 932552;
 Mon, 31 Mar 2025 13:58:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AhU9=WS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzFep-0007jc-Pr
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 13:58:31 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a55d8cb-0e38-11f0-9ea7-5ba50f476ded;
 Mon, 31 Mar 2025 15:58:31 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso32153315e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 31 Mar 2025 06:58:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b66a991sm11320525f8f.49.2025.03.31.06.58.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 06:58:30 -0700 (PDT)
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
X-Inumbo-ID: 3a55d8cb-0e38-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743429510; x=1744034310; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U+GInvfsN3kjK/Q48BicTf0FkS9B2qd7JemBdXxleTM=;
        b=CWimFhYM8boS6t2gSztpCJgxJ/wNaTKet4dXddIgjblwmt/A/ogafC6MOCfDt5Xrhi
         4LPiybAp0uaR4977gJUytVDSDZ4UqDQS5uDfinhsvoyhzbW+G8n2sf7C1RzhwWS2506W
         r5D5lc2+TkzhIbNUF1Kd/d4oMncqtX8Ttry/6w0IaoJ7tNeclQ15+GD9saV56cPa2sk1
         ZCgg+Z4fl2P40ukmv/vJz2AUbs5LqEbHeD+xwbP7IKzWVdW/BJ1XBENGzrhLkskdBjqu
         4BYR3CWIw/I3xeeXRP3TyqSXVn3S4Sb8mBlVWTqnHnhUiueHIg/QE+bXcJitpbr9tydu
         iXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743429510; x=1744034310;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+GInvfsN3kjK/Q48BicTf0FkS9B2qd7JemBdXxleTM=;
        b=RQfH3pHF/6QrOSS5zFaj3ULRjYLow9bZPKL+2HGGH+nEE4M6teDx0RDlYoJj/hvnhV
         YuinPPYiee3i+DpiWHTMK4S4XC3qBDIjO3tIzwK0AU8g8KthKLk/jvKFULYI9GDR3Xal
         GGo9rLVMSgNk2ebeIoEc4pF9nNCM4fduLXWFKGKk98MgW/Q+POAv9d6NRjjohd9LgtQz
         HOzjnTgpYFD4pH18s8/liZkhcQchx9SdheJgeWNvlQHX3facba/wc7jNy8y+nR68ysnJ
         SoAWN3aeBgpcExtzZy4LhBnTtgSR3wWGQIclXbPu2zHLawyIm4XfoTxt4MSh43//fovg
         GMdw==
X-Forwarded-Encrypted: i=1; AJvYcCVCTSgWQBTa9Doq4ZsbwwRbn1pKFEgQhIFL2IzFN+d++ut/9wdDW3o6MKYNgYWrOkIZGTXoP961CHg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyozPKSe/mBucuunwDGkbac/WqH+UYC9VL2Y3HxwKiLArF54Jo7
	oXdpBBNG1oAXgKAOayDAns4/1iYg+hhaBBxvo8rXMdyhnzgAf+ZJGVRYjRdXszRLswILWGKaRGo
	=
X-Gm-Gg: ASbGncubxXfUZcn+5SG+yMvInZTnZAWKzdbumJxls2owSKJ2UlDxxom/uV1d1VLD+q8
	6c7AZHOQwxvaHZ4vQkd3vK9C2AQKrk65mHuC4ERdVjqLkJiojolIi19nNajvQcj2dpE0ZE4Iu5Q
	PdqQMsJ63jXQ9wQKrOTpjZwrP10EvbRnRUPoasN4CIpv+wEabNxQ4cdK4glMeE3NK08f58GUEO0
	RZfgscVh50SeqA9ArYiXnPoKVyN5fnwu9eezIEE5MS+8SJhlCd7mfkgcV4HtCBQsSmwMav6LtS2
	ZLTlGLOr45by381kOC05GQZmxk1tALWyJ4m8PXRVgw/W0/hMeJoHEo2PZpIJdY0y8yP2rG4F4VJ
	itHJX5Nb0ZFeT6Lm/phc8fdpYzGB3vg==
X-Google-Smtp-Source: AGHT+IEAL8XBz/HtYOkWnRD2qd90VwrCCXk2M9WvsbeNjJDx9uNOdWZgtl+1IMYGBOMirBFGaotMYQ==
X-Received: by 2002:a05:600c:c8e:b0:43d:d06:3798 with SMTP id 5b1f17b1804b1-43db62bd2d1mr77590555e9.20.1743429510470;
        Mon, 31 Mar 2025 06:58:30 -0700 (PDT)
Message-ID: <a5c4ed08-89ad-4ee8-8bf5-5d64bc774f32@suse.com>
Date: Mon, 31 Mar 2025 15:58:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/16] xen/common: Switch {asm -> xen}/byteorder.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Lin Liu <lin.liu@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20250328134427.874848-1-andrew.cooper3@citrix.com>
 <20250328134427.874848-13-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250328134427.874848-13-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.03.2025 14:44, Andrew Cooper wrote:
> Sort the includes.  Drop useless includes of xen/types.h
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



