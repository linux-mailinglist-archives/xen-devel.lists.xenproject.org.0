Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BEEA733F7
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 15:11:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929362.1331961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txnwY-0007ti-BD; Thu, 27 Mar 2025 14:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929362.1331961; Thu, 27 Mar 2025 14:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txnwY-0007rZ-7w; Thu, 27 Mar 2025 14:10:50 +0000
Received: by outflank-mailman (input) for mailman id 929362;
 Thu, 27 Mar 2025 14:10:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U7fn=WO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1txnwW-0007ol-QT
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 14:10:48 +0000
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44d3cd2c-0b15-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 15:10:43 +0100 (CET)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-224341bbc1dso20390125ad.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 07:10:43 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-227811baee4sm128569205ad.135.2025.03.27.07.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 07:10:41 -0700 (PDT)
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
X-Inumbo-ID: 44d3cd2c-0b15-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743084642; x=1743689442; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kna6NpNYhHAE80qBFFYmhMkxDEz1n1jiZLGwsZQqAyI=;
        b=eONbUBDh1i8ZwCiA4+OXLEjV/y4kMR7ZrC/xvQ3bfTOIVGCRFHgdMA32rVQpojz5JW
         aTgi/HETHtiilH/VwjkYusDxYxGvCUxh7APtifJ/WDxHUrcPrvhicZ0uOV0Z8HQ6uzJo
         7ceUz4xYli7OKOFLb1+XFv2iRwD3b/ictmPvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743084642; x=1743689442;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kna6NpNYhHAE80qBFFYmhMkxDEz1n1jiZLGwsZQqAyI=;
        b=httWgTdSFaO8F9TeGBKrS4VjxN0r1X4vPy4jixsK4veH3wimv9uc8v1cRH6Q306z/i
         AND8p47UGc6ZC1X1eZwSE2DSqpmLaX0qfclpSL7qFYA3+uxUmqTZdqmtfuMcqWhv61v6
         9TBIsfx8EiWy/bzl0fb2tTG/QM4wA/XZBhQuMqZeC8AEJ1Ata2aVDQO7j5g5FD4kYsJ+
         2Nd4yR7l8RtloHK+4j4zeH8g4vPxbwhwANhLDSLxYCHobmcha2wXFkiUx7mk3FIOORq7
         6GRgtJII+ITDptbhZxAe2zgC9bzTzL1NnQKFw50lbEEHDNbF+gnsYlqbo0Fqev4FFC+S
         is1A==
X-Gm-Message-State: AOJu0YwpBNwUDzbHaaTZBrqoAxKRr6sbsEWMr3nt1xp/0rM5J3yU16nI
	YRWGr3WqweFBdX/59DdTQDY7RxdTuz3feZGmxEvXUqbbtiaQrcM3rF4LEmlXI2c=
X-Gm-Gg: ASbGncve/FIuenZyeX1yQJhTRGYh1sZFR4jRYqzs4DWGiu57WRmPVSUNUJ7qJVWdhh+
	+j5nTLGfW0tbZUHJccthdQKOFnu4J/nU449P2Ng2tP6N7GUvnYmLuJgNOWWAbe+xVmSkyt+i4HV
	Ayxtx11hPQE7fev4rqyPCJK8vw9CDWd1VWyg7XRtkf7x1mxSzWhh4umVFzsRzsh4aHplq2BGSUK
	q4JxCVpgf1nddRBbl4E3lSR1YNkBJd7/kzLl1x4TlcG4Fuw8A/dVxSwGOYJFluKKj8faTqIzcqp
	qMIQlkXtiwiFEvvdLeK/IfTtjolMGalBT7gX24hiRiLRd6SJlA==
X-Google-Smtp-Source: AGHT+IH9cyMRm8Qn3wkSfGra2PhKLEGWpAcqgDGNZkJwyKctVBisRUB4BVhZyZI2QpeoS/7Uvuajjw==
X-Received: by 2002:a17:903:8c6:b0:223:50f0:b97 with SMTP id d9443c01a7336-228049a2035mr51317105ad.52.1743084641763;
        Thu, 27 Mar 2025 07:10:41 -0700 (PDT)
Date: Thu, 27 Mar 2025 15:10:36 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] x86/MTRR: hook mtrr_bp_restore() back up
Message-ID: <Z-VcXGhlObVZYhoc@macbook.local>
References: <ad8ea1da-dda9-4567-8b15-55b65777e80f@suse.com>
 <Z-U4ozL6p-Unh5Y8@macbook.local>
 <fde64904-343b-48c9-b396-961811cc2adb@suse.com>
 <Z-VJBIbQal-jZAGM@macbook.local>
 <f5669417-43f3-4c63-bb7d-a108f13757cb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f5669417-43f3-4c63-bb7d-a108f13757cb@suse.com>

On Thu, Mar 27, 2025 at 02:28:42PM +0100, Jan Beulich wrote:
> On 27.03.2025 13:48, Roger Pau Monné wrote:
> > On Thu, Mar 27, 2025 at 01:30:44PM +0100, Jan Beulich wrote:
> >> On 27.03.2025 12:38, Roger Pau Monné wrote:
> >>> On Thu, Mar 27, 2025 at 12:20:47PM +0100, Jan Beulich wrote:
> >>>> Unlike stated in the offending commit's description,
> >>>> load_system_tables() wasn't the only thing left to retain from the
> >>>> earlier restore_rest_processor_state().
> >>>>
> >>>> While there also do Misra-related tidying for the function itself: The
> >>>> function being used from assembly only means it doesn't need to have a
> >>>> declaration, but wants to be asmlinkage.
> >>>
> >>> I wonder, maybe the intention was for the MTRR restoring on the BSP to
> >>> also be done by the mtrr_aps_sync_end() call in enter_state()?
> >>>
> >>> AFAICT that will set the MTRRs uniformly on all CPUs, by calling
> >>> mtrr_set_all() just like mtrr_bp_restore(), but later in the restore
> >>> process.
> >>
> >> Hmm, yes, that's possible. The comment in set_mtrr() is somewhat misleading
> >> then, though, as for the BP the writing then isn't just "okay" but necessary.
> >> Question is whether doing this so much later is actually good enough.
> > 
> > Hm, no idea really.  We do the device restore ahead of the MTRR
> > restore, so I wonder whether we could have issues by using unexpected
> > effective cache attributes for device memory accesses as a result of
> > MTRRs not being initialized?
> 
> That's just one of the possible problems. The father the MTRRs we run with
> diverged from what firmware puts in place, the bigger the possible trouble.
> I think the restoring better is done as being switched to here again. The
> absence of any discussion of MTRRs in that earlier change leaves me pretty
> certain that the behavioral change there wasn't intended. Andrew is usually
> pretty good at spelling out all intended effects.

No objection, however for the BSP we now end up restoring the MTRRs
twice, as we will also do it in mtrr_aps_sync_end().

Might be worth to mention in the commit message that the MTRR state
was restored in mtrr_aps_sync_end() for the BSP also, but that it
might be too late.

Possibly with that somehow noted in the commit message:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

