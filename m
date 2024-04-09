Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ADF89D6C9
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 12:21:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702217.1097104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru8ax-00064O-Vi; Tue, 09 Apr 2024 10:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702217.1097104; Tue, 09 Apr 2024 10:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru8ax-000616-SK; Tue, 09 Apr 2024 10:20:51 +0000
Received: by outflank-mailman (input) for mailman id 702217;
 Tue, 09 Apr 2024 10:20:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mUTu=LO=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ru8aw-000610-R7
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 10:20:50 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4bddec7-f65a-11ee-94a3-07e782e9044d;
 Tue, 09 Apr 2024 12:20:48 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-516d0161e13so6017917e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2024 03:20:47 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 be9-20020a05600c1e8900b004163ee3922csm11976111wmb.38.2024.04.09.03.20.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 03:20:46 -0700 (PDT)
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
X-Inumbo-ID: d4bddec7-f65a-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712658047; x=1713262847; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6vi3mXNPAtFhRZ7VRL4VAPHciBEA8X0AtAtcbaG6HHM=;
        b=Waj41uBvwjm31l5t1pfvLEbduq9fXJMGlf29UTZbnwHSP5kwOQKWNCa6Ua2j2rZEsm
         oB5+u8k5Cybn6P6sNYZ3dpUdGyjj55B6G53yGUkov2HYDGkbKVvjR1x+Zp3VoYSkk+JM
         LVx+sAC8vJdKPu9rf5yXguuuEHZ/PO+aiW3WE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712658047; x=1713262847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vi3mXNPAtFhRZ7VRL4VAPHciBEA8X0AtAtcbaG6HHM=;
        b=lXh4iPJc3bPkuSf4PGCXPcbweWNBRtfI2dVIMn5myzXvL/P2nYIsF8IF6JHcQqgq3r
         DVVzDc1yIYacHoh/PwgfHtvpKlmq7pwn/c9tP+AGbWcmppYk9wi99biJtblxTwwhP2Ra
         31kkJjOJYCdvyb26OfIKhQZt6+XQ0OZ9NKUtE1J6r43KkOP+uRRqB0WYlM9h7Ge3Gwbq
         Kk3oZ6gWSITalIC+wbe8JyNkAoHIwqYwKJdd9Tr25grwubwaAjr2QFWB/jYianJ1c6ny
         zvPLOm9Ek2tFXXTdXpm0yGm2XjOCMdwHf+SQJXjpxfyfomAnQwfWO7NUUFKDxci0IS0q
         Up3w==
X-Forwarded-Encrypted: i=1; AJvYcCX3YQKpnZhOEPfr8Oep+nE5pa0A9xD+CGmStSnqaTDX4yFABfOxp1PKCPA4QEN0pLW+Ente7OHmmFpNzwWrAZR0KjahIm9rR8LRivOs8RE=
X-Gm-Message-State: AOJu0YzR4Je3Tu9RG3XSuIaL8dl4+Ab/DvAtSiPdt4alanVYX9h0gySq
	2VT3sCmKDvF4pMeOz2NhSRhN7qmszXZmqgQMAztmZbo2gx3JJ1iZRXr19s68bQNAIKj3eo/Ze58
	D
X-Google-Smtp-Source: AGHT+IHaIpT9eyePhKlcsD5qHDIV8IJtmm5ucgNemPRD1+yysRCR0QTSHPLYSNTgt9iOxBdqVBzHAg==
X-Received: by 2002:ac2:48a4:0:b0:513:c95c:4dc4 with SMTP id u4-20020ac248a4000000b00513c95c4dc4mr7701691lfg.7.1712658046987;
        Tue, 09 Apr 2024 03:20:46 -0700 (PDT)
Date: Tue, 9 Apr 2024 11:20:45 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
	qemu-devel@nongnu.org
Subject: Re: [PATCH] xen-hvm: Avoid livelock while handling buffered ioreqs
Message-ID: <90f07634-1600-4654-8e36-7ac9e2f457e8@perard>
References: <20240404140833.1557953-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404140833.1557953-1-ross.lagerwall@citrix.com>

On Thu, Apr 04, 2024 at 03:08:33PM +0100, Ross Lagerwall wrote:
> diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
> index 1627da739822..1116b3978938 100644
> --- a/hw/xen/xen-hvm-common.c
> +++ b/hw/xen/xen-hvm-common.c
> @@ -521,22 +521,30 @@ static bool handle_buffered_iopage(XenIOState *state)
[...]
>  
>  static void handle_buffered_io(void *opaque)
>  {
> +    unsigned int handled;
>      XenIOState *state = opaque;
>  
> -    if (handle_buffered_iopage(state)) {
> +    handled = handle_buffered_iopage(state);
> +    if (handled >= IOREQ_BUFFER_SLOT_NUM) {
> +        /* We handled a full page of ioreqs. Schedule a timer to continue
> +         * processing while giving other stuff a chance to run.
> +         */

./scripts/checkpatch.pl report a style issue here:
    WARNING: Block comments use a leading /* on a separate line

I can try to remember to fix that on commit.

>          timer_mod(state->buffered_io_timer,
> -                BUFFER_IO_MAX_DELAY + qemu_clock_get_ms(QEMU_CLOCK_REALTIME));
> -    } else {
> +                qemu_clock_get_ms(QEMU_CLOCK_REALTIME));
> +    } else if (handled == 0) {

Just curious, why did you check for `handled == 0` here instead of
`handled != 0`? That would have avoided to invert the last 2 cases, and
the patch would just have introduce a new case without changing the
order of the existing ones. But not that important I guess.

>          timer_del(state->buffered_io_timer);
>          qemu_xen_evtchn_unmask(state->xce_handle, state->bufioreq_local_port);
> +    } else {
> +        timer_mod(state->buffered_io_timer,
> +                BUFFER_IO_MAX_DELAY + qemu_clock_get_ms(QEMU_CLOCK_REALTIME));
>      }
>  }

Cheers,

-- 
Anthony PERARD

