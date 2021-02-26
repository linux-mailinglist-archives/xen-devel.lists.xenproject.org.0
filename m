Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF4A325C02
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 04:37:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90044.170269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFTvy-0004WX-EW; Fri, 26 Feb 2021 03:36:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90044.170269; Fri, 26 Feb 2021 03:36:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFTvy-0004W8-BB; Fri, 26 Feb 2021 03:36:54 +0000
Received: by outflank-mailman (input) for mailman id 90044;
 Fri, 26 Feb 2021 03:36:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rwhq=H4=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lFTvx-0004W3-D3
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 03:36:53 +0000
Received: from mail-ot1-x32c.google.com (unknown [2607:f8b0:4864:20::32c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b6c8a3e-a57e-4933-b36c-32aa2e14c796;
 Fri, 26 Feb 2021 03:36:52 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id b16so7946029otq.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Feb 2021 19:36:52 -0800 (PST)
Received: from thewall (142-79-211-230.starry-inc.net. [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id k18sm1605251ots.24.2021.02.25.19.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:36:51 -0800 (PST)
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
X-Inumbo-ID: 3b6c8a3e-a57e-4933-b36c-32aa2e14c796
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IqFdziwHDxVIOjGZX/oKUvNBbcd3HE80EMON7TdM10Q=;
        b=H4njjzxla+7jFyKNzQUp1uBAOvrWjqk9z1Neh9YzVlpWSJ9fU6sVHxkUac4FQZzPwH
         eosPqVotvN6xGC6eUuJc3ihqRTCoGMZ8zszqZpeTLOo+qjYf6KLtd65n7fxMYBYxtgw9
         uFcXTatyQC9uSuLe9455APqCDW9F0cnZ62ANW4I/K0NsFppA3gG0INLxwzp8yQ+a7ldP
         RRCQGc8i27q3DYeqc5fqopW3OcDZXE20t3MqZ9EdN39/TV6uuT7fSYwSDJPxIsxO2fy9
         JK6IcDPiJ+oB6X8+jhuQcfmzOcp979BwakKDZuf+W32tBZ8HAXfRjwAw9QzEBt6u1wPx
         +SGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IqFdziwHDxVIOjGZX/oKUvNBbcd3HE80EMON7TdM10Q=;
        b=tromzoaRz/uRjlWzwnpkT0wxQaoD/3wcRRx7o76KNj7CVVtGSuOSNLNH+SSYOTJScm
         VvIuDKPuNzmMK488E/NbkxA1atDRQG2Nn6vu5OP8wnAWz51oJzFq9JBM/TA0S6Y8aMmH
         /7Y00Zdyci6IaVAidvsPjpAZCdU9XYSO5qHKBHqDz3oMR6Nb0IPC6oWnoJYg4CaoKmNR
         XmcMgF1ZEWrXQQguNfMWKF0zZmAszT9NtKHPReXGvpiK09kbo5znsvsf5Ds50gex7rfb
         7E5UKdK0/jLNvfdiHPwc43WAj1MOl16GsGHx925O1Vx/rBOCqsPpoRxUTgM7LhaJhNcG
         fhxw==
X-Gm-Message-State: AOAM533NaLQAyv8k0NHpBtG35az+lTFNx5X8loVbw9y9JA9E6Bvse9dB
	WpVVixIYUFXF7l4HS+OR8jU=
X-Google-Smtp-Source: ABdhPJx1yb77m+oOkROwInIy0TQylzhb9Rk5GTpsKXfWrN9GyeZLsgWiplBx1IwLg2srnPVvzKiL5Q==
X-Received: by 2002:a05:6830:150c:: with SMTP id k12mr793866otp.104.1614310612287;
        Thu, 25 Feb 2021 19:36:52 -0800 (PST)
Date: Thu, 25 Feb 2021 20:36:50 -0700
From: Connor Davis <connojdavis@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-next 4/6] xen: Fix build when !CONFIG_GRANT_TABLE
Message-ID: <20210226033650.ou6eqdu7lfmuuhtk@thewall>
References: <cover.1614265718.git.connojdavis@gmail.com>
 <eb2d1e911870f1662acfbc073447af2d29455750.1614265718.git.connojdavis@gmail.com>
 <259e6dce-7fc4-1f2e-49b6-61a047012953@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <259e6dce-7fc4-1f2e-49b6-61a047012953@suse.com>

On Thu, Feb 25, 2021 at 04:53:23PM +0100, Jan Beulich wrote:
> On 25.02.2021 16:24, Connor Davis wrote:
> > --- a/xen/include/xen/grant_table.h
> > +++ b/xen/include/xen/grant_table.h
> > @@ -66,6 +66,8 @@ int gnttab_acquire_resource(
> >  
> >  #define opt_max_grant_frames 0
> >  
> > +struct grant_table {};
> > +
> >  static inline int grant_table_init(struct domain *d,
> >                                     int max_grant_frames,
> >                                     int max_maptrack_frames)
> 
> You shouldn't actually declare a struct, all you need is to
> move the forward decl further up in the file ahead of the
> #ifdef.

Thanks, will fix this in v2.

    Connor

