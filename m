Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6540904EDC
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 11:13:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739024.1145926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHK27-00029m-EB; Wed, 12 Jun 2024 09:12:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739024.1145926; Wed, 12 Jun 2024 09:12:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHK27-00026e-AW; Wed, 12 Jun 2024 09:12:43 +0000
Received: by outflank-mailman (input) for mailman id 739024;
 Wed, 12 Jun 2024 09:12:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h1N0=NO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHK25-000250-Ph
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 09:12:41 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb4d41c1-289b-11ef-90a3-e314d9c70b13;
 Wed, 12 Jun 2024 11:12:40 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-57ca8e45a1bso631420a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 02:12:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57c7681d659sm6172799a12.54.2024.06.12.02.12.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 02:12:39 -0700 (PDT)
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
X-Inumbo-ID: eb4d41c1-289b-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718183560; x=1718788360; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=McyaLi/nhCcZg+uIMfat7vuPezhIz2XY+n1hh1uQxKc=;
        b=bkclvpCfnCKKHcU+PPBizLB3H+HcJHCv8JNxCQeZ7q8o6aCI4IfeE4BUdBOuZiozAJ
         NuoKMS8aA2Ed6WGadhKJoa4Qt+bvdZetG41J8cidVREByJTrUOgyCAmCoA1WSXcI0pzx
         mDaf7MmakodsNs3x55SqKjnFQWzK++WeYHAaRJnYaTNLhuZu4IIOnVTjgnxtKu4feiAb
         gj4Fi/7bS9Y2CWU1EFJ9hDPGNIycjJ+IB9tYOu2LE9CBpKUgt/VWqCh4AMujX6z3FXpM
         hygjSAEKYt/JZaPXcRr0Jx/TkmbhXs5YXeATUs+Nej1lzlbBFtJwrS28WrV/ESURR99R
         Ks4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718183560; x=1718788360;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McyaLi/nhCcZg+uIMfat7vuPezhIz2XY+n1hh1uQxKc=;
        b=asfFDvv5q2U8PF+OpFG0AGtctlXzNSPfza+Rr7WKB80sSULfwyrU3KWlH0aIvSAVsw
         a2hCC5UaL221sgfr3+k5FZPJSIGty97Ay89zk8xeiu8Rxy3/vA0rNtQq6nHdbjdLnTpC
         WILv9inx/XOxs3xcXKbBeTguNbvQPCRwkkmDhDZs4ANZU8JNyVw2Vj67gB0IeMIdTPP+
         xyddS7OO/aEF4pMybg6lFeHNmfZgkqilAsE2S/qbm4MMRgA7hc3a/CTBZHoEmVGD1V7t
         Q7+mnsPX1zPiTrLpI6iPkYG5h7WTyCOJt9t5GSZG6HvsXNiBkk7eDFctYkQhdlNbI4b1
         EdsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWxeDJlYa5yoNB18ZlBA9nuZrQFMrd6IkJQVuS/CxJ+JU2mEeyCjAwHDGYJzh0Qg3vfeiUVVewUbhX8T6Irc4smjbU+vgw8thPCejSHB0=
X-Gm-Message-State: AOJu0YwvkoLEtWY/kvKalkOvsH08G+W3hUwo6FAUqQwNW7yJ/oRMY2eU
	1hbzc0BNsefTf8zuEp+jJt1w51/DLX93GDSC14CFTOKtn5Qf+bKgRI06u0tmgQ==
X-Google-Smtp-Source: AGHT+IEgyiZ1YesR+iwI3YyovAuT9BE7VBa7/3WPB4NYTmvUgQJYxNBAOnodfybizoXWc8fw7044+w==
X-Received: by 2002:a50:8d52:0:b0:57c:55f6:b068 with SMTP id 4fb4d7f45d1cf-57caa9bee1cmr1167549a12.32.1718183559961;
        Wed, 12 Jun 2024 02:12:39 -0700 (PDT)
Message-ID: <ca29b910-332d-420a-89d0-60f3c15a750d@suse.com>
Date: Wed, 12 Jun 2024 11:12:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/6] xen/self-tests: address violations of MISRA rule
 20.7
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1718117557.git.nicola.vetrini@bugseng.com>
 <38d6b849e0ed868f1025d4af548dcebe89bda42d.1718117557.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <38d6b849e0ed868f1025d4af548dcebe89bda42d.1718117557.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.06.2024 17:53, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> In this case the use of parentheses can detect misuses of the COMPILE_CHECK
> macro for the fn argument that happen to pass the compile-time check
> (see e.g. https://godbolt.org/z/n4zTdz595).

While readability suffers a little, I'm okay with the approach taken:
Reviewed-by: Jan Beulich <jbeulich@suse.com>
I'd like to give in particular Andrew some time to possibly object, though.
And anyway I don't think we want to rush any more Misra changes into 4.19.

Jan

