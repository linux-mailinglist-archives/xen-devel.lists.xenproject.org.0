Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B99379C88D
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 09:49:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600065.935655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfy91-0002MQ-A4; Tue, 12 Sep 2023 07:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600065.935655; Tue, 12 Sep 2023 07:49:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfy91-0002JI-71; Tue, 12 Sep 2023 07:49:11 +0000
Received: by outflank-mailman (input) for mailman id 600065;
 Tue, 12 Sep 2023 07:49:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mt1s=E4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qfy90-0002JC-Fb
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 07:49:10 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db03b980-5140-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 09:49:09 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-52a39a1c4d5so6888394a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Sep 2023 00:49:09 -0700 (PDT)
Received: from ?IPV6:2a00:23ee:2268:14f6:b091:f7c8:1de5:3557?
 ([2a00:23ee:2268:14f6:b091:f7c8:1de5:3557])
 by smtp.gmail.com with ESMTPSA id
 u7-20020aa7d887000000b00528922bb53bsm5591251edq.76.2023.09.12.00.49.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 00:49:08 -0700 (PDT)
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
X-Inumbo-ID: db03b980-5140-11ee-8786-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694504948; x=1695109748; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LFoeJyuDNYmsVzyLgPqxuj538kgGRR1ep+RzZPtdOZc=;
        b=BJrSobhfgwvsDMiW9dz53izGIJrfde4OzV3RpGGeW0JnKUi28L5x2cPP+7+VrkS+BC
         tA1QPRhqeApJunixAyUxpOJDIUCHW60TVJhBCCce7qZx4CQh61b3oF4YVD7wTFjNq/lm
         k1HLAjf0IuJ9ATfU0T5gQy4qa6CqIEmYzYe4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694504948; x=1695109748;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LFoeJyuDNYmsVzyLgPqxuj538kgGRR1ep+RzZPtdOZc=;
        b=Wyxomq+PStHKpzqL0vUrbwfFgI2TYWIuqHizWPsUWmJndfQ+tdWQgIE3hbVis1b5VY
         rVlUws+Y66w1Zm8p4+amyURZpVsyhmb0hkKzIK2I5eAJhondlSjP8WUANG4MMTfcsQsh
         bjaNVVfpHj5tqm8U0CgwEQZWyeegqVTtQnG6Dtj7vSOWjQzSNMhIojWj/vCr+xiixBWq
         OLjIf4FXxmu3EGzFfblzMlBY3A9/R9Uk+TBJ0PWZiztPHhpqUBAk9gY6qGuYCDaq99wE
         TtcP+CuMl+ZXWZrtjiGbr7pHjlToNcWkokjBiwoJehcW7Xm2OF4y4uajUOSq/AwqpKYR
         j5Sw==
X-Gm-Message-State: AOJu0YyqjxI5mWkbBASBtvwp1RiJfCg34CLkzuuPvOSgjo10h4LaH3Rg
	xVx1aOx5HFrBwXDR60fx6Vdcag==
X-Google-Smtp-Source: AGHT+IFonrDgS41pAD2weVB12F9LENbDq+Btlhv5PCU5tIlJodAgOyRbG8ssS33YUahXaopGDwOCVQ==
X-Received: by 2002:aa7:d14e:0:b0:523:33d7:e324 with SMTP id r14-20020aa7d14e000000b0052333d7e324mr10239030edo.38.1694504948462;
        Tue, 12 Sep 2023 00:49:08 -0700 (PDT)
Message-ID: <06fbfb18-cc1e-4f73-bdf7-8b2be1f92de5@citrix.com>
Date: Tue, 12 Sep 2023 08:49:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v2 0/5] python: Use setuptools instead of the
 deprecated distutils
Content-Language: en-GB
To: Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 George Dunlap <george.dunlap@cloud.com>
References: <cover.1694450145.git.javi.merino@cloud.com>
In-Reply-To: <cover.1694450145.git.javi.merino@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/09/2023 5:50 pm, Javi Merino wrote:
> This series picks up Marek's v1 from
> https://lore.kernel.org/xen-devel/20230316171634.320626-1-marmarek@invisiblethingslab.com/
> Changes since v1:
>   - Update all containers to have setuptools, as python 3.12 depecrates distutils in favour of setuptools
>   - Keep python2's support by falling back to distutils if setuptools is not installed
>   - Drop the commit about raising the baseline requirement for python, as we keep supporting python2
>
> Javi Merino (2):
>   automation: add python3's setuptools to containers
>   README: update to remove old note about the build system's python
>     expectation
>
> Marek Marczykowski-Górecki (3):
>   tools: convert setup.py to use setuptools
>   tools: don't use distutils in configure nor Makefile
>   tools: regenerate configure

Two general notes.

First, because you've (re)arranged and posted this series, you need to
add your own Signed-off-by line to all patches, even unmodified ones
Marek's that you've included.  SoB needs to be from everyone involved in
handling the patch.

Second, patch 4 should be dropped, and a note put in patch 2 to the
committer, who will use autoconf 2.69 and have a far far smaller delta
to include.

~Andrew

