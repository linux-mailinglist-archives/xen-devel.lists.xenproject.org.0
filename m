Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DC8281895
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 19:04:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2270.6762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOOTu-0007L1-E3; Fri, 02 Oct 2020 17:04:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2270.6762; Fri, 02 Oct 2020 17:04:30 +0000
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
	id 1kOOTu-0007Kg-Aq; Fri, 02 Oct 2020 17:04:30 +0000
Received: by outflank-mailman (input) for mailman id 2270;
 Fri, 02 Oct 2020 17:04:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OBi8=DJ=redhat.com=dgilbert@srs-us1.protection.inumbo.net>)
 id 1kOOTs-0007Kb-Md
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 17:04:28 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c79bbc2d-e2b6-4667-a841-b5f3a534b2e5;
 Fri, 02 Oct 2020 17:04:27 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-pVeLMFzAOZyKlcgqQOAWmg-1; Fri, 02 Oct 2020 13:04:25 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE963801AC2;
 Fri,  2 Oct 2020 17:04:23 +0000 (UTC)
Received: from work-vm (ovpn-114-192.ams2.redhat.com [10.36.114.192])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D311E73669;
 Fri,  2 Oct 2020 17:04:14 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=OBi8=DJ=redhat.com=dgilbert@srs-us1.protection.inumbo.net>)
	id 1kOOTs-0007Kb-Md
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 17:04:28 +0000
X-Inumbo-ID: c79bbc2d-e2b6-4667-a841-b5f3a534b2e5
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id c79bbc2d-e2b6-4667-a841-b5f3a534b2e5;
	Fri, 02 Oct 2020 17:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601658267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xgj0hpVcffvhbEeRWVxqdaYvCtQRdJemk3XrZAdr0Dg=;
	b=C2VSKjEhIEUbOICaFQk2+RdBHLC6stFA0Xgc9L1mnS2Np8Ksnt483YAwEfS7yp6NDtQCfT
	nFQq9abJuwTdD8ZvLPiz18iqLa4qKekb5xfEmdE0ublgmsk/vUUHsolSfz8f5juSVYRYe9
	q91rqQ3zWlkh1Wvop7NNXOtMYv0Q6I0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-pVeLMFzAOZyKlcgqQOAWmg-1; Fri, 02 Oct 2020 13:04:25 -0400
X-MC-Unique: pVeLMFzAOZyKlcgqQOAWmg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE963801AC2;
	Fri,  2 Oct 2020 17:04:23 +0000 (UTC)
Received: from work-vm (ovpn-114-192.ams2.redhat.com [10.36.114.192])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D311E73669;
	Fri,  2 Oct 2020 17:04:14 +0000 (UTC)
Date: Fri, 2 Oct 2020 18:04:12 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org, Gerd Hoffmann <kraxel@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Eric Blake <eblake@redhat.com>, Paul Durrant <paul@xen.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 5/5] qapi: Restrict Xen migration commands to
 migration.json
Message-ID: <20201002170412.GJ3286@work-vm>
References: <20201002133923.1716645-1-philmd@redhat.com>
 <20201002133923.1716645-6-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201002133923.1716645-6-philmd@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

