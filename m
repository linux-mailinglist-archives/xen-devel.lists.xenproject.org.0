Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6736FC9AD
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 16:57:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532279.828394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwOmJ-0007RL-Pw; Tue, 09 May 2023 14:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532279.828394; Tue, 09 May 2023 14:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwOmJ-0007PF-Mt; Tue, 09 May 2023 14:57:23 +0000
Received: by outflank-mailman (input) for mailman id 532279;
 Tue, 09 May 2023 14:57:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kELI=A6=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1pwOmI-0007P9-Op
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 14:57:22 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ccf938fb-ee79-11ed-b229-6b7b168915f2;
 Tue, 09 May 2023 16:57:21 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-306f2b42a86so3826778f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 May 2023 07:57:21 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a9-20020adfe5c9000000b0030632110586sm14965925wrn.3.2023.05.09.07.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 07:57:20 -0700 (PDT)
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
X-Inumbo-ID: ccf938fb-ee79-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1683644241; x=1686236241;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1cQpaxNuMlALE2/8503tcqClCB6p0rlV2GrkKvvt3J0=;
        b=Zk0Vs1WMK3rRfZu4v3IlDg4rpAqFBLmoNRhCIrVRTiVBA1gF7orqXXal6CzGdLledI
         D8Znb8K1z5rSDasYm7cRm/egXIhh5YssJ8UwpWLoXTIIKL5KIVf61EIzUToAX3cBd9bq
         rNCUB5NmOUjbjb2IXoiwYcnROy7gTOdHUr3YU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683644241; x=1686236241;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cQpaxNuMlALE2/8503tcqClCB6p0rlV2GrkKvvt3J0=;
        b=cFFEm/Ac3Fnc0GV5BvSx6AkYZ9I/rDO53fgrtpsfgXq2Iz4FUMohCG4RA3OnaGTneA
         oiyJuw5Bk/kcct9oXvUv3Z7VTcd+6IDEgeVy1c7gAPLxPiUh1t1QsRLllKiR84qHrLPQ
         2ubiregvtmu6dIdu6HKUzh+oS75JjMK2VyL+qE3/Ymb+bhjx2ZnXT3l4QJSB3ukXEYOk
         0dxvHVAzbXSgPP8IXsapyy6X9xwP6qv0N/lwCxDEBZmzmw19iAHoEw+OeBrlp3Ey7Jta
         5lansqF1jBtVyrT7UsWVuhQcyvVSxwvtabUD6XU0iynAkIX4sk1RWMGXSkkj+vPNx0eq
         nclQ==
X-Gm-Message-State: AC+VfDwxkgCakSk8WtsNJ4ezL7PNkpVibHLxtqwoz+4DRzgMJ/cubuSK
	+/XtiumXVKTOYNDwlVgvJWB4QA==
X-Google-Smtp-Source: ACHHUZ5BCvWyiU7/CbK5VAm0YyP9c19HcbHUvXBnzZfYXdo/9hOubxjfUnwOQ2/viAVWQ5QesqkHpQ==
X-Received: by 2002:a05:6000:1186:b0:306:9f70:86fa with SMTP id g6-20020a056000118600b003069f7086famr10426241wrx.37.1683644241158;
        Tue, 09 May 2023 07:57:21 -0700 (PDT)
Message-ID: <645a5f50.df0a0220.9d880.f133@mx.google.com>
X-Google-Original-Message-ID: <ZFpfTeeC9cnDY0ye@EMEAENGAAD19049.>
Date: Tue, 9 May 2023 15:57:17 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/3] x86: Use CpuidUserDis if an AMD HVM guest toggles
 CPUID faulting
References: <20230505175705.18098-1-alejandro.vallejo@cloud.com>
 <20230505175705.18098-4-alejandro.vallejo@cloud.com>
 <d8c9728b-b615-7229-2e76-106d81802a20@suse.com>
 <d0794e7d-604e-044f-000e-3a0bde126425@citrix.com>
 <b8e8132e-0cd7-8d1e-308a-afb1963d6b2a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8e8132e-0cd7-8d1e-308a-afb1963d6b2a@suse.com>

On Tue, May 09, 2023 at 04:41:49PM +0200, Jan Beulich wrote:
> > I asked Alejandro to do it like this.
> > 
> > Advertising this to guests requires plumbing another MSR into the
> > infrastructure which isn't quite set up properly let, and is in flux
> > from my work.
> > 
> > For now, this just lets Xen enforce the policy over PV guests, which is
> > an improvement in and of itself.
> 
> But as per the title this patch is about HVM guests (aiui the PV aspect
> is taken care of already without the patch here). In any event - if the
> omissions are intentional (for the time being), then I think that wants
> mentioning in the description.
> 
> Jan

HVM guests are always exposed the Intel interface (emulated if not natively
available). The HVM max policy forces it on, and I don't see anything in
the default policy overriding it. My attempt here was to let AMD guests use
the emulated Intel MSR and trigger levellling that would itself rely on
AMD's CpuidUserDis without guest intervention. That said, several cans of
worms exist in mantaining this internal routing. I'll get rid of that last
patch and leave HVM guests alone for the time being. They are functionally 
correct (albeit their CPUID take 2 faults, whereas 1 would suffice).

Alejandro

