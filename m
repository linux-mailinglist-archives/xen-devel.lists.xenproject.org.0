Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2CCAC69A1
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 14:43:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999387.1380083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKG7v-0007tm-0W; Wed, 28 May 2025 12:43:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999387.1380083; Wed, 28 May 2025 12:43:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKG7u-0007rO-Tq; Wed, 28 May 2025 12:43:22 +0000
Received: by outflank-mailman (input) for mailman id 999387;
 Wed, 28 May 2025 12:43:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xyDt=YM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uKG7t-0007rI-Bi
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 12:43:21 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 547230fb-3bc1-11f0-b894-0df219b8e170;
 Wed, 28 May 2025 14:43:18 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a36748920cso4444282f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 May 2025 05:43:18 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a4eac8add9sm1425478f8f.54.2025.05.28.05.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 05:43:17 -0700 (PDT)
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
X-Inumbo-ID: 547230fb-3bc1-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748436197; x=1749040997; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pX4ELTjmdVJZArYklMOfTspu4AXysMbYaSBdySkQWQ4=;
        b=Si7nQv7vh5IfPPbsixnWKwxihs0OQwCptVXfjeJ2K7iniyrOrd+s8ntkdMVZaZuL4w
         ptNgOhMUzDcCH7YKJXqO9jSM/QxLsdf2H/E5zAkh1IN4JQ+YwrQrlpQ/0Xlra9l0Prv+
         55HzRZLolqWVj/C1QFa5MtWrVDKG/2yoEaKRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748436197; x=1749040997;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pX4ELTjmdVJZArYklMOfTspu4AXysMbYaSBdySkQWQ4=;
        b=R1SyOKI4+Rm3akW3hm0YNAWgHEmA8Ik+fVo17IyNbTjV3oFzMel7vrPktHfSAqc0VC
         4zNJcrp9Ujvj1Lx9xScwJrJ44oE3ncWFJwR9lO+wV44jsL5syThj0YcfyczLHzueC5W4
         bjegvSLbXSckbnysrS8qEYgOmvDpzwwELIS3DL1EmrDkb13ddMQIvEQkxWMSSAjLbzHB
         KM9c/smIy4vNQUvpdje2WFbg1f4i4oE47yWF+V2jp/6GpbSFN669LG5jwLNdIpuetheS
         /oZaURNdJ+JebOnCY7j1uNxL1vTmqewNoQlzfS2jLLd0iVojzq0V9Ww4tYN4DIT1zqJw
         P16g==
X-Gm-Message-State: AOJu0YwDMWfCuRQ+gl7Ug3Lm+aCJxiVLIw8CW5eC6uOhrbDt+Ug/xW9O
	nEixwwy7PyFSNUZbN0EOug2IaTKb16EGbR/ynDfskJ/S8GUZiWbYIlKvmHBvys7UB9WWwKTYNhF
	wq8A4
X-Gm-Gg: ASbGncsEY1WOxxJW3okJfoRcZDliO+6Io5VXwQfPSmbblhGC380zeW11bb1u2OzEqsH
	AcBNIvObQJ595nBaKs1S51AntkVK8XTCEf9fb1imEpigfhHpUJrSahpbMaTdVpaiTtYc1OJ4KxN
	st08VXHhwAd6SwOJlYilEM/J7cgLw/VtbmIyWuv5C2rHXySknfHnw5NI6qm+itkiBDqolE2Xbq/
	2/VkDsVQdveLYrsD/jDVw9oFOqcWb9VTB0XiG4dvHkbFbnNw34htvI339JSSTuaWTGLSSUUMHCx
	L3Fkbv1XJtUI1PgSSgSDMgU2mM7T3Id0MloSYo+OY6f1jBhAsMmCX825AN2PDbv6WPqlGrvjhH7
	q9Qq1lW0ICh72Yu/Eo4k=
X-Google-Smtp-Source: AGHT+IFxM3bDc6pw4d1XxuWmrPIeHwgqP9xevxYDTLqgxdUeolwPkjhd6uIAzsFJ2UlXtUy8zOAVaw==
X-Received: by 2002:a05:6000:40c7:b0:3a4:eda1:f675 with SMTP id ffacd0b85a97d-3a4eda1f716mr372646f8f.29.1748436197546;
        Wed, 28 May 2025 05:43:17 -0700 (PDT)
Date: Wed, 28 May 2025 14:43:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH] x86/traps: Trim includes
Message-ID: <aDcE5K9oUI5nYEPk@macbook.local>
References: <20250527150911.59744-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250527150911.59744-1-andrew.cooper3@citrix.com>

On Tue, May 27, 2025 at 04:09:11PM +0100, Andrew Cooper wrote:
> None of these are used by traps.c today.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> I'm experimenting with include-what-you-use but it's not the most
> ergonomic of tools to use.

Does include-what-you-use take into account #ifdef sections?  I'm
wondering whether non-default Kconfig could require extra headers that
are not accounted for the tool?

Thanks, Roger.

