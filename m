Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF49D79CE28
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 12:23:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600341.935982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg0YL-0006qZ-D0; Tue, 12 Sep 2023 10:23:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600341.935982; Tue, 12 Sep 2023 10:23:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg0YL-0006oM-AH; Tue, 12 Sep 2023 10:23:29 +0000
Received: by outflank-mailman (input) for mailman id 600341;
 Tue, 12 Sep 2023 10:23:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mt1s=E4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qg0YJ-0006oG-H4
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 10:23:27 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68579100-5156-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 12:23:25 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-401187f8071so34639685e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Sep 2023 03:23:25 -0700 (PDT)
Received: from [192.168.20.115] (ip-185-104-136-29.ptr.icomera.net.
 [185.104.136.29]) by smtp.gmail.com with ESMTPSA id
 12-20020a05600c240c00b003fc06169ab3sm15692097wmp.20.2023.09.12.03.23.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 03:23:24 -0700 (PDT)
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
X-Inumbo-ID: 68579100-5156-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694514205; x=1695119005; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t+8HU+NL6DlbJnsNcM8HxWHnHN2D1aXtqxenntpuI9M=;
        b=vofgekeZ1ttV80PGS4khfJoYK0RwBLaWRpaHM5+jNoo/pKFGV2r5gsfteli1xYQlRW
         P4wBBb0RkCO5Wlgw0wCh7/pMEfAkwz7v1tmF8yvbjOm9ZETpXXo7X8s/rKNeTlAZPFPv
         Q0ZpMUvo0DcNVYJKHf+jdaH64FT6JXX4MnquM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694514205; x=1695119005;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t+8HU+NL6DlbJnsNcM8HxWHnHN2D1aXtqxenntpuI9M=;
        b=OT2kGzbAtntaGh4WAy5teJ2RUHjEkJ/drr9HT6oTtnT4TiUJLrvuOIVXyGtpCBtvL8
         pvrgRyAjKwzNI9FIq+SoZMIb9b4qou0XhuUVqg5a5b/i3810nxzkFtA3lHZXNspUrksB
         Ql3+XqAFMPnKwDK4ayAMyhhqQGZ4LHhR3yFoMvTzA3nv7iHI4wUyJjOiEC5StUT+MsQB
         kH6RSWxr+xLMtKSjBGznyGcgnN1DPDgdgJ9yqjRr9lfLGLiOGMqyT8ldW7zKyijX4f1C
         14+UJomVRS+KZ7Y6epl+wgwGdrm0meukL/MTmVygHJ/RxHHCYHUEWvcxJl+TRX+/IDaa
         /fRQ==
X-Gm-Message-State: AOJu0YwUHFi53fPr3BySdYmfgrPkheP/ysHb9e36EVPQV7QZuzqBXgtV
	Wjf0T22zVHMkuNTwAvT5/1MIq727HflV9lxLLmo=
X-Google-Smtp-Source: AGHT+IHyjAUXiFaYFAeUxN7Zap8cFKAbLW61UUoZFuzm7ZAMXCmX+uPXSNgHYwFe8SgM5uNs49KrMw==
X-Received: by 2002:a05:600c:1e1d:b0:401:431e:2d03 with SMTP id ay29-20020a05600c1e1d00b00401431e2d03mr1528536wmb.14.1694514205115;
        Tue, 12 Sep 2023 03:23:25 -0700 (PDT)
Message-ID: <93ef8146-c8f5-586f-b754-b28b2b733222@citrix.com>
Date: Tue, 12 Sep 2023 11:22:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v2 2/5] tools: convert setup.py to use setuptools
Content-Language: en-GB
To: Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 George Dunlap <george.dunlap@cloud.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <cover.1694450145.git.javi.merino@cloud.com>
 <9bbf71efc710dc869baf0c5ba926630e81181620.1694450145.git.javi.merino@cloud.com>
In-Reply-To: <9bbf71efc710dc869baf0c5ba926630e81181620.1694450145.git.javi.merino@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/09/2023 5:51 pm, Javi Merino wrote:
> From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>
> Python distutils is deprecated and is going to be removed in Python
> 3.12. Migrate to setuptools.
> Setuptools in Python 3.11 complains:
> SetuptoolsDeprecationWarning: setup.py install is deprecated. Use build and pip and other standards-based tools.
> Keep using setup.py anyway to build C extension.
>
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Throughout the commit message, s/use/support/ seeing as we're not
removing distutils.

Next, this needs a SoB from you because you've changed the patch from
what Marek originally wrote.


> diff --git a/tools/pygrub/setup.py b/tools/pygrub/setup.py
> index 502aa4df2d..f9e8feb2e6 100644
> --- a/tools/pygrub/setup.py
> +++ b/tools/pygrub/setup.py
> @@ -1,5 +1,9 @@
> -from distutils.core import setup, Extension
> -from distutils.ccompiler import new_compiler
> +try:
> +    from setuptools import setup, Extension
> +except ImportError:
> +    # distutils was removed in Python 3.12.  If this import fails,
> +    # install setuptools.
> +    from distutils.core import setup, Extension

Finally, this feels a little unnecessary.  How about just:

# Prefer setuptools, fall back to distutils
try:
    from setuptools import setup, Extension
except ImportError:
    from distutils.core import setup, Extension

~Andrew

