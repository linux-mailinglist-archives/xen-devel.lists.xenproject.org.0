Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 105C2A2784D
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 18:26:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881740.1291902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfMg4-0004VV-2I; Tue, 04 Feb 2025 17:25:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881740.1291902; Tue, 04 Feb 2025 17:25:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfMg3-0004SX-VX; Tue, 04 Feb 2025 17:25:35 +0000
Received: by outflank-mailman (input) for mailman id 881740;
 Tue, 04 Feb 2025 17:25:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PXrc=U3=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tfMg2-0004SR-Mr
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 17:25:34 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 085bbc9e-e31d-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 18:25:30 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4361f664af5so67871435e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 09:25:30 -0800 (PST)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38daf27bbf5sm1745801f8f.48.2025.02.04.09.25.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 09:25:29 -0800 (PST)
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
X-Inumbo-ID: 085bbc9e-e31d-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1738689930; x=1739294730; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FACHzZ+7ERW2OI0Vnn3xMSHI1XSFBkIbaVvkpgGB61s=;
        b=VJvnlDdg1t1gR0SBgmHXEc2s9vV//aGRZ8sZBff02tlwl7MMisAu9VW7yulrpMCPB7
         w/pme9oKKKlH57lsnik4uKxfnnZqd/unnU+kjVHSQsLgLsfSEYj17ervGvtK44s00wCV
         IbSty0R1qiEcFAy3mcXYi/cGykwjm0GO5C27Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738689930; x=1739294730;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FACHzZ+7ERW2OI0Vnn3xMSHI1XSFBkIbaVvkpgGB61s=;
        b=JGmsKQaYVlPLPE9sZncozKWffDWYfzjE/tzsaqI0pnpgN8E0hOjMU1hHblWvXpul5I
         yhLCrrewg9246FS5BB7hRazp/GHq1RDrukokkkCxChhJS7P/YU1K4pWcI5gLnEwkopfj
         O4AU22PZhBR8GCeD3t1jYn2sO5R+qtS2HkT2HYlRFdYb0KtQZRT52FgM3UVC0wPsLzIY
         Jppz2ZFmb8R7etiGlutqqNSbSAhCezWfmH3NiznZuK3w7DXz1ktWAvLQ92QsqwB9HhJX
         bYEW7/LMqBwAqmpasA3rh5IJIRFUGao9JzdSWNhQCcmve1fpkrl4p/qJjCwlf3pVJrix
         9vAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHqPxPczql6FSsubiIdCQg422rKU9wtyDej3R0v1WlrW8nSb6jsEuUrqMEnq67JmhONN86PyI+Iw8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGiFykX0SKrrp1BRKdIl10YleEJ1ZvVPlIhH4rJhU406RjgK52
	65yocgKnJb3oXc1GCWpkD9HYaSnCgMTuQcOOjmhJcDYgJ2e2u/zQK/fNRoWXEpM=
X-Gm-Gg: ASbGncv9KGNJHqBeVy8ufYieMd8eW6bymyk0NfzGAe4exJvCgtDHHHSQYCr/Fnc2uGn
	QKVM1Yt+geWg9TRRuzgs+IrZYzL39D/Ux3r2J8IghS/ve3mCqhmo+0cvpE3a22RIlOev49Ft4xz
	sioR7a49yQf/TOP3KAYQGRaBeBmsdezKNtZeeODAsnXJLcw/eCu+YI9mxNqcJ7xwbOQ+DE6wku+
	fj862AqxbSyKdfiFUQspZWAIJJ2eVcY8SyxvJe8INEStF4VzghRR/n5X1uD5EVWm1MMqmzBui73
	tOphcH10juyhI6n3wgoShufVeP4+9TBncZLQmAKieP1fhA==
X-Google-Smtp-Source: AGHT+IGraL4cXP9jRJUM9BiU+iOZMf9GmMCgAwQ1ypY3A4e/LiuG5wiiim4NLlzKXCx3C/0C4ilucQ==
X-Received: by 2002:a05:600c:1d1e:b0:434:a5d1:9905 with SMTP id 5b1f17b1804b1-438dc42238dmr197620295e9.26.1738689929815;
        Tue, 04 Feb 2025 09:25:29 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Feb 2025 17:25:28 +0000
Message-Id: <D7JU528VWICI.3FVRRY1LXY363@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Anthony PERARD"
 <anthony.perard@vates.tech>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 2/2] tools/hvmloader: Replace LAPIC_ID() with
 cpu_to_apicid[]
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20250204144542.7399-1-alejandro.vallejo@cloud.com>
 <20250204144542.7399-3-alejandro.vallejo@cloud.com>
 <84c8d20e-b9f1-4593-b5df-86cc00ff33b5@suse.com>
 <D7JRLGZ0KL4Z.39AQU6NC6D0Y2@cloud.com>
 <c179a661-d705-41da-988a-ff361ceaa1f9@suse.com>
In-Reply-To: <c179a661-d705-41da-988a-ff361ceaa1f9@suse.com>

On Tue Feb 4, 2025 at 3:46 PM GMT, Jan Beulich wrote:
> On 04.02.2025 16:25, Alejandro Vallejo wrote:
> > On Tue Feb 4, 2025 at 3:07 PM GMT, Jan Beulich wrote:
> >> On 04.02.2025 15:45, Alejandro Vallejo wrote:
> >>> --- a/tools/firmware/hvmloader/config.h
> >>> +++ b/tools/firmware/hvmloader/config.h
> >>> @@ -48,8 +48,9 @@ extern uint8_t ioapic_version;
> >>> =20
> >>>  #define IOAPIC_ID           0x01
> >>> =20
> >>> +extern uint32_t *cpu_to_apicid;
> >>
> >> Strictly speaking this ought to be part of the earlier patch. If hvmlo=
ader
> >> was Misra-checked, this would be a (transient) violation.
> >=20
> > Hmmm. I don't see it. The previous patch is fully contained in smp.c an=
d this
> > extern isn't required until now. Does MISRA have mandates on non-static=
 symbols
> > not present in headers?
>
> Every non-static definition is expected to have exactly one earlier
> declaration.
>
> Jan

I had no idea. Fair enough then, I'll adjust...

Cheers,
Alejandro

