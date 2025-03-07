Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BEBA572BC
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 21:09:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905348.1313207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqe06-00007t-43; Fri, 07 Mar 2025 20:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905348.1313207; Fri, 07 Mar 2025 20:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqe06-00005m-1I; Fri, 07 Mar 2025 20:08:54 +0000
Received: by outflank-mailman (input) for mailman id 905348;
 Fri, 07 Mar 2025 20:08:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=siCl=V2=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tqe03-00005g-PO
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 20:08:52 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5eb0afd-fb8f-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 21:08:39 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id AF3FA4EF40C8;
 Fri,  7 Mar 2025 21:08:38 +0100 (CET)
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
X-Inumbo-ID: f5eb0afd-fb8f-11ef-9898-31a8f345e629
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1741378119;
	b=SOdJwn+IswVoQGeRAlQrOe2TIeOTAv9RDM1TY6RUSznvuEZnAuFQ7gbUVRUwiGXAT5nM
	 AMUfHt+LYka887/7yCvj5pygKk02YX+Ay3fzOOlCY1g8tYTS2ZP6dS/CpHaBdYBbGrubz
	 p8jvkMr24lZMvZnAbpfEpmEtrowyhqebRD1B3eB1Xr4YtjeHMgoiBOExc+hT7eBhAJqv8
	 X9e8mUbpZ776Skh+TJR15J1vD4Wmd3nQCNv/Ym/V69IGcxh5iyx8GX/Un//sofftj6tdI
	 nvqM+ZzpIRFMQlr/w4/+qfaxF7twN0HaFeSRzumb+Bc/BmdMm6LceRgtsUJ9kMBrvRn3O
	 EKafjx6F68ROl/nfOmqDj8NDHWdg8StfqrEJHMZHR0mZ99PsGSz5sArjp2/VEWRF5u3SI
	 D+djkIwkEgEpxGjA5JSWo+2CcsHiG8NKBUTK2xsmxxAgBtrDJj4UDA6uiiy+ZiGiMYBOT
	 azqNxmAmr8W8nKxWR9ZVHkrGT9V3IXN9sClldYbgijGl/uZUn3lUdJv5T/4rDRQTwSiza
	 bNM4x9SWuvV8PyXl+Kj+PZaFvGoB2xkaJIoTP2bdGw1cb2VK/nl8bJ4lWCFer/hWiKk2d
	 yKcw/CSATlzPh5jx++mgPmsAl5AqKSrBUuvFQAhezP1EI2ZshZJ2X0KC0LtSHd4=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1741378119;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=aPqu49HRDz5buvYMOPIIYA0uxJGcIu1ZYKxWBLXBdAo=;
	b=T1XDAZLiDgsDMbP2AJKLY58L1C+gaRHcMAOyDZ98VQLNr2+PDwUrtQ73EgsV201YL+uG
	 A4r1LgfWWHr7spQxEGR+44jDTt7L3EmfDaaGSc1EGfguanAS42IGQqC+AW8XfSc8P02dN
	 7f3WBQTyQQgbNM/zrT0m7xp3m8KymimJyN58VtoFc1oIZjwF2hmmGC09a33DlFdrCwBJf
	 Gyw/BPko7SY/mAjlkPJ6QkVmlkxD5QvrWNH1WaVNat6JS8TKda+ZzC3P7NY7kECNOI5+F
	 Us2ZglrHMC+UubJWECq4/FC344vtdoAZIjCzVv5057tz4IDbVS20dR42K5O3p1HrNTl/l
	 jj60XzfzfeLax1fSgkq2AdkzQpCohFboYbO+NsVfNBhQrczOm97xy0GUUFTfo5z86D6hm
	 zCThAmkXq505LV+8wl0vPcThRFyRpD1dYHAt0CS4LiwINHxgUQgrOw7VVglt+7hM8Z7qQ
	 WA2Ak0qtHd3gbGscV5u3U0V84zq9R2u+5xqe2DlpyWQAWEvUWyqHNCRbh99TQtthmRJP2
	 sSCTCx3VXJjdc9HCavrrsBgiDR7ogPejE183LMKWyQZftg4604VO3AJA7GawzoluntqbO
	 kKjQJxsGWHDxIIhpjIm02YmHss51SJP4L/fTrMywMPZ+9jex6jgAcpyCb9Qv7xY=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1741378119; bh=lpFWD91CDiyhBzb3t/QG4dUPbF/9wJzNwwYJ8cOIYRE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XzGWVMdqs+sQHSWSCDkTGqoSsTeSpw1k3GAtgZtav6ZfRhdjpzFWUwVeSlwYug97w
	 RKC5ghCUTdCEgb6BZaOXx3hF/tArJuH+mwjGTEYRfp7nI8HIzESXkeiFHO8Gvnu2PV
	 X0JGwtxJ1U3El4bzx1AgZZTE/ZYjQ+5A02XKfLKlOu6yWw4D9Umx5asH5QLnl/utTo
	 8qhQqKpz+cPUTNQqMnfvdkS+lrx4fCYD3/Bf3J6fF7v8YsWaqfwONJ78zrdN7SWgKm
	 S8PZO5GgsgK4oiyVPU0nPv2GGtkLp9fkra/dFa933ql84GTA32mMfuWVhPIsmu87Us
	 cp5T4cExfzYpg==
MIME-Version: 1.0
Date: Fri, 07 Mar 2025 21:08:38 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Oleksii Kurochko
 <oleksii.kurochko@gmail.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>
Subject: Re: [PATCH] xen: Update minimum toolchain requirements
In-Reply-To: <307ce623-9cb1-4dc1-beb9-abd78fc1f61d@citrix.com>
References: <20250307175435.3089686-1-andrew.cooper3@citrix.com>
 <2aaa6042ec9f6220e6229878a13a714b@bugseng.com>
 <307ce623-9cb1-4dc1-beb9-abd78fc1f61d@citrix.com>
Message-ID: <9ef23d76ac1d41a93573d8064ded8590@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-03-07 19:30, Andrew Cooper wrote:
> On 07/03/2025 6:22 pm, Nicola Vetrini wrote:
>> On 2025-03-07 18:54, Andrew Cooper wrote:
>>> and these too, but will require MISRA adjustments:
>>> 
>>>  * _Generic() to make properly const-preserving wrappers
>> 
>> Perhaps stating something that is already well-known, but this
>> effectively means moving from MISRA C:2012 Amendment 2 as a target to,
>> at least, MISRA C:2012 Amendment 3, as that version contains rules in
>> series 23 for _Generic.
> 
> Yes, I was expecting something along these lines.  It's also why I 
> don't
> suggest we start using it immediately.  (There's *loads* of non-MISRA
> related work to do when these changes get accepted.)
> 
> 
> Part of the justification for doing the MISRA work upstream was so it
> could stay "clean" on an ongoing basis.  The corollary to this is that
> our choice of MISRA standard needs to adapt as upstream Xen changes.
> 
> 
> Do you have any insight on how disruptive this would be?  I presume 
> it's
> not as simple as running sed over our docs and Eclair config, but I 
> also
> don't imagine it's a giant task either.
> 

Yes, indeed. I needs a global re-evaluation due to new rules being 
introduced (e.g. _Noreturn handling gets its own rules in Amendment 3) 
so those would need to be discussed in-depth, but the impact is probably 
not dramatic overall in terms of configuration changes, as most of the 
rules are unchanged.

> ~Andrew

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

