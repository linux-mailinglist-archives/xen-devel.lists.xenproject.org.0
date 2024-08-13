Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7AA950501
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 14:32:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776199.1186335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdqgc-0007G2-Gr; Tue, 13 Aug 2024 12:31:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776199.1186335; Tue, 13 Aug 2024 12:31:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdqgc-0007Ds-DC; Tue, 13 Aug 2024 12:31:38 +0000
Received: by outflank-mailman (input) for mailman id 776199;
 Tue, 13 Aug 2024 12:31:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EOoy=PM=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sdqgb-0007Dm-Oy
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 12:31:37 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id faafe315-596f-11ef-8776-851b0ebba9a2;
 Tue, 13 Aug 2024 14:31:35 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52fc4388a64so7474339e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 05:31:35 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f414e18csm66916366b.177.2024.08.13.05.31.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 05:31:33 -0700 (PDT)
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
X-Inumbo-ID: faafe315-596f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723552295; x=1724157095; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqxFx2xYlPbcAkqwCPuJRovNTvAAd1SNvXbnyzGNs4E=;
        b=aqaeDxii5g658v0NdfoLEhQHRLfH1cF03mY6VqiQkugUmUv2UKzrZdnIWNVtC+sriA
         zv8eAg3RXRzXLuxnBZdHSmkkQezL7wbCqX6bmuGrcf1EnrIolpbdKlgTGchM+3/3UuRE
         GaV+7vG1TYVxCU09/eGOrxC1zBibC+va6/qSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723552295; x=1724157095;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aqxFx2xYlPbcAkqwCPuJRovNTvAAd1SNvXbnyzGNs4E=;
        b=V3FstXoDPd6/EgR445uC88SwEYbl3G98AzsSQdUgleEjb/JjjXJw3JuB1EEm6L+/Th
         GBujOS6yOYHRh34LBMOlc7UZKKOgMqNxCuscmTXIrm2Mu+M0SbDoss3aTAAk/1y4MntZ
         gxO/dkH6xXTLEGOv0w/SywMO+5ybjM6WOQX9xoJMvNoN6NNHHET/s3NkT0Y162Bn/814
         2wTezOvTvHLfppMlJ16/sMLdSNt8IbafoEgIDKznIw6aFDFHLIr6mq5i5g7ULMZfX5J7
         Cw2vj99bM6w8m7hq8p/5JlmwMoyABTRbgC30UTelmsbTx4TvV721K9bC6QU+hF55KVDV
         fa/w==
X-Forwarded-Encrypted: i=1; AJvYcCV21tE0SICrxPoY9HlKbxJQiABHbR9aisLDx+SsQfuXqPL+RNne017Tm4o7+c0GKg2fB8Z69ost0I/KFr2XkCzQdYP8x9bvs2l5C/nsBLA=
X-Gm-Message-State: AOJu0YzNVj1Ss5B/T87r8ob+2Tb9YfZYfYVWNihzXmvtdcfo8be9gzd2
	LHpLs9bD2sK4qG85exfIXczmCWJf7oLE8IHYuTcPVh19JMFrhWtU8VCh97xBgOs=
X-Google-Smtp-Source: AGHT+IG4C9b2ZDzPM4rPGQ4ZG+GoLFNp97e4Uq7Nbzug96+phMPF/HvYZKlyKPUt40A2yuz1bqROOw==
X-Received: by 2002:ac2:4c42:0:b0:52f:c13f:23d2 with SMTP id 2adb3069b0e04-5321365c5ffmr2234627e87.25.1723552294502;
        Tue, 13 Aug 2024 05:31:34 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Aug 2024 13:31:32 +0100
Message-Id: <D3ESAOBEGK86.32U215K3WTTM2@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Xen-devel"
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/2] x86/fpu: Combine fpu_ctxt and xsave_area in
 arch_vcpu
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.17.0
References: <20240808134150.29927-1-alejandro.vallejo@cloud.com>
 <20240808134150.29927-2-alejandro.vallejo@cloud.com>
 <dea252cf-e853-4eab-a71a-9575f32e9381@suse.com>
In-Reply-To: <dea252cf-e853-4eab-a71a-9575f32e9381@suse.com>

On Mon Aug 12, 2024 at 4:16 PM BST, Jan Beulich wrote:
> On 08.08.2024 15:41, Alejandro Vallejo wrote:
> > --- a/xen/arch/x86/domctl.c
> > +++ b/xen/arch/x86/domctl.c
> > @@ -1344,7 +1344,10 @@ void arch_get_info_guest(struct vcpu *v, vcpu_gu=
est_context_u c)
> >  #define c(fld) (c.nat->fld)
> >  #endif
> > =20
> > -    memcpy(&c.nat->fpu_ctxt, v->arch.fpu_ctxt, sizeof(c.nat->fpu_ctxt)=
);
> > +    memcpy(&c.nat->fpu_ctxt, &v->arch.xsave_area->fpu_sse,
> > +           sizeof(c.nat->fpu_ctxt));
> > +    BUILD_BUG_ON(sizeof(c.nat->fpu_ctxt) !=3D sizeof(fpusse_t));
>
> While it may seem unlikely that it would change going forward, I think
> that such build-time checks should make no implications at all. I.e.
> here the right side ought to be sizeof(v->arch.xsave_area->fpu_sse)
> even if that's longer.

Sounds sensible.

>
> Personally I also think that BUILD_BUG_ON(), just like BUG_ON(), would
> better live ahead of the construct they're for.
>
> Same again in at least one more place.
>
> Jan

Ack, sure.

Cheers,
Alejandro

