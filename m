Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C163E4048E2
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 13:04:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182988.330888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOHqn-0005VA-Gl; Thu, 09 Sep 2021 11:04:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182988.330888; Thu, 09 Sep 2021 11:04:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOHqn-0005SL-DX; Thu, 09 Sep 2021 11:04:13 +0000
Received: by outflank-mailman (input) for mailman id 182988;
 Thu, 09 Sep 2021 11:04:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sph1=N7=redhat.com=berrange@srs-us1.protection.inumbo.net>)
 id 1mOHql-0005SF-H1
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 11:04:11 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 162f0b66-117a-437e-b55b-9e29ac5e89fc;
 Thu, 09 Sep 2021 11:04:10 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-4VNc8KnCO7GnYm0cbZ0gqg-1; Thu, 09 Sep 2021 07:04:08 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 643CD801B3D;
 Thu,  9 Sep 2021 11:04:07 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 20E2760C04;
 Thu,  9 Sep 2021 11:03:50 +0000 (UTC)
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
X-Inumbo-ID: 162f0b66-117a-437e-b55b-9e29ac5e89fc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631185450;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Faiv6H45qsLcLF+E3eChwe664ABfD2GKqV97YcVlGIQ=;
	b=gBDvCopABo2W0+OVxBF7hTHFg8Zx3U8hdGn9kLLfs0acAvrtV+YgEeft+hRQVvvz4mrvIl
	pYIvlfLmw8Xyx1llv7YTukSnc1R/hZDqqbeM+4/CqpoNMeoM5BKS+9AWVUQMktlbIYgeOi
	95jR5YqrSAcpWUOTYe1FBHsVbiR1DN4=
X-MC-Unique: 4VNc8KnCO7GnYm0cbZ0gqg-1
Date: Thu, 9 Sep 2021 12:03:48 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Eric Blake <eblake@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH 06/10] qdev: Use qemu_security_policy_taint() API
Message-ID: <YTnqFHnolMLeY9c8@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20210908232024.2399215-1-philmd@redhat.com>
 <20210908232024.2399215-7-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210908232024.2399215-7-philmd@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Sep 09, 2021 at 01:20:20AM +0200, Philippe Mathieu-Daudé wrote:
> Add DeviceClass::taints_security_policy field to allow an
> unsafe device to eventually taint the global security policy
> in DeviceRealize().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/hw/qdev-core.h |  6 ++++++
>  hw/core/qdev.c         | 11 +++++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index bafc311bfa1..ff9ce6671be 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -122,6 +122,12 @@ struct DeviceClass {
>       */
>      bool user_creatable;
>      bool hotpluggable;
> +    /*
> +     * %false if the device is within the QEMU security policy boundary,
> +     * %true if there is no guarantee this device can be used safely.
> +     * See: https://www.qemu.org/contribute/security-process/
> +     */
> +    bool taints_security_policy;
>  
>      /* callbacks */
>      /*

Although your use case is for devices, it probably makes more sense
to push this up into the Object base class.

I think it will need to be a tri-state value too, not a simple
bool. It isn't feasible to mark all devices with this property,
so initially we'll have no information about whether most
devices are secure or insecure. This patch gives the implication
that all devices are secure, except for the few that have been
marked otherwise, which is not a good default IMHO.

We want to be able to make it clear when introspecting, that we
have no information on security available for most devices ie

 - unset  => no information on security (the current default)
 - true => considered secure against malicious guest
 - false => considered insecure against malicious guest

Then we can also extend 'ObjectTypeInfo' to have a

   '*secure': 'bool'

to make 'qom-list-types' be able to introspect this upfront.



> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index cefc5eaa0a9..a5a00f3564c 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -31,6 +31,7 @@
>  #include "qapi/qmp/qerror.h"
>  #include "qapi/visitor.h"
>  #include "qemu/error-report.h"
> +#include "qemu-common.h"
>  #include "qemu/option.h"
>  #include "hw/hotplug.h"
>  #include "hw/irq.h"
> @@ -257,6 +258,13 @@ bool qdev_hotplug_allowed(DeviceState *dev, Error **errp)
>      MachineClass *mc;
>      Object *m_obj = qdev_get_machine();
>  
> +    if (qemu_security_policy_is_strict()
> +            && DEVICE_GET_CLASS(dev)->taints_security_policy) {
> +        error_setg(errp, "Device '%s' can not be hotplugged when"
> +                         " 'strict' security policy is in place",
> +                   object_get_typename(OBJECT(dev)));

Do you need a 'return' here to stop execution after reportig
the error ?

> +    }
> +
>      if (object_dynamic_cast(m_obj, TYPE_MACHINE)) {
>          machine = MACHINE(m_obj);
>          mc = MACHINE_GET_CLASS(machine);
> @@ -385,6 +393,9 @@ bool qdev_realize(DeviceState *dev, BusState *bus, Error **errp)
>      } else {
>          assert(!DEVICE_GET_CLASS(dev)->bus_type);
>      }
> +    qemu_security_policy_taint(DEVICE_GET_CLASS(dev)->taints_security_policy,
> +                               "device type %s",
> +                               object_get_typename(OBJECT(dev)));
>  
>      return object_property_set_bool(OBJECT(dev), "realized", true, errp);
>  }
> -- 
> 2.31.1
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


