Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA713786D12
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 12:48:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589942.922022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ7tA-0003RZ-Ih; Thu, 24 Aug 2023 10:48:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589942.922022; Thu, 24 Aug 2023 10:48:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ7tA-0003Od-Es; Thu, 24 Aug 2023 10:48:32 +0000
Received: by outflank-mailman (input) for mailman id 589942;
 Thu, 24 Aug 2023 10:48:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IVrA=EJ=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qZ7t9-0003OX-HM
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 10:48:31 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3637d0a-426b-11ee-8783-cb3800f73035;
 Thu, 24 Aug 2023 12:48:30 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3ff1c397405so14212355e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Aug 2023 03:48:30 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 t7-20020a5d49c7000000b00317ab75748bsm21674115wrs.49.2023.08.24.03.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 03:48:29 -0700 (PDT)
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
X-Inumbo-ID: c3637d0a-426b-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1692874110; x=1693478910;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K2JtP9LCxTQskLIXpTwYxhJvoQGqVrzaB2jkej71Ne0=;
        b=B8rNakSJ+bvSu02v1VzfKAAiIFxYIEtNocNHx7XqjjnNy8UDSS+6HWOFyjpKnsf12V
         FI7HJoPNQ+dgaDnRLXcSkA1wbibKiyoh9az/lq3pQPStF63/hBmM2NZTFoSqcmwDdHm+
         MkJQnjkd/yk3UIEg8RyFE7KtdSuhq2MHWfKHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692874110; x=1693478910;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K2JtP9LCxTQskLIXpTwYxhJvoQGqVrzaB2jkej71Ne0=;
        b=hqlxzmmZ4XYrBg5L8Lwyx5b0DEZ0rwGVre6CZCNStHJZbHRnQWRebWQos7hVY4e4qw
         KWaJFb4xismmpIOcRbBtBB+kq1pQgHX62IEUJGnDf0f4VSHOWIAj7bEWi9KX8nFn9Z9h
         pDcf8PohJFBzdthGBtwRb01uRdpqXBCfrKjiiYGzXDHob89RdGeXzezFHrMYji+Mk39I
         k9D1qJAcUakpmTwqWim6WQGI1qChql8rN45U+kZyCCcfvQiOdhlFkZz1/fTGdlrL2ZEB
         vc1oofuvR9/KMd23cZXKLMKmBOs2jeae+u/S1gOf2fTuYbzE9eb+pVtt+q9i75xCrA3k
         Q5aQ==
X-Gm-Message-State: AOJu0YxfXqpAcr1QtUUTJ3ehSSbOFZ8z5m+56mSpvqOFfncyEgLt5THI
	a/cAaj5e1rKS8p63xRXN+1txww==
X-Google-Smtp-Source: AGHT+IHDxWSnQvagabhOPczjajBT3Ie2XATwU7p58MGVZZspSBH3lMqXeaYV601llys4mkU9OAs49w==
X-Received: by 2002:a5d:62c6:0:b0:31a:d773:51a5 with SMTP id o6-20020a5d62c6000000b0031ad77351a5mr11626529wrv.27.1692874109727;
        Thu, 24 Aug 2023 03:48:29 -0700 (PDT)
Date: Thu, 24 Aug 2023 11:48:29 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] CI: Always move the bisect build log back
Message-ID: <e244560c-301f-411c-a490-c26364f3ef96@perard>
References: <20230823152334.8867-1-anthony.perard@citrix.com>
 <59a39677-5959-82cc-804f-4642d2cb2041@citrix.com>
 <f300fec6-9139-4ab9-959e-35397967446d@perard>
 <3d1a3638-603a-b918-596c-03557f139d6e@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d1a3638-603a-b918-596c-03557f139d6e@citrix.com>

On Thu, Aug 24, 2023 at 10:51:20AM +0100, Andrew Cooper wrote:
> On 24/08/2023 9:52 am, Anthony PERARD wrote:
> > On Wed, Aug 23, 2023 at 07:05:56PM +0100, Andrew Cooper wrote:
> >> On 23/08/2023 4:23 pm, Anthony PERARD wrote:
> >>> On failure of "build"-each-commit script, the next command that move
> >>> the log back into the build directory isn't executed. Fix that by
> >>> using "after_script" which is always executed even if the main
> >>> "script" fails. (We would still miss the log when the jobs times out.)
> >>>
> >>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> >>> ---
> >>>  automation/gitlab-ci/test.yaml | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> >>> index 810631bc46..5099f2e6b6 100644
> >>> --- a/automation/gitlab-ci/test.yaml
> >>> +++ b/automation/gitlab-ci/test.yaml
> >>> @@ -140,6 +140,7 @@ build-each-commit-gcc:
> >>>      CC: gcc
> >>>    script:
> >>>      - BASE=${BASE_SHA:-${CI_COMMIT_BEFORE_SHA}} TIP=${TIP_SHA:-${CI_COMMIT_SHA}} ./automation/gitlab-ci/build-each-commit.sh 2>&1 | tee ../build-each-commit-gcc.log
> >>> +  after_script:
> >>>      - mv ../build-each-commit-gcc.log .
> >>>    artifacts:
> >>>      paths:
> >> Thanks for looking into this, and yeah that is dumb, but why play games
> >> with the parent directory?
> > `git clean -ffdx` has the tendency to remove everything that's not
> > committed, that's why. But maybe we can teach ./build-each-commit.sh to
> > ignore that logfile.
> 
> Oh, right.  Yeah, lets not lose the log file like that.
> 
> I'd say that teaching `git clean` to leave the file interacted and not
> copying it is going to be a more robust option.

Yep, just tried that. But "Tree is dirty, aborted" :'(

./build-test.sh refuses to run if there's something in the git worktree.

This test is going to need more rework to be useful in the gitlab-ci.

-- 
Anthony PERARD

