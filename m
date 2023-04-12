Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F906DF6D6
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 15:20:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520221.807565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmaNx-0003Lg-JI; Wed, 12 Apr 2023 13:19:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520221.807565; Wed, 12 Apr 2023 13:19:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmaNx-0003Iz-GD; Wed, 12 Apr 2023 13:19:41 +0000
Received: by outflank-mailman (input) for mailman id 520221;
 Wed, 12 Apr 2023 13:19:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NJdj=AD=suse.de=farosas@srs-se1.protection.inumbo.net>)
 id 1pmaNv-0003Is-H6
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 13:19:39 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acce0f1a-d934-11ed-b21e-6b7b168915f2;
 Wed, 12 Apr 2023 15:19:38 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 96821218FA;
 Wed, 12 Apr 2023 13:19:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1E86F13498;
 Wed, 12 Apr 2023 13:19:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PSm5NeivNmTLcgAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 12 Apr 2023 13:19:36 +0000
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
X-Inumbo-ID: acce0f1a-d934-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681305577; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZnQgldug7U+NIeAhYftaDVy/YRzrSi0DIbP1KUpKmbw=;
	b=AKnMWaq1qCMQA1L1wez2jgyW8rQSLoHi/KNVsAUC1GC9EQcJwLUh86WjwPMLxoYYTDS6eO
	IJwY7kMeRUiNsHVwPkFPYBv2TUm6/X5wRN8x3Qm52/2FjcLCh0QQ8WROAqBQsjcnZoYQ4S
	l6PV/6JRHVzJ5Pt+59KiF1bFhVSveUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681305577;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZnQgldug7U+NIeAhYftaDVy/YRzrSi0DIbP1KUpKmbw=;
	b=i4w3/kGmJytP7NS46yu7iHK4IZRrRljaV/DXUJFf4JyH0u4i4CyvXrD5aAAxRs1qxj8FU1
	QuSXRK+kKUIhN3Cw==
From: Fabiano Rosas <farosas@suse.de>
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, vikram.garhwal@amd.com,
 stefano.stabellini@amd.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [QEMU][PATCH v6 10/10] meson.build: enable xenpv machine build
 for ARM
In-Reply-To: <20230411224746.16152-11-vikram.garhwal@amd.com>
References: <20230411224746.16152-1-vikram.garhwal@amd.com>
 <20230411224746.16152-11-vikram.garhwal@amd.com>
Date: Wed, 12 Apr 2023 10:19:34 -0300
Message-ID: <87fs95ck61.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Vikram Garhwal <vikram.garhwal@amd.com> writes:

> Add CONFIG_XEN for aarch64 device to support build for ARM targets.
>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meson.build b/meson.build
> index 52c3995c9d..eb5bb305ae 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -135,7 +135,7 @@ endif
>  if cpu in ['x86', 'x86_64', 'arm', 'aarch64']
>    # i386 emulator provides xenpv machine type for multiple architectures
>    accelerator_targets +=3D {
> -    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
> +    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu',
> 'aarch64-softmmu'],

I'm not familiar with Xen, so pardon my ignorance, but would it (ever)
make sense to do a 1:1 map of host architecture and qemu target? So we
don't have to deal with having a build on x86 pulling aarch64-softmmu
and vice-versa.

Do we expect both x86_64-softmmu and aarch64-softmmu binaries to be used
in the same host?



