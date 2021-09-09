Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C145B40488F
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 12:37:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182961.330844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOHQu-00087o-GY; Thu, 09 Sep 2021 10:37:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182961.330844; Thu, 09 Sep 2021 10:37:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOHQu-00085t-Cy; Thu, 09 Sep 2021 10:37:28 +0000
Received: by outflank-mailman (input) for mailman id 182961;
 Thu, 09 Sep 2021 10:37:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sph1=N7=redhat.com=berrange@srs-us1.protection.inumbo.net>)
 id 1mOHQs-00085n-Qx
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 10:37:26 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 54efee11-f86f-42c1-a52a-0c8c1828ad38;
 Thu, 09 Sep 2021 10:37:25 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-nHnegXWZNDKFzlbTRBMcJQ-1; Thu, 09 Sep 2021 06:37:23 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 559E61B18BC5;
 Thu,  9 Sep 2021 10:37:22 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7475C1002388;
 Thu,  9 Sep 2021 10:37:15 +0000 (UTC)
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
X-Inumbo-ID: 54efee11-f86f-42c1-a52a-0c8c1828ad38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631183845;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mFpyUFg5iicRG4N67bToPFSscnmzl25Wk4DeTDhXjsA=;
	b=h1mPFuMPK1mzZjmM0OkBnuIsaGTTDHYFSbkIp1YHGVFkZESzeUJXUHGxcYv+ivs3OHONsl
	hZaBc7uiFpAI6Dx/8A5/ExDJ7ExYClHHNyowRyq5IVNaXCue7u2tQmifjsbY4wfUUJZJeS
	afZp1iknuBu55HhFH1JKwo0aO+W1OB4=
X-MC-Unique: nHnegXWZNDKFzlbTRBMcJQ-1
Date: Thu, 9 Sep 2021 11:37:12 +0100
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
Subject: Re: [RFC PATCH 02/10] accel: Use qemu_security_policy_taint(), mark
 KVM and Xen as safe
Message-ID: <YTnj2M+lygKzdsgO@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20210908232024.2399215-1-philmd@redhat.com>
 <20210908232024.2399215-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210908232024.2399215-3-philmd@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
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
> +     * See: https://www.qemu.org/contribute/security-process/
> +     */
> +    bool secure_policy_supported;

The security handling policy is a high level concept that is
open to variation over time and also by downstream distro
vendors.

At a code level we should be dealing in a more fundamental
concept. At an accelerator level we should really jsut
declare whether or not the accelerator impl is considered
to be secure against malicious guest code.

eg

    /* Whether this accelerator is secure against execution
     * of malciious guest machine code */
    bool secure;


>      /*
>       * Array of global properties that would be applied when specific
>       * accelerator is chosen. It works like MachineClass.compat_props
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 0125c17edb8..eb6b9e44df2 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -3623,6 +3623,7 @@ static void kvm_accel_class_init(ObjectClass *oc, void *data)
>      ac->init_machine = kvm_init;
>      ac->has_memory = kvm_accel_has_memory;
>      ac->allowed = &kvm_allowed;
> +    ac->secure_policy_supported = true;
>  
>      object_class_property_add(oc, "kernel-irqchip", "on|off|split",
>          NULL, kvm_set_kernel_irqchip,
> diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
> index 69aa7d018b2..57867af5faf 100644
> --- a/accel/xen/xen-all.c
> +++ b/accel/xen/xen-all.c
> @@ -198,6 +198,7 @@ static void xen_accel_class_init(ObjectClass *oc, void *data)
>      ac->setup_post = xen_setup_post;
>      ac->allowed = &xen_allowed;
>      ac->compat_props = g_ptr_array_new();
> +    ac->secure_policy_supported = true;
>  
>      compat_props_add(ac->compat_props, compat, G_N_ELEMENTS(compat));
>  
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 92c05ac97ee..e4f94e159c3 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2388,6 +2388,9 @@ static int do_configure_accelerator(void *opaque, QemuOpts *opts, Error **errp)
>          return 0;
>      }
>  
> +    qemu_security_policy_taint(!ac->secure_policy_supported,
> +                               "%s accelerator", acc);

We need this information to be introspectable, becuase stuff printed
to stderr is essentially opaque to libvirt and mgmt apps above.

We don't have a convenient "query-accel" command but I think this
could possibly fit into 'query-target'. ie the TargetInfo struct
gain a field:
 

  ##
  # @TargetInfo:
  #
  # Information describing the QEMU target.
  #
  # @arch: the target architecture
  # @secure: Whether the currently active accelerator for this target
  #          is secure against execution of malicous guest code
  #
  # Since: 1.2
  ##
  { 'struct': 'TargetInfo',
    'data': { 'arch': 'SysEmuTarget',
              'secure': 'bool'} }

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


