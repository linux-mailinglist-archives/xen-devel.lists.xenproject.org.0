Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66926600CE2
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 12:52:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424329.671666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okNit-0005bm-JR; Mon, 17 Oct 2022 10:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424329.671666; Mon, 17 Oct 2022 10:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okNit-0005Zd-Gg; Mon, 17 Oct 2022 10:51:55 +0000
Received: by outflank-mailman (input) for mailman id 424329;
 Mon, 17 Oct 2022 10:51:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6pfM=2S=leemhuis.info=regressions@srs-se1.protection.inumbo.net>)
 id 1okNis-0005ZX-OQ
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 10:51:54 +0000
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [2a01:488:42:1000:50ed:8234::])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5b69ef8-4e09-11ed-91b4-6bf2151ebd3b;
 Mon, 17 Oct 2022 12:51:53 +0200 (CEST)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1okNin-0000rH-GA; Mon, 17 Oct 2022 12:51:49 +0200
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
X-Inumbo-ID: b5b69ef8-4e09-11ed-91b4-6bf2151ebd3b
Message-ID: <402ab0ef-8bea-6210-1585-2e0e217a2e08@leemhuis.info>
Date: Mon, 17 Oct 2022 12:51:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: Bug 216581 - Kernel panic on /init as busybox symbolic link with
 xen efi
Content-Language: en-US, de-DE
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Denis Chancogne <denis.chancogne@free.fr>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e2cf3207-e9e9-5585-1a6e-9b39d96b4b54@leemhuis.info>
 <Y0ygiO3kuazXWSfZ@mail-itl>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <Y0ygiO3kuazXWSfZ@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1666003913;670af1f6;
X-HE-SMSGID: 1okNin-0000rH-GA

On 17.10.22 02:23, Marek Marczykowski-Górecki wrote:
> On Sun, Oct 16, 2022 at 01:08:53PM +0200, Thorsten Leemhuis wrote:

>>>  Denis Chancogne 2022-10-13 22:00:19 UTC
>>>
>>> when I start Xen 4.15.3 in efi with kernel 5.18.19, all works well;
>>> but since kernel 5.19, I have a kernel panic on my /init process as
>>> busybox symbolic link inside initramfs.
>>>
>>> This is the kernel log :
> [...]
> 
> Thanks for forwarding.
> 
> This is already fixed on the Xen side: https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=c3bd0b83ea5b7c0da6542687436042eeea1e7909
> The commit is also in 4.15 branch already:
> https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=7923ea47e578bca30a6e45951a9da09e827ff028,
> to be included in 4.15.4 rather soon.

Hmmm. Well, strictly speaking this is still a kernel regression that
should be fixed (or worked around) on the kernel level. But 5.19 is out
for a while already and this afaics was the first report of this problem
in kernel land. Maybe it's not worth it, so let's leave everything as it
is for now, if that's okay for Denis. We IMHO will need to reconsider if
more users run into this.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.

#regzbot introduced: 8ad7e8f69695
#regzbot invalid: it is a kernel regression, but one that can be worked
around by updating Xen hypervisor


