Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 557B6A1B7E0
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 15:28:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876791.1287143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbKf8-0005lJ-Bb; Fri, 24 Jan 2025 14:27:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876791.1287143; Fri, 24 Jan 2025 14:27:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbKf8-0005j7-8O; Fri, 24 Jan 2025 14:27:58 +0000
Received: by outflank-mailman (input) for mailman id 876791;
 Fri, 24 Jan 2025 14:27:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AkuS=UQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tbKf6-0005j0-OY
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2025 14:27:56 +0000
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 656a6fae-da5f-11ef-99a4-01e77a169b0f;
 Fri, 24 Jan 2025 15:27:53 +0100 (CET)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2f44353649aso3083038a91.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jan 2025 06:27:53 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffafa400sm1733064a91.36.2025.01.24.06.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 06:27:51 -0800 (PST)
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
X-Inumbo-ID: 656a6fae-da5f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737728872; x=1738333672; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TDLg2K8MhJfOLYFUerOkwzHomdYiZlZ1KjiTzk4JjgI=;
        b=Hd+UpCPYBHXiOWio8OLtvtBuCcel10qLhP/+TrHgIQZzgtLFUsfc6gm7CoGJhxaKIO
         ayr8bzcAHCKrUCkRZWlw3UZVEiL4/21F39kTmWObpGEhJTVaKQLYWuRzHEPDaUqzyMhY
         4uuGra4SQ7fHnKLtkXdvo8gUq0L6fuVmnDfWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737728872; x=1738333672;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TDLg2K8MhJfOLYFUerOkwzHomdYiZlZ1KjiTzk4JjgI=;
        b=hdfNIf1TLUbs5P4YF6Hi1Hr6+hArKRZfzr6AiGHaT6WbgBmrII7+oQvlsZy4fXRheZ
         x9MndOngiWSl8mT+VUhtDU6fCpEWtIMO7oRAVehd3tKI2YyPPheVlMmkGXHjsy58jlwO
         LDDEBX2AiOZfWX7sPINwoj3da/zf+m4ZO2lvgag//3e1ZaI+6Qk0CLl2YqsWDuXI0oZt
         ZI+3SRqDIe2zbHv2RGD/35HLG9t2E3W1cFsGwBTv4v8vwAiNwWJGP1T/xk8iRToSQX1o
         Nmv4i2dRWr6Fs+vZtBlk3Wq3/sfq9EZKWaLFLK4zW9QO37iUkM/AN/tF+ErLrr9NrH8R
         narQ==
X-Gm-Message-State: AOJu0YyfY8nYKK5xyNb/rbomAbwtdoiC0z/vaJwFqWuKWTfaVMcNXMHd
	1UsBSFLYOvQ+fJ4NiV2DBTxmOWRKFKtS8MAN5uGKmAM/FTpFHHeYyOeETzLaIhI=
X-Gm-Gg: ASbGnctGdgOnmLcevt2ybdLVHAEsYC4ZvB5v2trrFZPdGlk1OjEltxMMai61EiBMM8T
	mXqIPy6X5a8o2tA2l11vY4DXGanMnah5wt5i4LtY6e0IbCUYRjpoYZw5CVKOM/UJeTOEaTsF2ib
	szuYRdiq5kg0Cz6rJHSz5S63PB74kVSds8d5SJ4yHG7KTHdtW/lYMO2eZFi35JnKXi09KE84mPu
	fIakkp8tgbyF4FBgIZDS11VglSW0gg4zC/dUeVfYYuiDVDjBgv9GPg1wmzh2AMmqeYJvjtJJ70w
	o985hzc6HA==
X-Google-Smtp-Source: AGHT+IGM1ptKqOPsTolm7iqm6rDU/piBm8rMbk383KQFK9V/Tbts42iG5JXmXE6gATaKSAAlfBamYg==
X-Received: by 2002:a17:90b:2803:b0:2ee:ba84:5cac with SMTP id 98e67ed59e1d1-2f782c51739mr48500280a91.7.1737728872393;
        Fri, 24 Jan 2025 06:27:52 -0800 (PST)
Date: Fri, 24 Jan 2025 15:27:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.20 v2 0/5] x86/iommu: make CX16 mandatory for IOMMU
Message-ID: <Z5OjYhD6nbFYa4ff@macbook.local>
References: <20250124120112.56678-1-roger.pau@citrix.com>
 <3204bed4-4f03-405e-b77c-4355803f3a31@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3204bed4-4f03-405e-b77c-4355803f3a31@citrix.com>

On Fri, Jan 24, 2025 at 02:24:34PM +0000, Andrew Cooper wrote:
> On 24/01/2025 12:01 pm, Roger Pau Monne wrote:
> > Hello,
> >
> > The following series is the original CX16 series sent by Teddy, with the
> > CX16 checks split into a separate patch, plus one extra patch to switch
> > AMD-Vi to use CMPXCHG16B when updating Interrupt Remapping Entries.
> >
> > Note that last patch to use CMPXCHG16B fixes a real bug with AMD
> > hardware.
> >
> > Thanks, Roger.
> >
> > Roger Pau Monne (1):
> >   iommu/amd: atomically update IRTE
> >
> > Teddy Astie (4):
> >   x86/iommu: check for CMPXCHG16B when enabling IOMMU
> >   iommu/vtd: remove non-CX16 logic from interrupt remapping
> >   x86/iommu: remove non-CX16 logic from DMA remapping
> >   iommu/vtd: cleanup MAP_SINGLE_DEVICE and related code
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

> CC Oleksii.  Patch 5 is a real bugfix that needs backporting, and the
> prior patches have been in an almost-ready state for more than a release
> now.

I've split the checks into a pre-patch, and did a bit more cleanup of
code that was no longer needed (pre/post interrupt mask before IRTE
update), but overall the code is the same plus the extra fix.

Thanks, Roger.

