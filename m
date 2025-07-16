Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EDFB07049
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 10:21:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044939.1414971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubxNj-0000gG-P0; Wed, 16 Jul 2025 08:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044939.1414971; Wed, 16 Jul 2025 08:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubxNj-0000er-MH; Wed, 16 Jul 2025 08:20:51 +0000
Received: by outflank-mailman (input) for mailman id 1044939;
 Wed, 16 Jul 2025 08:20:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iI5F=Z5=suse.de=osalvador@srs-se1.protection.inumbo.net>)
 id 1ubxNh-0000eg-Ty
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 08:20:50 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6c222a6-621d-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 10:20:47 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D381321235;
 Wed, 16 Jul 2025 08:20:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5085E138D2;
 Wed, 16 Jul 2025 08:20:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8H0GEd1gd2jdEQAAD6G6ig
 (envelope-from <osalvador@suse.de>); Wed, 16 Jul 2025 08:20:45 +0000
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
X-Inumbo-ID: c6c222a6-621d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752654046; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7R+hCBYnvSZ+PSORPTHDk4t1hNJZ7tafG6Xa+YTLyPY=;
	b=Kra/SNnCnlFmArihgtpkJnlBzxIFiix4eMZf8WbVVkUNgMLSzRRITKBrwHMb+8Ue4kkSbB
	6PvwD7ORnT9v0Rmx+Wr3QL4PXlhl3U9RJ/JDrXNXqtGIqOF3x47fvHiOWLZ3Sx72WtF/d6
	pM64q1fFj3EuMQZlsG/KvMhVtNdQQks=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752654046;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7R+hCBYnvSZ+PSORPTHDk4t1hNJZ7tafG6Xa+YTLyPY=;
	b=k/6sTKZdoXEEDiueorLGp+Ptu/WsaOoSciT+ZR/RD/N7j9lULKWQVfeKfHwwdOHcPUBzS1
	88PpQ07hwEjfNxDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752654046; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7R+hCBYnvSZ+PSORPTHDk4t1hNJZ7tafG6Xa+YTLyPY=;
	b=Kra/SNnCnlFmArihgtpkJnlBzxIFiix4eMZf8WbVVkUNgMLSzRRITKBrwHMb+8Ue4kkSbB
	6PvwD7ORnT9v0Rmx+Wr3QL4PXlhl3U9RJ/JDrXNXqtGIqOF3x47fvHiOWLZ3Sx72WtF/d6
	pM64q1fFj3EuMQZlsG/KvMhVtNdQQks=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752654046;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7R+hCBYnvSZ+PSORPTHDk4t1hNJZ7tafG6Xa+YTLyPY=;
	b=k/6sTKZdoXEEDiueorLGp+Ptu/WsaOoSciT+ZR/RD/N7j9lULKWQVfeKfHwwdOHcPUBzS1
	88PpQ07hwEjfNxDA==
Date: Wed, 16 Jul 2025 10:20:43 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org,
	nvdimm@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
	Hugh Dickins <hughd@google.com>, Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH v1 8/9] mm: introduce and use vm_normal_page_pud()
Message-ID: <aHdg2y_JJduCVaYw@localhost.localdomain>
References: <20250715132350.2448901-1-david@redhat.com>
 <20250715132350.2448901-9-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715132350.2448901-9-david@redhat.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLhwqoz3wsm4df3nfubx4grhps)];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,localhost.localdomain:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Score: -4.30

On Tue, Jul 15, 2025 at 03:23:49PM +0200, David Hildenbrand wrote:
> Let's introduce vm_normal_page_pud(), which ends up being fairly simple
> because of our new common helpers and there not being a PUD-sized zero
> folio.
> 
> Use vm_normal_page_pud() in folio_walk_start() to resolve a TODO,
> structuring the code like the other (pmd/pte) cases. Defer
> introducing vm_normal_folio_pud() until really used.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Oscar Salvador <osalvador@suse.de>

 

-- 
Oscar Salvador
SUSE Labs

