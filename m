Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9751F797184
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 12:39:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597243.931457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeCOv-0004Q6-M6; Thu, 07 Sep 2023 10:38:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597243.931457; Thu, 07 Sep 2023 10:38:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeCOv-0004NI-JE; Thu, 07 Sep 2023 10:38:17 +0000
Received: by outflank-mailman (input) for mailman id 597243;
 Thu, 07 Sep 2023 10:38:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M1vp=EX=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qeCOt-0004NC-RL
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 10:38:15 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5a8cd88-4d6a-11ee-9b0d-b553b5be7939;
 Thu, 07 Sep 2023 12:38:13 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-31c3df710bdso764587f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Sep 2023 03:38:13 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 d1-20020adfa401000000b0031980294e9fsm19543608wra.116.2023.09.07.03.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 03:38:12 -0700 (PDT)
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
X-Inumbo-ID: a5a8cd88-4d6a-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694083093; x=1694687893; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RvLQQMgV3ZKSkuVR7fY6hQHnD6aREmASDFLvsEn+wk8=;
        b=o+icErqTcLnLf+8cQ0Yl0DBu/WBVmCBOFcncptFzQKFygaJuQUXjFuh4FNDxDtGWh2
         1BGtVMrYqV3Dtu5+ZErRRE5MUQXZtiBw1pR6U1rCC6EGZ1TuOt7s9IPRNYOgCy4Muq1q
         0RTBTzwinNRqVr+87d2totogLchv6tu5tw8lw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694083093; x=1694687893;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RvLQQMgV3ZKSkuVR7fY6hQHnD6aREmASDFLvsEn+wk8=;
        b=RUExNflBAnkoO3TCKZMgf+hBRnIxbj2/Cwk5G8BiPYjr+pSMYZ06RZBTDEQSKZrFto
         vlSBGgG4gfG7qYQxQNHgPkq9ZN2RlwCg7sKUsK7oaFpoaMZK92OdmpoSNgn3u1Xd7Dwb
         700vPSqx/W7GrijDBOhEWUka4bDauQbpZPJb6nxNL0oW+qpsxpvOdcser84QIa9sz3GH
         yQic8PS8+sOhopLaMCAXDFZKxVk6r5g1V2li5U8yQu9wYfvPMVX2zPxsqzEyj+qEPAly
         JjdsF97y46DHnMwjdMeBa2owPbBr0XeFNJSyVb7dJNEeHDbnaVmUt4yqW0Dwyog+pWsG
         6wiQ==
X-Gm-Message-State: AOJu0YyutvtkUwKZlTbSVz12pG45dhKnxX5hgSNumHFYZEMHn2No8q2f
	s4xLXd9GvT9VDhmopTDyTKrpMw==
X-Google-Smtp-Source: AGHT+IHtL+gfAKVpFjUIeutxr7VpvhN5x/yvQYFZxbECiavU+rlI5/fJABri3/rx7my/rxcZstLpHA==
X-Received: by 2002:a5d:460a:0:b0:314:1fd7:188b with SMTP id t10-20020a5d460a000000b003141fd7188bmr4254696wrq.17.1694083093236;
        Thu, 07 Sep 2023 03:38:13 -0700 (PDT)
Date: Thu, 7 Sep 2023 11:38:12 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	JBeulich@suse.com
Subject: Re: [PATCH v2] tests/vpci: install test
Message-ID: <8596151e-e30a-4df3-85eb-b4c64ede7993@perard>
References: <20230313121226.86557-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230313121226.86557-1-roger.pau@citrix.com>

On Mon, Mar 13, 2023 at 01:12:26PM +0100, Roger Pau Monne wrote:
> diff --git a/tools/tests/vpci/Makefile b/tools/tests/vpci/Makefile
> index 5075bc2be2..11f1ee7126 100644
> --- a/tools/tests/vpci/Makefile
> +++ b/tools/tests/vpci/Makefile
> @@ -1,27 +1,37 @@
>  XEN_ROOT=$(CURDIR)/../../..
>  include $(XEN_ROOT)/tools/Rules.mk
>  
> -TARGET := test_vpci
> +TARGET := test-vpci
>  
>  .PHONY: all
>  all: $(TARGET)
>  
>  .PHONY: run
>  run: $(TARGET)
> +ifeq ($(CC),$(HOSTCC))
>  	./$(TARGET)
> +else
> +	$(warning HOSTCC != CC, cannot run test)
> +endif
>  
>  $(TARGET): vpci.c vpci.h list.h main.c emul.h
> -	$(HOSTCC) -g -o $@ vpci.c main.c
> +	$(CC) $(CFLAGS) -o $@ vpci.c main.c

This now needs $(CFLAGS_xeninclude) to build, so
"CFLAGS += $(CFLAGS_xeninclude)" somewhere in the file.


Also, there's another change needed as we've got this error:

vpci.c:344:29: error: ‘dom_xen’ undeclared (first use in this function)
  344 |         pdev = pci_get_pdev(dom_xen, sbdf);


Otherwise, patch looks fine to me.

Thanks,

-- 
Anthony PERARD

