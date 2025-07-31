Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40295B17408
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 17:38:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065809.1431125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVM2-0003fw-Mf; Thu, 31 Jul 2025 15:38:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065809.1431125; Thu, 31 Jul 2025 15:38:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVM2-0003eQ-Ja; Thu, 31 Jul 2025 15:38:02 +0000
Received: by outflank-mailman (input) for mailman id 1065809;
 Thu, 31 Jul 2025 15:38:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8WGx=2M=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uhVM1-0003do-5r
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 15:38:01 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 546438a9-6e24-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 17:37:56 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4555f89b236so4938095e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 08:37:56 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3b928asm2796326f8f.19.2025.07.31.08.37.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 08:37:55 -0700 (PDT)
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
X-Inumbo-ID: 546438a9-6e24-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753976276; x=1754581076; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RE3Re0zyfg6MLfG0/cCQsj5ib9xkDOcOAsRliUrKt54=;
        b=F/Rifvw/9iHlGKVtEfmpa05OdzIUYFcjDjEr6c0FMW5VnrdTqEm+oeOwjO66lXqeET
         NzxxiouGiNrNUHjXj2ANcDg9+LlhV+fhlcGmO3VFXMQkWMeY07ZESc1z2rh6RVcp497u
         fYr4a/J0peTf1cFXNGPvqu6pLyHIFBuGQuBFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753976276; x=1754581076;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RE3Re0zyfg6MLfG0/cCQsj5ib9xkDOcOAsRliUrKt54=;
        b=Eoixm6ZYUVBkaH/rVuHMBk9vRH9xKjD8xXSNvXwL5u4wm9M910AjI+xGD4ia4EOs7x
         kSSZvtd4IjYxVYKgQfuLPI3yrl9WfA0K1sxMIleNNxapGs5TrUFmGOQJIxXS+kVHU5Kn
         zeYIYGcdXVN+mQENeAIOC8d7I/IUpGgus4RdmdiokXtSkit+iac08rHuzGItpNpujWZI
         JsLHq+4uyKorVdY+7iIKJMyGwCJyEaJiD5ZHOWrV3Pgx6uXQOBCILrI6AqH8TVYvulJb
         oIEQmSlc4UFKmXv5WK1MivOSfdazC/+16+ChmTBoif6NHDv5xDLv14j6P+BtMeasXIni
         FnSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMbI/zscVYE/4lg9bVSkVZBcK1ryq/f0TtsO1mgU6X3n1bvIro50DcezisWxzVzVGIdE0By/B9zow=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwMrO5qCk28ZH1TqeX8jN0qo82tOsC+wzvYO6PGlnqCmI8bV60n
	S/oPAMR8HGJ2oobkS7gd8lG7Irs3nk4Px8GqNGazM/L2hqogz+VrDBGmTj6YujJJUbo=
X-Gm-Gg: ASbGnct0QcIclCiljqMLjjyLmsPMXbKbLW+hOHU3ddsuvzToyViLGDrFJtLgvpwHMqK
	SGpsJHy/SPz19m4Zj33oWRkEAMiHE8vzvUfJAiSAStRH7jIys3J9mi2Hyb4vfsorXiyP6P+oEQS
	tWUluy6ZBfPUSyKb2tzfP4VMZpJyMy/56m733IA960Zpfy91Ir4rqr0BvXxHr9aqMauYTGp30fz
	oRKhlHRL+dn2PdFjGWQmvs8XzJp9zSP70xeVgHEjTyr3STRn2OEAvmNtZpNw0Fl0ov2HxydPn4Q
	TVEFC5V2Yi86jw1VZmIUS81rm7kryWEh/b6LDcmr62+RSUQ6A5oHMKK+2NzTjOBEqbmjbS7ZbIl
	CT4ZdhITpsnW6JPIGLRtuoIwAoYjCZw1fv22i8AmO85+FEoKaiL2H3mnYwkp/Qgcqmno/HTNnTM
	DDIcM=
X-Google-Smtp-Source: AGHT+IEFhWa9Yy3QgIDzgd0BVRSKS6Jr2dMwJmkIYsybn6s3fJEqT9EiMCYxWQ0+sCDz15G3OlHmlg==
X-Received: by 2002:a05:6000:2484:b0:3b7:89c2:464b with SMTP id ffacd0b85a97d-3b794fe5061mr6979544f8f.5.1753976275717;
        Thu, 31 Jul 2025 08:37:55 -0700 (PDT)
Message-ID: <470a04e6-f8c1-4937-8478-0f80107d562d@citrix.com>
Date: Thu, 31 Jul 2025 16:37:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: fix violations in macros GVA_INFO, TRACE_TIME
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>
References: <73cfc8a2d4d66042b49f44c69e672ce8ad0556ce.1753971749.git.dmytro_prokopchuk1@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <73cfc8a2d4d66042b49f44c69e672ce8ad0556ce.1753971749.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/07/2025 4:16 pm, Dmytro Prokopchuk1 wrote:
> MISRA Rule 13.1: Initializer lists shall not contain persistent side
> effects.
>
> The violations occur because both the `GVA_INFO` and `TRACE_TIME` macro
> expansions include expressions with persistent side effects introduced
> via inline assembly.
>
> In the case of `GVA_INFO`, the issue stems from the initializer list
> containing a direct call to `current`, which evaluates to
> `this_cpu(curr_vcpu)` and involves persistent side effects via the
> `asm` statement. To resolve this, the side-effect-producing expression
> is computed in a separate statement prior to the macro initialization:
>
>     struct vcpu *current_vcpu = current;
>
> The computed value is passed into the `GVA_INFO(current_vcpu)` macro,
> ensuring that the initializer is clean and free of such side effects.
>
> Similarly, the `TRACE_TIME` macro violates this rule when accessing
> expressions like `current->vcpu_id` and `current->domain->domain_id`,
> which also depend on `current` and inline assembly. To fix this, the
> value of `current` is assigned to a temporary variable:
>
>     struct vcpu *v = current;
>
> This temporary variable is then used to access `domain_id` and `vcpu_id`.
> This ensures that the arguments passed to the `TRACE_TIME` macro are
> simple expressions free of persistent side effects.
>
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

The macro `current` specifically does not (and must not) have side
effects.  It is expected to behave like a plain `struct vcpu *current;`
variable, and what Eclair is noticing is the thread-local machinery
under this_cpu() (or in x86's case, get_current()).

In ARM's case, it's literally reading the hardware thread pointer
register.  Can anything be done to tell Eclair that `this_cpu()`
specifically does not have side effects?

The only reason that GVA_INFO() and TRACE_TIME() are picked out is
because they both contain embedded structure initialisation, and this is
is actually an example where trying to comply with MISRA interferes with
what is otherwise a standard pattern in Xen.

~Andrew

