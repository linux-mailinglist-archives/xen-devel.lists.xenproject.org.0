Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B12C48ACE69
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 15:37:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709965.1109016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rytpZ-0000b5-4d; Mon, 22 Apr 2024 13:35:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709965.1109016; Mon, 22 Apr 2024 13:35:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rytpZ-0000Xs-0x; Mon, 22 Apr 2024 13:35:37 +0000
Received: by outflank-mailman (input) for mailman id 709965;
 Mon, 22 Apr 2024 13:35:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ds6W=L3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rytpY-0000Xl-CF
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 13:35:36 +0000
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [2607:f8b0:4864:20::f29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3255bca6-00ad-11ef-909a-e314d9c70b13;
 Mon, 22 Apr 2024 15:35:35 +0200 (CEST)
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-6a04bae512aso14411256d6.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 06:35:35 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 p11-20020a0c9a0b000000b0069b32845235sm4303587qvd.85.2024.04.22.06.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 06:35:33 -0700 (PDT)
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
X-Inumbo-ID: 3255bca6-00ad-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713792934; x=1714397734; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yZEe+Nm+RwNMQXXAkNv8dAA2e8DlBbGxmsahoeqCiKI=;
        b=F0N1Zus0QjUlKl67EWpJxfkTZKhddIQRCYlqqhDGvwktlP1tJ1Mlvzwx6ZS2hu/xcV
         JKRLJIgghZ2svyo4KpMrclFeQWzczedZtaKFxvAHX0xfQxIMrrSH9wKPyTCTFH0A7p98
         syQ0mJ/Y/HuM1256z9UofHjPDuMiKhHE0M+Yg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713792934; x=1714397734;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yZEe+Nm+RwNMQXXAkNv8dAA2e8DlBbGxmsahoeqCiKI=;
        b=widINTzJGKEQ7NDxrY5EsCCmAHa3Ww3ANz7MadtQ4GhJWJOqP8/Aw/eBrxhFyrEmYP
         nXqhMRJhsgFpIXVTscp8SKZ7DGEHUvSOpsJulJhQZqdW9RAKLal3D4Ke/7yaaup4q6iR
         GEkoIFfYfxRr4Cv/hBYqfekAH6A20LA3tMLuPDC6hrQcnk2/6jIFgiXOJVVWQ4ay6oSQ
         IQatRc17ZyMPr2iT5gI65EIkC5LKEwC9RHROtXOTbZbILJJCNCktImSCSfAjTJo/IZLG
         AUsnMEDUHfa4GO3idy2cAGf9wiPrA4Jq9CELpL4a1K3i9V1aXJz64WcO76amrixpRyw7
         kCbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWavHJ1r2TbIb9dclIRuHqObplUXLLHW0HsTgYEYfuY7v8f8AkCpRsYGFgbh6ZvRvfIPaGHkKFPWxenmm2IYRcXpp3Ohj8pa0wxdSQvD0A=
X-Gm-Message-State: AOJu0YyTNX/maJYypB+C0pw1tzbKADnQY6y//HNgrEJqBd+mOoTHJoYh
	3X5QIJ061/GRkJvRWBaxh2Lif5g7Vz8b0m8vDcYRWOr+9khEA8c24pEwt4obDA0=
X-Google-Smtp-Source: AGHT+IEfABCB2aPQAspxisP4eVAMF5sQvq/gW2fRB0yThUS1zDboi2mEzbhTZbkulHMFJ+F/DTexbQ==
X-Received: by 2002:a05:6214:1152:b0:6a0:81fb:2cbf with SMTP id b18-20020a056214115200b006a081fb2cbfmr2362612qvt.34.1713792934009;
        Mon, 22 Apr 2024 06:35:34 -0700 (PDT)
Date: Mon, 22 Apr 2024 15:35:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/2] x86/spec: adjust logic to logic that elides lfence
Message-ID: <ZiZno9TUAG_gaqXg@macbook>
References: <20240418155208.7771-1-roger.pau@citrix.com>
 <20240418155208.7771-3-roger.pau@citrix.com>
 <26b9cbda-4f9b-4ddf-ab27-643e6f78b076@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26b9cbda-4f9b-4ddf-ab27-643e6f78b076@suse.com>

On Fri, Apr 19, 2024 at 08:25:00AM +0200, Jan Beulich wrote:
> On 18.04.2024 17:52, Roger Pau Monne wrote:
> > It's currently too restrictive by just checking whether there's a BHB clearing
> > sequence selected.  It should instead check whether BHB clearing is used on
> > entry from PV or HVM specifically.
> > 
> > Switch to use opt_bhb_entry_{pv,hvm} instead, and then remove cpu_has_bhb_seq
> > since it no longer has any users.
> > 
> > Reported-by: Jan Beulich <jbeulich@suse.com>
> > Fixes: 954c983abcee ('x86/spec-ctrl: Software BHB-clearing sequences')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Except for the odd double "logic" in the title:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks, title should be:

"adjust logic that elides lfence"

It was just a typo, I didn't intended to express anything additional.

> I can't really guess what is meant instead, so in order to possibly adjust
> while committing I'll need a hint. But committing will want to wait until
> Andrew has taken a look anyway, just like for patch 1.
> 
> > There (possibly) still a bit of overhead for dom0 if BHB clearing is not used
> > for dom0, as Xen would still add the lfence if domUs require it.
> 
> Right, but what do you do.
> 
> > --- a/xen/arch/x86/include/asm/cpufeature.h
> > +++ b/xen/arch/x86/include/asm/cpufeature.h
> > @@ -235,9 +235,6 @@ static inline bool boot_cpu_has(unsigned int feat)
> >  #define cpu_bug_fpu_ptrs        boot_cpu_has(X86_BUG_FPU_PTRS)
> >  #define cpu_bug_null_seg        boot_cpu_has(X86_BUG_NULL_SEG)
> >  
> > -#define cpu_has_bhb_seq        (boot_cpu_has(X86_SPEC_BHB_TSX) ||       \
> > -                                boot_cpu_has(X86_SPEC_BHB_LOOPS))
> 
> Might be worth also mentioning in the description that this construct was
> lacking use of X86_SPEC_BHB_LOOPS_LONG (might even warrant a 2nd Fixes:
> tag).

Heh, no, X86_SPEC_BHB_LOOPS_LONG is added in addition to
X86_SPEC_BHB_LOOPS.   When using long loops we have both
X86_SPEC_BHB_LOOPS and X86_SPEC_BHB_LOOPS_LONG set (I know it's
confusing, I was also confused the first time and asked Andrew the
same question).  See the fallthrough in bhi_calculations().

Thanks, Roger.

