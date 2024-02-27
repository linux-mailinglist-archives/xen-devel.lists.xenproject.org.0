Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E428D868E9B
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 12:19:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686008.1067506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1revTz-0004R3-2T; Tue, 27 Feb 2024 11:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686008.1067506; Tue, 27 Feb 2024 11:18:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1revTy-0004P4-VU; Tue, 27 Feb 2024 11:18:46 +0000
Received: by outflank-mailman (input) for mailman id 686008;
 Tue, 27 Feb 2024 11:18:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7gEZ=KE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1revTx-0004Oy-Dz
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 11:18:45 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7561ae6-d561-11ee-a1ee-f123f15fe8a2;
 Tue, 27 Feb 2024 12:18:43 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-512f5484a37so3669889e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Feb 2024 03:18:43 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 kr3-20020a0562142b8300b0068fd10638c0sm4012956qvb.20.2024.02.27.03.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 03:18:42 -0800 (PST)
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
X-Inumbo-ID: f7561ae6-d561-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709032723; x=1709637523; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H6XqcWk1QCsXWbFTmS8LaYKzCZDVJ7qxVs8gVsVfhhQ=;
        b=ug/hxxkmC0FtyCIKRZA/+g2e0w9scwRRXIXILvEWPVP2YkfTylkbz+jjsKWV7wDfnu
         mNQwyyCIrImG6TO97u97A55vuJZwyN9QsE5vSPsn9OqWB2bj9OlHiu3wDqPsvr1/9Hiu
         /r9PSCcuoXPv/g5rulE7r8vlw2+qyUI2IVGIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709032723; x=1709637523;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H6XqcWk1QCsXWbFTmS8LaYKzCZDVJ7qxVs8gVsVfhhQ=;
        b=BR73BRIxxnez+wK1X6oCNpYXs3XE1AazyOjQGvMBLmlXkKrPPdaOfXTKFb985IKJ3K
         Jpmb/Drdj26GCcfMPQn3tqfA26EmpgynI1pdrF9zKnm44Prcq9C56NdDCcZl3vZwbrLr
         scz5Kjtx7VYV++7rwFU18YnDw6fWQxawaow7vOTwmUaBzv0L9xCmQ5FcWXhPWbsCUrf9
         2eBoelhxHQqZxBj+xry9v8y0mLPA4PsWE/wWKzcETcE7q/wfZuwgKwMpp6fBDktqITDk
         H/bx6O1Z+8re0G79pxCTwRs4dreZ1DH25XSpLw8WcHzB9S12iJqJ94bOahTyGZqh8TGm
         1kfg==
X-Forwarded-Encrypted: i=1; AJvYcCVf5RAb4detp5rwL+GuGnlLIlvzwdJ3kJv4a+gpobBf8d+2INSx2JfDMvKYph50i/sVadT9KYr0Y3IocYwVLyeRAf75kyf61MTS0j5xIsc=
X-Gm-Message-State: AOJu0YxpMXmvCVOdLFy5Nr5H7vkTEvuSE/k0lRjVjjKEGsd6/tfmSnZa
	QwV5L2sm+IKgIAYxS2nrFdhmlIz5ga2C5vFdZxbjlVwZP2vurd64OFPv4QClpjk=
X-Google-Smtp-Source: AGHT+IFj2vRVJy1b+0pBQ6MQxpNJsw740qXrbNVmfYTIYHSqQpkEFdKwcdJJ8t5yN3KayHtPErGFAA==
X-Received: by 2002:a05:6512:3da9:b0:512:bd65:860a with SMTP id k41-20020a0565123da900b00512bd65860amr8523131lfv.5.1709032722845;
        Tue, 27 Feb 2024 03:18:42 -0800 (PST)
Date: Tue, 27 Feb 2024 12:18:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 3/4] x86/spec: fix INDIRECT_THUNK option to only be
 set when build-enabled
Message-ID: <Zd3FEA_tt4GJexSC@macbook>
References: <20240226110748.80254-1-roger.pau@citrix.com>
 <20240226110748.80254-4-roger.pau@citrix.com>
 <81e32609-37cd-4c2d-ae27-6caafc7dab33@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81e32609-37cd-4c2d-ae27-6caafc7dab33@suse.com>

On Mon, Feb 26, 2024 at 01:50:46PM +0100, Jan Beulich wrote:
> On 26.02.2024 12:07, Roger Pau Monne wrote:
> > Attempt to provide a more helpful error message when the user attempts to set
> > spec-ctrl=bti-thunk option but the support is build-time disabled.
> > 
> > While there also adjust the command line documentation to mention
> > CONFIG_INDIRECT_THUNK instead of INDIRECT_THUNK.
> > 
> > Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with one minor remark:
> 
> > --- a/xen/arch/x86/spec_ctrl.c
> > +++ b/xen/arch/x86/spec_ctrl.c
> > @@ -241,7 +241,12 @@ static int __init cf_check parse_spec_ctrl(const char *s)
> >          {
> >              s += 10;
> >  
> > -            if ( !cmdline_strcmp(s, "retpoline") )
> > +            if ( !IS_ENABLED(CONFIG_INDIRECT_THUNK) )
> > +            {
> > +                no_config_param("INDIRECT_THUNK", "spec-ctrl=bti-thunk", s, ss);
> > +                rc = -EINVAL;
> > +            }
> > +            else if ( !cmdline_strcmp(s, "retpoline") )
> >                  opt_thunk = THUNK_RETPOLINE;
> >              else if ( !cmdline_strcmp(s, "lfence") )
> >                  opt_thunk = THUNK_LFENCE;
> 
> How about
> 
>             if ( !IS_ENABLED(CONFIG_INDIRECT_THUNK) )
>             {
>                 no_config_param("INDIRECT_THUNK", "spec-ctrl", s - 10, ss);
>                 rc = -EINVAL;
>             }
>             else if ( !cmdline_strcmp(s, "retpoline") )
> 
> or (likely less liked by you and Andrew) "s += 10;" dropped and then
> 
>             if ( !IS_ENABLED(CONFIG_INDIRECT_THUNK) )
>             {
>                 no_config_param("INDIRECT_THUNK", "spec-ctrl", s, ss);
>                 rc = -EINVAL;
>             }
>             else if ( !cmdline_strcmp(s += 10, "retpoline") )
> 
> conserving a little on string literal space (sadly, despite the function
> being __init, string literals remain post-init due to living in .rodata)?

TBH I'm not overly worried about those 10 extra characters, but if I
had to choose I prefer the first option (so `s - 10`).

Thanks, Roger.

