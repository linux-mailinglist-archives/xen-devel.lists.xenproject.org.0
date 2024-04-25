Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F9F8B27DE
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 20:07:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712217.1112718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s03Ul-0005k2-NZ; Thu, 25 Apr 2024 18:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712217.1112718; Thu, 25 Apr 2024 18:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s03Ul-0005hb-Ks; Thu, 25 Apr 2024 18:06:55 +0000
Received: by outflank-mailman (input) for mailman id 712217;
 Thu, 25 Apr 2024 18:06:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PcQm=L6=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1s03Uk-0005hV-By
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 18:06:54 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9848d8b4-032e-11ef-909a-e314d9c70b13;
 Thu, 25 Apr 2024 20:06:53 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-41b5dd5af48so5062905e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 11:06:53 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 k29-20020a05600c1c9d00b0041a68d4fe76sm202394wms.0.2024.04.25.11.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Apr 2024 11:06:52 -0700 (PDT)
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
X-Inumbo-ID: 9848d8b4-032e-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714068412; x=1714673212; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hKuTHWjwA6UAoDwmbDvHl20hBWBu74PPvN/u/KCEbJY=;
        b=Hv9AxinThehmZIycr0m9okSMpvTdnHbycj2q676+sPk+sVdRXevKzlwFY7kXeVzvhI
         k9dA0HacihplzP/Lvm59GGICVK4uN9whaelPS8jjlplknhUA/vuxdsNqvqNVBnlzLOgR
         FgdrJz2FSSSMRjZy+80dywArO4XcZru741s+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714068412; x=1714673212;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hKuTHWjwA6UAoDwmbDvHl20hBWBu74PPvN/u/KCEbJY=;
        b=Zf4lWiSQGX//BLI3+2j6IMctE8OD5C/FxbHafurg7kZAHyPAPh+o2Rac5sRYY6+aeE
         YKFDF1xdeNl0NE1OMXX1EkAn1XhNx10ngbnkE6HxiPKUctluWdabQwllVC747yAMsJ7n
         FOpJ6ZYaWqJ6z3U+rDXzW2m1vMIiG8gVaEkCoclCRaE5ZtaDVdTEzTA4/t/qQI3sizRE
         U28NNCTBXUOOM22j7xgKdXn1S0tLt9ojlGZtXkDcSxaocN1yYooUhArgADihxRp8yxXh
         ibWWkrFFZSSBrysV0D5TJub7y4CHCVg9wDoGtlk6gj5UBilnMoI+liYNz/nyRkLWCb05
         Qabw==
X-Gm-Message-State: AOJu0YyeeodJ1GxVZztpVqbLxjQwW91h6dZdH6OqiiFv1dggLEkgip9B
	THhfSgIVMfA6juLZZz0PLmvc3FoJm4S5/p4z4de9ndhwAtKQWK7XNuCIORLjvAE=
X-Google-Smtp-Source: AGHT+IEYVdAuYaZGCu/+8ZjCNkn8/7sAhy7fZJszHwWl29bsWGj5qNUXlPIaCBVmUSDA+Y5ZwNwSBw==
X-Received: by 2002:a05:600c:3502:b0:418:d35f:8628 with SMTP id h2-20020a05600c350200b00418d35f8628mr170457wmq.21.1714068412620;
        Thu, 25 Apr 2024 11:06:52 -0700 (PDT)
Date: Thu, 25 Apr 2024 19:06:51 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	Edwin =?iso-8859-1?B?VPZy9ms=?= <edwin.torok@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/2] tools/{c,o}xenstored: Don't link against libsystemd
Message-ID: <b5e242fa-daf1-43a2-afd2-cc1ad1bd4dc1@perard>
References: <20240425173216.410940-1-andrew.cooper3@citrix.com>
 <20240425173216.410940-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240425173216.410940-2-andrew.cooper3@citrix.com>

On Thu, Apr 25, 2024 at 06:32:15PM +0100, Andrew Cooper wrote:
> libsystemd is a giant dependency for one single function, but in the wake of
> the xz backdoor, it turns out that even systemd leadership recommend against
> linking against libsystemd for sd_notify().
> 
> Since commit 7b61011e1450 ("tools: make xenstore domain easy configurable") in
> Xen 4.8, the launch-xenstore script invokes systemd-notify directly, so its

That's not enough, it's needs to be `systemd-notify --ready` to be a
replacement for sd_notify(READY=1).

> not even necessary for the xenstored's to call sd_notify() themselves.

So, sd_notify() or equivalent is still necessary.

> Therefore, just drop the calls to sd_notify() and stop linking against
> libsystemd.

Sounds good, be we need to replace the call by something like:
    echo READY=1 > $NOTIFY_SOCKET
implemented in C and ocaml. Detail to be checked.

Otherwise, things won't work.

Thanks,

-- 
Anthony PERARD

