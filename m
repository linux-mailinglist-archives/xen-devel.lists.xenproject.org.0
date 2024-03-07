Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C75B3874C3D
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 11:21:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689738.1074971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riAs0-0003fc-3Z; Thu, 07 Mar 2024 10:21:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689738.1074971; Thu, 07 Mar 2024 10:21:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riAs0-0003dJ-0h; Thu, 07 Mar 2024 10:21:00 +0000
Received: by outflank-mailman (input) for mailman id 689738;
 Thu, 07 Mar 2024 10:20:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z5IG=KN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1riAry-0003dD-NB
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 10:20:58 +0000
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [2607:f8b0:4864:20::830])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 626a2734-dc6c-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 11:20:56 +0100 (CET)
Received: by mail-qt1-x830.google.com with SMTP id
 d75a77b69052e-42e63a658e1so2152151cf.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 02:20:56 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 l17-20020ac84591000000b0042f15132166sm500460qtn.52.2024.03.07.02.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 02:20:55 -0800 (PST)
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
X-Inumbo-ID: 626a2734-dc6c-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709806855; x=1710411655; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sxc/MxlXvEOuxZfqktGZS6e46Q6TOq84VbsXVIWOBB8=;
        b=khg9xnLV3C+iVtbkqiFCEgm+hvJGASK1RJZh41mwZmdh5YBQpPomyvfYYJx3AGo4nZ
         zr4mFdvGp46qu2wVbC+hyKfTwZ2uPqftOFoQLcQSnjTUzhrNbimcbOL1qng6hQchEny8
         C248THrmCdc2op23YpL/kJk1EaJhRA2um/JCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709806855; x=1710411655;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sxc/MxlXvEOuxZfqktGZS6e46Q6TOq84VbsXVIWOBB8=;
        b=RrpS1a3TAMRDK0xb95F85zo0JR4em/bh90ogq3TBQzzeVAO+aGynAcpwBRifMbAgda
         eRCt3klrU9ybmQy/osY1rFdqWjwI7HVk/pmt9Wzviao+k4geY+Kkbw5exYGubh1Za5fj
         /5hf1JPMnI9wQZqaYzLvPlZQrsw5ktFbl8KDNLpU4ZvwZuIjodk3f1RlQ3YtDaRoRj0S
         RggHWEZ+n50h0HH81CMHmWuQSl98k3wGyY20mWifRox5yLLiZ8pjiA7t9qAukRNOWIuD
         24W/tVRccv0uC0XqRqedFiEwCNMEr2swSA8PEZ/4ri6lG1mvNKMchvryGz/HxhpWs0CN
         OSSA==
X-Forwarded-Encrypted: i=1; AJvYcCUTQi042PcOtKFCjuHpUouDZVDsQcfmyzXJyUdSf0mT14KXfYUX/GFF9Yx+0w8VnC6UJFI8rjnPqX5NukeS6q1nnXSJlsdLnBwm6xWxKVA=
X-Gm-Message-State: AOJu0YxTApW3bBvgNgbLvmRZZDBGkDO1bVyse1sCON80iVww/nljFNMC
	9iQTn1ajLa/FIB9k3WW7TRxnq6flD3iG5bBN6a1EkJ1yh0X3ZKENd494VXcLoWc=
X-Google-Smtp-Source: AGHT+IFvYDETf5O73MrtiwbOc7SFRgG52wQZnOryaoAxLVSQ+uVXyr6UDKeRyKHfkvOYMN0gAehylQ==
X-Received: by 2002:a05:622a:1756:b0:42e:e412:c0dc with SMTP id l22-20020a05622a175600b0042ee412c0dcmr7820809qtk.43.1709806855430;
        Thu, 07 Mar 2024 02:20:55 -0800 (PST)
Date: Thu, 7 Mar 2024 11:20:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 0/3] x86/pvh: Support relocating dom0 kernel
Message-ID: <ZemVBa1rxMsNI1pp@macbook>
References: <20240306185032.103216-1-jason.andryuk@amd.com>
 <ZemQS-8a_a5pwzf-@macbook>
 <f6cbaf67-f5c7-4947-a07a-0f1d8f693462@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f6cbaf67-f5c7-4947-a07a-0f1d8f693462@suse.com>

On Thu, Mar 07, 2024 at 11:08:37AM +0100, Jan Beulich wrote:
> On 07.03.2024 11:00, Roger Pau Monné wrote:
> > On Wed, Mar 06, 2024 at 01:50:29PM -0500, Jason Andryuk wrote:
> >> Xen tries to load a PVH dom0 kernel at the fixed guest physical address
> >> from the elf headers.  For Linux, this defaults to 0x1000000 (16MB), but
> >> it can be configured.
> >>
> >> Unfortunately there exist firmwares that have reserved regions at this
> >> address, so Xen fails to load the dom0 kernel since it's not RAM.
> >>
> >> The other issue is that the Linux PVH entry point is not
> >> position-independent.  It expects to run at the compiled
> >> CONFIG_PHYSICAL_ADDRESS.
> >>
> >> This patch set expands the PVH dom0 builder to try to relocate the
> >> kernel if needed and possible.  XENFEAT_pvh_relocatable is added for
> >> kernels to indicate they are relocatable.  However, we may want to
> >> switch to an additional ELF note with the kernel alignment.  Linux
> >> specifies a kernel alignment in the bzImage boot_params.setup_header,
> >> but that is not present the ELF vmlinux file.
> > 
> > I wonder whether we need a pair of notes, to signal the min/max
> > addresses the kernel supports being relocated to.
> 
> Plus, as per your other reply, a 3rd one to specify alignment needs.

Alignment we could in theory get from the ELF program header, if OSes
fill those reliably.  FreeBSD seems to do so, haven't checked Linux.

> Then again - a single note can have multiple values. So perhaps it
> doesn't need to be more than one new notes (except if dealing with
> multi-value ones is deemed too complicated).

I've never dealt with a multi-value note, if that's not overly
complicated I would be fine with it, otherwise multiple notes are OK
IMO.

Thanks, Roger.

