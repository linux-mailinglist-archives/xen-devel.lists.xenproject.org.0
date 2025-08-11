Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC70B202F9
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 11:14:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077146.1438222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulOax-0002rx-4Z; Mon, 11 Aug 2025 09:13:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077146.1438222; Mon, 11 Aug 2025 09:13:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulOax-0002q1-1W; Mon, 11 Aug 2025 09:13:31 +0000
Received: by outflank-mailman (input) for mailman id 1077146;
 Mon, 11 Aug 2025 09:13:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nn8B=2X=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ulOav-0002pv-64
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 09:13:29 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ea06e2d-7693-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 11:13:23 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 50C524EE0744;
 Mon, 11 Aug 2025 11:13:22 +0200 (CEST)
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
X-Inumbo-ID: 6ea06e2d-7693-11f0-b898-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1754903602;
	b=vzrh74IgDLvYH0LeuDF09Zzm2GDPczQPWQ31fQxjSW+F7l1yIeQ+Y5rGO3niIJeMS8DN
	 LPYt5pG9Wm8oj2rAM2PCITjwlb+NMbhWKQjm4WzeZUbllm8EpvtaALvdgu6VxHmYi7ant
	 tSUevFczpGrCxIshsKIZoNXrQFiFpxgglxV6cIji4S+qnJHknCFE+sd1XnKSME02s1TmV
	 fUSX5vJGV1hXulXRZjlzSpZj5O/HhldMnmswg7vYIysgH0l0V9qpry4+Hky5EqA7E8Qfx
	 Yp0pusnO7IWbpVDo6gobgYtljvz62qyzlylAAh+GaujtKNCD4MB/slQocLo9R/pY7JedD
	 oAdTOfkjW6KRpSimLfzwzhXDAZdjY+d0bvnUuhawiKLz1wtjN445O9tcgVWrYVUYQwIcy
	 opWxmIWXdN7JR2USb8h54Qcq707RaeAN+jnODOI9eKCbkg+D1xQOItHRpqOVMagPgJFCJ
	 0twHD42pB8AePdmSQVil/pBLuEQzbOoJTysT2ru5DvRtGGeRN5eq/WlHNybWJGKNkXK+c
	 6cIp9uC1Q1uEgLxR9wRoDznGJnNqtQo0M/FaAmntVVq2ITtiMb+YeAq6NA0JzQ4cYRhi9
	 77ov9+KKlLF5Ya0dRnr6Q5aEFoadhM5uNMNc7nqO+wAkbqPDXwpebyQ+OllFIGk=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1754903602;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=k8Qtvar8YbFN8TMOa5vQk7H+KLOwckI7poc6ZXfBqbU=;
	b=2VEuvT4ywPsj6ytq+o4KcJaSxJTBhmPF6VopKBdeZylIYS5aM3qzUtwciP4+U6nluE0h
	 nV6tRNmD6JJbRGWIQjgooSXOqdgdFtsEo3MkzxXK8OeYlMxRR/P8CNXZ300k4YlEzVDGO
	 0b99XqDFKN9I/4zl/U6aT9WC0hGYi6COENcJKmXTCpNB57/q9kzeXKkag6eNR5gkV9EkO
	 9DVBlyajoxKeabGZSIvFkJVB6Ez0N8gpiRY/VWqGtwMzn2Fu+OvajUAarAS+d3H2BpgKN
	 URRse/wZK9oe6XpuJBnbWyaoVlPj4ao2uvfvvVstFU5jmyUziWeIXneo/m9DARibIU7PM
	 8twkoGIuE/CkzXw4fa02xqA11TiWgtRafh+8QW8vLRoqlFZH4Cn6cMobIeVkZTnSh6sCC
	 PPbn6QUeHJgpf/aX4W6rtaMY7PSnuL3Gn6mSjJpZB3fvpINwhK/JE/wm2xTob87q4pBRT
	 soAXRji8k2L06OKg6ZcNCFKAzbp9oqljH/y1pmHwwaHNGOe8erQZNaFP28hXrCGEjL2xm
	 ygG2qshK122CMlZ9oiTdfvrarpqVDMZPApfwsXJcYtS5D2i5IDgFF5w1IIcBHEvItLhUU
	 geTHBgO1gsCxqSxzBSYB5pyZsg1cXPtCzUyJRY8J6x02bky/nMELPasFuxBFRNY=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1754903602; bh=sy4XWIXsvu+oCHkQjWNZTb2qFLKm/lHyRlC9QS4Llb8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=xDV675i5UnkevtsZ36AsRVeC9q25p9+q6yr6Q9jPhWma995RyhyNMI+A5f9F6NHX2
	 Bq33vAfARUU5U4HFfyNvYPf6dOQ/FQirMIDEqybx4qxfl17PKKIQLmaxVyGKbr2sWm
	 QLyB5PrSPkt/cGk/QfrNRUz50iJ+dazg35F7qszCt70xfk11856Q3rycT/7w+8IlBc
	 oWGpJWusvjg/l4zVUagh6a9BtZmmDdqLRB7Hd/JJYp2Y0Re+0WAx1hvg2CYIKTsr+h
	 Tx1vPM7rpZG2IHcffyQ9o2sfH7vDKsXAxoTcOWkU3FyATzYq0ozRpweoTqP1cq0KBK
	 eshh3ULkEDlKQ==
MIME-Version: 1.0
Date: Mon, 11 Aug 2025 11:13:22 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: nicola.vetrini@gmail.com, xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] xen: Drop logic for old clang versions.
In-Reply-To: <96b878a1-2a4e-4df3-900c-a2b2142f0638@citrix.com>
References: <e8bb42876317c19aca79f81c3fc48dc3a4fdaf71.1754830862.git.nicola.vetrini@bugseng.com>
 <96b878a1-2a4e-4df3-900c-a2b2142f0638@citrix.com>
Message-ID: <3a1fe9570bdaf5332c93a97c1da38255@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-08-11 10:07, Andrew Cooper wrote:
> On 10/08/2025 2:03 pm, nicola.vetrini@gmail.com wrote:
>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> 
>> The enforced toolchain baseline for clang is version 11,
>> therefore this logic is effectively dead code.
>> 
>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@gmail.com>
> 
> Thanks for the patch, but your From and SoB lines don't match.  Which 
> is
> it supposed to be?
> 
> ~Andrew

The gmail one, git misconfiguration, sorry. Should I resend?

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

