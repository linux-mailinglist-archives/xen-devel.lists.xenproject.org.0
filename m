Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 666AEC5792C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 14:11:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161434.1489384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJX5f-0003nf-AC; Thu, 13 Nov 2025 13:10:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161434.1489384; Thu, 13 Nov 2025 13:10:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJX5f-0003lF-7O; Thu, 13 Nov 2025 13:10:19 +0000
Received: by outflank-mailman (input) for mailman id 1161434;
 Thu, 13 Nov 2025 13:10:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FQDN=5V=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1vJX5d-0003jc-Ee
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 13:10:17 +0000
Received: from mail-yx1-xb129.google.com (mail-yx1-xb129.google.com
 [2607:f8b0:4864:20::b129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 187e3b82-c092-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 14:10:16 +0100 (CET)
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-63f996d4e1aso670026d50.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 05:10:16 -0800 (PST)
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
X-Inumbo-ID: 187e3b82-c092-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763039415; x=1763644215; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=obJx62IfP7BeTMdQtx3/FzgK51b5Tv+WIIDSMr0cjvI=;
        b=V54BfwilvCDSYXkVL3JqQyvoE4NYxrmmrB6CJoU0V+WsMOAqpjXUD4C6fg5KAd6Agk
         9w7T2LPJfrYSX7fU77YzRdhlwp+gY/WzfDad7PnncQEw3NxiGoqSzcXIHkIBkZKoaGer
         +48tiefEFeCike8fMt64+dXeU8R4wkrtLMoLm3+bzK70BReKKct3dysEHp4P8z2GmeVg
         mT7684D+GOMtthha5McO69NEaXOtMLmo0y8n6iOfe6ZwrYFVh1fvpf7+K1jK50yQlWtM
         RQH5ak+tazmhhL2C2jddusYI4gOnREEMizpM2Hs2tjrz0gBUEjvMvKLbZOwO3Hi8WqUa
         MoXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763039415; x=1763644215;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obJx62IfP7BeTMdQtx3/FzgK51b5Tv+WIIDSMr0cjvI=;
        b=QMoKIziJLCDrWAKNvKAcCu2dlbDDjj8DLGvfhvg5TX7V/VAyTHnCcOFSraUAldzGWC
         gq8vMkAJqoPJJUu5hH/8sCW86e4eC8eNPONl9kvTt4SVLcH66DzcKzyAydnPiPqYC/S5
         asYCe95n43K/D3xbTk9efZj05DfvKkXjpGCE3rNMO/+lcg8gAhr9bJXdOJE0ONQlS8Lw
         An+AByQfzK8+7XY/gtaVK+8ENl/4GoQMOWsoQbyHVH6Qmo2d5nHZ18EyqfLI5AHz/VI8
         VAHQM18ARNUUSCtEvI+6oh5zpqyUL3SqgaauH/oM/EG+x5xTivdLMEpLPIh90MAnRyUC
         JNAg==
X-Forwarded-Encrypted: i=1; AJvYcCVL0RPFGiHWwsNHTPdxQ0PnfUEMvZYH3uyQGuwFW4PN4pI0SzXpLbnmbsmhKm3E4jJjWhQTLiL32Ow=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxwbIIxzQWIW3q88eYMImX0zlPtvescTdTW6gFCi+IemfcMKU/F
	S4XKiLVuYmyD3UCk7gCDmwGR1NLp0d8+tX/a6bk8GVdjIT67upWUMYuFssjeQVPZCksWfwYbZyS
	683l8iMubWsdj/A9SMpjKC04fW/z1cl4=
X-Gm-Gg: ASbGncvLB1JsUSwXKTwJvYs114oTFdakub6MIPN7SHoAUv+kwjQNvMKZGp62s7GjJbE
	iHrsuA4g6+Gdo4jSGerjY7PWOJRTzswlDVCHzMaHklzgFiveFX7PjpZqERf6LCYe7qh+Fb4fwIT
	/4ZKz5GSrhvnO6OY4X1jffsUp6RkRFgfZ0gkmUGBl3o2t9N1xVAQRtYz3Rw6IKrUlz29Rp1qJUU
	hLYLK/hqZvWcILnistFQe3Pe6gNqu20+hF0UB+s6jsJu+32ZCD4M8i65aJ0fdb8kgtNySo=
X-Google-Smtp-Source: AGHT+IHbeLEBZBC03vDuB7x3PJJVykPOcSNqSFqo76NBRAbbh7Tz/Aqmd/xkS2x6V96rzjvQjt+fow9vpXkzYlkDsaI=
X-Received: by 2002:a05:690e:4289:10b0:63f:c816:1169 with SMTP id
 956f58d0204a3-64101b97119mr4708382d50.48.1763039415118; Thu, 13 Nov 2025
 05:10:15 -0800 (PST)
MIME-Version: 1.0
References: <20251113124945.25343-1-frediano.ziglio@citrix.com> <70c36cf7-de4e-418a-921c-fe1268178194@suse.com>
In-Reply-To: <70c36cf7-de4e-418a-921c-fe1268178194@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Thu, 13 Nov 2025 13:10:03 +0000
X-Gm-Features: AWmQ_bm2ILB04Ba4wUr-LnhI4hs2BHL48RXgBs6gsX6LTLz8s7Z6S3Divsm38dM
Message-ID: <CAHt6W4fjxoGF1rNMhQ2M2_uOEgAyBtNvDcmmbBF6U7qp-LZWOw@mail.gmail.com>
Subject: Re: [PATCH v7] xen: Strip xen.efi by default
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>, Frediano Ziglio <frediano.ziglio@cloud.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Demi Marie Obenour <demiobenour@gmail.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Stewart Hildebrand <stewart.hildebrand@amd.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 Nov 2025 at 13:02, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 13.11.2025 13:49, Frediano Ziglio wrote:
> > --- a/CHANGELOG.md
> > +++ b/CHANGELOG.md
> > @@ -65,6 +65,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
> >        for hypervisor mode.
> >
> >  ### Removed
> > + - The install-time environment variable INSTALL_EFI_STRIP is no longer
> > +   supported, xen.efi will is now always being stripped.
> > +
> >   - On x86:
> >     - GNTTABOP_cache_flush: it's unused on x86 and the implementation is
> >       broken.
>
> That's the wrong "Removed" section, though. Moving it where you put it would
> be part of backporting (to 4.21) effort.
>

I think there was discussion that should go to 4.21 as not stripping
cause issues with some firmware.
Should I move to 4.22 then ?

> Plus it should go under "On x86".
>
> Jan

Frediano

