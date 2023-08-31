Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D95A678EEC5
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 15:38:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593963.927117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbhsO-0008CH-59; Thu, 31 Aug 2023 13:38:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593963.927117; Thu, 31 Aug 2023 13:38:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbhsO-00089R-1j; Thu, 31 Aug 2023 13:38:24 +0000
Received: by outflank-mailman (input) for mailman id 593963;
 Thu, 31 Aug 2023 13:38:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5iW9=EQ=redhat.com=eblake@srs-se1.protection.inumbo.net>)
 id 1qbhsN-00089L-Ah
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 13:38:23 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5ba6808-4803-11ee-9b0d-b553b5be7939;
 Thu, 31 Aug 2023 15:38:21 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-RvOQvMEROUGy2tVbeKhNpw-1; Thu, 31 Aug 2023 09:38:16 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93D191C09A62;
 Thu, 31 Aug 2023 13:38:15 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 070CF2166B25;
 Thu, 31 Aug 2023 13:38:10 +0000 (UTC)
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
X-Inumbo-ID: a5ba6808-4803-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693489099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lHvH6tD37wk1zyp+h5UmwcIdUR0oNVNgJfvKLJlrg4M=;
	b=dsG9o9WOkqhHGX8Lr8O/geHgDM+ucbcAYJvqViWF4LKmY1S34pYiVu0tJzJ6utthbCBl0e
	Ac0g6gti5YkngZgvntGfJWC0mmRA1zG0ANuXy9PlH+QqupSVybhO0sDGDmoYs4uZFOU5BG
	4sX0LzEOOxoZROGf1DT6gesiJisfgFM=
X-MC-Unique: RvOQvMEROUGy2tVbeKhNpw-1
Date: Thu, 31 Aug 2023 08:38:09 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com, 
	vsementsov@yandex-team.ru, jsnow@redhat.com, idryomov@gmail.com, pl@kamp.de, sw@weilnetz.de, 
	sstabellini@kernel.org, anthony.perard@citrix.com, paul@xen.org, pbonzini@redhat.com, 
	marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com, philmd@linaro.org, 
	stefanha@redhat.com, fam@euphon.net, quintela@redhat.com, peterx@redhat.com, 
	leobras@redhat.com, kraxel@redhat.com, qemu-block@nongnu.org, 
	xen-devel@lists.xenproject.org, alex.bennee@linaro.org, peter.maydell@linaro.org
Subject: Re: [PATCH 1/7] migration/rdma: Fix save_page method to fail on
 polling error
Message-ID: <npnhurzixjae6schhran3dnicpwozrhkaan5sxcf3gyxviam5y@ofklh25a6wlc>
References: <20230831132546.3525721-1-armbru@redhat.com>
 <20230831132546.3525721-2-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230831132546.3525721-2-armbru@redhat.com>
User-Agent: NeoMutt/20230517
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6

On Thu, Aug 31, 2023 at 03:25:40PM +0200, Markus Armbruster wrote:
> qemu_rdma_save_page() reports polling error with error_report(), then
> succeeds anyway.  This is because the variable holding the polling
> status *shadows* the variable the function returns.  The latter
> remains zero.
> 
> Broken since day one, and duplicated more recently.
> 
> Fixes: 2da776db4846 (rdma: core logic)
> Fixes: b390afd8c50b (migration/rdma: Fix out of order wrid)

Alas, the curse of immutable git history preserving typos in commit
subjects ;) The alternative of rewriting history and breaking SHA
references is worse.

> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  migration/rdma.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org


