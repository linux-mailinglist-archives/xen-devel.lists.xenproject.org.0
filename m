Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D779872CA
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 13:29:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805392.1216485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stmgC-00034t-GM; Thu, 26 Sep 2024 11:29:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805392.1216485; Thu, 26 Sep 2024 11:29:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stmgC-00032N-DH; Thu, 26 Sep 2024 11:29:04 +0000
Received: by outflank-mailman (input) for mailman id 805392;
 Thu, 26 Sep 2024 11:29:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ahor=QY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1stmgA-00031S-S3
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 11:29:02 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86e473d3-7bfa-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 13:29:00 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8d3cde1103so120369466b.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 04:29:00 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930caeaesm337289666b.115.2024.09.26.04.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 04:28:59 -0700 (PDT)
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
X-Inumbo-ID: 86e473d3-7bfa-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727350140; x=1727954940; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aA8w/iSHTxPs00xgyF2Ja1fkEJqx/nLZfSmrw2B58V4=;
        b=dcILZLT/EWUTBF98VJzR0RaEeV4qmRPrC2LN6ycxD8cpfbx1penU6OqNhulJsDOC+5
         kvum0zcUHepXapc7uaibQz6bYZ2oOOamELf9GnLK2PGtYs87hCqBb7nt9ClAqCCVuRL4
         mJfkZUTPl97VctM9pUHLuZuNLt7LETpSAf4rA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727350140; x=1727954940;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aA8w/iSHTxPs00xgyF2Ja1fkEJqx/nLZfSmrw2B58V4=;
        b=e24SawpFy391LNo9S2V2afouWtyS13rEJBnF5l37Ia6gLd6gq+Q/+uqypUZnGbXA+q
         W9aHuody8JQXbXr0dW4G74/GaE8BkSD4oKNCELulCPFPK/2HCsiWPe0kOBSNmtZs4BkQ
         3nfzaGSJHhSCrDruym55CKZzIgrEi9gHmasq9ANqCjhl6xS8LlCngf+ZwbEkydbd2W0f
         1JTu7hDvupwvBQARugmmBBXU9H8sVsVIID87XVIQdBx61G/VE/ea3SGaY2n45SIZGNTy
         ewtjE7jV6E1FE1J/TQdEU3vEo9WYL21ugrdjxF7VC9+dEP3hGB3CIp8Sgeua8uQ9g2mZ
         oBdQ==
X-Gm-Message-State: AOJu0YxH//iHOPK1F8HAb9BlmQ3kIQsoLgWNDXDt0ltpOUgiZTZ3RHLd
	U3w5M77h0PIEyo4MS4fyRWiXoMTwC0pLP+GKMTPqqPNlX9YmWXihkvWhNSdOSPQ=
X-Google-Smtp-Source: AGHT+IE9aVIzozdJNTAwHuonksMxyM4LceUQITI2MEDWBVsaa2LBPZBpae6QHWALpRSxWhWRsMTf0g==
X-Received: by 2002:a17:906:c114:b0:a86:a6ee:7dad with SMTP id a640c23a62f3a-a93a061b814mr556122266b.52.1727350140179;
        Thu, 26 Sep 2024 04:29:00 -0700 (PDT)
Date: Thu, 26 Sep 2024 13:28:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH v3 4/5] x86/alternatives: do not BUG during apply
Message-ID: <ZvVFe9H3lHjbE7Tf@macbook.local>
References: <20240926101431.97444-1-roger.pau@citrix.com>
 <20240926101431.97444-5-roger.pau@citrix.com>
 <8b15cdc0-93a8-44bb-ac2c-c97bebd28570@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b15cdc0-93a8-44bb-ac2c-c97bebd28570@citrix.com>

On Thu, Sep 26, 2024 at 12:09:05PM +0100, Andrew Cooper wrote:
> On 26/09/2024 11:14 am, Roger Pau Monne wrote:
> > diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
> > index 7824053c9d33..990b7c600932 100644
> > --- a/xen/arch/x86/alternative.c
> > +++ b/xen/arch/x86/alternative.c
> > @@ -198,9 +198,29 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
> >          uint8_t buf[MAX_PATCH_LEN];
> >          unsigned int total_len = a->orig_len + a->pad_len;
> >  
> > -        BUG_ON(a->repl_len > total_len);
> > -        BUG_ON(total_len > sizeof(buf));
> > -        BUG_ON(a->cpuid >= NCAPINTS * 32);
> > +        if ( a->repl_len > total_len )
> > +        {
> > +            printk(XENLOG_ERR
> > +                   "alt for %ps, replacement size %#x larger than origin %#x\n",
> 
> "Alt" I think.  It's both an abbreviation, and the start of the sentence
> here.

I'm always unsure whether to use uppercase at the beginning of log
messages, because those are preceded by the (XEN) prefix.

> Can fix on commit.
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks, Roger.

