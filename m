Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C06904E2D
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 10:31:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738957.1145829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHJNu-0006sE-BP; Wed, 12 Jun 2024 08:31:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738957.1145829; Wed, 12 Jun 2024 08:31:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHJNu-0006qj-7G; Wed, 12 Jun 2024 08:31:10 +0000
Received: by outflank-mailman (input) for mailman id 738957;
 Wed, 12 Jun 2024 08:31:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kV4F=NO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sHJNt-0006q6-8Z
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 08:31:09 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d7257fe-2896-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 10:31:07 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-421d32fda86so30369335e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 01:31:07 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422874de618sm16423335e9.37.2024.06.12.01.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 01:31:06 -0700 (PDT)
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
X-Inumbo-ID: 1d7257fe-2896-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718181067; x=1718785867; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8A0WhxCTC1sf7GsqpPCXviAZ1key9LA6PyIZaOL7QxA=;
        b=NrUFY9PcAjv6Oi12A62VUtZYCVbH8bf2Vw7DHXVylWjRa93gydBkQReSGRGp0kknQP
         bzNkjdBc1npUBAGWjd9Id99J71NVFHVz7yYzUbEzWmDrL7deHHDQZ93bwaegTeXQMbXa
         4+AniWpyQ5fFe2RVz3sO9qcvZTo/Y9w8zA7hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718181067; x=1718785867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8A0WhxCTC1sf7GsqpPCXviAZ1key9LA6PyIZaOL7QxA=;
        b=aZaFXq7NXstJfiJN8eF8GupVfYU3/sIhCAS/uIqp5/MdXCgCUkxvi1Da/zoogNuFM/
         XXSkwilqjQggdiuTvNhJHYq1vV8YdNL6uPQaG/nkaVawGXUXBfjJ27hpqYmH6eDmmxSr
         vfJggM7S99rjCkIZFdiI8w62t/HqCUg8ZFAX0Vc1OcXPTOXVQDA0qJZ8pwPpdEdf2MwG
         MiE7fqRgcZU3ZOZ8BR7d2uOfxKdTxdiw6lF8sEKLC7zeocqvEK7G5+zOB8xyemGZHwEa
         4djSFj3U1S45SpKTtRtfzRXiMou8m8DbTEFbd7DFiZ7MI5LNmHd/jM0ld6fOj5ra7pdw
         8igQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjRnbibSvb0ILUJxQ4inu2dIIBN0L3eQdsAuOuvEMUxbZ7yhKlYw4qUUBzbztNjD18zIowb4u1npvJaN/27CC0h8F31rGzgd7kVRT5d88=
X-Gm-Message-State: AOJu0YwIZ6p2Oz6HvK0QrMrCl3QkjZemT3Va3iE+ISuf8u8LZjs6Yedv
	EP277ewnhSnZJ6HUX3Y+jHo9JVqZsxj9DPsweAOAPNja5SbuyqagE3C93YB+MUg=
X-Google-Smtp-Source: AGHT+IEuBdChjBDzysOORmqPbbCyzmTofVzaRyuyCob+e8MQ8OQyrPKu+c57GZbpSLh/BBAvqdcFaQ==
X-Received: by 2002:a05:600c:46ce:b0:422:e8d:e559 with SMTP id 5b1f17b1804b1-422864aebe0mr12309155e9.23.1718181067152;
        Wed, 12 Jun 2024 01:31:07 -0700 (PDT)
Date: Wed, 12 Jun 2024 10:31:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 4/7] x86/irq: restrict CPU movement in
 set_desc_affinity()
Message-ID: <ZmlcyqkHh562lL2j@macbook>
References: <20240610142043.11924-1-roger.pau@citrix.com>
 <20240610142043.11924-5-roger.pau@citrix.com>
 <b2e8eed9-1df8-442b-ae7e-401c406eaef8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b2e8eed9-1df8-442b-ae7e-401c406eaef8@suse.com>

On Tue, Jun 11, 2024 at 12:20:33PM +0200, Jan Beulich wrote:
> On 10.06.2024 16:20, Roger Pau Monne wrote:
> > If external interrupts are using logical mode it's possible to have an overlap
> > between the current ->arch.cpu_mask and the provided mask (or TARGET_CPUS).  If
> > that's the case avoid assigning a new vector and just move the interrupt to a
> > member of ->arch.cpu_mask that overlaps with the provided mask and is online.
> 
> What I'm kind of missing here is an explanation of why what _assign_irq_vector()
> does to avoid unnecessary migration (very first conditional there) isn't
> sufficient.

Somehow I looked at that and think it wasn't enough, but now I cannot
figure out why, so it might be just fine, and this patch is not
needed.  Let me test again and get back to you, for the time being
ignore this patch.

Thanks, Roger.

