Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB87257AF3
	for <lists+xen-devel@lfdr.de>; Mon, 31 Aug 2020 15:56:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kCkHM-0004jY-7j; Mon, 31 Aug 2020 13:55:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8rfQ=CJ=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1kCkHK-0004jS-5l
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2020 13:55:22 +0000
X-Inumbo-ID: e4166919-272c-45f5-8c44-b4dd9b875083
Received: from mail-qk1-x730.google.com (unknown [2607:f8b0:4864:20::730])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4166919-272c-45f5-8c44-b4dd9b875083;
 Mon, 31 Aug 2020 13:55:21 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id w186so6161211qkd.1
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2020 06:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=9D2/rLbFCnp5s/DUu9tdAOvsIz0feWiD5liZvwj1C24=;
 b=IaQNtIvTtIcOHJZfu66WsJEYi0iNv1oC6WYYxTQKCBv0Ec0FiU4Hrc3qclfV/7uq4n
 YaY9//HHKdPEqaAE16tS5IdS55RUjT96E8s0qd5FChFM/UUyIUXPOBM7xTpVs+Pf8KIj
 +u88e7q2fqz10aWGEvhNeumPkDdhvFM99AMC0QqJzDur3Ke9xMggEXS3pQNuEvecVC5t
 5MTochStPi2/q+I285aEO/QihQptzYO5XekX4MKQtFXE6fNde2/86lbR8mTzXII1qJ37
 qRRzCVsS3sTsz/pAQH59qV6FC0c0GQPhfasUQKlk4ngRf3aigrthHv23n40hBr7xXS7l
 0IKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9D2/rLbFCnp5s/DUu9tdAOvsIz0feWiD5liZvwj1C24=;
 b=YB51cOLYX57yHriRGraY1Pi6bi2tn/E/cgrivjQ3QicfVRJsmHoWrDInhCIfToO+DH
 C0YlnHlMcdT6vWllIirnykC4hfENAIg7Id6HqZ7Z2fPAEr3N6wDhev2tOCGiscqVa3sY
 IASNbPQZUiF0qWJdJUhyLL9cEszAB3wgF02zeU94s4G9T1HHyATe7vw9zYqbhdKwFFCJ
 ow9jdp9RQofMgnLeEskMyCLpJNaBsOBisCTjEtc1O7pvczm0u4rQ9K10abxSg+UzmlEy
 HKSBHYzWq2zxzsc/LW1h75iBq5rs6FApZlRidHDH8sfiegNdbtQjsaBZU1DTyhDKwNPq
 C2Gw==
X-Gm-Message-State: AOAM531N4e6zaW92Pp1IkonFkZNPpaHUumvRTEWO5z0g4O6/KmCpKDBt
 /KWJiECF126HH3DHJyFAuZM=
X-Google-Smtp-Source: ABdhPJyJ8zfUheM1TA+7A3xPLV3k58goc7NcY2dHjI9lURt3j+A6Ux85aSQDPn4kKIhIVxKT2zhbUQ==
X-Received: by 2002:a37:8287:: with SMTP id e129mr1358881qkd.132.1598882120935; 
 Mon, 31 Aug 2020 06:55:20 -0700 (PDT)
Received: from FED-nrosbr-BE.crux.rad.ainfosec.com
 (209-217-208-226.northland.net. [209.217.208.226])
 by smtp.gmail.com with ESMTPSA id m196sm2448732qke.87.2020.08.31.06.55.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 31 Aug 2020 06:55:19 -0700 (PDT)
Date: Mon, 31 Aug 2020 09:55:16 -0400
From: Nick Rosbrook <rosbrookn@gmail.com>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 "rosbrookn@ainfosec.com" <rosbrookn@ainfosec.com>
Subject: Re: Golang design session follow-up
Message-ID: <20200831135516.GA277956@FED-nrosbr-BE.crux.rad.ainfosec.com>
References: <20200721003548.GA9581@six>
 <639307EB-23A4-4D76-8BDB-7F2FA4F149D1@citrix.com>
 <317B0F11-2FD0-4B74-B148-C726037DFB7A@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <317B0F11-2FD0-4B74-B148-C726037DFB7A@citrix.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Aug 28, 2020 at 07:05:08PM +0000, George Dunlap wrote:
> 
> 
> > On Aug 28, 2020, at 4:57 PM, George Dunlap <george.dunlap@citrix.com> wrote:
> > 
> > 
> > 
> >> On Jul 21, 2020, at 1:35 AM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
> >> 
> >> # Long-term home of the package
> >> 
> >>   Ian: Autogenerated stuff is becoming more annoying.
> >> 
> >>   Delete all the libxl auto-generated stuff from staging & master, and have "output branch".
> >> 
> >>   The reason we have these in-tree is that otherwise you can't build *from git* if you don't 
> >>   have new enough versions of the right tools.
> >> 
> >>   Distribution: Make a repo on xenbits!
> > 
> > So thinking about this: 
> > 
> > The first plan I had was to have a script in tools/golang/xenlight (and/or the Makefile), which would be handed a directory, and would then:
> > 
> > 1. Sync static files from tools/golang/xenlight into that directory
> > 
> > 2. Run gengotypes.py, having the resulting generated files put into that directory
> > 
> > 3. Run `git diff` in the target directory; if there are any changes, then automatically run `git commit` to check in the changes.
> > 
> > That way you could just set up a cron job to sync things over on a regular basis.
> > 
> > Thinking about GPL considerations, however, you’d also want to include libxl_types.idl and idl.py.  And then of course, you should also include a way to build the generated code from those two.
> > 
> > At which point… would it make sense to just move the package out to its separate repo entirely?  I.e., have actual development happen in the repo which ends up being cloned in the end?
> > 
> > Obviously there are nice things about having the code in the same repo; but there’s also something satisfying about being a full downstream.
> > 
> > I was actually thinking it might make sense to put the repo at https://gitlab.com/xen-project/go-xenlight , to try out that as a development model.
Would that mean completely moving off of xen-devel for development? I can't 
think of a huge reason why we wouldn't be able to do this if we wanted.
> 
> I’ve put a sort of draft module up at https://gitlab.com/martyros/go-xen ; you can test it by adding the "gitlab.com/xen-project/go-xen/xenlight” package, but adding the following line to the go.mod of the test program:
I have a couple of patches I was going to send out on xen-devel today. I 
could PR them to this repo instead (or in addition) if you want to try out 
the gitlab workflow. 

-NR

