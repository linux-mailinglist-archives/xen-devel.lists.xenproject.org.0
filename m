Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C7C67D6CF
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 21:50:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485223.752280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL9Bf-0002WB-Um; Thu, 26 Jan 2023 20:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485223.752280; Thu, 26 Jan 2023 20:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL9Bf-0002Tm-Rw; Thu, 26 Jan 2023 20:49:35 +0000
Received: by outflank-mailman (input) for mailman id 485223;
 Thu, 26 Jan 2023 20:49:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4vwE=5X=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1pL9Be-0002Tg-FU
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 20:49:34 +0000
Received: from ppsw-43.srv.uis.cam.ac.uk (ppsw-43.srv.uis.cam.ac.uk
 [131.111.8.143]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef74a9d0-9dba-11ed-a5d9-ddcf98b90cbd;
 Thu, 26 Jan 2023 21:49:33 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:33972)
 by ppsw-43.srv.uis.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1pL9Bc-000UNr-TI (Exim 4.96) (return-path <amc96@srcf.net>);
 Thu, 26 Jan 2023 20:49:32 +0000
Received: from [10.80.2.8] (default-46-102-197-194.interdsl.co.uk
 [46.102.197.194]) (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id D1B011FA26;
 Thu, 26 Jan 2023 20:49:31 +0000 (GMT)
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
X-Inumbo-ID: ef74a9d0-9dba-11ed-a5d9-ddcf98b90cbd
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <d0a0960a-f110-c065-753d-9f000ca379a9@srcf.net>
Date: Thu, 26 Jan 2023 20:49:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <930254a6-d0c8-4910-982a-bfd227187240@suse.com>
 <c39faba2-1ab6-71da-f748-1545aac8290b@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v3 3/4] x86: limit issuing of IBPB during context switch
In-Reply-To: <c39faba2-1ab6-71da-f748-1545aac8290b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/01/2023 3:26 pm, Jan Beulich wrote:
> When the outgoing vCPU had IBPB issued upon entering Xen there's no
> need for a 2nd barrier during context switch.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3: Fold into series.
>
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -2015,7 +2015,8 @@ void context_switch(struct vcpu *prev, s
>  
>          ctxt_switch_levelling(next);
>  
> -        if ( opt_ibpb_ctxt_switch && !is_idle_domain(nextd) )
> +        if ( opt_ibpb_ctxt_switch && !is_idle_domain(nextd) &&
> +             !(prevd->arch.spec_ctrl_flags & SCF_entry_ibpb) )
>          {
>              static DEFINE_PER_CPU(unsigned int, last);
>              unsigned int *last_id = &this_cpu(last);
>
>

The aforementioned naming change makes the (marginal) security hole here
more obvious.

When we use entry-IBPB to protect Xen, we only care about the branch
types in the BTB.  We don't flush the RSB when using the SMEP optimisation.

Therefore, entry-IBPB is not something which lets us safely skip
exit-new-pred-context.

~Andrew

