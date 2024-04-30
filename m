Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 360608B78B6
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 16:14:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714923.1116302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1oEb-0003ZR-3Z; Tue, 30 Apr 2024 14:13:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714923.1116302; Tue, 30 Apr 2024 14:13:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1oEb-0003XU-0E; Tue, 30 Apr 2024 14:13:29 +0000
Received: by outflank-mailman (input) for mailman id 714923;
 Tue, 30 Apr 2024 14:13:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iw5h=MD=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1s1oEZ-0003XO-9W
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 14:13:27 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfa78218-06fb-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 16:13:26 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-34782453ffdso5197308f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 07:13:26 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 d18-20020adffbd2000000b0034ca136f0e9sm8855478wrs.88.2024.04.30.07.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 07:13:25 -0700 (PDT)
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
X-Inumbo-ID: cfa78218-06fb-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714486406; x=1715091206; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2KLF6DiwoGHMGRFdLIHyP/Ey6iRLeXoi5ASvkunY/Eo=;
        b=ZZuML2KwJF9pcM8H0lyBBAy+Aa8UccJyPdGBD5+EYuTyp3ER94M5DK9x2jlV/OBzzA
         eHkZ+c4/CtZl4EH2nl6URIOf/iU+cL0vUoCC4CBxagK+93/bqo3/QwM1qQWt/h5PrH0k
         V0G9tmNiZF0zCTpvyEldWXKEm5Dlgw6OKD4ME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714486406; x=1715091206;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2KLF6DiwoGHMGRFdLIHyP/Ey6iRLeXoi5ASvkunY/Eo=;
        b=qdpDY+rX+qqgyKYIwvyeG7ESDKUNGZmQuFTNtcrtqgA11KJxVOtHmojE6C2C22rymf
         +1vUHhapMZJZI0jR9pV80IoReKQMozqCmnOoeazYQHG2s8Nme3g2VfIr2REcgPGpsNcq
         yLSw1pRrJnVqDyRUErtjFEnWl1IxVgTpxG1Nj0p3c6BC1XBcvUc9YZ54yCOcBdkybJQj
         HAk96RensLf26GpNfou9fGaXq+IcujXq/K/FCXX4I5QVM0eMVAL4Al68e9zZyDLuuMqD
         KpKEW8qDAYDOK+OEDiKHI4qIRmksxsa6k8clhvk2cEU9jrByMFKH3SKSPE8fOzwGXZNh
         zW1A==
X-Gm-Message-State: AOJu0YzFIJ+ReUuOSdClyA8ViGRVDqrW7g8k1ck1gC+KUrfmemsz4CSs
	GQ4R3szX7rBO7/zzQBGQTkQ9r1jLNkmcruGpP5bPswh/pbuXGuFXHOyqddIw69c=
X-Google-Smtp-Source: AGHT+IF0vhS3VxC+kn4htq15hAFNS1ijKoQCrPpLdHWftIfhEJ+tMU65OXleRnJAQw5vYcNgQcXQ0A==
X-Received: by 2002:a05:6000:147:b0:34c:71d0:1151 with SMTP id r7-20020a056000014700b0034c71d01151mr10389421wrx.10.1714486405810;
        Tue, 30 Apr 2024 07:13:25 -0700 (PDT)
Date: Tue, 30 Apr 2024 15:13:24 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/3] tools/xg: Move xc_cpu_policy_t to xenguest.h
Message-ID: <33f7fbc5-6bbf-4f84-9d83-96cbb106d7de@perard>
References: <20240207173957.19811-1-alejandro.vallejo@cloud.com>
 <20240207173957.19811-2-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207173957.19811-2-alejandro.vallejo@cloud.com>

On Wed, Feb 07, 2024 at 05:39:55PM +0000, Alejandro Vallejo wrote:
> diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
> index e01f494b772a..4e9078fdee4d 100644
> --- a/tools/include/xenguest.h
> +++ b/tools/include/xenguest.h
> @@ -784,7 +784,13 @@ xen_pfn_t *xc_map_m2p(xc_interface *xch,
>                        unsigned long *mfn0);
>  
>  #if defined(__i386__) || defined(__x86_64__)
> -typedef struct xc_cpu_policy xc_cpu_policy_t;
> +#include <xen/lib/x86/cpu-policy.h>

I don't think it's a good idea to expose "cpu-policy.h" to "xenguest.h",
and it's going to break the build of every tools outside of xen
repository that are using xenguest.h. xenguest.h is installed on a
system, but cpu-policy.h isn't.

> +typedef struct xc_cpu_policy {
> +    struct cpu_policy policy;
> +    xen_cpuid_leaf_t leaves[CPUID_MAX_SERIALISED_LEAVES];
> +    xen_msr_entry_t msrs[MSR_MAX_SERIALISED_ENTRIES];
> +} xc_cpu_policy_t;

Would using an accessor be an option to access `leaves` and `msrs` for
"xen-cpuid" tool? That would avoid the need to expose the "cpu-policy.h"
headers.

With accessors, we might not need to expose xc_cpu_policy_serialise() to
the world anymore, and it could be internal to libxenguest, probably, I
haven't check.

Thanks,

-- 
Anthony PERARD

