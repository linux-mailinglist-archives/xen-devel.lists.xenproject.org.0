Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 742DF6C13ED
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 14:49:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511933.791394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peFsM-0000JZ-6z; Mon, 20 Mar 2023 13:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511933.791394; Mon, 20 Mar 2023 13:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peFsM-0000HM-47; Mon, 20 Mar 2023 13:48:38 +0000
Received: by outflank-mailman (input) for mailman id 511933;
 Mon, 20 Mar 2023 13:48:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MnWT=7M=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1peFsK-0000HE-Hz
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 13:48:36 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e74e334f-c725-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 14:48:34 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-CV0XY9JSOlCYuAhr_QvM2g-1; Mon, 20 Mar 2023 09:48:28 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DACD800B23;
 Mon, 20 Mar 2023 13:48:27 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 957E8C15BA0;
 Mon, 20 Mar 2023 13:48:21 +0000 (UTC)
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
X-Inumbo-ID: e74e334f-c725-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679320112;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nB8jDRvF4InxzdYsKwDk5IU8RqNst0djb4nl+V9qIeY=;
	b=bIeutRX8Z3wfQo0zeakwGDXdKrRCxs+rJ9JMbvICrDeUf8Zd1uYmfF84IgEJAvPojIKw7+
	U45Kzx7KIjNy0YZ+nYjew5zr5z4cH7P4gbX6giL56pJak+KqdsZ6hoZ9mM/YwEsRGcaSv4
	/XohY1KQCC8JOwhnrzwlFx/eHaRqRvM=
X-MC-Unique: CV0XY9JSOlCYuAhr_QvM2g-1
Date: Mon, 20 Mar 2023 13:48:18 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
	Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
	Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefan Weil <sw@weilnetz.de>, Riku Voipio <riku.voipio@iki.fi>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org
Subject: Re: [PATCH-for-8.1 4/5] bulk: Do not declare function prototypes
 using extern keyword
Message-ID: <ZBhkIjelEtR7lckj@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230320134219.22489-1-philmd@linaro.org>
 <20230320134219.22489-5-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230320134219.22489-5-philmd@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8

On Mon, Mar 20, 2023 at 02:42:18PM +0100, Philippe Mathieu-Daudé wrote:
> By default, C function prototypes declared in headers are visible,
> so there is no need to declare them as 'extern' functions.
> Remove this redundancy in a single bulk commit; do not modify:
> 
>   - meson.build (used to check function availability at runtime)
>   - pc-bios
>   - libdecnumber
>   - *.c
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  block/dmg.h                    |  8 +++----
>  bsd-user/bsd-file.h            |  6 ++---
>  crypto/hmacpriv.h              | 13 +++++------
>  hw/xen/xen_pt.h                |  8 +++----
>  include/crypto/secret_common.h | 14 +++++-------
>  include/exec/page-vary.h       |  4 ++--
>  include/hw/misc/aspeed_scu.h   |  2 +-
>  include/hw/nvram/npcm7xx_otp.h |  4 ++--
>  include/hw/qdev-core.h         |  4 ++--
>  include/qemu/crc-ccitt.h       |  4 ++--
>  include/qemu/osdep.h           |  2 +-
>  include/qemu/rcu.h             | 14 ++++++------
>  include/qemu/sys_membarrier.h  |  4 ++--
>  include/qemu/uri.h             |  6 ++---
>  include/sysemu/accel-blocker.h | 14 ++++++------
>  include/sysemu/os-win32.h      |  4 ++--
>  include/user/safe-syscall.h    |  4 ++--
>  target/i386/sev.h              |  6 ++---
>  target/mips/cpu.h              |  4 ++--
>  tcg/tcg-internal.h             |  4 ++--
>  tests/tcg/minilib/minilib.h    |  2 +-
>  include/exec/memory_ldst.h.inc | 42 +++++++++++++++++-----------------
>  roms/seabios                   |  2 +-

Accidental submodule commit.,

>  23 files changed, 84 insertions(+), 91 deletions(-)
> 
> diff --git a/block/dmg.h b/block/dmg.h
> index e488601b62..ed209b5dec 100644
> --- a/block/dmg.h
> +++ b/block/dmg.h
> @@ -51,10 +51,10 @@ typedef struct BDRVDMGState {
>      z_stream zstream;
>  } BDRVDMGState;
>  
> -extern int (*dmg_uncompress_bz2)(char *next_in, unsigned int avail_in,
> -                                 char *next_out, unsigned int avail_out);
> +int (*dmg_uncompress_bz2)(char *next_in, unsigned int avail_in,
> +                          char *next_out, unsigned int avail_out);
>  
> -extern int (*dmg_uncompress_lzfse)(char *next_in, unsigned int avail_in,
> -                                   char *next_out, unsigned int avail_out);
> +int (*dmg_uncompress_lzfse)(char *next_in, unsigned int avail_in,
> +                            char *next_out, unsigned int avail_out);

These are variable declarations, so with this change you'll get multiple
copies of the variable if this header is included from multiple source
files. IOW, the 'extern' usage is correct.

> diff --git a/roms/seabios b/roms/seabios
> index ea1b7a0733..3208b098f5 160000
> --- a/roms/seabios
> +++ b/roms/seabios
> @@ -1 +1 @@
> -Subproject commit ea1b7a0733906b8425d948ae94fba63c32b1d425
> +Subproject commit 3208b098f51a9ef96d0dfa71d5ec3a3eaec88f0a

Nope !

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


