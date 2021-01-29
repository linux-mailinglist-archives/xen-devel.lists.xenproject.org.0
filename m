Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 235B130909F
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jan 2021 00:30:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78589.143026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5dDO-0005r3-NK; Fri, 29 Jan 2021 23:30:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78589.143026; Fri, 29 Jan 2021 23:30:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5dDO-0005qe-Jr; Fri, 29 Jan 2021 23:30:10 +0000
Received: by outflank-mailman (input) for mailman id 78589;
 Fri, 29 Jan 2021 23:30:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c6a+=HA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l5dDM-0005ml-Jx
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 23:30:08 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a25b5461-eca9-489f-86a6-d9388d5d19ec;
 Fri, 29 Jan 2021 23:30:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3C47964DDB;
 Fri, 29 Jan 2021 23:30:06 +0000 (UTC)
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
X-Inumbo-ID: a25b5461-eca9-489f-86a6-d9388d5d19ec
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611963006;
	bh=ShMkKYQ7lV9VCRdzGHDh8g0fhNGxBKcFK61afZMJ0Ms=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Hh2AEOCXUE9vejcjbILNVfX/ruZhJHnM8BU7tnldl/F4FjEvf54/Ci7Rg0rnVvjIo
	 xhiBTgEjCYTu96KK4T+dqNC2VxIvoxnmuKnoxHqnMzrZexTC3BgmKw4UaVbzaXeQBJ
	 B6f+Mv3rpu2fy/t4RepSunU//Sh19diXRt6+QRJei7ZnKj4S0mQWvdaW5N7T+FjCbG
	 GSX3UJWuEeJXu9mYE72Xvcd+bNDiy5YApMx90UlJQ/yYWrl6hLQBzlHKSG5XD47GuU
	 bEh0NSUo7ydnLTJJmDv28S7aT9QHsm37Gts2b7Qdx5pbJrqevvECI9ffLoesJtPjZc
	 SRKj6ZCh3EmPQ==
Date: Fri, 29 Jan 2021 15:30:05 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Roman Shaposhnik <roman@zededa.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, jbeulich@suse.com, 
    andrew.cooper3@citrix.com, roger.pau@citrix.com, konrad.wilk@oracle.com, 
    wl@xen.org, george.dunlap@citrix.com, sstabellini@kernel.org
Subject: Re: Troubles analyzing crash dumps from xl dump-core
In-Reply-To: <CAMmSBy-wXf+YHa_m1N37537EQfUrs8RVi2i=Ur6yXGtJV_bCgQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2101291522080.9684@sstabellini-ThinkPad-T480s>
References: <CAMmSBy-wXf+YHa_m1N37537EQfUrs8RVi2i=Ur6yXGtJV_bCgQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

CCing a few maintainers that might know something about this


On Fri, 29 Jan 2021, Roman Shaposhnik wrote:
> Hi!
> 
> I'm trying to see how much mileage I can get out of
> crash(1) 7.2.8 (based on gdb 7.6) when it comes to
> analyzing crash dumps taken via xl dump-core (this
> is all on x86_64 with stock Xen v. 4.14).
> 
> The good news is that the image actually does load
> up but it throws the following WARNINGs in the process:
> 
> WARNING: cannot access vmalloc'd module memory
> crash: read error: kernel virtual address: ffffffff93613480  type:
> "fill_task_struct"
> WARNING: active task ffffffff93613480 on cpu 0 not found in PID hash
> crash: read error: kernel virtual address: ffffffff93613480  type:
> "fill_task_struct"
> WARNING: cannot read log_buf contents
> 
> And then the info that it gives me around basic things like
> ps, mod, log, etc. is really super limited (and I am now suspecting
> may even be wrong).
> 
> Since I was primarily after dmesg/log initially, I tried:
> crash> log
> log: WARNING: cannot read log_buf contents
> 
> Then I tried taking an xl dump-core from the domU that was still
> very much alive and happy and got similar results -- so it clearly
> doesn't seem to be related to the state domU is in.
> 
> As matter of fact, I actually got to the desired dmesg output
> by simply running strings(1) on the core file -- so the info is
> definitely there -- but I guess some kind of index/reference maybe
> broken.
> 
> With all that in mind, if there's anyone on this ML who has recently
> done Xen DomU crash dump analysis -- I would definitely appreciate
> the pointers!
> 
> Thanks,
> Roman.
> 

