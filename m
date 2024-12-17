Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DB39F4F9F
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 16:37:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859347.1271470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNZcl-00040m-CX; Tue, 17 Dec 2024 15:36:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859347.1271470; Tue, 17 Dec 2024 15:36:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNZcl-0003yg-9s; Tue, 17 Dec 2024 15:36:39 +0000
Received: by outflank-mailman (input) for mailman id 859347;
 Tue, 17 Dec 2024 15:36:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=92kI=TK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tNZck-0003ya-Li
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 15:36:38 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3819766-bc8c-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 16:36:36 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4361a50e337so38439965e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 07:36:36 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4363602c92csm121305575e9.15.2024.12.17.07.36.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 07:36:35 -0800 (PST)
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
X-Inumbo-ID: b3819766-bc8c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734449796; x=1735054596; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=exsTwQflvieAUJwBUb+Cdk9u3jQBtU89XVwxx37fr9k=;
        b=TLJSNbUB5MlljHW/YBGJYStFX8TGcpL0A41zB1t0xbwkMYM4JZRMGC/kdg3aUGJsUI
         UYjt98lUYyItnc9zmnUXZ41N/9VeN6hSf6B7HCR8XDRzhge7sDqgbBXt1ALnlafX6lbr
         JDuezOqWh+V+kZFAYePJ1DJ2UAcpc1t4FussA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734449796; x=1735054596;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exsTwQflvieAUJwBUb+Cdk9u3jQBtU89XVwxx37fr9k=;
        b=tBXw9gIaF8vQSSLf+WyVi9gzyCyWmps5/f3v34G1y9QSxpVOo6pw7UD7Eh10AhDhTQ
         GKFSJpFEH6vNX19w+ZhviKW0ybGdOvsXcfjmYaIZseEMkq3H4kNSIMhgKv9T0t9B8Tyh
         ruTrMpUoOWZJGftkYTrD/XvHpfSDOxuP4PUEflHcYNLZQBhv11LdMGyBItdxuL5iQgwH
         i5wT90MgyLNTmXxb5LMqmQKw6SJgJY6IXJJJrNR2VAq0R+FuCR2QOH32MAcLhE89Sgdl
         ikwgO+T8u3e7G0ZUXysSYG6B1/4EggLrp9scbTp1/hTg9erMMrh7A9j1WOp6YKKJGadP
         PNZA==
X-Forwarded-Encrypted: i=1; AJvYcCXW4m943EVp6H5wLAh2Ad+g7AApLXCe9dEUUtrZ4Cvw1QVJiHSIKqBCUUplcii3IvwWC8+9+5pRjw0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxfFXeAaARrt451RZRQXQVq1sbtsA4NbrGIs7Z97Ve/RpK4kFVy
	ZpnsfPBmOK8utehHvTLvfwC4j+yVTCNUXolnClnYFzqd+sy3/DiSDYBJ95lggX8=
X-Gm-Gg: ASbGnctbN6WPahvj4L9tnDg/uxDZVSF5KWmrS/k9MFZw1NhaSycC9Hc+9noCe+PH2cm
	7A2S4QBBila73ZJqXP5PnovPoadaSHQST3NfxPfjkTB8HEkmG/xm5j1XMF7Bg/6HeBI88DLjLHO
	KQvtK2mnktUKpC3BosHDtBy4sMg0lMqKC1Ni9l/DykNPNfnWsWRKxmUZqZxUk66eqdt4sWC73Az
	y9pNxW5HwbMfmxXe35QDXu8ERY7DbCJuPYmIoBPy8hfShFHpXPy1eiVSgUf/R8tBVz+nEH9ekgI
	Y/d+V9lOvnc8/T4PUUOr
X-Google-Smtp-Source: AGHT+IEg8qT7hS/mqmJF8icXteQl+7SMo3obWwMr/1D9VGGJKvqVQbT0U4eSZKHDUpqy5ecgEOUJyw==
X-Received: by 2002:a05:600c:b95:b0:434:f925:f5c9 with SMTP id 5b1f17b1804b1-4362aa28ddemr151275305e9.6.1734449796007;
        Tue, 17 Dec 2024 07:36:36 -0800 (PST)
Message-ID: <6052d06d-ba8f-4cb1-8fae-e79236abcf19@citrix.com>
Date: Tue, 17 Dec 2024 15:36:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: add deviation for MISRA C Rule R11.8.
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <202c8efa4f846018e463f6242d25eb10c015d835.1734367711.git.alessandro.zucchelli@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <202c8efa4f846018e463f6242d25eb10c015d835.1734367711.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/12/2024 4:57 pm, Alessandro Zucchelli wrote:
> Rule 11.8 states as following: "A cast shall not remove any `const' or
> `volatile' qualification from the type pointed to by a pointer".
>
> Function `__hvm_copy' in `xen/arch/x86/hvm/hvm.c' is a double-use
> function, where the parameter needs to not be const because it can be
> set for write or not. As it was decided a new const-only function will
> lead to more developer confusion than it is worth, this violation is
> addressed by deviating the function.

__hvm_copy() is a static function, and the public wrappers are const
where they ought to be.

No-one is expected to use __hvm_copy() directly.

All cases of casting away const-ness are accompanied with a comment
explaining why it's safe given the other flags passed in.

> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 2f58f29203..5056669f16 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -393,6 +393,12 @@ Fixing this violation would require to increase code complexity and lower readab
>  -config=MC3R1.R11.8,reports+={safe,"any_area(any_loc(any_exp(macro(^container_of$))))"}
>  -doc_end
>  
> +-doc_begin="Function __hvm_copy in xen/arch/x86/hvm/hvm.c is a double-use
> +function, where the parameter needs to not be const because it can be set for
> +writeor not"

"write or".

~Andrew

