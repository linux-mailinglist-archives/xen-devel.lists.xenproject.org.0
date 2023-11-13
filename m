Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 239147E9FB9
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 16:16:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631675.985254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2YfZ-00021B-B7; Mon, 13 Nov 2023 15:16:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631675.985254; Mon, 13 Nov 2023 15:16:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2YfZ-0001yy-8U; Mon, 13 Nov 2023 15:16:09 +0000
Received: by outflank-mailman (input) for mailman id 631675;
 Mon, 13 Nov 2023 15:16:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QLDR=G2=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1r2YfX-0001gb-Ew
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 15:16:07 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f489b69-8237-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 16:16:03 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-32fdc5be26dso2771038f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 07:16:03 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f14-20020a056000128e00b003313069be5dsm5624334wrx.46.2023.11.13.07.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 07:16:02 -0800 (PST)
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
X-Inumbo-ID: 8f489b69-8237-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699888563; x=1700493363; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9MmDkhPYBRMjt8mnQHxCz06R53YhTBbwfJINJtK0Zk0=;
        b=ITW7BCsYQNqHSbgD0iapNdd5cMG0uYaWo8+5Ls+bXJ73oMa2fUzAYA5G+1aUMdeYw3
         X20DG/SfKY9yF7PCPbHYuqlaFSzGsrnrqmATbIZI0OeY6trP6DsLECHB+3Fu3zCTUaG4
         gUrp1btLyO7pq7hUnty35xrpDplBnWKLsPG9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699888563; x=1700493363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9MmDkhPYBRMjt8mnQHxCz06R53YhTBbwfJINJtK0Zk0=;
        b=o2km3BZstqR38qG/bvEyE/er8D3rFWwtbK99ykV2PwC2SX5KGaemCMMZcwsMeHz+/t
         8SjmxWS1FHxQySWNrlmziUk6Z0rUb+8hvuCHATB8XD2519V/lqAFpo+WWppJGe4ZNMht
         xCFffNEWeZ5BJGIz6nbLenGjRpxIJ7sxoYxRB1K7VX49mW/p7YxOyMKwGZtjgYpWgix5
         m/1zjFm3EhxyjVVqtNJdwn1Ya3NAbv+cWggJ9yTENiv0bfSTjIq35cveOLPD6wEBVr76
         tvBKqtNYWpTFdCNoLh9CFWcObK+yWMsYkP3erD+HHiwFSaAMZS3GxBvCoNFZypEY5RFf
         izyw==
X-Gm-Message-State: AOJu0YxgpfJiEYyXZQH9XmRlods6YCoCGkG7N6bWHZpAZBo5PlFiQaLH
	aOuCXxEv2IdbL64T5mVF/79h6Q==
X-Google-Smtp-Source: AGHT+IGeTRNnkAGtJOKk+N0KYk2TI/qyzGgAiNsBwzUry3nZya06KtOuECGJ13SzljIJ2I++NFcBZw==
X-Received: by 2002:adf:e6d1:0:b0:32d:a221:446 with SMTP id y17-20020adfe6d1000000b0032da2210446mr5590958wrm.59.1699888562998;
        Mon, 13 Nov 2023 07:16:02 -0800 (PST)
Date: Mon, 13 Nov 2023 15:16:02 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] CI: Rework RISCV smoke test
Message-ID: <ebb51a9b-2397-4105-ad20-4cede5872f48@perard>
References: <20231109154922.49118-1-anthony.perard@citrix.com>
 <7bffd0ff-290f-461c-a0ce-35440b36240a@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bffd0ff-290f-461c-a0ce-35440b36240a@citrix.com>

On Thu, Nov 09, 2023 at 04:52:36PM +0000, Andrew Cooper wrote:
> On 09/11/2023 3:49 pm, Anthony PERARD wrote:
> > Currently, the test rely on QEMU and Xen finishing the boot in under
> > two seconds. That's both very long and very short. Xen usually managed
> > to print "All set up" under a second. Unless for some reason we try to
> > run the test on a machine that's busy doing something else.
> >
> > Rework the test to exit as soon as Xen is done.
> >
> > There's two `tail -f`, the first one is there simply to monitor test
> > progress in GitLab console. The second one is used to detect the test
> > result as soon as QEMU add it to the file. Both `tail` exit as soon as
> > QEMU exit.
> >
> > If QEMU fails at start, and exit early, both `tail` will simply exit,
> > resulting in a failure.
> >
> > If the line we are looking for is never printed, the `timeout` on the
> > second `tail` will force the test to exit with an error.
> >
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Looks plausible, but all these qemu-smoke scripts are pretty similar,
> and copied from one-another.
> 
> We should make this change consistently to all testing (there's nothing
> RISC-V specific about why this test is failing on this runner), and it
> would be really nice if we could try to make it a bit more common than
> it currently is.

Yes, it would be nice if a change to a qemu-smoke script was applied to
every other one. But making those scripts more generic is a lot more
works, which would be useful to apply a change once for all.

The problem I'm trying to resolve only appear with this script, because
of a timeout been too short, a solution could just be to increase the
timeout (or not allowing runners to do more than one thing at a time).

BTW, the last time I've been told to apply a change to other things, I
never managed to finish it and the change wasn't applied at all (would
have result in some containers been smaller).

I guess will see if anyone complain about the test randomly failing. :-)

Cheers,

-- 
Anthony PERARD

