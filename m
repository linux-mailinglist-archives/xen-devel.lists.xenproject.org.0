Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DA2677DEA
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 15:24:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482896.748676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJxjc-0004yH-8b; Mon, 23 Jan 2023 14:23:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482896.748676; Mon, 23 Jan 2023 14:23:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJxjc-0004uv-5d; Mon, 23 Jan 2023 14:23:44 +0000
Received: by outflank-mailman (input) for mailman id 482896;
 Mon, 23 Jan 2023 14:23:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rv8W=5U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pJxja-0004up-HK
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 14:23:42 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87c9383d-9b29-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 15:23:40 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso8686129wms.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jan 2023 06:23:39 -0800 (PST)
Received: from [192.168.100.7] (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr.
 [90.112.199.53]) by smtp.gmail.com with ESMTPSA id
 n42-20020a05600c3baa00b003d96efd09b7sm12362975wms.19.2023.01.23.06.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 06:23:38 -0800 (PST)
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
X-Inumbo-ID: 87c9383d-9b29-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PpApWe/Q3rfJtVAeOhCC4USGuzGM53MmoaOHYnCHfyw=;
        b=Zbd+GIzdJfAv13PxRKokybPEZugMVVqamfRTpKDS9XD+FlWQoiWNS8PEkQHgCJlY1m
         jPs67w0Ob/7C/jty8tI+R99tHwQYEVDi+kbyY7tJxtiPNauY3256dZq+zc2KZeNQwusJ
         rDDhF2Fs/Oe3OLQOSdYdm9F/d89ISALvPUk1n1woeK5Y14cISPSueuEy0yHRpkwakLFr
         p/nd9ay9xRyoP5viQsUN+KpUKuyxRtXsnpCevjYzpVQjF16+5iJTz/raMOZq4lEYt1o7
         0qKnFzTcW7qDPhUnsUNJSf1uvBACCdt5oY19tgqYy56UlLqCk+ljwZ5s/Je+5TRuYtvA
         p5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PpApWe/Q3rfJtVAeOhCC4USGuzGM53MmoaOHYnCHfyw=;
        b=3Lw/P9IkcpYWvvUWFk+isyqeDZOxCYnYIL8kFg1Rzd1iZoT6SwnzJWe5IW9rMiyvz9
         EVEos5efA3iS9jBGMcOEow+SnvIaGmwMWSAvoaLRov+N7lZuzwPBNiSMbvO3mqy+RS4m
         gvcEWXgILSA1Pjik4DXS00oagzKWoox7XaDCaaV4GPThO8dgiPHE5mmPoWTWhH0gbMHe
         lfVEtaGuyv1hHiuHQKNMDDLAqEF3Dpj5aZ6Dw9JdB2H2awupVWoMYnp7DqBloIJjYRtH
         IOtF+Hkaf+AHx7FNmYEYe+ULNvIMwny9o/eYHXOxUiwCWbVm9zStiyq2mgvcJf1bSAIp
         UPFg==
X-Gm-Message-State: AFqh2krCBNPa9ggr6l3oh9TXPVoUf6mnLVMeowFm3+hDZOpDNt08ldfa
	wSQ9sngwj8K9XSvAIZhi4Kc=
X-Google-Smtp-Source: AMrXdXt4qk4MP6V4ET3o4yez35DK5E4lzGaP/wvvy7ySmwPXkVUdKPoFOJTBsOJVB5p/RJa4tVWGfA==
X-Received: by 2002:a05:600c:540b:b0:3da:282b:e774 with SMTP id he11-20020a05600c540b00b003da282be774mr32190327wmb.38.1674483818824;
        Mon, 23 Jan 2023 06:23:38 -0800 (PST)
Message-ID: <b6ef89747db4f8ce48dd66e7db8565a6d25f96b2.camel@gmail.com>
Subject: Re: [PATCH v1 04/14] xen/riscv: add <asm/csr.h> header
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>,
 xen-devel@lists.xenproject.org
Date: Mon, 23 Jan 2023 16:23:37 +0200
In-Reply-To: <08ac78fd-85d4-2a43-1922-3128d5fd8d21@suse.com>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
	 <afc53b9bee58b5d386f105ee8f23a411d5a15bed.1674226563.git.oleksii.kurochko@gmail.com>
	 <08ac78fd-85d4-2a43-1922-3128d5fd8d21@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Mon, 2023-01-23 at 14:57 +0100, Jan Beulich wrote:
> On 20.01.2023 15:59, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/csr.h
> > @@ -0,0 +1,82 @@
> > +/*
> > + * Take from Linux.
>=20
> This again means you want an Origin: tag. Whether the comment itself
> is
> useful depends on how much customization you expect there to be down
> the road. But wait - the header here is quite dissimilar from
> Linux'es,
> so the description wants to go into further detail. That would then
> want
> to include why 5 of the 7 functions are actually commented out at
> this
> point.
>=20
I forgot two remove them. They were commented as they aren't used now.
But probably there is a sense to add them from the start.

I am curious if "Take from Linux" is needed at all?
Should it be described what was removed from the original header [1] ?

[1]
https://elixir.bootlin.com/linux/latest/source/arch/riscv/include/asm/csr.h
> Jan


