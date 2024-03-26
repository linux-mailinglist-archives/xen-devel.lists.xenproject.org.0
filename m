Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9140C88CAE6
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 18:30:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698192.1089639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpAcw-0007pF-4s; Tue, 26 Mar 2024 17:30:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698192.1089639; Tue, 26 Mar 2024 17:30:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpAcw-0007n2-1Z; Tue, 26 Mar 2024 17:30:22 +0000
Received: by outflank-mailman (input) for mailman id 698192;
 Tue, 26 Mar 2024 17:30:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EqC6=LA=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rpAcu-0007mw-Fe
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 17:30:20 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83b1369c-eb96-11ee-a1ef-f123f15fe8a2;
 Tue, 26 Mar 2024 18:30:18 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-56c3689ad2cso476117a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Mar 2024 10:30:18 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 u1-20020a1709063b8100b00a46fbff47a6sm4421282ejf.168.2024.03.26.10.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 10:30:17 -0700 (PDT)
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
X-Inumbo-ID: 83b1369c-eb96-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711474218; x=1712079018; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uNR6ZmVTy1I7k4lM5R/62hpX5yWv9KwM07BigfA2l7o=;
        b=a9ZmXuCLBlvdeyaHqs0Vn+WYgGS38DRWv+56y8+9u9+JUChRj7l+0bnSp88fovIiqa
         P+zojua3gdBaubX24Qe2dZ2X0DVqmKbi6vNa8cvO5owbzQm01cqhA4ywkz+ax76YGKWE
         6u27MYNOvB41O1oqojMQkGSKgZBP4UdOZ+aww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711474218; x=1712079018;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uNR6ZmVTy1I7k4lM5R/62hpX5yWv9KwM07BigfA2l7o=;
        b=sJgZSq4MxslS9LVYB8BRMg00oMRnDwJWnccDrphvUBZj29a7Fgnl6SAeW1/W2u0IRq
         VNKDJz5MB9xdX4Q0hR1V2vaIJHtOojNZxCz1P+z0d1BWRU8lCAs0HVaUtxdRJmEfamZb
         85FbzloWsNJjTYFXtZg0X5cJ2ygp7+/PSzbLpenUJtYVKwu3FoFzq/RKhSPSwFLWo/uc
         86I3fmNO8opSNAZ1z1bP2aLWRDf3NtgvXORO+P7bM4Y2dgiLQaUE1pztf6xRG3qwL5bt
         b+agJ1qvrxWwwjZzPwR6KQhEXFHX4tKmSCXPT9OwKczOhWU3T1HTwgt7arv/wIBYbY+K
         ofkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK8CTF4tWQaYDqBKgS6CJmOoQdt4SJK+IduwQ/zhHVxg3GqyUsaOd16VrKQPDoguEoqkR37P5C40aINSYosTLI9iKT1wcbeRGfBWMT1tY=
X-Gm-Message-State: AOJu0YzSYjhl31X7ZkFPFG/S4WtCmD7eCuBmeuavO4JGBn8+9jsGur6w
	MNnEwcBwBqTB6CHpkHvLP0EU41VsMbYf6dyM+7c1ua0kx/SLL9OntPVjFOzDmew=
X-Google-Smtp-Source: AGHT+IED9REL4AtbJHtg5KJCIkZv/TLyb2w+DD5qURrER6A4z01CVxLs3y3++VhhpbvvZ6RL62iyHw==
X-Received: by 2002:a17:906:29cd:b0:a47:5103:2d3 with SMTP id y13-20020a17090629cd00b00a47510302d3mr2629185eje.9.1711474217734;
        Tue, 26 Mar 2024 10:30:17 -0700 (PDT)
Date: Tue, 26 Mar 2024 17:30:16 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: qemu-devel@nongnu.org, Jason Andryuk <jandryuk@gmail.com>,
	=?iso-8859-1?Q?Fr=E9d=E9ric_Pierret_=28fepitre=29?= <frederic.pierret@qubes-os.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 2/2] xen: fix stubdom PCI addr
Message-ID: <26006034-dc36-48ff-991b-898596bc2351@perard>
References: <20240305191312.321127-1-marmarek@invisiblethingslab.com>
 <20240305191312.321127-2-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240305191312.321127-2-marmarek@invisiblethingslab.com>

First things first, could you fix the coding style?

Run something like `./scripts/checkpatch.pl @^..` or
`./scripts/checkpatch.pl master..`. Patchew might have run that for you
if the patch series had a cover letter.

On Tue, Mar 05, 2024 at 08:12:30PM +0100, Marek Marczykowski-Górecki wrote:
> diff --git a/hw/xen/xen-host-pci-device.c b/hw/xen/xen-host-pci-device.c
> index 8c6e9a1716..8ea2a5a4af 100644
> --- a/hw/xen/xen-host-pci-device.c
> +++ b/hw/xen/xen-host-pci-device.c
> @@ -9,6 +9,8 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "qemu/cutils.h"
> +#include "hw/xen/xen-legacy-backend.h"

I'd like to avoid this header here, that would be complicated at the
moment, as the global variable `xenstore` would be missing. So for now,
that's fine. I guess that could be rework if something like Philippe
talked about at
https://lore.kernel.org/qemu-devel/429a5a27-21b9-45bd-a1a6-a1c2ccc484c9@linaro.org/
materialise.


Beside the coding style, the patch looks file.

Thanks,

-- 
Anthony PERARD

