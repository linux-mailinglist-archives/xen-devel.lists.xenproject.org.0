Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EE0604D81
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 18:36:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425926.674075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olC2y-0001Wu-Hj; Wed, 19 Oct 2022 16:36:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425926.674075; Wed, 19 Oct 2022 16:36:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olC2y-0001UA-El; Wed, 19 Oct 2022 16:36:00 +0000
Received: by outflank-mailman (input) for mailman id 425926;
 Wed, 19 Oct 2022 16:18:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UZ99=2U=free.fr=denis.chancogne@srs-se1.protection.inumbo.net>)
 id 1olBli-0007UA-Er
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 16:18:10 +0000
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e9452e0-4fc9-11ed-91b4-6bf2151ebd3b;
 Wed, 19 Oct 2022 18:18:09 +0200 (CEST)
Received: from zimbra59-e10.priv.proxad.net (unknown [172.20.243.209])
 by smtp4-g21.free.fr (Postfix) with ESMTP id 0C8D819F5AF;
 Wed, 19 Oct 2022 18:18:08 +0200 (CEST)
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
X-Inumbo-ID: 9e9452e0-4fc9-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1666196288;
	bh=Pm/EqWEbJ0hJheqvBqZmNf9qn6cGXW/G7iT0GFcr5EY=;
	h=Date:From:To:Cc:In-Reply-To:Subject:From;
	b=G+SoyyooIx4gby1nJ7Fk7dFR/4C2USpgk9NFbtGHDXWEzc9oNrjBotZU43OtHCuh0
	 dfan4nUiccPx3gvmxzP4KXk0Pjhamo5LoL82PvyNKt6+xcqLuu2nNMx9nXHlJLmqcu
	 cHATROltxHcRaLTBRmVTO9oX7bVWTMlSkG+AfCXevWcHBENNkGsRmYUMgDkjWXYi6g
	 p+DanzlxvvgzF171TxwxHs91Hy4OuzPHyMIPRP+n1peqjJQoYMZUOKINUX7QzFOrCn
	 raQFH7s+Kzwz5XI5hmOyeUAC0/+whjpAc8EUbRXn9kAbgtVLbqIn8GE0HD3H8eSoHq
	 McSgEXpsNcd+Q==
Date: Wed, 19 Oct 2022 18:18:07 +0200 (CEST)
From: denis.chancogne@free.fr
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	regressions@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, 
	xen-devel@lists.xenproject.org, 
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Message-ID: <478267192.700718309.1666196287955.JavaMail.root@zimbra59-e10.priv.proxad.net>
In-Reply-To: <402ab0ef-8bea-6210-1585-2e0e217a2e08@leemhuis.info>
Subject: Re: Bug 216581 - Kernel panic on /init as busybox symbolic link
 with xen efi
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [90.83.51.20]
X-Mailer: Zimbra 7.2.0-GA2598 (ZimbraWebClient - GC80 (Win)/7.2.0-GA2598)
X-Authenticated-User: denis.chancogne@free.fr

>On 17.10.22 02:23, Marek Marczykowski-G=C3=B3recki wrote:
>> On Sun, Oct 16, 2022 at 01:08:53PM +0200, Thorsten Leemhuis wrote:
>
>>>>  Denis Chancogne 2022-10-13 22:00:19 UTC
>>>>
>>>> when I start Xen 4.15.3 in efi with kernel 5.18.19, all works well;
>>>> but since kernel 5.19, I have a kernel panic on my /init process as
>>>> busybox symbolic link inside initramfs.
>>>>
>>>> This is the kernel log :
>> [...]
>>=20
>> Thanks for forwarding.
>>=20
>> This is already fixed on the Xen side: https://xenbits.xen.org/gitweb/?p=
=3Dxen.git;a=3Dcommit;h=3Dc3bd0b83ea5b7c0da6542687436042eeea1e7909
>> The commit is also in 4.15 branch already:
>> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommit;h=3D7923ea47e578b=
ca30a6e45951a9da09e827ff028,
>> to be included in 4.15.4 rather soon.
>
>Hmmm. Well, strictly speaking this is still a kernel regression that
>should be fixed (or worked around) on the kernel level. But 5.19 is out
>for a while already and this afaics was the first report of this problem
>in kernel land. Maybe it's not worth it, so let's leave everything as it
>is for now, if that's okay for Denis. We IMHO will need to reconsider if
>more users run into this.
>
>Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>
>#regzbot introduced: 8ad7e8f69695
>#regzbot invalid: it is a kernel regression, but one that can be worked
>around by updating Xen hypervisor

Hi all,
thanks a lot for your responses, it's very well for me.
I will wait for xen-4.15.4 to use latest kernel release.
Regards
Denis

