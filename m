Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBC1A896FA
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 10:43:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952316.1347805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4btJ-0004OZ-Mi; Tue, 15 Apr 2025 08:43:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952316.1347805; Tue, 15 Apr 2025 08:43:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4btJ-0004Lj-Jc; Tue, 15 Apr 2025 08:43:37 +0000
Received: by outflank-mailman (input) for mailman id 952316;
 Tue, 15 Apr 2025 08:43:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OGoX=XB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u4btH-0004Ld-BM
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 08:43:35 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6b430e1-19d5-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 10:43:34 +0200 (CEST)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2279915e06eso55717155ad.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 01:43:34 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-22ac7cb5441sm112177195ad.197.2025.04.15.01.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 01:43:32 -0700 (PDT)
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
X-Inumbo-ID: b6b430e1-19d5-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744706612; x=1745311412; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/5q7zbVMSA5FjtNMLBKr/5qkFYevIkeKZgreXUzzV+M=;
        b=VkNDbbivIE1sl2gd5DmSjWu7lsTd0imtL3RLyi4m1s9zJr71zN3jZdh0gZVGQvsd6v
         5T95NWdjm+BCFigShDf78TVzupHkgqjwQZ9qzOMdHGuxenHkTg5imWOyjjXEOHr9BHBy
         2tP9zkbDs1J5YJ93q6KpgjgkH/gN8YjaZaB4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744706612; x=1745311412;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/5q7zbVMSA5FjtNMLBKr/5qkFYevIkeKZgreXUzzV+M=;
        b=OulDBXScsTtv3/evU6cwDkfowymgZNZ+1+Nmjy5ByrpCsvSUWQKb3Llm9tHKCBgcoz
         lAKA8cTK9C7MGCD4HEMYy10GJD6cr62Qp2jJFu80WpKOal6w0l5q+Jq1Gevr8qeyy86U
         GubwXg/MvV4hByVUnr/H6s7CYK1RuFgeumj1gVWTyo7sscAD5WyBqUeN2FK5FEb3iqGx
         P361hQQ9H4LzaNkXiRJ3iWQvozA28GSG/PBtKUpbJ16jh34sGBOMGRMzSnsR3iiIvfy0
         yniMD2ZfbwJL7DIF5St90nXj+FKXiCXSsQ2smffW33lUMPxnDBvdYg+7fjoYzxJOgBlt
         DQSw==
X-Gm-Message-State: AOJu0YwVIa1nRS35+DpZdtJlx0RCM8vzZnGet6u06kM627m/4yiM02If
	EjiH1c90pw49wsI2zfzep6VVrRU1al4z0u1MhAqVxoD30YPQTYykiubeeOPyrU1gq4/F3Nnhny/
	u
X-Gm-Gg: ASbGncvLhwCy0I+iooCyd4zqIT+6lyFzJN5yAcOhZY7fe9ap6HrWt+e6grgcdPyi0eJ
	Z478a2fan4lYzTXhgdl5blV6EKIEj0OdFn7YgxO/k1vUzNRmWZaM/LzSNGY3z4z8IlCAfmmY+Du
	DZhb3Ja/3KDgrzHraMwjfQ0gCWVzNb7RiG8aAAzRnUW93/vJ/4Xc1MMw5bWAAf4zkP3IgP1uVre
	ZzkhR2sRQEdpvxP4mG68oBEB1DeOhzc6lU8jRZFdIR9rTfKyRHgw9h82Nvod6nTyRBPasZAEa4T
	Fxbv7c/66CZXgKNWa5rfJzUHhq+YwlsOM0XEeWdGPssE5Q==
X-Google-Smtp-Source: AGHT+IEPIrdGio01C9xaA6V+7AEKKFEgu4kl1rpgsdARILfoi6ALrfgGEm1mMlQubMPSCMquwuo7Cg==
X-Received: by 2002:a17:902:cec4:b0:224:e33:889b with SMTP id d9443c01a7336-22bea4ade03mr240729125ad.12.1744706612541;
        Tue, 15 Apr 2025 01:43:32 -0700 (PDT)
Date: Tue, 15 Apr 2025 10:43:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [XEN PATCH] tools/tests: Fix newly introduced Makefile
Message-ID: <Z_4cLBroEtnmD3sD@macbook.lan>
References: <20250414141714.10166-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250414141714.10166-1-anthony@xenproject.org>

On Mon, Apr 14, 2025 at 04:17:14PM +0200, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
> 
> Fix few issue with this new directory:
> - clean generated files
> - and ignore those generated files
> - include the dependency files generated by `gcc`.
> - rework prerequisites:
>   "test-rangeset.o" also needs the generated files "list.h" and
>   "rangeset.h". Technically, both only needs "harness.h" which needs
>   the generated headers, but that's a bit simpler and the previous
>   point will add the dependency on "harness.h" automatically.
> 
> This last point fix an issue where `make` might decide to build
> "test-rangeset.o" before the other files are ready.

Oh, I see, yes, test-rangeset.o wasn't dependent on the generated
files.

> 
> Fixes: 7bf777b42cad ("tootls/tests: introduce unit tests for rangesets")
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> 
> Make doesn't needs the *.h to generated the .c. So removing that
> prerequisite means make can generate all 3 at the same time.
> ---
>  tools/tests/rangeset/.gitignore | 4 ++++
>  tools/tests/rangeset/Makefile   | 8 ++++++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
>  create mode 100644 tools/tests/rangeset/.gitignore
> 
> diff --git a/tools/tests/rangeset/.gitignore b/tools/tests/rangeset/.gitignore
> new file mode 100644
> index 0000000000..cdeb778535
> --- /dev/null
> +++ b/tools/tests/rangeset/.gitignore
> @@ -0,0 +1,4 @@
> +/list.h
> +/rangeset.c
> +/rangeset.h
> +/test-rangeset
> diff --git a/tools/tests/rangeset/Makefile b/tools/tests/rangeset/Makefile
> index 70076eff34..3dafcbd054 100644
> --- a/tools/tests/rangeset/Makefile
> +++ b/tools/tests/rangeset/Makefile
> @@ -12,7 +12,7 @@ run: $(TARGET)
>  
>  .PHONY: clean
>  clean:
> -	$(RM) -- *.o $(TARGET) $(DEPS_RM)
> +	$(RM) -- *.o $(TARGET) $(DEPS_RM) list.h rangeset.h rangeset.c
>  
>  .PHONY: distclean
>  distclean: clean
> @@ -32,7 +32,7 @@ rangeset.h: $(XEN_ROOT)/xen/include/xen/rangeset.h
>  list.h rangeset.h:
>  	sed -e '/#include/d' <$< >$@
>  
> -rangeset.c: $(XEN_ROOT)/xen/common/rangeset.c list.h rangeset.h
> +rangeset.c: $(XEN_ROOT)/xen/common/rangeset.c
>  	# Remove includes and add the test harness header
>  	sed -e '/#include/d' -e '1s/^/#include "harness.h"/' <$< >$@
>  
> @@ -42,5 +42,9 @@ CFLAGS += $(CFLAGS_xeninclude)
>  
>  LDFLAGS += $(APPEND_LDFLAGS)
>  
> +test-rangeset.o rangeset.o: list.h rangeset.h
> +
>  test-rangeset: rangeset.o test-rangeset.o
>  	$(CC) $^ -o $@ $(LDFLAGS)
> +
> +-include $(DEPS_INCLUDE)

This include is likely also needed by vpci/Makefile?

Thanks, Roger.

