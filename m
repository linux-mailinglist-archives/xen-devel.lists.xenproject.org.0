Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2798577505
	for <lists+xen-devel@lfdr.de>; Sun, 17 Jul 2022 09:56:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368962.600376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCz7Q-00041V-1I; Sun, 17 Jul 2022 07:55:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368962.600376; Sun, 17 Jul 2022 07:55:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCz7P-0003zG-T7; Sun, 17 Jul 2022 07:55:11 +0000
Received: by outflank-mailman (input) for mailman id 368962;
 Sun, 17 Jul 2022 07:55:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e3y1=XW=leemhuis.info=regressions@srs-se1.protection.inumbo.net>)
 id 1oCz7N-0003zA-PP
 for xen-devel@lists.xenproject.org; Sun, 17 Jul 2022 07:55:09 +0000
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [2a01:488:42:1000:50ed:8234::])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c574236c-05a5-11ed-bd2d-47488cf2e6aa;
 Sun, 17 Jul 2022 09:55:08 +0200 (CEST)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1oCz7G-0003PZ-5e; Sun, 17 Jul 2022 09:55:02 +0200
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
X-Inumbo-ID: c574236c-05a5-11ed-bd2d-47488cf2e6aa
Message-ID: <efbde93b-e280-0e40-798d-dc7bf8ca83cf@leemhuis.info>
Date: Sun, 17 Jul 2022 09:55:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/3] x86: make pat and mtrr independent from each other
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 x86@kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Cc: brchuckz@netscape.net, jbeulich@suse.com,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "# 5 . 17" <stable@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <20220715142549.25223-1-jgross@suse.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20220715142549.25223-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1658044508;3110b8b4;
X-HE-SMSGID: 1oCz7G-0003PZ-5e

Hi Juergen!

On 15.07.22 16:25, Juergen Gross wrote:
> Today PAT can't be used without MTRR being available, unless MTRR is at
> least configured via CONFIG_MTRR and the system is running as Xen PV
> guest. In this case PAT is automatically available via the hypervisor,
> but the PAT MSR can't be modified by the kernel and MTRR is disabled.
> 
> As an additional complexity the availability of PAT can't be queried
> via pat_enabled() in the Xen PV case, as the lack of MTRR will set PAT
> to be disabled. This leads to some drivers believing that not all cache
> modes are available, resulting in failures or degraded functionality.
> 
> The same applies to a kernel built with no MTRR support: it won't
> allow to use the PAT MSR, even if there is no technical reason for
> that, other than setting up PAT on all cpus the same way (which is a
> requirement of the processor's cache management) is relying on some
> MTRR specific code.
> 
> Fix all of that by:
> 
> - moving the function needed by PAT from MTRR specific code one level
>   up
> - adding a PAT indirection layer supporting the 3 cases "no or disabled
>   PAT", "PAT under kernel control", and "PAT under Xen control"
> - removing the dependency of PAT on MTRR

Thx for working on this. If you need to respin these patches for one
reason or another, could you do me a favor and add proper 'Link:' tags
pointing to all reports about this issue? e.g. like this:

 Link: https://lore.kernel.org/regressions/YnHK1Z3o99eMXsVK@mail-itl/

These tags are considered important by Linus[1] and others, as they
allow anyone to look into the backstory weeks or years from now. That is
why they should be placed in cases like this, as
Documentation/process/submitting-patches.rst and
Documentation/process/5.Posting.rst explain in more detail. I care
personally, because these tags make my regression tracking efforts a
whole lot easier, as they allow my tracking bot 'regzbot' to
automatically connect reports with patches posted or committed to fix
tracked regressions.

[1] see for example:
https://lore.kernel.org/all/CAHk-=wjMmSZzMJ3Xnskdg4+GGz=5p5p+GSYyFBTh0f-DgvdBWg@mail.gmail.com/
https://lore.kernel.org/all/CAHk-=wgs38ZrfPvy=nOwVkVzjpM3VFU1zobP37Fwd_h9iAD5JQ@mail.gmail.com/
https://lore.kernel.org/all/CAHk-=wjxzafG-=J8oT30s7upn4RhBs6TX-uVFZ5rME+L5_DoJA@mail.gmail.com/

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.

BTW, let me tell regzbot to monitor this thread:

#regzbot ^backmonitor:
https://lore.kernel.org/regressions/YnHK1Z3o99eMXsVK@mail-itl/

