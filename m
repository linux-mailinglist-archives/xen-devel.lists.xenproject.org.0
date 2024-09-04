Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDF896B3DE
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 10:04:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789885.1199547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sll0D-0007PM-VJ; Wed, 04 Sep 2024 08:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789885.1199547; Wed, 04 Sep 2024 08:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sll0D-0007NP-SH; Wed, 04 Sep 2024 08:04:33 +0000
Received: by outflank-mailman (input) for mailman id 789885;
 Wed, 04 Sep 2024 08:04:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sll0C-0007NH-RA
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 08:04:32 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50d32a0a-6a94-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 10:04:31 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c3ca32974fso18437a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 01:04:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226c6a36fsm7294054a12.16.2024.09.04.01.04.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 01:04:30 -0700 (PDT)
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
X-Inumbo-ID: 50d32a0a-6a94-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725437071; x=1726041871; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ea+d9XvOqJz7BZp3H6z2amnakkYxChhiHcchi6N2NlM=;
        b=HExcq0VXjaBkZMToPfyhfdx/9qU51NmvUs+olE+BElgZCPN+FpJCONN0/GyyPg0I0i
         /BdB3BZEKlC/s83i/WQa1wMgnRsf19KINyTelGlV1KbUT8I2KwXz0Pq17RTlCKofiBY5
         27IZOZpXzWndkeLv1xcAt5f1qLg1sTIOBDsdX778jRnNsCeSKMbRCdxRi91bfyN2xJyT
         AEj0AUDmo/+XmIuv+COLCyl1OujVdYkejAYk6xfM4N9JJjtQUl25Nn2G+yCvbEA+Zu1i
         WFpNCK2rjgU6TobM1lQWNPi5qCLrA1t22iXrUpER5YT7pHLSgapC1sMkwiMMKQ7SS46q
         BmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725437071; x=1726041871;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ea+d9XvOqJz7BZp3H6z2amnakkYxChhiHcchi6N2NlM=;
        b=nyceVpg0HYjXlhgIladD96nLC5SlZVJr3BVZaNi5Lx/haR1bqu7TSn8HXzY272B4m5
         lFisV9mCOKXLTlQXhgEDP9lqXWm9RteCJjFePROTGprwNGj8W0aiTwuh08thGNDu0oSk
         6mx4EwcL/EL5RDDiZekuTZQp9pe642okmIdxM1QeqWoF3qjII0WLTt6eFPi5La/qTQbX
         iTXOZjk8sxrLjRu5NEor72QpvYpOtcqbbNif8l1tgRrU8xxy0Sh5wdIL9xai+rqiWN4Q
         CgyiXQNNc5QLefKXCfsmwlWkaILCLUzEQeQSW6nweJ8alvzEE6EFkMCvCGQGG1aBJAXK
         AAQA==
X-Gm-Message-State: AOJu0Yx2VT0SUW70NDS5tv+CxkwIpmQR0zi0AjeVqYxP2x1RvdHq27zS
	8ZWRkgsR903xezPsP+ljXMoHiE+ltu/umtgGkikQgGz2CIW6BpvWzTpek2y6Lw==
X-Google-Smtp-Source: AGHT+IF+RhAS6HXEjwJKD54orGNUG6FVcaJrbMtgH5LjukygczTjfook3p+ciVGGqily98YJ3Ct1og==
X-Received: by 2002:a05:6402:520b:b0:5c2:5251:bae5 with SMTP id 4fb4d7f45d1cf-5c25251bb42mr7859152a12.9.1725437070855;
        Wed, 04 Sep 2024 01:04:30 -0700 (PDT)
Message-ID: <0d08d8b3-cf25-4ced-88cd-91dc810b4204@suse.com>
Date: Wed, 4 Sep 2024 10:04:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Ping: [PATCH v3] mktarball: only archive Xen
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <14f8887b-1f66-428e-8417-f552b8851c71@suse.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <14f8887b-1f66-428e-8417-f552b8851c71@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.08.2024 17:10, Jan Beulich wrote:
> As was basically decided already a while ago, remove - in the simplest
> possible way - the archiving of both qemu-s and mini-os from tarball
> generation.
> 
> With this the subtree-force-update-all prereq isn't needed anymore in
> the top level Makefile. That goal, including the respective ones
> underneath tools/, then also are unreferenced and hence are being
> dropped, too.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> This is the simplistic approach; I'm sure this could now be done quite a
> bit more efficiently. I also expect there's no longer a need to run
> ./configure ahead of the invocation of this script, but since I have no
> idea why it was needed earlier on, I'm not removing that here from the
> doc. IOW all cleanup that's probably better done separately, by someone
> actually using all of that machinery.
> ---
> v3: Drop subtree-force-update-all rules from underneath tools/.
> v2: Drop subtree-force-update-all prereqs from ./Makefile.

Are any further adjustments needed?

Jan

