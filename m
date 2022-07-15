Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9647C5769C7
	for <lists+xen-devel@lfdr.de>; Sat, 16 Jul 2022 00:17:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368567.599918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCTbw-0000GY-2s; Fri, 15 Jul 2022 22:16:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368567.599918; Fri, 15 Jul 2022 22:16:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCTbv-0000Dx-VT; Fri, 15 Jul 2022 22:16:35 +0000
Received: by outflank-mailman (input) for mailman id 368567;
 Fri, 15 Jul 2022 22:16:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tST6=XU=kernel.org=sj@srs-se1.protection.inumbo.net>)
 id 1oCTbu-00004w-9K
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 22:16:34 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8254f1c-048b-11ed-924f-1f966e50362f;
 Sat, 16 Jul 2022 00:16:32 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A52C1B82EB3;
 Fri, 15 Jul 2022 22:16:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C99AC34115;
 Fri, 15 Jul 2022 22:16:29 +0000 (UTC)
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
X-Inumbo-ID: c8254f1c-048b-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657923390;
	bh=5/bcyrjFpp5Iuv4UCuUwJcz8BDDH3Jj7t4EoceoC5iE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NvfK/jLzTa/S0wO9Yu7D5Jj5Fqj2YFjk1gi1svN5MtA8ehbFBJQc2RMO9X4ScthVs
	 QsizMcGJn7zk4W0Q3qGAkYt5Xj7DUH3MiVecJWCNDWVTicNQBpujr5kpgNbSeEotZJ
	 OL7a0dy1v8P4oiwQ2lzX1fSSWGN5aJz9TvIhxB8GxpoV6utwwratBETIkCoPtKgB8G
	 zgF1NCIytZlL2WQlSg6UoeibjYVBrB6HeYMze2quwYG0Tc0fnlsZ57dLrUSVvRgN9V
	 m/k5ebjsanBpcE15qxEz7qp7QPV+iB5uoCnQDAXTMlzemLomd7+ODKbJzYMRAGSxkc
	 peojgDaJNTxsQ==
From: SeongJae Park <sj@kernel.org>
To: SeongJae Park <sj@kernel.org>
Cc: roger.pau@citrix.com,
	axboe@kernel.dk,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	olekstysh@gmail.com,
	andrii.chepurnyi82@gmail.com,
	mheyne@amazon.de,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Fix persistent grants negotiation with a behavior change
Date: Fri, 15 Jul 2022 22:16:27 +0000
Message-Id: <20220715221627.127648-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220715181226.126714-1-sj@kernel.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

On Fri, 15 Jul 2022 18:12:26 +0000 SeongJae Park <sj@kernel.org> wrote:

> Hi all,
> 
> On Fri, 15 Jul 2022 17:55:19 +0000 SeongJae Park <sj@kernel.org> wrote:
> 
> > The first patch of this patchset fixes 'feature_persistent' parameter
> > handling in 'blkback' to respect the frontend's persistent grants
> > support always.  The fix makes a behavioral change, so the second patch
> > makes the counterpart of 'blkfront' to consistently follow the behavior
> > change.
> 
> I made the behavior change as requested by Andrii[1].  I therefore made similar
> behavior change to blkfront and Cc-ed stable for the second change, too.

Now I realize that commit aac8a70db24b ("xen-blkback: add a parameter for
disabling of persistent grants") introduced two issues.  One is what Max
reported with his patch, and the second one is unintended behavioral change
that broke Andrii's use case.

That is, Andrii's use case should had no problem at all before the introduction
of 'feature_persistent', as at that time 'blkback' checked if the frontend
support the persistent grants for every 'reconnect()' and enables it if so.
However, introduction of the parameter made it behaves differently.

Yes, we intended to make the prameter to make effects to newly created devices.
But, as it breaks user workflows, this should be fixed.  Same for the
'blkfront' side 'feature_persistent'.

> 
> To make the change history clear and reduce the stable side overhead, however,
> it might be better to apply the v2, which don't make behavior change but only
> fix the issue, Cc stable@ for it, make the behavior change commits for both
> blkback and blkfront, update the documents, and don't Cc stable@ for the
> behavior change and documents update commits.

I'd say having one patch for each issue would be the right way to go, and all
fixes should Cc stable@.

> 
> One downside of that would be that it will make a behavioral difference in
> pre-5.19.x and post-5.19.x.

The unintended behavioral fix should also be considered fix and therefore
should be merged into stable@, so above concern is not valid.

I will send the next spin soon.


Thanks,
SJ

[...]

