Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21601508F0C
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 20:08:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309551.525876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhEk5-0002j2-M9; Wed, 20 Apr 2022 18:07:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309551.525876; Wed, 20 Apr 2022 18:07:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhEk5-0002gv-IG; Wed, 20 Apr 2022 18:07:53 +0000
Received: by outflank-mailman (input) for mailman id 309551;
 Wed, 20 Apr 2022 18:07:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oHj2=U6=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nhEk3-0002gm-SJ
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 18:07:51 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca6305ce-c0d4-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 20:07:50 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id q14so2819718ljc.12
 for <xen-devel@lists.xenproject.org>; Wed, 20 Apr 2022 11:07:50 -0700 (PDT)
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
X-Inumbo-ID: ca6305ce-c0d4-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZefzNMP2xUCwCKtwQAeTzLb3uVrLkvJxMgprBH62UZ4=;
        b=jLlgx2f/ZRVcIZm4xsCqE2Kjbklu4dCw34zc+5hFOBbtXsx33lV/Liy5yZhk/qVwpE
         /jpdht04fxkdW6QOR7a9LAXNTA8DuIPmPqi8v7c0ASvRn6R6BtF0Rih8kbwUnnIYQC0g
         JfcAMkmWz3AAfCOl4JcFwoc2+N7kpMg0SodyW+WpckqmLV2t9nyQ+wFwcUPlHj4/rzfS
         FD5SKdRNTwMA3vcuHriNvqYoyuU5JLtmJnivY+1G/SmjyELFaaRrOEu+jxNTRpyCEdcV
         AwvLmwz6ltUBhb39rHzuCvJUGluIsaQ3F4CWH9SHc1ituCugO+2qjMWqlW2nqrP3X5SR
         g1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZefzNMP2xUCwCKtwQAeTzLb3uVrLkvJxMgprBH62UZ4=;
        b=qAf7TwSbYOtkmzXBc1dQLvjgfJ9sxKCjY8B1gBXZXXvgtOG5YPfdhuTGnYMEB3mCHB
         5tk5zOLaagnc1/LNNGZYYNwDY7X/myk/74yQGfSfrScI7obPPworwfDt0A4b4jc4XYxN
         FpEYs50jzbo2iRWeMybULtOLnorb/wJeD8NQmB/6eu6JSBsupauk93ocpW8GWXvbKGIS
         Wbx51BMhK7jw7TL9JH9l8DWEpCZj5BKgqm2xYrSuQ4S+0Lu1lJsXgmEz1judPu/zWWA9
         oG4J9eIrPyBN1q+MY0VkLQhKCfr/17SnV/dGl2guKCWRk7bzrWRB4slHU2uqFADgPo0A
         X67Q==
X-Gm-Message-State: AOAM533Qjh+yX0muICzjmh8ut+imoz+/MpiAXg9BkED+dByNXYL8fvFF
	7GVdSm3Ued8A6m9KnrpQ+BF6XiCjGx7JFDGteKc=
X-Google-Smtp-Source: ABdhPJy0T85tV9T7j+l9fg1Fnk2oUlxepKw/ZgiogRIXXxCjO3U7OZSZglYRrW6eyobfr+8O0huUZpAa3plF1Jd1EGY=
X-Received: by 2002:a05:651c:1204:b0:24e:e127:f509 with SMTP id
 i4-20020a05651c120400b0024ee127f509mr1482017lja.459.1650478069889; Wed, 20
 Apr 2022 11:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220420210407.18060-1-dpsmith@apertussolutions.com> <20220420210407.18060-3-dpsmith@apertussolutions.com>
In-Reply-To: <20220420210407.18060-3-dpsmith@apertussolutions.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 20 Apr 2022 14:07:37 -0400
Message-ID: <CAKf6xptTqsL9wcP2n=-NBd9UtrCh=+XxzJgK3tGYpqUXQEDUAA@mail.gmail.com>
Subject: Re: [PATCH 2/2] flask: implement xsm_transtion_running
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Scott Davis <scott.davis@starlab.io>, 
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 20, 2022 at 1:03 PM Daniel P. Smith
<dpsmith@apertussolutions.com> wrote:
>
> This commit implements full support for starting the idle domain privileged by
> introducing a new flask label xenboot_t which the idle domain is labeled with
> at creation.  It then provides the implementation for the XSM hook
> xsm_transition_running to relabel the idle domain to the existing xen_t flask
> label.
>
> In the reference flask policy a new macro, xen_build_domain(target), is
> introduced for creating policies for dom0less/hyperlaunch allowing the
> hypervisor to create and assign the necessary resources for domain
> construction.
>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---

> @@ -188,6 +188,7 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
>
>  static void cf_check flask_domain_runtime_security(void)
>  {
> +    struct domain_security_struct *dsec;
>      struct domain *d = current->domain;
>
>      if ( d->domain_id != DOMID_IDLE )
> @@ -198,6 +199,9 @@ static void cf_check flask_domain_runtime_security(void)
>       * set to false for the consistency check(s) in the setup code.
>       */
>      d->is_privileged = false;
> +
> +    dsec = d->ssid;
> +    dsec->sid = SECINITSID_XEN;

I think you also want
   dsec->self_sid = dsec->sid;
so self also changes to xen_t.

Otherwise I think it looks good,

I was wondering if you were going to require xenboot_t -> xen_t
permissions, but manually setting the sid fields side-steps that.
That seems nicer than requiring policy rules for the transition.

Hmmm, cross referencing other flask code, often after assigning
self_sid there is this call to potentially re-calculate it:
    security_transition_sid(dsec->sid, dsec->sid, SECCLASS_DOMAIN,
&dsec->self_sid);

But it isn't used for system domains, so omitting it seems fine.

Regards,
Jason

