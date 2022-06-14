Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F8C54B035
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 14:15:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348855.575041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o15RH-0007hx-UD; Tue, 14 Jun 2022 12:14:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348855.575041; Tue, 14 Jun 2022 12:14:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o15RH-0007eq-Qa; Tue, 14 Jun 2022 12:14:31 +0000
Received: by outflank-mailman (input) for mailman id 348855;
 Tue, 14 Jun 2022 12:14:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hf0K=WV=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1o15RF-0007eM-RN
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 12:14:30 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 896031b8-ebdb-11ec-bd2c-47488cf2e6aa;
 Tue, 14 Jun 2022 14:14:28 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487--g9QEbfoMZ26_nSdNrXxLQ-1; Tue, 14 Jun 2022 08:14:26 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4282A3C025CE;
 Tue, 14 Jun 2022 12:14:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE0072026D64;
 Tue, 14 Jun 2022 12:14:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 37DAE1800084; Tue, 14 Jun 2022 14:14:23 +0200 (CEST)
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
X-Inumbo-ID: 896031b8-ebdb-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655208867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jTV1MdFQUjOD6SaouLkpusNhrO6aKybutsMy/w9e6iI=;
	b=FdAToRcC51j+sNtlzjkIZTuluoexWhd1sHwUtvsovLsaRV0AdA5bvfAsztQcoYnnwVsXlU
	APJeBnolannAWJ4JeMfrVBUwqzLT/n9FRrhjWdHlIk9AVcesXexNDV1zGojkywwCkLjOKn
	RlQfznwAh8HITgzOfnDj02B0ch09EfM=
X-MC-Unique: -g9QEbfoMZ26_nSdNrXxLQ-1
Date: Tue, 14 Jun 2022 14:14:23 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	xen-devel@lists.xenproject.org,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	"Hongren (Zenithal) Zheng" <i@zenithal.me>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Canokeys.org" <contact@canokeys.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PULL 00/16] Kraxel 20220613 patches
Message-ID: <20220614121423.2hykgv7dn2qfo2dz@sirius.home.kraxel.org>
References: <20220613113655.3693872-1-kraxel@redhat.com>
 <37f8f623-bb1c-899b-5801-79acd6185c6d@linaro.org>
 <20220614094038.g2g6lzeviypcnqrb@sirius.home.kraxel.org>
 <YqhaKi8K2EATpAlN@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqhaKi8K2EATpAlN@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4

> > Hmm, build worked here and CI passed too.
> > 
> > I think this is one of those cases where the build directory must be
> > deleted because one subdirectory is replaced by a compatibility
> > symlink.
> 
> Except 'configure' deals with that, as it explicitly rm -rf's the
> symlink target:
> 
> symlink() {
>   rm -rf "$2"
>   mkdir -p "$(dirname "$2")"
>   ln -s "$1" "$2"
> }
> 
> so i'm pretty confused as to what's going wrong here still

'git rebase -x ./make.sh master queue/kraxel' not working (where make.sh
is a script effectively doing 'make -C build/$name' for multiple build
trees with different configurations).

'git status' lists ui/keymaps/* as deleted.
'git reset --hard' fixes it.

take care,
  Gerd


