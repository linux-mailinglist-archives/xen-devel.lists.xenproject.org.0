Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18046AB3549
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 12:54:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981253.1367649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEQnt-0003qf-Bk; Mon, 12 May 2025 10:54:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981253.1367649; Mon, 12 May 2025 10:54:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEQnt-0003on-8r; Mon, 12 May 2025 10:54:37 +0000
Received: by outflank-mailman (input) for mailman id 981253;
 Mon, 12 May 2025 10:54:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zSlO=X4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uEQns-0003oe-G9
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 10:54:36 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e2c073a-2f1f-11f0-9eb5-5ba50f476ded;
 Mon, 12 May 2025 12:54:35 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5fbeadf2275so7444148a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 03:54:35 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5fc9cc526b2sm5875413a12.47.2025.05.12.03.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 03:54:34 -0700 (PDT)
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
X-Inumbo-ID: 7e2c073a-2f1f-11f0-9eb5-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747047275; x=1747652075; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BBN0CuMjU4DtF7OMUkUGG2u3SbW+xbKSkKjd0jqssQc=;
        b=fUGe4XxCQsxPtX/Uq8gMXRlmauPUwjfoStr21uL1eNHuqakybW728tNMqp4URX/gGR
         cixHnIxsD2XwvcjXGJF/Ib4KiJtEW3CCNtZct91T97X6vnqESpavxKoO0Q+RLSzO0Phy
         2BpYviQ8JfqSYxKzcIFtGQO74RmZCZknhWQ5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747047275; x=1747652075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBN0CuMjU4DtF7OMUkUGG2u3SbW+xbKSkKjd0jqssQc=;
        b=qG7BXVDnaz2gL3c3dEWIrWBAmtcQpEFCBYWpIlefD9wyTbW7lK4v+jQ8xzuf440xrQ
         3ZpW5NWZa5/wQ59jTOop2HM9CJPmVjGRRpVL5Wrixa45ZBmTfzFiH+XEs4w2+LdFv+Lg
         puug4W5balTOUpT9NXKgbS152oTIJ8VZI8MrKeocclj1DiozaJwPsUeFba/2O+FcN9cw
         6XMTQ9AATMAg3/yj3A3p2evzFDTwEcMzD1gAZd/ZA9CsniH01ALj65fvpDvPg89XT25a
         i6D/HdJ8ILB62pES3XhK4Y9U/r6JRQ75nJANEYLObFTk0xZTJQf24uegTnE4ubpiHcrW
         XDCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUM6at0YjhmnQ/HJqbm/XZmisrXqWF94dtqczWXsGZnUFDjrrx9F5Ij+sluu4M2TVvz+qZEbS8ShKo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwdNwzS3p92GqwtJjwCGvCHU6l67lE3q6zgOd7dZ2NOm4uwamTL
	upHApSCuEnzOzWYyQYHF2DhZ1Ay1SB2nq5aHJYk23TwXmXZ7WxqcPUg3lB76QlI=
X-Gm-Gg: ASbGncs7Z0kG+Ytbrgjs6PpDEuELhqYsXaoGA82+KQfwpryAEqbCLqtrupslBVGf7oA
	SedV2AM8gFB6jI+SKKe5OXYTe79zXMydZwYjTRpvjtDROziVlyiaOID8C3Yeqz3o7ppgw2q7Q0r
	YvZ4Pns9b//YuRLESi9Ql12F2EFFUENXrWKePW15TvbvMODlFDWd0Gjszc7NiAedG/GfkMl/oTX
	3wEf81c5t6F0Xd/SPfKq1c3AvTfRbUD7qMkN4WMOckkT65d7EFErT3IgX1m9Ndj0CkpcPQ/wkdA
	96tGwTJdnOsqgj163YHloQjRMSKTL4NWYBr9aRVHxiLKqRZoFhaVT3pFonyzFWD1VVk=
X-Google-Smtp-Source: AGHT+IHD2f77ywL3B21GRApmHpRsawiGU9swwnPdlDwO+YT5CRYiXzQkQCkfV2nqVNieOouXYb3bvQ==
X-Received: by 2002:a05:6402:51c9:b0:5fd:1972:7fac with SMTP id 4fb4d7f45d1cf-5fd197298d5mr5888634a12.3.1747047275038;
        Mon, 12 May 2025 03:54:35 -0700 (PDT)
Date: Mon, 12 May 2025 12:54:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Kevin Lampis <kevin.lampis@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] livepatch: Pass buffer size to list sysctl
Message-ID: <aCHTaXClFFRUX2tv@macbook.lan>
References: <20250508170156.558291-1-ross.lagerwall@citrix.com>
 <e9f0e66c-a05d-4e95-9446-435d9ca51753@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e9f0e66c-a05d-4e95-9446-435d9ca51753@suse.com>

On Mon, May 12, 2025 at 11:51:35AM +0200, Jan Beulich wrote:
> On 08.05.2025 19:01, Ross Lagerwall wrote:
> > @@ -1328,10 +1327,15 @@ static int livepatch_list(struct xen_sysctl_livepatch_list *list)
> >              status.rc = data->rc;
> >  
> >              name_len = strlen(data->name) + 1;
> > -            list->name_total_size += name_len;
> > -
> >              metadata_len = data->metadata.len;
> > -            list->metadata_total_size += metadata_len;
> > +
> > +            if ( (name_total_copied + name_len) > list->name_total_size ||
> > +                 (metadata_total_copied + metadata_len) >
> > +                 list->metadata_total_size )
> > +            {
> > +                rc = -ENOMEM;
> 
> -ENOBUFS or maybe -ENOSPC, but certainly not -ENOMEM.

Jan, are you fine if I replace with -ENOBUFS on commit?

Thanks, Roger.

