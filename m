Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4136179CE16
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 12:19:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600327.935962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg0UK-0004MN-I0; Tue, 12 Sep 2023 10:19:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600327.935962; Tue, 12 Sep 2023 10:19:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg0UK-0004Ku-FK; Tue, 12 Sep 2023 10:19:20 +0000
Received: by outflank-mailman (input) for mailman id 600327;
 Tue, 12 Sep 2023 10:19:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mt1s=E4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qg0UJ-0004Jb-2d
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 10:19:19 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4319b25-5155-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 12:19:17 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-401b0d97850so59871215e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Sep 2023 03:19:17 -0700 (PDT)
Received: from [192.168.20.115] (ip-185-104-136-29.ptr.icomera.net.
 [185.104.136.29]) by smtp.gmail.com with ESMTPSA id
 r18-20020a5d6952000000b003141a3c4353sm12592111wrw.30.2023.09.12.03.19.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 03:19:16 -0700 (PDT)
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
X-Inumbo-ID: d4319b25-5155-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694513956; x=1695118756; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=27aNj847z6WP7Aj8LQYB9kh7/yLtTyxrvmLSUeUuS2k=;
        b=husyTaohEUSOtj+v29P9gAcPA6BZXkGLoSI2BzJbQt8QoYoAyZIRob6/bd3rVM4tXY
         MtPp0ZmY/yVqc57HkGSIAVubc8luk/jUjboepfqIG/FmYgoNq3QH+8EJjbveyjq4FRDw
         T/aIP+bBYUaqm+5Q4+MTnkophk9lnAdXS2OCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694513956; x=1695118756;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=27aNj847z6WP7Aj8LQYB9kh7/yLtTyxrvmLSUeUuS2k=;
        b=fLKX7sYRk/Yjdl0TXHlKkwH83XJ8JHKLOvzaInynTDBZ1HLa/0UOUR+NML1CQWQf9M
         IPihtX/0Ga3Dhhha51QVTXTNyaT4VCfys12OqgaiGTdZ5rH5BWY1tZs0+6VeMrEi6+5V
         FWb4k8Gi8Bl0fxEGRL6tWob8I19CtTB+8zZW1RlXafqvWghi9VuOpuCUDSOwYP6Hyewm
         /0SV8qUbyAYiIlgLe6gx9Y9Nq2JaTnx2l5O5vEY3GEn6fKPSp50LMZ4LL85PPLGTNjAe
         2c3guR//75K8InlvjVzSS9bTrm+M5CTJvXLFwgPw9/EeVblJ6r5omUYt4aJYgJllgJ/o
         Ndiw==
X-Gm-Message-State: AOJu0Yzo5na/e/NvhWB/GB3y2ifVjrYznLvHa3t7zfZjmJzC2KPJAXkZ
	cL613AQ5dCv00uesyercXYkMxA==
X-Google-Smtp-Source: AGHT+IEVV+ACr1rzlrFXz/xU7M9EDTs+jbmI0NZOOLdRAYYH67/9/VowHlGH5bpHkBD8qzpSH5738A==
X-Received: by 2002:a7b:c042:0:b0:401:aa8f:7573 with SMTP id u2-20020a7bc042000000b00401aa8f7573mr10929389wmc.6.1694513956566;
        Tue, 12 Sep 2023 03:19:16 -0700 (PDT)
Message-ID: <4a98d2d7-457a-020b-c936-d19b772b626e@citrix.com>
Date: Tue, 12 Sep 2023 11:18:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v2 1/5] automation: add python3's setuptools to
 containers
Content-Language: en-GB
To: Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 George Dunlap <george.dunlap@cloud.com>, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1694450145.git.javi.merino@cloud.com>
 <4f14ea4aeb44c234d9930578614a35234769fa41.1694450145.git.javi.merino@cloud.com>
In-Reply-To: <4f14ea4aeb44c234d9930578614a35234769fa41.1694450145.git.javi.merino@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/09/2023 5:51 pm, Javi Merino wrote:
> In preparation of dropping python distutils and moving to setuptools,
> add the python3 setuptools module to the containers that need it.
>
> The centos7 container was building using python2.  Change it to build
> python scripts using python3.
>
> Debian Stretch is no longer debian oldstable, so move to the archive
> repositories.
>
> Signed-off-by: Javi Merino <javi.merino@cloud.com>

We are not dropping distutils.  We're moving to support both distutils
and setuptools, because setuptools doesn't support the minimum version
of python that Xen supports.

Therefore, it's important to keep some of the containers on distutils
rather than switching all to setuptools.

CenOS can stay as is, as can Stretch and probably Bionic/Focal.

Any containers with Py3.10 or later definitely need to move, seeing as
distuils is formally deprecated there

It's sadly a little too early to make a Py3.12 container, which will
lack distutils, but we can come back to that in 4.19.

As Stefano points out, you should refresh at least some of the arm64
containers too.  RISC-V and PPC aren't set up for tools builds set, so
they're fine to leave.

~Andrew

