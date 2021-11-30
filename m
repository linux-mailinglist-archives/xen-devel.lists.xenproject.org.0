Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0C44635CE
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 14:49:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235120.407962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms3Uz-0000kQ-NE; Tue, 30 Nov 2021 13:48:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235120.407962; Tue, 30 Nov 2021 13:48:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms3Uz-0000hB-JK; Tue, 30 Nov 2021 13:48:45 +0000
Received: by outflank-mailman (input) for mailman id 235120;
 Tue, 30 Nov 2021 13:48:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ICIV=QR=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1ms3Uy-0000h5-4g
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 13:48:44 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a5e68ac-51e4-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 14:48:42 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:50450)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1ms3Ut-000Vac-hB (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 30 Nov 2021 13:48:39 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 1F07E1FB4D;
 Tue, 30 Nov 2021 13:48:39 +0000 (GMT)
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
X-Inumbo-ID: 3a5e68ac-51e4-11ec-976b-d102b41d0961
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <17b42cc5-1979-f977-7c2e-a59fc97f87ea@srcf.net>
Date: Tue, 30 Nov 2021 13:48:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>
References: <9fd8ba19-9744-fa50-1afb-15fae8955cac@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH] x86/HVM: convert most remaining hvm_funcs hook
 invocations to alt-call
In-Reply-To: <9fd8ba19-9744-fa50-1afb-15fae8955cac@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/11/2021 09:04, Jan Beulich wrote:
> The aim being to have as few indirect calls as possible (see [1]),
> whereas during initial conversion performance was the main aspect and
> hence rarely used hooks didn't get converted. Apparently one use of
> get_interrupt_shadow() was missed at the time.
>
> While I've intentionally left alone the cpu_{up,down}() etc hooks for
> not being guest reachable, the nhvm_hap_walk_L1_p2m() one can't
> currently be converted as the framework supports only up to 6 arguments.
> Down the road the three booleans perhaps want folding into a single
> parameter/argument.

To use __initdata_cf_clobber, all hooks need to use altcall().

There is also an open question on how to cope with things such as the
TSC scaling hooks, which are only conditionally set in {vmx,svm}_hvm_funcs.

I was expecting to have to introduce a macro for per-function
registration in the cf_clobber section, given some of the lone function
pointers used with altcall().


As for >6 arguments, we really should discourage such functions
generally, because spilling parameters to the stack is not a efficient
thing to do in the slightest.


>
> While doing this, drop NULL checks ahead of .nhvm_*() calls when the
> hook is always present. Also convert the .nhvm_vcpu_reset() call to
> alternative_vcall(), as the return value is unused and the caller has
> currently no way of propagating it.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>.  However...

>
> [1] https://lists.xen.org/archives/html/xen-devel/2021-11/msg01822.html
> ---
> Another candidate for dropping the conditional would be
> .enable_msr_interception(), but this would then want the wrapper to also
> return void (hence perhaps better done separately).

I think that's a side effect of Intel support being added first, and
then an incomplete attempt to add AMD support.

Seeing as support isn't disappearing, I'd be in favour of reducing it to
void.  The sole caller already doesn't check the return value.


If I do a prep series sorting out nhvm_hap_walk_L1_p2m() and
enable_msr_interception(), would you be happy rebasing this patch and
adjusting every caller, including cpu_up/down() ?

> --- a/xen/arch/x86/monitor.c
> +++ b/xen/arch/x86/monitor.c
> @@ -270,7 +270,8 @@ int arch_monitor_domctl_event(struct dom
>          ad->monitor.descriptor_access_enabled = requested_status;
>  
>          for_each_vcpu ( d, v )
> -            hvm_funcs.set_descriptor_access_exiting(v, requested_status);
> +            alternative_vcall(hvm_funcs.set_descriptor_access_exiting, v,
> +                              requested_status);

(For a future change...)  It occurs to me that this wants to be:

for_each_vcpu ( d, v )
    v->arch.hvm.recalc_intercepts = true;

and leave the resume path to do the right thing.

While it's not a big deal for AMD, avoiding the line of VMCS loads on
Intel really is a big deal.

~Andrew