> --- a/Makefile
> +++ b/Makefile
> @@ -200,10 +200,6 @@ rpmball: dist
>  subtree-force-update: mini-os-dir-force-update
>  	$(MAKE) -C tools subtree-force-update
>  
> -.PHONY: subtree-force-update-all
> -subtree-force-update-all: mini-os-dir-force-update
> -	$(MAKE) -C tools subtree-force-update-all
> -
>  # Make a source tarball, including qemu sub-trees.
>  #
>  # src-tarball will use "git describe" for the version number.  This
> @@ -214,11 +210,11 @@ subtree-force-update-all: mini-os-dir-fo
>  # src-tarball-release will use "make xenversion" as the version
>  # number.  This is suitable for release tarballs.
>  .PHONY: src-tarball-release
> -src-tarball-release: subtree-force-update-all
> +src-tarball-release:
>  	bash ./tools/misc/mktarball $(XEN_ROOT) $$($(MAKE) -C xen xenversion --no-print-directory)
>  
>  .PHONY: src-tarball
> -src-tarball: subtree-force-update-all
> +src-tarball:
>  	bash ./tools/misc/mktarball $(XEN_ROOT) $$(git describe)
>  
>  .PHONY: clean
> --- a/tools/Makefile
> +++ b/tools/Makefile
> @@ -282,8 +282,3 @@ endif
>  ifeq ($(CONFIG_X86),y)
>  	$(MAKE) -C firmware subtree-force-update
>  endif
> -
> -subtree-force-update-all:
> -	$(MAKE) qemu-xen-dir-force-update
> -	$(MAKE) qemu-xen-traditional-dir-force-update
> -	$(MAKE) -C firmware subtree-force-update-all
> --- a/tools/Rules.mk
> +++ b/tools/Rules.mk
> @@ -206,7 +206,7 @@ subdir-all-% subdir-clean-% subdir-insta
>  subdir-distclean-%: .phony
>  	$(MAKE) -C $* distclean
>  
> -no-configure-targets := distclean subdir-distclean% clean subdir-clean% subtree-force-update-all %-dir-force-update
> +no-configure-targets := distclean subdir-distclean% clean subdir-clean% %-dir-force-update
>  ifeq (,$(filter $(no-configure-targets),$(MAKECMDGOALS)))
>  $(XEN_ROOT)/config/Tools.mk:
>  	$(error You have to run ./configure before building or installing the tools)
> --- a/tools/firmware/Makefile
> +++ b/tools/firmware/Makefile
> @@ -127,9 +127,5 @@ ifeq ($(CONFIG_OVMF),y)
>  	$(MAKE) ovmf-dir-force-update
>  endif
>  
> -subtree-force-update-all:
> -	$(MAKE) seabios-dir-force-update
> -	$(MAKE) ovmf-dir-force-update
> -
>  subdir-all-seabios-dir: seabios-dir
>  	$(MAKE) -C $< CC=$(SEABIOSCC) LD=$(SEABIOSLD) PYTHON=$(PYTHON) EXTRAVERSION=$(SEABIOS_EXTRAVERSION) all;
> --- a/tools/misc/mktarball
> +++ b/tools/misc/mktarball
> @@ -1,6 +1,6 @@
>  #!/bin/bash
>  #
> -# mktarball: Make a release tarball (including xen, qemu, and qemu-traditional)
> +# mktarball: Make a release tarball (including just xen)
>  #
>  # Takes 2 arguments, the path to the dist directory and the version
>  set -ex
> @@ -29,26 +29,6 @@ mkdir -p $tdir
>  
>  git_archive_into $xen_root $tdir/xen-$desc
>  
> -# We can't use git_archive_into with qemu upstream because it uses
> -# git-submodules.  git-submodules are an inherently broken git feature
> -# which should never be used in any circumstance.  Unfortunately, qemu
> -# upstream uses them.  Relevantly for us, git archive does not work
> -# properly when there are submodules.
> -(
> -    cd $xen_root/tools/qemu-xen-dir-remote
> -    # if it's not clean, the qemu script will call `git stash' !
> -    git --no-pager diff --stat HEAD
> -    scripts/archive-source.sh $tdir/xen-$desc/tools/qemu-xen.tar
> -    cd $tdir/xen-$desc/tools
> -    mkdir qemu-xen
> -    tar <qemu-xen.tar Cxf qemu-xen -
> -    rm qemu-xen.tar
> -)
> -
> -git_archive_into $xen_root/tools/qemu-xen-traditional-dir-remote $tdir/xen-$desc/tools/qemu-xen-traditional
> -
> -git_archive_into $xen_root/extras/mini-os-remote $tdir/xen-$desc/extras/mini-os
> -
>  GZIP=-9v tar cz -f $xen_root/dist/xen-$desc.tar.gz -C $tdir xen-$desc
>  
>  echo "Source tarball in $xen_root/dist/xen-$desc.tar.gz"


