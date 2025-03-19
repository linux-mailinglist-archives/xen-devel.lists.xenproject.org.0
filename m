Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B76A6872B
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 09:46:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920099.1324369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tup3x-0003av-JQ; Wed, 19 Mar 2025 08:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920099.1324369; Wed, 19 Mar 2025 08:46:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tup3x-0003Yg-Gl; Wed, 19 Mar 2025 08:46:09 +0000
Received: by outflank-mailman (input) for mailman id 920099;
 Wed, 19 Mar 2025 08:46:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xiIg=WG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tup3w-0003KL-96
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 08:46:08 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 990ca228-049e-11f0-9abc-95dc52dad729;
 Wed, 19 Mar 2025 09:46:07 +0100 (CET)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-22401f4d35aso123904355ad.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 01:46:07 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-225c68aa616sm108863035ad.93.2025.03.19.01.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 01:46:05 -0700 (PDT)
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
X-Inumbo-ID: 990ca228-049e-11f0-9abc-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742373966; x=1742978766; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hxvGsZxLky2njkeC7urWofkAiBcfRPDYHXmN4OkqidU=;
        b=Lu2Z4GkC7naxm2/MuLYBHF8jA9Ou1LF8OTaw0leC9utFWzG7Z1u/wB+4F9ajQ/jJW5
         9bDh7IslgOAsi/VmJGGMu03R9dBw5TdBFFFl1CW583dFxIKq3c9tot8shnKKZSp5FP+F
         LgXtGtfd8T98ieYUoBPKmwcAjzH89b4/iI95k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742373966; x=1742978766;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hxvGsZxLky2njkeC7urWofkAiBcfRPDYHXmN4OkqidU=;
        b=cTl3aq5jQzsE02Xdk9CIGy3G5YJwLQ2pTS+Ip0REFZDxfc6jaiikOpst3cviPnKqRu
         hrOIPeDc72oC/a9ZXX2FcmzPlN+o6ceGCumTvbnevTHDlaC6BIOF084ykAJEkTXi4ns5
         L9s00dfsrq99lQ33Ro6AZ3GDaSN9fFyelDkcn3BjJw1OkexwbkQQW3blkRBIFp18ETpE
         Piaj/YspnSR/gCYE5CjSzfMVTn8QP5MCxd1Vcs68hmgqeUnAzUZrPO1IKuDF8XTrabu4
         uWBjn9M3f2O/aCuCt+SGtF6I8nKdk9KcIs1fVNraX+6/QrEZtiIET5ri9s/GHDAqS/or
         Kp+Q==
X-Gm-Message-State: AOJu0Yyt+KtWTgqns8jTaWimF5DphoOY4vNNRX4Q48emKLVKjC/cYqZh
	7KdN9No9WzjlYcsxze8/2o04yWE3ZOAEWEnEG/NbVSJUNV/djmaKcuzuQDdo7l0=
X-Gm-Gg: ASbGnct/VAvUOqBNb9uBxWzPY8tvABfNx7FA6IAehlxch/EflbTDLH1N2DNQWkAFYre
	G6O/wNt042jiWSqkgYaxQEuBOMfNznw5WNVJXGm/gyStFaH0vdAVkiixXJxMKc5AdF4tx+SPK+n
	YO7Gke/bzI5QJ8aLeTEzwcdiNZY/7iHT0VrBQvP07HkxY8Gk0VagYXRGQNFdwLJ+baQoJcZcvIk
	31kGyk1tYdKkbkf4b8GY9R7ID6hpWG8spm/eISL8gsc1Y+9zjvejZlxLsmToI0cOXmxoXw4xCLz
	Fc89Se5Rxf6S7mjFQF1muigwA42p0hFNJxsqIeUV66YY0614+g==
X-Google-Smtp-Source: AGHT+IHTijYqd0SKc5MDGZdmm8yMa/bU+AOfH/dbjqkIlvgaIKNC+4iat3LAVSu/SUkB5vgfyJ72yA==
X-Received: by 2002:a17:902:e803:b0:223:35cb:e421 with SMTP id d9443c01a7336-22649a5f6f3mr26931505ad.49.1742373966195;
        Wed, 19 Mar 2025 01:46:06 -0700 (PDT)
Date: Wed, 19 Mar 2025 09:46:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 1/7] x86/boot: clarify comment about trampoline_setup
 usage
Message-ID: <Z9qESYLU3wMjwS-c@macbook.local>
References: <20250318173547.59475-1-roger.pau@citrix.com>
 <20250318173547.59475-2-roger.pau@citrix.com>
 <720af946-5c2a-43b4-a9fb-163e41bfdeb7@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <720af946-5c2a-43b4-a9fb-163e41bfdeb7@citrix.com>

On Tue, Mar 18, 2025 at 05:45:09PM +0000, Andrew Cooper wrote:
> On 18/03/2025 5:35 pm, Roger Pau Monne wrote:
> > Clarify that trampoline_setup is only used for EFI when booted using the
> > multiboot2 entry point.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/boot/head.S | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> > index 1b3bd16fe575..59a2b5005cf6 100644
> > --- a/xen/arch/x86/boot/head.S
> > +++ b/xen/arch/x86/boot/head.S
> > @@ -505,7 +505,8 @@ trampoline_bios_setup:
> >  
> >  trampoline_setup:
> >          /*
> > -         * Called on legacy BIOS and EFI platforms.
> > +         * Called on legacy BIOS and EFI platforms when using multiboot (either
> > +         * 1 or 2).
> >           */
> 
> /* Called for Mutiboot entry, including MB2+EFI. */
> 
> is a little more concise?

That's fine.  Would you like me to resend the adjusted version?

Thanks, Roger.

