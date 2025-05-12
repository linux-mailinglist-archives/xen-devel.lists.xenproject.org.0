Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBCBAB4546
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 21:58:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982171.1368732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEZIV-00005F-0o; Mon, 12 May 2025 19:58:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982171.1368732; Mon, 12 May 2025 19:58:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEZIU-0008Ve-Rv; Mon, 12 May 2025 19:58:46 +0000
Received: by outflank-mailman (input) for mailman id 982171;
 Mon, 12 May 2025 19:58:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xFmg=X4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uEZIS-0008VY-Hd
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 19:58:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81303be0-2f6b-11f0-9eb6-5ba50f476ded;
 Mon, 12 May 2025 21:58:42 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 984894EE7BD4;
 Mon, 12 May 2025 21:58:41 +0200 (CEST)
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
X-Inumbo-ID: 81303be0-2f6b-11f0-9eb6-5ba50f476ded
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1747079921;
	b=dvBOSiPd7+CC0hMUYDV6HlpdI9wxv/KSPOziqznBXXohfDeiuGrWiMrPNCIOdZHLSRZN
	 +/IHwcN3oEZcILLKeYU6BjHA4ucaMeeQXpge9oRFn2tldWooYzpJEgiLxrmEaUyC6gEVl
	 E5b11nJ3y3Lo+YP9BUCJAta0BGprcHTHYR9aVm5OxHtOGaPKCMNOLoXhdPRbbCHsz4GV9
	 N9DZd2Uus9x1EF08FSqcUyyaitSYTk5besnTdi6td3cAYX+4rOWpFwJJesslkHra8pb14
	 s7gEYWdtPsQ3YfBk4v7MPrj90HTCbdWbCyAGIlDQt/O0EDwLSr3sbNgjm00BPjJj7SnRx
	 7O2f+NUZUr3+dirI/GLJm6LXqeBwdjtMGyj/5mbfOwKBiJOqhHy2rxyggwtTaJPVKOUdH
	 SQCEGCyhwtJBJULk6hh9QJkxQR8ByIlp8EmxFS8KeSUKKz3nybJ6yydPpkl14lsEtZbyL
	 6SHO9G1UKaetRy2BMT6l28bVK/gMihLrLEoEhreLHVu3kf7/dbC74gammcZjGEjt6tU3D
	 LPS3eIExEwKxjXlJ/MR5291Cr+2+1HGANDeSP+itl4UpvNqeIlIWXduuNTSNiONuTAZCE
	 QEaVHmsY1NsaKJY+FjoE4WFPFxaY9whT0CJU6KYhAbTy8vBhDHMgrUksZgDNFSk=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1747079921;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=hR+3qkPcfLW/IX3IURdsuWso1H/te0G+BUEbl/2Gy1Q=;
	b=PPkyTUwpmGOtS7oNaz5J2vqqoAyBZ8v0UwIS+OJnsMv5J9qSjXsNvwq35DXhfBgaPk0w
	 abp9dxc6Trq1VUxTvlshU5lOo4rjHLU9ZfYEqbmnWwDvxf/C9sePCXPjsaHZij5ZFu8vP
	 uDDSqxc11b8sDSh4nPRnGkJBG0GauGK2nUqmgzyzolZBUCbuanr+/7YEgtomP5E+076vK
	 0ACc41mt4L6IJ76sOrgOYLMmu+mQh/XBNgWVMBeAyie1uiDfa/nWWriANYwRtXg4cTWtJ
	 UfuZPezH5c+XqRp5VxFRld5I7DWLpN/zlmbocg6cHT1Dxdjuz6K6u5oQhjYj5HWxX/qy9
	 wL+EvmfMCNbGl/1+cYH4wXU8MvQKYfPkl5C9w5a1iz1VTXz2juW7BcJ6DIWQVrgWAh6w8
	 UkIizazmJwauFIrKfsDlaezr0AaAgkmh8YKX1VJWKiIv+6Kr4qBB9rlRRs4rwcNd+B/dt
	 XnPxfR86pCK+dMJGsiKzXPkjqJmzYCS/ANmnUVFdbJ5viGTz6gaH06nBHZWhbMpMq/oqw
	 nb4JM4Dskzm85D9Lzi8lCPm/mG77F3iWusvhzh7vzEoTPkb4FZLmFVLJVM7cTfndWBJim
	 KqJGCLnMClqCTR8t47ZkBY+LzC7h1IuMQyu1W4WsFrE21tJb66viKhdApZdhdzU=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1747079921; bh=hcd7wQmJhh6MtgN4rwVGiFoEBqI4jUsM/KzB0GxjYII=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=P9qDIyiq4ftq+9djKYWiPSp/1ZumfA9pDUKFs01wF/YYVK6e+rBEjcU2wJvZUjSJC
	 GMJhGgdO5oMYiygdzJyNZjFDNmw+MzaJfd31YQJTvkDw5pycDx7htuKpjcYcULXe83
	 nZFsZBmH1SQZXvqeZ0vQoWEd/PRoBLKHHtcb4x+r+M84c0Jiy9LsNbYdhHq/MmSY8h
	 LgyE4SwzArlzf7P+CaYy588MIyzy03eNfHO9HlR7Zzl6dy+rV1Aj2pg2kf3rwFeiEp
	 M+41gleR3G17KX0nSPeOeGchoADQeRzc3/0E8tRw39uYbzoHVub2tsmi3wX7IrulAX
	 kC93I/HkSPVAA==
