Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A62EC8897B4
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 10:19:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697621.1088539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rogUF-0003Pz-Kh; Mon, 25 Mar 2024 09:19:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697621.1088539; Mon, 25 Mar 2024 09:19:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rogUF-0003N9-Hl; Mon, 25 Mar 2024 09:19:23 +0000
Received: by outflank-mailman (input) for mailman id 697621;
 Mon, 25 Mar 2024 09:19:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x9L4=K7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rogUE-0003N3-Bj
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 09:19:22 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3726191-ea88-11ee-afe3-a90da7624cb6;
 Mon, 25 Mar 2024 10:19:21 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-56c0d1bddc1so879403a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 02:19:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h27-20020a0564020e9b00b0056bf6287f32sm2652302eda.26.2024.03.25.02.19.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 02:19:20 -0700 (PDT)
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
X-Inumbo-ID: c3726191-ea88-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711358361; x=1711963161; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GAfcqGCRxepAg7AVdXv8r0pD9kLR3bV2QzuVMdtPw64=;
        b=XIAvlhy+CZd1Kdww5uH/rjwOfBzmupB64b8Cbi5L1NY8bsValMpi6kYAQprKVZ+tKn
         KP7ZZyIh2G0zGyNPPa7x9vpX2+YicJpKVw4zpbQjnY3o/S0X9Wc8l0lehP17+Wqsd1et
         NBiw76pJgDoPUaP/7Qz4zcYOEoYvre4lQP3k3pJt6XIMxEjqGzuvBv3wXN75mCQaTqHw
         PnE9rpF+yzAx1dbrfmB0S11D/N8LQ+04zwEK+40J8w86b3dh6z5I4awsBHok9Ozal14R
         V670Vhx5o7QWL/ZBI2USpJb7tvYUSKrl0p4GpWG8t3xHeAeF9ZrB2P4mmxytpqPdPW/t
         LIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711358361; x=1711963161;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GAfcqGCRxepAg7AVdXv8r0pD9kLR3bV2QzuVMdtPw64=;
        b=CKNTxwdwAHSB4uNoJGvitinguVoyC8meK17b2bcvxRvi3+RtBMFe2toj9drIlyn4JL
         ABgWavQbGcCPAu5wc0CSUbCHgsCxN8/XtBlUv34abvU9ilaxUmoO/I8bTISsBSMOJVTJ
         3lZb/HEHSFgOXGHCEonKhGNPf+Mz/k0wxKS5ZrNrGjQjCOPivJh00fLHSLTNXWV1jxXS
         Y6JWhbFS1lRPZ+aXWckWCEfzXouoRKSu2CyMpbTqVrpFgi0EjVekPkrV9bY/rUY06GiZ
         yDvR4r8W7nxYqn11ZG5qKfcM/4iyhZe2+E5uoW2t5AyVwyvwpT6gl2XtjGF2dFduOF38
         laiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmnE55TrqgSBKe4do0/EX3Z3cdBx+pJZ36SWF6ofpHGhlauGptsa603pvq4tN+Eldck6Se9mnRvNHEqqMyYMGVVXb/Z/ucCotYFhVwBM0=
X-Gm-Message-State: AOJu0YyaSJodvQrlzNh4SeyTHI+/tZJ6KIkLYFii+YaBaonF79h+vYw6
	AWJ2DXJ6sLecQNTh8BX7hT1rrAjWEsjXmxscRISUoHWlHJtdRWgCRBqSHfO6Mg==
X-Google-Smtp-Source: AGHT+IHLBI/s4Urmmo5SP0JH+uao/KRvS2d4I20iB2Kv3LZtbIfPiRztOIO+7zXAiqTtHECivp7LEw==
X-Received: by 2002:a50:c309:0:b0:56b:a91c:65a4 with SMTP id a9-20020a50c309000000b0056ba91c65a4mr4645514edb.7.1711358360693;
        Mon, 25 Mar 2024 02:19:20 -0700 (PDT)
Message-ID: <b7ade02d-2002-49f1-b48a-74995e8cccc9@suse.com>
Date: Mon, 25 Mar 2024 10:19:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 01/11] xen/list: address violations of MISRA C Rule
 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1711118582.git.nicola.vetrini@bugseng.com>
 <dda7d01c3a597a2f0dcd9338d1a395fa4083da1b.1711118582.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <dda7d01c3a597a2f0dcd9338d1a395fa4083da1b.1711118582.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.03.2024 17:01, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



