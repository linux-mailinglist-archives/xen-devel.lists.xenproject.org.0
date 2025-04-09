Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1FFA81CF6
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 08:20:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943325.1342103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2Omh-0003dc-J9; Wed, 09 Apr 2025 06:19:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943325.1342103; Wed, 09 Apr 2025 06:19:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2Omh-0003aZ-Fv; Wed, 09 Apr 2025 06:19:39 +0000
Received: by outflank-mailman (input) for mailman id 943325;
 Wed, 09 Apr 2025 06:19:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5vFf=W3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2Omg-0003aT-1t
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 06:19:38 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c076fb6-150a-11f0-9eaa-5ba50f476ded;
 Wed, 09 Apr 2025 08:19:36 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-39149bccb69so5944364f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 23:19:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d89378d9fsm654806f8f.37.2025.04.08.23.19.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 23:19:35 -0700 (PDT)
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
X-Inumbo-ID: 9c076fb6-150a-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744179575; x=1744784375; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kvChhXFFObwaDqJNpHyassdUQ17IcemJDie/kT2nJro=;
        b=A58/cYjJh5OHtsLboSEzx31tJHMTBYMDAQJyA99WKHcZ4iYh/FpGOGvtLuUqR8XGLV
         USjkN7YBdJMxyK0ZW7DY/JVtbZmWI/K+AXd/EGmUVX9Tx7iXH8tw2lThyO3CXxB+WqQT
         mQNk0wgYs76l9DrpGqr8f7gjGKyRzFXhBK1fPTJFOQpTvlSPDvW3tLHgARMH40gXkDWF
         fMw7565XlWeL4ZTDUJM48Cx+yuaXC6zZQdjXKfI9NaqdwAqXdpICl4bITXWU14OBOCRE
         fj2Jzvc+CL935+1j8UFIwXVFa4AjQjK4o7R6pB4Gp2T8pZeAz/V+V0tKJQSwAadCXJEm
         q2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744179575; x=1744784375;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kvChhXFFObwaDqJNpHyassdUQ17IcemJDie/kT2nJro=;
        b=v0MacEVovtwrj3YltuXc4k8j43UYza9bS1W0rid/wnsX9pwjuvw1OcZysTjTYsduJd
         vLoxax16i8pv/uhJO4Ma0FAWCk6UGhw30rtHPkA519l3gh8KUCu2yWJHQW6vG9BRJu3S
         OirTkaWkODW7DRGJNxCcXBPocBI4GeO5RW+IFxy/YmcPCNDT5PkX+OJmEMrUa+mTBCn7
         1nFzDmYCFKYTHykrxrOEAzI0a0qKnZcWkBIfR8TXE12ubi0PHOviAfHVeMKX7edbUGIL
         b0L2l8FbIbb/lAg0hCdlfZX40OE47InKz2u4Wlo8rrdb2ksZLAgRd4WGK617VpVcCRfA
         svMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWw8mnHdilRsnoto2+zgWlSWDo78MvvaTrXW6peRmkD8WFUhfUxIYav+nIOnzjTkYulmxHVpKYGqoA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzyGeELSt0phNgf+ewwlzxNc2vF75GNCU8Lpdr5kHD9+9VoH9SM
	WFGDC2aeeIGFKq+yp3j08I7Otr+iL+7GgO4miwJhFZIfabyhIVivPUMRAqLWvw==
X-Gm-Gg: ASbGnctEuZN+dqP73S/EjUZWlsOp9+cWzJKxlc4oMWBb9DQEFtytJHW+LxeXFbfehnZ
	akBMJ5Y1R5a6fh8vePNWCE/s9YZZ+ZBu/OzSutgqzmA7n+Saxvz0EYytM+2pnaRSU5NzfZ+ocfP
	+b4PP6wy85OTR3ALK7GV5GyBwIeVTyfuljw/l08xHQyz89CYsb+FZCmFadXlK205vEBJIY+wjtL
	yqInJV1JLJrA4oO/UwxzWCyHQZjf5g5rxHiCTq/kVtn+eiSLzO9Ylu8A0u82cx4V3CxDUbR9XaA
	sjayTWdILcxlpRIH/NlXQy0Y0FwEwt6uM19ZBcnRAhjl8dd/OwV5YYEt4kT4x0EWzXo8JseaZn5
	MrprVpdxivv2w1OL2C8jF403JZg==
X-Google-Smtp-Source: AGHT+IFd/vxazouITRzIMMpg3MsMXFLVOjB++pcHb9gK6u5arW6th/gqDGrdkBJrSihVfYwJnfmpFA==
X-Received: by 2002:a05:6000:220b:b0:39d:724f:a8f0 with SMTP id ffacd0b85a97d-39d87cd3528mr1219697f8f.42.1744179575641;
        Tue, 08 Apr 2025 23:19:35 -0700 (PDT)
Message-ID: <e79b74cf-af59-4db4-b8c6-ecad289d5b06@suse.com>
Date: Wed, 9 Apr 2025 08:19:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] x86/domain: revisit logging in arch_domain_create()
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, dmukhin@ford.com,
 xen-devel@lists.xenproject.org
References: <20250408224021.1579818-1-dmukhin@ford.com>
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
In-Reply-To: <20250408224021.1579818-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.04.2025 00:40, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Use %pd in all logs issued from arch_domain_create() and reword some of the
> messages.
> 
> Also, expand error message in arch_domain_create() under !emulation_flags_ok()
> case to help debugging.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Somewhat reluctantly:
Acked-by: Jan Beulich <jbeulich@suse.com>

It still remains unclear to me why you think you need to change aspects of
prior wording for no apparent reason. For example, ...

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -791,13 +791,14 @@ int arch_domain_create(struct domain *d,
>      {
>          if ( !opt_allow_unsafe )
>          {
> -            printk(XENLOG_G_ERR "Xen does not allow DomU creation on this CPU"
> -                   " for security reasons.\n");
> +            printk(XENLOG_G_ERR
> +                   "%pd: will not create domU on this CPU for security reasons\n",
> +                   d);

... why would "DomU" need to change to "domU"? Yes, we're inconsistent about
the case of the first letter. Yet the change here doesn't help the
inconsistency in any way. My more general request remains, going forward:
Please no changes, big or small, that don't have at least a tiny bit of a
reason.

Jan

