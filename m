Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C99517108
	for <lists+xen-devel@lfdr.de>; Mon,  2 May 2022 15:56:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.318909.538898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlWWu-0004lc-0I; Mon, 02 May 2022 13:56:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 318909.538898; Mon, 02 May 2022 13:55:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlWWt-0004jN-TI; Mon, 02 May 2022 13:55:59 +0000
Received: by outflank-mailman (input) for mailman id 318909;
 Mon, 02 May 2022 13:55:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ohg0=VK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nlWWr-0004jH-On
 for xen-devel@lists.xenproject.org; Mon, 02 May 2022 13:55:57 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96fcdd94-ca1f-11ec-a405-831a346695d4;
 Mon, 02 May 2022 15:55:56 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id bu29so25457692lfb.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 May 2022 06:55:56 -0700 (PDT)
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
X-Inumbo-ID: 96fcdd94-ca1f-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JIC98o94h+jogntJiZAvWVyufskI+823lQPu0h1sFm4=;
        b=JR779hjqoiT/iVWcop9gz3TjZBOrfjsYEsIkwbr2JoD77F2spCHcpYZ23UrAa2ihVX
         gr8zlL7A0W00LmivdY5tMrsOGT6bu4vDWmjrhPNvcqisiTktHKxvDhZriFIQb2xZQmim
         23XRNTLKDHHlFWDF9AaQL3fO+np60kBaRlTv2LfsBRZjA5rlz09IeoPwA35eTl0YnC+4
         EjUY4STbkDiaTCwUQxSO67Wby1BprG7J/8d8TzG6FYvPhGulKR92DkTw+O5QeE5M9pRe
         CgPslU2UyqONQvmDzy3OIXWU3U1FgqFKQP4vykGrTzRFIzAGjS3p2hRMAAqHjIPd1OYP
         4PBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JIC98o94h+jogntJiZAvWVyufskI+823lQPu0h1sFm4=;
        b=WXAZtk+MHIRFyJDrDn90LEufJzlwtGvRB7utuhOZaT3NJIrgX+YTxcLg+xx1W7/ADp
         Q7QLs1hlm7o1PUIEDfss1X8yVaKeHdYS1au7GFQwXlBfw4neblIRmQLZy31Qm9+1bpCO
         hUmaM4evlJwcrMSdeoxhmMvZhHhB8nbOHuZu8kyViCkH4MnO99tOIG7i7JV2prRfeqHf
         /RefWxYoV13on3z4+Xf4hFxYH5wA/1pIv7HDM8CS3gSfvZ2qSqvgFDsf22sIEOkmv78d
         slWXBWBIdXixxoN/Iwy0WzECSoQtcvuAP2TryqseOjnf1AzEHkVPoo+SrKZGAYPI6sL3
         C4yQ==
X-Gm-Message-State: AOAM530Qtf01GhAe8sPBPI81CCurqc7Dxx0GO/i7vLDVfS3Lt1+alyJR
	sIG/TBW2gMTvji2KCg6jIaARJ6u65nYdnAHc3mY=
X-Google-Smtp-Source: ABdhPJx6Po6Z33nLs5uql5iQcjO75CTeIGyOM0hj1ddVZ90lM8UmAGCLm4xh/MacRwKOnk6KHTqR1jUjjUUABKOHLug=
X-Received: by 2002:a05:6512:1109:b0:472:25d9:d262 with SMTP id
 l9-20020a056512110900b0047225d9d262mr9159225lfg.128.1651499756401; Mon, 02
 May 2022 06:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220502133027.920-1-dpsmith@apertussolutions.com> <20220502133027.920-3-dpsmith@apertussolutions.com>
In-Reply-To: <20220502133027.920-3-dpsmith@apertussolutions.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 2 May 2022 09:55:44 -0400
Message-ID: <CAKf6xpvN5MO4zbcOZv66x7_+yVr_LLG1iCE4m8Y+FQw9Q_k+eQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] flask: implement xsm_set_system_active
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Scott Davis <scott.davis@starlab.io>, 
	christopher.clark@starlab.io, Daniel De Graaf <dgdegra@tycho.nsa.gov>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 2, 2022 at 9:31 AM Daniel P. Smith
<dpsmith@apertussolutions.com> wrote:

> @@ -188,14 +188,20 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
>
>  static int cf_check flask_set_system_active(void)
>  {
> +    struct domain_security_struct *dsec;
>      struct domain *d = current->domain;
>
> +    dsec = d->ssid;
> +    ASSERT(dsec->sid == SECINITSID_XENBOOT);
> +
>      if ( d->domain_id != DOMID_IDLE )
>      {
>          printk("xsm_set_system_active should only be called by idle domain\n");
>          return -EPERM;
>      }
>
> +    dsec->self_sid = dsec->sid = SECINITSID_XEN;

I think you want to re-add setting is_privileged to false.  I think
from the other thread Roger just thought it should also have the
matching assert.  It doesn't matter for flask decisions, but it
changes the return of is_control_domain.  It seems to me it would be
better to have idle domains consistent between flask and non-flask
instead of having a potentially subtle difference.

Regards,
Jason

