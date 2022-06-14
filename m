Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB5854B063
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 14:18:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348912.575194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o15V9-0006Zh-VX; Tue, 14 Jun 2022 12:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348912.575194; Tue, 14 Jun 2022 12:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o15V9-0006XQ-Rz; Tue, 14 Jun 2022 12:18:31 +0000
Received: by outflank-mailman (input) for mailman id 348912;
 Tue, 14 Jun 2022 12:18:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hf0K=WV=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1o15Tw-0008Ek-G8
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 12:17:16 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2e5e89e-ebdb-11ec-bd2c-47488cf2e6aa;
 Tue, 14 Jun 2022 14:16:58 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-211-09Nq8XZROquC41wzMebuLw-1; Tue, 14 Jun 2022 08:16:54 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 961E02999B20;
 Tue, 14 Jun 2022 12:16:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 614741415103;
 Tue, 14 Jun 2022 12:16:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 282B41800084; Tue, 14 Jun 2022 14:16:52 +0200 (CEST)
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
X-Inumbo-ID: e2e5e89e-ebdb-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655209017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nXD25YF84dW7uBlFN8SkZqBu0jvpmi2aaYUiV48m/S4=;
	b=Rk2hD5gvCICUCQZEBspg0O4SFwR6aSrjU9kVRqjjBUlZ3cvM1VbUC8yti1tNWQAVgwX8Un
	P8oP3kh4LJW/98O1Qp5xzUS9zQOMo+iPHmXeW96E9fxKf5lvqcTxrU2PsoTPEmjXDMRXwZ
	SELKFBnVtHPcmaK1ZquNstDIsqyG8hk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655209017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nXD25YF84dW7uBlFN8SkZqBu0jvpmi2aaYUiV48m/S4=;
	b=Rk2hD5gvCICUCQZEBspg0O4SFwR6aSrjU9kVRqjjBUlZ3cvM1VbUC8yti1tNWQAVgwX8Un
	P8oP3kh4LJW/98O1Qp5xzUS9zQOMo+iPHmXeW96E9fxKf5lvqcTxrU2PsoTPEmjXDMRXwZ
	SELKFBnVtHPcmaK1ZquNstDIsqyG8hk=
X-MC-Unique: 09Nq8XZROquC41wzMebuLw-1
Date: Tue, 14 Jun 2022 14:16:52 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
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
Message-ID: <20220614121652.6rzwet6cvhupamkv@sirius.home.kraxel.org>
References: <20220613113655.3693872-1-kraxel@redhat.com>
 <37f8f623-bb1c-899b-5801-79acd6185c6d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37f8f623-bb1c-899b-5801-79acd6185c6d@linaro.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7

On Mon, Jun 13, 2022 at 08:52:21AM -0700, Richard Henderson wrote:
> On 6/13/22 04:36, Gerd Hoffmann wrote:
> > The following changes since commit dcb40541ebca7ec98a14d461593b3cd7282b4fac:
> > 
> >    Merge tag 'mips-20220611' of https://github.com/philmd/qemu into staging (2022-06-11 21:13:27 -0700)
> > 
> > are available in the Git repository at:
> > 
> >    git://git.kraxel.org/qemu tags/kraxel-20220613-pull-request
> > 
> > for you to fetch changes up to 23b87f7a3a13e93e248eef8a4b7257548855a620:
> > 
> >    ui: move 'pc-bios/keymaps' to 'ui/keymaps' (2022-06-13 10:59:25 +0200)
> > 
> > ----------------------------------------------------------------
> > usb: add CanoKey device, fixes for ehci + redir
> > ui: fixes for gtk and cocoa, move keymaps (v2), rework refresh rate
> > virtio-gpu: scanout flush fix
> 
> This doesn't even configure:
> 
> ../src/ui/keymaps/meson.build:55:4: ERROR: File ar does not exist.

dropped keymaps patch for now, new version sent.

take care,
  Gerd


