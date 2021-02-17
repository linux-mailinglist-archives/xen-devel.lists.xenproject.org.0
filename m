Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3DA31DB81
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 15:32:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86297.161923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCNrw-0006k0-Ti; Wed, 17 Feb 2021 14:31:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86297.161923; Wed, 17 Feb 2021 14:31:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCNrw-0006jb-QN; Wed, 17 Feb 2021 14:31:56 +0000
Received: by outflank-mailman (input) for mailman id 86297;
 Wed, 17 Feb 2021 14:31:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GfGR=HT=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1lCNrv-0006jW-Oo
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 14:31:55 +0000
Received: from mail-wr1-x432.google.com (unknown [2a00:1450:4864:20::432])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef74b978-a6b5-4adb-8a5e-9912f77cc903;
 Wed, 17 Feb 2021 14:31:54 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id g6so17596810wrs.11
 for <xen-devel@lists.xenproject.org>; Wed, 17 Feb 2021 06:31:54 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f14sm3183012wmc.32.2021.02.17.06.31.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Feb 2021 06:31:53 -0800 (PST)
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
X-Inumbo-ID: ef74b978-a6b5-4adb-8a5e-9912f77cc903
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BHNj0CsMa8fBSRbxi+Me5az+imrRkM91kLCrLrDQvAA=;
        b=RkKkcOCsCXWjZNtTrohUTRVjmHmeqePt0CR5mWa8AjZQDEcn4wCQT9VbjL6XWj1zz6
         Xu1/MV+8SUi31koMrWxrOPw/BJNraCbgEs9uZ4lP29GPqJQWcbq4/EI7y3JshdOZ43K0
         Ol0eLHEe9MqOwWnIbcGm9fghtTF8KYJ/jGlOLlAzR03Re7cSYc7MnoLVJcyfnpANEz9C
         43ajeTmAhhF/xtHKBcNkDTCFaBRz43cakBojyQq+paTwjtuKs5RgFkvUg1pi3OgzKcDY
         0osS45Jfe5PG1YqiYJwzIH9x9A+DCU2YqMzeHdQvu5qOzrRDmWjD9YkMxKnIQXWM/ODT
         ZHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BHNj0CsMa8fBSRbxi+Me5az+imrRkM91kLCrLrDQvAA=;
        b=nHkhXiOIyJ1NGJi2KSYFLLWVfpiCX9wQLdtOuE0xTSRd+FN+HUczSsHxL5AZSp4+sl
         VLZ/kXViP+PPMbG8CFhOAaiIitKxSKXl+KFwTdzSWx8Zttqkhetqnwoq87eG9fyJs61K
         exmDDQNH1zpQUKHcJSTYKRs8PzrXJIE4Hs079mfriVCHIiJLQMxD1Fd1VItEhi5YJREL
         8l+vtl6y4B8Dp4GpmKnZgYKkzmhscSHp5raeqzD5Uva45V6zWZ9QiReson8ogK4xMiPM
         0IA+PkS7gOFX+XHxRjwzBAJ0ed6hho3Yq3z36C4JgtoqTIGdfhSgGMW9HvmCLJLZQ16/
         YzTA==
X-Gm-Message-State: AOAM530nuf7/80YYn3/h3YPEPgTQrbwQthjoOEEQ7690/tLs0u6NW6YH
	8N4enHzUmQi8RxSC+JiN2uM=
X-Google-Smtp-Source: ABdhPJwwpnlY8JJhdMQeN9JKBjWyuJTspQXY6pyTHoJ9TDkPo2M5y1c0t9Zqctp5xYzHnvaUxDoegw==
X-Received: by 2002:adf:a2c2:: with SMTP id t2mr10810395wra.47.1613572314058;
        Wed, 17 Feb 2021 06:31:54 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 7/7] tests/avocado: add boot_xen tests
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: julien@xen.org, stefano.stabellini@linaro.org,
 stefano.stabellini@xilinx.com, andre.przywara@arm.com,
 stratos-dev@op-lists.linaro.org, xen-devel@lists.xenproject.org,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20210211171945.18313-1-alex.bennee@linaro.org>
 <20210211171945.18313-8-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <16d8366f-6f94-3a97-b9e0-9962e3d173a1@amsat.org>
Date: Wed, 17 Feb 2021 15:31:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210211171945.18313-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2/11/21 6:19 PM, Alex Bennée wrote:
> These tests make sure we can boot the Xen hypervisor with a Dom0
> kernel using the guest-loader. We currently have to use a kernel I
> built myself because there are issues using the Debian kernel images.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  MAINTAINERS                  |   1 +
>  tests/acceptance/boot_xen.py | 117 +++++++++++++++++++++++++++++++++++
>  2 files changed, 118 insertions(+)
>  create mode 100644 tests/acceptance/boot_xen.py

> diff --git a/tests/acceptance/boot_xen.py b/tests/acceptance/boot_xen.py
> new file mode 100644
> index 0000000000..8c7e091d40
> --- /dev/null
> +++ b/tests/acceptance/boot_xen.py
> @@ -0,0 +1,117 @@
> +# Functional test that boots a Xen hypervisor with a domU kernel and
> +# checks the console output is vaguely sane .
> +#
> +# Copyright (c) 2020 Linaro

2021?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

