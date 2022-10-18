Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEE8602EF0
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 16:56:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425092.672875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oko0Z-0005Kj-J7; Tue, 18 Oct 2022 14:55:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425092.672875; Tue, 18 Oct 2022 14:55:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oko0Z-0005IV-GB; Tue, 18 Oct 2022 14:55:55 +0000
Received: by outflank-mailman (input) for mailman id 425092;
 Tue, 18 Oct 2022 14:55:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ieme=2T=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1oko0Y-0005Gh-Pb
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 14:55:54 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6aeb438-4ef4-11ed-8fd0-01056ac49cbb;
 Tue, 18 Oct 2022 16:55:53 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id BD2FD68C4E; Tue, 18 Oct 2022 16:55:50 +0200 (CEST)
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
X-Inumbo-ID: f6aeb438-4ef4-11ed-8fd0-01056ac49cbb
Date: Tue, 18 Oct 2022 16:55:50 +0200
From: Christoph Hellwig <hch@lst.de>
To: Juergen Gross <jgross@suse.com>
Cc: Christoph Hellwig <hch@lst.de>, Jan Beulich <jbeulich@suse.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	regressions@lists.linux.dev, xen-devel@lists.xenproject.org,
	iommu@lists.linux.dev, Robert Beckett <bob.beckett@collabora.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Matthew Auld <matthew.auld@intel.com>,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: i915 "GPU HANG", bisected to a2daa27c0c61 "swiotlb: simplify
 swiotlb_max_segment"
Message-ID: <20221018145550.GA21066@lst.de>
References: <20221018082413.GA25785@lst.de> <a5966644-72d7-4b25-83d1-9765d0593e44@suse.com> <20221018110243.GA4655@lst.de> <d67ceabb-b31a-59e6-fc77-8d6c48b277f2@suse.com> <20221018143320.GA19106@lst.de> <e0448dac-a35e-cfd0-c087-411558512b5e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0448dac-a35e-cfd0-c087-411558512b5e@suse.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Oct 18, 2022 at 04:53:50PM +0200, Juergen Gross wrote:
>> If we don't need the IS_ENABLED is not needed I'm all for dropping it.
>> But unless I misread the code, on arm/arm64 even PV guests are 1:1
>> mapped so that all Linux physically contigous memory also is Xen
>> contigous, so we don't need the hack.
>
> There are no PV guests on arm/arm64.

Ok, that's the part I was missing.  In that case we should be fine
without the IS_ENABLED indeed.

