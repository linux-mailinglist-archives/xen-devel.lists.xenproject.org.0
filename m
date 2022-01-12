Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C62348C0DA
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 10:17:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256410.439976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Zl0-0003E6-Ly; Wed, 12 Jan 2022 09:17:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256410.439976; Wed, 12 Jan 2022 09:17:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Zl0-0003BV-Io; Wed, 12 Jan 2022 09:17:26 +0000
Received: by outflank-mailman (input) for mailman id 256410;
 Wed, 12 Jan 2022 09:17:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BEGY=R4=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n7Zky-0003B6-Th
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 09:17:24 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72711b45-7388-11ec-9ce5-af14b9085ebd;
 Wed, 12 Jan 2022 10:17:22 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:47682)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n7Zku-000JHz-gl (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 12 Jan 2022 09:17:20 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 1177B1FB3A;
 Wed, 12 Jan 2022 09:17:20 +0000 (GMT)
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
X-Inumbo-ID: 72711b45-7388-11ec-9ce5-af14b9085ebd
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <30213d2c-37b4-43a1-b0a2-a596988e4c1b@srcf.net>
Date: Wed, 12 Jan 2022 09:17:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <87997f62-a6e2-1812-ccf5-d7d2e65fd50e@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH] x86/time: switch platform timer hooks to altcall
In-Reply-To: <87997f62-a6e2-1812-ccf5-d7d2e65fd50e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/01/2022 08:58, Jan Beulich wrote:
> Except in the "clocksource=tsc" case we can replace the indirect calls
> involved in accessing the platform timers by direct ones, as they get
> established once and never changed.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Sort of RFC, for both the whether and the how aspects.
>
> TBD: Overriding X86_FEATURE_ALWAYS is somewhat dangerous; there's only
>      no issue with e.g. hvm_set_tsc_offset() used later in time.c
>      because that's an inline function which did already "latch" the
>      usual value of the macro. But the alternative of introducing an
>      alternative_call() variant allowing to specify the controlling
>      feature also doesn't look overly nice to me either. Then again the
>      .resume hook invocation could be patched unconditionally, as the
>      TSC clocksource leaves this hook set to NULL.
>
> --- a/xen/arch/x86/alternative.c
> +++ b/xen/arch/x86/alternative.c
> @@ -268,8 +268,7 @@ static void init_or_livepatch _apply_alt
>               * point the branch destination is still NULL, insert "UD2; UD0"
>               * (for ease of recognition) instead of CALL/JMP.
>               */
> -            if ( a->cpuid == X86_FEATURE_ALWAYS &&
> -                 *(int32_t *)(buf + 1) == -5 &&
> +            if ( *(int32_t *)(buf + 1) == -5 &&

I'm afraid that this must not become conditional.

One of the reasons I was hesitant towards the mechanics of altcall in
the first place was that it intentionally broke Spectre v2 protections
by manually writing out a non-retpoline'd indirect call.

This is made safe in practice because all altcall sites either get
converted to a direct call, or rewritten to be a UD2.


If you want to make altcalls conversions conditional, then the code gen
must be rearranged to use INDIRECT_CALL first, but that comes with
overheads too because then call callsites would load the function
pointer into a register, just to not use it in the patched case.

I suspect it will be easier to figure out how to make the TSC case also
invariant after boot.

~Andrew

