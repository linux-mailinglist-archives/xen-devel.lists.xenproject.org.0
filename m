Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D38B5A1CC
	for <lists+xen-devel@lfdr.de>; Tue, 16 Sep 2025 22:06:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124842.1467033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uybwK-0000QL-Fy; Tue, 16 Sep 2025 20:06:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124842.1467033; Tue, 16 Sep 2025 20:06:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uybwK-0000O1-DE; Tue, 16 Sep 2025 20:06:12 +0000
Received: by outflank-mailman (input) for mailman id 1124842;
 Tue, 16 Sep 2025 20:06:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KURy=33=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uybwJ-0000Nt-CL
 for xen-devel@lists.xenproject.org; Tue, 16 Sep 2025 20:06:11 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 924db5cb-9338-11f0-9d13-b5c5bf9af7f9;
 Tue, 16 Sep 2025 22:06:03 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3e9c5faa858so3118484f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Sep 2025 13:06:03 -0700 (PDT)
Received: from [10.10.152.155] ([149.199.65.200])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b54a387b618sm15136094a12.32.2025.09.16.13.06.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Sep 2025 13:06:02 -0700 (PDT)
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
X-Inumbo-ID: 924db5cb-9338-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758053163; x=1758657963; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pJLhApEulSIjvFulpUZib0KekJ0AgXZ/v42YdH3eDog=;
        b=AincNZICzlQIJc56tZpEn9NlmjacmhYzm5TM03tuWPly2DZh3SiU+x7T4/uANBSQD+
         Y93dluzXg3jH4QGS9+++SfV2oUkf3s6JbWqWsixxfOGHS5X3gcogCqIKBmo+y9vOWQ1M
         /vCIL/anU6csSzosiwKBfaXgz5sMV8xIArMK532poBkE4ZxoF/ylwq/Tm2mbBdSuzirb
         XjjA/CNAHY8e2IFhqSFj2b0pVaV9ZmCq/1uXMrly6GLCzFQsioBB+Rtw85E6C/lyDAEf
         RlDvMjXyKdQ/aWom0teIn3So+vs0kRe9gb0LTMTmcLtn4ZYYCT5mpz6vWqhlRbZJ/G/Q
         a7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758053163; x=1758657963;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pJLhApEulSIjvFulpUZib0KekJ0AgXZ/v42YdH3eDog=;
        b=tZ1z7jI66dFyHpFtUzKa7Uj63XOHQlh1GMXWmnRwjmb0E31Q0aEJQ8eSsgDiXtNXFZ
         SOR1qQooA01aytcuhSqgpMbNIu8xvy55Uu3Lzr/tbM8qE3/6dv4xC+UpYlT/WAcgskgm
         XrgqNZgUNHUAWVPfSd4BQdNhrOs/GP3ZhWlq5l1/YU/M9HuZ/vJjiKTUBmMiUKMiHWbf
         Ru3+yIimNFVSLRhaiMRzxD71s8z+IEOa5xPOnVG6bexBlzNhDmAmBPpndMBiKOIHc9Ar
         KxzcoId30YbNuebaPLFoNeX+ayZr7DQYI9GA1t7dEYzspfbPb90G8gv3xskKXIKMaOL6
         FWng==
X-Forwarded-Encrypted: i=1; AJvYcCXUWLdib/I/wJtfDkcJ63obaxUFw5yA8HpqD47rnFFfVXKp9JykHRLuk2NF/sgkt1TQxEHh/udE2aE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yza2RUu/ehx9rNSqzXjwSvRiRxTLdzNh0DDdQkEn3h1zHymzwmm
	ebZHZTZroGJsGcD/3RfKD0J5A3Y5To9EMhIcPpcffvkA8bxpYzHTZQHaBfNRcM6Bzw==
X-Gm-Gg: ASbGncsgZpkRbMIX1L9AY+iG5/7A0vXeK3JNY74yELOB7ODD72RKXHNfbGsssfBp7m6
	DDdDKVGAKcd2PwoiIL1jxoqqMS6SatPg0OEsWkYN2OB5EgttQyaUKp2OMZd2p5XecynFvy9OIDa
	AI18wlsZc9FUpL7dF0XqJjW9HKBx2mPl8s4r6fsvDFPAvUMbQHLzaDSQHFUkKAWb1dffG7R6yar
	Y11WThqjrPbFNYOOhnuS7hBpWOxMdxJQkQXV5ar/EyGluA6XBJoYKTq1siJdUZxwlhhHrtM0GZ3
	sVDev1K8MxUyUeXdJ+Q2YCrs52/OXba0+s7sC4R/zq2T+vzKPEVbwm0CUfFglfb8nv8Yth7lE3H
	TuDJ483DOuzgNEypJ/xhHK84aSAcjQtr2dg==
X-Google-Smtp-Source: AGHT+IGSVqGxFKXiMIv4cWiJNw2Be4nkDRxMPPpGJzj1X91EiaPf4qakK4NFv1E50dxY5/SGK2rhWw==
X-Received: by 2002:a5d:61cb:0:b0:3ec:1154:7dec with SMTP id ffacd0b85a97d-3ec11547dfcmr4112106f8f.25.1758053162609;
        Tue, 16 Sep 2025 13:06:02 -0700 (PDT)
Message-ID: <9e5c0735-1024-4d44-b1bd-1a8909ce2c37@suse.com>
Date: Tue, 16 Sep 2025 22:05:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/domain: introduce DOMID_ANY
To: dmukhin@xen.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250916173702.871508-2-dmukhin@ford.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250916173702.871508-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.09.2025 19:37, dmukhin@xen.org wrote:
> --- a/xen/include/public/xen.h
> +++ b/xen/include/public/xen.h
> @@ -608,6 +608,9 @@ DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
>  /* DOMID_INVALID is used to identify pages with unknown owner. */
>  #define DOMID_INVALID        xen_mk_uint(0x7FF4)
>  
> +/* Domain ID allocator: search [1..DOMID_FIRST_RESERVED-1] range. */

Considering this is an implementation detail of the hypervisor, ...

> +#define DOMID_ANY            DOMID_INVALID

... I don't think this should go in a public header.

Jan

