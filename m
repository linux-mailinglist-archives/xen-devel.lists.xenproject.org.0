Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 935CD7A929A
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 10:34:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606198.943947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjF8V-0005rL-En; Thu, 21 Sep 2023 08:34:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606198.943947; Thu, 21 Sep 2023 08:34:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjF8V-0005oK-Bt; Thu, 21 Sep 2023 08:34:11 +0000
Received: by outflank-mailman (input) for mailman id 606198;
 Thu, 21 Sep 2023 08:34:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BtKi=FF=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1qjF8T-0005oC-MM
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 08:34:09 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0a6e719-5859-11ee-9b0d-b553b5be7939;
 Thu, 21 Sep 2023 10:34:07 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-7-Fog8l-Mk6ZO1q97GGl_A-1; Thu, 21 Sep 2023 04:33:59 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3B17185A797;
 Thu, 21 Sep 2023 08:33:58 +0000 (UTC)
Received: from redhat.com (dhcp-192-199.str.redhat.com [10.33.192.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ADA08C15BB8;
 Thu, 21 Sep 2023 08:33:55 +0000 (UTC)
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
X-Inumbo-ID: a0a6e719-5859-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695285246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eh8zyjzBG7qqI/Mc2UKyIQjPyEugXboyG0F/C5omL3o=;
	b=HXIcYFZXgSBvnXS9mE94ucbABpEs1Jwa31sSko+GhsTCaMmtF5T61t38PH3ic2WRSsrw13
	Sb69cr8vIjNaz7AWwbC9PmJj3ygjNS1v9S19fyyU1jpArXQbXfvLp9/DrnjHvR7Wa1LxAB
	I2KGkoO5k6854mbfXQ9OVzKLVuYAAOM=
X-MC-Unique: 7-Fog8l-Mk6ZO1q97GGl_A-1
Date: Thu, 21 Sep 2023 10:33:54 +0200
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
Subject: Re: [PATCH v2 6/7] block: Clean up local variable shadowing
Message-ID: <ZQv/8k97W49sK3e1@redhat.com>
References: <20230920183149.1105333-1-armbru@redhat.com>
 <20230920183149.1105333-7-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920183149.1105333-7-armbru@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8

Am 20.09.2023 um 20:31 hat Markus Armbruster geschrieben:
> Local variables shadowing other local variables or parameters make the
> code needlessly hard to understand.  Tracked down with -Wshadow=local.
> Clean up: delete inner declarations when they are actually redundant,
> else rename variables.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Acked-by: Anthony PERARD <anthony.perard@citrix.com>
> Acked-by: Ilya Dryomov <idryomov@gmail.com>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


