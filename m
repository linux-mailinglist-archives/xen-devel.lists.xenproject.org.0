Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81812A71BB1
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 17:22:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928133.1330891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txTVU-0001fQ-0g; Wed, 26 Mar 2025 16:21:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928133.1330891; Wed, 26 Mar 2025 16:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txTVT-0001dy-TO; Wed, 26 Mar 2025 16:21:31 +0000
Received: by outflank-mailman (input) for mailman id 928133;
 Wed, 26 Mar 2025 16:21:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=16MU=WN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1txTVR-0001ds-SV
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 16:21:29 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f400da5-0a5e-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 17:21:29 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so219255e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 09:21:29 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f995a10sm17107688f8f.6.2025.03.26.09.21.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 09:21:27 -0700 (PDT)
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
X-Inumbo-ID: 5f400da5-0a5e-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743006088; x=1743610888; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ITzV4RzZv9w40RJ+s/udDv7KA+w6lF6nlHTPU/fyW2s=;
        b=gh7fN6S8SiZiJBp6A0+0ezuWCnC+Y+ItTI3iTsgAS9/92iCTEPbYYL+TbADmjbiq0A
         QYIgDIaL/LfekxVU9R1MGsd+Qm/urekTSzetc7tZ8s83h482XnEQS9QI60gf0bt+3QfF
         2ciMKjQLLcOXpyDRbv/xxCDEuFI+hte6eJe+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743006088; x=1743610888;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ITzV4RzZv9w40RJ+s/udDv7KA+w6lF6nlHTPU/fyW2s=;
        b=WIHDIbv6uNwlSxYjKGiRwhfHoD7/lLD20LglzwkWHKS4FUyZ8lxrkK5uL20IAdYGLl
         sZRWycfug/tab1Htour7+Af9DDc29VuqrkdqgbsDE32T08Cctk3Vy1SEAW4k5ATjfCfX
         27uYVwNO3zFvU+S3LZyR3dgpF3HIXGaZbF+MXloZeGFG3U0qXo9oMGeMRTuLMR8ivvlG
         FdGNKNa8QOUwRK15C+1d2i3Nwcxb/AZG5kQT01hEiGZ41f74oRt4AakFuzOXreaBfbKV
         6jmdbw906F3fQli5+ZgxPcogVuyL7M33uzSuEL48EOUbJsSLJJnpGkxBJghj8lo0txMU
         CRLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIX8tbvSfnc3iCvk1NsoxF0Uk5jth2wN+0OF3DRQ72zSNl+K38IDdidXG+pIFckb4uDLWqLEtSyF8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxxiOvg3s2iWT6MmmNdQmriHaXWcJH1e2arHShakOPsIOnDy4lQ
	ARyLsIFJV+PKXXkqmuwv6+9l6RxIb67DBHPDM68uzKMez862OyYJel1OU0scL08=
X-Gm-Gg: ASbGncuJqiE5CyyQazjqpF6cytuqZIk3QnIqghwS3Fjtd3brbXyRH26ZBr54t9BlZbz
	tiF8dkn4mMYYY9q7NrMYfPUlD8Ulz5gtxAiZOSsfM1jPRVUIi+UqYNZOD8KwWpmq0BtlYfou1Oc
	4xAoFmXuw9ayWU9a2y6lARQ54EwPNqHPg6p4uBxhHu4XaRJzOFs+oEXlBjneiFS1nj4isTqULaH
	2Finr1lF8oWA7UynKGtyfBbIhW26conlo93n3sTfu2xwHxtnsUYmWpVLxXnsngJO7YtJI/Rra0h
	eKD9nRsUUTGdsZCggZO0SJ368yYilqzAIcyUazr9RzEyQRw/MLwHVJux4hXMKyWOhguNgHvd9Zh
	Ov8t9FDvxMj1VJAQ4UZyY
X-Google-Smtp-Source: AGHT+IEobiCELOAyMQf8sMixKJ+zewpzUz9qqfDTutClbD5+s4R5qtxKpMTBJza/kxRRs8CxwG+mHw==
X-Received: by 2002:a05:6000:4285:b0:391:1473:336a with SMTP id ffacd0b85a97d-39ad178dc1fmr1170f8f.36.1743006088352;
        Wed, 26 Mar 2025 09:21:28 -0700 (PDT)
Message-ID: <39593610-1bd4-4319-9429-7cffeadd0da7@citrix.com>
Date: Wed, 26 Mar 2025 16:21:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] docs: remove qemu-traditional support from
 documentation
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250326160442.19706-1-jgross@suse.com>
 <20250326160442.19706-3-jgross@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250326160442.19706-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/03/2025 4:04 pm, Juergen Gross wrote:
> diff --git a/docs/misc/xenstore-paths.pandoc b/docs/misc/xenstore-paths.pandoc
> index a604f6b1c6..583e977b65 100644
> --- a/docs/misc/xenstore-paths.pandoc
> +++ b/docs/misc/xenstore-paths.pandoc
> @@ -634,7 +634,7 @@ Path in xenstore to the backend, normally
>  
>  Trustworthy copy of /local/domain/$DOMID/backend/$KIND/$DEVID/$NODE.
>  
> -#### /libxl/$DOMID/dm-version ("qemu_xen"|"qemu_xen_traditional") = [n,INTERNAL]
> +#### /libxl/$DOMID/dm-version ("qemu_xen") = [n,INTERNAL]
>  
>  The device model version for a domain.
>  

As a spec of what might liably be found in xenstore, this probably
shouldn't remove "qemu_xen_traditional" entirely.  Perhaps an extra
sentence saying "qemu_xen_traditional" is a since-removed dm-version?

~Andrew

