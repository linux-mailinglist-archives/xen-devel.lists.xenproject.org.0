Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9556B7D75F4
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 22:51:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623293.971026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvkqQ-0008G5-ER; Wed, 25 Oct 2023 20:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623293.971026; Wed, 25 Oct 2023 20:51:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvkqQ-0008EO-Bq; Wed, 25 Oct 2023 20:51:14 +0000
Received: by outflank-mailman (input) for mailman id 623293;
 Wed, 25 Oct 2023 20:51:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/NE+=GH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qvkqP-0008EF-0X
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 20:51:13 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 375bfe85-7378-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 22:51:05 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 60404B82D0D;
 Wed, 25 Oct 2023 20:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E8CC433C7;
 Wed, 25 Oct 2023 20:51:03 +0000 (UTC)
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
X-Inumbo-ID: 375bfe85-7378-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698267064;
	bh=fZrOiVxVuiplCF21Wj9qcPFNR2lhY8kuMByUoh+j6Rc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bZOstzBecxXAirzraHW1s69J/eCtySHKQLkNZedBC94KcKX5sAqGVoxs6dBfNfVHW
	 L0QibU8GdKIGD6vkX137fVJtUfjvU/PdZpVg8KMnVEX/ZKMiGFGiD3hN4GX46Eb5zw
	 00ff0n5RlZWEOdR8qthxXUFMkD5VRqo3jEQHYT9eDLBp/8bcFzwmpdKL8qcSODAd1b
	 1Qliisx0/iOHz+jgZY66iPMwsXY9NoaNUiw9dfR1ehbbO3+WOJEGV8rzja5dLEZImq
	 M4T8HMNhC3JDCnmgMUS+rM0kf34CtFCVnGNDjcJxcJ3Ni6AkqdcAgsyFPngb/cbEJ0
	 7/HigE+tNeuxQ==
Date: Wed, 25 Oct 2023 13:51:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Alejandro Vallejo <alejandro.vallejo@cloud.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: Re: [PATCH 1/2] x86/ucode: Move vendor specifics back out of
 early_microcode_init()
In-Reply-To: <20231025180630.3230010-2-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2310251350140.271731@ubuntu-linux-20-04-desktop>
References: <20231025180630.3230010-1-andrew.cooper3@citrix.com> <20231025180630.3230010-2-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-424817730-1698267064=:271731"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-424817730-1698267064=:271731
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 25 Oct 2023, Andrew Cooper wrote:
> I know it was me who dropped microcode_init_{intel,amd}() in c/s
> dd5f07997f29 ("x86/ucode: Rationalise startup and family/model checks"), but
> times have moved on.  We've gained new conditional support, and a wish to
> compile-time specialise Xen to single platform.
> 
> (Re)introduce ucode_probe_{amd,intel}() and move the recent vendor specific
> additions back out.  Encode the conditional support state in the NULL-ness of
> hooks as it's already done on other paths.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> CC: Stefano Stabellini <stefano.stabellini@amd.com>
> CC: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> 
> CC Stefano/Xenia as I know you want to go down this line, but I don't recall
> patches in this area yet.

Yep, anything we can do to specialized the Xen build just to the
components needed (e.g. AMD drivers yes, Intel drivers no) it is an
improvement
--8323329-424817730-1698267064=:271731--

