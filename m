Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E3D405CF8
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 20:47:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183493.331702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOP4U-0000kq-7C; Thu, 09 Sep 2021 18:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183493.331702; Thu, 09 Sep 2021 18:46:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOP4U-0000i5-3K; Thu, 09 Sep 2021 18:46:50 +0000
Received: by outflank-mailman (input) for mailman id 183493;
 Thu, 09 Sep 2021 18:46:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1Llr=N7=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1mOP4S-0000hz-NP
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 18:46:48 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id e82ba8eb-09fc-4eaf-9218-735e4a13c8a6;
 Thu, 09 Sep 2021 18:46:48 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-C_EXj8nOOXekSgqTKAXzYA-1; Thu, 09 Sep 2021 14:46:44 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1F44A0CAC;
 Thu,  9 Sep 2021 18:46:43 +0000 (UTC)
Received: from redhat.com (ovpn-112-181.phx2.redhat.com [10.3.112.181])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ADCE05C1C5;
 Thu,  9 Sep 2021 18:46:39 +0000 (UTC)
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
X-Inumbo-ID: e82ba8eb-09fc-4eaf-9218-735e4a13c8a6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631213207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0pzbBYCWqbgRW+ufRHz+MM4Oqg466o5liD9bply3WTM=;
	b=ULBp7teNuu5Ig+Xt0R9o2nskE/7wmT4lubyvgY73I8RU4KjLKRmzoWLV3R1qjbCjjW+pAE
	1JMO7Hx4TExtbQO5SDlH/jzX+fFGpneCs9NGno2tFoZ3WQqL461Al0wsAuWLZSuBUIce5M
	mdqXd2Uzu8DYxkmwrXAnnrkeIT3n+dc=
X-MC-Unique: C_EXj8nOOXekSgqTKAXzYA-1
Date: Thu, 9 Sep 2021 13:46:37 -0500
From: Eric Blake <eblake@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH 02/10] accel: Use qemu_security_policy_taint(), mark
 KVM and Xen as safe
Message-ID: <20210909184637.pmb6mo26ss6ldnoa@redhat.com>
References: <20210908232024.2399215-1-philmd@redhat.com>
 <20210908232024.2399215-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210908232024.2399215-3-philmd@redhat.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Sep 09, 2021 at 01:20:16AM +0200, Philippe Mathieu-Daudé wrote:
> Add the AccelClass::secure_policy_supported field to classify
> safe (within security boundary) vs unsafe accelerators.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/qemu/accel.h | 5 +++++
>  accel/kvm/kvm-all.c  | 1 +
>  accel/xen/xen-all.c  | 1 +
>  softmmu/vl.c         | 3 +++
>  4 files changed, 10 insertions(+)
> 
> diff --git a/include/qemu/accel.h b/include/qemu/accel.h
> index 4f4c283f6fc..895e30be0de 100644
> --- a/include/qemu/accel.h
> +++ b/include/qemu/accel.h
> @@ -44,6 +44,11 @@ typedef struct AccelClass {
>                         hwaddr start_addr, hwaddr size);
>  #endif
>      bool *allowed;
> +    /*
> +     * Whether the accelerator is withing QEMU security policy boundary.

within

> +     * See: https://www.qemu.org/contribute/security-process/
> +     */
> +    bool secure_policy_supported;
>      /*
>       * Array of global properties that would be applied when specific
>       * accelerator is chosen. It works like MachineClass.compat_props

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


