Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C2950BDC0
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 18:58:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311155.528246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhwbn-0003bo-Er; Fri, 22 Apr 2022 16:58:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311155.528246; Fri, 22 Apr 2022 16:58:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhwbn-0003ZS-Bb; Fri, 22 Apr 2022 16:58:15 +0000
Received: by outflank-mailman (input) for mailman id 311155;
 Fri, 22 Apr 2022 16:58:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=utlT=VA=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nhwbl-000304-MQ
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 16:58:13 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 654cfaa2-c25d-11ec-8fc2-03012f2f19d4;
 Fri, 22 Apr 2022 18:58:13 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id y32so15325770lfa.6
 for <xen-devel@lists.xenproject.org>; Fri, 22 Apr 2022 09:58:13 -0700 (PDT)
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
X-Inumbo-ID: 654cfaa2-c25d-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hu+6brSl+lbKFssBircurUAEc3KTJPIkkXnWXDJ1yJA=;
        b=gkfnjgEEQAQFsZ/bHsti7D5TBXQKzWSOEPry/iP7SuxVOWkPCbnfCj9UWmzOJ8hxeY
         vmRRXhFegzU3n20TZDnt/F11tHveODoxkg1wCm1bjLdgoP82BXuaoue0umoueZWTR7cK
         /8eDgEpT5IIgGDWrqCM9Y8AvmhAmS4Lsu4cw/5J5+V3/mbsf+WlPSYl5QJtBNZDAvjo/
         qQmHeupjJrDQBSK82g4bqyh2vYrE6FXLPU2GgA6QP63hNj7hm3GLECBeNECFIUTz23i1
         cGOse6BLHlQ+3qNSJKC4YDarLQWOT/ayvkaond49dhfbN9P9ZhIoj6SlGWNMkl2ykDTb
         Aa5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hu+6brSl+lbKFssBircurUAEc3KTJPIkkXnWXDJ1yJA=;
        b=E/atkLbbkmsqUrM0iDWWnhbpzEsmHB42ysMJCIhx6Q20ojNUbkWm/5ofT0QyHzM711
         fM6j0JWHGSwPClYKYVMpJtMOd08CTMlyaaKQkeeZIeVih9LYBMQyZl+1sOFYZyx+Yyj5
         O+Pz3yiUzb14ET/i5eN/1k+FLxny7NFLTfheIMTfqBSS9yM0ZlNTe1JtfpAxO7zp7PKu
         Utry7If96BYB0SuWSrx4lWqHxfx8re39JW1zS0U8o1FQLUXerqTwjHCCTBG2cW5Wda30
         FKvGU5hRB1PBj92wJPFGUi7vDdY6xGq5h36uzxcs0lENVj+E4WCbz65qKv8X7BrK3QkL
         gVIg==
X-Gm-Message-State: AOAM531peF4Tglk/ijmAh+f8ExtPgBdYwju/MK8z7dP1nhrExA9WhPNJ
	MuFUJePQ9eHuMJX94pITnBxAEjNU9hdlDJX8cQI=
X-Google-Smtp-Source: ABdhPJxPL65bRGUvJUBQvYuIRVz4ox6BMZYXRsWKIi9dVX5ifRXRsO9J73RKC7H4xCXCtZN6f7ZzqtMdTuO/8tb4eFQ=
X-Received: by 2002:a05:6512:11cc:b0:44a:5770:7425 with SMTP id
 h12-20020a05651211cc00b0044a57707425mr3560614lfr.406.1650646692701; Fri, 22
 Apr 2022 09:58:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220422163458.30170-1-dpsmith@apertussolutions.com> <20220422163458.30170-3-dpsmith@apertussolutions.com>
In-Reply-To: <20220422163458.30170-3-dpsmith@apertussolutions.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 22 Apr 2022 12:58:01 -0400
Message-ID: <CAKf6xptRBMwjrE_m+rQEoS+ZoC=7qFO+NGg3eUQYuC6x66Uauw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] flask: implement xsm_set_system_active
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Scott Davis <scott.davis@starlab.io>, 
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 22, 2022 at 12:35 PM Daniel P. Smith
<dpsmith@apertussolutions.com> wrote:
>
> This commit implements full support for starting the idle domain privileged by
> introducing a new flask label xenboot_t which the idle domain is labeled with
> at creation.  It then provides the implementation for the XSM hook
> xsm_set_system_active to relabel the idle domain to the existing xen_t flask
> label.
>
> In the reference flask policy a new macro, xen_build_domain(target), is
> introduced for creating policies for dom0less/hyperlaunch allowing the
> hypervisor to create and assign the necessary resources for domain
> construction.
>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---

> @@ -188,8 +188,12 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
>
>  static int cf_check flask_set_system_active(void)
>  {
> +    struct domain_security_struct *dsec;
>      struct domain *d = current->domain;
>
> +    dsec = d->ssid;
> +    ASSERT( dsec->sid == SECINITSID_XENBOOT);

Extra space before dsec.

With that fixed,
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

