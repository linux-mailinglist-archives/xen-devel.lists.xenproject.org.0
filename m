Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FCA715AD7
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 11:57:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541048.843353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3w6S-0005VP-Ik; Tue, 30 May 2023 09:57:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541048.843353; Tue, 30 May 2023 09:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3w6S-0005Sh-FN; Tue, 30 May 2023 09:57:20 +0000
Received: by outflank-mailman (input) for mailman id 541048;
 Tue, 30 May 2023 09:57:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Ox2=BT=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q3w6Q-0005SY-Ed
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 09:57:18 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b64b964-fed0-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 11:57:16 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f6da07feb2so43741545e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 May 2023 02:57:16 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 p5-20020a5d4585000000b0030796e103a1sm2757861wrq.5.2023.05.30.02.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 02:57:15 -0700 (PDT)
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
X-Inumbo-ID: 5b64b964-fed0-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1685440635; x=1688032635;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P5oSMsY1ga/vmDE3/XkALs3Dzm2NZpe0Jaj6342SjPA=;
        b=FSqNdSkyrN9B1JRLQvkvb/KEIqmlvCOQubt24iCDwVh6ca9NAqRewnx/BtoOgGlk8c
         mLjy2Af9FFig+YNJOhtj4YtcPI+H/A9kEzKS/jh2Jw62g9DffsTz9hw1b7OtMgnNGGKv
         5agIcF6N5dJymsTnRsAMKccJNwlAqE34HRjHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685440635; x=1688032635;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5oSMsY1ga/vmDE3/XkALs3Dzm2NZpe0Jaj6342SjPA=;
        b=eUaGbbh3R2dDYtmnZiW8JowHWqIVYgBH49K3BEJwx2aZUdkd1pRiaxNpSsylzKBkym
         iLdEomOL+LnzL6gzwQgSFewpS3iV9YKvIO7pddB4Qph/JLc63lPxyu1MIHkpNOyqO1Q6
         aBzxG8wZ2JT5XJARKg8Lzq3H8BU8pelskfsxywjh+7dSHenlXG7i74i9at/Yw6/Nc341
         EABnpi3lVOlvVfP7ybhN7JPP/FUQNa5bCc7j5B7DbJxcqwY9SfYA76BvTF6HMEhAejVp
         NcDicOKo2TueXsSnvgxbxlN0/4aLl5tcGRS/0mECmgEntMGIodUlgPM1WrCLRFOrBC9N
         eSKw==
X-Gm-Message-State: AC+VfDxLSNBJKYwSpwlk0XwffPF0SZV5fSbmxL1axDAxPjCo7aBfgmzQ
	KbKdZC+mgUUZpE8KO3RQSnaaYg==
X-Google-Smtp-Source: ACHHUZ7WZ8lG8a7tMRKwp+GxoSwp0WCcoh5ttPZP1yrMBlDDrfl6Xza54smftJJoLzqpqnaNU+IwoA==
X-Received: by 2002:a1c:f70b:0:b0:3f1:72fb:461a with SMTP id v11-20020a1cf70b000000b003f172fb461amr1211396wmh.2.1685440635478;
        Tue, 30 May 2023 02:57:15 -0700 (PDT)
Message-ID: <6475c87b.5d0a0220.132eb.a83f@mx.google.com>
X-Google-Original-Message-ID: <ZHXIedQKwDVWC820@EMEAENGAAD19049.>
Date: Tue, 30 May 2023 10:57:13 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/3] x86: Add support for AMD's Automatic IBRS
References: <20230526150044.31553-1-alejandro.vallejo@cloud.com>
 <20230526150044.31553-3-alejandro.vallejo@cloud.com>
 <64820a10-622e-dc10-988b-613542349ec9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64820a10-622e-dc10-988b-613542349ec9@suse.com>

On Tue, May 30, 2023 at 10:25:36AM +0200, Jan Beulich wrote:
> On 26.05.2023 17:00, Alejandro Vallejo wrote:
> > --- a/xen/arch/x86/smpboot.c
> > +++ b/xen/arch/x86/smpboot.c
> > @@ -376,6 +376,9 @@ void start_secondary(void *unused)
> >      {
> >          wrmsrl(MSR_SPEC_CTRL, default_xen_spec_ctrl);
> >          info->last_spec_ctrl = default_xen_spec_ctrl;
> > +
> > +        if ( cpu_has_auto_ibrs && (default_xen_spec_ctrl & SPEC_CTRL_IBRS) )
> > +            write_efer(read_efer() | EFER_AIBRSE);
> >      }
> 
> Did you consider using trampoline_efer instead, which would then also take
> care of the S3 resume path (which otherwise I think you'd also need to
> fiddle with)?
> 
> Jan
I didn't because I didn't know about it. Good call though, it's indeed a
better place for it. Will do on v2.

Alejandro

