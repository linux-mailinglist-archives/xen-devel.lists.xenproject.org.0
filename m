Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 462DD792102
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 10:28:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595446.929009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdRPz-0006ha-6f; Tue, 05 Sep 2023 08:28:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595446.929009; Tue, 05 Sep 2023 08:28:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdRPz-0006fT-3S; Tue, 05 Sep 2023 08:28:15 +0000
Received: by outflank-mailman (input) for mailman id 595446;
 Tue, 05 Sep 2023 08:28:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=91v+=EV=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1qdRPx-0006fN-J3
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 08:28:13 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 263fc912-4bc6-11ee-9b0d-b553b5be7939;
 Tue, 05 Sep 2023 10:28:11 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4018af1038cso22014265e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Sep 2023 01:28:11 -0700 (PDT)
Received: from EMEAENG6DZjqCfH.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 h8-20020adf9cc8000000b0031c612146f1sm12673344wre.100.2023.09.05.01.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 01:28:10 -0700 (PDT)
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
X-Inumbo-ID: 263fc912-4bc6-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1693902491; x=1694507291; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tVQXMOxpCGwUKl9lu7b1EV2nD/VVtAUfSccL9u2mm/U=;
        b=iT3pQf/HzJOtcVHVYaF+8fl7NbJu4ufkGYOwDirwOMtPGeJcnDHpI/N9Qw5ChC3HY3
         5pl/m4lYa7v1NXsGPOJt7r756kvwLF/GQMOuZjcG9t21+BknrAgStYmyEN4ifbhMTAjm
         HXLEM4heiShFH99M2Aw4f2ptLqUCIxg5d/fR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693902491; x=1694507291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVQXMOxpCGwUKl9lu7b1EV2nD/VVtAUfSccL9u2mm/U=;
        b=gFFaCRxaMjhh315HhbdsXaArzvpKyS7GTKYssjwVtSwwJQDQJzH2bNKECfTo2KrfVa
         gSCghzhGLP2ZdZfXU7xDMbGVhGSvmkPCxFp22mKFj8bAanRmINZnEC+0vckKGgBeY93O
         TtCYIoj5uVgfhsk3hqX1NfNxqoHkoy+4IYy9sDf2bH1v3a1Xi/D4jV2hmDidwUhih2Zd
         59MAdy+o9yxwpj8TylvGYOcb07cyRVV9DDuSszw2IiPdVFjo/hz0hg1WnDsb9z2+7ICE
         MvdZVPgA8yOkLZfCfgXAcQYE4BuPitLoFekm6XZu5PQ3W8zeO2WegYmzyIlHT+VG9RwA
         iZ6w==
X-Gm-Message-State: AOJu0YyjkUtcxDyiutCpSmYfpoXtCWR3q9tjZGixr3ZCGieag0bWRAdh
	UjTrYx8VMQrRAkh1fPqHwamktw==
X-Google-Smtp-Source: AGHT+IGqfY/NDSTjZ/eF460BiwEZfNswFYtExa9ot2ddtUrdr9pSXTjeOv3BYnsW1R+tY47J51dH6w==
X-Received: by 2002:adf:ef91:0:b0:317:69d2:35be with SMTP id d17-20020adfef91000000b0031769d235bemr9586843wro.30.1693902490810;
        Tue, 05 Sep 2023 01:28:10 -0700 (PDT)
Date: Tue, 5 Sep 2023 09:28:10 +0100
From: Javi Merino <javi.merino@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] tools/misc/xencov_split: Add python 3 compatibility
Message-ID: <g5mxlivacq4jsx67vpolxofe6y5lknns6cfqxujg4bjaavozo2@otl4fqobhoah>
References: <20230902162246.15672-1-javi.merino@cloud.com>
 <44f0ee82-2a84-d4fb-15e0-fb74ed1ad2c3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <44f0ee82-2a84-d4fb-15e0-fb74ed1ad2c3@suse.com>

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

A distro with only Python 3 would still have to provide a python3 binary:

  We expect Unix-like software distributions (including systems like
  macOS and Cygwin) to install the python2 command into the default
  path whenever a version of the Python 2 interpreter is installed,
  and the same for python3 and the Python 3 interpreter.

https://peps.python.org/pep-0394/#for-python-runtime-distributors

Having said that, PEP 394 recommends script publishers to leave the
shebang line as "#!/usr/bin/env python" so I will revert this change in
v2.

Cheers,
Javi

