Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DB4881538
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 17:08:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696033.1086562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmyUL-0008S6-F1; Wed, 20 Mar 2024 16:08:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696033.1086562; Wed, 20 Mar 2024 16:08:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmyUL-0008Q0-CF; Wed, 20 Mar 2024 16:08:25 +0000
Received: by outflank-mailman (input) for mailman id 696033;
 Wed, 20 Mar 2024 16:08:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ljj4=K2=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmyUJ-0008PC-Sq
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 16:08:23 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 130dfcb0-e6d4-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 17:08:22 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4146d750dcdso354595e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 09:08:22 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c444700b0041469869d11sm2642895wmn.47.2024.03.20.09.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Mar 2024 09:08:21 -0700 (PDT)
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
X-Inumbo-ID: 130dfcb0-e6d4-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710950902; x=1711555702; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9ydCgfXZXN/lh3bnAqoOjUPtVfgXID7+JO/rNeRXEfg=;
        b=Sw4ojcy1fpnR3appZX3Z19qxDvh3YpQ+sMJa2+JbFqfN2sxaCDP3DbPRw51fAJZrOy
         4tXK2jFVZZ+/BjXdbyiFAEf6VoaYoG0gegCzlO4kYqRuRESqKiTkL+FER7jdaoUI0H4E
         vyVcTu0WjUfyvXFn7CW16ac+YgG2GskLdDZUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710950902; x=1711555702;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ydCgfXZXN/lh3bnAqoOjUPtVfgXID7+JO/rNeRXEfg=;
        b=drcRqaqKt5klx/nImeG4QI5sSMjKB3ecRnh+QAaluAPfIjLL0aDA9V+oKMY/cDPZQ6
         fY8AHETqK07E+PfyRGgA35M2KMWa5kVPxN3K1PeJoAjZMPrLYuH+i8Rk/gFNZb/WwXH5
         R/r9zBMpk4EGw4+T/bbDqdhZ50ljwVBbhgu7d8eCm+JwdJH5buy6x1p+hM0I48vk4vfP
         2ckARFUJkyy/GgNWI/UfivUI+rRDKpn0i8KqtQ0ZWXc5XvRbEz92jHoHIVvfYWfI/yxE
         aKsSz02B44Jkz+EzZCs7mYCkNRVbkNGWvPfOw2L4hsq0NXp888xgHTa7t+K1N0MQYhpr
         FN9g==
X-Gm-Message-State: AOJu0YyfSuzgLcJloRw7VstD5BsaXm/7zJlqWihBL1ApXgs8OPp+6Jx5
	CZ8XJLg4Vg8bvGGAds/COc5jo58NWJnMPfmQXdIJc61htTF1rqo3aKixZ0m0XHw=
X-Google-Smtp-Source: AGHT+IGpwx+I3CN3YLrc7zIzvUFeBYMTuvVJc90Jx1S+kBKlIQ6qwlWc3728h4Co9hIdC9w8efqDCw==
X-Received: by 2002:a05:600c:4a96:b0:414:f4:c6c0 with SMTP id b22-20020a05600c4a9600b0041400f4c6c0mr82663wmp.20.1710950901790;
        Wed, 20 Mar 2024 09:08:21 -0700 (PDT)
Date: Wed, 20 Mar 2024 16:08:20 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: zithro / Cyril =?iso-8859-1?Q?R=E9bert?= <slack@rabbit.lu>
Cc: xen-devel@lists.xenproject.org,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] docs/man: add shutdown reasons to xl (list) man page
Message-ID: <c77ecb60-35c1-426d-bac5-f4892598c6b5@perard>
References: <0a2fcad111622431b8cd54c69adc3dedd24fb572.1709910923.git.slack@rabbit.lu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a2fcad111622431b8cd54c69adc3dedd24fb572.1709910923.git.slack@rabbit.lu>

On Fri, Mar 08, 2024 at 04:19:20PM +0100, zithro / Cyril Rébert wrote:
> Questions (unblocking):
>  - why a double space between all sentences ?

It's an English thing maybe?

Wikipedia has an article about it: https://en.wikipedia.org/wiki/Sentence_spacing
But actually, single space seems like it used to be a french thing, even
called "French spacing":
https://en.wikipedia.org/wiki/History_of_sentence_spacing#French_and_English_spacing

I guess it doesn't really matter. I don't really pay attention to it
anyway.

>  - how to get a "simple LF" ? Ie. I want to use <br>, not <p>
>    (a simple <Enter> has no effect, a double renders a <p>)

That doesn't look to be possible, unless you actually managed to write
the paragraph for all targeted formats, with things like =begin html...,
but that would probably make things more complicated that necessary.

> ---
> diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
> index bed8393473..d37227ba58 100644
> --- a/docs/man/xl.1.pod.in
> +++ b/docs/man/xl.1.pod.in
> @@ -370,12 +370,50 @@ scheduling by the Xen hypervisor.
>  The guest OS has shut down (SCHEDOP_shutdown has been called) but the
>  domain is not dying yet.
>  
> -=item B<c - crashed>
> +There are six shutdown reasons, which will be displayed after the "s" : B<-rscwS>.
> +
> +Note that some states will only be displayed if "on_poweroff=preserve" is set in
> +the config file, see L<xl.cfg(5)>).
> +
> +=over 4
> +
> +=over 4
> +
> +=item B<s- : poweroff>
> +
> +The domain exited normally, it will get destroyed.
> +
> +=item B<sr : reboot>
> +
> +The domain will reboot.

Well, that's not really true. I think to end up in this state, what
happen is that the domain shutdown and ask for a reboot. It's normally
the toolstack job to cleanup the domain then create a new domain for the
guest. I guess you might see this state if you have "on_reboot=preserve"
or you run `xl list` at the right time. Or the toolstack crashed and
fail to kill the domain before a reboot. So maybe a better to have
something like "The domain exited normally and ask for a reboot."

Same things for the other entries (poweroff and watchdog). The status is
just the current status of what is supposed to happen. But a few things
might mean that the domain stay in that state unless the admin does
something. This could be simply because there's "on_*=preserve" setting,
the toolstack crashed or we just happen to look while the toolstack is
cleaning thing up.

> +=item B<ss : suspend>
> +
> +The domain is suspended to disk or to RAM. If suspended to disk, the domain will
> +get destroyed.

I think in that state, the domain is just suspended, maybe to RAM? I
don't know if suspend to disk would end up in this state, my guess is
the domain will go to "poweroff" instead. But for suspend to "RAM", I
think the toolstack is supposed to save the guest memory and guest
config somewhere, maybe even on a different host for live migration?

This is a state that seems to happen as part of a live migration (or `xl
save` I guess).

I tried to suspend a guest (runnning `systemd suspend`), but xl never
reported `ss`, because there's nothing to do I guess. So this state is
probably really about migration.


Thanks,

-- 
Anthony PERARD