* Philippe Mathieu-Daudé (philmd@redhat.com) wrote:
> Restricting xen-set-global-dirty-log and xen-load-devices-state
> commands migration.json pulls slightly less QAPI-generated code
> into user-mode and tools.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Looks OK; for migration


Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  qapi/migration.json    | 41 +++++++++++++++++++++++++++++++++++++++++
>  qapi/misc.json         | 41 -----------------------------------------
>  accel/stubs/xen-stub.c |  2 +-
>  hw/i386/xen/xen-hvm.c  |  2 +-
>  migration/savevm.c     |  1 -
>  5 files changed, 43 insertions(+), 44 deletions(-)
> 
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 7f5e6fd681..cb30f4c729 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1551,6 +1551,47 @@
>  { 'command': 'xen-save-devices-state',
>    'data': {'filename': 'str', '*live':'bool' } }
>  
> +##
> +# @xen-set-global-dirty-log:
> +#
> +# Enable or disable the global dirty log mode.
> +#
> +# @enable: true to enable, false to disable.
> +#
> +# Returns: nothing
> +#
> +# Since: 1.3
> +#
> +# Example:
> +#
> +# -> { "execute": "xen-set-global-dirty-log",
> +#      "arguments": { "enable": true } }
> +# <- { "return": {} }
> +#
> +##
> +{ 'command': 'xen-set-global-dirty-log', 'data': { 'enable': 'bool' } }
> +
> +##
> +# @xen-load-devices-state:
> +#
> +# Load the state of all devices from file. The RAM and the block devices
> +# of the VM are not loaded by this command.
> +#
> +# @filename: the file to load the state of the devices from as binary
> +#            data. See xen-save-devices-state.txt for a description of the binary
> +#            format.
> +#
> +# Since: 2.7
> +#
> +# Example:
> +#
> +# -> { "execute": "xen-load-devices-state",
> +#      "arguments": { "filename": "/tmp/resume" } }
> +# <- { "return": {} }
> +#
> +##
> +{ 'command': 'xen-load-devices-state', 'data': {'filename': 'str'} }
> +
>  ##
>  # @xen-set-replication:
>  #
> diff --git a/qapi/misc.json b/qapi/misc.json
> index 9813893269..afe936b45b 100644
> --- a/qapi/misc.json
> +++ b/qapi/misc.json
> @@ -287,26 +287,6 @@
>    'data': {'device': 'str', 'target': 'str', '*arg': 'str'},
>    'features': [ 'deprecated' ] }
>  
> -##
> -# @xen-set-global-dirty-log:
> -#
> -# Enable or disable the global dirty log mode.
> -#
> -# @enable: true to enable, false to disable.
> -#
> -# Returns: nothing
> -#
> -# Since: 1.3
> -#
> -# Example:
> -#
> -# -> { "execute": "xen-set-global-dirty-log",
> -#      "arguments": { "enable": true } }
> -# <- { "return": {} }
> -#
> -##
> -{ 'command': 'xen-set-global-dirty-log', 'data': { 'enable': 'bool' } }
> -
>  ##
>  # @getfd:
>  #
> @@ -606,24 +586,3 @@
>  ##
>  { 'enum': 'ReplayMode',
>    'data': [ 'none', 'record', 'play' ] }
> -
> -##
> -# @xen-load-devices-state:
> -#
> -# Load the state of all devices from file. The RAM and the block devices
> -# of the VM are not loaded by this command.
> -#
> -# @filename: the file to load the state of the devices from as binary
> -#            data. See xen-save-devices-state.txt for a description of the binary
> -#            format.
> -#
> -# Since: 2.7
> -#
> -# Example:
> -#
> -# -> { "execute": "xen-load-devices-state",
> -#      "arguments": { "filename": "/tmp/resume" } }
> -# <- { "return": {} }
> -#
> -##
> -{ 'command': 'xen-load-devices-state', 'data': {'filename': 'str'} }
> diff --git a/accel/stubs/xen-stub.c b/accel/stubs/xen-stub.c
> index 7ba0b697f4..7054965c48 100644
> --- a/accel/stubs/xen-stub.c
> +++ b/accel/stubs/xen-stub.c
> @@ -7,7 +7,7 @@
>  
>  #include "qemu/osdep.h"
>  #include "sysemu/xen.h"
> -#include "qapi/qapi-commands-misc.h"
> +#include "qapi/qapi-commands-migration.h"
>  
>  bool xen_allowed;
>  
> diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
> index f3ababf33b..9519c33c09 100644
> --- a/hw/i386/xen/xen-hvm.c
> +++ b/hw/i386/xen/xen-hvm.c
> @@ -24,7 +24,7 @@
>  #include "hw/xen/xen-bus.h"
>  #include "hw/xen/xen-x86.h"
>  #include "qapi/error.h"
> -#include "qapi/qapi-commands-misc.h"
> +#include "qapi/qapi-commands-migration.h"
>  #include "qemu/error-report.h"
>  #include "qemu/main-loop.h"
>  #include "qemu/range.h"
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 34e4b71052..1fdf3f76c2 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -42,7 +42,6 @@
>  #include "postcopy-ram.h"
>  #include "qapi/error.h"
>  #include "qapi/qapi-commands-migration.h"
> -#include "qapi/qapi-commands-misc.h"
>  #include "qapi/qmp/qerror.h"
>  #include "qemu/error-report.h"
>  #include "sysemu/cpus.h"
> -- 
> 2.26.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


