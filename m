Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 454EA80A898
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 17:18:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650745.1016523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBdX5-0000PZ-3c; Fri, 08 Dec 2023 16:16:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650745.1016523; Fri, 08 Dec 2023 16:16:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBdX5-0000NQ-0z; Fri, 08 Dec 2023 16:16:55 +0000
Received: by outflank-mailman (input) for mailman id 650745;
 Fri, 08 Dec 2023 16:16:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jsQu=HT=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rBdX3-0000NC-E8
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 16:16:53 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31d70bf1-95e5-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 17:16:51 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3333074512bso1793925f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 Dec 2023 08:16:51 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 k42-20020a05600c1caa00b003fe1fe56202sm3289532wms.33.2023.12.08.08.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 08:16:50 -0800 (PST)
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
X-Inumbo-ID: 31d70bf1-95e5-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702052211; x=1702657011; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Unv5qxg5cVD5p/3hOrls6zA2KtHkcXvU/wayCqF1XvI=;
        b=RKAxB8qXIjXc7bMXkmy9m6cJTcNdw6o+CkXZF/mZJtGZ+BJfvBhrn+bAWPJrfCNEha
         CUuY7y+IUP4jAeKBovMWyjlZaHflz3KVy/q5Z8HSb3oEDS39qoqoe4vCdx0qOgkBVob2
         h0iTSa7NCGR8bCpjDkLA7Rzhm6Smp3po55ctU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702052211; x=1702657011;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Unv5qxg5cVD5p/3hOrls6zA2KtHkcXvU/wayCqF1XvI=;
        b=rNHjIQcKvZKro8hkp9zBJAR6LGfU1PKaO3q5WQspevysjZgFli2onG2nbrwG8Gw8uY
         N38/ZrRogKfdAf1K1N/FhUFdZAUZZsYXhtXFJlqcjT26XhmPreQCb49v9lf80/q/5RjV
         ZUXhZzgKxgqSfBF+imQN7EoO9gwFMDCnrbtuoxxl28ooC9oThqlCMJqUjiebdHMsrJwc
         IDHoyPFKYWxxBEqjjlY4wyeTKXszgfOEaXW+mnrfGMYQJaF9Xo7ZQ3vCyz/QR42kkn8S
         wJ1Ux4glTZm+Er5TlltUaJoZR2nEqaRT1WN83vARHGK9y3TWb/HJgFKmTp3P0VqO/f+G
         fw3A==
X-Gm-Message-State: AOJu0YxsDLsirTxAG+aF7106mH5hxlJwKZ+xXJqP/IIyUcp0x8vW1eZV
	gMXoGxbGpY1ZqDpZbU27fKzhsg==
X-Google-Smtp-Source: AGHT+IEVUBF2EtyMUsTHaOkrvyW3VJ11cb1dvw2kc6Is9L6xJ9BT5WZlnZvtphX7nUEyS0OlBtyLew==
X-Received: by 2002:a05:600c:19cb:b0:40b:5e56:7b49 with SMTP id u11-20020a05600c19cb00b0040b5e567b49mr202274wmq.146.1702052210671;
        Fri, 08 Dec 2023 08:16:50 -0800 (PST)
Date: Fri, 8 Dec 2023 16:16:49 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 5/5] tools/xenstored: remove "-N" command line option
Message-ID: <f8ddd1ee-984f-4c54-8ac8-e65f430718f4@perard>
References: <20231121114048.31294-1-jgross@suse.com>
 <20231121114048.31294-6-jgross@suse.com>
 <fe647c65-1092-4a25-9af1-3528ac69f682@citrix.com>
 <4add391b-cee8-4af3-be1f-56078e33e32d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4add391b-cee8-4af3-be1f-56078e33e32d@suse.com>

On Fri, Dec 08, 2023 at 04:58:52PM +0100, Juergen Gross wrote:
> On 08.12.23 16:46, Andrew Cooper wrote:
> > On 21/11/2023 11:40 am, Juergen Gross wrote:
> > > The "-N" (do not daemonize) command line option is of questionable use:
> > > its sole purpose seems to be to aid debugging of xenstored by making it
> > > easier to start xenstored under gdb, or to see any debug messages
> > > easily.
> > > 
> > > Debug messages can as well be sent to syslog(), while gdb can be
> > > attached to the daemon easily. The only not covered case is an error
> > > while initializing xenstored, but this could be handled e.g. by saving
> > > a core dump, which can be analyzed later.
> > > 
> > > The call of talloc_enable_leak_report_full() done only with "-N"
> > > specified is no longer needed, as the same can be achieved via
> > > "xenstore-control memreport".
> > > 
> > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > 
> > Systemd wants daemons to not fork, because systemd can start them up in
> > a better-prescribed environment than deamonise() can make.
> > 
> > It was a lazy port to system which has caused us not to be using -N in
> > the first place.
> > 
> > So no - I think this option specifically wants to stay, and the systemd
> > integration improved.
> 
> The problem with this approach is that we have some functionality in the
> launch-xenstore script relying on [o]xenstored coming back after having
> forked off the daemon: we are setting the oom-score, which can be done

It's perfectly reasonable to bane the use of "-N" when using
`./launch-xenstore` to start xenstored. It doesn't mean that the option
needs to be removed from xenstored.

> only when knowing the process id.
> 
> So we need a solution for this problem before we can really encourage
> users to use the -N option.
> 
> Please note that setting the oom-score from within xenstored was rejected
> back when I posted a patch in this regard, especially as it is specific to
> Linux. Additionally this would mean we need to add this functionality to
> xenstored AND oxenstored.

There's still a world where -N can be used, and oom-score can be set,
I'm pretty sure that can be done with an hand-crafted "systemd.service"
file. One probably need to have something like "OOMPolicy=" or
"OOMScoreAdjust=" in their service file, and start the `xenstored`
daemon of their choice directly, even with -N as systemd can detect when
the daemon is ready because we use sd_notify() (at least in cxenstored).


So, I think we should keep -N.

Cheers,

-- 
Anthony PERARD

