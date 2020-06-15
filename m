Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4011F9C77
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 18:01:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkrXc-0003de-4v; Mon, 15 Jun 2020 16:00:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8mLd=74=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jkrXa-0003dZ-SA
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 16:00:54 +0000
X-Inumbo-ID: 6420105e-af21-11ea-bca7-bc764e2007e4
Received: from mail-ej1-x629.google.com (unknown [2a00:1450:4864:20::629])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6420105e-af21-11ea-bca7-bc764e2007e4;
 Mon, 15 Jun 2020 16:00:54 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id f7so18017461ejq.6
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2020 09:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=ckivRBep5W5MCYXRFWoArmHpJzc0MY2sqkopEiOe/vY=;
 b=Eg/ZA/IzoTIemn66oQYYffgVai+jVl1yCiIdYPu1p+dxWQEitjwOGAFgZ9rrGk7O2e
 Y2z78aFIaA1qczN8OP8/Gziu5B5JwKtjbEcyR2BNbmyNjBrM6k3Mn5C32c5za/a6V+aj
 sXkJPUsJOw2ZMXzcKvre+LgWOx6feyEtzMrng/4ML/20hglcQGCIVuVUNaF3LrghrKvc
 fr6oZxBbW+nCjBMtGKzLk0Uhb1zcRuZODQCc9Mz4dtojzCNbu0H3gUe8GrGZS4me+F32
 rc3QXxtlV1BU39MMu89HqVK+LPh9u3bl4kEntP9OJYX2heIJAd6BNGJr0Pa3Z3IIVm2b
 kBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=ckivRBep5W5MCYXRFWoArmHpJzc0MY2sqkopEiOe/vY=;
 b=BPa/IYRAocEq/imGBoGKyI5a7P5ZLC7Iq22w6VS/NCC80jdFWQrVFDwuyF3YnyMj7/
 hlRKgQTcim1KAMWKpKtN6jRETwU9scYvtA3e5U/TpputAX9AMWCR6yL3njtE74M4XiZT
 bDTXtiGGj+tLXPnp70BJluoQAGBQ6doB0qCz4HJzVFpiGQikZe7gXzeiS0H6mUoZ6ce+
 x3gTTZ0QGo96tQw02x9V7eEvoj7elKG2OyHXxeIDtNEXL318q3q7zOfpvfgBNEMOd/GL
 1yYlQebGZVajuTOsv71uxZsxTruwWyY26VvTDqUrFOyoSKduOLoEG5e56l0btKAdh+6v
 2HGQ==
X-Gm-Message-State: AOAM532sE99NqDXv95AY7aK4POtjHTTokvIhTI5KqIuaosf56LrNStyb
 qiY0ZiG+bHW4+u3T+3C6pu0=
X-Google-Smtp-Source: ABdhPJwRyg/w6QO6E2GJfClG/NkBhKT/0JgTxQDxk0TmkcYeRg9TPuOWSf+B2gypq9bJ8mMkYAzNOg==
X-Received: by 2002:a17:906:22da:: with SMTP id
 q26mr13463123eja.256.1592236853216; 
 Mon, 15 Jun 2020 09:00:53 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id cn14sm8598744edb.22.2020.06.15.09.00.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jun 2020 09:00:52 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Ian Jackson'" <ian.jackson@citrix.com>,
 "'Nick Rosbrook'" <rosbrookn@gmail.com>
References: <42ba06bc716cf91d25c8bb1d988cb1310219b8fe.1592234663.git.rosbrookn@ainfosec.com>
 <24295.38675.682397.522303@mariner.uk.xensource.com>
In-Reply-To: <24295.38675.682397.522303@mariner.uk.xensource.com>
Subject: RE: [PATCH for-4.14] golang/xenlight: sort cases in switch statement
Date: Mon, 15 Jun 2020 17:00:51 +0100
Message-ID: <002f01d6432e$2545b410$6fd11c30$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJnvHaHjNxn+zX7ehrvie/Qok7WjwE1L8Gpp605swA=
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
Reply-To: paul@xen.org
Cc: 'Nick Rosbrook' <rosbrookn@ainfosec.com>, xen-devel@lists.xenproject.org,
 'George Dunlap' <George.Dunlap@citrix.com>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <Andrew.Cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Ian Jackson <ian.jackson@citrix.com>
> Sent: 15 June 2020 16:43
> To: Nick Rosbrook <rosbrookn@gmail.com>
> Cc: xen-devel@lists.xenproject.org; paul@xen.org; Andrew Cooper <Andrew.Cooper3@citrix.com>; Nick
> Rosbrook <rosbrookn@ainfosec.com>; George Dunlap <George.Dunlap@citrix.com>; Wei Liu <wl@xen.org>
> Subject: Re: [PATCH for-4.14] golang/xenlight: sort cases in switch statement
> 
> Nick Rosbrook writes ("[PATCH for-4.14] golang/xenlight: sort cases in switch statement"):
> > The xenlight_golang_union_from_C function iterates over a dict to
> > construct a switch statement that marshals a C keyed union into a Go
> > type. Because python does not guarantee dict ordering across all
> > versions, this can result in the switch statement being generated in a
> > different order depending on the version of python used. For example,
> > running gengotypes.py with python2.7 and python3.6 will yield different
> > orderings.
> >
> > Iterate over sorted(cases.items()) rather than cases.items() to fix
> > this.
> >
> > This patch changes the ordering from what was previously checked-in, but
> > running gengotypes.py with different versions of python will now yield
> > the same result.
> >
> > Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> > ---
> > Andrew reported this in [1], so I intend this as a build fix for 4.14.
> >
> > [1] https://lists.xenproject.org/archives/html/xen-devel/2020-06/msg00881.html
> > ---
> >  tools/golang/xenlight/gengotypes.py  |  2 +-
> >  tools/golang/xenlight/helpers.gen.go | 32 ++++++++++++++--------------
> >  2 files changed, 17 insertions(+), 17 deletions(-)
> >
> > diff --git a/tools/golang/xenlight/gengotypes.py b/tools/golang/xenlight/gengotypes.py
> > index ecca59745f..557fecd07b 100644
> > --- a/tools/golang/xenlight/gengotypes.py
> > +++ b/tools/golang/xenlight/gengotypes.py
> > @@ -379,7 +379,7 @@ def xenlight_golang_union_from_C(ty = None, union_name = '', struct_name = ''):
> >
> >      # Create switch statement to determine which 'union element'
> >      # to populate in the Go struct.
> > -    for case_name, case_tuple in cases.items():
> > +    for case_name, case_tuple in sorted(cases.items()):
> >          (case_val, case_type) = case_tuple
> 
> This part
> 
> Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
> 
> But I don't think I have the right golang tools to verify the
> autogenerated code.  George, can you check that this patch is right,
> and/or do the commit and rerun the generation ?
> 
> Obviously that needs to wait for a release ack.
> 

Assuming George is happy...

Release-acked-by: Paul Durrant <paul@xen.org>

> Ian.


