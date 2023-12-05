Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C01805817
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 16:01:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647991.1011852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAWvN-00048z-V3; Tue, 05 Dec 2023 15:01:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647991.1011852; Tue, 05 Dec 2023 15:01:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAWvN-00046t-ST; Tue, 05 Dec 2023 15:01:25 +0000
Received: by outflank-mailman (input) for mailman id 647991;
 Tue, 05 Dec 2023 15:01:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jRF5=HQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rAWvM-00046j-DN
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 15:01:24 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27d4400a-937f-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 16:01:23 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40b397793aaso35810275e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 07:01:23 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 n22-20020a05600c3b9600b0040b4562ee20sm1047495wms.0.2023.12.05.07.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 07:01:22 -0800 (PST)
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
X-Inumbo-ID: 27d4400a-937f-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701788483; x=1702393283; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FOOEb8+qQdQN6+J9ZbelykXv7kxZ6osKw1SFFn7BNXg=;
        b=nNEqtsECd7Lw2tT0ZmQfoJKqNlYu/+1KQgRJ+TO7R3B0IS793uOEMVzGB5GvNklcUb
         PJHVf4lzOH8cy9WXIoUWloEOWbY+K6vJqdU/Jtldrcjt0HuxAlhvzEXSbZ+Qgkw5+aqZ
         6yYgBWB9frQb5jsm4LKkdb8WKLzmLDxxBrKKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701788483; x=1702393283;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FOOEb8+qQdQN6+J9ZbelykXv7kxZ6osKw1SFFn7BNXg=;
        b=WLGyxLzB177wryQSA31H0hyYsX5igiW0k8gRIXHGG4hIQuDcqBdts8ZeEsSiuSicac
         cCvIj09+XimyfFrQB1R9sMx1iN+Y/HdZqd1NiRnf4EWbYQDUDftYgysfjeYlcMbErPN1
         jckE89uXaOCDWtiuIndbax8tL6FIPXnBBVlJZDCKZVZTlonYz3kfoIwzDOLnV7xdqCR6
         0om1CX31Vcg2mMHQfTYy0yWGh96YG5lh5TkEkOlgTqSzouejPxS3L6Kf77YZSF7XxfN8
         wY2JkAuBwtSwIMjubu1EnJZ8kbKn81c1gCTE29jqTnqxTl4eAIyffzqQ3hkhrDs2NTYd
         8xKA==
X-Gm-Message-State: AOJu0YzDHFJlk19gpUyooD9Wr1iTb15biWBM65eRY8I/8sE9La/Ap23E
	j5m2RDDh15D/yI1mNJNZA3jg+Q==
X-Google-Smtp-Source: AGHT+IE54uqV6URaZkhhD1qv1AgOASQ7HkhjSW9poMyArC+Y1jnIXh+1F9znqbJrk8VvMV8GBRGhGw==
X-Received: by 2002:a05:600c:3d9a:b0:40b:5e56:7b6e with SMTP id bi26-20020a05600c3d9a00b0040b5e567b6emr632046wmb.183.1701788482975;
        Tue, 05 Dec 2023 07:01:22 -0800 (PST)
Date: Tue, 5 Dec 2023 16:01:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH v2 1/5] x86/livepatch: set function alignment to ensure
 minimal function size
Message-ID: <ZW87Qq3Hw4ql-ZFw@macbook>
References: <20231128100352.35430-1-roger.pau@citrix.com>
 <20231128100352.35430-2-roger.pau@citrix.com>
 <ddbf1fad-e0c1-4b7c-9734-71d4997b5aa0@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ddbf1fad-e0c1-4b7c-9734-71d4997b5aa0@citrix.com>

On Tue, Dec 05, 2023 at 01:42:42PM +0000, Andrew Cooper wrote:
> On 28/11/2023 10:03 am, Roger Pau Monne wrote:
> > diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> > index f3abdf9cd111..f629157086d0 100644
> > --- a/xen/arch/x86/Makefile
> > +++ b/xen/arch/x86/Makefile
> > @@ -82,6 +82,8 @@ obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
> >  obj-y += sysctl.o
> >  endif
> >  
> > +CFLAGS-$(CONFIG_LIVEPATCH) += -falign-functions=$(CONFIG_CC_FUNCTION_ALIGNMENT)
> 
> I'd really prefer not to express it like this.  For one, a major reason
> for using an alignment of 16b or more is simply performance.
> 
> Also, it isn't "CC" when we get the asm macros working.
> 
> Copy Linux more closely.  Then, you have LIVEPATCH select
> FUNCTION_ALIGNMENT_{8,16}B as appropriate.  And PERFORMANCE selects
> FUNCTION_ALIGNMENT_16B or perhaps 32B depending on uarch.

So just use CONFIG_FUNCTION_ALIGNMENT and drop the CC part of it?
That would indeed be fine.  We will also need to adjust
CC_SPLIT_SECTIONS to drop the CC_ prefix when we start using it in
assembly code.

> If we ever get around to having KCFI, then we need 16B irrespective of
> anything else.
> 
> 
> 
> As for the subject, it's not really about size; the function size is
> still going to be small irrespective of the alignment.

What about wording it like:

x86/livepatch: set function alignment to ensure minimal space between functions

Thanks, Roger.

