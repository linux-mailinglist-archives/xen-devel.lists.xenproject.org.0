Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E93D48C0EA
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 10:23:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256414.439987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7ZqT-0004bf-BQ; Wed, 12 Jan 2022 09:23:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256414.439987; Wed, 12 Jan 2022 09:23:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7ZqT-0004Yi-7u; Wed, 12 Jan 2022 09:23:05 +0000
Received: by outflank-mailman (input) for mailman id 256414;
 Wed, 12 Jan 2022 09:23:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BEGY=R4=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n7ZqR-0004Yb-Ue
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 09:23:03 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ce9f228-7389-11ec-9ce5-af14b9085ebd;
 Wed, 12 Jan 2022 10:23:03 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:47142)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n7ZqO-000QjG-6l (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 12 Jan 2022 09:23:00 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id A7F4A1FD4A;
 Wed, 12 Jan 2022 09:22:59 +0000 (GMT)
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
X-Inumbo-ID: 3ce9f228-7389-11ec-9ce5-af14b9085ebd
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <a5af3a6a-da51-2624-622e-2566c8db7dce@srcf.net>
Date: Wed, 12 Jan 2022 09:22:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <01baee92-9d7f-5a2c-d63f-1de390bc10e2@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH] x86: replace a few do_div() uses
In-Reply-To: <01baee92-9d7f-5a2c-d63f-1de390bc10e2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/01/2022 09:00, Jan Beulich wrote:
> When the macro's "return value" is not used, the macro use can be
> replaced by a simply division, avoiding some obfuscation.
>
> According to my observations, no change to generated code.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I like this change in principle, but see below.

do_div() needs to be deleted, because it's far too easy screw up.  At a
bare minimum, it should be replaced with a static inline that takes it's
first parameter by pointer, because then at least every callsite reads
correctly in terms of the C language.

> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -610,8 +610,7 @@ static uint64_t xen_timer_cpu_frequency(
>      struct vcpu_time_info *info = &this_cpu(vcpu_info)->time;
>      uint64_t freq;
>  
> -    freq = 1000000000ULL << 32;
> -    do_div(freq, info->tsc_to_system_mul);
> +    freq = (1000000000ULL << 32) / info->tsc_to_system_mul;
>      if ( info->tsc_shift < 0 )
>          freq <<= -info->tsc_shift;

do_div()'s output is consumed here.  I don't think this hunk is safe to
convert.

~Andrew

