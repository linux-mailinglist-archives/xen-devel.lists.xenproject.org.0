Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2C384CE57
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 16:45:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677791.1054635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXk69-000764-1j; Wed, 07 Feb 2024 15:44:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677791.1054635; Wed, 07 Feb 2024 15:44:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXk68-000732-VG; Wed, 07 Feb 2024 15:44:28 +0000
Received: by outflank-mailman (input) for mailman id 677791;
 Wed, 07 Feb 2024 15:44:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9378=JQ=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rXk67-00072w-8u
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 15:44:27 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5a683f8-c5cf-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 16:44:26 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-55fcceb5f34so812935a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 07:44:26 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 rn3-20020a170906d92300b00a3829e6015fsm879229ejb.55.2024.02.07.07.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 07:44:25 -0800 (PST)
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
X-Inumbo-ID: c5a683f8-c5cf-11ee-8a49-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707320665; x=1707925465; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z0SbiVzdSKRqvmXr/5qOJD7ln6HcULYsjafGA9w2GiU=;
        b=XFEozJ++suDjF3Xz5BDHVFVi+O4LnyFlNV2n3MGEbUf4ZunC4VVu4rooIsWdxdk/nD
         sNJwXOIo1qzePOyODklDUxBBb2BsQ0ABq3Z5uf7F7VxgKnkavdrXCdDhrXH8Oftx/RfZ
         1fzJdeH3pB0Yg1NvM5TpOTaGPKoX063t+6RSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707320665; x=1707925465;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z0SbiVzdSKRqvmXr/5qOJD7ln6HcULYsjafGA9w2GiU=;
        b=dzYS5sG+1pJ9p7Aour0z9lZin7xvEPtMufZqkg5WiBKDZ6eKtFrlIW4bAaQ1C7XoGD
         cd4J4olLddJ0NdIAfK31plDNcpi3ZIsA3eqnC4IYGId/0Y5Q/IBeq5gubB1LHUy0gyK4
         pdwjiHIPKplniAiIcNOAFEEz9s+zIUVmtbBLfIyrMlgxk7O3ZwX1e+qLvQvHho86W+DN
         PE1/xpv7jr0dJa/fKMUK+ZGIJLc3HrpaHOSa55pALUxt32rTLdnCmgjQV9jBLqCESy7p
         CIwJ3ICUb94qaj8kosPah2HOSvtnSumn+fjBQi+GDZVYYoAU6sRSGfFAtPAgKORFISus
         lsIw==
X-Gm-Message-State: AOJu0YzJ4QirLcghgSILWqII99B0c8A3crj7L0eXXJcjCG+XjARVT6CN
	wiFSoKocyGpPj1DtoUlaB5sYVQwTFTI5EkYfKMu8C2VfathdnHzwUysx9kJWKHc=
X-Google-Smtp-Source: AGHT+IE1dUnzCIYzDNduPTL/tRNq9CGTMsHr+tgi9BU1MUh+eQHb47nQ24eX3eLZLZwuGjqXrXqVtA==
X-Received: by 2002:a17:906:ee1:b0:a37:3881:77e with SMTP id x1-20020a1709060ee100b00a373881077emr4244826eji.45.1707320665623;
        Wed, 07 Feb 2024 07:44:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUeeI7d3NlyXuANJ6W7RN37SHBDWakgO0WuOei3jnX36TkD8FOIdxtpEIW03N6vXUKqsO2A6KtshOTq
Date: Wed, 7 Feb 2024 15:44:24 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: zithro <slack@rabbit.lu>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/xentop: add option to display dom0 first
Message-ID: <5f6c6a52-9ef1-4db2-9e5e-2ca916bdf225@perard>
References: <87846acd5b31991e38561c9765eb97730c79d0f3.1706723494.git.slack@rabbit.lu>
 <a8194dec-70f0-4f90-898d-f15152a5018b@perard>
 <1f2fab6d-6eaf-4e32-a124-cf1042c31312@rabbit.lu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f2fab6d-6eaf-4e32-a124-cf1042c31312@rabbit.lu>

On Tue, Feb 06, 2024 at 03:38:05PM +0100, zithro wrote:
> On 05 Feb 2024 18:27, Anthony PERARD wrote:
> > On Wed, Jan 31, 2024 at 06:51:34PM +0100, Cyril Rébert wrote:
> > > Add a command line option to xentop to be able to display dom0 first, on top of the list.
> > > This is unconditional, so sorting domains with the S option will also ignore dom0.
> > > 
> > > Signed-off-by: Cyril Rébert (zithro) <slack@rabbit.lu>
> > Your patch looks like a good idea
> 
> Thanks, I also have a "display dom id column" in the pipes, almost ready to
> send, but I found kind of a bug doing this (field_id/fields offsets off by
> one).
> Are there "most wanted functionnalities" concerning xentop, while I'm at it
> ? There's a TODO in xentop's folder.

That TODO file is 18 year old, and never been touch since. I don't know
how relevant it is. As for wanted features, I'm not aware of such list.

> Things I'd like to add, if possible, is domain management (pause/unpause,
> maybe shutdown/destroy), columns hiding and domains hiding.

I'm slightly worried about adding domain management, what if someone hit
the wrong key and kill a domain when they just wanted to do something
else, but I guess we can make domain management work more or less
safely. In any case, any feature is welcome.

> > but xentop segv without '-z' now, when there are guest running.
> 
> I failed at the strict minimum here, should have tested ... Sorry for
> wasting your time !

No worries, and your patch was reviewed so you didn't failed to the
strict minimum ;-).

> Bug spotted ("sort_start" incorrectly initialized), will post a v2.
> 
> > Revelant part of a backtrace:
> > #0  xenstat_domain_name (domain=0x121) at xenstat.c:344
> > 344		return domain->name;
> > #6  0x00006344dd283651 in top () at xentop.c:1209
> >          i = 2
> >          num_domains = 2
> >          sort_start = 1
> >          sort_count = <optimized out>
> >          dom0_index = <optimized out>
> > 1209		qsort((domains+sort_start), (num_domains-sort_count), sizeof(xenstat_domain *),
> > 1210		      (int(*)(const void *, const void *))compare_domains);
> 
> What soft did you use to get that output ? A debugger ?
> (It's a real question, I'm a noob).

I've used `gdb`, the GNU Debugger. There's plenty of tutorial on the
internet on the few commands that are useful to get started. And you can
run your program with gdb or run it on a coredump.

What I pasted, is a mixture of running the command `bt full`, and `list`
and `up`/`down` to get to the function I wanted to print a bit of the
source code.

Cheers,

-- 
Anthony PERARD

