Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 098F1A30BAA
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 13:23:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885496.1295303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thpIN-0001SD-Vo; Tue, 11 Feb 2025 12:23:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885496.1295303; Tue, 11 Feb 2025 12:23:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thpIN-0001Q3-Sx; Tue, 11 Feb 2025 12:23:19 +0000
Received: by outflank-mailman (input) for mailman id 885496;
 Tue, 11 Feb 2025 12:23:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p4Ra=VC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1thpIM-0001Pv-DM
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 12:23:18 +0000
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f68b37d0-e872-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 13:23:13 +0100 (CET)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso37475375e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 04:23:13 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dd4d826c6sm9233253f8f.69.2025.02.11.04.23.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 04:23:12 -0800 (PST)
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
X-Inumbo-ID: f68b37d0-e872-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739276593; x=1739881393; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OKUYrtYIOGvpltGiicO+7/GQmn8jw+fd8yQPCo2JrNM=;
        b=ZnDkppZhqxs7uKJgNfwTNv67qkVWJi3RXpdnhaiUqxYdzOPi+PplYF5a0W9aihaBvw
         HG77WUcxjUFfliTyr2FoAesEAfEGO8Qrsz2jAS5uR7q/tbuNDBHtRXlsIqZ6gBS4izpF
         FeEh1o6NLRbi+SzYvEijd9PZuREtVN0+8oHg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739276593; x=1739881393;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKUYrtYIOGvpltGiicO+7/GQmn8jw+fd8yQPCo2JrNM=;
        b=TDKuboQW9fSFqxO/rAeMQW2c+kkKGGb+6iuWV0fQO5qWJAzoz0X0II0OJ/0HmoAR+d
         EQUX3ZdFV+TIgeqsC5rJmdakBWnZI88Z5/9GewlPG12iMI0Rn1MiAD5eifTGbwWy62Qd
         z6u+8V732G20DwyNqXFhx34LFCetSVYU1hsgr6/530GLdcB9zMYemxQiUkbXLR5bQ4dh
         dLlaDZpxJBID5wC3OgEPyqYl1SWAhE9ddGau7W0hbLk9R4g3yfEQmmlSp7MDYiyT9ESg
         Hn6AkpqDIan97oxWDHw2Q0p0wAP/LGIt/60yKyIe7Nz0ymJXddo35TUypKQGDsAC+sjv
         9HBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrKQhe2oWFctt+rdd3SoR0bEd/AxDoFKG/1yNZlP91gFfM3OvrvjEJqwhm5+t7aXA6xv6U9nN/odo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwkEath74XWmuB/bOekkjZaC4vBdHUNa6MumJ9FHoI5DfqqBpwv
	/IsDkOe/AKvkVCAxmYNvB82x0zsx/XXXjL6fyFqnpKvmoTNYcrihIV46V89UXbE=
X-Gm-Gg: ASbGncvXuR+ihA+w8OYH7JJ57L+KAJlLPZz2P+aTR36DkMpXckDmFg9JJdBx6ehiys3
	zJwLi3fTnhycpZ/b35URLBQ+2qGnn0gY9pKvPCz36loflyw/ICEmNIRyBH9TDUWcyTR5Pgqs/+8
	jhVpkQg2H0UtqKaUs0ybP/3bEJ++qv715UKeqksKyQjTz6KYkzpSxuv/u77JAzDiqb3mNkBWlj/
	sunp+qd4q+dKNYZVWgSAo4IeZQNxRiFXCpY24M9DyfwZ/9gaRMwQUebrYWfWvFrKEfbPsuAmJQn
	dWsQLnmplJqcN2TnjY18cGDf1tNZSZXiG/9xCGucZ+bLEtSyVniz6Nc=
X-Google-Smtp-Source: AGHT+IGHdgHyh4VzPN/q5IYwQPkmQyM1RxrVSlkrVgzJWrbOG9VYMNNc203UHtjQEoQt9LNgEko4JQ==
X-Received: by 2002:a05:6000:4023:b0:38d:e420:3984 with SMTP id ffacd0b85a97d-38de4203c6fmr3478714f8f.39.1739276592640;
        Tue, 11 Feb 2025 04:23:12 -0800 (PST)
Message-ID: <6565b1e3-1e7e-4534-a8ab-88c7abb8abd0@citrix.com>
Date: Tue, 11 Feb 2025 12:23:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] tools: fix typo in sysconfig.xencommons.in
To: dmkhn@proton.me, xen-devel@lists.xenproject.org,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com
References: <20250211073106.189350-1-dmkhn@proton.me>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250211073106.189350-1-dmkhn@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/02/2025 7:31 am, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

CC Oleksii for 4.20 consideration.

> ---
>  tools/hotplug/Linux/init.d/sysconfig.xencommons.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
> index 1bdd830d8a..1720a9b075 100644
> --- a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
> +++ b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
> @@ -8,7 +8,7 @@
>  ## Type: string
>  ## Default: daemon
>  #
> -# Select type of xentore service.
> +# Select type of xenstore service.
>  #
>  # This can be either of:
>  #  * daemon


