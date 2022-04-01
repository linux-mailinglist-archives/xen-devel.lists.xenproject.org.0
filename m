Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B65C4EF222
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 16:53:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297485.506798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naIeB-0003kX-A7; Fri, 01 Apr 2022 14:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297485.506798; Fri, 01 Apr 2022 14:53:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naIeB-0003hv-6s; Fri, 01 Apr 2022 14:53:07 +0000
Received: by outflank-mailman (input) for mailman id 297485;
 Fri, 01 Apr 2022 14:53:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i2D4=UL=kernel.org=robh+dt@srs-se1.protection.inumbo.net>)
 id 1naIeA-00036s-2d
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 14:53:06 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f153ea0-b1cb-11ec-a405-831a346695d4;
 Fri, 01 Apr 2022 16:53:05 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4B4A8B82410
 for <xen-devel@lists.xenproject.org>; Fri,  1 Apr 2022 14:53:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEA28C340F2
 for <xen-devel@lists.xenproject.org>; Fri,  1 Apr 2022 14:53:01 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id p22so3439371iod.2
 for <xen-devel@lists.xenproject.org>; Fri, 01 Apr 2022 07:53:01 -0700 (PDT)
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
X-Inumbo-ID: 6f153ea0-b1cb-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648824782;
	bh=/qJ5e8ApNXEslgZif3A+1qHL8sGqL8BHZ/5lwZBrzOM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eacsIzo2gGzLlcXr8aw/dfGWXvNK75+a417SQ6aMoBLmz1QicDGTOapgxufpt5xRy
	 lmOjT1gr1+guHHNmH9dCQWKVNa56c0rcTBbKp+v+EgoGLirpgxWbkibzx93NXD04ql
	 oFIOJ4HXR+Es2wXEaLLUsBAAvWQZPCBqWJPB/iijdCO7/hPMCRPT77LZHBT7lqa/Hn
	 VfDb1LnjwXZ5RSjBvU1B8ronPoIMdHIqTNrvl7vgWkto6UQvtFtYSdBC59MPTOdi4T
	 4NuaNxUc1ALOK4izHK+Vm0TGpolM2E1ZErrTPysPPCpNKMScwF7o5JO2ZhirUGR5i6
	 dBgYyrzuIMg8g==
X-Gm-Message-State: AOAM530NX6eqJy+ONRDHmTafFrfQ8/hNDYwrlVqtfs7/G9YJ4NQ1Zyy2
	Wk5u1resmQ2xW6XUUIVQzre1c77U7TBnbF/h7A==
X-Google-Smtp-Source: ABdhPJztqb7hywLo6jomiCi/xpWuP4Ps8FDR3Hi5OQUdcpkAmfwo4X57RxkU30wbPhT0Ng8yQ8uNFR2Z1JL0f/H8FMA=
X-Received: by 2002:a02:1107:0:b0:321:78dc:890d with SMTP id
 7-20020a021107000000b0032178dc890dmr6112922jaf.236.1648824781026; Fri, 01 Apr
 2022 07:53:01 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.22.394.2203311740450.2910984@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2203311740450.2910984@ubuntu-linux-20-04-desktop>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 1 Apr 2022 09:52:49 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+udUpUK3y7WOeLF2dtGs0=Jz59ed0mu_sgzstB-=TDzA@mail.gmail.com>
Message-ID: <CAL_Jsq+udUpUK3y7WOeLF2dtGs0=Jz59ed0mu_sgzstB-=TDzA@mail.gmail.com>
Subject: Re: [PATCH] of: of_property_read_string return -ENODATA when !length
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, 
	Julien Grall <julien@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 31, 2022 at 7:46 PM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
>
> When the length of the string is zero of_property_read_string should
> return -ENODATA according to the description of the function.

Perhaps it is a difference of:

prop;

vs.

prop = "";

Both are 0 length by some definition. The description, '-ENODATA if
property does not have a value', matches the first case.

>
> However, of_property_read_string doesn't check pp->length. If pp->length
> is zero, return -ENODATA.
>
> Without this patch the following command in u-boot:
>
> fdt set /chosen/node property-name
>
> results in of_property_read_string returning -EILSEQ when attempting to
> read property-name. With this patch, it returns -ENODATA as expected.

Why do you care? Do you have a user? There could be an in tree user
that doesn't like this change.

>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 8e90071de6ed..da0f02c98bb2 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -439,7 +439,7 @@ int of_property_read_string(const struct device_node *np, const char *propname,
>         const struct property *prop = of_find_property(np, propname, NULL);
>         if (!prop)
>                 return -EINVAL;
> -       if (!prop->value)
> +       if (!prop->value || !pp->length)
>                 return -ENODATA;
>         if (strnlen(prop->value, prop->length) >= prop->length)
>                 return -EILSEQ;

