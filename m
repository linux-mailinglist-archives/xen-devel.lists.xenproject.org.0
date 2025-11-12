Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2392C51CD3
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 11:58:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159789.1488101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ8Yh-0003aJ-0r; Wed, 12 Nov 2025 10:58:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159789.1488101; Wed, 12 Nov 2025 10:58:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ8Yg-0003Xt-Tr; Wed, 12 Nov 2025 10:58:38 +0000
Received: by outflank-mailman (input) for mailman id 1159789;
 Wed, 12 Nov 2025 10:58:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=76yT=5U=bounce.vates.tech=bounce-md_30504962.6914685b.v1-68640975b6574f6b8a5b1d3da2c2f2b5@srs-se1.protection.inumbo.net>)
 id 1vJ8Yf-00033O-Ii
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 10:58:37 +0000
Received: from mail136-17.atl41.mandrillapp.com
 (mail136-17.atl41.mandrillapp.com [198.2.136.17])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 895d6952-bfb6-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 11:58:36 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-17.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4d60kg19pxzPm0ZNG
 for <xen-devel@lists.xenproject.org>; Wed, 12 Nov 2025 10:58:35 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 68640975b6574f6b8a5b1d3da2c2f2b5; Wed, 12 Nov 2025 10:58:35 +0000
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
X-Inumbo-ID: 895d6952-bfb6-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1762945115; x=1763215115;
	bh=tBMtXLUrgGGGSeKU3UBukiIF2xYXSSZmdQGOIQ0dPwI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=NX4L6NBSPxfbqhJ0pUjK/vh6oJQxscppgq04n9B1iiXJ+dtfKAl6fTOJbpI+BFSFJ
	 gxWg6+N5JouZ7m/8tUgGWuSN66EF76FYQ3VKW/in52iExWBqVHtKj0098xHwcn3p8z
	 jtZM5BPtVfJiZE0NdcYwxd9GRs3bVVUIyOEDvNS5equ2TzzDP7gcKiUsMiFujRhl5H
	 gj0fZ1tsbkVylrtqToGOd0X/r+JPAWnuCgRFsFFHA/EMYfwdOOaY1heQVeQfE6aEm3
	 JvIoYMuT0vb92sEs/EmLgvh9LYRVkMp15UwFmxQpJMCfWJOk5PDzj/pRDwqiTGc08V
	 zu/EFoK0c7dcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1762945115; x=1763205615; i=teddy.astie@vates.tech;
	bh=tBMtXLUrgGGGSeKU3UBukiIF2xYXSSZmdQGOIQ0dPwI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ZARYiMwDH6UoMyNcgvdyd8iZF+XgZXWLkC7UnCfSycYKZSnGD0hzIRjnwA63NDjUA
	 HYepfdOza5bO61jCdrx6RXoL0LPouby3JE3Z0vpwCJHxnn5ArnZJU7VI2gl3W31l5Y
	 2Bvndz19dJGuT8sPGy2leAUJg6gQ5jYNP0YVZmJqP8AH0h68DkOa2HQ4ReatWEoalQ
	 R0mmY0x7TsfUNgkZLalKSAfusP7AUtoqx82X9VvfSNlz1iYnVd/I6e9F9KXu9px0+W
	 WwllN5eGcsTZ6XBNiywsmPK+EdCnJzuUiVn+6kfFtU9ERg5WoDNbigEKB5/Xmxp8hW
	 5tI/JSoIZhImA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN][PATCH=200/5]=20x86:=20pvh:=20allow=20to=20disable=2032-bit=20(COMPAT)=20interface=20support?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1762945113454
Message-Id: <fa98c390-db6a-4b3a-b34c-820625f139a4@vates.tech>
To: "Grygorii Strashko" <grygorii_strashko@epam.com>, xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>, "Jason Andryuk" <jason.andryuk@amd.com>
References: <20251111175413.3540690-1-grygorii_strashko@epam.com>
In-Reply-To: <20251111175413.3540690-1-grygorii_strashko@epam.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.68640975b6574f6b8a5b1d3da2c2f2b5?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251112:md
Date: Wed, 12 Nov 2025 10:58:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 11/11/2025 =C3=A0 18:55, Grygorii Strashko a =C3=A9crit=C2=A0:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Hi
> 
> This series introduces possibility to disable 32-bit (COMPAT) interface s=
upport
> in the following cases:
>        - Only PVH domains are used

I assume this one is mostly due to hvmloader being today running in 
protected mode 32-bits rather than a limitation "HVM" itself. I don't 
think of anything else preventing HVM (with 64-bits guests or 32-bits 
ones without Xen support) from working with COMPAT disabled.

>        - Guests (OS) are started by using direct Direct Kernel Boot
>        - Guests (OS) are 64-bit and Guest early boot code, which is runni=
ng not
>          in 64-bit mode, does not access Xen interfaces
>          (hypercalls, shared_info, ..)
> 
> If above criterias are met the COMPAT HVM interface become unreachable an=
d can be disabled.
> Coverage reports analyze and adding guard (debug) exceptions in hvm_hyper=
call/hvm_do_multicall_call
> and hvm_latch_shinfo_size() confirm that COMPAT HVM interface is unused f=
or safety use-case.
> 
> Grygorii Strashko (5):
>    x86: hvm: dm: factor out compat code under ifdefs
>    x86: hvm: compat: introduce vcpu_is_hcall_compat() helper
>    x86: hvm: factor out compat code under ifdefs
>    x86: pvh: allow to disable 32-bit interface support
>    x86: constify has_32bit_shinfo() if !CONFIG_COMPAT
> 
>   xen/arch/x86/hvm/Kconfig          | 19 +++++++++++++++-
>   xen/arch/x86/hvm/dm.c             |  2 ++
>   xen/arch/x86/hvm/hvm.c            | 22 +++++++++++++-----
>   xen/arch/x86/hvm/hypercall.c      | 37 +++++++++++++++++++++++--------
>   xen/arch/x86/hypercall.c          |  6 +----
>   xen/arch/x86/include/asm/domain.h |  3 ++-
>   xen/common/kernel.c               |  2 +-
>   xen/include/xen/sched.h           |  9 ++++++++
>   8 files changed, 78 insertions(+), 22 deletions(-)
> 

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



