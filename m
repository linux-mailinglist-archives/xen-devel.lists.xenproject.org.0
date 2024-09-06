Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCCD96F17E
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 12:30:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791685.1201638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smWED-0001fj-Jn; Fri, 06 Sep 2024 10:30:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791685.1201638; Fri, 06 Sep 2024 10:30:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smWED-0001cY-GL; Fri, 06 Sep 2024 10:30:09 +0000
Received: by outflank-mailman (input) for mailman id 791685;
 Fri, 06 Sep 2024 10:30:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2ZT=QE=leemhuis.info=regressions@srs-se1.protection.inumbo.net>)
 id 1smWEB-0001cS-G5
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2024 10:30:07 +0000
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [2a01:488:42:1000:50ed:8234::])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb0d0213-6c3a-11ef-99a1-01e77a169b0f;
 Fri, 06 Sep 2024 12:30:05 +0200 (CEST)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1smWE7-0006ib-OL; Fri, 06 Sep 2024 12:30:03 +0200
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
X-Inumbo-ID: fb0d0213-6c3a-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=4zxx/jMsknAIv2RVTchdYDbtVepf8NTr2Pp5F/21wVY=;
	t=1725618605; x=1726050605; b=y4Kma1ym5+aPC4aR3eHeEGs9vNps/X3iSLOpWLc1s+wfPYL
	Wg9E7/UiwUHgo0EvMkIuRPI5+EJB5+k897T/UvLM14VvaU/WXQyaHAvAPYQaZQaPfC3mmfmCWq2Ih
	i3FEfo1vIgLeuRl7/1phqlua/eelrGAqR6lk8r3i8WcJ+s7rzI4HEJA/WSj5SIb1LlZigJKfeGqYq
	tjK3sfDHUGtEd8Fs4kUVjowoHvapDLQEW3hFhvnH6TCYL0ugi5ENYx62vD7Z2t9LL1BipESa8qO3O
	RjUvi9uO0Rp1qBWlJg3lwjL/2sLsRJOSHf4YEASOpcILKweE9uW8JJ+bAQtUbajg==;
Message-ID: <8e3afa4a-aca2-4803-886d-e162eb5e0478@leemhuis.info>
Date: Fri, 6 Sep 2024 12:30:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] kernel NULL pointer dereference in xen-balloon with
 mem hotplug
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 regressions@lists.linux.dev
References: <ZrSecpuTN9zgtqYu@mail-itl>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Content-Language: en-US, de-DE
In-Reply-To: <ZrSecpuTN9zgtqYu@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1725618605;631b3cf0;
X-HE-SMSGID: 1smWE7-0006ib-OL

On 08.08.24 12:31, Marek Marczykowski-Górecki wrote:
> 
> When testing Linux 6.11-rc2, I've got the crash like below. It's a PVH
> guest started with 400MB memory, and then extended via mem hotplug (I
> don't know to what exact size it was at this time, but up to 4GB), it
> was quite early in the domU boot process, I suspect it could be the
> first mem hotplug even happening there.
> Unfortunately I don't have reliable reproducer, it crashed only once
> over several test runs. I don't remember seeing such crash before, so it
> looks like a regression in 6.11. I'm not sure if that matters, but it's
> on ADL, very similar to the qubes-hw2 gitlab runner.

Marek, did this happen again or do things appear to be resolved? Asking
because I'm tracking this as a regression.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke


