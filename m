Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 992308B8B34
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2024 15:30:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715310.1116842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2A1M-00087m-Sh; Wed, 01 May 2024 13:29:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715310.1116842; Wed, 01 May 2024 13:29:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2A1M-00084w-Pl; Wed, 01 May 2024 13:29:16 +0000
Received: by outflank-mailman (input) for mailman id 715310;
 Wed, 01 May 2024 13:29:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAI4=ME=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1s2A1K-00084q-Pb
 for xen-devel@lists.xenproject.org; Wed, 01 May 2024 13:29:14 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbe81874-07be-11ef-909b-e314d9c70b13;
 Wed, 01 May 2024 15:29:13 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-349545c3eb8so4419563f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2024 06:29:12 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 u12-20020a5d434c000000b0034ad657deccsm27440612wrr.71.2024.05.01.06.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 May 2024 06:29:10 -0700 (PDT)
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
X-Inumbo-ID: cbe81874-07be-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714570151; x=1715174951; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y/T26vGuVC3gvXPmvBK68ArxSnuFJumdSZ5Y78/YZ0Y=;
        b=u4ozEo9YtUYo5obRgCYh9UNP0Db0TB6HDxFrkF962XH9HxRoR6pZT1B8DUHUM113Ov
         IJ+T/S5jqW9CqbUTIArJNGvM0CfuN1h8L5walKOmdZN7FMvwvpNZmpE75m9ueatK1+gh
         JvCaAZjgyG4MdjlYrxzbptpm8PU17sG5450KY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714570151; x=1715174951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/T26vGuVC3gvXPmvBK68ArxSnuFJumdSZ5Y78/YZ0Y=;
        b=qC/zcFFKuhmR0aQb9t0YEatPo+I3Diio/jSRYWB26RqnF6MMwKvwpjUn3z0FbqbT+9
         /M+eHU0HNSFl06SYB4CNQiKljy9B6LyM1ZbVU9olSOUPDo40vW+TkuCAs6FrdJvjD9a7
         2iDeagrHWSan8xsEKCgtk4jL8j1RULLyAzA5ywqMuFm4MGt4MVlexVnR1PST7WqSHtmd
         1oUvP68Igvlgemf+HVjRjxNFgv4EkIGnxcBz+DFqDRKKd4N/HJNdDrz/QNl6+MeQA9zV
         50xzY92UwOwN/kaS2qM805OwBF7x6FkaQO2CZUBHqg+hfKEHVA95V4sQ0RmWg7dUvVE7
         JxfQ==
X-Gm-Message-State: AOJu0YwHiGhdVMQ+4R+WQHu7h/MJRwVw6SnbkucZK8I04fm28WUpkn8x
	2n5N+PUVUZTZo1V8pQmC7FTPW5kgp7RQrr2KktELBJt/BP3remAl+/Os95t3pSI=
X-Google-Smtp-Source: AGHT+IG48C/kl2KyLRmfWD0XUwlGKTxmp3GiM2I5RgiGFkb2ABOECmMNxJfVgF+yw6uMJesgjCEpTQ==
X-Received: by 2002:a5d:490e:0:b0:34c:5a37:b90c with SMTP id x14-20020a5d490e000000b0034c5a37b90cmr1891139wrq.58.1714570151296;
        Wed, 01 May 2024 06:29:11 -0700 (PDT)
Date: Wed, 1 May 2024 14:29:10 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	Edwin =?iso-8859-1?B?VPZy9ms=?= <edwin.torok@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/2] tools/{c,o}xenstored: Don't link against libsystemd
Message-ID: <83160ad7-19b1-496f-a560-c11db67b1caf@perard>
References: <20240425173216.410940-1-andrew.cooper3@citrix.com>
 <20240425173216.410940-2-andrew.cooper3@citrix.com>
 <b5e242fa-daf1-43a2-afd2-cc1ad1bd4dc1@perard>
 <341c5901-254e-4ad2-b935-6b586cd25f2e@citrix.com>
 <413a63de-07ec-43a9-ae60-6b0cfdd61312@perard>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <413a63de-07ec-43a9-ae60-6b0cfdd61312@perard>

On Fri, Apr 26, 2024 at 09:51:47AM +0100, Anthony PERARD wrote:
> Run `systemd-notify --ready` instead. Hopefully, that will be enough.
> ($NOTIFY_SOCKET is a socket, and a bit more complicated that I though,
> it can start with "@" for example)

FTR: If it turns out that calling systemd-notify binary isn't working
well enough, we could have an implementation of sd_notify() in our tree,
openssh are doing there own here:
https://bugzilla.mindrot.org/show_bug.cgi?id=2641
and there's an example implementation on systemd's documentation:
https://www.freedesktop.org/software/systemd/man/devel/sd_notify.html#Notes
(Nothing for ocaml)

But let's go with `systemd-notify --ready` as it is just easier to
write a bit of shell script.

Cheers,

-- 
Anthony PERARD

