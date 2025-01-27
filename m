Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9422A1D9B7
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 16:42:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878035.1288205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcRFg-0007u1-Cp; Mon, 27 Jan 2025 15:42:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878035.1288205; Mon, 27 Jan 2025 15:42:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcRFg-0007rE-9w; Mon, 27 Jan 2025 15:42:16 +0000
Received: by outflank-mailman (input) for mailman id 878035;
 Mon, 27 Jan 2025 15:42:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fFPb=UT=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tcRFf-0007r8-73
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 15:42:15 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47a5f12b-dcc5-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 16:42:14 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-438a3216fc2so47604975e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 07:42:14 -0800 (PST)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd4d29cesm138447475e9.35.2025.01.27.07.42.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 07:42:13 -0800 (PST)
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
X-Inumbo-ID: 47a5f12b-dcc5-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1737992533; x=1738597333; darn=lists.xenproject.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gSkl1wl1YC4U0b4FAYXFX54TDNI/uy0DhxmaQ2DSBNk=;
        b=i7yyZsY7ARrukaenQejy4E3e3NTIYjh4bfgbNYJvmfvY60qSF2UnHc+D04xpc8gLN5
         wTh96pRqpJwLvCH0YEAaeHLxztSWqXg5jFH578RwSXLubQUIxbi+B/euwECqj7S1WJBL
         LkZMutF18tPvh0M3LcF+L6OBhTClv3nhHoQRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737992533; x=1738597333;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gSkl1wl1YC4U0b4FAYXFX54TDNI/uy0DhxmaQ2DSBNk=;
        b=PHTO+N4pIrnJbVDWqniT/a4egoFdSlaqXL8hu60naIlj2KJ9fpF5muEp4GuRnMqUhN
         40tPDExSLOZ6oZmPVXcm0Q796nElyGIhJ3VN4hKFSfEqIulPNGPyF1I34seG34QQ1/M3
         aWooKgTrI3w07Aiz9YFP5EXXBG3qOaEFayvyOODQOjMYPMNL27sKs9g3KDo2wExpoNPw
         GO0OBo0OSJcNANTKGoUGiLscYyW64EIO5IkQ4SZ+ePMogMrfJeh/WEOkPIh0sZ/KCl11
         DYwKhuTXMqVqyJnKEfJWGdsMDCwLsZP4/4TUynFPcHRwhlcIcCc8RzcsMxiaTNYXBMdH
         MDVg==
X-Forwarded-Encrypted: i=1; AJvYcCWxXSbvqYa3xNjKo2X1Pik51vfNx/b/eUvxZEnxTmwDBhRlKrsSafAHuOenSAVCHV2P79S12fwA/UM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzjZUmt9Ta7C9S9sALWBCatSju2JdBr+viG3lrs968otmHmuZvo
	UKMnmXsULQ1wDFt+wfWQedwhtcqWxc1THETITswG86+6jCKr3yNLl5H9BnOjGDc=
X-Gm-Gg: ASbGnctCMmxAYnu6RMxbOy1h6lSTBV158Lfcacub1ni4/53fywwzCi0utXeieJX5DP7
	sHHU3CHthdnOmfWa2GSV31l/DuDPX6QnQhSwAkelqmpqdifusCsiRI5qPqVFNoCttW940eK+mhG
	g14Zu0POrbCmA7VIUG/lOagqureVS9CqiBeGk2zwYaCj2xEK8VhcioaODF/GW87D7x38EI9vO54
	vvlfkrWt3rHWD/PE3cavGkAP2UHwSoEpl+t+zJATlOxyXsmOD0lgE1cenLAq+oARAjiVIUsFzhi
	HbbzA0J+3T40uedSlXR6V1ayhvTQsNjBQEE=
X-Google-Smtp-Source: AGHT+IHNLljYHE20Xfl5207+xztZS+SWYcBTVHHouHQ63+TB8V9W/RCROcw8vYT56EwbfQ0UvW+PPA==
X-Received: by 2002:a05:600c:34c9:b0:436:f975:29d with SMTP id 5b1f17b1804b1-438913bffd9mr376568835e9.6.1737992533584;
        Mon, 27 Jan 2025 07:42:13 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jan 2025 15:42:09 +0000
Message-Id: <D7CYXLM3PCGY.2DYKXZEIQH1Y2@cloud.com>
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 08/12] x86/emulator: Refactor FXSAVE_AREA to use
 wrappers
X-Mailer: aerc 0.18.2
References: <20250110132823.24348-1-alejandro.vallejo@cloud.com>
 <20250110132823.24348-9-alejandro.vallejo@cloud.com>
 <bc5185ca-9001-4699-82d0-88e629ae6503@suse.com>
In-Reply-To: <bc5185ca-9001-4699-82d0-88e629ae6503@suse.com>

On Mon Jan 27, 2025 at 10:52 AM GMT, Jan Beulich wrote:
> On 10.01.2025 14:28, Alejandro Vallejo wrote:
> > Adds an UNMAP primitive to make use of vcpu_unmap_xsave_area() when
> > linked into xen. unmap is a no-op during tests.
> >=20
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks,

> despite ...
>
> > --- a/xen/arch/x86/x86_emulate/blk.c
> > +++ b/xen/arch/x86/x86_emulate/blk.c
> > @@ -11,9 +11,12 @@
> >      !defined(X86EMUL_NO_SIMD)
> >  # ifdef __XEN__
> >  #  include <asm/xstate.h>
> > -#  define FXSAVE_AREA ((void *)&current->arch.xsave_area->fpu_sse)
> > +/* Has a fastpath for `current`, so there's no actual map */
> > +#  define FXSAVE_AREA ((void *)VCPU_MAP_XSAVE_AREA(current))
> > +#  define UNMAP_FXSAVE_AREA(x) VCPU_UNMAP_XSAVE_AREA(current, x)
>
> ... the comment here kind of suggesting that ...
>
> >  # else
> >  #  define FXSAVE_AREA get_fpu_save_area()
> > +#  define UNMAP_FXSAVE_AREA(x) ((void)(x))
>
> ... use of this new construct is solely decoration, and could hence as
> well be omitted.
>
> Jan

It seems like a dangerous proposition to abuse knowledge of an implementati=
on
in order to skip parts of its interface. The fact that no such map is requi=
red
at this point in x86_emulate does not mean it never will be. Predicting the
future is hard, but being consistent today is less so (imo).

Cheers,
Alejandro

