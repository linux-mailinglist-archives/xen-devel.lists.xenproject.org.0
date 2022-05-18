Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F6E52BB8E
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 15:45:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332216.555870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrJzM-0003Ev-Ut; Wed, 18 May 2022 13:45:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332216.555870; Wed, 18 May 2022 13:45:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrJzM-0003D6-Rz; Wed, 18 May 2022 13:45:20 +0000
Received: by outflank-mailman (input) for mailman id 332216;
 Wed, 18 May 2022 13:45:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HKN8=V2=bombadil.srs.infradead.org=BATV+240e8cd436ded551dd5d+6842+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nrJzK-0003Cw-Gm
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 13:45:19 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf07e5a2-d6b0-11ec-bd2c-47488cf2e6aa;
 Wed, 18 May 2022 15:45:16 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nrJzC-002LqV-JH; Wed, 18 May 2022 13:45:10 +0000
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
X-Inumbo-ID: bf07e5a2-d6b0-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zHCFhRbJ5KoBP25J/EVA30nZjwejxa0UyBXdd6YAaF4=; b=OfkWNCZWsoLrWqd56zXTPhczAR
	Xu6/rWTNKrHA5cVITymYCU7C4/BuduKoFrwDVkllDtDmTwQwvpwjUrpdfRvTvtZo8yvfgrRuSRptz
	dGZzY66n3hdKJFC0dVStt35QHnrIiK2a4cQzs1nuLJ6CLQydPerstjr5JbjRj7wd7gXMeR4XR6Fyl
	lTd2H2/zzj/WYjDnSh3AMB/sqU3wUqKqGTptHwfo0ecsQnNijGsQ3L3sW4OrscH+mwB3FG0Q48r3G
	KNYWIuEvYvH1LmuYE5O//C/SHYngGuQagyk3HMLrbcTMYU/L6AP1FKnFK27sU4snqP8olMxHVwBBt
	SSqd4aWA==;
Date: Wed, 18 May 2022 06:45:10 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, jbeulich@suse.com,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/2] x86/pat: add functions to query specific cache mode
 availability
Message-ID: <YoT4Zk/SxBgadq2b@infradead.org>
References: <20220503132207.17234-1-jgross@suse.com>
 <20220503132207.17234-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503132207.17234-3-jgross@suse.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Tue, May 03, 2022 at 03:22:07PM +0200, Juergen Gross wrote:
> Some drivers are using pat_enabled() in order to test availability of
> special caching modes (WC and UC-). This will lead to false negatives
> in case the system was booted e.g. with the "nopat" variant and the
> BIOS did setup the PAT MSR supporting the queried mode, or if the
> system is running as a Xen PV guest.
> 
> Add test functions for those caching modes instead and use them at the
> appropriate places.
> 
> For symmetry reasons export the already existing x86_has_pat_wp() for
> modules, too.

No, we never export unused functionality.

