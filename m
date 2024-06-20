Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6BA9100AB
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 11:44:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744338.1151363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKEKu-0000wD-Oi; Thu, 20 Jun 2024 09:44:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744338.1151363; Thu, 20 Jun 2024 09:44:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKEKu-0000th-Ld; Thu, 20 Jun 2024 09:44:08 +0000
Received: by outflank-mailman (input) for mailman id 744338;
 Thu, 20 Jun 2024 09:44:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TjK6=NW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sKEKt-0000tb-Dq
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 09:44:07 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a228226e-2ee9-11ef-b4bb-af5377834399;
 Thu, 20 Jun 2024 11:44:05 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52c89d6b4adso612073e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jun 2024 02:44:05 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2889d38sm1989510e87.303.2024.06.20.02.44.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 02:44:04 -0700 (PDT)
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
X-Inumbo-ID: a228226e-2ee9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718876645; x=1719481445; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N9xVWL/x/lX73QedKCfBzagjNx6/zXPfp05AhbQOiMY=;
        b=NcGjxo7iVfcAWV1Hoy2MNsp0E+Xo0/yYJ6AMF3cjnSv8jn/Y7sYLmQxo+rslHVRiTi
         e89Nkr2+9baHL6x0R8M77ggUISo2DRgnpoKspYmx03AFK8dW2UY478+L4npUG87rA2ap
         kjdepwo2gurxpIo2OL+wB5a5y0zc8ByeaStsJCmoCeHUtpUw4V1bFlaDMYflpGy3mbv9
         aK3q84ZZ2wNC0uGncTm6okzttFLhV4NFTxWOszk9neS4YLw6pIpBZi2EhvDnCYvyNhC5
         cHG6HOXRAYQjg7I1SoEWlS9EonnYpLJ+7EvVUjQtk99gt1qhVF5vhIEvDH1RKPO/VlID
         U6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718876645; x=1719481445;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N9xVWL/x/lX73QedKCfBzagjNx6/zXPfp05AhbQOiMY=;
        b=nRRqRp1XF9O8AtMBGU8pWlmsfg9NrWXWVJJMYBapsXv/371QI97DM49YCw/g6OnblF
         W/BA8iT5pOggAr1wmuepNCZVfEqvZn9RZbIkQNBZqcZnq22PqiG7pzzwIdCABcny4/jg
         DHsyBIUvhz1IeaqigOkXtZ5cvRLVUUOEG3FYW5gnxtbm+ZieATenlo+55wRz8ZnvFpx7
         eTtAAqkFAJe5YI0fRdeVFLr7WejRDa/e2ARW7KC9tjhwxCZFU6hmclPJ/BnsZVITrZwI
         9EVT4s8dp5bF9WW59DBlFeuXE8Hams4hd6B5cU7/2l/51Sl1yxxByv3KeT8etKVel+Rs
         oVwA==
X-Forwarded-Encrypted: i=1; AJvYcCVdgoU1XEOqPzaQSLYuVvSlu2+XN/RCQvgKCBPuLei+dZT2f+f9mn8inPnMIT4DTD0fORmroTQrbCwKNFfGjc3sR9Jo6FF2gj0Uq+G8wUw=
X-Gm-Message-State: AOJu0Yxp+JiurSvBKkeLdTwf4W1yDjS7BxqmQR4zmeUsEiFhm2y2vZt/
	IirWJhMyj74qlNRHo8A0z6pE5ATWsgIAQgeUxl4r9/9G2K4a+Jua
X-Google-Smtp-Source: AGHT+IG3SDWR509lgY5kuX8YASxACu9X/zy50TSWsHxqRAzHh4x+PppCWM/Ic8dDztiEGf/sBpV0JQ==
X-Received: by 2002:a05:6512:e94:b0:52c:8339:d09c with SMTP id 2adb3069b0e04-52ccaa56a39mr3428272e87.3.1718876644770;
        Thu, 20 Jun 2024 02:44:04 -0700 (PDT)
Message-ID: <79ea8b2dbddc69468865caaff7590dc5e836046f.camel@gmail.com>
Subject: Re: [PATCH for-4.19 v4] x86/irq: forward pending interrupts to new
 destination in fixup_irqs()
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Date: Thu, 20 Jun 2024 11:44:04 +0200
In-Reply-To: <0b54d032-a473-4f3e-8284-b9fe63cbf26a@suse.com>
References: <20240619095833.76271-1-roger.pau@citrix.com>
	 <0b54d032-a473-4f3e-8284-b9fe63cbf26a@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Wed, 2024-06-19 at 13:53 +0200, Jan Beulich wrote:
> On 19.06.2024 11:58, Roger Pau Monne wrote:
> > fixup_irqs() is used to evacuate interrupts from to be offlined
> > CPUs.=C2=A0 Given
> > the CPU is to become offline, the normal migration logic used by
> > Xen where the
> > vector in the previous target(s) is left configured until the
> > interrupt is
> > received on the new destination is not suitable.
> >=20
> > Instead attempt to do as much as possible in order to prevent
> > loosing
> > interrupts.=C2=A0 If fixup_irqs() is called from the CPU to be offlined
> > (as is
> > currently the case for CPU hot unplug) attempt to forward pending
> > vectors when
> > interrupts that target the current CPU are migrated to a different
> > destination.
> >=20
> > Additionally, for interrupts that have already been moved from the
> > current CPU
> > prior to the call to fixup_irqs() but that haven't been delivered
> > to the new
> > destination (iow: interrupts with move_in_progress set and the
> > current CPU set
> > in ->arch.old_cpu_mask) also check whether the previous vector is
> > pending and
> > forward it to the new destination.
> >=20
> > This allows us to remove the window with interrupts enabled at the
> > bottom of
> > fixup_irqs().=C2=A0 Such window wasn't safe anyway: references to the
> > CPU to become
> > offline are removed from interrupts masks, but the per-CPU
> > vector_irq[] array
> > is not updated to reflect those changes (as the CPU is going
> > offline anyway).
> >=20
> > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>=20
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

