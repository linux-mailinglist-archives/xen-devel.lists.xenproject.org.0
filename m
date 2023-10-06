Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1307BBD8B
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 19:17:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613761.954529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qooQm-00022V-4q; Fri, 06 Oct 2023 17:16:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613761.954529; Fri, 06 Oct 2023 17:16:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qooQm-00020B-1s; Fri, 06 Oct 2023 17:16:04 +0000
Received: by outflank-mailman (input) for mailman id 613761;
 Fri, 06 Oct 2023 17:16:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vVKM=FU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qooQl-000205-6V
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 17:16:03 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0459ce24-646c-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 19:15:58 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-406618d080eso22470485e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Oct 2023 10:15:58 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 p15-20020a7bcc8f000000b003fee6e170f9sm4135382wma.45.2023.10.06.10.15.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Oct 2023 10:15:58 -0700 (PDT)
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
X-Inumbo-ID: 0459ce24-646c-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1696612558; x=1697217358; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pNWvy7BHUD/YMjuNX6o/apal2zMJkBxILDvNWBBy4uo=;
        b=vZxUoUOjW6Ad5Hq92bpDG+IOfQCcCr2aNtYOYD4mjGRYvXWVS4A8DaWZkQbRTvOHDx
         9Bf/4ONu96dnt6uhMOP6vtiKWxQn0Dfddc8EayEzlx+cXtOJx0Ekm/aba6DMnpFyegUm
         RPXDVasYINt2Zc55lYParyc7oxqwGaNLwVusY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696612558; x=1697217358;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pNWvy7BHUD/YMjuNX6o/apal2zMJkBxILDvNWBBy4uo=;
        b=EnwPfA+3rtNy9+Br25h6H5GRxYMkojIkXD1DbQykeyJbfftIKeixtkH6Z2k9zicjj/
         MzPrerhkM+6VBq6pJToX0eLmQtDLjJM1POhMw+ZzaGqpJlWAfY2zAGZYU+/F2irpfmyr
         GSUo3RhPR7nWyfFlT0d9RehmXa3Eo04WGLJObZ+S8L5SucoGAxa7LoEq1+BH1Edu18OY
         2JuZMK6VN6+141LFTB0HZ7qcG8j7ObDkDX97TZNNlQ5B0n1ghAWuZ8RbKtMHxuftYP/a
         Saj7Plb2pGh9kR8pcTtvN4BnbyqnpJOzdHeiXFJQwy4UywSxmMq2IG5MQgeBfmynHV6M
         JIAw==
X-Gm-Message-State: AOJu0YxfJlKgVVlHZPKN7QYURYpFRicMwIlfE9d++FecL8tBVvwiB5cs
	Tan+Ay5Oc2zjShtewG71F1D2Tw==
X-Google-Smtp-Source: AGHT+IE2QeMtyOwYh3IXa7wqYU8Zrfr8W7YutlN5yhjnIvKdZoayYCLGHKahsem1DeKtARmpQJ4gcA==
X-Received: by 2002:a7b:cbd5:0:b0:403:9b7:a720 with SMTP id n21-20020a7bcbd5000000b0040309b7a720mr8452647wmi.1.1696612558298;
        Fri, 06 Oct 2023 10:15:58 -0700 (PDT)
Message-ID: <063309b4-d66f-47f4-ba9e-c709ad1ab31e@citrix.com>
Date: Fri, 6 Oct 2023 18:15:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xenpvboot: remove as unable to convert to Python 3
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20231006145046.98450-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20231006145046.98450-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/10/2023 3:50 pm, Roger Pau Monne wrote:
> diff --git a/tools/misc/Makefile b/tools/misc/Makefile
> index 233a7948c050..9938bc235968 100644
> --- a/tools/misc/Makefile
> +++ b/tools/misc/Makefile
> @@ -36,11 +36,8 @@ INSTALL_SBIN                   += xen-livepatch
>  INSTALL_SBIN                   += xen-diag
>  INSTALL_SBIN += $(INSTALL_SBIN-y)
>  
> -# Everything to be installed in a private bin/
> -INSTALL_PRIVBIN                += xenpvnetboot
> -
>  # Everything to be installed
> -TARGETS_ALL := $(INSTALL_BIN) $(INSTALL_SBIN) $(INSTALL_PRIVBIN)
> +TARGETS_ALL := $(INSTALL_BIN) $(INSTALL_SBIN)
>  
>  # Everything which only needs copying to install
>  TARGETS_COPY += xencov_split

FYI.

Just out of context here is one more reference.  I've folded in the
following hunk.

diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index 9938bc235968..66d0d6b09029 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -41,7 +41,6 @@ TARGETS_ALL := $(INSTALL_BIN) $(INSTALL_SBIN)
 
 # Everything which only needs copying to install
 TARGETS_COPY += xencov_split
-TARGETS_COPY += xenpvnetboot
 
 # Everything which needs to be built
 TARGETS := $(filter-out $(TARGETS_COPY),$(TARGETS_ALL))

~Andrew

