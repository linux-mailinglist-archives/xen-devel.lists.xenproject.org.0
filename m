Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9227A72E3D
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 11:54:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928960.1331603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txksW-00041x-MA; Thu, 27 Mar 2025 10:54:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928960.1331603; Thu, 27 Mar 2025 10:54:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txksW-00040Y-Ip; Thu, 27 Mar 2025 10:54:28 +0000
Received: by outflank-mailman (input) for mailman id 928960;
 Thu, 27 Mar 2025 10:54:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U7fn=WO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1txksV-0003Qs-9C
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 10:54:27 +0000
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [2607:f8b0:4864:20::1035])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d96c995d-0af9-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 11:54:26 +0100 (CET)
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-301918a4e1bso1002084a91.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 03:54:26 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-3039dff05dcsm1879632a91.12.2025.03.27.03.54.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 03:54:24 -0700 (PDT)
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
X-Inumbo-ID: d96c995d-0af9-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743072865; x=1743677665; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z6Ndo5o+pNyllkjW6VmhkZUyWZsKBfypKrTaTbMACtE=;
        b=m2ykGkWj80LV3XgJv7WSnNSTaHHwc9UGSP7uOpM5LVwV96EmpYOtQgKkNXl1e9eqUd
         oD/y2dEXfzv1pEeTbTDWH0cvob+Fc40kN+LgotymqEP7dJ+az9EeUE1vUq31MqGiiDA5
         1OOccs5QYj/iyW0Ukxbih6Frq0XJmH3rh/CSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743072865; x=1743677665;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z6Ndo5o+pNyllkjW6VmhkZUyWZsKBfypKrTaTbMACtE=;
        b=ibYt0l4sGmkJdL40v6rCUxh8aohghS8x4Jyjp+c+iPACDO0Om5UEw2ygjmgFqXtlVJ
         XKTJyvutdGzP2ri65DCfQJrBcnmxsxKswpPvsozCo+1UUdXPCqBwLi/sIqv++iUJsbxB
         8u+gq79f6cpJ0kwdnbecbsl500IAZY384mx2gJkyQPe+N49Rh2klIw4Xvx0qC7SpqdF/
         K7XQDzFW6N9TrC1b/pl4d8o8cp0klH1wV1roIHAKTUqpwj6KkWow6dMBYa6LjK6yGuM/
         NM33WHrS6hN9cMxVSLjznvMS6/Uj1aKF/YDqSiRN6Nh+6TObq0zm/cfsl2XhBhamWfa7
         MV/g==
X-Gm-Message-State: AOJu0YwNouNs90MCZq98aH+5oWP79bwF+XEgeRqEXC38UKPhH/AtC0bP
	/hKwFRk5473+XpHPGqIqfAzL1d4sb1amSxmJ9EWBBFlKRHgQrbtVmeAfF0c7ylebErMOSnCCT2w
	F
X-Gm-Gg: ASbGncvW6u+ydGuk/ag8VS2uhH/sqn4PIG+QrnjRHhhA8Egng1oC0ATWhzi9oRaQweE
	of4LmsruqNpfTxvLfxeEyG57Pxm1E6PPtsEYziT1umnBz+BVMWdzGomaXldYJFoSTJi9hJ2VF/V
	R3Xc5twbSgiTUzGEiCjjJ7e6Wq3pyOea1jFPwQBQSqImXmI3hSRXmotD9lDRr587pd0tdTIDzU1
	880M5bo0cip+XI2kBzIl97uxtLzAQ+XkyowQcpHM/Hcgw/jxzdJP2cQreSayY1bJFAwBsi4QTfs
	a49LuuSQ240nk7uXy84MBhGRrMsPM6QoaI3qMgLhfKmYXU3Pj6sFOfd3KaF9
