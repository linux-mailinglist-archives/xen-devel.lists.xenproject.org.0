Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDE0860EC6
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 10:58:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684730.1064794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdSJg-0003S7-Ru; Fri, 23 Feb 2024 09:58:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684730.1064794; Fri, 23 Feb 2024 09:58:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdSJg-0003Py-PF; Fri, 23 Feb 2024 09:58:04 +0000
Received: by outflank-mailman (input) for mailman id 684730;
 Fri, 23 Feb 2024 09:58:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lysb=KA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rdSJe-0003Ps-SC
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 09:58:02 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 078fbf7f-d232-11ee-8a57-1f161083a0e0;
 Fri, 23 Feb 2024 10:58:01 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-41241f64c6bso5191355e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2024 01:58:01 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 fc19-20020a05600c525300b0041285ffec13sm1743787wmb.41.2024.02.23.01.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 01:58:00 -0800 (PST)
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
X-Inumbo-ID: 078fbf7f-d232-11ee-8a57-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708682281; x=1709287081; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yz4otW/pwgozuw7DlysuN7mX+Rcs2WUAXHt11rHZ1hY=;
        b=GtB3a0pGY1XLVSy5sG+n/LHY/Q+iUua7gnsJ7gCtVsKH9//DFKV9+RWEhX/d4CKSDm
         lYYIjQBEhit6YLe8gHhdb5Y0bhZrZrIstKFmNrdBm+ZqMnxEtkpfmdXGVA5Ro/NKrvSx
         Xl5l4kPt0cGWtX9hBmCagqPBiD4uX+QVg5Uxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708682281; x=1709287081;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yz4otW/pwgozuw7DlysuN7mX+Rcs2WUAXHt11rHZ1hY=;
        b=Lz2Y4ld3VeeAt440ARR3FPBNqPVCoc0G6lS4fvU7g0epGqSOOrNbJPaInEGWTb69hp
         UYJ8fyRDBJaC3CN3AwJHr4idjM7Z4XZ3lTAxQz/NO6pqIQHwX9aON4uiFZm/ZsiIYosH
         czTsd2/WyXiDCoWi6Ayg3vF5gZ1TB4Zx+iMf0vqeP590SAQUgvPUnW5RCzLsUFjm64UP
         924Pk8W1swxw+obh+yuq0WUtyvFlSLfjOzzw6mqXsiAML4gyPidmaytrykMUEbtkEKWY
         QQhjCyGz+IV27Bixw3+qcWu0WBFQecxH9mHXWS/Sgvu3SFScRCbLldGdTSahZ6KNgi2n
         T6kA==
X-Gm-Message-State: AOJu0Yy+JR+P2m1kTRXVjITe/fDamDRTwzs8hugy6roxa5x10dB7Wkf+
	9Yl4/p945b2xbMNMaqmg4HFX6sEx6Kj+DSRaj0JQksPFxtveonasC4psa/p0OIY=
X-Google-Smtp-Source: AGHT+IGTsa/MHcy6FouYaoChNreOOYgQdrChkSch3kqq2XqKsHrEtd1hEcRbvjatSIMZNkAo4m67Yw==
X-Received: by 2002:a05:600c:154a:b0:412:96f2:2df9 with SMTP id f10-20020a05600c154a00b0041296f22df9mr172170wmg.26.1708682280792;
        Fri, 23 Feb 2024 01:58:00 -0800 (PST)
Date: Fri, 23 Feb 2024 10:57:59 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/spec: fix BRANCH_HARDEN option to only be set when
 build-enabled
Message-ID: <ZdhsJ3dWbLuSsoCu@macbook>
References: <20240223094215.71889-1-roger.pau@citrix.com>
 <b5696664-0e85-414b-8360-242349a87a7e@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5696664-0e85-414b-8360-242349a87a7e@citrix.com>

On Fri, Feb 23, 2024 at 09:46:27AM +0000, Andrew Cooper wrote:
> On 23/02/2024 9:42 am, Roger Pau Monne wrote:
> > The current logic to handle the BRANCH_HARDEN option will report it as enabled
> > even when build-time disabled. Fix this by only allowing the option to be set
> > when support for it is built into Xen.
> >
> > Fixes: 2d6f36daa086 ('x86/nospec: Introduce CONFIG_SPECULATIVE_HARDEN_BRANCH')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/spec_ctrl.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
> > index 421fe3f640df..e634c6b559b4 100644
> > --- a/xen/arch/x86/spec_ctrl.c
> > +++ b/xen/arch/x86/spec_ctrl.c
> > @@ -50,7 +50,8 @@ static int8_t __initdata opt_psfd = -1;
> >  int8_t __ro_after_init opt_ibpb_ctxt_switch = -1;
> >  int8_t __read_mostly opt_eager_fpu = -1;
> >  int8_t __read_mostly opt_l1d_flush = -1;
> > -static bool __initdata opt_branch_harden = true;
> > +static bool __initdata opt_branch_harden =
> > +    IS_ENABLED(CONFIG_SPECULATIVE_HARDEN_BRANCH);
> >  
> >  bool __initdata bsp_delay_spec_ctrl;
> >  uint8_t __read_mostly default_xen_spec_ctrl;
> > @@ -267,7 +268,8 @@ static int __init cf_check parse_spec_ctrl(const char *s)
> >              opt_eager_fpu = val;
> >          else if ( (val = parse_boolean("l1d-flush", s, ss)) >= 0 )
> >              opt_l1d_flush = val;
> > -        else if ( (val = parse_boolean("branch-harden", s, ss)) >= 0 )
> > +        else if ( IS_ENABLED(CONFIG_SPECULATIVE_HARDEN_BRANCH) &&
> > +                  (val = parse_boolean("branch-harden", s, ss)) >= 0 )
> >              opt_branch_harden = val;
> 
> Yeah, we should definitely fix this, but could we use no_config_param()
> here for the compiled-out case ?

Oh, didn't know that helper existed.

> See cet= for an example.  If we're going to ignore what the user asks,
> we should tell them why.
> 
> And given this as an example, shouldn't we do the same with
> CONFIG_INDIRECT_THUNK and bti=thunk= too ?

Checked for SPECULATIVE_HARDEN_ARRAY and
SPECULATIVE_HARDEN_GUEST_ACCESS, but not the thunk, will add it as a
followup patch.

Thanks, Roger.

