Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C541F67D9F6
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 00:53:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485243.752319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLC3A-00007S-W2; Thu, 26 Jan 2023 23:53:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485243.752319; Thu, 26 Jan 2023 23:53:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLC3A-0008Vl-TB; Thu, 26 Jan 2023 23:53:00 +0000
Received: by outflank-mailman (input) for mailman id 485243;
 Thu, 26 Jan 2023 23:52:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xXdJ=5X=koconnor.net=kevin@srs-se1.protection.inumbo.net>)
 id 1pLC38-0008Vf-J9
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 23:52:58 +0000
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [2607:f8b0:4864:20::830])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8da7cf04-9dd4-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 00:52:56 +0100 (CET)
Received: by mail-qt1-x830.google.com with SMTP id jr19so2775298qtb.7
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jan 2023 15:52:56 -0800 (PST)
Received: from localhost ([64.18.11.71]) by smtp.gmail.com with ESMTPSA id
 pj4-20020a05620a1d8400b0070648cf78bdsm1845526qkn.54.2023.01.26.15.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 15:52:54 -0800 (PST)
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
X-Inumbo-ID: 8da7cf04-9dd4-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=koconnor.net; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UroPNeyGolPSc4AeIUJptAUxE2BU/L0w0GU3C1PJzJc=;
        b=KVRXSZlcq9t+wUG/QENleViQ72Qmw5LwKgEqKoPBm/sOgrjGjIkRYDp2+ZPwyO3B8I
         M0tTrWHY/Ps1cZxrrNYNcy/pQP5RqkiBilyAOW93nlovnDDp6Zf+YBHAfbvNRiSoPmWw
         Z00f58fy/xSV3sSdiuQ5iindJwIPSpUzJ4Fuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UroPNeyGolPSc4AeIUJptAUxE2BU/L0w0GU3C1PJzJc=;
        b=K93ECvnM9PMTlHi/RSnLU89h1rNIiizFtf1Bn1hbPb7wHiP+9niowE88U0UI6Vjiml
         cVlxwFBwjj0MSk6oDM0s5jd6pqiOCtnYs4P+icALbpEALC5sSSW2vRg637BF/9ghZROm
         HPDRxhIsYVfOxFRMY7m0jgM6wyEkBI9b55OptbaBP0+NlppspktNvHeoSzrjFdUZAdHi
         ZiKe4XpOewCjer7c7Ca/WuzjvFLxiBvj+MxVb6YlwN0ZtYUgvj7Rj2+Wz+P1PyIBhSXg
         nsWLp8rD1rMVPqd9I3NHqY4oCEYx6sqw10MHyGOEgIvDDEWqbVSfuoho0n8OcgOT7qYF
         BEHQ==
X-Gm-Message-State: AFqh2kqGQWzBMkyecpXdw6Tb3A4HQfZrNy2rUu/XfiRswUXqifqNKGx7
	zNU5hy3vPjahdaI8adpWXLIIuw==
X-Google-Smtp-Source: AMrXdXsrfVzASVRgvjjBI+Fccg+qIz2lwVVPSChxGQajRz8mS4PHXRer1c82HYJIpg8zeOQLroq52A==
X-Received: by 2002:ac8:4a0a:0:b0:3b6:2d6d:3546 with SMTP id x10-20020ac84a0a000000b003b62d6d3546mr53029151qtq.64.1674777174879;
        Thu, 26 Jan 2023 15:52:54 -0800 (PST)
Date: Thu, 26 Jan 2023 18:52:53 -0500
From: Kevin O'Connor <kevin@koconnor.net>
To: David Woodhouse <dwmw2@infradead.org>
Cc: seabios <seabios@seabios.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	qemu-devel <qemu-devel@nongnu.org>, paul <paul@xen.org>
Subject: Re: [SeaBIOS] [SeaBIOS PATCH] xen: require Xen info structure at
 0x1000 to detect Xen
Message-ID: <Y9MSVYx4sN1dMRbn@morn>
References: <feef99dd2e1a5dce004d22baf07d716d6ea1344c.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <feef99dd2e1a5dce004d22baf07d716d6ea1344c.camel@infradead.org>

On Fri, Jan 20, 2023 at 11:33:19AM +0000, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> When running under Xen, hvmloader places a table at 0x1000 with the e820
> information and BIOS tables. If this isn't present, SeaBIOS will 
> currently panic.
> 
> We now have support for running Xen guests natively in QEMU/KVM, which
> boots SeaBIOS directly instead of via hvmloader, and does not provide
> the same structure.
> 
> As it happens, this doesn't matter on first boot. because although we
> set PlatformRunningOn to PF_QEMU|PF_XEN, reading it back again still
> gives zero. Presumably because in true Xen, this is all already RAM. But
> in QEMU with a faithfully-emulated PAM config in the host bridge, it's
> still in ROM mode at this point so we don't see what we've just written.
> 
> On reboot, however, the region *is* set to RAM mode and we do see the
> updated value of PlatformRunningOn, do manage to remember that we've
> detected Xen in CPUID, and hit the panic.
> 
> It's not trivial to detect QEMU vs. real Xen at the time xen_preinit()
> runs, because it's so early. We can't even make a XENVER_extraversion
> hypercall to look for hints, because we haven't set up the hypercall
> page (and don't have an allocator to give us a page in which to do so).
> 
> So just make Xen detection contingent on the info structure being
> present. If it wasn't, we were going to panic anyway. That leaves us
> taking the standard QEMU init path for Xen guests in native QEMU,
> which is just fine.
> 
> Untested on actual Xen but ObviouslyCorrect™.

Thanks.  I don't have a way to test this, but it looks fine to me.
I'll give a few more days to see if others have comments, and
otherwise look to commit.

Cheers,
-Kevin

