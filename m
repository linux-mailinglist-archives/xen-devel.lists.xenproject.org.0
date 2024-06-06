Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD368FDE56
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2024 07:49:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735899.1142016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sF60I-0007Tv-GM; Thu, 06 Jun 2024 05:49:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735899.1142016; Thu, 06 Jun 2024 05:49:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sF60I-0007Rd-DH; Thu, 06 Jun 2024 05:49:38 +0000
Received: by outflank-mailman (input) for mailman id 735899;
 Thu, 06 Jun 2024 05:49:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OoW9=NI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sF60H-0007RX-8j
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2024 05:49:37 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e4b8130-23c8-11ef-90a2-e314d9c70b13;
 Thu, 06 Jun 2024 07:49:36 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4213b94b7e7so2689995e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jun 2024 22:49:36 -0700 (PDT)
Received: from [172.31.5.161] ([62.48.185.238])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c2cd2d3sm9224805e9.41.2024.06.05.22.49.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jun 2024 22:49:35 -0700 (PDT)
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
X-Inumbo-ID: 8e4b8130-23c8-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717652975; x=1718257775; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j0ye9TSuckwM/Bjmu9gBLt92YyAeVfRItWoKaOi3lNA=;
        b=H/gMIE6Nd2JELbe1f9rk0vADbmgZap0F7mgDOkIZOp0W3vhYq/zvXVkL+iXef1W8Wh
         zkHRcCWxvzr44P5IDhwHp4Ezb5lHHt5+EB30cwTmyx5geUL19tdkrpF0STtbGv21UdhT
         E/v6b/SMX0LEDylaq80Lt363x7/0LWu7sfCygoJ/nQb5NwiToVmvQXfBaL78LWkPhWVr
         nVeg5jQVj12uG9UQc17aZPJHQDO7PSaEAIV658E4xzTi1CBYp6tWGaYyoNplM1nnoCYo
         JMdwGrbc/NZyNDTEPe/67xmBhZshmww6UbEwk2CkgDFP0y6XqzIOUrWbzJ6lYplTXDLU
         MH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717652975; x=1718257775;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j0ye9TSuckwM/Bjmu9gBLt92YyAeVfRItWoKaOi3lNA=;
        b=OaiOCmDoLcby+w6XvybYbqZu0LKcxzqINBc3EWV4yBEial8Eyds6WpNDad9bIna9JO
         yVjSAGDlzr42yhPQoOsN09p9Pve5mGZhIaUIGVVHue1F+fUHtq49ssc5/xegD+PHKUlX
         wTs5FtRWojlVk4At0OnT/rrYoEU49jT2YNUR7GGvsnIDWXIhUalqyYeyWT+8XiEDgMck
         YWzIQkyElE4rVDmDiNZ2/cngG1D0P8wFOpVIPyp+z25XUg6LOk0ONxjqLjS8sCbgkR7b
         nNYRwHZNyRwpHLa/FnG+CrGpcpomtnHSWjvP7pCMqch7Px2DE+D3NUT0+ojVMqdaTb2q
         Vjmw==
X-Gm-Message-State: AOJu0Yys3tNzeCjqx08MMKmKJFmTYDAPsXWpx0LKqMdaUS0a7ulhtbsS
	P/75k5IPP6TzlLu82bGcQKlDdi4KIp5fl1ufXB4+97BMeeBzI2XR2Q3HSM+JdaTBHI7tTTY/bQh
	e
X-Google-Smtp-Source: AGHT+IFwoqrBssLvw5bS/mpCJLSxJ4haSHtC/eQ5LcSg4PGrltqXP/0AQ/I/46synaOY2Dd8Xzqimw==
X-Received: by 2002:a05:600c:35c2:b0:421:4b0a:5006 with SMTP id 5b1f17b1804b1-4215acd81e0mr13002445e9.7.1717652975404;
        Wed, 05 Jun 2024 22:49:35 -0700 (PDT)
Message-ID: <710109de-7d8c-4749-9603-70f4540e7825@suse.com>
Date: Thu, 6 Jun 2024 07:49:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add an entry for tools/9pfsd
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20240606054745.23555-1-jgross@suse.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240606054745.23555-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06.06.24 07:47, Juergen Gross wrote:
> Add me as the maintainer for the tools/9pfsd directory.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   MAINTAINERS | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 076cf1e141..28fb35582b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -206,6 +206,12 @@ Maintainers List (try to look for most precise areas first)
>   
>   		-----------------------------------
>   
> +9PFSD
> +M:	Juergen Gross <jgross@suse.com>
> +M:	Anthony PERARD <anthony.perard@citrix.com>
> +S:	Supported
> +F:	tools/9pfsd
> +
>   ACPI
>   M:	Jan Beulich <jbeulich@suse.com>
>   S:	Supported

Please ignore, this was sent already long ago.


Juergen

