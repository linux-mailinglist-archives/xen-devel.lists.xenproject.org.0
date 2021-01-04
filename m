Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 335552E9295
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 10:28:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61034.107088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwMAJ-00036r-Nj; Mon, 04 Jan 2021 09:28:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61034.107088; Mon, 04 Jan 2021 09:28:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwMAJ-00036S-KB; Mon, 04 Jan 2021 09:28:39 +0000
Received: by outflank-mailman (input) for mailman id 61034;
 Mon, 04 Jan 2021 09:28:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AAMM=GH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kwMAH-00036N-Mc
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 09:28:37 +0000
Received: from mail-wr1-x42d.google.com (unknown [2a00:1450:4864:20::42d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c78426a-f29c-438c-b06e-0f42d650be2c;
 Mon, 04 Jan 2021 09:28:36 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id 91so31421962wrj.7
 for <xen-devel@lists.xenproject.org>; Mon, 04 Jan 2021 01:28:36 -0800 (PST)
Received: from CBGR90WXYV0 (host86-165-42-133.range86-165.btcentralplus.com.
 [86.165.42.133])
 by smtp.gmail.com with ESMTPSA id r2sm90323955wrn.83.2021.01.04.01.28.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 Jan 2021 01:28:35 -0800 (PST)
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
X-Inumbo-ID: 6c78426a-f29c-438c-b06e-0f42d650be2c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=iGNng4Hg1jfuvBKz+O8Pd6DG7R4B7mgDsA/LrrbdQdg=;
        b=FgZ6kaFtkSiYUuj1e795Wxiu42CUpQl089V2tAOEjrx1kdjsw8dxiM2CVooiAj6+mj
         J/9XDSYgKGaWro4ravM1RzHFU43CbiDeftoAjXkiIu7j+dx7ZxBj/eGl64uE0/KQ4MuD
         jbHa7s1D4viLapNXJgWpjT0nCidYv6xuOkRMIX9WN0FI6Qxbmhh8Hj2Z6WxbS5Ym/I58
         pRfUX5u6bIyK7x5BImDI/mzdrgpZ59dXDyurp6QzjC1xzHilBkeSzMThSMsPkreoqlGZ
         MJ+8gJOmT845viC2LytX87bg3rnWQR8sdp0b02ukMlCq85DXQka6ItMdGSQ/oDUzFIPW
         AD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=iGNng4Hg1jfuvBKz+O8Pd6DG7R4B7mgDsA/LrrbdQdg=;
        b=QtTRayH+/EgajuhtXcvw52p6WeWEPswE/+kmq6Tdd/h64RUX93VNYYqhMPgXhgKeGu
         JemmBh1MFVEeE3x8uKdyps7QHCHiltYXUMrdPrivETKLM+p+Qfn2U5o7Eyp5kRGy2HOB
         C3r94jdAtohS7BnUVd8FzUD7MiDsN1YAHveSxOSk2ROooTBkPEcDz6Jnnhap7DLzicfT
         PG7fjhXh6ZDj03qmGqYAQD2Z+AipZ3Gm33fdEpfyJH57SeaIlPm6ncZP+3+zGJLrTw82
         yRIZ6Q/nfd73WBQY/nDzQrBHb90FzvSzCTCdUf7/Ao8l4cW5Ir5Pd7kv8ce2XtSXXsiR
         QsQw==
X-Gm-Message-State: AOAM531d1Pd1qNH7QtPpyDJasexK6d8WIS1/yKxYiprbRKWYD1+mcWDt
	3lQhOw3kBEb+uHWlEW2agfQ=
X-Google-Smtp-Source: ABdhPJwwQmXrSdt5eRfdrvIbQOTK4WhLVgcytOUKX+tsOdHCj/WO2yf9G/QO4mrwxtB3zyQY5lkdUA==
X-Received: by 2002:a5d:43cc:: with SMTP id v12mr52437853wrr.319.1609752516009;
        Mon, 04 Jan 2021 01:28:36 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
	<xen-devel@lists.xenproject.org>
Cc: <hongyxia@amazon.co.uk>,
	"'Julien Grall'" <jgrall@amazon.com>,
	"'Jan Beulich'" <jbeulich@suse.com>
References: <20201222154338.9459-1-julien@xen.org> <20201222154338.9459-2-julien@xen.org>
In-Reply-To: <20201222154338.9459-2-julien@xen.org>
Subject: RE: [PATCH for-4.15 1/4] xen/iommu: Check if the IOMMU was initialized before tearing down
Date: Mon, 4 Jan 2021 09:28:34 -0000
Message-ID: <002301d6e27b$f9eaae90$edc00bb0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQH2TO5SqTDQ1dUiy31gxFMl+4NKXAJy9PyCqcTFpjA=

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Sent: 22 December 2020 15:44
> To: xen-devel@lists.xenproject.org
> Cc: hongyxia@amazon.co.uk; Julien Grall <jgrall@amazon.com>; Jan Beulich <jbeulich@suse.com>; Paul
> Durrant <paul@xen.org>
> Subject: [PATCH for-4.15 1/4] xen/iommu: Check if the IOMMU was initialized before tearing down
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> is_iommu_enabled() will return true even if the IOMMU has not been
> initialized (e.g. the ops are not set).
> 
> In the case of an early failure in arch_domain_init(), the function
> iommu_destroy_domain() will be called even if the IOMMU is initialized.
> 
> This will result to dereference the ops which will be NULL and an host
> crash.
> 
> Fix the issue by checking that ops has been set before accessing it.
> Note that we are assuming that arch_iommu_domain_init() will cleanup an
> intermediate failure if it failed.
> 
> Fixes: 71e617a6b8f6 ("use is_iommu_enabled() where appropriate...")
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>  xen/drivers/passthrough/iommu.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
> index 2358b6eb09f4..f976d5a0b0a5 100644
> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -226,7 +226,15 @@ static void iommu_teardown(struct domain *d)
> 
>  void iommu_domain_destroy(struct domain *d)
>  {
> -    if ( !is_iommu_enabled(d) )
> +    struct domain_iommu *hd = dom_iommu(d);
> +
> +    /*
> +     * In case of failure during the domain construction, it would be
> +     * possible to reach this function with the IOMMU enabled but not
> +     * yet initialized. We assume that hd->platforms will be non-NULL as
> +     * soon as we start to initialize the IOMMU.
> +     */
> +    if ( !is_iommu_enabled(d) || !hd->platform_ops )
>          return;

TBH, this seems like the wrong way to fix it. The ops dereference is done in iommu_teardown() so that ought to be doing the check,
but given it is single line function then it could be inlined at the same time. That said, I think arch_iommu_domain_destroy() needs
to be call unconditionally as it arch_iommu_domain_init() is called before the ops pointer is set.

  Paul

> 
>      iommu_teardown(d);
> --
> 2.17.1