MIME-Version: 1.0
Date: Mon, 12 May 2025 21:58:41 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
 <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger?=
 =?UTF-8?Q?_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Roberto Bagnara
 <roberto.bagnara@bugseng.com>, "consulting @ bugseng . com"
 <consulting@bugseng.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen: Use __auto_type
In-Reply-To: <aCI9MZRN1A753Nw9@mattapan.m5p.com>
References: <20250505124646.1569767-1-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2505051244090.3879245@ubuntu-linux-20-04-desktop>
 <548430a5-fa4a-41d1-b5ba-ba45efa90bbc@suse.com>
 <7acc83a3-2b15-4557-b293-0832b35e3680@citrix.com>
 <35826c2a-4266-49d2-b1b8-1248aac227b5@suse.com>
 <aCI9MZRN1A753Nw9@mattapan.m5p.com>
Message-ID: <9b616ece73d57d8bf5f524e50da14640@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-05-12 20:25, Elliott Mitchell wrote:
> On Mon, May 12, 2025 at 03:00:18PM +0200, Jan Beulich wrote:
>> On 12.05.2025 14:09, Andrew Cooper wrote:
>> >
>> > Now for the (new) controversial part.  Since sending this, Linux has
>> > decided to just #define auto __auto_type for C < 23, in order to start
>> > writing C23 compatible code from now.  It's more succinct, and has
>> > better longevity.
>> >
>> > We might want to consider the same, although it will introduce a new
>> > example of defining a keyword, which we'd have to call out in the
>> > MISRA/Eclair config.
>> 
>> I'm not outright opposed, as I don't think we use "auto" with its
>> original semantics, but it feels somewhat odd.
> 
> Problem is "auto" already has a defined meaning in C.  Having this will
> subtly break contributions from authors who weren't familiar with
> everything in Xen's headers.  For anyone who does anything with 
> projects
> besides Xen this will encourage bad habits.
> 
> I believe many projects have a rule of *never* #define C keywords.  I'm
> surprised such made it into the Linux kernel.  I expect it will be 
> ripped
> out in the near future.
> 
> MISRA *doesn't* absolutely forbid this?

It does, and in fact I don't think that is a wise decision (it's not 
quite UB I think because Xen does not use standard library headers, but 
still). However Xen does already #define "inline" with a specific 
rationale. I could find only [1] as a reference to the discussion in 
Linux, but perhaps I missed something. Do you have more recent thread 
@Andrew?

[1] 
https://lore.kernel.org/lkml/d4f87590-6cbb-4ee9-bead-7d958fc1fa83@p183/#R

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

