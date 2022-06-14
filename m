Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDAB54ADB9
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 11:52:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348763.574949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o13DA-0005Wt-Pv; Tue, 14 Jun 2022 09:51:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348763.574949; Tue, 14 Jun 2022 09:51:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o13DA-0005UX-N6; Tue, 14 Jun 2022 09:51:48 +0000
Received: by outflank-mailman (input) for mailman id 348763;
 Tue, 14 Jun 2022 09:51:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mIWA=WV=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1o13D9-0005UR-6U
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 09:51:47 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 996bea62-ebc7-11ec-bd2c-47488cf2e6aa;
 Tue, 14 Jun 2022 11:51:45 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-pSbqAgPoOEKx6fcCh6x3dg-1; Tue, 14 Jun 2022 05:51:43 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A45431C0513E;
 Tue, 14 Jun 2022 09:51:42 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.137])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9568D1415103;
 Tue, 14 Jun 2022 09:51:40 +0000 (UTC)
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
X-Inumbo-ID: 996bea62-ebc7-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655200304;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=kPsIb46gmdhHq2vvvdI5Q6gA7nrPKFn2iUBOa2L/v9k=;
	b=JdGwGX3wmWkEsK5DMsVayZ5GIMNHNcGkiuWvOOktQ2CpoEvj3SNeQ7agLv2AbxUJIP3Z82
	ZlSWeTAGnJe3slmnETXWVtzl5ipEqUBlGGF4Yf6Z1cZlgsFUgn/yYUNZolmVyjNMD3gnOg
	2X9RAsL5N0zoGgdFj0sQtoXLd8WPbWs=
X-MC-Unique: pSbqAgPoOEKx6fcCh6x3dg-1
Date: Tue, 14 Jun 2022 10:51:38 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
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
Message-ID: <YqhaKi8K2EATpAlN@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20220613113655.3693872-1-kraxel@redhat.com>
 <37f8f623-bb1c-899b-5801-79acd6185c6d@linaro.org>
 <20220614094038.g2g6lzeviypcnqrb@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220614094038.g2g6lzeviypcnqrb@sirius.home.kraxel.org>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7

On Tue, Jun 14, 2022 at 11:40:38AM +0200, Gerd Hoffmann wrote:
> On Mon, Jun 13, 2022 at 08:52:21AM -0700, Richard Henderson wrote:
> > On 6/13/22 04:36, Gerd Hoffmann wrote:
> > > The following changes since commit dcb40541ebca7ec98a14d461593b3cd7282b4fac:
> > > 
> > >    Merge tag 'mips-20220611' of https://github.com/philmd/qemu into staging (2022-06-11 21:13:27 -0700)
> > > 
> > > are available in the Git repository at:
> > > 
> > >    git://git.kraxel.org/qemu tags/kraxel-20220613-pull-request
> > > 
> > > for you to fetch changes up to 23b87f7a3a13e93e248eef8a4b7257548855a620:
> > > 
> > >    ui: move 'pc-bios/keymaps' to 'ui/keymaps' (2022-06-13 10:59:25 +0200)
> > > 
> > > ----------------------------------------------------------------
> > > usb: add CanoKey device, fixes for ehci + redir
> > > ui: fixes for gtk and cocoa, move keymaps (v2), rework refresh rate
> > > virtio-gpu: scanout flush fix
> > 
> > This doesn't even configure:
> > 
> > ../src/ui/keymaps/meson.build:55:4: ERROR: File ar does not exist.
> 
> Hmm, build worked here and CI passed too.
> 
> I think this is one of those cases where the build directory must be
> deleted because one subdirectory is replaced by a compatibility
> symlink.

Except 'configure' deals with that, as it explicitly rm -rf's the
symlink target:

symlink() {
  rm -rf "$2"
  mkdir -p "$(dirname "$2")"
  ln -s "$1" "$2"
}


so i'm pretty confused as to what's going wrong here still


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


