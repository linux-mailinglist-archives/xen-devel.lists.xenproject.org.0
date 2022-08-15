Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 375CF593448
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 20:02:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387750.624125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNeOe-00072l-EQ; Mon, 15 Aug 2022 18:01:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387750.624125; Mon, 15 Aug 2022 18:01:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNeOe-00070g-BW; Mon, 15 Aug 2022 18:01:04 +0000
Received: by outflank-mailman (input) for mailman id 387750;
 Mon, 15 Aug 2022 18:01:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q8TY=YT=leemhuis.info=regressions@srs-se1.protection.inumbo.net>)
 id 1oNeOc-00070X-FS
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 18:01:02 +0000
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [2a01:488:42:1000:50ed:8234::])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37b4c945-1cc4-11ed-bd2e-47488cf2e6aa;
 Mon, 15 Aug 2022 20:01:00 +0200 (CEST)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1oNeOJ-0003w4-L3; Mon, 15 Aug 2022 20:00:44 +0200
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
X-Inumbo-ID: 37b4c945-1cc4-11ed-bd2e-47488cf2e6aa
Message-ID: <a7d10605-87e3-c4bd-4a76-f07a04f5751c@leemhuis.info>
Date: Mon, 15 Aug 2022 20:00:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: [PATCH 0/3] x86: make pat and mtrr independent from each other
To: Chuck Zmudzinski <brchuckz@netscape.net>
Cc: jbeulich@suse.com, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, regressions@lists.linux.dev,
 xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Juergen Gross <jgross@suse.com>
References: <20220715142549.25223-1-jgross@suse.com>
 <efbde93b-e280-0e40-798d-dc7bf8ca83cf@leemhuis.info>
 <a0ce2f59-b653-fa8b-a016-1335f05c86ae@netscape.net>
 <32ed59c9-c894-c426-dd27-3602625cf3b1@netscape.net>
 <c88ea08c-a9d5-ef6a-333a-db9e00c6da6f@suse.com>
 <bd66b5bc-4d07-d968-f46c-40cf624499a7@netscape.net>
 <a29a66e0-2075-8084-84ad-8bd3e8a9fd4a@netscape.net>
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <a29a66e0-2075-8084-84ad-8bd3e8a9fd4a@netscape.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1660586460;a183e974;
X-HE-SMSGID: 1oNeOJ-0003w4-L3

Hi Chuck!

On 15.08.22 18:56, Chuck Zmudzinski wrote:
> 
> I am forwarding this to you to help you cut through the noise.

Sorry for not replying earlier, I ignored this thread and all other
non-urgent mail in the past two weeks: I was on vacation until a few
days ago and when I came home I had to deal with some other stuff first.

> I do not apologize for trying to get
> the fix for this regression rolling again.

Yeah, it's important to ensure regressions don't simply fall though the
cracks, but my advice in this case: let things rest for a few days now,
the right people have the issue on their radar again; give them time to
breath and work out a solution: it's not something that can be fixed
easily within a few minutes by one person alone, as previous discussions
have shown (also keep in mind that the merge window was open until
yesterday, which keeps many maintainers quite busy).

And FWIW: I've seen indicators that a solution to resolve this is
hopefully pretty close now.

>  After all, it has been over three months
> since the regression was first reported.

Yes, things take/took to long, as a few things were far from ideal how
this regression was dealt with. But that happens sometimes, we're all
just humans and make errors. I did a few as well and learned a thing or
two from then. Due to that I'll do a few things slightly different in
the future to hopefully get similar situations resolved a lot quicker in
the future.

Ciao, Thorsten

