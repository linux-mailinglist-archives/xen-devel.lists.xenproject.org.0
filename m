Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9686A12399
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 13:13:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872419.1283383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY2GG-0003pK-9a; Wed, 15 Jan 2025 12:12:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872419.1283383; Wed, 15 Jan 2025 12:12:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY2GG-0003mK-6t; Wed, 15 Jan 2025 12:12:40 +0000
Received: by outflank-mailman (input) for mailman id 872419;
 Wed, 15 Jan 2025 12:12:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hmQ5=UH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tY2GE-0003mE-6X
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 12:12:38 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01c17541-d33a-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 13:12:36 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5d4e2aa7ea9so13189606a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 04:12:36 -0800 (PST)
Received: from [10.81.35.177] ([46.149.103.15])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d990469e5asm7387896a12.55.2025.01.15.04.12.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2025 04:12:35 -0800 (PST)
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
X-Inumbo-ID: 01c17541-d33a-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736943156; x=1737547956; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3vkw3KoLLYwhNznF2w6gk+7TEpb52hT3vRDnAAAOlaI=;
        b=S3HmaVfbTS+ptbvF/E0jz+NQlecNmu0CQ75J1IJ1eZqIS+ju5Gj5LtV5l3Zh18dYJJ
         kaWW/Wt/zIpwa018eYwEDkbfzxWmlCgFK4E+zf009IPekD2PbpCnHcL8CuVmlYNe98YM
         c7MZKadTmmjg+rSL7raKSSV6fJ9ITabm/0V+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736943156; x=1737547956;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vkw3KoLLYwhNznF2w6gk+7TEpb52hT3vRDnAAAOlaI=;
        b=AaGfDvFMNR2XDVo1yb8L1w/W3cRuWJ8aGmygV0dpVORvIzYWfSQLKf5Kgp9OM9rKPT
         pMyDnsQx3Sju15S1+NGGU+7B6S7GIWEoIyEeaJpw/Y+7XduqC0IjpJAxuOJPXWKfMQRw
         q5Z5PU2ur5Bhv/XCugAKc5NgoNK9zpg8cRRWkOzX8aeejAl5cc7dxl1Pvoo8CZPINsWH
         S/nGbQp7wJC25EfZk13zI+rScXxC46S0HwGTqb7/vUyOvnuxhIhdD1Pap4lsVlPaASyA
         oarzA3Vc96pLHsrHEJuj6gK3lEtjlgOs9BKXbkwpmr7ZIebijzyBOdxBNfSeQrWBwe35
         jJ+g==
X-Forwarded-Encrypted: i=1; AJvYcCUiDuEyKe8sWYW9fPlm8q9JFoq8zU8gp3XXie9QXw69K53TKlX4QrssfLbdRtFgebIL8WGkY7H/Tu8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqCBoPSX59BHmv/19aCobTtfqC978iC0mG28n2AW2Vf0Ny0T49
	nVAoJ/npnCPTdPv+4v2sIaJjEdlL0qk2t/Osr/PaBazqjnNY4cd695W0BB0MVdk=
X-Gm-Gg: ASbGnct6K90XljKgH6D6OCh7+/aiE1uJZA4bjLt7ksImjRXiV787eNjXe6sWv8DeXRu
	Lql0pDaMe1ag0NauS8M3ywZ/GbOOWbQRi9jN9RV7HEOlKRAWvddqQIFwj6K712peKnS+OGCEgRV
	1I3wZiiYJ1ElQWZiunyi3suFT5204tAxtStOAg+pUOvoHoIHPmWil8METS0tSNt4+JBPc8jxH+c
	zvJboJJ6YZg29ih7/lfKWQ+PrydYwKO/EIGhEb1UOzjaVFNB3FJPbQVy8lzyBr1QNs=
X-Google-Smtp-Source: AGHT+IEl0RdV8CHNPhnWQ3AQHNm5IHq1fcGxKoV4ARJvLcZgbWpj4PmyoufeKysPmv2kgj4YiVcYLw==
X-Received: by 2002:a05:6402:268c:b0:5d2:d72a:77e4 with SMTP id 4fb4d7f45d1cf-5d972e6c9b0mr29734636a12.28.1736943155859;
        Wed, 15 Jan 2025 04:12:35 -0800 (PST)
Message-ID: <391f5a96-769d-4dfb-8966-b3d6c255422b@citrix.com>
Date: Wed, 15 Jan 2025 12:12:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/2] docs/sphinx: gitignore generated files
To: Yann Dirson <yann.dirson@vates.tech>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1736941628.git.yann.dirson@vates.tech>
 <cc6e4e8e5fe08c7b4bb183535b7e302bfba41058.1736941628.git.yann.dirson@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <cc6e4e8e5fe08c7b4bb183535b7e302bfba41058.1736941628.git.yann.dirson@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/01/2025 12:01 pm, Yann Dirson wrote:
> Signed-off-by: Yann Dirson <yann.dirson@vates.tech>
> ---
>  .gitignore | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/.gitignore b/.gitignore
> index 25484a8fd8..404590c36a 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -62,6 +62,7 @@ docs/man5/
>  docs/man7/
>  docs/man8/
>  docs/pdf/
> +docs/sphinx/
>  docs/txt/
>  extras/
>  install/*

Thanks, although we're transitioning to per-dir .gitignore files.

Can this move into docs/.gitignore and become sphinx/ as the pattern?

If you fancy fixing all of them, that would be excellent too.  See c/s
0a15b7695bd983f "tools/ocaml: Rationalise .gitignore" as an example.

~Andrew

