Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A43BCABD2CF
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 11:10:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990539.1374479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHIyX-0003p2-LJ; Tue, 20 May 2025 09:09:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990539.1374479; Tue, 20 May 2025 09:09:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHIyX-0003m1-Ge; Tue, 20 May 2025 09:09:29 +0000
Received: by outflank-mailman (input) for mailman id 990539;
 Tue, 20 May 2025 09:09:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8eI0=YE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uHIyW-0003lv-2z
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 09:09:28 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f38581b-355a-11f0-a2fa-13f23c93f187;
 Tue, 20 May 2025 11:09:26 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-60119cd50b6so6339637a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 02:09:23 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ad52d06b105sm694472366b.41.2025.05.20.02.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 02:09:22 -0700 (PDT)
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
X-Inumbo-ID: 1f38581b-355a-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747732163; x=1748336963; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tVQq2gs+OkPmieyX4cN/JoZaN8OcmE8Kd2im74ZeQoM=;
        b=qKjvrFDzZK5wZpAvJqLwiXWzZbK/gbmGysjTxsWG5zuVt1X3xdHSiqli+xhIdv/95A
         iDfuqjSAOz62eRppOCWTE6ucS9Eobj7AXxXkSo+ybDeLU3qGEmNpB3yYLGTLsZQtW8zL
         1PPC0DeTeAIVNiwiavtM//YaJOzdRdviVN4hM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747732163; x=1748336963;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVQq2gs+OkPmieyX4cN/JoZaN8OcmE8Kd2im74ZeQoM=;
        b=aDivch5oAhph8cqj7Mq2Y666VQGRjrXxXljSs0qd6ZOI4LxTruTyuyrX+tCUTo11qN
         ohKMWX6R6OSQGjSEocwE3Q06IiMMUSmogQ1gXztS+ogKEq3jqp35n+dvqT3kDAailWTT
         lOnTcDZ0IrN0EF0Kj+tKXEuQ9RYgRjyM2P6RFc/aiLsyVFxasHPlqbiwE1Ti59tyHqV4
         9DY5N1HXb8ZcEz7J0RxJjGIAA8E13t3wHQ0Y3i7h91Bxt/BMxo1qucKzCH89kzd5A/iy
         ta8B/VhMW7tUHin7/Yui3aH5mYgTu1WSruHJwsEAnij+C7V9AkY6lNOz5xxBlOrFri3h
         MGfA==
X-Forwarded-Encrypted: i=1; AJvYcCVB2i5gAPYz4NZZnC7MXwz8m1kPyuuU1uiUaqCajyyuvHlVUYJILQH9qtlVwy80ipjcvl0RzIi7nus=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOU5sG79z5yHL59joOG+Pi2Xws5/ET2jBANA8mBuA4ZBqwK3m8
	oq3YNusz6dwGsn26wjLDrdcXHilkuA5zDNXydUP1OUqpFQhu2gV0gqSwMh2Phev2d+M=
X-Gm-Gg: ASbGncvh+tQ6OMxGKk4hr/Ag2NoLG7V/KbDjhebAP0iK5LjZpHzNXDRzBd1ZrtCaVnJ
	c2xKyMCTelaBNBoYR6utEE9oT0qBt3pqTTejZ1hPXP8KFYJc/uBuSYAChuoUaZQWVW7k+MizKss
	zgKA5k+Zjt7Tp1wq768BjCXbKY1mrtgFOBLEW8M9gdLDmnN7Rff6jDUdw/9FAKzvLinDKx/xhSw
	fdUimsMs9klLA/QUTwK2sXAfpPngqJ8ar8dLbb9hWu1VBvBVJaUZRCjQIy1DUvinlvB7aYWVjCf
	lWEMvPCct4etLnlYIQLama9GK9R1oXbE+8NKvdI5/MLu2OKgsPw3W5WpEMYyZVGrIaqK1qF6v26
	FH4c9zbqyd2dD9BG5RMM=
X-Google-Smtp-Source: AGHT+IGPNqnv+PLAcCho7TBT2gUtz6XxiATaf8F6wnFefG2ZCku5GvRxxtM3ChRWHWTKBbHjQXSuMA==
X-Received: by 2002:a17:907:7f22:b0:ad5:72d4:85ee with SMTP id a640c23a62f3a-ad572d507b2mr737808366b.53.1747732162966;
        Tue, 20 May 2025 02:09:22 -0700 (PDT)
Date: Tue, 20 May 2025 11:09:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 09/10] vpci/msi: Free MSI resources when init_msi()
 fails
Message-ID: <aCxGwSl_UuCWPf6B@Mac.lan>
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
 <20250509090542.2199676-10-Jiqian.Chen@amd.com>
 <8d89f644-4ded-4490-ad23-518563d230d2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8d89f644-4ded-4490-ad23-518563d230d2@suse.com>

On Tue, May 20, 2025 at 08:40:28AM +0200, Jan Beulich wrote:
> On 09.05.2025 11:05, Jiqian Chen wrote:
> > When init_msi() fails, the previous new changes will hide MSI
> > capability, it can't rely on vpci_deassign_device() to remove
> > all MSI related resources anymore, those resources must be
> > removed in cleanup function of MSI.
> 
> That's because vpci_deassign_device() simply isn't called anymore?
> Could do with wording along these lines then. But (also applicable
> to the previous patch) - doesn't this need to come earlier? And is
> it sufficient to simply remove the register intercepts? Don't you
> need to put in place ones dropping all writes and making all reads
> return either 0 or ~0 (covering in particular Dom0, while for DomU-s
> this may already be the case by default behavior)?

For domUs this is already the default behavior.

For dom0 I think it should be enough to hide the capability from the
linked list, but not hide all the capability related
registers.  IMO a well behaved dom0 won't try to access capabilities
disconnected from the linked list, and in general we allow dom0 access
to as much as possible.

For dom0 Xen could drop writes to the MSI(-X) enable bit, thus forcing
MSI(-X) to stay disabled.  I however don't see this as a mandatory
step for the work here.

Regards, Roger.

