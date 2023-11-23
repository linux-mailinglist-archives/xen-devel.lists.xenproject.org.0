Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 378BE7F6461
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 17:50:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639935.997592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6CuF-0000hR-EH; Thu, 23 Nov 2023 16:50:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639935.997592; Thu, 23 Nov 2023 16:50:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6CuF-0000eh-AW; Thu, 23 Nov 2023 16:50:23 +0000
Received: by outflank-mailman (input) for mailman id 639935;
 Thu, 23 Nov 2023 16:50:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xmv=HE=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r6CuD-0000e5-Vo
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 16:50:21 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63aee797-8a20-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 17:50:21 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c871d566cfso12110131fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 08:50:21 -0800 (PST)
Received: from [10.80.4.253] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 c4-20020a05600c0a4400b003fefaf299b6sm2551438wmq.38.2023.11.23.08.50.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 08:50:20 -0800 (PST)
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
X-Inumbo-ID: 63aee797-8a20-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700758221; x=1701363021; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oowHuP7pc75QRujvNjOm3oPDbCH+YPrBweBaXhassmQ=;
        b=d14JUY4bwVHEP9OGp+pi31vXxNDnsk5fMKNRQMK6qDZsKPHwMMDDFT3IVxXQ2k3eXl
         HgJSP6l1zm3igRTjVh6r4IqJSAnWlW039s8Wu8R+f6i18OfqlrsBjQdVzbocylmEe2+1
         dDRhmZOte3/5jQDM6B7glbrKbbTG2l7uSAxkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700758221; x=1701363021;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oowHuP7pc75QRujvNjOm3oPDbCH+YPrBweBaXhassmQ=;
        b=FSd+In7bg0S7Oob9BVm3GzhHSp17XWKJAtVc8weqgq0dVG7UZBRdayaO2tMAbblc6G
         4miO4Wm04f+n7FRx+GciMEZi3PGszXBqF7Xph16IJgyoFAVLraDUtdFMbrRk4snhiQTB
         pofQeM7BGm43MQhKyO4imii6ZG1oWTh90wY4tCvjht5dZ8ksnW/jOpkkap7LPO0dAC4B
         Qo0qzpti9zOZ4Y0LaMB+3/dsTnMoNELH6lB45KSqjEsSeRYaNEK0mWxnT+lzocC8wWnB
         FhjOdKzrzoBPH4Tldlr0lv9tSIO/GoFjs4GOcix/T2y3QC7oaE/NYBJJCBzgh1TbrHPd
         1LIg==
X-Gm-Message-State: AOJu0YynEMlVlXJaFMfGFnR4hXnpkNsIcN/AC/RNH3LHep2M0jnXZt31
	EAXZbvryomHbUvMeQhScFckI0A==
X-Google-Smtp-Source: AGHT+IHGEw4xVwW9wYcOi09K6B5/JH/2iFSjdO66ctcLRPqyv1rZuxafgxd6bwiYuuJyoYjFmiKk0w==
X-Received: by 2002:a2e:87c7:0:b0:2c8:32b4:c431 with SMTP id v7-20020a2e87c7000000b002c832b4c431mr2748066ljj.40.1700758220682;
        Thu, 23 Nov 2023 08:50:20 -0800 (PST)
Message-ID: <90f63f30-38d3-4d70-aae3-1ec3a307c4c1@cloud.com>
Date: Thu, 23 Nov 2023 16:50:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2.5/6] tools/pygrub: Fix expression before it's copied
 elsewhere
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231106150508.22665-3-alejandro.vallejo@cloud.com>
 <20231122200702.1874420-1-andrew.cooper3@citrix.com>
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <20231122200702.1874420-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/11/2023 20:07, Andrew Cooper wrote:
> This has an identical meaning, and is the more pythonic way of writing it.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Wei Liu <wl@xen.org>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
>   tools/pygrub/src/pygrub | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/pygrub/src/pygrub b/tools/pygrub/src/pygrub
> index 327cf51774fc..2c06684d6532 100755
> --- a/tools/pygrub/src/pygrub
> +++ b/tools/pygrub/src/pygrub
> @@ -88,7 +88,7 @@ def downgrade_rlimits():
>       # filesystem we set RLIMIT_FSIZE to a high bound, so that the file
>       # write permissions are bound.
>       fsize = LIMIT_FSIZE
> -    if "PYGRUB_MAX_FILE_SIZE_MB" in os.environ.keys():
> +    if "PYGRUB_MAX_FILE_SIZE_MB" in os.environ:
>           fsize = int(os.environ["PYGRUB_MAX_FILE_SIZE_MB"]) << 20
>   
>       resource.setrlimit(resource.RLIMIT_FSIZE, (fsize, fsize))

LGTM.

Cheers,
Alejandro

