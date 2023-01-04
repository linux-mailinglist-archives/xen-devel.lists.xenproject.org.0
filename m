Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3748A65DD15
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 20:47:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471437.731278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD9jA-0002Op-Vc; Wed, 04 Jan 2023 19:47:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471437.731278; Wed, 04 Jan 2023 19:47:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD9jA-0002N1-S3; Wed, 04 Jan 2023 19:47:08 +0000
Received: by outflank-mailman (input) for mailman id 471437;
 Wed, 04 Jan 2023 19:47:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MKhu=5B=redhat.com=dgilbert@srs-se1.protection.inumbo.net>)
 id 1pD9jA-0002Mt-2O
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 19:47:08 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91225a90-8c68-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 20:47:06 +0100 (CET)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-433-46R5JUs0NmaPYkxYbwUVvA-1; Wed, 04 Jan 2023 14:47:01 -0500
Received: by mail-wm1-f69.google.com with SMTP id
 bd6-20020a05600c1f0600b003d96f7f2396so19176950wmb.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jan 2023 11:47:01 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 p19-20020a1c5453000000b003d2157627a8sm50343697wmi.47.2023.01.04.11.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 11:46:59 -0800 (PST)
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
X-Inumbo-ID: 91225a90-8c68-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672861625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6QXOEovurLwLNIz+FnppUbIJfgyjk9M5XlA8eSDuCrU=;
	b=SfiSU2cr7jb/KCeBiGBtuRoIwdXqP6eVp26xyDHcyRFwjdbN2RjPCAKGqHFM5llRysVsQv
	xD1GQ8AIGdB/3Gxg9IHfgB0pqbC5op4XAmHSSmMqDRbDyf/4YZvdkvaFP4VYtJgS5aeS70
	TPxpeQL8HeinP1lqtTHQ/htJLHJCNbo=
X-MC-Unique: 46R5JUs0NmaPYkxYbwUVvA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6QXOEovurLwLNIz+FnppUbIJfgyjk9M5XlA8eSDuCrU=;
        b=HjDOM2rEKyh8Kq9oCdDUbSTrM52WmlMjj42wm+UsIX6Tl5v+RmUOeZDQkLwe0Sj8kj
         eyKw82Dnuvr9agRKD0t7tXnOp+YL9g1OwlHoXqhKRcVmNWs8mwA/6eXZEH/uPBSRRsrV
         yoUXbxvpz8qEoCSNbbPQ6sNRHyPTAOE49AG1Teg/mqw/gTIfg98Zm2gtTwTcFAgwrpZ4
         gVb+L0nFpp/EQMBwYLSq1gGkTGa/2LYajMleF+6fONFKDEVZ9RQQ2cNeCCNJKuMmKgWa
         /8pi+rYmxgB7ra3Duc2SzfixwFEid1afVICIFOymTz8RPg0YWOf2cKxua8DtJDqye1Uq
         hQpg==
X-Gm-Message-State: AFqh2kpHelz0Su3Hp4JLTxZueDiC8JQ7ubjDPoCJOJBJiuWMbLbtPjFd
	axdpb4brDto2icqUVDrpAJPbnVJs4eK1cUIgXXw1EI+AMosw3/o+cmsGgxBROwZmJ+41DHLp7bS
	CgQjqThJTb7pD4T5mW2QIuDEa3Lk=
X-Received: by 2002:a05:600c:4191:b0:3d1:fcca:ce24 with SMTP id p17-20020a05600c419100b003d1fccace24mr33592850wmh.32.1672861620110;
        Wed, 04 Jan 2023 11:47:00 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt2IDKCOAndi+PoVcK0qTiAwfAqGYMJPzp7glXtRb4nxvriYq01FutSchTWhSgLZ0xQbbf1Wg==
X-Received: by 2002:a05:600c:4191:b0:3d1:fcca:ce24 with SMTP id p17-20020a05600c419100b003d1fccace24mr33592836wmh.32.1672861619972;
        Wed, 04 Jan 2023 11:46:59 -0800 (PST)
Date: Wed, 4 Jan 2023 19:46:56 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
	xen-devel@lists.xenproject.org, Laurent Vivier <lvivier@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	virtio-fs@redhat.com, Michael Roth <michael.roth@amd.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org, Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>,
	Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 3/6] tools/virtiofsd: add G_GNUC_PRINTF for logging
 functions
Message-ID: <Y7XXsHEqgTG9Ani6@work-vm>
References: <20221219130205.687815-1-berrange@redhat.com>
 <20221219130205.687815-4-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221219130205.687815-4-berrange@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Yes, although I'm a little surprised this hasn't thrown up any warnings.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tools/virtiofsd/fuse_log.c       | 1 +
>  tools/virtiofsd/fuse_log.h       | 6 ++++--
>  tools/virtiofsd/passthrough_ll.c | 1 +
>  3 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/virtiofsd/fuse_log.c b/tools/virtiofsd/fuse_log.c
> index 745d88cd2a..2de3f48ee7 100644
> --- a/tools/virtiofsd/fuse_log.c
> +++ b/tools/virtiofsd/fuse_log.c
> @@ -12,6 +12,7 @@
>  #include "fuse_log.h"
>  
>  
> +G_GNUC_PRINTF(2, 0)
>  static void default_log_func(__attribute__((unused)) enum fuse_log_level level,
>                               const char *fmt, va_list ap)
>  {
> diff --git a/tools/virtiofsd/fuse_log.h b/tools/virtiofsd/fuse_log.h
> index 8d7091bd4d..e5c2967ab9 100644
> --- a/tools/virtiofsd/fuse_log.h
> +++ b/tools/virtiofsd/fuse_log.h
> @@ -45,7 +45,8 @@ enum fuse_log_level {
>   * @param ap format string arguments
>   */
>  typedef void (*fuse_log_func_t)(enum fuse_log_level level, const char *fmt,
> -                                va_list ap);
> +                                va_list ap)
> +    G_GNUC_PRINTF(2, 0);
>  
>  /**
>   * Install a custom log handler function.
> @@ -68,6 +69,7 @@ void fuse_set_log_func(fuse_log_func_t func);
>   * @param level severity level (FUSE_LOG_ERR, FUSE_LOG_DEBUG, etc)
>   * @param fmt sprintf-style format string including newline
>   */
> -void fuse_log(enum fuse_log_level level, const char *fmt, ...);
> +void fuse_log(enum fuse_log_level level, const char *fmt, ...)
> +    G_GNUC_PRINTF(2, 3);
>  
>  #endif /* FUSE_LOG_H_ */
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 20f0f41f99..40ea2ed27f 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -4182,6 +4182,7 @@ static void setup_nofile_rlimit(unsigned long rlimit_nofile)
>      }
>  }
>  
> +G_GNUC_PRINTF(2, 0)
>  static void log_func(enum fuse_log_level level, const char *fmt, va_list ap)
>  {
>      g_autofree char *localfmt = NULL;
> -- 
> 2.38.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


