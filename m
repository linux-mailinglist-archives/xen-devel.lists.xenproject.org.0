Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2208B0305
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 09:20:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711165.1110918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzWv1-0007r9-UB; Wed, 24 Apr 2024 07:19:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711165.1110918; Wed, 24 Apr 2024 07:19:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzWv1-0007os-Qd; Wed, 24 Apr 2024 07:19:51 +0000
Received: by outflank-mailman (input) for mailman id 711165;
 Wed, 24 Apr 2024 07:19:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzWv0-0007om-5m
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 07:19:50 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 076d687e-020b-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 09:19:46 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4187c47405aso45239135e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 00:19:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fc9-20020a05600c524900b0041ac5f19213sm4289749wmb.8.2024.04.24.00.19.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 00:19:45 -0700 (PDT)
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
X-Inumbo-ID: 076d687e-020b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713943186; x=1714547986; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M5X0Zdmp/5vAXHNnlark0kMUOgAR7ijjsaVoa8nppOY=;
        b=DAkLJgBRJtYa2wlWn5PDq7T5VZPOXEHddjIuLZSxHqbSmTrwS99UxsoH40GE/nTlWI
         VUNwCdd4f0Tz+zBU8HKe1Pv0A5N58cmYAh0a7DM8swcvT27akSSMymJExhn+lf8GyCX0
         /r0LtNGG08P60TxI3VamOVNTpl3ndzNX9p19Fr+gK+y3DU+sZHdCrXTKPDJH+I9sAYBz
         9hmAx7GxZTbyzj0oxJU+itD3oXiKNK0vC5DXOXDt3VDuAggSU7lZCpwVw6FLWaq3c+QP
         dkLWpiqCpd+n8igZ6hgsI3eMhLIh7TtRKW9isuROMkjE1epwSlMF/JJlZKqnAbGgBRt8
         icUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713943186; x=1714547986;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M5X0Zdmp/5vAXHNnlark0kMUOgAR7ijjsaVoa8nppOY=;
        b=kL/rQLliRK1Kzr5vPJal89akTb4VynTbLIauZc2m59aML8vI6TuJXZZvgIxPjl4zsU
         IEuV6lQjPZvnBPehzZvxQNPxGg1ppwClZX44viuqlTNGT7o5lppSEPJmFvHBwFk7+eWV
         kR6Ytv5qynAYuq1vp4EPpch+ijwpHY4z/j/jBxHam/7DiX61/xWKxDEVnehTVlhGUT+U
         QuU04ur4x4G7PjFCuMneznPfRs3YIkz3tct+/Dqz/ZZd13F5GVUqZa48tKHOdv2/XDUM
         x6jkew5hCLlidolkDpbwHLwJTyjBUTvUgueov7y1xlPXBBeaKC+T7UQL3CPRpZ4s4Au7
         /gEQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6YvOUC/+ZqQX5MsZLQk/RP+Y0GpBV6xWjH9cKqEVNLjdSV8xgHzdshDAfGpm5E2akBtO6BvwvApzVgQbrYecPXJMyj+ZEM43C98KEank=
X-Gm-Message-State: AOJu0Yx/06wS80+MB+SAhf2PhAcSwxP0Ws9Nuj4ryIDITos8fEIn30fU
	DX5yTw5Lt2u9YHt0rG3cnsL/JYXzHgFXJrOCotuTKZ3iME5bN0W+D1nXH06v4w==
X-Google-Smtp-Source: AGHT+IEvRH8K8WlTjWXEapbV7+x+ZZne4ZHok2FLSqPxdbjPK1ysp0o1AY0ZkzSpmsEaoxCKLBEorw==
X-Received: by 2002:a05:600c:354d:b0:419:f088:249c with SMTP id i13-20020a05600c354d00b00419f088249cmr1094848wmq.12.1713943186072;
        Wed, 24 Apr 2024 00:19:46 -0700 (PDT)
Message-ID: <6608efe2-d968-47be-900d-d94f8e94f926@suse.com>
Date: Wed, 24 Apr 2024 09:19:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 01/10] libelf: address violations of MISRA C Rule 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1713885065.git.nicola.vetrini@bugseng.com>
 <250b556fc0516e4a20b24161dad3032e2ac3db80.1713885065.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <250b556fc0516e4a20b24161dad3032e2ac3db80.1713885065.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.04.2024 17:12, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



