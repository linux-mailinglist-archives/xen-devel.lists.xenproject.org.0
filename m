Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB7E98ED4D
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 12:47:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809255.1221489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swJMP-0004DQ-Io; Thu, 03 Oct 2024 10:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809255.1221489; Thu, 03 Oct 2024 10:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swJMP-0004Ak-F1; Thu, 03 Oct 2024 10:47:05 +0000
Received: by outflank-mailman (input) for mailman id 809255;
 Thu, 03 Oct 2024 10:47:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xwa6=Q7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1swJMO-00049H-Hs
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 10:47:04 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d28a8970-8174-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 12:47:02 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-53997328633so1138546e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 03:47:02 -0700 (PDT)
Received: from localhost ([213.195.117.215]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99102a8e13sm67967566b.90.2024.10.03.03.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 03:47:01 -0700 (PDT)
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
X-Inumbo-ID: d28a8970-8174-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727952421; x=1728557221; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p4nMR/2xdd+T//5OfwNOukfI/2ks/xi/FZJTgBdf1Nc=;
        b=aVRMXBO8QfwcRE5eqL3MLp+2W0u2DCzEIuIpE+tvzw7W/yj7dPKMSVcNFSV7efIEvy
         wKJGe9Mrv3gAer7MDV8GPhr1XaxbmWb/8zjxjGGckrOD04tR8K7XNTB8yTs17d4kfvpV
         YMdLu6EGgBnKVrF9RJzt1A5KApc3sQoOG4lYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727952421; x=1728557221;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4nMR/2xdd+T//5OfwNOukfI/2ks/xi/FZJTgBdf1Nc=;
        b=CDCXNudOGNBa/DcBmhzRAO3t0C6xybxyMFmSNzNQZQLZtC0nmv1ymMp2uc84EzVr3r
         f45nvpqzfIPzmxUw+qMiQxKWFvuZbX3akGckV/49Z/rLyZYgtcYRprcdD1g/n/VuN7nR
         qREupGethd9cqyXlJPRTGDftCX6DBuQwJ+xB9Mo9dJu9SwV/mj1uKkEGlaXDoku8Drdj
         ukU2TG5ZAuo75kRRVHNKZLtMbElux1XFx9ryjG6Vr6TJ2mb0wQCX2D6lszUWueaXY6QU
         u8g9NuVwOWd3mJ9GYOFiuwdgkE+lnN7wvwHZ74j72d7jXwMa9dmKGecQt8ucC1u6E9Wj
         tRYA==
X-Forwarded-Encrypted: i=1; AJvYcCVVcReAY47vIGsqzJhc4SMX5a/z2c8PN4C2/0IKEzQT8ZUo35B6b4V7Q6Pfu9HQ9tl/8lvsVD/Xgcg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxUUGQ/LYGz9fr/7t4Q5Bdlu4UFdgdRExfhioQEoJa/Aw0hZ7+O
	6oAFil9duSe4N5tnJzXxAgXdBW1t5YQLXeBcwYo7VYVZMMBH6t6kdNa7yH++hps=
X-Google-Smtp-Source: AGHT+IHyN/ITcj86isCvn9/qhL1Qiixo0UqFYZLLjm1Ch6MXz9O4tWOVBhWiqJ/hNNLh79GaIxnhfA==
X-Received: by 2002:a05:6512:e9e:b0:539:936c:9845 with SMTP id 2adb3069b0e04-539a0792f69mr5703673e87.37.1727952421414;
        Thu, 03 Oct 2024 03:47:01 -0700 (PDT)
Date: Thu, 3 Oct 2024 12:47:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 0/3] Switch flat driver to use phys dst for ext ints
Message-ID: <Zv52JFtmTmM256XR@macbook.local>
References: <cover.1727880621.git.matthew.barnes@cloud.com>
 <2640346b-495d-4612-abfc-304d71efe7e9@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2640346b-495d-4612-abfc-304d71efe7e9@citrix.com>

On Wed, Oct 02, 2024 at 06:45:51PM +0100, Andrew Cooper wrote:
> On 02/10/2024 4:17 pm, Matthew Barnes wrote:
> > This patch series switches the apic_default APIC driver from using
> > logical flat destination mode for external interrupts, to using
> > physical destination mode for external interrupts.
> >
> > This is followed up by two non-functional cleanup commits.
> >
> > Matthew Barnes (3):
> >   x86/APIC: Switch flat driver to use phys dst for ext ints
> >   x86/APIC: Remove unnecessary logical flat functions
> >   x86/APIC: Refactor GENAPIC_FLAT -> GENAPIC_MIXED
> 
> Patches 1 and 2 look fine.
> 
> For patch 3, can't we just delete the macro and expand it in it's single
> location?
> 
> It's a bigger patch, but a better improvement in genapic.h

I agree, but if we go that route we might as well do the conversion of
GENAPIC_PHYS in the same patch, and deal with both at the same time
(GENAPIC_PHYS is also used in a single place).

Thanks, Roger.

