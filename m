Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB6A7914AC
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 11:23:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595044.928519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd5o0-0007Ob-R0; Mon, 04 Sep 2023 09:23:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595044.928519; Mon, 04 Sep 2023 09:23:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd5o0-0007MA-OA; Mon, 04 Sep 2023 09:23:36 +0000
Received: by outflank-mailman (input) for mailman id 595044;
 Mon, 04 Sep 2023 09:23:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LKCA=EU=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1qd5nz-0007Ll-BU
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 09:23:35 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b87feced-4b04-11ee-8783-cb3800f73035;
 Mon, 04 Sep 2023 11:23:34 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4018af103bcso7399605e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Sep 2023 02:23:34 -0700 (PDT)
Received: from EMEAENGAAD19049. ([66.81.173.62])
 by smtp.gmail.com with ESMTPSA id
 s16-20020adfecd0000000b0030ada01ca78sm13967281wro.10.2023.09.04.02.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Sep 2023 02:23:33 -0700 (PDT)
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
X-Inumbo-ID: b87feced-4b04-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1693819414; x=1694424214; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WHihUs1L790Rl4FSQ4WCI66SEc83+rw0NOyAyMvGEnY=;
        b=Oc7/cCGczDjI9MLDwCmVSJBY0r6qg2v1NKj/Fb6J7p4+JZhBdfPxFZs3E7f1g2Ta4A
         ngL+Q7p6SlLF4MQs4zQ3TOymwPr9z3U5Cvy5muNrXihjJ8zflTtfyjL2QRGsRo2NvjwF
         PqJg9EJ+ZGU9ecOPK0jKjnZIDE0TyOvbQ4IXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693819414; x=1694424214;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHihUs1L790Rl4FSQ4WCI66SEc83+rw0NOyAyMvGEnY=;
        b=UrnYkhxNSwqDYjqI9ufcXos86z6yM+Fb/FXF04N9v1H/8rQt/ykxaOTThOL5cr/gVe
         4sX/isltSOiiSfeQnPMCTeajut7aoQ9ndhzpk54zzVzw1DZVTSwLl0EpBXdf2Md4XjUk
         Kjl+9t+S0foYGqu0+UHkvohxkxAft+hF2cZMDLM8U4JG9dD/naJbPuEyFNykascIRIAB
         Cnc3hVoU0wIKDl2+ANAXVQ1sd7arL0iFh4+DRx1hm8zeRd02c8auYXhPfccmqbrMXy3u
         UaZUtwYFB9YEooKvB0rCuxOHB1kFl8uXfQt/ml9HPk5UlqUv/TbiBo0J2wFvpm4YaXj2
         bmmw==
X-Gm-Message-State: AOJu0Yz7FhuhdkM9ZnqSzfg+euTVnUmtoITWpodJV+9nGEIqJoBMon0f
	6cQIOy4mjyvYbLXNikeJsoDSmw==
X-Google-Smtp-Source: AGHT+IFiNNzhj3UM1g9hNaFppljbFyM7x8ig5Bs48+uka2x84d8TfdFed/PnycavvrN3SFpy2lgZug==
X-Received: by 2002:a05:600c:3b8b:b0:400:140c:6083 with SMTP id n11-20020a05600c3b8b00b00400140c6083mr9583482wms.2.1693819413826;
        Mon, 04 Sep 2023 02:23:33 -0700 (PDT)
Message-ID: <64f5a215.df0a0220.8c475.b1b4@mx.google.com>
X-Google-Original-Message-ID: <ZPWiE8u/GhGmoYmu@EMEAENGAAD19049.>
Date: Mon, 4 Sep 2023 10:23:31 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Javi Merino <javi.merino@cloud.com>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] tools/misc/xencov_split: Add python 3 compatibility
References: <20230902162246.15672-1-javi.merino@cloud.com>
 <44f0ee82-2a84-d4fb-15e0-fb74ed1ad2c3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44f0ee82-2a84-d4fb-15e0-fb74ed1ad2c3@suse.com>

Hi,

On Mon, Sep 04, 2023 at 08:51:31AM +0200, Jan Beulich wrote:
> On 02.09.2023 18:21, Javi Merino wrote:
> > Closes #154
> > 
> > Signed-off-by: Javi Merino <javi.merino@cloud.com>
> 
> The title isn't really in line with ...
> 
> > --- a/tools/misc/xencov_split
> > +++ b/tools/misc/xencov_split
> > @@ -1,5 +1,7 @@
> > -#!/usr/bin/env python
> > +#!/usr/bin/env python3
> 
> ... this part of the change, and making Py3 a requirement here (assuming
> that's indeed necessary) surely wants adding a few words as description.
> Grep-ing the tools/ sub-tree I notice that so far we've avoided explicit
> uses of "python3", and I assume we would better continue doing so as on
> a distro with only Py3 a "python3" alias may legitimately not exist.
> 
> Jan
> 
The only credible reason for doing that would be to have scripts compatible
with both python2 and python3. Python2 has been deprecated since 2020 and
it's no longer security supported[1]. No one should be even remotely
encouraged to use that interpreter. The libs it uses are also in similar
positions. The recommended approach is to migrate as much as possible to
python3 and live happily ever after.

On that topic, the official PEP states:

(From https://peps.python.org/pep-0394/)

  Some Linux distributions will not provide a python command at all by
  default, but will provide a python3 command by default.

Which seems to imply the correct shebang is indeed `/usr/bin/env python3`

Thanks,
Alejandro

