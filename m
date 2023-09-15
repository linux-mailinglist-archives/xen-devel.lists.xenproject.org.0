Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C38A7A17A3
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 09:42:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602933.939765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh3Sc-0002T8-1B; Fri, 15 Sep 2023 07:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602933.939765; Fri, 15 Sep 2023 07:41:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh3Sb-0002Qh-TG; Fri, 15 Sep 2023 07:41:53 +0000
Received: by outflank-mailman (input) for mailman id 602933;
 Fri, 15 Sep 2023 07:41:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cTZx=E7=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1qh3Sa-0002Q3-Tm
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 07:41:52 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53c5c143-539b-11ee-9b0d-b553b5be7939;
 Fri, 15 Sep 2023 09:41:49 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-nGWXfUAWOlyJ8o2oDKoGSQ-1; Fri, 15 Sep 2023 03:41:45 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA17E858F19;
 Fri, 15 Sep 2023 07:41:44 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.146])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AAD7A21B2413;
 Fri, 15 Sep 2023 07:41:40 +0000 (UTC)
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
X-Inumbo-ID: 53c5c143-539b-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694763709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pRC3RshYLS4HmQNALCOSRKQWLBPF3YgAiPkaToAE920=;
	b=DGkEWhxl+iEep01oQ/0cBnprsBpEgEmFAMo5+BOqYZiXR418WAOtY8E1cZWLYhUG4hYVQG
	UkfQXBZPWBjX8loB8m2SlNdsPJH2GMU5b3+gXo3aK85OrOzj60m2ZaXTOCmJ0ww8FrxrJ4
	YpYGb4SrGEveBOt1OWN3yErzrtUs7BQ=
X-MC-Unique: nGWXfUAWOlyJ8o2oDKoGSQ-1
Date: Fri, 15 Sep 2023 09:41:39 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, eblake@redhat.com,
	vsementsov@yandex-team.ru, jsnow@redhat.com, idryomov@gmail.com,
	pl@kamp.de, sw@weilnetz.de, sstabellini@kernel.org,
	anthony.perard@citrix.com, paul@xen.org, pbonzini@redhat.com,
	marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
	philmd@linaro.org, stefanha@redhat.com, fam@euphon.net,
	quintela@redhat.com, peterx@redhat.com, leobras@redhat.com,
	kraxel@redhat.com, qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org, alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: Re: [PATCH 5/7] block/vdi: Clean up local variable shadowing
Message-ID: <ZQQKsxgrT2mLokFi@redhat.com>
References: <20230831132546.3525721-1-armbru@redhat.com>
 <20230831132546.3525721-6-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230831132546.3525721-6-armbru@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6

Am 31.08.2023 um 15:25 hat Markus Armbruster geschrieben:
> Local variables shadowing other local variables or parameters make the
> code needlessly hard to understand.  Tracked down with -Wshadow=local.
> Clean up: delete inner declarations when they are actually redundant,
> else rename variables.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

> @@ -700,7 +699,7 @@ nonallocating_write:
>          /* One or more new blocks were allocated. */
>          VdiHeader *header;
>          uint8_t *base;
> -        uint64_t offset;
> +        uint64_t offs;
>          uint32_t n_sectors;
>  
>          g_free(block);
> @@ -723,11 +722,11 @@ nonallocating_write:
>          bmap_first /= (SECTOR_SIZE / sizeof(uint32_t));
>          bmap_last /= (SECTOR_SIZE / sizeof(uint32_t));
>          n_sectors = bmap_last - bmap_first + 1;
> -        offset = s->bmap_sector + bmap_first;
> +        offs = s->bmap_sector + bmap_first;
>          base = ((uint8_t *)&s->bmap[0]) + bmap_first * SECTOR_SIZE;
>          logout("will write %u block map sectors starting from entry %u\n",
>                 n_sectors, bmap_first);
> -        ret = bdrv_co_pwrite(bs->file, offset * SECTOR_SIZE,
> +        ret = bdrv_co_pwrite(bs->file, offs * SECTOR_SIZE,
>                               n_sectors * SECTOR_SIZE, base, 0);
>      }

Having two variables 'offset' and 'offs' doesn't really help with
clarity either. Can we be more specific and use something like
'bmap_offset' here?

Kevin


