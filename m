Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A5C73A322
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 16:35:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553644.864314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCLO9-0000Vt-Vz; Thu, 22 Jun 2023 14:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553644.864314; Thu, 22 Jun 2023 14:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCLO9-0000Tf-Sv; Thu, 22 Jun 2023 14:34:21 +0000
Received: by outflank-mailman (input) for mailman id 553644;
 Thu, 22 Jun 2023 14:34:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VOAB=CK=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qCLO8-0000TZ-Ht
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 14:34:20 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de8b1838-1109-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 16:34:18 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3111547c8f9so8356104f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 07:34:18 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a1-20020adff7c1000000b0030fafcbbd33sm7156419wrq.50.2023.06.22.07.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 07:34:17 -0700 (PDT)
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
X-Inumbo-ID: de8b1838-1109-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1687444458; x=1690036458;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5PNI8DtqDXdmsu2J8N8VrYnh58TbbbVZ3Kxd6kqRQ6M=;
        b=UvyMBWO5sYCOH4vELve9sL7PCcNdAq+98KZ/q17Ob6E5doyhUHaOS6/nPbrpsbDR1G
         DSlz5B16GRuMKzFBmxndh/+9qV9nsWn6eHItEm4wFcqMjdqfxg+OveTjJhybHb1YI8Zb
         SSdp3mAmli5t0UsJ4k7bTgn221vT/uEdkG+bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687444458; x=1690036458;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PNI8DtqDXdmsu2J8N8VrYnh58TbbbVZ3Kxd6kqRQ6M=;
        b=Z8m8CdWz2RKoQY18WiJ9pk82vXecrIoQb3njqVnWbREVY6K7y5LUGChxDhN2Ys03m+
         o3IWCDYqPNmC8apBs128JkFvbg/Xo/Ya57Y1Efd10a8VsMt0Sp52EUQsVDtflBXy0k15
         exm/yY1emoIZ+h2z3EcbiketzvD2PlJIgOu/98CKDxPRgzmPNTrHWhJRGQv7n0Jsu+nt
         yPSllxCKTOun7vW0STevApZLSZBk5u64lt8wUTbEa/Gnh5tXQYV6HALqPGaCU/4ppOgu
         uyqI9tpD+eUyfbUJyTMBEP/slP3kAWyCC8FU/nECpBEtC7WUNWWGYzWFifCcK4qpTQh9
         AcsA==
X-Gm-Message-State: AC+VfDygOmqgsLk8UBJy9wAkPj6gGqtHxwIRBFJQSKjiccverTjpb9Fz
	Th9frZXiOV0WgpcrKRKe0umLKQ==
X-Google-Smtp-Source: ACHHUZ5tb8lZLI1VMv4Q3ifLAOG77nopJmomCx0h88YmnBitRsY8y1CuxAM9bA0o0FG4rRwGaGrweQ==
X-Received: by 2002:a5d:50d2:0:b0:311:19fd:1e1d with SMTP id f18-20020a5d50d2000000b0031119fd1e1dmr16066324wrt.42.1687444457728;
        Thu, 22 Jun 2023 07:34:17 -0700 (PDT)
Message-ID: <64945be9.df0a0220.41efc.3f40@mx.google.com>
X-Google-Original-Message-ID: <ZJRb56VERGI7TDuF@EMEAENGAAD19049.>
Date: Thu, 22 Jun 2023 15:34:15 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/5] x86/microcode: Create per-vendor microcode_ops
 builders
References: <20230615154834.959-1-alejandro.vallejo@cloud.com>
 <20230615154834.959-3-alejandro.vallejo@cloud.com>
 <e774b3e4-58c3-08ad-ce49-f05286e2640e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e774b3e4-58c3-08ad-ce49-f05286e2640e@suse.com>

On Mon, Jun 19, 2023 at 05:45:14PM +0200, Jan Beulich wrote:
> On 15.06.2023 17:48, Alejandro Vallejo wrote:
> > --- a/xen/arch/x86/cpu/microcode/amd.c
> > +++ b/xen/arch/x86/cpu/microcode/amd.c
> > @@ -432,9 +432,13 @@ static struct microcode_patch *cf_check cpu_request_microcode(
> >      return patch;
> >  }
> >  
> > -const struct microcode_ops __initconst_cf_clobber amd_ucode_ops = {
> 
> Something will want to be done to retain the cf_clobber aspect,
> i.e. to be able to get rid of no longer necessary ENDBR64 after
> alternatives patching is finished. I guess I first need to see
> what further patches do in order to maybe come up with a
> suggestion.
> 
> Jan
I (mistakenly) thought the clobber tag was simply making sure the static
contents were themselves clobbered. It seems like it's actually aiding the
alternatives machinery with function pointer cleanup, so this was blatantly
wrong on my part. Sigh...

Either way, I'm bringing the static structs back and dealing with this
in another way. Cheers for the pointer.

Alejandro

