Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B948CAD57
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 13:27:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726861.1131253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9Nei-0005je-ES; Tue, 21 May 2024 11:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726861.1131253; Tue, 21 May 2024 11:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9Nei-0005ge-Bn; Tue, 21 May 2024 11:27:44 +0000
Received: by outflank-mailman (input) for mailman id 726861;
 Tue, 21 May 2024 11:27:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLq1=MY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9Neg-0005gY-Np
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 11:27:42 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 224b9586-1765-11ef-b4bb-af5377834399;
 Tue, 21 May 2024 13:27:40 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5206a5854adso4306954e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 May 2024 04:27:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1787c6b1sm1600780466b.57.2024.05.21.04.27.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 May 2024 04:27:40 -0700 (PDT)
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
X-Inumbo-ID: 224b9586-1765-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716290860; x=1716895660; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xmc5d0J0AlvJbOD8urO/lbTRDEzhDbKc0+/1IT9h7NQ=;
        b=LZU88CQNsJApMR5u/99eS6UVoA33xq/I2Hde6sCUX8g7Taum0qGNkP/hgdZqAgO/GU
         Qg5llaOeR6mK8l0NwWpjY72OLzBFM7n64xDbaoPDCNSwwlRXEzu9B/rBot3sTH89hZ9u
         E7RExxDI3YPBgA6aqgcUXum2rFf4lwq7TOgxc+oLD0uB70nnpENb0SXzdaQhNyOl8lOo
         6tBw5m4Q0Gbud7E1cONhIkV7F0jqVPnyqVM+GVqeCKBxkRIBgDzxlyyshgLbS/7kZ/C+
         LMuRDn5iw7KDKC4vYdNOQNqNftbZBDjKamz3H5s4MSgZhkM/BUi6Oe9RB2X3XsIUwxgr
         2HNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716290860; x=1716895660;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xmc5d0J0AlvJbOD8urO/lbTRDEzhDbKc0+/1IT9h7NQ=;
        b=fB28383EXjy7sbTePRZX8GwMC8UAMH1NZCHCO9I+BZofl8trKnThFyp6YNRBjpPFKR
         5bGnkhI5AMHETi180Kl9i+LHYIkY2SCv+KFgebUVR1Gt+npYaiFxgoL5xCXQEPKMnQHb
         Cg+0BZ9Rk+ybA+V407DPTJaFFbaJB/s1eedLgc2Drm5cjiCV/TnhjeHiATxRRq1xBBj4
         zYQM18k0xPkJYsyA6tnbnnr+Pm74kkBCOkyVNNjARkhVMIlAHRIwksvjLv80H2ykAtpR
         AJP05/JkW0Ze8dK3SdRE5oG3ZcR62kSwGoux7Dv93P1tBiTPR0P4Z/FvIAFP0F6L2QNE
         VNFw==
X-Gm-Message-State: AOJu0Yw+gp31nVq4FJfI3qID93aU07jkekD5vp9P1VVe8eGot8FUyQmS
	2QwJQ7GWxykiVowgqxl50yTO8lWJJ3bMX7il35hYtNWDZFhCZnFso3f9TwvAdw==
X-Google-Smtp-Source: AGHT+IHfw9s0/d7+7zoLR1V4OxsIDjUKhEA1cYJ7LcK3DhbKmQFwf2kObKKIz3BSwWGxY63LY/B+oQ==
X-Received: by 2002:a05:6512:280c:b0:523:ef21:8e2c with SMTP id 2adb3069b0e04-523ef218e56mr8786116e87.51.1716290860276;
        Tue, 21 May 2024 04:27:40 -0700 (PDT)
Message-ID: <8f5a4a61-b985-4381-a53d-bea5b8429d75@suse.com>
Date: Tue, 21 May 2024 13:27:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/4] x86_64/uaccess: address violations of MISRA C
 Rule 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1715757982.git.nicola.vetrini@bugseng.com>
 <b131427dc03c4b89141bab7648523b81bf5186a6.1715757982.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2405151619200.2544314@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2405151619200.2544314@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2024 01:19, Stefano Stabellini wrote:
> On Wed, 15 May 2024, Nicola Vetrini wrote:
>> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
>> of macro parameters shall be enclosed in parentheses". Therefore, some
>> macro definitions should gain additional parentheses to ensure that all
>> current and future users will be safe with respect to expansions that
>> can possibly alter the semantics of the passed-in macro parameter.
>>
>> xlat_malloc_init is touched for consistency, despite the construct
>> being already deviated.
>>
>> No functional change.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>


