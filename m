Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DCE8CF908
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 08:26:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730596.1135719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBTod-0008Ut-Pt; Mon, 27 May 2024 06:26:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730596.1135719; Mon, 27 May 2024 06:26:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBTod-0008TE-MK; Mon, 27 May 2024 06:26:39 +0000
Received: by outflank-mailman (input) for mailman id 730596;
 Mon, 27 May 2024 06:26:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O60l=M6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sBToc-0008Ss-B2
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 06:26:38 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 124ba49f-1bf2-11ef-90a1-e314d9c70b13;
 Mon, 27 May 2024 08:26:37 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a59a352bbd9so889236366b.1
 for <xen-devel@lists.xenproject.org>; Sun, 26 May 2024 23:26:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cc4fec8sm460223366b.99.2024.05.26.23.26.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 May 2024 23:26:36 -0700 (PDT)
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
X-Inumbo-ID: 124ba49f-1bf2-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716791197; x=1717395997; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O3KlDk3at8kArWpRw4gaoY2c83aieDAcfR2I+/iMY18=;
        b=ATXk/X9gtzYaLmmOeSfjOS8cP26YUUw2sLf+AF2gzKrtvowGEwxe1tNwuxG/jzb3Ys
         tokM599T+nfxrc4BJhrOb8oNeHyQMy42p2iLC0/uZftiL7sUN7DUAHhpYPiUSIQFNxKo
         bjWxz7l8fjoQqEzyiidFDm2gl0SIccd2oekXXsiiObVUTj9ZjIMboaujDtiBmp8aQo+l
         G/039U1b8zJSGMl5Z6XNkhGhH/gWasmEFUOYEhqux+36x8buU32zRF7mbg9urLD8xvlY
         oMUHX+HLlnzOYA2tibthABLY2HuzkEwZJDRm6oHUOON5+junJABMpgZLUbmz8KJq06rD
         eK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716791197; x=1717395997;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O3KlDk3at8kArWpRw4gaoY2c83aieDAcfR2I+/iMY18=;
        b=HA8b1HEz3Iv1ktKsasuDoTzqNXBpPYYuBSFj3HN00cG8UTg+ucruRty4DDAm1Mt6ik
         qBgcqPnlQOtYU+3GR355LQjOjXsFRAY6UhVCc7NwzQAXDxgD6E4QfEcNg5FIOtApMjCT
         oP+h8EpAvz9JAcs5dE0sZyruRbDWKoeK1LGiI1nfi05xOoG6IyZclWASTicx8rik1gZC
         5d5BGoMWtfgi1I+LGkpV7QtIopuEAUu/7h8sHw+CuqC0e0YRJtzdZp3evkDfE9hXTHVS
         ICUSG3cj5pbNaqxnQPSukEoLRQFDlIhEwVKkzURrIFCjnGPZwoV3+QQErzRrXeEdAk2R
         rfCw==
X-Forwarded-Encrypted: i=1; AJvYcCX5bVcPUSFaA5SrbG8sjJIwi6f4uENwojmypUSR+uROXN9Cp20Vueh2g5wKkvWZ9dshxMZWe+UlzAGI/2jap3W8Nnyh6o/tVvzYDjlvgos=
X-Gm-Message-State: AOJu0YwRRS01vPUwEFLLkyhtnLyh0d/9xqT7ew8VZ05n0me9NjdaKiBX
	HYTJl/qLDQMQNDDKo++/N01GXIW7f27FFCT8ncRJIqcNEzuwbD1F1REh9LVJdw==
X-Google-Smtp-Source: AGHT+IFSNdFXrWqgM5qr6/IzgalHyqRwX2Z2L/AmaAQNHRbS9ZdfS5vGdTpGcrSuirAagqPn1+o+Ew==
X-Received: by 2002:a17:906:874c:b0:a62:2cac:b78e with SMTP id a640c23a62f3a-a62616df030mr745198766b.6.1716791197017;
        Sun, 26 May 2024 23:26:37 -0700 (PDT)
Message-ID: <d94f3c36-66f1-4db0-bc57-477e48c61240@suse.com>
Date: Mon, 27 May 2024 08:26:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/13] xen/page_alloc: Coerce min(flsl(), foo)
 expressions to being unsigned
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
 <20240524200338.1232391-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240524200338.1232391-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.05.2024 22:03, Andrew Cooper wrote:
> This is in order to maintain bisectability through the subsequent changes,
> where flsl() changes sign-ness non-atomically by architecture.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



