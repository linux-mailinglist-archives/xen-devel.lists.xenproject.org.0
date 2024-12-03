Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B419E1854
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 10:54:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847767.1262831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIPbz-0006CF-2f; Tue, 03 Dec 2024 09:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847767.1262831; Tue, 03 Dec 2024 09:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIPby-00069x-W7; Tue, 03 Dec 2024 09:54:30 +0000
Received: by outflank-mailman (input) for mailman id 847767;
 Tue, 03 Dec 2024 09:54:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L6AI=S4=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1tIPbx-00069r-DD
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 09:54:29 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94abc892-b15c-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 10:54:27 +0100 (CET)
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-19-YxXr4IOQPeeG_3ecYmygPg-1; Tue,
 03 Dec 2024 04:54:22 -0500
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 95DD5195608A; Tue,  3 Dec 2024 09:54:21 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.37])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 39021195608A; Tue,  3 Dec 2024 09:54:18 +0000 (UTC)
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
X-Inumbo-ID: 94abc892-b15c-11ef-a0d3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733219666;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l3VcSU2FOCO6z2TK0iPyybiLDyV7PIhM+xSHQeNdxLM=;
	b=bNgLo4E8dDfMZszR8H33xrDHzPEhzEcEUHhQp4/veQwmt6LxWsAlOeNXR1ddd1Ymhds1Mq
	QIxSsGteZgjOxhmdnh59hAkpslmqjluoJQBGGyDcS+oSP/PvShCPAPNIGD1W0TyEs2otlm
	DJH/BHsYaSPw2aFtpZ8UfQO0AC73k7g=
X-MC-Unique: YxXr4IOQPeeG_3ecYmygPg-1
X-Mimecast-MFC-AGG-ID: YxXr4IOQPeeG_3ecYmygPg
Date: Tue, 3 Dec 2024 09:54:15 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 7/7] qemu-options: Remove mentions of legacy '-machine
 foo,accel=bar'
Message-ID: <Z07VR-YvVCxdTua_@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241203092153.60590-1-philmd@linaro.org>
 <20241203092153.60590-8-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241203092153.60590-8-philmd@linaro.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On Tue, Dec 03, 2024 at 10:21:53AM +0100, Philippe Mathieu-Daudé wrote:
> Since commit 6f6e1698a68 ("vl: configure accelerators from -accel
> options") we prefer the '-accel bar' command line option.
> 
> The new form started to be documented in commit 8d4e9146b35 ("tcg:
> add options for enabling MTTCG"); it is safe to remove the mentions
> of the legacy option.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  qemu-options.hx | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index dacc9790a4b..11f0aab1470 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -27,8 +27,6 @@ ERST
>  DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
>      "-machine [type=]name[,prop[=value][,...]]\n"
>      "                selects emulated machine ('-machine help' for list)\n"
> -    "                property accel=accel1[:accel2[:...]] selects accelerator\n"
> -    "                supported accelerators are kvm, xen, hvf, nvmm, whpx or tcg (default: tcg)\n"
>      "                vmport=on|off|auto controls emulation of vmport (default: auto)\n"
>      "                dump-guest-core=on|off include guest memory in a core dump (default=on)\n"
>      "                mem-merge=on|off controls memory merge support (default: on)\n"
> @@ -59,13 +57,6 @@ SRST
>  
>      Supported machine properties are:
>  
> -    ``accel=accels1[:accels2[:...]]``
> -        This is used to enable an accelerator. Depending on the target
> -        architecture, kvm, xen, hvf, nvmm, whpx or tcg can be available.
> -        By default, tcg is used. If there is more than one accelerator
> -        specified, the next one is used if the previous one fails to
> -        initialize.
> -

I'm not convinced we should be removing documentation for options that
currently exist and remain supported.

The documentation should be updated to say that we prefer use of '-accel'
instead at least.

Beyond that, what is our long term intention with '-machine accel=xxx' ?

Is this a case where we are happy to leave '-machine accel=' as syntax
sugar forever ?  Or is this a case where we want to deprecate it and
eventually remove its impl (and thus the documention here)

>      ``vmport=on|off|auto``
>          Enables emulation of VMWare IO port, for vmmouse etc. auto says
>          to select the value based on accel and i8042. For accel=xen or
> -- 
> 2.45.2
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


