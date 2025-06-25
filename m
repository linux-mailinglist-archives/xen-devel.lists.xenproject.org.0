Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C23AE88E1
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 17:55:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1025286.1400915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUSTE-0000IE-2Z; Wed, 25 Jun 2025 15:55:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1025286.1400915; Wed, 25 Jun 2025 15:55:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUSTD-0000FD-Vs; Wed, 25 Jun 2025 15:55:31 +0000
Received: by outflank-mailman (input) for mailman id 1025286;
 Wed, 25 Jun 2025 15:55:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+7fe=ZI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uUSTC-0000F7-Sf
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 15:55:30 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d17f4105-51dc-11f0-a30f-13f23c93f187;
 Wed, 25 Jun 2025 17:55:30 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a54700a46eso1196824f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 08:55:30 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a6e8114697sm5044424f8f.98.2025.06.25.08.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 08:55:28 -0700 (PDT)
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
X-Inumbo-ID: d17f4105-51dc-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750866929; x=1751471729; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7buStalg0deP2mOBjFco5ld6+7SBqWlQLcb6PvVK9Vw=;
        b=fiknQgPdqntTHQBVXhjv9+zI91sLSPpas2+dVz/CDa3vzUXPvoqTGJKKsOk3QcOkQH
         saGe4wUdys6ZVjmp/B5TYtz6hSavSM7ap6BHZjfff0lWGxeRblqGI3vJd69pEldggUTM
         1LOCDYf3AsHuZIDK/kVtO8YBCXTTNYevluPjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750866929; x=1751471729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7buStalg0deP2mOBjFco5ld6+7SBqWlQLcb6PvVK9Vw=;
        b=KjD6eC0ttQBPg8wL9iDCzu/0zo9pw/iREHB6CDVQxRa+Hw1ykPqKgqYFtwiDyi8rGu
         MGXAhjkKkGmuGmJcXqFtZ8XgV6udW3P2CcpQXidK2B9jRaJqXhRsxWWTilK7lGfJe032
         x9UpQpwM2LJLq6xEpVs4eU5XaVq9vy3zyOcjo6bn6y8iMCA6QntibZri4KGl7ki261u0
         eK1Lprf6ZkBwYhu44y4nuNFcFO1+0MSxoZviSkPr/O8NfoH5Qrwjq+5L6YCOz5xz9go4
         /QFxhSQmEu4J6r4Qjm1PjIYv0NnExYia88hDbtqdPtOTh75vLJBBuVYljEt8prIr76UF
         WtpA==
X-Gm-Message-State: AOJu0Yxf7bJH/nSJts1TmEcBO16oP9TnZ9PTDqz/BpFWPWPw2lE04hfl
	hTlteGKbS9hGGT8VyqBd2hBl9kf8ifOl6Rm6ukpj+2tVn/FECFJKU9xUcxghxSfKkqI=
X-Gm-Gg: ASbGncsWdHOj8Q7UrSYcHwsPE9rNcq/jEYNt3UokQMMtvp50Iu4tjdymYq0A+5iRBAl
	6oUdHGNcBcmhTOY/8OWPXRXl87Y2KpMxeYdHBA4Ax32wtihY7NgKzMGMGd5PpIn4HSKEmsnJRmW
	EHRnmIQHa0jNAeBoLg4409Pbm4iZTGk4QRvDrtTUf0GkjCxdsM0Xam/gUhYFUGIqSj3RVHr/VIV
	Pg2byaYsUiBK1RKp3VJt9JXy4JaG4e/N/rAPUy1O4wi2HHzK9vpk2lKLShTsKl5AHHvANbmn5l5
	mzAUzXwfPT5litfp1yThXGP/tqw4yfHP1OA/DpOwKsvI5G/Gq+8BUCLVdPpHSM6iqdEMsc05nOD
	RRk+nEYmMDF/oaZDX/mvfbkKHzu9jqSK6GHsd1FCF
X-Google-Smtp-Source: AGHT+IExt9KwI27fmbyPyE/KN2wDLDbVv0JX3TdiSnvsF3v/bvY8nLZ0j2tbCubOiBAKjupFUH8D6Q==
X-Received: by 2002:a05:6000:2084:b0:3a5:42:b17b with SMTP id ffacd0b85a97d-3a6ed65e60fmr2699081f8f.29.1750866929324;
        Wed, 25 Jun 2025 08:55:29 -0700 (PDT)
Date: Wed, 25 Jun 2025 17:55:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 6/8] test/pdx: add PDX compression unit tests
Message-ID: <aFwb8E_-2rCbyO-_@macbook.local>
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <20250620111130.29057-7-roger.pau@citrix.com>
 <aFqqHtRPmbndhcnK@l14>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aFqqHtRPmbndhcnK@l14>

On Tue, Jun 24, 2025 at 03:37:34PM +0200, Anthony PERARD wrote:
> On Fri, Jun 20, 2025 at 01:11:28PM +0200, Roger Pau Monne wrote:
> > +.PHONY: run
> > +run: $(TARGETS)
> > +ifeq ($(CC),$(HOSTCC))
> > +	for test in $? ; do \
> > +		./$$test ;  \
> > +	done
> 
> You need to add `set -e` or the exit value from the tested binary might
> be ignored. This `run` target only failed if the last test binary return
> a failure.

Oh, I did see it failing, but both tests at teh same time, that's why
I didn't notice that only the first failing won't be reported.

> > +else
> > +	$(warning HOSTCC != CC, will not run test)
> > +endif
> > +
> > +.PHONY: clean
> > +clean:
> > +	$(RM) -- *.o $(TARGETS) $(DEPS_RM) pdx.c pdx.h
> 
> Is this "pdx.c" left over from version? It doesn't seems to be generated
> by this makefile.

Yeah, it's a leftover from the previous version where I was also
making a local copy of pdx.c.

> > +
> > +pdx.h: $(XEN_ROOT)/xen/include/xen/pdx.h
> > +	sed -E -e '/^#[[:space:]]?include/d' <$< >$@
> 
> Why allow only zero or one space characters between '#' and
> "include"? Why not used '*' instead of '?' ?

Because that's all we currently use in the header, but I can indeed
switch to * just in case we gain includes with more spaces.

Thanks, Roger.

