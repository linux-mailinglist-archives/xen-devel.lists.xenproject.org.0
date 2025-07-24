Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FA3B104AF
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 10:51:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055494.1423875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uerf6-00017L-91; Thu, 24 Jul 2025 08:50:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055494.1423875; Thu, 24 Jul 2025 08:50:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uerf6-00014g-61; Thu, 24 Jul 2025 08:50:48 +0000
Received: by outflank-mailman (input) for mailman id 1055494;
 Thu, 24 Jul 2025 08:50:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uSid=2F=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uerf5-00014a-18
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 08:50:47 +0000
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [2a00:1450:4864:20::344])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49cf7240-686b-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 10:50:46 +0200 (CEST)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-45629702e52so3360305e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 01:50:46 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458705377e5sm11931035e9.7.2025.07.24.01.50.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 01:50:44 -0700 (PDT)
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
X-Inumbo-ID: 49cf7240-686b-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753347045; x=1753951845; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pfV7Q1zkrzxpKpq4d1U2nj5Tb99BKJIVTIYz9rwcK4A=;
        b=ES0THA3Pv00gyggF5tzURS+RH8jHBQZT8Px3zcHQruyNi17k5Kb7xwCDC+dQw1h8vL
         rlkNPcuMbHT72x+QbJpj9swR3p25QlniHoFIjXxFUQp1PZfLn7a6rVKdrLOCoARYDen2
         8fTPw3whW/CZ3gpXTtjDVTs6WvjKKKnlUyZCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753347045; x=1753951845;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pfV7Q1zkrzxpKpq4d1U2nj5Tb99BKJIVTIYz9rwcK4A=;
        b=q0qupgRBMKXpIFLptz0fR3PhsjOpkSaOUTHa1TyEuT3T2/kAtLydjW4TLnZs/JN0uX
         f2RvzOor4n8B6dzod2ZXFT9Fl+LVfoXE3cHNNiyoHkVaq/usF8rbmLalY0RqxRaYONJ/
         zRpPEswiM4eKaowQltwSrdph4/bYa060Yoc+4UuaV/j9darR8Fd1ixf/eIjtesC9unvL
         M51MLEhb04wjzorVgjBZDdn/hghEEyLMNp5z9ezK5Cm+pFYf/FAhyyiE9E4lZWf4Mur9
         pDuxDII7yxyrZHBp7MsXQFpUVq8oBKTzotU0av3Qm3fJfbOmksmjtEBnF1V4rtIpNIGk
         GXCg==
X-Forwarded-Encrypted: i=1; AJvYcCXUDqrK3cHtAVA0HqIxC0nZUY/QfjczxAn2XITsgi3Z5LyQPH7dVc3gOkR7RmWnozMxbAG9UUAmP0Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyXHUIoGUmwoylVJZy1ILOynxzuQUHOVDA4rDacTRtO94Csv0Dj
	7xiGZH7XMoKYzyeixIyAAYF4VimRdP2CfqBTSrE1RLrtNuoh3r3gg0w3hNvuwfak66w=
X-Gm-Gg: ASbGncslQhk/W+k5vyDsJH90Ur5OgXihEyORMSwL8A7ykCQpZet8ccp5CEgJlpOgzO6
	qx64cKK88uc0LPJCTc0MxYpsavuX827WeYlVfBqa+T2+1ycci9gU6JnvnTYflObFDnFGY3OnjYt
	oi0IA+FCHJvunKlzBi1XMAgoYSMNRxpyBWkk8WwAIH7ePiyDKnMOPIw4kU9/KkSXEMyfMupxeie
	fzv1Wk3aEYIFtlw/vz7D/G42JWyJ297ybwmzjmwsjrXMtlbBZKydq0AAZB/wB9sKeyUjG1dUd87
	0PLRAcYvbCvQR94+RvlPeHseUowJ6B60RYCqtPZiqQkGzhiaphKojaaO1XJ16ZcAcz+NZNgTqkj
	YwUj179wLBqlMTAPhokTcFEbXvPNqhndM01sTob5HOfHF5GLyj8xrLfT+1bWT3CVXMNTW
X-Google-Smtp-Source: AGHT+IHhCaA0PB/t8fepelsuHfJxUp1eANGvGP2DoULXzliF3v7fsA5WCdHBdqiQcZzR9oNPBIHGSA==
X-Received: by 2002:a05:600c:46d2:b0:456:e39:ec1a with SMTP id 5b1f17b1804b1-45868c84329mr62395525e9.14.1753347045367;
        Thu, 24 Jul 2025 01:50:45 -0700 (PDT)
Message-ID: <2d6dc87a-024d-467c-969a-e10459f8b6bf@citrix.com>
Date: Thu, 24 Jul 2025 09:50:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] CI: Add and use ccache in build-each-commit job
To: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250724083720.45229-1-anthony@xenproject.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250724083720.45229-1-anthony@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/07/2025 9:37 am, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
>
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
> ---
>
> Notes:
>     The job build-each-commit is a bit faster, and can do about twice as
>     much builds.
>     
>         https://gitlab.com/xen-project/people/anthonyper/xen/-/jobs/10785719529
>     
>     I haven't updated the container yet.

Very nice.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

That's rather more simple to integrate than I was expecting.

~Andrew

