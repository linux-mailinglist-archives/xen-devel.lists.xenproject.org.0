Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id G7X0KlTJqGkExQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 01:07:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CB5209567
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 01:07:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246100.1545382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxwFX-0003Mk-L6; Thu, 05 Mar 2026 00:07:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246100.1545382; Thu, 05 Mar 2026 00:07:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxwFX-0003K3-HO; Thu, 05 Mar 2026 00:07:31 +0000
Received: by outflank-mailman (input) for mailman id 1246100;
 Thu, 05 Mar 2026 00:07:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PFhh=BF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vxwFV-0003Ih-Aj
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 00:07:29 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b1e5ad1-1827-11f1-b164-2bf370ae4941;
 Thu, 05 Mar 2026 01:07:27 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1340040C29;
 Thu,  5 Mar 2026 00:07:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D85C4CEF7;
 Thu,  5 Mar 2026 00:07:24 +0000 (UTC)
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
X-Inumbo-ID: 4b1e5ad1-1827-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772669245;
	bh=pjv0XFNJ1B5r1groVKrNX4KoO8JMgModOOta/p4M1fk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DHStb9EIea9qnBsSQExLEgGK0/h6CsKUQmdcrfXkCl+xgD/o7EBY3m7YaEajxoWns
	 dpxGvfQcu9QQW2UXdlQ3fWgPZcrnNYCHwO6B/MD3Z7M6JH1Cm/2/dD6ZajsdckseMS
	 jLGgjaSCFFJhk/MVNfPX9vxIz2Lu6xE4qEDcfp5S9SoEz/6cvj6K3bbPrJL5HTvkBx
	 ELZUM/JOZ2IL76JOBFGINI+6dM30VwkVWTR0tV9Ml81+PqDzAo01J9MWIYlNYk0EBQ
	 6QZR+447fwE/yG9xqR5sPAVs+A/ku8ItYvAXKDt//aBMqDqpUqXY6B/EIu1+mOxM5i
	 7P2g3Hbo+LsIw==
Date: Wed, 4 Mar 2026 16:07:23 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
    Peter Xu <peterx@redhat.com>, 
    =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
    sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@amd.com, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 3/5] physmem: xen: Conditionalize use of the
 mapcache
In-Reply-To: <20260304015222.979224-4-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2603041606480.250016@ubuntu-linux-20-04-desktop>
References: <20260304015222.979224-1-edgar.iglesias@gmail.com> <20260304015222.979224-4-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 55CB5209567
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:edgar.iglesias@gmail.com,m:qemu-devel@nongnu.org,m:pbonzini@redhat.com,m:peterx@redhat.com,m:philmd@linaro.org,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:edgar.iglesias@amd.com,m:xen-devel@lists.xenproject.org,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Wed, 4 Mar 2026, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Conditionalize use of the mapcache. This is in preparation
> to optionally disable the mapcache at runtime.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>  system/physmem.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/system/physmem.c b/system/physmem.c
> index e5ff26acec..64e6d50f8f 100644
> --- a/system/physmem.c
> +++ b/system/physmem.c
> @@ -578,7 +578,8 @@ MemoryRegion *flatview_translate(FlatView *fv, hwaddr addr, hwaddr *xlat,
>                                      is_write, true, &as, attrs);
>      mr = section.mr;
>  
> -    if (xen_enabled() && memory_access_is_direct(mr, is_write, attrs)) {
> +    if (xen_map_cache_enabled() &&
> +        memory_access_is_direct(mr, is_write, attrs)) {
>          hwaddr page = ((addr & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE) - addr;
>          *plen = MIN(page, *plen);
>      }

All the other changes make sense. For this one, the code inside the if
check is not strictly related to the mapcache. Are you sure it should be
changed?


> @@ -2577,7 +2578,7 @@ static void reclaim_ramblock(RAMBlock *block)
>  {
>      if (block->flags & RAM_PREALLOC) {
>          ;
> -    } else if (xen_enabled()) {
> +    } else if (xen_map_cache_enabled()) {
>          xen_invalidate_map_cache_entry(block->host);
>  #if !defined(_WIN32) && !defined(EMSCRIPTEN)
>      } else if (block->fd >= 0) {
> @@ -2736,7 +2737,7 @@ static void *qemu_ram_ptr_length(RAMBlock *block, ram_addr_t addr,
>          len = *size;
>      }
>  
> -    if (xen_enabled() && block->host == NULL) {
> +    if (xen_map_cache_enabled() && block->host == NULL) {
>          /* We need to check if the requested address is in the RAM
>           * because we don't want to map the entire memory in QEMU.
>           * In that case just map the requested area.
> @@ -2785,7 +2786,7 @@ RAMBlock *qemu_ram_block_from_host(void *ptr, bool round_offset,
>      RAMBlock *block;
>      uint8_t *host = ptr;
>  
> -    if (xen_enabled()) {
> +    if (xen_map_cache_enabled()) {
>          ram_addr_t ram_addr;
>          RCU_READ_LOCK_GUARD();
>          ram_addr = xen_ram_addr_from_mapcache(ptr);
> @@ -3787,7 +3788,7 @@ void address_space_unmap(AddressSpace *as, void *buffer, hwaddr len,
>          if (is_write) {
>              invalidate_and_set_dirty(mr, addr1, access_len);
>          }
> -        if (xen_enabled()) {
> +        if (xen_map_cache_enabled()) {
>              xen_invalidate_map_cache_entry(buffer);
>          }
>          memory_region_unref(mr);
> @@ -3898,7 +3899,7 @@ void address_space_cache_destroy(MemoryRegionCache *cache)
>          return;
>      }
>  
> -    if (xen_enabled()) {
> +    if (xen_map_cache_enabled()) {
>          xen_invalidate_map_cache_entry(cache->ptr);
>      }
>      memory_region_unref(cache->mrs.mr);
> -- 
> 2.43.0
> 

