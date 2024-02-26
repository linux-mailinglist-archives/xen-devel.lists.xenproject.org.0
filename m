Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C482866BED
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 09:17:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685298.1065769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reWAG-0007eX-1K; Mon, 26 Feb 2024 08:16:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685298.1065769; Mon, 26 Feb 2024 08:16:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reWAF-0007d4-Uo; Mon, 26 Feb 2024 08:16:43 +0000
Received: by outflank-mailman (input) for mailman id 685298;
 Mon, 26 Feb 2024 08:16:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CwqN=KD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1reWAE-0007cy-Gl
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 08:16:42 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e430e56-d47f-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 09:16:40 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-512a65cd2c7so3873876e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 00:16:40 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 a12-20020a0ce34c000000b0068fa7e73367sm2630439qvm.42.2024.02.26.00.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 00:16:39 -0800 (PST)
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
X-Inumbo-ID: 5e430e56-d47f-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708935400; x=1709540200; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vs+kulZx0w00Y5wFeWg8vZZaaFGqzBJJwJkTF/Xc0/o=;
        b=T0PgZNSt9+ZHiRff0gbqZXR6UDLJ1xALRv7giJE3Yo7255vMNHgZ+wgcFoFZsyoNhL
         Db/HZgy6V2Y8LLSskdX+OqU8g2JpE60wPHwCjJcKEk8hAvV1M0I5gdfSkC2fXpi3ZMO6
         qqd6BdAfmsKV8A1wDvJVOjr/MPi0WQOhO+f2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708935400; x=1709540200;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vs+kulZx0w00Y5wFeWg8vZZaaFGqzBJJwJkTF/Xc0/o=;
        b=WYk5Gz83DXr2gGZXnPXSEUkfasjVVfqU/+vP4N9jgbLa/j5N/MSsCJWFsMPteHr/rv
         lQzKmKZMbc831YQPFUMoZPBVNMZ4P/I3SPapyeeb7qHc2BNlG0RSYv4vYQnn3qR/EdQz
         dR09looIS4XA01VWE5LeIKX1h8W32ECY9nghcTTYtFB0U7J60K4AXPOXZ4ypFttoLs0G
         HDCQ+dDJvpP6NnNM/J6PVO4nM2yfTrjsaAKaFizj3l+xriuFXrowNz5MOulcMUToABSp
         iCm+FeuqgxX37FNQ8vN8Vp1acQkD5L/xLQTTE5v6FCKJtouKrWMo/em2blVYrytDQ/UQ
         BLkA==
X-Gm-Message-State: AOJu0YzKxop16jdyeQ8Y9OdlOsuG9+urQ18kB1uZN8vt/crd2dn+/1H5
	dLbFRA6EBTyeXZ8a4A89okm9ZcEgiL6Pj7YvhNm615Fck+c1JbVzIZXDGEOlUCI=
X-Google-Smtp-Source: AGHT+IGIJPy6uhZPQVjw/b+dE5KZwktCIodv3efAYz03UnPQ3OD2PgR9pgYE718A2NPYX4MkmJmBGQ==
X-Received: by 2002:a05:6512:3dac:b0:512:ed33:c16 with SMTP id k44-20020a0565123dac00b00512ed330c16mr4932678lfv.8.1708935399824;
        Mon, 26 Feb 2024 00:16:39 -0800 (PST)
Date: Mon, 26 Feb 2024 09:16:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH 3/5] xen/livepatch: fix norevert test attempt to
 open-code revert
Message-ID: <ZdxI3z1LYUkk7WkY@macbook>
References: <20231130142944.46322-1-roger.pau@citrix.com>
 <20231130142944.46322-4-roger.pau@citrix.com>
 <CAG7k0ErX0yydgTyZQM=CU+7ZgWnrvqJGXRGmUtM8=O9_UH=12A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG7k0ErX0yydgTyZQM=CU+7ZgWnrvqJGXRGmUtM8=O9_UH=12A@mail.gmail.com>

On Fri, Feb 23, 2024 at 10:10:38AM +0000, Ross Lagerwall wrote:
> On Thu, Nov 30, 2023 at 2:30 PM Roger Pau Monne <roger.pau@citrix.com> wrote:
> > diff --git a/xen/test/livepatch/xen_action_hooks_norevert.c b/xen/test/livepatch/xen_action_hooks_norevert.c
> > index 3e21ade6abfc..074f8e1d56ce 100644
> > --- a/xen/test/livepatch/xen_action_hooks_norevert.c
> > +++ b/xen/test/livepatch/xen_action_hooks_norevert.c
> > @@ -96,26 +96,14 @@ static int revert_hook(livepatch_payload_t *payload)
> >
> >  static void post_revert_hook(livepatch_payload_t *payload)
> >  {
> > -    int i;
> > +    unsigned long flags;
> >
> >      printk(KERN_DEBUG "%s: Hook starting.\n", __func__);
> >
> > -    for (i = 0; i < payload->nfuncs; i++)
> > -    {
> > -        const struct livepatch_func *func = &payload->funcs[i];
> > -        struct livepatch_fstate *fstate = &payload->fstate[i];
> > -
> > -        BUG_ON(revert_cnt != 1);
> > -        BUG_ON(fstate->applied != LIVEPATCH_FUNC_APPLIED);
> > -
> > -        /* Outside of quiesce zone: MAY TRIGGER HOST CRASH/UNDEFINED BEHAVIOR */
> > -        arch_livepatch_quiesce();
> > -        common_livepatch_revert(payload);
> > -        arch_livepatch_revive();
> > -        BUG_ON(fstate->applied == LIVEPATCH_FUNC_APPLIED);
> > -
> > -        printk(KERN_DEBUG "%s: post reverted: %s\n", __func__, func->name);
> > -    }
> > +    local_irq_save(flags);
> > +    revert_payload(payload);
> 
> Should this check or assert the return value of revert_payload()?

Hm, yes, why not.  I will put this inside of a BUG_ON(), as
post-revert hook doesn't return any value.

Thanks, Roger.

