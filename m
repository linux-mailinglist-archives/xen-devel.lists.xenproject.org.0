Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4857E7940E0
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 17:57:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596706.930703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qduuK-0004NO-Jb; Wed, 06 Sep 2023 15:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596706.930703; Wed, 06 Sep 2023 15:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qduuK-0004KT-Fz; Wed, 06 Sep 2023 15:57:32 +0000
Received: by outflank-mailman (input) for mailman id 596706;
 Wed, 06 Sep 2023 15:57:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z0AC=EW=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qduuJ-000484-Cp
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 15:57:31 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1502e17f-4cce-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 17:57:29 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-402c46c49f4so295425e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Sep 2023 08:57:29 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 z17-20020a7bc7d1000000b003fbdbd0a7desm23105003wmk.27.2023.09.06.08.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 08:57:28 -0700 (PDT)
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
X-Inumbo-ID: 1502e17f-4cce-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694015849; x=1694620649; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4dVXiwVZicyHglN317uBSG6mEMzddD/hGrTGZqODuXs=;
        b=XdU4kFTZ+KX30zmkPDI8i7KeeK8uV6hpSdTQxWjfrb1abs/Zh4/q9B5CYg9YVsOK/C
         RH6b64Odt+gtH/jHbLbhVziZzKa8bs/fj+UKtf7zc+K3VxTRtFOQwrA97xHQz7h9yEkN
         qVLPeLGtnZJ5n2+Gae8/EbxDY2WfZTNjntnZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694015849; x=1694620649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dVXiwVZicyHglN317uBSG6mEMzddD/hGrTGZqODuXs=;
        b=dh0bLoACSNtPZHF+NiW+Y9Edv+g7p6kg7RcNes1FFiGWhjEI21PQJchTGDkaqghJRr
         tOQ+X6aw2vh2qJcWpXpe+hP6Xkn/KGnwy9vZ0HB/9BfXt+/wgJcftjToCtqujkvuiqM1
         vIXNFe8xyK0pGWezCnkdAtoY8j/U0RGwDgpyF+ko/x5BY+vMPu8yvxbdmXWckoyhiq0r
         4vpYR9rKzhIccqjhLR31rMhSzF72JSS23GlKJ+IFVHmKCSOaga/6K1R5W9VVFIzljTmW
         5TgF6HLhOd7ZbLPJw4XkiCBhrV5KYiH0y9O6aebRj6cuTEo72eV+92ajI0f0VQ2Y5lU8
         Z0AQ==
X-Gm-Message-State: AOJu0Yw8K/bbH8cWTCzdIXTlptWT1Q1RSwv+0IGvbH7VaCVtrignOS/X
	dd37PQJInaGujyWS+285xtdP0g==
X-Google-Smtp-Source: AGHT+IG3JXq3DlAWqoOIz3tzS5B05Vnllm4LO5KMDwEhtfs62GOpKk/PEssztM7odsQkhDRX9zs7Eg==
X-Received: by 2002:a7b:c4ce:0:b0:401:23fc:1f92 with SMTP id g14-20020a7bc4ce000000b0040123fc1f92mr2629063wmk.25.1694015849068;
        Wed, 06 Sep 2023 08:57:29 -0700 (PDT)
Date: Wed, 6 Sep 2023 16:57:28 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 1/2] xen: asm-generic support
Message-ID: <d6f68239-b918-4f6f-b287-b2a022aaf355@perard>
References: <cover.1693583721.git.oleksii.kurochko@gmail.com>
 <96b2a4ff48578b7b105581529d2aa6bebd8ad622.1693583721.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96b2a4ff48578b7b105581529d2aa6bebd8ad622.1693583721.git.oleksii.kurochko@gmail.com>

On Fri, Sep 01, 2023 at 07:02:14PM +0300, Oleksii Kurochko wrote:
> diff --git a/xen/Makefile b/xen/Makefile
> index f57e5a596c..698d6ddeb8 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -667,6 +669,12 @@ endif # need-sub-make
>  PHONY += FORCE
>  FORCE:
>  
> +# Support for using generic headers in asm-generic
> +PHONY += asm-generic
> +asm-generic:
> +	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.asm-generic \
> +	            obj=arch/$(SRCARCH)/include/generated/asm

Could you introduce a $(asm-generic) macro in Kbuild.include like we
already have for $(build) and $(clean)? As I think it would be nicer to
have
	$(Q)$(MAKE) $(asm-generic)=arch/$(SRCARCH)/include/generated/asm
in the main makefile.

Also, could you move the rule "asm-generic" within the "!config-build"
part of the Makefile? Somewhere around the rule for $(TARGET), maybe
just after the rule "_distclean".

Cheers,

-- 
Anthony PERARD

