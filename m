Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D61DB598018
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 10:29:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389365.626222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOatb-0000uX-7f; Thu, 18 Aug 2022 08:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389365.626222; Thu, 18 Aug 2022 08:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOatb-0000sk-53; Thu, 18 Aug 2022 08:28:55 +0000
Received: by outflank-mailman (input) for mailman id 389365;
 Thu, 18 Aug 2022 08:28:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3bNE=YW=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1oOatZ-0000sO-9l
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 08:28:53 +0000
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [2607:f8b0:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9abeff4-1ecf-11ed-bd2e-47488cf2e6aa;
 Thu, 18 Aug 2022 10:28:51 +0200 (CEST)
Received: by mail-pf1-x434.google.com with SMTP id 130so875602pfv.13
 for <xen-devel@lists.xenproject.org>; Thu, 18 Aug 2022 01:28:51 -0700 (PDT)
Received: from leoy-yangtze.lan (173.242.127.92.16clouds.com. [173.242.127.92])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a170903235100b001728d7c831asm784432plh.142.2022.08.18.01.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 01:28:49 -0700 (PDT)
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
X-Inumbo-ID: c9abeff4-1ecf-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=MSNNFjr6HfudtMZawV8ViBRkxiE6doqA1QajmVEvoFs=;
        b=yk06vyd5A1hTSbqPTIKWnN1x6iR5l0wOwKbtG8O1w8r/6RvbWvZa3x0545rMgvKiuj
         xSGU3J+cvY8N0ygxAVys8fsKP7wuTIBtoFJ0eiZXaun9i7hte0BuNadth670LLd0623p
         xP7OQQAYMcwA0fPkjoG8GdP+gIJl+YFkeB6z5khJnvYYdq1LdFc6j/5qWB77L6CVgPFA
         9UPTTii8O5kzdTCx2DOpgfa9fF9W18qzLKm+ch4UYDKBIl+0rj8wskocKMUA04GQJUZs
         qJ6hZVVD/7mwOhFAf3jFbodlHtsCgsWgsan/mfOV+A7RlLPApjMn+3mgMcy2xTR2bD0q
         EzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=MSNNFjr6HfudtMZawV8ViBRkxiE6doqA1QajmVEvoFs=;
        b=iG34rpeIa3BBFDdNuXeej4v53j2ucfXAVYpwmaYpsnzHP/wNC37wywHPq3Q0kMqJTT
         3crSXkMjrISS6y02qwegIqzJyjk2ID4PBbL8NFilOpQz6W/TT/lB4b7EeIynykln4MG7
         ptNSwdFs0QxTkcA65Eo4Km41qgEbrhnjrg5Geq/YRv4k1CJRvryBR4TUh8E1u8tkngql
         IoqKXvpMhMrMHSdL3HEwSs9iSEcDKQElG2qmR3DcMctTeu1tSjeCMPBfcRlHvZTfgYoz
         YUo6aGbQNpnkUzvMuR7rgzEMKRZLky2UF3l1YwWzuo6ZzjoczvamrZXlJ16HO4Jik6+P
         yYQg==
X-Gm-Message-State: ACgBeo2jaxowyzxCPhSMP+KIFmsxWZ+dKoMp/JIdiGK8+IqKFq69wNec
	K4ZD7Dvyr/vqmDQTDmTTGh3BcQ==
X-Google-Smtp-Source: AA6agR7h1P5TpfxUgR+s1Pc2Mr+CcpQAmpBWfo00UaWRHolzKCRO5t1OmrgH20aV47YdxbWXP1auoQ==
X-Received: by 2002:a63:2a49:0:b0:41d:95d8:3d3d with SMTP id q70-20020a632a49000000b0041d95d83d3dmr1667649pgq.43.1660811330203;
        Thu, 18 Aug 2022 01:28:50 -0700 (PDT)
Date: Thu, 18 Aug 2022 16:28:45 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>, Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Rahul Singh <Rahul.Singh@arm.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH] xen/arm: acpi: Support memory reserve configuration table
Message-ID: <Yv34PXr0+6eq00e6@leoy-yangtze.lan>
References: <20220817105720.111618-1-leo.yan@linaro.org>
 <fd24b049-abf2-34e8-e0b0-2c2d2d1e1b0f@suse.com>
 <Yv3rc7vNCmTrFdgB@leoy-yangtze.lan>
 <5afa9c15-d7c5-2fb7-ed14-bd8839c4d42d@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5afa9c15-d7c5-2fb7-ed14-bd8839c4d42d@xen.org>

Hi Julien,

On Thu, Aug 18, 2022 at 08:57:20AM +0100, Julien Grall wrote:
> Hi Leo,
> 
> On 18/08/2022 08:34, Leo Yan wrote:
> > On Wed, Aug 17, 2022 at 03:17:53PM +0200, Jan Beulich wrote:
> > > Furthermore - what if Linux decided to change their structure? Or
> > > is there a guarantee that they won't? Generally such structures
> > > belong in the public interface, guaranteeing forward compatibility
> > > even if Linux decided to change / extend theirs (at which point
> > > consuming code there would need to do translation, but maybe using
> > > a Xen-defined struct [plus translation in Linux] right away would
> > > be best).
> > 
> > I saw Ard has helped to answer this question in his email.  As Ard
> > said, the general way is to rely on Linux EFI stub to allocate the
> > data structure for MEMRESERVE configuration table.
> > 
> > Given Xen uses pseudo EFI booting (the ACPI table is passed via DT), in
> > short term I don't think Xen can support Linux EFI stub,
> 
> I agree that using Linux EFI stub will require more effort. I would also
> need to go through the mailing list archives (or maybe Stefano remember?) to
> understand why we decided against using the EFI stub.

Yeah, seems to me using the EFI stub is the right thing to do.

I read Xen code and found Xen doesn't provide boot time callback, this
is the main reason blocked me to move forward to that way.

> > so we need to
> > maintain this structure in Xen as well.
> 
> I have looked at the commit message. IIUC, if this table is not created then
> Kexec will not work. Is there anything else that would not work?

No, AFAIK, kexec/kdump is the only customer to use the persistent
reserved memory in the Linux kernel.

I personally think this will pontentially impact other kernel
debugging modules, like ramoops, it also needs to use persistent
reserved memory when rebooting the kernel.  But now kernel code
doesn't add ramoops memory region into EFI MEMRESERVE table.

> IOW, would Linux be unusable if we don't create MEMRESERVE?

If we don't create EFI MEMRESERVE, kernel still can boot up
successfully, though it cannot add pages into the reserved memory
table and reports oops.

Without EFI MEMRESERVE, the reserved memory table cannot be passed from
the primary kernel to the secondary kernel, this is why it's important
for debugging tools.

> > This structure eventually will not change frequently, so I assume
> > later we will have little effort for maintainence it
>
> The problem is not really "maintainance" here. It is more that if Linux is
> updating the structure in a non-backward compatible way, then new
> version of Linux would not boot on older Xen.
> 
> We would have similar probable with new Xen booting older Xen because the
> hypervisor doesn't know (and should not need to know) which OS is used.

Fair point.

> In the nutshells, Xen should only use stable interface. If MEMRESERVE is
> really necessary then we should either switch to the Linux EFI stub or
> standardize MEMRESERVE.

Yeah, here I really need your (and other maintainers) opinions.  Seems
to me, support Linux EFI stub would be the best thing to do, to be
honest, this is a task which is out of my capability :)

Current approach in this patch is not perfect, it lets things to work.
So please let me know the conclusion from your side.

Thanks,
Leo

