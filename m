Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD3D7A8D05
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 21:42:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605959.943615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qj35v-00082f-LX; Wed, 20 Sep 2023 19:42:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605959.943615; Wed, 20 Sep 2023 19:42:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qj35v-00080q-Iu; Wed, 20 Sep 2023 19:42:43 +0000
Received: by outflank-mailman (input) for mailman id 605959;
 Wed, 20 Sep 2023 19:42:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2cdA=FE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qj35u-00080h-5b
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 19:42:42 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbcbea38-57ed-11ee-9b0d-b553b5be7939;
 Wed, 20 Sep 2023 21:42:40 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-401d6f6b2e0so9015435e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Sep 2023 12:42:40 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l18-20020a5d4112000000b0031c6e1ea4c7sm19358510wrp.90.2023.09.20.12.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Sep 2023 12:42:39 -0700 (PDT)
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
X-Inumbo-ID: dbcbea38-57ed-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1695238960; x=1695843760; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=acycBaUVRbKczSMSNKZl09qAe9XOfy7bYXC098UYWks=;
        b=Zk+Lu0XjvbGQGmb4owO84qZREqrxYBCMaGG45BFHDakIiULiDOPktaItOGqQvWK9dm
         yCUTk9a0fLgJ7u0bNvOmVASORGL4LVpf7GjAQFPS5f9kQyVDjsGnal8vWQiXp/dTfGOM
         GYs0xRdVylYdSysCeNw3nT0DD2/t1AZtPlrqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695238960; x=1695843760;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=acycBaUVRbKczSMSNKZl09qAe9XOfy7bYXC098UYWks=;
        b=JGxIZ/K1PpgZBhFZgxYmC6hhJYbNbqmK9vRfYGJSS1ogskhmUr/cS/HUcjE2zM16dg
         yoKCS7vpTQ8LpSWaJgdJtTNwShWuJ2JoEPomNKW+KdoMKYKW6z832qIpTPfKHEQq3q9l
         7Gcc8GOlJlm+bQhFDMC/wMxBJbIoS9nEHXL0CYXIQip+7Wh3IWFF3LXlpTncTUyPAz7f
         e94dXeH8isk4F0AhYsbQ9GBTAYHEBXqWgYHw9U10ssxwhGIUP8m4WMt+YWSNzVMr+lY8
         Zl2b+TMdTqRlQJXYaMLIjm6JTDTrzB2XK3rSzJe9qP+heO0a9tGdg30xbt1SbUG165ov
         GvFA==
X-Gm-Message-State: AOJu0YzaLL62n2A1Q8pxbSPxeA4ziWGFBjHMWkT8JJjQnwlxMxS91GRc
	paXLQajtkC1iv/vWmiEo4y9aBUH0LpecfPiXu/Q=
X-Google-Smtp-Source: AGHT+IH/HMFAxydrkEMFYuxK9he3HouJeVXMyhbN/52ouLgwyOM/DT9fH8WGP4znmOkhTzfFxyuOvw==
X-Received: by 2002:a05:6000:1817:b0:319:5234:5c92 with SMTP id m23-20020a056000181700b0031952345c92mr2363364wrh.35.1695238959777;
        Wed, 20 Sep 2023 12:42:39 -0700 (PDT)
Message-ID: <1967aed1-3c46-963c-687b-50feb09781aa@citrix.com>
Date: Wed, 20 Sep 2023 20:42:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v3 0/4] python: Support setuptools
Content-Language: en-GB
To: Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1695102101.git.javi.merino@cloud.com>
In-Reply-To: <cover.1695102101.git.javi.merino@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/09/2023 7:30 am, Javi Merino wrote:
> This series adds support for setuptools as distutils will be
> deprecated in python 3.12.
>
> Not done for this series:
>   - Andrew suggested simplifying the code in m4/python_devel.m4[0] and
>     this is not done yet.
>
> [0] https://lore.kernel.org/xen-devel/fdf87d82-aa3c-fd2e-6271-848f1a806fb2@citrix.com/
>
> Changes since v2:
>   - These containers used for gitlab ci were missing setuptools in the
>     previous series and now they have it:
>     * alpine/3.18-arm64v8
>     * opensuse-tumbleweed
>     * debian/bookworm-i386
>     * debian/bookworm-arm64v8
>   - These containers used for gitlab ci are being kept without
>     setuptools to test installations that don't have it:
>     * centos/7
>     * debian/stretch
>     * ubuntu/trusty
>     * ubuntu/xenial
>     * ubuntu/bionic
>   - Fix commit messages that talked about removing distutils support
>     as we are keeping it.
>   - Add my Signed-off-by to all commits
>   - Clarify in the readme that python's minimum version is 2.7.
>   - Fold the changes to the ./configure script into the patch that
>     changes `m4/python_devel.m4`.  Create ./configure using autoconf
>     2.69.
>
> Changes since v1:
>   - Update all containers to have setuptools, as python 3.12
>     deprecates distutils in favour of setuptools
>   - Keep python2's support by falling back to distutils if setuptools
>     is not installed
>   - Drop the commit about raising the baseline requirement for python,
>     as we keep supporting python2
>
> v1: https://lore.kernel.org/xen-devel/20230316171634.320626-1-marmarek@invisiblethingslab.com/
> v2: https://lore.kernel.org/xen-devel/cover.1694450145.git.javi.merino@cloud.com/
>
> Javi Merino (2):
>   automation: add python3's setuptools to containers
>   README: update to remove old note about the build system's python
>     expectation
>
> Marek Marczykowski-Górecki (2):
>   tools: convert setup.py to use setuptools
>   tools: don't use distutils in configure nor Makefile

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'll rebuild the containers and regenerate autoconf.

