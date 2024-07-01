Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A2091DFFC
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 14:56:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751561.1159545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOGZD-0002pW-Ch; Mon, 01 Jul 2024 12:55:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751561.1159545; Mon, 01 Jul 2024 12:55:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOGZD-0002mM-9W; Mon, 01 Jul 2024 12:55:35 +0000
Received: by outflank-mailman (input) for mailman id 751561;
 Mon, 01 Jul 2024 12:55:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=11xR=OB=bounce.vates.tech=bounce-md_30504962.6682a742.v1-4d888e4430054bc7b76d34bed385642a@srs-se1.protection.inumbo.net>)
 id 1sOGZB-0002mG-Q4
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 12:55:33 +0000
Received: from mail137-26.atl71.mandrillapp.com
 (mail137-26.atl71.mandrillapp.com [198.2.137.26])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32dcffef-37a9-11ef-90a5-e314d9c70b13;
 Mon, 01 Jul 2024 14:55:32 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-26.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4WCQxt45dgzJKF6VS
 for <xen-devel@lists.xenproject.org>; Mon,  1 Jul 2024 12:55:30 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 4d888e4430054bc7b76d34bed385642a; Mon, 01 Jul 2024 12:55:30 +0000
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
X-Inumbo-ID: 32dcffef-37a9-11ef-90a5-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1719838530; x=1720099030;
	bh=VpP23dnSGMr3v2CEKMNAe5zKPZgSu5ZxiHq/Xs24dYc=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Ny83Y58m6oWh5I6f3VeENNyv3VxXEXSW24lNptMduvW4qTVrjEA/fxVJNto/58P/S
	 mQaIkHgH06OJNaPo4/6v1wWBj4bNSByv1fpFQWLVo2LzMgy57fk2kjep3dJlMnknct
	 /PnGSu1kSfY8s32Z5OctqjPRuNry9mlbWy3trEjZsqaCsfO3l0MHiaGIrQvnqW9OK7
	 QY3E3+6Nq/5Es8I4meZCQfxwQxsuWpBxXO0g/E5PA64n0F8WdZ6BjyWK+XNfK7Cfxb
	 ttJeyuXLAYTk0ShXDWsTHibrngnb9fK09YQk9i+MDIpbBeW1KlfLdu/+fnRo/6MNg7
	 4QpPL187QVfyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1719838530; x=1720099030; i=anthony.perard@vates.tech;
	bh=VpP23dnSGMr3v2CEKMNAe5zKPZgSu5ZxiHq/Xs24dYc=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=crfnrwXanFZzzSdUZuH07VYdfXSaI4knD3yJ8OMVtpslUNeomgrJHcvlWhezwlGj8
	 4NywvViCMP86r7o/pJcasi8uB2o/+S1ZWBqDlCJtSaSrFHG+gebNeZf+ZI3mwn3gfH
	 GRKp9t/INgxMMBCooj3Schu9RP3mg4m49kaslan72HRXHIKMFAu+4LAYql1J4G2jxG
	 zAtuyk7+r68Aj+Ian56o0soN8laHSLB6bWd6SsKD15O8nUj8snCdYjmctXHMYiFB2P
	 5RZBXRlddaOsRhFXIIdMzJIMfW+4lP0AZkoM0FQ4eeJgf+SFaVWe0KHGOs3WVi5umz
	 GZtBHi5ZK7gSQ==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v8=202/8]=20xen:=20mapcache:=20Unmap=20first=20entries=20in=20buckets?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1719838529271
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-devel@nongnu.org, sstabellini@kernel.org, jgross@suse.com, "Edgar E. Iglesias" <edgar.iglesias@amd.com>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Message-Id: <ZoKnQLBwIwh004yy@l14>
References: <20240529140739.1387692-1-edgar.iglesias@gmail.com> <20240529140739.1387692-3-edgar.iglesias@gmail.com>
In-Reply-To: <20240529140739.1387692-3-edgar.iglesias@gmail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.4d888e4430054bc7b76d34bed385642a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240701:md
Date: Mon, 01 Jul 2024 12:55:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi all,

Following this commit, a test which install Debian in a guest with OVMF
as firmware started to fail. QEMU exit with an error when GRUB is
running on the freshly installed Debian (I don't know if GRUB is
starting Linux or not).
The error is:
    Bad ram offset ffffffffffffffff

Some logs:
http://logs.test-lab.xenproject.org/osstest/logs/186611/test-amd64-amd64-xl-qemuu-ovmf-amd64/info.html

Any idea? Something is trying to do something with the address "-1" when
it shouldn't?

Cheers,

Anthony

On Wed, May 29, 2024 at 04:07:33PM +0200, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> When invalidating memory ranges, if we happen to hit the first
> entry in a bucket we were never unmapping it. This was harmless
> for foreign mappings but now that we're looking to reuse the
> mapcache for transient grant mappings, we must unmap entries
> when invalidated.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
>  hw/xen/xen-mapcache.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> index bc860f4373..ec95445696 100644
> --- a/hw/xen/xen-mapcache.c
> +++ b/hw/xen/xen-mapcache.c
> @@ -491,18 +491,23 @@ static void xen_invalidate_map_cache_entry_unlocked(MapCache *mc,
>          return;
>      }
>      entry->lock--;
> -    if (entry->lock > 0 || pentry == NULL) {
> +    if (entry->lock > 0) {
>          return;
>      }
>  
> -    pentry->next = entry->next;
>      ram_block_notify_remove(entry->vaddr_base, entry->size, entry->size);
>      if (munmap(entry->vaddr_base, entry->size) != 0) {
>          perror("unmap fails");
>          exit(-1);
>      }
> +
>      g_free(entry->valid_mapping);
> -    g_free(entry);
> +    if (pentry) {
> +        pentry->next = entry->next;
> +        g_free(entry);
> +    } else {
> +        memset(entry, 0, sizeof *entry);
> +    }
>  }
>  
>  typedef struct XenMapCacheData {
> -- 
> 2.40.1
> 
> 
-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

