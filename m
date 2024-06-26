Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2349183B5
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 16:13:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749104.1157128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMTO0-0005XT-Fn; Wed, 26 Jun 2024 14:12:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749104.1157128; Wed, 26 Jun 2024 14:12:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMTO0-0005V8-DE; Wed, 26 Jun 2024 14:12:36 +0000
Received: by outflank-mailman (input) for mailman id 749104;
 Wed, 26 Jun 2024 14:12:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZmsE=N4=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1sMTNy-0005V2-RA
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 14:12:34 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21f66a73-33c6-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 16:12:33 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a725a918edaso262425966b.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 07:12:33 -0700 (PDT)
Received: from EMEAENGAAD91498. ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72598043b2sm286688766b.106.2024.06.26.07.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 07:12:32 -0700 (PDT)
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
X-Inumbo-ID: 21f66a73-33c6-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719411153; x=1720015953; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6TuPnQh1fYjjPcjTOWpDI2CCVFOB74b7VZheM9F/dCE=;
        b=FHPEzb10hjY+tsFDjUKRkNjXkBEMl0bdjIbYvlCrEuYF2SwBWtL/NG1ofi8YhgIbiN
         nOh+U+C6mFlz6sdMJfyCv65Pjztpk9L0gq/wLRt9ZRD5qJdRV7+mH8kOrvlGNFF7hK5O
         JkhERnZKeCno37lNHD53ekGYGhhs7PnVBo8mU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719411153; x=1720015953;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6TuPnQh1fYjjPcjTOWpDI2CCVFOB74b7VZheM9F/dCE=;
        b=saWU6K+sEjW+xFWKSV7wNYiNoGRj3izPLzLpVPxCfcbVnv4kobPQze7AqYuqWwtVby
         0gnQUi48lnf091FeaLpBITJQoDkFz1uCgV3Mpp9U0WqBsWw1Lcfaz8zcjyXpKVj9V9hF
         x/G1QsTGVbNICgtP4S2HnHV5DWaQdMpR4dZcWJ5ObNtUCE43vVLtZah2RwJ1oqWf7swe
         /sx6VnLixagCCOPDsraXhu/l8ivXN5zFzp6d/Oc3VUs878eYseRRsguCIdhVeJXyeTq2
         Z2bjYzM79eRn//Tx84WaN33IfXEbRJTxlEAbA1tUcHvHEcgXZF/kTtMuxTBNYTB4IVSO
         WONQ==
X-Forwarded-Encrypted: i=1; AJvYcCWf/18AF+DQY4FDVUUEvRn1YC1CrQMWMYOfIHCrtSYe0YwzHto5mEVCUGusTRmz3RqeunXaM9nGRWVaJ6Xyy+kfPFLJd4Q+YnT4KtmQlfw=
X-Gm-Message-State: AOJu0Yy6IDfuc8cTRmhBX85rXCg7bEtEBMVfT0kvKuOERIF+MoPq9IX1
	reBYo6vlGuv4QE6JARx/ReoTPMg0bBtYLqs0QmXrP2tGnqb8z163zZjOVhQjTHE=
X-Google-Smtp-Source: AGHT+IGo4K0d1ZXr1EW4mZJdSS7nr2DJAbpFvKOqu947A+qOAG3WalvuVTECr6BxavGcK17I+M8Qcw==
X-Received: by 2002:a17:906:80c2:b0:a6f:d867:4259 with SMTP id a640c23a62f3a-a7245ba3cb5mr755984966b.26.1719411152983;
        Wed, 26 Jun 2024 07:12:32 -0700 (PDT)
Message-ID: <667c21d0.170a0220.bf390.0f32@mx.google.com>
X-Google-Original-Message-ID: <20240626141220.xkjldl2bjv5c5kvo@EMEAENGAAD91498.>
Date: Wed, 26 Jun 2024 15:12:20 +0100
From: Matthew Barnes <matthew.barnes@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony@xenproject.org>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH] tools/misc: xen-hvmcrash: Inject #DF instead of
 overwriting RIP
References: <27f4397093d92b53f89d625d682bd4b7145b65d8.1717426439.git.matthew.barnes@cloud.com>
 <7ffabe8b-7993-4cc5-97fe-dd1cbd35798e@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ffabe8b-7993-4cc5-97fe-dd1cbd35798e@citrix.com>

On Tue, Jun 25, 2024 at 10:02:42PM +0100, Andrew Cooper wrote:
> On 03/06/2024 3:59 pm, Matthew Barnes wrote:
> > xen-hvmcrash would previously save records, overwrite the instruction
> > pointer with a bogus value, and then restore them to crash a domain
> > just enough to cause the guest OS to memdump.
> >
> > This approach is found to be unreliable when tested on a guest running
> > Windows 10 x64, with some executions doing nothing at all.
> >
> > Another approach would be to trigger NMIs. This approach is found to be
> > unreliable when tested on Linux (Ubuntu 22.04), as Linux will ignore
> > NMIs if it is not configured to handle such.
> >
> > Injecting a double fault abort to all vCPUs is found to be more
> > reliable at crashing and invoking memdumps from Windows and Linux
> > domains.
> 
> Why every CPU?
> 
> We never did that before, and I don't see any it ought to be necessary
> now either.

We do: at the moment, xen-hvmcrash iterates through
hvm_save_descriptors after pausing the domain, overwriting the EIP/RIP of
each cpu it finds.

Is there a reason not to inject #DF into each domain vCPU? Wouldn't that
crash the domain more reliably?

> > diff --git a/tools/misc/xen-hvmcrash.c b/tools/misc/xen-hvmcrash.c
> > index 1d058fa40a47..8ef1beb388f8 100644
> > --- a/tools/misc/xen-hvmcrash.c
> > +++ b/tools/misc/xen-hvmcrash.c
> > @@ -38,22 +38,21 @@
> >  #include <sys/stat.h>
> >  #include <arpa/inet.h>
> >  
> > +#define XC_WANT_COMPAT_DEVICEMODEL_API
> 
> Please don't introduce this.  We want to purge it from the codebase, not
> propagate it.
> 
> You want to open and use a libxendevicemodel handle.  (Sadly you also
> need a xenctrl handle too, until we sort out the userspace ABIs).
> 
> >  #include <xenctrl.h>
> >  #include <xen/xen.h>
> >  #include <xen/domctl.h>
> >  #include <xen/hvm/save.h>
> >  
> > +#define X86_ABORT_DF 8
> 
> #include <xen/asm/x86-defns.h>
> 
> and use X86_EXC_DF.

Understood: this will be reflected in patch v2.

Matt

