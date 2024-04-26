Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD458B3355
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 10:52:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712571.1113345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0HJA-0003HR-Oc; Fri, 26 Apr 2024 08:51:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712571.1113345; Fri, 26 Apr 2024 08:51:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0HJA-0003El-LJ; Fri, 26 Apr 2024 08:51:52 +0000
Received: by outflank-mailman (input) for mailman id 712571;
 Fri, 26 Apr 2024 08:51:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J3OG=L7=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1s0HJ9-0003Ef-EF
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 08:51:51 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 381addf6-03aa-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 10:51:49 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-34b3374ae22so2058490f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 01:51:49 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 e4-20020adff344000000b0034349225fbcsm21777353wrp.114.2024.04.26.01.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 01:51:48 -0700 (PDT)
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
X-Inumbo-ID: 381addf6-03aa-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714121509; x=1714726309; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DEXw3qSlNpikX0UKTlTbjPlamz5F9HdGa3FFmvqrPG4=;
        b=AcBh+OPv03eMrnRbepLRyIYv8jStcFhqwfNggGC7mX48RYbBgd28KhEJsS1Z8YjJIE
         o7y9JscZ3FCcnEnO9PngnrnXiyQAqb5e7ORXGCbf4T/igMY7EHeyxT4prkPRa7uRxz8y
         BeR/b2qNhtDrZ9b8t7WefNUq52YvWoa/ImYOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714121509; x=1714726309;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DEXw3qSlNpikX0UKTlTbjPlamz5F9HdGa3FFmvqrPG4=;
        b=dX8FyYiQdYeGIe6HkA3/s8zM+gjvBqFmhPBsa1Wr5Ewl5AqvBAFLaV0dbnBrRjK2nQ
         nCsWwhU53uthV0rXJ6MvuFLdJly4r47oxywSxGs/b7MqNNPFT494gdk0NdaZtcPQ/4bE
         Yrezrw11nZv6yKH0Yvoxfb3ZjvtS/+Yp8bsLrftj8iGKUXACGPowTqswEGH5mWcEoenE
         nJnzF03o/LHj6WH6h2lz+qOd0HIIHSXFoeuOfFmTdtea3x9Yc0wjNKfZKB1v2mjV6hLR
         XfdSXDl+Yfw4e1on7ZBPE7CVut1v2TcKmovnICvPcWXuFwUclKEL1SDcN7REKx6/bNIG
         mHFA==
X-Gm-Message-State: AOJu0YyqnrNY0zSf3Pq+Cd/fnJi+Q7hMu31xz2XdTx2SM7QmSMYGj/j2
	iUiT6kXvc+O/IDK2UxIBi5Q1E9gv67P1hKNYZrAUhQVcf3hn+01OxKJNUMkP6lI=
X-Google-Smtp-Source: AGHT+IH1WrZML1iWYN7+8zToWys0EWlAN/Q0txe9h64YW+F1GLwQ2rshOq7kn6sPKSJ6OUrjdA78jQ==
X-Received: by 2002:adf:9b88:0:b0:347:3d28:c872 with SMTP id d8-20020adf9b88000000b003473d28c872mr1678368wrc.9.1714121508813;
        Fri, 26 Apr 2024 01:51:48 -0700 (PDT)
Date: Fri, 26 Apr 2024 09:51:47 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	Edwin =?iso-8859-1?B?VPZy9ms=?= <edwin.torok@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/2] tools/{c,o}xenstored: Don't link against libsystemd
Message-ID: <413a63de-07ec-43a9-ae60-6b0cfdd61312@perard>
References: <20240425173216.410940-1-andrew.cooper3@citrix.com>
 <20240425173216.410940-2-andrew.cooper3@citrix.com>
 <b5e242fa-daf1-43a2-afd2-cc1ad1bd4dc1@perard>
 <341c5901-254e-4ad2-b935-6b586cd25f2e@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <341c5901-254e-4ad2-b935-6b586cd25f2e@citrix.com>

On Thu, Apr 25, 2024 at 07:16:23PM +0100, Andrew Cooper wrote:
> On 25/04/2024 7:06 pm, Anthony PERARD wrote:
> > On Thu, Apr 25, 2024 at 06:32:15PM +0100, Andrew Cooper wrote:
> >> libsystemd is a giant dependency for one single function, but in the wake of
> >> the xz backdoor, it turns out that even systemd leadership recommend against
> >> linking against libsystemd for sd_notify().
> >>
> >> Since commit 7b61011e1450 ("tools: make xenstore domain easy configurable") in
> >> Xen 4.8, the launch-xenstore script invokes systemd-notify directly, so its
> > That's not enough, it's needs to be `systemd-notify --ready` to be a
> > replacement for sd_notify(READY=1).
> >
> >> not even necessary for the xenstored's to call sd_notify() themselves.
> > So, sd_notify() or equivalent is still necessary.
> >
> >> Therefore, just drop the calls to sd_notify() and stop linking against
> >> libsystemd.
> > Sounds good, be we need to replace the call by something like:
> >     echo READY=1 > $NOTIFY_SOCKET
> > implemented in C and ocaml. Detail to be checked.
> >
> > Otherwise, things won't work.
> 
> Hmm.  It worked in XenRT when stripping this all out, but that is

I don't know how XenServer is setup, maybe it doesn't matter? Anyway...

> extremely unintuitive behaviour for `systemd-notify --booted`, seeing as
> it's entirely different to --ready.

Yes, this --booted option should probably not exist, and there's
`systemctl is-system-running` that does something similar.

> 
> I've got no interest in keeping the C around, but if:
> 
> [ -n "$NOTIFY_SOCKET" ] && echo READY=1 > $NOTIFY_SOCKET
> 
> works, then can't we just use that after waiting for the the pidfile ?

Run `systemd-notify --ready` instead. Hopefully, that will be enough.
($NOTIFY_SOCKET is a socket, and a bit more complicated that I though,
it can start with "@" for example)

Cheers,

-- 
Anthony PERARD

