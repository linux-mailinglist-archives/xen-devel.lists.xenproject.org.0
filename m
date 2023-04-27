Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A936B6F0799
	for <lists+xen-devel@lfdr.de>; Thu, 27 Apr 2023 16:37:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527023.819170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps2kJ-0004E8-7Z; Thu, 27 Apr 2023 14:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527023.819170; Thu, 27 Apr 2023 14:37:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps2kJ-0004Bs-4x; Thu, 27 Apr 2023 14:37:19 +0000
Received: by outflank-mailman (input) for mailman id 527023;
 Thu, 27 Apr 2023 14:37:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S+EI=AS=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1ps2kI-0004Bm-9e
 for xen-devel@lists.xenproject.org; Thu, 27 Apr 2023 14:37:18 +0000
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0143814f-e509-11ed-8611-37d641c3527e;
 Thu, 27 Apr 2023 16:37:15 +0200 (CEST)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-3f19afc4fbfso64894705e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Apr 2023 07:37:15 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 d13-20020adfe88d000000b002e55cc69169sm18680949wrm.38.2023.04.27.07.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 07:37:14 -0700 (PDT)
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
X-Inumbo-ID: 0143814f-e509-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1682606235; x=1685198235;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=11U62xqVI6IElR8Ictp5N7XNuJZduJKfVtizCWTyVfc=;
        b=FPPKXnIeJu2yC0JRFeg0dREaPEiLu2M7PE0Q/MZ4kuQGfS53w+51cRn46k3klaKKv0
         BmvCrY1EV7do4eCcZ9T55DsSFfbbNYM2mGRai01k5ncvBVlZAbzSJP3FFMgs4qjXpjT3
         6eHpWpjYatpFIhea06FlzmxI317ytaPCFRVxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682606235; x=1685198235;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11U62xqVI6IElR8Ictp5N7XNuJZduJKfVtizCWTyVfc=;
        b=Tct2Ny2ximUmWSdvf3TvRXWvcee66X/IP259Ur9vXAoWkz14/qNyHB+zVh/teGcoRv
         BXRR01pAAKfyjLZ/1Fatr8XL9+N7Ho5AeqKiKIH3S4h8oAiZdj+LSV+95qJ/4UG+Jso/
         L35E90EDqOiO4wnuxLrkhR4qSO9Q2wWg81OVHlw900DRjltvmr+vWqcKI5XOUaD4pNOC
         dr2cQRZ4t+9lduOtlHpTHEuTmH+4lOr2Qyn0H+HQFjWZbIrO63AGVd+SLeSnt104QhOK
         uaHjr6d6jGtestWa6ELZWPPhRos3R70c89xkGCs6OQQSZI6OWUONQTH8nv9N8dqnB4jL
         uOYQ==
X-Gm-Message-State: AC+VfDx9OsG3EMSwCJFXIRU6WegU+UqUfby5idlW5jBXKkM+ISSp80RO
	P8EeOMHPC6uwKt5xzbc8/o9fSA==
X-Google-Smtp-Source: ACHHUZ4mkurR1ZW8hSg4SdtK0W/DqU/twQXbajkV8cxWGlmhNURM+6406XK5JibdB0cXwCrrNl7PGQ==
X-Received: by 2002:a05:600c:213:b0:3f1:8223:6683 with SMTP id 19-20020a05600c021300b003f182236683mr1623512wmi.40.1682606235314;
        Thu, 27 Apr 2023 07:37:15 -0700 (PDT)
Message-ID: <644a889a.df0a0220.9062c.d2f3@mx.google.com>
X-Google-Original-Message-ID: <ZEqImKg1iMJBBRAm@EMEAENGAAD19049.>
Date: Thu, 27 Apr 2023 15:37:12 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/7] tools: Make some callers of xc_domain_getinfo use
 xc_domain_getinfolist
References: <20230426145932.3340-1-alejandro.vallejo@cloud.com>
 <20230426145932.3340-2-alejandro.vallejo@cloud.com>
 <d93a5eaa-1f6f-a2b9-b238-04b8bb1a33dc@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d93a5eaa-1f6f-a2b9-b238-04b8bb1a33dc@citrix.com>

Answers inlined

On Thu, Apr 27, 2023 at 10:51:03AM +0100, Andrew Cooper wrote:
> Just as a note for the subject, we more commonly write function names
> with ()'s.

No harm in abiding by that. Done on v2.

> > +            "crashed",         (info[i].flags & XEN_DOMINF_shutdown) &&
> > +                                 (dominfo_shutdown_reason(&info[i]) == SHUTDOWN_crash),
> 
> Isn't this your dominfo_shutdown_with() from patch 6 ?
> 
> I'd pull that forward to this patch too, and use it here.

It is indeed. Done locally on v2.

Cheers,
Alejandro

