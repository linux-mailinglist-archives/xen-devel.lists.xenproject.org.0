Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE23ACC069
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 08:47:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004003.1383647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMLQC-0001px-Pv; Tue, 03 Jun 2025 06:46:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004003.1383647; Tue, 03 Jun 2025 06:46:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMLQC-0001nA-MD; Tue, 03 Jun 2025 06:46:52 +0000
Received: by outflank-mailman (input) for mailman id 1004003;
 Tue, 03 Jun 2025 06:46:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V7Ic=YS=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uMLQA-0001n4-P7
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 06:46:50 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8651707f-4046-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 08:46:49 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a36efcadb8so4481466f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 23:46:49 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-450d7f92585sm158838735e9.5.2025.06.02.23.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 23:46:47 -0700 (PDT)
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
X-Inumbo-ID: 8651707f-4046-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748933209; x=1749538009; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+RBrRkUU8rQlsBE1rCiUgyDPYrX2VyvVAIYz0+G1pr8=;
        b=AaiYYydk6mflK0BW4D+GnWya53gZYwznvGRsPDxYEKARIqyCabneLpXh2ZZmkUBLkK
         NFT2oSDJVv7mPRB0hbR2sXOgjNRXcoICgLKfkPNYF5RZ4+xwA7CdgHG6wprgULIkWDFu
         VsjTdo7YEnMTR7HVX1SecYgi+65J3v372RSuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748933209; x=1749538009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+RBrRkUU8rQlsBE1rCiUgyDPYrX2VyvVAIYz0+G1pr8=;
        b=T8p5TZIr3AQwc1rjcQKDJpC6cM5duUQufRN4N03NpMtDe9bIPKaQhPipkGoqqXfJZX
         9ICtRL+m3SMwrvQst7qgHcGsPwyq5bBWzQuDt04LFmvYV9aMa3bUlVyobsq6sNd6GPVj
         v+OJnVsWWX9ktZ7Y85Uz+plG8OL5FZAVZ5y6K3lMk+c65sJcqOhKlFDXT/yOA6It7sRJ
         OTULozL5gtfzKCmGofrSmMztLFiKKqFPTgJeGV4MtO/p1a0iI/cHuFyqJTROiKSXx2FB
         amN38H3mkB4ZxK5PCErEdP9029cw6QzMwUMoa/XmEnLP3wSASWkjBQzJJtrnDA0N+BPi
         qKAA==
X-Gm-Message-State: AOJu0Yw0macxtc8pH8cwOanhYmDcLPWLgeoG1HvbgsPZiHS/EWOdPqbi
	M5b9wvhzw4meDir9Y6pCHnSj0YLyfaev/FOSsz2YVCxXpniLuDaL22qGN0NjKREQxiY=
X-Gm-Gg: ASbGncvo1yHWu1YXam236FxAeaoGGeVjxoNxD8NDhz3LqkqJYfvMQBsvhft2m3t3ZZs
	QJ4AEtGwi5cIUyWQ4/88fmnBcfB3QphSwSbYL9ZKeTuQaPfbGrcoK02SHW8XfmrV/cXUAWRHsAt
	pOLBtCTqFftI18/cleGhg3xsdN5Z2GhUnu674d+jz+BTQDBEDJbJehLUYKodqpb3FH2qk5lwhvG
	xnV3zb6vd7AAbkLnT5w6GdJ81n88MATfmX2LZoheCgH13pXpYsJTnHh3JtMlvltuGKnrUnWnpgu
	kVe6nK/g18wmRJCuXT85zXLF/bNUmDdfozyNBAFaRFOP6kHi3fMnwyZ/+gPRSJKoGvxKzeDtDF4
	2cMIX+HN9Td78tnt51Okl4naIQsUMCGHMAKU=
X-Google-Smtp-Source: AGHT+IGQz9PbAmBk8/huL5DcDZy4UmhnB82hREbSXy1HI2Fg5B+CZD/0mtG3zKeTw5mlXrt+hIOkQA==
X-Received: by 2002:a05:6000:240b:b0:3a4:f24c:d719 with SMTP id ffacd0b85a97d-3a4f7a816a9mr11796133f8f.29.1748933208903;
        Mon, 02 Jun 2025 23:46:48 -0700 (PDT)
Date: Tue, 3 Jun 2025 08:46:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH] tests/vpci: Use $(CC) instead of $(HOSTCC)
Message-ID: <aD6aVzDZ4zDyEBHV@macbook.local>
References: <20250602150929.10679-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250602150929.10679-1-michal.orzel@amd.com>

On Mon, Jun 02, 2025 at 05:09:29PM +0200, Michal Orzel wrote:
> These tests are supposed to run on target. HOSTCC can be different than
> CC (when cross-compiling). At the moment, tests installation would put
> a binary of a wrong format in the destdir.
> 
> Fixes: e90580f25bd7 ("vpci: introduce basic handlers to trap accesses to the PCI config space")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>  tools/tests/vpci/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/tests/vpci/Makefile b/tools/tests/vpci/Makefile
> index 9450f7593a41..1101a669e118 100644
> --- a/tools/tests/vpci/Makefile
> +++ b/tools/tests/vpci/Makefile
> @@ -11,7 +11,7 @@ run: $(TARGET)
>  	./$(TARGET)
>  
>  $(TARGET): vpci.c vpci.h list.h main.c emul.h
> -	$(HOSTCC) $(CFLAGS_xeninclude) -g -o $@ vpci.c main.c
> +	$(CC) $(CFLAGS_xeninclude) -g -o $@ vpci.c main.c

This was already posted in:

https://lore.kernel.org/xen-devel/20230313121226.86557-1-roger.pau@citrix.com/

And got no feedback.

I'm happy for your change to go in, but you might also consider
picking up the run target adjustment part of that previous patch.

Thanks, Roger.

