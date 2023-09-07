Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD0B79716F
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 12:09:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597237.931446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeBwJ-0007CR-Gh; Thu, 07 Sep 2023 10:08:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597237.931446; Thu, 07 Sep 2023 10:08:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeBwJ-0007Ak-Dw; Thu, 07 Sep 2023 10:08:43 +0000
Received: by outflank-mailman (input) for mailman id 597237;
 Thu, 07 Sep 2023 10:08:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M1vp=EX=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qeBwI-0007Ae-M0
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 10:08:42 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85828378-4d66-11ee-8783-cb3800f73035;
 Thu, 07 Sep 2023 12:08:41 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2bcc846fed0so13718361fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Sep 2023 03:08:41 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f12-20020adffccc000000b003143c9beeaesm22808246wrs.44.2023.09.07.03.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 03:08:40 -0700 (PDT)
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
X-Inumbo-ID: 85828378-4d66-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694081321; x=1694686121; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SQ7cbfce1+uotZKX8z4AhwBcLc/vYiFWCQ+B7u0cbio=;
        b=rPPOp0cdB5SthnFaWwBpjiOFXIn0mkHUpOl5Tabq62Lvf7p3jtnbTR6aMY0OOVhC2u
         p+N87wEbGFU8Mo0z7N+FwfkJQkRAM/TcNzrGQdW+Cqtu75UYSwl6X1xmy4wmPFXqkQv2
         fns3Sk0BoZUry23nUvj4foxTqmrVic79U8Ia8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694081321; x=1694686121;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQ7cbfce1+uotZKX8z4AhwBcLc/vYiFWCQ+B7u0cbio=;
        b=Iy7JN3CzHpNJema50qhcoprDe2kJjuroOgecYIQ6SlhqQKwCRgJKV4Tov/MSa7a8x7
         LhaWtjSeqUcIs6qRo1bRrIe4XsAe7pwS68d9bCm60AmmY26o+AUnnX7FvLnX+9m1K9gD
         PIofwbzWG953eOFn9/T0rxjq3rT/JvVVX3kZ3SPOa49gZbpQzXGfLs4D1MHk31EG7+Y8
         5jzI/rnzTjogFeZj5CFfuX0ENwrhXZnx5YDeajJNiZLCOH45OAqaR9FDqf/ZnzvKUC7q
         Hcg3AvkqIy68yQFChYXuU41UZs7kuDKlTlw0swTcho3qx9Z/7Np+Q13PWxnGq8uUlOkh
         qePQ==
X-Gm-Message-State: AOJu0YyS5p8tFOLiiAQlLhVnEk6Xz1TT9zNhVe5LGaF/cvons0qBHIZG
	tG3BXKz2WuwINHTHoFYkKhMHIw==
X-Google-Smtp-Source: AGHT+IGgEmnu1qCHLP2MZ4XHiu/FcQAoIh9W7W8DXfoppHbzrlXCYdsUi6KIJNvOXBGpAfG7Bp+Whw==
X-Received: by 2002:a2e:9047:0:b0:2b6:df23:2117 with SMTP id n7-20020a2e9047000000b002b6df232117mr4443683ljg.43.1694081321155;
        Thu, 07 Sep 2023 03:08:41 -0700 (PDT)
Date: Thu, 7 Sep 2023 11:08:40 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v6 1/2] xen: asm-generic support
Message-ID: <11cca5d8-5456-4908-b1be-1664f39fb134@perard>
References: <cover.1694078544.git.oleksii.kurochko@gmail.com>
 <cf5f446915bd5c8980beda22718efff32678e16b.1694078544.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf5f446915bd5c8980beda22718efff32678e16b.1694078544.git.oleksii.kurochko@gmail.com>

On Thu, Sep 07, 2023 at 12:32:56PM +0300, Oleksii Kurochko wrote:
> diff --git a/xen/scripts/Makefile.asm-generic b/xen/scripts/Makefile.asm-generic
> new file mode 100644
> index 0000000000..92a3a741c5
> --- /dev/null
> +++ b/xen/scripts/Makefile.asm-generic
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +# include/asm-generic contains a lot of files that are used
> +# verbatim by several architectures.
> +#
> +# This Makefile reads the file arch/$(SRCARCH)/include/asm/Makefile
> +# and for each file listed in this file with generic-y creates
> +# a small wrapper file in arch/$(SRCARCH)/include/generated/asm.
> +
> +PHONY := all
> +all:
> +
> +src := $(subst /generated,,$(obj))
> +
> +include $(srctree)/scripts/Kbuild.include
> +-include $(src)/Makefile
> +
> +redundant := $(filter $(mandatory-y) $(generated-y), $(generic-y))
> +redundant += $(foreach f, $(generic-y), $(if $(wildcard $(srctree)/$(src)/$(f)),$(f)))
> +redundant := $(sort $(redundant))
> +$(if $(redundant),\
> +	$(warning redundant generic-y found in $(src)/Kbuild: $(redundant)))

This warning would need to say "$(src)/Makefile" now instead of Kbuild.

Beside this, patch looks fine to me:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

