Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEB525EF37
	for <lists+xen-devel@lfdr.de>; Sun,  6 Sep 2020 19:02:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEy3T-00033b-0l; Sun, 06 Sep 2020 17:02:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uy6l=CP=linuxfoundation.org=torvalds@srs-us1.protection.inumbo.net>)
 id 1kEy3R-00033W-R2
 for xen-devel@lists.xenproject.org; Sun, 06 Sep 2020 17:02:13 +0000
X-Inumbo-ID: e558a693-a8f4-49aa-b046-00ebce369582
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e558a693-a8f4-49aa-b046-00ebce369582;
 Sun, 06 Sep 2020 17:02:12 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id v23so13432577ljd.1
 for <xen-devel@lists.xenproject.org>; Sun, 06 Sep 2020 10:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iBpy6uI3e4BtHg/8kxvDuOM32+PzqfR21jwNr3B73YQ=;
 b=MYzp6+RJ0qQcPfwGPVxP1evkhmzNr5bpNK7N37GvQtRp5Fdpt2GbeB+I2RiNE+gmkh
 bG6fZfHCgtbGGN3WT5WdW65upCG7HzFaPGI6gK9YWZ8jydXEei+P24Z6/svKcyNiPxgC
 6+2lMVRWm91PhCZlkaop+f6NdSWs4BMQHyPmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iBpy6uI3e4BtHg/8kxvDuOM32+PzqfR21jwNr3B73YQ=;
 b=H3/IpZSpZPjVGValSGmb1ZG4C8QJxWvhZc4G8sar7AryXZul6ieCTlkLGHVP/Zt00q
 tT9JuK40i4HMa3MWlHPaRd1dglm6cR1LtrneOU8aQP9jWhgmAE0DGPhHkxz7Wmtnp4sE
 3l/MVidkgZU9l+yKubUt0bs9UUbNs8+XlpC87EGoWVNvJjRJhhJiAgxmFOyV58MHgbvP
 dOeATxgB6rmPHuZev4eGHxNHFVvUG3CGmnUgNzLpH74Iq9YyFe2D2EkCsPbs2YShVT9o
 h11v198InpXuxmQiXJgtSUCxWt7azwNrQvPLkGbDzwzUnJvGWtvw4At6kfTPhQvFKa0P
 6P+w==
X-Gm-Message-State: AOAM532KmYxRDcEHeD/O1rxsRqXtn14I2x8aOBDizNxTFWj0IS165QZ3
 hj5RTxa7XPXZjKnIeXWo/byZOXh6dl/9wQ==
X-Google-Smtp-Source: ABdhPJyn+xCImM6/0tp7bwLA2tNmZagstqe2II3VpSj3bksccQiRYk0Oo2JSgHRxdQVJUVS/JFkDCQ==
X-Received: by 2002:a2e:b16a:: with SMTP id a10mr8410446ljm.3.1599411731495;
 Sun, 06 Sep 2020 10:02:11 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170])
 by smtp.gmail.com with ESMTPSA id j127sm1115733lfd.6.2020.09.06.10.02.10
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Sep 2020 10:02:10 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id u4so12497217ljd.10
 for <xen-devel@lists.xenproject.org>; Sun, 06 Sep 2020 10:02:10 -0700 (PDT)
X-Received: by 2002:a2e:b008:: with SMTP id y8mr7614310ljk.421.1599411729954; 
 Sun, 06 Sep 2020 10:02:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200906044433.24820-1-jgross@suse.com>
In-Reply-To: <20200906044433.24820-1-jgross@suse.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 6 Sep 2020 10:01:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiTZ3V-Jn5xmHTKafZ-vRw-E0n8EMz+PyHKz4CMRwmYxw@mail.gmail.com>
Message-ID: <CAHk-=wiTZ3V-Jn5xmHTKafZ-vRw-E0n8EMz+PyHKz4CMRwmYxw@mail.gmail.com>
Subject: Re: [GIT PULL] xen: branch for v5.9-rc4
To: Juergen Gross <jgross@suse.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 xen-devel@lists.xenproject.org, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sat, Sep 5, 2020 at 9:44 PM Juergen Gross <jgross@suse.com> wrote:
>
> It contains a small series for fixing a problem with Xen PVH guests
> when running as backends (e.g. as dom0). Mapping other guests' memory
> now is working via ZONE_DEVICE, thus not requiring to abuse the memory
> hotplug functionality for that purpose.

Tssk. This really isn't a bug-fix, it's clearly new development.

I'm going to let it slide since it seems so contained, but don't do this.

                  Linus

