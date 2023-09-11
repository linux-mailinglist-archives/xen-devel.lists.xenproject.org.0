Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 424FB79A859
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 15:45:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599409.934818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfhDI-00080V-3f; Mon, 11 Sep 2023 13:44:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599409.934818; Mon, 11 Sep 2023 13:44:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfhDI-0007yo-0f; Mon, 11 Sep 2023 13:44:28 +0000
Received: by outflank-mailman (input) for mailman id 599409;
 Mon, 11 Sep 2023 13:44:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zO6f=E3=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1qfhDG-0007yg-3n
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 13:44:26 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50c106ae-50a9-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 15:44:23 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-317c3ac7339so4131551f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Sep 2023 06:44:23 -0700 (PDT)
Received: from EMEAENG6DZjqCfH.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a5d540a000000b003176c6e87b1sm10032692wrv.81.2023.09.11.06.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 06:44:21 -0700 (PDT)
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
X-Inumbo-ID: 50c106ae-50a9-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1694439862; x=1695044662; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XrStGrtAzgSFHmNSZ5z2lPvRKM/yzCRzDV66XvZ6a5g=;
        b=aKdCaxicgJCJZNk3EedPd7NEX0Gv93+2jRcGrOrjZgj9vsvIitaLgwDUTlAhI53fJi
         K1Q6ybwTxYjCmE9Yr7kHQEFudTnsOUL2YfuWRzqIGe3u7A9dyEdRZ9zXtY23J5pWixBo
         oUpOJBu3EgXw+G+lpNXh2/D8Tl1/R7wuWx9Hc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694439862; x=1695044662;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XrStGrtAzgSFHmNSZ5z2lPvRKM/yzCRzDV66XvZ6a5g=;
        b=qag+1WonUMTLvURyZqwDTyAIyR4Sh5+O/Qlp7BOyB7+wO01S8JDeRxzXvZZ/SoXY9K
         RYCuyDtkENtJnNcD8oLQf37IrIbBUsvfslbk4VzcEwFUpuYctmuAp9EROPgLGq8Qnamb
         PiGw6CsdHlZopSMvfIuuPIgzJCi3ab25V55cNRwUzSF9VY46kN6NFwheP/YjP87FUyuP
         HqCK/Rd0ZjVbTqZ9I/M+tN90QB/MUkWUhocxbtidOyYPZzi5WNKNEytl6pg9OVXWXWPj
         SVx66ubZSZ2OWGmxddi6teynworeU7aCxxkR8RoByjk9bNIm8f4j7wLp2kdbHgQMOz0n
         JbOw==
X-Gm-Message-State: AOJu0YyBJM7y/ABRdjKQJ/br4CzgIgITQgdDhqvESKRdjHnsRolfetSn
	dV3sWMk5evzFQRY5zB3G8EIMkA==
X-Google-Smtp-Source: AGHT+IGwt0vrw66z9RWcHXyKzGsvIcMYS0u5YkZ3AmHBytqfivielHM1tsdLljRKzmH+dMRFm4BH0w==
X-Received: by 2002:a5d:43d0:0:b0:31a:d871:7ae7 with SMTP id v16-20020a5d43d0000000b0031ad8717ae7mr8430527wrr.29.1694439862451;
        Mon, 11 Sep 2023 06:44:22 -0700 (PDT)
Date: Mon, 11 Sep 2023 14:44:21 +0100
From: Javi Merino <javi.merino@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v1] tools/xentrace/xentrace_format: Add python 3
 compatibility
Message-ID: <lt77rwliauydvvzzm2vgaox5nqdt5a2sectcjvcyvq7edpq3ul@im3spknk7qcg>
References: <20230906131616.7681-1-javi.merino@cloud.com>
 <eccd7f3e-abf6-2e6d-063f-477ccbdc6b5d@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eccd7f3e-abf6-2e6d-063f-477ccbdc6b5d@citrix.com>

On Mon, Sep 11, 2023 at 11:52:43AM +0100, Andrew Cooper wrote:
> On 06/09/2023 2:14 pm, Javi Merino wrote:
> > diff --git a/tools/xentrace/xentrace_format b/tools/xentrace/xentrace_format
> > index 5ff85ae2e8..166ebae325 100644
> > --- a/tools/xentrace/xentrace_format
> > +++ b/tools/xentrace/xentrace_format
> > @@ -4,11 +4,15 @@
> >  
> >  # Program for reformatting trace buffer output according to user-supplied rules
> >  
> > +from __future__ import division
> > +from __future__ import print_function
> > +from __future__ import unicode_literals
> > +from builtins import str
> > +from past.utils import old_div
> 
> This adds a new dependency on a package we (upstream Xen) don't
> currently use.  AFAICT, it's only for...
>
> > @@ -223,7 +232,7 @@ while not interrupted:
> >              last_tsc[cpu] = tsc
> >  
> >          if mhz:
> > -            tsc = tsc / (mhz*1000000.0)
> > +            tsc = old_div(tsc, (mhz*1000000.0))
> 
> ... this, which is always int / float and doesn't fall into Py2's
> int/int behaviour in the first place.
> 
> I'm pretty sure the code can just stay as it is, without needing to use
> old_div().

Ok, I will the dependency on python3 future and the old_div() for v2.

Cheers,
Javi

