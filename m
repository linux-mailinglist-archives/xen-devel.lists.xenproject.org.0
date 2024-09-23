Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8651497EEC8
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 18:03:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802221.1212422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sslWN-0002ye-LF; Mon, 23 Sep 2024 16:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802221.1212422; Mon, 23 Sep 2024 16:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sslWN-0002wG-Hq; Mon, 23 Sep 2024 16:02:43 +0000
Received: by outflank-mailman (input) for mailman id 802221;
 Mon, 23 Sep 2024 16:02:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=darJ=QV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sslWL-0002v4-Qr
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 16:02:41 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 427cad9a-79c5-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 18:02:41 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a8a7596b7dfso70925766b.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 09:02:41 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612b39f9sm1245603366b.138.2024.09.23.09.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 09:02:39 -0700 (PDT)
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
X-Inumbo-ID: 427cad9a-79c5-11ef-a0b9-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727107360; x=1727712160; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n5ROEncrBMfpxSqL9Z+nvphLXJ3AFRjRSlJrEPwgRNg=;
        b=qJ2+9EeQt+KDPlST3sr1oAN6iuNENKiXkoPG4ysfj1ya5h//LP4Ypg8iORfzATsFku
         WtHpeJaWwLD/7HFVB14iMx3xjOHFfSGCU1fSHXK5psU6WfKs73kCbvr4csrNrjDwHjVS
         UTUmE45Rd5L/1uBOdKFwluE3hQj8w6/zrcAx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727107360; x=1727712160;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n5ROEncrBMfpxSqL9Z+nvphLXJ3AFRjRSlJrEPwgRNg=;
        b=n9eaOmYdHbAOrFd91Nt0Lck5Y67Jt5dL0za2btSjztMHkIIpuE8MoOfhk0WzUrRUeM
         wC+toMXswu+EWQdpks4W4hHzxLE96vhT8a0STvhyUlOrQb08aGhMIaNzsrPIeML2tp58
         RrNFKRqTUxB6A/R3Oo8uMPwIz9zyrDgCIzXho5c2T0DBVw+rmpku1NZlsBzMYJDpxwqi
         2lupBRpgjoIeJWVwTqZxH4TdOQNdm9u6eQMUan4HqOjcx4UrFbLk5fYexgbnvPH0asLp
         ZFEeRMTFrXBNtBa4fKtSRimhSwvNOt/M/h3TFt0a2k5fyNNwMoGRY6R/G8grGxUGnWM1
         xMWQ==
X-Gm-Message-State: AOJu0YzJQ3s5ha5S6AP1GZfByhkhRSf6bwFP+TF35vg+8t+OcEBBrlQA
	hZQflietBFhouK8LkYKzKMcW2ea8kZtcDfAeUjimAFfsuFEApifno5D2fyjA64Sm/T2GO+mjnAN
	b
X-Google-Smtp-Source: AGHT+IHqVB8X2iRjEdlkyX3Gj6YxaHgpyxjYNAR47HruH3uVjG73ZaRBxyVHzvA6+8B2pj23yl/VSg==
X-Received: by 2002:a17:907:94ca:b0:a8d:42ec:e65d with SMTP id a640c23a62f3a-a92c47e382dmr15917166b.7.1727107359728;
        Mon, 23 Sep 2024 09:02:39 -0700 (PDT)
Date: Mon, 23 Sep 2024 18:02:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH 2/3] xen/livepatch: do Xen build-id check earlier
Message-ID: <ZvGRHjWVQvi1Yf2I@macbook.local>
References: <20240920093656.48879-1-roger.pau@citrix.com>
 <20240920093656.48879-3-roger.pau@citrix.com>
 <9ca4d235-5e6a-4ee0-9cc4-721b761572d3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ca4d235-5e6a-4ee0-9cc4-721b761572d3@citrix.com>

On Mon, Sep 23, 2024 at 12:04:30PM +0100, Andrew Cooper wrote:
> On 20/09/2024 10:36 am, Roger Pau Monne wrote:
> > The check against the expected Xen build ID should be done ahead of attempting
> > to apply the alternatives contained in the livepatch.
> >
> > If the CPUID in the alternatives patching data is out of the scope of the
> > running Xen featureset the BUG() in _apply_alternatives() will trigger thus
> > bringing the system down.  Note the layout of struct alt_instr could also
> > change between versions.  It's also possible for struct exception_table_entry
> > to have changed format, hence possibly leading to other errors.
> >
> > Move the Xen build ID check to be done ahead of any processing of the livepatch
> > payload sections.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/common/livepatch.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
> > index cea47ffe4c84..3e4fce036a1c 100644
> > --- a/xen/common/livepatch.c
> > +++ b/xen/common/livepatch.c
> > @@ -767,6 +767,11 @@ static int prepare_payload(struct payload *payload,
> >      if ( rc )
> >          return rc;
> >  
> > +    /* Perform the Xen build-id check ahead of doing any more processing. */
> > +    rc = xen_build_id_dep(payload);
> > +    if ( rc )
> > +        return rc;
> > +
> 
> While a step in the right direction, I think this needs to be moved far
> earlier.  Even here, it's behind the processing of the livepatch func
> state, which is something that can also change like alt_instr.
> 
> The buildid checks need to be as early as possible.  Looking through the
> logic (which doesn't have great names/splits), I'd say the buildid
> checks want to be between livepatch_elf_load() (which parses the
> structure of the ELF), and move_payload() (which starts copying it into
> place).
> 
> That would involve moving check_special_sections() too, but I think it's
> the right thing to do.

My plan would be to move check_special_sections() ahead and expand its
logic to also check that the expected buildid matches the running
hypervisor one.

Thanks, Roger.