X-Google-Smtp-Source: AGHT+IH51D6F17gIDcJ2VfnMJkQR0xyHMEmEBOVXKSJluQjJIh2Tlq+TUkOTz//11/hqHYzOTFns7Q==
X-Received: by 2002:a17:90b:5686:b0:2ff:698d:ef74 with SMTP id 98e67ed59e1d1-303a906c60emr4083297a91.26.1743072865027;
        Thu, 27 Mar 2025 03:54:25 -0700 (PDT)
Date: Thu, 27 Mar 2025 11:54:19 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/CPU: don't hard-code MTRR availability
Message-ID: <Z-UuW35GKs4dK8VE@macbook.local>
References: <edecdda9-4728-4c65-9f31-76c912a433d7@suse.com>
 <Z-UKm6D9pmAEaE_9@macbook.local>
 <eb44921a-f6af-4aa9-9395-18e4e47d440a@suse.com>
 <Z-UfcHfHys6c0HZb@macbook.local>
 <90c81e5a-97d8-47b7-9cdf-aa07a59ed4f7@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90c81e5a-97d8-47b7-9cdf-aa07a59ed4f7@suse.com>

On Thu, Mar 27, 2025 at 10:59:58AM +0100, Jan Beulich wrote:
> On 27.03.2025 10:50, Roger Pau Monné wrote:
> > On Thu, Mar 27, 2025 at 10:15:03AM +0100, Jan Beulich wrote:
> >> On 27.03.2025 09:21, Roger Pau Monné wrote:
> >>> On Tue, Mar 25, 2025 at 08:18:11AM +0100, Jan Beulich wrote:
> >>>> In particular if we're running virtualized, the underlying hypervisor
> >>>> (which may be another Xen) may not surface MTRRs, and offer PAT only.
> >>>
> >>> At least for Xen, I think we offer MTRR uniformly, even on PVH
> >>> guests?
> >>
> >> By default we do, but we discussed the option of offering PAT-only environments
> >> beyond leaving it open whether people disabling MTRR support in their guest
> >> config are outside of supported terrain.
> >>
> >>>> Fixes: 5a281883cdc3 ("Hardcode many cpu features for x86/64 -- we know 64-bit")
> >>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>
> >>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> >>>
> >>> My main concern is whether the !mtrr path is still functional.  Have
> >>> you tried booting the resulting hypervisor with MTRR masked on CPUID?
> >>>
> >>> (or alternatively short-circuiting cpu_has_mtrr == 0?)
> >>
> >> I didn't think this would be a prereq here. If we boot in an environment truly
> >> lacking MTRR, we'll crash on the first MTRR MSR access - none of those accesses
> >> use the safe accessors.
> > 
> > Right, hopefully we don't have unprotected MTRR MSR accesses, so
> > cpu_has_mtrr == 0 should prevent those.
> 
> Actually we do, see my other patch just posted.

Oh, yes, that was one of my concerns, but I've failed to spot it.

> >> Since you asked, I tried booting with "cpuid=no-mtrr".
> >> As I'm doing this on a system with console, all I can say is that it takes
> >> minutes to reach the point where we'd start setting up Dom0 (which itself then
> >> takes so long that I timed out waiting for it to make progress), due to all
> >> screen output becoming unbelievably slow after AP bringup. Surely something's
> >> screwed somewhere, as VRAM accesses being slow (or fast) shouldn't depend on AP
> >> bringup having completed. I actually suspect it's not just VRAM accesses which
> >> are slow, but that we're left running in uncachable mode altogether for whatever
> >> reason.
> >>
> >> What this maybe useful for is to figure out the reason of "Platform timer
> >> appears to have unexpectedly wrapped <N> times", which I saw appear once.
> >>
> >> Given this, I'm actually uncertain whether it is legitimate then to take your
> >> ack.
> > 
> > I think it might be best if we can figure out what causes those issues
> > (and possibly fix them) before taking this patch?
> > 
> > Albeit you could argue that running excruciatingly slow is better than
> > just crashing of an unhandled #GP from a rdmsr.
> 
> Indeed that's my thinking. But if you prefer, I can wait with this patch until
> after the other one has gone in.

Given the small context of the other patch, you might as well put both
in together.

Thanks, Roger.

