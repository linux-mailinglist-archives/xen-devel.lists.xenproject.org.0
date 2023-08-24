Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2343D786AC1
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 10:53:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589819.921857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ64r-0007Sv-Tx; Thu, 24 Aug 2023 08:52:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589819.921857; Thu, 24 Aug 2023 08:52:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ64r-0007QG-Q2; Thu, 24 Aug 2023 08:52:29 +0000
Received: by outflank-mailman (input) for mailman id 589819;
 Thu, 24 Aug 2023 08:52:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IVrA=EJ=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qZ64q-0007QA-G8
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 08:52:28 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c60415e-425b-11ee-8783-cb3800f73035;
 Thu, 24 Aug 2023 10:52:26 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-31c3726cc45so3895118f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Aug 2023 01:52:26 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f7-20020adff587000000b0031c77c010e1sm1309277wro.96.2023.08.24.01.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 01:52:25 -0700 (PDT)
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
X-Inumbo-ID: 8c60415e-425b-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1692867145; x=1693471945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u9yuqKBjLGODbIzKlCy5tUJ2CK+3GRmsqjcPhGzbxIM=;
        b=SsFsruNL1UyiCxGxaFYgn7RTDOUouoBE4jYE9Pi0QsY7schaR/khIIcQBPFc+bGHim
         7eUK85x4DBh+OFncoMDk4St4AWW1vI+x1WQMGbQ+U+XikJJoqxXL2/LlnXlxjjiHJNsT
         welZBZrZgcfFiqeMP4BgCjbBjNOfq7H/zmM3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692867145; x=1693471945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u9yuqKBjLGODbIzKlCy5tUJ2CK+3GRmsqjcPhGzbxIM=;
        b=ZrR5HPYRYfEvmohbTHY1bo8dVACXRmhmcyS56Nu82gjxZtkbBwUsnDOS4pUogBkd+E
         QznTLs6/AMxvLgCG82P1i6zMntr9kkbTyrpb8RnRXBPkZsF5Unicyh4uWPr4vzlqaCZ7
         lLzm/aohmf3uUsA0mSUQFcVs9I3Taj0MMVXUhfCZQ4UFG36IhkkfUZ0d+kEgKkXd25lQ
         /jIluHwweTCgp0txOd2lUW3u3Lreg5IVSdQj77UtpZKNrKd8gMA6GnQiD+5uVvG7+oPw
         SrW4AbzlGzS28Y2MtJvaXydtWiiqRnVl3MgSQr+9ZODRRToOgnUswgbRMgbvvLJ/LHSU
         xUIw==
X-Gm-Message-State: AOJu0YxFKFoy9IaqNI16K1hHMzydgZwgrA/sEL52qrFNDA1tpL3mQumI
	cx1D3bMV084ZRgm0ZxjCzhRQ7g==
X-Google-Smtp-Source: AGHT+IGaIJSs3CyPDWr/5Xz/zLNMgnlRrlp5Vcbtn5oZHJmu75pfjcUKXHTXRDXzV2Wz/askZPKJXw==
X-Received: by 2002:adf:edca:0:b0:31a:d7fc:28f with SMTP id v10-20020adfedca000000b0031ad7fc028fmr12277789wro.19.1692867145577;
        Thu, 24 Aug 2023 01:52:25 -0700 (PDT)
Date: Thu, 24 Aug 2023 09:52:24 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] CI: Always move the bisect build log back
Message-ID: <f300fec6-9139-4ab9-959e-35397967446d@perard>
References: <20230823152334.8867-1-anthony.perard@citrix.com>
 <59a39677-5959-82cc-804f-4642d2cb2041@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59a39677-5959-82cc-804f-4642d2cb2041@citrix.com>

On Wed, Aug 23, 2023 at 07:05:56PM +0100, Andrew Cooper wrote:
> On 23/08/2023 4:23 pm, Anthony PERARD wrote:
> > On failure of "build"-each-commit script, the next command that move
> > the log back into the build directory isn't executed. Fix that by
> > using "after_script" which is always executed even if the main
> > "script" fails. (We would still miss the log when the jobs times out.)
> >
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> > ---
> >  automation/gitlab-ci/test.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> > index 810631bc46..5099f2e6b6 100644
> > --- a/automation/gitlab-ci/test.yaml
> > +++ b/automation/gitlab-ci/test.yaml
> > @@ -140,6 +140,7 @@ build-each-commit-gcc:
> >      CC: gcc
> >    script:
> >      - BASE=${BASE_SHA:-${CI_COMMIT_BEFORE_SHA}} TIP=${TIP_SHA:-${CI_COMMIT_SHA}} ./automation/gitlab-ci/build-each-commit.sh 2>&1 | tee ../build-each-commit-gcc.log
> > +  after_script:
> >      - mv ../build-each-commit-gcc.log .
> >    artifacts:
> >      paths:
> 
> Thanks for looking into this, and yeah that is dumb, but why play games
> with the parent directory?

`git clean -ffdx` has the tendency to remove everything that's not
committed, that's why. But maybe we can teach ./build-each-commit.sh to
ignore that logfile.

Cheers,

-- 
Anthony PERARD

