Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C733798642
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 13:05:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597931.932365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeZHk-0003bH-Ms; Fri, 08 Sep 2023 11:04:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597931.932365; Fri, 08 Sep 2023 11:04:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeZHk-0003YU-J1; Fri, 08 Sep 2023 11:04:24 +0000
Received: by outflank-mailman (input) for mailman id 597931;
 Fri, 08 Sep 2023 11:04:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFXC=EY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qeZHj-0003YO-9b
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 11:04:23 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 764135e9-4e37-11ee-9b0d-b553b5be7939;
 Fri, 08 Sep 2023 13:04:21 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4013454fa93so22121955e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Sep 2023 04:04:21 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 e6-20020a05600c218600b003fe1c332810sm4875288wme.33.2023.09.08.04.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 04:04:20 -0700 (PDT)
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
X-Inumbo-ID: 764135e9-4e37-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694171060; x=1694775860; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B/wXcYnp+eHDsRVTZPjJV93ubY5Ers8LA4A/H01yMis=;
        b=rQPc7tlWdqh3YbMh+UBalP/ndAxy86bscihm+mVg3LR/4cL/h41wfwIxHltEiocqjn
         pUcmqI+GN8CfnItVo+2vDkTmD7/VBFjmAy75kI1AvpRBOcf0CEWixtbtyDN98Hufz11u
         9rf4rZppGYasGO93O7rS99tfaviJgxCRMVcOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694171060; x=1694775860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/wXcYnp+eHDsRVTZPjJV93ubY5Ers8LA4A/H01yMis=;
        b=v6QaxZlEOITLyEwfYqKSrXPFg12TsnVipgwBUmrONDrQOpTK2c+RWAyV82Ep275t8g
         G5hUR4YyMGuad55vQO8I/i68a0EAokh6svjh1UH5ZbLKgIZQWy2z8XoI6EUrsPqk4RFi
         bG+NEDucQ4e9AMzcAEq1brGXVmfkGNj8OPscEpj1+mB9kTApCbYZnH+EZ0iokf7F/0g9
         o3Yov6UXO04LRniXT/e9THOokG/tEi6mZ/wqX5yvIGlf/ws6Iu2HYniPRDf0QFHjrQAX
         +kPwp+tPX/tPm9D3259ulSht7FpiaYaA2pvxFnbe8m6gDVq3XYPRszocU7fLrIJ7hzR5
         uHXA==
X-Gm-Message-State: AOJu0Yz8wUAldYkc5YzQT7aY7jz8mDxi+Ochgtc2UtCEr+QljmVoP3HO
	QFm6/c+ZEm1ngUx6UuopvYF2Rg==
X-Google-Smtp-Source: AGHT+IHcuHSAGRqXYFPuNCVF4EeHRk75XMmuDJRpvIXjrZQjNgfQGnYCTlWymJ/BbNQ0Lzd6K8w3SQ==
X-Received: by 2002:a5d:4390:0:b0:317:648c:3895 with SMTP id i16-20020a5d4390000000b00317648c3895mr1726881wrq.33.1694171060542;
        Fri, 08 Sep 2023 04:04:20 -0700 (PDT)
Date: Fri, 8 Sep 2023 12:04:19 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
	michal.orzel@amd.com, xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com, consulting@bugseng.com,
	Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH 2/3] docs: make the docs for MISRA C:2012 Dir 4.1
 visible to ECLAIR
Message-ID: <30e0d1b7-6ac0-464e-b45f-36b56960d8f9@perard>
References: <cover.1693558913.git.nicola.vetrini@bugseng.com>
 <bf38efce3ac551fc95eaf1935ce7f574a7804df2.1693558913.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf38efce3ac551fc95eaf1935ce7f574a7804df2.1693558913.git.nicola.vetrini@bugseng.com>

On Fri, Sep 01, 2023 at 11:06:39AM +0200, Nicola Vetrini wrote:
> diff --git a/docs/misra/Makefile b/docs/misra/Makefile
> new file mode 100644
> index 000000000000..8ea0505c8a20
> --- /dev/null
> +++ b/docs/misra/Makefile
> @@ -0,0 +1,17 @@
> +TARGETS := C-runtime-failures.o
> +
> +all: $(TARGETS)
> +
> +# sed is used in place of cat to prevent occurrences of '*/'
> +# in the .rst from breaking the compilation
> +$(TARGETS:.o=.c): %.c: %.rst
> +	echo "/*\n" > $@.tmp

This doesn't really works as you expect. Depending on the shell used or
the echo binary used, the "\n" would write a <new-line> or justs "\n".
Bash just write "\n" for example, while dash does write a <new-line>.
But, you can use `printf` instead:
    printf "/*\n\n" > $@.tmp

> +	sed -e 's|\*/|*//*|g' $< >> $@.tmp
> +	echo "\n*/" >> $@.tmp

Same here.


Thanks,

-- 
Anthony PERARD

