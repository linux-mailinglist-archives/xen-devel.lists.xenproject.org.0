Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D85A60F1D
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 11:36:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914330.1320112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt2OV-0007jE-18; Fri, 14 Mar 2025 10:35:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914330.1320112; Fri, 14 Mar 2025 10:35:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt2OU-0007ge-Tx; Fri, 14 Mar 2025 10:35:58 +0000
Received: by outflank-mailman (input) for mailman id 914330;
 Fri, 14 Mar 2025 10:35:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OT8H=WB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tt2OT-0007gY-01
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 10:35:57 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bde70d3-00c0-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 11:35:55 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ac25313ea37so388283566b.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 03:35:55 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac3147f0ecdsm205535566b.73.2025.03.14.03.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 03:35:54 -0700 (PDT)
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
X-Inumbo-ID: 1bde70d3-00c0-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741948554; x=1742553354; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4R6SxKYWf0UJYMh+URvu0b6k/Nx7GMOWw7bCQzgOTA4=;
        b=ZAGac5jJMX/A2Ib0VK3RSQzU5xdg6yg7UrPgUq/jwYhqHl9Yxhh0SXfOLUIOOZxgnU
         qJxLDWRUmcyhznEGF2tMAU+3X5ZkGIIKYLopf2lbZMhsx2EwzyHbgrbZ7SmadbCwmm9g
         4vyeqLi7poa4yiWKuGDgiqrenGTfhbEc3tYFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741948554; x=1742553354;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4R6SxKYWf0UJYMh+URvu0b6k/Nx7GMOWw7bCQzgOTA4=;
        b=RZQSlOIgklOFlnQJnMPUNH/EvtCZR+hXW8c6TO5nAFXdTcZehTD/L8IIRXfwhmoSAB
         JrZ3vk6uZQ6LS+NabFbr+nZ+PRRn+jrmgzL7iPLJSeSc4B4wAeActphOyypGC6Q0aASZ
         hgUZxWKAdRLPELICxfQgXHKv+9Ze1gzZPyjNrw12ClPi9H+vK+C8UQ///1zlRhXHGaqd
         4C0H5xT9tzPpAN5qLeXusbWAmM+raZSUVHnJG8aaRHEe//LsjH0P9POksRsnnuntghdW
         s7jL7xHupW3kpL6y+bY71t6GJj9qEbqMhlBGc6iVe7usC6nhjSQ3oVxd9608pmQH/jN0
         SOtg==
X-Gm-Message-State: AOJu0YzGjDomFGol3DlzyGtMwBMQcp6/YpAheGKPUrXg7wGaBn5MjqGm
	UOr9lZAPnvtWL43raEgoGwEUVLz1jSPRtKZszyhYji4NCdcEdj7neF/ebteRY+0=
X-Gm-Gg: ASbGnctzMLsr34U/0Ncc3l12Yq/BQ58u/Gfyp3v6oelKEXqKv4ORpdWw3ObbpQZuJNB
	35AduzQaaChch1Ewop+0dsF2q3GImXd63maRPpyRUWGXctHq+GDPENnffv7Fte9YS8VnV9n6mQm
	psTlGxuhJ+W6CNUV9NVl9NIwuOnvHmuHEmH9EmzLBIgZ4m3iiseb9+d8Wp59Nuzu3eoBn42x06Z
	T8yYtoaQh7Eg4E/Zb/llxFlKzmAUPHweeM7GklqIhRtXwtCitEvd0kLffvhGZD5W9PMLu368YbX
	jVJrrnG3LeCKT7SaiIGdVHpooqWZjV0TxLW6Zsik5HzAvHPaKGpUEJ4I35U0
X-Google-Smtp-Source: AGHT+IHIh60o3qulbIzUnHx+8fIZ86SMJrBsB/LBGtruIou6sOFYe0kupRUa3yeuV3XZy+3y1rcQBQ==
X-Received: by 2002:a17:907:9281:b0:abf:b2d1:bb4c with SMTP id a640c23a62f3a-ac33040c694mr232906166b.52.1741948554462;
        Fri, 14 Mar 2025 03:35:54 -0700 (PDT)
Date: Fri, 14 Mar 2025 11:35:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: Re: [PATCH] xen: Update minimum toolchain requirements
Message-ID: <Z9QGiSl8vfeYdjXm@macbook.local>
References: <20250307175435.3089686-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250307175435.3089686-1-andrew.cooper3@citrix.com>

On Fri, Mar 07, 2025 at 05:54:35PM +0000, Andrew Cooper wrote:
> GCC 4.1.2 is from 2007, and Binutils 2.16 is a similar vintage.  Clang 3.5 is
> from 2014.  Supporting toolchains this old is a massive development and
> testing burden.
> 
> Set a minimum baseline of GCC 5.1 across the board, along with Binutils 2.25
> which is the same age.  These were chosen *3 years ago* as Linux's minimum
> requirements because even back then, they were ubiquitous in distros.  Choose
> Clang/LLVM 11 as a baseline for similar reasons; the Linux commit making this
> change two years ago cites a laudry list of code generation bugs.
> 
> This will allow us to retire a lot of compatiblity logic, and start using new
> features previously unavailable because of no viable compatibility option.
> 
> Merge the ARM 32bit and 64bit sections now they're the same.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

IIRC Ld in LLVM 11 should be capable of linking Xen.  I think the
first LLVM release with an LD capable of linking Xen was version 6 or
7.

Thanks, Roger.

