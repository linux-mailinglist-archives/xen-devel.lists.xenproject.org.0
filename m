Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 557D29E17DE
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 10:38:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847674.1262741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIPMR-00052S-Ma; Tue, 03 Dec 2024 09:38:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847674.1262741; Tue, 03 Dec 2024 09:38:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIPMR-00050z-JV; Tue, 03 Dec 2024 09:38:27 +0000
Received: by outflank-mailman (input) for mailman id 847674;
 Tue, 03 Dec 2024 09:38:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L6AI=S4=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1tIPMQ-000508-IS
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 09:38:26 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 577e9ab9-b15a-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 10:38:25 +0100 (CET)
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-491-4W2OJDnoPW6sgWszQLdNtg-1; Tue,
 03 Dec 2024 04:38:21 -0500
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 001021944DD3; Tue,  3 Dec 2024 09:38:20 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.37])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1A4731956064; Tue,  3 Dec 2024 09:38:16 +0000 (UTC)
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
X-Inumbo-ID: 577e9ab9-b15a-11ef-a0d3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733218704;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8ny4xWTBcN9ksCKY3sFHa4wfhsqLLtBnjJ3TxutDRXU=;
	b=L2C1G4sT01kd5upDvOmAo54MAfo8oMtpNhpRfKGfPcWBUNK3PmDK92zTnEWzSPIxlPSxiu
	PQ8tBUI07FYwOH727iyFzZhcO3estSeJrC6+/KDzxeW8wzFhuFnffMm0ELfG7YgXGrhwx7
	yVqMxmljMUeHvxapdGzG6PLG/oy0ksg=
X-MC-Unique: 4W2OJDnoPW6sgWszQLdNtg-1
X-Mimecast-MFC-AGG-ID: 4W2OJDnoPW6sgWszQLdNtg
Date: Tue, 3 Dec 2024 09:38:13 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 4/7] scripts/device-crash-test: Remove legacy '-machine
 foo,accel=bar'
Message-ID: <Z07RhQE8UOdWlzFS@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241203092153.60590-1-philmd@linaro.org>
 <20241203092153.60590-5-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241203092153.60590-5-philmd@linaro.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On Tue, Dec 03, 2024 at 10:21:50AM +0100, Philippe Mathieu-Daudé wrote:
> Since commit 6f6e1698a68 ("vl: configure accelerators from -accel
> options") we prefer the '-accel bar' command line option.
> 
> Replace '-machine foo,accel=bar' -> '-machine foo -accel bar' in
> the device-crash-test script.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  scripts/device-crash-test | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/device-crash-test b/scripts/device-crash-test
> index da8b56edd99..2b139e29ba0 100755
> --- a/scripts/device-crash-test
> +++ b/scripts/device-crash-test
> @@ -295,7 +295,10 @@ class QemuBinaryInfo(object):
>          self._machine_info = {}
>  
>          dbg("devtype: %r", devtype)
> -        args = ['-S', '-machine', 'none,accel=kvm:tcg']
> +        args = ['-S',
> +                '-machine', 'none',
> +                '-accel', 'kvm:tcg',

-accel doesn't work this way - that is legacy syntax sugar from -machine

You need multiple args:

   -accel kvm -accel tcg

> +               ]
>          dbg("querying info for QEMU binary: %s", binary)
>          vm = QEMUMachine(binary=binary, args=args)
>          vm.launch()
> @@ -358,7 +361,9 @@ def checkOneCase(args, testcase):
>  
>      dbg("will test: %r", testcase)
>  
> -    args = ['-S', '-machine', '%s,accel=%s' % (machine, accel),
> +    args = ['-S',
> +            '-machine', machine,
> +            '-accel', accel,

I've not checked what 'accel' value is - if that's another compound
value like 'kvm:tcg', it'll need to be turned into an array, and
expanded to multiple '-accel' args.

>              '-device', qemuOptsEscape(device)]
>      cmdline = ' '.join([binary] + args)
>      dbg("will launch QEMU: %s", cmdline)
> -- 
> 2.45.2
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


