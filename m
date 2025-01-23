Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E22BA1A46F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2025 13:42:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876202.1286571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tawX1-00035x-Nf; Thu, 23 Jan 2025 12:41:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876202.1286571; Thu, 23 Jan 2025 12:41:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tawX1-00033u-Kz; Thu, 23 Jan 2025 12:41:59 +0000
Received: by outflank-mailman (input) for mailman id 876202;
 Thu, 23 Jan 2025 12:41:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lw3w=UP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tawWz-00033o-Nb
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 12:41:57 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d830d1c-d987-11ef-a0e5-8be0dac302b0;
 Thu, 23 Jan 2025 13:41:55 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5d0d32cd31aso1342490a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 04:41:55 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5db8942cad4sm8755221a12.60.2025.01.23.04.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 04:41:53 -0800 (PST)
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
X-Inumbo-ID: 6d830d1c-d987-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737636115; x=1738240915; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wSfzTFylqFzgb4b+vtSRkFUXylJhpaSO7FXRQJJL0Y0=;
        b=kvKklMU32aBgtupgy1iAp10gHQFxGRVGBAoQ9ZKhggsgsbb4/DFeiQS+mKB7MrrCNO
         8U1T54GpEpoKkK5aX4gw608wcRsHIiyTov/JidN2n2iLwzu5stQZMBRVXFtHHpUgx71i
         GpAPNH0D+5rqvlTftz7tp6Xg8/x+rMDWB/YQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737636115; x=1738240915;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wSfzTFylqFzgb4b+vtSRkFUXylJhpaSO7FXRQJJL0Y0=;
        b=ngJO64g0ntOoTOerGfnpzHY46AENHl9CkXah8LZeeJrcHkBampgM71CkLPLMQgJVNM
         dHdOSkfTDV9L7PmZTlP2RCp+QQUkZJwpO2mn0V2x4w0+YLacUHZ3yxSfmcAuUSLLY7c/
         +i31cP4OTQ7C0Yw0wwYKzfSWpV00631+LP1rFtIdg2mYFcFP5UA84QWo8pCgfqNklDvr
         wVqydeq3g1fVNbp8CDs6Zcutc2WidFAlPbyhYggACkg5KVDCXt74Pbvca2I2jZIRN96Z
         5DtpXc7jIiWhVbEwN3QOUvhBS2V/Briod4/I6zIJYh/vk7urc8un9Iv0Exty97g6CcOZ
         EuPg==
X-Gm-Message-State: AOJu0Yx3NMmQvu9HpAs+9sd8OLfAM99i8eRyfMM+53dX1AH7H0nxvslS
	1E59ZajcB2n6cIfewyfdzOGP2Bte6Rs143Gvs3ywVgXnr7b81SbSaFQI6yHNT1A=
X-Gm-Gg: ASbGncsIv42bQ3VxnVA4BoKtp+xaEoH6moe4a956ZdsboU5khZyFRytL7B0gA5bDOZr
	/tnjd3MM9YEcz6Lx85mfzSqZU2vaRG6OkJh+I/HASWgXmyGToB5BDrO98JiDbSyHyLf4urjPf0d
	nOXor1I2RDVvR2O7Gezphqryy4KhDCFavc3Gj/V8dlLri8LDJa7ELOOZEr+Qe3e7bzdeHkp/GkA
	YWTAEX2Km4Jk0cDBvk1x1dQ3J3JyvSfqm8TD8sXGRzmGUpN7OVbLUoby5J3V8tw165b78X1ku1R
	2PKjbZo/bYBeyzU=
X-Google-Smtp-Source: AGHT+IHMi9avWuM8RRIxXQhv9boDsJdHvKz0oBUJ4L3IHU5SBb/3Y0qRrQo+Dj82ROdWmdUfw5Gvog==
X-Received: by 2002:a05:6402:2745:b0:5d0:bf5e:eb8 with SMTP id 4fb4d7f45d1cf-5db7db07846mr57108083a12.23.1737636115052;
        Thu, 23 Jan 2025 04:41:55 -0800 (PST)
Date: Thu, 23 Jan 2025 13:41:51 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>
Subject: Re: [PATCH v3 02/12] x86/HVM: improve CET-IBT pruning of ENDBR
Message-ID: <Z5I5D_uVxijLF6sK@macbook.local>
References: <293e5aef-8843-461c-bc96-709a605b2680@suse.com>
 <537b0d9c-1936-4cf5-a012-d50b1097a22d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <537b0d9c-1936-4cf5-a012-d50b1097a22d@suse.com>

On Mon, Feb 26, 2024 at 05:42:20PM +0100, Jan Beulich wrote:
> __init{const,data}_cf_clobber can have an effect only for pointers
> actually populated in the respective tables. While not the case for SVM
> right now, VMX installs a number of pointers only under certain
> conditions. Hence the respective functions would have their ENDBR purged
> only when those conditions are met. Invoke "pruning" functions after
> having copied the respective tables, for them to install any "missing"
> pointers.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> This is largely cosmetic for present hardware, which when supporting
> CET-IBT likely also supports all of the advanced VMX features for which
> hook pointers are installed conditionally. The only case this would make
> a difference there is when use of respective features was suppressed via
> command line option (where available). For future hooks it may end up
> relevant even by default, and it also would be if AMD started supporting
> CET-IBT; right now it matters only for .pi_update_irte, as iommu_intpost
> continues to default to off.
> 
> Originally I had meant to put the SVM and VMX functions in presmp-
> initcalls, but hvm/{svm,vmx}/built_in.o are linked into hvm/built_in.o
> before hvm/hvm.o. And I don't think I want to fiddle with link order
> here.
> ---
> v3: Re-base.
> v2: Use cpu_has_xen_ibt in prune_{svm,vmx}().
> 
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -161,10 +161,15 @@ static int __init cf_check hvm_enable(vo
>      else if ( cpu_has_svm )
>          fns = start_svm();
>  
> +    if ( fns )
> +        hvm_funcs = *fns;
> +
> +    prune_vmx();
> +    prune_svm();

Isn't it actually the opposite of pruning.  What the helpers do is
fill all the pointers in the structure.  I would rather name them
{vmx,svm}_fill_hvm_funcs() or similar.  And possibly pull the
cpu_has_xen_ibt check outside the functions:

if ( cpu_has_xen_ibt )
{
    /*
     * Now that svm_function_table was copied, populate all function pointers
     * which may have been left at NULL, for __initdata_cf_clobber to have as
     * much of an effect as possible.
     */
    vmx_fill_hvm_funcs();
    svm_fill_hvm_funcs();
}

I would be nice to avoid directly exporting more vmx and smv specific
helpers, as if we ever want to compile out vmx or svm it would be more
churn to deal with those.  I however cannot think of any good way to
do this here, so it's fine to export those functions.

Thanks, Roger.

