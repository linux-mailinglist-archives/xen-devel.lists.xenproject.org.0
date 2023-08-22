Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB47784508
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 17:08:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588583.920124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYSzt-00043s-UO; Tue, 22 Aug 2023 15:08:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588583.920124; Tue, 22 Aug 2023 15:08:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYSzt-00041b-Qb; Tue, 22 Aug 2023 15:08:45 +0000
Received: by outflank-mailman (input) for mailman id 588583;
 Tue, 22 Aug 2023 15:08:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0QVw=EH=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qYSzs-000408-AV
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 15:08:44 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c811edc2-40fd-11ee-9b0c-b553b5be7939;
 Tue, 22 Aug 2023 17:08:42 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3fef2f05356so18860725e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Aug 2023 08:08:42 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 p1-20020a05600c204100b003fefaf299b6sm1946868wmg.38.2023.08.22.08.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 08:08:41 -0700 (PDT)
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
X-Inumbo-ID: c811edc2-40fd-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1692716922; x=1693321722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ksES7XdW7KICYuNCB7I+pKc0l0fFKB6dLx+Z80Hvio0=;
        b=mGkECUiVOIoN/RaqZB+Bu5AJzPtM+XYZLw8ge9yYbtoG8cyW4fksojA0RWPmCTXgIK
         a3L64n9Wj7GpEaOkuy7BRb2+EnGswI0U0lZOOX/e01SDClIzfefw0mRVZOu9pkOI0qpD
         g5BTyXf9mSDpGpB13DyFaiQjiMcnVXDqlgGvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692716922; x=1693321722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksES7XdW7KICYuNCB7I+pKc0l0fFKB6dLx+Z80Hvio0=;
        b=Abi0sR/acEo1CzncbF9hNlIi8raqNleXc4RBWlRaRMVOOpL11v5gV54QcY6HBOss7O
         I6FGZWIStCQuietxJeQvDWAuaU0fiXhefqjR3p5rBoHvNIFmpobBV8cy0pRJQFTlljQ2
         8TxTFsyez5N0d3pNaRINmxVyyXewYCbD4MrYiqGny8N710iHyDcGET1etbvr4fjbpfE8
         Gh+aasmDBCaN1mZlnIICasnuixKDI1WJN6n7m/UcK7wOzZ4g3J/gG95xYdibF/TmLwRc
         fDRL95OyMjbkLgWx9ipcfyq56JSj5fGnc8nb+yQxgrjxeuyVwc8AYk5CwQJYCCb5DeGd
         4fDA==
X-Gm-Message-State: AOJu0Yxnsv87TAEssJy7aXje7xhSjn7oabQgnREihWq1CyxWoorbce/T
	+0C//dY/BGTGmmIPQAp6jhKQfA==
X-Google-Smtp-Source: AGHT+IGdk8jmzCqco1gqvTwIYeNT1kY53kKjAs7QMbN9SUgOvWWhP4bkGhPDSEqFguNaNUqeCtcw/g==
X-Received: by 2002:a1c:7707:0:b0:3fe:179d:d42e with SMTP id t7-20020a1c7707000000b003fe179dd42emr7871662wmi.23.1692716921762;
        Tue, 22 Aug 2023 08:08:41 -0700 (PDT)
Date: Tue, 22 Aug 2023 16:08:40 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
	michal.orzel@amd.com, xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com, consulting@bugseng.com,
	Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH 2/3] docs: make the docs for MISRA C:2012 Dir 4.1
 visible to ECLAIR
Message-ID: <8d17e090-720d-4887-8650-4e7e6b3e4c44@perard>
References: <cover.1692636338.git.nicola.vetrini@bugseng.com>
 <857dd398240accabea73e5660ae77f3925727ee9.1692636338.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <857dd398240accabea73e5660ae77f3925727ee9.1692636338.git.nicola.vetrini@bugseng.com>

On Mon, Aug 21, 2023 at 06:54:38PM +0200, Nicola Vetrini wrote:
> diff --git a/docs/misra/Makefile b/docs/misra/Makefile
> new file mode 100644
> index 000000000000..f62cd936bfcc
> --- /dev/null
> +++ b/docs/misra/Makefile
> @@ -0,0 +1,36 @@
> +XEN_ROOT=$(CURDIR)/../..
> +include $(XEN_ROOT)/Config.mk
> +-include $(XEN_ROOT)/config/Docs.mk
> +
> +
> +TARGETS := $(addprefix C-runtime-failures,.c .o)
> +
> +all: $(TARGETS)
> +
> +define MISRA_HEADER
> +/*
> +
> +endef
> +
> +define MISRA_FOOTER
> +
> +*/
> +
> +endef
> +export MISRA_HEADER
> +export MISRA_FOOTER
> +
> +C-runtime-failures.c: C-runtime-failures.rst

Any reason not to use "%.c: %.rst" ? You could even write
    "C-runtime-failures.c: %.c: %.rst"
(Or even $(TARGETS:.o=.c): %.c %.rst", if TARGETS only had the .o, and
if we expect all *.c to be generated from *.rst in this Makefile)

> +# sed is used in place of cat to prevent occurrences of '*/'
> +# in the .rst from breaking the compilation

I think I'd like this comment just before the rule, rather than between
the target line and the recipe. That just push the recipe far way from
the target due to the indentation.

> +	( \
> +	  echo "$${MISRA_HEADER}"; \

Would it be ok to just do `echo "/*"` here instead of defining a make
variable and using it via the environment? I'd like to try to avoid the
dollar escape $$ which make shell code harder to read when written in
makefile.

> +	  sed -e 's|*/|*//*|' $<; \

The first '*' in this command is awkward, as its a special character.
I'd rather not rely on `sed` to convert it to non-special, so could you
escape it?

Also, this pattern only takes care of the first occurrence of '*/' on a
line, but they could be more than one.

> +	  echo "$${MISRA_FOOTER}" \
> +	) > $@
> +
> +%.o: %.c
> +	$(CC) -c $< -o $@
> +
> +clean:
> +	rm -f *.c *.o

This `rm -f *.c` is prone to mistake. I hope no one is going to write a
C file in this directory, run `make clean` and lost their source. Or,
copy this makefile somewhere else. Would it be ok to just spell out all
the .c files that are expected to be generated by this makefile?

Cheers,

-- 
Anthony PERARD

