Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 364D87C6FBE
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 15:52:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615792.957220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqw74-00080L-8c; Thu, 12 Oct 2023 13:52:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615792.957220; Thu, 12 Oct 2023 13:52:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqw74-0007y4-5o; Thu, 12 Oct 2023 13:52:30 +0000
Received: by outflank-mailman (input) for mailman id 615792;
 Thu, 12 Oct 2023 13:52:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Y9O=F2=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1qqw72-0007xy-L0
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 13:52:28 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93946b19-6906-11ee-9b0e-b553b5be7939;
 Thu, 12 Oct 2023 15:52:26 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9b96c3b4be4so154045566b.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Oct 2023 06:52:26 -0700 (PDT)
Received: from EMEAENG6DZjqCfH.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 lc11-20020a170906f90b00b009b9aa8fffdasm11038954ejb.131.2023.10.12.06.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 06:52:25 -0700 (PDT)
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
X-Inumbo-ID: 93946b19-6906-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1697118746; x=1697723546; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NcL6JSviC6YZf7YuV65cuTS2dEqFCTe/yN7wJWGmdeM=;
        b=TqTjBAIilchyWpHWf+35U5EJiYT/Lwth25bmBP86duTnJkvRDeykBpuDbkLGlR1Rwf
         7UIqmhQdtp22ioJpPzh4+tzljDuXXLuT3i7+yNHWv5YjEqzkpZTJN+p2zT2dpCyR548j
         xRs/ojskwrPOhCF5A4gD0fhCrIlLfJX7XqL70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697118746; x=1697723546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NcL6JSviC6YZf7YuV65cuTS2dEqFCTe/yN7wJWGmdeM=;
        b=nf/SHBaGQyEiKi2GZ8dzxA5I5OZ88Lm1aAwEU77VwjsM5aju6/STU6CfeR5JSX5S4h
         QsUv2f+69B9lBi5EGqGbiYRowQRt8k65jf+8G9DzyR9m8o89mwBJo6eh8g86opvhniSF
         IIlYwyryLrba/5p//NUexP+UT9y94qxgAbrwPf5HKfZ2DwKToRB5ZADINSuth3BbeEUB
         Hwx3TAJ5gIAAdyzCL34HrwcIuhtavFvjtMUjF5uDlubw7pyBVyuAHjDnGCkaIWlEvU6N
         XSsQZspL+GpdfB/wh7Z+S50Ee2Px00+7ikvwlnABqGgHtRMxCTXQwIq17LlyRfA0VLir
         yDpQ==
X-Gm-Message-State: AOJu0Yzu7XKMBn7bebaRjxJsM3KZz8mNRcaokh3U/uDJLCm960HI4iJX
	HPfPBBSMtaX7XMS0RW1MBLEUoQ==
X-Google-Smtp-Source: AGHT+IHmhCep1PaCawTk8YLG4yYXJMLOnyrIaYIXGKG4JmR1bsamrlAHACZKFuYieDWn/5Yf74mMCQ==
X-Received: by 2002:a17:907:778b:b0:9b2:df16:851d with SMTP id ky11-20020a170907778b00b009b2df16851dmr19904123ejc.57.1697118745711;
        Thu, 12 Oct 2023 06:52:25 -0700 (PDT)
Date: Thu, 12 Oct 2023 14:04:06 +0100
From: Javi Merino <javi.merino@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [XEN PATCH v1] tools/python: Add python3 compatibility
Message-ID: <6oqpexjqm4hbt7sqndfu7iowtcjynec74nmlrrxolr6blpod4o@6rdriz7tixda>
References: <efb10e537e37df1995dd8f87c28a8eb64ec9b61e.1696947009.git.javi.merino@cloud.com>
 <2ef1f6b6-9b50-4e77-abad-fa046eb2ca0a@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2ef1f6b6-9b50-4e77-abad-fa046eb2ca0a@citrix.com>

On Wed, Oct 11, 2023 at 12:34:27AM +0800, Andrew Cooper wrote:
> On 10/10/2023 10:18 pm, Javi Merino wrote:
> > Most of the work for python3 compatibility was done in
> > 1430c5a8cad4 (tools/python: Python 3 compatibility, 2019-12-18).  This
> > just adds a few builtins needed for python3.
> >
> > Resolves: xen-project/xen#156
> >
> > Signed-off-by: Javi Merino <javi.merino@cloud.com>
> > ---
> >
> > I haven't tested it.
> >
> >  README                                     | 1 +
> >  tools/python/scripts/convert-legacy-stream | 3 +++
> >  2 files changed, 4 insertions(+)
> >
> > diff --git a/README b/README
> > index 855db01d36..44ed88c392 100644
> > --- a/README
> > +++ b/README
> > @@ -51,6 +51,7 @@ provided by your OS distributor:
> >      * POSIX compatible awk
> >      * Development install of zlib (e.g., zlib-dev)
> >      * Development install of Python 2.7 or later (e.g., python-dev)
> > +      - If using Python 2.7, you also need the future module.  This is not needed for Python 3.
> >      * Development install of curses (e.g., libncurses-dev)
> >      * Development install of openssl (e.g., openssl-dev)
> >      * Development install of x11 (e.g. xorg-x11-dev)
> > diff --git a/tools/python/scripts/convert-legacy-stream b/tools/python/scripts/convert-legacy-stream
> > index 7fe375a668..26a66c50fc 100755
> > --- a/tools/python/scripts/convert-legacy-stream
> > +++ b/tools/python/scripts/convert-legacy-stream
> > @@ -8,6 +8,9 @@ Convert a legacy migration stream to a v2 stream.
> >  from __future__ import print_function
> >  from __future__ import division
> >  
> > +from builtins import zip
> > +from builtins import range
> > +from builtins import object
> 
> It can't be object because most other scripts use it just fine in py2
> and py3.

This just makes the VM() class behave like python3: str(vm) will
return a unicode string.  After a quick glance at the code I don't
think the code currently does this, but at least the behaviour will
now be consistent between the two versions.

> There's only one single use of zip and range in this script, and range
> is clearly fine (although it wants to be xrange() on py2 and we do
> opencode that places), so I'm guessing the problem is with zip(), but
> it's not exactly clear why?

These changes just make the code be more consistent between python2
and python3.  As I said under the commit message, I have not tested
the changes.

Cheers,
Javi

