Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD806F4251
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 13:11:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528505.821748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptnuJ-0002Gh-BA; Tue, 02 May 2023 11:10:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528505.821748; Tue, 02 May 2023 11:10:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptnuJ-0002Dv-7D; Tue, 02 May 2023 11:10:55 +0000
Received: by outflank-mailman (input) for mailman id 528505;
 Tue, 02 May 2023 11:10:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=87GZ=AX=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1ptnuH-0002Do-Uj
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 11:10:53 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00942132-e8da-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 13:10:53 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f1728c2a57so36242665e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 May 2023 04:10:52 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n3-20020a7bcbc3000000b003f175b360e5sm35359896wmi.0.2023.05.02.04.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 04:10:51 -0700 (PDT)
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
X-Inumbo-ID: 00942132-e8da-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1683025852; x=1685617852;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CrppReUeYZVSFZqFBkVwrLemCcLTs/Xn38ozhZ1/RHE=;
        b=hlQEGzHU0E+m+gi964/ghAazVExWws+a7i0EwYHZdziXCzEpskfCCNuI/N/1IuPO1j
         u97I3vSvdyb/Gaj7kds9TqayTtzJi8fQmCjvAfauZIkdeUaF+F9tb0h01En3MXONrMHm
         9DlOdwkzCYHAM3EuPuTu4LLTbc31hsie/yFh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683025852; x=1685617852;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CrppReUeYZVSFZqFBkVwrLemCcLTs/Xn38ozhZ1/RHE=;
        b=PbLcCwWBWKomk+YAqS/uEUrWu4Eemmb5jrAcq3DUDUdIKbRgcGrg0UXwcPSPY1AwU3
         9ANoyXkkFc2GRJhaCYsUaG93PTp3BlFySCIkWiL1IioVMCEjpxuUojL5KXq/mmY+3zu4
         uabd6/YBDOMEbO1oD0/XukG+/ES5jmKeHjv3Yabk9RI2SdNlU7r8hr1XygladLtyZL7m
         cJPSYGzfZOi8dwKf4I0Bteub8/9zKeJmdWCUftNNohOfMy1Zx0mjjOw2ld8H3cXT37yY
         U5KMNxe/gGW6TjhrUyhDVgZnvUsXHJOLhfgSZj+1NXz3v3k+A5V+/S2ixcvyoVZNxnyg
         BsMA==
X-Gm-Message-State: AC+VfDy+cdSsMsFA6o3EpXnW4L2lmrLA8rH9KW2wT4pvwvJKGQ567rvC
	5jIqxHgXmSLBjhMdpMZgIw3iNw==
X-Google-Smtp-Source: ACHHUZ7QZc1lIYE4w1r1TuXOZ+DRhv8aFFUNbVFyuIq+VlrY8aE+/DIk30O6TZ/kvStW10oG7gHqIw==
X-Received: by 2002:a1c:f019:0:b0:3f0:49b5:f0ce with SMTP id a25-20020a1cf019000000b003f049b5f0cemr11324696wmb.12.1683025852268;
        Tue, 02 May 2023 04:10:52 -0700 (PDT)
Message-ID: <6450efbb.7b0a0220.9c334.a329@mx.google.com>
X-Google-Original-Message-ID: <ZFDvuHddJlX7W66s@EMEAENGAAD19049.>
Date: Tue, 2 May 2023 12:10:48 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com,
	committers@xenproject.org, michal.orzel@amd.com,
	xen-devel@lists.xenproject.org
Subject: Re: xen | Failed pipeline for staging | 6a47ba2f
References: <644bfbc6939d8_2a49bbb403253f4@gitlab-sidekiq-catchall-v2-78885c497-qxnp2.mail>
 <alpine.DEB.2.22.394.2304281905020.974517@ubuntu-linux-20-04-desktop>
 <ca0144a6-2c57-0cc3-fd27-5dbe59491ef3@citrix.com>
 <alpine.DEB.2.22.394.2304291808420.974517@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2305011835000.974517@ubuntu-linux-20-04-desktop>
 <333df991-58a8-f4e0-b46c-9f480cd34213@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <333df991-58a8-f4e0-b46c-9f480cd34213@suse.com>

On Tue, May 02, 2023 at 08:53:31AM +0200, Jan Beulich wrote:
> I'm also having a hard time seeing what failure case the test ended
> up encountering: There are only two errors which can occur - one
> from the XSM hook (which is mishandled, and I'll make a separate
> patch for that) and the other from failing to copy back the info for
> the domain being looked at. I hope we can exclude the former, so are
> you suggesting the info struct copy-back is failing in your case?

Something's off somewhere, that's for sure. I'll post the remainder of
the series (not all of it made it to staging) so it's not left hanging
and start investigating this failure.

Cheers,
Alejandro

