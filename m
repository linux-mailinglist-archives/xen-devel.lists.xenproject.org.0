Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E64B9E1801
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 10:42:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847684.1262750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIPQJ-000788-5w; Tue, 03 Dec 2024 09:42:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847684.1262750; Tue, 03 Dec 2024 09:42:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIPQJ-00075W-33; Tue, 03 Dec 2024 09:42:27 +0000
Received: by outflank-mailman (input) for mailman id 847684;
 Tue, 03 Dec 2024 09:42:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L6AI=S4=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1tIPQH-000749-Eq
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 09:42:25 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5ca1ec9-b15a-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 10:42:24 +0100 (CET)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-615-u3we_1XyN_2_r62U9GpjIQ-1; Tue,
 03 Dec 2024 04:42:20 -0500
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id EE12F1954220; Tue,  3 Dec 2024 09:42:17 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.37])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CFF6719560A3; Tue,  3 Dec 2024 09:42:13 +0000 (UTC)
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
X-Inumbo-ID: e5ca1ec9-b15a-11ef-a0d3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733218943;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FdOP4qqzg77tZ2HjGa/4x5tiYEmReqUm0KhFF1X4Y1Y=;
	b=Xh6FWSfVs9LHWCmg3a5RzmOdnD0+eD8tWJurBJs32mkMN19VYRs1lbvAFhvaYatc84X70z
	Ikv/usNtCMiTfjColAoW2g4S3msvXpaCHpx2U8J40ZpLaR0mu25+PO3iYqc0TjfRZVFJXO
	uDn7rGmcw9sB+xoWdqHdE8OOQ0FowcQ=
X-MC-Unique: u3we_1XyN_2_r62U9GpjIQ-1
X-Mimecast-MFC-AGG-ID: u3we_1XyN_2_r62U9GpjIQ
Date: Tue, 3 Dec 2024 09:42:09 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 5/7] accel/tcg: Remove mentions of legacy '-machine
 foo,accel=bar'
Message-ID: <Z07ScV2K3NsAgyyY@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241203092153.60590-1-philmd@linaro.org>
 <20241203092153.60590-6-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241203092153.60590-6-philmd@linaro.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On Tue, Dec 03, 2024 at 10:21:51AM +0100, Philippe Mathieu-Daudé wrote:
> Since commit 6f6e1698a68 ("vl: configure accelerators from -accel
> options") we prefer the '-accel bar' command line option.
> 
> Update the documentation when TCG is referred to.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  docs/about/removed-features.rst | 2 +-
>  linux-user/s390x/target_proc.h  | 2 +-
>  accel/tcg/monitor.c             | 4 ++--
>  system/vl.c                     | 2 +-
>  tests/qtest/qmp-cmd-test.c      | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)

> diff --git a/system/vl.c b/system/vl.c
> index 54998fdbc7e..c056fcb740c 100644
> --- a/system/vl.c
> +++ b/system/vl.c
> @@ -2385,7 +2385,7 @@ static void configure_accelerators(const char *progname)
>          for (tmp = accel_list; *tmp; tmp++) {
>              /*
>               * Filter invalid accelerators here, to prevent obscenities
> -             * such as "-machine accel=tcg,,thread=single".
> +             * such as "-accel tcg,,thread=single".
>               */

I'm not sure I understand what the old message was trying to archive, but
at the same time I'm even less convinced it makes sense to change the
comment.

>              if (accel_find(*tmp)) {
>                  qemu_opts_parse_noisily(qemu_find_opts("accel"), *tmp, true);

For all of the patch, except for that chunk above:

  Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


