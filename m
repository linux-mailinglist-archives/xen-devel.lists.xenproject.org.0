Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 815CE92783B
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 16:24:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753844.1162124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPNNC-0006i9-IX; Thu, 04 Jul 2024 14:23:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753844.1162124; Thu, 04 Jul 2024 14:23:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPNNC-0006gf-Ev; Thu, 04 Jul 2024 14:23:46 +0000
Received: by outflank-mailman (input) for mailman id 753844;
 Thu, 04 Jul 2024 14:23:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OMPH=OE=bounce.vates.tech=bounce-md_30504962.6686b06d.v1-69c81d6661b648e2ba70a77e14f739b9@srs-se1.protection.inumbo.net>)
 id 1sPNNB-0006gZ-FL
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2024 14:23:45 +0000
Received: from mail186-1.suw21.mandrillapp.com
 (mail186-1.suw21.mandrillapp.com [198.2.186.1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03af0b9b-3a11-11ef-8776-851b0ebba9a2;
 Thu, 04 Jul 2024 16:23:43 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-1.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4WFJmF458TzBsTtc2
 for <xen-devel@lists.xenproject.org>; Thu,  4 Jul 2024 14:23:41 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 69c81d6661b648e2ba70a77e14f739b9; Thu, 04 Jul 2024 14:23:41 +0000
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
X-Inumbo-ID: 03af0b9b-3a11-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1720103021; x=1720363521;
	bh=Y8SexkBRBt7YwEfELRilHLlo5h8DYOLSv0Svo/E0N60=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=KygdiHlOYa3v+a6qwoVGZDP96JHS0jnjtCuygaTUX9Gxu7RvMRO8F9yLbTl+M9hil
	 fTeIWWo/fz2Ow1kqw/FF6oFbK6hXn0RfFW8MZ5nCTQfLQtV+7bsjz8rS+PZMrYizF/
	 PGr9y5MRitoxApjhfCgFUoBoVBCv3PqrjKD6kCScASXfHDe9SUB5qaj25SB3guxRUV
	 kWkWPHZudNLAVkG4FP2wWf4fU8HCoFuQnpd3k3XGjAeFwJPczxP0knqFHqBkHXPdq1
	 I4dvdhbRxli4U91zBG9v4ik/dCyGYgp8+73FAHXKGlmrKwBuaWv9Qr+PgNiBoc1YpO
	 Lux/n3ruTtFtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1720103021; x=1720363521; i=anthony.perard@vates.tech;
	bh=Y8SexkBRBt7YwEfELRilHLlo5h8DYOLSv0Svo/E0N60=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=GczBzefL/OH+ljVSeZt928hgYLlZIjylT2YalqBsYQEKcCCgrOzbh2HAi4aT1vR9N
	 5upkmX/65T1MSi1tuOcTqZ3ENumFiDd4gUdfzXvNscm8L4mdZyWC8jrx7Ip1W/y0yY
	 0xiqniT5eao2HhecBg0mypoxtKg3Rdh357o9sjAcOrU+BWQWNmCmUWyT/8ATBNgi1o
	 g/rAj4NGgNlhOkS6eppMNqreK7YRzEeMc4gL9qcvDm2/IXLvlQU/v3mhzrWWyFhZai
	 v4yD8ff2axqMt90/6fKN8fGg3HtwsHhIuheDBP0DyhW/2+xKYhZW1EIQ7WpZGnHh/c
	 C0OlyrfPVIoMA==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v1=202/2]=20xen:=20mapcache:=20Fix=20unmapping=20of=20first=20entries=20in=20buckets?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1720103020458
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-devel@nongnu.org, sstabellini@kernel.org, paul@xen.org, edgar.iglesias@amd.com, xen-devel@lists.xenproject.org
Message-Id: <ZoawbAnukIBkYWCw@l14>
References: <20240701224421.1432654-1-edgar.iglesias@gmail.com> <20240701224421.1432654-3-edgar.iglesias@gmail.com>
In-Reply-To: <20240701224421.1432654-3-edgar.iglesias@gmail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.69c81d6661b648e2ba70a77e14f739b9?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240704:md
Date: Thu, 04 Jul 2024 14:23:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Tue, Jul 02, 2024 at 12:44:21AM +0200, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> This fixes the clobbering of the entry->next pointer when
> unmapping the first entry in a bucket of a mapcache.
> 
> Fixes: 123acd816d ("xen: mapcache: Unmap first entries in buckets")
> Reported-by: Anthony PERARD <anthony.perard@vates.tech>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>  hw/xen/xen-mapcache.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> index 5f23b0adbe..18ba7b1d8f 100644
> --- a/hw/xen/xen-mapcache.c
> +++ b/hw/xen/xen-mapcache.c
> @@ -597,7 +597,17 @@ static void xen_invalidate_map_cache_entry_unlocked(MapCache *mc,
>          pentry->next = entry->next;
>          g_free(entry);
>      } else {
> -        memset(entry, 0, sizeof *entry);
> +        /*
> +         * Invalidate mapping but keep entry->next pointing to the rest
> +         * of the list.
> +         *
> +         * Note that lock is already zero here, otherwise we don't unmap.
> +         */
> +        entry->paddr_index = 0;
> +        entry->vaddr_base = NULL;
> +        entry->valid_mapping = NULL;
> +        entry->flags = 0;
> +        entry->size = 0;

This kind of feels like mc->entry should be an array of pointer rather
than an array of MapCacheEntry but that seems to work well enough and
not the first time entries are been cleared like that.

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

