Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A889B2C6511
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 13:12:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39248.72067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kicbK-0000Zk-QK; Fri, 27 Nov 2020 12:11:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39248.72067; Fri, 27 Nov 2020 12:11:46 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kicbK-0000ZL-N4; Fri, 27 Nov 2020 12:11:46 +0000
Received: by outflank-mailman (input) for mailman id 39248;
 Fri, 27 Nov 2020 12:11:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOv=FB=redhat.com=cohuck@srs-us1.protection.inumbo.net>)
 id 1kicbJ-0000ZG-Nf
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 12:11:45 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 230f6e01-c1ee-43dd-a1b1-914be9ff5cf4;
 Fri, 27 Nov 2020 12:11:44 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-a9KGH4giPU2E32VOYNRdxg-1; Fri, 27 Nov 2020 07:11:40 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A35180EFAC;
 Fri, 27 Nov 2020 12:11:38 +0000 (UTC)
Received: from gondolin (ovpn-113-65.ams2.redhat.com [10.36.113.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4EF66085D;
 Fri, 27 Nov 2020 12:11:32 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MDOv=FB=redhat.com=cohuck@srs-us1.protection.inumbo.net>)
	id 1kicbJ-0000ZG-Nf
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 12:11:45 +0000
X-Inumbo-ID: 230f6e01-c1ee-43dd-a1b1-914be9ff5cf4
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 230f6e01-c1ee-43dd-a1b1-914be9ff5cf4;
	Fri, 27 Nov 2020 12:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606479103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AThlirL9N+ST9Gm1ZnxC6RPmbKOXYMe8XRrB5KU7zuo=;
	b=LLiWjBr9nHaSriR+QHR+7f9DfuBd/L1nLc3siRz9dS8enquuC+qg4VanIX4XMvXm4OV+GG
	vMHYUkxG5m3PiDJsGvSUzkfPiwAkOzJ/5Ji6oCcWKu/4J2Fc9IHeGh/0xNK78C5GIUk5pm
	NL2RRzsvG8DeD5YVQYM2RrEcP6f4rrs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-a9KGH4giPU2E32VOYNRdxg-1; Fri, 27 Nov 2020 07:11:40 -0500
X-MC-Unique: a9KGH4giPU2E32VOYNRdxg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A35180EFAC;
	Fri, 27 Nov 2020 12:11:38 +0000 (UTC)
Received: from gondolin (ovpn-113-65.ams2.redhat.com [10.36.113.65])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B4EF66085D;
	Fri, 27 Nov 2020 12:11:32 +0000 (UTC)
Date: Fri, 27 Nov 2020 13:11:30 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, Richard
 Henderson <richard.henderson@linaro.org>, Roman Bolshakov
 <r.bolshakov@yadro.com>, Gerd Hoffmann <kraxel@redhat.com>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v2 4/6] xen: Delete xen_available() function
Message-ID: <20201127131130.4a4d34ef.cohuck@redhat.com>
In-Reply-To: <20201125205636.3305257-5-ehabkost@redhat.com>
References: <20201125205636.3305257-1-ehabkost@redhat.com>
	<20201125205636.3305257-5-ehabkost@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 25 Nov 2020 15:56:34 -0500
Eduardo Habkost <ehabkost@redhat.com> wrote:

> The function can be replaced with accel_available("xen").
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> Cc: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Claudio Fontana <cfontana@suse.de>
> Cc: Roman Bolshakov <r.bolshakov@yadro.com>
> ---
>  include/sysemu/arch_init.h | 2 --
>  softmmu/arch_init.c        | 9 ---------
>  softmmu/vl.c               | 6 +++---
>  3 files changed, 3 insertions(+), 14 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


