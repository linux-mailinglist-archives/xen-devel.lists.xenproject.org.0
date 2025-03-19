Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD9BA68706
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 09:38:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920078.1324349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuowY-0000kF-LV; Wed, 19 Mar 2025 08:38:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920078.1324349; Wed, 19 Mar 2025 08:38:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuowY-0000ij-Ii; Wed, 19 Mar 2025 08:38:30 +0000
Received: by outflank-mailman (input) for mailman id 920078;
 Wed, 19 Mar 2025 08:38:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s9gW=WG=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1tuowX-0000id-Mm
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 08:38:29 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 843d7cee-049d-11f0-9899-31a8f345e629;
 Wed, 19 Mar 2025 09:38:23 +0100 (CET)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-9-fi93_T9EPMK_0u4PDZ0fZQ-1; Wed,
 19 Mar 2025 04:38:18 -0400
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7673119560B2; Wed, 19 Mar 2025 08:38:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.22.74.4])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C15D01956094; Wed, 19 Mar 2025 08:38:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5D7D921E66C4; Wed, 19 Mar 2025 09:38:12 +0100 (CET)
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
X-Inumbo-ID: 843d7cee-049d-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742373502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mvpdEVt3scaFNaNMSrUQuFXoHkxPqTd5RQTjbZyTZlo=;
	b=XujJK05kbe1tc0JdmQ8wgimiHP4lR/BdC88R7P8ciKqMvKBWrajUjk37qRbI0/5r9rof8Y
	vFSch1gFGN6maNnY8F7APIKh2VhbHbsrQ6gET6cWtoKhKZGOYE6qXhO0Aj29z5VNEluvSo
	GCbIMpA4f7MfxIXwR+qPQjGwezxq9Nw=
X-MC-Unique: fi93_T9EPMK_0u4PDZ0fZQ-1
X-Mimecast-MFC-AGG-ID: fi93_T9EPMK_0u4PDZ0fZQ_1742373497
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,  anthony@xenproject.org,  paul@xen.org,
  edgar.iglesias@gmail.com,  xen-devel@lists.xenproject.org
Subject: Re: [PATCH 0/2] xen: An error handling fix
In-Reply-To: <20250314143500.2449658-1-armbru@redhat.com> (Markus Armbruster's
	message of "Fri, 14 Mar 2025 15:34:58 +0100")
References: <20250314143500.2449658-1-armbru@redhat.com>
Date: Wed, 19 Mar 2025 09:38:12 +0100
Message-ID: <87iko51kln.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Queued for 10.0.


