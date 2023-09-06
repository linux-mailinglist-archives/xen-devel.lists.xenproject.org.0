Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B57793CDF
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 14:40:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596588.930519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdrpk-0007U3-BL; Wed, 06 Sep 2023 12:40:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596588.930519; Wed, 06 Sep 2023 12:40:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdrpk-0007Q7-8M; Wed, 06 Sep 2023 12:40:36 +0000
Received: by outflank-mailman (input) for mailman id 596588;
 Wed, 06 Sep 2023 12:40:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z0AC=EW=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qdrpi-0007Pz-Uy
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 12:40:34 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 920cf11f-4cb2-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 14:40:34 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-401187f8071so6187325e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Sep 2023 05:40:33 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 u2-20020a05600c00c200b003fe3674bb39sm19700068wmm.2.2023.09.06.05.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 05:40:32 -0700 (PDT)
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
X-Inumbo-ID: 920cf11f-4cb2-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694004033; x=1694608833; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nYq+qJETNyES0U40k6CFMLfJigzIC0iAMdfnPipQtPk=;
        b=tZ1BzEdCvV8YbBjaPdNfdhkM39HH7eYL0BO9zBaJdr0K1LNlYWRRlJOBqlELgL9JOz
         Kje3tiQ8vwSsVqPAjdVkaPxJzWwn30PJHEYRcRYAWV2zVPnHLj/UwklLcw7mH11548CE
         NhVXYSRWqe7CHjA4SS9XZ9J5d5DNobZVeyy3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694004033; x=1694608833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYq+qJETNyES0U40k6CFMLfJigzIC0iAMdfnPipQtPk=;
        b=EQzvNJTRjhbgiPr7T2heMjraX2g0j+iq3lXwN5rcSU0SbmAupPzW8z79wJ8YjLrqov
         FwtTNhWTXZH9HWwHOlpRjYw+Okh8ZzBZNE1L1mdDyq9HK2vnEajAsz1Nz+hsLkrqI8b1
         UF/SS1rrlAeGnFEHX4fL8yUG1O0rf0VlBF311jXztrdh2IQrkickE6q7SRmk6hAdP8pl
         TAXa0oJbJ8OQNj8gjVHrpnppKdvTHrRGrdxlo2gpzgLH35ceq7rXdsLR93oUSBgp/Rta
         AGSPUBRUAnATnESqlrO6Sogt+K4Q4opA4dtRFdZ6BgpadI5N1Voe9zCR4aB9C0mVs9cf
         eH0w==
X-Gm-Message-State: AOJu0YztV3U3EEkWXJFXbw/NS5v0coGcfd/9T8oEl/Q+tAagaI/lBoti
	W1MiJDkHxPhJOo2CSvUMtCojDA==
X-Google-Smtp-Source: AGHT+IHyhYm1dpH1PcunCsTl2K09gsPxeml81nH9rP20JQ9WLzayVNBT3R31YF7c8g2SrK01Cc/8ww==
X-Received: by 2002:a05:600c:24d3:b0:401:b307:7ba8 with SMTP id 19-20020a05600c24d300b00401b3077ba8mr2518935wmu.13.1694004032974;
        Wed, 06 Sep 2023 05:40:32 -0700 (PDT)
Date: Wed, 6 Sep 2023 13:40:31 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] MAINTAINERS: consolidate vm-event/monitor entry
Message-ID: <09a93c71-28ed-4593-b8b4-fbb4d2a240f7@perard>
References: <e3ccc381-1fd5-b99c-e37e-5870af401dd0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3ccc381-1fd5-b99c-e37e-5870af401dd0@suse.com>

On Thu, Aug 31, 2023 at 08:15:13AM +0200, Jan Beulich wrote:
> If the F: description is to be trusted, the two xen/arch/x86/hvm/
> lines were fully redundant with the earlier wildcard ones. Arch header
> files, otoh, were no longer covered by anything as of the move from
> include/asm-*/ to arch/*/include/asm/. Further also generalize (by
> folding) the x86- and Arm-specific mem_access.c entries.
> 
> Finally, again assuming the F: description can be trusted, there's no
> point listing arch/, common/, and include/ entries separately. Fold
> them all.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> -F:	xen/arch/*/monitor.c
> -F:	xen/arch/*/vm_event.c
> -F:	xen/arch/arm/mem_access.c
> -F:	xen/arch/x86/include/asm/hvm/monitor.h
> -F:	xen/arch/x86/include/asm/hvm/vm_event.h
> -F:	xen/arch/x86/mm/mem_access.c
> -F:	xen/arch/x86/hvm/monitor.c
> -F:	xen/arch/x86/hvm/vm_event.c
> -F:	xen/common/mem_access.c
> -F:	xen/common/monitor.c
> -F:	xen/common/vm_event.c
> -F:	xen/include/*/mem_access.h
> -F:	xen/include/*/monitor.h
> -F:	xen/include/*/vm_event.h
> +F:	xen/*/mem_access.[ch]
> +F:	xen/*/monitor.[ch]
> +F:	xen/*/vm_event.[ch]


Hi,

Did you mean to for example change the maintainer ship of
"xen/arch/x86/mm/mem_access.c"? Before it was:
    - VM EVENT, MEM ACCESS and MONITOR
    - X86 MEMORY MANAGEMENT
    - X86 ARCHITECTURE
And now, it's just:
    - X86 MEMORY MANAGEMENT
    - X86 ARCHITECTURE

(see ./scripts/get_maintainer.pl --sections -f xen/arch/x86/mm/mem_access.c)

Also, now "xen/include/xen/monitor.h" is only "THE REST".

On the other hand, there's no change for "xen/common/monitor.c", so the
pattern works for this particular file.

Cheers,

-- 
Anthony PERARD

