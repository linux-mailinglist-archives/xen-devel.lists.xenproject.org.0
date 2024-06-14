Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D869084C6
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 09:28:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740444.1147545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI1M2-0006Qv-I0; Fri, 14 Jun 2024 07:28:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740444.1147545; Fri, 14 Jun 2024 07:28:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI1M2-0006OO-ER; Fri, 14 Jun 2024 07:28:10 +0000
Received: by outflank-mailman (input) for mailman id 740444;
 Fri, 14 Jun 2024 07:28:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9HBj=NQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sI1M0-0006OI-T2
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 07:28:08 +0000
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [2607:f8b0:4864:20::72e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5052de6-2a1f-11ef-90a3-e314d9c70b13;
 Fri, 14 Jun 2024 09:28:08 +0200 (CEST)
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-795fb13b256so240523885a.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Jun 2024 00:28:07 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798c39d8cafsm99920785a.127.2024.06.14.00.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 00:28:06 -0700 (PDT)
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
X-Inumbo-ID: a5052de6-2a1f-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718350087; x=1718954887; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AjdI3UexGQhSAVV8WQLC6fi29mLFXRJSnGVS0+jkJ74=;
        b=U2vjOQVZhwOWq4t9V5eaeE02i3DNwaWvxxGpTmYVxPZ6oGJCRechX1c0L6wfYIlcaE
         xYkIKVL/4wo906hBPT6qHZdsTsu1s//MiCM9SupADFhHFI7R44FlHdbwweT0SWUMfh56
         hwmwVhnQlv831ryjhkqouCUp66cSeI6MGNagE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718350087; x=1718954887;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AjdI3UexGQhSAVV8WQLC6fi29mLFXRJSnGVS0+jkJ74=;
        b=FguhVm9MOJ6RmaoIM2f4h8lYYTlGg/c3QmG/r5ZY5AkSjWSeAJ6azxOKj4khJ6392G
         eNF2ncUlVcYHLDZ0OP8NqZCotZ27xrzfPAJ18KKU5lCwC8pU85+jwYmd/czH5qk8FA+X
         51MdwiLHuO88O7LVs22U5tTztCpcqWopHZhkz0Np/lfy7o61kHPYVF7NZ05NkeR3V6v4
         oBIuqwrqzJCTM5SfGmF6tKtKYORGsLg+YWUCOZ4l/OKXXuODO7gToLVKiPwtGprhq/ct
         wFUcL4bViPwPdX6dSz3+CKC2caD+RFo4MaMkyEvd5I00S3OBKaAT0KH4T4ivyekK1AX9
         IT7g==
X-Gm-Message-State: AOJu0YxmchEkj9VObQOZuiTyps+8tQw4znm/K+4tDFVFbevbeVNwTZz5
	k77543NCnkepNG6uDgL5mRAHdvS/zebfmJaMETpkePJLVHhDKVFSxmQEbepcV/M=
X-Google-Smtp-Source: AGHT+IHhW+F41haxSkC2Q6cu+he4fZModuuYyU37dQ0vGZEezfrPmzEd+2p1UnWWVxKDh0kb8K4cHQ==
X-Received: by 2002:a05:620a:254e:b0:797:f5ee:91d with SMTP id af79cd13be357-798d03b7913mr366542485a.24.1718350086726;
        Fri, 14 Jun 2024 00:28:06 -0700 (PDT)
Date: Fri, 14 Jun 2024 09:28:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 0/3] x86/irq: fixes for CPU hot{,un}plug
Message-ID: <ZmvxBDomxxBjOYEK@macbook>
References: <20240613165617.42538-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240613165617.42538-1-roger.pau@citrix.com>

Sorry, forgot to add the for-4.19 tag and Cc Oleksii.

Since we have taken the start of the series, we might as well take the
remaining patches (if other x86 maintainers agree) and attempt to
hopefully fix all the interrupt issues with CPU hotplug/unplug.

FTR: there are further issues when doing CPU hotplug/unplug from a PVH
dom0, but those are out of the scope for 4.19, as I haven't even
started to diagnose what's going on.

Thanks, Roger.

On Thu, Jun 13, 2024 at 06:56:14PM +0200, Roger Pau Monne wrote:
> Hello,
> 
> The following series aim to fix interrupt handling when doing CPU
> plug/unplug operations.  Without this series running:
> 
> cpus=`xl info max_cpu_id`
> while [ 1 ]; do
>     for i in `seq 1 $cpus`; do
>         xen-hptool cpu-offline $i;
>         xen-hptool cpu-online $i;
>     done
> done
> 
> Quite quickly results in interrupts getting lost and "No irq handler for
> vector" messages on the Xen console.  Drivers in dom0 also start getting
> interrupt timeouts and the system becomes unusable.
> 
> After applying the series running the loop over night still result in a
> fully usable system, no  "No irq handler for vector" messages at all, no
> interrupt loses reported by dom0.  Test with x2apic-mode={mixed,cluster}.
> 
> I've attempted to document all code as good as I could, interrupt
> handling has some unexpected corner cases that are hard to diagnose and
> reason about.
> 
> Some XenRT testing is undergoing to ensure no breakages.
> 
> Thanks, Roger.
> 
> Roger Pau Monne (3):
>   x86/irq: deal with old_cpu_mask for interrupts in movement in
>     fixup_irqs()
>   x86/irq: handle moving interrupts in _assign_irq_vector()
>   x86/irq: forward pending interrupts to new destination in fixup_irqs()
> 
>  xen/arch/x86/include/asm/apic.h |   5 +
>  xen/arch/x86/irq.c              | 163 +++++++++++++++++++++++++-------
>  2 files changed, 132 insertions(+), 36 deletions(-)
> 
> -- 
> 2.45.2
> 

