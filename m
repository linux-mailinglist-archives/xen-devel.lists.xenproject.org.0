Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0E2993140
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 17:33:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812182.1224904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxpiw-00076H-U0; Mon, 07 Oct 2024 15:32:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812182.1224904; Mon, 07 Oct 2024 15:32:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxpiw-00074A-RC; Mon, 07 Oct 2024 15:32:38 +0000
Received: by outflank-mailman (input) for mailman id 812182;
 Mon, 07 Oct 2024 15:32:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=68k9=RD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sxpiu-000744-Ul
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 15:32:36 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 600e9e3f-84c1-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 17:32:34 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a995f56ea2dso101493266b.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 08:32:34 -0700 (PDT)
Received: from localhost ([213.195.117.215]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a994a4294c8sm242165366b.123.2024.10.07.08.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 08:32:33 -0700 (PDT)
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
X-Inumbo-ID: 600e9e3f-84c1-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728315154; x=1728919954; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IsY03DrtwlUf80OkHLUrMMkRYTBMf+KRgT4dXu+TUlM=;
        b=gcqwMPOttFBPGbVOFOXqkEqV8P3yGK4sdjG7CQBXqw/BQ9v+LltzzWEp8HqLJkpUPp
         saEH9Jg5X8QwQK1z7m/HxNMnx0EEss63TIetRWjfo50Z/5bG/DgtRPEMM4+JognQZZm6
         9VbkL8+NkGF9CrjLQ8BxYiUcBHSC+WdjmT+6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728315154; x=1728919954;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IsY03DrtwlUf80OkHLUrMMkRYTBMf+KRgT4dXu+TUlM=;
        b=hQsYWJlvulD3uwts2YFsiJgDBiDe9sN3v0SL2J2wIl+sil+KrmW7OqyqLLHNLfLrFY
         ALsKQjlIdYWYOAHNfvMwR/3VC9qCUbKTtRVnKLH2dLVh5sLbK0bKmQywDvkFQwu+OVwc
         ut/GGNk1sbazI72I0CyHwh+8JcMsxgnpcI3Nzf44sTlE0lpoLNz+qttrK2VKO2pkHl00
         x+fjTV2WuTBea+zDe/TThkMHbelP+9CwgWmN2moo46gOa9jmsx7wUFLHgMOjoGw5hAQy
         ebC3d9YODBYZCoJQYcX31DvPD0QTsWa3SeZnH5ga1VOxTsMg2ywXueoxYceRkD4qNH8B
         BIzA==
X-Gm-Message-State: AOJu0Yz4fsr/zDHqsU9xbzRD0R61oYvzmaIVWHCIafDMHLToZkuAm/mX
	vmL7erAI3A7sMABQaIQr5YyyUhtRoVnJgt8UoDggxt2Z6L77RrMyQ/xdJr17SHLhntpc+RzKNxc
	L
X-Google-Smtp-Source: AGHT+IHFRTIPBkLTovc6sBk1orfXkprlAg9pu5OAg6W1fCodnxsoHqb5aVP6HlJN6NtRL0iH8pmdvQ==
X-Received: by 2002:a17:907:7ba7:b0:a86:7e7f:69ab with SMTP id a640c23a62f3a-a991bd477e4mr1369664966b.15.1728315154199;
        Mon, 07 Oct 2024 08:32:34 -0700 (PDT)
Date: Mon, 7 Oct 2024 17:32:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86/msr: add log messages to MSR state load error paths
Message-ID: <ZwP_EZttiZ78DKPT@macbook.local>
References: <20241007140317.67478-1-roger.pau@citrix.com>
 <765f0d29-8be8-4f53-90df-c9fbeb1eca68@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <765f0d29-8be8-4f53-90df-c9fbeb1eca68@citrix.com>

On Mon, Oct 07, 2024 at 03:16:47PM +0100, Andrew Cooper wrote:
> On 07/10/2024 3:03 pm, Roger Pau Monne wrote:
> > Some error paths in the MSR state loading logic don't contain error messages,
> > which makes debugging them quite hard without adding extra patches to print the
> > information.
> >
> > Add two new log messages to the MSR state load path that print information
> > about the entry that failed to load.
> >
> > No functional change intended.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/hvm/hvm.c | 9 +++++++++
> 
> Can we fix the PV side at the same time too?

Sure, I think that would be XEN_DOMCTL_set_vcpu_msrs?

I've noticed that such hypercall doesn't return an error if the MSR is
not handled by Xen (there's no default case returning an error in the
switch that processes the entries to load).

> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> > index 69a25571db8d..c71087f636c4 100644
> > --- a/xen/arch/x86/hvm/hvm.c
> > +++ b/xen/arch/x86/hvm/hvm.c
> > @@ -1598,10 +1598,19 @@ static int cf_check hvm_load_cpu_msrs(struct domain *d, hvm_domain_context_t *h)
> >              rc = guest_wrmsr(v, ctxt->msr[i].index, ctxt->msr[i].val);
> >  
> >              if ( rc != X86EMUL_OKAY )
> > +            {
> > +                printk(XENLOG_G_ERR
> > +                       "HVM%d.%d load MSR %#x with value %#lx failed: %d\n",
> > +                       d->domain_id, vcpuid, ctxt->msr[i].index,
> > +                       ctxt->msr[i].val, rc);
> 
> Just %pv please.  I don't want to propagate the (occasionally ambiguous)
> HVM%d form.

I also wanted to use %pv here, but it will get out of sync
(style-wise) with the rest of messages of the HVM context loading
logic?  IOW: my preference would be to switch all in one go.

> Also, rc may not be great to render.  It's an X86EMUL_*, not an errno.

Yeah, I know, but at the end it's a message for someone that knows how
to debug the code, so if the error code it's X86EMUL_ based it's at
least bet than not printing it.

> And saying that, we have a discontinuity between PV and HVM.  PV
> translates !OKAY into -EINVAL, whereas HVM translates into -ENXIO.  /sigh

Hm, great, one thing at a time.

Thanks, Roger.

