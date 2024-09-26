Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD72098726B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 13:08:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805374.1216455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stmMQ-00061h-FD; Thu, 26 Sep 2024 11:08:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805374.1216455; Thu, 26 Sep 2024 11:08:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stmMQ-0005z6-Ce; Thu, 26 Sep 2024 11:08:38 +0000
Received: by outflank-mailman (input) for mailman id 805374;
 Thu, 26 Sep 2024 11:08:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ahor=QY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1stmMP-0005z0-IA
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 11:08:37 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad5e0cec-7bf7-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 13:08:36 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5365c512b00so1045495e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 04:08:36 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c877a6c985sm1053198a12.80.2024.09.26.04.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 04:08:35 -0700 (PDT)
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
X-Inumbo-ID: ad5e0cec-7bf7-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727348916; x=1727953716; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RMwPL/6/1U8hvwa89C2F40BvUFc/6dXTFtuATEFad2Q=;
        b=KohRTYCyWKx67NMUp4tw92Jie9x3TFNs41OgWgXr/rW+EuSDqRwvOEFJRBw4vumWVI
         s2M2kt11Kihl1SWLV0LQtLmPg63nDG/DPMp7FKOtW4pLxFmu+zBWN966Y5uRwF8fgkYx
         VEv/pNL7HUoI71rQwlg1aaPKCtLH3pj5Knrhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727348916; x=1727953716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMwPL/6/1U8hvwa89C2F40BvUFc/6dXTFtuATEFad2Q=;
        b=sw+oUDBbIL8A8RKFUyQJwz7SIJk7BfEzxs5JXCl2dGsAz5RNxs0bqSpP/zimd4gVav
         UhI2ORJZ+FG4LfLhcb7uN5y3mwnyEUwG2/BAr0l/tbk/hg8KHZED4I7aTSGaDZhiiib2
         Ae/ld+2+nM3GSdZjzww0PfI8YBMbPO5OQebM/AwAJn8JygJzUR9yEy7atAfPA2gBSqdQ
         PZm0VL0zKfJRzIsFAJNqNLKGyoc9YfYU0FO1nir04p+iu8mLNrksRWsZbIiIAkZETxiO
         +JAbtS09nqB+5TSuozWDxc2KmNAtr+0x4K925ckYicFjjPYMrL/3BHz/PwG6ND49TCTy
         8RFQ==
X-Gm-Message-State: AOJu0Yyinx08JmylHTGoLFmkZ2w/06xexby2t9UXXvO5o24MUWtgQaaG
	CmQo/2Co6YXcqoQ8YcHWXzMlnvx3swwnKqH4wmRWhonIN1QbuNXrb9O1YEBh4QY=
X-Google-Smtp-Source: AGHT+IHIKhKC9rGa5E06RG97aVHY2SWnONzCXpNeso/xnKT+iXZCCUCeE2OV8y29UfbjSaAvLxwYww==
X-Received: by 2002:a05:6512:230b:b0:52c:952a:67da with SMTP id 2adb3069b0e04-538804b1b30mr3667840e87.55.1727348916179;
        Thu, 26 Sep 2024 04:08:36 -0700 (PDT)
Date: Thu, 26 Sep 2024 13:08:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
	Owen Smith <owen.smith@cloud.com>, Mark Syms <mark.syms@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3] blkif: reconcile protocol specification with in-use
 implementations
Message-ID: <ZvVAssngeL5vPrDg@macbook.local>
References: <20240912095729.25927-1-roger.pau@citrix.com>
 <ZvUtgqY4gWGS0I8K@l14>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZvUtgqY4gWGS0I8K@l14>

On Thu, Sep 26, 2024 at 09:46:43AM +0000, Anthony PERARD wrote:
> On Thu, Sep 12, 2024 at 11:57:29AM +0200, Roger Pau Monne wrote:
> >  /*
> >   * Cast to this structure when blkif_request.operation == BLKIF_OP_DISCARD
> >   * sizeof(struct blkif_request_discard) <= sizeof(struct blkif_request)
> > + *
> > + * The 'sector_number' field is in units of 512b, despite the value of the
> > + * 'sector-size' xenstore node.  Note however that the offset in
> > + * 'sector_number' must be aligned to 'sector-size'.
> 
> For discard request, there's "discard-granularity", and I think
> `sector_number` should be aligned to it. See "discard-granularity" and
> note 4.

Indeed, the wording here would be better as:

"Note however that the offset in 'sector_number' must be aligned to
'sector-size' or 'discard-alignment' if present."

Would you mind sending a patch to fix this?

Thanks, Roger.

