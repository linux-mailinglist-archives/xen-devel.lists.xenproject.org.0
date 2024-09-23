Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A669197E6CF
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 09:47:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801688.1211664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssdmB-0003tD-2X; Mon, 23 Sep 2024 07:46:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801688.1211664; Mon, 23 Sep 2024 07:46:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssdmA-0003qj-W9; Mon, 23 Sep 2024 07:46:30 +0000
Received: by outflank-mailman (input) for mailman id 801688;
 Mon, 23 Sep 2024 07:46:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=darJ=QV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ssdmA-0003qd-40
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 07:46:30 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f15c7e07-797f-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 09:46:29 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a8a837cec81so304354566b.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 00:46:29 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c42bb49289sm9893255a12.1.2024.09.23.00.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 00:46:27 -0700 (PDT)
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
X-Inumbo-ID: f15c7e07-797f-11ef-a0b9-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727077588; x=1727682388; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f2+oYaRbaD8kMLr1zaybDibMCKqr9LrRgKHbhIO0Eo4=;
        b=FEJ/Nd32ALL+lro3886yQ2zB5HvbhM25eQEBKVq1BQ37NYsqzkGceIshI0k2PVYZEe
         Vet6tlOxT1DbfqyphhCJgEijtkyLbcuCFrOBS5+wRJLICVF5pSHqVO/VUn20LDMBSKdW
         I7KLZ8ucroL/COI0pgYm57cLrQKQH6ijMNS7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727077588; x=1727682388;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f2+oYaRbaD8kMLr1zaybDibMCKqr9LrRgKHbhIO0Eo4=;
        b=ht5tbRaTQyJu2BVfv8Rv4YmGO79lGWSivKT9ti1SoxAQTnaxVvs9LDUIc3twNBRSlH
         MfXgc5OGiEUmmWRe+B/gGWDKyXWlADR4C+ho2heDMpkL4S/JUQqTSNPZJLT2Iqmk2/r8
         MAUL2Yl6okgIoC9iMvEF3WC6iqN9VFNWpHLnnE6g0+Q/hfH5l2R7HBURj+H3BbV0099v
         DeXHrHTY3gEP/sZYRAs6WB60FT3hVTn2rvraC7luzyj+o5s8X1V2XsMSM0aHW0OcpcZG
         Xz/roIqlGchzFL/7B0ZBs0Piny5zwCYt6Mq/sufWKkL2OUm02NYoOEGMkYpadI+eK8tp
         t8TQ==
X-Gm-Message-State: AOJu0Yx0dGHO4P7DIQc8vOqUTQ5HhuXARUzs/jPEpwD6Fnj7a8ilHaPG
	Qhy2+ClnQRaQkEVEjorY3m1adRutpQa9SsFPXIJVMN+c0HjmPjELFw4XkQuF290=
X-Google-Smtp-Source: AGHT+IEBb5SBUZFe56U2lxG9ToQQ78kIO2C2OavTktpCXDXbnwrMbBnnJu5UE3rkrkZQ4iBH75DStw==
X-Received: by 2002:a05:6402:234f:b0:5c5:c536:5fe0 with SMTP id 4fb4d7f45d1cf-5c5c5366037mr581705a12.21.1727077588425;
        Mon, 23 Sep 2024 00:46:28 -0700 (PDT)
Date: Mon, 23 Sep 2024 09:46:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH 1/3] xen/livepatch: simplify and unify logic in
 prepare_payload()
Message-ID: <ZvEc0qpq2fTJtMjo@macbook.local>
References: <20240920093656.48879-1-roger.pau@citrix.com>
 <20240920093656.48879-2-roger.pau@citrix.com>
 <d7dfa01e-740d-4274-b9fb-8475224ae7a6@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7dfa01e-740d-4274-b9fb-8475224ae7a6@citrix.com>

On Sun, Sep 22, 2024 at 11:19:01AM +0200, Andrew Cooper wrote:
> On 20/09/2024 11:36 am, Roger Pau Monne wrote:
> > diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
> > index d93a556bcda2..cea47ffe4c84 100644
> > --- a/xen/common/livepatch.c
> > +++ b/xen/common/livepatch.c
> > @@ -647,15 +647,37 @@ static inline int livepatch_check_expectations(const struct payload *payload)
> >      nhooks = __sec->sec->sh_size / sizeof(*hook);                                         \
> >  } while (0)
> >  
> > +static int fetch_buildid(const struct livepatch_elf_sec *sec,
> > +                         struct livepatch_build_id *id)
> 
> Is this really fetch?  I'd describe it as parse, more than fetch.

I can indeed change the naming.  I've used fetch because it 'fetches'
the contents of livepatch_build_id.

> > +{
> > +    const Elf_Note *n = sec->load_addr;
> > +    int rc;
> > +
> > +    ASSERT(sec);
> 
> This needs to turn back into a runtime check.  Now, if a livepatch is
> missing one of the sections, we'll dereference NULL below, rather than
> leaving no data in the struct livepatch_build_id.

Loading should never get here without those sections being present,
check_special_sections() called earlier will return error if any of
the sections is not present, hence the ASSERT() is fine IMO.

I could do `if ( !sec ) { ASSERT_UNREACHABLE(); return -ENOENT; }`,
but given the code in check_special_sections() that checks the section
presence just ahead it seemed unnecessary convoluted.

Thanks, Roger.

