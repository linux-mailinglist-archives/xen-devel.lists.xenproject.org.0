Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF146A208BE
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 11:42:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878348.1288513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcj2L-0001Vt-Q0; Tue, 28 Jan 2025 10:41:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878348.1288513; Tue, 28 Jan 2025 10:41:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcj2L-0001Sr-My; Tue, 28 Jan 2025 10:41:41 +0000
Received: by outflank-mailman (input) for mailman id 878348;
 Tue, 28 Jan 2025 10:41:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5iVi=UU=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1tcj2K-0001Sg-LU
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 10:41:40 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71af02cc-dd64-11ef-99a4-01e77a169b0f;
 Tue, 28 Jan 2025 11:41:35 +0100 (CET)
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-180-kr_aKd0hPQ-uwOo_sUl5pw-1; Tue,
 28 Jan 2025 05:41:30 -0500
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A601C19560A1; Tue, 28 Jan 2025 10:41:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.226])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2C17C180035E; Tue, 28 Jan 2025 10:41:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CEE951800097; Tue, 28 Jan 2025 11:41:19 +0100 (CET)
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
X-Inumbo-ID: 71af02cc-dd64-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738060894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q5BmEW4DnGq+UdM0tnVbqKqLrMEw80/0eIPX20ASm4I=;
	b=gzn6kWHsTWUMB7E2fJqPWnbAkBwuoAo2ovjzCCx6RKtwM8k1icD0XgSjpdIRivmHkZpGxR
	OKS9hihhdEMTxPtnmMlFYh31+3W3nSCT3rfX1fMSRWd6+ShRxiGzPovqo61TdBuXnykxJS
	7l053QVvdreIpMXJgT+TNR1B6S9mO80=
X-MC-Unique: kr_aKd0hPQ-uwOo_sUl5pw-1
X-Mimecast-MFC-AGG-ID: kr_aKd0hPQ-uwOo_sUl5pw
Date: Tue, 28 Jan 2025 11:41:19 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Yi Liu <yi.l.liu@intel.com>, 
	Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
	Anthony PERARD <anthony@xenproject.org>, Gustavo Romero <gustavo.romero@linaro.org>, 
	Jason Wang <jasowang@redhat.com>, qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <graf@amazon.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Stefan Berger <stefanb@linux.vnet.ibm.com>, 
	Bernhard Beschow <shentey@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	xen-devel@lists.xenproject.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	Alex Williamson <alex.williamson@redhat.com>, Paul Durrant <paul@xen.org>, 
	=?utf-8?Q?Cl=C3=A9ment?= Mathieu--Drif <clement.mathieu--drif@eviden.com>, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>
Subject: Re: [PATCH 0/9] hw/sysbus/platform-bus: Introduce
 TYPE_DYNAMIC_SYS_BUS_DEVICE
Message-ID: <wkb53fhvfchqa4uvmifgitvcr7t7rfpc3hcohdhzczkzvktetx@yjveswjel3s4>
References: <20250125181343.59151-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250125181343.59151-1-philmd@linaro.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On Sat, Jan 25, 2025 at 07:13:34PM +0100, Philippe Mathieu-Daudé wrote:
> Some SysBus devices can optionally be dynamically plugged onto
> the sysbus-platform-bus (then virtual guests are aware of
> mmio mapping and IRQs via device tree / ACPI rules).

Do we have some sane way to have user-pluggable sysbus devices on arm?

I've played around with that a bit, with the uefi variable service I'm
working on.  Specifically I'd prefer to *not* have a patch wiring things
up in machine type code like this ...

https://lore.kernel.org/qemu-devel/20250107153353.1144978-20-kraxel@redhat.com/

... and just use 'qemu -device uefi-vars-sysbus' instead.

Something like AcpiDevAmlIfClass but for device tree seems to not exist
though.  Also apparently AcpiDevAmlIfClass is not used.

take care,
  Gerd


