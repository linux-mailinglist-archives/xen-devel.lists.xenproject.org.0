Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D35A67016
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 10:44:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918823.1323454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuTUK-0004Js-3u; Tue, 18 Mar 2025 09:43:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918823.1323454; Tue, 18 Mar 2025 09:43:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuTUK-0004IT-10; Tue, 18 Mar 2025 09:43:56 +0000
Received: by outflank-mailman (input) for mailman id 918823;
 Tue, 18 Mar 2025 09:43:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYbn=WF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tuTUJ-0004IL-1r
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 09:43:55 +0000
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d7d292f-03dd-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 10:43:48 +0100 (CET)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2ff4a4f901fso4849459a91.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 02:43:48 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-301535345f3sm7724009a91.24.2025.03.18.02.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 02:43:46 -0700 (PDT)
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
X-Inumbo-ID: 7d7d292f-03dd-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742291027; x=1742895827; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bxUWTN3QSyfO8lCh4jUi44FywSqT7ElCaogS4t3n/iY=;
        b=UAl6iMC8tDgRNN4qs4n8gxwnKA+nxAfHF9XGoJovY0J2NMzM9GuaCpAvUIjXqk2nwr
         nX0tljSMFCcIFUof/+0ydeORzokGCTbtD9HATKB+OelNELXISwNnBPdJhMMV5o0wxQVl
         MaUnfDdLQ03veVTB6+prZoF5LkJ1gZplCfYbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742291027; x=1742895827;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bxUWTN3QSyfO8lCh4jUi44FywSqT7ElCaogS4t3n/iY=;
        b=VQnVY0ihZHhaVi90c2mqiRH34pakXtrQuMpmx4xhoh+jMI1EMZ4uKJh5IyxFR60S4Q
         9OcCaKfaFzduC1Td0yN3CNCVXVCfSUSvjudtHrU1fzweRNaQdJXAsWUVUMEkIgc7rNO9
         isfcKMJJKLldQcouSF+dmyye5P3lA8G7+pu7u2a68rmLZQeHp72lhGks8AwaimHl7Qsl
         MNrnflfobC3VI/EMgQZBvhC+xtiH3uMv4POcLBe4AACTbqLKY3VmaZleEhWq39xEMEVH
         Nllpg2DEH8trMS/4GDC2kT+sAsqBKq4m7G4f2cBBYXz0MBMq96o4QAbUGyEJGMH0xe0E
         kH6w==
X-Gm-Message-State: AOJu0Yxe1KIVfB2PunfXmtrFV1dao0AFGT3jZnpLmVI1kHd2qLoo1IY7
	RvIczqeP86zsACYGIZ3O92Dl8mhbpoEHXPdmRnZTzcafI8puqdvv6HWhoU8DtQY=
X-Gm-Gg: ASbGncuNw7sqo1XUghDYLbdgNnqmSUOoWXkA6JLNaaU6ESUUdOyLSVM7fwsRFsHnzCH
	+3BkBy3GHs9pn7Z8Qav5Y5x/x9EMGOG5dISLpiglD/xYCnEGTwaZkDn62J+MLQM/Ofouuz4Ntr2
	xfTXjTcnBnFRwu4BI+lV/Bf79bVAf9O1nBRIS5OF+WBgx80I1IxJtjabEi9smJ2BXKZrsVWNkVB
	1723ihwzGMd19564W684P4jXJxr4FD+hTjEeoXEQFZenMTXLiHM/9BI3DO7Iyus+4rJ8ze7rGoU
	iqUy2AolZdfxW7JZ9fwcUBL1FzCYOQgJwnyCdO9Y3y8sPsnLr1eFVMY=
X-Google-Smtp-Source: AGHT+IF9q8uh8dCAcjYCSBJ1Wke/ODx5qqQeXjDU0WMEObcSb04bvY5uoMN1TUXiXTx0WmD/mq73iA==
X-Received: by 2002:a17:90b:1d45:b0:2fe:861b:1ae3 with SMTP id 98e67ed59e1d1-301a5b12641mr2552784a91.8.1742291027022;
        Tue, 18 Mar 2025 02:43:47 -0700 (PDT)
Date: Tue, 18 Mar 2025 10:43:41 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH 5/8] automation/cirrus-ci: build XTF
Message-ID: <Z9lATTsqPCLw_hHG@macbook.local>
References: <20250317121616.40687-1-roger.pau@citrix.com>
 <20250317121616.40687-6-roger.pau@citrix.com>
 <alpine.DEB.2.22.394.2503171706570.3477110@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2503171706570.3477110@ubuntu-linux-20-04-desktop>

On Mon, Mar 17, 2025 at 05:07:22PM -0700, Stefano Stabellini wrote:
> On Mon, 17 Mar 2025, Roger Pau Monne wrote:
> > In preparation for using the XTF selftests to smoke test the FreeBSD based
> > Xen builds.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > I've used the current version of FreeBSD to build XTF, but it might be
> > safer to use the latest production (release) version instead.
> 
> Yes, I think so, especially as the latest is a rolling distro?

Kind of - it's even weirder, as part of the libraries are bundled with
the FreeBSD base system (together with the kernel).  When using current
there could be a window where the packages are built against stale
libraries, because the ones in base have been updated, but the
packages haven't been rebuilt yet.

I will switch to use the last production release.

Thanks, Roger.

