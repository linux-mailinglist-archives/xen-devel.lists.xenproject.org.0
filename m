Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D58F805B1E
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 18:29:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648160.1012233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAZEf-0003ph-2e; Tue, 05 Dec 2023 17:29:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648160.1012233; Tue, 05 Dec 2023 17:29:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAZEe-0003nd-Vc; Tue, 05 Dec 2023 17:29:28 +0000
Received: by outflank-mailman (input) for mailman id 648160;
 Tue, 05 Dec 2023 17:29:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jRF5=HQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rAZEd-0003mP-Ir
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 17:29:27 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d610a154-9393-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 18:29:25 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3333fbbeab9so2802893f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 09:29:25 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 q4-20020a05600000c400b003333fa3d043sm8640900wrx.12.2023.12.05.09.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 09:29:24 -0800 (PST)
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
X-Inumbo-ID: d610a154-9393-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701797365; x=1702402165; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yVfRlkG8GOOrjxG4Vt56UQQqJU2qCckZjCaJgDt8mII=;
        b=JRj+77htwNyhSx6GUpuqgH2++R/tHmCRzfE8Na1Urdl8QYkeQmk4h4TCMe7R0CubIt
         iF0Gz7q2hfuz0X1LcwrAf396t3Fn+F5iP9oveSdzwIwBVkLtog8Aw1qB4t4oD0xh7Y+u
         OFfFJEKX4gc6HDFX05ljSZVBfSgTNxTK7VRMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701797365; x=1702402165;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yVfRlkG8GOOrjxG4Vt56UQQqJU2qCckZjCaJgDt8mII=;
        b=bFwLe+gXj3hSFQXtpRcjJHUkEdOMpvD9nVj6n/1CDAxNNWyNXNzgF9wnI5iNwuwk5W
         PF3Kgzc6Ev5HGA7zQyuVd6E8BRJ61Xn8eeVKSd145o2IYRkWgdI+Rd1yTWBmx09jnWFu
         tyFoyFDyeZiEcoutfiRGDVZquW8Q49b9Cqx83DBL4xDAp3uQFhBqQWhaA/K25CHyUYoa
         Fd+V6TfudG/1A1+kz/Yr7j9ufzPVc/7wrZSR60f7R/TpLOn6CO2YBJsNXcfYB32ePk/O
         pVJFB9KnpBcRBiGwPqS5HV7XDyt5ehU36WKXJgi+C69og2Kqe8MtK4r8JjTiRrP5gumQ
         8AzQ==
X-Gm-Message-State: AOJu0YwePv/qf6SXOnWju9ObJHNn3TqBAFkDfLhL4PNaIrKbGwAhIE6D
	Y4VBGdqrU9oqSp9D9FJ+rolw3A==
X-Google-Smtp-Source: AGHT+IH41ZPV6/r7QTEWzhmAhRtocFVMf40iVV4vmd2oI0D/KlctPP8JM5m6ctnHLUzViAyekUdzmw==
X-Received: by 2002:adf:f383:0:b0:333:b13:5565 with SMTP id m3-20020adff383000000b003330b135565mr4096479wro.71.1701797365098;
        Tue, 05 Dec 2023 09:29:25 -0800 (PST)
Date: Tue, 5 Dec 2023 18:29:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 5/6] x86/vPIC: vpic_elcr_mask() master bit 2 control
Message-ID: <ZW9d9MK6l6GwXo60@macbook>
References: <49a17ffa-c873-4b0f-81ed-9587053ca159@suse.com>
 <09fc4c14-07e8-4e59-a23e-bb295125f25a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <09fc4c14-07e8-4e59-a23e-bb295125f25a@suse.com>

On Tue, Nov 28, 2023 at 11:35:46AM +0100, Jan Beulich wrote:
> Master bit 2 is treated specially: We force it set, but we don't expose
> the bit being set to the guest. While right now the read and write
> handling can easily use the fixed mask, the restore input checking that
> is about to be put in place wants to use the inverted mask to prove that
> no bits are unduly set. That will require master bit 2 to be set. Otoh
> the read path requires the bit to be clear (the bit can have either
> value for the use on the write path). Hence allow use sites control over
> that bit.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3: New, split from larger patch.
> ---
> I'm certainly open to naming suggestions for the new macro parameter.
> "mb2" can certainly be misleading as to Multiboot 2. Yet "master_bit_2"
> it too long for my taste, not the least because of the macro then
> needing to be split across lines.

Let's leave it as mb2, I think given the context it is difficult to
mislead this code as having anything to do with multiboot.

> 
> --- a/xen/arch/x86/hvm/vpic.c
> +++ b/xen/arch/x86/hvm/vpic.c
> @@ -41,7 +41,7 @@
>  #define vpic_lock(v)   spin_lock(__vpic_lock(v))
>  #define vpic_unlock(v) spin_unlock(__vpic_lock(v))
>  #define vpic_is_locked(v) spin_is_locked(__vpic_lock(v))
> -#define vpic_elcr_mask(v) ((v)->is_master ? 0xf8 : 0xde)
> +#define vpic_elcr_mask(v, mb2) ((v)->is_master ? 0xf8 | ((mb2) << 2) : 0xde)
>  
>  /* Return the highest priority found in mask. Return 8 if none. */
>  #define VPIC_PRIO_NONE 8
> @@ -387,7 +387,7 @@ static int cf_check vpic_intercept_elcr_
>          if ( dir == IOREQ_WRITE )
>          {
>              /* Some IRs are always edge trig. Slave IR is always level trig. */
> -            data = (*val >> shift) & vpic_elcr_mask(vpic);
> +            data = (*val >> shift) & vpic_elcr_mask(vpic, 1);

Not that it matters much, but I think you could use
vpic_elcr_mask(vpic, 0) to strictly keep the same behavior as
before?

>              if ( vpic->is_master )
>                  data |= 1 << 2;

Since the bit is forcefully set here anyway.

Regardless:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

