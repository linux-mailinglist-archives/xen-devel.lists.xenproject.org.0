Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA5329D265
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 22:18:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13905.34752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXspF-0004qn-AX; Wed, 28 Oct 2020 21:17:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13905.34752; Wed, 28 Oct 2020 21:17:45 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXspF-0004qO-7F; Wed, 28 Oct 2020 21:17:45 +0000
Received: by outflank-mailman (input) for mailman id 13905;
 Wed, 28 Oct 2020 21:17:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ghuf=ED=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kXspE-0004qJ-9I
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 21:17:44 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 636638b4-d0ec-4fa4-9650-eb8a36ebcf21;
 Wed, 28 Oct 2020 21:17:43 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1C4002475E;
 Wed, 28 Oct 2020 21:17:42 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ghuf=ED=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kXspE-0004qJ-9I
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 21:17:44 +0000
X-Inumbo-ID: 636638b4-d0ec-4fa4-9650-eb8a36ebcf21
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 636638b4-d0ec-4fa4-9650-eb8a36ebcf21;
	Wed, 28 Oct 2020 21:17:43 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 1C4002475E;
	Wed, 28 Oct 2020 21:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603919862;
	bh=Ph8XcSSlJE5u0Y736qvOrXbypgMNew09pxLwuxA4xHw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=0y3+ShvRVvEGTexjrR0J3KR3tP6CIxCP+fR75LVZNzBedro+iprfmQvtYaVKThdgQ
	 pH8OqGZJiMQgwmiLwd7UxI+41Qkjlhi22JpEhxk/tY03BBTPFGIOuHpkqJ6Ur/Jmzp
	 Z3MmXYsi6RxL3kQK6u7g/vFq6+2ypmaW9N7Rh3Pg=
Date: Wed, 28 Oct 2020 14:17:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
    Masami Hiramatsu <masami.hiramatsu@linaro.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] meson.build: fix building of Xen support for aarch64
In-Reply-To: <20201028174406.23424-1-alex.bennee@linaro.org>
Message-ID: <alpine.DEB.2.21.2010281406080.12247@sstabellini-ThinkPad-T480s>
References: <20201028174406.23424-1-alex.bennee@linaro.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-857674193-1603919862=:12247"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-857674193-1603919862=:12247
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 28 Oct 2020, Alex Bennée wrote:
> Xen is supported on aarch64 although weirdly using the i386-softmmu
> model. Checking based on the host CPU meant we never enabled Xen
> support. It would be nice to enable CONFIG_XEN for aarch64-softmmu to
> make it not seem weird but that will require further build surgery.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Masami Hiramatsu <masami.hiramatsu@linaro.org>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> Cc: Paul Durrant <paul@xen.org>
> Fixes: 8a19980e3f ("configure: move accelerator logic to meson")
> ---
>  meson.build | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meson.build b/meson.build
> index 835424999d..f1fcbfed4c 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -81,6 +81,8 @@ if cpu in ['x86', 'x86_64']
>      'CONFIG_HVF': ['x86_64-softmmu'],
>      'CONFIG_WHPX': ['i386-softmmu', 'x86_64-softmmu'],
>    }
> +elif cpu in [ 'arm', 'aarch64' ]
> +  accelerator_targets += { 'CONFIG_XEN': ['i386-softmmu'] }
>  endif

This looks very reasonable -- the patch makes sense.


However I have two questions, mostly for my own understanding. I tried
to repro the aarch64 build problem but it works at my end, even without
this patch. I wonder why. I suspect it works thanks to these lines in
meson.build:

  if not get_option('xen').disabled() and 'CONFIG_XEN_BACKEND' in config_host
    accelerators += 'CONFIG_XEN'
    have_xen_pci_passthrough = not get_option('xen_pci_passthrough').disabled() and targetos == 'linux'
  else
    have_xen_pci_passthrough = false
  endif

But I am not entirely sure who is adding CONFIG_XEN_BACKEND to
config_host.


The other question is: does it make sense to print the value of
CONFIG_XEN as part of the summary? Something like:

diff --git a/meson.build b/meson.build
index 47e32e1fcb..c6e7832dc9 100644
--- a/meson.build
+++ b/meson.build
@@ -2070,6 +2070,7 @@ summary_info += {'KVM support':       config_all.has_key('CONFIG_KVM')}
 summary_info += {'HAX support':       config_all.has_key('CONFIG_HAX')}
 summary_info += {'HVF support':       config_all.has_key('CONFIG_HVF')}
 summary_info += {'WHPX support':      config_all.has_key('CONFIG_WHPX')}
+summary_info += {'XEN support':      config_all.has_key('CONFIG_XEN')}
 summary_info += {'TCG support':       config_all.has_key('CONFIG_TCG')}
 if config_all.has_key('CONFIG_TCG')
   summary_info += {'TCG debug enabled': config_host.has_key('CONFIG_DEBUG_TCG')}


But I realize there is already:

summary_info += {'xen support':       config_host.has_key('CONFIG_XEN_BACKEND')}

so it would be a bit of a duplicate
--8323329-857674193-1603919862=:12247--

