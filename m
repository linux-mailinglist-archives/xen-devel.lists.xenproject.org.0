Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 568888751B3
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 15:23:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689930.1075436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riEe9-0008AJ-4T; Thu, 07 Mar 2024 14:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689930.1075436; Thu, 07 Mar 2024 14:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riEe9-00087L-1d; Thu, 07 Mar 2024 14:22:57 +0000
Received: by outflank-mailman (input) for mailman id 689930;
 Thu, 07 Mar 2024 14:22:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+8gn=KN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1riEe8-00087F-1s
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 14:22:56 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fbf4021-dc8e-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 15:22:54 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-567fbbd7658so1018239a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 06:22:54 -0800 (PST)
Received: from ?IPV6:2003:e5:8715:c000:52ff:24ed:f304:23c0?
 (p200300e58715c00052ff24edf30423c0.dip0.t-ipconnect.de.
 [2003:e5:8715:c000:52ff:24ed:f304:23c0])
 by smtp.gmail.com with ESMTPSA id
 b20-20020a0564021f1400b00567fa27e75fsm1469233edb.32.2024.03.07.06.22.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Mar 2024 06:22:53 -0800 (PST)
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
X-Inumbo-ID: 2fbf4021-dc8e-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709821373; x=1710426173; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jT28SHMr5mx2yX++aDezcFhRzuKSnqFFIEiMbPt46Zc=;
        b=LI7EmJJpeDPQcvv318soto6MV9iHTUu7iYwtPGhc+jZYWySGyiWeo6KSUr+E6+tZxT
         oZLfNioD1dw6PUROMMFd00d58LTEdputRgFdlWlxlIwvcFNkK4M5HayViqoPoEaILwiu
         Y4yi4+frOyXrT156cPkzMKGHtsAgbAPocjar6j4Rh++unF5auMKmUc2BcBh0PAGUq0bc
         uERnleSdWmINhh7U9WPma36Ic1I3GRUZ7zULi2jhZN6aRHOmyOZnhNwSFPZ0rn+6b1zC
         C3lMytElPkhN78NrUKAG0yNVRvJTGl9TecZshG0tZA5gm1X4YpceRgRqqp/rDNdqJ0e7
         NPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709821373; x=1710426173;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jT28SHMr5mx2yX++aDezcFhRzuKSnqFFIEiMbPt46Zc=;
        b=KKbBzLwRGsA3V0Kh3+EaG900kHcKJB0aE4jui8aXAq43RChnMqjZ1yhbRCeSSV6dBC
         8m1ev+v3hBfJl8XBFA+8LCsElyLb24rLo9Z//ZnoGueT5UdMr7FBiDyBAdkEkzPyCyTo
         j6zK90AVFs1ajhtYyxYXC486oPzaU9KGDiJedVwQLclCEzPPIIolg11FBnVTL4C9O/KF
         mYxbhM8IyLGxqwd0NuS5Cbf9VjRYY14CHIkStu/YGXNO4h0ZpwnghkumMjmkZTmz7e6D
         /3c/0MYL+u4aNEJ14i5sye8zhpFHCk0QD/94jdTThtTpwkWzuZEwIlW/3N2fMPwn5JCg
         Ybjw==
X-Forwarded-Encrypted: i=1; AJvYcCWNvHOBGAULTFvzzXdkoNOtOhDvE2dsqaD75gqGGxQHxCo4HQhEbEiDL5mzlqd4+E326m8HqZaBlHLNHqP1ZkGPpewsKIV3g9fyZt6zVzI=
X-Gm-Message-State: AOJu0YymLjMx6Fu620VbEKbZ+aAqn6CJsXAG3JxIVBxdhJzhxIsgfjZK
	jwMq65vUz0lkOU7PQgzH0sXfbWxFl5J0Ii34TvSrgV8gv0RqPtkV53BpNkFBXdo=
X-Google-Smtp-Source: AGHT+IEOIimfJ+6+xWtw0gpdBm8m9URQc3TAdIuUHP72uJAqKMRiI0OJ/ZKhOPcYUGsiqVhfE0QLVw==
X-Received: by 2002:a05:6402:2315:b0:565:59a:a103 with SMTP id l21-20020a056402231500b00565059aa103mr13416402eda.33.1709821373594;
        Thu, 07 Mar 2024 06:22:53 -0800 (PST)
Message-ID: <6488c9a2-b071-4ee0-b02d-5a0711bf5129@suse.com>
Date: Thu, 7 Mar 2024 15:22:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH v3] tools/9pfsd: Fix build error caused by strerror_r
To: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20240307135616.3953774-1-xin.wang2@amd.com>
Content-Language: en-US
In-Reply-To: <20240307135616.3953774-1-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07.03.24 14:56, Henry Wang wrote:
> Below error can be seen when doing Yocto build of the toolstack:
> 
> | io.c: In function 'p9_error':
> | io.c:684:5: error: ignoring return value of 'strerror_r' declared
>    with attribute 'warn_unused_result' [-Werror=unused-result]
> |   684 |     strerror_r(err, ring->buffer, ring->ring_size);
> |       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> | cc1: all warnings being treated as errors
> 
> Using strerror_r() without special casing different build environments
> is impossible due to the different return types (int vs char *)
> depending on the environment. As p9_error() is not on a performance
> critical path, using strerror() with a mutex ought to be fine. So,
> fix the build by using strerror() to replace strerror_r(). The steps
> would then become: Acquire the mutex first, invoke strerror(), copy
> the string from strerror() to the designated buffer and then drop the
> mutex.
> 
> Fixes: f4900d6d69b5 ("9pfsd: allow building with old glibc")
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen


