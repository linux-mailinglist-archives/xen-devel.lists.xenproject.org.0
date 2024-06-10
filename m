Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF379020A8
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 13:47:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737221.1143422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGdUr-0003qT-5w; Mon, 10 Jun 2024 11:47:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737221.1143422; Mon, 10 Jun 2024 11:47:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGdUr-0003p3-39; Mon, 10 Jun 2024 11:47:33 +0000
Received: by outflank-mailman (input) for mailman id 737221;
 Mon, 10 Jun 2024 11:47:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AMvd=NM=suse.de=osalvador@srs-se1.protection.inumbo.net>)
 id 1sGdUp-0003a1-R8
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 11:47:32 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 378e868d-271f-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 13:47:31 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8172421A5B;
 Mon, 10 Jun 2024 11:47:29 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6843213A7F;
 Mon, 10 Jun 2024 11:47:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 5brfFtDnZmbLFQAAD6G6ig
 (envelope-from <osalvador@suse.de>); Mon, 10 Jun 2024 11:47:28 +0000
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
X-Inumbo-ID: 378e868d-271f-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718020049; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WJbUj0Me5/uIhq7+KJarpD1i6Sf3idu2woFatetNcL0=;
	b=jQO+Qx/4Mj+vDjMEgjaHWKq33ho5f4Qb6TYgmmU0qZfZs7hYxUfoNdVh0yH7bMllbzqIzj
	cBgRVPF2mcuk7QqY+/pskie2ykcdmVfJAarIg0QR57zOzx4iU4VSWIXTSa8mKRdzIBa0QD
	lO9DjXCGRfL9yocXH6oR8JUqcqdOAxc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718020049;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WJbUj0Me5/uIhq7+KJarpD1i6Sf3idu2woFatetNcL0=;
	b=pE7TkXSXVcV2z59Zw2hFhiW+a9rT+ETwB+nt36sIeCijTXDS4lhfOoWDZeBLz9algnI9z/
	eVn0jCO+My8aZ1Ag==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718020049; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WJbUj0Me5/uIhq7+KJarpD1i6Sf3idu2woFatetNcL0=;
	b=jQO+Qx/4Mj+vDjMEgjaHWKq33ho5f4Qb6TYgmmU0qZfZs7hYxUfoNdVh0yH7bMllbzqIzj
	cBgRVPF2mcuk7QqY+/pskie2ykcdmVfJAarIg0QR57zOzx4iU4VSWIXTSa8mKRdzIBa0QD
	lO9DjXCGRfL9yocXH6oR8JUqcqdOAxc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718020049;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WJbUj0Me5/uIhq7+KJarpD1i6Sf3idu2woFatetNcL0=;
	b=pE7TkXSXVcV2z59Zw2hFhiW+a9rT+ETwB+nt36sIeCijTXDS4lhfOoWDZeBLz9algnI9z/
	eVn0jCO+My8aZ1Ag==
Date: Mon, 10 Jun 2024 13:47:18 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org, kasan-dev@googlegroups.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [PATCH v1 1/3] mm: pass meminit_context to __free_pages_core()
Message-ID: <ZmbnxrOuoarMbC6X@localhost.localdomain>
References: <20240607090939.89524-1-david@redhat.com>
 <20240607090939.89524-2-david@redhat.com>
 <ZmZ7GgwJw4ucPJaM@localhost.localdomain>
 <13070847-4129-490c-b228-2e52bd77566a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13070847-4129-490c-b228-2e52bd77566a@redhat.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.993];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[]
X-Spam-Score: -4.30
X-Spam-Flag: NO

On Mon, Jun 10, 2024 at 10:38:05AM +0200, David Hildenbrand wrote:
> On 10.06.24 06:03, Oscar Salvador wrote:
> > On Fri, Jun 07, 2024 at 11:09:36AM +0200, David Hildenbrand wrote:
> > > In preparation for further changes, let's teach __free_pages_core()
> > > about the differences of memory hotplug handling.
> > > 
> > > Move the memory hotplug specific handling from generic_online_page() to
> > > __free_pages_core(), use adjust_managed_page_count() on the memory
> > > hotplug path, and spell out why memory freed via memblock
> > > cannot currently use adjust_managed_page_count().
> > > 
> > > Signed-off-by: David Hildenbrand <david@redhat.com>
> > 
> > All looks good but I am puzzled with something.
> > 
> > > +	} else {
> > > +		/* memblock adjusts totalram_pages() ahead of time. */
> > > +		atomic_long_add(nr_pages, &page_zone(page)->managed_pages);
> > > +	}
> > 
> > You say that memblock adjusts totalram_pages ahead of time, and I guess
> > you mean in memblock_free_all()
> 
> And memblock_free_late(), which uses atomic_long_inc().

Ah yes.

 
> Right (it's suboptimal, but not really problematic so far. Hopefully Wei can
> clean it up and move it in here as well)

That would be great.

> For the time being
> 
> "/* memblock adjusts totalram_pages() manually. */"

Yes, I think that is better ;-)

Thanks!
 

-- 
Oscar Salvador
SUSE Labs

