Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7C3993FB3
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 09:37:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812689.1225479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy4ld-0003oK-LB; Tue, 08 Oct 2024 07:36:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812689.1225479; Tue, 08 Oct 2024 07:36:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy4ld-0003m3-IW; Tue, 08 Oct 2024 07:36:25 +0000
Received: by outflank-mailman (input) for mailman id 812689;
 Tue, 08 Oct 2024 07:36:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/rYz=RE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sy4lc-0003lp-I9
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 07:36:24 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 048d1a60-8548-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 09:36:23 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a9932aa108cso467971166b.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 00:36:23 -0700 (PDT)
Received: from localhost ([213.195.117.215]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a994f38068fsm276431266b.40.2024.10.08.00.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 00:36:22 -0700 (PDT)
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
X-Inumbo-ID: 048d1a60-8548-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728372983; x=1728977783; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iF4f9ksq05aKSxj7D5QNKeUaUgzLwNZdA8HTt4BDmrE=;
        b=txDngEaB50X2V9BdjJtqkF6K8Iq+OJubWcga6+n6/rBXDi9LyH0XcORCgiqA8VLPhI
         xi0c7kEKY8Q5GwRlMx5B30xH+tApihJ4uNC1fohbJsI1iuboPL13LILsMfrZXJsU2fem
         USsj3xLILMf1YlshRT0AVK2R2nDKDzi8Hawj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728372983; x=1728977783;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iF4f9ksq05aKSxj7D5QNKeUaUgzLwNZdA8HTt4BDmrE=;
        b=HKkzQEllTGT1nDZ1GAwo99dWkKm2RGQ4Qn8rtj+i/IMZ7XXcD1pDBuRHxsO/xeWSHr
         I69yS36ERniwQmII0IUEs6UqN73QwUBWDmEaxUk0gn2YmhzUX0C54fl+QJd095BBd5Tf
         IC5DT8WzCp1bAuMWLL1XYUjFR/6OdaJaz80GFhoo9tBfJHSQm+ZXgkukXhnEihDEjWNH
         vjLmTLfMHYDibI9lXMKqyHqik55R4Nn64XLVXTKiVkj8AsnHu5ipsICZZl/yeyREdfMR
         dLxNX8f98/zG7mEPYUViLCf+B+cRlLMFTY9iEi5Djx4ZrZoDNADyqTTXpPegoouqBKnN
         oFaQ==
X-Gm-Message-State: AOJu0YyQM6n7KDyi2mkwU8uNRcJ34qrqvYqLTAiHN9eSM1sDpzYvias5
	EjXdnKtg68OAohNaBKq1UVQzdOMpHiafW1bR5r2pFp9Dt+6kf7z1M+t0XVXoBZc=
X-Google-Smtp-Source: AGHT+IHclnghXZ31ffSxbInulvSX+uO1wCzVSsUxw0JzyY4u+8do4WiY9sWRMb1TxMWuvsKs6O4gig==
X-Received: by 2002:a17:907:e88:b0:a99:529d:8199 with SMTP id a640c23a62f3a-a99529d8253mr693856266b.62.1728372982628;
        Tue, 08 Oct 2024 00:36:22 -0700 (PDT)
Date: Tue, 8 Oct 2024 09:36:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/msr: add log messages to MSR state load error paths
Message-ID: <ZwTg9ToFSKymnLnm@macbook.local>
References: <20241007140317.67478-1-roger.pau@citrix.com>
 <765f0d29-8be8-4f53-90df-c9fbeb1eca68@citrix.com>
 <ZwP_EZttiZ78DKPT@macbook.local>
 <2e70a742-e996-4748-a716-b88e998af215@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e70a742-e996-4748-a716-b88e998af215@suse.com>

On Tue, Oct 08, 2024 at 08:29:23AM +0200, Jan Beulich wrote:
> On 07.10.2024 17:32, Roger Pau Monné wrote:
> > On Mon, Oct 07, 2024 at 03:16:47PM +0100, Andrew Cooper wrote:
> >> On 07/10/2024 3:03 pm, Roger Pau Monne wrote:
> >>> Some error paths in the MSR state loading logic don't contain error messages,
> >>> which makes debugging them quite hard without adding extra patches to print the
> >>> information.
> >>>
> >>> Add two new log messages to the MSR state load path that print information
> >>> about the entry that failed to load.
> >>>
> >>> No functional change intended.
> >>>
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>> ---
> >>>  xen/arch/x86/hvm/hvm.c | 9 +++++++++
> >>
> >> Can we fix the PV side at the same time too?
> > 
> > Sure, I think that would be XEN_DOMCTL_set_vcpu_msrs?
> > 
> > I've noticed that such hypercall doesn't return an error if the MSR is
> > not handled by Xen (there's no default case returning an error in the
> > switch that processes the entries to load).
> 
> I see
> 
>                 ret = -EINVAL;
>                 ...
>                 switch ( msr.index )
>                 {
>                     ...
>                     if ( guest_wrmsr(v, msr.index, msr.value) != X86EMUL_OKAY )
>                         break;
>                     continue;
>                 }
>                 break;
> 
> which to me means we'll return -EINVAL both when handling an MSR fails (1st
> "break") and when encountering an unhandled MSR (2nd "break").

Oh, I see, I was expecting a construct similar to the one used in
hvm_load_cpu_msrs() and didn't spot that continue.  The logic there is
very obfuscated IMO.

> >>> --- a/xen/arch/x86/hvm/hvm.c
> >>> +++ b/xen/arch/x86/hvm/hvm.c
> >>> @@ -1598,10 +1598,19 @@ static int cf_check hvm_load_cpu_msrs(struct domain *d, hvm_domain_context_t *h)
> >>>              rc = guest_wrmsr(v, ctxt->msr[i].index, ctxt->msr[i].val);
> >>>  
> >>>              if ( rc != X86EMUL_OKAY )
> >>> +            {
> >>> +                printk(XENLOG_G_ERR
> >>> +                       "HVM%d.%d load MSR %#x with value %#lx failed: %d\n",
> >>> +                       d->domain_id, vcpuid, ctxt->msr[i].index,
> >>> +                       ctxt->msr[i].val, rc);
> >>
> >> Just %pv please.  I don't want to propagate the (occasionally ambiguous)
> >> HVM%d form.
> > 
> > I also wanted to use %pv here, but it will get out of sync
> > (style-wise) with the rest of messages of the HVM context loading
> > logic?  IOW: my preference would be to switch all in one go.
> 
> I deliberately started using %pv when touching hvm_save() somewhat recently.
> So there is some inconsistency right now anyway, and I guess we'll want to
> move to the new form as we touch code in this area.

Ack, will adjust to use "HVM %pv" then.

Thanks, Roger.

