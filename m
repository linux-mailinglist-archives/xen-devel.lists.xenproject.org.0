Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3852C5AC3
	for <lists+xen-devel@lfdr.de>; Thu, 26 Nov 2020 18:39:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38976.71741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiLE1-0000ID-Ix; Thu, 26 Nov 2020 17:38:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38976.71741; Thu, 26 Nov 2020 17:38:33 +0000
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
	id 1kiLE1-0000Ho-Fd; Thu, 26 Nov 2020 17:38:33 +0000
Received: by outflank-mailman (input) for mailman id 38976;
 Thu, 26 Nov 2020 17:38:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OMov=FA=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1kiLE0-0000Hj-CP
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 17:38:32 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a3e81e6-d144-4013-8191-44535450bd06;
 Thu, 26 Nov 2020 17:38:31 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=OMov=FA=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
	id 1kiLE0-0000Hj-CP
	for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 17:38:32 +0000
X-Inumbo-ID: 2a3e81e6-d144-4013-8191-44535450bd06
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2a3e81e6-d144-4013-8191-44535450bd06;
	Thu, 26 Nov 2020 17:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606412310;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=bXQzNtHqJ2Yw8039qwF6PExFC7hXWX7QRQoV51ZIeHI=;
  b=JB1qwYe3nnUAGHgc+A4yDDQW8ctiiQzPIFFjUMs8is6rBAMOH4Ch6HnH
   fn38gCJR3cd3/CWAUb/VSH4/9670Dtk/5Lsfx0vKMqw6lzQl6vNs2epDO
   T//hjty5dUZVKnxJV+yWUKRVuRn3J/aNn9tAk4lO33UCv01F+iQmMetKH
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: KFVGLLdvf8DEeihaDbUXddHR0GUT3gEY/wdoGM652HXR/2rCOBM0eF25OhgsWDNyfp9MYeek/X
 0WqeC80WMCfN5zCQyhxAe/ClDmUBJc/JGrvvkpaaf8+FQl/NGDNBjFJ7foXBTOmAsMLwcty1Gm
 HyVsqyBsVA4G3HPVyHI1XZR324jHdTkA8nGTMYXZrCt7x0UIlPuH696eY5fnGbQaPvhMOZ9Aoo
 M8iqvI23iZcXGqxutTGvgaJUYGdwZdT71+kxty6g9x2cBmotdnH2k6/JUn+s7MnnpHKhmbihk2
 YHU=
X-SBRS: None
X-MesageID: 33168172
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,372,1599537600"; 
   d="scan'208";a="33168172"
Date: Thu, 26 Nov 2020 17:38:24 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
CC: <qemu-devel@nongnu.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, "Igor
 Mammedov" <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	"Paolo Bonzini" <pbonzini@redhat.com>, Marcel Apfelbaum
	<marcel.apfelbaum@gmail.com>, Wainer dos Santos Moschetta
	<wainersm@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>, Thomas Huth
	<thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, Alex
 =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Aleksandar Rikalo
	<aleksandar.rikalo@syrmia.com>, Richard Henderson <rth@twiddle.net>, Fam
 Zheng <fam@euphon.net>, "Daniel P . Berrange" <berrange@redhat.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH-for-6.0 v4 15/17] gitlab-ci: Add test for Xen (on CentOS
 7)
Message-ID: <20201126173824.GB2098@perard.uk.xensource.com>
References: <20201108204535.2319870-1-philmd@redhat.com>
 <20201108204535.2319870-16-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201108204535.2319870-16-philmd@redhat.com>

On Sun, Nov 08, 2020 at 09:45:33PM +0100, Philippe Mathieu-Daudé wrote:
> Xen packages are available in CentOS 7, but have been
> removed from CentOS 8. Use the CentOS 7 container.

Technically Xen has never been in CentOS 8, I'm working on it, slowly.

> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> Cc: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org
> ---
>  .gitlab-ci.yml | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 2f0da7b3dc1..8e15266c277 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -557,6 +557,27 @@ check-crypto-only-gnutls:
>      IMAGE: centos7
>      MAKE_CHECK_ARGS: check
>  
> +build-xen-centos:
> +  <<: *native_build_job_definition
> +  variables:
> +    IMAGE: centos7
> +    TARGETS: i386-softmmu x86_64-softmmu
> +    CONFIGURE_ARGS: --enable-xen
> +    MAKE_CHECK_ARGS: check-build
> +  artifacts:
> +    paths:
> +      - build
> +
> +check-xen-centos:
> +  <<: *native_test_job_definition
> +  needs:
> +    - job: build-xen-centos
> +      artifacts: true
> +  variables:
> +    IMAGE: centos7
> +    MAKE_CHECK_ARGS: check

Is `make check` going to do something useful with the Xen support? Or is
it going to need more work in order to test the Xen support of QEMU?
(Like starting an actual Xen guest.)

Cheers,

-- 
Anthony PERARD

