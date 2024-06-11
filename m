Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DBC90349B
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 10:01:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737999.1144556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGwRM-0006b0-1U; Tue, 11 Jun 2024 08:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737999.1144556; Tue, 11 Jun 2024 08:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGwRL-0006Xe-T8; Tue, 11 Jun 2024 08:01:11 +0000
Received: by outflank-mailman (input) for mailman id 737999;
 Tue, 11 Jun 2024 08:01:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UxxS=NN=suse.de=osalvador@srs-se1.protection.inumbo.net>)
 id 1sGwRJ-0006EH-ET
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 08:01:09 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0ffaf2c-27c8-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 10:01:05 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3DCEE20560;
 Tue, 11 Jun 2024 08:01:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2124F13A55;
 Tue, 11 Jun 2024 08:01:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cdtzBUAEaGY4VgAAD6G6ig
 (envelope-from <osalvador@suse.de>); Tue, 11 Jun 2024 08:01:04 +0000
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
X-Inumbo-ID: c0ffaf2c-27c8-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718092865; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qHTLyIX7jLzbH1ivzBIljZd8gbAzcrr4kki4IuM/w4s=;
	b=eZBr7hv01QtJAQ63m8FhIkoxR6rfVWdIAtAM3tMSW7+msYF8sKzstxlxUcLGVQkzYd+xcg
	yOUDCjNkttpZD4LSyjDGBE0HLudW2/1+Hz5TvpMX2H9pqAKeYuboG4MyCcVVBme6zH6ZFU
	gW3gI5sxhgleQef05pj0FqPwwOu6HPU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718092865;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qHTLyIX7jLzbH1ivzBIljZd8gbAzcrr4kki4IuM/w4s=;
	b=OXxCJyUQRJS9OhqC4VgzbBVBP3JyYprOS8XwZTJXMp2JoR9G+H5IoGoPm1Pm1PuGPVCFI5
	a/T9/prPxYrogmCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718092865; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qHTLyIX7jLzbH1ivzBIljZd8gbAzcrr4kki4IuM/w4s=;
	b=eZBr7hv01QtJAQ63m8FhIkoxR6rfVWdIAtAM3tMSW7+msYF8sKzstxlxUcLGVQkzYd+xcg
	yOUDCjNkttpZD4LSyjDGBE0HLudW2/1+Hz5TvpMX2H9pqAKeYuboG4MyCcVVBme6zH6ZFU
	gW3gI5sxhgleQef05pj0FqPwwOu6HPU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718092865;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qHTLyIX7jLzbH1ivzBIljZd8gbAzcrr4kki4IuM/w4s=;
	b=OXxCJyUQRJS9OhqC4VgzbBVBP3JyYprOS8XwZTJXMp2JoR9G+H5IoGoPm1Pm1PuGPVCFI5
	a/T9/prPxYrogmCQ==
Date: Tue, 11 Jun 2024 10:01:02 +0200
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
Subject: Re: [PATCH v1 2/3] mm/memory_hotplug: initialize memmap of
 !ZONE_DEVICE with PageOffline() instead of PageReserved()
Message-ID: <ZmgEPgjyG4EfYkNM@localhost.localdomain>
References: <20240607090939.89524-1-david@redhat.com>
 <20240607090939.89524-3-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240607090939.89524-3-david@redhat.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-4.26 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.16)[-0.822];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Score: -4.26
X-Spam-Flag: NO

On Fri, Jun 07, 2024 at 11:09:37AM +0200, David Hildenbrand wrote:
> We currently initialize the memmap such that PG_reserved is set and the
> refcount of the page is 1. In virtio-mem code, we have to manually clear
> that PG_reserved flag to make memory offlining with partially hotplugged
> memory blocks possible: has_unmovable_pages() would otherwise bail out on
> such pages.
> 
> We want to avoid PG_reserved where possible and move to typed pages
> instead. Further, we want to further enlighten memory offlining code about
> PG_offline: offline pages in an online memory section. One example is
> handling managed page count adjustments in a cleaner way during memory
> offlining.
> 
> So let's initialize the pages with PG_offline instead of PG_reserved.
> generic_online_page()->__free_pages_core() will now clear that flag before
> handing that memory to the buddy.
> 
> Note that the page refcount is still 1 and would forbid offlining of such
> memory except when special care is take during GOING_OFFLINE as
> currently only implemented by virtio-mem.
> 
> With this change, we can now get non-PageReserved() pages in the XEN
> balloon list. From what I can tell, that can already happen via
> decrease_reservation(), so that should be fine.
> 
> HV-balloon should not really observe a change: partial online memory
> blocks still cannot get surprise-offlined, because the refcount of these
> PageOffline() pages is 1.
> 
> Update virtio-mem, HV-balloon and XEN-balloon code to be aware that
> hotplugged pages are now PageOffline() instead of PageReserved() before
> they are handed over to the buddy.
> 
> We'll leave the ZONE_DEVICE case alone for now.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: Oscar Salvador <osalvador@suse.de> # for the generic
memory-hotplug bits


-- 
Oscar Salvador
SUSE Labs

