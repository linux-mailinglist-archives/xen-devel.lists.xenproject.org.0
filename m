Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C06685B15F5
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 09:48:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402793.644676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWCGV-00063l-Pe; Thu, 08 Sep 2022 07:47:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402793.644676; Thu, 08 Sep 2022 07:47:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWCGV-00061K-M8; Thu, 08 Sep 2022 07:47:59 +0000
Received: by outflank-mailman (input) for mailman id 402793;
 Thu, 08 Sep 2022 07:47:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F5bG=ZL=suse.com=mhocko@srs-se1.protection.inumbo.net>)
 id 1oWCGT-00061A-VJ
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 07:47:57 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cff3bcc-2f4a-11ed-a31c-8f8a9ae3403f;
 Thu, 08 Sep 2022 09:47:56 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 116B433BAA;
 Thu,  8 Sep 2022 07:47:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DFAA713A6D;
 Thu,  8 Sep 2022 07:47:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id v6YhNiueGWPJGgAAMHmgww
 (envelope-from <mhocko@suse.com>); Thu, 08 Sep 2022 07:47:55 +0000
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
X-Inumbo-ID: 8cff3bcc-2f4a-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662623276; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4+jY/L5+xe35wjNUaKjbU+iCet/hLbz6TyCvxP2dmm0=;
	b=q2uaKkC1rcu77DvPauruHEVNp78d3UcgHYo6roqYS04TbzQga+wo3gUgYM7xc8RTAbag0b
	Siee5YfUMtfmfxPxqkOhtZP8FU1vyGEbeWhPo02Tz2AY0PEdGFeJwOjRT85XiTIOJmldhN
	n8cvx7UnpYatYAeIOdBLBa+REawwQmI=
Date: Thu, 8 Sep 2022 09:47:55 +0200
From: Michal Hocko <mhocko@suse.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Mel Gorman <mgorman@suse.de>, Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Matthew Wilcox <willy@infradead.org>,
	"Liam R. Howlett" <liam.howlett@oracle.com>,
	David Vernet <void@manifault.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Laurent Dufour <ldufour@linux.ibm.com>,
	Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
	Jens Axboe <axboe@kernel.dk>, mcgrof@kernel.org,
	masahiroy@kernel.org, nathan@kernel.org, changbin.du@intel.com,
	ytcoode@gmail.com, Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Benjamin Segall <bsegall@google.com>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Christopher Lameter <cl@linux.com>,
	Pekka Enberg <penberg@kernel.org>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>, 42.hyeyoo@gmail.com,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Shakeel Butt <shakeelb@google.com>,
	Muchun Song <songmuchun@bytedance.com>, arnd@arndb.de,
	jbaron@akamai.com, David Rientjes <rientjes@google.com>,
	Minchan Kim <minchan@google.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	kernel-team <kernel-team@android.com>,
	linux-mm <linux-mm@kvack.org>, iommu@lists.linux.dev,
	kasan-dev@googlegroups.com, io-uring@vger.kernel.org,
	linux-arch@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, linux-modules@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 00/30] Code tagging framework and applications
Message-ID: <YxmeK2/HHS4AkXh0@dhcp22.suse.cz>
References: <YxW4Ig338d2vQAz3@dhcp22.suse.cz>
 <20220905234649.525vorzx27ybypsn@kmo-framework>
 <Yxb1cxDSyte1Ut/F@dhcp22.suse.cz>
 <20220906182058.iijmpzu4rtxowy37@kmo-framework>
 <Yxh5ueDTAOcwEmCQ@dhcp22.suse.cz>
 <20220907130323.rwycrntnckc6h43n@kmo-framework>
 <20220907094306.3383dac2@gandalf.local.home>
 <20220908063548.u4lqkhquuvkwzvda@kmo-framework>
 <YxmV7a2pnj1Kldzi@dhcp22.suse.cz>
 <20220908072950.yapakb5scocxezhy@kmo-framework>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220908072950.yapakb5scocxezhy@kmo-framework>

On Thu 08-09-22 03:29:50, Kent Overstreet wrote:
> On Thu, Sep 08, 2022 at 09:12:45AM +0200, Michal Hocko wrote:
> > Then you have probably missed a huge part of my emails. Please
> > re-read. If those arguments are not clear, feel free to ask for
> > clarification. Reducing the whole my reasoning and objections to the
> > sentence above and calling that vapid and lazy is not only unfair but
> > also disrespectful.
> 
> What, where you complained about slab's page allocations showing up in the
> profile instead of slab, and I pointed out to you that actually each and every
> slab call is instrumented, and you're just seeing some double counting (that we
> will no doubt fix?)
> 
> Or when you complained about allocation sites where it should actually be the
> caller that should be instrumented, and I pointed out that it'd be quite easy to
> simply change that code to use _kmalloc() and slab_tag_add() directly, if it
> becomes an issue.
> 
> Of course, if we got that far, we'd have this code to thank for telling us where
> to look!
> 
> Did I miss anything?

Feel free to reponse to specific arguments as I wrote them. I won't
repeat them again. Sure we can discuss how important/relevant those
are. And that _can_ be a productive discussion.

-- 
Michal Hocko
SUSE Labs

