Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F33614071
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 23:09:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433240.686149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opcxr-0003Sz-Gl; Mon, 31 Oct 2022 22:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433240.686149; Mon, 31 Oct 2022 22:09:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opcxr-0003QT-DT; Mon, 31 Oct 2022 22:09:03 +0000
Received: by outflank-mailman (input) for mailman id 433240;
 Mon, 31 Oct 2022 22:09:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tE5W=3A=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1opcxq-0003QN-D4
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 22:09:02 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9fd04e0f-5968-11ed-91b5-6bf2151ebd3b;
 Mon, 31 Oct 2022 23:09:01 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so8907839wmb.0
 for <xen-devel@lists.xenproject.org>; Mon, 31 Oct 2022 15:09:01 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a05600c0a1100b003b492753826sm8508549wmp.43.2022.10.31.15.08.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 15:08:59 -0700 (PDT)
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
X-Inumbo-ID: 9fd04e0f-5968-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LyQShnvoJM7z9hDlodIpAOjZgHnaO9r8jiYZc/6MZBk=;
        b=mIrr1FJvWRAC4HmeE9iDwrehh2t7ieXggNwccLDO49TCTUgu+ATdQYxZG0d57XYsU5
         dUyfZOvp0PE38aUxByqtRb5L5sbJTLC+WlftxMdhbprHhqpx8gLkbsRQmohbkEJBo2Rp
         bFLSwTq/XL4UT2OdHLDqr2BUNATB10yO4DPVxkuYpgGXj2QhG61HGE0RjQ5PfFxqkyS7
         RQvQLUm3cyG1aaIZa/xzTI6ORokWu1Ik3JmxM16o53RZI26oXLcxU9J2lGvkpYVERgkf
         dUnp0+cIGihV4hrvz2l5iWGre2M0vNddAcnD26F5yFdHObssUOaTXpBVFSED0wU/AA/N
         yxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LyQShnvoJM7z9hDlodIpAOjZgHnaO9r8jiYZc/6MZBk=;
        b=OPIOVUpEOWK2RRQ6HzeOCISUJcqh5cAuOdBh47p7cGb7/FMDqPQE7hmaLr1g/PQRoz
         sMZXr6gudF+JyzrgRC7O72p9Ir3JlasOVAtpZMKmfp8KoA1bCm4pCTuIXjUgoLsjKcrS
         S+OxnF+Mrluo47BK+Liqnn6cqDuCAqmw0tkoQdqHNG+DLZCQ1T1SBryQOzusCTK2cI9M
         fJzjHLDKSQ4zX4XrGtwOox9+awizwS2DM0k9mIxrn8VAJSlf+/pA6S4fOYzpmecDOZfe
         y0tt51uW9dfBXah8buMkK49j4XBIpe5Eg/UeC/tmkOAYbG8IUrgZJqfDoIWcB2ycIzUW
         lukA==
X-Gm-Message-State: ACrzQf3Vn23DcEGH/gEXXahqeQkxKT/m6Yl7rAQrZ3Npf//NUkXACFlY
	OwFsm4U5Z8ZN3jHagGoqBTExEQ==
X-Google-Smtp-Source: AMsMyM6DqV2a/e9jZ/s6CrUQ1j2rP0SxUQe5cljzbansYROltu/j3dGAfGioiDY1OQETpZMr9IGCeg==
X-Received: by 2002:a05:600c:4e45:b0:3cf:3e69:9351 with SMTP id e5-20020a05600c4e4500b003cf3e699351mr20182478wmq.2.1667254140857;
        Mon, 31 Oct 2022 15:09:00 -0700 (PDT)
Message-ID: <dccf8560-a4db-53e4-418e-402ba76d7570@linaro.org>
Date: Mon, 31 Oct 2022 23:08:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v4 1/2] xen/pt: fix syntax error that causes FTBFS in some
 configurations
Content-Language: en-US
To: Chuck Zmudzinski <brchuckz@aol.com>, qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <cover.1667242033.git.brchuckz@aol.com>
 <5f1342a13c09af77b1a7b0aeaba5955bcea89731.1667242033.git.brchuckz@aol.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <5f1342a13c09af77b1a7b0aeaba5955bcea89731.1667242033.git.brchuckz@aol.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 31/10/22 22:35, Chuck Zmudzinski wrote:
> When Qemu is built with --enable-xen and --disable-xen-pci-passthrough
> and the target os is linux, the build fails with:
> 
> meson.build:3477:2: ERROR: File xen_pt_stub.c does not exist.
> 
> Fixes: 582ea95f5f93 ("meson: convert hw/xen")
> 
> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
> ---
> v2: Remove From: <email address> tag at top of commit message
> 
> v3: No change to this patch since v2
> 
> v4: Use brchuckz@aol.com instead of brchuckz@netscape.net for the author's
>      email address to match the address used by the same author in commits
>      be9c61da and c0e86b76
> 
>   hw/xen/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/xen/meson.build b/hw/xen/meson.build
> index 08dc1f6857..ae0ace3046 100644
> --- a/hw/xen/meson.build
> +++ b/hw/xen/meson.build
> @@ -18,7 +18,7 @@ if have_xen_pci_passthrough
>       'xen_pt_msi.c',
>     ))
>   else
> -  xen_specific_ss.add('xen_pt_stub.c')
> +  xen_specific_ss.add(files('xen_pt_stub.c'))
>   endif
>   
>   specific_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_specific_ss)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


