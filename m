Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EDC5B0197
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 12:17:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401131.642840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVs7F-000126-Mi; Wed, 07 Sep 2022 10:17:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401131.642840; Wed, 07 Sep 2022 10:17:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVs7F-0000zJ-J8; Wed, 07 Sep 2022 10:17:05 +0000
Received: by outflank-mailman (input) for mailman id 401131;
 Wed, 07 Sep 2022 10:17:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aULX=ZK=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1oVs7D-0000zD-CT
 for xen-devel@lists.xen.org; Wed, 07 Sep 2022 10:17:03 +0000
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [2607:f8b0:4864:20::102b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36700707-2e96-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 12:17:02 +0200 (CEST)
Received: by mail-pj1-x102b.google.com with SMTP id
 p1-20020a17090a2d8100b0020040a3f75eso9340601pjd.4
 for <xen-devel@lists.xen.org>; Wed, 07 Sep 2022 03:17:02 -0700 (PDT)
Received: from localhost ([122.171.18.80]) by smtp.gmail.com with ESMTPSA id
 a7-20020a1709027d8700b0017691eb7e17sm8661091plm.239.2022.09.07.03.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 03:16:59 -0700 (PDT)
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
X-Inumbo-ID: 36700707-2e96-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=nFahYmwJIGMxrSEtxvHxHxu3omH/Gggux9uFqCZjBuU=;
        b=g/VALj47ZZjLhSmO9cygQAMcOXOW2lS9a6cLsVBUuD05osCmD+iijup4Kk4PEn7ZtJ
         JE5aXiSddHgAwH7iz1Kc2KdBzhgnq4ZsY2jgEmjuNWMj/2SdOvlKEOgvectfN5Kzb3Dg
         R1Y1y571nso8PH+jeMkBg53zEw0miq9v62zoJBW8zT3YWej/qecZchc4ZEepo5oVSwiV
         zeJcU8qFliMTae/pvSTPXUnOXRBCQ54JLL3QQIxowcPHtg0p2GTq/IpmW85LyuCrNlj/
         Lp33Ljjt/Z4f8K3+TSdhBCGd7vTzbRdqEuFmZQnRSAAHoP4bh3gBDzjy0CjuLdv4a/hO
         Np7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=nFahYmwJIGMxrSEtxvHxHxu3omH/Gggux9uFqCZjBuU=;
        b=D0QBBA4XaQPfHvMMQtwywr9eNX1IroGHuRcYcigVNlH2huX07NhPFRuH9HrHG0H/vT
         Ho/dRF5Bj6NdP4/RZmL7uJ1Kmuu5qaqROk8FUbpyg7qBJVeXtu5+AhVbFcqc9hUd6j37
         tNZozS49lF6+XeffMj3Ep8/OC0WVShfS67bMyvNmQYJj4A36wmb799uwdQ+Tkdp/Sp/A
         2oat2QhgcxvKXuFZ9fjBROhv3AkqmItDJ2eCXBgUhFYVdQrHiu1REvbjN8YV53DGeFx0
         zWEUuY0JId7swQQJUgpO6VwL5vbZiN2vi1KgGnAokzVsQj0bGmrLXLh1XGwHRoWZwYOB
         mckw==
X-Gm-Message-State: ACgBeo14DOR7fYnlSF5kQFigm2ALXa3j7VoKQThyG7vLSOypGXZZTOZu
	/L4DsuYlwwKsJYLEYB9JIz4/0HkoLQ+AFw==
X-Google-Smtp-Source: AA6agR5S2FV4VZXfE12bP+3GFQUPDI75idJqttoN20ZlegLzevY3gDgYk/L+s7C9CAvb94qFhc+Mkw==
X-Received: by 2002:a17:90b:1c0c:b0:1fb:6b2c:ca9f with SMTP id oc12-20020a17090b1c0c00b001fb6b2cca9fmr30416727pjb.90.1662545820627;
        Wed, 07 Sep 2022 03:17:00 -0700 (PDT)
Date: Wed, 7 Sep 2022 15:46:57 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xen.org
Subject: Re: [PATCH] .gitignore: Add *.patch
Message-ID: <20220907101657.3oeknoidtspmgewc@vireshk-i7>
References: <cd8683878852a55f1b28807a470e078d21a5e689.1662545140.git.viresh.kumar@linaro.org>
 <aaa317f6-f2d4-a2e4-aff6-f5053964102c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaa317f6-f2d4-a2e4-aff6-f5053964102c@suse.com>

On 07-09-22, 12:09, Juergen Gross wrote:
> On 07.09.22 12:05, Viresh Kumar wrote:
> > Add *.patch entry to .gitignore file to stop showing git generated
> > patches in commands like 'git status'.
> > 
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> >   .gitignore | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/.gitignore b/.gitignore
> > index 9f9f18c97d5f..d9a4fd038145 100644
> > --- a/.gitignore
> > +++ b/.gitignore
> > @@ -20,6 +20,7 @@
> >   *.gcno
> >   *.gcda
> >   *.py[ocd]
> > +*.patch
> >   TAGS
> >   GTAGS
> >   GRTAGS
> 
> NAK.
> 
> We have some files named *.patch in our tree (e.g. stubdom/polarssl.patch).

Ahh, I missed that :(

Will it be acceptable to have something like this then to just ignore the
patches ?

[0-9]*-*.patch

-- 
viresh

