Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3E793F0D2
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 11:19:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766539.1177033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYMWm-0007hT-0b; Mon, 29 Jul 2024 09:18:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766539.1177033; Mon, 29 Jul 2024 09:18:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYMWl-0007f0-T5; Mon, 29 Jul 2024 09:18:47 +0000
Received: by outflank-mailman (input) for mailman id 766539;
 Mon, 29 Jul 2024 09:18:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYMWl-0007eu-Ag
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 09:18:47 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e182b14-4d8b-11ef-8776-851b0ebba9a2;
 Mon, 29 Jul 2024 11:18:45 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5a79df5af51so9105425a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 02:18:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac657835e4sm5448360a12.93.2024.07.29.02.18.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 02:18:44 -0700 (PDT)
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
X-Inumbo-ID: 8e182b14-4d8b-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722244725; x=1722849525; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L+v6GWjC+xZB+T7KOMoGEA8L2CzaP6mV/aOf5UNjKa8=;
        b=gKaCB3/6d+MZVVK050cTNI6fI3hqAjTCoekVek5hFpq5Whb1Q3gD7wg3p5T8hs84Hs
         J9aTZFcUKqyG0yR0NW94HX5NgXFLgKwjjsZid5StQN3x+62ZM+w4Wh9i8KNSESbMT8kH
         R4drH/wz5O647d5Za0DJ3+kTR2uye074ACBx8ffPiMv+os359lBzDHX0jKtlhqKr1ekq
         nF3sUUn5Fbpf8/qEsK7li0XnwEawgV1Xw1r3GUSUDQU0M2bJ7+y5p0SE2e8SylhUP7la
         0nz43zwCiRfyrOSqOaUaBOU426RiXySJj49KlTLaD6w/dUbxK3pChbKy7BgSKKIQ6auj
         Jhfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722244725; x=1722849525;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+v6GWjC+xZB+T7KOMoGEA8L2CzaP6mV/aOf5UNjKa8=;
        b=fERf9zmx6WA+ATrPNguJTKGfP9qJ61rXQI14fJHJmvLnv4SyYsB69jiHo97djKH9YJ
         wjRGdlBTp1SH3bNEbB4CNa974/V1h0wMGUCymUwW9jxYsmHyTsnTLV7F/7eWIZEmrIdp
         A5OAfB9SMbEDI6vEkO9HHwd7SNiWHfQEYmiWt4hRllStwf5MnE9cOGKSIs2AOQlbY4A+
         DrD++OXh+vRvcRmg60ieH2hDMi0uY5LFoWlh0qr4uG4F0AmomG5zmJhPBxX8WAK9yaZA
         siuycKS+O+nQb8T3dnUKi3VUunsvO5BK/RsED4h/6TENKyPO9cY4gNUNDxU532V0+qBi
         lbxw==
X-Forwarded-Encrypted: i=1; AJvYcCVisgvAWBrXa2SEjN9h3OHv1EYx6r4zW3C7W6nYkHu0GNqGVSp9H3gB64Nkg/+l43xxtCs3Z4a1vmzQdNEhp7RTorwWj4FyyPdMPhNN/6o=
X-Gm-Message-State: AOJu0YxGD7n4d3RhjL9eayHFFWihSc3JBeT2mCHMxqXUmu24m0mbHJha
	Dgize16A6SW7V9ZWWbZKaeql2X/E2CEjTUkvfqKtPPaQCEcMr4WIMRerxMm8fA==
X-Google-Smtp-Source: AGHT+IFJPea/+XqIuSp1S0L3yBKZFAejCybqd1OOckBfHdTNWCNJ6iY8Ho3ZY3i7CX5FTZMFlA6Y1A==
X-Received: by 2002:a50:d75e:0:b0:5af:d7a9:63d7 with SMTP id 4fb4d7f45d1cf-5b0173a0c65mr6428508a12.6.1722244724576;
        Mon, 29 Jul 2024 02:18:44 -0700 (PDT)
Message-ID: <cd4bf474-0329-42b9-b292-d8a7606a1dff@suse.com>
Date: Mon, 29 Jul 2024 11:18:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v5 5/8] x86/hvm: address violations of MISRA C Rule
 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.1722239813.git.federico.serafini@bugseng.com>
 <6814760ce9c58faad6ab3a3b17196d3fccc23b43.1722239813.git.federico.serafini@bugseng.com>
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
In-Reply-To: <6814760ce9c58faad6ab3a3b17196d3fccc23b43.1722239813.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.07.2024 11:00, Federico Serafini wrote:
> MISRA C Rule 16.3 states that "An unconditional `break' statement shall
> terminate every switch-clause".
> 
> Add pseudo keyword fallthrough or missing break statement
> to address violations of the rule.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



