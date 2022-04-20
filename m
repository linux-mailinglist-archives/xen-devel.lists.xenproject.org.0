Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4AA508F80
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 20:32:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309559.525895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhF7f-0006eJ-SN; Wed, 20 Apr 2022 18:32:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309559.525895; Wed, 20 Apr 2022 18:32:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhF7f-0006bL-OW; Wed, 20 Apr 2022 18:32:15 +0000
Received: by outflank-mailman (input) for mailman id 309559;
 Wed, 20 Apr 2022 18:32:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oHj2=U6=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nhF7W-0006aw-2N
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 18:32:13 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29762ed7-c0d8-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 20:31:58 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id o16so2927373ljp.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Apr 2022 11:31:58 -0700 (PDT)
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
X-Inumbo-ID: 29762ed7-c0d8-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+Uex363Ymu2/aIWQGUWWDZmYR1B14kPEYvn07kB6+6A=;
        b=mMGet4nXFP8hqh7DiRVCLuRx/7WbKcCcie4WDB7JF/uhVM7ehVcoIe0fhkcJbUEDyE
         bJ/WX4FZ/WlIegchNuGcMdv1YrssPw8vTfRnzFOfFBJtiN9Jag+adlbx5MYQKpl1bMHa
         IiNTzcL6tfB0YJwDalzcLHD6pHynHm3WbJhBuViusWLDOGT5xoPcSRiTFxXC1aj7ZU9+
         MAGh5Z+hUEHZdcFhjh5BJNUxWK92HwxG4X/LwhHARZFp6duizRt0eao2ES7T7N0Cfn9V
         BW6hNgNzqwec43vUNc47pP7IUal1933Lf8UDIcjb1d2wCMgsZEc9VIqy+CJ4/IAkx0U+
         q6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+Uex363Ymu2/aIWQGUWWDZmYR1B14kPEYvn07kB6+6A=;
        b=PHflpTadiLncvkWIvVMvcNFIG7gCtgUxCngt9NmHxuvn/MPs72FbF4i2lRWqXdSVbC
         vCQewWV1MCxcz9ItUfubqGvnnwqfsvg5Nn6RGLZWv7ZOJ/rcm9TNo7a3kZdLV4Vh1c6K
         O5miFTJXgW/G4rzje7+Rvn62WFkJ60xrUIudlnQr+WUhIhUp5CLBcQ+3I462rvfDDisQ
         /e3vCkSRn2xWar6J4kfyxYm/8gMMaaARYmWsPWTAgqpC4LMnYShSO8VtAuxBIJUGgGU2
         zcuUrNK4264+YyReE91zTfsHwsSAxJNnJJL1YjkxgXYXMBlcOrBgxJ8eqGCGArjOQukd
         FMsA==
X-Gm-Message-State: AOAM533VckYvseWXbwv66bRxknVg97T0vi534zmLYn2COMLcLxtBcTx+
	nGfdIbCEk6Zlvk9J5ioxSTHzBPUhjEKzy0IhJow=
X-Google-Smtp-Source: ABdhPJwy514BkdjW/oFG+ptq7vneO01CI5rBVbXtREs+KElvaanyesVY8fpaRZVfuiSMSvZchNmyWs480oiaqZ8QNQw=
X-Received: by 2002:a2e:9c02:0:b0:24d:bcbd:1c77 with SMTP id
 s2-20020a2e9c02000000b0024dbcbd1c77mr9570985lji.19.1650479517842; Wed, 20 Apr
 2022 11:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220420210407.18060-1-dpsmith@apertussolutions.com> <20220420210407.18060-2-dpsmith@apertussolutions.com>
In-Reply-To: <20220420210407.18060-2-dpsmith@apertussolutions.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 20 Apr 2022 14:31:46 -0400
Message-ID: <CAKf6xpsr_0m=tWMjVQsufxSJ52kz3QFzMJvVa0MEKLrtrVM9TQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] xsm: create idle domain privieged and demote after setup
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>, 
	Scott Davis <scott.davis@starlab.io>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, 
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 20, 2022 at 1:02 PM Daniel P. Smith
<dpsmith@apertussolutions.com> wrote:
>
> There are now instances where internal hypervisor logic needs to make resource
> allocation calls that are protectd by XSM checks. The internal hypervisor logic
> is represented a number of system domains which by designed are represented by
> non-privileged struct domain instances. To enable these logic blocks to
> function correctly but in a controlled manner, this commit changes the idle
> domain to be created as a privileged domain under the default policy, which is
> inherited by the SILO policy, and demoted before transitioning to running. A
> new XSM hook, xsm_transition_running, is introduced to allow each XSM policy
> type to demote the idle domain appropriately for that policy type.
>
> For flask a stub is added to ensure that flask policy system will function
> correctly with this patch until flask is extended with support for starting the
> idle domain privileged and properly demoting it on the call to
> xsm_transtion_running.
>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---

> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 6f20e17892..72695dcb07 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -621,6 +621,12 @@ static void noreturn init_done(void)
>      void *va;
>      unsigned long start, end;
>
> +    xsm_transition_running();
> +
> +    /* Ensure idle domain was not left privileged */
> +    if ( current->domain->is_privileged )
> +        panic("idle domain did not properly transition from setup privilege\n");

Checking immediately after the XSM hook seems redundant, though I
guess having a sanity check isn't harmful.

>  static void cf_check flask_domain_free_security(struct domain *d)
>  {
>      struct domain_security_struct *dsec = d->ssid;
> @@ -1766,6 +1780,7 @@ static int cf_check flask_argo_send(
>  #endif
>
>  static const struct xsm_ops __initconst_cf_clobber flask_ops = {
> +    .transition_running = flask_domain_runtime_security,

I'd prefer flask_transition_running.  That way grep for the hook name
also finds the flask implementation.

Regards,
Jason

